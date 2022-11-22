CREATE DATABASE  IF NOT EXISTS `phase2database` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `phase2database`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: phase2database
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `article_id` int NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `lead_description` varchar(10000) DEFAULT NULL,
  `body` longtext,
  PRIMARY KEY (`article_id`),
  KEY `fk_authorid_idx` (`author`),
  KEY `fk_categoryid_idx` (`category`),
  CONSTRAINT `fk_authorid` FOREIGN KEY (`author`) REFERENCES `user_details` (`username`),
  CONSTRAINT `fk_categoryid` FOREIGN KEY (`category`) REFERENCES `categories` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'Bleach  release date on Fall 2022','chie_alqui','world','2022-10-05',' On October 3, 2022, VIZ Media officially announced that Bleach: Thousand-Year Blood War will be available to English-speaking fans in the United States on Hulu USA whereas the episodes will be streaming internationally on Disney+. ','			      		The Bleach: Thousand-Year Blood War Episode 1 ED special video features the music “Rapport” by Tatsuya Kitani. VIZ Media previously announced that the Bleach Season 17 episodes would be “simulcast” weekly. However, keep in mind that VIZ Media and Disney+ will be releasing details specific to each territory or region.'),(2,'Are you feeling ELECTRIFIED, IECEP?!','chie_alqui','school','2022-10-04',' The Institute of Electronics Engineers of the Philippines - Manila Student Chapter hosted their Academic Festival TODAY with the theme “AcECEleration: Accelerating Towards Technological Triumph”. This exciting Interscholastic Quiz Show (IQS) ultimately aims to provide ECE students a feel and review of certain questions that they may encounter during their board exams in the coming years.  ','			      		Are you feeling ELECTRIFIED, IECEP?! '),(3,'BBMs’ trip ‘partly official, partly personal’','haz_bong','nation','2022-10-03',' MANILA, Philippines — President Ferdinand “Bongbong” Marcos Jr.’s trip to Singapore, where the F1 Grand Prix race was held, was “partly official, partly personal,” executive secretary Lucas Bersamin said on Wednesday. ','			      		Early this month, Marcos went to the city-state and met with Singaporean Minister for Manpower Tan See Ling on the sidelines of the race. During the Senate committee on finance’s hearing on the 2023 budgets of the Office of the President and the Presidential Management Staff, Senate Minority Leader Aquilino Pimentel III asked if the said trip was personal or official.'),(4,'Biden’s security plan aims at China, Russia','chie_alqui','world','2022-10-02',' WASHINGTON  – The White House rolled out a long-delayed national security strategy on Wednesday that seeks to contain China’s rise while reemphasizing the importance of working with allies to tackle challenges confronting democratic nations. ','			      		The 48-page document, which was delayed by Russia’s invasion of Ukraine, includes no major shifts in thinking and introduces no major new foreign policy doctrines. Instead, it highlights the view that U.S. leadership is the key to overcoming global threats like climate change and the rise of authoritarianism.'),(5,'Start reading—save the world from ignorance','haz_bong','opinion','2022-10-01','Learn why reading is such an underrated skill','			      		One radiant spark of a matchstick can turn darkness into light, just as how reading can save one lost soul in the midst of a cruel night. This is the power of reading.');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-16 21:49:54
