from django.urls import path, include
from . import views
#from .views import MyLoginView

app_name = 'common'

urlpatterns = [
    path('login/', views.login, name = 'login'),
    path('signup/', views.signup, name = 'signup'),
    path('mypage/<int:user_id>/',views.mypage, name='mypage'),
    path('orderhistory/<int:user_id>/',views.orderhistory, name='orderhistory'),
    path('createhistory/<int:user_id>/',views.createhistory, name='createhistory'),
    path('signup/success', views.signup_success, name='signup_success'),
]
