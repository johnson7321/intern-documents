from django.urls import path
from .views import StudentListView, student_table_view

urlpatterns = [
    path('students/', StudentListView.as_view()),
    path('show-students/', student_table_view),
]
