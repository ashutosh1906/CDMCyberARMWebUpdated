import os
import SecurityControl,ThreatAction,Threat
import ProjectConfigFile
# SECURITY_CONTROL_FILE = '%s/%s/SecurityControls.csv' % (os.path.abspath(os.path.dirname(__file__)),ProjectConfigFile.RESOURCE_FOLDER)
# THREAT_ACTION_SECURITY_CONTROL_FILE = '%s/%s/ThreatActionSecurityControldistribution.csv' % (os.path.abspath(os.path.dirname(__file__)),ProjectConfigFile.RESOURCE_FOLDER)


def security_controls_list_builder(security_control_list,security_control_version_to_id):
    sc_file = open(ProjectConfigFile.SECURITY_CONTROL_FILE,'r+')
    start_index = 0
    for line in sc_file:
        line = line.replace('\n','')
        line = line.lower()
        line = line.split(ProjectConfigFile.SECURITY_CONTROL_FILE_PARSER_CHARACTER)
        security_control_list.append(SecurityControl.SecurityControl(start_index,line[ProjectConfigFile.VERSION_PLACE],line[ProjectConfigFile.SC_NAME_PLACE],
                                                                     line[ProjectConfigFile.KILL_CHAIN_PHASE_PLACE],line[ProjectConfigFile.ENFORCEMENT_LEVEL_PLACE],
                                                                     line[ProjectConfigFile.SEC_FUNC_PLACE],line[ProjectConfigFile.COST_PLACE]))
        security_control_version_to_id[line[0]] = start_index
        start_index += 1
    sc_file.close()

def reinitialize_security_control_list(security_control_list):
    """Create initial environment of the security control list for specific problem"""
    for security_control in security_control_list:
        security_control.re_init()

def threat_action_security_controls_builder(security_control_version_to_id,security_control_list,threat_action_list,threat_action_name_to_id):
    ta_sc_file = open(ProjectConfigFile.THREAT_ACTION_SECURITY_CONTROL_FILE,'r+')
    for line in ta_sc_file:
        line = line.replace('\n','')
        # print "Error Line %s" % (line)
        line = line.split(ProjectConfigFile.THREAT_ACTION_SECURITY_CONTROL_FILE_PARSER_CHARACTER)
        threat_action_name = line[ProjectConfigFile.THREAT_ACTION_NAME_PLACE].lower().strip()
        security_control_version = line[ProjectConfigFile.SEC_VERSION_PLACE]
        effectiveness = float(line[ProjectConfigFile.EFFECETIVENESS_PLACE])
        sec_control_obj = security_control_list[security_control_version_to_id[security_control_version]]
        if threat_action_name not in threat_action_name_to_id.keys():
            # print "Skip Threat Action Name %s" % (threat_action_name)
            continue
        # print "Threat Action name %s" % (threat_action_name)
        threat_action_obj = threat_action_list[threat_action_name_to_id[threat_action_name]]
        sec_control_obj.addThreatAction(threat_action_obj.primary_key,effectiveness)
        threat_action_obj.addSecurityControl(sec_control_obj.primary_key)
    ta_sc_file.close()

def threat_action_builder(prob_threat_action_threat,prob_threat_action_threat_experience,threat_action_list,threat_action_name_to_id,enterprise_asset_list_given,threat_action_id_to_name):
    """Create the threat action and link it to the appropriate threat given assets"""
    start_index = 0
    for asset in enterprise_asset_list_given:
        if asset in prob_threat_action_threat.keys():
            for threat in prob_threat_action_threat[asset].keys():
                for threat_action in prob_threat_action_threat[asset][threat].keys():
                    if threat_action == ProjectConfigFile.THREAT_ACTION_UNKNOWN_TAG:
                        continue
                    if threat_action not in threat_action_name_to_id.keys():
                        threat_action_name_to_id[threat_action] = start_index
                        threat_action_id_to_name[start_index] = threat_action
                        threat_action_list.append(ThreatAction.ThreatAction(start_index,threat_action))
                        threat_action_list[start_index].setProbThreatAction(prob_threat_action_threat,prob_threat_action_threat_experience,enterprise_asset_list_given)
                        start_index += 1
        else:
            for asset in prob_threat_action_threat_experience.keys():
                for threat in prob_threat_action_threat_experience[asset].keys():
                    for threat_action in prob_threat_action_threat_experience[asset][threat].keys():
                        if threat_action not in threat_action_name_to_id.keys():
                            threat_action_name_to_id[threat_action] = start_index
                            threat_action_id_to_name[start_index] = threat_action
                            threat_action_list.append(ThreatAction.ThreatAction(start_index, threat_action))
                            threat_action_list[start_index].setProbThreatAction(prob_threat_action_threat,prob_threat_action_threat_experience,enterprise_asset_list_given)
                            start_index += 1
    # print "Threat Action Name to ID Including Experience %s" % (threat_action_name_to_id)
    # for threat_action in threat_action_name_to_id:
    #     print "Threat Action Name %s" % (threat_action)
    #     print "\t \t Threat Action Id %s" %(threat_action_name_to_id[threat_action])
    #     print "\t \t Threat Action ID To Name %s" % (threat_action_id_to_name[threat_action_name_to_id[threat_action]])

