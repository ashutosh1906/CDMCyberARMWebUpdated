from django.conf.urls import url
from CDMBuilder.Views.ThreatActionSecurityControl import Threat_action_security_control_Map

urlpatterns = [
    url(r'^generatereport/',Threat_action_security_control_Map.generate_sc_threat_action,name='generatereport'),
    url(r'', Threat_action_security_control_Map.insertThreatActions, name='threatAction'),

]