from CDMBuilder.Views.Login import threat_threat_action_map
from CDMBuilder.Models import model
def draw_threat_threat_action_map():
    print "Init Threat Threat Action Map"
    threat_ta_entities = model.threat_threat_action.objects.all()
    for row in threat_ta_entities:
        if row.threat_action not in threat_threat_action_map.keys():
            threat_threat_action_map[row.threat_action] = []
        if row.threat not in threat_threat_action_map[row.threat_action]:
            threat_threat_action_map[row.threat_action].append(row.threat)

draw_threat_threat_action_map()
print "Threat Threat Action Map %s" % (threat_threat_action_map)