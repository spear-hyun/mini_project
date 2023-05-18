from django.shortcuts import render, redirect
from .forms import ProductForm
from .models import Product, Cart, User, Category
# Create your views here.

def index(request):
    data = Product.objects.all()
    seller_ids = data.values_list('user_id', flat=True)
    sellers = User.objects.filter(id__in=seller_ids)
    categorys= Category.objects.all()
    user_name = request.user.username

    context = {'data':data,
               'sellers':sellers,
               'categorys':categorys,
               'user_name':user_name}
    return render(request, 'talent/products_list.html',context)


def product_create(request):
    if request.method == "POST" :
        form = ProductForm(request.POST, request.FILES)
        if form.is_valid() :
            form.save()
            return redirect('talent:index') # 등록 후 상품 목록 페이지로 이동

    else :
        form = ProductForm()
    return render(request, 'talent/product_create.html', {'form':form})

def detail(request, product_id):
    product = Product.objects.get(id=product_id)
    seller = product.user_id
    categorys= Category.objects.all()
    context = {
        'product' : product,
        'seller' : seller,
        'categorys' : categorys
    }
    return render(request, 'talent/products_detail.html', context)

def cart(request) :
    # 사용자가 로그인한 경우에만 장바구니를 보여줌
    if request.user.is_authenticated:
        user_id = request.user.id

        # 장바구니에 있는 상품 목록을 가져옵니다.
        cart_items = Cart.objects.filter(user_id=user_id)
        products = []

        for cart_item in cart_items:
            product = cart_item.product
            products.append(product)

        context = {
            'cart_items' : cart_items,
            'user_id' : user_id,
            'products' : products,
        }
        return render(request, 'talent/cart.html', context)
    else:
        return redirect('common:login')  # 로그인 페이지로 리다이렉트

def category(request, category_id):
     data = Product.objects.filter(category_id=category_id)
     seller_ids = data.values_list('user_id', flat=True)
     sellers = User.objects.filter(id__in=seller_ids)
     categorys= Category.objects.all()
     context = {'data':data,
                'sellers':sellers,
                'categorys':categorys}
     return render(request, 'talent/products_list.html',context)




def add_to_cart(request, product_id):
    # 로그인한 사용자인지 확인
    if request.user.is_authenticated:
        user_id = request.user.id
        cart_item_exists = Cart.objects.filter(product=product_id, user_id=user_id).exists()
        if cart_item_exists:
            # 이미 해당 상품이 장바구니에 있는 경우 처리 로직 작성
            # 예: 수량 증가 등
            pass
        else:
            # 해당 상품이 장바구니에 없는 경우 새로운 장바구니 아이템 생성
            user = User.objects.get(id=user_id)
            product = Product.objects.get(id=product_id)
            print(request.user)
            cart_item = Cart.objects.create(product=product, user_id=request.user)
            cart_item.save()

        # 장바구니 페이지로 리디렉션 또는 원하는 경로로 설정하세요.
        return redirect('talent:cart')

    # 상품을 장바구니에 추가하는 로직 작성
    # 장바구니에 이미 해당 상품이 있는지 확인
    else:
         # 로그인되지 않은 경우 로그인 페이지로 이동하거나 원하는 경로로 설정하세요.
        return redirect('account:login')



