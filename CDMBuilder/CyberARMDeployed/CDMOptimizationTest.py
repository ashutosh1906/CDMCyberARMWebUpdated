from z3 import *
import ProjectConfigFile, Utitilities
def SMT_Environment(security_control_list,selected_security_controls,threat_action_name_list,threat_action_list,
                    threat_action_id_list_for_all_assets,threat_id_for_all_assets,threat_list,asset_enterprise_list,affordable_risk,budget):
    # print selected_security_controls
    # print threat_action_name_list
    # print threat_action_id_list_for_all_assets
    # print threat_id_for_all_assets

    #########################################  Create the environment for all the selected security controls ##############################
    for asset_index in range(len(selected_security_controls)):
        for sec_control in selected_security_controls[asset_index]:
            security_control_list[sec_control].prepare_global_asset_threat_action_list(threat_action_id_list_for_all_assets)

    print "############################################ Security Controls Properties ########################################################"
    for asset_index in range(len(selected_security_controls)):
        for sec_control in selected_security_controls[asset_index]:
            security_control_list[sec_control].printGlobalAssetThreatActionProperties()

    ########################################## Create the environment for all the threat action #############################################

    for asset_index in range(len(threat_action_id_list_for_all_assets)):
        for threat_action in threat_action_id_list_for_all_assets[asset_index]:
            threat_action_list[threat_action].prepare_global_asset_applicable_security_controls(selected_security_controls)

    print "############################################ Threat Action Properties ########################################################"
    for asset_index in range(len(threat_action_id_list_for_all_assets)):
        for threat_action in threat_action_id_list_for_all_assets[asset_index]:
            threat_action_list[threat_action].printGlobalAssetThreatActionProperties()

    ################################################## Create the environment for threat properties ####################################
    for asset_index in range(len(threat_id_for_all_assets)):
        for threat in threat_id_for_all_assets[asset_index]:
            threat_list[threat].globalCreateAssetThreatAction(threat_action_id_list_for_all_assets,asset_enterprise_list,threat_action_list)

    for threat in threat_list:
            threat.considerResidualThreatAction()

    print "########################################## Threat Properties ########################################################"
    for threat in threat_list:
            threat.printGlobalProperties()

    ############################################################ Give rank to threat action ##########################################
    threat_action_id_to_position_roll = []
    for asset_index in range(len(threat_id_for_all_assets)):
        threat_action_id_to_position_roll.append({})
        num_threat_action = 0
        for threat_action_id in threat_action_id_list_for_all_assets[asset_index]:
            threat_action_id_to_position_roll[asset_index][threat_action_id] = num_threat_action
            num_threat_action += 1
    print threat_action_id_to_position_roll

    ############################################################ Give rank to threat ##########################################
    threat_id_to_position_roll = []
    for asset_index in range(len(threat_id_for_all_assets)):
        threat_id_to_position_roll.append({})
        num_threat_action = 0
        for threat_id in threat_id_for_all_assets[asset_index]:
            threat_id_to_position_roll[asset_index][threat_id] = num_threat_action
            num_threat_action += 1
    print threat_id_to_position_roll

    ####################################################### Determine the minimum value of the Affordable Risk ##################
    global_estimated_risk = 0
    for threat in threat_list:
        for asset_index in range(len(threat.maximum_risk)):
            global_estimated_risk += threat.maximum_risk[asset_index]
    print "Estimated Risk %s" % (global_estimated_risk)

    ###################################################### Design All Heuristics Here ############################################
    ###################################################### 1.1 Minimum Affordable Risk ###########################################

    minimum_affordable_risk = []
    minimum_threat_specific_risk = []
    print "******************************** Minimum Affordable Risk *************************************************"
    asset_index = 0
    for i in range(len(asset_enterprise_list)):
        for j in range(len(asset_enterprise_list[i])):
            minimum_affordable_risk.append(0.0)
            minimum_threat_specific_risk.append([1 for threat in threat_id_for_all_assets[asset_index]])
            # print "Security Controls %s" % (selected_security_controls[asset_index])
            # print "Threat Action %s" % (threat_action_id_list_for_all_assets[asset_index])
            # print "Threat Action Roll %s" % (threat_action_id_to_position_roll[asset_index])
            # print "Threat ID %s" % (threat_id_for_all_assets[asset_index])
            threat_action_survive = [1.0 for i in threat_action_id_list_for_all_assets[asset_index]]
            for sec_id in selected_security_controls[asset_index]:
                # print "Security Control %s : %s" % (sec_id,security_control_list[sec_id].primary_key)
                # print "Threat Action %s" % (security_control_list[sec_id].global_asset_threat_action_list[asset_index])
                # print "Effectiveness %s" % (security_control_list[sec_id].threat_action_effectiveness)
                for threat_action_id in security_control_list[sec_id].global_asset_threat_action_list[asset_index]:
                    threat_action_survive[threat_action_id_to_position_roll[asset_index][threat_action_id]] *= (1
                                                                                                          -security_control_list[sec_id].threat_action_effectiveness[threat_action_id])

            # print "Threat Action Survive %s" % (threat_action_survive)
            # print "All Threats %s" % (threat_id_for_all_assets[asset_index])
            # print "Threat Index %s" % (threat_id_to_position_roll[asset_index])
            for threat_id in threat_id_for_all_assets[asset_index]:
                # print "Threat ID %s : Ignored %s" % (threat_list[threat_id].primary_key,threat_list[threat_id].ignored_threat_action[asset_index])
                # print "Threat Action %s" % (threat_list[threat_id].global_asset_threat_action[asset_index])
                # print "Threat Action Prob %s" % (threat_list[threat_id].global_asset_threat_action_prob[asset_index])
                # print "Threat Action Position %s" % (threat_list[threat_id].global_threat_action_id_to_place_map[asset_index])
                # print "Threat Action Index %s" % (threat_action_id_list_for_all_assets[asset_index])
                # print "Threat Action ID to Position %s" % (threat_action_id_to_position_roll[asset_index])
                threat_index = threat_id_to_position_roll[asset_index][threat_id]
                minimum_threat_specific_risk[asset_index][threat_index] = 1-threat_list[threat_id].ignored_threat_action[asset_index]
                for threat_action_id in threat_list[threat_id].global_asset_threat_action[asset_index]:
                    minimum_threat_specific_risk[asset_index][threat_index] \
                        *= (1-threat_action_survive[threat_action_id_to_position_roll[asset_index][threat_action_id]]*
                            threat_list[threat_id].global_asset_threat_action_prob[asset_index][threat_list[threat_id].global_threat_action_id_to_place_map[asset_index][threat_action_id]])
                minimum_threat_specific_risk[asset_index][threat_index] = (1-minimum_threat_specific_risk[asset_index][threat_index])*\
                                                                          threat_list[threat_id].threat_impact_asset[asset_index]
            minimum_affordable_risk[asset_index] = sum(minimum_threat_specific_risk[asset_index])
            asset_index += 1

    asset_index = 0
    for i in range(len(asset_enterprise_list)):
        for j in range(len(asset_enterprise_list[i])):
            print "Minimum Threat Specific Risk %s" % (minimum_threat_specific_risk[asset_index])
            print "Minimum Affordable Risk %s" % (minimum_affordable_risk[asset_index])
            asset_index += 1
    print "Global Minimum Risk %s" % (sum(minimum_affordable_risk))

    asset_list_for_smt = []
    for i in range(len(asset_enterprise_list)):
        for j in range(len(asset_enterprise_list[i])):
            asset_list_for_smt.append(asset_enterprise_list[i][j])

    Utitilities.printAssetList(asset_list_for_smt)
    print "Selected Threat Action %s" % (threat_action_id_list_for_all_assets)
    print "Threat Action Roll %s" % (threat_action_id_to_position_roll)
    print "Selected Security Controls %s" % (selected_security_controls)
    print "Selected Threat %s" % (threat_id_for_all_assets)
    print "Threat Roll %s" % (threat_id_to_position_roll)
    ###################################################### End of Design of All Heuristics Here ############################################
    ############################################################ Set SMT Environment ####################################################
    set_option(rational_to_decimal=True)
    set_option(precision=30)
    ############################################################ End SMT Environment ####################################################

    ############################################################ Declare SMT Solver #####################################################
    # cyberARM = Solver()
    cyberARM = Optimize()
    ############################################################ End Declare SMT Solver #################################################

    ############################################################ 1. Declare the variables #################################################
    ############################################################ 1.1 Declare the boolean and cost variables #######################################
    smt_Security_Control_Bool = [[Bool('sec_con_%s_%s' % (i,j)) for j in selected_security_controls[i]] for i in range(len(asset_list_for_smt))]
    print "SMT Security Control Bool %s" %(smt_Security_Control_Bool)

    smt_Security_Control_Cost = [[Real('sec_con_cost_%s_%s'%(i,j))for j in selected_security_controls[i]] for i in range(len(selected_security_controls))]
    print "SMT Security Controls Cost %s" % (smt_Security_Control_Cost)
    smt_Total_Security_Control_Cost = [Real('smt_total_sc_cost_%s'%(asset[0])) for asset in asset_list_for_smt]
    smt_Global_Security_Control_Cost = Real('smt_Global_Security_Control_Cost')
    ############################################################ 1.2 Declare the threat variables #######################################
    smt_Threat = [[Real('Th_%s_%s'%(i,j)) for j in threat_id_for_all_assets[i]] for i in range(len(threat_id_for_all_assets))]
    print "SMT Threat %s" % (smt_Threat)

    smt_Threat_Threat_Action_Defense_Success = [[[Real('th_ta_%s_%s_%s'%(i,j,k)) for k in threat_list[j].global_asset_threat_action[i]] for j in threat_id_for_all_assets[i]] for i in range(len(threat_id_for_all_assets))]
    print "SMT THreat Threat Action Defense Success %s" % (smt_Threat_Threat_Action_Defense_Success)
    # for i in threat_list:
    #     print "Threat Impact %s: %s" % (i.primary_key,i.threat_impact_asset)

    ############################################################ 1.3 Declare Threat Action Success Variables#####################################
    smt_Threat_Action_Success = [[Real('t_a_%s_%s'%(i,j)) for j in threat_action_id_list_for_all_assets[i]] for i in range(len(threat_action_id_list_for_all_assets))]
    print "SMT Threat Action Success %s" % (smt_Threat_Action_Success)

    ############################################################ 1.4 Declare Threat Action Security Control Variables ############################
    smt_Threat_Action_Security_Control = [[
        [Real('t_a_s_c_%s_%s_%s'%(i,j,k)) for k in threat_action_list[j].global_asset_applicable_security[i]]
        for j in threat_action_id_list_for_all_assets[i]]
        for i in range(len(threat_action_id_list_for_all_assets))]

    for i in range(len(threat_action_id_list_for_all_assets)):
        print "Threat Action %s: %s"%(i,threat_action_id_list_for_all_assets[i])
        for threat_action_id in threat_action_id_list_for_all_assets[i]:
            print "Threat Action ID %s" % (threat_action_id)
            print "Applicable Security Control %s" % (threat_action_list[threat_action_id].global_asset_applicable_security[i])
            print "SMT Variable %s" % (smt_Threat_Action_Security_Control[i][threat_action_id_to_position_roll[i][threat_action_id]])

    ############################################################ 1.5 Residual Risk Threshold Threat ############################
    smt_Residual_Risk_Asset = [Real('res_risk_asset_%s'%(i[0])) for i in asset_list_for_smt]
    print "Residual Risk Asset %s" % (smt_Residual_Risk_Asset)
    smt_Global_Residual_Risk = Real('smt_Global_Residual_Risk')
    ############################################################ End of Declare the boolean variables #######################################

    ##################################################################### Developing Constraints ############################################
    ##################################################################### 2.1 Threat Action Constraint ######################################
    # print "\n**********************************************The main constraints are here ******************************************************************\n"
    for asset_index in range(len(selected_security_controls)):
        print "**************** Asset Index %s" % (asset_index)
        print "Selected Sec Controls %s" % (selected_security_controls[asset_index])
        sec_index = 0
        for sec_control in selected_security_controls[asset_index]:
            # ######################### Test ##############
            # cyberARM.add(smt_Security_Control_Bool[asset_index][sec_index] == True)
            # ######################## End Test ###########
            print "Security Control %s" % (sec_control)
            print "Effectiveness %s" % (security_control_list[sec_control].threat_action_effectiveness)
            print "Threat Action %s" % (security_control_list[sec_control].global_asset_threat_action_list[asset_index])
            for threat_action_id in security_control_list[sec_control].global_asset_threat_action_list[asset_index]:
                print "Threat Action ID %s" % (threat_action_id)
                effectiveness_threat_action = security_control_list[sec_control].threat_action_effectiveness[threat_action_id]
                print "Effectiveness Against Threat Action %s" % (effectiveness_threat_action)
                print smt_Threat_Action_Security_Control[asset_index][threat_action_id_to_position_roll[asset_index][threat_action_id]]
                sec_control_position = threat_action_list[threat_action_id].global_asset_security_control_index[asset_index][sec_control]
                print "Security Control Position %s" % (sec_control_position)
                cons = (smt_Threat_Action_Security_Control[asset_index][threat_action_id_to_position_roll[asset_index][threat_action_id]][sec_control_position]==
                        If(smt_Security_Control_Bool[asset_index][sec_index],(1-effectiveness_threat_action),1))
                cost_cons = (smt_Security_Control_Cost[asset_index][sec_index]==
                             If(smt_Security_Control_Bool[asset_index][sec_index],
                              security_control_list[sec_control].investment_cost,0))
                cyberARM.add(cons)
                cyberARM.add(cost_cons)
            sec_index += 1

    ############################################################# 2.2 Threat Action Success Constraint #####################################
    # print "**************************************************** Threat Action Success ***************************************************"
    for asset_index in range(len(threat_action_id_list_for_all_assets)):
        # print "\nFor the Asset Index %s: %s" % (asset_index,asset_enterprise_list[asset_index][0])
        for threat_action_id in threat_action_id_list_for_all_assets[asset_index]:
            # print "Threat Action ID %s" % (threat_action_id)
            threat_action_index = threat_action_id_to_position_roll[asset_index][threat_action_id]
            # print "Threat Action Security Control %s" % (threat_action_list[threat_action_id].global_asset_security_control_index[asset_index])
            # print "SMT Threat Action Security Control %s" % (smt_Threat_Action_Security_Control[asset_index][threat_action_index])
            # print "Threat Action Success %s" % (smt_Threat_Action_Success[asset_index][threat_action_index])
            if len(smt_Threat_Action_Security_Control[asset_index][threat_action_index]) > 0:
                cyberARM.add(smt_Threat_Action_Success[asset_index][threat_action_index]==
                             reduce(lambda x,y:x*y,smt_Threat_Action_Security_Control[asset_index][threat_action_index]))
            else:
                cyberARM.add(smt_Threat_Action_Success[asset_index][threat_action_index] == 1)

    ############################################################# 2.3 Threat Constraints ##################################################
    # print "\n******************************************* Printing the threat constraint ************************************************\n"
    for asset_index in range(len(threat_id_for_all_assets)):
        # print "\n Asset Index %s" % (asset_index)
        threat_id_index = 0
        for threat_id in threat_id_for_all_assets[asset_index]:
            # threat_id_index = threat_id_to_position_roll[asset_index][threat_id]
            # print "\nThreat ID %s" % (threat_id)
            # print "SMT THreat %s" % (smt_Threat[asset_index][threat_id_index])
            # print "Applicable Threat Actions %s" % (threat_list[threat_id].global_asset_threat_action[asset_index])
            # print "Applicable Threat Actions Probability %s" % (threat_list[threat_id].global_asset_threat_action_prob[asset_index])
            # print "SMT Threat THreat Actions %s" % (smt_Threat_Threat_Action_Defense_Success[asset_index][threat_id_index])
            # print "Threat Impact %s" % (threat_list[threat_id].threat_impact_asset[asset_index])
            threat_action_index = 0
            for threat_action in threat_list[threat_id].global_asset_threat_action[asset_index]:
                # print "Threat Action ID %s" % (threat_action)
                # print "Applicable Threat Action %s" % (smt_Threat_Action_Success[asset_index][threat_action_id_to_position_roll[asset_index][threat_action]])
                # print "Prob %s" % (threat_list[threat_id].global_asset_threat_action_prob[asset_index][threat_action_index])
                # print "Applicable SMT Threat Threat Actions %s" % (smt_Threat_Threat_Action_Defense_Success[asset_index][threat_id_index][threat_action_index])
                cyberARM.add(smt_Threat_Threat_Action_Defense_Success[asset_index][threat_id_index][threat_action_index]==
                             (1-smt_Threat_Action_Success[asset_index][threat_action_id_to_position_roll[asset_index][threat_action]]
                              *threat_list[threat_id].global_asset_threat_action_prob[asset_index][threat_action_index]))
                threat_action_index += 1
            if len(smt_Threat_Threat_Action_Defense_Success[asset_index][threat_id_index]) > 0:
                cyberARM.add(smt_Threat[asset_index][threat_id_index]==
                             (1-reduce(lambda x,y:x*y,smt_Threat_Threat_Action_Defense_Success[asset_index][threat_id_index])
                              *(1-threat_list[threat_id].ignored_threat_action[asset_index]))
                             *threat_list[threat_id].threat_impact_asset[asset_index])
            else:
                cyberARM.add(smt_Threat[asset_index][threat_id_index]==threat_list[threat_id].maximum_risk[asset_index])
            threat_id_index += 1

    ############################################################# 2.4 Residual Risk Constraints ##################################################

    cyberARM.add([smt_Residual_Risk_Asset[i]==sum(smt_Threat[i]) for i in range(len(smt_Residual_Risk_Asset))])
    cyberARM.add([smt_Residual_Risk_Asset[i] >= (minimum_affordable_risk[i]-1) for i in range(len(minimum_affordable_risk))])
    cyberARM.add(smt_Global_Residual_Risk == sum(smt_Residual_Risk_Asset))
    cyberARM.add(smt_Global_Residual_Risk > sum(minimum_affordable_risk))

    ########################################################### 2.5 Total Security Control Cost ##################################################
    cyberARM.add([smt_Total_Security_Control_Cost[asset_index]==sum(smt_Security_Control_Cost[asset_index]) for asset_index in range(len(asset_list_for_smt))])
    cyberARM.add(smt_Global_Security_Control_Cost==sum(smt_Total_Security_Control_Cost))
    cyberARM.add(smt_Global_Security_Control_Cost <= budget)
    ############################################################ End Constrainst Development #################################################

    ############################################################ 3. Check the model ##########################################################
    cyberARM.minimize(smt_Global_Residual_Risk)
    satisfiability = cyberARM.check()

    ############################################################ 4. Get The Model ############################################################
    recommended_CDM = None
    if satisfiability == z3.sat:
        recommended_CDM = cyberARM.model()
        # print "Model is ---> "
        # print recommended_CDM
        print "Residual Risk %s" % (recommended_CDM[smt_Global_Residual_Risk])
        for i in range(len(asset_list_for_smt)):
            print "Risk for Asset %s :: %s" % (asset_list_for_smt[i][0],recommended_CDM[smt_Residual_Risk_Asset[i]])
        print "\nGlobal Security Control Cost %s" % (recommended_CDM[smt_Global_Security_Control_Cost])
        for i in range(len(asset_list_for_smt)):
            print "Total Asset Security Control Cost %s" % (recommended_CDM[smt_Total_Security_Control_Cost[i]])
            # for sec_control_id in selected_security_controls[i]:
            #     print "Cost %s: %s" % (security_control_list[sec_control_id].sc_name,security_control_list[sec_control_id].investment_cost)
    else:
        print "There is no satisfiable model"
    ################################################################## Prepare the output ###################################################
    CDM_Global_id = []
    for asset_index in range(len(asset_list_for_smt)):
        # print "******** >>>>>>>>>>>>>>> Asset Index %s" % (asset_index)
        CDM_Global_id.append([])
        sec_control_index = 0
        for sec_control in selected_security_controls[asset_index]:
            print "\n%s : %s" % (sec_control,smt_Security_Control_Bool[asset_index][sec_control_index])
            if recommended_CDM[smt_Security_Control_Bool[asset_index][sec_control_index]]:
                print " ----  Boolean %s" % (recommended_CDM[smt_Security_Control_Bool[asset_index][sec_control_index]])
                CDM_Global_id[asset_index].append(security_control_list[sec_control])
            sec_control_index += 1

    # print CDM_Global_id
    ############################################################ Prepare the dataset for the grid view ##############################
    CDM_Global = []
    for asset_index in range(len(CDM_Global_id)):
        # print CDM_Global.append([])
        asset_name_current = asset_list_for_smt[asset_index][0]
        for security_control_obj in CDM_Global_id[asset_index]:
            row = {}
            row['asset_name'] = asset_name_current
            row['sc_name']=security_control_obj.sc_name
            row['sc_function'] =ProjectConfigFile.ID_TO_SECURITY_FUNCTION[security_control_obj.sc_function]
            row['en_level'] =ProjectConfigFile.ID_TO_ENFORCEMENT_LEVEL[security_control_obj.en_level]
            row['kc_phase'] =ProjectConfigFile.ID_TO_KILL_CHAIN_PHASE[security_control_obj.kc_phase]
            CDM_Global.append(row)
    ########################################################### End of the dataset of the grid view #################################

    return CDM_Global