-- MariaDB dump 10.19  Distrib 10.10.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_ecom
-- ------------------------------------------------------
-- Server version	10.10.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add product',7,'add_product'),
(26,'Can change product',7,'change_product'),
(27,'Can delete product',7,'delete_product'),
(28,'Can view product',7,'view_product'),
(29,'Can add cart',8,'add_cart'),
(30,'Can change cart',8,'change_cart'),
(31,'Can delete cart',8,'delete_cart'),
(32,'Can view cart',8,'view_cart');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES
(1,'pbkdf2_sha256$390000$re36DCo8A7LorsvHHoqQhK$OPydOBmJAduspf1ImOSgEmbjHO4MSj9Qe1Q62IBU30s=','2023-01-03 08:19:04.983427',1,'manager','','','manager@mail.com',1,1,'2022-12-29 08:41:41.696843'),
(2,'pbkdf2_sha256$390000$6XX5YpjbJOALIxUhnuFGqs$evq4O0ncK68jvk4oxLtv8CEk3yh39iaAs//GnGGD5WQ=','2022-12-29 09:09:42.840980',0,'Admin12','','','Admin12@mail.com',0,1,'2022-12-29 09:01:16.479847'),
(3,'pbkdf2_sha256$390000$Hflv0Gk7UqsgtbQgwFa1q6$OlI8lBP1avSpTQ/BAK9lkN5xEUVdRIHOwYYxE7JHh1Y=','2022-12-29 10:12:17.715840',0,'user1','','','user1@mail.com',0,1,'2022-12-29 10:12:17.453631'),
(4,'pbkdf2_sha256$390000$4LCgdPpt2FKjrdLKixE32K$t3J65B82DjL9ghvrX3i+kDcPS/iGWHrHPvObwKypsJg=','2023-01-01 09:14:06.010425',0,'Yabao','','','yabao@mail.com',0,1,'2023-01-01 09:09:42.931587'),
(5,'pbkdf2_sha256$390000$3Ss4rroaXLPdTyIjTOG9jb$vRZ7SI5Myk30ke3wNYRJXWs46ochYo4m1dA/kGrevYE=','2023-01-03 08:18:47.245216',0,'frank','','','frank@mail.com',0,1,'2023-01-03 08:18:30.746882');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES
(1,'2022-12-29 08:50:44.667514','1','Car',1,'[{\"added\": {}}]',7,1),
(2,'2022-12-29 08:52:06.009942','1','Car',3,'',7,1),
(3,'2022-12-29 09:10:30.426726','2','car',1,'[{\"added\": {}}]',7,1),
(4,'2022-12-29 09:11:57.922649','2','car',2,'[]',7,1),
(5,'2022-12-29 09:24:17.144427','2','car',2,'[{\"changed\": {\"fields\": [\"Price\", \"Description\", \"Image\"]}}]',7,1),
(6,'2022-12-29 09:26:33.412771','3','bike',1,'[{\"added\": {}}]',7,1),
(7,'2022-12-29 09:26:58.970362','4','jet',1,'[{\"added\": {}}]',7,1),
(8,'2022-12-31 03:14:13.941557','4','jet',3,'',7,1),
(9,'2022-12-31 03:14:13.946160','3','bike',3,'',7,1),
(10,'2022-12-31 03:14:13.950216','2','car',3,'',7,1),
(11,'2022-12-31 03:25:12.300604','5','minivan',1,'[{\"added\": {}}]',7,1),
(12,'2022-12-31 03:30:41.848959','6','Lamborghini',1,'[{\"added\": {}}]',7,1),
(13,'2023-01-01 08:55:09.215068','7','Tesla roadster',1,'[{\"added\": {}}]',7,1),
(14,'2023-01-01 09:07:36.419946','6','Lamborghini',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',7,1),
(15,'2023-01-01 09:07:37.884756','6','Lamborghini',2,'[]',7,1),
(16,'2023-01-01 09:08:10.270749','5','minivan',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',7,1),
(17,'2023-01-03 08:19:42.966079','8','motorbike',1,'[{\"added\": {}}]',7,1),
(18,'2023-01-03 08:19:42.973451','9','motorbike',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(8,'main','cart'),
(7,'main','product'),
(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2022-12-29 08:38:21.270308'),
(2,'auth','0001_initial','2022-12-29 08:38:21.815898'),
(3,'admin','0001_initial','2022-12-29 08:38:21.937444'),
(4,'admin','0002_logentry_remove_auto_add','2022-12-29 08:38:21.947751'),
(5,'admin','0003_logentry_add_action_flag_choices','2022-12-29 08:38:21.956672'),
(6,'contenttypes','0002_remove_content_type_name','2022-12-29 08:38:22.032287'),
(7,'auth','0002_alter_permission_name_max_length','2022-12-29 08:38:22.078470'),
(8,'auth','0003_alter_user_email_max_length','2022-12-29 08:38:22.106441'),
(9,'auth','0004_alter_user_username_opts','2022-12-29 08:38:22.115481'),
(10,'auth','0005_alter_user_last_login_null','2022-12-29 08:38:22.159076'),
(11,'auth','0006_require_contenttypes_0002','2022-12-29 08:38:22.163129'),
(12,'auth','0007_alter_validators_add_error_messages','2022-12-29 08:38:22.171091'),
(13,'auth','0008_alter_user_username_max_length','2022-12-29 08:38:22.202319'),
(14,'auth','0009_alter_user_last_name_max_length','2022-12-29 08:38:22.231241'),
(15,'auth','0010_alter_group_name_max_length','2022-12-29 08:38:22.258854'),
(16,'auth','0011_update_proxy_permissions','2022-12-29 08:38:22.267853'),
(17,'auth','0012_alter_user_first_name_max_length','2022-12-29 08:38:22.296752'),
(18,'main','0001_initial','2022-12-29 08:38:22.422077'),
(19,'main','0002_cart','2022-12-29 08:38:22.632313'),
(20,'sessions','0001_initial','2022-12-29 08:38:22.693922');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('fm5ufsq58qcwht0k7h8nur65we5wrp2g','.eJxVjEEOwiAQRe_C2hCYUgZcuvcMZGBAqoYmpV0Z765NutDtf-_9lwi0rTVsPS9hYnEWWpx-t0jpkdsO-E7tNss0t3WZotwVedAurzPn5-Vw_w4q9fqtUx6shqIVliFlzwxkyFivCByWSISjIUamEdFFB7YoByqSBZ-MVSzeH_BZN_s:1pCcVk:DRHBIp5QlFAyrXMoFIEwEPouGlCx_INF0TvS1sfWw9g','2023-01-17 08:19:04.987261');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_cart`
--

DROP TABLE IF EXISTS `main_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_cart_user_id_53cf8b47_fk_auth_user_id` (`user_id`),
  CONSTRAINT `main_cart_user_id_53cf8b47_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_cart`
--

LOCK TABLES `main_cart` WRITE;
/*!40000 ALTER TABLE `main_cart` DISABLE KEYS */;
INSERT INTO `main_cart` VALUES
(2,1),
(1,2),
(3,3),
(4,4),
(5,5);
/*!40000 ALTER TABLE `main_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_cart_products`
--

DROP TABLE IF EXISTS `main_cart_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_cart_products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cart_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_cart_products_cart_id_product_id_65c4872b_uniq` (`cart_id`,`product_id`),
  KEY `main_cart_products_product_id_3e4b8c36_fk_main_product_id` (`product_id`),
  CONSTRAINT `main_cart_products_cart_id_1c698cf7_fk_main_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `main_cart` (`id`),
  CONSTRAINT `main_cart_products_product_id_3e4b8c36_fk_main_product_id` FOREIGN KEY (`product_id`) REFERENCES `main_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_cart_products`
--

LOCK TABLES `main_cart_products` WRITE;
/*!40000 ALTER TABLE `main_cart_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_cart_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_product`
--

DROP TABLE IF EXISTS `main_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `price` double NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_product`
--

LOCK TABLES `main_product` WRITE;
/*!40000 ALTER TABLE `main_product` DISABLE KEYS */;
INSERT INTO `main_product` VALUES
(5,'minivan',40000,'Production	Aug 1967–Jul 1979 (Europe and US)\r\nAssembly	Hanover, Germany Emden, Germany General Pacheco, Argentina São Bernardo do Campo, Brazil Puebla, Puebla, Mexico Melbourne, Australia\r\nPlatform	Volkswagen Group T2 platform\r\nEngine	1.6 L B4 (petrol) 1.7 L B4 (petrol)','product-images/ingo-doerrie-Fkwj-xk6yck-unsplash.jpg'),
(6,'Lamborghini',206000,'DISPLACEMENT 5,204 cm³ (317.57 cu in)\r\nMAX. POWER 640 CV (470 kW) @ 8,000 rpm\r\nTOP SPEED km/h >325 (mph > 202)\r\nACCELERATION 0-100 KM/H (MPH 0-62)\r\n2.9 s\r\nNUMBER OF CYLINDERS 10','product-images/karol-smoczynski-PlhpEa-WG6E-unsplash.jpg'),
(7,'Tesla roadster',172000,'Acceleration 0-100 km/h\r\n2.1 s\r\nAcceleration 1/4 mile\r\n8.8 s\r\nTop Speed\r\nOver 400 km/h\r\nWheel Torque\r\n10,000 Nm\r\nKilometer Range\r\n1,000 kilometers\r\nSeating\r\n4','product-images/tesla-fans-schweiz-7_OQMgoGzDw-unsplash.jpg'),
(8,'motorbike',20000,'description','product-images/max-itin-7GeprSfVqLQ-unsplash.jpg'),
(9,'motorbike',20000,'description','product-images/max-itin-7GeprSfVqLQ-unsplash_ip1NdpM.jpg');
/*!40000 ALTER TABLE `main_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-03  9:59:22
