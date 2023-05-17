from django import forms
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from .models import User

class CustomUserCreationForm(UserCreationForm) :
    class Meta(UserCreationForm.Meta):
        model = User
        fields = UserCreationForm.Meta.fields + ('email', 'birth',)

class CustomUserChangeForm(UserChangForm):
    class Meta :
        model = User
        fields = ('email', 'username', 'birth')
