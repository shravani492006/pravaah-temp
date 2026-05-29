-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 192.168.0.95    Database: pravaah
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `academic_years`
--

DROP TABLE IF EXISTS `academic_years`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_years` (
  `id` int NOT NULL AUTO_INCREMENT,
  `year_label` varchar(20) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_years`
--

LOCK TABLES `academic_years` WRITE;
/*!40000 ALTER TABLE `academic_years` DISABLE KEYS */;
/*!40000 ALTER TABLE `academic_years` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anisha`
--

DROP TABLE IF EXISTS `anisha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anisha` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anisha`
--

LOCK TABLES `anisha` WRITE;
/*!40000 ALTER TABLE `anisha` DISABLE KEYS */;
/*!40000 ALTER TABLE `anisha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_assessment`
--

DROP TABLE IF EXISTS `assessment_assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessment_assessment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assessment_name` varchar(100) NOT NULL,
  `assessment_type` varchar(20) NOT NULL,
  `due_date` date NOT NULL,
  `total_marks` int NOT NULL,
  `description` longtext NOT NULL,
  `batch_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_assessmen_batch_id_e0e67838_fk_batch_bat` (`batch_id`),
  CONSTRAINT `assessment_assessmen_batch_id_e0e67838_fk_batch_bat` FOREIGN KEY (`batch_id`) REFERENCES `batch_batchassignment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_assessment`
--

LOCK TABLES `assessment_assessment` WRITE;
/*!40000 ALTER TABLE `assessment_assessment` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_results`
--

DROP TABLE IF EXISTS `assessment_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessment_results` (
  `result_id` bigint NOT NULL AUTO_INCREMENT,
  `marks_obtained` decimal(6,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `submitted_at` datetime(6) DEFAULT NULL,
  `graded_at` datetime(6) DEFAULT NULL,
  `assessment_id` bigint NOT NULL,
  `enrollment_id` bigint NOT NULL,
  PRIMARY KEY (`result_id`),
  UNIQUE KEY `uniq_enrollment_assessment` (`enrollment_id`,`assessment_id`),
  KEY `assessment_results_assessment_id_50c612c1_fk_assessmen` (`assessment_id`),
  CONSTRAINT `assessment_results_assessment_id_50c612c1_fk_assessmen` FOREIGN KEY (`assessment_id`) REFERENCES `assessments` (`assessment_id`),
  CONSTRAINT `assessment_results_enrollment_id_5b3e715b_fk_enrollmen` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollments` (`enrollment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_results`
--

LOCK TABLES `assessment_results` WRITE;
/*!40000 ALTER TABLE `assessment_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessments`
--

DROP TABLE IF EXISTS `assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessments` (
  `assessment_id` bigint NOT NULL AUTO_INCREMENT,
  `assessment_name` varchar(150) NOT NULL,
  `assessment_type` varchar(60) NOT NULL,
  `total_marks` int unsigned NOT NULL,
  `passing_marks` int unsigned NOT NULL,
  `instructions` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `course_id` bigint NOT NULL,
  PRIMARY KEY (`assessment_id`),
  KEY `assessments_course_id_31b84cf0_fk_courses_tcm_course_id` (`course_id`),
  CONSTRAINT `assessments_course_id_31b84cf0_fk_courses_tcm_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_tcm` (`course_id`),
  CONSTRAINT `assessments_chk_1` CHECK ((`total_marks` >= 0)),
  CONSTRAINT `assessments_chk_2` CHECK ((`passing_marks` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessments`
--

LOCK TABLES `assessments` WRITE;
/*!40000 ALTER TABLE `assessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `attendance_id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(20) NOT NULL,
  `attendance_photo` varchar(100) DEFAULT NULL,
  `marked_at` datetime(6) NOT NULL,
  `enrollment_id` bigint NOT NULL,
  `session_id` bigint NOT NULL,
  PRIMARY KEY (`attendance_id`),
  UNIQUE KEY `uniq_enrollment_session_attendance` (`enrollment_id`,`session_id`),
  KEY `attendance_session_id_bdf747fa_fk_sessions_session_id` (`session_id`),
  CONSTRAINT `attendance_enrollment_id_be7ff56a_fk_enrollments_enrollment_id` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollments` (`enrollment_id`),
  CONSTRAINT `attendance_session_id_bdf747fa_fk_sessions_session_id` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_logs`
--

DROP TABLE IF EXISTS `audit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `module` varchar(50) NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `browser_agent` longtext,
  `timestamp` datetime(6) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_logs_user_id_752b0e2b_fk_users_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_logs`
--

LOCK TABLES `audit_logs` WRITE;
/*!40000 ALTER TABLE `audit_logs` DISABLE KEYS */;
INSERT INTO `audit_logs` VALUES (1,'Login Failed for gaurav.ghude@vit.edu.in','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 06:23:13.252035',NULL),(2,'Login Failed for gaurav.ghude@vit.edu.in','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 06:24:46.570532',NULL),(3,'Login Failed for gaurav.ghude@vit.edu.in','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 06:24:58.722545',NULL),(4,'Login Failed for gaurav.ghude@vit.edu.in','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 06:25:02.419015',NULL),(5,'Login Failed for gaurav.ghude@vit.edu.in','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 06:25:22.615705',NULL),(6,'Login Failed for gaurav.ghude@vit.edu.in','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 06:36:43.526000',NULL),(7,'Login Failed for gaurav.ghude@vit.edu.in','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 06:36:46.121439',NULL),(8,'Login Failed for gaurav.ghude@vit.edu.in','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 06:36:51.337415',NULL),(9,'Login Failed for gaurav.ghude@vit.edu.in','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 06:37:11.184287',NULL),(10,'Login Failed for gaurav.ghude@vit.edu.in','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 06:37:58.155748',NULL),(11,'Login Failed for gaurav.ghude@vit.edu.in','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 06:40:15.715269',NULL),(12,'Login Failed for gaurav.ghude@vit.edu.in','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 06:40:18.756578',NULL),(13,'Login Success','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 06:42:16.494795',1),(14,'User Registered','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 06:44:16.767166',2),(15,'Verification Email Sent','usermgmt','127.0.0.1',NULL,'2026-05-29 06:44:16.776733',2),(16,'Login Failed for t2949589@gmail.com','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 06:44:46.117250',NULL),(17,'Login Success','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 06:45:09.543972',2),(18,'Logout','usermgmt','127.0.0.1',NULL,'2026-05-29 06:47:32.448953',2),(19,'Login Success','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 06:47:37.649778',1),(20,'Login Success','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 07:05:33.014200',2),(21,'Logout','usermgmt','127.0.0.1',NULL,'2026-05-29 07:05:45.607635',2),(22,'Login Success','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 07:17:07.790352',1),(23,'Login Success','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 08:57:49.025013',1),(24,'Login Success','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 09:28:53.089105',1),(25,'Login Success','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 09:34:03.622294',1),(26,'User Registered','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 09:34:51.382417',5),(27,'Verification Email Sent','usermgmt','127.0.0.1',NULL,'2026-05-29 09:34:51.392234',5),(28,'Logout','usermgmt','127.0.0.1',NULL,'2026-05-29 09:35:43.697307',1),(29,'Login Failed for pivos50664@poesd.com','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 09:35:49.627731',NULL),(30,'Login Failed for pivos50664@poesd.com','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 09:36:00.740165',NULL),(31,'Login Failed for gauravghude2512@gmail.com','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 09:36:31.203615',NULL),(32,'Login Success','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 09:36:51.900628',1),(33,'Logout','usermgmt','127.0.0.1',NULL,'2026-05-29 09:40:11.711833',1),(34,'Login Success','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 09:40:22.005830',5),(35,'Logout','usermgmt','127.0.0.1',NULL,'2026-05-29 09:41:11.628823',5),(36,'Login Success','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.121.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36','2026-05-29 09:50:42.756764',1),(37,'Login Failed for harshada2576@gmail.com','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0','2026-05-29 10:01:43.371324',NULL),(38,'Login Failed for harshada2576@gmail.com','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0','2026-05-29 10:01:49.939516',NULL),(39,'Login Success','usermgmt','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0','2026-05-29 10:04:07.202246',6),(40,'Processed Trainer Payment: Shini Maam - Amount: 7500.0 (Completed)','accounts','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 10:57:02.730279',1),(41,'Processed Trainer Payment: Tukaram Sir - Amount: 3750.00 (Completed)','accounts','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 10:58:04.273644',1);
/*!40000 ALTER TABLE `audit_logs` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (4,'Accounts'),(8,'Hostel Admin'),(3,'Management'),(9,'Participant'),(5,'QA'),(1,'Super Admin'),(2,'System Admin'),(7,'Trainer'),(6,'Training Manager');
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
) ENGINE=InnoDB AUTO_INCREMENT=559 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (43,1,69),(44,1,70),(45,1,71),(46,1,72),(47,1,73),(48,1,74),(49,1,75),(50,1,76),(51,1,77),(52,1,78),(53,1,79),(54,1,80),(55,1,81),(56,1,82),(57,1,83),(58,1,84),(59,1,85),(60,1,86),(61,1,87),(62,1,88),(63,1,89),(64,1,90),(65,1,91),(66,1,92),(67,1,93),(68,1,94),(69,1,95),(5,2,77),(6,2,78),(7,2,79),(8,2,80),(9,2,81),(10,2,82),(11,2,83),(12,2,84),(13,2,85),(14,2,86),(15,2,87),(16,2,88),(17,2,89),(18,2,90),(19,2,91),(20,2,92),(21,2,93),(22,2,94),(23,2,95),(24,3,81),(25,3,82),(26,3,86),(27,3,87),(28,3,92),(29,3,93),(30,3,94),(31,3,95),(34,4,86),(32,4,88),(33,4,89),(35,5,90),(36,5,91),(37,5,94),(40,7,92),(41,7,93),(42,7,94),(70,7,169),(71,7,171),(144,7,611),(147,7,619),(38,9,94),(39,9,95);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=628 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',3,'add_permission'),(6,'Can change permission',3,'change_permission'),(7,'Can delete permission',3,'delete_permission'),(8,'Can view permission',3,'view_permission'),(9,'Can add group',2,'add_group'),(10,'Can change group',2,'change_group'),(11,'Can delete group',2,'delete_group'),(12,'Can view group',2,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add auth group',7,'add_authgroup'),(26,'Can change auth group',7,'change_authgroup'),(27,'Can delete auth group',7,'delete_authgroup'),(28,'Can view auth group',7,'view_authgroup'),(29,'Can add auth group permissions',8,'add_authgrouppermissions'),(30,'Can change auth group permissions',8,'change_authgrouppermissions'),(31,'Can delete auth group permissions',8,'delete_authgrouppermissions'),(32,'Can view auth group permissions',8,'view_authgrouppermissions'),(33,'Can add auth permission',9,'add_authpermission'),(34,'Can change auth permission',9,'change_authpermission'),(35,'Can delete auth permission',9,'delete_authpermission'),(36,'Can view auth permission',9,'view_authpermission'),(37,'Can add auth user',10,'add_authuser'),(38,'Can change auth user',10,'change_authuser'),(39,'Can delete auth user',10,'delete_authuser'),(40,'Can view auth user',10,'view_authuser'),(41,'Can add auth user groups',11,'add_authusergroups'),(42,'Can change auth user groups',11,'change_authusergroups'),(43,'Can delete auth user groups',11,'delete_authusergroups'),(44,'Can view auth user groups',11,'view_authusergroups'),(45,'Can add auth user user permissions',12,'add_authuseruserpermissions'),(46,'Can change auth user user permissions',12,'change_authuseruserpermissions'),(47,'Can delete auth user user permissions',12,'delete_authuseruserpermissions'),(48,'Can view auth user user permissions',12,'view_authuseruserpermissions'),(49,'Can add commonservices activity',13,'add_commonservicesactivity'),(50,'Can change commonservices activity',13,'change_commonservicesactivity'),(51,'Can delete commonservices activity',13,'delete_commonservicesactivity'),(52,'Can view commonservices activity',13,'view_commonservicesactivity'),(53,'Can add django admin log',14,'add_djangoadminlog'),(54,'Can change django admin log',14,'change_djangoadminlog'),(55,'Can delete django admin log',14,'delete_djangoadminlog'),(56,'Can view django admin log',14,'view_djangoadminlog'),(57,'Can add django content type',15,'add_djangocontenttype'),(58,'Can change django content type',15,'change_djangocontenttype'),(59,'Can delete django content type',15,'delete_djangocontenttype'),(60,'Can view django content type',15,'view_djangocontenttype'),(61,'Can add django migrations',16,'add_djangomigrations'),(62,'Can change django migrations',16,'change_djangomigrations'),(63,'Can delete django migrations',16,'delete_djangomigrations'),(64,'Can view django migrations',16,'view_djangomigrations'),(65,'Can add django session',17,'add_djangosession'),(66,'Can change django session',17,'change_djangosession'),(67,'Can delete django session',17,'delete_djangosession'),(68,'Can view django session',17,'view_djangosession'),(69,'Can add user',20,'add_user'),(70,'Can change user',20,'change_user'),(71,'Can delete user',20,'delete_user'),(72,'Can view user',20,'view_user'),(73,'Can add audit log',18,'add_auditlog'),(74,'Can change audit log',18,'change_auditlog'),(75,'Can delete audit log',18,'delete_auditlog'),(76,'Can view audit log',18,'view_auditlog'),(77,'Can add rbac permission proxy',19,'add_rbacpermissionproxy'),(78,'Can change rbac permission proxy',19,'change_rbacpermissionproxy'),(79,'Can delete rbac permission proxy',19,'delete_rbacpermissionproxy'),(80,'Can view rbac permission proxy',19,'view_rbacpermissionproxy'),(81,'Can view central security dashboard layout',19,'can_view_admin_dashboard'),(82,'Can view global cross-reference matrix grid',19,'can_view_permission_matrix'),(83,'Can alter granular privileges or override tokens',19,'can_modify_permissions'),(84,'Can create, update, or delete system groups',19,'can_manage_roles'),(85,'Can map user accounts to defined groups',19,'can_assign_roles'),(86,'Can read high-level analytical business summaries',19,'can_view_management_reports'),(87,'Can authorize institutional operational overrides',19,'can_approve_requests'),(88,'Can read accounting ledgers and payment histories',19,'can_view_finance_dashboard'),(89,'Can process invoices and update payment parameters',19,'can_manage_finance'),(90,'Can read automated testing output metrics and system reports',19,'can_view_qa_logs'),(91,'Can log, modify, or track software verification modules',19,'can_manage_qa_tickets'),(92,'Can read student records and profiles (Lower Level Access)',19,'can_view_student_profiles'),(93,'Can read trainer contact parameters (Lower Level Access)',19,'can_view_trainer_profiles'),(94,'Can read syllabus blueprints and batch timings (Lower Level Access)',19,'can_view_course_details'),(95,'Can read room vacancy layouts and allocation maps (Lower Level Access)',19,'can_view_hostel_status'),(96,'Can add anisha',21,'add_anisha'),(97,'Can change anisha',21,'change_anisha'),(98,'Can delete anisha',21,'delete_anisha'),(99,'Can view anisha',21,'view_anisha'),(100,'Can add student',22,'add_student'),(101,'Can change student',22,'change_student'),(102,'Can delete student',22,'delete_student'),(103,'Can view student',22,'view_student'),(104,'Can add student guardian',23,'add_studentguardian'),(105,'Can change student guardian',23,'change_studentguardian'),(106,'Can delete student guardian',23,'delete_studentguardian'),(107,'Can view student guardian',23,'view_studentguardian'),(108,'Can add course',24,'add_course'),(109,'Can change course',24,'change_course'),(110,'Can delete course',24,'delete_course'),(111,'Can view course',24,'view_course'),(112,'Can add role',25,'add_role'),(113,'Can change role',25,'change_role'),(114,'Can delete role',25,'delete_role'),(115,'Can view role',25,'view_role'),(116,'Can add user',26,'add_user'),(117,'Can change user',26,'change_user'),(118,'Can delete user',26,'delete_user'),(119,'Can view user',26,'view_user'),(120,'Can add user role',27,'add_userrole'),(121,'Can change user role',27,'change_userrole'),(122,'Can delete user role',27,'delete_userrole'),(123,'Can view user role',27,'view_userrole'),(124,'Can add academic year',28,'add_academicyear'),(125,'Can change academic year',28,'change_academicyear'),(126,'Can delete academic year',28,'delete_academicyear'),(127,'Can view academic year',28,'view_academicyear'),(128,'Can add city',29,'add_city'),(129,'Can change city',29,'change_city'),(130,'Can delete city',29,'delete_city'),(131,'Can view city',29,'view_city'),(132,'Can add course',30,'add_course'),(133,'Can change course',30,'change_course'),(134,'Can delete course',30,'delete_course'),(135,'Can view course',30,'view_course'),(136,'Can add course category',31,'add_coursecategory'),(137,'Can change course category',31,'change_coursecategory'),(138,'Can delete course category',31,'delete_coursecategory'),(139,'Can view course category',31,'view_coursecategory'),(140,'Can add gender',32,'add_gender'),(141,'Can change gender',32,'change_gender'),(142,'Can delete gender',32,'delete_gender'),(143,'Can view gender',32,'view_gender'),(144,'Can add room type',37,'add_roomtype'),(145,'Can change room type',37,'change_roomtype'),(146,'Can delete room type',37,'delete_roomtype'),(147,'Can view room type',37,'view_roomtype'),(148,'Can add status master',38,'add_statusmaster'),(149,'Can change status master',38,'change_statusmaster'),(150,'Can delete status master',38,'delete_statusmaster'),(151,'Can view status master',38,'view_statusmaster'),(152,'Can add module',34,'add_module'),(153,'Can change module',34,'change_module'),(154,'Can delete module',34,'delete_module'),(155,'Can view module',34,'view_module'),(156,'Can add material',33,'add_material'),(157,'Can change material',33,'change_material'),(158,'Can delete material',33,'delete_material'),(159,'Can view material',33,'view_material'),(160,'Can add program',35,'add_program'),(161,'Can change program',35,'change_program'),(162,'Can delete program',35,'delete_program'),(163,'Can view program',35,'view_program'),(164,'Can add program course',36,'add_programcourse'),(165,'Can change program course',36,'change_programcourse'),(166,'Can delete program course',36,'delete_programcourse'),(167,'Can view program course',36,'view_programcourse'),(168,'Can add trainer',42,'add_trainer'),(169,'Can change trainer',42,'change_trainer'),(170,'Can delete trainer',42,'delete_trainer'),(171,'Can view trainer',42,'view_trainer'),(172,'Can add certification',39,'add_certification'),(173,'Can change certification',39,'change_certification'),(174,'Can delete certification',39,'delete_certification'),(175,'Can view certification',39,'view_certification'),(176,'Can add program trainer',41,'add_programtrainer'),(177,'Can change program trainer',41,'change_programtrainer'),(178,'Can delete program trainer',41,'delete_programtrainer'),(179,'Can view program trainer',41,'view_programtrainer'),(180,'Can add course trainer',40,'add_coursetrainer'),(181,'Can change course trainer',40,'change_coursetrainer'),(182,'Can delete course trainer',40,'delete_coursetrainer'),(183,'Can view course trainer',40,'view_coursetrainer'),(184,'Can add trainer skill',43,'add_trainerskill'),(185,'Can change trainer skill',43,'change_trainerskill'),(186,'Can delete trainer skill',43,'delete_trainerskill'),(187,'Can view trainer skill',43,'view_trainerskill'),(188,'Can add student',44,'add_student'),(189,'Can change student',44,'change_student'),(190,'Can delete student',44,'delete_student'),(191,'Can view student',44,'view_student'),(192,'Can add student guardian',45,'add_studentguardian'),(193,'Can change student guardian',45,'change_studentguardian'),(194,'Can delete student guardian',45,'delete_studentguardian'),(195,'Can view student guardian',45,'view_studentguardian'),(196,'Can add batch',46,'add_batch'),(197,'Can change batch',46,'change_batch'),(198,'Can delete batch',46,'delete_batch'),(199,'Can view batch',46,'view_batch'),(200,'Can add session',48,'add_session'),(201,'Can change session',48,'change_session'),(202,'Can delete session',48,'delete_session'),(203,'Can view session',48,'view_session'),(204,'Can add enrollment',47,'add_enrollment'),(205,'Can change enrollment',47,'change_enrollment'),(206,'Can delete enrollment',47,'delete_enrollment'),(207,'Can view enrollment',47,'view_enrollment'),(208,'Can add attendance',49,'add_attendance'),(209,'Can change attendance',49,'change_attendance'),(210,'Can delete attendance',49,'delete_attendance'),(211,'Can view attendance',49,'view_attendance'),(212,'Can add assessment',50,'add_assessment'),(213,'Can change assessment',50,'change_assessment'),(214,'Can delete assessment',50,'delete_assessment'),(215,'Can view assessment',50,'view_assessment'),(216,'Can add assessment result',51,'add_assessmentresult'),(217,'Can change assessment result',51,'change_assessmentresult'),(218,'Can delete assessment result',51,'delete_assessmentresult'),(219,'Can view assessment result',51,'view_assessmentresult'),(220,'Can add certificate',52,'add_certificate'),(221,'Can change certificate',52,'change_certificate'),(222,'Can delete certificate',52,'delete_certificate'),(223,'Can view certificate',52,'view_certificate'),(224,'Can add block',53,'add_block'),(225,'Can change block',53,'change_block'),(226,'Can delete block',53,'delete_block'),(227,'Can view block',53,'view_block'),(228,'Can add hostel',57,'add_hostel'),(229,'Can change hostel',57,'change_hostel'),(230,'Can delete hostel',57,'delete_hostel'),(231,'Can view hostel',57,'view_hostel'),(232,'Can add visitor',62,'add_visitor'),(233,'Can change visitor',62,'change_visitor'),(234,'Can delete visitor',62,'delete_visitor'),(235,'Can view visitor',62,'view_visitor'),(236,'Can add floor',56,'add_floor'),(237,'Can change floor',56,'change_floor'),(238,'Can delete floor',56,'delete_floor'),(239,'Can view floor',56,'view_floor'),(240,'Can add room',59,'add_room'),(241,'Can change room',59,'change_room'),(242,'Can delete room',59,'delete_room'),(243,'Can view room',59,'view_room'),(244,'Can add maintenance request',58,'add_maintenancerequest'),(245,'Can change maintenance request',58,'change_maintenancerequest'),(246,'Can delete maintenance request',58,'delete_maintenancerequest'),(247,'Can view maintenance request',58,'view_maintenancerequest'),(248,'Can add complaint',54,'add_complaint'),(249,'Can change complaint',54,'change_complaint'),(250,'Can delete complaint',54,'delete_complaint'),(251,'Can view complaint',54,'view_complaint'),(252,'Can add room allocation',60,'add_roomallocation'),(253,'Can change room allocation',60,'change_roomallocation'),(254,'Can delete room allocation',60,'delete_roomallocation'),(255,'Can view room allocation',60,'view_roomallocation'),(256,'Can add fee payment',55,'add_feepayment'),(257,'Can change fee payment',55,'change_feepayment'),(258,'Can delete fee payment',55,'delete_feepayment'),(259,'Can view fee payment',55,'view_feepayment'),(260,'Can add room transfer',61,'add_roomtransfer'),(261,'Can change room transfer',61,'change_roomtransfer'),(262,'Can delete room transfer',61,'delete_roomtransfer'),(263,'Can view room transfer',61,'view_roomtransfer'),(264,'Can add waiting list',63,'add_waitinglist'),(265,'Can change waiting list',63,'change_waitinglist'),(266,'Can delete waiting list',63,'delete_waitinglist'),(267,'Can view waiting list',63,'view_waitinglist'),(268,'Can add trainer skill',66,'add_trainerskill'),(269,'Can change trainer skill',66,'change_trainerskill'),(270,'Can delete trainer skill',66,'delete_trainerskill'),(271,'Can view trainer skill',66,'view_trainerskill'),(272,'Can add trainer payment',65,'add_trainerpayment'),(273,'Can change trainer payment',65,'change_trainerpayment'),(274,'Can delete trainer payment',65,'delete_trainerpayment'),(275,'Can view trainer payment',65,'view_trainerpayment'),(276,'Can add trainer',64,'add_trainer'),(277,'Can change trainer',64,'change_trainer'),(278,'Can delete trainer',64,'delete_trainer'),(279,'Can view trainer',64,'view_trainer'),(280,'Can add academic years',67,'add_academicyears'),(281,'Can change academic years',67,'change_academicyears'),(282,'Can delete academic years',67,'delete_academicyears'),(283,'Can view academic years',67,'view_academicyears'),(284,'Can add anisha',68,'add_anisha'),(285,'Can change anisha',68,'change_anisha'),(286,'Can delete anisha',68,'delete_anisha'),(287,'Can view anisha',68,'view_anisha'),(288,'Can add assessment results',69,'add_assessmentresults'),(289,'Can change assessment results',69,'change_assessmentresults'),(290,'Can delete assessment results',69,'delete_assessmentresults'),(291,'Can view assessment results',69,'view_assessmentresults'),(292,'Can add assessments',70,'add_assessments'),(293,'Can change assessments',70,'change_assessments'),(294,'Can delete assessments',70,'delete_assessments'),(295,'Can view assessments',70,'view_assessments'),(296,'Can add attendance',71,'add_attendance'),(297,'Can change attendance',71,'change_attendance'),(298,'Can delete attendance',71,'delete_attendance'),(299,'Can view attendance',71,'view_attendance'),(300,'Can add audit logs',72,'add_auditlogs'),(301,'Can change audit logs',72,'change_auditlogs'),(302,'Can delete audit logs',72,'delete_auditlogs'),(303,'Can view audit logs',72,'view_auditlogs'),(304,'Can add auth group',73,'add_authgroup'),(305,'Can change auth group',73,'change_authgroup'),(306,'Can delete auth group',73,'delete_authgroup'),(307,'Can view auth group',73,'view_authgroup'),(308,'Can add auth group permissions',74,'add_authgrouppermissions'),(309,'Can change auth group permissions',74,'change_authgrouppermissions'),(310,'Can delete auth group permissions',74,'delete_authgrouppermissions'),(311,'Can view auth group permissions',74,'view_authgrouppermissions'),(312,'Can add auth permission',75,'add_authpermission'),(313,'Can change auth permission',75,'change_authpermission'),(314,'Can delete auth permission',75,'delete_authpermission'),(315,'Can view auth permission',75,'view_authpermission'),(316,'Can add batches',76,'add_batches'),(317,'Can change batches',76,'change_batches'),(318,'Can delete batches',76,'delete_batches'),(319,'Can view batches',76,'view_batches'),(320,'Can add blocks',77,'add_blocks'),(321,'Can change blocks',77,'change_blocks'),(322,'Can delete blocks',77,'delete_blocks'),(323,'Can view blocks',77,'view_blocks'),(324,'Can add certificates',78,'add_certificates'),(325,'Can change certificates',78,'change_certificates'),(326,'Can delete certificates',78,'delete_certificates'),(327,'Can view certificates',78,'view_certificates'),(328,'Can add certifications',79,'add_certifications'),(329,'Can change certifications',79,'change_certifications'),(330,'Can delete certifications',79,'delete_certifications'),(331,'Can view certifications',79,'view_certifications'),(332,'Can add cities',80,'add_cities'),(333,'Can change cities',80,'change_cities'),(334,'Can delete cities',80,'delete_cities'),(335,'Can view cities',80,'view_cities'),(336,'Can add complaints',81,'add_complaints'),(337,'Can change complaints',81,'change_complaints'),(338,'Can delete complaints',81,'delete_complaints'),(339,'Can view complaints',81,'view_complaints'),(340,'Can add course categories',82,'add_coursecategories'),(341,'Can change course categories',82,'change_coursecategories'),(342,'Can delete course categories',82,'delete_coursecategories'),(343,'Can view course categories',82,'view_coursecategories'),(344,'Can add courses',83,'add_courses'),(345,'Can change courses',83,'change_courses'),(346,'Can delete courses',83,'delete_courses'),(347,'Can view courses',83,'view_courses'),(348,'Can add courses tcm',84,'add_coursestcm'),(349,'Can change courses tcm',84,'change_coursestcm'),(350,'Can delete courses tcm',84,'delete_coursestcm'),(351,'Can view courses tcm',84,'view_coursestcm'),(352,'Can add course trainers',85,'add_coursetrainers'),(353,'Can change course trainers',85,'change_coursetrainers'),(354,'Can delete course trainers',85,'delete_coursetrainers'),(355,'Can view course trainers',85,'view_coursetrainers'),(356,'Can add dashboard',86,'add_dashboard'),(357,'Can change dashboard',86,'change_dashboard'),(358,'Can delete dashboard',86,'delete_dashboard'),(359,'Can view dashboard',86,'view_dashboard'),(360,'Can add dashboard activity log',87,'add_dashboardactivitylog'),(361,'Can change dashboard activity log',87,'change_dashboardactivitylog'),(362,'Can delete dashboard activity log',87,'delete_dashboardactivitylog'),(363,'Can view dashboard activity log',87,'view_dashboardactivitylog'),(364,'Can add dashboard activitylog table',88,'add_dashboardactivitylogtable'),(365,'Can change dashboard activitylog table',88,'change_dashboardactivitylogtable'),(366,'Can delete dashboard activitylog table',88,'delete_dashboardactivitylogtable'),(367,'Can view dashboard activitylog table',88,'view_dashboardactivitylogtable'),(368,'Can add dashboard dashboardcard',89,'add_dashboarddashboardcard'),(369,'Can change dashboard dashboardcard',89,'change_dashboarddashboardcard'),(370,'Can delete dashboard dashboardcard',89,'delete_dashboarddashboardcard'),(371,'Can view dashboard dashboardcard',89,'view_dashboarddashboardcard'),(372,'Can add dashboard notification',90,'add_dashboardnotification'),(373,'Can change dashboard notification',90,'change_dashboardnotification'),(374,'Can delete dashboard notification',90,'delete_dashboardnotification'),(375,'Can view dashboard notification',90,'view_dashboardnotification'),(376,'Can add dashboard quick links',91,'add_dashboardquicklinks'),(377,'Can change dashboard quick links',91,'change_dashboardquicklinks'),(378,'Can delete dashboard quick links',91,'delete_dashboardquicklinks'),(379,'Can view dashboard quick links',91,'view_dashboardquicklinks'),(380,'Can add django admin log',92,'add_djangoadminlog'),(381,'Can change django admin log',92,'change_djangoadminlog'),(382,'Can delete django admin log',92,'delete_djangoadminlog'),(383,'Can view django admin log',92,'view_djangoadminlog'),(384,'Can add django content type',93,'add_djangocontenttype'),(385,'Can change django content type',93,'change_djangocontenttype'),(386,'Can delete django content type',93,'delete_djangocontenttype'),(387,'Can view django content type',93,'view_djangocontenttype'),(388,'Can add django migrations',94,'add_djangomigrations'),(389,'Can change django migrations',94,'change_djangomigrations'),(390,'Can delete django migrations',94,'delete_djangomigrations'),(391,'Can view django migrations',94,'view_djangomigrations'),(392,'Can add django session',95,'add_djangosession'),(393,'Can change django session',95,'change_djangosession'),(394,'Can delete django session',95,'delete_djangosession'),(395,'Can view django session',95,'view_djangosession'),(396,'Can add enrollments',96,'add_enrollments'),(397,'Can change enrollments',96,'change_enrollments'),(398,'Can delete enrollments',96,'delete_enrollments'),(399,'Can view enrollments',96,'view_enrollments'),(400,'Can add fee payments',97,'add_feepayments'),(401,'Can change fee payments',97,'change_feepayments'),(402,'Can delete fee payments',97,'delete_feepayments'),(403,'Can view fee payments',97,'view_feepayments'),(404,'Can add floors',98,'add_floors'),(405,'Can change floors',98,'change_floors'),(406,'Can delete floors',98,'delete_floors'),(407,'Can view floors',98,'view_floors'),(408,'Can add gaurav user',99,'add_gauravuser'),(409,'Can change gaurav user',99,'change_gauravuser'),(410,'Can delete gaurav user',99,'delete_gauravuser'),(411,'Can view gaurav user',99,'view_gauravuser'),(412,'Can add gaurav user groups',100,'add_gauravusergroups'),(413,'Can change gaurav user groups',100,'change_gauravusergroups'),(414,'Can delete gaurav user groups',100,'delete_gauravusergroups'),(415,'Can view gaurav user groups',100,'view_gauravusergroups'),(416,'Can add gaurav user user permissions',101,'add_gauravuseruserpermissions'),(417,'Can change gaurav user user permissions',101,'change_gauravuseruserpermissions'),(418,'Can delete gaurav user user permissions',101,'delete_gauravuseruserpermissions'),(419,'Can view gaurav user user permissions',101,'view_gauravuseruserpermissions'),(420,'Can add genders',102,'add_genders'),(421,'Can change genders',102,'change_genders'),(422,'Can delete genders',102,'delete_genders'),(423,'Can view genders',102,'view_genders'),(424,'Can add hostelmgmt block',103,'add_hostelmgmtblock'),(425,'Can change hostelmgmt block',103,'change_hostelmgmtblock'),(426,'Can delete hostelmgmt block',103,'delete_hostelmgmtblock'),(427,'Can view hostelmgmt block',103,'view_hostelmgmtblock'),(428,'Can add hostelmgmt floor',104,'add_hostelmgmtfloor'),(429,'Can change hostelmgmt floor',104,'change_hostelmgmtfloor'),(430,'Can delete hostelmgmt floor',104,'delete_hostelmgmtfloor'),(431,'Can view hostelmgmt floor',104,'view_hostelmgmtfloor'),(432,'Can add hostelmgmt hostel',105,'add_hostelmgmthostel'),(433,'Can change hostelmgmt hostel',105,'change_hostelmgmthostel'),(434,'Can delete hostelmgmt hostel',105,'delete_hostelmgmthostel'),(435,'Can view hostelmgmt hostel',105,'view_hostelmgmthostel'),(436,'Can add hostelmgmt visitor',106,'add_hostelmgmtvisitor'),(437,'Can change hostelmgmt visitor',106,'change_hostelmgmtvisitor'),(438,'Can delete hostelmgmt visitor',106,'delete_hostelmgmtvisitor'),(439,'Can view hostelmgmt visitor',106,'view_hostelmgmtvisitor'),(440,'Can add hostels',107,'add_hostels'),(441,'Can change hostels',107,'change_hostels'),(442,'Can delete hostels',107,'delete_hostels'),(443,'Can view hostels',107,'view_hostels'),(444,'Can add maintenance requests',108,'add_maintenancerequests'),(445,'Can change maintenance requests',108,'change_maintenancerequests'),(446,'Can delete maintenance requests',108,'delete_maintenancerequests'),(447,'Can view maintenance requests',108,'view_maintenancerequests'),(448,'Can add materials',109,'add_materials'),(449,'Can change materials',109,'change_materials'),(450,'Can delete materials',109,'delete_materials'),(451,'Can view materials',109,'view_materials'),(452,'Can add modules',110,'add_modules'),(453,'Can change modules',110,'change_modules'),(454,'Can delete modules',110,'delete_modules'),(455,'Can view modules',110,'view_modules'),(456,'Can add participant guardians',111,'add_participantguardians'),(457,'Can change participant guardians',111,'change_participantguardians'),(458,'Can delete participant guardians',111,'delete_participantguardians'),(459,'Can view participant guardians',111,'view_participantguardians'),(460,'Can add participants',112,'add_participants'),(461,'Can change participants',112,'change_participants'),(462,'Can delete participants',112,'delete_participants'),(463,'Can view participants',112,'view_participants'),(464,'Can add program courses',113,'add_programcourses'),(465,'Can change program courses',113,'change_programcourses'),(466,'Can delete program courses',113,'delete_programcourses'),(467,'Can view program courses',113,'view_programcourses'),(468,'Can add programs',114,'add_programs'),(469,'Can change programs',114,'change_programs'),(470,'Can delete programs',114,'delete_programs'),(471,'Can view programs',114,'view_programs'),(472,'Can add program trainers',115,'add_programtrainers'),(473,'Can change program trainers',115,'change_programtrainers'),(474,'Can delete program trainers',115,'delete_programtrainers'),(475,'Can view program trainers',115,'view_programtrainers'),(476,'Can add roles',116,'add_roles'),(477,'Can change roles',116,'change_roles'),(478,'Can delete roles',116,'delete_roles'),(479,'Can view roles',116,'view_roles'),(480,'Can add room allocations',117,'add_roomallocations'),(481,'Can change room allocations',117,'change_roomallocations'),(482,'Can delete room allocations',117,'delete_roomallocations'),(483,'Can view room allocations',117,'view_roomallocations'),(484,'Can add rooms',118,'add_rooms'),(485,'Can change rooms',118,'change_rooms'),(486,'Can delete rooms',118,'delete_rooms'),(487,'Can view rooms',118,'view_rooms'),(488,'Can add room transfers',119,'add_roomtransfers'),(489,'Can change room transfers',119,'change_roomtransfers'),(490,'Can delete room transfers',119,'delete_roomtransfers'),(491,'Can view room transfers',119,'view_roomtransfers'),(492,'Can add room types',120,'add_roomtypes'),(493,'Can change room types',120,'change_roomtypes'),(494,'Can delete room types',120,'delete_roomtypes'),(495,'Can view room types',120,'view_roomtypes'),(496,'Can add sessions',121,'add_sessions'),(497,'Can change sessions',121,'change_sessions'),(498,'Can delete sessions',121,'delete_sessions'),(499,'Can view sessions',121,'view_sessions'),(500,'Can add status master',122,'add_statusmaster'),(501,'Can change status master',122,'change_statusmaster'),(502,'Can delete status master',122,'delete_statusmaster'),(503,'Can view status master',122,'view_statusmaster'),(504,'Can add student guardians',123,'add_studentguardians'),(505,'Can change student guardians',123,'change_studentguardians'),(506,'Can delete student guardians',123,'delete_studentguardians'),(507,'Can view student guardians',123,'view_studentguardians'),(508,'Can add students',124,'add_students'),(509,'Can change students',124,'change_students'),(510,'Can delete students',124,'delete_students'),(511,'Can view students',124,'view_students'),(512,'Can add students attendance',125,'add_studentsattendance'),(513,'Can change students attendance',125,'change_studentsattendance'),(514,'Can delete students attendance',125,'delete_studentsattendance'),(515,'Can view students attendance',125,'view_studentsattendance'),(516,'Can add students notification',126,'add_studentsnotification'),(517,'Can change students notification',126,'change_studentsnotification'),(518,'Can delete students notification',126,'delete_studentsnotification'),(519,'Can view students notification',126,'view_studentsnotification'),(520,'Can add students result',127,'add_studentsresult'),(521,'Can change students result',127,'change_studentsresult'),(522,'Can delete students result',127,'delete_studentsresult'),(523,'Can view students result',127,'view_studentsresult'),(524,'Can add test',128,'add_test'),(525,'Can change test',128,'change_test'),(526,'Can delete test',128,'delete_test'),(527,'Can view test',128,'view_test'),(528,'Can add trainer payments',130,'add_trainerpayments'),(529,'Can change trainer payments',130,'change_trainerpayments'),(530,'Can delete trainer payments',130,'delete_trainerpayments'),(531,'Can view trainer payments',130,'view_trainerpayments'),(532,'Can add trainers',131,'add_trainers'),(533,'Can change trainers',131,'change_trainers'),(534,'Can delete trainers',131,'delete_trainers'),(535,'Can view trainers',131,'view_trainers'),(536,'Can add trainer skills',132,'add_trainerskills'),(537,'Can change trainer skills',132,'change_trainerskills'),(538,'Can delete trainer skills',132,'delete_trainerskills'),(539,'Can view trainer skills',132,'view_trainerskills'),(540,'Can add user roles',133,'add_userroles'),(541,'Can change user roles',133,'change_userroles'),(542,'Can delete user roles',133,'delete_userroles'),(543,'Can view user roles',133,'view_userroles'),(544,'Can add users',134,'add_users'),(545,'Can change users',134,'change_users'),(546,'Can delete users',134,'delete_users'),(547,'Can view users',134,'view_users'),(548,'Can add visitors',135,'add_visitors'),(549,'Can change visitors',135,'change_visitors'),(550,'Can delete visitors',135,'delete_visitors'),(551,'Can view visitors',135,'view_visitors'),(552,'Can add waiting list',136,'add_waitinglist'),(553,'Can change waiting list',136,'change_waitinglist'),(554,'Can delete waiting list',136,'delete_waitinglist'),(555,'Can view waiting list',136,'view_waitinglist'),(556,'Can add trainer payment',129,'add_trainerpayment'),(557,'Can change trainer payment',129,'change_trainerpayment'),(558,'Can delete trainer payment',129,'delete_trainerpayment'),(559,'Can view trainer payment',129,'view_trainerpayment'),(560,'Can add user profile',139,'add_userprofile'),(561,'Can change user profile',139,'change_userprofile'),(562,'Can delete user profile',139,'delete_userprofile'),(563,'Can view user profile',139,'view_userprofile'),(564,'Can add external batch',144,'add_externalbatch'),(565,'Can change external batch',144,'change_externalbatch'),(566,'Can delete external batch',144,'delete_externalbatch'),(567,'Can view external batch',144,'view_externalbatch'),(568,'Can add external student',145,'add_externalstudent'),(569,'Can change external student',145,'change_externalstudent'),(570,'Can delete external student',145,'delete_externalstudent'),(571,'Can view external student',145,'view_externalstudent'),(572,'Can add skill',147,'add_skill'),(573,'Can change skill',147,'change_skill'),(574,'Can delete skill',147,'delete_skill'),(575,'Can view skill',147,'view_skill'),(576,'Can add assessment',140,'add_assessment'),(577,'Can change assessment',140,'change_assessment'),(578,'Can delete assessment',140,'delete_assessment'),(579,'Can view assessment',140,'view_assessment'),(580,'Can add feedback form',146,'add_feedbackform'),(581,'Can change feedback form',146,'change_feedbackform'),(582,'Can delete feedback form',146,'delete_feedbackform'),(583,'Can view feedback form',146,'view_feedbackform'),(584,'Can add certification',142,'add_certification'),(585,'Can change certification',142,'change_certification'),(586,'Can delete certification',142,'delete_certification'),(587,'Can view certification',142,'view_certification'),(588,'Can add trainer availability',148,'add_traineravailability'),(589,'Can change trainer availability',148,'change_traineravailability'),(590,'Can delete trainer availability',148,'delete_traineravailability'),(591,'Can view trainer availability',148,'view_traineravailability'),(592,'Can add conflict record',143,'add_conflictrecord'),(593,'Can change conflict record',143,'change_conflictrecord'),(594,'Can delete conflict record',143,'delete_conflictrecord'),(595,'Can view conflict record',143,'view_conflictrecord'),(596,'Can add trainer feedback',149,'add_trainerfeedback'),(597,'Can change trainer feedback',149,'change_trainerfeedback'),(598,'Can delete trainer feedback',149,'delete_trainerfeedback'),(599,'Can view trainer feedback',149,'view_trainerfeedback'),(600,'Can add assessment result',141,'add_assessmentresult'),(601,'Can change assessment result',141,'change_assessmentresult'),(602,'Can delete assessment result',141,'delete_assessmentresult'),(603,'Can view assessment result',141,'view_assessmentresult'),(604,'Can add trainer performance',150,'add_trainerperformance'),(605,'Can change trainer performance',150,'change_trainerperformance'),(606,'Can delete trainer performance',150,'delete_trainerperformance'),(607,'Can view trainer performance',150,'view_trainerperformance'),(608,'Can add skill',137,'add_skill'),(609,'Can change skill',137,'change_skill'),(610,'Can delete skill',137,'delete_skill'),(611,'Can view skill',137,'view_skill'),(612,'Can add trainer skill',151,'add_trainerskill'),(613,'Can change trainer skill',151,'change_trainerskill'),(614,'Can delete trainer skill',151,'delete_trainerskill'),(615,'Can view trainer skill',151,'view_trainerskill'),(616,'Can add certification',138,'add_certification'),(617,'Can change certification',138,'change_certification'),(618,'Can delete certification',138,'delete_certification'),(619,'Can view certification',138,'view_certification'),(620,'Can add batch assignment',152,'add_batchassignment'),(621,'Can change batch assignment',152,'change_batchassignment'),(622,'Can delete batch assignment',152,'delete_batchassignment'),(623,'Can view batch assignment',152,'view_batchassignment'),(624,'Can add assessment',153,'add_assessment'),(625,'Can change assessment',153,'change_assessment'),(626,'Can delete assessment',153,'delete_assessment'),(627,'Can view assessment',153,'view_assessment');
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
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$BrZEkCt60KAzwSLf2isNHm$uUGSbLnPP+bVYKqsrUNo9gh+iZUmq/Ef6oPC1qQglV8=',NULL,0,'sam','shubham','gotad','gotadshubhamu@gmail.com',0,1,'2026-05-29 11:33:16.870495'),(2,'pbkdf2_sha256$1000000$a0gg7WpsZqGtwcKrNYFrPv$idmUiQAnDJ9/OVKsFAjHqm73ahzic2s+N0iOogg4P40=',NULL,0,'paymentcheck_unique','Test','User','testpayment@example.com',0,1,'2026-05-29 11:36:12.292377'),(3,'pbkdf2_sha256$1000000$imtPTy3K7gH47qWtbofVIA$jcdoLyU15N1Dac03KuWiBQR/LPC2fjJS+pyojBOfDik=',NULL,0,'paymentcheck_unique2','Test','User','testpayment2@example.com',0,1,'2026-05-29 11:37:46.512701'),(5,'pbkdf2_sha256$1000000$ZauzxGXqYXgwl5ZfhQeKey$W/09dDkvdlp8fhfmrZfM3/eVARChXKVxm5pPAMtGXxQ=','2026-05-29 11:40:49.703950',0,'rahul','shubham','gotad','gotadshubhamu@gmail.com',0,1,'2026-05-29 11:40:44.419645'),(6,'pbkdf2_sha256$1200000$xlDkmiyuOThrZ3vk0AlKts$wmzd4waOO+xD5KhMli7EJHGK6zHrBlkvqm1kZYUmNjA=',NULL,1,'superuser','','','munja.kadam@vit.edu.in',1,1,'2026-05-29 11:46:42.859460'),(7,'pbkdf2_sha256$1200000$rn0zqUILWxCY2wHop354Z9$RUQZDMAOHjPPXbfxzOMX0d/CAUEhuz7r/smtFnyu8nc=',NULL,1,'superuser1','','','munja.kadam@vit.edu.in',1,1,'2026-05-29 11:52:18.141051'),(10,'pbkdf2_sha256$1200000$tupiXDK6GfOuZ5mNSsfKHY$5W473HoPY8c0x9iesNmnkM8lTdB0+mLyFxgS/4PFEy4=',NULL,1,'user','','','munja.kadam@vit.edu.in',1,1,'2026-05-29 11:59:24.574481');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_idx` (`user_id`),
  KEY `auth_user_groups_group_id_idx` (`group_id`),
  CONSTRAINT `auth_user_groups_group_fk` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_user_groups_user_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_idx` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_idx` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_permission_fk` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_user_user_permissions_user_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_batchassignment`
--

DROP TABLE IF EXISTS `batch_batchassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batch_batchassignment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `batch_name` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `trainer_id` int NOT NULL,
  `accepted_date` datetime(6) DEFAULT NULL,
  `assigned_date` datetime(6) NOT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `status` varchar(20) NOT NULL,
  `student_count` int unsigned NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `batch_batchassignment_trainer_id_batch_name_st_9356a005_uniq` (`trainer_id`,`batch_name`,`start_date`),
  CONSTRAINT `batch_batchassignment_chk_1` CHECK ((`student_count` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_batchassignment`
--

LOCK TABLES `batch_batchassignment` WRITE;
/*!40000 ALTER TABLE `batch_batchassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch_batchassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batches`
--

DROP TABLE IF EXISTS `batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batches` (
  `batch_id` bigint NOT NULL AUTO_INCREMENT,
  `batch_code` varchar(30) NOT NULL,
  `batch_name` varchar(150) NOT NULL,
  `client_name` varchar(80) NOT NULL,
  `subject_short_name` varchar(40) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `mode` varchar(30) NOT NULL,
  `status` varchar(20) NOT NULL,
  `program_id` bigint NOT NULL,
  `trainer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`batch_id`),
  UNIQUE KEY `batch_code` (`batch_code`),
  KEY `batches_program_id_bad88057_fk_programs_program_id` (`program_id`),
  KEY `batches_trainer_id_709218df_fk_trainers_trainer_id` (`trainer_id`),
  CONSTRAINT `batches_program_id_bad88057_fk_programs_program_id` FOREIGN KEY (`program_id`) REFERENCES `programs` (`program_id`),
  CONSTRAINT `batches_trainer_id_709218df_fk_trainers_trainer_id` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batches`
--

LOCK TABLES `batches` WRITE;
/*!40000 ALTER TABLE `batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocks`
--

DROP TABLE IF EXISTS `blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocks` (
  `block_id` int NOT NULL AUTO_INCREMENT,
  `block_name` varchar(50) NOT NULL,
  `hostel_id` int NOT NULL,
  PRIMARY KEY (`block_id`),
  KEY `hostelmgmt_block_hostel_id_b03f9dc3_fk_hostelmgm` (`hostel_id`),
  CONSTRAINT `hostelmgmt_block_hostel_id_b03f9dc3_fk_hostelmgm` FOREIGN KEY (`hostel_id`) REFERENCES `hostels` (`hostel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks`
--

LOCK TABLES `blocks` WRITE;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
INSERT INTO `blocks` VALUES (1,'Block A',1);
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates`
--

DROP TABLE IF EXISTS `certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificates` (
  `certificate_id` bigint NOT NULL AUTO_INCREMENT,
  `certificate_no` varchar(80) NOT NULL,
  `issue_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `certificate_url` varchar(200) NOT NULL,
  `verification_code` varchar(120) NOT NULL,
  `enrollment_id` bigint NOT NULL,
  PRIMARY KEY (`certificate_id`),
  UNIQUE KEY `certificate_no` (`certificate_no`),
  UNIQUE KEY `verification_code` (`verification_code`),
  KEY `certificates_enrollment_id_33aa4205_fk_enrollments_enrollment_id` (`enrollment_id`),
  CONSTRAINT `certificates_enrollment_id_33aa4205_fk_enrollments_enrollment_id` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollments` (`enrollment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates`
--

LOCK TABLES `certificates` WRITE;
/*!40000 ALTER TABLE `certificates` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certifications`
--

DROP TABLE IF EXISTS `certifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certifications` (
  `certification_id` bigint NOT NULL AUTO_INCREMENT,
  `certification_name` varchar(150) NOT NULL,
  `issuing_authority` varchar(150) NOT NULL,
  `certificate_no` varchar(80) NOT NULL,
  `issue_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `trainer_id` bigint NOT NULL,
  PRIMARY KEY (`certification_id`),
  KEY `certifications_trainer_id_c9784d87_fk_trainers_trainer_id` (`trainer_id`),
  CONSTRAINT `certifications_trainer_id_c9784d87_fk_trainers_trainer_id` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certifications`
--

LOCK TABLES `certifications` WRITE;
/*!40000 ALTER TABLE `certifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `certifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certifications_certification`
--

DROP TABLE IF EXISTS `certifications_certification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certifications_certification` (
  `certification_id` int NOT NULL AUTO_INCREMENT,
  `certification_name` varchar(255) NOT NULL,
  `issuing_organization` varchar(255) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `certificate_file` varchar(100) DEFAULT NULL,
  `trainer_id` int NOT NULL,
  PRIMARY KEY (`certification_id`),
  KEY `certifications_certi_trainer_id_b1b57439_fk_trainers_` (`trainer_id`),
  CONSTRAINT `certifications_certi_trainer_id_b1b57439_fk_trainers_` FOREIGN KEY (`trainer_id`) REFERENCES `trainers_trainer` (`trainer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certifications_certification`
--

LOCK TABLES `certifications_certification` WRITE;
/*!40000 ALTER TABLE `certifications_certification` DISABLE KEYS */;
/*!40000 ALTER TABLE `certifications_certification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `city_id` bigint NOT NULL AUTO_INCREMENT,
  `city_code` varchar(20) NOT NULL,
  `city_name` varchar(120) NOT NULL,
  `state_name` varchar(120) NOT NULL,
  `country_name` varchar(120) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `city_code` (`city_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'PUNE','Pune','Maharashtra','India','Active'),(2,'MUM','Mumbai','Maharashtra','India','Active');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaints` (
  `complaint_id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(20) NOT NULL,
  `complaint_type` varchar(30) NOT NULL,
  `description` longtext NOT NULL,
  `complaint_date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `room_id` int NOT NULL,
  PRIMARY KEY (`complaint_id`),
  KEY `hostelmgmt_complaint_room_id_b68d62e9_fk_hostelmgmt_room_room_id` (`room_id`),
  CONSTRAINT `hostelmgmt_complaint_room_id_b68d62e9_fk_hostelmgmt_room_room_id` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints`
--

LOCK TABLES `complaints` WRITE;
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
INSERT INTO `complaints` VALUES (1,'STU004','electrical','dfuikjhbv','2026-05-29','open',2),(2,'STU004','cleanliness','lihgv','2026-05-29','open',3);
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_categories`
--

DROP TABLE IF EXISTS `course_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_categories` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `category_code` varchar(20) NOT NULL,
  `category_name` varchar(120) NOT NULL,
  `description` longtext NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_code` (`category_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_categories`
--

LOCK TABLES `course_categories` WRITE;
/*!40000 ALTER TABLE `course_categories` DISABLE KEYS */;
INSERT INTO `course_categories` VALUES (1,'TECH','Technology','Technology courses','Active'),(2,'GEN','General','','Active');
/*!40000 ALTER TABLE `course_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_trainers`
--

DROP TABLE IF EXISTS `course_trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_trainers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assigned_date` date NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `course_id` bigint NOT NULL,
  `trainer_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_trainer_course` (`trainer_id`,`course_id`),
  KEY `course_trainers_course_id_079fb963_fk_courses_tcm_course_id` (`course_id`),
  CONSTRAINT `course_trainers_course_id_079fb963_fk_courses_tcm_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_tcm` (`course_id`),
  CONSTRAINT `course_trainers_trainer_id_a35aa329_fk_trainers_trainer_id` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_trainers`
--

LOCK TABLES `course_trainers` WRITE;
/*!40000 ALTER TABLE `course_trainers` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_trainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_code` varchar(30) NOT NULL,
  `course_name` varchar(200) NOT NULL,
  `description` text,
  `duration_years` int DEFAULT '0',
  `duration_hours` int DEFAULT NULL,
  `fees` decimal(10,2) DEFAULT '0.00',
  `level` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `course_code` (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_tcm`
--

DROP TABLE IF EXISTS `courses_tcm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_tcm` (
  `course_id` bigint NOT NULL AUTO_INCREMENT,
  `course_code` varchar(30) NOT NULL,
  `course_name` varchar(150) NOT NULL,
  `course_image` varchar(100) DEFAULT NULL,
  `description` longtext NOT NULL,
  `duration_hours` int unsigned NOT NULL,
  `fees` decimal(10,2) NOT NULL,
  `level` varchar(30) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `course_code` (`course_code`),
  CONSTRAINT `courses_tcm_chk_1` CHECK ((`duration_hours` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_tcm`
--

LOCK TABLES `courses_tcm` WRITE;
/*!40000 ALTER TABLE `courses_tcm` DISABLE KEYS */;
INSERT INTO `courses_tcm` VALUES (1,'CRS-TXY537','Intro to TCM','','',40,1000.00,'Beginner','Active'),(3,'CRS-ROTXV6','Debug Course','','',5,100.00,'Beginner','Active');
/*!40000 ALTER TABLE `courses_tcm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard`
--

DROP TABLE IF EXISTS `dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard` (
  `id` int NOT NULL,
  `cards` varchar(100) DEFAULT NULL,
  `isenabled` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard`
--

LOCK TABLES `dashboard` WRITE;
/*!40000 ALTER TABLE `dashboard` DISABLE KEYS */;
INSERT INTO `dashboard` VALUES (1,'Participants Details',1),(2,'System Users Details',1),(3,'Trainers Details',1),(4,'Course/Programs Details',1),(5,'Hostel Details',1);
/*!40000 ALTER TABLE `dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_activity_log`
--

DROP TABLE IF EXISTS `dashboard_activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_activity_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `action_type` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `module` varchar(100) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_activity_log`
--

LOCK TABLES `dashboard_activity_log` WRITE;
/*!40000 ALTER TABLE `dashboard_activity_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_activitylog`
--

DROP TABLE IF EXISTS `dashboard_activitylog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_activitylog` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `action` varchar(255) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_activitylog`
--

LOCK TABLES `dashboard_activitylog` WRITE;
/*!40000 ALTER TABLE `dashboard_activitylog` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_activitylog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_dashboardcard`
--

DROP TABLE IF EXISTS `dashboard_dashboardcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_dashboardcard` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `total_count` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_dashboardcard`
--

LOCK TABLES `dashboard_dashboardcard` WRITE;
/*!40000 ALTER TABLE `dashboard_dashboardcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_dashboardcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_notification`
--

DROP TABLE IF EXISTS `dashboard_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_notification`
--

LOCK TABLES `dashboard_notification` WRITE;
/*!40000 ALTER TABLE `dashboard_notification` DISABLE KEYS */;
INSERT INTO `dashboard_notification` VALUES (1,'test','2026-05-29 12:29:18.000000',0);
/*!40000 ALTER TABLE `dashboard_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_quick_links`
--

DROP TABLE IF EXISTS `dashboard_quick_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_quick_links` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `icon` varchar(60) NOT NULL,
  `colour` varchar(30) NOT NULL,
  `order` smallint unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `dashboard_quick_links_chk_1` CHECK ((`order` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_quick_links`
--

LOCK TABLES `dashboard_quick_links` WRITE;
/*!40000 ALTER TABLE `dashboard_quick_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_quick_links` ENABLE KEYS */;
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
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-05-29 09:35:09.431634','5','testing123 (pivos50664@poesd.com)',2,'[{\"changed\": {\"fields\": [\"Is email verified\"]}}]',20,1),(2,'2026-05-29 09:40:09.308624','5','testing123 (pivos50664@poesd.com)',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',20,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (67,'accounts','academicyears'),(68,'accounts','anisha'),(69,'accounts','assessmentresults'),(70,'accounts','assessments'),(71,'accounts','attendance'),(72,'accounts','auditlogs'),(73,'accounts','authgroup'),(74,'accounts','authgrouppermissions'),(75,'accounts','authpermission'),(76,'accounts','batches'),(77,'accounts','blocks'),(78,'accounts','certificates'),(79,'accounts','certifications'),(80,'accounts','cities'),(81,'accounts','complaints'),(82,'accounts','coursecategories'),(83,'accounts','courses'),(84,'accounts','coursestcm'),(85,'accounts','coursetrainers'),(86,'accounts','dashboard'),(87,'accounts','dashboardactivitylog'),(88,'accounts','dashboardactivitylogtable'),(89,'accounts','dashboarddashboardcard'),(90,'accounts','dashboardnotification'),(91,'accounts','dashboardquicklinks'),(92,'accounts','djangoadminlog'),(93,'accounts','djangocontenttype'),(94,'accounts','djangomigrations'),(95,'accounts','djangosession'),(96,'accounts','enrollments'),(97,'accounts','feepayments'),(98,'accounts','floors'),(99,'accounts','gauravuser'),(100,'accounts','gauravusergroups'),(101,'accounts','gauravuseruserpermissions'),(102,'accounts','genders'),(103,'accounts','hostelmgmtblock'),(104,'accounts','hostelmgmtfloor'),(105,'accounts','hostelmgmthostel'),(106,'accounts','hostelmgmtvisitor'),(107,'accounts','hostels'),(108,'accounts','maintenancerequests'),(109,'accounts','materials'),(110,'accounts','modules'),(111,'accounts','participantguardians'),(112,'accounts','participants'),(113,'accounts','programcourses'),(114,'accounts','programs'),(115,'accounts','programtrainers'),(25,'accounts','role'),(116,'accounts','roles'),(117,'accounts','roomallocations'),(118,'accounts','rooms'),(119,'accounts','roomtransfers'),(120,'accounts','roomtypes'),(121,'accounts','sessions'),(122,'accounts','statusmaster'),(123,'accounts','studentguardians'),(124,'accounts','students'),(125,'accounts','studentsattendance'),(126,'accounts','studentsnotification'),(127,'accounts','studentsresult'),(128,'accounts','test'),(129,'accounts','trainerpayment'),(130,'accounts','trainerpayments'),(131,'accounts','trainers'),(132,'accounts','trainerskills'),(26,'accounts','user'),(139,'accounts','userprofile'),(27,'accounts','userrole'),(133,'accounts','userroles'),(134,'accounts','users'),(135,'accounts','visitors'),(136,'accounts','waitinglist'),(1,'admin','logentry'),(153,'assessment','assessment'),(50,'assessments','assessment'),(51,'assessments','assessmentresult'),(49,'attendance','attendance'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(152,'batch','batchassignment'),(46,'batches','batch'),(47,'batches','enrollment'),(48,'batches','session'),(52,'certificates','certificate'),(138,'certifications','certification'),(21,'commonservices','anisha'),(7,'commonservices','authgroup'),(8,'commonservices','authgrouppermissions'),(9,'commonservices','authpermission'),(10,'commonservices','authuser'),(11,'commonservices','authusergroups'),(12,'commonservices','authuseruserpermissions'),(13,'commonservices','commonservicesactivity'),(14,'commonservices','djangoadminlog'),(15,'commonservices','djangocontenttype'),(16,'commonservices','djangomigrations'),(17,'commonservices','djangosession'),(5,'contenttypes','contenttype'),(53,'hostelmgmt','block'),(54,'hostelmgmt','complaint'),(55,'hostelmgmt','feepayment'),(56,'hostelmgmt','floor'),(57,'hostelmgmt','hostel'),(58,'hostelmgmt','maintenancerequest'),(59,'hostelmgmt','room'),(60,'hostelmgmt','roomallocation'),(61,'hostelmgmt','roomtransfer'),(62,'hostelmgmt','visitor'),(63,'hostelmgmt','waitinglist'),(24,'participantmgmt','course'),(22,'participantmgmt','student'),(23,'participantmgmt','studentguardian'),(28,'programs','academicyear'),(29,'programs','city'),(30,'programs','course'),(31,'programs','coursecategory'),(32,'programs','gender'),(33,'programs','material'),(34,'programs','module'),(35,'programs','program'),(36,'programs','programcourse'),(37,'programs','roomtype'),(38,'programs','statusmaster'),(6,'sessions','session'),(137,'skills','skill'),(151,'skills','trainerskill'),(44,'students','student'),(45,'students','studentguardian'),(140,'trainermgmt','assessment'),(141,'trainermgmt','assessmentresult'),(142,'trainermgmt','certification'),(143,'trainermgmt','conflictrecord'),(144,'trainermgmt','externalbatch'),(145,'trainermgmt','externalstudent'),(146,'trainermgmt','feedbackform'),(147,'trainermgmt','skill'),(64,'trainermgmt','trainer'),(148,'trainermgmt','traineravailability'),(149,'trainermgmt','trainerfeedback'),(65,'trainermgmt','trainerpayment'),(150,'trainermgmt','trainerperformance'),(66,'trainermgmt','trainerskill'),(39,'trainers','certification'),(40,'trainers','coursetrainer'),(41,'trainers','programtrainer'),(42,'trainers','trainer'),(43,'trainers','trainerskill'),(18,'usermgmt','auditlog'),(19,'usermgmt','rbacpermissionproxy'),(20,'usermgmt','user');
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
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-05-29 06:56:04.436429'),(2,'contenttypes','0002_remove_content_type_name','2026-05-29 06:56:04.583222'),(18,'commonservices','0001_initial','2026-05-29 06:59:46.322387'),(19,'commonservices','0002_activity_delete_event','2026-05-29 06:59:46.367869'),(20,'commonservices','0003_authgroup_authgrouppermissions_authpermission_and_more','2026-05-29 06:59:46.421840'),(21,'sessions','0001_initial','2026-05-29 06:59:46.442457'),(22,'usermgmt','0001_initial','2026-05-29 12:31:36.487711'),(23,'usermgmt','0002_delete_rbacpermissionproxy_rbacpermissionproxy','2026-05-29 12:31:36.487711'),(24,'usermgmt','0003_alter_auditlog_user','2026-05-29 12:31:36.487711'),(25,'usermgmt','0004_alter_user_groups_alter_user_user_permissions','2026-05-29 07:03:36.933714'),(26,'commonservices','0004_anisha_delete_authgroup_delete_authgrouppermissions_and_more','2026-05-29 07:10:24.233320'),(27,'participantmgmt','0001_initial','2026-05-29 07:11:10.622523'),(29,'programs','0001_initial','2026-05-29 07:11:49.395260'),(31,'students','0001_initial','2026-05-29 07:11:50.434561'),(32,'batches','0001_initial','2026-05-29 07:11:51.227351'),(33,'assessments','0001_initial','2026-05-29 07:11:51.674132'),(34,'attendance','0001_initial','2026-05-29 07:11:51.882541'),(35,'certificates','0001_initial','2026-05-29 07:11:52.045091'),(36,'usermgmt','0005_alter_user_table','2026-05-29 07:23:56.504064'),(37,'hostelmgmt','0001_initial','2026-05-29 09:07:04.521309'),(38,'hostelmgmt','0002_alter_maintenancerequest_requested_by_and_more','2026-05-29 09:07:46.670278'),(39,'hostelmgmt','0003_waitinglist_update_roomallocation','2026-05-29 09:08:03.980479'),(40,'hostelmgmt','0004_alter_roomallocation_student_id_and_more','2026-05-29 09:08:36.842347'),(41,'hostelmgmt','0005_roomallocation_actual_checkout_time_and_more','2026-05-29 09:08:50.184010'),(43,'hostelmgmt','0006_alter_hostel_options_visitor_purpose_and_more','2026-05-29 09:13:24.159351'),(44,'accounts','0001_initial','2026-05-29 09:15:40.223884'),(48,'trainermgmt','0001_initial','2026-05-29 09:56:12.234452'),(49,'usermgmt','0003_alter_user_id','2026-05-29 10:00:28.110578'),(50,'usermgmt','0006_merge_0003_alter_user_id_0005_alter_user_table','2026-05-29 10:00:28.166969'),(53,'trainers','0001_initial','2026-05-29 10:32:51.190898'),(54,'accounts','0002_alter_trainerpayment_status','2026-05-29 11:07:16.838629'),(55,'participantmgmt','0002_rename_student_tables','2026-05-29 11:28:25.033513'),(56,'auth','0001_initial','2026-05-29 11:31:29.830949'),(57,'auth','0002_alter_permission_name_max_length','2026-05-29 11:31:29.842646'),(58,'auth','0003_alter_user_email_max_length','2026-05-29 11:31:29.846318'),(59,'auth','0004_alter_user_username_opts','2026-05-29 11:31:29.863366'),(60,'auth','0005_alter_user_last_login_null','2026-05-29 11:31:29.881519'),(61,'auth','0006_require_contenttypes_0002','2026-05-29 11:31:29.897229'),(62,'auth','0007_alter_validators_add_error_messages','2026-05-29 11:31:29.900501'),(63,'auth','0008_alter_user_username_max_length','2026-05-29 11:31:29.916316'),(64,'auth','0009_alter_user_last_name_max_length','2026-05-29 11:31:29.925620'),(65,'auth','0010_alter_group_name_max_length','2026-05-29 11:31:29.929276'),(66,'auth','0011_update_proxy_permissions','2026-05-29 11:31:29.946767'),(67,'auth','0012_alter_user_first_name_max_length','2026-05-29 11:31:29.946767'),(68,'admin','0001_initial','2026-05-29 11:31:31.190786'),(69,'admin','0002_logentry_remove_auto_add','2026-05-29 11:31:31.196988'),(70,'admin','0003_logentry_add_action_flag_choices','2026-05-29 11:31:31.213149'),(71,'trainers','0002_trainer_user','2026-05-29 11:32:49.188147'),(72,'batch','0001_initial','2026-05-29 11:33:26.583294'),(73,'assessment','0001_initial','2026-05-29 11:33:26.706208'),(74,'assessment','0002_alter_assessment_batch','2026-05-29 11:33:26.893383'),(75,'trainers','0003_alter_trainer_options_trainer_created_at_and_more','2026-05-29 11:33:27.272139'),(76,'batch','0002_alter_batchassignment_options_and_more','2026-05-29 11:33:27.688254'),(77,'certifications','0001_initial','2026-05-29 11:33:27.812865'),(78,'skills','0001_initial','2026-05-29 11:33:28.010026'),(79,'participantmgmt','0003_alter_participant_academic_year_id_type','2026-05-29 11:35:52.512495'),(80,'participantmgmt','0004_fix_participant_course_fk','2026-05-29 11:37:21.757364'),(81,'attendance','0002_attendance_attendance_photo','2026-05-29 16:49:25.098231'),(82,'batches','0002_batch_client_name_batch_subject_short_name_and_more','2026-05-29 16:49:58.634526'),(83,'certificates','0002_alter_certificate_certificate_no','2026-05-29 16:49:58.644153'),(84,'programs','0002_course_course_image_module_module_image_and_more','2026-05-29 16:49:58.650476'),(85,'students','0002_alter_student_student_code','2026-05-29 16:49:58.661060'),(86,'trainers','0002_alter_trainer_trainer_code','2026-05-29 16:49:58.669240');
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
INSERT INTO `django_session` VALUES ('05aer33wskbuw9dvsqm5kmej8ctm3f59','.eJxVjEsOwiAUAO_y1obwh3bp3jMQ4PGkaiAp7cp4d9OkC93OTOYNIe5bDfsoa1gQZhBw-WUp5mdph8BHbPfOcm_buiR2JOy0g906ltf1bP8GNY4KM5AVk9dCSC8Fd05ZlMQn4pqMyN4om7NHbjFZi6QUd5KiJpNKSjo6L-HzBbEON0M:1wStOs:uYiX4PifNUwrdyd-Avbm7uRslacv40WuLc2oN5ZTAXE','2026-06-12 09:21:06.118463'),('0mj1niul1pyv96gs8gats2640vtok22b','.eJxVjEEOwiAQRe_C2pCBFgpduvcMZJihFjXUlDbRGO-uTbrQ7X_vv5cIuC5jWGuaQ2bRCyUOv1tEuqayAb5gOU-SprLMOcpNkTut8jRxuh139y8wYh2_b4NGWdLReW9bho6UaSChbQbAyAmGBnXsnI7kBw9kmNhDS9AyGnLObdGaas1TCelxz_NT9EqDtwDvDw8RQJk:1wStWP:N0zrW9O9o5KNt_jNOthmypmy5qsMcjQ76efflmBeb_4','2026-06-12 09:28:53.108030'),('2ao66u48r171bqoo22smju1zapqzm2je','.eJxVjDsOwjAQBe_iGln-rD-ipOcM1nq9xgHkSHFSIe4OkVJA-2bmvUTCbW1pG7ykqYizcOL0u2WkB_cdlDv22yxp7usyZbkr8qBDXufCz8vh_h00HO1bZ_Y2MBmjimKvnasInsFSjAQBFVoVqCoPwcdadcnBgq06Bm8qGLDi_QHf6TdF:1wSva5:Edqq1X8FO0waQuEzy0Ej3pgVh_Cy4tWOChCkcY5SIk0','2026-06-12 11:40:49.723638'),('4cgg4eacbqvc0d3qbaypr8esnmzgej8p','.eJydUctOwzAQ_JXKZyjBdRyHEz_AiRNCyFp7Nw8UP7BTpFL137GFaBEnxG1mtPbOzB4ZoJtznoPXmGBY2d2RRUo5eFgqHuaUV-3BEbtjj9PeTODYFVvgoo5hBSwaBlMYb7i8btpr3hdpJI-UivoACxXugpmX-kbJtuOCi1YWlRzMy_dH-WvH_n6s6taGug4QE-VcZraFxSmsQUdYpyL88p9vhB1HQWDN27ttcPdm4BCTouzdx0ivKt7YnlCh6gA7K4YWjDGt6VE07aCs6VA_2kTkc9miL2n0Lb-VO7mNfmSn4sgCkptt7egb6wNBDcs9bp4qLHM27FMuiY8FRzg48usXwWD3lZVQz8cz0-sh1n4AcAJI2kKq1YY0j3O5yPkQZ4ebi8PND4dXbCUX_99RK6yEbieUEL2Q1KtuJwejuJFN2ynD_9DRy-n0Cf4DxpQ:1wSrhy:ktlUbpSzjZouWvpRMAuGLQjgVHEHuKIvGtR77nreJBE','2026-06-12 07:32:42.512204'),('64ds80pclq1ozu0mvlcar0rlywi9hz9f','.eJxdkstOwzAQRX-lzLpUSXiJrIAioAs2UCQQQtFgT1uL-CHbKa2q_DvjkrSFrMb33PE8nA2g1CoEZU0lPc4ilBtw5IM1WKd4pnyIlUFNUMKUQoQh1LiXXgJ5lkijYj9EdlzRCrWraSSsZjRv0EuFps-4786MPNUYuXRYKMfkDuNie9suRdtPVaeky913iPuqvfCncjsEFChJK5EG6eNqTeg5p8iKs-PiPNmkFY0mEwOU7xtQRtIKynyvV3HtUhOTWy4-44b6UVYjJ2fQfgxB2MYHSnX6CCYmejuIdjAdP0LvqISVCY6fno-nr29nJxd7pDTOE2NFUhBeubSbTmj8dlPVInmhPM0ONKmCq3HNztNs8LA1cJ9E7IM8y7JRlnXCgfUpjAb5cEdrWlJa5Q3NlTHbVwgRY5PuuBZRLYmVhh-7G_23Z2dDFAsSXwVThyF8Wy_z7k9J57w4OTpAxX_Utu0PG3fUqg:1wSvRF:FCkE_RgdEVc_woZBQ5gRvpHHOZx7RTOA6zR77FBAFvM','2026-06-12 11:31:41.011899'),('67rh4mmjpgzos4sa8f8jr5i6ut8ibhz0','.eJx1U99v0zAQ_leCn9OSZC2wPDGGgD2Mh1GkoQlZN_vaWMQ_sJ3Rqsr_vnNI0mqIqg--7_t8992dc2QgtQpBWcOlh21k9ZE59MEaaNN5q3yI3IBGVrMNhshy1sIJ-h7QEyTtIwVVURSLoqQ_QTs0kria3UKLFGv7qNp05XL-EYoaFBVikVI7OGg0sXqPe9CuxaWwmiQgpccQxvrZ1RhShQ68VGAmL5_HmCiPLURqKjTKEfMJYjP4nK_86-bdOT3ZmoD_WJv1J4-TidlnTx0IkKiVSAOdzvyA4IeZVetF9SbJpBVdqkJpHo5M0fj2rC5POI8HlyzffKTS1qudoiVNze-XTm4Jj6gdd9QvYS92G16nKXNKN2j7nzkTtvMBk6_pxG5M9DaLNttc37JJwYWViby--7bY3P9YX7w9UUrDLnHpGWAQXrk0-RHo_LAH3iQtq1fFGSZVcC0cSLkqsi-DIGdbxDTGkp7SsihG4Ex6F5ZZmc9si0-YFvUBaRpm2HGIELuU40pE9ZSeXkePdBzTuEjRoPjFO6N-d1iRwkEIf6yX5fjKUlxWF6_OqOol1edTtuGj-XvkGmNjJWk7p9I6PJgAYuhXJXhz_5Vur9as7_tnklMoYw:1wSvX8:gg8_JzRKYjV40lfC9KvakYtko39eOXtPfV2re9kEpCo','2026-06-12 11:37:46.429619'),('7ddhrazjij9prmfvivdx6p4pj60jegqd','.eJxdkstOwzAQRX-lzLpUSXiJrIAioAs2UCQQQtFgT1uL-CHbKa2q_DvjkrSFrMb33PE8nA2g1CoEZU0lPc4ilBtw5IM1WKd4pnyIlUFNUMKUQoQh1LiXXgJ5lkijYj9EdlzRCrWraSSsZjRv0EuFps-4786MPNUYuXRYKMfkDuNie9suRdtPVaeky913iPuqvfCncjsEFChJK5EG6eNqTeg5p8iKs-PiPNmkFY0mEwOU7xtQRtIKynyvV3HtUhOTWy4-44b6UVYjJ2fQfgxB2MYHSnX6CCYmejuIdjAdP0LvqISVCY6fno-nr29nJxd7pDTOE2NFUhBeubSbTmj8dlPVInmhPM0ONKmCq3HNztNs8LA1cJ9E7IM8y7JRlnXCgfUpjAb5cEdrWlJa5Q3NlTHbVwgRY5PuuBZRLYmVhh-7G_23Z2dDFAsSXwwdhvBtvcy7HyWd8-Lk6AAV_1Hbtj9ORNR4:1wSvOU:IVxQ5MaK7rBL6GJsa2dCB_a9v7gJTWK4gACqtNDJAJ0','2026-06-12 11:28:50.316893'),('8d8k6vce3407wywns6ehoa34faa93er4','.eJxtU02P0zAQ_SvB57ZKsi0fObEsAvawHJYiLUIomrWnjUX8ge0srar8d2ZCklYLVQ-e955n3sw4JwHK6Bi1s7UKsEuiOgmPIToLLZ93OsRUWzAoKrHFmMRCtHCGvkYMBCn3SEGZ5_kyL-hP0B6tIq4Sd9AixcY96pavvJl_hKIBTYVEotQejgZteosHML7FlXSGFKBUwBjH8tn1GFKBDoLSYCcrH8eYqIAtJOopNtoT8wFSM9icr_xr5vUlPbmagP87m-Vni5OH2WZPDUhQaLTkcU7n-ogQhomVm2X5kmXKyY6LUJrvJ6FpeAdRFWe8TkfPjm_fU-kduZ_6Pqy82hHmgt5rWttzPKHxtacRMCb6HwshXRcisp_pJG5tCi5LLtve3IlJUUunmLy5_7LcPnzbXL06U9rAnjlePkYZtOeBj0AXhvHXDWtFtc4vMKWjb-FIynWefRoE1A8ij6-gB7TK8xG4kN7HVVYsZrbFJ-T9vEPq2A6rjQlSxzmuZdJP_OA6eprjKMb9yQblz7qz-lfHAg8x_nZBFePb4rgor15cUOVzql9MyYYv5e-xNpgap0jbec0TD2AjyKFdzfD24TPdXm9E3_d_AG2hIx0:1wSvVc:5800s5_riiXLge4bNHgJmMue_42n5P1TskMDIypUKRI','2026-06-12 11:36:12.213014'),('c73rr36bjt341yc3gu2zonucebtagmhq','.eJxVjEsOwiAUAO_y1obwh3bp3jMQ4PGkaiAp7cp4d9OkC93OTOYNIe5bDfsoa1gQZhBw-WUp5mdph8BHbPfOcm_buiR2JOy0g906ltf1bP8GNY4KM5AVk9dCSC8Fd05ZlMQn4pqMyN4om7NHbjFZi6QUd5KiJpNKSjo6L-HzBbEON0M:1wStPM:M1GISZ0BD_22jcjndE6-3WftG2TOkObKlk61P4MX4Fs','2026-06-12 09:21:36.968424'),('l6a0uttiuqqkg3ps773sn6eyu6ca37no','eyJ1c2VybmFtZSI6ImFkbWluIiwicm9sZSI6ImFkbWluIn0:1wSv9k:A1Qc9t1iIak7mZreu09LwUoE1VNPITBRI-I_HPBo6Z8','2026-06-12 11:13:36.017246'),('mktx5y7cnym2vu56x1d72rk7lsn86sha','.eJydU8tu2zAQ_BWBZ9vRg3rYp7S5tIdckhwaFIWwJlcWG4kUSMqJYfjfy3UjW8kxt92ZMWe1Oz4ykL1yThldSwuNZ5sjG9A6o6GjulHW-VpDj2zDHCgNvmUL1sEVHeAVbMCk2YYujdNiGefLdB2gHWqJNqD30GHoe7NVHf2mKvIy5SnPi4BiDyqYsZ3xIF07blvox9sdoSth-qAAKS06FzRAr45gpQI9DSBbZeFvICx24MOnuFYNAR-1OLte9Bf7JM2CdVmt4zk9zSERJX7wv0hmgzhwgRla40090FY2n3fpbvoX_5YfSqEPfbof8-ItkWVqX8rO6apwLdyISqYcmyqDQnIQAqpSZjLJYct5VnFeJ6tB79gprECAxF4JOspU1wcE2m7ifPRMZdAJM1qHpJoq9lN7ayJvoqe7ezYpamEkkXcPj8unX895Vl4p1cOOODoqOmHVQFt9B0Z73nHdkpZteDzDpHJDB4eg5HH04yxYsAaRFpbEcbyK43dgJn1wqyhZXNgO90hX-I47pTVSspwHP9Ib34RXezrp6NB-DKWmY4Bzr8bK5ArfhlPPmPQTcyLq0KOm4J8ow2KkLpj9Pl662h8GsgKQLYCtRUhDeNRYFUaEbsrho7CIIXzGR9d_QZSUcZb9P-OCeeyHr6elEo1ouMy3vGw4l8U6kzzFImuKCqGIsb5OUF8nqGcTnP6cTv8AK85K0A:1wSvrn:y2Lqi2diKmGgG7doFl0IHY89C0SSKeCVjT80rOAHiOw','2026-06-12 11:59:07.429901'),('nbd9dor4r2erbq6009lh32r4q352mulx','e30:1wSvXZ:XXxhETAtYm5w0bIXys3nm1mtGvf8cAnzlszAxkN2rFU','2026-06-12 11:38:13.596492'),('ohxuz4d6tbgmfnexi9gglbtt4dovr7lu','.eJxVjsEOgjAQRP-lZ9MUaAvL0bvf0GzZrVRNaygkGuO_C4aDXue9mcxLOFzm0S2FJxdJ9MKKw2_mcbhy2gBdMJ2zHHKap-jlpsidFnnKxLfj7v4NjFjGtY3am6atiD2aIVBQXK9BCMC6M9qSbQ1YMmwRWiRWTB0EQg9YNxbM91XhUmJOjh_3OD1FX9UKrFLvD1MVQVY:1wSu4V:iu0SlNHIt5yQ4X_2n5tpY_XhQaL9IRAWpO2i3Q81pmM','2026-06-12 10:04:07.252837'),('qfphjunss193n9mszudwgiskk3h0blba','eyJ1c2VybmFtZSI6ImFkbWluIiwicm9sZSI6ImFkbWluIn0:1wStq2:k2598GI2AUgRfFHtUHtXiK6DJAurutWvOpFiczApBeI','2026-06-12 09:49:10.578032'),('s3gbqpt858m7df7kqk5ubmtb17gq3prc','.eJxVjMsOwiAQAP9lz4YIy6s9eu83NAsLUjWQlPZk_HfTpAe9zkzmDTPtW5n3ntZ5YRgB4fLLAsVnqofgB9V7E7HVbV2COBJx2i6mxul1O9u_QaFeYIQroeGUrVaGyLGkaGxmZnTOErE0VvqMylMI7IcUNGplEmplB4uaM3y-_eI4Mw:1wT0R1:LqgEjWEDlh16-KZp_zyLS2sc7uD3MohR78Gfynw5XwM','2026-06-12 16:51:47.210232'),('sr6yu8ny1lzjhzbv3c2atd05lctyv1cz','e30:1wSvnb:MCgwKSnBPvX1vBUjcPNqvvN87JMu2_Ztj9EH53raBu4','2026-06-12 11:54:47.628071'),('t3aux4118icxm1x381y0124hihhou9v7','.eJxlU8Fu2zAM_RVX5ySz3WTrfFpXoNsO3aHLgBbDILASEwuzLEGSuwaB_32kZzvZGuQgvvdEPpH0UYC2JkbjWqkD7JKojsJjiK6Fhs87E2KSLVgUldhiTGIhGjhB3yMGgrR7oqDM83yZF_QnaI-tJq4Sd9AgxdY9mYavvJ9_hKIFQ4VEotTaqQ_4AtY3uFLOEgtaB4xxLJ1djyEl7yBoA-1k49MYExWwgUTvibXxxNxCqgeL85XXRq7O6cnRBLx2NUtP9qb6s8WezCvQaI3iNk5neUAIQ6fKzbJ8yzLK31lsE6X5cRSGmvYiquKEy3Tw7BZA1wBBKqpEJlwwe0NDmjow0iuvd8QmtF56ejoz_044vuFeS0pfDuL-50Io14WIbHQ6iS9tCi5LLtve3IlJIZXTTN7cf1tuHx43l-9OlLGwZ463AaMKxvMURqALw0xkzVpRrfMzTJvoGziQcp1nnwfBQuwQua8FbdQqz0fgTHofV1mxmNkGn5GH9hGpKe0w75ggdZzjWiXzzBvY0a6O3eLm-saBVjWqX8R5iPG3C7oYd43jory8OKPK_6meuQPPaPhq_h6lxVQ7TdrOG55EgDaCGl5qGN4-fKXb643o-_4PzkYorg:1wSvm4:NDS2-yWgQfjG50zn9fpN7CPumMGe8xWxkWS71VStEfw','2026-06-12 11:53:12.139671'),('uklwi5rpph1us73ixwrgkpi3js9qhrhq','.eJxVjEFqwzAQAL8i9myELWNF8bE99wVRELvSKk7qWuC1DqX070WQQnudGeYLAtZjCVV4D_cEMxjo_jLC-M5bE-mB263oWLZjv5NuiX5a0W8l8frybP8NFpQFZkBn0ugQjWOXp7N1eSIka2xEc8rpTJatHfIYaeCBmk99T-jGFG2cTtSmHyyCNxaY4XLxEMJDyvZLPXSq75SZOuXhtdRdWMWd8eCkpMbIIrmu66duoQcP1yt8_wAySFQ3:1wSuLr:CGrLa7ySCzK-Oy277VfBXnPFrMq_s2GwLrhfdCbDTBc','2026-06-12 10:22:03.966045'),('wjqe82tzf12r6qgyrhvxzd8lbyd9n2vw','.eJxVjEEOwiAQAP_C2ZCFFoQevfsGsuxSixowpU00xr-bJj3odWYybxFwXaawtjSHzGIQShx-WUS6pbIJvmK5VEm1LHOOckvkbps8V073097-DSZskxiEQaMs6ei8tz3DkZTpIKHtRsDICcYOdTw6HcmPHsgwsYeeoGc05Jzbpi21lmsJ6fnI80sMSoO3AJ8vDxFAmQ:1wStrW:Bm4Bls1OBu7RIAWpNNl6o5-6pFKaFnAJf8FWHG3QKyw','2026-06-12 09:50:42.773813'),('y0965dv0ackjgjp6gcz3hvgsq40vlh70','.eJxVT0tLBDEM_i85j4sOKDgnD6J415PIENuMG-iLpgOzDP3vpmJ3Nafke-RLdkDrWYRjmG3GpcC0Q6IsMaBr_cJZyhzQE0zwSlJgAIcX6E0oK0QeWfVQVPFAG_rk6GCiV-prxWwZQ3c8_85KZXJYNFqOnJR5wnL82Xa2-PjJrpnuz_WX7qkd-JdcB0CDljyb9kjv5xNhVs94Pd5ejXdNZqNZPYUiML3vwMHSBtPNBZ_LKbUjXh41fNGD-ivbIdkF6scAJq5ZFNprrd8m_XPV:1wSvIT:pGP-dukp5DpIsHGTDPELGWQhcygVZWjV89jOzoqMTlo','2026-06-12 11:22:37.503160'),('yzzaa3btj3jw42lgj4hbt5g6ykmgoez7','.eJxVT0tLBDEM_i85j4sOKDgnD6J415PIENuMG-iLpgOzDP3vpmJ3Nafke-RLdkDrWYRjmG3GpcC0Q6IsMaBr_cJZyhzQE0zwSlJgAIcX6E0oK0QeWfVQVPFAG_rk6GCiV-prxWwZQ3c8_85KZXJYNFqOnJR5wnL82Xa2-PjJrpnuz_WX7qkd-JdcB0CDljyb9kjv5xNhVs94Pd5ejXdNZqNZPYUiML3vwMHSBtPNBZ_LKbUjXh41fNGD-ivbIdkF6scAJq5ZFNprrd8m_XPV:1wSvIj:AGriwL92T31HXINYAgE5F-HgziPsSeh4HIezZsi6ncs','2026-06-12 11:22:53.225217');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollments` (
  `enrollment_id` bigint NOT NULL AUTO_INCREMENT,
  `enrollment_date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `fee_amount` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `batch_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`enrollment_id`),
  UNIQUE KEY `uniq_batch_student` (`batch_id`,`student_id`),
  KEY `enrollments_student_id_19c0bed4_fk_students_student_id` (`student_id`),
  CONSTRAINT `enrollments_batch_id_d8a25d08_fk_batches_batch_id` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`batch_id`),
  CONSTRAINT `enrollments_student_id_19c0bed4_fk_students_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee_payments`
--

DROP TABLE IF EXISTS `fee_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fee_payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_mode` varchar(30) NOT NULL,
  `receipt_no` varchar(50) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `allocation_id` int NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `hostelmgmt_feepaymen_allocation_id_8e5caa69_fk_hostelmgm` (`allocation_id`),
  CONSTRAINT `hostelmgmt_feepaymen_allocation_id_8e5caa69_fk_hostelmgm` FOREIGN KEY (`allocation_id`) REFERENCES `room_allocations` (`allocation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee_payments`
--

LOCK TABLES `fee_payments` WRITE;
/*!40000 ALTER TABLE `fee_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `fee_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floors`
--

DROP TABLE IF EXISTS `floors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `floors` (
  `floor_id` int NOT NULL AUTO_INCREMENT,
  `floor_no` int NOT NULL,
  `block_id` int NOT NULL,
  PRIMARY KEY (`floor_id`),
  KEY `hostelmgmt_floor_block_id_fc337040_fk_hostelmgmt_block_block_id` (`block_id`),
  CONSTRAINT `hostelmgmt_floor_block_id_fc337040_fk_hostelmgmt_block_block_id` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`block_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floors`
--

LOCK TABLES `floors` WRITE;
/*!40000 ALTER TABLE `floors` DISABLE KEYS */;
INSERT INTO `floors` VALUES (1,1,1);
/*!40000 ALTER TABLE `floors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gaurav_user`
--

DROP TABLE IF EXISTS `gaurav_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gaurav_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL,
  `email_verification_token` varchar(100) DEFAULT NULL,
  `token_created_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gaurav_user`
--

LOCK TABLES `gaurav_user` WRITE;
/*!40000 ALTER TABLE `gaurav_user` DISABLE KEYS */;
INSERT INTO `gaurav_user` VALUES (1,'pbkdf2_sha256$1200000$RgHNiP04KKRligAIDhhxBE$vRkd2yWs08mWolnKz2MLNF4zrzRdxdrebP+YQ9UScX0=','2026-05-29 09:50:42.748389',1,'gaurav','','',1,1,'2026-05-29 06:41:38.000000','gaurav.ghude@vit.edu.in',NULL,1,NULL,NULL,'2026-05-29 06:41:39.220498','2026-05-29 07:08:38.735558'),(2,'pbkdf2_sha256$1200000$YODj7JhntSIe8sOPrKvRwc$2sjcpW6so0W+tnL1JnwAZiSy4tyUvaJsI1APQq9aDtM=','2026-05-29 07:05:33.005457',0,'test123','Test','User',0,1,'2026-05-29 06:44:15.000000','t2949589@gmail.com','1234567890',1,'d9c9zs-68779ec30d8acd46e266059868ad2e65','2026-05-29 06:44:16.000000','2026-05-29 06:44:16.705885','2026-05-29 06:45:05.199810'),(4,'pbkdf2_sha256$1200000$jk1aHG33P1Uv9h5Zv7gy6e$HGXV3gyjyyNiNFzFzz1qnwEF9KmtnXeHzgEFrIx2av0=',NULL,1,'gaurav1','','',1,1,'2026-05-29 07:26:05.000000','gauravghude2512@gmail.com',NULL,1,NULL,NULL,'2026-05-29 07:26:05.896914','2026-05-29 08:34:30.109964'),(5,'pbkdf2_sha256$1200000$Pl8i5tbQJ2nel8QxFlExXH$XvZY8lGwOQHAu+YDqsGH+swFiSjqYNO8bfnODm0X4ok=','2026-05-29 09:40:21.994589',0,'testing123','Test','User 1',0,1,'2026-05-29 09:34:50.000000','pivos50664@poesd.com','1234567890',1,'d9chw3-2dc6f449e0b8d83f68ba28caaedc8837','2026-05-29 09:34:51.000000','2026-05-29 09:34:51.323367','2026-05-29 09:40:09.278254'),(6,'pbkdf2_sha256$600000$Mib1cU6UqJ0ZrnmuAisEOk$2vUwAQ4U6aGoss0uZYn5tS3anCnErw1fEH5KanxwsjE=','2026-05-29 10:04:06.924887',1,'harshada2576','','',1,1,'2026-05-29 10:03:01.836093','harshada2576@gmail.com',NULL,0,NULL,NULL,'2026-05-29 10:03:02.712186','2026-05-29 10:03:02.712221');
/*!40000 ALTER TABLE `gaurav_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gaurav_user_groups`
--

DROP TABLE IF EXISTS `gaurav_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gaurav_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_groups_user_id_group_id_fc7788e8_uniq` (`user_id`,`group_id`),
  KEY `users_groups_group_id_2f3517aa_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_groups_group_id_2f3517aa_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gaurav_user_groups`
--

LOCK TABLES `gaurav_user_groups` WRITE;
/*!40000 ALTER TABLE `gaurav_user_groups` DISABLE KEYS */;
INSERT INTO `gaurav_user_groups` VALUES (2,1,1),(1,2,9),(3,4,1),(4,5,7);
/*!40000 ALTER TABLE `gaurav_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gaurav_user_user_permissions`
--

DROP TABLE IF EXISTS `gaurav_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gaurav_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_permissions_user_id_permission_id_3b86cbdf_uniq` (`user_id`,`permission_id`),
  KEY `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gaurav_user_user_permissions`
--

LOCK TABLES `gaurav_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `gaurav_user_user_permissions` DISABLE KEYS */;
INSERT INTO `gaurav_user_user_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,1,45),(46,1,46),(47,1,47),(48,1,48),(49,1,49),(50,1,50),(51,1,51),(52,1,52),(53,1,53),(54,1,54),(55,1,55),(56,1,56),(57,1,57),(58,1,58),(59,1,59),(60,1,60),(61,1,61),(62,1,62),(63,1,63),(64,1,64),(65,1,65),(66,1,66),(67,1,67),(68,1,68),(69,1,69),(70,1,70),(71,1,71),(72,1,72),(73,1,73),(74,1,74),(75,1,75),(76,1,76),(77,1,77),(78,1,78),(79,1,79),(80,1,80),(81,1,81),(82,1,82),(83,1,83),(84,1,84),(85,1,85),(86,1,86),(87,1,87),(88,1,88),(89,1,89),(90,1,90),(91,1,91),(92,1,92),(93,1,93),(94,1,94),(95,1,95),(96,4,1),(97,4,2),(98,4,3),(99,4,4),(100,4,5),(101,4,6),(102,4,7),(103,4,8),(104,4,9),(105,4,10),(106,4,11),(107,4,12),(108,4,13),(109,4,14),(110,4,15),(111,4,16),(112,4,17),(113,4,18),(114,4,19),(115,4,20),(116,4,21),(117,4,22),(118,4,23),(119,4,24),(120,4,25),(121,4,26),(122,4,27),(123,4,28),(124,4,29),(125,4,30),(126,4,31),(127,4,32),(128,4,33),(129,4,34),(130,4,35),(131,4,36),(132,4,37),(133,4,38),(134,4,39),(135,4,40),(136,4,41),(137,4,42),(138,4,43),(139,4,44),(140,4,45),(141,4,46),(142,4,47),(143,4,48),(144,4,49),(145,4,50),(146,4,51),(147,4,52),(148,4,53),(149,4,54),(150,4,55),(151,4,56),(152,4,57),(153,4,58),(154,4,59),(155,4,60),(156,4,61),(157,4,62),(158,4,63),(159,4,64),(160,4,65),(161,4,66),(162,4,67),(163,4,68),(164,4,69),(165,4,70),(166,4,71),(167,4,72),(168,4,73),(169,4,74),(170,4,75),(171,4,76),(172,4,77),(173,4,78),(174,4,79),(175,4,80),(176,4,81),(177,4,82),(178,4,83),(179,4,84),(180,4,85),(181,4,86),(182,4,87),(183,4,88),(184,4,89),(185,4,90),(186,4,91),(187,4,92),(188,4,93),(189,4,94),(190,4,95),(191,4,96),(192,4,97),(193,4,98),(194,4,99),(195,4,100),(196,4,101),(197,4,102),(198,4,103),(199,4,104),(200,4,105),(201,4,106),(202,4,107),(203,4,108),(204,4,109),(205,4,110),(206,4,111),(207,4,112),(208,4,113),(209,4,114),(210,4,115),(211,4,116),(212,4,117),(213,4,118),(214,4,119),(215,4,120),(216,4,121),(217,4,122),(218,4,123),(219,4,124),(220,4,125),(221,4,126),(222,4,127),(223,4,128),(224,4,129),(225,4,130),(226,4,131),(227,4,132),(228,4,133),(229,4,134),(230,4,135),(231,4,136),(232,4,137),(233,4,138),(234,4,139),(235,4,140),(236,4,141),(237,4,142),(238,4,143),(239,4,144),(240,4,145),(241,4,146),(242,4,147),(243,4,148),(244,4,149),(245,4,150),(246,4,151),(247,4,152),(248,4,153),(249,4,154),(250,4,155),(251,4,156),(252,4,157),(253,4,158),(254,4,159),(255,4,160),(256,4,161),(257,4,162),(258,4,163),(259,4,164),(260,4,165),(261,4,166),(262,4,167),(263,4,168),(264,4,169),(265,4,170),(266,4,171),(267,4,172),(268,4,173),(269,4,174),(270,4,175),(271,4,176),(272,4,177),(273,4,178),(274,4,179),(275,4,180),(276,4,181),(277,4,182),(278,4,183),(279,4,184),(280,4,185),(281,4,186),(282,4,187),(283,4,188),(284,4,189),(285,4,190),(286,4,191),(287,4,192),(288,4,193),(289,4,194),(290,4,195),(291,4,196),(292,4,197),(293,4,198),(294,4,199),(295,4,200),(296,4,201),(297,4,202),(298,4,203),(299,4,204),(300,4,205),(301,4,206),(302,4,207),(303,4,208),(304,4,209),(305,4,210),(306,4,211),(307,4,212),(308,4,213),(309,4,214),(310,4,215),(311,4,216),(312,4,217),(313,4,218),(314,4,219),(315,4,220),(316,4,221),(317,4,222),(318,4,223);
/*!40000 ALTER TABLE `gaurav_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genders`
--

DROP TABLE IF EXISTS `genders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genders` (
  `gender_id` bigint NOT NULL AUTO_INCREMENT,
  `gender_code` varchar(20) NOT NULL,
  `gender_name` varchar(40) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`gender_id`),
  UNIQUE KEY `gender_code` (`gender_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genders`
--

LOCK TABLES `genders` WRITE;
/*!40000 ALTER TABLE `genders` DISABLE KEYS */;
INSERT INTO `genders` VALUES (1,'M','Male','Active'),(2,'F','Female','Active'),(3,'O','Other','Active');
/*!40000 ALTER TABLE `genders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostelmgmt_block`
--

DROP TABLE IF EXISTS `hostelmgmt_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hostelmgmt_block` (
  `block_id` int NOT NULL AUTO_INCREMENT,
  `block_name` varchar(50) NOT NULL,
  PRIMARY KEY (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostelmgmt_block`
--

LOCK TABLES `hostelmgmt_block` WRITE;
/*!40000 ALTER TABLE `hostelmgmt_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `hostelmgmt_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostelmgmt_floor`
--

DROP TABLE IF EXISTS `hostelmgmt_floor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hostelmgmt_floor` (
  `floor_id` int NOT NULL AUTO_INCREMENT,
  `floor_no` int NOT NULL,
  `block_id` int NOT NULL,
  PRIMARY KEY (`floor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostelmgmt_floor`
--

LOCK TABLES `hostelmgmt_floor` WRITE;
/*!40000 ALTER TABLE `hostelmgmt_floor` DISABLE KEYS */;
/*!40000 ALTER TABLE `hostelmgmt_floor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostelmgmt_hostel`
--

DROP TABLE IF EXISTS `hostelmgmt_hostel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hostelmgmt_hostel` (
  `hostel_id` int NOT NULL AUTO_INCREMENT,
  `hostel_code` varchar(20) NOT NULL,
  `hostel_name` varchar(100) NOT NULL,
  `address` longtext NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`hostel_id`),
  UNIQUE KEY `hostel_code` (`hostel_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostelmgmt_hostel`
--

LOCK TABLES `hostelmgmt_hostel` WRITE;
/*!40000 ALTER TABLE `hostelmgmt_hostel` DISABLE KEYS */;
/*!40000 ALTER TABLE `hostelmgmt_hostel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostelmgmt_visitor`
--

DROP TABLE IF EXISTS `hostelmgmt_visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hostelmgmt_visitor` (
  `visitor_id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(20) NOT NULL,
  `visitor_name` varchar(100) NOT NULL,
  `relationship` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `checkin` datetime(6) NOT NULL,
  `checkout` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostelmgmt_visitor`
--

LOCK TABLES `hostelmgmt_visitor` WRITE;
/*!40000 ALTER TABLE `hostelmgmt_visitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `hostelmgmt_visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostels`
--

DROP TABLE IF EXISTS `hostels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hostels` (
  `hostel_id` int NOT NULL AUTO_INCREMENT,
  `hostel_code` varchar(20) NOT NULL,
  `hostel_name` varchar(100) NOT NULL,
  `address` longtext NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`hostel_id`),
  UNIQUE KEY `hostel_code` (`hostel_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostels`
--

LOCK TABLES `hostels` WRITE;
/*!40000 ALTER TABLE `hostels` DISABLE KEYS */;
INSERT INTO `hostels` VALUES (1,'H001','PRAVAAH Main Hostel','PRAVAAH Campus, Main Road','active');
/*!40000 ALTER TABLE `hostels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `invoice_id` int NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(50) NOT NULL,
  `invoice_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) DEFAULT '0.00',
  `tax` decimal(10,2) DEFAULT '0.00',
  `grand_total` decimal(10,2) NOT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  PRIMARY KEY (`invoice_id`),
  UNIQUE KEY `invoice_no` (`invoice_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_requests`
--

DROP TABLE IF EXISTS `maintenance_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance_requests` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `request_date` date NOT NULL,
  `description` longtext NOT NULL,
  `status` varchar(20) NOT NULL,
  `resolved_on` date DEFAULT NULL,
  `requested_by_id` bigint DEFAULT NULL,
  `room_id` int NOT NULL,
  PRIMARY KEY (`request_id`),
  KEY `hostelmgmt_maintenan_room_id_de0c4625_fk_hostelmgm` (`room_id`),
  KEY `hostelmgmt_maintenan_requested_by_id_d6f992a8_fk_auth_user` (`requested_by_id`),
  CONSTRAINT `hostelmgmt_maintenan_requested_by_id_d6f992a8_fk_auth_user` FOREIGN KEY (`requested_by_id`) REFERENCES `gaurav_user` (`id`),
  CONSTRAINT `hostelmgmt_maintenan_room_id_de0c4625_fk_hostelmgm` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_requests`
--

LOCK TABLES `maintenance_requests` WRITE;
/*!40000 ALTER TABLE `maintenance_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materials`
--

DROP TABLE IF EXISTS `materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materials` (
  `material_id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `file_type` varchar(40) NOT NULL,
  `file_url` varchar(100) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `uploaded_by` bigint DEFAULT NULL,
  `module_id` bigint NOT NULL,
  PRIMARY KEY (`material_id`),
  KEY `materials_uploaded_by_25b1b659_fk_users_id` (`uploaded_by`),
  KEY `materials_module_id_26397627_fk_modules_module_id` (`module_id`),
  CONSTRAINT `materials_module_id_26397627_fk_modules_module_id` FOREIGN KEY (`module_id`) REFERENCES `modules` (`module_id`),
  CONSTRAINT `materials_uploaded_by_25b1b659_fk_users_id` FOREIGN KEY (`uploaded_by`) REFERENCES `gaurav_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials`
--

LOCK TABLES `materials` WRITE;
/*!40000 ALTER TABLE `materials` DISABLE KEYS */;
/*!40000 ALTER TABLE `materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `module_id` bigint NOT NULL AUTO_INCREMENT,
  `module_name` varchar(150) NOT NULL,
  `module_image` varchar(100) DEFAULT NULL,
  `description` longtext NOT NULL,
  `sequence_no` int unsigned NOT NULL,
  `duration_hours` int unsigned NOT NULL,
  `course_id` bigint NOT NULL,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `uniq_course_module` (`course_id`,`module_name`),
  CONSTRAINT `modules_course_id_23782a2b_fk_courses_tcm_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_tcm` (`course_id`),
  CONSTRAINT `modules_chk_1` CHECK ((`sequence_no` >= 0)),
  CONSTRAINT `modules_chk_2` CHECK ((`duration_hours` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant_guardians`
--

DROP TABLE IF EXISTS `participant_guardians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participant_guardians` (
  `guardian_id` int NOT NULL AUTO_INCREMENT,
  `participant_id` int NOT NULL,
  `guardian_name` varchar(200) NOT NULL,
  `relationship` varchar(50) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `address` text,
  PRIMARY KEY (`guardian_id`),
  KEY `participant_id` (`participant_id`),
  CONSTRAINT `participant_guardians_ibfk_1` FOREIGN KEY (`participant_id`) REFERENCES `participants` (`participant_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_guardians`
--

LOCK TABLES `participant_guardians` WRITE;
/*!40000 ALTER TABLE `participant_guardians` DISABLE KEYS */;
INSERT INTO `participant_guardians` VALUES (2,4,'ram','eded','643565633','deede@gmail.com','.');
/*!40000 ALTER TABLE `participant_guardians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participants`
--

DROP TABLE IF EXISTS `participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participants` (
  `participant_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `admission_no` varchar(64) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(150) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `course_id` bigint DEFAULT NULL,
  `academic_year_id` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`participant_id`),
  UNIQUE KEY `admission_no` (`admission_no`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `academic_year_id` (`academic_year_id`),
  KEY `participants_ibfk_1` (`course_id`),
  CONSTRAINT `participants_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses_tcm` (`course_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants`
--

LOCK TABLES `participants` WRITE;
/*!40000 ALTER TABLE `participants` DISABLE KEYS */;
INSERT INTO `participants` VALUES (2,3,'ENR20260529113747D25D20','Test','User','Male','2000-01-01','9999999999','testpayment2@example.com',1,'2025-26','pending','2026-05-29 06:07:47'),(4,5,'ENR202605295D667241','shubham','gotad','Male','2026-05-29','674365874','gotadshubhamu@gmail.com',1,'2nd Year','pending','2026-05-29 06:10:45');
/*!40000 ALTER TABLE `participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `invoice_id` int NOT NULL,
  `payment_date` date NOT NULL,
  `payment_mode` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(20) DEFAULT 'Completed',
  PRIMARY KEY (`payment_id`),
  KEY `fk_invoice` (`invoice_id`),
  CONSTRAINT `fk_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pravaah_future_proposal`
--

DROP TABLE IF EXISTS `pravaah_future_proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pravaah_future_proposal` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `program_name` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `institute_name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pravaah_future_proposal`
--

LOCK TABLES `pravaah_future_proposal` WRITE;
/*!40000 ALTER TABLE `pravaah_future_proposal` DISABLE KEYS */;
/*!40000 ALTER TABLE `pravaah_future_proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pravaah_gate_approval`
--

DROP TABLE IF EXISTS `pravaah_gate_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pravaah_gate_approval` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name_of_client` varchar(255) DEFAULT NULL,
  `mt_course_registration` varchar(255) DEFAULT NULL,
  `number_of_participants` int NOT NULL,
  `training_type_online_offline` varchar(255) DEFAULT NULL,
  `training_need_type` longtext,
  `training_need_content` longtext,
  `prep_sta_infra` longtext,
  `prep_consumables` longtext,
  `prep_ctea_infra` longtext,
  `prep_mt_availability` longtext,
  `prep_material` longtext,
  `prep_material_ppt` longtext,
  `prep_feedback` longtext,
  `session_plan_availability` longtext,
  `value_addition` longtext,
  `assessment_formative` longtext,
  `assessment_summative` longtext,
  `assessment_certification` longtext,
  `assessment_assessors` longtext,
  `invoicing_documents` longtext,
  `fees_standard_deviations` longtext,
  `challenges_mitigation` longtext,
  `status` varchar(50) NOT NULL,
  `marketing_remarks` longtext,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `proposal_id` bigint NOT NULL,
  `reviewed_by_id` int DEFAULT NULL,
  `submitted_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proposal_id` (`proposal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pravaah_gate_approval`
--

LOCK TABLES `pravaah_gate_approval` WRITE;
/*!40000 ALTER TABLE `pravaah_gate_approval` DISABLE KEYS */;
/*!40000 ALTER TABLE `pravaah_gate_approval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pravaah_gate_zero`
--

DROP TABLE IF EXISTS `pravaah_gate_zero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pravaah_gate_zero` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_training_room_available` varchar(10) NOT NULL,
  `is_hostel_facility_available` varchar(10) NOT NULL,
  `is_trainer_available` varchar(10) NOT NULL,
  `is_proposal_financially_feasible` varchar(10) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `proposal_id` bigint NOT NULL,
  `submitted_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proposal_id` (`proposal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pravaah_gate_zero`
--

LOCK TABLES `pravaah_gate_zero` WRITE;
/*!40000 ALTER TABLE `pravaah_gate_zero` DISABLE KEYS */;
/*!40000 ALTER TABLE `pravaah_gate_zero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_courses`
--

DROP TABLE IF EXISTS `program_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program_courses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sequence_no` int unsigned NOT NULL,
  `course_id` bigint NOT NULL,
  `program_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_program_course` (`program_id`,`course_id`),
  KEY `program_courses_course_id_1d9cc419_fk_courses_tcm_course_id` (`course_id`),
  CONSTRAINT `program_courses_course_id_1d9cc419_fk_courses_tcm_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_tcm` (`course_id`),
  CONSTRAINT `program_courses_program_id_f6b1b847_fk_programs_program_id` FOREIGN KEY (`program_id`) REFERENCES `programs` (`program_id`),
  CONSTRAINT `program_courses_chk_1` CHECK ((`sequence_no` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_courses`
--

LOCK TABLES `program_courses` WRITE;
/*!40000 ALTER TABLE `program_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `program_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_trainers`
--

DROP TABLE IF EXISTS `program_trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program_trainers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `specialization` varchar(200) NOT NULL,
  `assigned_date` date NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `program_id` bigint NOT NULL,
  `trainer_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_trainer_program` (`trainer_id`,`program_id`),
  KEY `program_trainers_program_id_72a4a615_fk_programs_program_id` (`program_id`),
  CONSTRAINT `program_trainers_program_id_72a4a615_fk_programs_program_id` FOREIGN KEY (`program_id`) REFERENCES `programs` (`program_id`),
  CONSTRAINT `program_trainers_trainer_id_e1800720_fk_trainers_trainer_id` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_trainers`
--

LOCK TABLES `program_trainers` WRITE;
/*!40000 ALTER TABLE `program_trainers` DISABLE KEYS */;
/*!40000 ALTER TABLE `program_trainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs`
--

DROP TABLE IF EXISTS `programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programs` (
  `program_id` bigint NOT NULL AUTO_INCREMENT,
  `program_code` varchar(30) NOT NULL,
  `program_name` varchar(150) NOT NULL,
  `program_image` varchar(100) DEFAULT NULL,
  `description` longtext NOT NULL,
  `duration_days` int unsigned NOT NULL,
  `status` varchar(20) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`program_id`),
  UNIQUE KEY `program_code` (`program_code`),
  KEY `programs_category_id_889f640c_fk_course_categories_category_id` (`category_id`),
  CONSTRAINT `programs_category_id_889f640c_fk_course_categories_category_id` FOREIGN KEY (`category_id`) REFERENCES `course_categories` (`category_id`),
  CONSTRAINT `programs_chk_1` CHECK ((`duration_days` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs`
--

LOCK TABLES `programs` WRITE;
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;
INSERT INTO `programs` VALUES (1,'PRG-DWHB4P','Full stack web development','programs/what-is-html-3.webp','This is the Full Stack Web dev program',17,'Active',2);
/*!40000 ALTER TABLE `programs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `description` text,
  `status` varchar(20) NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','','Active'),(2,'Trainer','Trainer','Active'),(3,'Student','Student','Active');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_allocations`
--

DROP TABLE IF EXISTS `room_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_allocations` (
  `allocation_id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(50) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `bed_number` int NOT NULL,
  `allocation_date` date NOT NULL,
  `checkout_date` date DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `room_id` int NOT NULL,
  `person_type` varchar(10) NOT NULL,
  `checkin_date` date DEFAULT NULL,
  `actual_checkout_time` datetime(6) DEFAULT NULL,
  `checked_out_by_id` bigint DEFAULT NULL,
  PRIMARY KEY (`allocation_id`),
  KEY `hostelmgmt_roomalloc_room_id_fa582978_fk_hostelmgm` (`room_id`),
  KEY `room_allocations_checked_out_by_id_474327d8_fk_auth_user_id` (`checked_out_by_id`),
  CONSTRAINT `hostelmgmt_roomalloc_room_id_fa582978_fk_hostelmgm` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`),
  CONSTRAINT `room_allocations_checked_out_by_id_474327d8_fk_auth_user_id` FOREIGN KEY (`checked_out_by_id`) REFERENCES `gaurav_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_allocations`
--

LOCK TABLES `room_allocations` WRITE;
/*!40000 ALTER TABLE `room_allocations` DISABLE KEYS */;
INSERT INTO `room_allocations` VALUES (1,'STU002','Anjali Sharma','female',1,'2026-05-29','2026-06-10','vacated',2,'student','2026-06-01',NULL,NULL),(2,'STU004','Priya Nair','female',2,'2026-05-29','2026-06-12','vacated',2,'student','2026-06-03',NULL,NULL),(3,'STU001','Ravi Kumar','male',1,'2026-05-29','2026-06-10','vacated',3,'student','2026-06-01',NULL,NULL),(4,'STU003','Deepak Rao','male',2,'2026-05-29','2026-06-12','vacated',3,'student','2026-06-03',NULL,NULL),(5,'TRN001','Dr. Suresh Babu','male',1,'2026-05-29','2026-06-10','vacated',4,'trainer','2026-06-01',NULL,NULL),(6,'TRN002','Prof. Meena Joshi','female',1,'2026-05-29','2026-06-12','vacated',5,'trainer','2026-06-03',NULL,NULL),(7,'STU002','Anjali Sharma','female',1,'2026-05-29','2026-06-10','active',5,'student','2026-06-01',NULL,NULL),(8,'STU004','Priya Nair','female',2,'2026-05-29','2026-06-12','vacated',1,'student','2026-06-03','2026-05-29 11:55:07.822392',NULL),(9,'STU001','Ravi Kumar','male',1,'2026-05-29','2026-06-10','active',2,'student','2026-06-01',NULL,NULL),(10,'STU003','Deepak Rao','male',2,'2026-05-29','2026-06-12','active',2,'student','2026-06-03',NULL,NULL),(11,'TRN001','Dr. Suresh Babu','male',1,'2026-05-29','2026-06-10','active',3,'trainer','2026-06-01',NULL,NULL),(12,'TRN002','Prof. Meena Joshi','female',1,'2026-05-29','2026-06-12','active',4,'trainer','2026-06-03',NULL,NULL);
/*!40000 ALTER TABLE `room_allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_transfers`
--

DROP TABLE IF EXISTS `room_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_transfers` (
  `transfer_id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(50) NOT NULL,
  `reason` longtext NOT NULL,
  `request_date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `from_room_id` int NOT NULL,
  `to_room_id` int NOT NULL,
  `student_name` varchar(100) NOT NULL,
  PRIMARY KEY (`transfer_id`),
  KEY `hostelmgmt_roomtrans_from_room_id_72b247cd_fk_hostelmgm` (`from_room_id`),
  KEY `hostelmgmt_roomtrans_to_room_id_e4e5dd4e_fk_hostelmgm` (`to_room_id`),
  CONSTRAINT `hostelmgmt_roomtrans_from_room_id_72b247cd_fk_hostelmgm` FOREIGN KEY (`from_room_id`) REFERENCES `rooms` (`room_id`),
  CONSTRAINT `hostelmgmt_roomtrans_to_room_id_e4e5dd4e_fk_hostelmgm` FOREIGN KEY (`to_room_id`) REFERENCES `rooms` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_transfers`
--

LOCK TABLES `room_transfers` WRITE;
/*!40000 ALTER TABLE `room_transfers` DISABLE KEYS */;
INSERT INTO `room_transfers` VALUES (1,'STU002','Anjali Sharma moved to Room 5 (empty room)','2026-05-29','approved',1,5,'Anjali Sharma');
/*!40000 ALTER TABLE `room_transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_types`
--

DROP TABLE IF EXISTS `room_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_types` (
  `room_type_id` bigint NOT NULL AUTO_INCREMENT,
  `room_type_code` varchar(20) NOT NULL,
  `room_type_name` varchar(120) NOT NULL,
  `capacity` int unsigned NOT NULL,
  `description` longtext NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`room_type_id`),
  UNIQUE KEY `room_type_code` (`room_type_code`),
  CONSTRAINT `room_types_chk_1` CHECK ((`capacity` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_types`
--

LOCK TABLES `room_types` WRITE;
/*!40000 ALTER TABLE `room_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `room_id` int NOT NULL AUTO_INCREMENT,
  `room_number` varchar(10) NOT NULL,
  `capacity` int NOT NULL,
  `occupied` int NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `floor_id` int NOT NULL,
  PRIMARY KEY (`room_id`),
  KEY `hostelmgmt_room_floor_id_d950ad97_fk_hostelmgmt_floor_floor_id` (`floor_id`),
  CONSTRAINT `hostelmgmt_room_floor_id_d950ad97_fk_hostelmgmt_floor_floor_id` FOREIGN KEY (`floor_id`) REFERENCES `floors` (`floor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'1',2,0,NULL,'available',1),(2,'2',2,2,'male','full',1),(3,'3',2,1,'male','full',1),(4,'4',2,1,'female','full',1),(5,'5',2,1,'female','available',1),(6,'6',2,0,NULL,'available',1),(7,'7',2,0,NULL,'available',1),(8,'8',2,0,NULL,'available',1),(9,'9',2,0,NULL,'available',1),(10,'10',2,0,NULL,'available',1),(11,'11',2,0,NULL,'available',1),(12,'12',2,0,NULL,'available',1),(13,'13',2,0,NULL,'available',1),(14,'14',2,0,NULL,'available',1),(15,'15',2,0,NULL,'available',1),(16,'16',2,0,NULL,'available',1),(17,'17',2,0,NULL,'available',1),(18,'18',2,0,NULL,'available',1),(19,'19',2,0,NULL,'available',1),(20,'20',2,0,NULL,'available',1),(21,'21',2,0,NULL,'available',1),(22,'22',2,0,NULL,'available',1),(23,'23',2,0,NULL,'available',1),(24,'24',2,0,NULL,'available',1),(25,'25',2,0,NULL,'available',1),(26,'26',2,0,NULL,'available',1),(27,'27',2,0,NULL,'available',1),(28,'28',2,0,NULL,'available',1),(29,'29',2,0,NULL,'available',1),(30,'30',2,0,NULL,'available',1),(31,'31',2,0,NULL,'available',1),(32,'32',2,0,NULL,'available',1),(33,'33',2,0,NULL,'available',1),(34,'34',2,0,NULL,'available',1),(35,'35',2,0,NULL,'available',1),(36,'36',2,0,NULL,'available',1),(37,'37',2,0,NULL,'available',1),(38,'38',2,0,NULL,'available',1);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` bigint NOT NULL AUTO_INCREMENT,
  `session_topic` varchar(200) NOT NULL,
  `session_date` date NOT NULL,
  `start_time` time(6) NOT NULL,
  `end_time` time(6) NOT NULL,
  `meeting_link` varchar(200) NOT NULL,
  `notes` longtext NOT NULL,
  `recording_url` varchar(200) NOT NULL,
  `batch_id` bigint NOT NULL,
  `course_id` bigint NOT NULL,
  `trainer_id` bigint NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `sessions_batch_id_ba04ce08_fk_batches_batch_id` (`batch_id`),
  KEY `sessions_course_id_868bc519_fk_courses_tcm_course_id` (`course_id`),
  KEY `sessions_trainer_id_03121e9f_fk_trainers_trainer_id` (`trainer_id`),
  CONSTRAINT `sessions_batch_id_ba04ce08_fk_batches_batch_id` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`batch_id`),
  CONSTRAINT `sessions_course_id_868bc519_fk_courses_tcm_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_tcm` (`course_id`),
  CONSTRAINT `sessions_trainer_id_03121e9f_fk_trainers_trainer_id` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills_skill`
--

DROP TABLE IF EXISTS `skills_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills_skill` (
  `skill_id` int NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(200) NOT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills_skill`
--

LOCK TABLES `skills_skill` WRITE;
/*!40000 ALTER TABLE `skills_skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `skills_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills_trainerskill`
--

DROP TABLE IF EXISTS `skills_trainerskill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills_trainerskill` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `proficiency_level` varchar(50) DEFAULT NULL,
  `skill_id` int NOT NULL,
  `trainer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `skills_trainerskill_skill_id_0eb027c0_fk_skills_skill_skill_id` (`skill_id`),
  KEY `skills_trainerskill_trainer_id_38b42906_fk_trainers_` (`trainer_id`),
  CONSTRAINT `skills_trainerskill_skill_id_0eb027c0_fk_skills_skill_skill_id` FOREIGN KEY (`skill_id`) REFERENCES `skills_skill` (`skill_id`),
  CONSTRAINT `skills_trainerskill_trainer_id_38b42906_fk_trainers_` FOREIGN KEY (`trainer_id`) REFERENCES `trainers_trainer` (`trainer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills_trainerskill`
--

LOCK TABLES `skills_trainerskill` WRITE;
/*!40000 ALTER TABLE `skills_trainerskill` DISABLE KEYS */;
/*!40000 ALTER TABLE `skills_trainerskill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_master`
--

DROP TABLE IF EXISTS `status_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_master` (
  `status_master_id` bigint NOT NULL AUTO_INCREMENT,
  `entity_name` varchar(80) NOT NULL,
  `status_code` varchar(40) NOT NULL,
  `status_name` varchar(80) NOT NULL,
  `description` longtext NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`status_master_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_master`
--

LOCK TABLES `status_master` WRITE;
/*!40000 ALTER TABLE `status_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_guardians`
--

DROP TABLE IF EXISTS `student_guardians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_guardians` (
  `guardian_id` bigint NOT NULL AUTO_INCREMENT,
  `guardian_name` varchar(150) NOT NULL,
  `relation` varchar(60) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `occupation` varchar(120) NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`guardian_id`),
  KEY `student_guardians_student_id_3cb1569b_fk_students_student_id` (`student_id`),
  CONSTRAINT `student_guardians_student_id_3cb1569b_fk_students_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_guardians`
--

LOCK TABLES `student_guardians` WRITE;
/*!40000 ALTER TABLE `student_guardians` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_guardians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` bigint NOT NULL AUTO_INCREMENT,
  `student_code` varchar(30) NOT NULL,
  `first_name` varchar(80) NOT NULL,
  `last_name` varchar(80) NOT NULL,
  `dob` date DEFAULT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `join_date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `city_id` bigint DEFAULT NULL,
  `gender` bigint NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `student_code` (`student_code`),
  UNIQUE KEY `email` (`email`),
  KEY `students_city_id_e50e776a_fk_cities_city_id` (`city_id`),
  KEY `students_gender_de89a2f8_fk_genders_gender_id` (`gender`),
  CONSTRAINT `students_city_id_e50e776a_fk_cities_city_id` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`),
  CONSTRAINT `students_gender_de89a2f8_fk_genders_gender_id` FOREIGN KEY (`gender`) REFERENCES `genders` (`gender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_attendance`
--

DROP TABLE IF EXISTS `students_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students_attendance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `subject` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL,
  `remarks` varchar(200) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_attendance`
--

LOCK TABLES `students_attendance` WRITE;
/*!40000 ALTER TABLE `students_attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `students_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_notification`
--

DROP TABLE IF EXISTS `students_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `message` longtext NOT NULL,
  `is_global` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `student_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_notification`
--

LOCK TABLES `students_notification` WRITE;
/*!40000 ALTER TABLE `students_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `students_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_result`
--

DROP TABLE IF EXISTS `students_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students_result` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `max_marks` int NOT NULL,
  `obtained_marks` int NOT NULL,
  `grade` varchar(5) NOT NULL,
  `remarks` varchar(200) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_result`
--

LOCK TABLES `students_result` WRITE;
/*!40000 ALTER TABLE `students_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `students_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(68) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer_payments`
--

DROP TABLE IF EXISTS `trainer_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer_payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `amount_paid` decimal(12,2) NOT NULL,
  `payment_date` datetime(6) NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `reference_number` varchar(100) NOT NULL,
  `hours_billed` int NOT NULL,
  `status` varchar(20) NOT NULL,
  `remarks` longtext,
  `trainer_id` bigint NOT NULL,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `reference_number` (`reference_number`),
  KEY `trainer_payments_trainer_id_3b92c0bd_fk_trainers_trainer_id` (`trainer_id`),
  CONSTRAINT `trainer_payments_trainer_id_3b92c0bd_fk_trainers_trainer_id` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer_payments`
--

LOCK TABLES `trainer_payments` WRITE;
/*!40000 ALTER TABLE `trainer_payments` DISABLE KEYS */;
INSERT INTO `trainer_payments` VALUES (1,7500.00,'2026-05-29 10:57:02.630302','Bank Transfer','12345',10,'Completed','',1),(2,3750.00,'2026-05-29 10:58:04.172117','UPI','126',5,'Completed','',2);
/*!40000 ALTER TABLE `trainer_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer_skills`
--

DROP TABLE IF EXISTS `trainer_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer_skills` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `skill_id` int unsigned NOT NULL,
  `proficiency_level` varchar(50) NOT NULL,
  `trainer_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_trainer_skill` (`trainer_id`,`skill_id`),
  CONSTRAINT `trainer_skills_trainer_id_14002a33_fk_trainers_trainer_id` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`),
  CONSTRAINT `trainer_skills_chk_1` CHECK ((`skill_id` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer_skills`
--

LOCK TABLES `trainer_skills` WRITE;
/*!40000 ALTER TABLE `trainer_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainer_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainers`
--

DROP TABLE IF EXISTS `trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainers` (
  `trainer_id` bigint NOT NULL AUTO_INCREMENT,
  `trainer_code` varchar(30) NOT NULL,
  `first_name` varchar(80) NOT NULL,
  `last_name` varchar(80) NOT NULL,
  `dob` date DEFAULT NULL,
  `qualification` varchar(150) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `join_date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `gender` bigint NOT NULL,
  PRIMARY KEY (`trainer_id`),
  UNIQUE KEY `trainer_code` (`trainer_code`),
  UNIQUE KEY `email` (`email`),
  KEY `trainers_gender_7c3f43af_fk_genders_gender_id` (`gender`),
  CONSTRAINT `trainers_gender_7c3f43af_fk_genders_gender_id` FOREIGN KEY (`gender`) REFERENCES `genders` (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainers`
--

LOCK TABLES `trainers` WRITE;
/*!40000 ALTER TABLE `trainers` DISABLE KEYS */;
INSERT INTO `trainers` VALUES (1,'TRN-SHINI','Shini','Maam',NULL,'M.Tech in AI/ML','+91 98765 43210','shini@institution.edu','2025-01-15','Active',2),(2,'TRN-TUKARAM','Tukaram','Sir',NULL,'MCA, Full Stack Specialist','+91 98765 43211','tukaram@institution.edu','2024-06-20','Active',1),(3,'TRN-MISTRY','Mistry','Sir',NULL,'Ph.D. in Communication','+91 98765 43212','mistry@institution.edu','2023-07-01','Active',1);
/*!40000 ALTER TABLE `trainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainers_trainer`
--

DROP TABLE IF EXISTS `trainers_trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainers_trainer` (
  `trainer_id` int NOT NULL AUTO_INCREMENT,
  `trainer_code` varchar(20) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `profile_photo` varchar(100) DEFAULT NULL,
  `availability` varchar(50) NOT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `experience` int unsigned NOT NULL,
  `performance_rating` decimal(3,2) NOT NULL,
  `total_working_hours` int unsigned NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`trainer_id`),
  UNIQUE KEY `trainer_code` (`trainer_code`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `trainers_trainer_email_fcc187c2_uniq` (`email`),
  CONSTRAINT `trainers_trainer_user_id_cb9b2550_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `trainers_trainer_chk_1` CHECK ((`experience` >= 0)),
  CONSTRAINT `trainers_trainer_chk_2` CHECK ((`total_working_hours` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainers_trainer`
--

LOCK TABLES `trainers_trainer` WRITE;
/*!40000 ALTER TABLE `trainers_trainer` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainers_trainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_role_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_role_id`),
  UNIQUE KEY `uniq_user_role` (`user_id`,`role_id`),
  KEY `fk_user_roles_role` (`role_id`),
  CONSTRAINT `fk_user_roles_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_roles_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,2),(5,5,3);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `date_joined` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'pbkdf2_sha256$1200000$Z82fahnTCreNcNe5TRleTn$ASxxu/aKg88EIMqlgyuClnMblx9SfsQCwX6Y9OX84TQ=','2026-05-29 09:21:36',0,'crudtester','','','crudtester@example.com',0,1,'2026-05-29 09:17:59'),(2,'pbkdf2_sha256$1200000$GA9a8vXhzuGHvW7RlXobdd$B/Wk74N5GkQBTL8pXrCo6plDn6TeMiiyLezIPR90Aw4=','2026-05-29 10:22:03',0,'debugadmin','','','debug@local',1,1,'2026-05-29 10:22:02'),(3,'pbkdf2_sha256$1200000$P5PJLGMBNkEzWxgXHYHqke$odYwZYLqpJcjO+HYQJxWphdmzDfy6KdEUaB+cw19sqk=','2026-05-29 16:50:54',1,'admin','Admin','User','admin@example.com',1,1,'2026-05-29 10:23:51'),(4,'pbkdf2_sha256$1200000$pwMMHa6Qgge1uvHavKjbNH$ibNMuAYe7XzgzfmkamkWxZAWYPwTyOvejhFvTZZwDyI=',NULL,0,'TRN001','Asha','Sharma','trainer1@example.com',0,1,'2026-05-29 10:23:51'),(5,'pbkdf2_sha256$1200000$YdkHoxSg6sRsZZAieOKyfe$GWaLhEK2IiAyYY36mgWbtm0pz64jv69A8MHszWZaw+g=',NULL,0,'STD001','Rahul','Verma','student1@example.com',0,1,'2026-05-29 10:23:52');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitors`
--

DROP TABLE IF EXISTS `visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitors` (
  `visitor_id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(20) NOT NULL,
  `visitor_name` varchar(100) NOT NULL,
  `relationship` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `checkin` datetime(6) NOT NULL,
  `checkout` datetime(6) DEFAULT NULL,
  `purpose` longtext NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `visit_date` date DEFAULT NULL,
  `visitor_email` varchar(150) NOT NULL,
  PRIMARY KEY (`visitor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitors`
--

LOCK TABLES `visitors` WRITE;
/*!40000 ALTER TABLE `visitors` DISABLE KEYS */;
INSERT INTO `visitors` VALUES (1,'STU2024001','Shreya','Sister','9969633870','2026-05-30 17:50:00.000000','2026-05-30 18:50:00.000000','','',NULL,''),(2,'STU2024002','Shreya','Sister','9969633871','2026-05-30 16:00:00.000000','2026-05-30 17:00:00.000000','Family Visit','Sak','2026-05-30','murkarshreya3009@gmail.com'),(3,'STU2024002','Shreya','Sister','9969633871','2026-05-30 16:00:00.000000','2026-05-30 17:00:00.000000','Family Visit','Sak','2026-05-30','murkarshreya3009@gmail.com'),(4,'12','asdf','Guardian','7977037310','2026-05-30 17:00:00.000000','2026-05-31 16:00:00.000000','aasdfd','asd','2026-05-30','27mrunalipatil@gmail.com'),(5,'STU2024001','Neha Nayak','Friend','9969633870','2026-05-30 17:30:00.000000','2026-05-30 18:50:00.000000','abcd','Sak','2026-05-30','murkarshreya3009@gmail.com'),(6,'STU2024001','Neha Nayak','Friend','9969633870','2026-05-30 17:30:00.000000','2026-05-30 18:50:00.000000','abcd','Sak','2026-05-30','murkarshreya3009@gmail.com'),(7,'12','stdf','Father','1234556789','2026-05-30 17:58:00.000000','2026-05-30 16:59:00.000000','asdf','Mrunali','2026-05-30','27mrunalipatil@gmail.com'),(8,'STU2024001','Neha Nayak','Sister','9969633870','2026-05-29 20:01:00.000000','2026-05-29 22:01:00.000000','gdfghubbj','rohit','2026-05-29','27mrunalipatil@gmail.com'),(9,'STU2024001','Tukaram Bhagat','Father','7045364977','2026-05-29 17:05:00.000000','2026-05-29 23:05:00.000000','Famil Visit','Rahul','2026-05-29','tcbhagat@gmail.com');
/*!40000 ALTER TABLE `visitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waiting_list`
--

DROP TABLE IF EXISTS `waiting_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waiting_list` (
  `waiting_id` int NOT NULL AUTO_INCREMENT,
  `person_type` varchar(10) NOT NULL,
  `person_id` varchar(50) NOT NULL,
  `person_name` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `checkin_date` date DEFAULT NULL,
  `checkout_date` date DEFAULT NULL,
  `added_on` date NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`waiting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waiting_list`
--

LOCK TABLES `waiting_list` WRITE;
/*!40000 ALTER TABLE `waiting_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `waiting_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pravaah'
--

--
-- Dumping routines for database 'pravaah'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-29 22:39:21
