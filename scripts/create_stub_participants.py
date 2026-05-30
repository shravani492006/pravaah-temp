import os,sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__),'..')))
import django
os.environ.setdefault('DJANGO_SETTINGS_MODULE','pravaah.settings')
django.setup()
from django.db import connection
stubs = [ (999001,'stub999001','Stub','One','111','stub1@example.com','R001'), (999002,'stub999002','Stub','Two','222','stub2@example.com','R002') ]
with connection.cursor() as c:
    desc = [d.name for d in connection.introspection.get_table_description(c,'participants')]
    for pid, adm, fn, ln, mobile, email, admission_no in stubs:
        # admission_no column exists and is unique
        c.execute('SELECT participant_id FROM participants WHERE admission_no=%s', [adm])
        if c.fetchone():
            print('stub exists', adm)
            continue
        # Build insert with required fields: participant_id, admission_no, first_name, last_name, mobile, email, password_hash
        try:
            c.execute("INSERT INTO participants (participant_id, admission_no, first_name, last_name, mobile, email, password_hash) VALUES (%s,%s,%s,%s,%s,%s,%s)", (pid, adm, fn, ln, mobile, email, 'stubhash'))
            print('inserted', pid)
        except Exception as e:
            print('failed insert', pid, e)
print('done')
