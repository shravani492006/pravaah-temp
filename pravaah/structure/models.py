from django.db import models


class CourseModule(models.Model):
    module_name = models.CharField(max_length=200)
    week_number = models.PositiveIntegerField()
    status = models.CharField(max_length=20, choices=[('not_started','Not Started'),('ongoing','Ongoing'),('completed','Completed')], default='not_started')
    completion_percentage = models.PositiveIntegerField(default=0)

    class Meta:
        ordering = ['week_number']


class Topic(models.Model):
    module = models.ForeignKey(CourseModule, on_delete=models.CASCADE, related_name='topics')
    topic_name = models.CharField(max_length=200)
    status = models.CharField(max_length=20, choices=[('not_started','Not Started'),('ongoing','Ongoing'),('completed','Completed')], default='not_started')

    class Meta:
        ordering = ['id']
