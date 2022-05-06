"""supply_chain URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from django.urls import path
from manufacturer import views as manufacturerviews
from providers import views as providersviews
from wholesalers import views as wholesalersviews
from retailers import views as retailersviews
from projectadmin import views as projectadminviews
from user import views as userviews
from supply_chain import settings
from django.conf.urls.static import static
urlpatterns = [
    path('admin/', admin.site.urls),
    url('^$',manufacturerviews.manufacturer_index, name="manufacturer_index"),
    url(r'^about_us/$',manufacturerviews.about_us,name='about_us'),
    url(r'^services/$',manufacturerviews.services,name='services'),
    url(r'^contact/$',manufacturerviews.contact,name='contact'),
    url(r'^manufacturer_login/$',manufacturerviews.manufacturer_login,name='manufacturer_login'),
    url(r'^manufacturer_register/$',manufacturerviews.manufacturer_register,name='manufacturer_register'),
    url(r'^manufacturer_home/$',manufacturerviews.manufacturer_home,name='manufacturer_home'),
    url(r'^view_demandproduct/$',manufacturerviews.view_demandproduct,name='view_demandproduct'),
    url(r'^update_product/(?P<pk>\d+)/$',manufacturerviews.update_product,name='update_product'),

    url(r'^providers_login/$',providersviews.providers_login,name='providers_login'),
    url(r'^provider_home/$',providersviews.provider_home,name='provider_home'),
    url(r'^release_product/(?P<pk>\d+)/$',providersviews.release_product,name="release_product"),

    url(r'^wholesalers_login/$',wholesalersviews.wholesalers_login,name='wholesalers_login'),
    url(r'^wholesaler_register/$',wholesalersviews.wholesaler_register,name='wholesaler_register'),
    url(r'^wholesaler_home/$',wholesalersviews.wholesaler_home,name='wholesaler_home'),
    url(r'^wbuy_product/(?P<pk>\d+)/$',wholesalersviews.wbuy_product,name="wbuy_product"),
    url(r'^payment1/$',wholesalersviews.payment1,name="payment1"),
    url(r'^payment2/(?P<pk>\d+)/$',wholesalersviews.payment2,name="payment2"),
    url(r'^wcheckquantity/$',wholesalersviews.wcheckquantity,name="wcheckquantity"),
    url(r'^wcheckquantity1/$',wholesalersviews.wcheckquantity1,name="wcheckquantity1"),
    url(r'^wproduct_request/$',wholesalersviews.wproduct_request,name="wproduct_request"),
    url(r'^wsend_request/(?P<pk>\d+)/$',wholesalersviews.wsend_request,name="wsend_request"),
    url(r'^sale_product/$',wholesalersviews.sale_product,name="sale_product"),
    url(r'^view_retailerrequest/$',wholesalersviews.view_retailerrequest,name="view_retailerrequest"),
    url(r'^sendto_manufacturer/(?P<pk>\d+)/$',wholesalersviews.sendto_manufacturer,name="sendto_manufacturer"),


    url(r'^retailers_login/$',retailersviews.retailers_login,name='retailers_login'),
    url(r'^retailers_register/$',retailersviews.retailers_register,name='retailers_register'),
    url(r'^retailers_home/$',retailersviews.retailers_home,name='retailers_home'),
    url(r'^rbuy_product/(?P<pk>\d+)/$',retailersviews.rbuy_product,name='rbuy_product'),
    url(r'^rcheckquantity/$',retailersviews.rcheckquantity,name="rcheckquantity"),
    url(r'^rcheckquantity1/$',retailersviews.rcheckquantity1,name="rcheckquantity1"),
    url(r'^rpayment1/$',retailersviews.rpayment1,name="rpayment1"),
    url(r'^rpayment2/(?P<pk>\d+)/$',retailersviews.rpayment2,name="rpayment2"),
    url(r'^rsale_product/$',retailersviews.rsale_product,name="rsale_product"),
    url(r'^rproduct_request/$',retailersviews.rproduct_request,name="rproduct_request"),
    url(r'^rsend_request/(?P<pk>\d+)/$',retailersviews.rsend_request,name="rsend_request"),
    url(r'^rview_demand/$',retailersviews.rview_demand,name="rview_demand"),
    url(r'^sendto_whole/(?P<pk>\d+)/$',retailersviews.sendto_whole,name="sendto_whole"),

    url(r'^admin_login/$', projectadminviews.admin_login, name='admin_login'),
    url(r'^admin_home/$', projectadminviews.admin_home, name='admin_home'),
    url(r'^retailer_details/$', projectadminviews.retailer_details, name='retailer_details'),
    url(r'^view_product/$', projectadminviews.view_product, name='view_product'),
    url(r'^wholesaler_payment/$', projectadminviews.wholesaler_payment, name='wholesaler_payment'),
    url(r'^retailer_payment/$', projectadminviews.retailer_payment, name='retailer_payment'),

    url(r'^user_login/$',userviews.user_login,name='user_login'),
    url(r'^user_register/$',userviews.user_register,name='user_register'),
    url(r'^user_home/$',userviews.user_home,name='user_home'),
    url(r'^userbuy_product/(?P<pk>\d+)/$',userviews.userbuy_product,name='userbuy_product'),
    url(r'^ucheckquantity/$',userviews.ucheckquantity,name="ucheckquantity"),
    url(r'^ucheckquantity1/$',userviews.ucheckquantity1,name="ucheckquantity1"),
    url(r'^upayment1/$',userviews.upayment1,name="upayment1"),
    url(r'^upayment2/(?P<pk>\d+)/$',userviews.upayment2,name="upayment2"),

]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
