CREATE DATABASE  IF NOT EXISTS `bachel_er` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bachel_er`;
-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: bachel_er
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `Activity`
--

DROP TABLE IF EXISTS `Activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Activity` (
  `activity_type` char(20) NOT NULL,
  `air_date` date NOT NULL,
  PRIMARY KEY (`activity_type`,`air_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Activity`
--

LOCK TABLES `Activity` WRITE;
/*!40000 ALTER TABLE `Activity` DISABLE KEYS */;
INSERT INTO `Activity` VALUES ('group date','2002-04-01'),('limo arrivals','2002-03-25'),('one-on-one','2002-04-08'),('rose ceremony','2002-03-25'),('rose ceremony','2002-04-01');
/*!40000 ALTER TABLE `Activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ActivityShownInEpisode`
--

DROP TABLE IF EXISTS `ActivityShownInEpisode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ActivityShownInEpisode` (
  `activity_type` char(20) NOT NULL,
  `air_date` date NOT NULL,
  `title` char(20) NOT NULL,
  `season` int NOT NULL,
  `episode_number` int NOT NULL,
  PRIMARY KEY (`title`,`season`,`episode_number`,`air_date`,`activity_type`),
  KEY `activity_type` (`activity_type`,`air_date`),
  CONSTRAINT `activityshowninepisode_ibfk_1` FOREIGN KEY (`activity_type`, `air_date`) REFERENCES `Activity` (`activity_type`, `air_date`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `activityshowninepisode_ibfk_2` FOREIGN KEY (`title`, `season`, `episode_number`) REFERENCES `EpisodeAired` (`title`, `season`, `episode_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ActivityShownInEpisode`
--

LOCK TABLES `ActivityShownInEpisode` WRITE;
/*!40000 ALTER TABLE `ActivityShownInEpisode` DISABLE KEYS */;
/*!40000 ALTER TABLE `ActivityShownInEpisode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CastAppearsInShow`
--

DROP TABLE IF EXISTS `CastAppearsInShow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CastAppearsInShow` (
  `cast_id` int NOT NULL,
  `title` char(20) NOT NULL,
  `season` int NOT NULL,
  `role` char(20) DEFAULT NULL,
  PRIMARY KEY (`cast_id`,`title`,`season`),
  KEY `title` (`title`,`season`),
  CONSTRAINT `castappearsinshow_ibfk_1` FOREIGN KEY (`cast_id`) REFERENCES `CastMember` (`cast_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `castappearsinshow_ibfk_2` FOREIGN KEY (`title`, `season`) REFERENCES `TVShow` (`title`, `season`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CastAppearsInShow`
--

LOCK TABLES `CastAppearsInShow` WRITE;
/*!40000 ALTER TABLE `CastAppearsInShow` DISABLE KEYS */;
INSERT INTO `CastAppearsInShow` VALUES (6,'The Bachelor',19,'contestant'),(7,'Bachelor In Paradise',2,'contestant'),(7,'Bachelor In Paradise',3,'contestant'),(7,'The Bachelorette',11,'contestant'),(200,'The Bachelor',2,'lead'),(300,'The Bachelor',3,'lead'),(400,'The Bachelor',4,'lead'),(400,'The Bachelorette',1,'contestant'),(500,'The Bachelor',5,'lead'),(600,'The Bachelor',6,'lead'),(700,'The Bachelor',7,'lead'),(800,'The Bachelor',8,'lead'),(900,'The Bachelor',9,'lead'),(1000,'The Bachelor',10,'lead'),(1100,'The Bachelor',11,'lead'),(1200,'The Bachelor',12,'lead'),(1300,'The Bachelor',13,'lead'),(1300,'The Bachelorette',4,'contestant'),(1400,'The Bachelor',14,'lead'),(1400,'The Bachelorette',5,'contestant'),(1600,'The Bachelor',16,'lead'),(1600,'The Bachelorette',7,'contestant'),(1700,'The Bachelor',17,'lead'),(1700,'The Bachelorette',8,'contestant'),(1800,'The Bachelor',18,'lead'),(1800,'The Bachelorette',9,'contestant'),(1900,'The Bachelor',19,'lead'),(1900,'The Bachelorette',10,'contestant'),(2000,'The Bachelor',20,'lead'),(2000,'The Bachelorette',11,'contestant'),(2001,'The Bachelor',20,'contestant'),(2003,'The Bachelor',20,'contestant'),(2004,'The Bachelor',20,'contestant'),(2005,'The Bachelor',20,'contestant'),(2006,'The Bachelor',20,'contestant'),(2007,'The Bachelor',20,'contestant'),(2008,'The Bachelor',20,'contestant'),(2010,'The Bachelor',20,'contestant'),(2011,'The Bachelor',20,'contestant'),(2012,'The Bachelor',20,'contestant'),(2013,'The Bachelor',20,'contestant'),(2014,'The Bachelor',20,'contestant'),(2015,'The Bachelor',20,'contestant'),(2016,'The Bachelor',20,'contestant'),(2017,'The Bachelor',20,'contestant'),(2018,'The Bachelor',20,'contestant'),(2019,'The Bachelor',20,'contestant'),(2020,'The Bachelor',20,'contestant'),(2021,'The Bachelor',20,'contestant'),(2022,'The Bachelor',20,'contestant'),(2023,'The Bachelor',20,'contestant'),(2024,'The Bachelor',20,'contestant'),(2025,'The Bachelor',20,'contestant'),(2026,'The Bachelor',20,'contestant'),(2027,'The Bachelor',20,'contestant'),(2028,'The Bachelor',20,'contestant'),(2100,'Bachelor In Paradise',3,'contestant'),(2100,'The Bachelor',21,'lead'),(2100,'The Bachelorette',10,'contestant'),(2100,'The Bachelorette',11,'contestant'),(2101,'The Bachelor',21,'contestant'),(2102,'The Bachelor',21,'contestant'),(2103,'The Bachelor',21,'contestant'),(2104,'The Bachelor',21,'contestant'),(2105,'The Bachelor',21,'contestant'),(2106,'The Bachelor',21,'contestant'),(2108,'The Bachelor',21,'contestant'),(2109,'The Bachelor',21,'contestant'),(2110,'The Bachelor',21,'contestant'),(2111,'The Bachelor',21,'contestant'),(2112,'The Bachelor',21,'contestant'),(2113,'The Bachelor',21,'contestant'),(2114,'The Bachelor',21,'contestant'),(2115,'The Bachelor',21,'contestant'),(2116,'The Bachelor',21,'contestant'),(2117,'The Bachelor',21,'contestant'),(2118,'The Bachelor',21,'contestant'),(2119,'The Bachelor',21,'contestant'),(2120,'The Bachelor',21,'contestant'),(2121,'The Bachelor',21,'contestant'),(2122,'The Bachelor',21,'contestant'),(2123,'The Bachelor',21,'contestant'),(2124,'The Bachelor',21,'contestant'),(2125,'The Bachelor',21,'contestant'),(2126,'The Bachelor',21,'contestant'),(2127,'The Bachelor',21,'contestant'),(2128,'The Bachelor',21,'contestant'),(2129,'The Bachelor',21,'contestant'),(2130,'The Bachelor',21,'contestant'),(2200,'The Bachelor',22,'lead'),(2202,'The Bachelor',22,'contestant'),(2203,'The Bachelor',22,'contestant'),(2204,'The Bachelor',22,'contestant'),(2205,'The Bachelor',22,'contestant'),(2206,'The Bachelor',22,'contestant'),(2207,'The Bachelor',22,'contestant'),(2208,'The Bachelor',22,'contestant'),(2209,'The Bachelor',22,'contestant'),(2210,'The Bachelor',22,'contestant'),(2211,'The Bachelor',22,'contestant'),(2212,'The Bachelor',22,'contestant'),(2213,'The Bachelor',22,'contestant'),(2214,'The Bachelor',22,'contestant'),(2215,'The Bachelor',22,'contestant'),(2216,'The Bachelor',22,'contestant'),(2217,'The Bachelor',22,'contestant'),(2218,'The Bachelor',22,'contestant'),(2219,'The Bachelor',22,'contestant'),(2220,'The Bachelor',22,'contestant'),(2221,'The Bachelor',22,'contestant'),(2222,'The Bachelor',22,'contestant'),(2223,'The Bachelor',22,'contestant'),(2224,'The Bachelor',22,'contestant'),(2225,'The Bachelor',22,'contestant'),(2226,'The Bachelor',22,'contestant'),(2227,'The Bachelor',22,'contestant'),(2229,'The Bachelor',22,'contestant'),(2300,'The Bachelor',23,'lead'),(2301,'The Bachelor',23,'contestant'),(2302,'The Bachelor',23,'contestant'),(2303,'The Bachelor',23,'contestant'),(2304,'The Bachelor',23,'contestant'),(2305,'The Bachelor',23,'contestant'),(2306,'The Bachelor',23,'contestant'),(2308,'The Bachelor',23,'contestant'),(2309,'The Bachelor',23,'contestant'),(2310,'The Bachelor',23,'contestant'),(2311,'The Bachelor',23,'contestant'),(2312,'The Bachelor',23,'contestant'),(2313,'The Bachelor',23,'contestant'),(2314,'The Bachelor',23,'contestant'),(2315,'The Bachelor',23,'contestant'),(2317,'The Bachelor',23,'contestant'),(2318,'The Bachelor',23,'contestant'),(2319,'The Bachelor',23,'contestant'),(2320,'The Bachelor',23,'contestant'),(2321,'The Bachelor',23,'contestant'),(2322,'The Bachelor',23,'contestant'),(2323,'The Bachelor',23,'contestant'),(2324,'The Bachelor',23,'contestant'),(2325,'The Bachelor',23,'contestant'),(2326,'The Bachelor',23,'contestant'),(2328,'The Bachelor',23,'contestant'),(2329,'The Bachelor',23,'contestant'),(2330,'The Bachelor',23,'contestant'),(990100,'The Bachelorette',1,'lead'),(990101,'The Bachelorette',1,'contestant'),(990102,'The Bachelorette',1,'contestant'),(990103,'The Bachelorette',1,'contestant'),(990104,'The Bachelorette',1,'contestant'),(990105,'The Bachelorette',1,'contestant'),(990106,'The Bachelorette',1,'contestant'),(990107,'The Bachelorette',1,'contestant'),(990108,'The Bachelorette',1,'contestant'),(990109,'The Bachelorette',1,'contestant'),(990110,'The Bachelorette',1,'contestant'),(990111,'The Bachelorette',1,'contestant'),(990112,'The Bachelorette',1,'contestant'),(990113,'The Bachelorette',1,'contestant'),(990114,'The Bachelorette',1,'contestant'),(990115,'The Bachelorette',1,'contestant'),(990116,'The Bachelorette',1,'contestant'),(990117,'The Bachelorette',1,'contestant'),(990118,'The Bachelorette',1,'contestant'),(990119,'The Bachelorette',1,'contestant'),(990120,'The Bachelorette',1,'contestant'),(990121,'The Bachelorette',1,'contestant'),(990122,'The Bachelorette',1,'contestant'),(990123,'The Bachelorette',1,'contestant'),(990144,'The Bachelorette',1,'contestant'),(990200,'The Bachelor',4,'contestant'),(990200,'The Bachelorette',2,'lead'),(990201,'The Bachelorette',2,'contestant'),(990202,'The Bachelorette',2,'contestant'),(990203,'The Bachelorette',2,'contestant'),(990204,'The Bachelorette',2,'contestant'),(990205,'The Bachelorette',2,'contestant'),(990206,'The Bachelorette',2,'contestant'),(990207,'The Bachelorette',2,'contestant'),(990208,'The Bachelorette',2,'contestant'),(990209,'The Bachelorette',2,'contestant'),(990210,'The Bachelorette',2,'contestant'),(990211,'The Bachelorette',2,'contestant'),(990212,'The Bachelorette',2,'contestant'),(990213,'The Bachelorette',2,'contestant'),(990214,'The Bachelorette',2,'contestant'),(990215,'The Bachelorette',2,'contestant'),(990216,'The Bachelorette',2,'contestant'),(990217,'The Bachelorette',2,'contestant'),(990218,'The Bachelorette',2,'contestant'),(990219,'The Bachelorette',2,'contestant'),(990220,'The Bachelorette',2,'contestant'),(990221,'The Bachelorette',2,'contestant'),(990222,'The Bachelorette',2,'contestant'),(990223,'The Bachelorette',2,'contestant'),(990224,'The Bachelorette',2,'contestant'),(990299,'The Bachelorette',2,'contestant'),(990300,'The Bachelor',3,'contestant'),(990300,'The Bachelorette',3,'lead'),(990400,'The Bachelor',11,'contestant'),(990400,'The Bachelorette',4,'lead'),(990401,'The Bachelorette',4,'contestant'),(990402,'The Bachelorette',4,'contestant'),(990403,'The Bachelorette',4,'contestant'),(990404,'The Bachelorette',4,'contestant'),(990405,'The Bachelorette',4,'contestant'),(990406,'The Bachelorette',4,'contestant'),(990407,'The Bachelorette',4,'contestant'),(990408,'The Bachelorette',4,'contestant'),(990409,'The Bachelorette',4,'contestant'),(990410,'The Bachelorette',4,'contestant'),(990411,'The Bachelorette',4,'contestant'),(990412,'The Bachelorette',4,'contestant'),(990413,'The Bachelorette',4,'contestant'),(990414,'The Bachelorette',4,'contestant'),(990415,'The Bachelorette',4,'contestant'),(990416,'The Bachelorette',4,'contestant'),(990417,'The Bachelorette',4,'contestant'),(990418,'The Bachelorette',4,'contestant'),(990419,'The Bachelorette',4,'contestant'),(990420,'The Bachelorette',4,'contestant'),(990421,'The Bachelorette',4,'contestant'),(990422,'The Bachelorette',4,'contestant'),(990423,'The Bachelorette',4,'contestant'),(990499,'The Bachelorette',4,'contestant'),(990500,'The Bachelor',13,'contestant'),(990500,'The Bachelorette',5,'lead'),(990524,'The Bachelorette',5,'contestant'),(990525,'The Bachelorette',5,'contestant'),(990526,'The Bachelorette',5,'contestant'),(990527,'The Bachelorette',5,'contestant'),(990528,'The Bachelorette',5,'contestant'),(990529,'The Bachelorette',5,'contestant'),(990530,'The Bachelorette',5,'contestant'),(990531,'The Bachelorette',5,'contestant'),(990532,'The Bachelorette',5,'contestant'),(990533,'The Bachelorette',5,'contestant'),(990535,'The Bachelorette',5,'contestant'),(990536,'The Bachelorette',5,'contestant'),(990537,'The Bachelorette',5,'contestant'),(990538,'The Bachelorette',5,'contestant'),(990539,'The Bachelorette',5,'contestant'),(990540,'The Bachelorette',5,'contestant'),(990541,'The Bachelorette',5,'contestant'),(990542,'The Bachelorette',5,'contestant'),(990543,'The Bachelorette',5,'contestant'),(990544,'The Bachelorette',5,'contestant'),(990545,'The Bachelorette',5,'contestant'),(990546,'The Bachelorette',5,'contestant'),(990547,'The Bachelorette',5,'contestant'),(990548,'The Bachelorette',5,'contestant'),(990549,'The Bachelorette',5,'contestant'),(990550,'The Bachelorette',5,'contestant'),(990551,'The Bachelorette',5,'contestant'),(990552,'The Bachelorette',5,'contestant'),(990600,'The Bachelor',14,'contestant'),(990600,'The Bachelorette',6,'lead'),(990601,'The Bachelorette',6,'contestant'),(990602,'The Bachelorette',6,'contestant'),(990603,'The Bachelorette',6,'contestant'),(990604,'The Bachelorette',6,'contestant'),(990605,'The Bachelorette',6,'contestant'),(990606,'The Bachelorette',6,'contestant'),(990607,'The Bachelorette',6,'contestant'),(990608,'The Bachelorette',6,'contestant'),(990609,'The Bachelorette',6,'contestant'),(990610,'The Bachelorette',6,'contestant'),(990611,'The Bachelorette',6,'contestant'),(990612,'The Bachelorette',6,'contestant'),(990615,'The Bachelorette',6,'contestant'),(990616,'The Bachelorette',6,'contestant'),(990617,'The Bachelorette',6,'contestant'),(990618,'The Bachelorette',6,'contestant'),(990619,'The Bachelorette',6,'contestant'),(990621,'The Bachelorette',6,'contestant'),(990622,'The Bachelorette',6,'contestant'),(990623,'The Bachelorette',6,'contestant'),(990624,'The Bachelorette',6,'contestant'),(990699,'The Bachelorette',6,'contestant'),(990700,'The Bachelor',15,'contestant'),(990700,'The Bachelorette',7,'lead'),(990725,'The Bachelorette',7,'contestant'),(990726,'The Bachelorette',7,'contestant'),(990727,'The Bachelorette',7,'contestant'),(990728,'The Bachelorette',7,'contestant'),(990729,'The Bachelorette',7,'contestant'),(990730,'The Bachelorette',7,'contestant'),(990733,'The Bachelorette',7,'contestant'),(990734,'The Bachelorette',7,'contestant'),(990737,'The Bachelorette',7,'contestant'),(990738,'The Bachelorette',7,'contestant'),(990739,'The Bachelorette',7,'contestant'),(990740,'The Bachelorette',7,'contestant'),(990741,'The Bachelorette',7,'contestant'),(990743,'The Bachelorette',7,'contestant'),(990744,'The Bachelorette',7,'contestant'),(990745,'The Bachelorette',7,'contestant'),(990748,'The Bachelorette',7,'contestant'),(990749,'The Bachelorette',7,'contestant'),(990800,'The Bachelor',15,'contestant'),(990800,'The Bachelorette',8,'lead'),(990850,'The Bachelorette',8,'contestant'),(990851,'The Bachelorette',8,'contestant'),(990853,'The Bachelorette',8,'contestant'),(990854,'The Bachelorette',8,'contestant'),(990855,'The Bachelorette',8,'contestant'),(990856,'The Bachelorette',8,'contestant'),(990857,'The Bachelorette',8,'contestant'),(990858,'The Bachelorette',8,'contestant'),(990859,'The Bachelorette',8,'contestant'),(990860,'The Bachelorette',8,'contestant'),(990861,'The Bachelorette',8,'contestant'),(990862,'The Bachelorette',8,'contestant'),(990863,'The Bachelorette',8,'contestant'),(990865,'The Bachelorette',8,'contestant'),(990866,'The Bachelorette',8,'contestant'),(990867,'The Bachelorette',8,'contestant'),(990869,'The Bachelorette',8,'contestant'),(990870,'The Bachelorette',8,'contestant'),(990871,'The Bachelorette',8,'contestant'),(990872,'The Bachelorette',8,'contestant'),(990900,'The Bachelor',17,'contestant'),(990900,'The Bachelorette',9,'lead'),(990901,'The Bachelorette',9,'contestant'),(990902,'The Bachelorette',9,'contestant'),(990903,'The Bachelorette',9,'contestant'),(990904,'The Bachelorette',9,'contestant'),(990905,'The Bachelorette',9,'contestant'),(990906,'The Bachelorette',9,'contestant'),(990907,'The Bachelorette',9,'contestant'),(990908,'The Bachelorette',9,'contestant'),(990909,'The Bachelorette',9,'contestant'),(990910,'The Bachelorette',9,'contestant'),(990911,'The Bachelorette',9,'contestant'),(990912,'The Bachelorette',9,'contestant'),(990913,'The Bachelorette',9,'contestant'),(990914,'The Bachelorette',9,'contestant'),(990915,'The Bachelorette',9,'contestant'),(990916,'The Bachelorette',9,'contestant'),(990918,'The Bachelorette',9,'contestant'),(990920,'The Bachelorette',9,'contestant'),(990921,'The Bachelorette',9,'contestant'),(990999,'The Bachelorette',9,'contestant'),(991000,'The Bachelor',18,'contestant'),(991000,'The Bachelorette',10,'lead'),(991024,'The Bachelorette',10,'contestant'),(991026,'The Bachelorette',10,'contestant'),(991027,'The Bachelorette',10,'contestant'),(991028,'The Bachelorette',10,'contestant'),(991029,'The Bachelorette',10,'contestant'),(991030,'The Bachelorette',10,'contestant'),(991031,'The Bachelorette',10,'contestant'),(991032,'The Bachelorette',10,'contestant'),(991033,'The Bachelorette',10,'contestant'),(991034,'The Bachelorette',10,'contestant'),(991035,'The Bachelorette',10,'contestant'),(991036,'The Bachelorette',10,'contestant'),(991037,'The Bachelorette',10,'contestant'),(991038,'The Bachelorette',10,'contestant'),(991039,'The Bachelorette',10,'contestant'),(991040,'The Bachelorette',10,'contestant'),(991041,'The Bachelorette',10,'contestant'),(991043,'The Bachelorette',10,'contestant'),(991044,'The Bachelorette',10,'contestant'),(991045,'The Bachelorette',10,'contestant'),(991046,'The Bachelorette',10,'contestant'),(991100,'The Bachelor',19,'contestant'),(991100,'The Bachelorette',11,'lead'),(991147,'The Bachelorette',11,'contestant'),(991149,'The Bachelorette',11,'contestant'),(991150,'The Bachelorette',11,'contestant'),(991152,'The Bachelorette',11,'contestant'),(991153,'The Bachelorette',11,'contestant'),(991154,'The Bachelorette',11,'contestant'),(991155,'The Bachelorette',11,'contestant'),(991156,'The Bachelorette',11,'contestant'),(991157,'The Bachelorette',11,'contestant'),(991158,'The Bachelorette',11,'contestant'),(991159,'The Bachelorette',11,'contestant'),(991160,'The Bachelorette',11,'contestant'),(991161,'The Bachelorette',11,'contestant'),(991162,'The Bachelorette',11,'contestant'),(991163,'The Bachelorette',11,'contestant'),(991164,'The Bachelorette',11,'contestant'),(991165,'The Bachelorette',11,'contestant'),(991166,'The Bachelorette',11,'contestant'),(991167,'The Bachelorette',11,'contestant'),(991168,'The Bachelorette',11,'contestant'),(991169,'The Bachelorette',11,'contestant'),(991170,'The Bachelorette',11,'contestant'),(991200,'The Bachelor',20,'contestant'),(991200,'The Bachelorette',12,'lead'),(991201,'The Bachelorette',12,'contestant'),(991202,'The Bachelorette',12,'contestant'),(991203,'The Bachelorette',12,'contestant'),(991204,'The Bachelorette',12,'contestant'),(991205,'The Bachelorette',12,'contestant'),(991206,'The Bachelorette',12,'contestant'),(991207,'The Bachelorette',12,'contestant'),(991208,'The Bachelorette',12,'contestant'),(991209,'The Bachelorette',12,'contestant'),(991271,'The Bachelorette',12,'contestant'),(991272,'The Bachelorette',12,'contestant'),(991273,'The Bachelorette',12,'contestant'),(991274,'The Bachelorette',12,'contestant'),(991275,'The Bachelorette',12,'contestant'),(991276,'The Bachelorette',12,'contestant'),(991277,'The Bachelorette',12,'contestant'),(991278,'The Bachelorette',12,'contestant'),(991279,'The Bachelorette',12,'contestant'),(991280,'The Bachelorette',12,'contestant'),(991281,'The Bachelorette',12,'contestant'),(991282,'The Bachelorette',12,'contestant'),(991283,'The Bachelorette',12,'contestant'),(991284,'The Bachelorette',12,'contestant'),(991285,'The Bachelorette',12,'contestant'),(991286,'The Bachelorette',12,'contestant'),(991299,'The Bachelorette',12,'contestant'),(991300,'The Bachelor',21,'contestant'),(991400,'The Bachelor',22,'contestant'),(991500,'The Bachelor',23,'contestant'),(991500,'The Bachelorette',15,'lead');
/*!40000 ALTER TABLE `CastAppearsInShow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CastGivesRoseNumber`
--

DROP TABLE IF EXISTS `CastGivesRoseNumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CastGivesRoseNumber` (
  `giver_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `rose_type` char(20) DEFAULT NULL,
  `rose_number` int NOT NULL,
  PRIMARY KEY (`giver_id`,`receiver_id`,`rose_number`),
  KEY `receiver_id` (`receiver_id`),
  KEY `rose_type` (`rose_type`,`rose_number`),
  CONSTRAINT `castgivesrosenumber_ibfk_1` FOREIGN KEY (`giver_id`) REFERENCES `CastMember` (`cast_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `castgivesrosenumber_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `CastMember` (`cast_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `castgivesrosenumber_ibfk_3` FOREIGN KEY (`rose_type`, `rose_number`) REFERENCES `Rose` (`rose_type`, `rose_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CastGivesRoseNumber`
--

LOCK TABLES `CastGivesRoseNumber` WRITE;
/*!40000 ALTER TABLE `CastGivesRoseNumber` DISABLE KEYS */;
INSERT INTO `CastGivesRoseNumber` VALUES (100,101,'ceremony',1),(100,990100,'ceremony',2),(100,102,'ceremony',3),(100,103,'ceremony',4),(100,101,'ceremony',5),(2400,2402,'ceremony',24002),(2400,2403,'ceremony',24003),(2400,2404,'ceremony',24004),(2400,2405,'ceremony',24005),(2400,2406,'ceremony',24006),(2400,2407,'ceremony',24007),(2400,2408,'ceremony',24008),(2400,2409,'ceremony',24009),(2400,2410,'ceremony',24010),(2400,2411,'ceremony',24011),(2400,2412,'ceremony',24012),(2400,2413,'ceremony',24013),(2400,2414,'ceremony',24014),(2400,2415,'ceremony',24015),(2400,2416,'ceremony',24016),(2400,2417,'ceremony',24017),(2400,2418,'ceremony',24018),(2400,2419,'ceremony',24019),(2400,2420,'ceremony',24020),(2400,2421,'ceremony',24021),(2400,2422,'ceremony',24022),(2400,2401,'ceremony',24026),(2400,2403,'ceremony',24027),(2400,2404,'ceremony',24028),(2400,2406,'ceremony',24029),(2400,2407,'ceremony',24030),(2400,2409,'ceremony',24031),(2400,2410,'ceremony',24032),(2400,2411,'ceremony',24033),(2400,2412,'ceremony',24034),(2400,2413,'ceremony',24035),(2400,2414,'ceremony',24036),(2400,2415,'ceremony',24037),(2400,2416,'ceremony',24038),(2400,2417,'ceremony',24039),(2400,2418,'ceremony',24040),(2400,2419,'ceremony',24041),(2400,2401,'ceremony',24045),(2400,2402,'ceremony',24046),(2400,2404,'ceremony',24047),(2400,2405,'ceremony',24048),(2400,2406,'ceremony',24049),(2400,2407,'ceremony',24050),(2400,2409,'ceremony',24051),(2400,2411,'ceremony',24052),(2400,2412,'ceremony',24053),(2400,2413,'ceremony',24054),(2400,2414,'ceremony',24055),(2400,2415,'ceremony',24056),(2400,2401,'ceremony',24060),(2400,2402,'ceremony',24061),(2400,2405,'ceremony',24062),(2400,2406,'ceremony',24063),(2400,2407,'ceremony',24064),(2400,2408,'ceremony',24065),(2400,2409,'ceremony',24066),(2400,2410,'ceremony',24067),(2400,2411,'ceremony',24068),(2400,2412,'ceremony',24069),(2400,2402,'ceremony',24073),(2400,2403,'ceremony',24074),(2400,2404,'ceremony',24075),(2400,2406,'ceremony',24076),(2400,2407,'ceremony',24077),(2400,2409,'ceremony',24078),(2400,2410,'ceremony',24079),(2400,2404,'ceremony',24083),(2400,2405,'ceremony',24084),(2400,2406,'ceremony',24085),(2400,2401,'ceremony',24090),(2400,2402,'ceremony',24091),(2400,2403,'ceremony',24092),(2400,2401,'ceremony',24093),(2400,2402,'ceremony',24094),(2400,2401,'final rose',24095),(2400,2401,'first impression',24001),(2400,2405,'group date',24023),(2400,2408,'group date',24025),(2400,2403,'group date',24042),(2400,2408,'group date',24044),(2400,2416,'group date',24058),(2400,2401,'group date',24071),(2400,2402,'group date',24081),(2400,2401,'group date',24088),(2400,2403,'group date',24089),(2400,2402,'one-on-one',24024),(2400,2410,'one-on-one',24043),(2400,2403,'one-on-one',24057),(2400,2404,'one-on-one',24059),(2400,2408,'one-on-one',24070),(2400,2405,'one-on-one',24072),(2400,2401,'one-on-one',24080),(2400,2403,'one-on-one',24082),(2400,2402,'one-on-one',24086),(2400,2404,'one-on-one',24087);
/*!40000 ALTER TABLE `CastGivesRoseNumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CastHasInstaAccount`
--

DROP TABLE IF EXISTS `CastHasInstaAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CastHasInstaAccount` (
  `cast_id` int NOT NULL,
  `username` char(20) NOT NULL,
  PRIMARY KEY (`cast_id`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `casthasinstaaccount_ibfk_1` FOREIGN KEY (`cast_id`) REFERENCES `CastMember` (`cast_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `casthasinstaaccount_ibfk_2` FOREIGN KEY (`username`) REFERENCES `Instagram` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CastHasInstaAccount`
--

LOCK TABLES `CastHasInstaAccount` WRITE;
/*!40000 ALTER TABLE `CastHasInstaAccount` DISABLE KEYS */;
INSERT INTO `CastHasInstaAccount` VALUES (2418,'_jasminenguyen'),(2423,'a.v.o.n.l.e.a'),(2416,'alayahbenavidez'),(2417,'alexaraecaves'),(6,'ashley_iaconetti'),(2304,'caelynnmillerkeyes'),(2301,'cassie randolph'),(2300,'coltonunderwood'),(2420,'courtneyperry'),(2413,'deandrakanu'),(2309,'demi_not_lovato'),(2424,'euniceashlee'),(2430,'flywithmegan_'),(2401,'hannahann'),(2302,'hannahg11'),(2306,'heatherm22'),(2421,'itslaurenamanda'),(2425,'jade.gilliland'),(7,'jaredhaibon'),(2426,'jennafromtheblockk_'),(2308,'katieemo'),(2427,'kbadowski'),(2405,'kelleyflanagan'),(2404,'kelsey_weier'),(2414,'kiarranorman'),(2305,'kirpasudick'),(2428,'kylieramos'),(2411,'lexireeed'),(2402,'madiprew'),(2429,'maurissagunn'),(2407,'mykennajean'),(2406,'natashajp'),(2422,'paytonmoran'),(2419,'sarah.coffin'),(2415,'savannahmullins'),(2412,'shiannjanay'),(2310,'sydneylotuaco'),(2408,'sydneynicolehigh'),(2409,'tammykayly'),(2303,'tayshiaa'),(2410,'victorianpaul'),(2403,'vlfuller');
/*!40000 ALTER TABLE `CastHasInstaAccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CastInRelationship`
--

DROP TABLE IF EXISTS `CastInRelationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CastInRelationship` (
  `member1_id` int NOT NULL,
  `member2_id` int NOT NULL,
  `status` char(20) NOT NULL,
  PRIMARY KEY (`member1_id`,`member2_id`,`status`),
  KEY `member2_id` (`member2_id`),
  KEY `status` (`status`),
  CONSTRAINT `castinrelationship_ibfk_1` FOREIGN KEY (`member1_id`) REFERENCES `CastMember` (`cast_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `castinrelationship_ibfk_2` FOREIGN KEY (`member2_id`) REFERENCES `CastMember` (`cast_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `castinrelationship_ibfk_3` FOREIGN KEY (`status`) REFERENCES `Relationship` (`status`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CastInRelationship`
--

LOCK TABLES `CastInRelationship` WRITE;
/*!40000 ALTER TABLE `CastInRelationship` DISABLE KEYS */;
INSERT INTO `CastInRelationship` VALUES (6,7,'married'),(100,101,'broken engagement'),(100,102,'broken up'),(100,103,'broken up'),(2000,2001,'broken engagement'),(2100,2101,'broken engagement'),(2200,2202,'married'),(2300,2301,'dating'),(2400,2401,'broken engagement'),(2400,2402,'broken up'),(2400,2405,'dating'),(100,990100,'broken up'),(2200,991400,'broken engagement');
/*!40000 ALTER TABLE `CastInRelationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CastMember`
--

DROP TABLE IF EXISTS `CastMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CastMember` (
  `cast_id` int NOT NULL AUTO_INCREMENT,
  `name` char(20) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `hometown` char(20) DEFAULT NULL,
  `occupation` char(50) DEFAULT NULL,
  PRIMARY KEY (`cast_id`)
) ENGINE=InnoDB AUTO_INCREMENT=991762 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CastMember`
--

LOCK TABLES `CastMember` WRITE;
/*!40000 ALTER TABLE `CastMember` DISABLE KEYS */;
INSERT INTO `CastMember` VALUES (6,'Ashley Iaconetti',26,'Great Falls, VA','Journalist'),(7,'Jared Haibon',26,'Warwick, RI','Restaurant Manager'),(100,'Alex Michel',31,'Charlottesville, VA','Management Consultant'),(101,'Amanda Marsh',23,'Chanute, KS','Event Planner'),(102,'Shannon Oliver',24,'Dallas, TX','Financial Management Consultant'),(103,'Kim',24,'Tempe, AZ','Nanny'),(200,'Aaron Buerge',28,'Butler, Missouri','Bank Owner'),(300,'Andrew Firestone',28,'Santa Barbara, CA','Sales Manager'),(400,'Bob Guiney',32,'Riverview, MI','Mortgage Broker'),(500,'Jesse Palmer',25,'Toronto, Canada','Former Football Player'),(600,'Byron Velvick',39,'Downey, California','Pro Bass Fisherman'),(700,'Charlie O Connell',30,'New York, NY','Actor'),(800,'Travis Lane Stork',34,'Fort Collins, CO','Doctor'),(900,'Lorenzo Borghese',39,'Milan, Italy','Entrepreneur'),(1000,'Andy Baldwin',30,'Lancaster, PA','Physician'),(1100,'Brad Womack',34,'Austin, TX','Winemaker'),(1200,'Matt Grant',27,'London, UK','Financier'),(1300,'Jason Mesnick',32,'Cleveland, OH','Account Executive'),(1400,'Jake Pavelka',31,'Dallas, TX','Pilot'),(1600,'Ben Flajnik',28,'Sonoma, California','Winemaker'),(1700,'Sean Lowe',28,'Arlington, TX','Reality TV Contestant'),(1800,'Juan Pablo Galavis',32,'Ithaca, New York','Pro Soccer Player'),(1900,'Chris Soules',33,'Arlington, Iowa','Farmer'),(2000,'Ben Higgins',26,'Warsaw, IN','Software Sales'),(2001,'Lauren Bushnell',25,'West Linn, Oregon','Flight Attendant'),(2003,'Caila Quinn',24,'Hudson, Ohio','Sales Representative'),(2004,'Amanda Stanton',25,'Santa Margarita, CA','Esthetician'),(2005,'Becca Tilley',26,'Shreveport, LA','Chiropractic Assistant'),(2006,'Emily Ferguson',23,'Las Vegas, Nevada','Waitress'),(2007,'Lauren Himle',25,'Dexter, Michigan','Kindergarten Teacher'),(2008,'Olivia Caridi',23,'Bristol, Virginia','Former News Anchor'),(2010,'Jennifer Saviano',25,'Lauderdale Lakes, FL','Small Business Owner'),(2011,'Jubilee Sharpe',24,'Fort Lauderdale, FL','War Veteran'),(2012,'Amber James',30,'Kankakee, Illinois','Bartender'),(2013,'Rachel Tchen',23,'Little Rock, AK','Unemployed'),(2014,'Haley Ferguson',23,'Las Vegas, Nevada','Waitress'),(2015,'Jami Letain',23,'St. Albert, Alberta','Bartender'),(2016,'Shushanna Mkrtychyan',27,'Salt Lake City, UT','Mathematician'),(2017,'Lace Morris',25,'Denver, Colorado','Real Estate Agent'),(2018,'Amanda Kremer',28,'Portland, Oregon','Dentist'),(2019,'Jacqueline Dion',23,'Newport Beach, CA','Gerontologist'),(2020,'Samantha Passmore',26,'New Smyrna Beach, FL','Attorney'),(2021,'Lauren \"LB\"\" Barr\"',23,'Stillwater, OK','Fashion Buyer'),(2022,'Breanne Rice',30,'Seattle, WA','Nutritional Therapist'),(2023,'Izzy Goodkind',24,'Branford, CT','Graphic Designer'),(2024,'Jessica Moser',23,'Boca Raton, FL','Accountant'),(2025,'Laura Esselman',24,'Louisville, Kentucky','Account Executive'),(2026,'Lauren Russell',26,'Houston, Texas','Math Teacher'),(2027,'Maegan Miller',30,'Visalia, CA','Cowgirl'),(2028,'Tiara Soleim',27,'Redmond, WA','Chicken Enthusiast'),(2100,'Nick Viall',36,'Waukesha, WI','Software Sales Exec'),(2101,'Vanessa Grimaldi',29,'Montreal, Quebec','Special Education Teacher'),(2102,'Whitney Fransway',25,'Chanhassen, MN','Pilates Instructor'),(2103,'Raven Gates',25,'Hoxie, Arkansas','Fashion Boutique Owner'),(2104,'Jasmine Goode',29,'Maplewood, NJ','Pro Basketball Dancer'),(2105,'Brittany Farrar',26,'Santa Monica, CA','Travel Nurse'),(2106,'Jaimi King',28,'New Orleans, LA','Chef'),(2108,'Astrid Loch',26,'Tampa, Florida','Office Manager'),(2109,'Danielle Lombard',27,'Danville, CA','Small Business Owner'),(2110,'Danielle Maltby',31,'Colgate, Wisconsin','Neonatal Nurse'),(2111,'Lacey Mark',25,'Towaco, NJ','Digital Marketing Manager'),(2112,'Hailey Merkt',23,'Vancouver, BC','Photographer'),(2113,'Taylor Nolan',23,'Seattle, WA','Mental Health Counselor'),(2114,'Corinne Olympios',24,'Miami, Florida','Business Owner'),(2115,'Kristina Schulman',24,'Lexington, Kentucky','Dental Hygienist'),(2116,'Josephine Tutman',24,'Santa Cruz, CA','Unemployed Nurse'),(2117,'Sarah Vendal',26,'Palmdale, CA','Grade School Teacher'),(2118,'Alexis Waters',23,'Secaucus, New Jersey','Aspiring Dolphin Trainer'),(2119,'Elizabeth Whitelaw',24,'New Trier, Illinois','Marketing Manager'),(2120,'Christen Whitney',25,'Martinsville, IN','Wedding Videographer'),(2121,'Liz Sandoz',29,'Scottsbluff, NE','Doula'),(2122,'Angela Amezcua',26,'Cumberland, Maryland','Model'),(2123,'Jasmine Brown',25,'Tacoma, WA','Flight Attendant'),(2124,'Olivia Burnette',25,'Anchorage, Alaska','Apparel Sales Representative'),(2125,'Ida Marie DeLosSant',23,'Harlingen, Texas','Sales Manager'),(2126,'Briana Guertler',28,'Salt Lake City, UT','Surgical Unit Nurse'),(2127,'Lauren Hussey',30,'Naples, Florida','Law School Graduate'),(2128,'Susannah Milan',26,'San Diego, CA','Account Manager'),(2129,'Michelle Ramkissoon',24,'Los Angeles, CA','Food Truck Owner'),(2130,'Dominique Alexis',25,'Los Angeles, CA','Restaurant Server'),(2200,'Arie Luyendyk Jr',36,'Scottsdale, AZ','Real Estate Agent'),(2202,'Lauren Burnham',25,'Virginia Beach, VA','Technology Salesperson'),(2203,'Kendall Long',26,'Santa Clarita, CA','Creative Director'),(2204,'Tia Booth',26,'Weiner, Arkansas','Physical Therapist'),(2205,'Bekah Martinez',22,'Fresno, CA','Nanny'),(2206,'Seinne Fleming',27,'Long Beach, CA','Real Estate Agent'),(2207,'Jacqueline Trumbull',26,'Morgantown, WV','Research Coordinator'),(2208,'Chelsea Roy',29,'South Portland, ME','Executive Assistant'),(2209,'Jenna Cooper',28,'Raleigh, NC','Social Media Manager'),(2210,'Krystal Nielson',30,'Missoula, Montana','Fitness Coach'),(2211,'Ashley Luebke',25,'West Palm Beach, FL','Real Estate Agent'),(2212,'Maquel Cooper',23,'American Fork, Utah','Photographer'),(2213,'Marikh Mathias',27,'Salt Lake City, Utah','Restaurant Owner'),(2214,'Brittany Taylor',30,'Belton, SC','Tech Recruiter'),(2215,'Caroline Lunny',26,'Holliston, MA','Realtor'),(2216,'Bibiana Julian',30,'Miami, Florida','Executive Assistant'),(2217,'Annaliese Puccini',32,'San Mateo, CA','Event Designer'),(2218,'Lauren Schleyer',31,'Dallas, Texas','Social Media Manager'),(2219,'Jenny Delaney',25,'Northbrook, Illinois','Graphic Designer'),(2220,'Lauren Griffin',26,'Indianapolis, IN','Executive Recruiter'),(2221,'Valerie Biles',26,'Nashville, Tennessee','Server'),(2222,'Ali Harrington',27,'Lawton, Oklahoma','Personal Stylist'),(2223,'Amber Wilkerson',29,'Denver, Colorado','Business Owner'),(2224,' Bri Amaranthus',25,'Grants Pass, Oregon','Sports Reporter'),(2225,'Brittane Johnson',27,'San Diego, CA','Marketing Manager'),(2226,'Jessica Carroll',26,'Calgary, AB','Television Host'),(2227,'Lauren Jarreau',33,'New Roads, Louisiana','Recent Master\'s Graduate'),(2229,'Olivia Goethals',23,'Geneseo, Illinois','Marketing Associate'),(2300,'Colton Underwood',24,'Washington, IL','Former Pro Football Player'),(2301,'Cassie Randolph',23,'Walnut Creek, CA','Speech Pathologist'),(2302,'Hannah Godwin',23,'Hoover, Alabama','Content Creator'),(2303,'Tayshia Adams',28,'Santa Ana, CA','Phlebotomist'),(2304,'Caelynn Miller-Keyes',23,'Asheville, NC','Miss North Carolina USA 2018'),(2305,'Kirpa Sudick',26,'Whittier, California','Dental Hygienist'),(2306,'Heather Martin',23,'Carlsbad, California','Assistant Program Manager'),(2308,'Katie Morton',26,'Oviedo, Florida','Medical Sales Representative'),(2309,'Demi Burnett',23,'Red Oak, Texas','Interior Designer'),(2310,'Sydney Lotuaco',27,'Virginia Beach, VA','NBA Dancer'),(2311,'Nicole Lopez-Alvar',25,'Miami, Florida','Social Media Coordinator'),(2312,'Onyeka Ehie',24,'Manhattan, Kansas','IT Risk Consultant'),(2313,'Elyse Dehlbom',31,'Soldotna, Alaska','Makeup Artist'),(2314,'Courtney Curtis',23,'McDonough, Georgia','Caterer'),(2315,'Tracy Shapoff',31,'Rochester, New York','Wardrobe Stylist'),(2317,'Catherine Agro',26,'Fort Lauderdale, FL','DJ'),(2318,'Nina Bartula',30,'Raleigh, NC','Sales Account Manager'),(2319,'Caitlin Clemmens',25,'Toronto, Ontario','Realtor'),(2320,'Alex Blumberg',29,'Vancouver, BC','Dog Rescuer'),(2321,'Angelique Sherman',28,'Hamilton, New Jersey','Marketing Salesperson'),(2322,'Annie Reardon',23,'Mequon, Wisconsin','Financial Associate'),(2323,'Erika McNutt',25,'Encinitas, CA','Recruiter'),(2324,'Alex Dillon',23,'Boston, MA','Account Manager'),(2325,'Devin Gooden',23,'Atlanta, Georgia','Broadcast Journalist'),(2326,'Erin Landry',28,'Plano, Texas','Human Resources Manager'),(2328,'Laura Pellerito',26,'Dallas, Texas','Accountant'),(2329,'Revian Chang',24,'Austin, Texas','Nurse'),(2330,'Tahzjuan Hawkins',25,'Castle Pines, CO','Business Development Associate'),(2400,'Peter Weber',28,'Westlake Village, CA','Pilot'),(2401,'Hannah Ann Sluss',23,'Powell, TN','Model'),(2402,'Madison Prewett',23,'Auburn, AL','Foster parent recruiter'),(2403,'Victoria Fuller',26,'Virginia Beach, VI','Medical Sales Rep'),(2404,'Kelsey Weier',28,'Urbandale, IA','Professional Clothier'),(2405,'Kelley Flanagan',27,'North Barrington, IL','Attorney'),(2406,'Natasha Parker',31,'New York, NY','Event Planner'),(2407,'Mykenna Dorn',22,'CANADA','Fashion Blogger'),(2408,'Sydney Hightower',24,'Northport, AL','Retail Marketing Manager'),(2409,'Tammy Ly',24,'Syracuse, NY','House Flipper'),(2410,'Victoria Paul',27,'Alexandria, LA','Nurse'),(2411,'Lexi Buchanan',26,'Jacksonville, FL','Marketing Coordinator'),(2412,'Shiann Lewis',27,'Las Vegas, NV','Administrative Assistant'),(2413,'Deandra Kanu',23,'Bar Harbor, ME','Home Care Coordinator'),(2414,'Kiarra Norman',23,'Kennesaw, GA','Nanny'),(2415,'Savannah Mullins',27,'Houston, TX','Realtor'),(2416,'Alayah Benavidez',24,'Helotes, TX','Orthodontist Assistant'),(2417,'Alexa Caves',27,'Springfield, IL','Esthetician'),(2418,'Jasmine Nguyen',25,'Houston, TX','Client Relations Manager'),(2419,'Sarah Coffin',24,'Knoxville, TN','Medical Radiographer'),(2420,'Courtney Perry',26,'Venice, FL','Cosmetologist'),(2421,'Lauren Jones',26,'Glendale, CA','Marketing Executive'),(2422,'Payton Moran',24,'Wellesley, MA','Business Development Rep'),(2423,'Avonlea Elkins',27,'Fort Worth, TX','Cattle Rancher'),(2424,'Eunice Cho',23,'Chicago, IL','Flight Attendant'),(2425,'Jade Gilliland',26,'Mesa, AZ','Flight Attendant'),(2426,'Jenna Serrano',22,'New Lenox, IL','Nursing Student'),(2427,'Katrina Badowski',28,'St. Charles, IL','Pro NBA Dancer'),(2428,'Kylies Ramos',26,'Davis, CA','Sales Associate'),(2429,'Maurissa Gunn',23,'Laurel, MT','Care Coordinator'),(2430,'Megan Hops',26,'San Bruno, CA','Flight Attendant'),(990100,'Trista Rehn',29,'Miami, FL','Miami Heat Dancer'),(990101,'Charlie Maher',28,'Hermosa Beach, CA','Financial Analyst'),(990102,'Russ',30,'San Rafael, CA','Writer'),(990103,'Greg T.',28,'Manhattan, NY','Importer'),(990104,'Jamie Blyth',27,'Chicago, IL','Pro Basketball Player'),(990105,'Mike',24,'Cincinnati, Ohio','Consulting'),(990106,'Rob',29,'Dallas, Texas','Computer Programmer'),(990107,'Brian C.',28,'Dallas, Texas','Mortgage Broker'),(990108,'Brian S.',28,'Dallas, Texas','Sales Engineer'),(990109,'Brook',29,'Dallas, Texas','Rodeo Cowboy'),(990110,'Jack',27,'Pepper Pike, Ohio','Firefighter'),(990111,'Jeff',25,'San Diego, CA','Pro Football Player'),(990112,'Josh',31,'Boca Raton, FL','Radio Advertising Executive'),(990113,'Brian H.',30,'Cleveland, Ohio','Sales Manager'),(990114,'Billy',28,'Hermosa Beach, CA','Firefighter'),(990115,'Brian K.',31,'San Francisco, CA','Breast Implant Sales'),(990116,'Chris',35,'Sugarloaf, PA','Vice President'),(990117,'Duane',28,'Chisago City, MN','Flight Instructor'),(990118,'Eric',33,'St. Louis, Missouri','Commercial Pilot'),(990119,'Gregg H.',34,'Freehold, NJ','Business Owner'),(990120,'Matt',42,'Marina Del Rey, CA','Gym Owner'),(990121,'Paul',26,'Honolulu, Hawaii','Telecommunications'),(990122,'Peter',25,'Long Island, NY','Construction Business Owner'),(990123,'Wayne',37,'Sacramento, CA','Commercial Pilot'),(990144,'Ryan Sutter',29,'Vail, CO','Firefighter'),(990200,'Meredith Phillips',28,'Beaverton, Oregon','make-up artist'),(990201,'Matthew Hickl',28,'Friendswood, TX','Pharmaceutical Sales'),(990202,'Chad',31,'Buffalo, NY','Pharmaceutical Sales'),(990203,'Lanny',26,'Aubrey, Texas','Stallion and Breeding Manager'),(990204,'Brad',29,'Grand Rapids, MI','Pharmaceutical Sales Rep'),(990205,'Ryan M.',30,'Santa Barbara, CA','Financial Advisor'),(990206,'Sean',31,'Wall, NJ','CPA'),(990207,'Rick',29,'San Diego, CA','Business Manager'),(990208,'Ryan R.',29,'Wynola, CA','Sales/Marketing'),(990209,'Todd',36,'San Francisco, CA','Options Trader'),(990210,'Damon',28,'Cardiff, CA','Arena Football Player'),(990211,'Eliot',25,'Mountain View, CA','Options Trader'),(990212,'Harold Hersh',29,'Rock Island, IL','Pro Hockey Player'),(990213,'Marcus',26,'Los Angeles, CA','Personal Trainer'),(990214,'Robert',32,'El Segundo, CA','Alliance Development'),(990215,'Aaron',32,'Sacramento, CA','Title and Escrow Sales'),(990216,'Andy Chang',33,'Dallas, Texas','Dentist'),(990217,'Anselm Clinard',32,'Venice, CA','Art Designer'),(990218,'Brian',31,'Quincy, MA','Attorney'),(990219,'Chris',31,'Boston, MA','Accountant'),(990220,'Cory Higgins',24,'Long Beach Isl, NJ','Small Business Owner'),(990221,'Jeff O\'Quinn',30,'Macon, Georgia','Pharmaceutical Sales Rep'),(990222,'Justin',25,'Orlando, FL','Pro Baseball Player'),(990223,'Keith',31,'Baltimore, Maryland','Financial Analyst'),(990224,'Trever',35,'North Wales, PA','Restaurateur'),(990299,'Ian McKee',29,'New York, NY','Equity Research Sales'),(990300,'Jennifer Scheft',30,'Mentor, Ohio','Publicist'),(990400,'Deanna Pappas',27,'Marietta, Georgia','Real Estate Agent'),(990401,'Jeremy Anderson',30,'Dallas, Texas','Real estate attorney'),(990402,'Graham Bunn',29,'Raleigh, NC','Pro basketball player'),(990403,'Sean Ramey',33,'Louisville, Kentucky','Martial artist'),(990404,'Blaine Twilley',33,'Tulsa, Oklahoma','Debt manager'),(990405,'Brian Westendorf',31,'Balch Springs, Texas','High school football coach'),(990406,'Fred Greif',30,'Skokie, IL','Lawyer'),(990407,'Robert Fair',28,'San Francisco, CA','Chef'),(990408,'Paul Brosseau',23,'Bonnyville, Alberta','Sales manager'),(990409,'Ronald Mayer',36,'Greeley, CO','Barber shop owner'),(990410,'Richard Mathy',27,'Sauquoit, NY','Science teacher'),(990411,'Christopher Bradshaw',29,'Fort Worth, Texas','Medical sales rep.'),(990412,'Eric Papachristos',32,'Boston, MA','Senior analyst'),(990413,'Ryan Hoag',28,'Minneapolis, MN','Pro football player'),(990414,'Brian Winchester',29,'New Castle, Indiana','Computer network consultant'),(990415,'Chandler Fulton',25,'Virginia Beach, VA','Insurance rep.'),(990416,'Donato Capodanno',26,'Lexington, SC','Sales rep.'),(990417,'Greg Matthew',28,'Rockport, MA','Personal trainer'),(990418,'Jeffrey Harris',27,'Miami, FL','Mathematics teacher'),(990419,'Jon Konkel',35,'Williston, ND','Resort manager'),(990420,'Luke Hamilton',27,'Faith, NC','Oyster farmer'),(990421,'Patrick Carlson',26,'Glenwood, IL','Financial analyst'),(990422,'Patrick Durrere',27,'Elmhurst, IL','Internet marketing'),(990423,'Spero Stamboulis',38,'Ellington, CT','Actor'),(990499,'Jesse Csincsak',26,'Breckenridge, CO','Pro snowboarder'),(990500,'Jillian Harris',29,'Peace River, Canada','Interior Designer'),(990524,'Ed Swiderski',29,'Monroe, MI','Technology Consultant'),(990525,'Kiptyn Locke',31,'Encinitas, CA','Business Developer'),(990526,'Reid Rosenthal',30,'Upper Dublin, PA','Realtor'),(990527,'Wes Hayden',32,'Huntsville, Texas','Musician'),(990528,'Jesse Kovacs',27,'Carmel Valley, CA','Wine Maker'),(990529,'Michael Stagliano',25,'Tacoma, Washington','Break Dance Instructor'),(990530,'Tanner Pope',30,'Brownfield, Texas','Financial Analyst'),(990531,'Robby Descant',25,'Spring, Texas','Bartender'),(990532,'Mark Huebner',26,'Woodstock, IL','Pizza Entrepreneur'),(990533,'David Good',27,'West Alexandria, OH','Trucking Contractor'),(990535,'Mike Steinberg',28,'New York, NY','Baseball Camp Owner'),(990536,'Brad Seberhagen',27,'Park Ridge, IL','Financial Advisor'),(990537,'Tanner Fanello',28,'Derby, Kansas','Sales Rep'),(990538,'Sasha Petrovic',27,'Houston, Texas','Consultant'),(990539,'Brian Duke',32,'Birmingham, AL','IT Consultant'),(990540,'Julien Hug',34,'San Diego, CA','Restaurateur'),(990541,'Mathue Johnson',25,'Andover, Kansas','Personal Trainer'),(990542,'Simon Ambrose',26,'Bradford, England','Soccer Coach'),(990543,'Adam Duvendeck',27,'Santa Barbara, CA','Olympic Cyclist'),(990544,'Bryan Vaderman',28,'Lawton, Oklahoma','High School Coach'),(990545,'Bryce Harlow',31,'Fort Lauderdale, FL','Furniture Dealer'),(990546,'Caleb Kuhl',27,'Kansas City, MO','Photographer'),(990547,'Greg Bilbro',31,'Albuquerque, NM','Entrepreneur'),(990548,'John Hardesty',27,'Boise, Idaho','Branding Consultant'),(990549,'John Presser',29,'Fort Wayne, Indiana','Marketing Specialist'),(990550,'Josh Yocam',25,'Tustin, CA','Lifeguard'),(990551,'Kyle Yauch',26,'Austin, Texas','Graphic Designer'),(990552,'Stephen Reich',30,'Lexington, MA','Lawyer'),(990600,'Ali Fedotowsky',25,'Williamstown, MA','Account Manager'),(990601,'Chris Lambton',33,'Dennis, MA','Landscaper'),(990602,'Frank Neuschaefer',31,'Bartlett, IL','Retail Manager'),(990603,'Kirk DeWindt',27,'Green Bay, Wisconsin','Sales Consultant'),(990604,'Ty Brown',31,'Booneville, MS','Medical Sales'),(990605,'Craig Robinson',27,'Langhorne, PA','Lawyer'),(990606,'Justin Rego',26,'Toronto, Ontario','Pro Wrestler'),(990607,'Chris Nordhorn',29,'Winter Park, FL','Entrepreneur'),(990608,'Kasey Kahl',27,'Fresno, CA','Advertising Account Executive'),(990609,'Jesse Beck',24,'Peculiar, Missouri','General Contractor'),(990610,'Jonathan Novack',30,'Boston, MA','Weatherman'),(990611,'John Crivello',32,'Mukilteo, Washington','Business Development'),(990612,'Steve Kocsis',28,'Chesterland, Ohio','Sales Rep'),(990615,'Craig McKinnon',34,'Sarnia, Ontario','Dental Sales'),(990616,'Tyler Vermette',25,'Chelsea, Vermont','Online Advertising'),(990617,'Derek',28,'Warren, MI','Sales Manager'),(990618,'Derrick Schuster',27,'Manhattan Beach, CA','Construction Engineer'),(990619,'Jason Whitehead',27,'Johnson City, TN','Construction Consultant'),(990621,'John N.',27,'Wichita, Kansas','Software Sales'),(990622,'Kyle Higgins',26,'Highlands Ranch, CO','Outdoorsman'),(990623,'Phil Kayden',30,'Elmore, Ohio','Investment Manager'),(990624,'Tyler Morrow',25,'Helena, Montana','Catering Manager'),(990699,'Roberto Martinez',26,'Tampa, FL','Insurance Agent'),(990700,'Ashley Hebert',26,'Madawaska, Maine','Dentist'),(990725,'J.P. Rosenbaum',34,'Roslyn, NY','Construction Manager'),(990726,'Ben Flajnik',28,'Sonoma, CA','Wine Maker'),(990727,'Constantine Tzortzis',30,'Cumming, Georgia','Restaurant Owner'),(990728,'Ames Brown',31,'Chadds Ford, PA','Portfolio Manager'),(990729,'Lucas Daniels',30,'Odessa, Texas','Equipment Distributor'),(990730,'Ryan Park',31,'San Luis Obispo, CA','Solar Energy Executive'),(990733,'Nick Peterson',26,'Odessa, FL','Personal Trainer'),(990734,'William Holman',30,'Fostoria, Ohio','Cell Phone Sales'),(990737,'Chris Drish',25,'Moline, IL','Sports Marketing'),(990738,'Jeff Medolla',35,'St. Louis, Missouri','Entrepreneur'),(990739,'Bentley Williams',28,'Alpine, Utah','Businessman'),(990740,'Matt Colombo',28,'Bridgewater, MA','Office Supply Sales'),(990741,'Ryan Miller',27,'Novi, MI','Constructor Estimator'),(990743,'Anthony Santucci',28,'Saddle River, NJ','Butcher'),(990744,'Chris Malhomme',27,'Gibbons, Alberta','Construction Company CEO'),(990745,'Frank Carpenter',29,'Anchorage, Alaska','Admissions Director'),(990748,'Rob Dahm',27,'Monroe, MI','Technology Executive'),(990749,'Tim McCormack',35,'Massapequa, NY','Liquor Distributor'),(990800,'Emily Maynard',25,'Charlotte, NC','Event Planner'),(990850,'Jef Holm',27,'St. George, Utah','Entrepreneur'),(990851,'Chris Bukowski',25,'Chicago, IL','Sales Director'),(990853,'Doug Clerget',33,'Tacoma, Washington','Real Estate Agent'),(990854,'Ryan Bowers',31,'Evans, Georgia','Pro Sports Trainer'),(990855,'Travis Pope',30,'Madison, Mississippi','Advertising Sales Rep'),(990856,'Alejandro Velez',25,'San Francisco, CA','Mushroom Farmer'),(990857,'Kalon McMahon',27,'Houston, Texas','Luxury Brand Consultant'),(990858,'Charlie Grogan',32,'Worcester, MA','Recruiter'),(990859,'Michael Nance',26,'Austin, Texas','Rehab Counselor'),(990860,'Nathan Baake',25,'Casa Grande, Arizona','Accountant'),(990861,'Stevie Alberino',26,'Monroe Township, NJ','Party M.C.'),(990862,'Alessandro Goulart',30,'Saint Paul, MN','Grain Merchant'),(990863,'Tony Pieper',31,'Beaverton, Oregon','Lumber Trader'),(990865,'Kyle Dillon',29,'Long Beach, CA','Financial Adviser'),(990866,'Joe Gendreau',27,'Orlando, FL','Field Energy Adviser'),(990867,'Brent Richter',41,'Midland, Texas','Technology Sales'),(990869,'Jackson Longnecker',29,'Lockport, IL','Fitness Model'),(990870,'Jean-Paul LaCount',35,'Moraga, CA','Marine Biologist'),(990871,'Lerone Anu',29,'Laguna Beach, CA','Real Estate Consultant'),(990872,'Randy Lee Woyak',30,'Oak Creek, WI','Marketing Manager'),(990900,'Desiree Hartstock',27,'Northglenn, CO','Bridal Stylist'),(990901,'Drew Kenney',27,'Scottsdale, Arizona','Marketing Analyst'),(990902,'Brooks Forester',28,'Blackfoot, Idaho','Sales & Marketing'),(990903,'Zak Waddell',31,'Dallas, Texas','Drilling Fluid Engineer'),(990904,'Michael Garofola',33,'Lindenhurst, NY','Federal Prosecutor'),(990905,'James Case',27,'Marietta, Georgia','Advertising Executive'),(990906,'Kasey Stewart',29,'Tulsa, Oklahoma','Advertising Executive'),(990907,'Mikey Tenerelli',30,'Glen Ellyn, IL','Plumbing Contractor'),(990908,'Ben Scott',28,'Lubbock, Texas','Entrepreneur'),(990909,'Bryden Vukasin',26,'Havre, Montana','Iraq War Veteran'),(990910,'Zack Kalter',28,'Phillips Ranch, CA','Book Publisher'),(990911,'Brad McKinzie',27,'Denver, CO','Accountant/DJ'),(990912,'Brandon Andreen',26,'Blaine, MN','Painting Contractor'),(990913,'Dan Cox',30,'Dublin, CA','Beverage Sales Director'),(990914,'Brian Jarosinski',29,'Olney, Maryland','Financial Advisor'),(990915,'Nick Mucci',27,'Rochester, NY','Investment Adviser'),(990916,'Robert Graham',30,'Glendale, Arizona','Advertising Entrepreneur'),(990918,'Diogo Custodio',29,'Penha, Brazil','Ski Resort Manager'),(990920,'Micah',32,'Detroit Lakes, MN','Law Student'),(990921,'Mike',28,'London, England','Dental Student'),(990999,'Chris Siegfried',27,'McMinnville, Oregon','Mortgage Broker'),(991000,'Andi Dorfman',26,'Fulton County, GA','Attorney'),(991024,'Josh Murray',29,'Athens, Georgia','Former Pro Baseball Player'),(991026,'Brian Osborne',27,'Camp Hill, PA','Basketball Coach'),(991027,'Dylan Petitt',26,'Longmeadow, MA','Accountant'),(991028,'J.J. O\'Brien',30,'Hanover, MA','Pantsapreneur'),(991029,'Cody Sattler',28,'Oakley, Kansas','Personal Trainer'),(991030,'Andrew Poole',30,'Portola Valley, CA','Social Media Marketer'),(991031,'Marquel Martin',26,'Rialto, CA','Sponsorship Sales'),(991032,'Patrick Jagodzinski',29,'Clinton, NJ','Advertising Executive'),(991033,'Tasos Hernandez',30,'Denver, CO','Wedding Event Coordinator'),(991034,'Eric Hill',31,'Citrus Heights, CA','Explorer'),(991035,'Bradley Wisk',32,'Grosse Pointe, MI','Opera Singer'),(991036,'Brett Melnick',29,'Warminster, PA','Hairstylist'),(991037,'Ron Worrell',28,'Nahariya, Israel','Beverage Sales Manager'),(991038,'Carl King',30,'Hollywood, CA','Firefighter'),(991039,'Craig Muhlbauer',29,'Defiance, Iowa','Tax Accountant'),(991040,'Nick Sutter',27,'Barrington, IL','Pro Golfer'),(991041,'Emil Schaffroth',33,'Portland, Oregon','Helicopter Pilot'),(991043,'Josh Bauer',29,'Evergreen, CO','Telecommunication Marketer'),(991044,'Mike Campanelli',29,'Guilderland, NY','Bartender'),(991045,'Rudie Dane',31,'Yorba Linda, CA','Attorney'),(991046,'Steven Woolworth',30,'Meadow Vista, CA','Snowboard Product Developer'),(991100,'Kaitlyn Bristowe',29,'Vancouver, Canada','Dance Instructor'),(991147,'Shawn Booth',28,'Windsor Locks, CT','Personal Trainer'),(991149,'Joe Bailey',28,'Glasgow, Kentucky','Insurance Agent'),(991150,'Chris Strandburg',28,'Granite Bay, CA','Dentist'),(991152,'Tanner Tolbert',28,'Stilwell, Kansas','Auto Finance Manager'),(991153,'J.J. Lane III',32,'Dacono, CO','Former Investment Banker'),(991154,'Joshua Albers',31,'Kuna, Idaho','Industrial Welder'),(991155,'Justin Reich',28,'Elgin, IL','Fitness Trainer'),(991156,'Ian Thomson',28,'Ramsey, NJ','Executive Recruiter'),(991157,'Corey Stansell',30,'New York, NY','Investment Banker'),(991158,'Jonathan Holloway',33,'Sylvan Lake, MI','Automotive Spokesman'),(991159,'Ryan Beckett',32,'Wellington, FL','Realtor'),(991160,'Clint Arlis',27,'Batavia, IL','Architectural Engineer'),(991161,'Tony Harris',35,'St. Louis, Missouri','Healer'),(991162,'Cory Shivar',35,'Seven Springs, NC','Residential Developer'),(991163,'Daniel Finney',28,'Nashville, TN','Fashion Designer'),(991164,'Kupah James',32,'Boston, MA','Entrepreneur'),(991165,'Bradley Cox',25,'Duluth, Georgia','International Auto Shipper'),(991166,'David',28,'Orlando, FL','Real Estate Agent'),(991167,'Josh Seiter',27,'Chicago, IL','Law Student/Exotic Dancer'),(991168,'Shawn Evans',31,'London, Ontario','Amateur Sex Coach'),(991169,'Brady Toops',33,'Wauseon, Ohio','Singer/Songwriter'),(991170,'Ryan McDill',28,'Kansas City, MO','Junkyard Specialist'),(991200,'JoJo Fletcher',24,'Dallas, Texas','Real Estate Developer'),(991201,'Brandon Howell',28,'Marysville, WA','Hipster'),(991202,'James Spadafore',27,'Phoenix, Arizona','Bachelor Superfan'),(991203,'Will Haduch',26,'Jersey City, NJ','Civil Engineer'),(991204,'Coley Knust',27,'Chicago, IL','Real Estate Consultant'),(991205,'Jake Patton',26,'Playa Vista, CA','Landscape Architect'),(991206,'Jonathan Hamilton',29,'Vancouver, BC','Technical Sales Rep'),(991207,'Nick Sharp',26,'San Francisco, CA','Software Sales'),(991208,'Peter Medina',26,'Rockdale, IL','Staffing Agency Manager'),(991209,'Sal DeJulio',28,'Hubbard, Ohio','Operations Manager'),(991271,'Jordan Rodgers',27,'Chico, CA','Former Pro Quarterback'),(991272,'Robby Hayes',27,'St. Augustine, FL','Former Competitive Swimmer'),(991273,'Chase McNary',27,'Castle Rock, CO','Medical Sales Rep'),(991274,'Luke Pell',31,'Burnet, Texas','War Veteran'),(991275,'James Taylor',29,'Katy, Texas','Singer-Songwriter'),(991276,'Alex Woytkiw',25,'Oceanside, CA','U.S. Marine'),(991277,'Derek Peth',29,'Waverly, Iowa','Commercial Banker'),(991278,'Wells Adams',31,'Monterey, CA','Radio DJ'),(991279,'Evan Bass',33,'Hartford, CT','Erectile Dysfunction Specialist'),(991280,'Grant Kemp',27,'San Francisco, CA','Firefighter'),(991281,'Vinny Ventiera',28,'Kings Park, NY','Barber'),(991282,'Daniel Maguire',31,'Lions Bay, BC','Male Model'),(991283,'James Fuertes',34,'Franklin, TN','Boxing Club Owner'),(991284,'Chad Johnson',28,'Jenks, Oklahoma','Luxury Real Estate Agent'),(991285,'Ali Zahiri',27,'Santa Monica, CA','Bartender'),(991286,'Christian Bishop',26,'Los Angeles, CA','Telecom Consultant'),(991299,'Nick Benvenutti',33,'Carthage, IL','Electrical Engineer'),(991300,'Rachel Lindsay',31,'Dallas, Texas','Attorney'),(991400,'Becca Kufrin',27,'Prior Lake, MN','Publicist'),(991500,'Hannah Brown',24,'Tuscaloosa, AL','Miss Alabama 2018'),(991501,'Charlie Maher',28,'Hermosa Beach, CA','Financial Analyst'),(991502,'Russ',30,'San Rafael, CA','Writer'),(991503,'Greg T.',28,'Manhattan, NY','Importer'),(991504,'Jamie Blyth',27,'Chicago, IL','Pro Basketball Player'),(991505,'Mike',24,'Cincinnati, Ohio','Consulting'),(991506,'Rob',29,'Dallas, Texas','Computer Programmer'),(991507,'Brian C.',28,'Dallas, Texas','Mortgage Broker'),(991508,'Brian S.',28,'Dallas, Texas','Sales Engineer'),(991509,'Brook',29,'Dallas, Texas','Rodeo Cowboy'),(991510,'Jack',27,'Pepper Pike, Ohio','Firefighter'),(991511,'Jeff',25,'San Diego, CA','Pro Football Player'),(991512,'Josh',31,'Boca Raton, FL','Radio Advertising Executive'),(991513,'Brian H.',30,'Cleveland, Ohio','Sales Manager'),(991514,'Billy',28,'Hermosa Beach, CA','Firefighter'),(991515,'Brian K.',31,'San Francisco, CA','Breast Implant Sales'),(991516,'Chris',35,'Sugarloaf, PA','Vice President'),(991517,'Duane',28,'Chisago City, MN','Flight Instructor'),(991518,'Eric',33,'St. Louis, Missouri','Commercial Pilot'),(991519,'Gregg H.',34,'Freehold, NJ','Business Owner'),(991520,'Matt',42,'Marina Del Rey, CA','Gym Owner'),(991521,'Paul',26,'Honolulu, Hawaii','Telecommunications'),(991522,'Peter',25,'Long Island, NY','Construction Business Owner'),(991523,'Wayne',37,'Sacramento, CA','Commercial Pilot'),(991524,'Ian McKee',29,'New York, NY','Equity Research Sales'),(991525,'Matthew Hickl',28,'Friendswood, TX','Pharmaceutical Sales'),(991526,'Chad',31,'Buffalo, NY','Pharmaceutical Sales'),(991527,'Lanny',26,'Aubrey, Texas','Stallion and Breeding Manager'),(991528,'Brad',29,'Grand Rapids, MI','Pharmaceutical Sales Rep'),(991529,'Ryan M.',30,'Santa Barbara, CA','Financial Advisor'),(991530,'Sean',31,'Wall, NJ','CPA'),(991531,'Rick',29,'San Diego, CA','Business Manager'),(991532,'Ryan R.',29,'Wynola, CA','Sales/Marketing'),(991533,'Todd',36,'San Francisco, CA','Options Trader'),(991534,'Damon',28,'Cardiff, CA','Arena Football Player'),(991535,'Eliot',25,'Mountain View, CA','Options Trader'),(991536,'Harold Hersh',29,'Rock Island, IL','Pro Hockey Player'),(991537,'Marcus',26,'Los Angeles, CA','Personal Trainer'),(991538,'Robert',32,'El Segundo, CA','Alliance Development'),(991539,'Aaron',32,'Sacramento, CA','Title and Escrow Sales'),(991540,'Andy Chang',33,'Dallas, Texas','Dentist'),(991541,'Anselm Clinard',32,'Venice, CA','Art Designer'),(991542,'Brian',31,'Quincy, MA','Attorney'),(991543,'Chris',31,'Boston, MA','Accountant'),(991544,'Cory Higgins',24,'Long Beach Isl, NJ','Small Business Owner'),(991545,'Jeff O\'Quinn',30,'Macon, Georgia','Pharmaceutical Sales Rep'),(991546,'Justin',25,'Orlando, FL','Pro Baseball Player'),(991547,'Keith',31,'Baltimore, Maryland','Financial Analyst'),(991548,'Trever',35,'North Wales, PA','Restaurateur'),(991549,'Jesse Csincsak',26,'Breckenridge, CO','Pro snowboarder'),(991550,'Jeremy Anderson',30,'Dallas, Texas','Real estate attorney'),(991551,'Graham Bunn',29,'Raleigh, NC','Pro basketball player'),(991552,'Sean Ramey',33,'Louisville, Kentucky','Martial artist'),(991553,'Blaine Twilley',33,'Tulsa, Oklahoma','Debt manager'),(991554,'Brian Westendorf',31,'Balch Springs, Texas','High school football coach'),(991555,'Fred Greif',30,'Skokie, IL','Lawyer'),(991556,'Robert Fair',28,'San Francisco, CA','Chef'),(991557,'Paul Brosseau',23,'Bonnyville, Alberta','Sales manager'),(991558,'Ronald Mayer',36,'Greeley, CO','Barber shop owner'),(991559,'Richard Mathy',27,'Sauquoit, NY','Science teacher'),(991560,'Christopher Bradshaw',29,'Fort Worth, Texas','Medical sales rep.'),(991561,'Eric Papachristos',32,'Boston, MA','Senior analyst'),(991562,'Ryan Hoag',28,'Minneapolis, MN','Pro football player'),(991563,'Brian Winchester',29,'New Castle, Indiana','Computer network consultant'),(991564,'Chandler Fulton',25,'Virginia Beach, VA','Insurance rep.'),(991565,'Donato Capodanno',26,'Lexington, SC','Sales rep.'),(991566,'Greg Matthew',28,'Rockport, MA','Personal trainer'),(991567,'Jeffrey Harris',27,'Miami, FL','Mathematics teacher'),(991568,'Jon Konkel',35,'Williston, ND','Resort manager'),(991569,'Luke Hamilton',27,'Faith, NC','Oyster farmer'),(991570,'Patrick Carlson',26,'Glenwood, IL','Financial analyst'),(991571,'Patrick Durrere',27,'Elmhurst, IL','Internet marketing'),(991572,'Spero Stamboulis',38,'Ellington, CT','Actor'),(991573,'Ed Swiderski',29,'Monroe, MI','Technology Consultant'),(991574,'Kiptyn Locke',31,'Encinitas, CA','Business Developer'),(991575,'Reid Rosenthal',30,'Upper Dublin, PA','Realtor'),(991576,'Wes Hayden',32,'Huntsville, Texas','Musician'),(991577,'Jesse Kovacs',27,'Carmel Valley, CA','Wine Maker'),(991578,'Michael Stagliano',25,'Tacoma, Washington','Break Dance Instructor'),(991579,'Tanner Pope',30,'Brownfield, Texas','Financial Analyst'),(991580,'Robby Descant',25,'Spring, Texas','Bartender'),(991581,'Mark Huebner',26,'Woodstock, IL','Pizza Entrepreneur'),(991582,'David Good',27,'West Alexandria, OH','Trucking Contractor'),(991583,'Mike Steinberg',28,'New York, NY','Baseball Camp Owner'),(991584,'Brad Seberhagen',27,'Park Ridge, IL','Financial Advisor'),(991585,'Tanner Fanello',28,'Derby, Kansas','Sales Rep'),(991586,'Sasha Petrovic',27,'Houston, Texas','Consultant'),(991587,'Brian Duke',32,'Birmingham, AL','IT Consultant'),(991588,'Julien Hug',34,'San Diego, CA','Restaurateur'),(991589,'Mathue Johnson',25,'Andover, Kansas','Personal Trainer'),(991590,'Simon Ambrose',26,'Bradford, England','Soccer Coach'),(991591,'Adam Duvendeck',27,'Santa Barbara, CA','Olympic Cyclist'),(991592,'Bryan Vaderman',28,'Lawton, Oklahoma','High School Coach'),(991593,'Bryce Harlow',31,'Fort Lauderdale, FL','Furniture Dealer'),(991594,'Caleb Kuhl',27,'Kansas City, MO','Photographer'),(991595,'Greg Bilbro',31,'Albuquerque, NM','Entrepreneur'),(991596,'John Hardesty',27,'Boise, Idaho','Branding Consultant'),(991597,'John Presser',29,'Fort Wayne, Indiana','Marketing Specialist'),(991598,'Josh Yocam',25,'Tustin, CA','Lifeguard'),(991599,'Kyle Yauch',26,'Austin, Texas','Graphic Designer'),(991600,'Stephen Reich',30,'Lexington, MA','Lawyer'),(991601,'Roberto Martinez',26,'Tampa, FL','Insurance Agent'),(991602,'Chris Lambton',33,'Dennis, MA','Landscaper'),(991603,'Frank Neuschaefer',31,'Bartlett, IL','Retail Manager'),(991604,'Kirk DeWindt',27,'Green Bay, Wisconsin','Sales Consultant'),(991605,'Ty Brown',31,'Booneville, MS','Medical Sales'),(991606,'Craig Robinson',27,'Langhorne, PA','Lawyer'),(991607,'Justin Rego',26,'Toronto, Ontario','Pro Wrestler'),(991608,'Chris Nordhorn',29,'Winter Park, FL','Entrepreneur'),(991609,'Kasey Kahl',27,'Fresno, CA','Advertising Account Executive'),(991610,'Jesse Beck',24,'Peculiar, Missouri','General Contractor'),(991611,'Jonathan Novack',30,'Boston, MA','Weatherman'),(991612,'John Crivello',32,'Mukilteo, Washington','Business Development'),(991613,'Steve Kocsis',28,'Chesterland, Ohio','Sales Rep'),(991614,'Craig McKinnon',34,'Sarnia, Ontario','Dental Sales'),(991615,'Tyler Vermette',25,'Chelsea, Vermont','Online Advertising'),(991616,'Derek',28,'Warren, MI','Sales Manager'),(991617,'Derrick Schuster',27,'Manhattan Beach, CA','Construction Engineer'),(991618,'Jason Whitehead',27,'Johnson City, TN','Construction Consultant'),(991619,'John N.',27,'Wichita, Kansas','Software Sales'),(991620,'Kyle Higgins',26,'Highlands Ranch, CO','Outdoorsman'),(991621,'Phil Kayden',30,'Elmore, Ohio','Investment Manager'),(991622,'Tyler Morrow',25,'Helena, Montana','Catering Manager'),(991623,'J.P. Rosenbaum',34,'Roslyn, NY','Construction Manager'),(991624,'Ben Flajnik',28,'Sonoma, CA','Wine Maker'),(991625,'Constantine Tzortzis',30,'Cumming, Georgia','Restaurant Owner'),(991626,'Ames Brown',31,'Chadds Ford, PA','Portfolio Manager'),(991627,'Lucas Daniels',30,'Odessa, Texas','Equipment Distributor'),(991628,'Ryan Park',31,'San Luis Obispo, CA','Solar Energy Executive'),(991629,'Nick Peterson',26,'Odessa, FL','Personal Trainer'),(991630,'William Holman',30,'Fostoria, Ohio','Cell Phone Sales'),(991631,'Chris Drish',25,'Moline, IL','Sports Marketing'),(991632,'Jeff Medolla',35,'St. Louis, Missouri','Entrepreneur'),(991633,'Bentley Williams',28,'Alpine, Utah','Businessman'),(991634,'Matt Colombo',28,'Bridgewater, MA','Office Supply Sales'),(991635,'Ryan Miller',27,'Novi, MI','Constructor Estimator'),(991636,'Anthony Santucci',28,'Saddle River, NJ','Butcher'),(991637,'Chris Malhomme',27,'Gibbons, Alberta','Construction Company CEO'),(991638,'Frank Carpenter',29,'Anchorage, Alaska','Admissions Director'),(991639,'Rob Dahm',27,'Monroe, MI','Technology Executive'),(991640,'Tim McCormack',35,'Massapequa, NY','Liquor Distributor'),(991641,'Jef Holm',27,'St. George, Utah','Entrepreneur'),(991642,'Chris Bukowski',25,'Chicago, IL','Sales Director'),(991643,'Doug Clerget',33,'Tacoma, Washington','Real Estate Agent'),(991644,'Ryan Bowers',31,'Evans, Georgia','Pro Sports Trainer'),(991645,'Travis Pope',30,'Madison, Mississippi','Advertising Sales Rep'),(991646,'Alejandro Velez',25,'San Francisco, CA','Mushroom Farmer'),(991647,'Kalon McMahon',27,'Houston, Texas','Luxury Brand Consultant'),(991648,'Charlie Grogan',32,'Worcester, MA','Recruiter'),(991649,'Michael Nance',26,'Austin, Texas','Rehab Counselor'),(991650,'Nathan Baake',25,'Casa Grande, Arizona','Accountant'),(991651,'Stevie Alberino',26,'Monroe Township, NJ','Party M.C.'),(991652,'Alessandro Goulart',30,'Saint Paul, MN','Grain Merchant'),(991653,'Tony Pieper',31,'Beaverton, Oregon','Lumber Trader'),(991654,'Kyle Dillon',29,'Long Beach, CA','Financial Adviser'),(991655,'Joe Gendreau',27,'Orlando, FL','Field Energy Adviser'),(991656,'Brent Richter',41,'Midland, Texas','Technology Sales'),(991657,'Jackson Longnecker',29,'Lockport, IL','Fitness Model'),(991658,'Jean-Paul LaCount',35,'Moraga, CA','Marine Biologist'),(991659,'Lerone Anu',29,'Laguna Beach, CA','Real Estate Consultant'),(991660,'Randy Lee Woyak',30,'Oak Creek, WI','Marketing Manager'),(991661,'Chris Siegfried',27,'McMinnville, Oregon','Mortgage Broker'),(991662,'Drew Kenney',27,'Scottsdale, Arizona','Marketing Analyst'),(991663,'Brooks Forester',28,'Blackfoot, Idaho','Sales & Marketing'),(991664,'Zak Waddell',31,'Dallas, Texas','Drilling Fluid Engineer'),(991665,'Michael Garofola',33,'Lindenhurst, NY','Federal Prosecutor'),(991666,'James Case',27,'Marietta, Georgia','Advertising Executive'),(991667,'Kasey Stewart',29,'Tulsa, Oklahoma','Advertising Executive'),(991668,'Mikey Tenerelli',30,'Glen Ellyn, IL','Plumbing Contractor'),(991669,'Ben Scott',28,'Lubbock, Texas','Entrepreneur'),(991670,'Bryden Vukasin',26,'Havre, Montana','Iraq War Veteran'),(991671,'Zack Kalter',28,'Phillips Ranch, CA','Book Publisher'),(991672,'Brad McKinzie',27,'Denver, CO','Accountant/DJ'),(991673,'Brandon Andreen',26,'Blaine, MN','Painting Contractor'),(991674,'Dan Cox',30,'Dublin, CA','Beverage Sales Director'),(991675,'Brian Jarosinski',29,'Olney, Maryland','Financial Advisor'),(991676,'Nick Mucci',27,'Rochester, NY','Investment Adviser'),(991677,'Robert Graham',30,'Glendale, Arizona','Advertising Entrepreneur'),(991678,'Diogo Custodio',29,'Penha, Brazil','Ski Resort Manager'),(991679,'Micah',32,'Detroit Lakes, MN','Law Student'),(991680,'Mike',28,'London, England','Dental Student'),(991681,'Josh Murray',29,'Athens, Georgia','Former Pro Baseball Player'),(991682,'Brian Osborne',27,'Camp Hill, PA','Basketball Coach'),(991683,'Dylan Petitt',26,'Longmeadow, MA','Accountant'),(991684,'J.J. O\'Brien',30,'Hanover, MA','Pantsapreneur'),(991685,'Cody Sattler',28,'Oakley, Kansas','Personal Trainer'),(991686,'Andrew Poole',30,'Portola Valley, CA','Social Media Marketer'),(991687,'Marquel Martin',26,'Rialto, CA','Sponsorship Sales'),(991688,'Patrick Jagodzinski',29,'Clinton, NJ','Advertising Executive'),(991689,'Tasos Hernandez',30,'Denver, CO','Wedding Event Coordinator'),(991690,'Eric Hill',31,'Citrus Heights, CA','Explorer'),(991691,'Bradley Wisk',32,'Grosse Pointe, MI','Opera Singer'),(991692,'Brett Melnick',29,'Warminster, PA','Hairstylist'),(991693,'Ron Worrell',28,'Nahariya, Israel','Beverage Sales Manager'),(991694,'Carl King',30,'Hollywood, CA','Firefighter'),(991695,'Craig Muhlbauer',29,'Defiance, Iowa','Tax Accountant'),(991696,'Nick Sutter',27,'Barrington, IL','Pro Golfer'),(991697,'Emil Schaffroth',33,'Portland, Oregon','Helicopter Pilot'),(991698,'Josh Bauer',29,'Evergreen, CO','Telecommunication Marketer'),(991699,'Mike Campanelli',29,'Guilderland, NY','Bartender'),(991700,'Rudie Dane',31,'Yorba Linda, CA','Attorney'),(991701,'Steven Woolworth',30,'Meadow Vista, CA','Snowboard Product Developer'),(991702,'Shawn Booth',28,'Windsor Locks, CT','Personal Trainer'),(991703,'Joe Bailey',28,'Glasgow, Kentucky','Insurance Agent'),(991704,'Chris Strandburg',28,'Granite Bay, CA','Dentist'),(991705,'Tanner Tolbert',28,'Stilwell, Kansas','Auto Finance Manager'),(991706,'J.J. Lane III',32,'Dacono, CO','Former Investment Banker'),(991707,'Joshua Albers',31,'Kuna, Idaho','Industrial Welder'),(991708,'Justin Reich',28,'Elgin, IL','Fitness Trainer'),(991709,'Ian Thomson',28,'Ramsey, NJ','Executive Recruiter'),(991710,'Corey Stansell',30,'New York, NY','Investment Banker'),(991711,'Jonathan Holloway',33,'Sylvan Lake, MI','Automotive Spokesman'),(991712,'Ryan Beckett',32,'Wellington, FL','Realtor'),(991713,'Clint Arlis',27,'Batavia, IL','Architectural Engineer'),(991714,'Tony Harris',35,'St. Louis, Missouri','Healer'),(991715,'Cory Shivar',35,'Seven Springs, NC','Residential Developer'),(991716,'Daniel Finney',28,'Nashville, TN','Fashion Designer'),(991717,'Kupah James',32,'Boston, MA','Entrepreneur'),(991718,'Bradley Cox',25,'Duluth, Georgia','International Auto Shipper'),(991719,'David',28,'Orlando, FL','Real Estate Agent'),(991720,'Josh Seiter',27,'Chicago, IL','Law Student/Exotic Dancer'),(991721,'Shawn Evans',31,'London, Ontario','Amateur Sex Coach'),(991722,'Brady Toops',33,'Wauseon, Ohio','Singer/Songwriter'),(991723,'Ryan McDill',28,'Kansas City, MO','Junkyard Specialist'),(991724,'Jordan Rodgers',27,'Chico, CA','Former Pro Quarterback'),(991725,'Robby Hayes',27,'St. Augustine, FL','Former Competitive Swimmer'),(991726,'Chase McNary',27,'Castle Rock, CO','Medical Sales Rep'),(991727,'Luke Pell',31,'Burnet, Texas','War Veteran'),(991728,'James Taylor',29,'Katy, Texas','Singer-Songwriter'),(991729,'Alex Woytkiw',25,'Oceanside, CA','U.S. Marine'),(991730,'Derek Peth',29,'Waverly, Iowa','Commercial Banker'),(991731,'Wells Adams',31,'Monterey, CA','Radio DJ'),(991732,'Evan Bass',33,'Hartford, CT','Erectile Dysfunction Specialist'),(991733,'Grant Kemp',27,'San Francisco, CA','Firefighter'),(991734,'Vinny Ventiera',28,'Kings Park, NY','Barber'),(991735,'Daniel Maguire',31,'Lions Bay, BC','Male Model'),(991736,'James Fuertes',34,'Franklin, TN','Boxing Club Owner'),(991737,'Chad Johnson',28,'Jenks, Oklahoma','Luxury Real Estate Agent'),(991738,'Ali Zahiri',27,'Santa Monica, CA','Bartender'),(991739,'Christian Bishop',26,'Los Angeles, CA','Telecom Consultant'),(991740,'Nick Benvenutti',33,'Carthage, IL','Electrical Engineer'),(991741,'Brandon Howell',28,'Marysville, WA','Hipster'),(991742,'James Spadafore',27,'Phoenix, Arizona','Bachelor Superfan'),(991743,'Will Haduch',26,'Jersey City, NJ','Civil Engineer'),(991744,'Coley Knust',27,'Chicago, IL','Real Estate Consultant'),(991745,'Jake Patton',26,'Playa Vista, CA','Landscape Architect'),(991746,'Jonathan Hamilton',29,'Vancouver, BC','Technical Sales Rep'),(991747,'Nick Sharp',26,'San Francisco, CA','Software Sales'),(991748,'Peter Medina',26,'Rockdale, IL','Staffing Agency Manager'),(991749,'Sal DeJulio',28,'Hubbard, Ohio','Operations Manager');
/*!40000 ALTER TABLE `CastMember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CastParticipatesInActivity`
--

DROP TABLE IF EXISTS `CastParticipatesInActivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CastParticipatesInActivity` (
  `cast_id` int NOT NULL,
  `activity_type` char(20) NOT NULL,
  `air_date` date NOT NULL,
  `eliminated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cast_id`,`activity_type`,`air_date`),
  KEY `activity_type` (`activity_type`,`air_date`),
  CONSTRAINT `castparticipatesinactivity_ibfk_1` FOREIGN KEY (`cast_id`) REFERENCES `CastMember` (`cast_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `castparticipatesinactivity_ibfk_2` FOREIGN KEY (`activity_type`, `air_date`) REFERENCES `Activity` (`activity_type`, `air_date`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CastParticipatesInActivity`
--

LOCK TABLES `CastParticipatesInActivity` WRITE;
/*!40000 ALTER TABLE `CastParticipatesInActivity` DISABLE KEYS */;
INSERT INTO `CastParticipatesInActivity` VALUES (100,'limo arrivals','2002-03-25',0),(101,'limo arrivals','2002-03-25',0),(102,'limo arrivals','2002-03-25',0),(103,'limo arrivals','2002-03-25',0),(990100,'limo arrivals','2002-03-25',0);
/*!40000 ALTER TABLE `CastParticipatesInActivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Company`
--

DROP TABLE IF EXISTS `Company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Company` (
  `company_id` int NOT NULL,
  `name` char(30) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Company`
--

LOCK TABLES `Company` WRITE;
/*!40000 ALTER TABLE `Company` DISABLE KEYS */;
INSERT INTO `Company` VALUES (1,'ABC'),(2,'CBS'),(3,'NBC'),(4,'YTV'),(5,'FOX');
/*!40000 ALTER TABLE `Company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CompanyProducesShow`
--

DROP TABLE IF EXISTS `CompanyProducesShow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CompanyProducesShow` (
  `company_id` int NOT NULL,
  `title` char(20) NOT NULL,
  `season` int NOT NULL,
  PRIMARY KEY (`company_id`,`title`,`season`),
  KEY `title` (`title`,`season`),
  CONSTRAINT `companyproducesshow_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `Company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `companyproducesshow_ibfk_2` FOREIGN KEY (`title`, `season`) REFERENCES `TVShow` (`title`, `season`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CompanyProducesShow`
--

LOCK TABLES `CompanyProducesShow` WRITE;
/*!40000 ALTER TABLE `CompanyProducesShow` DISABLE KEYS */;
/*!40000 ALTER TABLE `CompanyProducesShow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContestantDates`
--

DROP TABLE IF EXISTS `ContestantDates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ContestantDates` (
  `contestant_id` int NOT NULL,
  `lead_id` int DEFAULT NULL,
  PRIMARY KEY (`contestant_id`),
  KEY `lead_id` (`lead_id`),
  CONSTRAINT `contestantdates_ibfk_1` FOREIGN KEY (`lead_id`) REFERENCES `CastMember` (`cast_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContestantDates`
--

LOCK TABLES `ContestantDates` WRITE;
/*!40000 ALTER TABLE `ContestantDates` DISABLE KEYS */;
INSERT INTO `ContestantDates` VALUES (2,100),(3,100),(4,100),(5,100),(2301,2300),(2302,2300),(2303,2300),(2304,2300),(2305,2300),(2306,2300),(2307,2300),(2308,2300),(2309,2300),(2310,2300),(2311,2300),(2312,2300),(2313,2300),(2314,2300),(2315,2300),(2316,2300),(2317,2300),(2318,2300),(2319,2300),(2320,2300),(2321,2300),(2322,2300),(2323,2300),(2324,2300),(2325,2300),(2326,2300),(2327,2300),(2328,2300),(2329,2300),(2330,2300),(2401,2400),(2402,2400),(2403,2400),(2404,2400),(2405,2400),(2406,2400),(2407,2400),(2408,2400),(2409,2400),(2410,2400),(2411,2400),(2412,2400),(2413,2400),(2414,2400),(2415,2400),(2416,2400),(2417,2400),(2418,2400),(2419,2400),(2420,2400),(2421,2400),(2422,2400),(2423,2400),(2424,2400),(2425,2400),(2426,2400),(2427,2400),(2428,2400),(2429,2400),(2430,2400);
/*!40000 ALTER TABLE `ContestantDates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EpisodeAired`
--

DROP TABLE IF EXISTS `EpisodeAired`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EpisodeAired` (
  `title` char(20) NOT NULL,
  `season` int NOT NULL,
  `episode_number` int NOT NULL,
  `air_date` date DEFAULT NULL,
  `viewership` int DEFAULT NULL,
  `rating` float DEFAULT NULL,
  PRIMARY KEY (`title`,`season`,`episode_number`),
  CONSTRAINT `episodeaired_ibfk_1` FOREIGN KEY (`title`, `season`) REFERENCES `TVShow` (`title`, `season`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EpisodeAired`
--

LOCK TABLES `EpisodeAired` WRITE;
/*!40000 ALTER TABLE `EpisodeAired` DISABLE KEYS */;
INSERT INTO `EpisodeAired` VALUES ('The Bachelor',1,1,'2002-03-25',10,4),('The Bachelor',1,2,'2002-04-01',10,4.4),('The Bachelor',1,3,'2002-04-08',9,4.2),('The Bachelor',1,4,'2002-04-15',11,4.6),('The Bachelor',1,5,'2002-04-22',13,5.7),('The Bachelor',24,1,'2020-01-06',NULL,NULL),('The Bachelor',24,2,'2020-01-13',NULL,NULL),('The Bachelor',24,3,'2020-01-20',NULL,NULL),('The Bachelor',24,4,'2020-01-27',NULL,NULL),('The Bachelor',24,5,'2020-02-03',NULL,NULL),('The Bachelor',24,6,'2020-02-05',NULL,NULL),('The Bachelor',24,7,'2020-02-10',NULL,NULL),('The Bachelor',24,8,'2020-02-17',NULL,NULL),('The Bachelor',24,9,'2020-02-24',NULL,NULL),('The Bachelor',24,10,'2020-03-02',NULL,NULL),('The Bachelor',24,11,'2020-03-09',NULL,NULL),('The Bachelor',24,12,'2020-03-10',NULL,NULL);
/*!40000 ALTER TABLE `EpisodeAired` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Instagram`
--

DROP TABLE IF EXISTS `Instagram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Instagram` (
  `username` char(20) NOT NULL,
  `followers` int DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instagram`
--

LOCK TABLES `Instagram` WRITE;
/*!40000 ALTER TABLE `Instagram` DISABLE KEYS */;
INSERT INTO `Instagram` VALUES ('_jasminenguyen',21300),('a.v.o.n.l.e.a',22600),('alayahbenavidez',140000),('alexaraecaves',26700),('ashley_iaconetti',1100000),('caelynnmillerkeyes',1500000),('cassie randolph',1700000),('coltonunderwood',2000000),('colympios',707000),('courtneyperry',11400),('deandrakanu',26600),('demi_not_lovato',1400000),('euniceashlee',6393),('flywithmegan_',6031),('hannahann',1400000),('hannahg11',1500000),('heatherm22',218000),('itslaurenamanda',151000),('jade.gilliland',8178),('jaredhaibon',713000),('jennafromtheblockk_',4764),('joelle_fletcher',2200000),('katieemo',506000),('kbadowski',11200),('kelleyflanagan',516000),('kelsey_weier',258000),('kiarranorman',17700),('kirpasudick',87000),('kylieramos',35800),('lexireeed',0),('madiprew',1900000),('maurissagunn',19300),('mykennajean',299000),('natashajp',0),('nickviall',1100000),('pandarhino',0),('paytonmoran',13200),('peeeeeee',0),('sarah.coffin',83900),('savannahmullins',28200),('shiannjanay',13400),('sydneylotuaco',130000),('sydneynicolehigh',184000),('tammykayly',86300),('tayshiaa',808000),('victorianpaul',265000),('vlfuller',565000);
/*!40000 ALTER TABLE `Instagram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LeadFormerlyContestantOfShow`
--

DROP TABLE IF EXISTS `LeadFormerlyContestantOfShow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LeadFormerlyContestantOfShow` (
  `lead_id` int NOT NULL,
  `title` char(20) NOT NULL,
  `season` int NOT NULL,
  `placement` int DEFAULT NULL,
  PRIMARY KEY (`lead_id`,`title`,`season`),
  KEY `title` (`title`,`season`),
  CONSTRAINT `leadformerlycontestantofshow_ibfk_1` FOREIGN KEY (`lead_id`) REFERENCES `CastMember` (`cast_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `leadformerlycontestantofshow_ibfk_2` FOREIGN KEY (`title`, `season`) REFERENCES `TVShow` (`title`, `season`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LeadFormerlyContestantOfShow`
--

LOCK TABLES `LeadFormerlyContestantOfShow` WRITE;
/*!40000 ALTER TABLE `LeadFormerlyContestantOfShow` DISABLE KEYS */;
INSERT INTO `LeadFormerlyContestantOfShow` VALUES (400,'The Bachelorette',1,5),(1300,'The Bachelorette',4,2),(1400,'The Bachelorette',5,7),(1600,'The Bachelorette',7,2),(1700,'The Bachelorette',8,3),(1800,'The Bachelorette',9,7),(1900,'The Bachelorette',10,3),(2000,'The Bachelorette',11,3),(2100,'The Bachelorette',10,2),(2100,'The Bachelorette',11,2),(2200,'The Bachelorette',8,2),(2300,'The Bachelorette',14,4),(2400,'The Bachelorette',15,3),(990100,'The Bachelor',1,2),(990200,'The Bachelor',4,4),(990300,'The Bachelor',3,1),(990400,'The Bachelor',11,2),(990500,'The Bachelor',13,3),(990600,'The Bachelor',14,4),(990700,'The Bachelor',15,3),(990800,'The Bachelor',15,1),(990900,'The Bachelor',17,4),(991000,'The Bachelor',18,3),(991100,'The Bachelor',19,3),(991200,'The Bachelor',20,2),(991300,'The Bachelor',21,3),(991400,'The Bachelor',22,1),(991500,'The Bachelor',23,7);
/*!40000 ALTER TABLE `LeadFormerlyContestantOfShow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Relationship`
--

DROP TABLE IF EXISTS `Relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Relationship` (
  `status` char(20) NOT NULL,
  PRIMARY KEY (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Relationship`
--

LOCK TABLES `Relationship` WRITE;
/*!40000 ALTER TABLE `Relationship` DISABLE KEYS */;
INSERT INTO `Relationship` VALUES ('broken engagement'),('broken up'),('dating'),('divorced'),('engaged'),('married');
/*!40000 ALTER TABLE `Relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rose`
--

DROP TABLE IF EXISTS `Rose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rose` (
  `rose_type` char(20) NOT NULL DEFAULT 'ceremony',
  `rose_number` int NOT NULL,
  PRIMARY KEY (`rose_type`,`rose_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rose`
--

LOCK TABLES `Rose` WRITE;
/*!40000 ALTER TABLE `Rose` DISABLE KEYS */;
INSERT INTO `Rose` VALUES ('ceremony',1),('ceremony',2),('ceremony',3),('ceremony',4),('ceremony',5),('ceremony',44),('ceremony',24002),('ceremony',24003),('ceremony',24004),('ceremony',24005),('ceremony',24006),('ceremony',24007),('ceremony',24008),('ceremony',24009),('ceremony',24010),('ceremony',24011),('ceremony',24012),('ceremony',24013),('ceremony',24014),('ceremony',24015),('ceremony',24016),('ceremony',24017),('ceremony',24018),('ceremony',24019),('ceremony',24020),('ceremony',24021),('ceremony',24022),('ceremony',24026),('ceremony',24027),('ceremony',24028),('ceremony',24029),('ceremony',24030),('ceremony',24031),('ceremony',24032),('ceremony',24033),('ceremony',24034),('ceremony',24035),('ceremony',24036),('ceremony',24037),('ceremony',24038),('ceremony',24039),('ceremony',24040),('ceremony',24041),('ceremony',24045),('ceremony',24046),('ceremony',24047),('ceremony',24048),('ceremony',24049),('ceremony',24050),('ceremony',24051),('ceremony',24052),('ceremony',24053),('ceremony',24054),('ceremony',24055),('ceremony',24056),('ceremony',24060),('ceremony',24061),('ceremony',24062),('ceremony',24063),('ceremony',24064),('ceremony',24065),('ceremony',24066),('ceremony',24067),('ceremony',24068),('ceremony',24069),('ceremony',24073),('ceremony',24074),('ceremony',24075),('ceremony',24076),('ceremony',24077),('ceremony',24078),('ceremony',24079),('ceremony',24083),('ceremony',24084),('ceremony',24085),('ceremony',24090),('ceremony',24091),('ceremony',24092),('ceremony',24093),('ceremony',24094),('final rose',30),('final rose',24095),('first impression',24001),('group date',24023),('group date',24025),('group date',24042),('group date',24044),('group date',24058),('group date',24071),('group date',24081),('group date',24088),('group date',24089),('last rose',6),('last rose',90),('one-on-one',32),('one-on-one',24024),('one-on-one',24043),('one-on-one',24057),('one-on-one',24059),('one-on-one',24070),('one-on-one',24072),('one-on-one',24080),('one-on-one',24082),('one-on-one',24086),('one-on-one',24087),('two-on-one',100);
/*!40000 ALTER TABLE `Rose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoseDuringEvent`
--

DROP TABLE IF EXISTS `RoseDuringEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RoseDuringEvent` (
  `rose_type` char(20) NOT NULL,
  `rose_number` int NOT NULL,
  `activity_type` char(20) NOT NULL,
  PRIMARY KEY (`rose_type`,`rose_number`,`activity_type`),
  KEY `activity_type` (`activity_type`),
  CONSTRAINT `roseduringevent_ibfk_1` FOREIGN KEY (`rose_type`, `rose_number`) REFERENCES `Rose` (`rose_type`, `rose_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roseduringevent_ibfk_2` FOREIGN KEY (`activity_type`) REFERENCES `Activity` (`activity_type`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoseDuringEvent`
--

LOCK TABLES `RoseDuringEvent` WRITE;
/*!40000 ALTER TABLE `RoseDuringEvent` DISABLE KEYS */;
INSERT INTO `RoseDuringEvent` VALUES ('ceremony',1,'rose ceremony'),('ceremony',2,'rose ceremony'),('ceremony',3,'rose ceremony'),('ceremony',4,'rose ceremony'),('last rose',6,'rose ceremony');
/*!40000 ALTER TABLE `RoseDuringEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoseOnActivity`
--

DROP TABLE IF EXISTS `RoseOnActivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RoseOnActivity` (
  `rose_type` char(20) DEFAULT NULL,
  `rose_number` int NOT NULL,
  `activity_type` char(20) DEFAULT NULL,
  `air_date` date NOT NULL,
  PRIMARY KEY (`rose_number`,`air_date`),
  KEY `rose_type` (`rose_type`,`rose_number`),
  KEY `activity_type` (`activity_type`,`air_date`),
  CONSTRAINT `roseonactivity_ibfk_1` FOREIGN KEY (`rose_type`, `rose_number`) REFERENCES `Rose` (`rose_type`, `rose_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roseonactivity_ibfk_2` FOREIGN KEY (`activity_type`, `air_date`) REFERENCES `Activity` (`activity_type`, `air_date`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoseOnActivity`
--

LOCK TABLES `RoseOnActivity` WRITE;
/*!40000 ALTER TABLE `RoseOnActivity` DISABLE KEYS */;
INSERT INTO `RoseOnActivity` VALUES ('ceremony',1,'rose ceremony','2002-03-25'),('ceremony',2,'rose ceremony','2002-03-25'),('ceremony',3,'rose ceremony','2002-03-25'),('ceremony',4,'rose ceremony','2002-03-25'),('ceremony',5,'rose ceremony','2002-03-25');
/*!40000 ALTER TABLE `RoseOnActivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoseTypeNumber`
--

DROP TABLE IF EXISTS `RoseTypeNumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RoseTypeNumber` (
  `rose_type` char(20) NOT NULL,
  `rose_number` int NOT NULL,
  PRIMARY KEY (`rose_type`,`rose_number`),
  CONSTRAINT `rosetypenumber_ibfk_1` FOREIGN KEY (`rose_type`, `rose_number`) REFERENCES `Rose` (`rose_type`, `rose_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoseTypeNumber`
--

LOCK TABLES `RoseTypeNumber` WRITE;
/*!40000 ALTER TABLE `RoseTypeNumber` DISABLE KEYS */;
/*!40000 ALTER TABLE `RoseTypeNumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TVShow`
--

DROP TABLE IF EXISTS `TVShow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TVShow` (
  `title` char(20) NOT NULL,
  `season` int NOT NULL,
  `rating` int DEFAULT NULL,
  PRIMARY KEY (`title`,`season`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TVShow`
--

LOCK TABLES `TVShow` WRITE;
/*!40000 ALTER TABLE `TVShow` DISABLE KEYS */;
INSERT INTO `TVShow` VALUES ('Bachelor In Paradise',1,100),('Bachelor In Paradise',2,100),('Bachelor In Paradise',3,100),('Bachelor In Paradise',4,100),('Bachelor In Paradise',5,100),('Bachelor In Paradise',6,100),('The Bachelor',1,100),('The Bachelor',2,100),('The Bachelor',3,100),('The Bachelor',4,100),('The Bachelor',5,100),('The Bachelor',6,100),('The Bachelor',7,100),('The Bachelor',8,100),('The Bachelor',9,100),('The Bachelor',10,100),('The Bachelor',11,100),('The Bachelor',12,100),('The Bachelor',13,100),('The Bachelor',14,100),('The Bachelor',15,100),('The Bachelor',16,100),('The Bachelor',17,100),('The Bachelor',18,100),('The Bachelor',19,100),('The Bachelor',20,100),('The Bachelor',21,100),('The Bachelor',22,100),('The Bachelor',23,100),('The Bachelor',24,100),('The Bachelorette',1,100),('The Bachelorette',2,100),('The Bachelorette',3,100),('The Bachelorette',4,100),('The Bachelorette',5,100),('The Bachelorette',6,100),('The Bachelorette',7,100),('The Bachelorette',8,100),('The Bachelorette',9,100),('The Bachelorette',10,100),('The Bachelorette',11,100),('The Bachelorette',12,100),('The Bachelorette',13,100),('The Bachelorette',14,100),('The Bachelorette',15,100);
/*!40000 ALTER TABLE `TVShow` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-01 14:32:11
