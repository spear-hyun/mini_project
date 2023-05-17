from django import forms
from .models import Product

class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = ('user_id', 'product_name', 'price', 'description','thumbnail_image')

