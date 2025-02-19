from django.http import HttpResponse,HttpResponseRedirect
from django.shortcuts import render,redirect
from django.template.loader import render_to_string
from CDMBuilder.Models import model
from CDMBuilder.Utilities import GlobalVariables
import json
from django.db.models import Q
from django.core import serializers
from django.db import connection
import math,random
from multiprocessing import Process,Queue
from z3 import *
import UtilityFunctions



######################## Global ################################
threat_threat_action_map = {}
USER_NAME_KEY = 'user_name'
####################### End Global #############################

from CDMBuilder.CyberARMDeployed.ProjectConfigFile import VERIS_LIST,EXPERIENCE_LIST,CYBERARM_CDM_MATRIX,CYBERARM_RISK,CYBERARM_ROI,uploadFiles



def login(request):
    if request.method == 'GET':
        # print "*********************In the login function******************************"
        return render(request,"login.html")
    user_name = request.POST['inputUserName']
    user_pwd = request.POST['inputUserPassword']
    reg_flag = request.POST["registerFlag"]
    # person = model.Person(user_name=user_name,user_password=user_pwd)
    # person.save()
    if user_name=='ccaa' and user_pwd=='ccaa2018':
        print('Thanks for the patient %s : %s --> %s' % (user_name, user_pwd, reg_flag))
        request.session[USER_NAME_KEY]=user_name
        return redirect('home')
    else:
        return redirect('login')

def loginPost(request):
    if USER_NAME_KEY not in request.session.keys():
        return redirect('login')
    if request.method=='GET':
        # print "*********************In the login Post function******************************"
        return render(request, "cdmDisplay.html")

    action_name = request.POST['actionName']
    print "******ACTION************ -------------> %s" % (action_name)
    if action_name=='Insert':
        return redirect('insert')
    if action_name=='Display':
        return redirect('display')
    if action_name == 'CSC-Threat Mapping':
        return redirect('threatAction')
    if action_name == 'cyberARM Old':
        return redirect('cyberARM Old')
    if action_name == 'CyberARM':
        return redirect('cyberARM')
    if action_name == 'CSC Mapping':
        return redirect('csc_classification')
    if action_name == 'Threat-KC Phase Mapping':
        return redirect('threatActionKillChainPhaseMapping')
    if action_name == 'Log out':
        if USER_NAME_KEY in request.session.keys():
            del request.session[USER_NAME_KEY]
        return redirect('login')

def authenticate(request):
    if USER_NAME_KEY not in request.session.keys():
        return redirect('login')
    print "User Name %s" % (request.session[USER_NAME_KEY])
    if request.session[USER_NAME_KEY] == 'void':
        return redirect('login')

def developQueryModel(all_cdm_row):
    # print "Number of rows %s" % (all_cdm_row.count())
    send_data = []
    for enfor_row in all_cdm_row:
        cdm_entitiy = {}
        # row = all_cdm_row[enfor_row.sc_version]
        # row = enfor_row
        cdm_entitiy['sc_control'] = enfor_row['security_control_name']
        cdm_entitiy['id'] = enfor_row['sc_version']
        cdm_entitiy['sec_func'] = enfor_row['sc_function']
        cdm_entitiy['en_level'] = enfor_row['enforcement_level']
        cdm_entitiy['kill_phase'] = enfor_row['kill_chain_phase']
        send_data.append(cdm_entitiy)
    print send_data
    return send_data


def createCDMSCName(cdm_dict):
    sc_rows = []
    for row in cdm_dict:
        sc_rows.append("%s;%s;%s" % (row['sc_version'],row['security_control_name'],row['enforcement_level']))
    return sc_rows

