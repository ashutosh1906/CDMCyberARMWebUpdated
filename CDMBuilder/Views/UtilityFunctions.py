def threat_action_list_as_dict(threat_action_object_list):
    threat_action_list = []
    for threat_action_obj in threat_action_object_list:
        threat_action_list.append(threat_action_obj.threat_action_name)
    # print threat_action_list
    return threat_action_list

def asset_list_as_dict(asset_object_list):
    asset_list = []
    for asset_obj in asset_object_list:
        asset_list.append(asset_obj.asset_name)
    return asset_list

###################################### fetch all the rows from the raw queries as dictionary ##############################
def dictfetchall(cursor):
    "Return all rows from a cursor as a dict"
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]