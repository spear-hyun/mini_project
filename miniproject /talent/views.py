from django.shortcuts import render # Create your views here. def index(request): return render(request, "index.html")

# Create your views here.

def index(request):
    return render(request, 'talent/products_list.html')
