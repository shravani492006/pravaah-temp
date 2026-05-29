from django.contrib.auth.models import Group, Permission
from django.contrib.contenttypes.models import ContentType
from django.contrib.auth import get_user_model

G, created = Group.objects.get_or_create(name='Trainer')
print('Trainer group exists, created=' + str(created))
permlist = []
targets = [
    ('batch','batchassignment',['add_batchassignment','change_batchassignment','view_batchassignment']),
    ('assessment','assessment',['add_assessment','change_assessment','view_assessment']),
    ('availability','availability',['add_availability','change_availability','view_availability']),
]
for app_label, model, codenames in targets:
    try:
        ct = ContentType.objects.get(app_label=app_label, model=model)
    except ContentType.DoesNotExist:
        print(f'No content type for {app_label}.{model}');
        continue
    for code in codenames:
        try:
            p = Permission.objects.get(codename=code, content_type=ct)
            permlist.append(p)
            print(f'Found perm {code} for {app_label}.{model}')
        except Permission.DoesNotExist:
            print(f'Missing perm {code} for {app_label}.{model}')

if permlist:
    G.permissions.add(*permlist)
    print('Added', len(permlist), 'permissions to Trainer group')
else:
    print('No permissions were added')

U = get_user_model()
for username in ['rahul','traineradmin']:
    try:
        u = U.objects.get(username=username)
        u.groups.add(G)
        print('Added user to group:', username)
    except U.DoesNotExist:
        print('User not found:', username)

print('Trainer group perms now:')
for p in G.permissions.order_by('content_type__app_label','codename'):
    print('-', f'{p.content_type.app_label}.{p.codename}')
