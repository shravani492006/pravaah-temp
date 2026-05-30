import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
import django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'pravaah.settings')
django.setup()
from django.db import connection

codes = ['T001','T002']
with connection.cursor() as c:
    print('Disabling foreign key checks')
    c.execute('SET FOREIGN_KEY_CHECKS=0')
    q = "DELETE FROM trainers_trainer WHERE trainer_code IN ('%s')" % "','".join(codes)
    rows = c.execute(q)
    print('Rows deleted from trainers_trainer:', rows)
    c.execute('SET FOREIGN_KEY_CHECKS=1')
print('Done')
