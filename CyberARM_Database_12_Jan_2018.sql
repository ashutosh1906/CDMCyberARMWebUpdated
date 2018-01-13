-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: cyberarmrecent
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `cyber_defense_matrix_norm`
--

DROP TABLE IF EXISTS `cyber_defense_matrix_norm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cyber_defense_matrix_norm` (
  `en_level_id` int(11) DEFAULT NULL,
  `sc_func_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kc_phase_id` int(11) DEFAULT NULL,
  `sc_version` varchar(20) DEFAULT NULL,
  `explanation` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cyber_defense_matrix_norm`
--

LOCK TABLES `cyber_defense_matrix_norm` WRITE;
/*!40000 ALTER TABLE `cyber_defense_matrix_norm` DISABLE KEYS */;
INSERT INTO `cyber_defense_matrix_norm` VALUES (3,1,1,1,'1.1','This security control identifies the asset to create an authorized list of devices for the enterprise. '),(3,3,2,1,'1.2','Any malicious system performing reconnaissance will be detected by this security control as it keeps records of all the devices that have obtained the address using the DHCP. '),(3,1,3,1,'1.3',NULL),(3,1,4,1,'1.4','This Security Control helps to identify the authorized device. Therefore, it prevents the use of unauthorized devices e.g. Surveillance Camera at the Reconnaissance phase.'),(2,2,6,1,'1.5','This security control can prevent the unauthorized devices from accessing the confidential information. '),(3,2,7,3,'1.6','This security control validates and authenticates a device using Client Certificate which protects the private network from the malware or worm delivered by the unauthorized devices. '),(3,2,8,1,'1.6','Authentication using Client Certificate can protect the confidential or sensitive information from the unauthorized devices.'),(4,1,9,5,'2.1','This security control helps to identify the authorized software and therefore, it will prevent the Installation of the malicious software as it won\'t be identified by the security control. Therefore, it will prevent the attackers in the Maintain kill chain phase.'),(4,2,10,5,'2.2','Any software that is not the member of whitelist, will be prevented from the installation. Therefore, this security control protects at Installation phase.'),(4,2,11,3,'2.4','If the application runs in Virtual machine, because of the isolated environment the attackers\' will not be able to deliver the attack. Besides, if a host is compromised, it will be confined to that environment, which ensures the prevention of spread of the malicious software.'),(4,1,12,4,'3.1','This security control stops the attacker in the Exploitation phase by maintaining the secure configuration while installing an application based on the recent and discovered vulnerabilities. This security control actually identifies the required secure configuration for applications.'),(4,2,13,4,'3.2','This security control enforces the strict configuration which will be maintained by all the applications and OS used by the organization. All the application must follow the strict configurations. This prevents the exploitation of the vulnerabilities.'),(4,2,14,7,'3.3','Store and protect the secure image from unauthenticated change. Therefore, without the authentication, installed malware or any other application will not be able to change the configuration'),(4,2,15,1,'3.4','Secure channel provides encryption. Thus protects the system by interrupting the Reconnaissance of the attackers\' '),(4,3,16,5,'3.5','This security control can detect the changes in the files. It will be able to generate alarm if the sensitive system files are changed which may be done by the attacker for installing and maintaining the activities of the malicious software. Thus, the installed malware or unauthorized changes can be prevented at its Maintain phase.'),(4,3,17,5,'3.6','It detects the unauthorized changes in the secure configuration of the applications. If a malware changes the configuration to maintain its activity, this security control will be able to detect the suspicious activity.'),(4,5,18,4,'3.7','This security control redeploy the configuration at regular interval. Therefore, it can remove the existing vulnerabilities from the system which may have been created due to authenticated or unauthenticated changes in the system. This is a proactive recovery.'),(4,1,19,4,'4.1','This security control identifies the existing vulnerabilities for risk assessment. This security control prevents the attacker at the exploitation phase by removing the vulnerabilities.'),(4,3,20,1,'4.2','This security control attempts to detect the unauthenticated scanning. This helps to prevent the Reconnaissance of the attacker for exploring the vulnerabilities.'),(4,2,21,1,'4.3','It protects the system from unauthenticated vulnerability scanning.'),(4,1,22,4,'4.4','Explore the recent vulnerabilities that will help to update the risk management strategy.'),(4,2,23,4,'4.5','Patch removes the vulnerabilities and thus, stops the attacker at the exploitation phase.'),(4,3,24,1,'4.6','This security control attempts to detect the unauthenticated scanning.'),(4,1,25,4,'4.7','From the back-to-back vulnerabilities report, this security control assesses the risk.'),(4,2,26,4,'4.8','This security control prioritizes risk based on its exploitability and potential impact. Then it patches the vulnerabilities in accordance with the determined prioritization. Therefore, it protects the system from the exploitation of the vulnerabilities.'),(1,2,27,7,'5.1','This security control minimizes the administrative privilege of a user account so that the user (people) if compromised won\'t be able to maintain its activities on the administrative functions with the administrative privilege of that compromised user.'),(1,1,28,7,'5.2','This security control identifies the administrative account that will have the administrative privileges for performing the critical activities. Though, the attacker may be able to install the malware and also will be successful in set up the communication with C2 server., he/she will not be able to do activities on objects that require the administrative privilege.'),(3,2,29,4,'5.3','Default passwords of all the devices should be changed to ensure more protective safeguards of all the objects on those devices. Strong password will prevent the attacker in the exploitation kill chain phase.'),(1,3,30,5,'5.4','It gives alarm when new account is added, removed or deleted. After exploitation of vulnerability or security weakness, the attacker can create or modify an administrative user account to be able to maintain its activities on the victim machine. This security control will detect such malicious activity by keeping the log for account modificatio. '),(1,3,31,4,'5.5','This security control logs the unsuccessful login to detect the suspicious behavior which may be happening due to the login attempts by the attackers. '),(1,2,32,4,'5.6','Instead of knowing the credentials the attacker will never be authenticated as it requires another factor such as biometrics, smart card etc. for authentication. Thus, this security control prevents the attacker in the exploitation phase.'),(1,2,33,4,'5.7','Exploitation (or Brute Force) by the attacker will never be successful as it is less likely that he will be able to interpret the password of the account.'),(1,2,34,7,'5.8','Sudo in linux is a tool that has implemented such security control which doesn\'t let the logged in account do the activities on critical files or applications without knowing the password. Therefore, if the attacker gets the access of that account, still he requires the credentials.'),(3,2,35,3,'5.9','As the machine dedicated for the administrative tasks is isolated from the network or internet access. This will stop the attacker by preventing its delivery of weapons.'),(3,3,36,7,'6.1','Logging the activities using two synchronized time sources which ensure the consistent time in all logs, can help to create the profile for attack generation and propagation by gathering logs of events from all the available devices and by correlating these event logs. Therefore, it assists in detecting the malicious behavior of the attacker.'),(3,3,37,7,'6.2','Audit log should be done in valid format so that detection will be easy. Besides, same standardized logging format for all the devices of the enterprise will help in determining the attack profile by correlating all the event logs from different devices.'),(4,1,38,7,'6.4','This security control identifies the anomalous behavior by analyzing the logs which can be used by other countermeasures e.g. IDS, Antivirus etc. as the behavioral signature to detect the attack. In other words, by analyzing the behavior of the attacker from the logs this security control can generate the attack profile as the signature.'),(2,3,39,3,'6.5','Log all traffic arrived at network devices, so the unusual traffic can be detected due to Delivery of suspicious contents.'),(2,3,40,1,'6.5','This security control can detect the suspicious behavior of the attacker caused by the reconnaissance of the attacker. For example, in Cross Fire attack, the attacker sends the traffic to the decoy or public servers from the bots to detect the load traffic of the link.'),(2,1,41,7,'6.6','This security control aggregates logs to devise a profile of usual activities so that the detection due to unusual activities will generate less false positives. This security control identifies the usual behavior which may be used in detecting the anomalous behavior.'),(4,2,42,4,'7.1','Fully supported and updated web browsers or email clients will remove the recent or previously explored vulnerabilities and hence, it protects from the attackers in the exploitation phase.'),(4,2,43,4,'7.2','This security control blocks the unauthorized plugin. So that the malicious code will not able to exploit.'),(4,2,44,5,'7.3','Block the unnecessary scripts. It protects the system from installation of the malicious software.'),(2,3,45,7,'7.4','This security control detects the malicious activity of an insider by logging the URL request to the malicious domain. '),(4,2,46,3,'7.5','There will two separated browsers where one will only be used in some particular safe web sites and the other will be used for visiting all the other untrusted web sites.'),(2,2,47,3,'7.6',''),(2,2,48,3,'7.7',''),(2,4,49,3,'7.8','Block the email attachment detected as malicious. Therefore, this security control responds to the malicious email attachment at the delivery kill chain phase.'),(4,3,50,4,'8.1','Monitor all the devices with countermeasure functionality to detect the behavior of the malicious software. This can determine the vulnerability exploitation mechanism of the malware.'),(4,3,51,7,'8.2','It detects the suspicious malware activities so that the malware can be prevented at its execute kill chain phase. '),(3,2,52,3,'8.3','It protects by controlling the use of external devices so that the attacker will not be able to deliver the malicious contents.'),(4,2,53,4,'8.4','It protects by hardening the exploitability of functions of the applications.'),(2,2,54,3,'8.5','Filter out the malicious contents before its arrival at the endpoints.'),(2,3,55,6,'8.6','Logging of DNS query will help to detect whether there is any attempt to connect with the C2 server.'),(4,2,56,5,'9.1','Malicious software may use unusual ports to maintain its backdoor with C2 server. Any software running on unidentified port should be suspended. '),(2,2,57,3,'9.2','This security control filters out all the traffic if these are not explicitly allowed.'),(2,3,58,7,'9.3','It generates alarm if it discovers any change unapproved by the organization.'),(2,2,59,3,'9.4','Any server that is not required to be connected to the internet for the business purpose should be placed in VLAN. Hence, this security control will protect the system at the deliver kill chain phase.'),(3,2,60,3,'9.5','This security control separates the critical services from other services so that the attacker will not be able to deliver attack to interrupt the critical services by exploiting the other services hosted in the same device or physical machine.'),(2,2,61,3,'9.6','This security control blocks any traffic requesting unauthorized services from the critical servers. It blocks the unauthorized service request or traffic to the application at the Delivery kill chain phase.'),(5,5,62,5,'10.1','The attacker may alter or remove the data to interrupt the critical services to maintain its attack but the Backup of such critical information will restore the services. Therefore, it can prevent the attack in the maintain kill chain phase as the restored service will interrupt the attacker in maintaining its activities.'),(5,5,63,5,'10.2','It backups the data and also test whether the backup works fine. This security control helps to restore the system. '),(5,5,64,5,'10.3','This security control stores the backup and also protects it with the encryption in order to restore the system or to restore the critical services. This security control also ensures that the backup is not altered or destroyed.'),(5,5,65,7,'10.4','If the backup destination is not accessible by the attacker e.g. CryptoLocker, it will not be able to modify the data. Therefore, the backup data can be used to recover its normal activities.'),(3,2,66,4,'11.1','By maintaining the standard configuration it protects the system by removing the exploitable vulnerabilities.'),(2,3,67,3,'11.2','The change in configuration rules for traffic flow should be logged with the specific business reason, person and duration to detect the unusual behavior.'),(3,3,68,7,'11.3','All changes in the configuration that deviates from the standard configuration should be logged to detect the unusual change in the system.'),(4,2,69,1,'11.4','The attackers aiming to execute actions on a target machine tries to discover an authenticated session. Session encryption can prevent the attacker in the reconnaissance phase.'),(4,2,70,4,'11.5','It provides the security-related updates for the network devices to remove the discovered exploitable vulnerabilities.'),(2,2,71,3,'12.1','Block the traffic from the malicious domains so that the attackers will not be able to deliver the weapons.'),(2,2,72,6,'12.1','This security control blocks the connection establishment attempts with the known malicious C2 sites. So at the C2 kill chain phase the attackers can\'t communicate with the C2 server.'),(2,3,73,3,'12.2','In DMZ networks, there will be a monitoring system to monitor the traffic for detecting malicious or suspicious activities. Now, this security control operates in the delivery phase as the adversary may use the DMZ network for spreading or sending the attack to the other critical assets of the organization.'),(2,3,74,7,'12.3','This security control performs the behavioral analysis on the traffic flow to detect the attack. For example, if the attacker exfiltrates encrypted sensitive data, the high entropy in the network traffic and sometimes the number of flows to some specific IP address will draw attention as unusual activity. '),(2,4,75,3,'12.4','It prevents the bad traffic, so it interrupts the delivery of weapons by the adversary.'),(2,4,76,6,'12.4','It can respond on the bad traffiic that may be sent by the adversary C2 server to perform its objective on victim\'s machine.'),(2,2,77,6,'12.5','By decrypting and analyzing the network traffic, it will be able to prevent the communication request to the bad sites.'),(2,2,78,7,'12.5','It can decrypt and analyze the network traffic to inspect whether an exfiltration is happening. '),(1,2,80,3,'12.6','This security control will help to protect the system despite of the compromise of user credentials. It will generate one time token or password that will be sent to the legitimate user and the user will have to provide this password to login into the system. Therefore, this security control will interrupt the access to the system so that it will prevent the adversary in the Delivery kill chain phase.'),(3,2,81,3,'12.7','There must be policy which will define the access privilege for the remote devices that are trying to connect with internal network. This will protect the internal network from the delivery of the weapons.'),(2,3,82,6,'12.8','This security control scans the network to check if there is any unauthorized connection to the internet. So, this security will be able to detect the C2 communication.'),(2,3,83,7,'12.9','This security control can analyze the network flow which will be able to detect the data exfiltration or other anomalous activity.Therefore, this security control works in the Execute kill chain phase.'),(2,3,84,7,'12.10','Firewall session tracking will be able to identify the unusual long time TCP session. So from these TCP sessions the channel used for data exfiltration can be detected. '),(5,1,85,7,'13.1','Identify the sensitive data so that it can be protected by applying the encryption. The main objective of this security control is the identification of data so that it will be protected to reduce the possibility of exfiltration or to reduce the impact imposed by exfiltration. Therefore, it works in the execute phase.'),(5,2,86,7,'13.2','This security control encrypts the data in the devices and thus, protect the exfiltrated data. Therefore, this security control protects the data at the execute phase.'),(5,4,87,7,'13.3','This security control blocks the data exfiltration detected as unauthorized by deploying an automated tool	on network perimeters that monitors for sensitive information.	'),(5,1,88,1,'13.4','It identifies the sensitive information, so that the confidential information will not be leaked. Hence, it prevents the attackers in the reconnaissance phase by not leaking sensitive data.'),(5,2,89,7,'13.5','No data can be written in unauthorized USB hard drives. Moreover, this security control will only authorize USB devices with business need. Besides, this security control will encrypt all the transferred data on such authorized USB devices. Therefore, it prevents the data exfiltration when the attack is in the execute kill chain phase. This security control provides protection for data.'),(2,3,90,7,'13.6','This security control monitors the network traffic to detect the anomaly. It works against the data exfiltration by the malicious software. Therefore, it prevents the attack in the execute kill chain phase. '),(2,4,91,6,'13.7','This security control monitors the network traffic to detect and terminate the unauthorized use of encryption that may be used by the encrypted C2 channel to bypass network security devices. Therefore, this security control prevents the use of command and control channel by the attackers.'),(2,2,92,6,'13.8','This security control blocks the access to known file transfer and email exfiltration websites (black listed network url) which protects the asset from C2 channel. Therefore, this security controls protects the asset in the network level at the C2 kill chain phase of the attack.'),(5,2,93,7,'13.9','This security control provides ACL (Access Control List) for data while copying the data. Thus, any unauthorized entity will not be able to copy the data. Hence, this security control provides the protection at the Execute kill chain phase for the data. '),(5,2,94,3,'14.1','Based on the stored information, this security control labels the data to segment the networks. People or other devices with authorization will only be able to access the sensitive information. The adversary will not able to deliver the attack weapons as it will not be able to access the device with sensitive information. Therefore, this security control protects the data at the Delivery kill-chain-phase.'),(5,2,95,1,'14.2','This security control encrypts sensitive information while communicating. Hence, it protects the sensitive information by encrypting the contents of the low trust network traffic which prevents the attacker at the Reconnaissance kill-chain-phase.'),(2,2,96,3,'14.3','This security controls stops the attack propagation by segmenting the network using Private Virtual Local Area Network (VLANs) in the switches which limits the ability of communication of one device with the other devices of the network. Therefore, this security control works on the network to protect the devices of the subnet against the attack propagation from the infected devices.'),(5,2,97,7,'14.4','This security control enforces access control list for accessing sensitive data so that the adversary will not be able to exfiltrate the sensitive information. Hence, this security control works in the Execute kill-chain-phase to protect the sensitive information by limiting the access to sensitive information.  '),(3,2,98,7,'14.5','This security control introduces authentication mechanism to access device with the sensitive information so that it will not be exfiltrated (Execute).'),(1,2,99,7,'14.6','This security control enforces the authentication system on individual (People) to protect the sensitive information. Therefore, it works in the Execute kill chain phase.'),(1,3,100,7,'14.6','This security control will keep the log of the access of sensitive information by individuals which will always keep the record of the unsuccessful access attempts. Hence, it will detect the attackers by the number of unsuccessful events.'),(3,2,101,3,'14.7','This security control will protect the system or devices storing the archived data sets by disconnecting it from the network. Therefore, it will prevent the attacker from delivering the attack weapons.'),(3,2,102,4,'15.1','Only the devices with the authorized configuration and security profile with the reason of connection will be allowed. Therefore, this security control will protect the organization from the attacker in the exploitation kill chain phase.'),(2,4,103,4,'15.2','This security control detects the unauthorized wireless access points by comparing the connected device at a particular access point with the list of identified devices. Any wireless access point connecting the unauthorized device will be deactivated. Therefore, this security control responds against the attacker in the exploitation phase.'),(2,3,104,7,'15.3','This security control will detect the rouge wireless devices by analyzing the wireless network traffic. It works in the execute kill chain phase as it can detect the attack attempts or successful compromise.'),(3,1,105,4,'15.4','This security control identifies the wireless access of devices with the proper business requirements. Thus, it prevents the unauthorized devices in the exploitation kill chain phase.'),(5,2,106,1,'15.5','Wireless traffic are encrypted using Advanced Encryption Standard encryption with Wi-Fi Protected Access 2 (WPA2) protection.'),(2,2,107,4,'15.6','This security control enforces authentication protocol such as Extensible Authentication Protocol-Transport Layer Security (EAP/TLS) with mutual authentication to protect the wireless network. So, this security control can prevent the attacker at the exploitation kill chain phase.'),(2,2,108,7,'15.7','Disable peer to peer network network communication so that all the file or data transfer must be transferred via the server. It protects the assets or the organizations from the malicious communication in the Execute kill chain phase.'),(3,2,109,3,'15.8','It protects in the exploitation kill chain phase by disabling the peripheral access of devices (such as bluetooth) which have no business requirements.'),(3,2,110,3,'15.9','BYOD systems and other untrusted devices will be able to access the enterprise network through virtual local area network. The communication from such VLAN to the enterprise network will be treated as untrusted. So the network traffic will be filtered and audited accordingly. Hence, this security control prevents the attacker in the Delivery kill chain phase.'),(3,1,111,4,'1.1','Only the devices identified by this security control will be to able to perform its normal activities. All the other devices will be prevented so that the attacker will not be able to exploit the services using his/her device.'),(3,3,112,7,'1.2','It will keep record for all the devices that have obtained the address using DHCP protocol. It will help to detect malicious system that is executing some actions. Therefore, it helps to detect the malicious system in the Execute kill chain phase.'),(3,1,113,8,'1.3','As this security control will terminate the activities of any devices that are not identified. Any attempt by the attacker using the unlisted devices will be prevented at the installation phase.'),(3,1,114,3,'1.4','This security control identifies the devices that will be connected with the internet and are more vulnerable to the attacks than the other devices. Hence, this security control identifies the critical assets that require extra protection so that the attacker will not able to deliver the attack weapons.'),(3,1,115,7,'1.4','This security control will notify or generate alarm if any unidentified devices is connected with the internet. This can prevent the attackers in the Execution kill chain phase. (e.g. data exfiltration).'),(4,1,116,2,'4.1','An identified vulnerability is patched after being discovdred, the attacker prepared incorrect capsule because the vulnerability is patched already.'),(4,2,117,2,'4.5','An identified vulnerability is patched after being discovdred, the attacker prepared incorrect capsule because the vulnerability is patched already.'),(4,2,118,4,'5.3','Default passwords of all the applications should be changed to ensure more protective safeguards of all the objects on those devices. Strong password will prevent the attacker in the exploitation kill chain phase.'),(3,2,119,4,'6.1','Inconsistent time can cause weakness in security management by providing access or by serving request at the inappropriate time which the attackers can exploit. This security control can protect the enterprise by introducing two synchronized time sources through ensuring consistent time for the devices of that enterprise at the exploitation kill chain phase.'),(2,3,120,1,'8.6','DNS query logging can also help to detect the scanning performed to check the existence of the malicious domains. '),(2,2,121,3,'9.1','Services with validated protocols will run on the network ports if they have the business needs. This shrinks the attack surface for the attacker which actually prevents the attacker in the delivery kill chain phase. '),(2,3,122,7,'11.2','The adversary may modify the configuration rules to execute actions on victim machines. Such modification logging will help to detect whether some malicious activities are executing on the system.'),(4,2,123,3,'11.4','Introduction of two factor authentication to manage a network device using an application can protect the assets at the Delivery kill chain phase. '),(3,2,124,3,'11.6','All the network administrative tasks must be done in a dedicated machine which will be isolated from the internet.This will shrink the attacker\'s surface for delivering the weapons. '),(2,3,125,6,'12.3','By analyzing the traffic this security control can also detect the communication with the C2 server.'),(2,3,126,5,'12.8','This security control can detect the backdoor that may have been used by the attacker to ensure the access of the intruder. Therefore, this security control prevents the attack in the maintain phase.  '),(5,1,127,1,'13.1','If an information is labeled as sensitive, these information will be handled with much care which will reduce the publishing error or other unintended errors. Therefore, this security control interrupts the information gathering phase of the attackers.'),(5,1,128,7,'13.4','If the sensitive information is identified or labeled, it can used to detect the exfiltration of sensitive data. '),(2,3,129,1,'13.6','This security control can prevent the attacker in the Reconnaissance phase through detecting the unusual scanning performed by the attacker in the network to identify the critical servers, link etc.'),(2,2,130,3,'13.8','This security control blocks the malicious mail to prevent the delivery of attack weapons.'),(2,4,131,5,'15.2','Unauthorized access points can be used by the attacker to maintain its presence in the network. Deactivating the unauthorized access points will prevent the attacker at the Maintain kill chain phase.'),(2,2,132,1,'15.6','This security control prevents the leakage of the confidential information. Therefore, it works in the Reconnaissance kill chain phase.'),(3,2,133,7,'15.8','Peripheral devices such as Removable Disk etc. can be used for data exfiltration. Hence, this security control prevents the attacker in the Execute kill chain phase.'),(1,2,134,4,'16.1','Disable inactive user account so that the attackers will not be able to impersonate as the legitimate user. Therefore, this security control will protect the assets from the cyber attack in the exploitation phase.'),(1,1,135,4,'16.2','Expiration date of the account will help to identify the inactive user account.'),(4,2,136,4,'16.3','Disbale the account upon termination of an employee or contractor'),(1,2,137,4,'16.4','Log off the users after a certain period of inactivity.'),(3,2,138,4,'16.5','This security control enforces limitation in access of the unattended workstations. '),(4,2,139,7,'16.7','Configure the applications in a way that after certain failed login attempts the user account will be locked. This security control can protect from the execution of the brute force attack.'),(4,3,140,4,'16.8','This security control by auditing the log can identify the attempt to access deactivated account.'),(2,2,141,4,'16.9','All account should enter the network afert passing the centralized authentication.'),(1,3,142,7,'16.10','This security control detects the anomalous behavior of the users.'),(1,2,143,4,'16.11','Multi factor authentication for all user accounts which have access to sensitive data or systems.'),(2,2,144,1,'16.13','Encrypt all the sensitive account credentials.'),(5,2,145,7,'16.14','Encrypt all the authentication files to protect the sensitive files. Besides, only the administrator will be able to access these files.'),(1,2,146,7,'17.1','This security controls is the baseline training and the awareness roadmap for all the employees so that they can stop the attacker from the execution of the attack.'),(1,2,147,7,'17.2','This security control will increase the skill of the people.'),(1,4,148,7,'17.3','This security controls attempts to teach the employees of an enterprise about the methods that can be manually applied against the intrusion by cyber attacks.'),(1,2,149,3,'17.4','This security control will make the employees aware so that they will not click on the suspicious mail or link.'),(1,2,150,1,'17.4','This security control aims to make people aware so that they will not provide any sensitive information.'),(1,1,151,1,'17.5','This security control identifies the skill gap of the employees so that they will not provide sensitive information to the adversary or will not enable any service which may be helpful for the adversary in the reconnaissance phase.'),(4,2,152,4,'18.1','This security control removes the discovered vulnerabilities by updating the running applications.'),(2,3,153,3,'18.2','Inspect the traffic flowing to the web application to detect the web application attacks.'),(4,2,154,4,'18.3','This security control enforces error checking for the in house developed software.'),(4,2,155,1,'18.5','This security control terminates the display of system error messages which may be the reason for the sensitive information leakage.'),(4,2,156,1,'18.6','In non-production environment, the developers produces long output stream or error stream which should not be introduced in the production environment as it may publish important message.'),(4,2,157,7,'18.7','Standard hardening configuration for the applications which rely on database.'),(1,2,158,4,'18.8','Training on writing secure code helps to reduce the number of vulnerabilities.'),(4,2,159,1,'18.9','Development artifacts can leak sensitive information about the applications. Therefore, enforcement of this security control can prevent the adversary in the reconnaissance phase. '),(1,4,160,5,'19.1','This security control defines the personal roles in incident response. Therefore, it responds against threat action at the maintain phase.'),(1,4,161,5,'19.2','Assignment of job duties and the job titles to individuals can reduce the attack impact.'),(1,4,162,5,'19.3','Define management personnel to play key role in decision making during the incident response.'),(1,4,163,5,'19.4','This security control introduces policies for incident response.'),(1,2,164,5,'19.6','This security control includes employee awareness training on the incidents. '),(2,1,165,4,'20.1','This security control performs penetration testing to identify the vulnerabilities.'),(1,2,166,1,'20.2','Monitor the user or system accounts who are performing penetration testing to ensure that the testing has legitimate purpose and is restored to normal action after the testing.'),(1,1,167,5,'20.3','Periodic red team exercise test can identify the organization readiness in the events of cyber attacks.'),(5,1,168,1,'20.4','This security control identifies the unprotected critical information. '),(3,1,169,1,'20.5','This security control ensures realistic assessment of the security posture by generating many APT style attacks.'),(1,2,170,4,'20.7','This security control assesses the red team exercises on people with a score to compare the results over time according to open, machine readable standard to protect the enterprise from the exploitation of vulnerabilities.'),(4,1,171,4,'20.8','This security control creates a test bed to mimic the production environment and performs the penetration testing on that test bed to identify the vulnerabilities of the application system.');
/*!40000 ALTER TABLE `cyber_defense_matrix_norm` ENABLE KEYS */;
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
INSERT INTO `django_session` VALUES ('2bdratdgu8f56rgkdbgghx6bpyfvo1mn','OGVlOGI1MzNiNTk4YTNhYjAyNTk1OWUwODhiNmE0NjRmYTAyYWY2OTp7fQ==','2017-10-27 19:40:24'),('3s07zjbxz6c56gegq43sg2f17piw9iln','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2017-10-12 19:09:59'),('4oycoyau6bw53qtrorga8xjdfmclo8nc','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2017-10-17 01:13:01'),('4svakk5c4sacogpui20mvfh9qc3hlc6j','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2017-11-29 07:56:25'),('53vad33cx3mj0lox1qmketeh0vlopgge','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2017-10-16 17:36:58'),('5x45p3zu19r1fkhnw5etimkvo0lz3x44','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2017-10-16 03:32:41'),('6bhtowj8w6euiorkhjyy5j7xkvzw6hwf','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2018-01-09 01:00:07'),('7mioqdnq017ck7m21uadvbb3r6bw4yrx','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2017-10-19 15:43:36'),('9d0bqmpmg10nv4912bqu65f832ztibo4','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2017-10-19 16:58:52'),('bpln9ob051swh79gpodut6r8rl29djwa','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2017-10-11 20:42:01'),('d4h1aq96hzbrbkgrbe0cvr7nspmdw6rt','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2017-12-13 01:41:38'),('dbikucjstvl4c53ck3lmnigo5wps5rem','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2018-01-03 03:32:26'),('ealhb1sef2d7461xe4q63iqv2vc3m1pp','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2018-01-12 21:24:40'),('f5hty66wvq3b9v6m5lhacz76w109potd','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2018-01-26 22:03:20'),('gd897i9gf4ibqafgxc71iad11w62nb34','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2017-11-29 07:59:08'),('hkejihkvuj9bp5hwigvib0brjnn3ib2x','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2017-10-19 15:34:46'),('iunrtt2yuia6o0o48d4rlow7wv9xrl4r','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2017-10-19 14:54:20'),('j2pjny5aec21o5rmt67mbdxu5xmq9gow','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2017-10-19 15:19:47'),('jspuclfsyb6ukgswdrvxda4ghl1wf6pg','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2017-10-21 03:00:44'),('rot0az04p1grismc3t0xapbqm585jvcp','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2017-10-12 19:21:06'),('tiild9mfqpv1xfyvfp8iweql8svw0w16','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2017-10-25 23:55:14'),('uhz95t62521sfffwlkko1q708cbxbb6t','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2017-10-13 13:51:53'),('ukg58z39ylwjh8wfda1qkubo008ghwz2','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2017-10-27 18:00:58'),('xa0ivovf4v7p0ys8c84v5lvppuktdjdz','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2017-10-13 13:56:19'),('xkiw1efdafjnhx2uskh5ci7egcskx7a3','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2017-10-13 01:28:41'),('xudh6ygd7rowx143fmxfs6cpvfxjv82t','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2017-10-31 18:48:08'),('zo8iek16l5gwvk2cbk1l3pf6tdzzft0r','NWY2OTE5ZWU1NzJiZjdkMjJkMzNmYTdiMWUxNWNkNzE0OGY5NWI3Nzp7InVzZXJfbmFtZSI6ImNjYWEifQ==','2017-10-17 23:47:42');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enforcement_level`
--

DROP TABLE IF EXISTS `enforcement_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enforcement_level` (
  `en_level_name` varchar(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enforcement_level`
--

LOCK TABLES `enforcement_level` WRITE;
/*!40000 ALTER TABLE `enforcement_level` DISABLE KEYS */;
INSERT INTO `enforcement_level` VALUES ('People',1),('Network',2),('Device',3),('Application',4),('Data',5);
/*!40000 ALTER TABLE `enforcement_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kill_chain_phase`
--

DROP TABLE IF EXISTS `kill_chain_phase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kill_chain_phase` (
  `kc_phase` varchar(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kill_chain_phase`
--

LOCK TABLES `kill_chain_phase` WRITE;
/*!40000 ALTER TABLE `kill_chain_phase` DISABLE KEYS */;
INSERT INTO `kill_chain_phase` VALUES ('Reconnaissance',1),('Weaponization',2),('Delivery',3),('Exploitation',4),('Maintain',5),('C2',6),('Execute',7),('Installation',8);
/*!40000 ALTER TABLE `kill_chain_phase` ENABLE KEYS */;
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
-- Table structure for table `security_control`
--

DROP TABLE IF EXISTS `security_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_control` (
  `sc_version` varchar(20) NOT NULL,
  `sc_name` varchar(100) DEFAULT NULL,
  `sc_parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`sc_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_control`
--

LOCK TABLES `security_control` WRITE;
/*!40000 ALTER TABLE `security_control` DISABLE KEYS */;
INSERT INTO `security_control` VALUES ('1.1','Automaed Asset Inventory',1001),('1.2','Asset Inventory with DHCP Server Logging',1002),('1.3','Asset Inventory System with Update',1003),('1.4','Asset Inventory for Devices Connected to Internet',1004),('1.5','Network Level Authentication',1005),('1.6','Client Certificate',1006),('10.1','Backup',10001),('10.2','Backup with Test',10002),('10.3','Backup with Protection',10003),('10.4','Backup Destination',10004),('11.1','Standard Configuration of Network Devices',11001),('11.2','Log Configuration Rules Modification of Network Devices',11002),('11.3','File Alteration Log',11003),('11.4','Two Factor & Encrypted Authentication Network Device',11004),('11.5','Latest Stable Security Related Update',11005),('11.6','Dedicated Machine for Network Administrative Tasks',11006),('12.1','Blacklist (IP Address)',12001),('12.10','Firewall Session Tracking',12010),('12.2','DMZ Network Monitoring System',12002),('12.3','Network Based IDS Sensors',12003),('12.4','Network Based IPS',12004),('12.5','Application Layer Filtering Proxy Server',12005),('12.6','Two Factor Authentication Remote Login',12006),('12.7','Remote Login Security Standards',12007),('12.8','Scan for Back Channel Connection',12008),('12.9','Netflow Analysis on DMZ',12009),('13.1','Identify Sensitive Information',13001),('13.2','Hard Drive Encryption Software',13002),('13.3','Block Sensitive Data Exfiltration',13003),('13.4','Determine Sensitive Information',13004),('13.5','Limited Writing Privileges in Authorized USB Devices',13005),('13.6','Network Based DLP',13006),('13.7','Terminate Encrypted Communication',13007),('13.8','Block Malicious Email & File Transfer Websites ',13008),('13.9','Host-Based Data Loss Prevention',13009),('14.1','Network Segmentation',14001),('14.2','Encrypt Data of Less Trusted Channel',14002),('14.3','Private VLAN for Segmentated Workstation Network',14003),('14.4','Access Control List',14004),('14.5','Authentication Mechanism for Accessing Encrypted Data',14005),('14.6','Audit & Authetication for Sensitive Data',14006),('14.7','Archive Irregular Accessed Data in Virtualized System',14007),('15.1','Deny Wireless Devices with Unauthorized Configuration',15001),('15.2','Network Vulnerability Scanning for detecting wireless access points',15002),('15.3','Wireless Intrusion Detection System',15003),('15.4','Wireless Access on Business Requirements',15004),('15.5','AES with WPA2',15005),('15.6','Extensible Authentication Protocol- Transport Layer Security(EAP-TLS)',15006),('15.7','Disable Peer - Peer Wireless Network Capabilities',15007),('15.8','Disable Wireless Peripheral Access of Device',15008),('15.9','VLAN for BYOD & Untrusted Device',15009),('16.1','Disable Anonymous System Account ',16001),('16.10','Anomaly Detection by User\'s Account Profile',16010),('16.11','Multi-Factor Authentication',16011),('16.13','Encrypt Credentials of Account',16013),('16.14','Authentication File Protection',16014),('16.2','Account Expiration Date',16002),('16.3','DIsable Account upon Termination of Employee or Contractor',16003),('16.4','Session Time Out',16004),('16.5','Screen Lock',16005),('16.7','Account Lockout',16007),('16.8','Monitor Attemp for Deactivated Account',16008),('16.9','Active Directory or LDAP',16009),('17.1','Trainning and Awareness according to RoadMap',17001),('17.2','Online Training or Training Conference ',17002),('17.3','Security Awareness for Manual Instrusion Block',17003),('17.4','Validate and Improve Awareness Level',17004),('17.5','Security Skill Assessment',17005),('18.1','Vendor Supported & Updated Application Software',18001),('18.2','Web Application Firewall',18002),('18.3','Explicit Error Checking',18003),('18.4','Test In-House Softwares',18004),('18.5','Stop System Error Message',18005),('18.6','Production and Non-production Environment',18006),('18.7','Standard Hardening Configuration for Application Accessing Databases',18007),('18.8','Secure Development Training',18008),('18.9','Remove Artifacts of In-House Software in Production Environment',18009),('19.1','Incident Response Procedures',19001),('19.2','Job Duties for Response',19002),('19.3','Incident Response Manager',19003),('19.4','Notify Anomalous Event',19004),('19.6','Routine Employee Awareness',19006),('2.1','Authorized Software Inventory',2001),('2.2','Application Whitelisting',2002),('2.4','Virtual Machine',2004),('20.1','Penetration Testing',20001),('20.2','Monitor Penetration Tesing Account',20002),('20.3','Red Team Exercise',20003),('20.4','Disocer Unprotected System Information',20004),('20.5','Realistic Assessment of Security Posture & Risk to	Critical Assets',20005),('20.7','Periodic Red Team Exercises with Scoring',20007),('20.8','Test Bed',20008),('3.1','Standardized Image of Secure Configuration',3001),('3.2','Strict Configurations for Systems',3002),('3.3','Master Image with Integrity Checking & Validation',3003),('3.4','Secure Channel for Devices\' Remote Administration ',3004),('3.5','File Integrity Checking Tool',3005),('3.6','Automated Configuration Monitoring',3006),('3.7','System Configuration Management Tool',3007),('4.1','Automated Vulnerability Scanning ',4001),('4.2','Vulnerability Scanning Log',4002),('4.3','Authenticated Vulnerability Scanning',4003),('4.4','Vulnerability Intelligent Service',4004),('4.5','Automated Patch Management',4005),('4.6','Monitor Log',4006),('4.7','Risk Assessment for Vulnerabilities',4007),('4.8','Risk Rate Vulnerabilities',4008),('5.1','Minimize Administrative Privileges',5001),('5.2','Administrative Account Inventory',5002),('5.3','Change Default Passwords',5003),('5.4','Administrator Account Modification Log',5004),('5.5','Log Unsuccessful Login',5005),('5.6','Multi-Factor Authentication',5006),('5.7','Password Constraint',5007),('5.8','Migration from Non-Administrative to Administrative',5008),('5.9','Dedicated Machine for Administrative Tasks',5009),('6.1','Logging with Two Synchronized Time Sources',6001),('6.2','Logging in Valid Format',6002),('6.4','Identify Anomalies from Logs',6004),('6.5','Logs of Network Boundary Devices',6005),('6.6','Security Information and Event Management',6006),('7.1','Fully Supported Web browers and email clients',7001),('7.2','Disable Unauthorized Plugins with Application & URL Whitelisting',7002),('7.3','Limit Unnecessary Scripts',7003),('7.4','Log URL Resuests',7004),('7.5','Two Separate Browsers',7005),('7.6','Network Based URL Filters',7006),('7.7','Sender Policy Framework for Spoofed Email',7007),('7.8','Block Malicious Email Attachments',7008),('8.1','Continuous Monitoring ',8001),('8.2','Anti-Malware',8002),('8.3','Limit External Devices',8003),('8.4','Anti-Exploitation Features',8004),('8.5','Network Based Anti-Malware',8005),('8.6','DNS Query Logging',8006),('9.1','Validate Ports/Protocols/Services',9001),('9.2','Host Based Firewall',9002),('9.3','Automated Port Scan',9003),('9.4','VLAN',9004),('9.5','Separate Physical or Logical Host Machines for Critical Services',9005),('9.6','Application Firewall',9006);
/*!40000 ALTER TABLE `security_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_function`
--

DROP TABLE IF EXISTS `security_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sc_function_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_function`
--

LOCK TABLES `security_function` WRITE;
/*!40000 ALTER TABLE `security_function` DISABLE KEYS */;
INSERT INTO `security_function` VALUES (1,'Identify'),(2,'Protect'),(3,'Detect'),(4,'Respond'),(5,'Recover');
/*!40000 ALTER TABLE `security_function` ENABLE KEYS */;
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
-- Table structure for table `threat_action_kc_phase`
--

DROP TABLE IF EXISTS `threat_action_kc_phase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `threat_action_kc_phase` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `kc_phase` varchar(255) DEFAULT NULL,
  `threat_action_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threat_action_kc_phase`
--

LOCK TABLES `threat_action_kc_phase` WRITE;
/*!40000 ALTER TABLE `threat_action_kc_phase` DISABLE KEYS */;
INSERT INTO `threat_action_kc_phase` VALUES (1,'Exploitation','Abuse of Functionality'),(2,'C2','Backdoor'),(3,'Exploitation','Buffer Overflow'),(4,'Maintain','Capture App Data'),(5,'Maintain','Capture Stored Data'),(6,'Delivery','Click Fraud');
/*!40000 ALTER TABLE `threat_action_kc_phase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threat_action_security_control_map`
--

DROP TABLE IF EXISTS `threat_action_security_control_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `threat_action_security_control_map` (
  `threat_action_name` varchar(100) DEFAULT NULL,
  `sc_name` varchar(100) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sc_version` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threat_action_security_control_map`
--

LOCK TABLES `threat_action_security_control_map` WRITE;
/*!40000 ALTER TABLE `threat_action_security_control_map` DISABLE KEYS */;
INSERT INTO `threat_action_security_control_map` VALUES ('Unapproved Hardware','Automaed Asset Inventory',1,'1.1'),('Skimmer','Automaed Asset Inventory',2,'1.1'),('Unapproved Hardware','Asset Inventory with DHCP Server Logging',3,'1.2'),('Wiretapping','Automaed Asset Inventory',4,'1.1'),('Possession abuse','Asset Inventory with DHCP Server Logging',5,'1.2'),('Possession abuse','Asset Inventory System with Update',6,'1.3'),('Unapproved Hardware','Asset Inventory System with Update',7,'1.3'),('Skimmer','Asset Inventory System with Update',8,'1.3'),('Wiretapping','Asset Inventory System with Update',9,'1.3'),('Possession abuse','Asset Inventory for Devices Connected to Internet',10,'1.4'),('Skimmer','Asset Inventory for Devices Connected to Internet',11,'1.4'),('Unapproved Hardware','Asset Inventory for Devices Connected to Internet',12,'1.4'),('Unapproved Hardware','Network Level Authentication',13,'1.5'),('Skimmer','Network Level Authentication',14,'1.5'),('Possession abuse','Network Level Authentication',15,'1.5'),('Unapproved Hardware','Client Certificate',16,'1.6'),('Possession abuse','Client Certificate',17,'1.6'),('Unapproved Software','Authorized Software Inventory',18,'2.1'),('Client Side Attack','Authorized Software Inventory',19,'2.1'),('Exploit Vuln','Authorized Software Inventory',20,'2.1'),('Downloader','Application Whitelisting',21,'2.2'),('Adminware','Application Whitelisting',22,'2.2'),('Packet Sniffer','Application Whitelisting',23,'2.2'),('Client Side Attack','Virtual Machine',24,'2.4'),('Abuse of Functionality','Virtual Machine',25,'2.4'),('Bypassed Controls','Standardized Image of Secure Configuration',26,'3.1'),('Misconfiguration','Standardized Image of Secure Configuration',27,'3.1'),('Misconfiguration','Strict Configurations for Systems',28,'3.2'),('Exploit Vuln','Strict Configurations for Systems',29,'3.2'),('Packet Sniffer','Secure Channel for Devices\' Remote Administration ',30,'3.4'),('Snooping','Secure Channel for Devices\' Remote Administration ',31,'3.4'),('Wiretapping','Secure Channel for Devices\' Remote Administration ',32,'3.4'),('Use of Backdoor or C2','Automated Configuration Monitoring',33,'3.6'),('Backdoor','Automated Configuration Monitoring',34,'3.6'),('C2','Automated Configuration Monitoring',35,'3.6'),('Connection','Automated Configuration Monitoring',36,'3.6'),('Backdoor','System Configuration Management Tool',37,'3.7'),('Disabled Controls','System Configuration Management Tool',38,'3.7'),('Exploit Vuln','Automated Vulnerability Scanning ',39,'4.1'),('Exploit Vuln','Authenticated Vulnerability Scanning',40,'4.3'),('Exploit Vuln','Vulnerability Intelligent Service',41,'4.4'),('Exploit Vuln','Automated Patch Management',42,'4.5'),('Maintenance Error','Risk Assessment for Vulnerabilities',43,'4.7'),('Exploit Vuln','Risk Assessment for Vulnerabilities',44,'4.7'),('RFI','File Integrity Checking Tool',45,'3.5'),('Possession abuse','Minimize Administrative Privileges',46,'5.1'),('Possession abuse','Administrative Account Inventory',47,'5.2'),('Unapproved Workaround','Minimize Administrative Privileges',48,'5.1'),('Brute Force','Change Default Passwords',49,'5.3'),('Unapproved Workaround','Administrator Account Modification Log',50,'5.4'),('Brute Force','Log Unsuccessful Login',51,'5.5'),('Brute Force','Multi-Factor Authentication',52,'5.6'),('Spyware/keylogger','Multi-Factor Authentication',53,'5.6'),('Skimmer','Multi-Factor Authentication',54,'5.6'),('Brute Force',' Password Constraint',55,'5.7'),('Data Mishandling','Dedicated Machine for Administrative Tasks',56,'5.9'),('Rootkit','Dedicated Machine for Administrative Tasks',57,'5.9'),('Misinformation','Logging in Valid Format',58,'6.2'),('Misdelivery','Identify Anomalies from Logs',59,'6.4'),('Net Misuse','Identify Anomalies from Logs',60,'6.4'),('Disabled Controls','Minimize Administrative Privileges',61,'5.1'),('Bypassed Controls','Logs of Network Boundary Devices',62,'6.5'),('Disabled Controls','Logs of Network Boundary Devices',63,'6.5'),('Bypassed Controls','Security Information and Event Management',64,'6.6'),('Disabled Controls','Security Information and Event Management',65,'6.6'),('Net Misuse','Security Information and Event Management',66,'6.6'),('Adware','Fully Supported Web browers and email clients',67,'7.1'),('Downloader','Fully Supported Web browers and email clients',68,'7.1'),('Adware','Disable Unauthorized Plugins with Application & URL Whitelisting',69,'7.2'),('Forced Browsing','Disable Unauthorized Plugins with Application & URL Whitelisting',70,'7.2'),('Client Side Attack','Limit Unnecessary Scripts',71,'7.3'),('SQLi','Limit Unnecessary Scripts',72,'7.3'),('SSI Injection','Disable Unauthorized Plugins with Application & URL Whitelisting',73,'7.2'),('Phishing','Log URL Resuests',74,'7.4'),('C2','Log URL Resuests',75,'7.4'),('XSS','Limit Unnecessary Scripts',76,'7.3'),('Connection','Log URL Resuests',77,'7.4'),('Mail Command Injection','Fully Supported Web browers and email clients',78,'7.1'),('Spam','Fully Supported Web browers and email clients',79,'7.1'),('URL Redirect or Abuse','Log URL Resuests',80,'7.4'),('Connection','Two Separate Browsers',81,'7.5'),('C2','Network Based URL Filters',82,'7.6'),('Baiting','Network Based URL Filters',83,'7.6'),('Phishing','Sender Policy Framework for Spoofed Email',84,'7.7'),('Scam','Sender Policy Framework for Spoofed Email',85,'7.7'),('Phishing','Block Malicious Email Attachments',86,'7.8'),('Use of Stolen Creds','Multi-Factor Authentication',87,'5.6'),('XSS','Block Malicious Email Attachments',88,'7.8'),('Adminware','Continuous Monitoring ',89,'8.1'),('Adware','Continuous Monitoring ',90,'8.1'),('Password Dumper','Continuous Monitoring ',91,'8.1'),('Ramscraper','Continuous Monitoring ',92,'8.1'),('Ransomware','Continuous Monitoring ',93,'8.1'),('Rootkit','Continuous Monitoring ',94,'8.1'),('Spyware/keylogger','Continuous Monitoring ',95,'8.1'),('Worm','Continuous Monitoring ',96,'8.1'),('Adminware','Anti-Malware',97,'8.2'),('Adware','Anti-Malware',98,'8.2'),('Password Dumper','Anti-Malware',99,'8.2'),('Ramscraper','Anti-Malware',100,'8.2'),('Ransomware','Anti-Malware',101,'8.2'),('Rootkit','Anti-Malware',102,'8.2'),('Rootkit','Anti-Malware',103,'8.2'),('Spyware/keylogger','Anti-Malware',104,'8.2'),('Worm','Anti-Malware',105,'8.2'),('Surveillance','Limit External Devices',106,'8.3'),('Unapproved Hardware','Limit External Devices',107,'8.3'),('Unapproved Workaround','Limit External Devices',108,'8.3'),('Wiretapping','Limit External Devices',109,'8.3'),('Capture App Data','Access Control List',110,'14.4'),('Spyware/keylogger','Anti-Malware',111,'8.2'),('Spyware/keylogger','Authorized Software Inventory',112,'2.1'),('Pretexting','Trainning and Awareness according to RoadMap',113,'17.1'),('Pretexting','Validate and Improve Awareness Level',114,'17.4'),('Influence','Trainning and Awareness according to RoadMap',115,'17.1'),('Influence','Validate and Improve Awareness Level',116,'17.4'),('Forgery','File Integrity Checking Tool',117,'3.5'),('Bribery','Trainning and Awareness according to RoadMap',118,'17.1'),('Extortion ','Trainning and Awareness according to RoadMap',119,'17.1'),('Extortion ','Anomaly Detection by User\'s Account Profile',120,'16.10'),('Fire','Backup',121,'10.1'),('Omission','Secure Development Training',122,'18.8'),('Omission','Stop System Error Message',123,'18.5'),('Loss','Multi-Factor Authentication',124,'5.6'),('Loss','Backup',125,'10.1'),('Publishing Error','Security Skill Assessment',126,'17.5'),('Publishing Error','Stop System Error Message',127,'18.5'),('Programming Error','Online Training or Training Conference ',128,'17.2'),('Programming Error','Explicit Error Checking',129,'18.3'),('Capture Stored Data','Hard Drive Encryption Software',130,'13.2'),('Capture Stored Data','Block Sensitive Data Exfiltration',131,'13.3'),('Malfunction','Incident Response Procedures',132,'19.1'),('Bribery','Routine Employee Awareness',133,'19.6'),('Data Entry Error','Penetration Testing',134,'20.1'),('Data Entry Error','Red Team Exercise',135,'20.3'),('Gaffe','Trainning and Awareness according to RoadMap',136,'17.1'),('Unapproved Workaround','Asset Inventory for Devices Connected to Internet',137,'1.4'),('Unapproved Workaround','Asset Inventory with DHCP Server Logging',138,'1.2'),('Email Misuse','Anomaly Detection by User\'s Account Profile',139,'16.10'),('Email Misuse','Block Sensitive Data Exfiltration',140,'13.3'),('Possession abuse','Block Sensitive Data Exfiltration',141,'13.3'),('Possession abuse','Minimize Administrative Privileges',142,'5.1'),('Knowledge Abuse','Trainning and Awareness according to RoadMap',143,'17.1'),('Knowledge Abuse','Access Control List',144,'14.4'),('Buffer Overflow','Explicit Error Checking',145,'18.3'),('Buffer Overflow','Test In-House Softwares',146,'18.4'),('Buffer Overflow','Secure Development Training',147,'18.8'),('Exploit Vuln','Automated Vulnerability Scanning ',148,'4.1'),('Footprinting','Automated Vulnerability Scanning ',149,'4.1'),('Footprinting','Separate Physical or Logical Host Machines for Critical Services',150,'9.5'),('Privilege Abuse','Minimize Administrative Privileges',151,'5.1'),('Privilege Abuse','Access Control List',152,'14.4'),('Cryptanalysis','Multi-Factor Authentication',153,'16.11'),('Cryptanalysis','Change Default Passwords',154,'5.3'),('Cryptanalysis',' Password Constraint',155,'5.7'),('Reverse Engineering','Determine Sensitive Information',156,'13.4'),('Use of Backdoor or C2','Terminate Encrypted Communication',157,'13.7'),('Session Prediction','Session Time Out',158,'16.4'),('Session Prediction','Penetration Testing',159,'20.1'),('Url Redirector Abuse','Secure Development Training',160,'18.8'),('Url Redirector Abuse','Penetration Testing',161,'20.1'),('Other','Risk Rate Vulnerabilities',162,'4.8'),('Session Replay','Session Time Out',163,'16.4'),('Theft','Multi-Factor Authentication',164,'5.6'),('Theft','Backup',165,'10.1'),('Os Commanding','Secure Development Training',166,'18.8'),('Os Commanding','Red Team Exercise',167,'20.3'),('DoS','Identify Anomalies from Logs',168,'6.4'),('DoS','Netflow Analysis on DMZ',169,'12.9'),('Assault ','Notify Anomalous Event',170,'19.4'),('Disposal Error','Determine Sensitive Information',171,'13.4'),('Disposal Error','Validate and Improve Awareness Level',172,'17.4'),('Disposal Error','Routine Employee Awareness',173,'19.6'),('Buffer Overflow','Application Whitelisting',174,'2.2'),('Disabled Controls','Asset Inventory System with Update',175,'1.3'),('abuse of functionality','Secure Development Training',177,'18.8'),('abuse of functionality','Penetration Testing',178,'20.1'),('abuse of functionality','Anomaly Detection by User\'s Account Profile',179,'16.10');
/*!40000 ALTER TABLE `threat_action_security_control_map` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=189 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threat_action_to_security_control`
--

LOCK TABLES `threat_action_to_security_control` WRITE;
/*!40000 ALTER TABLE `threat_action_to_security_control` DISABLE KEYS */;
INSERT INTO `threat_action_to_security_control` VALUES (1,'',16,'Unapproved Hardware'),(2,'',16,'Skimmer'),(3,'',17,'Unapproved Hardware'),(4,'',16,'Wiretapping'),(5,'',17,'Possession abuse'),(7,'',18,'Possession abuse'),(8,'',18,'Unapproved Hardware'),(9,'',18,'Skimmer'),(10,'',18,'Wiretapping'),(11,'',19,'Possession abuse'),(12,'',19,'Skimmer'),(13,'',19,'Unapproved Hardware'),(14,'',20,'Unapproved Hardware'),(15,'',20,'Skimmer'),(16,'',20,'Possession abuse'),(17,'',21,'Unapproved Hardware'),(18,'',21,'Possession abuse'),(19,'',22,'Unapproved Software'),(20,'',22,'Client Side Attack'),(21,'',22,'Exploit Vuln'),(22,'',23,'Downloader'),(23,'',23,'Adminware'),(24,'',23,'Packet Sniffer'),(25,'',24,'Client Side Attack'),(26,'',24,'Abuse of Functionality'),(27,'',25,'Bypassed Controls'),(29,'',25,'Misconfiguration'),(30,'',26,'Misconfiguration'),(31,'',26,'Exploit Vuln'),(32,'',27,'Packet Sniffer'),(33,'',27,'Snooping'),(34,'',27,'Wiretapping'),(169,'',31,'Use of Backdoor or C2'),(36,'',29,'Backdoor'),(37,'',29,'C2'),(38,'',31,'Connection'),(40,'',30,'Backdoor'),(42,'',30,'Disabled Controls'),(43,'',33,'Exploit Vuln'),(45,'',36,'Exploit Vuln'),(46,'',38,'Exploit Vuln'),(47,'',40,'Exploit Vuln'),(48,'',41,'Maintenance Error'),(49,'',41,'Exploit Vuln'),(52,'',28,'RFI'),(51,'',46,'Possession abuse'),(53,'',47,'Possession abuse'),(54,'',44,'Unapproved Workaround'),(55,'',48,'Brute Force'),(57,'',50,'Unapproved Workaround'),(58,'',53,'Brute Force'),(59,'',55,'Brute Force'),(60,'',55,'Spyware/keylogger'),(61,'',55,'Skimmer'),(62,'',56,'Brute Force'),(63,'',59,'Data Mishandling'),(64,'',59,'Rootkit'),(65,'',61,'Misinformation'),(66,'',62,'Misdelivery'),(67,'',62,'Net Misuse'),(70,'',46,'Disabled Controls'),(69,'',63,'Bypassed Controls'),(72,'',63,'Disabled Controls'),(73,'',64,'Bypassed Controls'),(74,'',64,'Disabled Controls'),(75,'',64,'Net Misuse'),(76,'',65,'Adware'),(77,'',65,'Downloader'),(78,'',66,'Adware'),(79,'',66,'Forced Browsing'),(81,'',67,'Client Side Attack'),(82,'',67,'SQLi'),(83,'',66,'SSI Injection'),(84,'',68,'Phishing'),(85,'',68,'C2'),(86,'',67,'XSS'),(87,'',68,'Connection'),(88,'',65,'Mail Command Injection'),(89,'',65,'Spam'),(90,'',68,'URL Redirect or Abuse'),(91,'',69,'Connection'),(92,'',70,'C2'),(93,'',70,'Baiting'),(94,'',71,'Phishing'),(95,'',71,'Scam'),(96,'',72,'Phishing'),(97,'',55,'Use of Stolen Creds'),(98,'',72,'XSS'),(99,'',73,'Adminware'),(100,'',73,'Adware'),(101,'',73,'Password Dumper'),(102,'',73,'Ramscraper'),(103,'',73,'Ransomware'),(104,'',73,'Rootkit'),(105,'',73,'Spyware/keylogger'),(106,'',73,'Worm'),(107,'',74,'Adminware'),(108,'',74,'Adware'),(109,'',74,'Password Dumper'),(110,'',74,'Ramscraper'),(111,'',74,'Ransomware'),(112,'',74,'Rootkit'),(113,'',74,'Rootkit'),(114,'',74,'Spyware/keylogger'),(115,'',74,'Worm'),(116,'',75,'Surveillance'),(117,'',75,'Unapproved Hardware'),(118,'',75,'Unapproved Workaround'),(119,'',75,'Wiretapping'),(120,'',123,'Capture App Data'),(121,'',74,'Spyware/keylogger'),(122,'',22,'Spyware/keylogger'),(123,'',148,'Pretexting'),(124,'',150,'Pretexting'),(125,'',148,'Influence'),(126,'',150,'Influence'),(128,'',28,'Forgery'),(129,'',148,'Bribery'),(130,'',148,'Extortion '),(131,'',144,'Extortion '),(132,'',85,'Fire'),(133,'',160,'Omission'),(134,'',157,'Omission'),(135,'',54,'Loss'),(136,'',86,'Loss'),(137,'',151,'Publishing Error'),(138,'',157,'Publishing Error'),(139,'',181,'Programming Error'),(140,'',155,'Programming Error'),(141,'',111,'Capture Stored Data'),(142,'',112,'Capture Stored Data'),(143,'',162,'Malfunction'),(144,'',166,'Bribery'),(145,'',167,'Data Entry Error'),(146,'',170,'Data Entry Error'),(147,'',148,'Gaffe'),(148,'',19,'Unapproved Workaround'),(149,'',17,'Unapproved Workaround'),(150,'',144,'Email Misuse'),(151,'',112,'Email Misuse'),(152,'',112,'Possession abuse'),(153,'',46,'Possession abuse'),(154,'',148,'Knowledge Abuse'),(155,'',123,'Knowledge Abuse'),(156,'',155,'Buffer Overflow'),(157,'',156,'Buffer Overflow'),(158,'',160,'Buffer Overflow'),(160,'',33,'Exploit Vuln'),(161,'',33,'Footprinting'),(162,'',83,'Footprinting'),(163,'',46,'Privilege Abuse'),(164,'',123,'Privilege Abuse'),(165,'',145,'Cryptanalysis'),(166,'',49,'Cryptanalysis'),(167,'',57,'Cryptanalysis'),(168,'',113,'Reverse Engineering'),(170,'',116,'Use of Backdoor or C2'),(171,'',139,'Session Prediction'),(172,'',167,'Session Prediction'),(173,'',160,'Url Redirector Abuse'),(174,'',167,'Url Redirector Abuse'),(175,'',43,'Other'),(176,'',139,'Session Replay'),(177,'',54,'Theft'),(178,'',86,'Theft'),(179,'',160,'Os Commanding'),(180,'',170,'Os Commanding'),(181,'',62,'DoS'),(182,'',108,'DoS'),(183,'',165,'Assault '),(184,'',113,'Disposal Error'),(185,'',150,'Disposal Error'),(186,'',166,'Disposal Error'),(187,'',23,'Buffer Overflow'),(188,'',18,'Disabled Controls');
/*!40000 ALTER TABLE `threat_action_to_security_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threat_action_updated`
--

DROP TABLE IF EXISTS `threat_action_updated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `threat_action_updated` (
  `threat_action_name` varchar(100) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `threat_action_name` (`threat_action_name`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threat_action_updated`
--

LOCK TABLES `threat_action_updated` WRITE;
/*!40000 ALTER TABLE `threat_action_updated` DISABLE KEYS */;
INSERT INTO `threat_action_updated` VALUES ('abuse of functionality',33),('adminware',56),('adware',84),('assault',46),('backdoor',13),('baiting',53),('bribery',22),('brute force',35),('buffer overflow',65),('bypassed controls',47),('c2',16),('capacity shortage',69),('capture app data',6),('capture stored data',41),('classification error',83),('click fraud',78),('client-side attack',58),('connection',50),('cryptanalysis',49),('data entry error',81),('data mishandling',9),('destroy data',55),('destruction',85),('disable controls',51),('disabled controls',30),('disposal error',11),('dos',20),('downloader',43),('elicitation',87),('email misuse',61),('exploit vuln',42),('export data',44),('extortion',57),('fire',89),('footprinting',93),('forced browsing',67),('forgery',24),('gaffe',26),('humidity',63),('illicit content',60),('influence',54),('knowledge abuse',32),('loss',5),('mail command injection',94),('maintenance error',66),('malfunction',36),('misconfiguration',27),('misdelivery',8),('misinformation',77),('mitm',73),('net misuse',48),('omission',10),('os commanding',88),('other',7),('packet sniffer',76),('password dumper',75),('path traversal',12),('phishing',14),('physical accidents',79),('possession abuse',18),('power failure',90),('pretexting',25),('privilege abuse',3),('programming error',39),('propaganda',59),('publishing error',23),('ram scraper',38),('ransomware',28),('reverse engineering',82),('rfi',86),('rootkit',52),('scam',71),('scan network',17),('session fixation',80),('session prediction',91),('session replay',92),('skimmer',19),('snooping',72),('spam',68),('spyware/keylogger',45),('sqli',34),('ssi injection',70),('surveillance',31),('tampering',29),('theft',4),('unapproved hardware',21),('unapproved software',64),('unapproved workaround',40),('url redirector abuse',74),('use of stolen creds',15),('wiretapping',62),('worm',95),('xss',37);
/*!40000 ALTER TABLE `threat_action_updated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threat_threat_action`
--

DROP TABLE IF EXISTS `threat_threat_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `threat_threat_action` (
  `threat` char(30) NOT NULL,
  `threat_action` char(30) NOT NULL,
  PRIMARY KEY (`threat`,`threat_action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threat_threat_action`
--

LOCK TABLES `threat_threat_action` WRITE;
/*!40000 ALTER TABLE `threat_threat_action` DISABLE KEYS */;
INSERT INTO `threat_threat_action` VALUES ('environmental','fire'),('environmental','humidity'),('environmental','power failure'),('error','capacity shortage'),('error','classification error'),('error','data entry error'),('error','disposal error'),('error','gaffe'),('error','loss'),('error','maintenance error'),('error','malfunction'),('error','misconfiguration'),('error','misdelivery'),('error','misinformation'),('error','omission'),('error','other'),('error','physical accidents'),('error','programming error'),('error','publishing error'),('hacking','abuse of functionality'),('hacking','brute force'),('hacking','buffer overflow'),('hacking','cryptanalysis'),('hacking','dos'),('hacking','footprinting'),('hacking','forced browsing'),('hacking','mail command injection'),('hacking','mitm'),('hacking','os commanding'),('hacking','other'),('hacking','path traversal'),('hacking','reverse engineering'),('hacking','rfi'),('hacking','session fixation'),('hacking','session prediction'),('hacking','session replay'),('hacking','sqli'),('hacking','ssi injection'),('hacking','url redirector abuse'),('hacking','use of backdoor or c2'),('hacking','use of stolen creds'),('hacking','xss'),('malware','adminware'),('malware','adware'),('malware','backdoor'),('malware','brute force'),('malware','c2'),('malware','capture app data'),('malware','capture stored data'),('malware','click fraud'),('malware','client-side attack'),('malware','destroy data'),('malware','disable controls'),('malware','dos'),('malware','downloader'),('malware','exploit vuln'),('malware','export data'),('malware','other'),('malware','packet sniffer'),('malware','password dumper'),('malware','ram scraper'),('malware','ransomware'),('malware','rootkit'),('malware','scan network'),('malware','spam'),('malware','spyware/keylogger'),('malware','worm'),('misuse','data mishandling'),('misuse','email misuse'),('misuse','illicit content'),('misuse','knowledge abuse'),('misuse','net misuse'),('misuse','other'),('misuse','possession abuse'),('misuse','privilege abuse'),('misuse','unapproved hardware'),('misuse','unapproved software'),('misuse','unapproved workaround'),('physical','assault'),('physical','bypassed controls'),('physical','connection'),('physical','destruction'),('physical','disabled controls'),('physical','other'),('physical','skimmer'),('physical','snooping'),('physical','surveillance'),('physical','tampering'),('physical','theft'),('physical','wiretapping'),('social','baiting'),('social','bribery'),('social','elicitation'),('social','extortion'),('social','forgery'),('social','influence'),('social','other'),('social','phishing'),('social','pretexting'),('social','propaganda'),('social','scam'),('social','spam');
/*!40000 ALTER TABLE `threat_threat_action` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-12 19:07:34