def threat_builder(risk_threat,threat_list,threat_name_to_id,total_asset):
    # print "Risk %s" % (risk_threat)
    # print "Number of Asset %s" % (total_asset)
    threat_index = 0
    for i in range(len(risk_threat)):
        for j in range(len(risk_threat[i])):
            for threat in risk_threat[i][j].keys():
                if threat not in threat_name_to_id.keys():
                    threat_name_to_id[threat] = threat_index
                    threat_list.append(Threat.Threat(threat_index,threat,total_asset))
                    threat_list[threat_index].clearApplicableThreatActions()
                    threat_list[threat_index].addThreatImpact(risk_threat)
                    threat_index += 1
        # Utitilities.printThreat(threat_list,threat_name_to_id)

def prepare_threat_action_for_threat(threat_list,prob_threat_action_threat,prob_threat_action_threat_experience,asset_enterprise_list,
                                     threat_name_to_id,threat_action_name_to_id):
    # print "Enterprise Asset List %s" % (asset_enterprise_list)
    asset_index = 0
    for asset_type in range(len(asset_enterprise_list)):
        for asset_desc in asset_enterprise_list[asset_type]:
            asset_name = asset_desc[0]
            if asset_name in prob_threat_action_threat.keys():
                for threat in prob_threat_action_threat[asset_name].keys():
                    threat_list[threat_name_to_id[threat]].addAssetThreatActionDistribution(prob_threat_action_threat[asset_name][threat],
                                                                                            threat_action_name_to_id,asset_index)
            else:
                for threat in prob_threat_action_threat_experience[asset_name].keys():
                    threat_list[threat_name_to_id[threat]].addAssetThreatActionDistribution(prob_threat_action_threat_experience[asset_name][threat],
                                                                                            threat_action_name_to_id,asset_index)
            asset_index += 1

    for threat in threat_list:
        threat.determine_maximum_risk()

def parseAllScAndTAFiles(security_control_list,security_control_version_to_id,prob_threat_action_threat,prob_threat_action_threat_experience,
                         threat_action_list,threat_action_name_to_id,risk_threat,threat_list,threat_name_to_id,enterprise_asset_list_given,
                         threat_action_id_to_name,number_of_asset,asset_enterprise_list):
    # security_controls_list_builder(security_control_list,security_control_version_to_id)
    reinitialize_security_control_list(security_control_list)
    threat_action_builder(prob_threat_action_threat,prob_threat_action_threat_experience,threat_action_list,threat_action_name_to_id,enterprise_asset_list_given,threat_action_id_to_name)
    threat_action_security_controls_builder(security_control_version_to_id,security_control_list,threat_action_list,threat_action_name_to_id)
    threat_builder(risk_threat,threat_list,threat_name_to_id,number_of_asset)
    # print "Threat Statistics %s" % (prob_threat_action_threat)
    # print "Threat Action Name to ID : %s" % (threat_action_name_to_id)
    # print "Threat List %s" % (threat_list)
    prepare_threat_action_for_threat(threat_list,prob_threat_action_threat,prob_threat_action_threat_experience,asset_enterprise_list,threat_name_to_id,threat_action_name_to_id)

