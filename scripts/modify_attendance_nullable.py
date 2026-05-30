import os,sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__),'..')))
import django
os.environ.setdefault('DJANGO_SETTINGS_MODULE','pravaah.settings')
django.setup()
from django.db import connection
with connection.cursor() as c:
    try:
        c.execute('ALTER TABLE attendance MODIFY COLUMN enrollment_id INT NULL')
        print('Modified enrollment_id to NULL')
    except Exception as e:
        print('Failed enrollment_id modify:', e)
    try:
        c.execute('ALTER TABLE attendance MODIFY COLUMN session_id INT NULL')
        print('Modified session_id to NULL')
    except Exception as e:
        print('Failed session_id modify:', e)
    try:
        c.execute('ALTER TABLE attendance MODIFY COLUMN participant_id INT NULL')
        print('Modified participant_id to NULL')
    except Exception as e:
        print('Failed participant_id modify:', e)
    print('Done')
