from django.shortcuts import render, redirect # Create your views here. def index(request): return render(request, "index.html")
from .forms import ProductForm
from .models import Product
# Create your views here.

def index(request):
    data = Product.objects.all()
    context = {'data':data}
    return render(request, 'talent/products_list.html',context)


def product_create(request):
    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('talent:index')  # 등록 후 상품 목록 페이지로 이동
    else:
        form = ProductForm()
    return render(request, 'talent/product_create.html', {'form': form})

def detail(request, product_id):
    product = Product.objects.get(id=product_id)
    seller = product.user_id
    context = {
        'product' : product,
        'seller' : seller
    }
    return render(request, 'talent/products_detail.html', context)