def insertThreatActions(request):
    if USER_NAME_KEY not in request.session.keys():
        return redirect('login')
    if request.method == 'GET':
        a = Real('a')
        threat_action_list = model.Threat_Action.objects.all()
        threat_action_name = []
        for threat_action in threat_action_list:
            threat_action_name.append(threat_action.threat_action_name)
        threat_action_name = sorted(threat_action_name)
        print ":D :D ",threat_action_name
        cursorSC = connection.cursor()
        cursorSC.execute(
            'SELECT * FROM sc_to_enforcement_level JOIN cyber_defense_matrix ON sc_to_enforcement_level.sc_version=cyber_defense_matrix.sc_version')

        all_cdm_row = UtilityFunctions.dictfetchall(cursorSC)
        print "******************** sc to level *******************************"
        # print createCDMSCName(all_cdm_row)
        print all_cdm_row
        cursor = connection.cursor()
        cursor.execute(
            'SELECT * FROM sc_to_enforcement_level JOIN threat_action_to_security_control ON sc_to_enforcement_level.id=threat_action_to_security_control.security_control_id '
            'JOIN cyber_defense_matrix ON sc_to_enforcement_level.sc_version=cyber_defense_matrix.sc_version')
        all_row = UtilityFunctions.dictfetchall(cursor)
        print "******************** sc to threat action *******************************"
        print all_row
        print "******************** sc to threat action *******************************"
        return render(request,'SCThreatAction.html',{'sc_source':json.dumps(createCDMSCName(all_cdm_row)),
                                                     'threat_action_source': json.dumps(threat_action_name),
                                                     'grid_src':json.dumps(all_row)})
    if request.method=='POST':
        sc_name = request.POST["sc_name"].split(';')
        print ":( :( :( :( %s"%(sc_name)
        threat_action = request.POST['threat_action']
        print sc_name, " ---> ", threat_action
        # print request.POST['sc_name_current']," :::: ",request.POST['threat_action_current']
        security_control = model.sc_version_enforcement_level.objects.get(sc_version=sc_name[0],enforcement_level=sc_name[2])
        print "ID ",security_control.id
        ta_sc = model.threat_action_to_security_control()
        ta_sc.security_control_id = security_control.id
        ta_sc.threat_action = threat_action
        ta_sc.save()
        return redirect('threatAction')


#################################################################### Threat Action To KIll Chain Phase Mapping ############################################
def createGridInputThreatActionKCPhase():
    ta_kc_objects_list = model.threat_action_kc_phase.objects.all()
    ta_kc_list = []
    for ta_kc_object in ta_kc_objects_list:
        ta_kc_list_row = {}
        ta_kc_list_row['threat_action'] = ta_kc_object.threat_action_name
        ta_kc_list_row['kc_phase'] = ta_kc_object.kc_phase
        ta_kc_list.append(ta_kc_list_row)
    return ta_kc_list

def ThreatActionKCPhaseMapping(request):
    if request.method == 'GET':
        ta_kc_list = createGridInputThreatActionKCPhase()
        send_data = {}
        threat_action_list = model.Threat_Action.objects.all()
        threat_action_name = []
        for threat_action in threat_action_list:
            threat_action_name.append(threat_action.threat_action_name)
        threat_action_name = sorted(threat_action_name)
        send_data['threat_action_source'] = json.dumps(threat_action_name)
        print "Threat Action Name List %s" % (threat_action_name)

        kill_chain_phase_list = []
        kill_chain_phase_objects = model.kill_chain_phase.objects.all()
        for kill_chain_phase in kill_chain_phase_objects:
            kill_chain_phase_list.append(kill_chain_phase.kc_phase)
        # kill_chain_phase_list = sorted(kill_chain_phase_list)
        send_data['kill_chain_phase_list'] = json.dumps(kill_chain_phase_list)
        send_data['grid_src'] = json.dumps(ta_kc_list)
        print "Kill Chain Phase %s" % (kill_chain_phase_list)
        return render(request,'ThreatActionKillChainPhase.html',send_data)

    if request.method=='POST':
        json_loads = json.loads(request.body.decode("utf-8"))
        kc_phase = json_loads['kc_phase']
        print ":( :( :( :( %s"%(kc_phase)
        threat_action = json_loads['threat_action']
        print kc_phase, " ---> ", threat_action
        # print request.POST['sc_name_current']," :::: ",request.POST['threat_action_current']
        ta_kc = model.threat_action_kc_phase()
        ta_kc.kc_phase = kc_phase
        ta_kc.threat_action_name = threat_action
        ta_kc.save()
        send_data = {}
        ta_kc_list = createGridInputThreatActionKCPhase()
        send_data['grid_src'] = json.dumps(ta_kc_list)
        return HttpResponse(
            send_data['grid_src'],
            content_type="application/json"
        )

