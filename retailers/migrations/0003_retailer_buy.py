# Generated by Django 2.0.5 on 2021-03-12 10:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('retailers', '0002_auto_20210310_1220'),
    ]

    operations = [
        migrations.CreateModel(
            name='retailer_buy',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('rid', models.CharField(max_length=300)),
                ('rname', models.CharField(max_length=300)),
                ('mainproductid', models.CharField(max_length=300)),
                ('pid', models.CharField(max_length=300)),
                ('vehicle_type', models.CharField(max_length=300)),
                ('brand_name', models.CharField(max_length=200)),
                ('category', models.CharField(max_length=200)),
                ('product_name', models.CharField(max_length=200)),
                ('quantity', models.CharField(max_length=400)),
                ('perproduct_price', models.CharField(max_length=400)),
                ('total_price', models.CharField(max_length=400)),
                ('update_price', models.CharField(max_length=400)),
                ('cardnumber', models.CharField(max_length=400)),
                ('cvv', models.CharField(max_length=400)),
                ('card_holder', models.CharField(max_length=400)),
                ('validity_date', models.CharField(max_length=400)),
                ('product_price', models.CharField(max_length=400)),
            ],
        ),
    ]
