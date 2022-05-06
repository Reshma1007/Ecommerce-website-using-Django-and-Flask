from django.shortcuts import render,redirect

# Create your views here.
from manufacturer.models import product1
from retailers.models import retailers_reg, retailer_buy, rsend_prequest
from wholesalers.models import wholesaler_buy


def retailers_login(request):
    if request.method == "POST":
        uname = request.POST.get('uname')
        pswd = request.POST.get('password')
        try:
            check = retailers_reg.objects.get(uname=uname, password=pswd)
            request.session['userid'] = check.id
            request.session['uname1'] = check.uname
            request.session['uemail'] = check.email
            return redirect('retailers_home')
        except:
            pass
    return render(request, 'retailers/retailers_login.html')

def retailers_register(request):
    if request.method == "POST":
        fname = request.POST.get('fname')
        lname = request.POST.get('lname')
        email = request.POST.get('email')
        phone = request.POST.get('phone')
        uname = request.POST.get('uname')
        password = request.POST.get('password')
        retailers_reg.objects.create(fname=fname, lname=lname, email=email, phone=phone, uname=uname,
                                         password=password)
        return redirect('retailers_login')
    return render(request, 'retailers/retailers_register.html')


def retailers_home(request):
    search_list = ''
    imageview=''
    if request.method == "POST":
        vehicle_type = request.POST.get('vehicle_type')
        brand_name = request.POST.get('brand_name')
        category = request.POST.get('category')
        pname = request.POST.get('pname')
        search_list = wholesaler_buy.objects.filter(vehicle_type=vehicle_type, brand_name=brand_name, category=category,
                                              product_name=pname)
        for a in search_list:
            pid=a.pid
            imageview=product1.objects.filter(id=pid)
    return render(request, 'retailers/retailers_home.html',{'search_list':search_list,'imageview':imageview})

def rbuy_product(request,pk):
    tot_price=0
    rid=request.session['userid']
    rname=request.session['uname1']
    uproduct=wholesaler_buy.objects.get(id=pk)
    unid1=uproduct.id
    mainproductid=uproduct.pid
    request.session['wpid']=unid1
    pprice=uproduct.product_price
    totquantity=uproduct.quantity
    request.session['totalquantity'] = totquantity
    uniqueproduct=wholesaler_buy.objects.filter(id=unid1)
    if request.method == "POST":
        vehicle_type = request.POST.get('vehicle_type')
        brand_name = request.POST.get('brand_name')
        category = request.POST.get('category')
        product_name = request.POST.get('product_name')
        quantity = request.POST.get('quantity')
        tot_price=int(quantity)*int(pprice)
        remaining_quantity=int(totquantity)-int(quantity)
        if int(totquantity) == 0:
            return redirect('rcheckquantity')
        elif int(quantity) > int(totquantity):
            return redirect('rcheckquantity1')
        else:
            retailer_buy.objects.create(rid=rid,rname=rname,mainproductid=mainproductid,pid=unid1,vehicle_type=vehicle_type,brand_name=brand_name,
                                    category=category,product_name=product_name,quantity=quantity,perproduct_price=pprice,
                                    total_price=tot_price)
        wholesaler_buy.objects.filter(id=unid1).update(quantity=remaining_quantity)
        return redirect('rpayment1')
    return render(request, 'retailers/rbuy_product.html',{'uniqueproduct':uniqueproduct})

def rcheckquantity(request):
    wpid1 = request.session['wpid']

    return render(request, 'retailers/rcheckquantity.html')

def rcheckquantity1(request):
    wpid1 = request.session['wpid']
    totalquantity1=request.session['totalquantity']
    return render(request, 'retailers/rcheckquantity1.html',{'totalquantity1':totalquantity1})


def rpayment1(request):
    lastresult=retailer_buy.objects.all().last()
    unid=lastresult.id
    request.session['saleid'] =unid
    buyresult=retailer_buy.objects.filter(id=unid)
    return render(request, 'retailers/rpayment1.html',{'buyresult':buyresult})

def rpayment2(request,pk):
    uniquebuy=retailer_buy.objects.get(id=pk)
    punid=uniquebuy.id
    if request.method == "POST":
        card_number = request.POST.get('card_number')
        cvv = request.POST.get('cvv')
        holder_name = request.POST.get('holder_name')
        validity = request.POST.get('validity')
        retailer_buy.objects.filter(id=punid).update(cardnumber=card_number,cvv=cvv,card_holder=holder_name,validity_date=validity)
        return redirect('rsale_product')
    return render(request, 'retailers/rpayment2.html')

def rsale_product(request):
    saleid1=request.session['saleid']
    sales=retailer_buy.objects.filter(id=saleid1)
    if request.method == "POST":
        price=request.POST.get('price')
        retailer_buy.objects.filter(id=saleid1).update(product_price=price)
    return render(request, 'retailers/rsale_product.html',{'sales':sales})

def rproduct_request(request):
    wpid1=request.session['wpid']
    unproduct=wholesaler_buy.objects.filter(id=wpid1)
    return render(request, 'retailers/rproduct_request.html',{'unproduct':unproduct})


def rsend_request(request,pk):
    rid = request.session['userid']
    rname = request.session['uname1']
    product_unique=wholesaler_buy.objects.get(id=pk)
    buyunid=product_unique.id
    mainpid=product_unique.pid
    vehicle_type=product_unique.vehicle_type
    brand_name=product_unique.brand_name
    category=product_unique.category
    pname=product_unique.product_name
    wid = product_unique.wid
    wname = product_unique.wname
    rstatus="pending"
    rsend_prequest.objects.create(rid=rid,rname=rname,wid=wid,wname=wname,buyunid=buyunid,mainpid=mainpid,
                                  vehicle_type=vehicle_type,brand_name=brand_name,
                                  category=category,product_name=pname,request_status=rstatus)
    return render(request, 'retailers/rsend_request.html')

def rview_demand(request):
    tquantity=0
    demand_product=retailer_buy.objects.filter(quantity=tquantity)
    return render(request, 'retailers/rview_demand.html',{'demand_product':demand_product})


def sendto_whole(request,pk):
    rid = request.session['userid']
    rname = request.session['uname1']
    product_unique=retailer_buy.objects.get(id=pk)
    buyunid=product_unique.id
    mainpid=product_unique.mainproductid
    vehicle_type=product_unique.vehicle_type
    brand_name=product_unique.brand_name
    category=product_unique.category
    pname=product_unique.product_name

    rstatus="pending"
    rsend_prequest.objects.create(rid=rid,rname=rname,wid=rid,wname=rname,buyunid=buyunid,mainpid=mainpid,
                                  vehicle_type=vehicle_type,brand_name=brand_name,
                                  category=category,product_name=pname,request_status=rstatus)
    return render(request, 'retailers/sendto_whole.html')