def cdmDisplaySecurityControl(request):
    if request.method=='GET':
        # all_cdm_row = model.cyber_defense_matrix.objects.all()
        # all_sc_to_enforcement_level = model.sc_version_enforcement_level.objects.all()
        cursor = connection.cursor()
        cursor.execute('SELECT * FROM sc_to_enforcement_level JOIN cyber_defense_matrix ON sc_to_enforcement_level.sc_version=cyber_defense_matrix.sc_version')

        all_cdm_row = UtilityFunctions.dictfetchall(cursor)
        print "******************** sc to level *******************************"
        print all_cdm_row
        print "******************** sc to level *******************************"
        send_data = developQueryModel(all_cdm_row)
        return render(request, "Display_list.html",
                      {'cdmList': json.dumps(send_data), 'kc_phase': GlobalVariables.kill_chain_phase,
                       'enforcement_level': GlobalVariables.enforcement_level,
                       'security_function': GlobalVariables.security_function})
    if request.is_ajax():
        print "In the post function %s" % (request.body.decode("utf-8"))
        json_loads = json.loads(request.body.decode("utf-8"))
        print json_loads['sc_version']
        query_list = []
        custom_query = 'SELECT * FROM sc_to_enforcement_level JOIN cyber_defense_matrix ON sc_to_enforcement_level.sc_version=cyber_defense_matrix.sc_version where'
        get_one = 0
        if len(json_loads['sc_name'])!=0:
            print "sc_name: %s" % (json_loads['sc_name'])
            Q1 = Q(**{'security_control_name__contains':json_loads['sc_name']})
            query_list.append(Q1)
            get_one = 1
            custom_query += ' security_control_name="'+json_loads['sc_name']+'"'
        if len(json_loads['sc_version'])!=0:
            print "sc_version: %s" % (json_loads['sc_version'])
            Q2 = Q(**{'sc_version': json_loads['sc_version']})
            query_list.append(Q2)
            if(get_one==1):
                custom_query += ' and'
            else:
                get_one = 1
            custom_query +=' sc_version="'+json_loads['sc_version']+'"'
        if len(json_loads['kc_phase'])!=0:
            print "kc_phase: %s" % (json_loads['kc_phase'])
            Q3 = Q(**{'kill_chain_phase':json_loads['kc_phase']})
            query_list.append(Q3)
            if (get_one == 1):
                custom_query += ' and'
            else:
                get_one = 1
            custom_query += ' kill_chain_phase="' + json_loads['kc_phase']+'"'
        if len(json_loads['ef_level'])!=0:
            print "ef_level: %s" % (json_loads['ef_level'])
            Q4 = Q(**{'enforcement_level':json_loads['ef_level']})
            query_list.append(Q4)
            if (get_one == 1):
                custom_query += ' and'
            else:
                get_one = 1
            custom_query += ' enforcement_level="' + json_loads['ef_level']+'"'
        if len(json_loads['sc_fun'])!=0:
            print "sc_fun: %s" % (json_loads['sc_fun'])
            Q5 = Q(**{'sc_function':json_loads['sc_fun']})
            query_list.append(Q5)
            if (get_one == 1):
                custom_query += ' and'
            else:
                get_one = 1
            custom_query += ' sc_function="' + json_loads['sc_fun']+'"'
        args = Q()
        for each_arg in query_list:
            args = args & each_arg
        # all_searched_entries = model.cyber_defense_matrix.objects.filter(*(args,))
        print "*************************************** Hail Search *************************************************"
        print custom_query
        print "*************************************** Hail Search *************************************************"
        # print "Number of rows %s" % (all_searched_entries.count())
        # all_searched_entries_json =
        cursor = connection.cursor()
        cursor.execute(custom_query)
        all_searched_entries = UtilityFunctions.dictfetchall(cursor)
        all_searched_entries_json = developQueryModel(all_searched_entries)
    return HttpResponse(
        json.dumps(all_searched_entries_json),
        content_type="application/json"
    )


