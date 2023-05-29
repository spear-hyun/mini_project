from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.core.exceptions import ValidationError

from talent.models import User

class SignupForm(UserCreationForm):
    email = forms.EmailField(max_length=50, help_text='이메일을 입력해주세요.')
    password1 = forms.CharField(label='비밀번호', widget=forms.PasswordInput, help_text='비밀번호를 입력해주세요.')
    password2 = forms.CharField(label='비밀번호 확인', widget=forms.PasswordInput, help_text='비밀번호를 한 번 더 입력해주세요.')
    username = forms.CharField(max_length=20, help_text='닉네임을 입력해주세요.')
    birth = forms.DateField(label='생년월일', widget=forms.DateInput(attrs={'type': 'date'}), required=False)
    gender = forms.ChoiceField(label='성별', choices=(('male', '남성'), ('female', '여성')), required=False)
    phone_number1 = forms.CharField(max_length=3, label='전화번호', widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': '010'}))
    phone_number2 = forms.CharField(max_length=4, label='', widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': '1234'}))
    phone_number3 = forms.CharField(max_length=4, label='', widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': '5678'}))


    def clean_phone_number1(self):
        phone_number1 = self.cleaned_data['phone_number1']
        if not phone_number1.isdigit():
            raise ValidationError('숫자만 입력해주세요.')
        return phone_number1

    def clean_phone_number2(self):
        phone_number2 = self.cleaned_data['phone_number2']
        if not phone_number2.isdigit():
            raise ValidationError('숫자만 입력해주세요.')
        return phone_number2

    def clean_phone_number3(self):
        phone_number3 = self.cleaned_data['phone_number3']
        if not phone_number3.isdigit():
            raise ValidationError('숫자만 입력해주세요.')
        return phone_number3

    def clean_phone_number(self):
        phone_number1 = self.cleaned_data['phone_number1']
        phone_number2 = self.cleaned_data['phone_number2']
        phone_number3 = self.cleaned_data['phone_number3']
        phone_number = f'{phone_number1}-{phone_number2}-{phone_number3}'
        return phone_number

    def save(self, commit=True):
        user = super().save(commit=False)
        user.phone_number = self.clean_phone_number()
        if commit:
            user.is_active=False
            user.save()
        return user

    def clean_email(self):
        email = self.cleaned_data.get('email')
        if User.objects.filter(email=email).exists():
            raise ValidationError('이미 사용 중인 이메일입니다.')
        return email

    class Meta:
        model = User
        fields = ['username', 'email', 'phone_number1', 'phone_number2', 'phone_number3', 'password1', 'password2', 'birth', 'gender']
