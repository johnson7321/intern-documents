from django.db import models

class Class(models.Model):
    class_id = models.IntegerField(primary_key=True)
    class_name = models.CharField(max_length=100, blank=True, null=True)
    instructor = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'class'

class Enroll(models.Model):
    student = models.ForeignKey('Student', models.DO_NOTHING)
    class_field = models.ForeignKey(Class, models.DO_NOTHING, db_column='class_id')
    enrollment_date = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'enroll'

class Student(models.Model):
    student_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50, blank=True, null=True)
    age = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'student'