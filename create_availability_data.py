from datetime import datetime, date
from pravaah.availability.models import Availability, LeaveRequest, AvailableAvailability
from pravaah.trainers.models import Trainer

def dt(s):
    try:
        return datetime.fromisoformat(s)
    except Exception:
        return None

rows = [
    (date(2026,5,18),'unavailable','sick leave',1,'2026-05-29 02:41:07.706346','2026-05-29 02:41:07.740993'),
    (date(2026,5,29),'available','Dummy availability',2,'2026-05-29 02:41:07.706346','2026-05-29 02:41:07.740993'),
    (date(2026,5,30),'available','Dummy availability',2,'2026-05-29 02:41:07.706346','2026-05-29 02:41:07.740993'),
    (date(2026,5,31),'available','Dummy availability',2,'2026-05-29 02:41:07.706346','2026-05-29 02:41:07.740993'),
    (date(2026,6,1),'available','Dummy availability',2,'2026-05-29 02:41:07.706346','2026-05-29 02:41:07.740993'),
    (date(2026,6,2),'available','Dummy availability',2,'2026-05-29 02:41:07.706346','2026-05-29 02:41:07.740993'),
]
for d,status,reason,trainer_id,created,updated in rows:
    trainer = Trainer.objects.filter(trainer_id=trainer_id).first()
    if not trainer:
        print('Trainer not found for id',trainer_id,'skipping')
        continue
    a,created_flag = Availability.objects.get_or_create(date=d, trainer=trainer, defaults={'status':status,'reason':reason,'created_at':dt(created),'updated_at':dt(updated)})
    print('Created/Found availability',a.pk)

leaves = [
    (date(2026,6,8),'Dummy leave request for testing','pending','2026-05-29 01:42:13.283825',2,'2026-05-29 02:41:07.772563'),
    (date(2026,6,8),'Dummy leave request for testing','pending','2026-05-29 01:43:59.973907',2,'2026-05-29 02:41:07.772563'),
]
for d,reason,status,requested,trainer_id,processed in leaves:
    trainer = Trainer.objects.filter(trainer_id=trainer_id).first()
    if not trainer:
        print('Trainer not found for leave',trainer_id)
        continue
    lr,cf = LeaveRequest.objects.get_or_create(date=d, trainer=trainer, defaults={'reason':reason,'status':status,'requested_at':dt(requested),'processed_at':dt(processed)})
    print('Created/Found leave', lr.pk)

# available_availability
aa_rows = [ (date(2026,6,2),1) ]
for d,trainer_id in aa_rows:
    trainer = Trainer.objects.filter(trainer_id=trainer_id).first()
    if not trainer:
        print('Trainer not found for available',trainer_id)
        continue
    aa,cf = AvailableAvailability.objects.get_or_create(date=d, trainer=trainer)
    print('Created/Found available entry', aa.pk)
