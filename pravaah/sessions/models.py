from django.db import models


class SessionPlan(models.Model):
    STATUS_CHOICES = [
        ('upcoming', 'Upcoming'),
        ('ongoing', 'Ongoing'),
        ('completed', 'Completed'),
    ]
    trainer = models.ForeignKey('trainers.Trainer', on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    topic = models.CharField(max_length=200)
    session_date = models.DateField()
    duration_minutes = models.PositiveIntegerField()
    objectives = models.TextField(blank=True)
    teaching_method = models.CharField(max_length=100, blank=True)
    materials = models.TextField(blank=True)
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='upcoming')

    class Meta:
        ordering = ['-session_date']
