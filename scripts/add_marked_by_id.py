import os,sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__),'..')))
import django
os.environ.setdefault('DJANGO_SETTINGS_MODULE','pravaah.settings')
django.setup()
from django.db import connection
with connection.cursor() as c:
    cols = [d.name for d in connection.introspection.get_table_description(c,'attendance')]
    if 'marked_by_id' not in cols:
        try:
            c.execute('ALTER TABLE attendance ADD COLUMN marked_by_id INT NULL')
            print('added marked_by_id')
        except Exception as e:
            print('failed', e)
    else:
        print('marked_by_id exists')
