import os
############################################################ CyberARM Inputs ###############################################
ASSET_LIST_INDEX = 5
BUDGET_LIST = [6286259,5070163.0,4007406.0,3116207.0,1983411.0,967526.0,521097.0]
BUDGET = BUDGET_LIST[ASSET_LIST_INDEX]
AFFORDABLE_RISK =  65069579#55306264
RISK_ELIMINATION = 0.65
VERIS_ASSET_NUMBER_LIST = [600,500,400,300,200,100,50]
VERIS_ASSET_NUMBER = VERIS_ASSET_NUMBER_LIST[ASSET_LIST_INDEX]
FILE_INDEX = 500
MAX_SEC_THREAT_ACTION = 1
# RISK_ELIMINATION_LIST = [0.65,0.70,0.75,0.8,0.85,0.9,0.95,0.98,1.0]
RISK_ELIMINATION_LIST = [.8]
OUTPUT_STATISTIC_FILE_ID = 'Test'
ROI_VALUE = 16.0
OUTPUT_RESULT_FILE_INDEX = 0
INCLUDE_ROI = True
################################################################## File Names #############################################
################################################################# Method Flags ############################################
BINARY_SEARCH = 0
BINARY_MODIFIED_SEARCH = 1
ITERATIVE_SEARCH = 2
ITERATIVE_COST_ALLOCATION_SEARCH = 3
################################################################# End Method Flags ############################################
############################################################# Initial Files ###############################################
############################################################# Initial Files ###############################################
RESOURCE_FOLDER = 'ResourceFolder'
# SECURITY_CONTROL_FILE = 'ResourceFolder/SecurityControls.csv'
SECURITY_CONTROL_FILE = '%s/%s/CSCMapping.csv' % (os.path.abspath(os.path.dirname(__file__)),RESOURCE_FOLDER)
THREAT_ACTION_SECURITY_CONTROL_FILE = '%s/%s/ThreatActionSecurityControlNew.csv' % (os.path.abspath(os.path.dirname(__file__)),RESOURCE_FOLDER)
# THREAT_ACTION_SECURITY_CONTROL_FILE = 'ResourceFolder/ThreatActionSecurityControldistribution.csv'


