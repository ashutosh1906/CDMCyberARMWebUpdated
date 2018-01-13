from django.db import models
class Person(models.Model):
    user_name = models.CharField(max_length=100)
    user_password = models.CharField(max_length=100)
    class Meta:
        db_table='person'

##############################################model for CDM###########################################################
class cyber_defense_matrix(models.Model):
    security_control_name = models.CharField(max_length=200)
    sc_version = models.CharField(max_length=100)
    kill_chain_phase = models.CharField(max_length=50)
    # enforcement_level = models.CharField(max_length=50)
    sc_function = models.CharField(max_length=50)
    class Meta:
        db_table='Cyber_Defense_Matrix'

class sc_version_enforcement_level(models.Model):
    id = models.IntegerField(primary_key=True)
    sc_version = models.CharField(max_length=50)
    enforcement_level = models.CharField(max_length=50)
    class Meta:
        db_table = 'sc_to_enforcement_level'

class threat_action_to_security_control(models.Model):
    asset_name = models.CharField(max_length=200)
    security_control_id = models.IntegerField()
    threat_action = models.CharField(max_length=200)
    class Meta:
        db_table = 'threat_action_to_security_control'

class Threat_Action(models.Model):
    threat_action_name = models.CharField(max_length=200)
    class Meta:
        db_table = 'threat_action'

class Threat_Action_Updated(models.Model):
    threat_action_name = models.CharField(max_length=200)
    class Meta:
        db_table = 'threat_action_updated'

class Asset_VERIS(models.Model):
    asset_name = models.CharField(max_length=200)
    class Meta:
        db_table = 'asset_veris'

class threat_threat_action(models.Model):
    threat = models.CharField(max_length=200)
    threat_action = models.CharField(max_length=200,primary_key=True)
    class Meta:
        db_table = 'threat_threat_action'
        unique_together=(('threat','threat_action'),)

class security_control(models.Model):
    sc_name = models.CharField(max_length=200)
    sc_version = models.CharField(max_length=100,primary_key=True)
    sc_parent = models.FloatField()
    class Meta:
        db_table = 'security_control'

class security_function(models.Model):
    sc_function_name = models.CharField(max_length=200)
    class Meta:
        db_table = 'security_function'

class enforcement_level(models.Model):
    en_level_name = models.CharField(max_length=200)
    class Meta:
        db_table = 'enforcement_level'

class kill_chain_phase(models.Model):
    kc_phase = models.CharField(max_length=200)
    class Meta:
        db_table = 'kill_chain_phase'

class cyber_defense_matrix_norm(models.Model):
    sc_version = models.CharField(max_length=200)
    sc_func_id = models.CharField(max_length=200)
    en_level_id = models.CharField(max_length=200)
    kc_phase_id = models.CharField(max_length=200)
    explanation = models.CharField(max_length=500)
    class Meta:
        db_table = 'cyber_defense_matrix_norm'

class threat_action_kc_phase(models.Model):
    kc_phase = models.CharField(max_length=200,)
    threat_action_name = models.CharField(max_length=200)
    class Meta:
        db_table = 'threat_action_kc_phase'
        unique_together=(('kc_phase','threat_action_name'),)

class threat_action_security_control_map(models.Model):
    threat_action_name = models.CharField(max_length=200)
    sc_name = models.CharField(max_length=200)
    sc_version = models.CharField(max_length=200)
    class Meta:
        db_table='threat_action_security_control_map'
