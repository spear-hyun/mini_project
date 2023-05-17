from django import forms
from .models import Product

class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = ('user_id', 'product_name', 'category', 'price', 'description','thumbnail_image')

class ProfileImageForm(forms.Form):
    profile_image = forms.ImageField()