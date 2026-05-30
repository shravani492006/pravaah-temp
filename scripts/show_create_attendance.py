import os,sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__),'..')))
import django
os.environ.setdefault('DJANGO_SETTINGS_MODULE','pravaah.settings')
django.setup()
from django.db import connection
with connection.cursor() as c:
    c.execute('SHOW CREATE TABLE attendance')
    row = c.fetchone()
    if row:
        print(row[1])
    else:
        print('No row')
