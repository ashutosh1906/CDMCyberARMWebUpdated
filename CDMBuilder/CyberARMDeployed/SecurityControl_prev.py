import random
import ProjectConfigFile, ThreatAction,CyberARMPowerPlant
class SecurityControl(object):
    def __init__(self,primary_key,version,name,kill_chain_phase,en_level,sec_func):
        self.primary_key = primary_key
        self.sc_version = version
        self.sc_name = name
        self.kc_phase = ProjectConfigFile.KILL_CHAIN_PHASE_TO_ID[kill_chain_phase]
        self.en_level = ProjectConfigFile.ENFORCEMENT_LEVEL_TO_ID[en_level]
        self.sc_function = ProjectConfigFile.SECURITY_FUNCTION_TO_ID[sec_func]
        self.threat_action = []
        self.threat_action_effectiveness = {}
        self.number_threat_action = 0
        self.asset_threat_action_list = []
        self.investment_cost = random.randint(1000,5000)

    def clearAllThreatActions(self):
        del self.asset_threat_action_list[:]

    def addAssetThreatAction(self,threat_action_entity_id):
        self.asset_threat_action_list.append(threat_action_entity_id)

    def addThreatAction(self,threat_action_entity_id,effectiveness):
        if threat_action_entity_id in self.threat_action:
            return
        self.threat_action.append(threat_action_entity_id)
        self.threat_action_effectiveness[threat_action_entity_id] = effectiveness
        self.number_threat_action += 1

    def printProperties(self):
        CyberARMPowerPlant.write_output_file.write("\nID : %s Name : %s" % (self.primary_key,self.sc_name))
        CyberARMPowerPlant.write_output_file.write("Threat Action : ---------> \n")
        for threat_act in self.asset_threat_action_list:
            CyberARMPowerPlant.write_output_file.write("                                  Threat Action ID : %s ------- Effectiveness : %s\n" % (threat_act,self.threat_action_effectiveness[threat_act]))
