-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: talent
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_talent_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_talent_user_id` FOREIGN KEY (`user_id`) REFERENCES `talent_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add site',6,'add_site'),(22,'Can change site',6,'change_site'),(23,'Can delete site',6,'delete_site'),(24,'Can view site',6,'view_site'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add category',8,'add_category'),(30,'Can change category',8,'change_category'),(31,'Can delete category',8,'delete_category'),(32,'Can view category',8,'view_category'),(33,'Can add product',9,'add_product'),(34,'Can change product',9,'change_product'),(35,'Can delete product',9,'delete_product'),(36,'Can view product',9,'view_product'),(37,'Can add review',10,'add_review'),(38,'Can change review',10,'change_review'),(39,'Can delete review',10,'delete_review'),(40,'Can view review',10,'view_review'),(41,'Can add ordered',11,'add_ordered'),(42,'Can change ordered',11,'change_ordered'),(43,'Can delete ordered',11,'delete_ordered'),(44,'Can view ordered',11,'view_ordered'),(45,'Can add cart',12,'add_cart'),(46,'Can change cart',12,'change_cart'),(47,'Can delete cart',12,'delete_cart'),(48,'Can view cart',12,'view_cart'),(49,'Can add email address',13,'add_emailaddress'),(50,'Can change email address',13,'change_emailaddress'),(51,'Can delete email address',13,'delete_emailaddress'),(52,'Can view email address',13,'view_emailaddress'),(53,'Can add email confirmation',14,'add_emailconfirmation'),(54,'Can change email confirmation',14,'change_emailconfirmation'),(55,'Can delete email confirmation',14,'delete_emailconfirmation'),(56,'Can view email confirmation',14,'view_emailconfirmation'),(57,'Can add social account',15,'add_socialaccount'),(58,'Can change social account',15,'change_socialaccount'),(59,'Can delete social account',15,'delete_socialaccount'),(60,'Can view social account',15,'view_socialaccount'),(61,'Can add social application',16,'add_socialapp'),(62,'Can change social application',16,'change_socialapp'),(63,'Can delete social application',16,'delete_socialapp'),(64,'Can view social application',16,'view_socialapp'),(65,'Can add social application token',17,'add_socialtoken'),(66,'Can change social application token',17,'change_socialtoken'),(67,'Can delete social application token',17,'delete_socialtoken'),(68,'Can view social application token',17,'view_socialtoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_talent_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_talent_user_id` FOREIGN KEY (`user_id`) REFERENCES `talent_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (13,'account','emailaddress'),(14,'account','emailconfirmation'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(6,'sites','site'),(15,'socialaccount','socialaccount'),(16,'socialaccount','socialapp'),(17,'socialaccount','socialtoken'),(12,'talent','cart'),(8,'talent','category'),(11,'talent','ordered'),(9,'talent','product'),(10,'talent','review'),(7,'talent','user');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-05-19 00:13:40.037963'),(2,'contenttypes','0002_remove_content_type_name','2023-05-19 00:13:40.149712'),(3,'auth','0001_initial','2023-05-19 00:13:40.757174'),(4,'auth','0002_alter_permission_name_max_length','2023-05-19 00:13:40.857932'),(5,'auth','0003_alter_user_email_max_length','2023-05-19 00:13:40.871442'),(6,'auth','0004_alter_user_username_opts','2023-05-19 00:13:40.884074'),(7,'auth','0005_alter_user_last_login_null','2023-05-19 00:13:40.909542'),(8,'auth','0006_require_contenttypes_0002','2023-05-19 00:13:40.919298'),(9,'auth','0007_alter_validators_add_error_messages','2023-05-19 00:13:40.931153'),(10,'auth','0008_alter_user_username_max_length','2023-05-19 00:13:40.944295'),(11,'auth','0009_alter_user_last_name_max_length','2023-05-19 00:13:40.957070'),(12,'auth','0010_alter_group_name_max_length','2023-05-19 00:13:40.988407'),(13,'auth','0011_update_proxy_permissions','2023-05-19 00:13:41.004048'),(14,'auth','0012_alter_user_first_name_max_length','2023-05-19 00:13:41.030919'),(15,'talent','0001_initial','2023-05-19 00:13:42.570044'),(16,'account','0001_initial','2023-05-19 00:13:42.904762'),(17,'account','0002_email_max_length','2023-05-19 00:13:42.941469'),(18,'admin','0001_initial','2023-05-19 00:13:43.178484'),(19,'admin','0002_logentry_remove_auto_add','2023-05-19 00:13:43.196081'),(20,'admin','0003_logentry_add_action_flag_choices','2023-05-19 00:13:43.214693'),(21,'sessions','0001_initial','2023-05-19 00:13:43.289512'),(22,'sites','0001_initial','2023-05-19 00:13:43.330439'),(23,'sites','0002_alter_domain_unique','2023-05-19 00:13:43.366084'),(24,'socialaccount','0001_initial','2023-05-19 00:13:44.167155'),(25,'socialaccount','0002_token_max_lengths','2023-05-19 00:13:44.254102'),(26,'socialaccount','0003_extra_data_default_dict','2023-05-19 00:13:44.273946');
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
INSERT INTO `django_session` VALUES ('1swwlfzzu61q330cuywwckyobrm0h166','.eJxVjU0OwiAQhe_C2jQUbAe604uQYRhSYkNNoYnGeHdb04Uu39_3XsLhWke3Fl5cCmIQqhenX9Mj3TjvCU7TbjdINK-5Nt_OEZfmsinONRHWNOfrsfpDjVjGjWO1Z_LBhNh1bWToFehoDbFHZfrI0jCYABQYpLVK6haANAUPUqpWn3do4VK2G8ePe1qeYpDvDxIiQ_8:1pztGA:qKt-k3lBV1kh8JgOpMhSqIh9IpBOuod1M69K-ZK9W5c','2023-06-02 06:06:38.888891'),('3jcrv1fm4euse3ydg8tyy16f4fbmyqpn','.eJxVTksOgyAQvQvrxgxKEd3Vi5BhBiKpwUYwadP07lXjol2-_3sLi2sZ7Zr9YiOLXjStuPySDunu067gNO10hUTzmkp1eE45V7cN-VQiYYlzGs7UX9WIedx6-MpOsQzSdAYQQwDgxmkG5TpmCrIm09aaTet10BJqqZRiMqx8BwTHv-xz3masfz7i8hI9fL4NMkQW:1pzuNP:E2Q3yW3VB62jPtLCJWyW-EYhRDjVekq0XnT2S4WTVO0','2023-06-02 07:18:11.885557'),('6jdn0ihgrr5mexzoeoyyzf6uijx896a3','.eJxVTksKgzAQvUvWRWZi1OiuvUiYTAYMlVhMhJbSu1fFRbt8__dWjtYyujXL4mJQg6pBXX5JT3yXtCs0TTtdEfO8plIdnlPO1XVDkkpkKnFOtzP1VzVSHreeEGqD3noPaIDZB-61AQ0UkHoMvWbbeYBWWrTSWouNDtghGUT0ujn-Zcl5m3HyfMTlpQb4fAHUDkLy:1pzt5G:QZSnmsQR3xpbqK26NeYRIXtf2sXUDrsMJ3Wfxe6t4Aw','2023-06-02 05:55:22.654637'),('8ms74lws26t83us20fuduzlky1bd9f0a','.eJxVjU0OwiAQhe_C2jQFA1O604uQ6TCkxIaaAonGeHeL6UKX7-97L-GwltnVzJuLXoxCDeL0a05IN04twWVpdodEa02l-3aOOHeXXXEqkbDENV2P1R9qxjw3znnAYJUOYK3xQU9G8gQSlOEBQdtgSaveggYCA3uVQq-0keTRg5KmQTPnvN84ftzj9hRj__4A4VlDhw:1pzurW:8aWTmEex8ahmvEYZTl1r-fbJrJoNkOkYCDyR-lMdaYQ','2023-06-02 07:49:18.360085'),('9njm7mus1wqghpc3624gx3ppi9hj6du8','.eJxVjUEOwiAQRe_C2jRQOp22O70IGWBIiQ01QhON8e4W04Uu_38z77-Eoa3MZst8N9GLSWglTr-lJXflVAktS60bcm7dUmm-NwfOzXlPnEp0VOKaLsfXn2qmPFfPGPqWejWCx66VsicEtoja-0F3qFygHSO3AIBAlkJQqEGi9Z3EMFRp5pz3GcOPW7w_xSTfH8y3Q1w:1pzt6p:PMADlKYgXJswv4TVx-ODvenTJNabL6GRmICMjjTAkzE','2023-06-02 05:56:59.139312'),('lilyxar26avi2ffydnbbzznehgx2ng3w','.eJxVjcsOwiAQRf-FtWmYFuxjpz9CZmBIiQ01BRKN8d-lpgtd3te5L2Gw5NmUxJsJTkyi1eL0axLaG8c9wWXZ7QatXUvMzbdzxKm5VMUxB4s5rPF6rP5QM6a5cgglaTnK1jvfjdoNnjuFqDR4QMk9ESolgVs_aoaewLKl2hgIwMG526GJU6o3hh_3sD3FJN8fDC1EUA:1pzrfR:iqafNCEb4c_Ui6uWz_eb0wuQEWfcI1y5o33u0GsWYfs','2023-06-02 04:24:37.630447'),('ohw6j9unziey5tcw6mshw7nfg5xu78y3','.eJxVjU0OgyAQhe_CujEiI4K7ehEyDkMkNdgIJm2a3r3auGiX7-97L-FwK5PbMq8uetGLRorLrzki3TgdCc7zYVdItGypVN_OGefquitOJRKWuKThXP2hJszTzpHBK4XeggUJoFqtTAeggaSBLlA32oaD18Ezaa0V1tK01gTJvlEENhzQzDnvN44f97g-RV-_P71DQ0Y:1pzqgA:s4gtBsqMmiyJZ2w3_06ectR9gOb4ELgjSnhpi2w7ygw','2023-06-02 03:21:18.545624'),('pbyrwckr62j7msthau3d323urbwa0bzx','.eJxVjU0OwiAQhe_C2jQUbAe604uQYRhSYkNNoYnGeHdb04Uu39_3XsLhWke3Fl5cCmIQqhenX9Mj3TjvCU7TbjdINK-5Nt_OEZfmsinONRHWNOfrsfpDjVjGjWO1Z_LBhNh1bWToFehoDbFHZfrI0jCYABQYpLVK6haANAUPUqpWn3do4VK2G8ePe1qeYpDvDxIiQ_8:1pzsr4:S3m_W7e36fFuZdBoZ6wnyeQpfqUGPe-FhZzSvLuZycg','2023-06-02 05:40:42.337247'),('q6a5xyn2er5fzghdp39ceaboztezpqru','.eJxVjU0OwiAQhe_C2jQdChS604uQYZimxIYaoYnGeHdb04Uu39_3XsLjWie_Fr77FMUgZC9Ov2ZAunLeE5zn3W6QaFlzbb6dIy7NeVOcayKsacmXY_WHmrBMG8cEVmA0kInQYdc7dCyNdlFJLd0IQQVr-1EBgyQiaHUMZMBastxq2e3QwqVsN54ft3R_iqF9fwDHakMq:1pzsxj:CRfslNezm_piPOMPpSU9nGYT3q1GIeI30ti3loGJaDM','2023-06-02 05:47:35.468095'),('qvzjth8rc4zwen0qiril6s2mjzsfeatr','.eJxVjU0OwiAQhe_C2jRAKbTd6UXIODOkxIaaQhON8e5S04Uu39_3XsLDVia_ZV59JDEKI06_3hXwxmkPYJ53uwHEZUul-XaOODfnqjiViFDiki7H6g81QZ4qxzocQNmhb_vWkkSUgTulHZCWmoxiIHQ9WxWGQFopoyi01AXTORvQhB2aOed64_lxj-tTjPL9Abl-Q7w:1pzuKD:PVW6nO8n9L52d6CWHDljIvCywuuaLbRusV0rWnhi66w','2023-06-02 07:14:53.281291'),('s3bl3njc27tphcm6501cpmhqclnnmiqb','.eJxVjU0OwiAQhe_C2jQFA1O604uQ6TCkxIaaAonGeHeL6UKX7-97L-GwltnVzJuLXoxCDeL0a05IN04twWVpdodEa02l-3aOOHeXXXEqkbDENV2P1R9qxjw3znnAYJUOYK3xQU9G8gQSlOEBQdtgSaveggYCA3uVQq-0keTRg5KmQTPnvN84ftzj9hRj__4A4VlDhw:1pzt0A:RC9ZdQxoEhOqnWkQFVOiKCet20mfbpzr5n2rix9TurE','2023-06-02 05:50:06.941649'),('tovv8ox7kot6p61sq4gl3lu60baflmlr','.eJxVjU0OgyAQhe_CujEiI4K7ehEyDkMkNdgIJm2a3r3auGiX7-97L-FwK5PbMq8uetGLRorLrzki3TgdCc7zYVdItGypVN_OGefquitOJRKWuKThXP2hJszTzpHBK4XeggUJoFqtTAeggaSBLlA32oaD18Ezaa0V1tK01gTJvlEENhzQzDnvN44f97g-RV-_P71DQ0Y:1pzs1r:tRBlyLKZA3w7B0LoJYKWAc8qNH_5HSk1DlYerzqAspw','2023-06-02 04:47:47.939162'),('u1gs3fnfzwsv1w30jkicsu7gbyi5rhmu','.eJxVjU0OgjAQhe_StSEDLUxhJxdppsMQGkkxtCQa490Fw0KX7-97L-Voy5PbkqwuDKpTpbr8ep74JvEIaJ4PuyDmZYu5-HbOOBXXXUnMgSmHJfbn6g81UZp2jtVGQ2WqEk3jrRXL5UCtRiBokNF430rtsa1ZyI9Q1ZqtHizKCKKR4IAmSWm_cfK4h_WpOnh_AIyBQyY:1pzpdm:u1ghekr-avQmlMsaMrXa66_TOOW63tMA41dxeNS-sqc','2023-06-02 02:14:46.639759'),('vb7mpvl22fp5rh9tnww469fli9y91s36','.eJxVjU0OwiAQhe_C2jRDKbTTnV6ETAdIiQ01QhON8e5S04Uu39_3XsLSVma7ZX-30YlRKC1Ov-ZEfPVpT2hZdrsh5nVLpfl2jjg356p8KpGpxDVdjtUfaqY8Vw6gDMYgGzkA0iRdT9DqPuDUoXODYpZVcas72bqOggODChiVQgk6qB2afc71xvrHLd6fYoT3B8JUQv0:1pzuHz:-lkTEN4hNg4rb4Mx7FBaYnTizSj2S7oNzz3Yi308hy4','2023-06-02 07:12:35.222547'),('wzk0t2wah1tnwvip43qqqfviaaadxroo','.eJxVjUsOgjAQhu_StSEtnaGFnV6kGYZJaCTF2JJojHeXGha6_J_fSwXayhy2LPcQJzUoC-r0a47EV0k1oWWpdkPM65ZK8-0ccW7Ou5JUIlOJa7ocq7-rmfJcCRZHQPJ9NzqLDjyCmzSD4R6l9eDBepkAjONWem3BSGfIotFokTqup1ly3jFBHrd4f6pBvz-Is0IO:1pzteE:W5OjXO2DP8G_iK3o9rRL0sech2oqAzPexq_0pTzQfzs','2023-06-02 06:31:30.579502'),('yntxb5pp31izscazrkil51ro4sswcfun','.eJxVjcsOgyAQRf-FdWN4CA7u6o-QEYZIarARTNo0_fdq46Jd3te5L-Zwq5PbCq0uBdYzpdjl1xzR3ygfCc7zYTfo_bLl2nw7Z1ya664o1-SxpiUP5-oPNWGZdg51XMeARhrQUWmI2mujPIogW4w-SAAJQrZgeeAGjRi5FmCtNUiBt90BLVTKfuPocU_rk_X8_QHMI0MF:1pzt9d:VDsboqnXdb9a34LV-kaAQuaPDKAWikKEGFKdk05bchE','2023-06-02 05:59:53.172800'),('ztv20nmb5si44k7jxe36vj7s4bwhmgyj','.eJxVjU0OgyAQhe_CujHCoIi7ehEyDkMkNdgIJm2a3r3auGiX7-97L-FwK5PbMq8uetELsOLya45IN05HgvN82BUSLVsq1bdzxrm67opTiYQlLmk4V3-oCfO0cyxS0wIawM5ikC2QH73yXWBdd9JopRWYoFowTBB4BJTGojXSE2sZmgOaOef9xvHjHten6Ov3B_YAQ_U:1pzuja:Nb8icOYs1qI1v6HEpAmegiO3wj9k2IUe_fzn-fwyIvo','2023-06-02 07:41:06.583048');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_talent_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_talent_user_id` FOREIGN KEY (`user_id`) REFERENCES `talent_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `socialapp_id` int NOT NULL,
  `site_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int NOT NULL,
  `app_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talent_cart`
--

DROP TABLE IF EXISTS `talent_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talent_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `user_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `talent_cart_product_id_b708ca70_fk_talent_product_id` (`product_id`),
  KEY `talent_cart_user_id_id_8cde0a51_fk_talent_user_id` (`user_id_id`),
  CONSTRAINT `talent_cart_product_id_b708ca70_fk_talent_product_id` FOREIGN KEY (`product_id`) REFERENCES `talent_product` (`id`),
  CONSTRAINT `talent_cart_user_id_id_8cde0a51_fk_talent_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `talent_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talent_cart`