############################################################# Output Files ################################################
OUTPUT_FILE_DIRECTORY = "OutputRecords"
# OUTPUT_FILE_NAME_BINARY_SEARCH = open("%s/VERIS_%s_Compare_%s_%s_0.txt"%(OUTPUT_FILE_DIRECTORY,VERIS_ASSET_NUMBER,FILE_INDEX,MAX_SEC_THREAT_ACTION),'w')
# # OUTPUT_FILE_NAME_BINARY_SEARCH_MODIFIED = open("%s/VERIS_%s_Compare_%s_%s_1.txt"%(OUTPUT_FILE_DIRECTORY,VERIS_ASSET_NUMBER,FILE_INDEX,MAX_SEC_THREAT_ACTION),'w')
# # OUTPUT_FILE_NAME_ITERATIVE_SEARCH = open("%s/VERIS_%s_Compare_%s_%s_2.txt"%(OUTPUT_FILE_DIRECTORY,VERIS_ASSET_NUMBER,FILE_INDEX,MAX_SEC_THREAT_ACTION),'w')
# # OUTPUT_FILE_NAME_ITERATIVE_COST_ALLOCATION_SEARCH = open("%s/VERIS_%s_Compare_%s_3.txt"%(OUTPUT_FILE_DIRECTORY,VERIS_ASSET_NUMBER,FILE_INDEX),'w')
# OUTPUT_STATISTICAL_FILE_NAME = "%s/StatsFile_%s.csv" %(OUTPUT_FILE_DIRECTORY,OUTPUT_STATISTIC_FILE_ID)
# OUTPUT_TIME_MIN_RISK_FILE_NAME = '%s/TimeAnalysis_%s.csv' % (OUTPUT_FILE_DIRECTORY,OUTPUT_STATISTIC_FILE_ID)
# OUTPUT_FILE_NAME_THREAT_ACTION_SPECIFIC_SECURITY_CONTROL = '%s/Ta_SC.csv' % (OUTPUT_FILE_DIRECTORY)
############################################################## Global Variables #############################################
OTHER_ASSET = 'other'
DESTROY_C = 4
DESTROY_I = 2
DESTROY_A = 1
ASSET_UNKNOWN_TAG = 'unknown'
THREAT_ACTION_UNKNOWN_TAG = 'unknown'
HACKING_COST = DESTROY_C | DESTROY_I | DESTROY_A
MALWARE_COST = DESTROY_C | DESTROY_I | DESTROY_A
SOCIAL_COST = DESTROY_C | DESTROY_I | DESTROY_A
ENVIRONMENTAL_COST = DESTROY_C | DESTROY_I | DESTROY_A
ERROR_COST = DESTROY_C | DESTROY_I | DESTROY_A
MISUSE_COST = DESTROY_C | DESTROY_I | DESTROY_A
PHYSICAL_COST = DESTROY_C | DESTROY_I | DESTROY_A
THREAT_MAP_COST = {}
THREAT_PRIORITIZATION_THRESHOLD = 0.05
THREAT_ACTION_MINIMUM_CONSEQUENCE = 2
CHOSEN_NUMBER_THREAT_ACTION = 6
RESOURCE_FOLDER = 'ResourceFolder'
INPUT_FILE_PATH = 'CyberARMInputFile'
VERIS_LIST = 0
EXPERIENCE_LIST = 1
CYBERARM_CDM_MATRIX = 0
CYBERARM_RISK = 1
CYBERARM_ROI = 2
NUMBER_OF_CYBERARM_OUTPUT = 3
TIMEOUT_DURATION = 400*1000
SECURITY_CONTROL_COST_MEAN = 3500
SECURITY_CONTROL_COST_DEVIATION = 666
SECURITY_CONTROL_COST_MAX = 3000
SECURITY_CONTROL_COST_MIN = 5000
ITERATION_MODEL_SATISFACTION = 1
COST_MODEL_ITERATION = 1
RESULT_OUTPUT_FILE_NAME = '%s/%s/OutResult' % (os.path.abspath(os.path.dirname(__file__)),OUTPUT_FILE_DIRECTORY)
BUDGET_COST_DISTRIBUTION_FILE = ('%s/%s/InputBudgetAffordableRisk.txt')%(os.path.abspath(os.path.dirname(__file__)),RESOURCE_FOLDER)
################################################### Read from single THreat statistics file ##################
WRITE_FILE_NAME = 'Global_Threat_Statistics.txt'
FILENAME_TAG_OPEN = '<'
FILENAME_TAG_CLOSE = '>'
ASSET_TAG_WRITE_OPEN = "<<"
ASSET_TAG_WRITE_CLOSE = ">>"
THREAT_TAG_OPEN = '<<<'
THREAT_TAG_CLOSE = '>>>'
THREAT_ACTION_TAG_OPEN = '<<<<'
THREAT_ACTION_TAG_CLOSE = '>>>>'
VERIS_LIST_FILE = 'ResourceFolder/InputFiles/veris_list_%s.txt'%(VERIS_ASSET_NUMBER)
EXPERIENCE_LIST_FILE = 'ExperienceList.txt'

###################################### SECURITY CONTROL FILE PARSING ELEMENTS ########################
VERSION_PLACE = 0
SC_NAME_PLACE = 1
SEC_FUNC_PLACE = 2
KILL_CHAIN_PHASE_PLACE = 3
ENFORCEMENT_LEVEL_PLACE = 4
COST_PLACE = 5
SC_FILE_PARSER = ';'
SECURITY_CONTROL_FILE_PARSER_CHARACTER = ';'


############################## Threat Action To Security Control Parsing Elements #######################
THREAT_ACTION_SECURITY_CONTROL_FILE_PARSER_CHARACTER = ';'
THREAT_ACTION_NAME_PLACE = 0
SEC_VERSION_PLACE = 1
EFFECETIVENESS_PLACE = 2

################################# SMT ENVIRONMENT VARIABLE KEY ##############################################
GLOBAL_TOTAL_COST_KEY = 'global_total_cost'
GLOBAL_MIN_RISK_KEY = 'global_min_risk'
GLOBAL_ESTIMATED_RISK_KEY = 'global_estimated_risk'
MIN_SEC_CONTROL_COST_KEY = 'min_sec_control_cost'

######################################### ROI Stattistics #####################################################
IMPOSED_RISK = 'Imposed Risk'
RESIDUAL_RISK = 'Residual Risk'
MITIGATED_RISK = 'Mitigated Risk'
ROI = 'ROI'
TOTAL_IMPLEMENTATION_COST = 'Total Implementation Cost'
K_THRESHOLD = 1000

###################################### Constraints Properties ####################################################
COST_DISTRIBUTION_PROPERTIES = 0
COST_DISTRIBUTION_CONSTRAINT_ENABLED = False
ASSET_BASED_DISTRIBUTION_PROPERTIES = 1
ASSET_BASED_DISTRIBUTION_CONSTRAINT_ENABLED = False

