from CyberARMPowerPlant import prob_threat,prob_threat_action_threat
import ThreatPrioritization,ProjectConfigFile,ThreatPrioritizationExperience
from z3 import *
import time


def make_comparator(less_than):
    def compare(x, y):
        if less_than(x, y):
            return -1
        elif less_than(y, x):
            return 1
        else:
            return 0
    return compare

def printGlobalRiskThreatAction(risk_threat_action_distribution):
    print "Global Risk Threat Action structured as :(Consequence, Asset Index, Threat Action Name)"
    for threat_action_row in risk_threat_action_distribution:
        print "\t %s" %(threat_action_row)

def generate_risk_distribution(asset_enterprise_list,risk_elimination,global_risk_threat_action):
    print "Risk Elimination Value: %s"%(risk_elimination)
    if risk_elimination == 0:
        return -1
    # global_risk_threat_action = []
    risk_threat_action_distribution = [[] for i in range(2)]
    risk_threat_distribution = [[] for i in range(2)]
    ThreatPrioritization.calculateRisk(prob_threat,prob_threat_action_threat,asset_enterprise_list[ProjectConfigFile.VERIS_LIST],risk_threat_action_distribution[ProjectConfigFile.VERIS_LIST],risk_threat_distribution[ProjectConfigFile.VERIS_LIST])
    # print "Risk Threat Action %s" % (risk_threat_action_distribution)
    prob_threat_action_threat_experience = {}
    prob_threat_threat_action_experience = {}
    prob_threat_experience = {}
    ThreatPrioritizationExperience.threat_prioritization_main(prob_threat_experience,prob_threat_threat_action_experience,prob_threat_action_threat_experience,risk_threat_action_distribution[ProjectConfigFile.EXPERIENCE_LIST],risk_threat_distribution[ProjectConfigFile.EXPERIENCE_LIST],asset_enterprise_list[ProjectConfigFile.EXPERIENCE_LIST])
    asset_index = 0
    for i in range(len(risk_threat_action_distribution)):
        for j in range(len(risk_threat_action_distribution[i])):
            print "Risk (%s,%s) : %s" % (i,j,risk_threat_action_distribution[i][j])
            for ta in risk_threat_action_distribution[i][j].keys():
                global_risk_threat_action.append([risk_threat_action_distribution[i][j][ta],asset_index,ta])
            asset_index += 1
    # printGlobalRiskThreatAction(global_risk_threat_action)
    global_risk_threat_action.sort(reverse=True)
    print "Risk Threat Action %s" % (global_risk_threat_action)
    printGlobalRiskThreatAction(global_risk_threat_action)
    risk_length = len(global_risk_threat_action)
    print "Length %s" % (risk_length)
    total_risk_value = sum([global_risk_threat_action[i][0] for i in range(risk_length)])
    print "Total Risk %s" % (total_risk_value)
    current_risk = 0.0
    start_index = 0
    prev_risk_percentage = 0.0
    while start_index < risk_length:
        current_risk += global_risk_threat_action[start_index][0]
        current_risk_percentage = current_risk/total_risk_value
        if risk_elimination == current_risk_percentage:
            print "Equal to Threat Action Number %s" % (start_index)
            return start_index+1
        if prev_risk_percentage < risk_elimination < current_risk_percentage:
            print "In Between %s" % (start_index)
            if abs(risk_elimination-prev_risk_percentage) >= abs(risk_elimination-current_risk_percentage):
                return start_index+1
            else:
                return start_index
        prev_risk_percentage = current_risk_percentage
        start_index += 1
    return start_index