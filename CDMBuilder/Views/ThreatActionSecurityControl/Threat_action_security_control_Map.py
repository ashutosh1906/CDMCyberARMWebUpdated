from django.shortcuts import render,redirect
from CDMBuilder.Models import model
import json,random
from django.db import connection
from CDMBuilder.Views.Login import USER_NAME_KEY
from CDMBuilder.Views import UtilityFunctions

def insertThreatActions(request):
    if USER_NAME_KEY not in request.session.keys():
        return redirect('login')
    if request.method == 'GET':
        threat_action_list = model.Threat_Action_Updated.objects.all()
        threat_action_name = []
        for threat_action in threat_action_list:
            threat_action_name.append(threat_action.threat_action_name)
        threat_action_name = sorted(threat_action_name)
        # print ":D :D ",threat_action_name
        threat_action_security_control_map = model.threat_action_security_control_map.objects.all()
        threat_action_security_control_map_dict_all = []
        for threat_action_security_control_row in threat_action_security_control_map:
            threat_action_security_control_map_dict = {}
            threat_action_security_control_map_dict['sc_version'] = threat_action_security_control_row.sc_version
            threat_action_security_control_map_dict['security_control_name'] = threat_action_security_control_row.sc_name
            threat_action_security_control_map_dict['threat_action'] = threat_action_security_control_row.threat_action_name
            # print threat_action_security_control_map_dict
            threat_action_security_control_map_dict_all.append(threat_action_security_control_map_dict)

        security_controls_rows = model.security_control.objects.all()
        security_control_list = []
        for sc in security_controls_rows:
            security_control_list.append(sc.sc_name)
        security_control_list = sorted(security_control_list)
        # print security_control_list
        # cursorSC = connection.cursor()
        # cursorSC.execute(
        #     'SELECT * FROM sc_to_enforcement_level JOIN cyber_defense_matrix ON sc_to_enforcement_level.sc_version=cyber_defense_matrix.sc_version')
        #
        # all_cdm_row = dictfetchall(cursorSC)
        # print "******************** sc to level *******************************"
        # # print createCDMSCName(all_cdm_row)
        # print all_cdm_row
        # cursor = connection.cursor()
        # cursor.execute(
        #     'SELECT * FROM sc_to_enforcement_level JOIN threat_action_to_security_control ON sc_to_enforcement_level.id=threat_action_to_security_control.security_control_id '
        #     'JOIN cyber_defense_matrix ON sc_to_enforcement_level.sc_version=cyber_defense_matrix.sc_version')
        # all_row = dictfetchall(cursor)
        print "******************** sc to threat action *******************************"
        # print all_row
        print "******************** sc to threat action *******************************"
        return render(request, 'ThreatActionSecurityControl/SCThreatActionMap.html', {'sc_source':json.dumps(security_control_list),
                                                     'threat_action_source': json.dumps(threat_action_name),
                                                     'grid_src':json.dumps(threat_action_security_control_map_dict_all)})
    if request.method=='POST':
        print "Here I am rock you like a hurricane"
        sc_name = request.POST["sc_name"].split(';')
        threat_action = request.POST['threat_action'].split(';')
        print sc_name, " ---> ", threat_action
        for ta in threat_action:
            for sc in sc_name:
                print "Security Control Name %s" % (sc)
                ta_sc = model.threat_action_security_control_map()
                ta_sc.sc_name = sc
                ta_sc.threat_action_name = ta
                sec_con = model.security_control.objects.get(sc_name=sc)
                ta_sc.sc_version = sec_con.sc_version
                ta_sc.save()
        return redirect('threatAction')

def generate_sc_threat_action(request):
    print "Thanks for generating threat action to security controls"
    threat_action_security_control_retrieve = 'select * from %s as ta join %s as sc on ta.threat_action_name=sc.threat_action_name' % ('threat_action_updated','threat_action_security_control_map')
    cursor = connection.cursor()
    cursor.execute(threat_action_security_control_retrieve)
    all_row = UtilityFunctions.dictfetchall(cursor)
    print "##################### Security Control to Threat Action ################################################"
    print all_row

    sc_threat_action = open('ThreatActionSecurityControlNew.csv','w')
    for row in all_row:
        effectiveness_range = round(random.uniform(0.1,0.9),3)
        # cursor = connection.cursor()
        # cursor.execute("SELECT * from cyber_defense_matrix where security_control_name=\'"+row['sc_version']+"\'")
        # all_row_cdm = UtilityFunctions.dictfetchall(cursor)
        # sc_name = all_row_cdm[0]['security_control_name']
        sc_threat_action.write('%s;%s;%s\n'%(row['threat_action_name'].lower(),row['sc_version'].lower(),effectiveness_range))
    return redirect('threatAction')
