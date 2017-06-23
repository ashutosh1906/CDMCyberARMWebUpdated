import ThreatStatisticsSingle,ThreatPrioritization,Utitilities,ProjectConfigFile
import ThreatActionToSecurityControl,CyberARMEngine

# write_output_file = open("CyberARMOutput",'w')

def init_power_plant(asset_enterprise_list,enterprise_asset_list_given):
    for asset in asset_enterprise_list:
        asset_name = asset[0]
        if asset_name not in enterprise_asset_list_given:
            enterprise_asset_list_given.append(asset_name)
    ProjectConfigFile.init_conf()

def cyberarm_init_main(asset_enterprise_list_input,affordable_risk,budget):
    print "The Power Plant has started :: Affordable Risk --> %s Budget --> %s" % (affordable_risk,budget)
    asset_enterprise_list = asset_enterprise_list_input
    ###################################################################################### GLobal Variables ############################################################
    threat_threatAction_asset = {}
    asset_name_list = []
    prob_threat_action_threat = {}
    prob_threat_threat_action = {}
    prob_threat_threat_action_alternative = {}
    prob_threat = {}
    risk_threat = []
    risk_threat_action = []
    threat_threat_action_possible_pair = {}
    security_control_list = []
    security_control_version_to_id = {}
    threat_action_list = []
    threat_action_name_to_id = {}
    threat_list = []
    threat_name_to_id = {}
    ###################################################################################### End GLobal Variables ############################################################

    ###################################################################################### Inputs #######################################################################
    enterprise_asset_list_given = []
    ##################################################################################### End of Inputs #################################################################

    init_power_plant(asset_enterprise_list,enterprise_asset_list_given)
    ThreatStatisticsSingle.find_threat_statistics_all(threat_threatAction_asset,asset_name_list,threat_threat_action_possible_pair)
    # Utitilities.printNumberStatisticsThreatThreatAction(threat_threatAction_asset)
    # print "Asset Statistics %s" % (threat_threatAction_asset)
    # print "asset list %s" % (asset_name_list)

    ################################ Threat Prioritization ####################################################################
    ThreatPrioritization.threat_prioritization_main(prob_threat,prob_threat_threat_action,prob_threat_threat_action_alternative,prob_threat_action_threat,risk_threat_action,risk_threat,threat_threatAction_asset,asset_enterprise_list)
    # print "Threat Statistics %s" % (prob_threat_action_threat)

    ######################################################### Check the output ##############################################################################
    # Utitilities.printAllStatistics(prob_threat,threat_threatAction_asset,prob_threat_action_threat,threat_threat_action_possible_pair)
    # Utitilities.printAllStatisticsGivenAssets(prob_threat, threat_threatAction_asset, prob_threat_action_threat,threat_threat_action_possible_pair,enterprise_asset_list_given)
    # Utitilities.printNumberStatisticsThreatThreatActionWithProb(prob_threat,threat_threatAction_asset,prob_threat_action_threat)
    # Utitilities.printThreatThreatActionStatistics(threat_threatAction_asset,prob_threat_threat_action)
    # Utitilities.printThreatImpact()
    # Utitilities.printRiskThreatThreatAction(risk_threat_action,risk_threat,enterprise_asset_list_given)
    # Utitilities.printKillChainPhases(enterprise_asset_list_given)

    ########################################################## List of Security Controls, Threat Action and Mappings ##########################################
    ThreatActionToSecurityControl.parseAllScAndTAFiles(security_control_list,security_control_version_to_id,prob_threat_action_threat,threat_action_list,threat_action_name_to_id,risk_threat,threat_list,threat_name_to_id,enterprise_asset_list_given)
    # Utitilities.printSecurityControls(security_control_list,security_control_version_to_id)
    # Utitilities.printThreatActionList(threat_action_list,threat_action_name_to_id)
    # Utitilities.printSecurityControlThreatmapping(security_control_list,security_control_version_to_id,threat_action_list)
    # Utitilities.printThreatSecurityControlMapping(threat_action_list,threat_action_name_to_id,security_control_list,risk_threat_action,enterprise_asset_list_given)

    recommendedCDM = CyberARMEngine.select_security_controls(security_control_list,threat_action_list,threat_action_name_to_id,risk_threat_action,asset_enterprise_list,threat_list,threat_name_to_id,affordable_risk,budget)
    # write_output_file.close()
    return recommendedCDM