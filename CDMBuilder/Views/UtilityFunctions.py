import json
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

#################################### Fetch all the assets in the input assets ############################################
def readBudgetAffordableRisk():
    from CDMBuilder.CyberARMDeployed.ProjectConfigFile import BUDGET_COST_DISTRIBUTION_FILE
    budget_read = open(BUDGET_COST_DISTRIBUTION_FILE,'r+')
    budget_risk_dict = {}
    for line in budget_read:
        line = line.replace('\n','').split(':')
        asset_numbers = int(line[0])
        budget_afford_risk_str = line[1].split(',')
        budget_afford_risk = []
        risk_elem_value = float(budget_afford_risk_str[0])
        for value in budget_afford_risk_str:
            budget_afford_risk.append(float(value))
        if asset_numbers not in budget_risk_dict.keys():
            budget_risk_dict[asset_numbers] = {}
        if risk_elem_value not in budget_risk_dict[asset_numbers].keys():
            budget_risk_dict[asset_numbers][float(budget_afford_risk_str[0])]=[budget_afford_risk]
    print "Budget Risk %s" % (budget_risk_dict)
    return budget_risk_dict