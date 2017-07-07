from CDMBuilder.Models import model
from CDMBuilder.Utilities import GlobalVariables

def init_cyber_defense_matrix():
    security_func_list = model.security_function.objects.all()
    for sec_func_obj in security_func_list:
        GlobalVariables.DATABASE_SECURITY_FUNCTION[sec_func_obj.sc_function_name] = sec_func_obj.id
        GlobalVariables.DATABASE_ID_TO_SECURITY_FUNCTION[sec_func_obj.id] = sec_func_obj.sc_function_name
    print "Security Function %s" % (GlobalVariables.DATABASE_SECURITY_FUNCTION)

    en_level_list = model.enforcement_level.objects.all()
    for en_level_obj in en_level_list:
        GlobalVariables.DATABASE_ENFORCEMENT_LEVEL[en_level_obj.en_level_name] = en_level_obj.id
        GlobalVariables.DATABASE_ID_TO_ENFORCEMENT_LEVEL[en_level_obj.id] = en_level_obj.en_level_name
    print "Enforcement Level %s" % (GlobalVariables.DATABASE_ENFORCEMENT_LEVEL)

    kill_chain_phase_list = model.kill_chain_phase.objects.all()
    for kc_phase_obj in kill_chain_phase_list:
        GlobalVariables.DATABASE_KILL_CHAIN_PHASE[kc_phase_obj.kc_phase] = kc_phase_obj.id
        GlobalVariables.DATABASE_ID_TO_KILL_CHAIN_PHASE[kc_phase_obj.id] = kc_phase_obj.kc_phase
    print "Kill Chain Phase %s" % (GlobalVariables.DATABASE_KILL_CHAIN_PHASE)
init_cyber_defense_matrix()