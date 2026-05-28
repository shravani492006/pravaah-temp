from django.db import models


class Availability(models.Model):
    STATUS_CHOICES = [
        ('available', 'Available'),
        ('unavailable', 'Unavailable'),
        ('assigned', 'Assigned'),
        ('pending', 'Pending'),
    ]
    trainer = models.ForeignKey('trainers.Trainer', on_delete=models.CASCADE, related_name='availabilities')
    date = models.DateField()
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='available')
    note = models.TextField(blank=True, null=True)

    class Meta:
        unique_together = ('trainer', 'date')
        ordering = ['-date']


class LeaveRequest(models.Model):
    STATUS_CHOICES = [
        ('pending', 'Pending'),
        ('approved', 'Approved'),
        ('rejected', 'Rejected'),
    ]
    trainer = models.ForeignKey('trainers.Trainer', on_delete=models.CASCADE)
    leave_date = models.DateField()
    reason = models.TextField()
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='pending')
    applied_at = models.DateTimeField(auto_now_add=True)
