import os
############################################################ CyberARM Inputs ###############################################
BUDGET = 1532900
AFFORDABLE_RISK = 20069579
RISK_ELIMINATION = 1.0
VERIS_ASSET_NUMBER = 100
FILE_INDEX = 10
################################################################## File Names #############################################
################################################################# Method Flags ############################################
BINARY_SEARCH = 0
BINARY_MODIFIED_SEARCH = 1
ITERATIVE_SEARCH = 2
ITERATIVE_COST_ALLOCATION_SEARCH = 3
################################################################# End Method Flags ############################################
############################################################# Initial Files ###############################################
SECURITY_CONTROL_FILE = 'ResourceFolder/SecurityControls.csv'
THREAT_ACTION_SECURITY_CONTROL_FILE = 'ResourceFolder/ThreatActionSecurityControldistribution.csv'
# ############################################################# Output Files ################################################
# OUTPUT_FILE_DIRECTORY = "OutputRecords"
# OUTPUT_FILE_NAME_BINARY_SEARCH = open("%s/VERIS_%s_Compare_%s_0.txt"%(OUTPUT_FILE_DIRECTORY,VERIS_ASSET_NUMBER,FILE_INDEX),'w')
# OUTPUT_FILE_NAME_BINARY_SEARCH_MODIFIED = open("%s/VERIS_%s_Compare_%s_1.txt"%(OUTPUT_FILE_DIRECTORY,VERIS_ASSET_NUMBER,FILE_INDEX),'w')
# OUTPUT_FILE_NAME_ITERATIVE_SEARCH = open("%s/VERIS_%s_Compare_%s_2.txt"%(OUTPUT_FILE_DIRECTORY,VERIS_ASSET_NUMBER,FILE_INDEX),'w')
# # OUTPUT_FILE_NAME_ITERATIVE_COST_ALLOCATION_SEARCH = open("%s/VERIS_%s_Compare_%s_3.txt"%(OUTPUT_FILE_DIRECTORY,VERIS_ASSET_NUMBER,FILE_INDEX),'w')
# OUTPUT_STATISTICAL_FILE_NAME = "%s/StatsFile.csv" %(OUTPUT_FILE_DIRECTORY)
# OUTPUT_TIME_MIN_RISK_FILE_NAME = '%s/TimeAnalysis.csv' % (OUTPUT_FILE_DIRECTORY)
# OUTPUT_FILE_NAME_THREAT_ACTION_SPECIFIC_SECURITY_CONTROL = '%s/Ta_SC.csv' % (OUTPUT_FILE_DIRECTORY)
# ############################################################## Global Variables #############################################
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
TIMEOUT_DURATION = 1000*1000
SECURITY_CONTROL_COST_MEAN = 3500
SECURITY_CONTROL_COST_DEVIATION = 666
SECURITY_CONTROL_COST_MAX = 3000
SECURITY_CONTROL_COST_MIN = 5000
ITERATION_MODEL_SATISFACTION = 1
COST_MODEL_ITERATION = 1
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
######################################### Kill chain phase dimension ##################################################
RECON_KEY = 'recon'
WEAPONIZE_KEY = 'weaponize'
DELIVER_KEY = 'deliver'
EXPLOIT_KEY = 'exploit'
CONTROL_KEY = 'control'
EXECUTE_KEY = 'execute'
MAINTAIN_KEY = 'maintain'
KILL_CHAIN_PHASE_LIST = []
KILL_CHAIN_PHASE_TO_ID = {}
ID_TO_KILL_CHAIN_PHASE = {}

################################################## Enforcement Level Dimension ########################################
ENFORCEMENT_LEVEL_LIST = ['network','device','application','data','people']
ENFORCEMENT_LEVEL_TO_ID = {}
ID_TO_ENFORCEMENT_LEVEL = {}

################################################## Security Function Dimension ########################################
SECURITY_FUNCTION_LIST = ['identify','protect','detect','respond','recover']
SECURITY_FUNCTION_TO_ID = {}
ID_TO_SECURITY_FUNCTION = {}

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

