-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: medical-center
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `spec` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'Сергей','Терапевт',2500),(2,'Александр','Лор',2000),(3,'Вероника','Психиатр',3500),(4,'Андрей','Травмотолог',4000),(5,'Мария','Стоматолог',6500);
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `gender` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (5,'89132018678','Иван','getiwib457@invodua.com','male'),(6,'89132487845','Петр','petr@example.com','woman'),(7,'89112589977','Олеся','olecya@example.com','male'),(8,'89156547891','Геннадий','gena@example.com','woman'),(9,'89653215489','Роман','roman@example.com','male'),(11,'89998529647','Генри','genri@example.com','woman'),(13,'78945158678','Александр','ershov.sasha2013@gmail.com','male');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time_from` timestamp(6) NOT NULL,
  `time_to` timestamp(6) NOT NULL,
  `is_free` tinyint NOT NULL,
  `type` int DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `patient_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_scheduler_patients1_idx` (`patient_id`),
  KEY `fk_scheduler_doctors_idx` (`doctor_id`,`patient_id`),
  CONSTRAINT `doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=761 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (6,'2022-11-20','2022-11-19 22:01:42.000000','2022-11-19 22:01:42.000000',0,1,1,5),(521,'2022-11-20','2022-11-20 15:25:00.000000','2022-11-19 20:55:00.000000',0,1,1,5),(522,'2022-11-25','2022-11-25 02:30:00.000000','2022-11-25 03:00:00.000000',0,1,1,5),(523,'2022-11-25','2022-11-25 03:00:00.000000','2022-11-25 03:30:00.000000',0,1,1,5),(524,'2022-11-25','2022-11-25 03:30:00.000000','2022-11-25 04:00:00.000000',1,NULL,1,NULL),(525,'2022-11-25','2022-11-25 04:00:00.000000','2022-11-25 04:30:00.000000',0,0,1,6),(526,'2022-11-25','2022-11-25 04:30:00.000000','2022-11-25 05:00:00.000000',1,NULL,1,NULL),(527,'2022-11-25','2022-11-25 05:00:00.000000','2022-11-25 05:30:00.000000',1,NULL,1,NULL),(528,'2022-11-25','2022-11-25 05:30:00.000000','2022-11-25 06:00:00.000000',1,NULL,1,NULL),(529,'2022-11-25','2022-11-25 06:00:00.000000','2022-11-25 06:30:00.000000',1,NULL,1,NULL),(530,'2022-11-25','2022-11-25 06:30:00.000000','2022-11-25 07:00:00.000000',1,NULL,1,NULL),(531,'2022-11-25','2022-11-25 07:00:00.000000','2022-11-25 07:30:00.000000',1,NULL,1,NULL),(532,'2022-11-25','2022-11-25 07:30:00.000000','2022-11-25 08:00:00.000000',1,NULL,1,NULL),(533,'2022-11-25','2022-11-25 08:00:00.000000','2022-11-25 08:30:00.000000',1,NULL,1,NULL),(534,'2022-11-25','2022-11-25 08:30:00.000000','2022-11-25 09:00:00.000000',1,NULL,1,NULL),(535,'2022-11-25','2022-11-25 09:00:00.000000','2022-11-25 09:30:00.000000',1,NULL,1,NULL),(536,'2022-11-25','2022-11-25 09:30:00.000000','2022-11-25 10:00:00.000000',1,NULL,1,NULL),(537,'2022-11-25','2022-11-25 10:00:00.000000','2022-11-25 10:30:00.000000',1,NULL,1,NULL),(538,'2022-11-25','2022-11-25 10:30:00.000000','2022-11-25 11:00:00.000000',1,NULL,1,NULL),(539,'2022-11-25','2022-11-25 11:00:00.000000','2022-11-25 11:30:00.000000',1,NULL,1,NULL),(540,'2022-11-25','2022-11-25 11:30:00.000000','2022-11-25 12:00:00.000000',1,NULL,1,NULL),(541,'2022-11-25','2022-11-25 12:00:00.000000','2022-11-25 12:30:00.000000',1,NULL,1,NULL),(542,'2022-11-25','2022-11-25 12:30:00.000000','2022-11-25 13:00:00.000000',1,NULL,1,NULL),(543,'2022-11-25','2022-11-25 13:00:00.000000','2022-11-25 13:30:00.000000',1,NULL,1,NULL),(544,'2022-11-25','2022-11-25 13:30:00.000000','2022-11-25 14:00:00.000000',1,NULL,1,NULL),(545,'2022-11-25','2022-11-25 02:00:00.000000','2022-11-25 02:30:00.000000',1,NULL,2,NULL),(546,'2022-11-25','2022-11-25 02:30:00.000000','2022-11-25 03:00:00.000000',1,NULL,2,NULL),(547,'2022-11-25','2022-11-25 03:00:00.000000','2022-11-25 03:30:00.000000',1,NULL,2,NULL),(548,'2022-11-25','2022-11-25 03:30:00.000000','2022-11-25 04:00:00.000000',1,NULL,2,NULL),(549,'2022-11-25','2022-11-25 04:00:00.000000','2022-11-25 04:30:00.000000',1,NULL,2,NULL),(550,'2022-11-25','2022-11-25 04:30:00.000000','2022-11-25 05:00:00.000000',1,NULL,2,NULL),(551,'2022-11-25','2022-11-25 05:00:00.000000','2022-11-25 05:30:00.000000',1,NULL,2,NULL),(552,'2022-11-25','2022-11-25 05:30:00.000000','2022-11-25 06:00:00.000000',1,NULL,2,NULL),(553,'2022-11-25','2022-11-25 06:00:00.000000','2022-11-25 06:30:00.000000',1,NULL,2,NULL),(554,'2022-11-25','2022-11-25 06:30:00.000000','2022-11-25 07:00:00.000000',1,NULL,2,NULL),(555,'2022-11-25','2022-11-25 07:00:00.000000','2022-11-25 07:30:00.000000',1,NULL,2,NULL),(556,'2022-11-25','2022-11-25 07:30:00.000000','2022-11-25 08:00:00.000000',1,NULL,2,NULL),(557,'2022-11-25','2022-11-25 08:00:00.000000','2022-11-25 08:30:00.000000',1,NULL,2,NULL),(558,'2022-11-25','2022-11-25 08:30:00.000000','2022-11-25 09:00:00.000000',1,NULL,2,NULL),(559,'2022-11-25','2022-11-25 09:00:00.000000','2022-11-25 09:30:00.000000',1,NULL,2,NULL),(560,'2022-11-25','2022-11-25 09:30:00.000000','2022-11-25 10:00:00.000000',1,NULL,2,NULL),(561,'2022-11-25','2022-11-25 10:00:00.000000','2022-11-25 10:30:00.000000',1,NULL,2,NULL),(562,'2022-11-25','2022-11-25 10:30:00.000000','2022-11-25 11:00:00.000000',1,NULL,2,NULL),(563,'2022-11-25','2022-11-25 11:00:00.000000','2022-11-25 11:30:00.000000',1,NULL,2,NULL),(564,'2022-11-25','2022-11-25 11:30:00.000000','2022-11-25 12:00:00.000000',1,NULL,2,NULL),(565,'2022-11-25','2022-11-25 12:00:00.000000','2022-11-25 12:30:00.000000',1,NULL,2,NULL),(566,'2022-11-25','2022-11-25 12:30:00.000000','2022-11-25 13:00:00.000000',1,NULL,2,NULL),(567,'2022-11-25','2022-11-25 13:00:00.000000','2022-11-25 13:30:00.000000',1,NULL,2,NULL),(568,'2022-11-25','2022-11-25 13:30:00.000000','2022-11-25 14:00:00.000000',1,NULL,2,NULL),(569,'2022-11-25','2022-11-25 02:00:00.000000','2022-11-25 02:30:00.000000',1,NULL,3,NULL),(570,'2022-11-25','2022-11-25 02:30:00.000000','2022-11-25 03:00:00.000000',1,NULL,3,NULL),(571,'2022-11-25','2022-11-25 03:00:00.000000','2022-11-25 03:30:00.000000',1,NULL,3,NULL),(572,'2022-11-25','2022-11-25 03:30:00.000000','2022-11-25 04:00:00.000000',1,NULL,3,NULL),(573,'2022-11-25','2022-11-25 04:00:00.000000','2022-11-25 04:30:00.000000',1,NULL,3,NULL),(574,'2022-11-25','2022-11-25 04:30:00.000000','2022-11-25 05:00:00.000000',1,NULL,3,NULL),(575,'2022-11-25','2022-11-25 05:00:00.000000','2022-11-25 05:30:00.000000',1,NULL,3,NULL),(576,'2022-11-25','2022-11-25 05:30:00.000000','2022-11-25 06:00:00.000000',1,NULL,3,NULL),(577,'2022-11-25','2022-11-25 06:00:00.000000','2022-11-25 06:30:00.000000',1,NULL,3,NULL),(578,'2022-11-25','2022-11-25 06:30:00.000000','2022-11-25 07:00:00.000000',1,NULL,3,NULL),(579,'2022-11-25','2022-11-25 07:00:00.000000','2022-11-25 07:30:00.000000',1,NULL,3,NULL),(580,'2022-11-25','2022-11-25 07:30:00.000000','2022-11-25 08:00:00.000000',1,NULL,3,NULL),(581,'2022-11-25','2022-11-25 08:00:00.000000','2022-11-25 08:30:00.000000',1,NULL,3,NULL),(582,'2022-11-25','2022-11-25 08:30:00.000000','2022-11-25 09:00:00.000000',1,NULL,3,NULL),(583,'2022-11-25','2022-11-25 09:00:00.000000','2022-11-25 09:30:00.000000',1,NULL,3,NULL),(584,'2022-11-25','2022-11-25 09:30:00.000000','2022-11-25 10:00:00.000000',1,NULL,3,NULL),(585,'2022-11-25','2022-11-25 10:00:00.000000','2022-11-25 10:30:00.000000',1,NULL,3,NULL),(586,'2022-11-25','2022-11-25 10:30:00.000000','2022-11-25 11:00:00.000000',1,NULL,3,NULL),(587,'2022-11-25','2022-11-25 11:00:00.000000','2022-11-25 11:30:00.000000',1,NULL,3,NULL),(588,'2022-11-25','2022-11-25 11:30:00.000000','2022-11-25 12:00:00.000000',1,NULL,3,NULL),(589,'2022-11-25','2022-11-25 12:00:00.000000','2022-11-25 12:30:00.000000',1,NULL,3,NULL),(590,'2022-11-25','2022-11-25 12:30:00.000000','2022-11-25 13:00:00.000000',1,NULL,3,NULL),(591,'2022-11-25','2022-11-25 13:00:00.000000','2022-11-25 13:30:00.000000',1,NULL,3,NULL),(592,'2022-11-25','2022-11-25 13:30:00.000000','2022-11-25 14:00:00.000000',1,NULL,3,NULL),(593,'2022-11-25','2022-11-25 02:00:00.000000','2022-11-25 02:30:00.000000',1,NULL,4,NULL),(594,'2022-11-25','2022-11-25 02:30:00.000000','2022-11-25 03:00:00.000000',1,NULL,4,NULL),(595,'2022-11-25','2022-11-25 03:00:00.000000','2022-11-25 03:30:00.000000',1,NULL,4,NULL),(596,'2022-11-25','2022-11-25 03:30:00.000000','2022-11-25 04:00:00.000000',1,NULL,4,NULL),(597,'2022-11-25','2022-11-25 04:00:00.000000','2022-11-25 04:30:00.000000',1,NULL,4,NULL),(598,'2022-11-25','2022-11-25 04:30:00.000000','2022-11-25 05:00:00.000000',1,NULL,4,NULL),(599,'2022-11-25','2022-11-25 05:00:00.000000','2022-11-25 05:30:00.000000',1,NULL,4,NULL),(600,'2022-11-25','2022-11-25 05:30:00.000000','2022-11-25 06:00:00.000000',1,NULL,4,NULL),(601,'2022-11-25','2022-11-25 06:00:00.000000','2022-11-25 06:30:00.000000',1,NULL,4,NULL),(602,'2022-11-25','2022-11-25 06:30:00.000000','2022-11-25 07:00:00.000000',1,NULL,4,NULL),(603,'2022-11-25','2022-11-25 07:00:00.000000','2022-11-25 07:30:00.000000',1,NULL,4,NULL),(604,'2022-11-25','2022-11-25 07:30:00.000000','2022-11-25 08:00:00.000000',1,NULL,4,NULL),(605,'2022-11-25','2022-11-25 08:00:00.000000','2022-11-25 08:30:00.000000',1,NULL,4,NULL),(606,'2022-11-25','2022-11-25 08:30:00.000000','2022-11-25 09:00:00.000000',1,NULL,4,NULL),(607,'2022-11-25','2022-11-25 09:00:00.000000','2022-11-25 09:30:00.000000',1,NULL,4,NULL),(608,'2022-11-25','2022-11-25 09:30:00.000000','2022-11-25 10:00:00.000000',1,NULL,4,NULL),(609,'2022-11-25','2022-11-25 10:00:00.000000','2022-11-25 10:30:00.000000',1,NULL,4,NULL),(610,'2022-11-25','2022-11-25 10:30:00.000000','2022-11-25 11:00:00.000000',1,NULL,4,NULL),(611,'2022-11-25','2022-11-25 11:00:00.000000','2022-11-25 11:30:00.000000',1,NULL,4,NULL),(612,'2022-11-25','2022-11-25 11:30:00.000000','2022-11-25 12:00:00.000000',1,NULL,4,NULL),(613,'2022-11-25','2022-11-25 12:00:00.000000','2022-11-25 12:30:00.000000',1,NULL,4,NULL),(614,'2022-11-25','2022-11-25 12:30:00.000000','2022-11-25 13:00:00.000000',1,NULL,4,NULL),(615,'2022-11-25','2022-11-25 13:00:00.000000','2022-11-25 13:30:00.000000',1,NULL,4,NULL),(616,'2022-11-25','2022-11-25 13:30:00.000000','2022-11-25 14:00:00.000000',1,NULL,4,NULL),(617,'2022-11-25','2022-11-25 02:00:00.000000','2022-11-25 02:30:00.000000',1,NULL,5,NULL),(618,'2022-11-25','2022-11-25 02:30:00.000000','2022-11-25 03:00:00.000000',1,NULL,5,NULL),(619,'2022-11-25','2022-11-25 03:00:00.000000','2022-11-25 03:30:00.000000',1,NULL,5,NULL),(620,'2022-11-25','2022-11-25 03:30:00.000000','2022-11-25 04:00:00.000000',1,NULL,5,NULL),(621,'2022-11-25','2022-11-25 04:00:00.000000','2022-11-25 04:30:00.000000',1,NULL,5,NULL),(622,'2022-11-25','2022-11-25 04:30:00.000000','2022-11-25 05:00:00.000000',1,NULL,5,NULL),(623,'2022-11-25','2022-11-25 05:00:00.000000','2022-11-25 05:30:00.000000',1,NULL,5,NULL),(624,'2022-11-25','2022-11-25 05:30:00.000000','2022-11-25 06:00:00.000000',1,NULL,5,NULL),(625,'2022-11-25','2022-11-25 06:00:00.000000','2022-11-25 06:30:00.000000',1,NULL,5,NULL),(626,'2022-11-25','2022-11-25 06:30:00.000000','2022-11-25 07:00:00.000000',1,NULL,5,NULL),(627,'2022-11-25','2022-11-25 07:00:00.000000','2022-11-25 07:30:00.000000',1,NULL,5,NULL),(628,'2022-11-25','2022-11-25 07:30:00.000000','2022-11-25 08:00:00.000000',1,NULL,5,NULL),(629,'2022-11-25','2022-11-25 08:00:00.000000','2022-11-25 08:30:00.000000',1,NULL,5,NULL),(630,'2022-11-25','2022-11-25 08:30:00.000000','2022-11-25 09:00:00.000000',1,NULL,5,NULL),(631,'2022-11-25','2022-11-25 09:00:00.000000','2022-11-25 09:30:00.000000',1,NULL,5,NULL),(632,'2022-11-25','2022-11-25 09:30:00.000000','2022-11-25 10:00:00.000000',1,NULL,5,NULL),(633,'2022-11-25','2022-11-25 10:00:00.000000','2022-11-25 10:30:00.000000',1,NULL,5,NULL),(634,'2022-11-25','2022-11-25 10:30:00.000000','2022-11-25 11:00:00.000000',1,NULL,5,NULL),(635,'2022-11-25','2022-11-25 11:00:00.000000','2022-11-25 11:30:00.000000',1,NULL,5,NULL),(636,'2022-11-25','2022-11-25 11:30:00.000000','2022-11-25 12:00:00.000000',1,NULL,5,NULL),(637,'2022-11-25','2022-11-25 12:00:00.000000','2022-11-25 12:30:00.000000',1,NULL,5,NULL),(638,'2022-11-25','2022-11-25 12:30:00.000000','2022-11-25 13:00:00.000000',1,NULL,5,NULL),(639,'2022-11-25','2022-11-25 13:00:00.000000','2022-11-25 13:30:00.000000',1,NULL,5,NULL),(640,'2022-11-25','2022-11-25 13:30:00.000000','2022-11-25 14:00:00.000000',1,NULL,5,NULL),(641,'2022-11-28','2022-11-28 02:00:00.000000','2022-11-28 02:30:00.000000',1,NULL,1,NULL),(642,'2022-11-28','2022-11-28 02:30:00.000000','2022-11-28 03:00:00.000000',1,NULL,1,NULL),(643,'2022-11-28','2022-11-28 03:00:00.000000','2022-11-28 03:30:00.000000',1,NULL,1,NULL),(644,'2022-11-28','2022-11-28 03:30:00.000000','2022-11-28 04:00:00.000000',1,NULL,1,NULL),(645,'2022-11-28','2022-11-28 04:00:00.000000','2022-11-28 04:30:00.000000',1,NULL,1,NULL),(646,'2022-11-28','2022-11-28 04:30:00.000000','2022-11-28 05:00:00.000000',1,NULL,1,NULL),(647,'2022-11-28','2022-11-28 05:00:00.000000','2022-11-28 05:30:00.000000',1,NULL,1,NULL),(648,'2022-11-28','2022-11-28 05:30:00.000000','2022-11-28 06:00:00.000000',1,NULL,1,NULL),(649,'2022-11-28','2022-11-28 06:00:00.000000','2022-11-28 06:30:00.000000',1,NULL,1,NULL),(650,'2022-11-28','2022-11-28 06:30:00.000000','2022-11-28 07:00:00.000000',1,NULL,1,NULL),(651,'2022-11-28','2022-11-28 07:00:00.000000','2022-11-28 07:30:00.000000',1,NULL,1,NULL),(652,'2022-11-28','2022-11-28 07:30:00.000000','2022-11-28 08:00:00.000000',1,NULL,1,NULL),(653,'2022-11-28','2022-11-28 08:00:00.000000','2022-11-28 08:30:00.000000',1,NULL,1,NULL),(654,'2022-11-28','2022-11-28 08:30:00.000000','2022-11-28 09:00:00.000000',1,NULL,1,NULL),(655,'2022-11-28','2022-11-28 09:00:00.000000','2022-11-28 09:30:00.000000',1,NULL,1,NULL),(656,'2022-11-28','2022-11-28 09:30:00.000000','2022-11-28 10:00:00.000000',1,NULL,1,NULL),(657,'2022-11-28','2022-11-28 10:00:00.000000','2022-11-28 10:30:00.000000',1,NULL,1,NULL),(658,'2022-11-28','2022-11-28 10:30:00.000000','2022-11-28 11:00:00.000000',1,NULL,1,NULL),(659,'2022-11-28','2022-11-28 11:00:00.000000','2022-11-28 11:30:00.000000',1,NULL,1,NULL),(660,'2022-11-28','2022-11-28 11:30:00.000000','2022-11-28 12:00:00.000000',1,NULL,1,NULL),(661,'2022-11-28','2022-11-28 12:00:00.000000','2022-11-28 12:30:00.000000',1,NULL,1,NULL),(662,'2022-11-28','2022-11-28 12:30:00.000000','2022-11-28 13:00:00.000000',1,NULL,1,NULL),(663,'2022-11-28','2022-11-28 13:00:00.000000','2022-11-28 13:30:00.000000',1,NULL,1,NULL),(664,'2022-11-28','2022-11-28 13:30:00.000000','2022-11-28 14:00:00.000000',1,NULL,1,NULL),(665,'2022-11-28','2022-11-28 02:00:00.000000','2022-11-28 02:30:00.000000',1,NULL,2,NULL),(666,'2022-11-28','2022-11-28 02:30:00.000000','2022-11-28 03:00:00.000000',1,NULL,2,NULL),(667,'2022-11-28','2022-11-28 03:00:00.000000','2022-11-28 03:30:00.000000',1,NULL,2,NULL),(668,'2022-11-28','2022-11-28 03:30:00.000000','2022-11-28 04:00:00.000000',1,NULL,2,NULL),(669,'2022-11-28','2022-11-28 04:00:00.000000','2022-11-28 04:30:00.000000',1,NULL,2,NULL),(670,'2022-11-28','2022-11-28 04:30:00.000000','2022-11-28 05:00:00.000000',1,NULL,2,NULL),(671,'2022-11-28','2022-11-28 05:00:00.000000','2022-11-28 05:30:00.000000',1,NULL,2,NULL),(672,'2022-11-28','2022-11-28 05:30:00.000000','2022-11-28 06:00:00.000000',1,NULL,2,NULL),(673,'2022-11-28','2022-11-28 06:00:00.000000','2022-11-28 06:30:00.000000',1,NULL,2,NULL),(674,'2022-11-28','2022-11-28 06:30:00.000000','2022-11-28 07:00:00.000000',1,NULL,2,NULL),(675,'2022-11-28','2022-11-28 07:00:00.000000','2022-11-28 07:30:00.000000',1,NULL,2,NULL),(676,'2022-11-28','2022-11-28 07:30:00.000000','2022-11-28 08:00:00.000000',1,NULL,2,NULL),(677,'2022-11-28','2022-11-28 08:00:00.000000','2022-11-28 08:30:00.000000',1,NULL,2,NULL),(678,'2022-11-28','2022-11-28 08:30:00.000000','2022-11-28 09:00:00.000000',1,NULL,2,NULL),(679,'2022-11-28','2022-11-28 09:00:00.000000','2022-11-28 09:30:00.000000',1,NULL,2,NULL),(680,'2022-11-28','2022-11-28 09:30:00.000000','2022-11-28 10:00:00.000000',1,NULL,2,NULL),(681,'2022-11-28','2022-11-28 10:00:00.000000','2022-11-28 10:30:00.000000',1,NULL,2,NULL),(682,'2022-11-28','2022-11-28 10:30:00.000000','2022-11-28 11:00:00.000000',1,NULL,2,NULL),(683,'2022-11-28','2022-11-28 11:00:00.000000','2022-11-28 11:30:00.000000',1,NULL,2,NULL),(684,'2022-11-28','2022-11-28 11:30:00.000000','2022-11-28 12:00:00.000000',1,NULL,2,NULL),(685,'2022-11-28','2022-11-28 12:00:00.000000','2022-11-28 12:30:00.000000',1,NULL,2,NULL),(686,'2022-11-28','2022-11-28 12:30:00.000000','2022-11-28 13:00:00.000000',1,NULL,2,NULL),(687,'2022-11-28','2022-11-28 13:00:00.000000','2022-11-28 13:30:00.000000',1,NULL,2,NULL),(688,'2022-11-28','2022-11-28 13:30:00.000000','2022-11-28 14:00:00.000000',1,NULL,2,NULL),(689,'2022-11-28','2022-11-28 02:00:00.000000','2022-11-28 02:30:00.000000',1,NULL,3,NULL),(690,'2022-11-28','2022-11-28 02:30:00.000000','2022-11-28 03:00:00.000000',1,NULL,3,NULL),(691,'2022-11-28','2022-11-28 03:00:00.000000','2022-11-28 03:30:00.000000',1,NULL,3,NULL),(692,'2022-11-28','2022-11-28 03:30:00.000000','2022-11-28 04:00:00.000000',1,NULL,3,NULL),(693,'2022-11-28','2022-11-28 04:00:00.000000','2022-11-28 04:30:00.000000',1,NULL,3,NULL),(694,'2022-11-28','2022-11-28 04:30:00.000000','2022-11-28 05:00:00.000000',1,NULL,3,NULL),(695,'2022-11-28','2022-11-28 05:00:00.000000','2022-11-28 05:30:00.000000',1,NULL,3,NULL),(696,'2022-11-28','2022-11-28 05:30:00.000000','2022-11-28 06:00:00.000000',1,NULL,3,NULL),(697,'2022-11-28','2022-11-28 06:00:00.000000','2022-11-28 06:30:00.000000',1,NULL,3,NULL),(698,'2022-11-28','2022-11-28 06:30:00.000000','2022-11-28 07:00:00.000000',1,NULL,3,NULL),(699,'2022-11-28','2022-11-28 07:00:00.000000','2022-11-28 07:30:00.000000',1,NULL,3,NULL),(700,'2022-11-28','2022-11-28 07:30:00.000000','2022-11-28 08:00:00.000000',1,NULL,3,NULL),(701,'2022-11-28','2022-11-28 08:00:00.000000','2022-11-28 08:30:00.000000',1,NULL,3,NULL),(702,'2022-11-28','2022-11-28 08:30:00.000000','2022-11-28 09:00:00.000000',1,NULL,3,NULL),(703,'2022-11-28','2022-11-28 09:00:00.000000','2022-11-28 09:30:00.000000',1,NULL,3,NULL),(704,'2022-11-28','2022-11-28 09:30:00.000000','2022-11-28 10:00:00.000000',1,NULL,3,NULL),(705,'2022-11-28','2022-11-28 10:00:00.000000','2022-11-28 10:30:00.000000',1,NULL,3,NULL),(706,'2022-11-28','2022-11-28 10:30:00.000000','2022-11-28 11:00:00.000000',1,NULL,3,NULL),(707,'2022-11-28','2022-11-28 11:00:00.000000','2022-11-28 11:30:00.000000',1,NULL,3,NULL),(708,'2022-11-28','2022-11-28 11:30:00.000000','2022-11-28 12:00:00.000000',1,NULL,3,NULL),(709,'2022-11-28','2022-11-28 12:00:00.000000','2022-11-28 12:30:00.000000',1,NULL,3,NULL),(710,'2022-11-28','2022-11-28 12:30:00.000000','2022-11-28 13:00:00.000000',1,NULL,3,NULL),(711,'2022-11-28','2022-11-28 13:00:00.000000','2022-11-28 13:30:00.000000',1,NULL,3,NULL),(712,'2022-11-28','2022-11-28 13:30:00.000000','2022-11-28 14:00:00.000000',1,NULL,3,NULL),(713,'2022-11-28','2022-11-28 02:00:00.000000','2022-11-28 02:30:00.000000',1,NULL,4,NULL),(714,'2022-11-28','2022-11-28 02:30:00.000000','2022-11-28 03:00:00.000000',1,NULL,4,NULL),(715,'2022-11-28','2022-11-28 03:00:00.000000','2022-11-28 03:30:00.000000',1,NULL,4,NULL),(716,'2022-11-28','2022-11-28 03:30:00.000000','2022-11-28 04:00:00.000000',1,NULL,4,NULL),(717,'2022-11-28','2022-11-28 04:00:00.000000','2022-11-28 04:30:00.000000',1,NULL,4,NULL),(718,'2022-11-28','2022-11-28 04:30:00.000000','2022-11-28 05:00:00.000000',1,NULL,4,NULL),(719,'2022-11-28','2022-11-28 05:00:00.000000','2022-11-28 05:30:00.000000',1,NULL,4,NULL),(720,'2022-11-28','2022-11-28 05:30:00.000000','2022-11-28 06:00:00.000000',1,NULL,4,NULL),(721,'2022-11-28','2022-11-28 06:00:00.000000','2022-11-28 06:30:00.000000',1,NULL,4,NULL),(722,'2022-11-28','2022-11-28 06:30:00.000000','2022-11-28 07:00:00.000000',1,NULL,4,NULL),(723,'2022-11-28','2022-11-28 07:00:00.000000','2022-11-28 07:30:00.000000',1,NULL,4,NULL),(724,'2022-11-28','2022-11-28 07:30:00.000000','2022-11-28 08:00:00.000000',1,NULL,4,NULL),(725,'2022-11-28','2022-11-28 08:00:00.000000','2022-11-28 08:30:00.000000',1,NULL,4,NULL),(726,'2022-11-28','2022-11-28 08:30:00.000000','2022-11-28 09:00:00.000000',1,NULL,4,NULL),(727,'2022-11-28','2022-11-28 09:00:00.000000','2022-11-28 09:30:00.000000',1,NULL,4,NULL),(728,'2022-11-28','2022-11-28 09:30:00.000000','2022-11-28 10:00:00.000000',1,NULL,4,NULL),(729,'2022-11-28','2022-11-28 10:00:00.000000','2022-11-28 10:30:00.000000',1,NULL,4,NULL),(730,'2022-11-28','2022-11-28 10:30:00.000000','2022-11-28 11:00:00.000000',1,NULL,4,NULL),(731,'2022-11-28','2022-11-28 11:00:00.000000','2022-11-28 11:30:00.000000',1,NULL,4,NULL),(732,'2022-11-28','2022-11-28 11:30:00.000000','2022-11-28 12:00:00.000000',1,NULL,4,NULL),(733,'2022-11-28','2022-11-28 12:00:00.000000','2022-11-28 12:30:00.000000',1,NULL,4,NULL),(734,'2022-11-28','2022-11-28 12:30:00.000000','2022-11-28 13:00:00.000000',1,NULL,4,NULL),(735,'2022-11-28','2022-11-28 13:00:00.000000','2022-11-28 13:30:00.000000',1,NULL,4,NULL),(736,'2022-11-28','2022-11-28 13:30:00.000000','2022-11-28 14:00:00.000000',1,NULL,4,NULL),(737,'2022-11-28','2022-11-28 02:00:00.000000','2022-11-28 02:30:00.000000',1,NULL,5,NULL),(738,'2022-11-28','2022-11-28 02:30:00.000000','2022-11-28 03:00:00.000000',1,NULL,5,NULL),(739,'2022-11-28','2022-11-28 03:00:00.000000','2022-11-28 03:30:00.000000',1,NULL,5,NULL),(740,'2022-11-28','2022-11-28 03:30:00.000000','2022-11-28 04:00:00.000000',1,NULL,5,NULL),(741,'2022-11-28','2022-11-28 04:00:00.000000','2022-11-28 04:30:00.000000',1,NULL,5,NULL),(742,'2022-11-28','2022-11-28 04:30:00.000000','2022-11-28 05:00:00.000000',1,NULL,5,NULL),(743,'2022-11-28','2022-11-28 05:00:00.000000','2022-11-28 05:30:00.000000',1,NULL,5,NULL),(744,'2022-11-28','2022-11-28 05:30:00.000000','2022-11-28 06:00:00.000000',1,NULL,5,NULL),(745,'2022-11-28','2022-11-28 06:00:00.000000','2022-11-28 06:30:00.000000',1,NULL,5,NULL),(746,'2022-11-28','2022-11-28 06:30:00.000000','2022-11-28 07:00:00.000000',1,NULL,5,NULL),(747,'2022-11-28','2022-11-28 07:00:00.000000','2022-11-28 07:30:00.000000',1,NULL,5,NULL),(748,'2022-11-28','2022-11-28 07:30:00.000000','2022-11-28 08:00:00.000000',1,NULL,5,NULL),(749,'2022-11-28','2022-11-28 08:00:00.000000','2022-11-28 08:30:00.000000',1,NULL,5,NULL),(750,'2022-11-28','2022-11-28 08:30:00.000000','2022-11-28 09:00:00.000000',1,NULL,5,NULL),(751,'2022-11-28','2022-11-28 09:00:00.000000','2022-11-28 09:30:00.000000',1,NULL,5,NULL),(752,'2022-11-28','2022-11-28 09:30:00.000000','2022-11-28 10:00:00.000000',1,NULL,5,NULL),(753,'2022-11-28','2022-11-28 10:00:00.000000','2022-11-28 10:30:00.000000',1,NULL,5,NULL),(754,'2022-11-28','2022-11-28 10:30:00.000000','2022-11-28 11:00:00.000000',1,NULL,5,NULL),(755,'2022-11-28','2022-11-28 11:00:00.000000','2022-11-28 11:30:00.000000',1,NULL,5,NULL),(756,'2022-11-28','2022-11-28 11:30:00.000000','2022-11-28 12:00:00.000000',1,NULL,5,NULL),(757,'2022-11-28','2022-11-28 12:00:00.000000','2022-11-28 12:30:00.000000',1,NULL,5,NULL),(758,'2022-11-28','2022-11-28 12:30:00.000000','2022-11-28 13:00:00.000000',1,NULL,5,NULL),(759,'2022-11-28','2022-11-28 13:00:00.000000','2022-11-28 13:30:00.000000',1,NULL,5,NULL),(760,'2022-11-28','2022-11-28 13:30:00.000000','2022-11-28 14:00:00.000000',1,NULL,5,NULL);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'medical-center'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `event_add_schedule` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = cp866 */ ;;
