from django.urls import path
from . import views

app_name = 'common'

urlpatterns = [
    path('login/', views.login.as_view(), name = 'login'),
    path('signup/', views.signup, name = 'signup'),
    path('mypage/',views.mypage, name='mypage'),
    path('logout/', views.Userlogout.as_view(), name='logout')
]