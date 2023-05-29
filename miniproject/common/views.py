from talent.models import User, Ordered, Product
from django.shortcuts import render, redirect, get_object_or_404
from talent.forms import ProfileImageForm
from .forms import SignupForm
from django.contrib.auth import login as login2,authenticate
# SMTP 관련 인증
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import render_to_string
from django.utils.http import urlsafe_base64_encode,urlsafe_base64_decode
from django.core.mail import EmailMessage
from django.utils.encoding import force_bytes, force_str
from .tokens import account_activation_token
from django.contrib import auth


def index(request):
    return render(request, 'talent/products_list.html')

def signup(request):
    if request.method == 'POST':
        form = SignupForm(request.POST)
        if form.is_valid():
            user = form.save(commit=True)
            current_site = get_current_site(request) 
            message = render_to_string('common/activation_email.html', {
                'user': user,
                'domain': current_site.domain,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                'token': account_activation_token.make_token(user),
            })
            mail_title = "계정 활성화 확인 이메일"
            mail_to = request.POST["email"]
            email = EmailMessage(mail_title, message, to=[mail_to])
            email.send()
            # # 사용자 인증
            # authenticated_user = authenticate(request, username=user.username, password=form.cleaned_data['password1'])
            # if authenticated_user is not None:
            #     # 인증된 사용자 로그인
            #     login2(request, authenticated_user)
            return redirect('talent:index')
        else:
            render(request, 'common/signup.html', {'form': form})
    else:
        form = SignupForm()

    return render(request, 'common/signup.html', {'form': form})

# 계정 활성화 함수(토큰을 통해 인증)
def activate(request, uidb64, token):
    try:
        uid = force_str(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except(TypeError, ValueError, OverflowError, User.DoesNotExsit):
        user = None
    if user is not None and account_activation_token.check_token(user, token):
        user.is_active = True
        user.save()
        user.backend = 'django.contrib.auth.backends.ModelBackend'
        login2(request, user)
        return redirect("talent:index")
    else:
        return render(request, 'talent/products_list.html', {'error' : '계정 활성화 오류'})
    return 


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

def signup_success(request):
    return render(request, 'common/signup_success.html')
