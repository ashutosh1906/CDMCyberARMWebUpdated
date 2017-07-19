from CDMBuilder.CyberARMDeployed import ThreatThreatActionMapDatabase
from django.http import HttpResponse
from django.shortcuts import render
from CDMBuilder.Models import model
from CDMBuilder.Utilities import GlobalVariables
from django.db import connection
import json

def insertMapThreatThreatAction(request):
    print "Insert The Threat Threat Action Relationship"
    threat_threat_action_map = {}
    ThreatThreatActionMapDatabase.read_the_directory(threat_threat_action_map)
    # print "Threat Threat Action Map %s" % (threat_threat_action_map)
    for threat in threat_threat_action_map.keys():
        for threat_action in threat_threat_action_map[threat]:
            try:
                threat_threat_action_entity = model.threat_threat_action(threat=threat,threat_action=threat_action)
                threat_threat_action_entity.save()
            except:
                print "Exception in %s : %s" % (threat)
    return HttpResponse("Successful request")

def dictfetchall(cursor):
    "Return all rows from a cursor as a dict"
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]

def objectToArrayOfDict():
    query_cursor = connection.cursor()
    query_cursor.execute('select * from cyber_defense_matrix_norm join security_control on cyber_defense_matrix_norm.sc_version = security_control.sc_version')
    cdm_entries = dictfetchall(query_cursor)
    print "CDM Entries %s" % (cdm_entries)
    cdm_entries_grid_list = []
    for index in range(len(cdm_entries)-1,-1,-1):
        cdm_row = cdm_entries[index]
        row = {}
        row['id'] = cdm_row['id']
        row['sc_version'] = cdm_row['sc_version']
        row['sc_name'] = cdm_row['sc_name']
        row['sc_func'] = GlobalVariables.DATABASE_ID_TO_SECURITY_FUNCTION[cdm_row['sc_func_id']]
        row['en_level_name'] = GlobalVariables.DATABASE_ID_TO_ENFORCEMENT_LEVEL[cdm_row['en_level_id']]
        row['kc_phase_name'] = GlobalVariables.DATABASE_ID_TO_KILL_CHAIN_PHASE[cdm_row['kc_phase_id']]
        row['explanation_row'] = cdm_row['explanation']
        cdm_entries_grid_list.append(row)
    return cdm_entries_grid_list

def CSC_Classification(request):
    if request.method == "GET":
        send_data = {}
        send_data['kc_phase'] = json.dumps(GlobalVariables.DATABASE_KILL_CHAIN_PHASE.keys())
        send_data['en_level'] = json.dumps(GlobalVariables.DATABASE_ENFORCEMENT_LEVEL.keys())
        send_data['sc_func'] = json.dumps(GlobalVariables.DATABASE_SECURITY_FUNCTION.keys())
        security_control_list = model.security_control.objects.all().order_by('sc_parent')
        sc_name_list = []
        sc_version_list = []
        for sc_obj in security_control_list:
            sc_name_list.append('%s (%s)'%(sc_obj.sc_name,sc_obj.sc_version))
            sc_version_list.append(sc_obj.sc_version)
        send_data['cdm_entries'] = json.dumps(objectToArrayOfDict())
        send_data['sc_name'] = json.dumps(sc_name_list)
        send_data['sc_version'] = json.dumps(sc_version_list)
        print "Send Data %s" % (send_data)
        return render(request,'insertCDMUpdated.html',send_data)
    if request.method == "POST":
        json_loads = json.loads(request.body.decode("utf-8"))
        print "Got the Add request %s" % (json_loads)
        en_level_id = GlobalVariables.DATABASE_ENFORCEMENT_LEVEL[json_loads['en_level']]
        sc_func_id = GlobalVariables.DATABASE_SECURITY_FUNCTION[json_loads['sc_func']]
        kc_phase_id = GlobalVariables.DATABASE_KILL_CHAIN_PHASE[json_loads['kc_phase']]
        explanation = json_loads['explanation']
        cdm_row = model.cyber_defense_matrix_norm(sc_version=json_loads['sc_version'],en_level_id=en_level_id,
                                                  kc_phase_id=kc_phase_id,sc_func_id=sc_func_id,explanation=explanation)
        cdm_row.save()
        return HttpResponse(
            json.dumps(objectToArrayOfDict()),
            content_type="application/json"
        )

def edit_CSC_Classification(request):
    json_loads = json.loads(request.body.decode("utf-8"))
    print "Got the Edit request %s" % (json_loads)
    en_level_id = GlobalVariables.DATABASE_ENFORCEMENT_LEVEL[json_loads['en_level']]
    sc_func_id = GlobalVariables.DATABASE_SECURITY_FUNCTION[json_loads['sc_func']]
    kc_phase_id = GlobalVariables.DATABASE_KILL_CHAIN_PHASE[json_loads['kc_phase']]
    explanation = json_loads['explanation']
    csc_row = model.cyber_defense_matrix_norm.objects.get(id=json_loads['id'])
    csc_row.sc_func_id = sc_func_id
    csc_row.en_level_id = en_level_id
    csc_row.kc_phase_id = kc_phase_id
    csc_row.explanation = explanation
    csc_row.save()
    return HttpResponse(
        json.dumps(objectToArrayOfDict()),
        content_type="application/json"
    )
