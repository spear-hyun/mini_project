from django.contrib.auth.models import AbstractUser
from django.db import models

class User(AbstractUser):
    # 추가 필드 및 메서드 정의
    email = models.EmailField(max_length=50, unique=True)
    password = models.CharField(max_length=1000)
    username = models.CharField(max_length=20, unique=True)
    birth = models.DateField()
    gender = models.CharField(max_length=15)
    phone_number = models.CharField(max_length=30)
    profile_image = models.ImageField(max_length=100, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'talent_user'  # talent_user 테이블과 연결

class Category(models.Model):
    category = models.CharField(max_length=100)

class Product(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)
    product_name = models.CharField(max_length=200)
    price = models.IntegerField()
    category = models.ForeignKey(Category, on_delete=models.SET_NULL, null=True)
    description = models.CharField(max_length=4000)
    thumbnail_image = models.CharField(max_length=1000, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

class Review(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
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