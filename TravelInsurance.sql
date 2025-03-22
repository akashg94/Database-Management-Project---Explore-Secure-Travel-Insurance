-- MySQL dump 10.13  Distrib 9.2.0, for macos15.2 (arm64)
--
-- Host: localhost    Database: Explore_Secure_TravelInsurance
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `Agent`
--

DROP TABLE IF EXISTS `Agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Agent` (
  `agent_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact_info` varchar(255) NOT NULL,
  PRIMARY KEY (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Agent`
--

LOCK TABLES `Agent` WRITE;
/*!40000 ALTER TABLE `Agent` DISABLE KEYS */;
INSERT INTO `Agent` VALUES (1,'Michael Scott','michael@insurance.com'),(2,'Pam Beesly','pam@insurance.com'),(3,'Jim Halpert','jim@insurance.com'),(4,'Dwight Schrute','dwight@insurance.com'),(5,'Stanley Hudson','stanley@insurance.com');
/*!40000 ALTER TABLE `Agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AgentSales`
--

DROP TABLE IF EXISTS `AgentSales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AgentSales` (
  `agent_id` int NOT NULL,
  `policy_id` int NOT NULL,
  `sale_date` date NOT NULL,
  `commission` decimal(10,2) NOT NULL,
  PRIMARY KEY (`agent_id`,`policy_id`),
  KEY `policy_id` (`policy_id`),
  CONSTRAINT `agentsales_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `Agent` (`agent_id`),
  CONSTRAINT `agentsales_ibfk_2` FOREIGN KEY (`policy_id`) REFERENCES `InsurancePolicy` (`policy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AgentSales`
--

LOCK TABLES `AgentSales` WRITE;
/*!40000 ALTER TABLE `AgentSales` DISABLE KEYS */;
INSERT INTO `AgentSales` VALUES (1,101,'2025-01-05',50.00),(2,102,'2025-01-10',75.00),(3,103,'2025-02-01',30.00),(4,104,'2025-02-15',20.00),(5,105,'2025-03-01',90.00);
/*!40000 ALTER TABLE `AgentSales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Claim`
--

DROP TABLE IF EXISTS `Claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Claim` (
  `claim_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `policy_id` int NOT NULL,
  `claim_status` varchar(50) NOT NULL,
  `claim_amount` decimal(10,2) NOT NULL,
  `submission_date` date NOT NULL,
  PRIMARY KEY (`claim_id`),
  KEY `customer_id` (`customer_id`),
  KEY `policy_id` (`policy_id`),
  CONSTRAINT `claim_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`),
  CONSTRAINT `claim_ibfk_2` FOREIGN KEY (`policy_id`) REFERENCES `InsurancePolicy` (`policy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Claim`
--

LOCK TABLES `Claim` WRITE;
/*!40000 ALTER TABLE `Claim` DISABLE KEYS */;
INSERT INTO `Claim` VALUES (1,1,101,'Pending',5000.00,'2025-02-20'),(2,2,103,'Approved',1500.00,'2025-02-25'),(3,3,104,'Rejected',800.00,'2025-03-01'),(4,4,102,'Processing',12000.00,'2025-03-10'),(5,5,105,'Pending',4500.00,'2025-03-15'),(6,6,106,'Rejected',600.90,'2023-11-10'),(7,7,107,'Approved',900.25,'2024-05-12'),(8,8,108,'Pending',1100.75,'2023-07-30'),(9,9,109,'Rejected',950.40,'2024-08-05'),(10,10,101,'Approved',1300.80,'2023-09-22'),(11,11,102,'Pending',850.00,'2024-02-17'),(12,12,103,'Rejected',750.60,'2024-01-31'),(13,13,104,'Approved',980.45,'2023-10-27'),(14,14,105,'Pending',1205.99,'2024-03-08'),(15,15,106,'Rejected',660.10,'2023-12-19'),(16,16,107,'Approved',1150.75,'2024-06-22'),(17,17,108,'Pending',1320.30,'2024-07-29'),(18,18,109,'Rejected',700.20,'2023-11-18'),(19,19,101,'Approved',1075.50,'2024-08-11'),(20,20,102,'Pending',995.90,'2024-09-15'),(21,5,104,'Approved',1080.00,'2024-05-20'),(22,3,106,'Rejected',540.45,'2024-02-14'),(23,12,107,'Pending',1299.99,'2024-06-30'),(24,8,109,'Approved',1400.10,'2023-09-22'),(25,10,105,'Rejected',680.60,'2024-03-12'),(26,7,101,'Approved',950.75,'2024-07-05'),(27,2,103,'Pending',1200.20,'2023-12-08'),(28,11,109,'Rejected',805.45,'2024-01-10'),(29,15,108,'Approved',1125.30,'2024-04-28'),(30,6,102,'Pending',730.50,'2024-02-18');
/*!40000 ALTER TABLE `Claim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClaimProcessing`
--

DROP TABLE IF EXISTS `ClaimProcessing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ClaimProcessing` (
  `processing_id` int NOT NULL,
  `claim_id` int NOT NULL,
  `assigned_agent` int NOT NULL,
  `processing_status` varchar(50) NOT NULL,
  PRIMARY KEY (`processing_id`),
  KEY `claim_id` (`claim_id`),
  KEY `assigned_agent` (`assigned_agent`),
  CONSTRAINT `claimprocessing_ibfk_1` FOREIGN KEY (`claim_id`) REFERENCES `Claim` (`claim_id`),
  CONSTRAINT `claimprocessing_ibfk_2` FOREIGN KEY (`assigned_agent`) REFERENCES `Agent` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClaimProcessing`
--

LOCK TABLES `ClaimProcessing` WRITE;
/*!40000 ALTER TABLE `ClaimProcessing` DISABLE KEYS */;
INSERT INTO `ClaimProcessing` VALUES (1,1,2,'Under Review'),(2,2,3,'Completed'),(3,3,1,'Rejected'),(4,4,4,'In Progress'),(5,5,5,'Pending');
/*!40000 ALTER TABLE `ClaimProcessing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CountryOffers`
--

DROP TABLE IF EXISTS `CountryOffers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CountryOffers` (
  `offer_id` int NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `discount` decimal(5,2) DEFAULT NULL,
  `special_terms` text,
  PRIMARY KEY (`offer_id`),
  UNIQUE KEY `country_name` (`country_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CountryOffers`
--

LOCK TABLES `CountryOffers` WRITE;
/*!40000 ALTER TABLE `CountryOffers` DISABLE KEYS */;
INSERT INTO `CountryOffers` VALUES (1,'USA',10.00,'10% discount on all travel policies'),(2,'Canada',5.00,'Applicable only for first-time travelers'),(3,'Germany',7.50,'Limited to business travel policies'),(4,'Australia',12.00,'Special discount for students and seniors'),(5,'Japan',6.00,'Coverage includes natural disaster protection'),(6,'France',8.00,'Only valid for policies above $500'),(7,'India',15.00,'Special offer for frequent travelers'),(8,'Brazil',9.00,'Discount applies to family insurance plans'),(9,'UK',5.50,'Exclusive offers for medical travel policies'),(10,'Mexico',11.00,'Short-term travel coverage included');
/*!40000 ALTER TABLE `CountryOffers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `customer_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `travel_purpose` varchar(50) NOT NULL,
  `risk_level` varchar(20) NOT NULL,
  PRIMARY KEY (`customer_id`),
  CONSTRAINT `customer_chk_1` CHECK ((`risk_level` in (_utf8mb4'Low',_utf8mb4'Medium',_utf8mb4'High'))),
  CONSTRAINT `customer_chk_2` CHECK ((`travel_purpose` in (_utf8mb4'Business',_utf8mb4'Leisure',_utf8mb4'Medical',_utf8mb4'Education')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'Alice Johnson','Female','1985-06-15','Engineer','Business','Medium'),(2,'Bob Smith','Male','1990-09-23','Doctor','Medical','High'),(3,'Charlie Brown','Male','1987-03-10','Professor','Education','Low'),(4,'Diana Prince','Female','1995-12-05','Journalist','Business','Medium'),(5,'Evan Rogers','Male','1980-07-18','Athlete','Leisure','High'),(6,'Fiona Davis','Female','1992-11-30','Blogger','Leisure','Low'),(7,'George Miller','Male','1983-04-25','Lawyer','Business','Medium'),(8,'Helen Carter','Female','1975-05-22','Retired','Leisure','Low'),(9,'Ian Thompson','Male','1999-08-14','Student','Education','Medium'),(10,'Jessica Lee','Female','1988-02-17','Entrepreneur','Business','High'),(11,'Kevin Malone','Male','1982-11-02','Accountant','Business','Low'),(12,'Angela Martin','Female','1980-06-25','Financial Analyst','Business','Medium'),(13,'Ryan Howard','Male','1985-05-10','Marketing Executive','Business','High'),(14,'Kelly Kapoor','Female','1987-02-13','Social Media Manager','Leisure','Medium'),(15,'Toby Flenderson','Male','1975-08-11','HR Manager','Leisure','Low'),(16,'Creed Bratton','Male','1960-10-14','Retired','Leisure','Low'),(17,'Meredith Palmer','Female','1978-04-22','Sales Representative','Business','Medium'),(18,'Oscar Martinez','Male','1981-09-07','Tax Consultant','Business','Low'),(19,'Jan Levinson','Female','1973-12-30','Senior Manager','Business','High'),(20,'David Wallace','Male','1968-05-17','Executive','Business','High');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomerPolicy`
--

DROP TABLE IF EXISTS `CustomerPolicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CustomerPolicy` (
  `customer_id` int NOT NULL,
  `policy_id` int NOT NULL,
  `purchase_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  PRIMARY KEY (`customer_id`,`policy_id`),
  KEY `policy_id` (`policy_id`),
  CONSTRAINT `customerpolicy_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`),
  CONSTRAINT `customerpolicy_ibfk_2` FOREIGN KEY (`policy_id`) REFERENCES `InsurancePolicy` (`policy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerPolicy`
--

LOCK TABLES `CustomerPolicy` WRITE;
/*!40000 ALTER TABLE `CustomerPolicy` DISABLE KEYS */;
INSERT INTO `CustomerPolicy` VALUES (1,101,'2024-01-01','2025-01-01'),(2,102,'2024-02-10','2025-02-10'),(2,103,'2024-02-15','2025-02-15'),(3,103,'2023-12-05','2024-12-05'),(3,104,'2024-03-10','2025-03-10'),(4,102,'2024-04-05','2025-04-05'),(4,104,'2024-03-20','2025-03-20'),(5,105,'2024-05-20','2025-05-20'),(6,106,'2024-06-30','2025-06-30'),(7,107,'2024-05-15','2025-05-15'),(8,108,'2023-06-30','2024-06-30'),(9,109,'2024-07-10','2025-07-10'),(10,101,'2023-09-12','2024-09-12'),(11,103,'2024-02-14','2025-02-14'),(12,105,'2024-01-29','2025-01-29'),(13,107,'2023-10-21','2024-10-21'),(14,102,'2024-03-03','2025-03-03'),(15,104,'2023-12-15','2024-12-15'),(16,109,'2024-06-18','2025-06-18'),(17,101,'2024-07-25','2025-07-25'),(18,106,'2023-11-10','2024-11-10'),(19,108,'2024-08-05','2025-08-05'),(20,107,'2024-09-09','2025-09-09');
/*!40000 ALTER TABLE `CustomerPolicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HighRiskCoverage`
--

DROP TABLE IF EXISTS `HighRiskCoverage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HighRiskCoverage` (
  `coverage_id` int NOT NULL,
  `policy_id` int NOT NULL,
  `risk_type` varchar(255) NOT NULL,
  `coverage_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`coverage_id`),
  KEY `policy_id` (`policy_id`),
  CONSTRAINT `highriskcoverage_ibfk_1` FOREIGN KEY (`policy_id`) REFERENCES `InsurancePolicy` (`policy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HighRiskCoverage`
--

LOCK TABLES `HighRiskCoverage` WRITE;
/*!40000 ALTER TABLE `HighRiskCoverage` DISABLE KEYS */;
/*!40000 ALTER TABLE `HighRiskCoverage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InsurancePolicy`
--

DROP TABLE IF EXISTS `InsurancePolicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InsurancePolicy` (
  `policy_id` int NOT NULL,
  `policy_name` varchar(100) NOT NULL,
  `policy_type_id` int NOT NULL,
  `coverage_details` text NOT NULL,
  `premium` decimal(10,2) NOT NULL,
  PRIMARY KEY (`policy_id`),
  KEY `policy_type_id` (`policy_type_id`),
  CONSTRAINT `insurancepolicy_ibfk_1` FOREIGN KEY (`policy_type_id`) REFERENCES `PolicyType` (`policy_type_id`),
  CONSTRAINT `insurancepolicy_chk_1` CHECK ((`premium` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InsurancePolicy`
--

LOCK TABLES `InsurancePolicy` WRITE;
/*!40000 ALTER TABLE `InsurancePolicy` DISABLE KEYS */;
INSERT INTO `InsurancePolicy` VALUES (101,'Basic Health Plan',1,'Covers hospitalization and medical expenses',200.00),(102,'Comprehensive Travel Plan',1,'Includes health, baggage, and flight coverage',500.00),(103,'Flight Cancellation Protection',2,'Covers full refund on flight cancellation',150.00),(104,'Baggage Protection Plan',3,'Covers baggage loss and theft',100.00),(105,'Extreme Sports Insurance',4,'Covers injuries from sports activities',350.00),(106,'Senior Citizen Travel Policy',5,'Comprehensive coverage for seniors',400.00),(107,'Blogger Protection Plan',6,'Covers loss of photography equipment and trip cancellations',250.00),(108,'Infant Travel Care',7,'Covers emergency medical expenses for infants',300.00),(109,'Teen Travel Protection',8,'Covers trip interruptions and medical emergencies for teens',275.00);
/*!40000 ALTER TABLE `InsurancePolicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Partnership`
--

DROP TABLE IF EXISTS `Partnership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Partnership` (
  `platform_id` int NOT NULL,
  `policy_id` int NOT NULL,
  `commission` decimal(10,2) NOT NULL,
  `partnership_date` date NOT NULL,
  PRIMARY KEY (`platform_id`,`policy_id`),
  KEY `policy_id` (`policy_id`),
  CONSTRAINT `partnership_ibfk_1` FOREIGN KEY (`platform_id`) REFERENCES `TravelPlatform` (`platform_id`),
  CONSTRAINT `partnership_ibfk_2` FOREIGN KEY (`policy_id`) REFERENCES `InsurancePolicy` (`policy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Partnership`
--

LOCK TABLES `Partnership` WRITE;
/*!40000 ALTER TABLE `Partnership` DISABLE KEYS */;
INSERT INTO `Partnership` VALUES (1,101,20.00,'2025-01-01'),(2,102,25.00,'2025-01-05'),(3,103,15.00,'2025-02-01'),(4,104,10.00,'2025-02-15'),(5,105,30.00,'2025-03-01');
/*!40000 ALTER TABLE `Partnership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment` (
  `payment_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `policy_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `customer_id` (`customer_id`),
  KEY `policy_id` (`policy_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`policy_id`) REFERENCES `InsurancePolicy` (`policy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES (1,1,101,200.00,'2025-02-20'),(2,2,103,150.00,'2025-02-25'),(3,3,104,100.00,'2025-03-01'),(4,4,102,500.00,'2025-03-10'),(5,5,105,350.00,'2025-03-15');
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PersonalizedQuote`
--

DROP TABLE IF EXISTS `PersonalizedQuote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PersonalizedQuote` (
  `quote_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `policy_id` int NOT NULL,
  `custom_premium` decimal(10,2) NOT NULL,
  `coverage_adjustments` text,
  `quote_date` date NOT NULL,
  PRIMARY KEY (`quote_id`),
  KEY `customer_id` (`customer_id`),
  KEY `policy_id` (`policy_id`),
  CONSTRAINT `personalizedquote_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`),
  CONSTRAINT `personalizedquote_ibfk_2` FOREIGN KEY (`policy_id`) REFERENCES `InsurancePolicy` (`policy_id`),
  CONSTRAINT `personalizedquote_chk_1` CHECK ((`custom_premium` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PersonalizedQuote`
--

LOCK TABLES `PersonalizedQuote` WRITE;
/*!40000 ALTER TABLE `PersonalizedQuote` DISABLE KEYS */;
INSERT INTO `PersonalizedQuote` VALUES (1,1,101,180.00,'Extended hospitalization coverage','2025-03-01'),(2,2,103,140.00,'Added trip delay coverage','2025-03-02'),(3,3,104,90.00,NULL,'2025-03-03'),(4,4,102,480.00,'Added higher baggage protection','2025-03-04'),(5,5,105,330.00,'Extreme skiing coverage included','2025-03-05');
/*!40000 ALTER TABLE `PersonalizedQuote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PolicyType`
--

DROP TABLE IF EXISTS `PolicyType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PolicyType` (
  `policy_type_id` int NOT NULL,
  `type_name` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`policy_type_id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PolicyType`
--

LOCK TABLES `PolicyType` WRITE;
/*!40000 ALTER TABLE `PolicyType` DISABLE KEYS */;
INSERT INTO `PolicyType` VALUES (1,'Health Insurance','Covers medical expenses during travel'),(2,'Flight Cancellation','Covers cost of canceled flights due to emergencies'),(3,'Baggage Loss','Covers lost or stolen baggage'),(4,'Extreme Sports Coverage','Covers injuries from adventure sports'),(5,'Senior Citizen Coverage','Special policies for elderly travelers'),(6,'Travel Blogger Insurance','Covers travel-related risks for bloggers, including equipment loss and trip cancellations'),(7,'Infant Coverage','Specialized insurance covering medical emergencies for infants during travel'),(8,'Teen Coverage','Covers travel risks for teenagers, including medical expenses and trip delays');
/*!40000 ALTER TABLE `PolicyType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TravelPlatform`
--

DROP TABLE IF EXISTS `TravelPlatform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TravelPlatform` (
  `platform_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`platform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TravelPlatform`
--

LOCK TABLES `TravelPlatform` WRITE;
/*!40000 ALTER TABLE `TravelPlatform` DISABLE KEYS */;
INSERT INTO `TravelPlatform` VALUES (1,'Expedia'),(2,'Booking.com'),(3,'Airbnb'),(4,'Skyscanner'),(5,'Kayak');
/*!40000 ALTER TABLE `TravelPlatform` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-22 11:42:07