def cdmInsertSecurityControl(request):
    if request.method=='GET':
        cursor = connection.cursor()
        cursor.execute('SELECT * FROM sc_to_enforcement_level JOIN cyber_defense_matrix ON sc_to_enforcement_level.sc_version=cyber_defense_matrix.sc_version')
        all_cdm_row = UtilityFunctions.dictfetchall(cursor)
        send_data = developQueryModel(all_cdm_row)

        return render(request,"insertCDM.html",{'cdmList': json.dumps(send_data),'kc_phase':GlobalVariables.kill_chain_phase,'enforcement_level':GlobalVariables.enforcement_level,
                                                'security_function':GlobalVariables.security_function})
    print "in the post function of insert"
    cdm_row = model.cyber_defense_matrix()
    sc_enf_level = model.sc_version_enforcement_level()
    cdm_row.security_control_name = request.POST['sc_name']
    cdm_row.sc_version = request.POST['sc_version']
    cdm_row.kill_chain_phase = request.POST['kc_phase']
    sc_enf_level.enforcement_level=request.POST['ef_level']
    cdm_row.sc_function = request.POST['sc_fun']
    # print "CDM ---> %s, %s, %s, %s, %s" % (cdm_row.security_control_name,cdm_row.sc_version,cdm_row.enforcement_level
    #                               ,cdm_row.kill_chain_phase,cdm_row.sc_function)
    try:
        model.cyber_defense_matrix.objects.get(sc_version=cdm_row.sc_version)
        print "The row exists"
    except:
        print "The row does not exist"
        cdm_row.save()
    try:
         sc_enf_level.sc_version = cdm_row.sc_version
         sc_enf_level.save()
    except:
         print "failed entry to sc enfocement level table"
    return redirect('insert')

def generate_CDM(request):
    print "Thanks for generating the report"
    cursor = connection.cursor()
    cursor.execute('SELECT * FROM cyber_defense_matrix JOIN sc_to_enforcement_level on cyber_defense_matrix.sc_version = sc_to_enforcement_level.sc_version')
    all_row = UtilityFunctions.dictfetchall(cursor)
    print "##################### CDM Reports ################################################"
    print all_row

    cdmFile = open("SecurityControls.csv",'w')
    for row in all_row:
        cost_sc_control = random.randrange(100,800)
        # cdmFile.write('%s;%s;%s;%s;%s;%s\n'%(row['sc_version'],row['security_control_name'],row['kill_chain_phase'],row['enforcement_level'],row['sc_function'],cost_sc_control))
        cdmFile.write('%s;%s;%s;%s;%s\n'%(row['sc_version'],row['security_control_name'],row['kill_chain_phase'],row['enforcement_level'],row['sc_function']))
    cdmFile.close()
    return redirect('insert')


