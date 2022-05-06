from django.db import models

# Create your models here.
class product1(models.Model):
    id = models.AutoField(primary_key=True)
    vehicle_type=models.CharField(max_length=300)
    brand_name = models.CharField(max_length=300)
    category = models.CharField(max_length=300)
    pname = models.CharField(max_length=300)
    quantity = models.CharField(max_length=300)
    product_image = models.FileField()
    price = models.CharField(max_length=300)
    mstatus = models.CharField(max_length=300)
    pstatus = models.CharField(max_length=300)
