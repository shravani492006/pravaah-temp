from django.db import models


class Feedback(models.Model):
    student_name = models.CharField(max_length=200, blank=True)
    session = models.ForeignKey('sessionplans.SessionPlan', on_delete=models.CASCADE)
    rating = models.PositiveSmallIntegerField(default=0)
    comment = models.TextField(blank=True)
    submitted_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-submitted_at']
