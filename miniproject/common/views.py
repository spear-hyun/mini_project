from talent.models import User, Ordered, Product
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.hashers import make_password
from django.contrib import messages
import re
from talent.forms import ProfileImageForm



def validate_phone_number(phone_number):
    pattern = r"^\d{3}-\d{4}-\d{4}$"
    return re.match(pattern, phone_number)

def index(request):
    return render(request, 'talent/products_list.html')

def login(request):
    return render(request, 'common/login.html')


def mypage(request):
    user_id=request.user.id
    user = get_object_or_404(User, id=user_id)

    if request.method == 'POST':
        form = ProfileImageForm(request.POST, request.FILES)
        if form.is_valid():
            user.profile_image = form.cleaned_data['profile_image']
            user.save()
            return redirect('common:mypage', user_id=user_id)
    else:
        form = ProfileImageForm()
    
    context = {
        'user': user,
        'form': form
    }
    return render(request, 'common/mypage.html', context)

def orderhistory(request, user_id):
    # 사용자가 로그인한 경우에만 장바구니를 보여줍니다.
    if request.user.is_authenticated:
        user_id = request.user.id
        # 장바구니에 있는 상품 목록을 가져옵니다.
        orders_ = Ordered.objects.filter(user_id=user_id)
        products = []
        for order_ in orders_:
            product = order_.product
            products.append(product)
        context = {
            'orders_': orders_,
            'user_id': user_id,
            'products': products,
        }
        return render(request, 'common/orderhistory.html', context)
    else:
        return redirect('common:login')  # 로그인 페이지로 리다이렉트

def createhistory(request, user_id):
     # 사용자가 로그인한 경우에만 장바구니를 보여줍니다.
    if request.user.is_authenticated:
        user_id = request.user.id
        # 장바구니에 있는 상품 목록을 가져옵니다.
        creates_ = Product.objects.filter(user_id=user_id)
        
        products=[]
        for create_ in creates_:
            products.append(create_)
        context = {
            'creates_': creates_,
            'user_id': user_id,
            'products': products,
        }
        return render(request, 'common/createhistory.html', context)
    else:
        return redirect('common:login')  # 로그인 페이지로 리다이렉트
    

def signup(request):
    if request.method == 'POST':
        email = request.POST['email']
        password = request.POST['password']
        confirm_password = request.POST['confirm_password']
        username = request.POST['username']
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

        user = User.objects.create(email=email, password=hashed_password, username=username,
                                   birth=birth, gender=gender, phone_number=phone_number,)

            
        # 사용자를 성공 페이지 또는 다른 원하는 페이지로 리디렉션합니다
        return render(request, 'common/signup_success.html')
        

    # 요청 메서드가 GET인 경우, 회원가입 양식을 렌더링합니다
    return render(request, 'common/signup.html')

def signup_success(request):
    return render(request, 'common/signup_success.html')
