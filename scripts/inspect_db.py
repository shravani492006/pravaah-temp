import json
import django
from django.db import connection

# Initialize Django
import sys
import os
sys.path.insert(0, r'D:\pravaah')
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'pravaah.settings')
django.setup()

tables = ['batch_batch', 'batch_batchassignment', 'assessment_assessment', 'batch_batchsession']
out = {}
cur = connection.cursor()
for t in tables:
    cur.execute("SELECT COLUMN_NAME, COLUMN_TYPE, IS_NULLABLE, COLUMN_DEFAULT FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME=%s", (t,))
    out[t] = cur.fetchall()
print(json.dumps(out, default=str, indent=2))
