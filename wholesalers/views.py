from django.shortcuts import render,redirect

# Create your views here.
from manufacturer.models import product1
from retailers.models import rsend_prequest
from wholesalers.models import wholesaler_reg, wholesaler_buy, wsend_prequest

from django.contrib import messages
def wholesalers_login(request):
    if request.method == "POST":
        uname = request.POST.get('uname')
        pswd = request.POST.get('password')
        try:
            check = wholesaler_reg.objects.get(uname=uname, password=pswd)
            request.session['userid'] = check.id
            request.session['uname1'] = check.uname
            request.session['uemail'] = check.email
            return redirect('wholesaler_home')
        except:
            pass
    return render(request, 'wholesalers/wholesalers_login.html')

def wholesaler_register(request):
    if request.method == "POST":
        fname = request.POST.get('fname')
        lname = request.POST.get('lname')
        email = request.POST.get('email')
        phone = request.POST.get('phone')
        uname = request.POST.get('uname')
        password = request.POST.get('password')
        wholesaler_reg.objects.create(fname=fname, lname=lname, email=email, phone=phone, uname=uname,
                                         password=password)
        return redirect('wholesalers_login')
    return render(request, 'wholesalers/wholesaler_register.html')

def wholesaler_home(request):
    search_list=''
    if request.method == "POST":
        vehicle_type = request.POST.get('vehicle_type')
        brand_name = request.POST.get('brand_name')
        category = request.POST.get('category')
        pname = request.POST.get('pname')
        search_list = product1.objects.filter(vehicle_type=vehicle_type,brand_name=brand_name,category=category,pname=pname)
    return render(request, 'wholesalers/wholesaler_home.html',{'search_list':search_list})

def wbuy_product(request,pk):
    tot_price=0
    wid=request.session['userid']
    wname=request.session['uname1']
    uproduct=product1.objects.get(id=pk)
    unid1=uproduct.id
    request.session['pid']=unid1
    pprice=uproduct.price
    totquantity=uproduct.quantity
    request.session['totalquantity']=totquantity
    uniqueproduct=product1.objects.filter(id=unid1)

    if request.method == "POST":
        vehicle_type = request.POST.get('vehicle_type')
        brand_name = request.POST.get('brand_name')
        category = request.POST.get('category')
        product_name = request.POST.get('product_name')
        quantity = request.POST.get('quantity')
        tot_price=int(quantity)*int(pprice)
        remaining_quantity=int(totquantity)-int(quantity)
        if int(totquantity)==0:
            return redirect('wcheckquantity')
        elif int(quantity) > int(totquantity):
            return redirect('wcheckquantity1')
        else:
            wholesaler_buy.objects.create(wid=wid,wname=wname,pid=unid1,vehicle_type=vehicle_type,brand_name=brand_name,
                                    category=category,product_name=product_name,quantity=quantity,perproduct_price=pprice,
                                    total_price=tot_price)
            product1.objects.filter(id=unid1).update(quantity=remaining_quantity)
            return redirect('payment1')
    return render(request, 'wholesalers/wbuy_product.html',{'uniqueproduct':uniqueproduct})

def payment1(request):
    lastresult=wholesaler_buy.objects.all().last()
    unid=lastresult.id
    request.session['saleid'] =unid
    buyresult=wholesaler_buy.objects.filter(id=unid)
    return render(request, 'wholesalers/payment1.html',{'buyresult':buyresult})

def payment2(request,pk):
    uniquebuy=wholesaler_buy.objects.get(id=pk)
    punid=uniquebuy.id
    if request.method == "POST":
        card_number = request.POST.get('card_number')
        cvv = request.POST.get('cvv')
        holder_name = request.POST.get('holder_name')
        validity = request.POST.get('validity')
        wholesaler_buy.objects.filter(id=punid).update(cardnumber=card_number,cvv=cvv,card_holder=holder_name,validity_date=validity)
        return redirect('sale_product')
    return render(request, 'wholesalers/payment2.html')

def sale_product(request):
    saleid1=request.session['saleid']
    sales=wholesaler_buy.objects.filter(id=saleid1)
    if request.method == "POST":
        price=request.POST.get('price')
        wholesaler_buy.objects.filter(id=saleid1).update(product_price=price)
    return render(request, 'wholesalers/sale_product.html',{'sales':sales})

def wcheckquantity(request):
    pid1 = request.session['pid']

    return render(request, 'wholesalers/wcheckquantity.html')

def wcheckquantity1(request):
    pid1 = request.session['pid']
    totalquantity1=request.session['totalquantity']
    return render(request, 'wholesalers/wcheckquantity1.html',{'totalquantity1':totalquantity1})

def wproduct_request(request):
    pid1=request.session['pid']
    unproduct=product1.objects.filter(id=pid1)
    return render(request, 'wholesalers/wproduct_request.html',{'unproduct':unproduct})

def wsend_request(request,pk):
    product_unique=product1.objects.get(id=pk)
    wid = request.session['userid']
    wname = request.session['uname1']
    pid=product_unique.id
    vehicle_type=product_unique.vehicle_type
    brand_name=product_unique.brand_name
    category=product_unique.category
    pname=product_unique.pname
    rstatus="pending"
    wsend_prequest.objects.create(wid=wid,wname=wname,pid=pid,vehicle_type=vehicle_type,brand_name=brand_name,
                                  category=category,product_name=pname,request_status=rstatus)
    return render(request, 'wholesalers/wsend_request.html')

def view_retailerrequest(request):
    wid = request.session['userid']
    wname = request.session['uname1']
    retailerrequest = rsend_prequest.objects.all()
    return render(request, 'wholesalers/view_retailerrequest.html',{'retailerrequest':retailerrequest})

def sendto_manufacturer(request,pk):
    product_unique=rsend_prequest.objects.get(id=pk)
    wid = request.session['userid']
    wname = request.session['uname1']
    pid=product_unique.mainpid
    vehicle_type=product_unique.vehicle_type
    brand_name=product_unique.brand_name
    category=product_unique.category
    pname=product_unique.product_name
    rstatus="pending"
    wsend_prequest.objects.create(wid=wid,wname=wname,pid=pid,vehicle_type=vehicle_type,brand_name=brand_name,
                                  category=category,product_name=pname,request_status=rstatus)
    return render(request, 'wholesalers/sendto_manufacturer.html')