######################################### Kill chain phase dimension ##################################################
RECON_KEY = 'reconnaissance'
WEAPONIZE_KEY = 'weaponization'
DELIVER_KEY = 'delivery'
EXPLOIT_KEY = 'exploitation'
CONTROL_KEY = 'c2'
EXECUTE_KEY = 'execute'
MAINTAIN_KEY = 'maintain'
INSTALLATION_KEY = 'installation'
KILL_CHAIN_PHASE_LIST = []
KILL_CHAIN_PHASE_TO_ID = {}
ID_TO_KILL_CHAIN_PHASE = {}
NUMBER_OF_KILL_CHAIN_PHASE = 8

################################################## Enforcement Level Dimension ########################################
ENFORCEMENT_LEVEL_LIST = ['network','device','application','data','people']
ENFORCEMENT_LEVEL_TO_ID = {}
ID_TO_ENFORCEMENT_LEVEL = {}
NUMNBER_OF_ENFORCEMENT_LEVEL = len(ENFORCEMENT_LEVEL_LIST)

################################################## Security Function Dimension ########################################
SECURITY_FUNCTION_LIST = ['identify','protect','detect','respond','recover']
SECURITY_FUNCTION_TO_ID = {}
ID_TO_SECURITY_FUNCTION = {}
NUMBER_OF_SECURITY_FUNCTION = len(SECURITY_FUNCTION_LIST)

################################################# CDM Dimension Description ###########################################
SECURITY_FUNCTION_AXIS = 2
ENFORCEMENT_LEVEL_AXIS = 1
KILL_CHAIN_PHASE_AXIS = 0
NUMBER_OF_AXIS = 3
AXIS_NUMBER_UNIQUE_VALUES = range(NUMBER_OF_AXIS)
AXIS_NUMBER_UNIQUE_VALUES[SECURITY_FUNCTION_AXIS] = NUMBER_OF_SECURITY_FUNCTION
AXIS_NUMBER_UNIQUE_VALUES[ENFORCEMENT_LEVEL_AXIS] = NUMNBER_OF_ENFORCEMENT_LEVEL
AXIS_NUMBER_UNIQUE_VALUES[KILL_CHAIN_PHASE_AXIS] = NUMBER_OF_KILL_CHAIN_PHASE

def init_conf():
    THREAT_MAP_COST['malware'] = MALWARE_COST
    THREAT_MAP_COST['hacking'] = HACKING_COST
    THREAT_MAP_COST['social'] = SOCIAL_COST
    THREAT_MAP_COST['environmental'] = ENVIRONMENTAL_COST
    THREAT_MAP_COST['error'] = ERROR_COST
    THREAT_MAP_COST['misuse'] = MISUSE_COST
    THREAT_MAP_COST['physical'] = PHYSICAL_COST

    ################################################# map to kill-chain-phase ################################################################
    KILL_CHAIN_PHASE_LIST.append(RECON_KEY)
    KILL_CHAIN_PHASE_LIST.append(WEAPONIZE_KEY)
    KILL_CHAIN_PHASE_LIST.append(DELIVER_KEY)
    KILL_CHAIN_PHASE_LIST.append(EXPLOIT_KEY)
    KILL_CHAIN_PHASE_LIST.append(INSTALLATION_KEY)
    KILL_CHAIN_PHASE_LIST.append(CONTROL_KEY)
    KILL_CHAIN_PHASE_LIST.append(EXECUTE_KEY)
    KILL_CHAIN_PHASE_LIST.append(MAINTAIN_KEY)
    for i in range(len(KILL_CHAIN_PHASE_LIST)):
        KILL_CHAIN_PHASE_TO_ID[KILL_CHAIN_PHASE_LIST[i]] = i
        ID_TO_KILL_CHAIN_PHASE[i] = KILL_CHAIN_PHASE_LIST[i]

    ###################################################### Map to Enforcement Level ################################################################
    for i in range(len(ENFORCEMENT_LEVEL_LIST)):
        ENFORCEMENT_LEVEL_TO_ID[ENFORCEMENT_LEVEL_LIST[i]] = i
        ID_TO_ENFORCEMENT_LEVEL[i] = ENFORCEMENT_LEVEL_LIST[i]

    ############################################## MAP TO SECURITY FUNCTION ############################################################################
    for i in range(len(SECURITY_FUNCTION_LIST)):
        SECURITY_FUNCTION_TO_ID[SECURITY_FUNCTION_LIST[i]] = i
        ID_TO_SECURITY_FUNCTION[i] = SECURITY_FUNCTION_LIST[i]


