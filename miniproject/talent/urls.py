from django.urls import path

from . import views

app_name = 'talent'

urlpatterns = [
    path('', views.index, name='index'),
]