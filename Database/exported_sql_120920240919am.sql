CREATE DATABASE  IF NOT EXISTS `propman` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `propman`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: propman
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dy_amenities`
--

DROP TABLE IF EXISTS `dy_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dy_amenities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amenity` int DEFAULT NULL,
  `community` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `ammenity_fk_id_idx` (`amenity`),
  KEY `community_fk_id_idx` (`community`),
  CONSTRAINT `ammenity_fk_id` FOREIGN KEY (`amenity`) REFERENCES `st_amenities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `community_fk_id` FOREIGN KEY (`community`) REFERENCES `st_community` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table for amenities percommunity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dy_amenities`
--

LOCK TABLES `dy_amenities` WRITE;
/*!40000 ALTER TABLE `dy_amenities` DISABLE KEYS */;
/*!40000 ALTER TABLE `dy_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dy_comm_rm_fm_map`
--

DROP TABLE IF EXISTS `dy_comm_rm_fm_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dy_comm_rm_fm_map` (
  `id` int NOT NULL AUTO_INCREMENT,
  `community_name` varchar(50) DEFAULT NULL,
  `rm_mobile` varchar(45) DEFAULT NULL,
  `fm_mobile` varchar(45) DEFAULT NULL,
  `community_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_comm_id_idx` (`community_id`),
  CONSTRAINT `fk_comm_id` FOREIGN KEY (`community_id`) REFERENCES `st_community` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table for  Community RM & FM Details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dy_comm_rm_fm_map`
--