/*!50003 SET character_set_results = cp866 */ ;;
/*!50003 SET collation_connection  = cp866_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `event_add_schedule` ON SCHEDULE EVERY 1 DAY STARTS '2022-11-18 19:16:38' ON COMPLETION NOT PRESERVE ENABLE DO CALL UpdateSchedule() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'medical-center'
--
/*!50003 DROP PROCEDURE IF EXISTS `UpdateSchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateSchedule`()
BEGIN 
	DECLARE currentDay DATE default CURDATE() + INTERVAL 7 DAY;
	DECLARE timefrom TIMESTAMP(6) default (TIMESTAMP(currentDay + INTERVAL 9 HOUR));
	DECLARE timeEnd TIMESTAMP(6) default (TIMESTAMP(currentDay + INTERVAL 21 HOUR));
    
    DECLARE finished INT;
    DECLARE doctorId INT;
    DECLARE doctorsCursor CURSOR FOR SELECT id FROM doctors;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
	
    IF (WEEKDAY(currentDay) < 5)
    THEN 
		OPEN doctorsCursor;
		addScheduleTime: LOOP
			FETCH doctorsCursor into doctorId;
            if(finished = 1) THEN
				LEAVE addScheduleTime;
			END IF;
			WHILE (timeFrom < timeEnd) DO
				INSERT INTO schedule(date, time_from, time_to, is_free, doctor_id)
				VALUES (currentDay, timeFrom, timefrom + INTERVAL 30 MINUTE, 1, doctorId);
					
				SET timeFrom = timeFrom + INTERVAL 30 MINUTE;
			END WHILE;
            SET timeFrom = TIMESTAMP(currentDay + INTERVAL 9 HOUR);
        END LOOP addScheduleTime;
        CLOSE doctorsCursor;
	END IF;
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

-- Dump completed on 2022-11-21  0:16:22
