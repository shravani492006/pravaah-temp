import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
import django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'pravaah.settings')
django.setup()
from django.db import connection

needed = {
    'session_date': "DATE",
    'batch_id': "INT NULL",
    'marked_by': "INT NULL",
}

with connection.cursor() as c:
    cols = [d.name for d in connection.introspection.get_table_description(c, 'attendance')]
    for name, dtype in needed.items():
        if name not in cols:
            try:
                print(f"Adding column {name} {dtype} to attendance")
                c.execute(f"ALTER TABLE attendance ADD COLUMN {name} {dtype}")
                print("Added")
            except Exception as e:
                print("Failed to add", name, e)
    print('Done')
