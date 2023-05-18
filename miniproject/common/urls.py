from django.urls import path, include
from . import views

app_name = 'common'

urlpatterns = [
    path('login/', views.login, name = 'login'),
    path('signup/', views.signup, name = 'signup'),
    path('mypage/<int:user_id>/',views.mypage, name='mypage'),
    path('signup/success', views.signup_success, name='signup_success')
]
