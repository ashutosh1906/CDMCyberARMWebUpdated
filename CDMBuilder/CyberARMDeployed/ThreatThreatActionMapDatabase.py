import os,json
import ProjectConfigFile
###################################################### Global Variables #######################################################
DATABASE_PATH = 'VERIS'
THREAT_NAME = 'action'
THREAT_ACTION_NAME = 'variety'
UNKNOWN_TAG = 'unknown'
AVOID_WORDS = ['notes']
###################################################### End Global Variables ###################################################
def printThreatThreatActionMap(threat_threat_action_map):
    for threat in threat_threat_action_map.keys():
        print "\nThreat Name %s" % (threat)
        for threat_action in threat_threat_action_map[threat]:
            print "%s," % (threat_action),
    print ""

def read_json_file(threat_report, threat_threat_action_map):
    if THREAT_NAME in threat_report.keys():
        for threat in threat_report[THREAT_NAME].keys():
            if threat in AVOID_WORDS:
                continue
            if THREAT_ACTION_NAME not in threat_report[THREAT_NAME][threat].keys():
                continue
            if threat not in threat_threat_action_map.keys():
                threat_threat_action_map[threat] = []

            ############################################################################## Threat Action ####################################################################
            threat_action_list = threat_report[THREAT_NAME][threat][THREAT_ACTION_NAME]
            for threat_action in threat_action_list:
                threat_action = threat_action.lower()
                if threat_action == UNKNOWN_TAG:
                    continue
                if threat_action not in threat_threat_action_map[threat]:
                    threat_threat_action_map[threat].append(threat_action)

def read_the_directory(threat_threat_action_map):
    PROJECT_ROOT = "%s/%s/%s" % (os.path.abspath(os.path.dirname(__file__)), ProjectConfigFile.RESOURCE_FOLDER, DATABASE_PATH)
    ####################################################### Open the files of the root directory ########################################################
    for root, dir, files in os.walk(PROJECT_ROOT, topdown=False):
        # print "Root : %s Dir : %s Files : %s" % (root,dir,files)
        for filename in files:
            current_file = open(os.path.join(root, filename), 'r+')
            # print "Current File Name %s" % (filename)
            try:
                threat_report = json.load(current_file)
                read_json_file(threat_report,threat_threat_action_map)
            except:
                print "Here the culprit ", filename
                continue
    printThreatThreatActionMap(threat_threat_action_map)