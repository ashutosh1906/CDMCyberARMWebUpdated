from CDMBuilder.CyberARMDeployed import ThreatThreatActionMapDatabase
from django.http import HttpResponse
from django.shortcuts import render
from CDMBuilder.Models import model
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
    return render(request,'insertCDMUpdated.html')