--

LOCK TABLES `talent_cart` WRITE;
/*!40000 ALTER TABLE `talent_cart` DISABLE KEYS */;
INSERT INTO `talent_cart` VALUES (3,29,27),(4,28,27),(5,7,30),(7,32,35),(8,31,35);
/*!40000 ALTER TABLE `talent_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talent_category`
--

DROP TABLE IF EXISTS `talent_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talent_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talent_category`
--

LOCK TABLES `talent_category` WRITE;
/*!40000 ALTER TABLE `talent_category` DISABLE KEYS */;
INSERT INTO `talent_category` VALUES (1,'체육'),(2,'미술'),(3,'음악'),(4,'일상생활'),(5,'IT'),(6,'노하우'),(7,'취미'),(8,'동물'),(9,'쿠킹');
/*!40000 ALTER TABLE `talent_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talent_ordered`
--

DROP TABLE IF EXISTS `talent_ordered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talent_ordered` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `product_id` bigint DEFAULT NULL,
  `user_id_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `talent_ordered_product_id_101a302e_fk_talent_product_id` (`product_id`),
  KEY `talent_ordered_user_id_id_916bf00a_fk_talent_user_id` (`user_id_id`),
  CONSTRAINT `talent_ordered_product_id_101a302e_fk_talent_product_id` FOREIGN KEY (`product_id`) REFERENCES `talent_product` (`id`),
  CONSTRAINT `talent_ordered_user_id_id_916bf00a_fk_talent_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `talent_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talent_ordered`
--

LOCK TABLES `talent_ordered` WRITE;
/*!40000 ALTER TABLE `talent_ordered` DISABLE KEYS */;
INSERT INTO `talent_ordered` VALUES (1,10000,'2023-05-19 03:28:20.100687',22,21),(2,4200000,'2023-05-19 03:28:20.118819',18,21),(3,100000,'2023-05-19 07:17:25.714960',23,35),(4,1000,'2023-05-19 07:42:27.195791',33,39);
/*!40000 ALTER TABLE `talent_ordered` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talent_product`
--

DROP TABLE IF EXISTS `talent_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talent_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_name` varchar(200) NOT NULL,
  `price` int NOT NULL,
  `description` varchar(4000) NOT NULL,
  `thumbnail_image` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `category_id` bigint DEFAULT NULL,
  `user_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `talent_product_category_id_7d8d6689_fk_talent_category_id` (`category_id`),
  KEY `talent_product_user_id_id_473cad7d_fk_talent_user_id` (`user_id_id`),
  CONSTRAINT `talent_product_category_id_7d8d6689_fk_talent_category_id` FOREIGN KEY (`category_id`) REFERENCES `talent_category` (`id`),
  CONSTRAINT `talent_product_user_id_id_473cad7d_fk_talent_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `talent_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talent_product`
--

LOCK TABLES `talent_product` WRITE;
/*!40000 ALTER TABLE `talent_product` DISABLE KEYS */;
INSERT INTO `talent_product` VALUES (1,'나는야 강형식',55000,'당신의 반려동물을 훌륭한 반려동물이 될 수 있도록 훈육하겠습니다.','images/cat.10.jpg','2023-05-19 02:20:29.118549',8,1),(2,'[카트라이더] 지리는 드리프트 강좌',15000,'칼치기, 붕쉐의 A-Z 바이블','images/kart.jpeg','2023-05-19 02:22:56.293882',7,2),(3,'심오한 개발자',1000,'정말 심오한 개발자의 모습에 대해서 알려드릴게요 ㅎㅎ','images/코딩짤.jpeg','2023-05-19 02:22:58.093342',5,4),(4,'셀카 자연스럽게 찍는 법',10,'부산에서 셀카를 자연스럽게 찍는 법','images/바람_진수.jpeg','2023-05-19 02:31:15.248450',7,4),(5,'누구나 할 수 있는 다이어트',42000,'누구나 할 수 있다 !! 다이어트 도전해보세요.','images/다이어트_형식.jpeg','2023-05-19 02:32:13.747194',6,1),(6,'★학기초에 감투 선점하기★',99999,'저의 노하우를 전수해드립니다.','images/감투_지빈.jpeg','2023-05-19 02:33:13.874557',6,12),(7,'[롤] 다리우스 숙련도 80만의 다리우스 운용법',120000,'최대 티어 플1 다리우스 원챔의 노하우','images/스크린샷_2023-05-19_오전_11.31.44.png','2023-05-19 02:34:13.031291',7,5),(8,'댕댕 훈련마스터 클래스',69999,'댕댕이가 말을 잘 안듣는다구요 ? 제가 훈련 방법 알려드릴게요. 모두 도전해봐요. 훈련마스터','images/댕댕_규리.jpeg','2023-05-19 02:34:43.356607',8,8),(9,'킹냥이에 관한 고찰',5000,'우리 달봉이 너무 귀여움 ㅎㅎ','images/dalbong.jpeg','2023-05-19 02:40:10.054397',8,7),(10,'천사가 되는 법',10041004,'항상 웃으며 사는 법을 알려드립니다~~^^ 미소천사 ~~ : )','images/날개잃은인화.jpeg','2023-05-19 02:47:56.621287',6,9),(11,'일상생활속 야마카시',100000,'은둔고수의 야마카시','images/IMG_1273.JPG','2023-05-19 02:53:54.794329',4,14),(12,'강한 여자가 되는 법',0,'여자도 강할 수 있다. 강인한 여자가 되는 법을 알려드립니다.','images/강한_여자.jpeg','2023-05-19 02:55:44.772553',1,15),(13,'스타트업 강의',9200000,'스타트업 ? 생각보다 어렵지 않습니다. 이 강의를 듣는다면 충분히 여러분도 해낼 수 있습니다.','images/스타트업.jpeg','2023-05-19 02:58:39.584554',6,10),(14,'CTO가 되는 법',10000,'저의 경험을 토대로 강의해드립니다.','images/CEO.jpeg','2023-05-19 03:02:10.016343',5,10),(15,'몸 3개로 분열하는 방법',500000,'몸이 2개여도 모자른 생활 속에서 몸 3개로 활용하는 방법','images/IMG_6191.jpeg','2023-05-19 03:05:22.254144',6,17),(16,'음악을 즐기는 법(feat.루시우)',999,'루시우 : \"비트에 몸을 맡겨라 ~\"','images/루시우.jpeg','2023-05-19 03:10:22.168097',3,19),(17,'Mac 100% 활용법',1500,'모두가 모르고 있던 맥의 숨겨진 기능','images/KakaoTalk_Photo_2023-05-19-12-17-06.jpeg','2023-05-19 03:17:58.721260',6,18),(18,'요리의 모든 것 전수해드립니다',4200000,'베이킹부터 요리까지, 다이어트식도 문제없습니다. 요리에 관한 모든 것 알려드립니다. 초보자도 쉽게 따라할 수 있다! 겁먹지마십시오. 똥손들이여 일어나라!!!','images/요리왕비룡.jpeg','2023-05-19 03:18:38.895334',9,16),(19,'테니스가 배우고 싶어요',300000,'테니스 테니스 테테 테니스 테니스 uh 테니스 테니스 테테 테니스 테니스 hoo 테니스 테니스 테테 테니스 테니스 uh 테테테테테 테테테 테니스  테니스 테니스 테테 테니스 테니스 uh 테니스 테니스 테테 테니스 테니스 hoo 테니스 테니스 테테 테니스 테니스 uh 스파이크 강시브 리시브  요즘 하는 일이 잘 안되 웃는 일이 단 하루도 없어 하루 종일 한숨 쉬는 날만 늘어 집구석에 매일 쩔어가네  다이어트 실패한 여자들도 (여자들도) 스태미너 고민한 남자들도 (남자들도) 테니스를(슛슛) 테니스를(슛슛) 테니스를 배우고 싶어요  남녀노소 누구나 즐기는 내 맘속의 스포츠 어르신들 뼈를 튼튼 골다공증 예방하는 우리 스포츠 네트를 가르는 경쾌한 사운드 고품격 운동 테니스 남녀 단식 복식 혼합복식 모두 즐겨봐  테니스 테니스 테니스 테니스 테니스 테니스 테니스 테니스 테니스 테니스 테테 테니스 테니스 테테 테 테 테 테 테테테테 배우고 싶어요  테니스 테니스 테테 테니스 테니스 uh 테니스 테니스 테테 테니스 테니스 hoo 테니스 테니스 테테 테니스 테니스 uh 테테테테테 테테테 테니스  테니스 테니스 테테 테니스 테니스 uh 테니스 테니스 테테 테니스 테니스 hoo 테니스 테니스 테테 테니스 테니스 uh 스파이크 강시브 리시브  요즘 하는 일이 잘 안되 웃는 일이 단 하루도 없어 하루 종일 한숨 쉬는 날만 늘어 집구석에 매일 쩔어가네  스트레스 쌓였던 직장인도 (직장인도) 성적때메 고민한 학생들도 (학생들도) 테니스를(슛슛) 테니스를(슛슛) 테니스를 배우고 싶어요  남녀노소 누구나 즐기는 내 맘속의 스포츠 어르신들 뼈를 튼튼 골다공증 예방하는 우리 스포츠 네트를 가르는 경쾌한 사운드 고품격 운동 테니스 남녀 단식 복식 혼합복식 모두 즐겨봐  테니스 테니스 테테 테니스 테니스 uh 테니스 테니스 테테 테니스 테니스 hoo 테니스 테니스 테테 테니스 테니스 uh 테테테테테 테테테 테니스  (배우고 싶어요)  테니스 테니스 테테 테니스 테니스 uh 테니스 테니스 테테 테니스 테니스 hoo 테니스 테니스 테테 테니스 테니스 uh 스파이크 강시브 리시브  테테테테테 테테 테테 테니스 신발 신발 바지 바지 T T T.E.N.N.I.S 퉤니스','images/KakaoTalk_20230519_122134037.jpg','2023-05-19 03:22:02.925347',1,20),(20,'내 머릿속의 그림 표현하기',1000,'장소에 구애받지 않고 간단한 필기구 및 종이류만 있으면 수강 가능한 원데이 클래스입니다. ^_^','images/그림뚝딱.jpeg','2023-05-19 03:22:12.157323',2,16),(21,'대신 폭행 (물리적)',9999999,'대신 폭행해드립니다.( 합의금 포함 가격) 파격조건입니다.','images/대행.jpeg','2023-05-19 03:23:13.174383',7,21),(22,'대신 참교육(정신적)',10000,'MZ세대 힘드세요 ? 제가 대신 참교육해드릴게요.','images/참교육.png','2023-05-19 03:24:22.540510',7,21),(23,'드럼 기초 강의',100000,'스틱 잡는 방법부터 알려드립니다. 저도 초짜에요. 함께 큽시다.','images/드러머언니.jpeg','2023-05-19 03:26:54.454041',3,22),(24,'등산 잡지 표지 모델 되는 법',20000,'등산만 가면 아쉽죠? 등산가서 등산 잡지 표지 모델 뺨치는 사진 찍는 법 알려드립니다~','images/등산화보.jpeg','2023-05-19 03:30:06.654085',6,22),(25,'불면증? 해결할게요.',120000,'현대인의 제일 큰 숙적, 불면증을 전문 숙면유도가가 해결해드립니다.','images/KakaoTalk_20230519_123000685.jpg','2023-05-19 03:31:54.527086',4,1),(26,'코 푸는 법',1000,'아직도 코 혼자 못 푸시는 분들을 위한 강의.','images/킁_크응.jpeg','2023-05-19 03:33:17.602508',4,22),(27,'살인 청부',99999999,'존윅 유망주','images/존윅.jpeg','2023-05-19 03:36:17.453414',7,21),(28,'주식 분석을 위한 파이썬 기초 드립니다.',300000,'교육의 최종 목표는 개인 주식 시스템을 구축하는 것입니다. 파이썬은 개인이 노력만 하면 다른 언어에 비해서 구축 및 분석에 용이합니다. 강의는 전체 4파트에 걸쳐 진행될 예정이며, 이번 강의는 part1에 해당합니다. 강의를 통하여 누구나 주식을 분석하여 본인만의 패턴을 증명하고, 수익을 낼 수 있으면 좋겠습니다. 주식 전략 및 주식에 대한 강의는 하지 않지만, 분석 및 시스템을 만드는 방법을 알려드립니다. 모두 이제 주식을 엑셀 및 감으로 하지 말고 데이터 분석을 통해 진행했으면 합니다.','images/강사님프로필.png','2023-05-19 03:41:17.030276',5,23),(29,'참 쉽죠?',0,'EEEEEEasy','images/gen.png','2023-05-19 04:23:36.244833',2,23),(30,'라면먹고 갈래?',950,'나 라면 개 잘끓여','images/IMG_0073.jpeg','2023-05-19 04:30:32.074564',9,18),(31,'자신감 높이기 서비스',100,'자신감을 높여드려요 ㅎㅎ','images/IMG_7192.jpeg','2023-05-19 04:48:38.382308',4,21),(32,'스승의날 감사드려요',1000024,'스승의 날 이벤트 감동이에요. 정말.','images/스승의날.jpeg','2023-05-19 04:52:16.406929',4,23),(33,'간절한 눈빛 보내는 법',1000,'짱구처럼 불쌍하고 귀엽게 눈빛 보내는 방법 알려드립니다.','images/0000000000000000-compressor.gif','2023-05-19 07:34:21.885566',6,22),(34,'귤을 잘 따는 방법',10000,'ㅇㅇㅇ','images/귤.jpg','2023-05-19 07:43:53.724613',4,39);
/*!40000 ALTER TABLE `talent_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talent_review`
--

DROP TABLE IF EXISTS `talent_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talent_review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `like_count` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `talent_review_product_id_8d87f01b_fk_talent_product_id` (`product_id`),
  KEY `talent_review_user_id_id_46e9b5c2_fk_talent_user_id` (`user_id_id`),
  CONSTRAINT `talent_review_product_id_8d87f01b_fk_talent_product_id` FOREIGN KEY (`product_id`) REFERENCES `talent_product` (`id`),
  CONSTRAINT `talent_review_user_id_id_46e9b5c2_fk_talent_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `talent_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talent_review`
--

LOCK TABLES `talent_review` WRITE;
/*!40000 ALTER TABLE `talent_review` DISABLE KEYS */;
INSERT INTO `talent_review` VALUES (1,'교육 비용에 대한 안내','교육 비용은, 일주일에 2회 회당 1시간을 기준으로 55,000원으로 산정하였습니다.',0,'2023-05-19 02:23:07.928446',1,1),(2,'닌텐도스위치 러버입니다.','마리오카트도 배울 수 있나요?',0,'2023-05-19 02:23:53.053742',2,1),(3,'개발자구매관련','심오한 개발자를 천원에 구입하기를 희망합니다.',0,'2023-05-19 02:24:15.815857',3,1),(4,'룰라-날개 잃은 천사','룰라가 부릅니다. 날개 잃은 천사',0,'2023-05-19 02:59:43.935277',10,10),(5,'혹시','선생님 7살이에요 ?',0,'2023-05-19 03:27:24.253374',20,21),(6,'안녕하세요.','네고 가능한가요?',0,'2023-05-19 04:35:52.777672',26,1),(7,'문의 드립니다.','클래식도 가능한가요?',0,'2023-05-19 04:40:40.873154',16,1),(8,'안녕하세요.','문자 확인 부탁드립니다!!',0,'2023-05-19 04:41:49.893248',6,1),(9,'코딩?','너무 쉬워요!',0,'2023-05-19 04:45:43.890898',29,1),(10,'그.. 혹시','건면인가요?',0,'2023-05-19 04:48:09.910349',30,1),(11,'참교육 요청','박규리 참교육 요청드립니다',0,'2023-05-19 05:01:39.030819',22,7),(12,'다 방법이 있죠!','한번 해볼까요?',0,'2023-05-19 05:02:19.466099',25,7),(13,'그런데...','댕댕이 표정이 너무 안좋아보이네요',0,'2023-05-19 05:04:19.806030',8,7),(14,'감사합니다 강사님!','항상 건강하시고, 멋진 일타 강사로 기억하겠습니다!!',0,'2023-05-19 05:23:54.217331',32,1),(15,'스승님 사랑합니다♥︎','제 최고의 스승님이십니다!! 항상 좋은 수업 감사드리고, 질문도 잘 받아주셔서 감사해요! 항상 건강하시고 남은 기간도 잘 부탁드립니다 ㅎㅎ',0,'2023-05-19 05:39:51.657218',32,22),(16,'감사합니다아~❤','3개월 전만 해도 코딩의 ㅋ도 몰랐는데, 지금은 아장아장 따라가는 느낌이긴 하지만 그래도 이제 나름 지인들한테 가서 \"코딩 할 줄 안다!\" 할 수 있게 되었어요 모르는거 물어보면 자세하게 다 끝까지 설명해주시고, 물어본거 뿐만 아니라 그 외에 관련된 것 중에 필요한 정보들도 추가로 알려주셔서 많은 도움이 됐어요! 제 첫코딩을 이렇게 좋은 분위기와 좋은 사람들, 그리고 좋은 강사님과 함께 하면서 시작할 수 있어서 정말 좋아요 이 부트캠프가 끝나고도 강사님이랑 알고 지내는 제자가 될 수 있게, 앞으로 더 열심히 달려볼게요! 늘 건강하시고 화이팅입니당~! 감사합니다 :)',0,'2023-05-19 05:42:22.260827',32,26),(17,'44053 49324 45784 32 44048 49324 54633 45768 45796 33','10 44053 49324 45784 32 45720 32 44048 49324 46300 47549 45768 45796 46 10 49828 49849 51032 32 45216 50640 32 51089 49457 54664 50632 51648 47564 44 10 45936 51060 53552 48288 51060 49828 32 54644 53433 51004 47196 32 51064 54644 32 47700 49884 51648 47484 32 51204 45804 46300 47532 51648 32 47803 54644 32 50620 47560 45208 32 50500 49789 45912 51648 50836 46 46 46 10 44053 49324 45784 44760 32 48176 50864 47728 32 52280 32 47566 51008 32 50669 47049 32 54693 49345 51060 32 51080 50632 49845 45768 45796 46 32 44048 49324 54633 45768 45796 46 10 49688 47308 54624 32 46412 44620 51648 32 51096 32 48512 53441 46300 47532 44256 44 32 45908 32 44048 49324 55176 32 48176 50864 44192 49845 45768 45796 46 10 51096 32 49688 47308 54644 49436 32 44845 32 102 34 51228 51088 44032 32 123 99 111 109 112 97 110 121 125 32 45796 45768 45716 45936 32 46 46 46 34 32 51060 50556 44592 50640 32 50724 47484 32 49688 32 51080 46020 47197 10 45908 32 45432 47141 54616 44256 32 45908 32 50676 49900 55176 32',0,'2023-05-19 05:44:26.406218',32,1),(18,'테니스 미소천사 origin J','테니스 oppa 멋져요 ~~~ 무료 강의는 없나요? 저는 가난한 학생인데 ㅎ',0,'2023-05-19 05:44:53.272507',19,22),(19,'눈물','만납니다..',0,'2023-05-19 05:48:06.421957',29,27),(20,'불면증','은 없지만 구매해볼게요',0,'2023-05-19 05:48:52.966110',25,27),(21,'해킹','이번엔 안 당하겠죠? 으깬 감자를 말하는 감자로 만들어주고 계신 강사님께 감사의 말씀 올립니다. 얼른 사람이 될 수 있도록 앞으로도 많은 가르침 부탁드립니다. 술자리 좀 와서 재규진만지빈 이 술고래들 참교육 좀 해주십쇼 ㅠㅠ',0,'2023-05-19 05:51:27.011342',32,27),(22,'이런것도 다 강사님께 배운 겁니다','sudo service Chanwoong status: 	being respected',0,'2023-05-19 05:54:58.388178',32,28),(23,'강사님 감사합니다','고래를 좋아하는 한 사람입니다. 강사님 덕분에 이번 프로젝트를 어느정도 구색은 맞춘것 같습니다. 이 쇼핑몰을 만든 팀은 아니지만.. 저희 팀에서 제가 담당한 페이지의 94.7%는 강사님이 만드신거 같습니다. 물어보고 싶은건 더 많았지만.. 그 부분은 제가 들어도 모를거같아서 다음에 공부를 더 하고 질문 드리겠습니다 ㅎㅎ.. 그래도 어느정도 코드를 이해하게 된건 모두 강사님 덕분인 것 같습니다 감사합니다!!!',0,'2023-05-19 06:00:48.254410',32,31),(24,'찬웅이형 짱!','제곧내',0,'2023-05-19 06:01:08.170077',32,33),(25,'스승이란...','항상 좋은것만 주시는분이 아닐까요?? 너무 감사합니다.',0,'2023-05-19 06:32:12.187600',32,34),(26,'항상 감사합니다.','항상 유익한 정보들과 가르침에 감사드리고 아프지말구 건강하세요 ㅠㅠ',0,'2023-05-19 07:19:23.899701',32,4),(27,'꿈에','대신 때려죽여주신 건 넘넘 고마운데 ............. 제 꿈에 나오셔서 저까지 때려죽이시는데 ....... 너무 무서워요 ........ ㅠㅠ',0,'2023-05-19 07:21:01.530032',21,36),(28,'음..','제가 더 잘 찍는 것 같은데 저한테 10만원에 강의 들으실 생각 있으면 연락주세요.^^',0,'2023-05-19 07:24:26.524893',4,22),(29,'ss','ssss',0,'2023-05-19 07:43:21.466422',33,39),(30,'귤농장 사장님 같아요','믿음직스럽네요',0,'2023-05-19 07:47:46.338942',34,22);
/*!40000 ALTER TABLE `talent_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talent_user`
--

DROP TABLE IF EXISTS `talent_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talent_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_superuser` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `username` varchar(20) NOT NULL,
  `birth` date DEFAULT NULL,
  `gender` varchar(15) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `profile_image` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talent_user`
--

LOCK TABLES `talent_user` WRITE;
/*!40000 ALTER TABLE `talent_user` DISABLE KEYS */;
INSERT INTO `talent_user` VALUES (1,0,0,1,'2674625@naver.com','pbkdf2_sha256$600000$ZHINkU4mXu46zr0efhkOBC$zp/xt3qS23+yuIC1dyBG72rdjbtieMi83YntXagXkjI=','Hyeongsik','1997-07-25','M','010-9816-4560','','2023-05-19 02:14:37.628280'),(2,0,0,1,'wi1@gmail.com','pbkdf2_sha256$600000$bw9DV87MYWnALeoI1Ik9zK$JPq/VPX83oRtUxQSmJ1e6IivdLE2RQROfkWnAtLr5jg=','엔코아카트지존최강','1995-10-16','M','010-1234-1234','','2023-05-19 02:18:09.936815'),(3,0,0,1,'changhyun@gmail.com','pbkdf2_sha256$600000$amIYX465XYhskz2lZcgbwe$lmN3q+FIf0s+YW754JdQfNBsJ6CdltpPQg1zmh4JhdY=','데이터엔지니어','1998-12-05','M','010-1234-1234','','2023-05-19 02:19:52.567215'),(4,0,0,1,'changhyun@naver.com','pbkdf2_sha256$600000$hxumEvQ4iYDpRupZsBDZ1O$fg5PSemVKcSLMPaU1LFUSdAOSWdBokzRTAusan9H4wc=','엔지니어유망주','1998-12-05','M','010-1234-1234','','2023-05-19 02:21:32.326753'),(5,0,0,1,'wi2@gmail.com','pbkdf2_sha256$600000$9UMLlG65jGDiDNYvWgJWKh$tnRH8veJYPejVtrgmoe+Bw0mRseqwA1TVjjzWZFT8Xo=','다리우스원챔','1995-10-16','M','010-1234-1234','','2023-05-19 02:24:16.880273'),(6,0,0,1,'jibeeni@gmail.com','pbkdf2_sha256$600000$40K7COYCcy4n8hoq30lEET$NltHzkHznieYGFGLM7EFng85C9wTtFPNaJd1u4+TwGg=','반★짱★님','1997-05-28','F','010-2222-4444','','2023-05-19 02:36:41.682938'),(7,0,0,1,'wi3@gmail.com','pbkdf2_sha256$600000$q5SnEghUHAi2HQf2MtNnv4$tjt2f2caBAzc4GZfmzwJpnHoAh0hjMAtBWzi068mjrs=','달봉이아빠','1995-10-16','M','010-1234-1234','','2023-05-19 02:39:01.895287'),(8,0,0,1,'kyudongenuna@gmail.com','pbkdf2_sha256$600000$wSqmDDN4aXMGd9iDSEZ0nN$W/DWZnGZiQVgVqhNE7y0DhQ3ub3v2dTN+BbEKUENKCc=','규동이지구뿌셔','2000-01-19','F','010-1004-1004','','2023-05-19 02:39:21.460116'),(9,0,0,1,'angel1004@gmail.com','pbkdf2_sha256$600000$EHE4ifG8RzEAAPNw85Zxps$9svaMPWU/aDwPPTDAloQl8isV626iqvmbZBpz9tAk60=','날개잃은천사','1996-11-26','F','010-1004-1004','','2023-05-19 02:41:12.738220'),(10,0,0,1,'oh@naver.com','pbkdf2_sha256$600000$4KtYAkhEKibJbj9EAxwULn$SVFqc02zP+QEZsmYOcqRsSMc373FAmbq/qGSPgpPGVA=','CEO','1995-05-16','M','010-2342-2345','','2023-05-19 02:43:48.179410'),(11,0,0,1,'jinsu@naver.com','pbkdf2_sha256$600000$vsSaZm3DwozabYh1sbslHK$lw2tGYk7JKm0gLUaQ2/5hmMKgZ/s3JG/0AIdbaXGkEI=','섹시가이장진수','1995-05-22','M','010-2346-8976','','2023-05-19 02:44:45.214500'),(12,0,0,1,'lee@naver.com','pbkdf2_sha256$600000$wFuhtI8VWoKyIkhTsz6KQx$AF/twph2IxbtSc/epKiF2vtKDn8TuM/8qj5Tdd3lPu0=','22기핫걸지빈','1997-05-20','F','010-2349-3995','','2023-05-19 02:46:33.454573'),(13,0,0,1,'gyuri@naver.com','pbkdf2_sha256$600000$F4dqkodJBXGXXWxVCjt6uC$mYBLNNU6fFtO2vO6aGTL6iKxZk4ma4fIIBl0g4T7mI0=','규동이누나','1998-02-04','F','010-2349-5960','','2023-05-19 02:48:14.092224'),(14,0,0,1,'wi4@gmail.com','pbkdf2_sha256$600000$UNuz9znxRZkkopvZzBFyuQ$0xKhtZuXMJ/nsPT0J8fHv3SGZ2FCso7n67GufJ/MIVw=','Yamakasi','1995-10-16','M','010-1234-1234','','2023-05-19 02:48:23.891814'),(15,0,0,1,'strongwoman@gmail.com','pbkdf2_sha256$600000$80OiwTOVjQkfd5no8fl6mn$5yQOekMEKpDy+sWneuopx3zGcM3eWrI84KKzrsqEmY4=','강한@여자','1996-11-26','F','010-9999-9999','','2023-05-19 02:54:06.157620'),(16,0,0,1,'shinsalimdang@gmail.com','pbkdf2_sha256$600000$1bt8IbzircHVX8xmoR2F8I$e8RPlk/GEASxrnW+Y2kegWymA8k5A2Vrcv2UnOLIE64=','신사임당@현모양처','1996-11-26','F','010-6666-6666','','2023-05-19 02:57:39.518443'),(17,0,0,1,'wi5@gmail.com','pbkdf2_sha256$600000$z07rhTp4PnP3hhTG5ja5MP$OBHMrg+tLeH9adKPbMoD3Pk1xvzFlxCp3/sniMGHlVg=','정신분열','1995-10-16','M','010-1234-1234','','2023-05-19 03:03:56.910422'),(18,0,0,1,'wi6@gmail.com','pbkdf2_sha256$600000$Ck1k4iLsEtG9Gq8yJMAME4$4aFJ8ORjeHc3PVXGRxzYMhrjJIWbYiIR81hKpuGq8h8=','위아래위위아래','1995-10-16','M','010-1234-1234','','2023-05-19 03:06:44.611429'),(19,0,0,1,'heesu@naver.com','pbkdf2_sha256$600000$lgil4XsNeacr44dWmzZWER$kGLzvsUZPz6/XS8TeB3Spt+TnakqRIbcp7EfMTnbtFw=','서초왕희수','1997-09-23','M','010-2345-9765','','2023-05-19 03:08:15.150808'),(20,0,0,1,'origin@gmail.com','pbkdf2_sha256$600000$UWK4yjcRDkgSO2rsFff0Yt$HS9g0gFHKKtQppJMri6TZcg4Bd967Hq+r6KYeaY/+rk=','오리진','1999-03-02','M','010-2379-2893','','2023-05-19 03:16:38.928475'),(21,0,0,1,'gusl4497@gmail.com','pbkdf2_sha256$600000$jRMD3mNTdDp6QHIdXAmw2G$ljOfq4ndanF5d/uGd7JOtcu0HKdMbL3LO4AKiyB0csM=','대행서비스','1998-12-05','M','010-8543-4497','','2023-05-19 03:20:54.001451'),(22,0,0,1,'inhwa@gmail.com','pbkdf2_sha256$600000$COCdaodPot1lGjvFZtDu0v$Q2koySVwyorcgj7TVkzm+1cxPhMIXpevUDKZE0Hcl00=','안녕내이름은홍인화','1996-11-26','F','010-2005-8850','','2023-05-19 03:25:11.487575'),(23,0,0,1,'gen@gmail.com','pbkdf2_sha256$600000$X5Yjks6TkQ7Wu5ikpSPsGO$It+7s3hm9cQEbHR2ysCkPZLXndt++MZ+J9DLDy3W86Q=','내가 바로 찬웅이','1982-01-01','M','010-0101-0101','','2023-05-19 03:34:56.238119'),(24,0,0,1,'wi7@gmail.com','pbkdf2_sha256$600000$dIOYUhHi1dfI1zHO3F8gSM$J1cEpTDoFirE3aXtTGYxfDV43rOhZJr+3HXnzG8rfiY=','gen','1523-05-01','M','010-1234-1234','','2023-05-19 04:22:50.140393'),(25,0,0,1,'hi@example.com','pbkdf2_sha256$600000$tef5EOjyjGfpxsiNsnqyah$5suaVAQHWAHSvbbg3M1/15Osg41Hw355R+/ZpnKdj7A=','안녕하세용','2023-05-14','F','010-1016-1016','','2023-05-19 04:24:21.390129'),(26,0,0,1,'nalcy020819@naver.com','pbkdf2_sha256$600000$pMzZZ53rNDK1fDhhEc0KFr$VORf+heVL6mhhFhSAYYA5wZL2/RwZa+MBulcXmyJPtE=','22기_막냉이','2002-08-19','F','010-3408-0858','','2023-05-19 05:40:29.878881'),(27,0,0,1,'koala@naver.com','pbkdf2_sha256$600000$4DTiQEBdDRISi7iyyfpEVY$C3JZwmugna+INrP6IVotWlcECBSkRfeVXW+ayAJiALw=','코알코알','2023-05-19','M','010-3159-3677','','2023-05-19 05:47:11.223833'),(28,0,0,1,'jibeenpark@gmail.com','pbkdf2_sha256$600000$zCDCQxC5kANtgmrMN8AKQo$CdKuThseZa44FsBHYghqhFKdVUo1pxRCY2fDBxrG/Eg=','반짱','2004-05-28','F','010-8825-0939','','2023-05-19 05:49:57.849641'),(29,0,0,1,'pisnkr@naver.com','pbkdf2_sha256$600000$TPHzYDHqjwgflvZnx7ts0a$XxgZriA5UCUEP/stQggyL2KMrCmvHIopPpyJuPCLL5Y=','Kyudong_e','1998-02-19','F','010-4056-7736','','2023-05-19 05:53:19.199858'),(30,0,0,1,'dankim0124@gmail.com','pbkdf2_sha256$600000$B3fZnqxwkMm5uHiH4SIbLc$HjOpHJiyiJIu6N1vayKKrcq4JeNiJtAzEWjCIKblCSk=','현도 ','1995-01-24','M','010-9193-2378','','2023-05-19 05:55:13.798236'),(31,0,0,1,'docker@docker.com','pbkdf2_sha256$600000$Mz3g7XK9KeMLjPqyUiYzoK$qnOMjww9qHX1x7dgedmyD0aiWbRaroocGLvFwBQSG9c=','dockerlover','2023-05-08','M','010-2023-0519','','2023-05-19 05:56:45.021714'),(32,0,0,1,'ohoh@gamil.com','pbkdf2_sha256$600000$zJPi4cWrJ8eIsk6BgnEIlJ$hjMb1inWrInxdyBy6mbj31GpidnbgC67LemoMddde78=','ㅇㅈ','1996-05-16','M','010-5550-4428','','2023-05-19 05:58:43.601168'),(33,0,0,1,'ohoh@naver.com','pbkdf2_sha256$600000$CIxpIjfa6lkEIgId95sOb4$iloPbiZckKgHceFmKizC4FiOo3gPHnoogsr8A8I0YNg=','홍길동','1996-05-16','M','010-5550-4428','','2023-05-19 05:59:40.273030'),(34,0,0,1,'haaappy@kakao.com','pbkdf2_sha256$600000$Hac3sRjALTtXMsQUzMuPXi$4GkgTYGKBYEk1uAB1Xebixo4zRB7+r6lS/sHEG3gK0E=','문해피','2023-05-19','M','010-6666-7777','','2023-05-19 06:31:09.325622'),(35,0,0,1,'test00@naver.com','pbkdf2_sha256$600000$n8psj6E1Ydj51bn4ePHHiO$JTP9p1/gnf0TJSkmXT8A6Fw6nGg7q0higQOoqsIUTqQ=','test00','2000-02-02','M','010-1111-1111','','2023-05-19 07:12:28.013823'),(36,0,0,1,'lovelyhyun@naver.com','pbkdf2_sha256$600000$UoyzdI6Nni1IqTkICNsFe6$8tCc9+XGCW0QhnxeGZWBvxxwaV3LdAMtnTpzETjALWs=','러블리창현><','1998-12-05','M','010-8543-4497','','2023-05-19 07:17:52.537804'),(37,0,0,1,'123@naver.com','pbkdf2_sha256$600000$G8wzRLeVL09fE3wmICTJZJ$nIcU5aHuwfcGSSD2XLRC6zjPeaCSzhIF8VatVXr96oY=','qwe','2023-05-12','F','010-1234-5678','','2023-05-19 07:18:02.514498'),(38,0,0,1,'hey9@gmail.com','pbkdf2_sha256$600000$wgLZdimBGPD84lnXfvgDc8$YX7sMPBK0hYM/RWn0KMRlXN27ldfzPKPI0cwVAPK4u4=','싱숭생숭어','2001-01-30','F','010-1234-5678','','2023-05-19 07:37:41.373338'),(39,0,0,1,'test01@naver.com','pbkdf2_sha256$600000$9fp0NPZAv9IqXv6t6GcDEI$2Ziq6kSf8gmJXwWOMUc/MhEkfMDA/wud7LpvbNHut2c=','test01','1999-03-02','M','010-1111-1111','','2023-05-19 07:40:50.864316');
/*!40000 ALTER TABLE `talent_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talent_user_groups`
--

DROP TABLE IF EXISTS `talent_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talent_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `talent_user_groups_user_id_group_id_c06ef696_uniq` (`user_id`,`group_id`),
  KEY `talent_user_groups_group_id_efed81bf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `talent_user_groups_group_id_efed81bf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `talent_user_groups_user_id_8c71e31b_fk_talent_user_id` FOREIGN KEY (`user_id`) REFERENCES `talent_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talent_user_groups`
--

LOCK TABLES `talent_user_groups` WRITE;
/*!40000 ALTER TABLE `talent_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `talent_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talent_user_user_permissions`
--

DROP TABLE IF EXISTS `talent_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talent_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `talent_user_user_permissions_user_id_permission_id_ddade7a5_uniq` (`user_id`,`permission_id`),
  KEY `talent_user_user_per_permission_id_b191227c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `talent_user_user_per_permission_id_b191227c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `talent_user_user_permissions_user_id_95d35da5_fk_talent_user_id` FOREIGN KEY (`user_id`) REFERENCES `talent_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talent_user_user_permissions`
--

LOCK TABLES `talent_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `talent_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `talent_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-22  0:20:50