LOCK TABLES `dy_comm_rm_fm_map` WRITE;
/*!40000 ALTER TABLE `dy_comm_rm_fm_map` DISABLE KEYS */;
INSERT INTO `dy_comm_rm_fm_map` VALUES (1,'Avatar','7331108274','888888888',1),(2,'Avatar','8889999999','NULL',1),(3,'Jewel','999999999','NULL',2),(4,'Jewel','1111111111','NULL',2),(5,'Nishada','2222222222','NULL',3);
/*!40000 ALTER TABLE `dy_comm_rm_fm_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dy_landmarks`
--

DROP TABLE IF EXISTS `dy_landmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dy_landmarks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `landmark_name` varchar(60) DEFAULT NULL,
  `distance(kms)` double DEFAULT NULL,
  `landmark_category_id` int DEFAULT NULL,
  `community_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_landmark_cat_id_idx` (`landmark_category_id`),
  KEY `fk_community_id_idx` (`community_id`),
  CONSTRAINT `fk_community_id` FOREIGN KEY (`community_id`) REFERENCES `st_community` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_landmark_cat_id` FOREIGN KEY (`landmark_category_id`) REFERENCES `st_landmarks_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table For Landmarks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dy_landmarks`
--

LOCK TABLES `dy_landmarks` WRITE;
/*!40000 ALTER TABLE `dy_landmarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `dy_landmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dy_property`
--

DROP TABLE IF EXISTS `dy_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dy_property` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `prop_type_id` int DEFAULT NULL,
  `home_type_id` int DEFAULT NULL,
  `prop_desc_id` int DEFAULT NULL,
  `community_id` int DEFAULT NULL,
  `no_beds` int DEFAULT NULL,
  `no_baths` int DEFAULT NULL,
  `no_balconies` int DEFAULT NULL,
  `tenant_type_id` int DEFAULT NULL,
  `tenant_eat_pref_id` int DEFAULT NULL,
  `rental_range_id` int DEFAULT NULL,
  `parking_type_id` int DEFAULT NULL,
  `parking_count_id` int DEFAULT NULL,
  `deposit_range_id` int DEFAULT NULL,
  `gender_pref` int DEFAULT NULL,
  `availabl_date` datetime DEFAULT NULL,
  `current_status` int DEFAULT NULL,
  `tower_no` int DEFAULT NULL,
  `floor_no` int DEFAULT NULL,
  `flat_no` int DEFAULT NULL,
  `images_location` varchar(256) DEFAULT NULL,
  `rec_add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `rec_last_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `prop_fk_user_id_idx` (`user_id`),
  KEY `prop_fk_prop_type_id_idx` (`prop_type_id`),
  KEY `prop_fk_prop_desc_id_idx` (`prop_desc_id`),
  KEY `prop_fk_home_type_id_idx` (`home_type_id`),
  KEY `prop_fk_comm_id_idx` (`community_id`),
  KEY `prop_fk_bed_id_idx` (`no_beds`),
  KEY `prop_fk_bath_id_idx` (`no_baths`),
  KEY `prop_fk_balcony_id_idx` (`no_balconies`),
  KEY `prop_fk_user_type_id_idx` (`tenant_type_id`),
  KEY `prop_fk_tenant_eat_pref_id_idx` (`tenant_eat_pref_id`),
  KEY `prop_fk_rental_range_id_idx` (`rental_range_id`),
  KEY `prop_fk_park_type_id_idx` (`parking_type_id`),
  KEY `prop_fk_park_count_idx` (`parking_count_id`),
  KEY `prop_fk_dep_id_idx` (`deposit_range_id`),
  KEY `prop_gen_pref_id_idx` (`gender_pref`),
  KEY `prop_fk_current_status_id_idx` (`current_status`),
  CONSTRAINT `prop_fk_balcony_id` FOREIGN KEY (`no_balconies`) REFERENCES `st_balcony` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prop_fk_bath_id` FOREIGN KEY (`no_baths`) REFERENCES `st_baths` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prop_fk_bed_id` FOREIGN KEY (`no_beds`) REFERENCES `st_beds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prop_fk_comm_id` FOREIGN KEY (`community_id`) REFERENCES `st_community` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prop_fk_current_status_id` FOREIGN KEY (`current_status`) REFERENCES `st_current_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prop_fk_dep_id` FOREIGN KEY (`deposit_range_id`) REFERENCES `st_deposit_range` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prop_fk_gen_pref_id` FOREIGN KEY (`gender_pref`) REFERENCES `st_gender` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prop_fk_home_type_id` FOREIGN KEY (`home_type_id`) REFERENCES `st_home_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prop_fk_park_count` FOREIGN KEY (`parking_count_id`) REFERENCES `st_parking_count` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prop_fk_park_type_id` FOREIGN KEY (`parking_type_id`) REFERENCES `st_parking_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prop_fk_prop_desc_id` FOREIGN KEY (`prop_desc_id`) REFERENCES `st_prop_desc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prop_fk_prop_type_id` FOREIGN KEY (`prop_type_id`) REFERENCES `st_prop_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prop_fk_rental_range_id` FOREIGN KEY (`rental_range_id`) REFERENCES `st_rental_range` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prop_fk_tenant_eat_pref_id` FOREIGN KEY (`tenant_eat_pref_id`) REFERENCES `st_tenant_eat_pref` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prop_fk_tenant_type_id` FOREIGN KEY (`tenant_type_id`) REFERENCES `st_tenant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prop_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `dy_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table for Property Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dy_property`
--

LOCK TABLES `dy_property` WRITE;
/*!40000 ALTER TABLE `dy_property` DISABLE KEYS */;
INSERT INTO `dy_property` VALUES (2,1,1,2,3,4,3,2,1,1,2,1,1,2,3,1,'2025-01-01 00:00:00',NULL,1,2,3,'https://raza1.s3.us-east-1.amazonaws.com/property-images/1733475881446/',NULL,NULL),(3,1,1,2,3,4,3,2,1,1,2,1,1,2,3,1,'2025-01-01 00:00:00',NULL,1,2,3,'https://raza1.s3.us-east-1.amazonaws.com/property-images/1733477289398/',NULL,NULL),(4,1,1,2,3,4,3,2,1,1,2,1,1,2,3,1,'2025-01-01 00:00:00',NULL,1,2,3,'https://raza1.s3.us-east-1.amazonaws.com/property-images/1733477831708/','2024-12-06 09:37:13','2024-12-06 09:37:13'),(5,1,1,2,3,4,3,2,1,1,2,1,1,2,3,1,'2025-01-01 00:00:00',NULL,1,2,3,'https://raza1.s3.us-east-1.amazonaws.com/property-images/1733481956969/','2024-12-06 10:45:58','2024-12-06 10:45:58');
/*!40000 ALTER TABLE `dy_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dy_user`
--

DROP TABLE IF EXISTS `dy_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dy_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `auth0id` varchar(45) DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `email_id` varchar(45) DEFAULT NULL,
  `mobile_no` varchar(12) DEFAULT NULL,
  `role_id` int DEFAULT '2',
  `permission_id` int DEFAULT '1',
  `ref_code` varchar(10) DEFAULT NULL,
  `mobile_verified` tinyint DEFAULT '0',
  `email_verified` tinyint DEFAULT '0',
  `passwd` varchar(45) DEFAULT NULL,
  `reconfirm_passwd` varchar(45) DEFAULT NULL,
  `passwd_exp_time` varchar(45) DEFAULT NULL,
  `signuptime` datetime DEFAULT NULL,
  `gender_id` int DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_role_id_idx` (`role_id`),
  KEY `fk_perm_id_idx` (`permission_id`),
  KEY `fk_gender_id_idx` (`gender_id`),
  CONSTRAINT `fk_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `st_gender` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_perm_id` FOREIGN KEY (`permission_id`) REFERENCES `st_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `st_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dy_user`
--

LOCK TABLES `dy_user` WRITE;
/*!40000 ALTER TABLE `dy_user` DISABLE KEYS */;
INSERT INTO `dy_user` VALUES (1,'auth0_id_123','John Doe','john.doe@example.com','1234567890',1,1,'REF123',1,1,'password123','password123','2024-12-06 12:00:59','2024-12-06 12:05:00',1,'2024-12-06 12:10:00');
/*!40000 ALTER TABLE `dy_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dy_user_profile`
--

DROP TABLE IF EXISTS `dy_user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dy_user_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `current_city` varchar(45) DEFAULT NULL,
  `conv_mode_id` int DEFAULT '1',
  `alt_email_id` varchar(45) DEFAULT NULL,
  `alt_mobile_no` varchar(12) DEFAULT NULL,
  `allow_promotion_campaign` int DEFAULT '1',
  `Interests` multilinestring DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `d_UNIQUE` (`id`),
  KEY `fk_user_id_idx` (`user_id`),
  KEY `fk_conv_mode_id_idx` (`conv_mode_id`),
  CONSTRAINT `fk_conv_mode_id` FOREIGN KEY (`conv_mode_id`) REFERENCES `st_conv_mode` (`id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `dy_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table for User Profile';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dy_user_profile`
--

LOCK TABLES `dy_user_profile` WRITE;
/*!40000 ALTER TABLE `dy_user_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `dy_user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_amenities`
--

DROP TABLE IF EXISTS `st_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_amenities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amenity_name` varchar(75) DEFAULT NULL,
  `amenity_category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_am_cat_id` (`amenity_category_id`),
  CONSTRAINT `fk_am_cat_id` FOREIGN KEY (`amenity_category_id`) REFERENCES `st_amenity_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table for Amenities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_amenities`
--

LOCK TABLES `st_amenities` WRITE;
/*!40000 ALTER TABLE `st_amenities` DISABLE KEYS */;
INSERT INTO `st_amenities` VALUES (1,'yoga',1),(2,'meditation',1),(3,'bicycling',1),(4,'joggingtrack',1),(5,'walkingtrack',1),(6,'dancefloor',2),(7,'musicclub',2),(8,'paintingclub',2),(9,'theatregroup',2),(10,'vintageclub',2),(11,'professionalclub',2),(12,'kittypartyclub',2),(13,'amatuersclub',2),(14,'childrenclub',2),(15,'toddlerclub',2),(16,'cricket',3),(17,'basketball',3),(18,'throwball',3),(19,'football',3),(20,'skatingring',3),(21,'volleyball',3),(22,'lawntennis',3),(24,'outdoorshuttlecourt',3),(25,'parks',2),(26,'amphiteatre',2),(27,'minigolf',3),(28,'carroms',4),(29,'chess',4),(30,'cards',4),(31,'billiards',4),(32,'snooker',4),(33,'foosball',4),(34,'videogames',4),(35,'tabletennis',4),(36,'squash',4),(37,'shuttlecourt',4),(38,'fencing',4),(39,'zudoring',4),(40,'wrestlingring',4),(41,'armwrestling',4),(42,'compoundwall',5),(43,'cctvsurveyance',5),(44,'securitypersonnel',5),(45,'maingatesecurity',5),(46,'24hrsequrity',5),(47,'frontservice',6),(48,'guestrooms',6),(49,'multipurposeroom',6),(50,'blacktoproads',6),(51,'commongardening',6),(52,'supermarket',6),(53,'dispensery',1),(54,'commoncanteen',6),(55,'conferencerooms',6),(56,'laundry',6),(57,'salons',6),(58,'shoppingoutlets',6),(59,'brokerageservices',6),(60,'cleaningservices',6),(61,'commonwastebins',7),(62,'wasteducts',7),(63,'wastecollection',7),(64,'wetwaste',7),(65,'drywaste',7),(66,'biowaste',7),(67,'wasterecycling',7),(68,'biogasgeneration',7),(69,'compostgeneration',7),(70,'hazardouswaste',7),(71,'ewaste',7),(72,'waterharvesting',8),(73,'waterrecycling',8),(74,'allroundwater',8),(75,'watermetering',8),(76,'externalplantation',9),(77,'lawns',9),(78,'treeprotection',9),(79,'sculputeres',9),(80,'fountains',9),(81,'artificialwaterfalls',9),(82,'allroundpower',10),(83,'powerbackup',10),(84,'streetlighting',10),(85,'undergroundelectrification',10),(86,'sewagetratment',11),(87,'sewageclearance',11),(88,'drainagemaintenance',11),(89,'manholesmaintenance',11),(90,'generatorbackup',10),(91,'indoorswimmingpool',4),(92,'outdoorswimmingpool',3),(93,'creche',6),(94,'kidsarea',4),(95,'clubhouse',6);
/*!40000 ALTER TABLE `st_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_amenity_category`
--

DROP TABLE IF EXISTS `st_amenity_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_amenity_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amenity_category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table for Amenity Category';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_amenity_category`
--

LOCK TABLES `st_amenity_category` WRITE;
/*!40000 ALTER TABLE `st_amenity_category` DISABLE KEYS */;
INSERT INTO `st_amenity_category` VALUES (1,'Health_mgmnt'),(2,'Recreation_mgmnt'),(3,'Outdoor_sports_mgmnt'),(4,'Indoor_sports_mgmnt'),(5,'Security_mgmnt'),(6,'Utilities_mgmnt'),(7,'Waste_mgmnt'),(8,'Water_mgmnt'),(9,'Gardening_mgmnt'),(10,'Power_mgmnt'),(11,'Sewage_mgmnt');
/*!40000 ALTER TABLE `st_amenity_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_balcony`
--

DROP TABLE IF EXISTS `st_balcony`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_balcony` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nbalcony` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table For Balcony';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_balcony`
--

LOCK TABLES `st_balcony` WRITE;
/*!40000 ALTER TABLE `st_balcony` DISABLE KEYS */;
INSERT INTO `st_balcony` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `st_balcony` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_baths`
--

DROP TABLE IF EXISTS `st_baths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_baths` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nbaths` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table for Bathrooms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_baths`
--

LOCK TABLES `st_baths` WRITE;
/*!40000 ALTER TABLE `st_baths` DISABLE KEYS */;
INSERT INTO `st_baths` VALUES (1,'1'),(2,'2'),(3,'3'),(4,'4'),(5,'5'),(6,'6'),(7,'7'),(8,'8'),(9,'9'),(10,'10');
/*!40000 ALTER TABLE `st_baths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_beds`
--

DROP TABLE IF EXISTS `st_beds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_beds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nbeds` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table For Bedrooms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_beds`
--

