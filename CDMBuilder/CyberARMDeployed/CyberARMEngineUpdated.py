from CyberARMPowerPlant import prob_threat,prob_threat_action_threat
import ThreatPrioritization,ProjectConfigFile,ThreatPrioritizationExperience
from z3 import *
import time

def generate_risk_distribution(asset_enterprise_list):
    global_risk_threat_action = []
    risk_threat_action_distribution = [[] for i in range(2)]
    risk_threat_distribution = [[] for i in range(2)]
    ThreatPrioritization.calculateRisk(prob_threat,prob_threat_action_threat,asset_enterprise_list[ProjectConfigFile.VERIS_LIST],risk_threat_action_distribution[ProjectConfigFile.VERIS_LIST],risk_threat_distribution[ProjectConfigFile.VERIS_LIST])
    # print "Risk Threat Action %s" % (risk_threat_action_distribution)
    prob_threat_action_threat_experience = {}
    prob_threat_threat_action_experience = {}
    prob_threat_experience = {}
    ThreatPrioritizationExperience.threat_prioritization_main(prob_threat_experience,prob_threat_threat_action_experience,prob_threat_action_threat_experience,risk_threat_action_distribution[ProjectConfigFile.EXPERIENCE_LIST],risk_threat_distribution[ProjectConfigFile.EXPERIENCE_LIST],asset_enterprise_list[ProjectConfigFile.EXPERIENCE_LIST])
    for i in range(len(risk_threat_action_distribution)):
        for j in range(len(risk_threat_action_distribution[i])):
            print "Risk %s : %s" % (i,risk_threat_action_distribution[i][j])
            for ta in risk_threat_action_distribution[i][j].keys():
                global_risk_threat_action.append(risk_threat_action_distribution[i][j][ta])
    global_risk_threat_action.sort(reverse=True)
    print "Risk Threat Action %s" % (global_risk_threat_action)
    print "Global Risk %s Total length %s" % (sum(global_risk_threat_action),len(global_risk_threat_action))