-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: pravaah
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Dumping data for table `accounts_userprofile`
--

LOCK TABLES `accounts_userprofile` WRITE;
/*!40000 ALTER TABLE `accounts_userprofile` DISABLE KEYS */;
INSERT IGNORE INTO `accounts_userprofile` VALUES (1,0,1),(2,0,2);
/*!40000 ALTER TABLE `accounts_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `assessment_assessment`
--

LOCK TABLES `assessment_assessment` WRITE;
/*!40000 ALTER TABLE `assessment_assessment` DISABLE KEYS */;
INSERT IGNORE INTO `assessment_assessment` VALUES (1,'Python Basics Quiz','Quiz','2026-06-05',50,'Assessment for Python basics module',NULL);
/*!40000 ALTER TABLE `assessment_assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT IGNORE INTO `auth_group` VALUES (1,'Trainer');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT IGNORE INTO `auth_group_permissions` VALUES (2,1,30),(1,1,32),(3,1,36),(6,1,44);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT IGNORE INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',5,'add_permission'),(6,'Can change permission',5,'change_permission'),(7,'Can delete permission',5,'delete_permission'),(8,'Can view permission',5,'view_permission'),(9,'Can add group',6,'add_group'),(10,'Can change group',6,'change_group'),(11,'Can delete group',6,'delete_group'),(12,'Can view group',6,'view_group'),(13,'Can add user',7,'add_user'),(14,'Can change user',7,'change_user'),(15,'Can delete user',7,'delete_user'),(16,'Can view user',7,'view_user'),(17,'Can add content type',8,'add_contenttype'),(18,'Can change content type',8,'change_contenttype'),(19,'Can delete content type',8,'delete_contenttype'),(20,'Can view content type',8,'view_contenttype'),(21,'Can add session',9,'add_session'),(22,'Can change session',9,'change_session'),(23,'Can delete session',9,'delete_session'),(24,'Can view session',9,'view_session'),(25,'Can add user profile',10,'add_userprofile'),(26,'Can change user profile',10,'change_userprofile'),(27,'Can delete user profile',10,'delete_userprofile'),(28,'Can view user profile',10,'view_userprofile'),(29,'Can add trainer',2,'add_trainer'),(30,'Can change trainer',2,'change_trainer'),(31,'Can delete trainer',2,'delete_trainer'),(32,'Can view trainer',2,'view_trainer'),(33,'Can add skill',3,'add_skill'),(34,'Can change skill',3,'change_skill'),(35,'Can delete skill',3,'delete_skill'),(36,'Can view skill',3,'view_skill'),(37,'Can add trainer skill',11,'add_trainerskill'),(38,'Can change trainer skill',11,'change_trainerskill'),(39,'Can delete trainer skill',11,'delete_trainerskill'),(40,'Can view trainer skill',11,'view_trainerskill'),(41,'Can add certification',4,'add_certification'),(42,'Can change certification',4,'change_certification'),(43,'Can delete certification',4,'delete_certification'),(44,'Can view certification',4,'view_certification'),(45,'Can add availability',12,'add_availability'),(46,'Can change availability',12,'change_availability'),(47,'Can delete availability',12,'delete_availability'),(48,'Can view availability',12,'view_availability'),(49,'Can add batch assignment',13,'add_batchassignment'),(50,'Can change batch assignment',13,'change_batchassignment'),(51,'Can delete batch assignment',13,'delete_batchassignment'),(52,'Can view batch assignment',13,'view_batchassignment'),(53,'Can add assessment',14,'add_assessment'),(54,'Can change assessment',14,'change_assessment'),(55,'Can delete assessment',14,'delete_assessment'),(56,'Can view assessment',14,'view_assessment'),(57,'Can add availability',15,'add_availability'),(58,'Can change availability',15,'change_availability'),(59,'Can delete availability',15,'delete_availability'),(60,'Can view availability',15,'view_availability'),(61,'Can add leave request',16,'add_leaverequest'),(62,'Can change leave request',16,'change_leaverequest'),(63,'Can delete leave request',16,'delete_leaverequest'),(64,'Can view leave request',16,'view_leaverequest'),(65,'Can add session plan',17,'add_sessionplan'),(66,'Can change session plan',17,'change_sessionplan'),(67,'Can delete session plan',17,'delete_sessionplan'),(68,'Can view session plan',17,'view_sessionplan'),(69,'Can add course module',18,'add_coursemodule'),(70,'Can change course module',18,'change_coursemodule'),(71,'Can delete course module',18,'delete_coursemodule'),(72,'Can view course module',18,'view_coursemodule'),(73,'Can add topic',19,'add_topic'),(74,'Can change topic',19,'change_topic'),(75,'Can delete topic',19,'delete_topic'),(76,'Can view topic',19,'view_topic'),(77,'Can add mark',20,'add_mark'),(78,'Can change mark',20,'change_mark'),(79,'Can delete mark',20,'delete_mark'),(80,'Can view mark',20,'view_mark'),(81,'Can add feedback',21,'add_feedback'),(82,'Can change feedback',21,'change_feedback'),(83,'Can delete feedback',21,'delete_feedback'),(84,'Can view feedback',21,'view_feedback');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT IGNORE INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$I9YDvK4SDvq8l5ZX5EV4xY$aXR6Zk3qxRJ87w7lOfnMrbYqm23EMo37zAuLtly5sEQ=','2026-05-29 05:56:30.434664',1,'superadmin','','','superadmin@gmail.com',1,1,'2026-05-28 08:27:45.900802'),(2,'pbkdf2_sha256$1000000$gW1QqAOfVPKkhQUIHZFI2Q$eBGQrK3lg3Ye1NsXOCti9AHJw3xLk49d1tUjm3VKS38=','2026-05-29 05:32:33.899086',0,'Rahul@123','','','',0,1,'2026-05-28 17:50:27.197924');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `availability_availability`
--

LOCK TABLES `availability_availability` WRITE;
/*!40000 ALTER TABLE `availability_availability` DISABLE KEYS */;
INSERT IGNORE INTO `availability_availability` VALUES (1,'2026-05-18','unavailable','sick leave',1,'2026-05-29 02:41:07.706346','2026-05-29 02:41:07.740993'),(2,'2026-05-29','available','Dummy availability',2,'2026-05-29 02:41:07.706346','2026-05-29 02:41:07.740993'),(3,'2026-05-30','available','Dummy availability',2,'2026-05-29 02:41:07.706346','2026-05-29 02:41:07.740993'),(4,'2026-05-31','available','Dummy availability',2,'2026-05-29 02:41:07.706346','2026-05-29 02:41:07.740993'),(5,'2026-06-01','available','Dummy availability',2,'2026-05-29 02:41:07.706346','2026-05-29 02:41:07.740993'),(6,'2026-06-02','available','Dummy availability',2,'2026-05-29 02:41:07.706346','2026-05-29 02:41:07.740993');
/*!40000 ALTER TABLE `availability_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `availability_leaverequest`
--

LOCK TABLES `availability_leaverequest` WRITE;
/*!40000 ALTER TABLE `availability_leaverequest` DISABLE KEYS */;
INSERT IGNORE INTO `availability_leaverequest` VALUES (1,'2026-06-08','Dummy leave request for testing','pending','2026-05-29 01:42:13.283825',2,'2026-05-29 02:41:07.772563',NULL,NULL),(2,'2026-06-08','Dummy leave request for testing','pending','2026-05-29 01:43:59.973907',2,'2026-05-29 02:41:07.772563',NULL,NULL);
/*!40000 ALTER TABLE `availability_leaverequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `available_availability`
--

LOCK TABLES `available_availability` WRITE;
/*!40000 ALTER TABLE `available_availability` DISABLE KEYS */;
INSERT IGNORE INTO `available_availability` VALUES (1,'2026-06-02',1);
/*!40000 ALTER TABLE `available_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `batch_batchassignment`
--

LOCK TABLES `batch_batchassignment` WRITE;
/*!40000 ALTER TABLE `batch_batchassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch_batchassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `certifications_certification`
--

LOCK TABLES `certifications_certification` WRITE;
/*!40000 ALTER TABLE `certifications_certification` DISABLE KEYS */;
/*!40000 ALTER TABLE `certifications_certification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT IGNORE INTO `django_admin_log` VALUES (1,'2026-05-28 17:50:28.382645','2','Rahul@123',1,'[{\"added\": {}}]',7,1),(2,'2026-05-28 18:08:30.255490','1','Availability object (1)',1,'[{\"added\": {}}]',15,1),(3,'2026-05-29 02:46:39.346281','1','TRN001 - Rahul Sharma - 2026-06-02',1,'[{\"added\": {}}]',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT IGNORE INTO `django_content_type` VALUES (10,'accounts','userprofile'),(1,'admin','logentry'),(14,'assessment','assessment'),(6,'auth','group'),(5,'auth','permission'),(7,'auth','user'),(15,'availability','availability'),(16,'availability','leaverequest'),(12,'available','availability'),(13,'batch','batchassignment'),(4,'certifications','certification'),(8,'contenttypes','contenttype'),(21,'feedback','feedback'),(20,'marks','mark'),(17,'sessionplans','sessionplan'),(9,'sessions','session'),(3,'skills','skill'),(11,'skills','trainerskill'),(18,'structure','coursemodule'),(19,'structure','topic'),(2,'trainers','trainer');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT IGNORE INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-05-28 08:25:23.165750'),(2,'auth','0001_initial','2026-05-28 08:25:23.893689'),(3,'accounts','0001_initial','2026-05-28 08:25:24.023158'),(4,'admin','0001_initial','2026-05-28 08:25:24.164633'),(5,'admin','0002_logentry_remove_auto_add','2026-05-28 08:25:24.184480'),(6,'admin','0003_logentry_add_action_flag_choices','2026-05-28 08:25:24.198417'),(7,'contenttypes','0002_remove_content_type_name','2026-05-28 08:25:24.285524'),(8,'auth','0002_alter_permission_name_max_length','2026-05-28 08:25:24.350579'),(9,'auth','0003_alter_user_email_max_length','2026-05-28 08:25:24.384691'),(10,'auth','0004_alter_user_username_opts','2026-05-28 08:25:24.386912'),(11,'auth','0005_alter_user_last_login_null','2026-05-28 08:25:24.448121'),(12,'auth','0006_require_contenttypes_0002','2026-05-28 08:25:24.448121'),(13,'auth','0007_alter_validators_add_error_messages','2026-05-28 08:25:24.465628'),(14,'auth','0008_alter_user_username_max_length','2026-05-28 08:25:24.541828'),(15,'auth','0009_alter_user_last_name_max_length','2026-05-28 08:25:24.598772'),(16,'auth','0010_alter_group_name_max_length','2026-05-28 08:25:24.610962'),(17,'auth','0011_update_proxy_permissions','2026-05-28 08:25:24.610962'),(18,'auth','0012_alter_user_first_name_max_length','2026-05-28 08:25:24.702654'),(19,'trainers','0001_initial','2026-05-28 08:25:24.718728'),(20,'certifications','0001_initial','2026-05-28 08:25:24.798491'),(21,'sessions','0001_initial','2026-05-28 08:25:24.845235'),(22,'skills','0001_initial','2026-05-28 08:25:25.004867'),(23,'trainers','0002_trainer_user','2026-05-28 08:25:25.071158'),(24,'batch','0001_initial','2026-05-28 16:45:58.567465'),(25,'assessment','0001_initial','2026-05-28 16:45:58.663194'),(26,'availability','0001_initial','2026-05-28 16:45:58.861274'),(27,'available','0001_initial','2026-05-28 16:45:58.959154'),(28,'sessionplans','0001_initial','2026-05-28 16:45:59.042836'),(29,'feedback','0001_initial','2026-05-28 16:45:59.074573'),(30,'feedback','0002_initial','2026-05-28 16:45:59.146426'),(31,'marks','0001_initial','2026-05-28 16:45:59.246258'),(32,'structure','0001_initial','2026-05-28 16:45:59.350446'),(33,'assessment','0002_alter_assessment_batch','2026-05-29 01:43:47.851891'),(34,'trainers','0003_alter_trainer_options_trainer_created_at_and_more','2026-05-29 02:41:07.680455'),(35,'availability','0002_alter_leaverequest_options_availability_created_at_and_more','2026-05-29 02:41:07.969834'),(36,'batch','0002_alter_batchassignment_options_and_more','2026-05-29 02:41:08.247843'),(37,'sessionplans','0002_sessionplan_batch_sessionplan_created_at_and_more','2026-05-29 02:41:08.460242'),(38,'feedback','0003_feedback_batch_feedback_created_at_and_more','2026-05-29 02:41:08.567671'),(39,'marks','0002_mark_batch_mark_created_at_mark_percentage_and_more','2026-05-29 02:41:08.824563'),(40,'structure','0002_coursemodule_batch_coursemodule_created_at_and_more','2026-05-29 02:41:09.055249');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT IGNORE INTO `django_session` VALUES ('cfdv7gv01lr3mii7t0udsom6tluou5x8','.eJxVjMEOwiAQBf-FsyGFpWB79O43EGAXixowpU00xn-3JD3o9c28eTPr1mWya6XZJmQjE-zwu3kXbpQbwKvLl8JDycucPG8K32nl54J0P-3uX2Byddre_ZEEdqAIojDCSxrkECDIwYMLSutOexASpIpRezQ9aIVIblOUlhFMi1aqNZVs6flI84uN3ecLc5Y-1A:1wSqCs:ohuvEdBEw7wxAc2ox7A-7dMF2t6FYCvxMjunWY1oL3M','2026-06-12 05:56:30.434664');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `feedback_feedback`
--

LOCK TABLES `feedback_feedback` WRITE;
/*!40000 ALTER TABLE `feedback_feedback` DISABLE KEYS */;
INSERT IGNORE INTO `feedback_feedback` VALUES (1,'John Doe',5,'Excellent session, very informative and engaging!','2026-05-29 01:42:13.283825',1,NULL,'2026-05-29 02:41:08.521872'),(2,'John Doe',5,'Excellent session, very informative and engaging!','2026-05-29 01:43:59.958432',2,NULL,'2026-05-29 02:41:08.521872');
/*!40000 ALTER TABLE `feedback_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `marks_mark`
--

LOCK TABLES `marks_mark` WRITE;
/*!40000 ALTER TABLE `marks_mark` DISABLE KEYS */;
INSERT IGNORE INTO `marks_mark` VALUES (1,'John Doe','STU_001',42,43,85,'B',1,NULL,'2026-05-29 02:41:08.659406',0,'2026-05-29 02:41:08.728304');
/*!40000 ALTER TABLE `marks_mark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sessionplans_sessionplan`
--

LOCK TABLES `sessionplans_sessionplan` WRITE;
/*!40000 ALTER TABLE `sessionplans_sessionplan` DISABLE KEYS */;
INSERT IGNORE INTO `sessionplans_sessionplan` VALUES (1,'Introduction to Python','Basics and Environment Setup','2026-05-31',90,'Learn Python basics, setup development environment','Interactive Lecture with Hands-on','Python IDE, Course Materials PDF','upcoming',2,NULL,'2026-05-29 02:41:08.304949',1,'2026-05-29 02:41:08.389562'),(2,'Introduction to Python','Basics and Environment Setup','2026-05-31',90,'Learn Python basics, setup development environment','Interactive Lecture with Hands-on','Python IDE, Course Materials PDF','upcoming',2,NULL,'2026-05-29 02:41:08.304949',1,'2026-05-29 02:41:08.389562');
/*!40000 ALTER TABLE `sessionplans_sessionplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `skills_skill`
--

LOCK TABLES `skills_skill` WRITE;
/*!40000 ALTER TABLE `skills_skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `skills_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `skills_trainerskill`
--

LOCK TABLES `skills_trainerskill` WRITE;
/*!40000 ALTER TABLE `skills_trainerskill` DISABLE KEYS */;
/*!40000 ALTER TABLE `skills_trainerskill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `structure_coursemodule`
--

LOCK TABLES `structure_coursemodule` WRITE;
/*!40000 ALTER TABLE `structure_coursemodule` DISABLE KEYS */;
INSERT IGNORE INTO `structure_coursemodule` VALUES (1,'Python Fundamentals',1,'ongoing',50,NULL,'2026-05-29 02:41:08.959946',NULL,'2026-05-29 02:41:08.995518'),(2,'Python Fundamentals',1,'ongoing',50,NULL,'2026-05-29 02:41:08.959946',NULL,'2026-05-29 02:41:08.995518');
/*!40000 ALTER TABLE `structure_coursemodule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `structure_topic`
--

LOCK TABLES `structure_topic` WRITE;
/*!40000 ALTER TABLE `structure_topic` DISABLE KEYS */;
INSERT IGNORE INTO `structure_topic` VALUES (1,'Variables and Data Types','ongoing',1,'2026-05-29 02:41:09.014216',NULL,'2026-05-29 02:41:09.030488'),(2,'Variables and Data Types','ongoing',2,'2026-05-29 02:41:09.014216',NULL,'2026-05-29 02:41:09.030488');
/*!40000 ALTER TABLE `structure_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `trainers_trainer`
--

LOCK TABLES `trainers_trainer` WRITE;
/*!40000 ALTER TABLE `trainers_trainer` DISABLE KEYS */;
INSERT IGNORE INTO `trainers_trainer` VALUES (1,'TRN001','Rahul','Sharma','B.Tech in Computer Technology','Appiled Mathematics','1234567890','Rahul@gmail.com',NULL,'Pending','trainers/Screenshot_2026-04-23_174810.png','Available',NULL,'2026-05-29 02:41:07.059320',0,0.00,0,'2026-05-29 02:41:07.531332'),(2,'DUMMY_001','Dummy','Trainer','MSc','Python Development','9876543210','dummy@example.com','2026-04-29','Active','','Available',NULL,'2026-05-29 02:41:07.059320',0,0.00,0,'2026-05-29 02:41:07.531332');
/*!40000 ALTER TABLE `trainers_trainer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-29 22:35:27