LOCK TABLES `st_beds` WRITE;
/*!40000 ALTER TABLE `st_beds` DISABLE KEYS */;
INSERT INTO `st_beds` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `st_beds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_brokerage`
--

DROP TABLE IF EXISTS `st_brokerage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_brokerage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brokerage_amount` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table For Brokerage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_brokerage`
--

LOCK TABLES `st_brokerage` WRITE;
/*!40000 ALTER TABLE `st_brokerage` DISABLE KEYS */;
INSERT INTO `st_brokerage` VALUES (1,10000);
/*!40000 ALTER TABLE `st_brokerage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_builder`
--

DROP TABLE IF EXISTS `st_builder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_builder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_city_id_1_idx` (`city_id`),
  CONSTRAINT `fk_city_id_1` FOREIGN KEY (`city_id`) REFERENCES `st_city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table for Builder';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_builder`
--

LOCK TABLES `st_builder` WRITE;
/*!40000 ALTER TABLE `st_builder` DISABLE KEYS */;
INSERT INTO `st_builder` VALUES (1,'MyHome',198),(2,'Aparna',198),(3,'Rajpushpa',198),(4,'HonerHomes',198),(5,'Vamsiram',198),(6,'Vertex',198),(7,'Prestige',198),(8,'Vasavi',198),(9,'Hallmark',198),(10,'Gowra',198),(11,'Ramky',198),(12,'ASBL',198),(13,'CyberCity',198),(14,'Praneeth',198),(15,'APR',198),(16,'GreenSpace',198),(17,'Alekhya',198),(18,'Radhey',198),(19,'Giridhari',198),(20,'SriAditya',198),(21,'Lansum',198),(22,'MVV Builders',11),(23,'Subhagruha',11),(24,'Bhoomatha',11),(25,'MK Builders',11),(26,'Vaisakhi',11),(27,'Aditya',11),(28,'Prakruthi',11),(29,'Balaji',11),(30,'ShriRam',11),(31,'VK',11),(32,'Sardar',11),(33,'Peram',11),(34,'Swathi',11),(35,'Charan',11),(36,'Flora',11),(37,'Sai Infra',11),(38,'SriVaibhava',11),(39,'utkarsha',11),(40,'Lansum',11),(41,'Pranathi',11),(42,'Himaja',2),(43,'Raki Avenues',2),(44,'V Cube',2),(45,'Akshar Group',66),(46,'Sangani Infra',66),(47,'Shreenath Infra',66),(48,'Sky Seven Infra',66),(49,'Nilamber',66),(50,'Pratham Realty',66),(51,'J P Iscon',66),(52,'Narayan Realty',66),(53,'Darshanam Realty',66),(54,'Mangla Group',66),(55,'Fortune Group',66),(56,'vraj Builders',67),(57,'Godrej Properties',68),(58,'Adani Group',68),(59,'Applewoods',68),(60,'Bakeri',68),(61,'Ganesh Housing',68),(62,'Sheetal Infra',68),(63,'Shivalik Infra',68),(64,'Saanvi Nirman',68),(65,'Adani Realty',68),(66,'Goyal & Co',68),(67,'Rajhans Group',69),(68,'Happy Home Group',69),(69,'Sangini Group',69),(70,'Raghuvir Corporation',69),(71,'Avadh Group',69),(72,'Western Group',69),(73,'Vaishnodevi Group',69),(74,'Akash Group',69),(75,'Green Group',69),(76,'Pramukh Group',69),(77,'Prestige Group',101),(78,'Sobha Ltd',101),(79,'Brigade Group',101),(80,'godrej Properties',101),(81,'purvankara Group',101),(82,'mahindra lifespace',101),(83,'Mana Projects',101),(84,'Century Real Estate',101),(85,'Assetz Group',101),(86,'Sattva Group',101),(87,'Lodha Group',131),(88,'Oberoi Realty',131),(89,'K Raheja Group',131),(90,'godrej Properties',131),(91,'L&T Realty',131),(92,'Runwal Realty',131),(93,'Rustomjee Group',131),(94,'Hiranandani Group',131),(95,'Prestige Group',131),(96,'Piramal Group',131),(97,'Mani Group',233),(98,'Merlin Group',233),(99,'PS Group',233),(100,'Siddha Group',233),(101,'Ambuja Neotia',233),(102,'Mayfair Group',233),(103,'Sugam Group',233),(104,'Bhawani Group',233),(105,'Srijan Realty',233),(106,'Eden Group',233),(107,'DLF Ltd',248),(108,'Raheja Group',248),(109,'Adarsh Homes',248),(110,'DGR Homes',248),(111,'EMAAR India',248),(112,'Supertech Limited',248),(113,'parsvnath Group',248),(114,'Ashiana Group',248),(115,'Veera Group',248),(116,'Godrej Properties',248),(117,'Casagrand Group',188),(118,'Appaswamy Group',188),(119,'VGN Group',188),(120,'Jain Housing',188),(121,'Lancor Holdings',188),(122,'Pacifica Group',188),(123,'urbantree Infra',188),(124,'Radiance Realty',188),(125,'DRA Homes',188),(126,'DAC Developers',188);
/*!40000 ALTER TABLE `st_builder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_city`
--

DROP TABLE IF EXISTS `st_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `state_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_state_id_1` (`state_id`),
  CONSTRAINT `fk_state_id_1` FOREIGN KEY (`state_id`) REFERENCES `st_state` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table for City';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_city`
--

LOCK TABLES `st_city` WRITE;
/*!40000 ALTER TABLE `st_city` DISABLE KEYS */;
INSERT INTO `st_city` VALUES (1,'amaravati',1),(2,'vijaywada',1),(3,'guntur',1),(4,'elluru',1),(5,'tadipallegudam',1),(6,'nellore',1),(7,'ongole',1),(8,'Tirupati',1),(9,'cuddapah',1),(10,'vijaynagaram',1),(11,'visakhapatnam',1),(12,'srikakulam',1),(13,'narsapuram',1),(14,'narsaraopeta',1),(15,'bhivaram',1),(16,'tuni',1),(17,'anakapalli',1),(18,'rajahmundry',1),(19,'samalkota',1),(20,'kakinada',1),(21,'itanagar',2),(22,'eastsaing',2),(23,'tawang',2),(24,'seppo',2),(25,'aalo',2),(26,'daporijo',2),(27,'namsai',2),(28,'tezu',2),(29,'pasighat',2),(30,'naharlagun',2),(31,'dispur',3),(32,'tezpur',3),(33,'guwahati',3),(34,'dibrugarh',3),(35,'jorhat',3),(36,'silchar',3),(37,'karimganj',3),(38,'dhubri',3),(39,'nagaon',3),(40,'hojai',3),(41,'patna',4),(42,'gaya',4),(43,'vaishali',4),(44,'nalanda',4),(45,'madhubani',4),(46,'bhagalpur',4),(47,'rajgir',4),(48,'muzzafarpur',4),(49,'bodhgaya',4),(50,'chapra',4),(51,'raipur',5),(52,'bilaspur',5),(53,'bhilai',5),(54,'korba',5),(55,'rajnanndgaon',5),(56,'jagadalpur',5),(57,'ambikapur',5),(58,'dhamtari',5),(59,'mahasamund',5),(60,'champa',5),(61,'panaji',6),(62,'mapusa',6),(63,'madgoan',6),(64,'ponda',6),(65,'vascodagama',6),(66,'Vadodara',7),(67,'Rajkot',7),(68,'Ahmedabad',7),(69,'surat',7),(70,'jamnagar',7),(71,'bhavnagar',7),(72,'junagadh',7),(73,'porbandar',7),(74,'Gandhinagar',7),(75,'gurgoan',8),(76,'faridabad',8),(77,'karnal',8),(78,'panchkula',8),(79,'kaithal',8),(80,'bhiwani',8),(81,'rewari',8),(82,'sonipat',8),(83,'shimla',9),(84,'mandi',9),(85,'kullu',9),(86,'manali',9),(87,'bilaspur',9),(88,'chamba',9),(89,'dharamshala',9),(90,'solan',9),(91,'ranchi',10),(92,'dhanbad',10),(93,'bokaro city',10),(94,'deogarh',10),(95,'jamshedpur',10),(96,'giridh',10),(97,'hazaribagh',10),(98,'medininagar',10),(99,'ramgarhcantonment',10),(100,'chaibasa',10),(101,'Bengaluru',11),(102,'mangaluru',11),(103,'shivamoga',11),(104,'mysore',11),(105,'kalaburigi',11),(106,'udipi',11),(107,'ballari',11),(108,'davegere',11),(109,'tumakuru',11),(110,'raichur',11),(111,'kochi',12),(112,'thiruvananthpuram',12),(113,'khozikode',12),(114,'kollam',12),(115,'thrissur',12),(116,'kannur',12),(117,'mallapuram',12),(118,'allapuzha',12),(119,'palakkad',12),(120,'kottayam',12),(121,'Bhopal',13),(122,'Indore',13),(123,'Gwalior',13),(124,'ujjain',13),(125,'ratlam',13),(126,'rewa',13),(127,'jabalpur',13),(128,'sagar',13),(129,'satna',13),(130,'chindwara',13),(131,'Mumbai',14),(132,'pune',14),(133,'nagpur',14),(134,'aurangabad',14),(135,'nashik',14),(136,'kolhapur',14),(137,'amravati',14),(138,'solapur',14),(139,'thane',14),(140,'sangli',14),(141,'imphal',15),(142,'thoubal',15),(143,'shillong',16),(144,'tura',16),(145,'nongstoin',16),(146,'Aizawl',17),(147,'lunglei',17),(148,'serchipp',17),(149,'kohima',18),(150,'dimapur',18),(151,'tuensang',18),(152,'bhubaneswar',19),(153,'cuttack',19),(154,'brahmapur',19),(155,'puri',19),(156,'rourkela',19),(157,'barripada',19),(158,'balasore',19),(159,'bhadrak',19),(160,'sambalpur',19),(161,'jharsguda',19),(162,'koraput',19),(163,'amritsar',20),(164,'patiala',20),(165,'ludhaina',20),(166,'bhatinda',20),(167,'jalandhar',20),(168,'moga',20),(169,'kapurthala',20),(170,'hoshiarpur',20),(171,'sahibzada Ajit Singh Nagar',20),(172,'gurdaspur',20),(173,'barnala',20),(174,'jodhpur',21),(175,'udaipur',21),(176,'pali',21),(177,'bikaner',21),(178,'jaipur',21),(179,'ajmer',21),(180,'kota',21),(181,'sikar',21),(182,'alwar',21),(183,'bhilwara',21),(184,'sawaimadhopur',21),(185,'gangtok',22),(186,'namchi',22),(187,'rangpo',22),(188,'chennai',23),(189,'salem',23),(190,'madurai',23),(191,'coimbatore',23),(192,'thiruchapalli',23),(193,'kancheepuram',23),(194,'vellore',23),(195,'tiruppur',23),(196,'Thoothukudi',23),(197,'Secunderabad',24),(198,'Hyderabad',24),(199,'warangal',24),(200,'khammam',24),(201,'nizamabad',24),(202,'karimnagar',24),(203,'sirpurkagaznagar',24),(204,'siddipet',24),(205,'mahbubnagar',24),(206,'nalgonda',24),(207,'adilabad',24),(208,'suryapet',24),(209,'agartala',25),(210,'dharmanagar',25),(211,'Kailashahar',25),(212,'dehradun',26),(213,'rishikesh',26),(214,'nainital',26),(215,'mussorie',26),(216,'haridwar',26),(217,'almora',26),(218,'haldwani',26),(219,'roorkee',26),(220,'kashipur',26),(221,'lucknow',27),(222,'noida',27),(223,'agra',27),(224,'prayagraj',27),(225,'varnasi',27),(226,'kanpur',27),(227,'jhansi',27),(228,'ghaziabad',27),(229,'mathura',27),(230,'gorakhpur',27),(231,'meerut',27),(232,'philibit',27),(233,'kolkata',28),(234,'howrah',28),(235,'siliguri',28),(236,'asansol',28),(237,'malda',28),(238,'darjeeling',28),(239,'berhampur',28),(240,'kharagpur',28),(241,'eastmedinipur',28),(242,'westmedinipur',28),(243,'purabbardhaman',28),(244,'south24parganas',28),(245,'north24parganas',28),(246,'durgapur',28),(247,'haldia',28),(248,'NewDelhi',37);
/*!40000 ALTER TABLE `st_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_community`
--

DROP TABLE IF EXISTS `st_community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_community` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `map_url` varchar(250) DEFAULT NULL,
  `total_area` double DEFAULT NULL,
  `open_area` double DEFAULT NULL,
  `nblocks` int DEFAULT NULL,
  `nfloors_per_block` int DEFAULT NULL,
  `nhouses_per_floor` int DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `builder_id` int DEFAULT NULL,
  `totflats` int DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_builder_id_idx` (`builder_id`),
  CONSTRAINT `fk_builder_id` FOREIGN KEY (`builder_id`) REFERENCES `st_builder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table for Community';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_community`
--

LOCK TABLES `st_community` WRITE;
/*!40000 ALTER TABLE `st_community` DISABLE KEYS */;
INSERT INTO `st_community` VALUES (1,'Avatar','https://maps.app.goo.gl/GcBS9FEeCnCe2pqCA',22.75,83.5,10,31,9,'Sy. Nos. 217 to 225, Narsingi Village, Rajendranagar, Revenue Mandal, Puppalguda, Hyderabad, Telangana 500089',1,2800,'completed'),(2,'Krishe','https://maps.app.goo.gl/oz5QfXprYdkUzETz6',6.75,80,4,26,9,'Cluster_serilingampally 13, Block 1, MY HOME KRISHE, SY.NO. 38 to 41 Gopannapally Village, Mandal, Gachibowli, Serilingampalle (M), Hyderabad, Telangana 500046',1,650,'completed'),(3,'Vihanga','https://maps.app.goo.gl/eyf5A4b2bwcoLPnj9https://maps.app.goo.gl/eyf5A4b2bwcoLPnj9',21,80,20,18,6,'C8JJ+XCG, Gachibowli, Hyderabad, Telangana 500032',1,1996,'completed'),(4,'Jewel','https://maps.app.goo.gl/zDsC2ZC7YpszPUgq8',22.5,68,14,15,12,'My Home Jewels Apartments, Manjeera Pipeline Rd, Hafeezpet, Madeenaguda, Hyderabad, Telangana 500133',1,2016,'completed'),(5,'Abhra','https://maps.app.goo.gl/a1hZmzNUpjp55m6s6',5,73,5,17,5,'Inorbit Mall, Road, Mindspace Madhapur Rd, Silpa Gram Craft Village, HITEC City, Hyderabad, Telangana 500081',1,387,'completed'),(6,'Bhooja','https://maps.app.goo.gl/idBVxo8h6epFFTGw8',18,80,11,36,4,'Plot No 22 to 24, and 31 to 33, Sy.No.83/1 Raidurgam Panmakta, Serilingampally, Hyderabad, Telangana 500032',1,1560,'completed'),(7,'Tarkshya','https://maps.app.goo.gl/EmWQcRk3fEbouNcf9',5.82,78,4,32,5,'Golden Mile Rd, Kokapet, Hyderabad, Telangana 500075',1,660,'completed'),(8,'Ankura','https://maps.app.goo.gl/kmRBmfJhBd5EGQk37',75.46,80,603,3,1,'My Home Ankura Main St, Tellapur, Hyderabad, Telangana 502300',1,603,'completed'),(9,'Navadweepa','https://maps.app.goo.gl/zUwnz6wVv8fMPcDj7',9.5,80,4,9,16,'Vayu Block, Patrika Nagar, Madhapur, 79, Hitech City Rd, HITEC City, Hyderabad, Telangana 500081',1,556,'completed'),(10,'Mangala','https://maps.app.goo.gl/DkB7koJaJYyKsqGt5',20,77,11,15,12,'Sy.No.98 Kondapur Village, Serilingampally Mandal, Hyderabad, Telangana 500084',1,1879,'completed'),(11,'Akrida','https://maps.app.goo.gl/yHYJSQnLV3SbJnwN6',24.99,81,12,39,8,'Tellapur Village Ramachandrapuram, Nallagandla, Hyderabad, Telangana 500019',1,3780,'ongoing'),(12,'Sayuk','https://maps.app.goo.gl/HsgY8jVYRoyvtMzZ7',25.37,81,12,39,8,'Sy.No. 366/P, 368/P,369/P Tellapur Village Ramachandrapuram, Mandal Sangareddy, District, Hyderabad, Telangana 502032',1,3780,'ongoing'),(13,'Tridasa','https://maps.app.goo.gl/Y9jNiDzDnihp17Ts7',22.56,84,9,29,10,'Radial Rd 7, Tellapur, Ramachandrapuram, Hyderabad, Telangana 502032',1,2682,'ongoing'),(14,'Vipina','https://maps.app.goo.gl/1Fi6ah3ELAkCgLQt5',20.61,81,8,46,10,'Radial Rd 7, Tellapur, Ramachandrapuram, Hyderabad, Telangana 502032',1,3720,'ongoing'),(15,'Grava','https://maps.app.goo.gl/B1hwUprtF7WmUEJD8',17.52,80,7,54,4,'C829+GW, Kokapet, Hyderabad, Telangana 500075',1,1289,'ongoing'),(16,'Apas','https://maps.app.goo.gl/kbQkz4v1Wrcsf4uQ6',13.52,81.6,6,44,4,'C83H+7FG, Kokapet, Hyderabad, Telangana 500075',1,1338,'ongoing'),(17,'99','https://maps.app.goo.gl/ejqsyTsCXhnQuzXa9',1.74,0,1,53,2,'Khanapur Survey No : 240/P Gandipet, Hyderabad, Telangana 500075',1,99,'ongoing'),(18,'Avali','https://maps.app.goo.gl/8EqGkh82dttEY6FM7',8.37,81,4,46,3,'F76V+P6, Tellapur, Hyderabad, Telangana 500019',1,744,'ongoing'),(19,'Nishada','https://maps.app.goo.gl/stXWE1BG3o2vzayJ6',16.68,80,8,44,4,'Mandal, Survey No. 239/240 plot no 3&4, Neopolis, Kokapet, Gandipet, Telangana 500075',1,744,'ongoing'),(20,'Raka','https://maps.app.goo.gl/WhmYgUrhqXN5K3qFA',2.4,81.6,9,34,1,'Sy. No.97(P), 98, Madeenaguda, Serilingampally Mandal, Telangana 500049',1,300,'ongoing'),(21,'Silver Oaks','https://maps.app.goo.gl/MkKMzcQPXuq18BFe8',7,80,6,14,1,'APARNA HILL PARK SILVER OAKS, Gangaram Cheruvu, Bandam Kommu, Chanda Nagar, Hyderabad, Ramachandrapuram, Telangana 500050',2,606,'completed'),(22,'Lake Breeze','https://maps.app.goo.gl/kzUQc55DM5cSEEeE9',12,80,11,14,6,'Aparna Hillpark Rd, Bandam Kommu, Chanda Nagar, Hyderabad, Telangana 500050',2,943,'completed'),(23,'Boulevard','https://maps.app.goo.gl/bAznEiDmnzqTyB5U9',12,80,95,3,1,'Bandam Kommu, Hyderabad, Ramachandrapuram, Telangana 500133',2,95,'completed'),(24,'Gardenia','https://maps.app.goo.gl/TopzmoJ6d7gEcrD69',16,80,116,3,1,'Bandam Kommu, Hyderabad, Ramachandrapuram, Telangana 500133',2,116,'completed'),(25,'Avenues','https://maps.app.goo.gl/HUAvaqcp39z86yWA7',9,80,6,12,12,'Beside road of Violet Purple Showroom Chandanagar, Serilingapally Mandal, 275, Aparna Hillpark Rd, Bandam Kommu, Hyderabad, Telangana 500050',2,707,'completed'),(26,'WestSide','https://maps.app.goo.gl/ARfwJQFXK4px8WfR6',1.7,80,1,14,9,'500089, Sai Aishwarya Layout, Chitrapuri Colony, Manikonda, Telangana 500089',2,128,'completed'),(27,'WestSide','https://maps.app.goo.gl/ARfwJQFXK4px8WfR6',1.7,80,1,14,9,'500089, Sai Aishwarya Layout, Chitrapuri Colony, Manikonda, Telangana 500089',2,128,'completed');
/*!40000 ALTER TABLE `st_community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_conv_mode`
--

DROP TABLE IF EXISTS `st_conv_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_conv_mode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `conv_mode` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table for Conversation Mode';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_conv_mode`
--

LOCK TABLES `st_conv_mode` WRITE;
/*!40000 ALTER TABLE `st_conv_mode` DISABLE KEYS */;
INSERT INTO `st_conv_mode` VALUES (1,'All'),(2,'Chat'),(3,'Email'),(4,'Mobile');
/*!40000 ALTER TABLE `st_conv_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_current_status`
--

DROP TABLE IF EXISTS `st_current_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_current_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status_code` varchar(25) DEFAULT NULL,
  `status_Desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table for Status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_current_status`
--

LOCK TABLES `st_current_status` WRITE;
/*!40000 ALTER TABLE `st_current_status` DISABLE KEYS */;
INSERT INTO `st_current_status` VALUES (1,'PPO','Property Posted SuccessFully'),(2,'PAR','Property In Admin Review'),(3,'PAA','Property Approved By Admin'),(4,'PAM','Admin Suggested Few Changes'),(5,'PLS','Congrats!!! Property is Listed'),(6,'PRE','Property Rented'),(7,'PIA','Property Inactive'),(8,'LOP','List All Open Properties'),(9,'LFL','List All Filtered Properties'),(10,'LVU','List All User Viewed Properties'),(11,'LFV','List All User Favoured Properties'),(12,'LUR','List All User Rejected Properties'),(13,'CRM','User Requested for RM Info'),(14,'NRM','Notify User Info to RM'),(15,'URM','User Called RM'),(16,'RMU','RM Called User'),(17,'ORM','Owner Called RM'),(18,'RMO','RM Called Owner'),(19,'VSU','RM Provided Slots to User'),(20,'VSO','RM Provided Slots to Owner'),(21,'SUS','User Agreed On a Slot'),(22,'SOS','Owner Agreed On a Slot'),(23,'RMV','RM Finalized Schedule'),(24,'RCU','RM Forwarded Schedule to User'),(25,'RCO','RM Forwarded Schedule to Owner'),(26,'RCF','RM Forwarded Schedule to FM'),(27,'RUF','RM Shared User Info with FM'),(28,'ROF','RM Shared Owner Info with FM'),(29,'FAS','FM Arrived at Site'),(30,'FMB','FM Met Both Renter & Owner'),(31,'VCS','Visit Completed SuccessFully'),(32,'VRS','Visit Rescheduled'),(33,'RAL','Renter Accepted Lease'),(34,'OAL','Owner Accepted Lease'),(35,'RRL','Renter Rejected Lease'),(36,'ORL','Owner Rejected Lease'),(37,'LFD','Lease Finalized'),(38,'LPD','Lease Pending'),(39,'RUR','Rental Agreement In Renter Review'),(40,'RAR','Rental Agreement Signed By Renter'),(41,'RAO','Rental Agreement Signed By Owner'),(42,'PSR','Photo Shoot Requested By Renter'),(43,'PSO','Photo Shoot Requested By Owner'),(44,'RPF','RM Schedules Photo Shoot'),(45,'FPC','Photo Shoot Completed'),(46,'LPC','Photo Shoot Completed'),(47,'BIG','Brokerage Invoice Generated'),(48,'BSR','Brokerage Invoice Sent To Renter'),(49,'BPP','Brokerage Payment Pending'),(50,'BPC','Brokerage Payment Completed'),(51,'MRO','Monthly Reminder Opted by Owner'),(52,'MRR','Monthly Reminder Opted by Renter'),(53,'MRA','Monthly Reminder Activated'),(54,'OPF','Owner is in Free Plan'),(55,'OPB','Owner is in Standard Plan'),(56,'OPS','Owner is in Premium Plan');
/*!40000 ALTER TABLE `st_current_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_deposit_range`
--

DROP TABLE IF EXISTS `st_deposit_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_deposit_range` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nmonths` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table for Deposit Range';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_deposit_range`
--

LOCK TABLES `st_deposit_range` WRITE;
/*!40000 ALTER TABLE `st_deposit_range` DISABLE KEYS */;
INSERT INTO `st_deposit_range` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12);
/*!40000 ALTER TABLE `st_deposit_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_floor_range`
--

DROP TABLE IF EXISTS `st_floor_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_floor_range` (
  `id` int NOT NULL AUTO_INCREMENT,
  `floor_lower_limit` int DEFAULT NULL,
  `floor_upper_limit` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table for Floor Range';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_floor_range`
--

LOCK TABLES `st_floor_range` WRITE;
/*!40000 ALTER TABLE `st_floor_range` DISABLE KEYS */;
INSERT INTO `st_floor_range` VALUES (1,1,5),(2,6,10),(3,11,15),(4,16,20),(5,21,25),(6,26,30),(7,31,35),(8,36,40),(9,41,45),(10,46,50),(11,51,55),(12,56,60),(13,61,65),(14,66,70),(15,71,75),(16,76,80),(17,81,85),(18,86,90),(19,91,95),(20,96,100),(21,101,105),(22,106,110),(23,111,115),(24,116,120),(25,121,125),(26,126,130),(27,131,135),(28,136,140),(29,141,145),(30,146,150);
/*!40000 ALTER TABLE `st_floor_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_gender`
--

DROP TABLE IF EXISTS `st_gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_gender` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gender_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table for Gender';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_gender`
--

LOCK TABLES `st_gender` WRITE;
/*!40000 ALTER TABLE `st_gender` DISABLE KEYS */;
INSERT INTO `st_gender` VALUES (1,'Male'),(2,'Female'),(3,'Not Wish to Disclose');
/*!40000 ALTER TABLE `st_gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_home_type`
--

DROP TABLE IF EXISTS `st_home_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_home_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `home_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table for Home Type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_home_type`
--

LOCK TABLES `st_home_type` WRITE;
/*!40000 ALTER TABLE `st_home_type` DISABLE KEYS */;
INSERT INTO `st_home_type` VALUES (1,'1 Bhk'),(2,'2 Bhk'),(3,'3 Bhk'),(4,'4 Bhk'),(5,'5 Bhk'),(6,'6 Bhk'),(7,'7 Bhk'),(8,'8 Bhk'),(9,'9 Bhk'),(10,'10 Bhk'),(11,'11 Bhk'),(12,'12 Bhk'),(13,'13 Bhk'),(14,'14 Bhk'),(15,'15 Bhk');
/*!40000 ALTER TABLE `st_home_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_landmarks_category`
--

DROP TABLE IF EXISTS `st_landmarks_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_landmarks_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `landmark_category` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table For Landmarks Category';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_landmarks_category`
--

LOCK TABLES `st_landmarks_category` WRITE;
/*!40000 ALTER TABLE `st_landmarks_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_landmarks_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_maintenance`
--

DROP TABLE IF EXISTS `st_maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_maintenance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maintenance_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table for Maintenance';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_maintenance`
--

LOCK TABLES `st_maintenance` WRITE;
/*!40000 ALTER TABLE `st_maintenance` DISABLE KEYS */;
INSERT INTO `st_maintenance` VALUES (1,'Included'),(2,'Not Included');
/*!40000 ALTER TABLE `st_maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_parking_count`
--

DROP TABLE IF EXISTS `st_parking_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_parking_count` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parking_count` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_parking_count`
--

LOCK TABLES `st_parking_count` WRITE;
/*!40000 ALTER TABLE `st_parking_count` DISABLE KEYS */;
INSERT INTO `st_parking_count` VALUES (1,'1'),(2,'2'),(3,'3'),(4,'4'),(5,'5');
/*!40000 ALTER TABLE `st_parking_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_parking_type`
--

DROP TABLE IF EXISTS `st_parking_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_parking_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parking_type` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table for Parking Type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_parking_type`
--

LOCK TABLES `st_parking_type` WRITE;
/*!40000 ALTER TABLE `st_parking_type` DISABLE KEYS */;
INSERT INTO `st_parking_type` VALUES (1,'Car'),(2,'Bike'),(3,'Bicycle');
/*!40000 ALTER TABLE `st_parking_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_permissions`
--

DROP TABLE IF EXISTS `st_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permission` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table for Permissions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_permissions`
--

LOCK TABLES `st_permissions` WRITE;
/*!40000 ALTER TABLE `st_permissions` DISABLE KEYS */;
INSERT INTO `st_permissions` VALUES (1,'Read'),(2,'Write'),(3,'Edit'),(4,'Delete');
/*!40000 ALTER TABLE `st_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_prop_desc`
--

DROP TABLE IF EXISTS `st_prop_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_prop_desc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prop_desc` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table For Property Description';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_prop_desc`
--

LOCK TABLES `st_prop_desc` WRITE;
/*!40000 ALTER TABLE `st_prop_desc` DISABLE KEYS */;
INSERT INTO `st_prop_desc` VALUES (1,'UnFurnished'),(2,'SemiFurnished'),(3,'FullyFurnished'),(4,'OptimallyFurnished');
/*!40000 ALTER TABLE `st_prop_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_prop_facing`
--

DROP TABLE IF EXISTS `st_prop_facing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_prop_facing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prop_facing` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table for Property Facing';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_prop_facing`
--

LOCK TABLES `st_prop_facing` WRITE;
/*!40000 ALTER TABLE `st_prop_facing` DISABLE KEYS */;
INSERT INTO `st_prop_facing` VALUES (1,'North'),(2,'East'),(3,'South'),(4,'West'),(5,'NorthEast'),(6,'NorthWest'),(7,'SouthEast'),(8,'SouthWest'),(9,'Central');
/*!40000 ALTER TABLE `st_prop_facing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_prop_type`
--

DROP TABLE IF EXISTS `st_prop_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_prop_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prop_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table for Property Type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_prop_type`
--

LOCK TABLES `st_prop_type` WRITE;
/*!40000 ALTER TABLE `st_prop_type` DISABLE KEYS */;
INSERT INTO `st_prop_type` VALUES (1,'Apartment'),(2,'Independent House'),(3,'Villa'),(4,'RowHouse'),(5,'Commercial');
/*!40000 ALTER TABLE `st_prop_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_referral_details`
--

DROP TABLE IF EXISTS `st_referral_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_referral_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `referral_amt` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table for Referral Amount';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_referral_details`
--

LOCK TABLES `st_referral_details` WRITE;
/*!40000 ALTER TABLE `st_referral_details` DISABLE KEYS */;
INSERT INTO `st_referral_details` VALUES (1,1000);
/*!40000 ALTER TABLE `st_referral_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_rental_range`
--

DROP TABLE IF EXISTS `st_rental_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_rental_range` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lower_limit` varchar(45) DEFAULT NULL,
  `higher_limit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table For Rental Range';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_rental_range`
--

LOCK TABLES `st_rental_range` WRITE;
/*!40000 ALTER TABLE `st_rental_range` DISABLE KEYS */;
INSERT INTO `st_rental_range` VALUES (1,'0','999999');
/*!40000 ALTER TABLE `st_rental_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_role`
--

DROP TABLE IF EXISTS `st_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table for Roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_role`
--

LOCK TABLES `st_role` WRITE;
/*!40000 ALTER TABLE `st_role` DISABLE KEYS */;
INSERT INTO `st_role` VALUES (1,'Admin'),(2,'User'),(3,'RM'),(4,'FM');
/*!40000 ALTER TABLE `st_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_state`
--

DROP TABLE IF EXISTS `st_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_state` (
  `id` int NOT NULL AUTO_INCREMENT,
  `scode` varchar(5) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table for States';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_state`
--

LOCK TABLES `st_state` WRITE;
/*!40000 ALTER TABLE `st_state` DISABLE KEYS */;
INSERT INTO `st_state` VALUES (1,'AP','Andhra Pradesh'),(2,'AR','Arunachal Pradesh'),(3,'AS','Assam'),(4,'BR','Bihar'),(5,'CG','Chhattisgarh'),(6,'GA','Goa'),(7,'GJ','Gujarat'),(8,'HR','Haryana'),(9,'HP','Himachal Pradesh'),(10,'JH','Jharkhand'),(11,'KA','Karnataka'),(12,'KL','Kerala'),(13,'MP','Madhya Pradesh'),(14,'MH','Maharashtra'),(15,'MN','Manipur'),(16,'ML','Meghalaya'),(17,'MZ','Mizoram'),(18,'NL','Nagaland'),(19,'OR','Odisha'),(20,'PB','Punjab'),(21,'RJ','Rajasthan'),(22,'SK','Sikkim'),(23,'TN','Tamil Nadu'),(24,'TS','Telangana'),(25,'TR','Tripura'),(26,'UK','Uttarakhand'),(27,'UP','Uttar Pradesh'),(28,'WB','West Bengal'),(29,'AN','Andaman,Nicobar Islands'),(30,'CH','Chandigarh'),(31,'DD','Dadra,NagarHaveli,Daman,Diu'),(32,'DL','The Government of NCT of Delhi'),(33,'JK','Jammu & Kashmir'),(34,'LD','Ladakh'),(35,'LA','Lakshadweep'),(36,'PY','Puducherry'),(37,'DL','Delhi-NCR');
/*!40000 ALTER TABLE `st_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_tenant`
--

DROP TABLE IF EXISTS `st_tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_tenant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenant_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table For Tenant';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_tenant`
--

LOCK TABLES `st_tenant` WRITE;
/*!40000 ALTER TABLE `st_tenant` DISABLE KEYS */;
INSERT INTO `st_tenant` VALUES (1,'Family'),(2,'Bachelor'),(3,'Expats'),(4,'Spinster'),(5,'NA');
/*!40000 ALTER TABLE `st_tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_tenant_eat_pref`
--

DROP TABLE IF EXISTS `st_tenant_eat_pref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_tenant_eat_pref` (
  `id` int NOT NULL AUTO_INCREMENT,
  `eat_pref` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table For Eat Preference';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_tenant_eat_pref`
--

LOCK TABLES `st_tenant_eat_pref` WRITE;
/*!40000 ALTER TABLE `st_tenant_eat_pref` DISABLE KEYS */;
INSERT INTO `st_tenant_eat_pref` VALUES (1,'Veg-Ony'),(2,'Non-Veg');
/*!40000 ALTER TABLE `st_tenant_eat_pref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'propman'
--

--
-- Dumping routines for database 'propman'
--
/*!50003 DROP PROCEDURE IF EXISTS `CreateProperty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateProperty`(
    IN user_id INT,
    IN prop_type_id INT,
    IN home_type_id INT,
    IN prop_desc_id INT,
    IN community_id INT,
    IN no_beds INT,
    IN no_baths INT,
    IN no_balconies INT,
    IN tenant_type_id INT,
    IN tenant_eat_pref_id INT,
    IN rental_range_id INT,
    IN parking_type_id INT,
    IN parking_count_id INT,
    IN deposit_range_id INT,
    IN gender_pref TINYINT,
    IN availabl_date DATE,
    IN tower_no INT,
    IN floor_no INT,
    IN flat_no INT,
    IN images_location VARCHAR(255)
)
BEGIN
    INSERT INTO dy_property (
        user_id, prop_type_id, home_type_id, prop_desc_id, community_id,
        no_beds, no_baths, no_balconies, tenant_type_id, tenant_eat_pref_id,
        rental_range_id, parking_type_id, parking_count_id, deposit_range_id,
        gender_pref, availabl_date, tower_no, floor_no, flat_no, images_location
    )
    VALUES (
        user_id, prop_type_id, home_type_id, prop_desc_id, community_id,
        no_beds, no_baths, no_balconies, tenant_type_id, tenant_eat_pref_id,
        rental_range_id, parking_type_id, parking_count_id, deposit_range_id,
        gender_pref, availabl_date, tower_no, floor_no, flat_no, images_location
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getStaticTables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getStaticTables`()
BEGIN
    SELECT * FROM st_prop_type;
    SELECT * FROM st_home_type;
    SELECT * FROM st_prop_desc;
    SELECT * FROM st_beds;
    SELECT * FROM st_baths;
    SELECT * FROM st_balcony;
    SELECT * FROM st_tenant;
    SELECT * FROM st_tenant_eat_pref;
    SELECT * FROM st_rental_range;
    SELECT * FROM st_parking_type;
    SELECT * FROM st_parking_count;
    SELECT * FROM st_deposit_range;
    SELECT * FROM st_gender;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_properties` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_properties`()
BEGIN

SELECT 
            dy.id,
            spt.prop_type As prop_type,
            sht.home_type As home_type,
            spd.prop_desc As prop_desc,
            sc.name As community_name,
            snbe.nbeds As nbeds,
            snba.nbaths As nbaths,
            snbc.nbalcony As nbalcony,
            step.eat_pref As eat_pref,
            srrl.lower_limit As rent_lower,
            srrh.higher_limit As rent_higher,
            spat.parking_type As parking_type,
            spc.parking_count As parking_count,
            sdr.nmonths As deposit,
            dy.tower_no,
            dy.floor_no,
            dy.flat_no,
            dy.images_location
            
            
            FROM dy_property dy
                LEFT JOIN st_prop_type spt ON dy.prop_type_id = spt.id
                LEFT JOIN st_home_type sht ON dy.home_type_id=sht.id
                LEFT JOIN st_prop_desc spd ON dy.prop_desc_id = spd.id
                LEFT JOIN st_community sc ON dy.community_id = sc.id
                LEFT JOIN st_beds snbe ON dy.no_beds = snbe.id
                LEFT JOIN st_baths snba ON dy.no_baths = snba.id
                LEFT JOIN st_balcony snbc ON dy.no_balconies = snbc.id
                LEFT JOIN  st_tenant_eat_pref step ON dy.tenant_eat_pref_id = step.id
                LEFT JOIN st_rental_range srrl ON dy.rental_range_id = srrl.id
                LEFT JOIN st_rental_range srrh ON dy.rental_range_id = srrh.id
                LEFT JOIN  st_parking_type spat ON dy.parking_type_id = spat.id
                LEFT JOIN st_parking_count spc ON dy.parking_count_id = spc.id
                LEFT JOIN st_deposit_range sdr ON dy.deposit_range_id = sdr.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_bulders_list_based_on_cityId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_bulders_list_based_on_cityId`(in cityId int)
BEGIN
	select id, name as builder_name from st_builder where city_id=cityId;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_city_list_based_on_stateId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_city_list_based_on_stateId`(in stateid int)
BEGIN
		select id,name as city_name from st_city where state_id=stateid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_community_list_based_on_builderId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_community_list_based_on_builderId`(in builderId int)
BEGIN
	select id, name as community_name from st_community where builder_id=builderId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_properties` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_properties`(
IN input_property_id INT,   -- Input parameter for filtering by a specific property ID
    IN input_user_id INT,       -- Input parameter for filtering by a specific user ID
    IN input_offset INT,        -- Offset for pagination
    IN input_limit INT          -- Limit for pagination

)
BEGIN
-- Check if a specific property ID is provided
     IF input_property_id IS NOT NULL THEN
        -- Fetch property details for a specific property ID
        
SELECT 
            dy.id,
            spt.prop_type As prop_type,
            sht.home_type As home_type,
            spd.prop_desc As prop_desc,
            sc.name As community_name,
            snbe.nbeds As nbeds,
            snba.nbaths As nbaths,
            snbc.nbalcony As nbalcony,
            step.eat_pref As eat_pref,
            srrl.lower_limit As rent_lower,
            srrh.higher_limit As rent_higher,
            spat.parking_type As parking_type,
            spc.parking_count As parking_count,
            sdr.nmonths As deposit,
            dy.tower_no,
            dy.floor_no,
            dy.flat_no,
            dy.images_location
            
            
            FROM dy_property dy
                LEFT JOIN st_prop_type spt ON dy.prop_type_id = spt.id
                LEFT JOIN st_home_type sht ON dy.home_type_id=sht.id
                LEFT JOIN st_prop_desc spd ON dy.prop_desc_id = spd.id
                LEFT JOIN st_community sc ON dy.community_id = sc.id
                LEFT JOIN st_beds snbe ON dy.no_beds = snbe.id
                LEFT JOIN st_baths snba ON dy.no_baths = snba.id
                LEFT JOIN st_balcony snbc ON dy.no_balconies = snbc.id
                LEFT JOIN  st_tenant_eat_pref step ON dy.tenant_eat_pref_id = step.id
                LEFT JOIN st_rental_range srrl ON dy.rental_range_id = srrl.id
                LEFT JOIN st_rental_range srrh ON dy.rental_range_id = srrh.id
                LEFT JOIN  st_parking_type spat ON dy.parking_type_id = spat.id
                LEFT JOIN st_parking_count spc ON dy.parking_count_id = spc.id
                LEFT JOIN st_deposit_range sdr ON dy.deposit_range_id = sdr.id
				WHERE dy.id = input_property_id
				LIMIT input_limit OFFSET input_offset;  -- Pagination applied here
	ELSE
        -- Return an empty result set if no property_id is provided
        SELECT NULL AS id, NULL AS prop_type, NULL AS home_type;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_state_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_state_list`()
BEGIN
	select id,name as state_name from st_state;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-09  9:20:13
