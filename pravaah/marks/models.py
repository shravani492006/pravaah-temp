from django.db import models


class Mark(models.Model):
    student_name = models.CharField(max_length=200)
    roll_number = models.CharField(max_length=50)
    assessment = models.ForeignKey('assessment.Assessment', on_delete=models.CASCADE)
    internal_marks = models.FloatField(default=0.0)
    practical_marks = models.FloatField(default=0.0)
    final_score = models.FloatField(default=0.0)
    grade = models.CharField(max_length=2, blank=True)

    class Meta:
        ordering = ['-final_score']
