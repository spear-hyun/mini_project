from django import forms
from .models import User, Product, Review

class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = ('user_id', 'product_name', 'category', 'price', 'description','thumbnail_image')

class ReviewForm(forms.ModelForm):
    class Meta:
        model = Review
        exclude = ('user_id', 'product')
        fields = ('user_id', 'product', 'title', 'content')

class ProfileImageForm(forms.Form):
    profile_image = forms.ImageField()
