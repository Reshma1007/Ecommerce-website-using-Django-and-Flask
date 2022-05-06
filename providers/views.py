from django.shortcuts import render,redirect

# Create your views here.
from manufacturer.models import product1


def providers_login(request):
    if request.method == "POST":
        uname = request.POST.get("uname")
        password = request.POST.get("password")
        if uname == 'provider' and password == 'provider':
            return redirect("provider_home")
    return render(request, 'providers/providers_login.html')

def provider_home(request):
    product_list = product1.objects.all()
    return render(request, 'providers/provider_home.html',{'product_list':product_list})

def release_product(request,pk):
    uproduct=product1.objects.get(id=pk)
    unid=uproduct.id
    status11="release"
    product1.objects.filter(id=unid).update(pstatus=status11)
    return render(request, 'providers/release_product.html')