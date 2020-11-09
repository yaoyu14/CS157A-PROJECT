-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: Cocktails_Deliveries
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Admin` (
  `admin_id` mediumint NOT NULL,
  `user_id` mediumint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES (1,3),(2,7),(3,4),(4,5),(5,2),(6,1),(7,6),(8,12),(9,8),(10,11),(11,12),(12,13),(13,14),(14,15),(15,9);
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Buys`
--

DROP TABLE IF EXISTS `Buys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Buys` (
  `user_id` int NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Buys`
--

LOCK TABLES `Buys` WRITE;
/*!40000 ALTER TABLE `Buys` DISABLE KEYS */;
INSERT INTO `Buys` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,3),(2,4),(2,5),(3,1),(3,2),(3,3),(4,5),(4,6),(4,7);
/*!40000 ALTER TABLE `Buys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cocktails`
--

DROP TABLE IF EXISTS `Cocktails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cocktails` (
  `cocktail_id` int NOT NULL,
  `ctName` varchar(20) DEFAULT NULL,
  `AlcoholContent` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`cocktail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cocktails`
--

LOCK TABLES `Cocktails` WRITE;
/*!40000 ALTER TABLE `Cocktails` DISABLE KEYS */;
INSERT INTO `Cocktails` VALUES (1,'Bloody Mary',20,25),(2,'Cosmopolitan',15,30),(3,'Cube Libre',15,20),(4,'Gin Tonic',25,25),(5,'Long Island Iced Tea',20,30),(6,'Margarita',25,35),(7,'Mojito',10,15),(8,'Old Fashioned',35,40),(9,'Pink Lady',15,30),(10,'side-car',30,40),(11,'Singapore Sling',25,35),(12,'Tequila Sunrise',30,25),(13,'Tom Collins',35,25),(14,'Gibson',40,40),(15,'Martini',40,35);
/*!40000 ALTER TABLE `Cocktails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contains`
--

DROP TABLE IF EXISTS `Contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contains` (
  `order_id` int NOT NULL,
  `cocktail_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`order_id`,`cocktail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contains`
--

LOCK TABLES `Contains` WRITE;
/*!40000 ALTER TABLE `Contains` DISABLE KEYS */;
INSERT INTO `Contains` VALUES (1,1,1),(1,2,1),(2,2,1),(3,3,2),(4,4,1),(5,5,3),(6,6,2),(7,7,5),(8,8,1),(9,9,2),(10,10,1),(11,11,4),(12,12,2),(13,13,1),(14,14,1),(15,15,1);
/*!40000 ALTER TABLE `Contains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Favorite`
--

DROP TABLE IF EXISTS `Favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Favorite` (
  `user_id` int NOT NULL,
  `cocktails_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`cocktails_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Favorite`
--

LOCK TABLES `Favorite` WRITE;
/*!40000 ALTER TABLE `Favorite` DISABLE KEYS */;
INSERT INTO `Favorite` VALUES (4,1),(4,2),(4,3),(4,4),(5,1),(5,2),(5,3),(5,4),(5,5),(6,1),(6,2),(6,3),(6,4),(6,5),(6,6);
/*!40000 ALTER TABLE `Favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `order_id` int NOT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,'2020-10-31 03:47:36',55),(2,'2020-10-31 03:47:36',30),(3,'2020-10-31 03:47:36',40),(4,'2020-10-31 03:47:36',25),(5,'2020-10-31 03:47:36',90),(6,'2020-10-31 03:47:36',70),(7,'2020-10-31 03:47:36',75),(8,'2020-10-31 03:47:36',40),(9,'2020-10-31 03:47:36',60),(10,'2020-10-31 03:47:36',40),(11,'2020-10-31 03:47:36',140),(12,'2020-10-31 03:47:36',50),(13,'2020-10-31 03:47:36',25),(14,'2020-10-31 03:47:36',40),(15,'2020-10-31 03:47:36',35);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `seller_id` mediumint NOT NULL,
  `sellerName` char(30) NOT NULL,
  PRIMARY KEY (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'Bottles of Bliss'),(2,'Raise a Glass'),(3,'Cheers and Beers'),(4,'The Secret Saloon'),(5,'Languid Lounge'),(6,'A Place to Toast'),(7,'Neon Nights'),(8,'The  Meeting Place'),(9,'Drinks After Work'),(10,'Cocktail Country'),(11,'Bubbly Moments'),(12,'The Mixing House'),(13,'Enjoy the Evening'),(14,'The Merry Mixologists'),(15,'The First Bar');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SellerHas_ct`
--

DROP TABLE IF EXISTS `SellerHas_ct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SellerHas_ct` (
  `seller_id` mediumint NOT NULL,
  `cocktail_id` mediumint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SellerHas_ct`
--

LOCK TABLES `SellerHas_ct` WRITE;
/*!40000 ALTER TABLE `SellerHas_ct` DISABLE KEYS */;
INSERT INTO `SellerHas_ct` VALUES (1,2),(2,6),(3,9),(4,12),(5,15),(6,13),(7,1),(8,11),(9,10),(10,5),(11,14),(12,8),(13,4),(14,7),(15,3);
/*!40000 ALTER TABLE `SellerHas_ct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sells`
--

DROP TABLE IF EXISTS `sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sells` (
  `order_id` mediumint NOT NULL,
  `seller_id` mediumint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sells`
--

LOCK TABLES `sells` WRITE;
/*!40000 ALTER TABLE `sells` DISABLE KEYS */;
INSERT INTO `sells` VALUES (1,3),(2,7),(3,7),(4,12),(5,2),(6,15),(7,2),(8,12),(9,5),(10,6),(11,8),(12,15),(13,2),(14,9),(15,7);
/*!40000 ALTER TABLE `sells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `user_id` int NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'user1','user1','userAddress1'),(2,'user2','user2','userAddress2'),(3,'user3','user3','userAddress3'),(4,'user4','user4','userAddress4'),(5,'user5','user5','userAddress5'),(6,'user6','user6','userAddress6'),(7,'user7','user7','userAddress7'),(8,'user8','user8','userAddress8'),(9,'user9','user9','userAddress9'),(10,'user10','user10','userAddress10'),(11,'user11','user11','userAddress11'),(12,'user12','user12','userAddress12'),(13,'user13','user13','userAddress13'),(14,'user14','user14','userAddress14'),(15,'user15','user15','userAddress15');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-08 16:45:36
