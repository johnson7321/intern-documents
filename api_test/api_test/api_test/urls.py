from django.contrib import admin
from django.urls import path, include
from django.http import HttpResponse

def home(request):
    return HttpResponse("Welcome to the API Home Page!")

urlpatterns = [
    path('', home),  # 新增這行
    path('admin/', admin.site.urls),
    path('api/', include('schoolapp.urls')),
    
]
