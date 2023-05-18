from django import forms
from .models import Product

class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        exclude = ['user_id']


class ProfileImageForm(forms.Form):
    profile_image = forms.ImageField()
