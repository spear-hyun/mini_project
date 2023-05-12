from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse

# Create your views here.
def index(request):
    #return render(request, 'hello')
    return render(request, 'index.html')

def login(request):
    return render(request, 'login.html')