import ThreatStatisticsSingle,ThreatPrioritization,Utitilities,ProjectConfigFile
import ThreatActionToSecurityControl,CyberARMEngine

# write_output_file = open("CyberARMOutput",'w')
threat_threatAction_asset_veris = {}
asset_name_list = []
threat_threat_action_possible_pair = {}
prob_threat_action_threat = {}
prob_threat_threat_action = {}
prob_threat = {}

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
    threat_threatAction_asset = []
    prob_threat_threat_action_alternative = {}
    risk_threat = [[] for i in range(2)]
    risk_threat_action = [[] for i in range(2)]
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
    Utitilities.printAssetList(asset_enterprise_list)
    init_power_plant(asset_enterprise_list[ProjectConfigFile.VERIS_LIST],enterprise_asset_list_given)
    # ThreatStatisticsSingle.find_threat_statistics_all(threat_threatAction_asset_veris,asset_name_list,threat_threat_action_possible_pair)
    print "Threat Threat Action Asset Veris %s" % (threat_threatAction_asset_veris)
    # print "Asset List %s" % (asset_name_list)
    # print "Threat Threat Action Possible Pair %s" % (threat_threat_action_possible_pair)
    threat_threatAction_asset.append(threat_threatAction_asset_veris)
    # Utitilities.printNumberStatisticsThreatThreatAction(threat_threatAction_asset)
    print "Asset Statistics %s" % (threat_threatAction_asset[0])
    # print "asset list %s" % (asset_name_list)
    # print "Threat Threat Action Possible Pair %s" % (threat_threat_action_possible_pair)

    ################################ Threat Prioritization ####################################################################
    ThreatPrioritization.threat_prioritization_main(prob_threat,prob_threat_threat_action,prob_threat_threat_action_alternative,prob_threat_action_threat,risk_threat_action[ProjectConfigFile.VERIS_LIST],risk_threat[ProjectConfigFile.VERIS_LIST],threat_threatAction_asset[0],asset_enterprise_list[0])
    print "Threat Statistics %s" % (prob_threat_action_threat)

    ######################################################### Check the output ##############################################################################
    # Utitilities.printAllStatistics(prob_threat,threat_threatAction_asset[0],prob_threat_action_threat,threat_threat_action_possible_pair)
    # Utitilities.printAllStatisticsGivenAssets(prob_threat, threat_threatAction_asset, prob_threat_action_threat,threat_threat_action_possible_pair,enterprise_asset_list_given)
    # Utitilities.printNumberStatisticsThreatThreatActionWithProb(prob_threat,threat_threatAction_asset,prob_threat_action_threat)
    # Utitilities.printThreatThreatActionStatistics(threat_threatAction_asset[0],prob_threat_threat_action)
    # Utitilities.printThreatImpact()
    Utitilities.printRiskThreatThreatAction(risk_threat_action[ProjectConfigFile.VERIS_LIST],risk_threat[ProjectConfigFile.VERIS_LIST],enterprise_asset_list_given)
    # Utitilities.printKillChainPhases(enterprise_asset_list_given)

    ########################################################## List of Security Controls, Threat Action and Mappings ##########################################
    ThreatActionToSecurityControl.parseAllScAndTAFiles(security_control_list,security_control_version_to_id,prob_threat_action_threat,threat_action_list,threat_action_name_to_id,risk_threat[0],threat_list,threat_name_to_id,enterprise_asset_list_given)
    # Utitilities.printSecurityControls(security_control_list,security_control_version_to_id)
    # Utitilities.printThreatActionList(threat_action_list,threat_action_name_to_id)
    # Utitilities.printSecurityControlThreatmapping(security_control_list,security_control_version_to_id,threat_action_list)
    # Utitilities.printThreatSecurityControlMapping(threat_action_list,threat_action_name_to_id,security_control_list,risk_threat_action,enterprise_asset_list_given)

    recommendedCDM = CyberARMEngine.select_security_controls(security_control_list,threat_action_list,threat_action_name_to_id,risk_threat_action[0],asset_enterprise_list[0],threat_list,threat_name_to_id,affordable_risk,budget)
    # write_output_file.close()
    return recommendedCDM