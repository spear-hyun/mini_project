from django.shortcuts import render, redirect
from .forms import ProductForm, ReviewForm
from .models import Product, Cart, User, Category, Ordered, Review
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator  

# Create your views here.

def index(request):
    page = request.GET.get('page', '1')  # 페이지
    data = Product.objects.all()
    seller_ids = data.values_list('user_id', flat=True)
    sellers = User.objects.filter(id__in=seller_ids)
    categorys= Category.objects.all()
    user_name = request.user.username
    paginator = Paginator(data, 12)  # 페이지당 10개씩 보여주기
    page_obj = paginator.get_page(page)
    context = {'data':data,
               'sellers':sellers,
               'categorys':categorys,
               'user_name':user_name,
               'data':page_obj}
    return render(request, 'talent/products_list.html',context)


@login_required
def product_create(request):
    if request.method == "POST":
        form = ProductForm(request.POST, request.FILES)
        if form.is_valid():
            product = form.save(commit=False)
            product.user_id = request.user
            product.save()
            return redirect('talent:index')  # 등록 후 상품 목록 페이지로 이동
    else:
        form = ProductForm()
    return render(request, 'talent/product_create.html', {'form': form})




def detail(request, product_id):
    data = Review.objects.filter(product_id=product_id).order_by('-created_at')
    product = Product.objects.get(id=product_id)
    seller = product.user_id
    categorys= Category.objects.all()
    form = ReviewForm()
    context = {
        'product' : product,
        'seller' : seller,
        'categorys' : categorys,
        'form' : form,
        'data' : data,
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
     user_name = request.user.username

     context = {'data':data,
                'sellers':sellers,
                'categorys':categorys,
                'user_name':user_name}
     return render(request, 'talent/products_list.html',context)


def add_to_cart(request, product_id):
    # 로그인한 사용자인지 확인
    if request.user.is_authenticated:
        user_id = request.user.id
        cart_item_exists = Cart.objects.filter(product=product_id, user_id=user_id).exists()
        if cart_item_exists:
            # 이미 해당 상품이 장바구니에 있는 경우 처리 로직 작성
            # 예: 수량 증가 등
            error_message = "장바구니에 상품이 이미 추가되어 있습니다."

        else:
            # 해당 상품이 장바구니에 없는 경우 새로운 장바구니 아이템 생성
            product = Product.objects.get(id=product_id)
            cart_item = Cart.objects.create(product=product, user_id=request.user)
            cart_item.save()
            error_message = "장바구니에 상품이 추가되었습니다."
        # 장바구니 페이지로 리디렉션 또는 원하는 경로로 설정하세요.
        return render(request, 'talent/products_list.html', {'error_message':error_message})

    # 상품을 장바구니에 추가하는 로직 작성
    # 장바구니에 이미 해당 상품이 있는지 확인
    else:
         # 로그인되지 않은 경우 로그인 페이지로 이동하거나 원하는 경로로 설정하세요.
        return redirect('account:login')



def payment(request, product_id):
    Ordered.objects.create(user_id=request.user, product_id=product_id, price=Product.objects.get(id=product_id).price)
    Cart.objects.get(product_id=product_id, user_id=request.user).delete()
    error_message = "해당 상품을 구매하였습니다."
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
        'error_message':error_message,
    }
    return render(request, 'talent/cart.html', context)

def delete(request,product_id):

    cart_item = Cart.objects.get(product_id=product_id, user_id=request.user)
    cart_item.delete()
    error_message = "해당 상품이 삭제되었습니다."
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
        'error_message':error_message,
    }
    return render(request, 'talent/cart.html', context)

    
def delete_all(request):
    cart_items = Cart.objects.filter(user_id=request.user)

    for item in cart_items:
        item.delete()
    error_message = "장바구니의 모든 상품이 삭제되었습니다."
    context = {
        'error_message':error_message,
    }
    return render(request, 'talent/cart.html', context)



def payment_all(request):
    cart_items = Cart.objects.filter(user_id=request.user)

    for item in cart_items:
        Ordered.objects.create(user_id=request.user, product_id=item.product_id, price=Product.objects.get(id=item.product_id).price)
        Cart.objects.get(product_id=item.product_id, user_id=request.user).delete()
    error_message = "장바구니의 모든 상품을 구매하였습니다."
    context = {
        'error_message':error_message,
    }
    return render(request, 'talent/cart.html', context)
        

def review_create(request):
    id = request.POST.get('product_id')
    if request.method == "POST" :
        form = ReviewForm(request.POST)
        if form.is_valid():
            review = form.save(commit=False)
            review.user_id = request.user
            review.product_id = id
            review.save()
            url = f'/product/{id}/'
            return redirect(url) # 등록 후 상품 상세 페이지로 이동

    else :
        pass
