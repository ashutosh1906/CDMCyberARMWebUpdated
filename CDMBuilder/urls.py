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
from django.conf.urls import url,include
from django.contrib import admin
import threat_acion_security_control_url
from Views import Login,DatabaseFunctions

urlpatterns = [

    url(r'^admin/', admin.site.urls),
    url(r'^home/',Login.loginPost,name='home'),
    url(r'^display/', Login.cdmDisplaySecurityControl, name='display'),
    url(r'^insert/',Login.cdmInsertSecurityControl,name='insert'),
    # url(r'^threatAction/',Login.insertThreatActions,name='threatAction'),
    # url(r'^threatAction/',Threat_action_security_control_Map.insertThreatActions,name='threatAction'),
    url(r'^threatAction/',include(threat_acion_security_control_url)),
    url(r'^generateCDM/',Login.generate_CDM,name='generateCDM'),
    # url(r'^generatereport/',Login.generate_sc_threat_action,name='generatereport'),
    url(r'^cyberARM Old/',Login.cyberARM_request,name='cyberARM Old'),
    url(r'^cyberARM/',Login.cyberARM_request_updated_compact,name='cyberARM'),
    url(r'^refreshDatabase/',DatabaseFunctions.insertMapThreatThreatAction,name='TTA'),
    url(r'^csc_classification/',DatabaseFunctions.CSC_Classification,name='csc_classification'),
    url(r'^edit_csc_classification/',DatabaseFunctions.edit_CSC_Classification,name='edit_csc_classification'),
    url(r'^remove_csc_classification/',DatabaseFunctions.removeCSCClassification,name='removeCSCClassification'),
    url(r'^threatActionKillChainPhaseMapping/',Login.ThreatActionKCPhaseMapping,name='threatActionKillChainPhaseMapping'),
    url(r'^ta_distribution/',Login.threat_action_distribution,name='Threat Action Distribution'),
    url(r'',Login.login,name='login'),
]
