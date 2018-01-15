from django.http import HttpResponse,HttpResponseRedirect
from django.shortcuts import render,redirect
from django.template.loader import render_to_string
from CDMBuilder.Models import model
from CDMBuilder.Utilities import GlobalVariables
import json
from django.db.models import Q
from django.core import serializers
from django.db import connection
from Login import USER_NAME_KEY,dictfetchall

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
        return render(request,'SCThreatActionMap.html',{'sc_source':json.dumps(security_control_list),
                                                     'threat_action_source': json.dumps(threat_action_name),
                                                     'grid_src':json.dumps(threat_action_security_control_map_dict_all)})
    if request.method=='POST':
        print "Here I am rock you like a hurricane"
        sc_name = request.POST["sc_name"].split(';')
        threat_action = request.POST['threat_action'].split(';')
        print sc_name, " ---> ", threat_action
        for ta in threat_action:
            for sc in sc_name:
                ta_sc = model.threat_action_security_control_map()
                ta_sc.sc_name = sc
                ta_sc.threat_action_name = ta
                sec_con = model.security_control.objects.get(sc_name=sc)
                ta_sc.sc_version = sec_con.sc_version
                ta_sc.save()
        return redirect('threatAction')
