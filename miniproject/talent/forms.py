from django import forms
from .models import User, Product

class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = ('user_id', 'product_name', 'category', 'price', 'description','thumbnail_image')

class ProfileImageForm(forms.Form):
<<<<<<< HEAD
    profile_image = forms.ImageField()
=======
    profile_image = forms.ImageField()
>>>>>>> bae6ed45b0d4092bfbec0e25a5ae651f401e0342
