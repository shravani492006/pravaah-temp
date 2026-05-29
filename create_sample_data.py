from datetime import date, timedelta
from pravaah.trainers.models import Trainer
from pravaah.batch.models import BatchAssignment
from pravaah.assessment.models import Assessment

trainer = Trainer.objects.filter(trainer_id=1).first()
print('Trainer found:', trainer)
if trainer:
    b = BatchAssignment.objects.create(
        trainer=trainer,
        batch_name='Sample Batch',
        course_name='Python Basics',
        start_date=date.today(),
        end_date=date.today() + timedelta(days=5),
        student_count=10,
        status='accepted'
    )
    print('Created batch', b.pk)
    a = Assessment.objects.create(
        batch=b,
        assessment_name='Python Basics Quiz',
        assessment_type='Quiz',
        due_date=date.today() + timedelta(days=3),
        total_marks=50,
        description='Imported sample assessment'
    )
    print('Created assessment', a.pk)
else:
    print('No trainer with id 1')
