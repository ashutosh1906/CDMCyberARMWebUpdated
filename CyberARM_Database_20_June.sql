-- MySQL dump 10.13  Distrib 5.7.18, for Win64 (x86_64)
--
-- Host: localhost    Database: cyberarmrecent
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asset_veris`
--

DROP TABLE IF EXISTS `asset_veris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_veris` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_veris`
--

LOCK TABLES `asset_veris` WRITE;
/*!40000 ALTER TABLE `asset_veris` DISABLE KEYS */;
INSERT INTO `asset_veris` VALUES (1,'database'),(2,'laptop'),(3,'disk media'),(4,'web application'),(5,'documents'),(6,'desktop'),(7,'flash drive'),(8,'mail'),(9,'other'),(10,'executive'),(11,'system admin'),(12,'payment card'),(13,'gas terminal'),(14,'cashier'),(15,'manager'),(16,'file'),(17,'atm'),(18,'smart card'),(19,'disk drive'),(20,'kiosk'),(21,'ped pad'),(22,'end-user'),(23,'mobile phone'),(24,'router or switch'),(25,'telephone'),(26,'backup'),(27,'pos terminal'),(28,'finance'),(29,'media'),(30,'customer'),(31,'dns'),(32,'tapes'),(33,'authentication'),(34,'remote access'),(35,'partner'),(36,'pos controller'),(37,'mainframe'),(38,'wlan'),(39,'ids'),(40,'firewall'),(41,'log'),(42,'camera'),(43,'broadband'),(44,'pbx'),(45,'tablet'),(46,'guard'),(47,'code repository'),(48,'human resources'),(49,'directory'),(50,'call center'),(51,'maintenance'),(52,'developer'),(53,'san'),(54,'former employee'),(55,'dhcp'),(56,'ics'),(57,'vm host'),(58,'public wan'),(59,'helpdesk'),(60,'peripheral'),(61,'payment switch'),(62,'private wan'),(63,'lan'),(64,'access reader'),(65,'proxy');
/*!40000 ALTER TABLE `asset_veris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cyber_defense_matrix`
--

DROP TABLE IF EXISTS `cyber_defense_matrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cyber_defense_matrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `security_control_name` varchar(200) NOT NULL,
  `sc_version` varchar(20) NOT NULL,
  `kill_chain_phase` varchar(50) DEFAULT NULL,
  `sc_function` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `version` (`sc_version`)
) ENGINE=MyISAM AUTO_INCREMENT=150 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cyber_defense_matrix`
--

LOCK TABLES `cyber_defense_matrix` WRITE;
/*!40000 ALTER TABLE `cyber_defense_matrix` DISABLE KEYS */;
INSERT INTO `cyber_defense_matrix` VALUES (1,'Automaed Asset Inventory','1.1','Exploit','Identify'),(2,'DHCP Server Logging','1.2','Exploit','Identify'),(3,'Asset Inventory System with Update','1.3','Exploit','Identify'),(4,'Asset Inventory for Devices Connected to Internet','1.4','Exploit','Identify'),(5,'Network Level Authentication','1.5','Deliver','Identify'),(6,'Client Certificate','1.6','Deliver','Identify'),(7,'Authorized Software Inventory','2.1','Exploit','Identify'),(8,'Application Whitelisting','2.2','Exploit','Protect'),(9,'Virtual Machine','2.4','Deliver','Protect'),(10,'Standardized Image of Secure Configuration','3.1','Recon','Identify'),(11,'Strict Configurations for Systems','3.2','Recon','Identify'),(12,'Secure Channel for Devices\' Remote Administration ','3.4','Recon','Protect'),(13,'File Integrity Checking Tool','3.5','Exploit','Detect'),(14,'Automated Configuration Monitoring','3.6','Maintain','Detect'),(15,'System Configuration Management Tool','3.7','Maintain','Protect'),(16,'Automated Vulnerability Scanning ','4.1','Recon','Identify'),(17,'Vulnerability Scanning Log','4.2','Recon','Identify'),(18,'Authenticated Vulnerability Scanning','4.3','Recon','Identify'),(19,'Vulnerability Intelligent Service','4.4','Recon','Identify'),(20,'Automated Patch Management','4.5','Exploit','Protect'),(21,'Risk Assessment','4.7','Recon','Identify'),(22,'Risk Rate Vulnerabilities','4.8','Recon','Identify'),(23,'Minimize Administrative Privileges','5.1','Exploit','Protect'),(24,'Administrative Account Inventory','5.2','Exploit','Protect'),(25,'Change Default Passwords','5.3','Exploit','Protect'),(26,'Administrator Account Modification Log','5.4','Exploit','Protect'),(27,'Multi-Factor Authentication','Protect','Exploit','Protect'),(28,'Log Unsuccessful Login','5.5','Exploit','Detect'),(29,'Multi-Factor Authentication','5.6','Exploit','Protect'),(30,' Password Constraint','5.7','Exploit','Protect'),(31,'Migration from Non-Administrative to Administrative','5.8','Exploit','Protect'),(32,'Dedicated Machine for Administrative Tasks','5.9','Deliver','Protect'),(33,'Two Synchronized Time Sources','6.1','Exploit','Identify'),(34,'Audit Log Validation','6.2','Exploit','Detect'),(35,'Identify Anomalies','6.4','Maintain','Detect'),(36,'Logs of Network Boundary Devices','6.5','Maintain','Detect'),(37,'Security Information and Event Management','6.6','Maintain','Detect'),(38,'Fully Supported Web browers and email clients','7.1','Deliver','Protect'),(39,'Disable Unauthorized Plugins with Application & URL Whitelisting','7.2','Exploit','Protect'),(40,'Limit Unnecessary Scripts','7.3','Exploit','Protect'),(41,'Log URL Resuests','7.4','Deliver','Detect'),(42,'Two Separate Browsers','7.5','Deliver','Protect'),(43,'Network Based URL Filters','7.6','Deliver','Protect'),(44,'Sender Policy Framework for Spoofed Email','7.7','Deliver','Protect'),(45,'Block Malicious Email Attachments','7.8','Deliver','Protect'),(46,'Continuous Monitoring ','8.1','Exploit','Detect'),(47,'Anti-Malware','8.2','Exploit','Detect'),(48,'Limit External Devices','8.3','Deliver','Protect'),(49,'Anti-Exploitation Features','8.4','Exploit','Protect'),(50,'Network Based Anti-Malware','8.5','Deliver','Detect'),(51,'DNS Query Logging','8.6','Control','Detect'),(52,'Validate Ports, Protocols, Services','9.1','Execute','Detect'),(53,'Host Based Firewall','9.2','Deliver','Protect'),(54,'Automated Port Scan','9.3','Control','Detect'),(55,'VLAN','9.4','Deliver','Protect'),(56,'Separate Physical or Logical Host Machines for Critical Services','9.5','Deliver','Protect'),(57,'Application Firewall','9.6','Execute','Respond'),(58,'Backup','10.1','Maintain','Recover'),(59,'Backup with Test','10.2','Maintain','Recover'),(60,'Backup with Protection','10.3','Maintain','Recover'),(61,'Backup Destination','10.4','Execute','Recover'),(62,'Standard Configuration of Network Devices','11.1','Recon','Identify'),(63,'Configuration Rules of ','','',''),(64,'Configuration Rules of Network Devices','11.2','Recon','Protect'),(65,'File Alteration Log','11.3','Execute','Detect'),(66,'Two Factor & Encrypted Authentication Network Device','11.4','Exploit','Protect'),(67,'Latest Stable Security Related Update','11.5','Exploit','Protect'),(68,'Blacklist (IP Address)','12.1','Deliver','Protect'),(69,'Whitelist (IP Address)','12.1.2','Deliver','Protect'),(70,'Network Based IDS Sensors','12.3','Execute','Detect'),(71,'Extranet DMZ','12.3.2','Execute','Detect'),(72,'Network Based IPS','12.4','Deliver','Respond'),(73,'Application Layer Filtering Proxy Server','12.5','Control','Protect'),(74,'Two Factor Authentication Remote Login','12.6','Exploit','Protect'),(75,'Remote Login Security Standards','12.7','Exploit','Protect'),(76,'Netflow Analysis on DMZ','12.9','Maintain','Detect'),(77,'Firewall Session Tracking','12.10','Maintain','Detect'),(78,'DMZ Network Monitoring System','12.2','Maintain','Detect'),(79,'Hard Drive Encryption Software','13.2','Execute','Protect'),(80,'Block Sensitive Data Exfiltration','13.3','Execute','Respond'),(81,'Determine Sensitive Information','13.4','Execute','Identify'),(82,'Limited Privileges USB Devices','13.5','Execute','Protect'),(83,'Network Based DLP','13.6','Maintain','Respond'),(84,'Detect Encrypted Communication','13.7','Maintain','Respond'),(85,'Block Malicious Email & File Transfer Websites ','13.8','Maintain','Protect'),(86,'Host-Based Data Loss Prevention','13.9','Execute','Protect'),(87,'Network Segmentation','14.1','Deliver','Protect'),(88,'Network Segmentation with Firewall','14.1.2','Deliver','Protect'),(89,'Encrypt Data of Less Trusted Channel','14.2','Recon','Protect'),(90,'Private VLAN for Segmentated Workstation Network','14.3','Deliver','Protect'),(91,'Access Control List','14.4','Exploit','Protect'),(92,'Authentication Mechanism for Accessing Encrypted Data','14.5','Maintain','Protect'),(93,'Audit & Authetication for Sensitive Data','14.6','Execute','Protect'),(94,'Archive Irregular Accessed Data in Virtualized System','14.7','Deliver','Protect'),(95,'Deny Wireless Devices with Unauthorized Configuration','15.1','Deliver','Respond'),(96,'Network Vulnerability Scanning','15.2','Maintain','Respond'),(97,'Wireless Intrusion Detection System','15.3','Execute','Respond'),(98,'Wireless Access on Business Requirements','15.4','Deliver','Protect'),(99,'AES with WPA2','15.5','Recon','Protect'),(100,'EAP-TLS','15.6','Recon','Protect'),(101,'Disable Peer - Peer Wireless Network Capabilities','15.7','Deliver','Protect'),(102,'Disable Wireless Peripheral Access of Device','15.8','Deliver','Protect'),(103,'VLAN for BYOD & Untrusted Device','15.9','Deliver','Protect'),(104,'Disable Anonymous System Account ','16.1','Exploit','Protect'),(105,'Account Expiration Date','16.2','Exploit','Protect'),(106,'DIsable Account upon Termination of Employee or Contractor','16.3','Exploit','Protect'),(107,'Session Time Out','16.4','Exploit','Protect'),(108,'Screen Lock','16.5','Deliver','Protect'),(109,'Account Lockout','16.7','Deliver','Protect'),(110,'Monitor Attemp for Deactivated Account','16.8','Deliver','Protect'),(111,'Active Directory or LDAP','16.9','Deliver','Protect'),(112,'Anomaly Detection by User\'s Account Profile','16.10','Maintain','Detect'),(113,'Multi-Factor Authentication','16.11','Deliver','Protect'),(114,'Encrypt Credentials of Account','16.13','Recon','Protect'),(115,'Authentication File Protection','16.14','Execute','Protect'),(116,'Trainning and Awareness according to RoadMap','17.1','Deliver','Protect'),(117,'Security Awareness for Manual Instrusion Block','17.3','Maintain','Respond'),(118,'Validate and Improve Awareness Level','17.4','Deliver','Protect'),(119,'Security Skill Assessment','17.5','Deliver','Protect'),(120,'Vendor Supported & Updated Application Software','18.1','Recon','Protect'),(121,'Web Application Firewall','18.2','Execute','Detect'),(122,'Application Firewall','18.2.2','Execute','Detect'),(123,'Explicit Error Checking','18.3','Exploit','Protect'),(124,'Test In-House Softwares','18.4','Recon','Protect'),(125,'Stop System Error Message','18.5','Recon','Protect'),(126,'Production and Non-production Environment','18.6','Exploit','Protect'),(127,'Standard Hardening Configuration for Application Accessing Databases','18.7','Deliver','Protect'),(128,'Secure Development Training','18.8','Exploit','Protect'),(129,'Remove Artifacts of In-House Software in Production Environment','18.9','Exploit','Protect'),(130,'Incident Response Procedures','19.1','Maintain','Respond'),(131,'Job Duties for Response','19.2','Maintain','Respond'),(132,'Incident Response Manager','19.3','Maintain','Respond'),(133,'Notify Anomalous Event','19.4','Maintain','Respond'),(134,'Routine Employee Awareness','19.6','Exploit','Protect'),(135,'Penetration Testing','20.1','Exploit','Protect'),(136,'Monitor Penetration Tesing Account','20.2','Deliver','Detect'),(137,'Red Team Exercise','20.3','Maintain','Respond'),(138,'Red Team Exercise','20.3.2','Maintain','Respond'),(139,'Red Team Exercise','20.3.3','Maintain','Respond'),(140,'Disocer Unprotected System Information','20.4','Recon','Protect'),(141,'Realistic Assessment of Security Posture & Risk to	Critical Assets','20.5','Recon','Identify'),(142,'Realistic Assessment of Security Posture & Risk to	Critical Assets','20.5.2','Recon','Identify'),(143,'Realistic Assessment of Security Posture & Risk to	Critical Assets','20.5.3','Recon','Identify'),(144,'Periodic Red Team Exercises with Scoring','20.7','Exploit','Identify'),(145,'Periodic Red Team Exercises with Scoring','20.7.2','Exploit','Identify'),(146,'Periodic Red Team Exercises with Scoring','20.7.3','Exploit','Identify'),(147,'Test Bed','20.8','Exploit','Identify'),(148,'Master Image with Integration & Validation','3.3','Exploit','Protect'),(149,'Online Training or Training Conference ','17.2','Exploit','Protect');
/*!40000 ALTER TABLE `cyber_defense_matrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-05-09 03:05:24.000000'),(2,'auth','0001_initial','2017-05-09 03:05:36.000000'),(3,'admin','0001_initial','2017-05-09 03:05:38.000000'),(4,'admin','0002_logentry_remove_auto_add','2017-05-09 03:05:38.000000'),(5,'contenttypes','0002_remove_content_type_name','2017-05-09 03:05:41.000000'),(6,'auth','0002_alter_permission_name_max_length','2017-05-09 03:05:42.000000'),(7,'auth','0003_alter_user_email_max_length','2017-05-09 03:05:43.000000'),(8,'auth','0004_alter_user_username_opts','2017-05-09 03:05:43.000000'),(9,'auth','0005_alter_user_last_login_null','2017-05-09 03:05:44.000000'),(10,'auth','0006_require_contenttypes_0002','2017-05-09 03:05:44.000000'),(11,'auth','0007_alter_validators_add_error_messages','2017-05-09 03:05:44.000000'),(12,'auth','0008_alter_user_username_max_length','2017-05-09 03:05:45.000000'),(13,'sessions','0001_initial','2017-05-09 03:05:46.000000');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` text NOT NULL,
  `user_password` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'admin','admin');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_to_enforcement_level`
--

DROP TABLE IF EXISTS `sc_to_enforcement_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sc_to_enforcement_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sc_version` varchar(20) NOT NULL,
  `enforcement_level` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sc_version` (`sc_version`,`enforcement_level`),
  UNIQUE KEY `sc_version_2` (`sc_version`,`enforcement_level`)
) ENGINE=MyISAM AUTO_INCREMENT=182 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_to_enforcement_level`
--

LOCK TABLES `sc_to_enforcement_level` WRITE;
/*!40000 ALTER TABLE `sc_to_enforcement_level` DISABLE KEYS */;
INSERT INTO `sc_to_enforcement_level` VALUES (16,'1.1','Device'),(17,'1.2','Device'),(18,'1.3','Device'),(19,'1.4','Device'),(20,'1.5','Device'),(21,'1.6','Device'),(22,'2.1','Application'),(23,'2.2','Application'),(24,'2.4','Application'),(25,'3.1','Application'),(26,'3.2','Device'),(27,'3.4','Network'),(28,'3.5','Data'),(29,'3.6','Device'),(30,'3.7','Application'),(31,'3.6','Application'),(32,'4.1','Device'),(33,'4.1','Application'),(34,'4.2','Device'),(35,'4.2','Application'),(36,'4.3','Device'),(37,'4.4','Device'),(38,'4.4','Application'),(39,'4.5','Device'),(40,'4.5','Application'),(41,'4.7','Network'),(42,'4.7','Device'),(43,'4.8','Network'),(44,'5.1','Network'),(45,'5.1','Device'),(46,'5.1','Application'),(47,'5.2','People'),(48,'5.3','Device'),(49,'5.3','Application'),(50,'5.4','People'),(52,'5.5','Device'),(53,'5.5','Application'),(54,'5.6','Device'),(55,'5.6','Application'),(56,'5.7','Device'),(57,'5.7','Application'),(58,'5.8','People'),(59,'5.9','Device'),(60,'6.1','Network'),(61,'6.2','Device'),(62,'6.4','Network'),(63,'6.5','Network'),(64,'6.6','Network'),(65,'7.1','Network'),(66,'7.2','Application'),(67,'7.3','Application'),(68,'7.4','Network'),(69,'7.5','Network'),(70,'7.6','Network'),(71,'7.7','Network'),(72,'7.8','Network'),(73,'8.1','Device'),(74,'8.2','Application'),(75,'8.3','Device'),(76,'8.4','Application'),(77,'8.5','Network'),(78,'8.6','Network'),(79,'9.1','Device'),(80,'9.2','Network'),(81,'9.3','Device'),(82,'9.4','Device'),(83,'9.5','Application'),(84,'9.6','Network'),(85,'10.1','Application'),(86,'10.1','Data'),(87,'10.2','Application'),(88,'10.2','Data'),(89,'10.3','Application'),(90,'10.3','Data'),(91,'10.4','Application'),(92,'11.1','Application'),(180,'3.3','Device'),(94,'11.2','Network'),(95,'11.3','Data'),(96,'11.4','Device'),(97,'11.5','Device'),(98,'12.1','Network'),(99,'12.1.2','Network'),(100,'12.3','Network'),(101,'12.3.2','Network'),(102,'12.4','Network'),(103,'12.5','Network'),(104,'12.6','Network'),(105,'12.6','Device'),(106,'12.6','Application'),(107,'12.7','Device'),(108,'12.9','Network'),(109,'12.10','Network'),(110,'12.2','Network'),(111,'13.2','Data'),(112,'13.3','Network'),(113,'13.4','Data'),(114,'13.5','Device'),(115,'13.6','Network'),(116,'13.7','Network'),(117,'13.8','Network'),(118,'13.9','Data'),(119,'14.1','Network'),(120,'14.1.2','Network'),(121,'14.2','Network'),(122,'14.3','Network'),(123,'14.4','Data'),(124,'14.5','Data'),(125,'14.6','Data'),(126,'14.7','Data'),(127,'15.1','Device'),(128,'15.2','Device'),(129,'15.3','Device'),(130,'15.4','Device'),(131,'15.5','Device'),(132,'15.6','Network'),(133,'15.7','Network'),(134,'15.8','Device'),(135,'15.9','Network'),(136,'16.1','People'),(137,'16.2','People'),(138,'16.3','People'),(139,'16.4','People'),(140,'16.5','Application'),(141,'16.7','People'),(142,'16.8','People'),(143,'16.9','Device'),(144,'16.10','People'),(145,'16.11','People'),(146,'16.13','Network'),(147,'16.14','Data'),(148,'17.1','People'),(149,'17.3','People'),(150,'17.4','People'),(151,'17.5','People'),(152,'18.1','Application'),(153,'18.2','Network'),(154,'18.2.2','Application'),(155,'18.3','Application'),(156,'18.4','Application'),(157,'18.5','Application'),(158,'18.6','Application'),(159,'18.7','Application'),(160,'18.8','People'),(161,'18.9','Application'),(162,'19.1','People'),(163,'19.2','People'),(164,'19.3','People'),(165,'19.4','People'),(166,'19.6','People'),(167,'20.1','Application'),(168,'20.2','People'),(169,'20.3','Device'),(170,'20.3.2','Application'),(171,'20.3.3','Network'),(172,'20.4','Data'),(173,'20.5','Application'),(174,'20.5.2','Device'),(175,'20.5.3','Network'),(176,'20.7','Application'),(177,'20.7.2','Device'),(178,'20.7.3','Network'),(179,'20.8','Application'),(181,'17.2','People');
/*!40000 ALTER TABLE `sc_to_enforcement_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threat action`
--

DROP TABLE IF EXISTS `threat action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `threat action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `threat_action_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threat action`
--

LOCK TABLES `threat action` WRITE;
/*!40000 ALTER TABLE `threat action` DISABLE KEYS */;
INSERT INTO `threat action` VALUES (1,'Theft'),(2,'Misdelivery');
/*!40000 ALTER TABLE `threat action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threat_action`
--

DROP TABLE IF EXISTS `threat_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `threat_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `threat_action_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `threat_action_name` (`threat_action_name`)
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threat_action`
--

LOCK TABLES `threat_action` WRITE;
/*!40000 ALTER TABLE `threat_action` DISABLE KEYS */;
INSERT INTO `threat_action` VALUES (1,'Url Redirector Abuse'),(2,'Misdelivery'),(3,'Unapproved Hardware'),(4,'Skimmer'),(5,'Possession abuse'),(6,'Wiretapping'),(7,'Loss'),(8,'Phishing'),(10,'Brute Force'),(11,'Backdoor'),(12,'Disposal Error'),(13,'Publishing Error'),(14,'Use of Backdoor or C2'),(15,'C2'),(16,'Disabled Controls'),(17,'Downloader'),(18,'Use of Stolen Creds'),(19,'Capture Stored Data'),(20,'Spyware/keylogger'),(21,'DoS'),(22,'Export Data'),(23,'Exploit Vuln'),(24,'Scan Network'),(25,'Knowledge Abuse'),(26,'Tampering'),(27,'Data Mishandling'),(28,'Disable Controls'),(29,'SQLi'),(30,'Rootkit'),(31,'Bypassed Controls'),(32,'Misconfiguration'),(33,'Gaffe'),(34,'Surveillance'),(35,'Capture App Data'),(36,'Destroy Data'),(37,'Malfunction'),(38,'Extortion '),(39,'Bribery'),(40,'Abuse of Functionality'),(41,'Pretexting'),(42,'Programming Error'),(43,'Ransomware'),(44,'Unapproved Workaround'),(45,'Email Misuse'),(46,'Forgery'),(47,'MitM'),(48,'Forced Browsing'),(49,'Net Misuse'),(50,'Ramscraper'),(51,'Omission'),(52,'Influence'),(53,'XSS'),(54,'Spam\r\n'),(55,'Password Dumper'),(56,'Buffer Overflow'),(57,'Assault '),(58,'Packet Sniffer'),(59,'Physical Accidents'),(60,'Snooping'),(61,'Destruction'),(62,'Client Side Attack'),(63,'Data Entry Error'),(64,'Path Traversal'),(65,'Click Fraud'),(66,'Power Failure'),(67,'Connection'),(68,'Baiting'),(69,'Unapproved Software'),(70,'Cryptanalysis'),(71,'Illicit Content'),(72,'SSI Injection'),(73,'URL Redirect or Abuse'),(74,'Adminware'),(75,'Classification Error'),(76,'Fire'),(77,'Maintenance Error'),(78,'Adware'),(79,'Worm'),(80,'Propaganda'),(81,'Scam'),(82,'Elicitation'),(83,'RFI'),(84,'Mail Command Injection'),(85,'Misinformation'),(86,'Humidity'),(87,'Session Fixation'),(88,'Footprinting'),(89,'Privilege Abuse'),(90,'Reverse Engineering'),(91,'Session Prediction'),(92,'Other'),(93,'Session Replay'),(94,'Theft'),(95,'Os Commanding');
/*!40000 ALTER TABLE `threat_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threat_action_to_security_control`
--

DROP TABLE IF EXISTS `threat_action_to_security_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `threat_action_to_security_control` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_name` varchar(200) DEFAULT NULL,
  `security_control_id` int(11) NOT NULL,
  `threat_action` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=187 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threat_action_to_security_control`
--

LOCK TABLES `threat_action_to_security_control` WRITE;
/*!40000 ALTER TABLE `threat_action_to_security_control` DISABLE KEYS */;
INSERT INTO `threat_action_to_security_control` VALUES (1,'',16,'Unapproved Hardware'),(2,'',16,'Skimmer'),(3,'',17,'Unapproved Hardware'),(4,'',16,'Wiretapping'),(5,'',17,'Possession abuse'),(7,'',18,'Possession abuse'),(8,'',18,'Unapproved Hardware'),(9,'',18,'Skimmer'),(10,'',18,'Wiretapping'),(11,'',19,'Possession abuse'),(12,'',19,'Skimmer'),(13,'',19,'Unapproved Hardware'),(14,'',20,'Unapproved Hardware'),(15,'',20,'Skimmer'),(16,'',20,'Possession abuse'),(17,'',21,'Unapproved Hardware'),(18,'',21,'Possession abuse'),(19,'',22,'Unapproved Software'),(20,'',22,'Client Side Attack'),(21,'',22,'Exploit Vuln'),(22,'',23,'Downloader'),(23,'',23,'Adminware'),(24,'',23,'Packet Sniffer'),(25,'',24,'Client Side Attack'),(26,'',24,'Abuse of Functionality'),(27,'',25,'Bypassed Controls'),(29,'',25,'Misconfiguration'),(30,'',26,'Misconfiguration'),(31,'',26,'Exploit Vuln'),(32,'',27,'Packet Sniffer'),(33,'',27,'Snooping'),(34,'',27,'Wiretapping'),(169,'',31,'Use of Backdoor or C2'),(36,'',29,'Backdoor'),(37,'',29,'C2'),(38,'',31,'Connection'),(40,'',30,'Backdoor'),(42,'',30,'Disabled Controls'),(43,'',33,'Exploit Vuln'),(45,'',36,'Exploit Vuln'),(46,'',38,'Exploit Vuln'),(47,'',40,'Exploit Vuln'),(48,'',41,'Maintenance Error'),(49,'',41,'Exploit Vuln'),(52,'',28,'RFI'),(51,'',46,'Possession abuse'),(53,'',47,'Possession abuse'),(54,'',44,'Unapproved Workaround'),(55,'',48,'Brute Force'),(57,'',50,'Unapproved Workaround'),(58,'',53,'Brute Force'),(59,'',55,'Brute Force'),(60,'',55,'Spyware/keylogger'),(61,'',55,'Skimmer'),(62,'',56,'Brute Force'),(63,'',59,'Data Mishandling'),(64,'',59,'Rootkit'),(65,'',61,'Misinformation'),(66,'',62,'Misdelivery'),(67,'',62,'Net Misuse'),(70,'',46,'Disabled Controls'),(69,'',63,'Bypassed Controls'),(72,'',63,'Disabled Controls'),(73,'',64,'Bypassed Controls'),(74,'',64,'Disabled Controls'),(75,'',64,'Net Misuse'),(76,'',65,'Adware'),(77,'',65,'Downloader'),(78,'',66,'Adware'),(79,'',66,'Forced Browsing'),(81,'',67,'Client Side Attack'),(82,'',67,'SQLi'),(83,'',66,'SSI Injection'),(84,'',68,'Phishing'),(85,'',68,'C2'),(86,'',67,'XSS'),(87,'',68,'Connection'),(88,'',65,'Mail Command Injection'),(89,'',65,'Spam'),(90,'',68,'URL Redirect or Abuse'),(91,'',69,'Connection'),(92,'',70,'C2'),(93,'',70,'Baiting'),(94,'',71,'Phishing'),(95,'',71,'Scam'),(96,'',72,'Phishing'),(97,'',55,'Use of Stolen Creds'),(98,'',72,'XSS'),(99,'',73,'Adminware'),(100,'',73,'Adware'),(101,'',73,'Password Dumper'),(102,'',73,'Ramscraper'),(103,'',73,'Ransomware'),(104,'',73,'Rootkit'),(105,'',73,'Spyware/keylogger'),(106,'',73,'Worm'),(107,'',74,'Adminware'),(108,'',74,'Adware'),(109,'',74,'Password Dumper'),(110,'',74,'Ramscraper'),(111,'',74,'Ransomware'),(112,'',74,'Rootkit'),(113,'',74,'Rootkit'),(114,'',74,'Spyware/keylogger'),(115,'',74,'Worm'),(116,'',75,'Surveillance'),(117,'',75,'Unapproved Hardware'),(118,'',75,'Unapproved Workaround'),(119,'',75,'Wiretapping'),(120,'',123,'Capture App Data'),(121,'',74,'Spyware/keylogger'),(122,'',22,'Spyware/keylogger'),(123,'',148,'Pretexting'),(124,'',150,'Pretexting'),(125,'',148,'Influence'),(126,'',150,'Influence'),(128,'',28,'Forgery'),(129,'',148,'Bribery'),(130,'',148,'Extortion '),(131,'',144,'Extortion '),(132,'',85,'Fire'),(133,'',160,'Omission'),(134,'',157,'Omission'),(135,'',54,'Loss'),(136,'',86,'Loss'),(137,'',151,'Publishing Error'),(138,'',157,'Publishing Error'),(139,'',181,'Programming Error'),(140,'',155,'Programming Error'),(141,'',111,'Capture Stored Data'),(142,'',112,'Capture Stored Data'),(143,'',162,'Malfunction'),(144,'',166,'Bribery'),(145,'',167,'Data Entry Error'),(146,'',170,'Data Entry Error'),(147,'',148,'Gaffe'),(148,'',19,'Unapproved Workaround'),(149,'',17,'Unapproved Workaround'),(150,'',144,'Email Misuse'),(151,'',112,'Email Misuse'),(152,'',112,'Possession abuse'),(153,'',46,'Possession abuse'),(154,'',148,'Knowledge Abuse'),(155,'',123,'Knowledge Abuse'),(156,'',155,'Buffer Overflow'),(157,'',156,'Buffer Overflow'),(158,'',160,'Buffer Overflow'),(160,'',33,'Exploit Vuln'),(161,'',33,'Footprinting'),(162,'',83,'Footprinting'),(163,'',46,'Privilege Abuse'),(164,'',123,'Privilege Abuse'),(165,'',145,'Cryptanalysis'),(166,'',49,'Cryptanalysis'),(167,'',57,'Cryptanalysis'),(168,'',113,'Reverse Engineering'),(170,'',116,'Use of Backdoor or C2'),(171,'',139,'Session Prediction'),(172,'',167,'Session Prediction'),(173,'',160,'Url Redirector Abuse'),(174,'',167,'Url Redirector Abuse'),(175,'',43,'Other'),(176,'',139,'Session Replay'),(177,'',54,'Theft'),(178,'',86,'Theft'),(179,'',160,'Os Commanding'),(180,'',170,'Os Commanding'),(181,'',62,'DoS'),(182,'',108,'DoS'),(183,'',165,'Assault '),(184,'',113,'Disposal Error'),(185,'',150,'Disposal Error'),(186,'',166,'Disposal Error');
/*!40000 ALTER TABLE `threat_action_to_security_control` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-20 23:06:23
