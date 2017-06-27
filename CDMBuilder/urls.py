"""CDMBuilder URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from Views import Login,DatabaseFunctions

urlpatterns = [

    url(r'^admin/', admin.site.urls),
    url(r'^home/',Login.loginPost,name='home'),
    url(r'^display/', Login.cdmDisplaySecurityControl, name='display'),
    url(r'^insert/',Login.cdmInsertSecurityControl,name='insert'),
    url(r'^threatAction/',Login.insertThreatActions,name='threatAction'),
    url(r'^generateCDM/',Login.generate_CDM,name='generateCDM'),
    url(r'^generatereport/',Login.generate_sc_threat_action,name='generatereport'),
    url(r'^cyberARM Old/',Login.cyberARM_request,name='cyberARM Old'),
    url(r'^cyberARM/',Login.cyberARM_request_updated,name='cyberARM'),
    url(r'^refreshDatabase/',DatabaseFunctions.insertMapThreatThreatAction,name='TTA'),
    url(r'',Login.login,name='login'),
]
