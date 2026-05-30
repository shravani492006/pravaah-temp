import os,sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__),'..')))
import django
os.environ.setdefault('DJANGO_SETTINGS_MODULE','pravaah.settings')
django.setup()
from django.db import connection
with connection.cursor() as c:
    try:
        c.execute('ALTER TABLE attendance DROP FOREIGN KEY attendance_enrollment_id_be7ff56a_fk_enrollments_enrollment_id')
        print('Dropped enrollment FK')
    except Exception as e:
        print('Drop enrollment FK failed:', e)
    try:
        c.execute('ALTER TABLE attendance DROP FOREIGN KEY attendance_session_id_bdf747fa_fk_sessions_session_id')
        print('Dropped session FK')
    except Exception as e:
        print('Drop session FK failed:', e)
    try:
        c.execute('ALTER TABLE attendance MODIFY COLUMN enrollment_id BIGINT NULL')
        print('Modified enrollment_id to NULL')
    except Exception as e:
        print('Modify enrollment_id failed:', e)
    try:
        c.execute('ALTER TABLE attendance MODIFY COLUMN session_id BIGINT NULL')
        print('Modified session_id to NULL')
    except Exception as e:
        print('Modify session_id failed:', e)
    # re-add foreign keys
    try:
        c.execute('ALTER TABLE attendance ADD CONSTRAINT attendance_enrollment_id_be7ff56a_fk_enrollments_enrollment_id FOREIGN KEY (enrollment_id) REFERENCES enrollments (enrollment_id)')
        print('Re-added enrollment FK')
    except Exception as e:
        print('Re-add enrollment FK failed:', e)
    try:
        c.execute('ALTER TABLE attendance ADD CONSTRAINT attendance_session_id_bdf747fa_fk_sessions_session_id FOREIGN KEY (session_id) REFERENCES sessions (session_id)')
        print('Re-added session FK')
    except Exception as e:
        print('Re-add session FK failed:', e)
    print('Done')