def uploadFiles():
    PROJECT_ROOT = "%s/%s/%s" % (
        os.path.abspath(os.path.dirname(__file__)),RESOURCE_FOLDER,INPUT_FILE_PATH)
    print "Aleadry Saved File"
    file_list = []
    for root, dir, files in os.walk(PROJECT_ROOT, topdown=False):
        for filename in files:
            print filename
            file_list.append(filename)
    return file_list

# def appendSelectedControls(number_selected_security_controls):
#     OUTPUT_FILE_NAME_BINARY_SEARCH.write(
#         "Number of Selected Security Controls %s\n" % (number_selected_security_controls))
#     # OUTPUT_FILE_NAME_BINARY_SEARCH_MODIFIED.write(
#     #     "Number of Selected Security Controls %s\n" % (number_selected_security_controls))
#     # OUTPUT_FILE_NAME_ITERATIVE_SEARCH.write(
#     #     "Number of Selected Security Controls %s\n" % (number_selected_security_controls))
#
# def closeFiles():
#     OUTPUT_FILE_NAME_BINARY_SEARCH.close()
#     # OUTPUT_FILE_NAME_BINARY_SEARCH_MODIFIED.close()
#     # OUTPUT_FILE_NAME_ITERATIVE_SEARCH.close()

def cost_constraint_development():
    cost_distribution_constraint_smt = [[] for i in range(3)]
    cost_distribution_constraint_smt[SECURITY_FUNCTION_AXIS] = [0 for i in range(len(SECURITY_FUNCTION_LIST))]
    cost_distribution_constraint_smt[ENFORCEMENT_LEVEL_AXIS] = [0 for i in range(len(ENFORCEMENT_LEVEL_LIST))]
    cost_distribution_constraint_smt[KILL_CHAIN_PHASE_AXIS] = [0 for i in range(len(KILL_CHAIN_PHASE_LIST))]

    ################################################### Constraint Sample #####################################################################################
    cost_distribution_constraint_smt[SECURITY_FUNCTION_AXIS][SECURITY_FUNCTION_TO_ID['protect']] = 0.20
    cost_distribution_constraint_smt[ENFORCEMENT_LEVEL_AXIS][ENFORCEMENT_LEVEL_TO_ID['network']] = 0.07
    cost_distribution_constraint_smt[KILL_CHAIN_PHASE_AXIS][KILL_CHAIN_PHASE_TO_ID['reconnaissance']] = 0.11
    ####################################### This above mentioned contraint describes that the cost of PROTECT security function will
    ######################################### be at least 20% of the Budget. The (+ve) indicates that the smt output value should be greater equal
    ######################################## whereas the (-)ve indicates the smt output should be less than that value ###########################
    return cost_distribution_constraint_smt

def asset_based_distribution_development(asset_enterprise_list,selected_security_controls):
    """Build the constrainst for the specific asset"""

    ##################################### Find the asset index for the designated assets and enforce the constraints for those assets #################################
    designated_asset_list = {}
    designated_asset_list['documents'] = [(SECURITY_FUNCTION_AXIS,SECURITY_FUNCTION_TO_ID['recover'],0.20)]
    designated_asset_list['dns'] = [(ENFORCEMENT_LEVEL_AXIS, ENFORCEMENT_LEVEL_TO_ID['network'], 0.15)]
    designated_asset_constraint_properties = {}
    # designated_asset_classified_properties = {key:[[],designated_asset_list[key]] for key in designated_asset_list.keys()}
    print "Asset Enterprise List %s" % (asset_enterprise_list)
    asset_index = 0
    for asset_type in range(len(asset_enterprise_list)):
        for asset in asset_enterprise_list[asset_type]:
            # print("Asset Name %s : %s" % (asset_index,asset[0]))
            if asset[0] in designated_asset_list.keys():
                if asset_index not in designated_asset_constraint_properties.keys():
                    designated_asset_constraint_properties[asset_index] = []
                for all_cons in designated_asset_list[asset[0]]:
                    designated_asset_constraint_properties[asset_index].append(all_cons)
                # designated_asset_classified_properties[asset[0]][0].append(asset_index)
            asset_index += 1
    print("Required Asset Index %s" % (designated_asset_constraint_properties))
    return designated_asset_constraint_properties
    # print("Required Classfied Asset %s" % (designated_asset_classified_properties))