################################################################# Call CyberARM #######################################################
def cyberARM_request_updated(request):
    if request.method == "GET":
        print "CyberARM Updated Generation"
        print "Threat Threat Action Map %s" % (threat_threat_action_map)
        threat_action_list = model.Threat_Action.objects.all()
        threat_action_list = UtilityFunctions.threat_action_list_as_dict(threat_action_list)
        print threat_action_list
        send_data = {}
        send_data['threat_action'] = json.dumps(threat_action_list)
        asset_list = model.Asset_VERIS.objects.all()
        asset_list = UtilityFunctions.asset_list_as_dict(asset_list)
        print asset_list
        send_data['asset_list'] = json.dumps(asset_list)
        return render(request,'CyberARM_CDM_Compact.html',send_data)

    if request.method == "POST":
        print "In the post of cyberARM"
        # print request.body.decode("utf-8")
        # json_loads = json.loads(request.body.decode("utf-8"))
        send_data = {}
        json_loads = json.loads(request.POST["asset_list_user_input"])
        # print json_loads
        affordable_risk = json_loads['affordable_risk']
        budget = json_loads['budget']
        asset_list_given = json_loads['real_data']
        print asset_list_given
        veris_list = []
        experience_list = []
        for asset_given in asset_list_given:
            if asset_given['data_source'] == 'VERIS':
                veris_list.append([asset_given['asset_name'],[float(asset_given['confidentiality']),float(asset_given['integrity']),float(asset_given['availability'])]])
            else:
                threat_threat_action_asset_experience = {}
                ####################################### Prepare the list of threat statistics from the experience ######################################
                for threat_action in asset_given['threat_list']:
                    threat_action_name = threat_action['threat_action_name_id'].lower()
                    threat_list = threat_threat_action_map[threat_action_name]
                    for threat in threat_list:
                        if threat not in threat_threat_action_asset_experience.keys():
                            threat_threat_action_asset_experience[threat] = {}
                        threat_threat_action_asset_experience[threat][threat_action_name] =  threat_action['frequency']

                ####################################### End Preparation the list of threat statistics from the experience ######################################
                experience_list.append([('%s_exp' % (asset_given['asset_name'])),
                                        [float(asset_given['confidentiality']), float(asset_given['integrity']),
                                         float(asset_given['availability'])],threat_threat_action_asset_experience])
        print veris_list
        print "******************************* Given the asset experience list **********************"
        for i in range(len(experience_list)):
            print experience_list[i]

        ############################################## Just for Testing ###############################################
        experience_list = []
        experience_list.append([u'laptop_exp', [1222.0, 32345.0, 45678.0],{u'misuse': {u'net misuse': u'32'}, u'hacking': {u'forced browsing': u'329'}, u'social': {u'forgery': u'23'}}])
        # experience_list.append([u'files_exp', [2390.0, 4376.0, 32323.0], {u'misuse': {u'net misuse': u'23'}, u'error': {u'omission': u'32'}}])
        ############################################## End of Testing #################################################

        veris_list = [['database',[500000,500000,500000]],['desktop',[100000,100000,100000]]]#,['laptop',[100000,100000,100000]]]#,['end-user',[100000,100000,100000]]]
        asset_enterprise_list_input = [[] for i in range(2)]
        asset_enterprise_list_input[VERIS_LIST] = veris_list
        asset_enterprise_list_input[EXPERIENCE_LIST] = experience_list

        print " ***************************** All the CyberARM Asset ************************************"
        print asset_enterprise_list_input

        from CDMBuilder.CyberARMDeployed import CyberARMPowerPlant
        recommendedCDM = CyberARMPowerPlant.cyberarm_init_main(asset_enterprise_list_input,affordable_risk,budget)
        # recommendedCDM = CyberARMPowerPlant.cyberarm_init_main(veris_list, affordable_risk, budget)
        print recommendedCDM
        send_data['cdm_list'] = json.dumps(recommendedCDM[CYBERARM_CDM_MATRIX])
        send_data['risk_list'] = json.dumps(recommendedCDM[CYBERARM_RISK])
        send_data['roi'] = json.dumps(recommendedCDM[CYBERARM_ROI])
        return render(request,'CDM_Output.html',send_data)

#################################################################### End Calling CyberARM #############################################


