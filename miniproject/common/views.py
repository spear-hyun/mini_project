from talent.models import User
from django.shortcuts import render, redirect
from django.contrib.auth.hashers import make_password, check_password
from django.contrib import messages
import re
from django.http     import HttpResponse, JsonResponse
from miniproject.settings import SECRET_KEY
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth import login as d_login, logout as d_logout
import common

def validate_phone_number(phone_number):
    pattern = r"^\d{3}-\d{4}-\d{4}$"
    return re.match(pattern, phone_number)

def index(request):
    return render(request, 'talent/products_list.html')

class login(APIView):
    def post(self, request):
        email = request.data.get('email')
        password = request.data.get('password')

        try:
            user = User.objects.get(email=email)
            password_match = check_password(password, user.password)

            if password_match:
                user.backend = 'django.contrib.auth.backends.ModelBackend'
                d_login(request, user)
                data = { 'name' : user.username }
                return render(request, 'talent/products_list.html', data)
            
            else:
                return Response({'error': '아이디 또는 비밀번호가 일치하지 않습니다'}, status=status.HTTP_401_UNAUTHORIZED)
            
        except User.DoesNotExist:
            return Response({'아이디 또는 비밀번호가 일치하지 않습니다'}, status=status.HTTP_401_UNAUTHORIZED)

    def get(self, request):
        return render(request, 'common/login.html')

def signup(request):
    if request.method == 'POST':
        email = request.POST['email']
        password = request.POST['password']
        confirm_password = request.POST['confirm_password']
        username = request.POST['user_name']
        birth = request.POST['birth']
        gender = request.POST['gender']
        phone_number = request.POST['phone_number']
        # User 객체를 생성합니다

        try:
            User.objects.get(username=username)
            messages.error(request, '이미 사용 중인 사용자 이름입니다.')
            return render(request, 'common/signup.html')
        except User.DoesNotExist:
            pass


        if password != confirm_password:
            # 패스워드와 패스워드 확인이 일치하지 않는 경우에 대한 처리를 수행합니다
            messages.error(request,'패스워드와 패스워드 확인이 일치하지 않습니다.')
            return render(request, 'common/signup.html')
        
        if password is None:
            # 비밀번호 필드가 없는 경우에 대한 처리를 수행합니다
            error_message = '비밀번호를 입력해주세요.'
            return render(request, 'common/signup.html', {'error_message': error_message})
        
        if not validate_phone_number(phone_number):
            messages.error(request, "전화번호 형식에 맞지 않습니다.")
            return render(request, 'common/signup.html')
            
        # 비밀번호를 해시하여 저장합니다
        hashed_password = make_password(password)

        User.objects.create(email=email, password=hashed_password, username=username,
                                   birth=birth, gender=gender, phone_number=phone_number,)
        
        user = User.objects.get(email=email)
        user.backend = 'django.contrib.auth.backends.ModelBackend'
        d_login(request, user)
        data = { 'name' : username }
        return render(request, 'talent/products_list.html', data)

    # 요청 메서드가 GET인 경우, 회원가입 양식을 렌더링합니다
    return render(request, 'common/signup.html')

class Userlogout(APIView):
    def get(self, request):
        try:
            d_logout(request)
            return redirect('/')
        except Exception as e:
            print(e)

    def post(self, request):
        try:
            d_logout(request)
            return redirect('/')
        except Exception as e:
            print(e)

def mypage(request):
    pass