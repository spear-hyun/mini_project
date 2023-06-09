from django.db import models
from django.contrib.auth.models import AbstractUser
# Create your models here.

class User(AbstractUser):
    # use column
    email = models.EmailField(max_length=50, unique=True)
    password = models.CharField(max_length=1000)
    username = models.CharField(max_length=20, unique=True)
    birth = models.DateField(null=True)
    gender = models.CharField(max_length=15)
    phone_number = models.CharField(max_length=30)
    profile_image = models.ImageField(upload_to='profiles/', null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    
    # delete colume
    first_name = None
    last_name = None
    last_login = None
    date_joined = None
    
    def __str__(self):
        return self.email
    
class Category(models.Model):
    category = models.CharField(max_length=100)

    def __str__(self):
        return self.category


class Product(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)
    product_name = models.CharField(max_length=200)
    price = models.IntegerField()
    category = models.ForeignKey(Category, on_delete=models.SET_NULL, null=True)
    description = models.CharField(max_length=4000)
    thumbnail_image = models.ImageField(upload_to='images/', null=True)
    created_at = models.DateTimeField(auto_now_add=True)

class Review(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    title = models.CharField(max_length=100, default="기본 제목")
    content = models.CharField(max_length=1000)
    like_count = models.IntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True)

class Cart(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)

class Ordered(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    product = models.ForeignKey(Product, on_delete=models.SET_NULL, null=True)
    price = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)
