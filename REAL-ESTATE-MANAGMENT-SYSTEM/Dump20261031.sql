CREATE DATABASE  IF NOT EXISTS `real_estate_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `real_estate_db`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: real_estate_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `agents`
--

DROP TABLE IF EXISTS `agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agents` (
  `agent_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `experience_years` int NOT NULL DEFAULT '0',
  `commission_rate` decimal(5,2) NOT NULL DEFAULT '3.00',
  `hired_at` date NOT NULL,
  PRIMARY KEY (`agent_id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents`
--

LOCK TABLES `agents` WRITE;
/*!40000 ALTER TABLE `agents` DISABLE KEYS */;
INSERT INTO `agents` VALUES (1,'Aziz','Karimov','+998901234567','aziz@realestate.uz',5,3.50,'2021-03-15'),(2,'Madina','Rasulova','+998902345678','madina@realestate.uz',3,3.00,'2023-06-20'),(3,'Bekzod','Ismailov','+998903456789','bekzod@realestate.uz',8,4.00,'2018-09-10'),(4,'Dilnoza','Tursunova','+998904567890','dilnoza@realestate.uz',2,2.75,'2024-01-05'),(5,'Sherzod','Nazarov','+998905678901','sherzod@realestate.uz',6,3.75,'2020-11-18');
/*!40000 ALTER TABLE `agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenities` (
  `amenity_id` int NOT NULL AUTO_INCREMENT,
  `amenity_name` varchar(100) NOT NULL,
  PRIMARY KEY (`amenity_id`),
  UNIQUE KEY `amenity_name` (`amenity_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
INSERT INTO `amenities` VALUES (7,'Air conditioning'),(6,'Balcony'),(3,'Elevetor'),(4,'Garden'),(5,'Gym'),(1,'Parking'),(8,'Security'),(2,'Swimming Pool');
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `appointment_id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `property_id` int NOT NULL,
  `agent_id` int NOT NULL,
  `appointment_date` datetime NOT NULL,
  `status` enum('Scheduled','Completed','Cancelled') DEFAULT 'Scheduled',
  PRIMARY KEY (`appointment_id`),
  KEY `client_id` (`client_id`),
  KEY `property_id` (`property_id`),
  KEY `agent_id` (`agent_id`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`),
  CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `budget` decimal(12,2) NOT NULL,
  `purpose` enum('Buy','Rent') NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Jasmina','Karimova','+998901234001','jasmina@email.com',650.00,'Rent','2026-07-30 12:51:45'),(2,'Ali','Usmanov','+998901234002','ali@email.com',150000.00,'Buy','2026-07-30 12:51:45'),(3,'Malika','Rasulova','+998901234003','malika@email.com',800.00,'Rent','2026-07-30 12:51:45'),(4,'Bekzod','Nazarov','+998901234004','bekzod@email.com',250000.00,'Buy','2026-07-30 12:51:45'),(5,'Dilnoza','Tursunova','+998901234005','dilnoza@email.com',900.00,'Rent','2026-07-30 12:51:45');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `COMPANYID` smallint NOT NULL,
  `DELIVERERID` smallint NOT NULL,
  `MANDATE` char(6) NOT NULL,
  PRIMARY KEY (`COMPANYID`),
  KEY `DELIVERERID` (`DELIVERERID`),
  CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`DELIVERERID`) REFERENCES `deliverers` (`DELIVERERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,6,'first'),(2,27,'second');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companydel`
--

DROP TABLE IF EXISTS `companydel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companydel` (
  `COMPANYID` smallint NOT NULL,
  `DELIVERERID` smallint NOT NULL,
  `NUMDELIVERIES` smallint NOT NULL,
  `NUMCOLLECTIONS` smallint NOT NULL,
  PRIMARY KEY (`COMPANYID`,`DELIVERERID`),
  KEY `DELIVERERID` (`DELIVERERID`),
  CONSTRAINT `companydel_ibfk_1` FOREIGN KEY (`DELIVERERID`) REFERENCES `deliverers` (`DELIVERERID`),
  CONSTRAINT `companydel_ibfk_2` FOREIGN KEY (`COMPANYID`) REFERENCES `companies` (`COMPANYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companydel`
--

LOCK TABLES `companydel` WRITE;
/*!40000 ALTER TABLE `companydel` DISABLE KEYS */;
INSERT INTO `companydel` VALUES (1,2,4,8),(1,6,9,1),(1,8,0,1),(1,44,7,5),(1,57,5,0),(1,83,3,3),(2,8,4,4),(2,27,11,2),(2,104,8,4),(2,112,4,8);
/*!40000 ALTER TABLE `companydel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliverers`
--

DROP TABLE IF EXISTS `deliverers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliverers` (
  `DELIVERERID` smallint NOT NULL,
  `NAME` char(15) NOT NULL,
  `INITIALS` char(3) DEFAULT NULL,
  `YEAR_OF_BIRTH` smallint DEFAULT NULL,
  `SEX` char(1) DEFAULT NULL,
  `YEAR_JOINED` smallint NOT NULL,
  `STREET` char(15) NOT NULL,
  `HOUSENO` char(4) DEFAULT NULL,
  `POSTCODE` char(6) DEFAULT NULL,
  `TOWN` char(10) NOT NULL,
  `CELLNO` char(10) DEFAULT NULL,
  `PHONENO` char(4) DEFAULT NULL,
  PRIMARY KEY (`DELIVERERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliverers`
--

LOCK TABLES `deliverers` WRITE;
/*!40000 ALTER TABLE `deliverers` DISABLE KEYS */;
INSERT INTO `deliverers` VALUES (2,'Everett','R',1988,'M',2005,'Stoney Road','43','3575NH','Stratford','070-237893','2411'),(6,'Parmenter','R',1994,'M',2007,'Haseltine Lane','80','1234KK','Stratford','070-476537','8467'),(7,'Wise','GWS',1983,'M',2011,'Edgecombe Way','39','9758VB','Stratford','070-347689',NULL),(8,'Newcastle','B',1982,'F',2010,'Station Road','4','6584WO','Inglewood','070-476573','2983'),(27,'Collins','DD',1984,'F',2013,'Long Drive','804','8457DK','Eltham','079-234857','2513'),(28,'Collins','C',1993,'F',2013,'Old Main Road','10','1294QK','Midhurst','010-659599',NULL),(39,'Bishop','D',1976,'M',2010,'Eaton Square','78','9629CD','Stratford','070-393435',NULL),(44,'Baker','E',1993,'M',2010,'Lewis Street','23','4444LJ','Inglewood','070-368753','1124'),(57,'Brown','M',1971,'M',2005,'Edgecombe Way','16','4377CB','Stratford','070-473458','6409'),(83,'Hope','PK',1986,'M',2012,'Magdalene Road','16a','1812UP','Stratford','070-353548','1608'),(95,'Miller','P',1974,'M',2002,'High Street','33a','5746OP','Douglas','070-867564',NULL),(100,'Parmenter','P',1993,'M',2019,'Haseltine Lane','80','1234KK','Stratford','070-476537','6524'),(104,'Moorman','D',1990,'F',2014,'Stout Street','65','9437AO','Eltham','079-987571','7060'),(112,'Bailey','IP',1993,'F',2014,'Vixen Road','8','6392LK','Plymouth','010-54874','1319');
/*!40000 ALTER TABLE `deliverers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `district_id` int NOT NULL AUTO_INCREMENT,
  `district_name` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL DEFAULT 'Tashkent',
  PRIMARY KEY (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'Yunusabad','Tashkent'),(2,'Chilanzar','Tashkent'),(3,'Mirzo Ulugbek','Tashkent'),(4,'Yakkasaray','Tashkent'),(5,'Shaykhantahur','Tashkent'),(6,'Olmazor','Tashkent'),(7,'Yashnabad','Tashkent'),(8,'Sergeli','Tashkent'),(9,'Uchtepa','Tashkent'),(10,'Bektemir','Tashkent');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `client_id` int NOT NULL,
  `property_id` int NOT NULL,
  `added_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`client_id`,`property_id`),
  KEY `property_id` (`property_id`),
  CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners`
--

DROP TABLE IF EXISTS `owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners` (
  `owner_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`owner_id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners`
--

LOCK TABLES `owners` WRITE;
/*!40000 ALTER TABLE `owners` DISABLE KEYS */;
INSERT INTO `owners` VALUES (1,'Ali','Karimov','+998901112233','2026-07-27 14:18:05','ali.karimov@email.com'),(2,'Dilshod','Rasulov','+998902223344','2026-07-27 14:18:05','dilshod.r@email.com'),(3,'Malika','Tursunova','+998903334455','2026-07-27 14:18:05','malika.t@email.com'),(4,'Aziza','Ismailova','+998904445566','2026-07-27 14:18:05','aziza.i@email.com'),(5,'Bekzod','Nazarov','+998905556677','2026-07-27 14:18:05','bekzod.n@email.com');
/*!40000 ALTER TABLE `owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `sale_id` int DEFAULT NULL,
  `rent_id` int DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL,
  `payment_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `payment_method` enum('Cash','Card','Bank Transfer') NOT NULL,
  `status` enum('Pending','Completed','Failed') DEFAULT 'Pending',
  PRIMARY KEY (`payment_id`),
  KEY `sale_id` (`sale_id`),
  KEY `rent_id` (`rent_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`sale_id`),
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`rent_id`) REFERENCES `rent_contracts` (`rent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,NULL,1,700.00,'2026-10-31 15:52:12','Card','Completed'),(2,NULL,2,1200.00,'2026-10-31 15:52:12','Bank Transfer','Completed');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penalties`
--

DROP TABLE IF EXISTS `penalties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penalties` (
  `PAYMENTID` int NOT NULL,
  `DELIVERERID` smallint NOT NULL,
  `DATA` date NOT NULL,
  `AMOUNT` decimal(7,2) NOT NULL,
  PRIMARY KEY (`PAYMENTID`),
  KEY `DELIVERERID` (`DELIVERERID`),
  CONSTRAINT `penalties_ibfk_1` FOREIGN KEY (`DELIVERERID`) REFERENCES `deliverers` (`DELIVERERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penalties`
--

LOCK TABLES `penalties` WRITE;
/*!40000 ALTER TABLE `penalties` DISABLE KEYS */;
INSERT INTO `penalties` VALUES (1,6,'2020-08-12',100.00),(2,44,'2021-05-05',75.00),(3,27,'2021-09-10',50.00),(4,104,'2019-12-08',50.00),(5,44,'2020-12-08',25.00),(6,8,'2020-12-08',25.00),(7,44,'2021-12-30',30.00),(8,27,'2021-11-12',75.00),(9,27,'2021-09-10',50.00);
/*!40000 ALTER TABLE `penalties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `properties` (
  `property_id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int NOT NULL,
  `district_id` int NOT NULL,
  `agent_id` int NOT NULL,
  `type_id` int NOT NULL,
  `address` varchar(255) NOT NULL,
  `rooms` int NOT NULL,
  `area` decimal(8,2) NOT NULL,
  `floor` int DEFAULT NULL,
  `total_floors` int DEFAULT NULL,
  `price` decimal(12,2) NOT NULL,
  `status` enum('Available','Sold','Rented') DEFAULT 'Available',
  `description` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`property_id`),
  KEY `owner_id` (`owner_id`),
  KEY `district_id` (`district_id`),
  KEY `agent_id` (`agent_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `properties_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`owner_id`),
  CONSTRAINT `properties_ibfk_2` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`),
  CONSTRAINT `properties_ibfk_3` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`agent_id`),
  CONSTRAINT `properties_ibfk_4` FOREIGN KEY (`type_id`) REFERENCES `property_types` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (1,1,1,1,1,'12 Amir Temur Avenue',3,85.50,5,9,125000.00,'Available','Bright apartment near the metro.','2026-07-30 14:34:14'),(2,2,2,2,1,'45 Chilanzar Street',2,64.00,3,5,85000.00,'Available','Cozy apartment with renovated kitchen.','2026-07-30 14:34:14'),(3,3,3,3,2,'18 Mirzo Ulugbek Street',5,240.00,NULL,2,320000.00,'Sold','Large family house with garden.','2026-07-30 14:34:14'),(4,4,4,4,3,'22 Business Center',8,180.00,7,10,450000.00,'Available','Modern office in business district.','2026-07-30 14:34:14'),(5,5,5,5,6,'7 Park Residence',6,310.00,9,12,780000.00,'Rented','Luxury penthouse with panoramic view.','2026-07-30 14:34:14');
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties_amenities`
--

DROP TABLE IF EXISTS `properties_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `properties_amenities` (
  `property_id` int NOT NULL,
  `amenity_id` int NOT NULL,
  PRIMARY KEY (`property_id`,`amenity_id`),
  KEY `amenity_id` (`amenity_id`),
  CONSTRAINT `properties_amenities_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`),
  CONSTRAINT `properties_amenities_ibfk_2` FOREIGN KEY (`amenity_id`) REFERENCES `amenities` (`amenity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties_amenities`
--

LOCK TABLES `properties_amenities` WRITE;
/*!40000 ALTER TABLE `properties_amenities` DISABLE KEYS */;
INSERT INTO `properties_amenities` VALUES (1,1),(2,1),(4,2),(1,3),(4,3),(5,3),(3,4),(4,5),(1,6),(2,6),(1,7),(5,7),(3,8);
/*!40000 ALTER TABLE `properties_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_image`
--

DROP TABLE IF EXISTS `property_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_image` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `property_id` int NOT NULL,
  `image_url` varchar(500) NOT NULL,
  `is_main` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`image_id`),
  KEY `property_id` (`property_id`),
  CONSTRAINT `property_image_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_image`
--

LOCK TABLES `property_image` WRITE;
/*!40000 ALTER TABLE `property_image` DISABLE KEYS */;
INSERT INTO `property_image` VALUES (1,1,'images/apartment1.jpg',1),(2,1,'images/apartment1_2.jpg',0),(3,2,'images/apartment2.jpg',1),(4,3,'images/house1.jpg',1),(5,4,'images/apartment4.jpg',1),(6,5,'images/office1.jpg',1);
/*!40000 ALTER TABLE `property_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_types`
--

DROP TABLE IF EXISTS `property_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_types` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_types`
--

LOCK TABLES `property_types` WRITE;
/*!40000 ALTER TABLE `property_types` DISABLE KEYS */;
INSERT INTO `property_types` VALUES (1,'Apartment'),(4,'Commercial'),(2,'House'),(5,'Land'),(3,'Office'),(7,'Penthouse'),(6,'Villa');
/*!40000 ALTER TABLE `property_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rent_contracts`
--

DROP TABLE IF EXISTS `rent_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rent_contracts` (
  `rent_id` int NOT NULL AUTO_INCREMENT,
  `property_id` int NOT NULL,
  `client_id` int NOT NULL,
  `agent_id` int NOT NULL,
  `monthly_price` decimal(12,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`rent_id`),
  KEY `property_id` (`property_id`),
  KEY `client_id` (`client_id`),
  KEY `agent_id` (`agent_id`),
  CONSTRAINT `rent_contracts_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`),
  CONSTRAINT `rent_contracts_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  CONSTRAINT `rent_contracts_ibfk_3` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`agent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rent_contracts`
--

LOCK TABLES `rent_contracts` WRITE;
/*!40000 ALTER TABLE `rent_contracts` DISABLE KEYS */;
INSERT INTO `rent_contracts` VALUES (1,2,2,2,700.00,'2026-11-01','2027-10-31'),(2,4,4,4,1200.00,'2026-11-01','2027-10-31');
/*!40000 ALTER TABLE `rent_contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `agent_id` int NOT NULL,
  `rating` int NOT NULL,
  `comment` text,
  `review_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  KEY `client_id` (`client_id`),
  KEY `agent_id` (`agent_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`agent_id`),
  CONSTRAINT `reviews_chk_1` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `sale_id` int NOT NULL AUTO_INCREMENT,
  `property_id` int NOT NULL,
  `client_id` int NOT NULL,
  `agent_id` int NOT NULL,
  `sale_price` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sale_id`),
  UNIQUE KEY `property_id` (`property_id`),
  KEY `client_id` (`client_id`),
  KEY `agent_id` (`agent_id`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`),
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`agent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,1,1,1,123000.00),(2,3,3,3,315000.00);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-31 16:01:39
