from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static

app_name = 'talent'

urlpatterns = [
    path('', views.index, name='index'),
    path('productcreate/', views.product_create, name='ProductCreate'),
    path('product/<int:product_id>/', views.detail, name='detail'),
    path('cart/', views.cart, name='cart'),
    path('category/<int:category_id>/', views.category, name='category'),
    path('add_to_cart/<int:product_id>/', views.add_to_cart, name='add_to_cart'),
    path('cart/payment/<int:product_id>/',views.payment, name="payment"),
    path('cart/delete/<int:product_id>/', views.delete, name='delete'),
<<<<<<< HEAD
    path('cart/delete_all/', views.delete_all, name='delete_all'),
    path('cart/payment_all/', views.payment_all, name='payment_all'),
=======
    path('reviewcreate/', views.review_create, name='ReviewCreate'),
>>>>>>> 155b7187b1e442b1d3f13fba2c568a8011e6526a
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
