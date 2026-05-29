import os, sys, json
sys.path.insert(0, os.path.dirname(os.path.dirname(__file__)))
os.environ['DJANGO_SETTINGS_MODULE'] = 'pravaah.settings'
import django
django.setup()
from django.db.migrations.recorder import MigrationRecorder
apps = ['trainers','auth','accounts','admin','contenttypes','sessions']
qs = MigrationRecorder.Migration.objects.filter(app__in=apps).order_by('app','name').values('app','name','applied')
print(json.dumps(list(qs), default=str))
