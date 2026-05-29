from django.contrib.auth import get_user_model
from pravaah.trainers.models import Trainer

User = get_user_model()

username = 'trainer1'
password = 'Trainer@123'

u, created = User.objects.get_or_create(username=username, defaults={'email':'trainer1@example.com'})
if created:
    u.set_password(password)
    u.is_active = True
    u.save()

try:
    t, tcreated = Trainer.objects.get_or_create(trainer_code='T001', defaults={'user': u, 'first_name': 'Test', 'last_name': 'Trainer'})
except Exception:
    t = Trainer.objects.filter(trainer_code='T001').first()
    tcreated = False
    if t and not t.user:
        t.user = u
        t.save()

print('USER_CREATED=' + str(created))
print('TRAINER_CREATED=' + str(tcreated))
print('username=' + u.username)
print('password=' + password)