################################################################# Call CyberARM Compact#######################################################
def cyberARM_request_updated_compact(request):
    from CDMBuilder.CyberARMDeployed import Utitilities
    if USER_NAME_KEY not in request.session.keys():
        return redirect('login')
    if request.method == "GET":
        print "CyberARM Updated Generation"
        print "Threat Threat Action Map %s" % (threat_threat_action_map)
        UtilityFunctions.readBudgetAffordableRisk()
        threat_action_list = model.Threat_Action.objects.all()
        threat_action_list = UtilityFunctions.threat_action_list_as_dict(threat_action_list)
        print threat_action_list
        send_data = {}
        send_data['asset_input_parameters']=json.dumps(UtilityFunctions.readBudgetAffordableRisk())
        send_data['threat_action'] = json.dumps(threat_action_list)
        asset_list = model.Asset_VERIS.objects.all()
        asset_list = UtilityFunctions.asset_list_as_dict(asset_list)
        print asset_list
        send_data['saved_file_list'] = json.dumps(uploadFiles())
        send_data['asset_list'] = json.dumps(asset_list)
        return render(request,'CyberARM_CDM_Compact.html',send_data)

    if request.method == "POST":
        print "In the post of cyberARM"
        already_out = True
        send_data = {}
        json_loads = json.loads(request.body.decode("utf-8"))
        risk_elimination = float(json_loads['risk_elimination']) / 100.0
        asset_list_given = json_loads['real_data']
        if(json_loads['pre_ouput']):
            recommendedCDM = Utitilities.readResultFile(len(asset_list_given),risk_elimination)
            send_data['cdm_list'] = recommendedCDM[CYBERARM_CDM_MATRIX]
            send_data['risk_list'] = recommendedCDM[CYBERARM_RISK]
            send_data['roi'] = recommendedCDM[CYBERARM_ROI]

        else:
            # print request.body.decode("utf-8")
            # print json_loads
            affordable_risk = json_loads['affordable_risk']
            budget = json_loads['budget']
            print asset_list_given
            threat_elimination = json_loads['threat_elimination']
            # risk_elimination = 0.8
            if risk_elimination <= 0:
                risk_elimination = 0.8
            print "Risk Distribution: %s Threat Distribution: %s" % (risk_elimination,threat_elimination)
            threat_action_distribution_discovered = json_loads['threat_action_distribution']
            print "Threat Action Distribution %s" % (threat_action_distribution_discovered)

            veris_list = []
            experience_list = []
            for asset_given in asset_list_given:
                # print asset_given
                if asset_given['data_source'] == 'VERIS':
                    veris_list.append([asset_given['asset_name'],[float(asset_given['confidentiality']),float(asset_given['integrity']),float(asset_given['availability'])]])
                else:
                    threat_threat_action_asset_experience = {}
                    ####################################### Prepare the list of threat statistics from the experience ######################################
                    for threat_action in asset_given['threat_list']:
                        threat_action_name = threat_action['threat_action_name_id'].lower()
                        threat_list = threat_threat_action_map[threat_action_name]
                        for threat in threat_list:
                            if threat not in threat_threat_action_asset_experience.keys():
                                threat_threat_action_asset_experience[threat] = {}
                            threat_threat_action_asset_experience[threat][threat_action_name] =  threat_action['frequency']

                    ####################################### End Preparation the list of threat statistics from the experience ######################################
                    experience_list.append([('%s_exp' % (asset_given['asset_name'])),
                                            [float(asset_given['confidentiality']), float(asset_given['integrity']),
                                             float(asset_given['availability'])],threat_threat_action_asset_experience])
            print veris_list
            print "******************************* Given the asset experience list **********************"
            for i in range(len(experience_list)):
                print experience_list[i]

            ############################################# Just for Testing ###############################################
            # experience_list = []
            # experience_list.append([u'laptop_exp', [1222.0, 32345.0, 45678.0],{u'misuse': {u'net misuse': u'32'}, u'hacking': {u'forced browsing': u'329'}, u'social': {u'forgery': u'23'}}])
            # experience_list.append([u'files_exp', [2390.0, 4376.0, 32323.0], {u'misuse': {u'net misuse': u'23'}, u'error': {u'omission': u'32'}}])

            ############################################# End of Testing #################################################

            # veris_list = [['database',[500000,500000,500000]],['desktop',[100000,100000,100000]]]#,['laptop',[100000,100000,100000]]]#,['end-user',[100000,100000,100000]]]
            asset_enterprise_list_input = [[] for i in range(2)]
            asset_enterprise_list_input[VERIS_LIST] = veris_list
            asset_enterprise_list_input[EXPERIENCE_LIST] = experience_list

            print " ***************************** All the CyberARM Asset ************************************"
            print asset_enterprise_list_input

            from CDMBuilder.CyberARMDeployed import CyberARMPowerPlant
            from CDMBuilder.CyberARMDeployed import ProjectConfigFile
            recommendedCDM = CyberARMPowerPlant.cyberarm_init_main(asset_enterprise_list_input,affordable_risk,budget,risk_elimination,ProjectConfigFile.MAX_SEC_THREAT_ACTION)
            # recommendedCDM = CyberARMPowerPlant.cyberarm_init_main(veris_list, affordable_risk, budget)
            print recommendedCDM
            ############################################################### One List for Different Risk Elimination Approach #########################################
            ############################################################### One List for Same Risk Elimination Approach with Different Cost#########################################
            ############################################################### One List for Same Risk Elimination Approach with Same Cost Different Threshold Value#########################################
            # if(len(recommendedCDM)==0):
            #     send_data['cdm_list'] = []
            #     send_data['risk_list'] = []
            #     send_data['roi'] = []


            recommendedCDM = recommendedCDM[0][0][0]
            send_data['cdm_list'] = recommendedCDM[CYBERARM_CDM_MATRIX]
            send_data['risk_list'] = recommendedCDM[CYBERARM_RISK]
            send_data['roi'] = recommendedCDM[CYBERARM_ROI]


        return HttpResponse(
            json.dumps(send_data),
            content_type="application/json"
        )

