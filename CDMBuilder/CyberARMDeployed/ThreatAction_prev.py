import CyberARMPowerPlant
class ThreatAction(object):
    def __init__(self,ids,name):
        self.primary_key = ids
        self.threat_action_name = name
        self.prob_given_threat_asset = {}
        self.applicable_security_controls = []
        self.security_control_index = {}
        self.number_security_controls = 0
        self.asset_applicable_security_controls = []
        self.asset_security_control_index = {}
        self.asset_number_security_controls = 0

    def clearAssetSpecificList(self):
        self.asset_number_security_controls = 0
        self.asset_security_control_index.clear()
        del self.asset_applicable_security_controls[:]

    def addAssetSpecificSecurityControl(self,security_control_entity_id):
        self.asset_security_control_index[security_control_entity_id] = self.asset_number_security_controls
        self.asset_applicable_security_controls.append(security_control_entity_id)
        self.asset_number_security_controls += 1

    def setProbThreatAction(self,prob_threat_action_threat,prob_threat_action_threat_experience,enterprise_asset_list_given):
        for asset in enterprise_asset_list_given:
            if asset not in self.prob_given_threat_asset.keys():
                self.prob_given_threat_asset[asset] = {}
            if asset in prob_threat_action_threat.keys():
                for threat in prob_threat_action_threat[asset].keys():
                    if self.threat_action_name in prob_threat_action_threat[asset][threat].keys():
                        self.prob_given_threat_asset[asset][threat] = prob_threat_action_threat[asset][threat][self.threat_action_name]
            else:
                for threat in prob_threat_action_threat_experience[asset].keys():
                    if self.threat_action_name in prob_threat_action_threat_experience[asset][threat].keys():
                        self.prob_given_threat_asset[asset][threat] = prob_threat_action_threat_experience[asset][threat][self.threat_action_name]

    def addSecurityControl(self,security_control_entity_id):
        if security_control_entity_id in self.applicable_security_controls:
            return
        self.applicable_security_controls.append(security_control_entity_id)
        self.security_control_index[security_control_entity_id] = self.number_security_controls
        self.number_security_controls += 1

    def printProperties(self,asset_name):
        CyberARMPowerPlant.write_output_file.write("\nID : %s Name : %s\n" % (self.primary_key,self.threat_action_name))
        CyberARMPowerPlant.write_output_file.write("Security Control %s\n" % (self.asset_applicable_security_controls))
        CyberARMPowerPlant.write_output_file.write("Security Control Index : %s\n" % (self.asset_security_control_index))
        CyberARMPowerPlant.write_output_file.write("Threat  --->\n")
        CyberARMPowerPlant.write_output_file.write("     For Asset Name %s\n" % (asset_name))
        for i in self.prob_given_threat_asset[asset_name].keys():
            CyberARMPowerPlant.write_output_file.write("                                      Threat Name : %s Prob %s\n" % (i,self.prob_given_threat_asset[asset_name][i]))


