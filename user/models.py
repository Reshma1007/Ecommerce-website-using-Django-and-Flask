from django.db import models

# Create your models here.
class user_reg(models.Model):
    id = models.AutoField(primary_key=True)
    fname=models.CharField(max_length=300)
    lname = models.CharField(max_length=300)
    email=models.CharField(max_length=200)
    phone=models.CharField(max_length=200)
    uname = models.CharField(max_length=200)
    password=models.CharField(max_length=400)


class user_buy(models.Model):
    id = models.AutoField(primary_key=True)
    uid=models.CharField(max_length=300)
    uname=models.CharField(max_length=300)
    mainproductid=models.CharField(max_length=300)
    pid = models.CharField(max_length=300)
    vehicle_type = models.CharField(max_length=300)
    brand_name=models.CharField(max_length=200)
    category=models.CharField(max_length=200)
    product_name = models.CharField(max_length=200)
    quantity=models.CharField(max_length=400)
    perproduct_price = models.CharField(max_length=400)
    total_price = models.CharField(max_length=400)
    update_price = models.CharField(max_length=400)
    cardnumber = models.CharField(max_length=400)
    cvv = models.CharField(max_length=400)
    card_holder = models.CharField(max_length=400)
    validity_date = models.CharField(max_length=400)
