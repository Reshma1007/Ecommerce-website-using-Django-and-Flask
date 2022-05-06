from django.shortcuts import render,redirect

# Create your views here.
from manufacturer.models import product1
from retailers.models import retailer_buy
from user.models import user_reg, user_buy


def user_login(request):
    if request.method == "POST":
        uname = request.POST.get('uname')
        pswd = request.POST.get('password')
        try:
            check = user_reg.objects.get(uname=uname, password=pswd)
            request.session['userid'] = check.id
            request.session['uname1'] = check.uname
            request.session['uemail'] = check.email
            return redirect('user_home')
        except:
            pass
    return render(request, 'user/user_login.html')

def user_register(request):
    if request.method == "POST":
        fname = request.POST.get('fname')
        lname = request.POST.get('lname')
        email = request.POST.get('email')
        phone = request.POST.get('phone')
        uname = request.POST.get('uname')
        password = request.POST.get('password')
        user_reg.objects.create(fname=fname, lname=lname, email=email, phone=phone, uname=uname,
                                         password=password)
        return redirect('user_login')
    return render(request, 'user/user_register.html')


def user_home(request):
    search_list = ''
    imageview=''
    if request.method == "POST":
        vehicle_type = request.POST.get('vehicle_type')
        brand_name = request.POST.get('brand_name')
        category = request.POST.get('category')
        pname = request.POST.get('pname')
        search_list = retailer_buy.objects.filter(vehicle_type=vehicle_type, brand_name=brand_name, category=category,
                                              product_name=pname)
        for a in search_list:
            pid=a.mainproductid
            imageview=product1.objects.filter(id=pid)
    return render(request, 'user/user_home.html',{'search_list':search_list,'imageview':imageview})

def userbuy_product(request,pk):
    tot_price=0
    uid=request.session['userid']
    uname=request.session['uname1']
    uproduct=retailer_buy.objects.get(id=pk)
    unid1=uproduct.id
    mainproductid=uproduct.pid
    request.session['rpid']=unid1
    pprice=uproduct.product_price
    totquantity=uproduct.quantity
    request.session['totalquantity'] = totquantity
    uniqueproduct=retailer_buy.objects.filter(id=unid1)
    if request.method == "POST":
        vehicle_type = request.POST.get('vehicle_type')
        brand_name = request.POST.get('brand_name')
        category = request.POST.get('category')
        product_name = request.POST.get('product_name')
        quantity = request.POST.get('quantity')
        tot_price=int(quantity)*int(pprice)
        remaining_quantity=int(totquantity)-int(quantity)
        if int(totquantity) == 0:
            return redirect('ucheckquantity')
        elif int(quantity) > int(totquantity):
            return redirect('ucheckquantity1')
        else:
            user_buy.objects.create(uid=uid,uname=uname,mainproductid=mainproductid,pid=unid1,vehicle_type=vehicle_type,brand_name=brand_name,
                                    category=category,product_name=product_name,quantity=quantity,perproduct_price=pprice,
                                    total_price=tot_price)
        retailer_buy.objects.filter(id=unid1).update(quantity=remaining_quantity)
        return redirect('upayment1')
    return render(request, 'user/userbuy_product.html',{'uniqueproduct':uniqueproduct})


def ucheckquantity(request):
    rpid = request.session['rpid']

    return render(request, 'user/ucheckquantity.html')

def ucheckquantity1(request):
    rpid = request.session['rpid']
    totalquantity1=request.session['totalquantity']
    return render(request, 'user/ucheckquantity1.html',{'totalquantity1':totalquantity1})

def upayment1(request):
    lastresult=user_buy.objects.all().last()
    unid=lastresult.id
    request.session['saleid'] =unid
    buyresult=user_buy.objects.filter(id=unid)
    return render(request, 'user/upayment1.html',{'buyresult':buyresult})

def upayment2(request,pk):
    uniquebuy=user_buy.objects.get(id=pk)
    punid=uniquebuy.id
    if request.method == "POST":
        card_number = request.POST.get('card_number')
        cvv = request.POST.get('cvv')
        holder_name = request.POST.get('holder_name')
        validity = request.POST.get('validity')
        user_buy.objects.filter(id=punid).update(cardnumber=card_number,cvv=cvv,card_holder=holder_name,validity_date=validity)

    return render(request, 'user/upayment2.html')