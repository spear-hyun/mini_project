from django.urls import path
from . import views
<<<<<<< HEAD
=======
from django.conf import settings
from django.conf.urls.static import static
>>>>>>> 4c64a3d516289f48143383d745fbf98d6d352726

app_name = 'talent'

urlpatterns = [
<<<<<<< HEAD
    path('', views.index, name='index'), 
]
=======
    path('', views.index, name='index'),
    path('productcreate/', views.product_create, name='ProductCreate'),
    path('product/<int:product_id>/', views.detail, name='detail'),
    path('cart/', views.cart, name='cart'),
    path('category/<int:category_id>/', views.category, name='category'),
    path('add_to_cart/<int:product_id>/', views.add_to_cart, name='add_to_cart'),

] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
>>>>>>> 4c64a3d516289f48143383d745fbf98d6d352726
