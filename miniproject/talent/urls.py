from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static

app_name = 'talent'

urlpatterns = [
    path('', views.index, name='index'),
    path('productcreate/', views.product_create, name='ProductCreate'),
<<<<<<< HEAD
    path('product/<int:product_id>/', views.detail, name='detail'),
    path('cart/', views.cart, name='cart'),
    path('category/<int:category_id>/', views.category, name='category'),
=======
    path('<int:product_id>/', views.detail, name='detail'),
    path('cart/', views.cart, name='cart'),
>>>>>>> bae6ed45b0d4092bfbec0e25a5ae651f401e0342
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
