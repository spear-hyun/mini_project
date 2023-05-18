from django.urls import path, include
from . import views
#from .views import MyLoginView

app_name = 'common'

urlpatterns = [
    path('login/', views.login, name = 'login'),
    path('signup/', views.signup, name = 'signup'),
    path('mypage/<int:user_id>/',views.mypage, name='mypage'),
<<<<<<< HEAD
]
=======
]
>>>>>>> bae6ed45b0d4092bfbec0e25a5ae651f401e0342
