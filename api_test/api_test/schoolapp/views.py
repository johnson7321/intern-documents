from rest_framework import generics
from .models import Student
from .serializers import StudentSerializer

class StudentListView(generics.ListAPIView):
    queryset = Student.objects.all()
    serializer_class = StudentSerializer

from django.shortcuts import render

def student_table_view(request):
    return render(request, 'student_table.html')