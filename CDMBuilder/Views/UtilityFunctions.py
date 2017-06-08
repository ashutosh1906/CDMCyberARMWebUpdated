def threat_action_list_as_dict(threat_action_object_list):
    threat_action_list = []
    for threat_action_obj in threat_action_object_list:
        threat_action_list.append(threat_action_obj.threat_action_name)
    # print threat_action_list
    return threat_action_list