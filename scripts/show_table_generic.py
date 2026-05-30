import os,sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__),'..')))
import django
os.environ.setdefault('DJANGO_SETTINGS_MODULE','pravaah.settings')
django.setup()
from django.db import connection
import sys
if len(sys.argv)<2:
    print('usage: show_table_generic.py <table>')
    sys.exit(1)
table = sys.argv[1]
with connection.cursor() as c:
    c.execute(f"SHOW CREATE TABLE {table}")
    row = c.fetchone()
    if row:
        print(row[1])
    else:
        print('No row')