#################################################################### End Calling CyberARM Compact#############################################

##################################################################### Threat Action Distribution ##############################################
def threat_action_distribution(request):
    print "In Threat Action Distribution Generation"
    json_loads = json.loads(request.body.decode("utf-8"))
    send_data = {}
    asset_list_given = json_loads['asset_list']
    print asset_list_given
    veris_list = []
    experience_list = []
    for asset_given in asset_list_given:
        if asset_given['data_source'] == 'VERIS':
            veris_list.append([asset_given['asset_name'],
                               [float(asset_given['confidentiality']), float(asset_given['integrity']),
                                float(asset_given['availability'])]])
        else:
            threat_threat_action_asset_experience = {}
            ####################################### Prepare the list of threat statistics from the experience ######################################
            for threat_action in asset_given['threat_list']:
                threat_action_name = threat_action['threat_action_name_id'].lower()
                threat_list = threat_threat_action_map[threat_action_name]
                for threat in threat_list:
                    if threat not in threat_threat_action_asset_experience.keys():
                        threat_threat_action_asset_experience[threat] = {}
                    threat_threat_action_asset_experience[threat][threat_action_name] = threat_action['frequency']

            ####################################### End Preparation the list of threat statistics from the experience ######################################
            experience_list.append([('%s_exp' % (asset_given['asset_name'])),
                                    [float(asset_given['confidentiality']), float(asset_given['integrity']),
                                     float(asset_given['availability'])], threat_threat_action_asset_experience])
    print veris_list
    print "******************************* Given the asset experience list **********************"
    for i in range(len(experience_list)):
        print experience_list[i]

    ############################################## Just for Testing ###############################################
    # experience_list = []
    # experience_list.append([u'laptop_exp', [1222.0, 32345.0, 45678.0],{u'misuse': {u'net misuse': u'32'}, u'hacking': {u'forced browsing': u'329'}, u'social': {u'forgery': u'23'}}])
    # experience_list.append([u'files_exp', [2390.0, 4376.0, 32323.0], {u'misuse': {u'net misuse': u'23'}, u'error': {u'omission': u'32'}}])
    ############################################## End of Testing #################################################

    # veris_list = [['database',[500000,500000,500000]],['desktop',[100000,100000,100000]]]#,['laptop',[100000,100000,100000]]]#,['end-user',[100000,100000,100000]]]
    asset_enterprise_list_input = [[] for i in range(2)]
    asset_enterprise_list_input[VERIS_LIST] = veris_list
    asset_enterprise_list_input[EXPERIENCE_LIST] = experience_list

    print " ***************************** All the CyberARM Asset ************************************"
    print asset_enterprise_list_input
    from CDMBuilder.CyberARMDeployed import CyberARMEngineUpdated
    CyberARMEngineUpdated.generate_risk_distribution(asset_enterprise_list_input,send_data)
    return HttpResponse(
        json.dumps(send_data),
        content_type="application/json"
    )

