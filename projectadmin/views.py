from django.shortcuts import render,redirect

# Create your views here.
from manufacturer.models import product1
from retailers.models import retailers_reg, retailer_buy
from wholesalers.models import wholesaler_reg, wholesaler_buy


def admin_login(request):
    if request.method == "POST":
        uname = request.POST.get("uname")
        password = request.POST.get("password")
        if uname == 'admin' and password == 'admin':
            return redirect("admin_home")
    return render(request, 'projectadmin/admin_login.html')

def admin_home(request):
    wholesaler=wholesaler_reg.objects.all()
    return render(request, 'projectadmin/admin_home.html',{'wholesaler':wholesaler})

def retailer_details(request):
    retailer=retailers_reg.objects.all()
    return render(request, 'projectadmin/retailer_details.html',{'retailer':retailer})

def view_product(request):
    all_product=product1.objects.all()
    return render(request, 'projectadmin/view_product.html',{'all_product':all_product})

def wholesaler_payment(request):
    wholesaler_payment=wholesaler_buy.objects.all()
    return render(request, 'projectadmin/wholesaler_payment.html',{'wholesaler_payment':wholesaler_payment})

def retailer_payment(request):
    retailer_payment=retailer_buy.objects.all()
    return render(request, 'projectadmin/retailer_payment.html',{'retailer_payment':retailer_payment})