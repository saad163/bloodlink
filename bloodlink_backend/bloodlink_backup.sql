-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: bloodlink
-- ------------------------------------------------------
-- Server version	9.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add donor',1,'add_donor'),(2,'Can change donor',1,'change_donor'),(3,'Can delete donor',1,'delete_donor'),(4,'Can view donor',1,'view_donor'),(5,'Can add patient request',2,'add_patientrequest'),(6,'Can change patient request',2,'change_patientrequest'),(7,'Can delete patient request',2,'delete_patientrequest'),(8,'Can view patient request',2,'view_patientrequest'),(9,'Can add email response',3,'add_emailresponse'),(10,'Can change email response',3,'change_emailresponse'),(11,'Can delete email response',3,'delete_emailresponse'),(12,'Can view email response',3,'view_emailresponse'),(13,'Can add log entry',4,'add_logentry'),(14,'Can change log entry',4,'change_logentry'),(15,'Can delete log entry',4,'delete_logentry'),(16,'Can view log entry',4,'view_logentry'),(17,'Can add permission',5,'add_permission'),(18,'Can change permission',5,'change_permission'),(19,'Can delete permission',5,'delete_permission'),(20,'Can view permission',5,'view_permission'),(21,'Can add group',6,'add_group'),(22,'Can change group',6,'change_group'),(23,'Can delete group',6,'delete_group'),(24,'Can view group',6,'view_group'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add content type',8,'add_contenttype'),(30,'Can change content type',8,'change_contenttype'),(31,'Can delete content type',8,'delete_contenttype'),(32,'Can view content type',8,'view_contenttype'),(33,'Can add session',9,'add_session'),(34,'Can change session',9,'change_session'),(35,'Can delete session',9,'delete_session'),(36,'Can view session',9,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$l5zU9oSX1YU7n2r72xKhYX$Yx7Lbbow6/e3CAcKGg/8hppteuoI86ws/2cWePnaJns=','2025-08-20 19:17:52.298288',1,'bloodlink','','','bloodlink96@gmail.com',1,1,'2025-05-25 12:14:11.448711');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_donor`
--

DROP TABLE IF EXISTS `core_donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_donor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `blood_group` varchar(5) NOT NULL,
  `city` varchar(100) NOT NULL,
  `colony` varchar(100) NOT NULL,
  `last_donation_date` date NOT NULL,
  `is_profile_public` tinyint(1) NOT NULL,
  `is_healthy` tinyint(1) NOT NULL,
  `total_donations` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `cnic` varchar(13) NOT NULL,
  `full_address` longtext NOT NULL DEFAULT (_utf8mb4'Not provided'),
  `gender` varchar(10) NOT NULL,
  `landmark` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_donor`
--

LOCK TABLES `core_donor` WRITE;
/*!40000 ALTER TABLE `core_donor` DISABLE KEYS */;
INSERT INTO `core_donor` VALUES (4,'Muhammad Saad Hasan','muhammadsaadhasan622@gmail.com','03049781382','A+','Multan','Gulgasht','2025-01-06',0,1,0,'2025-05-25 20:07:12.614445','3230186605191','Gulgasht Multan','Male','Lateef Super Store',1,NULL,NULL),(5,'Muhammad Naiman','naumanq39@gmail.com','03055163946','A+','Multan','Kalma Chowk','2025-03-04',0,1,0,'2025-05-25 20:09:33.892175','3230186605191','Kalma Chowk Nishter road Multan','Male','Nishter Hospital',1,NULL,NULL),(6,'Sharyar Azher','saadpersonalac@gmail.com','03049781382','O+','Multan','Rasheeda Bad','2025-02-11',1,1,0,'2025-05-25 20:12:26.597047','3230186605332','rasheeda bad','Male','al fatima hospital',1,NULL,NULL),(7,'Ali Khan','muhammadsaadhasan622@gmail.com','03124567892','O+','Karachi','Gulshan','2024-12-01',1,1,0,'2025-05-25 20:35:30.370636','1234567890123','Test Streat 123','Male','near hospital',1,NULL,NULL),(8,'Ahmed Raza','ahmedraza7651@gmail.com','03452983323','A+','Multan','Gulgasht','2025-01-05',1,1,0,'2025-05-26 11:03:08.734404','4200041109876','Chungi No.6','Male','',1,NULL,NULL),(9,'Fatima Khan','fatima.khan@example.com','03001234567','A+','Karachi','Gulshan-e-Iqbal','2025-04-15',1,1,0,'2025-05-26 19:52:31.988519','4210112345678','House #123, Street 45','Female','Near ABC Hospital',1,NULL,NULL),(10,'Ali Hasan','ksaad0339@gmail.com','03049871625','B-','Islamabad','F-7/2','2024-12-17',1,1,0,'2025-05-26 20:10:22.846778','1234567890123','Shifa International','Male','Next to Mall',1,NULL,NULL),(11,'Esha','chuhanisha@gmail.com','03049871625','B+','Karachi','Gulshan','2025-02-11',1,1,0,'2025-05-26 20:23:35.182627','3230187239721','Karachi Univeristy','Female','',1,NULL,NULL),(12,'Ahmad Hanif','ahhanif03@gmail.com','03044423073','A+','Multan','green twon','2025-04-29',1,1,0,'2025-05-27 05:39:13.295933','3630227470361','chungi no.1','Male','',1,NULL,NULL),(13,'Muhammad','saad123@gmail.com','03452983323','B+','Hyderabad','Gulshan','2025-05-07',0,1,0,'2025-05-27 19:57:01.215805','3230187239721','ddd','Male','',1,NULL,NULL),(14,'Ahmed Imrad','ajhanif03@gmail.com','03124567892','A+','Multan','Gulgasht','2025-05-01',1,1,0,'2025-05-28 10:33:44.382742','4200041109876','Chungi No.6','Other','',1,NULL,NULL),(15,'Saad Bhai','ksaad0339@gmail.com','03452983323','B+','Hyderabad','Gulgasht','2025-03-13',1,1,0,'2025-05-28 11:09:29.978673','3230187239721','A','Other','',1,NULL,NULL),(16,'Faizan','saadpersonalac@gmail.com','03452983323','B+','Multan','Gulgasht','2025-05-16',1,1,0,'2025-05-29 10:59:43.767259','3630227470361','Ali','Male','',1,NULL,NULL),(17,'Muhammad Yousuf','saadpersonalac@gmail.com','03049781382','A+','Multan','Gulgasht','2025-03-18',1,1,0,'2025-05-31 18:06:42.190123','1234567890123','Chungi No.9','Male','Bata Chowk',1,NULL,NULL),(18,'Ayat Khan','chuhanisha@gmail.com','03124567892','A+','Multan','Gulgasht','2025-04-22',1,1,0,'2025-05-31 18:15:07.537625','1234567890123','Chungi No.6','Female','',1,NULL,NULL),(19,'Ahmed Raza','ksaad0339@gmail.com','03049781382','A+','Karachi','Gulshan','2025-02-19',1,1,0,'2025-05-31 18:31:35.638923','3230187239721','Gulshan','Male','',1,NULL,NULL),(20,'Khubaib Malik','muhammadsaadhasan622@gmail.com','03049781382','A+','Multan','Gulgasht Colony','2025-01-06',1,1,0,'2025-05-31 19:07:31.710734','3230186605191','Gulgasht Multan','Male','Lateef Super Store',1,30.228484,71.472523),(21,'Saad','muhammadsaadhasan622@gmail.com','03049781382','A+','Multan','Gulgasht Colony','2025-01-06',1,1,0,'2025-05-31 19:13:35.654973','3230186605191','Gulgasht Multan','Male','Lateef Super Store',1,30.228455,71.472697),(22,'Muhammad Alam','muhammadsaadhasan622@gmail.com','03049781382','O+','Karachi','Gulshan','2025-01-06',1,1,0,'2025-05-31 19:23:19.359394','3230186605191','Gulshan','Male','Lateef Super Store',1,30.228434,71.472792),(23,'Fatima','ahmedraza7651@gmail.com','03452983323','A+','Islamabad','F-7/2','2025-04-09',1,1,0,'2025-05-31 19:36:00.907966','4200041109876','Green Town','Female','',1,30.228328,71.473297),(24,'Ali Hasan','saadpersonalac@gmail.com','03049781382','AB-','Quetta','Green Twon','2025-04-22',1,1,0,'2025-05-31 19:43:59.312414','1234567890123','ASA','Male','',1,30.228316,71.473269),(25,'Anwar Ali','saadpersonalac@gmail.com','03049781382','B+','Lahore','Gulberg','2025-06-17',1,1,0,'2025-06-20 06:48:38.695225','3323098765641','Gulbergnear metro station','Male','',1,30.227351,71.47863),(26,'Muhammad Khan','ksaad0339@gmail.com','03452983323','O+','Islamabad','F-7/2','2025-06-18',1,1,0,'2025-06-20 16:10:55.555283','3230186705181','Green Town','Male','',1,30.2283306,71.4732921),(27,'Sadeeq Bhai','ksaad0339@gmail.com','03124567892','A+','Hyderabad','Gulshan','2025-06-23',1,1,0,'2025-06-20 16:21:37.296098','3323098765641','Gulshan','Male','',1,30.2283129,71.4732959),(28,'Syed Hasnain Abbas','muhammadsaadhasan622@gmail.com','03049781382','A-','Faisalabad','Gulberg','2025-06-19',1,1,0,'2025-06-20 16:25:04.054523','3323098765641','Gulberg','Male','',1,30.2283189,71.4732869),(29,'Syed Hasnain Abbas','muhammadsaadhasan622@gmail.com','03049781382','A-','Faisalabad','Gulberg','2025-06-19',1,1,0,'2025-06-20 16:25:17.443653','3323098765641','Gulberg','Male','',1,30.2283189,71.4732869),(30,'Syed Hasnain Abbas','muhammadsaadhasan622@gmail.com','03049781382','AB-','Peshawar','Gulberg','2025-06-18',1,1,0,'2025-06-20 16:28:12.295393','4200041109876','Gulberg','Male','',1,30.2283198,71.4732878),(31,'Faizan Jillani','ksaad0339@gmail.com','03124567892','AB+','Quetta','A1 Colony','2025-06-17',1,1,0,'2025-06-20 16:33:09.702049','3630227470361','A1 Colony','Male','',1,30.228311,71.4732963),(32,'Baba Jee','chuhanisha@gmail.com','03049781382','B+','Lahore','Gulberg','2025-06-10',1,1,0,'2025-06-20 16:34:49.237661','3630227470361','Gulberg','Male','',1,30.228311,71.4732963),(33,'MUzamil','ksaad0339@gmail.com','03049781383','O+','Faisalabad','Army Colony','2025-05-26',1,0,0,'2025-07-29 13:01:47.703787','3230286675233','Army Colony Faislabad','Male','',1,30.2003414,71.5038421);
/*!40000 ALTER TABLE `core_donor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_emailresponse`
--

DROP TABLE IF EXISTS `core_emailresponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_emailresponse` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `response_status` varchar(20) NOT NULL,
  `responded_at` datetime(6) NOT NULL,
  `donor_id` bigint NOT NULL,
  `request_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_emailresponse_donor_id_01bd1dad_fk_core_donor_id` (`donor_id`),
  KEY `core_emailresponse_request_id_b4c51c60_fk_core_patientrequest_id` (`request_id`),
  CONSTRAINT `core_emailresponse_donor_id_01bd1dad_fk_core_donor_id` FOREIGN KEY (`donor_id`) REFERENCES `core_donor` (`id`),
  CONSTRAINT `core_emailresponse_request_id_b4c51c60_fk_core_patientrequest_id` FOREIGN KEY (`request_id`) REFERENCES `core_patientrequest` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_emailresponse`
--

LOCK TABLES `core_emailresponse` WRITE;
/*!40000 ALTER TABLE `core_emailresponse` DISABLE KEYS */;
INSERT INTO `core_emailresponse` VALUES (17,'Email Sent','2025-05-27 17:12:02.586834',4,17),(18,'Email Sent','2025-05-27 17:12:02.606273',5,17),(19,'Email Sent','2025-05-27 17:12:02.618221',8,17),(20,'Email Sent','2025-05-27 17:12:02.630657',12,17),(27,'Email Sent','2025-05-29 09:08:11.284581',4,37),(28,'Email Sent','2025-05-29 09:08:11.312108',5,37),(29,'Email Sent','2025-05-29 09:08:11.317624',8,37),(30,'Email Sent','2025-05-29 09:08:11.334198',12,37),(31,'Available','2025-05-29 09:08:11.342285',14,37),(32,'Email Sent','2025-05-29 11:07:11.257847',6,38),(36,'Email Sent','2025-05-29 12:25:55.376830',4,41),(37,'Email Sent','2025-05-29 12:25:55.859715',8,41),(38,'Email Sent','2025-05-29 12:25:56.210870',14,41),(39,'Email Sent','2025-05-29 14:25:33.545168',4,43),(40,'Email Sent','2025-05-29 14:25:34.077970',8,43),(41,'Email Sent','2025-05-29 14:25:34.263062',14,43),(42,'Email Sent','2025-05-29 15:08:01.490076',4,48),(43,'Email Sent','2025-05-29 15:08:01.534441',8,48),(44,'Email Sent','2025-05-29 15:08:01.542788',14,48),(54,'Email Sent','2025-05-29 18:10:21.965245',4,57),(55,'Email Sent','2025-05-29 18:10:21.996502',8,57),(56,'Email Sent','2025-05-29 18:10:22.012143',14,57),(57,'Email Sent','2025-05-29 18:22:33.061616',4,58),(58,'Email Sent','2025-05-29 18:22:33.082754',8,58),(59,'Email Sent','2025-05-29 18:22:33.099722',14,58),(60,'Email Sent','2025-05-31 00:50:14.936538',4,59),(61,'Email Sent','2025-05-31 00:50:14.958904',8,59),(62,'Email Sent','2025-05-31 00:50:14.967202',14,59),(63,'Email Sent','2025-05-31 01:07:08.649541',4,60),(64,'Email Sent','2025-05-31 01:07:08.869711',8,60),(65,'Email Sent','2025-05-31 01:07:08.884469',14,60),(66,'Email Sent','2025-05-31 10:39:24.330515',4,61),(67,'Email Sent','2025-05-31 10:39:24.346194',8,61),(68,'Email Sent','2025-05-31 10:39:24.370808',14,61);
/*!40000 ALTER TABLE `core_emailresponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_patientrequest`
--

DROP TABLE IF EXISTS `core_patientrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_patientrequest` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(100) NOT NULL,
  `required_blood_group` varchar(5) NOT NULL,
  `city` varchar(100) NOT NULL,
  `colony` varchar(100) NOT NULL,
  `urgency_level` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `case_details` longtext NOT NULL,
  `cnic` varchar(13) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `hospital_address` longtext NOT NULL DEFAULT (_utf8mb4'Not provided'),
  `hospital_name` varchar(255) NOT NULL,
  `landmark` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `units_needed` varchar(10) NOT NULL,
  `fulfilled_date` date DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `is_fulfilled` tinyint(1) NOT NULL,
  `verification_code` varchar(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_patientrequest`
--

LOCK TABLES `core_patientrequest` WRITE;
/*!40000 ALTER TABLE `core_patientrequest` DISABLE KEYS */;
INSERT INTO `core_patientrequest` VALUES (6,'Zara','O+','Multan','Rasheeda Bad','1','2025-05-25 20:39:46.672874','no','1234567789012','Female','rasheeda bad','Fatima Center','Rasheeda Bad','03346576564','4+',NULL,'Pending',0,''),(17,'Amna','A+','Multan','Gulgasht','1','2025-05-27 17:11:59.462360','','1234567789012','Male','Chungi No.6','City Hospital','','03049781382','2',NULL,'Pending',0,''),(18,'Khala Jaan','B-','Karachi','Gulgasht','1','2025-05-27 17:40:44.371867','No','3230187967895','Female','ChungiNo 6','Liaqat hospital','','03023434564','2',NULL,'Pending',0,''),(36,'Esha','A+','Multan','Gulgasht','2','2025-05-28 14:52:36.228789','','3230876564341','Female','gg','City Hospital','','03049781382','1',NULL,'Pending',0,'192500'),(37,'Alizy','A+','Multan','Gulgasht','2','2025-05-29 09:08:07.067743','','2112221234356','Male','Dd','City Hospital','','03346576564','2',NULL,'Pending',0,'450582'),(38,'Sharjeena','O+','Multan','Rasheeda Bad','2','2025-05-29 11:07:07.634118','','3230788787788','Male','DDD','City Hospital','','03087965453','4+',NULL,'Pending',0,'153888'),(41,'Bibi','A+','Multan','Gulgasht','2','2025-05-29 12:25:51.562082','','3230987876751','Female','Chungi No.6','Nishter','Lateef Super Store','03049781382','1',NULL,'Pending',0,'884117'),(43,'Arbaz','A+','Multan','Gulgasht','1','2025-05-29 14:25:27.474203','','2112221234356','Male','vv','City Hospital','','03087965453','2','2025-05-29','Pending',1,'608714'),(45,'Aiza Bibi','O-','Hyderabad','Gulshan','3','2025-05-29 14:53:18.058238','','3230788787788','Female','gg','Liaqat hospital','','03087965453','1','2025-05-29','Pending',1,'550569'),(46,'Shahryar Azher','O+','Quetta','F-7/2','4','2025-05-29 14:59:31.906285','','3230187967895','Male','d','Liaqat hospital','','03023434564','3','2025-05-29','Pending',1,'564003'),(47,'Farzana','A+','Multan','Gulshan','3','2025-05-29 15:02:41.700640','','3230788787788','Female','ss','Liaqat hospital','x','03087965453','3','2025-05-29','Pending',1,'930192'),(48,'Arooj','A+','Multan','Gulgasht','2','2025-05-29 15:07:55.938672','Surgery','3230788787788','Female','Down Town','City Hospital','Bata Chowk','03087965453','1','2025-05-29','Pending',1,'902315'),(49,'Bakhtawar','B+','Multan','F-7/2','2','2025-05-29 15:10:58.680364','g','3230897989654','Male','bbhg','Liaqat hospital','T chowk','03049781382','2','2025-05-29','Pending',1,'992165'),(50,'Nauman','A-','Peshawar','Rasheeda Bad','2','2025-05-29 15:51:58.265486','','2112221234356','Male','BBB','Liaqat hospital','','03023434564','1','2025-05-29','Pending',1,'912898'),(52,'Ali Gham','A+','Multan','Gulgasht Colony','2','2025-05-29 17:35:21.853414','','3230987876751','Male','dd','Nishter','Lateef Super Store','03049781356','1','2025-05-29','Pending',1,'158124'),(55,'Aisha','AB+','Multan','Gulgasht','2','2025-05-29 17:49:28.606023','','1234567789012','Female','d','City Hospital','','03049781382','2','2025-05-29','Pending',1,'809717'),(56,'Sanam','A+','Multan','Gulgasht','2','2025-05-29 17:57:11.238627','','3230187967895','Male','DD','City Hospital','','03023434564','1',NULL,'Pending',0,'826256'),(57,'Zara','A+','Multan','Gulgasht','1','2025-05-29 18:10:14.270717','','1234567789012','Male','ff','City Hospital','','03346576564','1','2025-05-29','Pending',1,'519843'),(58,'Esha','A+','Multan','Gulgasht','1','2025-05-29 18:22:27.094969','','3230788787788','Male','ss','City Hospital','','03023434564','3','2025-05-29','Pending',1,'896132'),(59,'Bakhtawar','A+','Multan','Gulgasht','2','2025-05-31 00:50:11.586728','','3230187967895','Male','Bata Chowk','City Hospital','','03049781382','2',NULL,'Pending',0,'892794'),(60,'Zara','A+','Multan','Gulgasht','1','2025-05-31 01:07:05.489483','','3230788787788','Female','Chungi No.6','City Hospital','','03346576564','1','2025-05-31','Pending',1,'354500'),(61,'Ali Khan','A+','Multan','Gulgasht','2','2025-05-31 10:39:20.125047','','3230788787788','Male','aa','City Hospital','','03049781382','1',NULL,'Pending',0,'771722'),(62,'Shahryar Azher','O+','Peshawar','Rasheeda Bad','2','2025-05-31 19:45:02.832313','','3230788787788','Female','gg','City Hospital','','03023434564','4+',NULL,'Pending',0,'772998'),(63,'Shahryar Azher','AB-','Quetta','Gulgasht','3','2025-05-31 19:47:29.576684','','3230876564341','Female','gg','Liaqat hospital','','03346576564','2','2025-05-31','Pending',1,'301121'),(64,'Fatima','O-','Lahore','Gulshan','3','2025-05-31 19:52:05.785139','','3230187967895','Female','hgh','Liaqat hospital','','03023434564','1','2025-05-31','Pending',1,'536639'),(65,'Ms Komal','O-','Multan','Gulgasht Colony','3','2025-06-20 15:59:26.869097','','3230987876751','Female','Gulgasht Multan','Nishter','Lateef Super Store','03049781356','1','2025-06-20','Pending',1,'185775'),(66,'Batool Zahra','O+','Faisalabad','Army Colony','1','2025-07-22 10:25:55.475290','','3230987876171','Male','Army Pubic School Faisalabad','Army Hospital','','03055163867','2',NULL,'Pending',0,'511539');
/*!40000 ALTER TABLE `core_patientrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-05-25 15:46:01.808767','1','Donor object (1)',1,'[{\"added\": {}}]',1,1),(2,'2025-05-25 15:46:53.481398','1','Donor object (1)',3,'',1,1),(3,'2025-05-25 18:32:43.567614','2','Donor object (2)',3,'',1,1),(4,'2025-05-25 19:18:50.007454','3','Donor object (3)',2,'[]',1,1),(5,'2025-05-25 19:23:00.058688','3','PatientRequest object (3)',2,'[]',2,1),(6,'2025-05-25 19:23:52.169515','1','PatientRequest object (1)',2,'[]',2,1),(7,'2025-05-25 20:03:03.525017','1','EmailResponse object (1)',3,'',3,1),(8,'2025-05-25 20:03:28.530504','3','Donor object (3)',3,'',1,1),(9,'2025-05-25 20:04:01.882195','3','PatientRequest object (3)',3,'',2,1),(10,'2025-05-25 20:04:13.727433','2','PatientRequest object (2)',3,'',2,1),(11,'2025-05-25 20:04:44.146166','1','PatientRequest object (1)',3,'',2,1),(12,'2025-05-25 20:40:20.046315','6','Donor object (6)',2,'[{\"changed\": {\"fields\": [\"Is profile public\"]}}]',1,1),(13,'2025-05-25 20:41:15.884542','6','PatientRequest object (6)',2,'[{\"changed\": {\"fields\": [\"Gender\", \"Hospital address\", \"Urgency level\"]}}]',2,1),(14,'2025-05-26 13:57:28.774868','4','PatientRequest object (4)',3,'',2,1),(15,'2025-05-26 20:01:04.893460','6','PatientRequest object (6)',2,'[{\"changed\": {\"fields\": [\"Landmark\"]}}]',2,1),(16,'2025-05-26 20:41:07.666917','4','Donor object (4)',2,'[{\"changed\": {\"fields\": [\"Colony\"]}}]',1,1),(17,'2025-05-28 11:50:25.790493','22','PatientRequest object (22)',3,'',2,1),(18,'2025-05-28 12:49:04.470667','27','Esha - A+',2,'[{\"changed\": {\"fields\": [\"Fulfilled date\", \"Fulfilled at\"]}}]',2,1),(19,'2025-05-28 12:49:25.604264','27','Esha - A+',2,'[{\"changed\": {\"fields\": [\"Is fulfilled\"]}}]',2,1),(20,'2025-05-28 12:50:18.788447','27','Esha - A+',2,'[]',2,1),(21,'2025-05-28 14:29:25.187741','30','PatientRequest object (30)',2,'[{\"changed\": {\"fields\": [\"Required blood group\"]}}]',2,1),(22,'2025-05-29 11:28:28.774430','31','EmailResponse object (31)',2,'[{\"changed\": {\"fields\": [\"Response status\"]}}]',3,1),(23,'2025-05-29 14:04:14.226322','42','Ali - A+ (Multan)',2,'[{\"changed\": {\"fields\": [\"Is fulfilled\"]}}]',2,1),(24,'2025-05-29 14:06:20.767450','42','Ali - A+ (Multan)',3,'',2,1),(25,'2025-05-29 14:06:20.767450','40','Ali - A+ (Multan)',3,'',2,1),(26,'2025-05-29 14:06:20.767450','39','Test - O+ (Lahore)',3,'',2,1),(27,'2025-05-29 14:06:20.767450','35','Shahryar Azher - A+ (Multan)',3,'',2,1),(28,'2025-05-29 14:06:20.767450','34','Shahryar Azher - A+ (Multan)',3,'',2,1),(29,'2025-05-29 14:06:20.767450','33','Shahryar Azher - A+ (Multan)',3,'',2,1),(30,'2025-05-29 14:06:20.767450','32','Shahryar Azher - A+ (Multan)',3,'',2,1),(31,'2025-05-29 14:06:20.767450','31','Shahryar Azher - A+ (Multan)',3,'',2,1),(32,'2025-05-29 14:06:20.767450','30','Zara - A+ (Multan)',3,'',2,1),(33,'2025-05-29 14:06:20.767450','29','Shahryar Azher - A+ (Multan)',3,'',2,1),(34,'2025-05-29 14:06:20.767450','28','Bakhtawar - A+ (Multan)',3,'',2,1),(35,'2025-05-29 14:06:20.767450','27','Esha - A+ (Multan)',3,'',2,1),(36,'2025-05-29 14:06:20.767450','26','Sana - A+ (Multan)',3,'',2,1),(37,'2025-05-29 14:06:20.767450','25','Ali Ya Dullah - A+ (Multan)',3,'',2,1),(38,'2025-05-29 14:06:20.767450','24','Sana - A- (Multan)',3,'',2,1),(39,'2025-05-29 14:06:20.767450','23','Saad - O+ (Multan)',3,'',2,1),(40,'2025-05-29 14:06:20.767450','21','Zara - B+ (Hyderabad)',3,'',2,1),(41,'2025-05-29 14:06:20.767450','20','Ali - AB- (Multan)',3,'',2,1),(42,'2025-05-29 14:34:02.729791','43','Arbaz - A+ (Multan)',2,'[]',2,1),(43,'2025-05-29 14:54:09.167129','44','Aiza - O- (Hyderabad)',3,'',2,1),(44,'2025-05-29 17:47:36.515916','54','Aisha - A+ (Multan)',3,'',2,1),(45,'2025-05-29 17:47:36.515916','53','Aisha - A+ (Multan)',3,'',2,1),(46,'2025-05-29 17:47:36.515916','51','Aisha - A+ (Multan)',3,'',2,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (4,'admin','logentry'),(6,'auth','group'),(5,'auth','permission'),(7,'auth','user'),(8,'contenttypes','contenttype'),(1,'core','donor'),(3,'core','emailresponse'),(2,'core','patientrequest'),(9,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-05-25 12:11:58.746885'),(2,'auth','0001_initial','2025-05-25 12:12:00.498639'),(3,'admin','0001_initial','2025-05-25 12:12:00.892908'),(4,'admin','0002_logentry_remove_auto_add','2025-05-25 12:12:00.916121'),(5,'admin','0003_logentry_add_action_flag_choices','2025-05-25 12:12:00.941722'),(6,'contenttypes','0002_remove_content_type_name','2025-05-25 12:12:01.201001'),(7,'auth','0002_alter_permission_name_max_length','2025-05-25 12:12:01.356067'),(8,'auth','0003_alter_user_email_max_length','2025-05-25 12:12:01.408151'),(9,'auth','0004_alter_user_username_opts','2025-05-25 12:12:01.429442'),(10,'auth','0005_alter_user_last_login_null','2025-05-25 12:12:01.576609'),(11,'auth','0006_require_contenttypes_0002','2025-05-25 12:12:01.583737'),(12,'auth','0007_alter_validators_add_error_messages','2025-05-25 12:12:01.605011'),(13,'auth','0008_alter_user_username_max_length','2025-05-25 12:12:01.761398'),(14,'auth','0009_alter_user_last_name_max_length','2025-05-25 12:12:01.921667'),(15,'auth','0010_alter_group_name_max_length','2025-05-25 12:12:01.966339'),(16,'auth','0011_update_proxy_permissions','2025-05-25 12:12:01.983328'),(17,'auth','0012_alter_user_first_name_max_length','2025-05-25 12:12:02.162865'),(18,'core','0001_initial','2025-05-25 12:12:02.586469'),(19,'sessions','0001_initial','2025-05-25 12:12:02.671451'),(20,'core','0002_donor_cnic_donor_full_address_donor_gender_and_more','2025-05-25 15:37:10.568647'),(21,'core','0003_alter_emailresponse_response_status','2025-05-25 19:42:17.161962'),(22,'core','0004_patientrequest_fulfilled_date_patientrequest_status','2025-05-26 12:26:03.077094'),(23,'core','0005_patientrequest_created_by_and_more','2025-05-28 10:28:35.582264'),(24,'core','0006_remove_patientrequest_created_by_and_more','2025-05-28 11:07:56.097219'),(25,'core','0007_patientrequest_fulfilled_at_and_more','2025-05-28 11:43:14.494741'),(26,'core','0008_alter_patientrequest_verification_code','2025-05-28 12:44:05.759014'),(27,'core','0009_alter_patientrequest_verification_code','2025-05-28 14:23:50.820426'),(28,'core','0010_remove_patientrequest_fulfilled_at_donor_is_active_and_more','2025-05-29 09:06:26.939037'),(29,'core','0011_patientrequest_latitude_patientrequest_longitude','2025-05-29 18:51:01.062764'),(30,'core','0012_alter_patientrequest_latitude_and_more','2025-05-31 11:39:14.442750'),(31,'core','0013_remove_patientrequest_latitude_and_more','2025-05-31 18:11:51.343874'),(32,'core','0014_alter_donor_latitude_alter_donor_longitude','2025-06-20 07:45:17.633879'),(33,'core','0015_alter_donor_latitude_alter_donor_longitude','2025-06-20 15:53:50.914767');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('225ogz1b1a4dw4y8giczxkuge1jxpmss','.eJxVjDEOwjAMRe-SGUVpjKFhZO8ZIsd2SQGlUtNOiLtDpA6gv_339F4m0rbmuFVd4iTmYjpz-P0S8UNLA3Kncpstz2VdpmSbYnda7TCLPq-7-xfIVHPLKqCSdA6oD8AQBJG9aj8Gj45Uw8lzQsYzHhORQkDwwTv5DjmN5v0B6s84KA:1uJBRI:Pr8-qhGvzgSzHnSHWQo4z9adbQkAS-5JTfRP0o5W2qs','2025-06-08 13:30:56.951366'),('47p31fe51anak745k6ud0f4ndcxwx0bj','.eJxVjDEOwjAMRe-SGUVpjKFhZO8ZIsd2SQGlUtNOiLtDpA6gv_339F4m0rbmuFVd4iTmYjpz-P0S8UNLA3Kncpstz2VdpmSbYnda7TCLPq-7-xfIVHPLKqCSdA6oD8AQBJG9aj8Gj45Uw8lzQsYzHhORQkDwwTv5DjmN5v0B6s84KA:1uooJk:xiOhmNw-rx5xpqPOW7trwG2ee_9QP4Mss7gZFNNbzh8','2025-09-03 19:17:52.316549'),('gvy98ontisr2auwh4gwerruymi6aphfq','.eJxVjDEOwjAMRe-SGUVpjKFhZO8ZIsd2SQGlUtNOiLtDpA6gv_339F4m0rbmuFVd4iTmYjpz-P0S8UNLA3Kncpstz2VdpmSbYnda7TCLPq-7-xfIVHPLKqCSdA6oD8AQBJG9aj8Gj45Uw8lzQsYzHhORQkDwwTv5DjmN5v0B6s84KA:1uJAO4:tYyARjdVusYQSFZnK90eBEQ0IZ5fBFrmzA6I6pf7UTk','2025-06-08 12:23:32.499170'),('oayfrg3q6yamqthwjei5bg65dkj0doke','.eJxVjDEOwjAMRe-SGUVpjKFhZO8ZIsd2SQGlUtNOiLtDpA6gv_339F4m0rbmuFVd4iTmYjpz-P0S8UNLA3Kncpstz2VdpmSbYnda7TCLPq-7-xfIVHPLKqCSdA6oD8AQBJG9aj8Gj45Uw8lzQsYzHhORQkDwwTv5DjmN5v0B6s84KA:1uSVWc:7G1OduwpRB7448lu_8lODADICRX8XBNTmTIrbhsjyvo','2025-07-04 06:46:58.171430'),('s28s4hd7nil8dz5sywnmm3wif7w1kqia','.eJxVjDEOwjAMRe-SGUVpjKFhZO8ZIsd2SQGlUtNOiLtDpA6gv_339F4m0rbmuFVd4iTmYjpz-P0S8UNLA3Kncpstz2VdpmSbYnda7TCLPq-7-xfIVHPLKqCSdA6oD8AQBJG9aj8Gj45Uw8lzQsYzHhORQkDwwTv5DjmN5v0B6s84KA:1uJGeo:fttzfHQjmPfAobiNX5ZYr5543SyZyqAttntzdb0xYug','2025-06-08 19:05:14.293055');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donors`
--

DROP TABLE IF EXISTS `donors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `cnic` varchar(13) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `blood_group` varchar(5) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `colony` varchar(100) DEFAULT NULL,
  `full_address` text,
  `landmark` varchar(255) DEFAULT NULL,
  `last_donation_date` date DEFAULT NULL,
  `is_profile_public` tinyint(1) DEFAULT '0',
  `is_healthy` tinyint(1) DEFAULT '1',
  `total_donations` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donors`
--

LOCK TABLES `donors` WRITE;
/*!40000 ALTER TABLE `donors` DISABLE KEYS */;
/*!40000 ALTER TABLE `donors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_responses`
--

DROP TABLE IF EXISTS `email_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_responses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `donor_id` int DEFAULT NULL,
  `request_id` int DEFAULT NULL,
  `response_status` varchar(20) DEFAULT NULL,
  `responded_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `donor_id` (`donor_id`),
  KEY `request_id` (`request_id`),
  CONSTRAINT `email_responses_ibfk_1` FOREIGN KEY (`donor_id`) REFERENCES `donors` (`id`),
  CONSTRAINT `email_responses_ibfk_2` FOREIGN KEY (`request_id`) REFERENCES `patient_requests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_responses`
--

LOCK TABLES `email_responses` WRITE;
/*!40000 ALTER TABLE `email_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_requests`
--

DROP TABLE IF EXISTS `patient_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(100) DEFAULT NULL,
  `cnic` varchar(13) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `required_blood_group` varchar(5) DEFAULT NULL,
  `units_needed` varchar(10) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `colony` varchar(100) DEFAULT NULL,
  `hospital_name` varchar(255) DEFAULT NULL,
  `hospital_address` text,
  `landmark` varchar(255) DEFAULT NULL,
  `urgency_level` varchar(20) DEFAULT NULL,
  `case_details` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_requests`
--

LOCK TABLES `patient_requests` WRITE;
/*!40000 ALTER TABLE `patient_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_requests` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-21  0:33:36
