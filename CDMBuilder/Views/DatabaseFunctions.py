from CDMBuilder.CyberARMDeployed import ThreatThreatActionMapDatabase
from django.http import HttpResponse
from django.shortcuts import render
from CDMBuilder.Models import model
from CDMBuilder.Utilities import GlobalVariables
import json

def insertMapThreatThreatAction(request):
    print "Insert The Threat Threat Action Relationship"
    threat_threat_action_map = {}
    ThreatThreatActionMapDatabase.read_the_directory(threat_threat_action_map)
    # print "Threat Threat Action Map %s" % (threat_threat_action_map)
    for threat in threat_threat_action_map.keys():
        for threat_action in threat_threat_action_map[threat]:
            try:
                threat_threat_action_entity = model.threat_threat_action(threat=threat,threat_action=threat_action)
                threat_threat_action_entity.save()
            except:
                print "Exception in %s : %s" % (threat)
    return HttpResponse("Successful request")

def CSC_Classification(request):
    send_data = {}
    send_data['kc_phase'] = json.dumps(GlobalVariables.DATABASE_KILL_CHAIN_PHASE.keys())
    send_data['en_level'] = json.dumps(GlobalVariables.DATABASE_ENFORCEMENT_LEVEL.keys())
    send_data['sc_func'] = json.dumps(GlobalVariables.DATABASE_SECURITY_FUNCTION.keys())
    security_control_list = model.security_control.objects.all()
    sc_name_list = []
    sc_version_list = []
    for sc_obj in security_control_list:
        sc_name_list.append('%s (%s)'%(sc_obj.sc_name,sc_obj.sc_version))
        sc_version_list.append(sc_obj.sc_version)
    send_data['sc_name'] = json.dumps(sc_name_list)
    send_data['sc_version'] = json.dumps(sc_version_list)
    print "Send Data %s" % (send_data)
    return render(request,'insertCDMUpdated.html',send_data)