from CDMBuilder.Views.Login import threat_threat_action_map
from CDMBuilder.Models import model
from CyberARMPowerPlant import threat_threat_action_possible_pair,asset_name_list,threat_threatAction_asset_veris,prob_threat_action_threat,prob_threat,prob_threat_threat_action,security_control_list,security_control_version_to_id
import ThreatStatisticsSingle
import ThreatPrioritization,ThreatActionToSecurityControl

def draw_threat_threat_action_map():
    print "Init Threat Threat Action Map"
    threat_ta_entities = model.threat_threat_action.objects.all()
    for row in threat_ta_entities:
        if row.threat_action not in threat_threat_action_map.keys():
            threat_threat_action_map[row.threat_action] = []
        if row.threat not in threat_threat_action_map[row.threat_action]:
            threat_threat_action_map[row.threat_action].append(row.threat)

def read_threat_reports():
    ThreatStatisticsSingle.find_threat_statistics_all(threat_threatAction_asset_veris, asset_name_list,
                                                      threat_threat_action_possible_pair)
    ThreatPrioritization.calculate_threatAction_threat_prob_distribution(prob_threat, prob_threat_action_threat, threat_threatAction_asset_veris)
    ThreatPrioritization.calculate_threat_threatAction_prob_distribution(prob_threat_threat_action, threat_threatAction_asset_veris)


draw_threat_threat_action_map()
print "Threat Threat Action Map %s" % (threat_threat_action_map)
read_threat_reports()
print "(Init) Threat Threat Action Asset Veris %s" % (threat_threatAction_asset_veris)
print "(Init) Asset List %s" % (asset_name_list)
print "(Init) Threat Threat Action Possible Pair %s" % (threat_threat_action_possible_pair)

################################################ Initialize The Configuration & Security Control List #######################################
ProjectConfigFile.init_conf()
ThreatActionToSecurityControl.security_controls_list_builder(security_control_list,security_control_version_to_id)