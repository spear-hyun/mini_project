from django.urls import path
from . import views

app_name = 'common'

urlpatterns = [
    path('login/', views.login, name = 'login'),
    path('signup/', views.signup, name = 'signup'),
    path('mypage/',views.mypage, name='mypage'),
]