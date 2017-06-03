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
from CDMBuilder.CyberARMDeployed import CyberARMPowerPlant

def login(request):
    if request.method == 'GET':
        # print "*********************In the login function******************************"
        return render(request,"login.html")
    user_name = request.POST['inputUserName']
    user_pwd = request.POST['inputUserPassword']
    reg_flag = request.POST["registerFlag"]
    # person = model.Person(user_name=user_name,user_password=user_pwd)
    # person.save()
    print('Thanks for the patient %s : %s --> %s' % (user_name, user_pwd, reg_flag))
    return redirect('home')

def loginPost(request):
    if request.method=='GET':
        print "*********************In the login Post function******************************"
        return render(request, "cdmDisplay.html")

    action_name = request.POST['actionName']
    print "******ACTION************ -------------> %s" % (action_name)
    if action_name=='Insert':
        return redirect('insert')
    if action_name=='Display':
        return redirect('display')
    if action_name == 'Threat Action':
        return redirect('threatAction')
    if action_name == 'cyberARM Old':
        return redirect('cyberARM Old')
    if action_name == 'CyberARM':
        return redirect('cyberARM')

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

###################################### fetch all the rows from the raw queries as dictionary ##############################
def dictfetchall(cursor):
    "Return all rows from a cursor as a dict"
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]

def createCDMSCName(cdm_dict):
    sc_rows = []
    for row in cdm_dict:
        sc_rows.append("%s;%s;%s" % (row['sc_version'],row['security_control_name'],row['enforcement_level']))
    return sc_rows

def insertThreatActions(request):
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

        all_cdm_row = dictfetchall(cursorSC)
        print "******************** sc to level *******************************"
        # print createCDMSCName(all_cdm_row)
        print all_cdm_row
        cursor = connection.cursor()
        cursor.execute(
            'SELECT * FROM sc_to_enforcement_level JOIN threat_action_to_security_control ON sc_to_enforcement_level.id=threat_action_to_security_control.security_control_id '
            'JOIN cyber_defense_matrix ON sc_to_enforcement_level.sc_version=cyber_defense_matrix.sc_version')
        all_row = dictfetchall(cursor)
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

def cdmDisplaySecurityControl(request):
    if request.method=='GET':
        # all_cdm_row = model.cyber_defense_matrix.objects.all()
        # all_sc_to_enforcement_level = model.sc_version_enforcement_level.objects.all()
        cursor = connection.cursor()
        cursor.execute('SELECT * FROM sc_to_enforcement_level JOIN cyber_defense_matrix ON sc_to_enforcement_level.sc_version=cyber_defense_matrix.sc_version')

        all_cdm_row = dictfetchall(cursor)
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
        all_searched_entries = dictfetchall(cursor)
        all_searched_entries_json = developQueryModel(all_searched_entries)
    return HttpResponse(
        json.dumps(all_searched_entries_json),
        content_type="application/json"
    )


def cdmInsertSecurityControl(request):
    if request.method=='GET':
        cursor = connection.cursor()
        cursor.execute('SELECT * FROM sc_to_enforcement_level JOIN cyber_defense_matrix ON sc_to_enforcement_level.sc_version=cyber_defense_matrix.sc_version')
        all_cdm_row = dictfetchall(cursor)
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
    all_row = dictfetchall(cursor)
    print "##################### CDM Reports ################################################"
    print all_row

    cdmFile = open("SecurityControls.csv",'w')
    for row in all_row:
        cost_sc_control = random.randrange(100,800)
        # cdmFile.write('%s;%s;%s;%s;%s;%s\n'%(row['sc_version'],row['security_control_name'],row['kill_chain_phase'],row['enforcement_level'],row['sc_function'],cost_sc_control))
        cdmFile.write('%s;%s;%s;%s;%s\n'%(row['sc_version'],row['security_control_name'],row['kill_chain_phase'],row['enforcement_level'],row['sc_function']))
    cdmFile.close()
    return redirect('insert')

def generate_sc_threat_action(request):
    print "Thanks for generating threat action to security controls"
    cursor = connection.cursor()
    cursor.execute('SELECT * from sc_to_enforcement_level JOIN threat_action_to_security_control on sc_to_enforcement_level.id=threat_action_to_security_control.security_control_id')
    all_row = dictfetchall(cursor)
    print "##################### Security Control to Threat Action ################################################"
    print all_row

    sc_threat_action = open('ThreatActionSecurityControlNew.csv','w')
    for row in all_row:
        effectiveness_range = round(random.uniform(0.1,0.9),3)
        # cursor = connection.cursor()
        # cursor.execute("SELECT * from cyber_defense_matrix where security_control_name=\'"+row['sc_version']+"\'")
        # all_row_cdm = dictfetchall(cursor)
        # sc_name = all_row_cdm[0]['security_control_name']
        sc_threat_action.write('%s;%s;%s\n'%(row['threat_action'],row['sc_version'],effectiveness_range))
    return redirect('threatAction')

################################################################# Call CyberARM #######################################################
def cyberARM_request_updated(request):
    if request.method == "GET":
        print "CyberARM Updated Generation"
        return render(request,'CyberARMUpdated.html')

#################################################################### End Calling CyberARM #############################################

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
        CyberARMPowerPlant.cyberarm_init_main()
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