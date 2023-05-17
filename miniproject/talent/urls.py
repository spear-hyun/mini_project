from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static

app_name = 'talent'

urlpatterns = [
    path('', views.index, name='index'), 
    path('productcreate/', views.product_create, name='ProductCreate'),
    path('<int:product_id>/', views.detail, name='detail'),
    path('cart/', views.cart, name='cart'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