##################################################################### End of Threat Action Distribution ##############################################

def cyberARM_request(request):
    if request.method=='GET':
        print "Cyber ARm Generate"

        return render(request,'CyberARM.html',{'business_domain':GlobalVariables.business_domain,
                                               'asset_type':GlobalVariables.asset_type,'k_c_phase':GlobalVariables.kill_chain_phase,
                                               'en_level':GlobalVariables.enforcement_level,'sc_func':GlobalVariables.security_function})
    if request.method=='POST':
        CyberARMPowerPlant.cyberarm_init_main()
        return HttpResponse("Thanks")


def cyberARM_request_old(request):
    if request.method=='GET':
        print "Cyber ARm Generate"

        return render(request,'CyberARM.html',{'business_domain':GlobalVariables.business_domain,
                                               'asset_type':GlobalVariables.asset_type,'k_c_phase':GlobalVariables.kill_chain_phase,
                                               'en_level':GlobalVariables.enforcement_level,'sc_func':GlobalVariables.security_function})
    if request.method=='POST':
        # CyberARMPowerPlant.cyberarm_init_main()
        asset_list = request.POST["asset_name"]
        asset_list = asset_list.split(';')
        print "Cyber ARM Generate POST ---> ",asset_list
        asset_dict = {}
        for i in range(len(asset_list)):
            asset_dict[asset_list[i]]='%s_%s'%('jqxgrid',i)
        # proc = Process(target=cyberARM_BackProcess,args=())
        # proc.start()
        common_file_name = 'CyberDefenseMatrix'
        cdm_list = []
        for i in range(len(asset_list)):
            cdm_file = open(('%s_%s.csv')%(common_file_name,i),'r+')
            cdm_specific_asset = {}
            for line in cdm_file:
                line = line.lower()
                line = line.split(';')
                cdm_specific_asset[line[0]] = int(line[2])
            cdm_list.append(cdm_specific_asset)

        for i in range(len(cdm_list)):
             print "************* Asset ",i," --> ",cdm_list[i]

        list_source = {}
        cdm_all = model.cyber_defense_matrix.objects.all()
        for cdm_row in cdm_all:
            for i in range(len(cdm_list)):
                if cdm_row.sc_version == '3.3':
                    print (cdm_row.sc_version in cdm_list[i].keys())
                if cdm_row.sc_version in cdm_list[i].keys():
                    list_source[cdm_row.sc_version] = [cdm_row.security_control_name,cdm_row.kill_chain_phase,cdm_row.sc_function]
                    break
        print list_source

        send_data = []
        for i in range(len(cdm_list)):
            send_data_specific_asset = []
            for id in cdm_list[i].keys():
                cdm_row = {}
                cdm_row['sc_control'] = list_source[id][0]
                cdm_row['id'] = id
                cdm_row['kill_phase'] = list_source[id][1]
                cdm_row['en_level'] = GlobalVariables.enforcement_level[cdm_list[i][id]]
                cdm_row['sec_func'] = list_source[id][2]
                send_data_specific_asset.append(cdm_row)
            send_data.append(send_data_specific_asset)
        for i in range(len(cdm_list)):
             print "************* Asset ",i," --> ",send_data[i]

        return render(request,'CyberDefenseMatrixList.html',{'asset_name':asset_dict,'asset_name_js':json.dumps(asset_dict),
                                                             'send_data':json.dumps(send_data),'k_c_phase':GlobalVariables.kill_chain_phase})


def cyberARM_BackProcess():
    for i in range(10):
        print "Process ",i



