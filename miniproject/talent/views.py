from django.shortcuts import render # Create your views here. def index(request): return render(request, "index.html")

# Create your views here.

def index(request):
    print('@@@@@@@@@@@@@@@@@@@@')
    print(request.session._session)
    print(request)
    return render(request, 'talent/products_list.html')
    print ("=========================")
    print (request.session._session)
    try:
        if request.session._session['jwt_token']:
            print('~~~~~pass~~~~~')
            data = {'user' : {'is_authenticated' : True}, 'name' : request.session._session['user']}
            print(data)
        else:
            print('~~~~notlogin~~~~')
            data = {'user' : {'is_authenticated' : False}}            
        return render(request, 'talent/products_list.html', data)

    except Exception as e:
        print(e)
        return render(request, 'talent/products_list.html')