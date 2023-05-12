"""
URL configuration for miniproject project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
'''
from django.contrib import admin
<<<<<<< HEAD
from django.urls import path, inlcude
=======
from django.urls import path, include
from talent import views

>>>>>>> happinhwa

urlpatterns = [
    path('admin', admin.site.urls),
    path('talent', views.index), 
    path('login', views.login)
]
'''
from django.urls import path, include
from talent import views

app_name = 'talent'

urlpatterns = [
    path('talent', views.index),
    path('login', views.login),
    path('signup', views.signup)
]
