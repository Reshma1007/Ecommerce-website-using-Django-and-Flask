from django.shortcuts import render,redirect

# Create your views here.
from manufacturer.models import product1
from wholesalers.models import wsend_prequest
from django.contrib import messages

def manufacturer_index(request):

    return render(request, 'manufacturer/manufacturer_index.html')

def about_us(request):

    return render(request, 'manufacturer/about_us.html')

def services(request):

    return render(request, 'manufacturer/services.html')

def contact(request):

    return render(request, 'manufacturer/contact.html')

def manufacturer_login(request):
    if request.method == "POST":
        uname = request.POST.get("uname")
        password = request.POST.get("password")
        if uname == 'manufacturer' and password == 'manufacturer':
            return redirect("manufacturer_home")
    return render(request, 'manufacturer/manufacturer_login.html')

def manufacturer_register(request):

    return render(request, 'manufacturer/manufacturer_register.html')

def manufacturer_home(request):
    status = "pending"
    if request.method == "POST" and request.FILES['product_image']:
        vehicle_type = request.POST.get('vehicle_type')
        brand_name = request.POST.get('brand_name')
        category = request.POST.get('category')
        pname = request.POST.get('pname')
        quantity = request.POST.get('quantity')
        product_image = request.FILES['product_image']
        price = request.POST.get('price')
        work_status = request.POST.get('work_status')
        product1.objects.create(vehicle_type=vehicle_type, brand_name=brand_name, category=category, pname=pname,
                                quantity=quantity, product_image=product_image,mstatus=work_status,price=price)
    return render(request, 'manufacturer/manufacturer_home.html')

def view_demandproduct(request):
    rstatus="pending"
    demand1=wsend_prequest.objects.filter(request_status=rstatus)
    return render(request, 'manufacturer/view_demandproduct.html',{'demand1':demand1})

def update_product(request,pk):
    rstatus="completed"
    update_unique=wsend_prequest.objects.get(id=pk)
    unid11=update_unique.id
    pid11=update_unique.pid
    unproduct=product1.objects.filter(id=pid11)
    if request.method == "POST":
        qunatity=request.POST.get('quantity')
        product1.objects.filter(id=pid11).update(quantity=qunatity)
        wsend_prequest.objects.filter(id=unid11).update(request_status=rstatus)
        messages.success(request, 'Product Update Success')
    return render(request, 'manufacturer/update_product.html',{'unproduct':unproduct})