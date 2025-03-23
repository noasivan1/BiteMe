-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bite_me
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'salad'),(2,'main course'),(3,'dessert'),(4,'drink');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_orders`
--

DROP TABLE IF EXISTS `customer_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_orders` (
  `OrderID` int DEFAULT NULL,
  `Status` varchar(45) DEFAULT 'pending',
  KEY `OrderID` (`OrderID`),
  CONSTRAINT `customer_orders_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_orders`
--

LOCK TABLES `customer_orders` WRITE;
/*!40000 ALTER TABLE `customer_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerNumber` int NOT NULL AUTO_INCREMENT,
  `ID` int DEFAULT NULL,
  `Credit` int DEFAULT '0',
  `IsBusiness` tinyint DEFAULT NULL,
  `PaymentCardNumber` int DEFAULT NULL,
  `PaymentCardDate` varchar(10) DEFAULT NULL,
  `Status` varchar(10) DEFAULT 'locked',
  PRIMARY KEY (`CustomerNumber`),
  KEY `ID` (`ID`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish_options`
--

DROP TABLE IF EXISTS `dish_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_options` (
  `DishID` int DEFAULT NULL,
  `OptionType` enum('ingredient','cooking_level') NOT NULL,
  `OptionValue` varchar(255) DEFAULT NULL,
  KEY `DishID` (`DishID`),
  CONSTRAINT `dish_options_ibfk_1` FOREIGN KEY (`DishID`) REFERENCES `dishes` (`DishID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_options`
--

LOCK TABLES `dish_options` WRITE;
/*!40000 ALTER TABLE `dish_options` DISABLE KEYS */;
INSERT INTO `dish_options` VALUES (1,'ingredient','no chickpeas'),(17,'ingredient','no chicken'),(35,'ingredient','no coriander'),(37,'cooking_level','M, MW, WD'),(40,'cooking_level','M, MW, WD'),(53,'cooking_level','M, MW, WD');
/*!40000 ALTER TABLE `dish_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dishes`
--

DROP TABLE IF EXISTS `dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dishes` (
  `DishID` int NOT NULL AUTO_INCREMENT,
  `RestaurantNumber` int DEFAULT NULL,
  `CategoryID` int DEFAULT NULL,
  `DishName` varchar(255) NOT NULL,
  PRIMARY KEY (`DishID`),
  KEY `RestaurantNumber` (`RestaurantNumber`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `dishes_ibfk_1` FOREIGN KEY (`RestaurantNumber`) REFERENCES `restaurants` (`RestaurantNumber`),
  CONSTRAINT `dishes_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dishes`
--

LOCK TABLES `dishes` WRITE;
/*!40000 ALTER TABLE `dishes` DISABLE KEYS */;
INSERT INTO `dishes` VALUES (1,1,1,'yerushalmi'),(2,1,1,'tuna'),(3,1,1,'chicken'),(4,1,1,'halomi'),(5,1,2,'mac and cheese'),(6,1,2,'Salmon with Herbs'),(7,1,2,'pizza'),(8,1,2,'salmon with curry'),(9,1,3,'Alfajor'),(10,1,3,'brownies'),(11,1,3,'croissant'),(12,1,3,'apple tarte'),(13,1,4,'ice tea'),(14,1,4,'orange juice'),(15,1,4,'lemonade'),(16,1,4,'jinjer soda'),(17,2,1,'caesar'),(18,2,1,'marketo'),(19,2,1,'endive and apple'),(20,2,1,'burrata'),(21,2,2,'carbonara'),(22,2,2,'gnocchi'),(23,2,2,'lasagna'),(24,2,2,'pepperoni pizza'),(25,2,3,'Creme Brulee'),(26,2,3,'sorbet'),(27,2,3,'tiramisu'),(28,2,3,'cannoli'),(29,2,4,'grape juice'),(30,2,4,'7UP'),(31,2,4,'fresh orange juice'),(32,2,4,'ginger ale'),(33,3,1,'mixed greens'),(34,3,1,'greek'),(35,3,1,'garden'),(36,3,1,'caprese'),(37,3,2,'ribeye steak'),(38,3,2,'filet mignon'),(39,3,2,'new york strip'),(40,3,2,'t-bone steak'),(41,3,3,'cheesecake'),(42,3,3,'chocolate lava cake'),(43,3,3,'apple pie'),(44,3,3,'tiramisu'),(45,3,4,'red wine'),(46,3,4,'craft beer'),(47,3,4,'whiskey sour'),(48,3,4,'old fashioned'),(49,4,1,'Arugula Beet Salad'),(50,4,1,'Cobb Salad'),(51,4,1,'Kale Caesar'),(52,4,1,'Mediterranean Salad'),(53,4,2,'Grilled Chicken Alfredo'),(54,4,2,'Beef Wellington'),(55,4,2,'Stuffed Bell Peppers'),(56,4,2,'Lamb Chops'),(57,4,3,'Panna Cotta'),(58,4,3,'Banoffee Pie'),(59,4,3,'Eclairs'),(60,4,3,'Mille-Feuille'),(61,4,4,'Mango Smoothie'),(62,4,4,'Herbal Tea'),(63,4,4,'Mint Lemonade'),(64,4,4,'Iced Mocha'),(65,5,1,'Spinach and Strawberry '),(66,5,1,'Quinoa'),(67,5,1,'Asian Slaw'),(68,5,1,'Roasted Vegetable'),(69,5,2,'Herb-Crusted Salmon'),(70,5,2,'Chicken Marsala'),(71,5,2,'Pork Tenderloin'),(72,5,2,'Vegetarian Moussaka'),(73,5,3,'Pavlova'),(74,5,3,'Lemon Tart'),(75,5,3,'Baklava'),(76,5,3,'Profiteroles'),(77,5,4,'Berry Smoothie'),(78,5,4,'Chai Latte'),(79,5,4,'Coconut Water'),(80,5,4,'Matcha Tea');
/*!40000 ALTER TABLE `dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EmployeeNumber` int NOT NULL AUTO_INCREMENT,
  `ID` int DEFAULT NULL,
  `RestaurantNumber` int DEFAULT NULL,
  PRIMARY KEY (`EmployeeNumber`),
  KEY `ID` (`ID`),
  KEY `RestaurantNumber` (`RestaurantNumber`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `users` (`ID`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`RestaurantNumber`) REFERENCES `restaurants` (`RestaurantNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income_reports`
--

DROP TABLE IF EXISTS `income_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `income_reports` (
  `MonthYear` varchar(45) DEFAULT NULL,
  `District` varchar(45) DEFAULT NULL,
  `RestaurantNumber` int DEFAULT NULL,
  `Week1` int DEFAULT NULL,
  `Week2` int DEFAULT NULL,
  `Week3` int DEFAULT NULL,
  `Week4` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income_reports`
--

LOCK TABLES `income_reports` WRITE;
/*!40000 ALTER TABLE `income_reports` DISABLE KEYS */;
INSERT INTO `income_reports` VALUES ('1/2024','north',5,11565,10841,1071,7851),('2/2024','north',5,12834,6892,0,9922),('3/2024','north',5,9794,10649,8777,0),('4/2024','north',5,13948,6807,0,9670),('5/2024','north',5,12400,18231,0,0),('6/2024','north',5,18512,2264,0,9920),('7/2024','north',5,19311,10521,0,0),('1/2024','north',3,16193,14520,0,0),('2/2024','north',3,11306,9621,0,8225),('3/2024','north',3,23166,6737,0,0),('4/2024','north',3,24185,6869,0,0),('5/2024','north',3,12785,6585,10915,0),('6/2024','north',3,14995,5377,9651,0),('7/2024','north',3,14732,7011,7616,0),('1/2024','north',2,10346,11060,331,8202),('2/2024','north',2,10757,6864,2167,9660),('3/2024','north',2,11958,9135,9402,0),('4/2024','north',2,12621,17490,524,0),('5/2024','north',2,12912,16346,482,0),('6/2024','north',2,10321,20564,0,0),('7/2024','north',2,11617,10355,931,7247),('1/2024','north',1,13763,16268,0,0),('2/2024','north',1,18561,13192,0,0),('3/2024','north',1,15135,9661,6433,0),('4/2024','north',1,24353,5459,0,0),('5/2024','north',1,18921,11676,0,0),('6/2024','north',1,12750,6565,0,10396),('7/2024','north',1,11108,10277,0,8896),('1/2024','north',4,5902,10263,3246,8729),('2/2024','north',4,12769,7506,0,10020),('3/2024','north',4,11622,8933,2491,7704),('4/2024','north',4,10637,11784,0,7029),('5/2024','north',4,9976,9906,10854,0),('6/2024','north',4,8707,10573,10429,0),('7/2024','north',4,11469,9039,9839,0),('1/2024','center',5,11941,8606,0,8829),('2/2024','center',5,11861,14332,4426,0),('3/2024','center',5,13904,16164,0,0),('4/2024','center',5,16064,2080,0,10153),('5/2024','center',5,15446,14094,0,0),('6/2024','center',5,16509,13358,0,0),('7/2024','center',5,9644,7743,4939,7390),('1/2024','center',3,13190,16137,0,0),('2/2024','center',3,17254,3458,8359,0),('3/2024','center',3,18725,1814,0,10335),('4/2024','center',3,21252,9196,0,0),('5/2024','center',3,21519,7817,0,0),('6/2024','center',3,15789,15507,0,0),('7/2024','center',3,21893,8845,0,0),('1/2024','center',2,14087,14341,553,0),('2/2024','center',2,12397,18897,0,0),('3/2024','center',2,16955,5322,7863,0),('4/2024','center',2,9054,19729,0,0),('5/2024','center',2,11025,9458,0,9145),('6/2024','center',2,11906,8310,0,8630),('7/2024','center',2,10203,9989,9483,0),('1/2024','center',4,12497,13561,2437,0),('2/2024','center',4,13088,6826,9361,0),('3/2024','center',4,9964,19661,0,0),('4/2024','center',4,10322,16973,925,0),('5/2024','center',4,15702,6243,7741,0),('6/2024','center',4,12713,17147,0,0),('7/2024','center',4,10726,10228,8948,0),('1/2024','center',1,7686,12584,378,8547),('2/2024','center',1,19457,9961,0,0),('3/2024','center',1,9784,11156,0,9972),('4/2024','center',1,12571,8928,9064,0),('5/2024','center',1,10458,9080,549,9502),('6/2024','center',1,7361,19466,3077,0),('7/2024','center',1,12188,16751,317,0),('1/2024','south',5,14480,16063,0,0),('2/2024','south',5,10617,15076,5488,0),('3/2024','south',5,11016,9374,0,9649),('4/2024','south',5,11945,18689,0,0),('5/2024','south',5,13546,16203,0,0),('6/2024','south',5,17386,12324,0,0),('7/2024','south',5,10701,19876,0,0),('1/2024','south',3,18329,10751,0,0),('2/2024','south',3,19509,10625,0,0),('3/2024','south',3,17240,4341,0,9339),('4/2024','south',3,19364,749,0,10843),('5/2024','south',3,14857,15301,0,0),('6/2024','south',3,26762,4243,0,0),('7/2024','south',3,22151,8231,0,0),('1/2024','south',2,11537,15354,2419,0),('2/2024','south',2,8378,20996,0,0),('3/2024','south',2,14014,6130,8493,0),('4/2024','south',2,11145,9261,0,8389),('5/2024','south',2,21754,9204,0,0),('6/2024','south',2,22246,9027,0,0),('7/2024','south',2,7828,11749,175,9030),('1/2024','south',1,22630,7815,0,0),('2/2024','south',1,21677,8049,0,0),('3/2024','south',1,17237,10479,108,0),('4/2024','south',1,8312,8691,13630,0),('5/2024','south',1,14778,7625,0,8032),('6/2024','south',1,10855,16243,2884,0),('7/2024','south',1,8376,11476,0,10936),('1/2024','south',4,21953,7677,0,0),('2/2024','south',4,9004,9952,10374,0),('3/2024','south',4,13069,6239,0,10883),('5/2024','south',4,10003,11405,0,9170),('6/2024','south',4,12754,6460,10004,0),('7/2024','south',4,12050,7803,11203,0),('4/2024','south',4,13104,7805,7869,0);
/*!40000 ALTER TABLE `income_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_reports`
--

DROP TABLE IF EXISTS `order_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_reports` (
  `MonthYear` varchar(45) DEFAULT NULL,
  `District` varchar(45) DEFAULT NULL,
  `RestaurantNumber` int DEFAULT NULL,
  `Salad` int DEFAULT NULL,
  `MainCourse` int DEFAULT NULL,
  `Dessert` int DEFAULT NULL,
  `Drink` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_reports`
--

LOCK TABLES `order_reports` WRITE;
/*!40000 ALTER TABLE `order_reports` DISABLE KEYS */;
INSERT INTO `order_reports` VALUES ('1/2024','north',5,525,513,526,473),('2/2024','north',5,475,485,511,466),('3/2024','north',5,514,511,461,521),('4/2024','north',5,493,498,488,526),('5/2024','north',5,503,454,470,517),('6/2024','north',5,520,527,485,522),('7/2024','north',5,539,480,519,475),('1/2024','north',3,496,498,495,500),('2/2024','north',3,480,486,503,480),('3/2024','north',3,485,496,491,473),('4/2024','north',3,465,490,516,484),('5/2024','north',3,516,501,484,507),('6/2024','north',3,507,495,489,493),('7/2024','north',3,499,503,473,515),('1/2024','north',2,492,520,496,491),('2/2024','north',2,488,518,504,521),('3/2024','north',2,484,532,480,485),('4/2024','north',2,505,510,480,517),('5/2024','north',2,521,494,505,490),('6/2024','north',2,473,470,510,488),('7/2024','north',2,476,497,506,507),('1/2024','north',4,505,494,503,494),('2/2024','north',4,548,517,516,505),('3/2024','north',4,514,533,500,492),('4/2024','north',4,521,504,515,480),('5/2024','north',4,497,498,485,504),('6/2024','north',4,485,527,513,508),('7/2024','north',4,446,483,508,521),('1/2024','north',1,474,533,492,492),('2/2024','north',1,494,497,464,497),('3/2024','north',1,507,523,473,488),('4/2024','north',1,487,479,516,505),('5/2024','north',1,496,487,508,509),('6/2024','north',1,499,473,520,523),('7/2024','north',1,508,471,497,485),('1/2024','center',5,469,459,506,516),('2/2024','center',5,527,506,519,528),('3/2024','center',5,484,506,524,538),('4/2024','center',5,489,480,490,514),('5/2024','center',5,533,502,480,531),('6/2024','center',5,480,467,492,523),('7/2024','center',5,484,456,478,487),('1/2024','center',3,490,497,474,509),('2/2024','center',3,501,506,474,503),('3/2024','center',3,516,496,512,504),('4/2024','center',3,478,541,517,468),('5/2024','center',3,515,466,496,549),('6/2024','center',3,502,523,501,470),('7/2024','center',3,528,493,493,558),('1/2024','center',2,502,509,535,512),('2/2024','center',2,532,481,513,478),('3/2024','center',2,505,535,484,486),('4/2024','center',2,517,485,481,507),('5/2024','center',2,500,515,510,487),('6/2024','center',2,477,546,474,478),('7/2024','center',2,491,485,526,502),('1/2024','center',4,509,494,494,470),('2/2024','center',4,520,518,444,493),('3/2024','center',4,474,501,496,463),('4/2024','center',4,540,524,485,478),('5/2024','center',4,502,516,476,549),('6/2024','center',4,546,487,512,498),('7/2024','center',4,497,487,444,488),('1/2024','center',1,465,529,510,507),('2/2024','center',1,504,477,488,525),('3/2024','center',1,482,510,520,531),('4/2024','center',1,503,514,492,489),('5/2024','center',1,493,507,476,524),('6/2024','center',1,497,525,492,506),('7/2024','center',1,511,501,540,460),('1/2024','south',5,528,489,492,535),('2/2024','south',5,503,524,507,490),('3/2024','south',5,471,532,526,487),('4/2024','south',5,506,527,507,471),('5/2024','south',5,465,526,475,487),('6/2024','south',5,481,534,455,495),('7/2024','south',5,531,527,528,483),('1/2024','south',3,502,498,468,483),('2/2024','south',3,506,495,506,485),('3/2024','south',3,455,452,516,470),('4/2024','south',3,460,517,516,504),('5/2024','south',3,488,525,492,513),('7/2024','south',3,495,519,511,465),('6/2024','south',3,540,502,481,500),('1/2024','south',2,445,498,481,499),('2/2024','south',2,472,502,543,480),('4/2024','south',2,508,497,513,472),('6/2024','south',2,500,487,496,518),('7/2024','south',2,494,499,505,464),('3/2024','south',2,491,476,474,522),('5/2024','south',2,509,477,495,493),('1/2024','south',4,505,479,514,470),('2/2024','south',4,494,490,542,528),('3/2024','south',4,493,520,536,515),('4/2024','south',4,494,519,486,465),('6/2024','south',4,504,503,474,499),('5/2024','south',4,469,529,524,523),('7/2024','south',4,499,511,522,491),('1/2024','south',1,510,468,509,483),('2/2024','south',1,542,521,482,509),('3/2024','south',1,512,509,471,514),('4/2024','south',1,519,475,505,500),('5/2024','south',1,476,466,491,510),('6/2024','south',1,496,491,478,475),('7/2024','south',1,524,498,527,521);
/*!40000 ALTER TABLE `order_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `CustomerNumber` int DEFAULT NULL,
  `RestaurantNumber` int DEFAULT NULL,
  `TotalPrice` int DEFAULT NULL,
  `Salad` int DEFAULT NULL,
  `MainCourse` int DEFAULT NULL,
  `Dessert` int DEFAULT NULL,
  `Drink` int DEFAULT NULL,
  `IsDelivery` tinyint DEFAULT NULL,
  `IsEarlyOrder` tinyint DEFAULT NULL,
  `RequestedDateTime` datetime DEFAULT NULL,
  `OrderDateTime` datetime DEFAULT NULL,
  `StatusRestaurant` varchar(45) DEFAULT 'pending',
  `ReceivedDateTime` datetime DEFAULT NULL,
  `IsLate` tinyint DEFAULT '0',
  PRIMARY KEY (`OrderID`),
  KEY `CustomerNumber` (`CustomerNumber`),
  KEY `RestaurantNumber` (`RestaurantNumber`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerNumber`) REFERENCES `customers` (`CustomerNumber`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`RestaurantNumber`) REFERENCES `restaurants` (`RestaurantNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance_reports`
--

DROP TABLE IF EXISTS `performance_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance_reports` (
  `MonthYear` varchar(45) DEFAULT NULL,
  `District` varchar(45) DEFAULT NULL,
  `Week1` float DEFAULT NULL,
  `Week2` float DEFAULT NULL,
  `Week3` float DEFAULT NULL,
  `Week4` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance_reports`
--

LOCK TABLES `performance_reports` WRITE;
/*!40000 ALTER TABLE `performance_reports` DISABLE KEYS */;
INSERT INTO `performance_reports` VALUES ('1/2024','north',80,79,88,77),('2/2024','north',81,81,92,84),('3/2024','north',83,80,84,76),('4/2024','north',81,83,100,83),('5/2024','north',78,84,82,0),('6/2024','north',83,79,75,82),('7/2024','north',80,76,84,89),('1/2024','center',84,81,95,88),('2/2024','center',82,82,82,0),('3/2024','center',78,81,74,80),('4/2024','center',83,82,82,81),('5/2024','center',81,82,80,80),('6/2024','center',84,78,95,84),('7/2024','center',79,81,81,84),('1/2024','south',80,79,73,0),('2/2024','south',84,80,80,0),('3/2024','south',75,75,76,83),('4/2024','south',83,81,85,84),('5/2024','south',81,83,0,81),('6/2024','south',81,84,85,0),('7/2024','south',82,80,81,79);
/*!40000 ALTER TABLE `performance_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prices` (
  `DishID` int DEFAULT NULL,
  `Size` varchar(50) DEFAULT 'regular',
  `Price` int NOT NULL,
  KEY `DishID` (`DishID`),
  CONSTRAINT `prices_ibfk_1` FOREIGN KEY (`DishID`) REFERENCES `dishes` (`DishID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES (2,'small',36),(2,'large',39),(3,'small',42),(3,'large',46),(9,'3 pieces',19),(15,'small',12),(15,'large',13),(16,'small',13),(16,'large',14),(1,'regular',40),(4,'regular',40),(5,'regular',57),(6,'regular',97),(7,'regular',59),(8,'regular',67),(10,'regular',22),(11,'regular',15),(12,'regular',25),(13,'regular',12),(14,'regular',12),(17,'regular',61),(18,'regular',61),(19,'regular',67),(20,'regular',63),(21,'regular',83),(22,'regular',79),(23,'regular',83),(24,'regular',76),(25,'regular',46),(26,'regular',14),(27,'regular',47),(28,'regular',47),(29,'regular',13),(30,'regular',14),(31,'regular',15),(32,'regular',14),(33,'regular',25),(34,'regular',30),(35,'regular',20),(36,'regular',22),(37,'regular',75),(38,'regular',90),(39,'regular',80),(40,'regular',85),(41,'regular',40),(42,'regular',45),(43,'regular',35),(44,'regular',50),(45,'regular',60),(46,'regular',35),(47,'regular',70),(48,'regular',65),(49,'regular',10),(51,'regular',11),(52,'regular',13),(53,'regular',19),(54,'regular',22),(55,'regular',17),(56,'regular',22),(57,'regular',9),(58,'regular',9),(59,'regular',8),(60,'regular',10),(61,'regular',6),(62,'regular',4),(63,'regular',7),(50,'small',11),(50,'large',12),(64,'small',5),(64,'large',6),(65,'regular',55),(66,'regular',60),(67,'regular',65),(68,'regular',70),(69,'regular',75),(70,'regular',80),(71,'regular',85),(72,'regular',90),(73,'regular',60),(74,'regular',65),(75,'regular',70),(76,'regular',75),(77,'regular',20),(78,'regular',25),(79,'regular',30),(80,'regular',25);
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quarter_income_reports`
--

DROP TABLE IF EXISTS `quarter_income_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quarter_income_reports` (
  `Quarter` varchar(50) DEFAULT NULL,
  `Year` varchar(50) DEFAULT NULL,
  `RestaurantNumber` int DEFAULT NULL,
  `TotalIncome` int DEFAULT NULL,
  `Week1` int DEFAULT NULL,
  `Week2` int DEFAULT NULL,
  `Week3` int DEFAULT NULL,
  `Week4` int DEFAULT NULL,
  `Week5` int DEFAULT NULL,
  `Week6` int DEFAULT NULL,
  `Week7` int DEFAULT NULL,
  `Week8` int DEFAULT NULL,
  `Week9` int DEFAULT NULL,
  `Week10` int DEFAULT NULL,
  `Week11` int DEFAULT NULL,
  `Week12` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quarter_income_reports`
--

LOCK TABLES `quarter_income_reports` WRITE;
/*!40000 ALTER TABLE `quarter_income_reports` DISABLE KEYS */;
INSERT INTO `quarter_income_reports` VALUES ('Q1','2024',5,272022,37986,35510,1071,16680,17735,30476,33315,9922,12212,39595,19094,8777),('Q2','2024',5,269549,41957,27576,0,19823,30417,53013,6490,0,16409,55290,8654,0),('Q1','2024',3,269174,47712,41408,0,0,27894,42149,10089,8225,23478,48545,0,10335),('Q2','2024',3,274561,64801,16814,0,10843,37941,40923,0,10915,18119,52753,11801,9651),('Q1','2024',2,267618,35970,40755,3303,8202,18667,42403,19386,9660,17326,43652,11938,16356),('Q2','2024',2,269543,32820,46480,524,8389,35548,42409,3224,9145,19618,45685,17071,0),('Q1','2024',4,265731,40352,31501,5683,8729,20968,35922,12629,9361,22297,38774,20928,7704),('Q2','2024',4,266235,34063,36562,8794,7029,23619,37071,21140,0,20631,36960,38093,2273),('Q1','2024',1,270533,44079,36667,378,8547,43437,35991,11469,0,13963,46643,19387,0),('Q2','2024',1,271226,45236,23078,22694,0,25749,39890,7448,8032,19294,31567,37009,11229);
/*!40000 ALTER TABLE `quarter_income_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quarter_reports`
--

DROP TABLE IF EXISTS `quarter_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quarter_reports` (
  `Quarter` varchar(50) DEFAULT NULL,
  `Year` varchar(50) DEFAULT NULL,
  `RestaurantNumber` int DEFAULT NULL,
  `MaxOrders` int DEFAULT NULL,
  `Interval1` varchar(50) DEFAULT NULL,
  `value1` int DEFAULT NULL,
  `Interval2` varchar(50) DEFAULT NULL,
  `value2` int DEFAULT NULL,
  `Interval3` varchar(50) DEFAULT NULL,
  `value3` int DEFAULT NULL,
  `Interval4` varchar(50) DEFAULT NULL,
  `value4` int DEFAULT NULL,
  `Interval5` varchar(50) DEFAULT NULL,
  `value5` int DEFAULT NULL,
  `Interval6` varchar(50) DEFAULT NULL,
  `value6` int DEFAULT NULL,
  `Interval7` varchar(50) DEFAULT NULL,
  `value7` int DEFAULT NULL,
  `Interval8` varchar(50) DEFAULT NULL,
  `value8` int DEFAULT NULL,
  `Interval9` varchar(50) DEFAULT NULL,
  `value9` int DEFAULT NULL,
  `Interval10` varchar(50) DEFAULT NULL,
  `value10` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quarter_reports`
--

LOCK TABLES `quarter_reports` WRITE;
/*!40000 ALTER TABLE `quarter_reports` DISABLE KEYS */;
INSERT INTO `quarter_reports` VALUES ('Q1','2024',5,108,'0-9',2,'10-19',12,'20-29',11,'30-39',10,'40-49',7,'50-59',3,'60-69',5,'70-79',1,'80-89',0,'90-108',1),('Q2','2024',5,85,'0-7',1,'8-15',2,'16-23',3,'24-31',9,'32-39',1,'40-47',6,'48-55',5,'56-63',8,'64-71',3,'72-85',3),('Q1','2024',3,87,'0-7',1,'8-15',3,'16-23',4,'24-31',2,'32-39',5,'40-47',7,'48-55',5,'56-63',8,'64-71',2,'72-87',3),('Q2','2024',3,101,'0-9',2,'10-19',3,'20-29',0,'30-39',8,'40-49',9,'50-59',6,'60-69',5,'70-79',1,'80-89',1,'90-101',3),('Q1','2024',2,82,'0-7',3,'8-15',3,'16-23',7,'24-31',7,'32-39',12,'40-47',3,'48-55',6,'56-63',3,'64-71',1,'72-82',4),('Q2','2024',2,89,'0-7',3,'8-15',4,'16-23',7,'24-31',6,'32-39',8,'40-47',4,'48-55',2,'56-63',5,'64-71',5,'72-89',3),('Q1','2024',4,87,'0-7',5,'8-15',4,'16-23',8,'24-31',7,'32-39',10,'40-47',3,'48-55',6,'56-63',3,'64-71',5,'72-87',1),('Q2','2024',4,70,'0-6',3,'7-13',7,'14-20',3,'21-27',4,'28-34',12,'35-41',6,'42-48',5,'49-55',8,'56-62',3,'63-70',2),('Q1','2024',1,134,'0-12',5,'13-25',16,'26-38',10,'39-51',8,'52-64',4,'65-77',3,'78-90',1,'91-103',0,'104-116',0,'117-134',2),('Q2','2024',1,96,'0-8',4,'9-17',9,'18-26',9,'27-35',13,'36-44',8,'45-53',2,'54-62',2,'63-71',2,'72-80',2,'81-96',3);
/*!40000 ALTER TABLE `quarter_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `RestaurantNumber` int NOT NULL AUTO_INCREMENT,
  `RestaurantName` varchar(45) DEFAULT NULL,
  `BeginUpdate` datetime DEFAULT '1991-01-01 13:00:00',
  `EndUpdate` datetime DEFAULT '1991-01-01 13:30:00',
  PRIMARY KEY (`RestaurantNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'The Savory Spoon','1991-01-01 13:00:00','1991-01-01 13:30:00'),(2,'Bistro Belle Vie','1991-01-01 13:00:00','1991-01-01 13:30:00'),(3,'Harvest Moon Cafe','1991-01-01 13:00:00','1991-01-01 13:30:00'),(4,'Gourmet Garden','1991-01-01 13:00:00','1991-01-01 13:30:00'),(5,'Urban Palate','1991-01-01 13:00:00','1991-01-01 13:30:00');
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants_orders`
--

DROP TABLE IF EXISTS `restaurants_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants_orders` (
  `OrderID` int DEFAULT NULL,
  `DishID` int DEFAULT NULL,
  `Size` varchar(50) DEFAULT NULL,
  `Specification` varchar(255) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  KEY `OrderID` (`OrderID`),
  KEY `DishID` (`DishID`),
  CONSTRAINT `restaurants_orders_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `restaurants_orders_ibfk_2` FOREIGN KEY (`DishID`) REFERENCES `dishes` (`DishID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants_orders`
--

LOCK TABLES `restaurants_orders` WRITE;
/*!40000 ALTER TABLE `restaurants_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurants_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `ID` int NOT NULL,
  `UserName` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `District` varchar(45) DEFAULT NULL,
  `IsLoggedIn` tinyint DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UserName` (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-14 14:16:04
