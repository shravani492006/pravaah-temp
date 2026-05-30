import os
import sys
# Ensure repo root is on sys.path so "pravaah" package imports correctly
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

import django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'pravaah.settings')
django.setup()
from django.db import connection

with connection.cursor() as c:
    print('Disabling foreign key checks')
    c.execute('SET FOREIGN_KEY_CHECKS=0')
    rows = c.execute("DELETE FROM auth_user WHERE username IN ('t1','t2','prefuser')")
    print('Rows deleted:', rows)
    c.execute('SET FOREIGN_KEY_CHECKS=1')
print('Done')
