-- MySQL dump 10.15  Distrib 10.0.35-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: api_production
-- ------------------------------------------------------
-- Server version	10.0.35-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `architectures`
--

DROP TABLE IF EXISTS `architectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `architectures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `arch_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `architectures`
--

LOCK TABLES `architectures` WRITE;
/*!40000 ALTER TABLE `architectures` DISABLE KEYS */;
INSERT INTO `architectures` VALUES (1,'aarch64',0),(2,'armv4l',0),(3,'armv5l',0),(4,'armv6l',0),(5,'armv7l',1),(6,'armv5el',0),(7,'armv6el',0),(8,'armv7el',1),(9,'armv7hl',0),(10,'armv8el',1),(11,'hppa',0),(12,'i586',1),(13,'i686',0),(14,'ia64',0),(15,'local',0),(16,'m68k',0),(17,'mips',0),(18,'mips32',0),(19,'mips64',0),(20,'ppc',0),(21,'ppc64',0),(22,'ppc64p7',0),(23,'ppc64le',0),(24,'s390',0),(25,'s390x',0),(26,'sparc',0),(27,'sparc64',0),(28,'sparc64v',0),(29,'sparcv8',0),(30,'sparcv9',0),(31,'sparcv9v',0),(32,'x86_64',1);
/*!40000 ALTER TABLE `architectures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `architectures_distributions`
--

DROP TABLE IF EXISTS `architectures_distributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `architectures_distributions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `distribution_id` int(11) DEFAULT NULL,
  `architecture_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `architectures_distributions`
--

LOCK TABLES `architectures_distributions` WRITE;
/*!40000 ALTER TABLE `architectures_distributions` DISABLE KEYS */;
/*!40000 ALTER TABLE `architectures_distributions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attrib_allowed_values`
--

DROP TABLE IF EXISTS `attrib_allowed_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attrib_allowed_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrib_type_id` int(11) NOT NULL,
  `value` text CHARACTER SET utf8,
  PRIMARY KEY (`id`),
  KEY `attrib_type_id` (`attrib_type_id`),
  CONSTRAINT `attrib_allowed_values_ibfk_1` FOREIGN KEY (`attrib_type_id`) REFERENCES `attrib_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attrib_allowed_values`
--

LOCK TABLES `attrib_allowed_values` WRITE;
/*!40000 ALTER TABLE `attrib_allowed_values` DISABLE KEYS */;
INSERT INTO `attrib_allowed_values` VALUES (1,9,'DisableDevel'),(2,9,'BugownerOnly'),(3,17,'Stable'),(4,17,'Testing'),(5,17,'Development'),(6,17,'Private');
/*!40000 ALTER TABLE `attrib_allowed_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attrib_default_values`
--

DROP TABLE IF EXISTS `attrib_default_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attrib_default_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrib_type_id` int(11) NOT NULL,
  `value` text CHARACTER SET utf8 NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attrib_type_id` (`attrib_type_id`),
  CONSTRAINT `attrib_default_values_ibfk_1` FOREIGN KEY (`attrib_type_id`) REFERENCES `attrib_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attrib_default_values`
--

LOCK TABLES `attrib_default_values` WRITE;
/*!40000 ALTER TABLE `attrib_default_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `attrib_default_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attrib_issues`
--

DROP TABLE IF EXISTS `attrib_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attrib_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrib_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_attrib_issues_on_attrib_id_and_issue_id` (`attrib_id`,`issue_id`),
  KEY `issue_id` (`issue_id`),
  CONSTRAINT `attrib_issues_ibfk_1` FOREIGN KEY (`attrib_id`) REFERENCES `attribs` (`id`),
  CONSTRAINT `attrib_issues_ibfk_2` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attrib_issues`
--

LOCK TABLES `attrib_issues` WRITE;
/*!40000 ALTER TABLE `attrib_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `attrib_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attrib_namespace_modifiable_bies`
--

DROP TABLE IF EXISTS `attrib_namespace_modifiable_bies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attrib_namespace_modifiable_bies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrib_namespace_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attrib_namespace_user_role_all_index` (`attrib_namespace_id`,`user_id`,`group_id`),
  KEY `bs_user_id` (`user_id`),
  KEY `bs_group_id` (`group_id`),
  KEY `index_attrib_namespace_modifiable_bies_on_attrib_namespace_id` (`attrib_namespace_id`),
  CONSTRAINT `attrib_namespace_modifiable_bies_ibfk_1` FOREIGN KEY (`attrib_namespace_id`) REFERENCES `attrib_namespaces` (`id`),
  CONSTRAINT `attrib_namespace_modifiable_bies_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `attrib_namespace_modifiable_bies_ibfk_5` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attrib_namespace_modifiable_bies`
--

LOCK TABLES `attrib_namespace_modifiable_bies` WRITE;
/*!40000 ALTER TABLE `attrib_namespace_modifiable_bies` DISABLE KEYS */;
INSERT INTO `attrib_namespace_modifiable_bies` VALUES (1,1,1,NULL);
/*!40000 ALTER TABLE `attrib_namespace_modifiable_bies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attrib_namespaces`
--

DROP TABLE IF EXISTS `attrib_namespaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attrib_namespaces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attrib_namespaces_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attrib_namespaces`
--

LOCK TABLES `attrib_namespaces` WRITE;
/*!40000 ALTER TABLE `attrib_namespaces` DISABLE KEYS */;
INSERT INTO `attrib_namespaces` VALUES (1,'OBS');
/*!40000 ALTER TABLE `attrib_namespaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attrib_type_modifiable_bies`
--

DROP TABLE IF EXISTS `attrib_type_modifiable_bies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attrib_type_modifiable_bies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrib_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attrib_type_user_role_all_index` (`attrib_type_id`,`user_id`,`group_id`,`role_id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `attrib_type_modifiable_bies_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `attrib_type_modifiable_bies_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `attrib_type_modifiable_bies_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attrib_type_modifiable_bies`
--

LOCK TABLES `attrib_type_modifiable_bies` WRITE;
/*!40000 ALTER TABLE `attrib_type_modifiable_bies` DISABLE KEYS */;
INSERT INTO `attrib_type_modifiable_bies` VALUES (1,1,1,NULL,NULL),(2,2,1,NULL,NULL),(3,3,1,NULL,NULL),(4,4,1,NULL,NULL),(5,5,1,NULL,NULL),(6,6,1,NULL,NULL),(7,7,1,NULL,NULL),(8,8,1,NULL,NULL),(9,9,1,NULL,NULL),(10,10,NULL,NULL,2),(11,11,NULL,NULL,2),(12,12,NULL,NULL,2),(13,13,NULL,NULL,2),(14,14,NULL,NULL,2),(15,15,NULL,NULL,2),(16,16,NULL,NULL,2),(17,16,NULL,NULL,3),(18,16,NULL,NULL,4),(19,17,NULL,NULL,2);
/*!40000 ALTER TABLE `attrib_type_modifiable_bies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attrib_types`
--

DROP TABLE IF EXISTS `attrib_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attrib_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `value_count` int(11) DEFAULT NULL,
  `attrib_namespace_id` int(11) NOT NULL,
  `issue_list` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_attrib_types_on_attrib_namespace_id_and_name` (`attrib_namespace_id`,`name`),
  KEY `index_attrib_types_on_name` (`name`),
  KEY `attrib_namespace_id` (`attrib_namespace_id`),
  CONSTRAINT `attrib_types_ibfk_1` FOREIGN KEY (`attrib_namespace_id`) REFERENCES `attrib_namespaces` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attrib_types`
--

LOCK TABLES `attrib_types` WRITE;
/*!40000 ALTER TABLE `attrib_types` DISABLE KEYS */;
INSERT INTO `attrib_types` VALUES (1,'VeryImportantProject',NULL,NULL,0,1,0),(2,'UpdateProject',NULL,NULL,1,1,0),(3,'RejectRequests',NULL,NULL,NULL,1,0),(4,'ApprovedRequestSource',NULL,NULL,0,1,0),(5,'Maintained',NULL,NULL,0,1,0),(6,'MaintenanceProject',NULL,NULL,0,1,0),(7,'MaintenanceIdTemplate',NULL,NULL,1,1,0),(8,'ScreenShots',NULL,NULL,NULL,1,0),(9,'OwnerRootProject',NULL,NULL,NULL,1,0),(10,'RequestCloned',NULL,NULL,1,1,0),(11,'ProjectStatusPackageFailComment',NULL,NULL,1,1,0),(12,'InitializeDevelPackage',NULL,NULL,0,1,0),(13,'BranchTarget',NULL,NULL,0,1,0),(14,'BranchRepositoriesFromProject',NULL,NULL,1,1,0),(15,'AutoCleanup',NULL,NULL,1,1,0),(16,'Issues',NULL,NULL,0,1,0),(17,'QualityCategory',NULL,NULL,1,1,0);
/*!40000 ALTER TABLE `attrib_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attrib_values`
--

DROP TABLE IF EXISTS `attrib_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attrib_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrib_id` int(11) NOT NULL,
  `value` text CHARACTER SET utf8 NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_attrib_values_on_attrib_id_and_position` (`attrib_id`,`position`),
  KEY `index_attrib_values_on_attrib_id` (`attrib_id`),
  CONSTRAINT `attrib_values_ibfk_1` FOREIGN KEY (`attrib_id`) REFERENCES `attribs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attrib_values`
--

LOCK TABLES `attrib_values` WRITE;
/*!40000 ALTER TABLE `attrib_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `attrib_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribs`
--

DROP TABLE IF EXISTS `attribs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrib_type_id` int(11) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `binary` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribs_index` (`attrib_type_id`,`package_id`,`project_id`,`binary`),
  UNIQUE KEY `attribs_on_proj_and_pack` (`attrib_type_id`,`project_id`,`package_id`,`binary`),
  KEY `index_attribs_on_package_id` (`package_id`),
  KEY `index_attribs_on_project_id` (`project_id`),
  CONSTRAINT `attribs_ibfk_1` FOREIGN KEY (`attrib_type_id`) REFERENCES `attrib_types` (`id`),
  CONSTRAINT `attribs_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`),
  CONSTRAINT `attribs_ibfk_3` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribs`
--

LOCK TABLES `attribs` WRITE;
/*!40000 ALTER TABLE `attribs` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_infos`
--

DROP TABLE IF EXISTS `backend_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_infos`
--

LOCK TABLES `backend_infos` WRITE;
/*!40000 ALTER TABLE `backend_infos` DISABLE KEYS */;
INSERT INTO `backend_infos` VALUES (1,'lastnotification_nr','29','2018-12-31 08:36:45','2019-01-03 13:56:53');
/*!40000 ALTER TABLE `backend_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_packages`
--

DROP TABLE IF EXISTS `backend_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_packages` (
  `package_id` int(11) NOT NULL AUTO_INCREMENT,
  `links_to_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `srcmd5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `changesmd5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verifymd5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expandedmd5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci,
  `maxmtime` datetime DEFAULT NULL,
  PRIMARY KEY (`package_id`),
  KEY `index_backend_packages_on_links_to_id` (`links_to_id`),
  CONSTRAINT `backend_packages_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`),
  CONSTRAINT `backend_packages_ibfk_2` FOREIGN KEY (`links_to_id`) REFERENCES `packages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_packages`
--

LOCK TABLES `backend_packages` WRITE;
/*!40000 ALTER TABLE `backend_packages` DISABLE KEYS */;
INSERT INTO `backend_packages` VALUES (1,NULL,'2019-01-03 13:49:20','2bb66be913b79f5f10f977ab3a69c0b2','181ba4e795315384eabb9bd6f2a07609','2bb66be913b79f5f10f977ab3a69c0b2','2bb66be913b79f5f10f977ab3a69c0b2',NULL,'2019-01-03 13:49:17');
/*!40000 ALTER TABLE `backend_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklist_tags`
--

DROP TABLE IF EXISTS `blacklist_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklist_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist_tags`
--

LOCK TABLES `blacklist_tags` WRITE;
/*!40000 ALTER TABLE `blacklist_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `blacklist_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bs_request_action_accept_infos`
--

DROP TABLE IF EXISTS `bs_request_action_accept_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bs_request_action_accept_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bs_request_action_id` int(11) DEFAULT NULL,
  `rev` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `srcmd5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xsrcmd5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `osrcmd5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oxsrcmd5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bs_request_action_id` (`bs_request_action_id`),
  CONSTRAINT `bs_request_action_accept_infos_ibfk_1` FOREIGN KEY (`bs_request_action_id`) REFERENCES `bs_request_actions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bs_request_action_accept_infos`
--

LOCK TABLES `bs_request_action_accept_infos` WRITE;
/*!40000 ALTER TABLE `bs_request_action_accept_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `bs_request_action_accept_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bs_request_actions`
--

DROP TABLE IF EXISTS `bs_request_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bs_request_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bs_request_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `target_project` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_package` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_releaseproject` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_project` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_package` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_rev` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sourceupdate` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `updatelink` tinyint(1) DEFAULT '0',
  `person_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `target_repository` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bs_request_id` (`bs_request_id`),
  KEY `index_bs_request_actions_on_target_project` (`target_project`),
  KEY `index_bs_request_actions_on_target_package` (`target_package`),
  KEY `index_bs_request_actions_on_source_project` (`source_project`),
  KEY `index_bs_request_actions_on_source_package` (`source_package`),
  KEY `index_bs_request_actions_on_target_project_and_source_project` (`target_project`,`source_project`),
  CONSTRAINT `bs_request_actions_ibfk_1` FOREIGN KEY (`bs_request_id`) REFERENCES `bs_requests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bs_request_actions`
--

LOCK TABLES `bs_request_actions` WRITE;
/*!40000 ALTER TABLE `bs_request_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `bs_request_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bs_request_histories`
--

DROP TABLE IF EXISTS `bs_request_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bs_request_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bs_request_id` int(11) DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_bin,
  `commenter` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `superseded_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bs_request_id` (`bs_request_id`),
  CONSTRAINT `bs_request_histories_ibfk_1` FOREIGN KEY (`bs_request_id`) REFERENCES `bs_requests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bs_request_histories`
--

LOCK TABLES `bs_request_histories` WRITE;
/*!40000 ALTER TABLE `bs_request_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `bs_request_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bs_requests`
--

DROP TABLE IF EXISTS `bs_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bs_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8_bin,
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_bin,
  `commenter` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `superseded_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `accept_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_bs_requests_on_creator` (`creator`),
  KEY `index_bs_requests_on_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bs_requests`
--

LOCK TABLES `bs_requests` WRITE;
/*!40000 ALTER TABLE `bs_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `bs_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_lines`
--

DROP TABLE IF EXISTS `cache_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `package` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `project` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `request` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cache_lines_on_project` (`project`),
  KEY `index_cache_lines_on_project_and_package` (`project`,`package`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_lines`
--

LOCK TABLES `cache_lines` WRITE;
/*!40000 ALTER TABLE `cache_lines` DISABLE KEYS */;
INSERT INTO `cache_lines` VALUES (2,'projects/3-20181231083649000000000/exists_package/hello/allow_remote_packages=false/follow_project_links=false','hello','test',NULL,'2019-01-03 13:48:46');
/*!40000 ALTER TABLE `cache_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_binaries`
--

DROP TABLE IF EXISTS `channel_binaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_binaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `channel_binary_list_id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `repository_id` int(11) DEFAULT NULL,
  `architecture_id` int(11) DEFAULT NULL,
  `package` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `binaryarch` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supportstatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_channel_binaries_on_project_id_and_package` (`project_id`,`package`),
  KEY `channel_binary_list_id` (`channel_binary_list_id`),
  KEY `repository_id` (`repository_id`),
  KEY `architecture_id` (`architecture_id`),
  KEY `index_channel_binaries_on_name_and_channel_binary_list_id` (`name`,`channel_binary_list_id`),
  CONSTRAINT `channel_binaries_ibfk_1` FOREIGN KEY (`channel_binary_list_id`) REFERENCES `channel_binary_lists` (`id`),
  CONSTRAINT `channel_binaries_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `channel_binaries_ibfk_3` FOREIGN KEY (`repository_id`) REFERENCES `repositories` (`id`),
  CONSTRAINT `channel_binaries_ibfk_4` FOREIGN KEY (`architecture_id`) REFERENCES `architectures` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_binaries`
--

LOCK TABLES `channel_binaries` WRITE;
/*!40000 ALTER TABLE `channel_binaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel_binaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_binary_lists`
--

DROP TABLE IF EXISTS `channel_binary_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_binary_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `repository_id` int(11) DEFAULT NULL,
  `architecture_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channel_id` (`channel_id`),
  KEY `project_id` (`project_id`),
  KEY `repository_id` (`repository_id`),
  KEY `architecture_id` (`architecture_id`),
  CONSTRAINT `channel_binary_lists_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  CONSTRAINT `channel_binary_lists_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `channel_binary_lists_ibfk_3` FOREIGN KEY (`repository_id`) REFERENCES `repositories` (`id`),
  CONSTRAINT `channel_binary_lists_ibfk_4` FOREIGN KEY (`architecture_id`) REFERENCES `architectures` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_binary_lists`
--

LOCK TABLES `channel_binary_lists` WRITE;
/*!40000 ALTER TABLE `channel_binary_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel_binary_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_targets`
--

DROP TABLE IF EXISTS `channel_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_targets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `repository_id` int(11) NOT NULL,
  `prefix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_channel_targets_on_channel_id_and_repository_id` (`channel_id`,`repository_id`),
  KEY `repository_id` (`repository_id`),
  CONSTRAINT `channel_targets_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  CONSTRAINT `channel_targets_ibfk_2` FOREIGN KEY (`repository_id`) REFERENCES `repositories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_targets`
--

LOCK TABLES `channel_targets` WRITE;
/*!40000 ALTER TABLE `channel_targets` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `package_id` (`package_id`),
  CONSTRAINT `channels_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `bs_request_id` int(11) DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_project_id` (`project_id`),
  KEY `index_comments_on_package_id` (`package_id`),
  KEY `index_comments_on_bs_request_id` (`bs_request_id`),
  KEY `user_id` (`user_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`),
  CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `comments_ibfk_4` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurations`
--

DROP TABLE IF EXISTS `configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `description` text CHARACTER SET utf8,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT '',
  `registration` enum('allow','confirmation','deny') COLLATE utf8_bin DEFAULT 'allow',
  `anonymous` tinyint(1) DEFAULT '1',
  `default_access_disabled` tinyint(1) DEFAULT '0',
  `allow_user_to_create_home_project` tinyint(1) DEFAULT '1',
  `disallow_group_creation` tinyint(1) DEFAULT '0',
  `change_password` tinyint(1) DEFAULT '1',
  `hide_private_options` tinyint(1) DEFAULT '0',
  `gravatar` tinyint(1) DEFAULT '1',
  `enforce_project_keys` tinyint(1) DEFAULT '0',
  `download_on_demand` tinyint(1) DEFAULT '1',
  `download_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ymp_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `bugzilla_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `http_proxy` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `no_proxy` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `theme` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `obs_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `cleanup_after_days` int(11) DEFAULT NULL,
  `admin_email` varchar(255) COLLATE utf8_bin DEFAULT 'unconfigured@openbuildservice.org',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurations`
--

LOCK TABLES `configurations` WRITE;
/*!40000 ALTER TABLE `configurations` DISABLE KEYS */;
INSERT INTO `configurations` VALUES (1,'Open Build Service','  <p class=\"description\">\n    The <a href=\"http://openbuildservice.org\">Open Build Service (OBS)</a>\n    is an open and complete distribution development platform that provides a transparent infrastructure for development of Linux distributions, used by openSUSE, MeeGo and other distributions.\n    Supporting also Fedora, Debian, Ubuntu, RedHat and other Linux distributions.\n  </p>\n  <p class=\"description\">\n    The OBS is developed under the umbrella of the <a href=\"http://www.opensuse.org\">openSUSE project</a>. Please find further informations on the <a href=\"http://wiki.opensuse.org/openSUSE:Build_Service\">openSUSE Project wiki pages</a>.\n  </p>\n\n  <p class=\"description\">\n    The Open Build Service developer team is greeting you. In case you use your OBS productive in your facility, please do us a favor and add yourself at <a href=\"http://wiki.opensuse.org/openSUSE:Build_Service_installations\">this wiki page</a>. Have fun and fast build times!\n  </p>\n','2018-12-31 08:31:24','2018-12-31 08:37:36','private','allow',1,0,1,0,1,0,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL,'http://10.10.10.2',NULL,'unconfigured@openbuildservice.org');
/*!40000 ALTER TABLE `configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_project_types`
--

DROP TABLE IF EXISTS `db_project_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_project_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_project_types`
--

LOCK TABLES `db_project_types` WRITE;
/*!40000 ALTER TABLE `db_project_types` DISABLE KEYS */;
INSERT INTO `db_project_types` VALUES (1,'standard'),(2,'maintenance'),(3,'maintenance_incident'),(4,'maintenance_release');
/*!40000 ALTER TABLE `db_project_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_projects_tags`
--

DROP TABLE IF EXISTS `db_projects_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_projects_tags` (
  `db_project_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  UNIQUE KEY `projects_tags_all_index` (`db_project_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `db_projects_tags_ibfk_1` FOREIGN KEY (`db_project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `db_projects_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_projects_tags`
--

LOCK TABLES `db_projects_tags` WRITE;
/*!40000 ALTER TABLE `db_projects_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_projects_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delayed_jobs`
--

DROP TABLE IF EXISTS `delayed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delayed_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` int(11) DEFAULT '0',
  `attempts` int(11) DEFAULT '0',
  `handler` text CHARACTER SET utf8,
  `last_error` text CHARACTER SET utf8,
  `run_at` datetime DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `failed_at` datetime DEFAULT NULL,
  `locked_by` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `queue` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delayed_jobs`
--

LOCK TABLES `delayed_jobs` WRITE;
/*!40000 ALTER TABLE `delayed_jobs` DISABLE KEYS */;
INSERT INTO `delayed_jobs` VALUES (2,0,6,'--- !ruby/object:Delayed::PerformableMethod\nobject: !ruby/ActiveRecord:IssueTracker\n  attributes:\n    id: 15\n    name: bnc\n    kind: bugzilla\n    description: Novell Bugzilla\n    url: https://bugzilla.novell.com/\n    show_url: https://bugzilla.novell.com/show_bug.cgi?id=@@@\n    regex: (?:bnc|BNC)\\s*[#:]\\s*(\\d+)\n    user: \n    password: \n    label: bnc#@@@\n    issues_updated: 2018-12-31 08:31:24.000000000 Z\n    enable_fetch: true\nmethod_name: :update_issues\nargs: []\n','SSL_connect returned=1 errno=0 state=error: certificate verify failed\n/usr/lib64/ruby/2.0.0/net/http.rb:918:in `connect\'\n/usr/lib64/ruby/2.0.0/net/http.rb:918:in `block in connect\'\n/usr/lib64/ruby/2.0.0/timeout.rb:66:in `timeout\'\n/usr/lib64/ruby/2.0.0/net/http.rb:918:in `connect\'\n/usr/lib64/ruby/2.0.0/net/http.rb:862:in `do_start\'\n/usr/lib64/ruby/2.0.0/net/http.rb:857:in `start\'\n/usr/lib64/ruby/2.0.0/xmlrpc/client.rb:474:in `do_rpc\'\n/usr/lib64/ruby/2.0.0/xmlrpc/client.rb:281:in `call2\'\n/usr/lib64/ruby/2.0.0/xmlrpc/client.rb:262:in `call\'\n/usr/lib64/ruby/2.0.0/xmlrpc/client.rb:592:in `method_missing\'\n/srv/www/obs/api/app/models/issue_tracker.rb:52:in `update_issues_bugzilla\'\n/srv/www/obs/api/app/models/issue_tracker.rb:101:in `update_issues\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/performable_method.rb:26:in `perform\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/backend/base.rb:105:in `block in invoke_job\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `execute\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/backend/base.rb:102:in `invoke_job\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:206:in `block (2 levels) in run\'\n/usr/lib64/ruby/2.0.0/timeout.rb:66:in `timeout\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:206:in `block in run\'\n/usr/lib64/ruby/2.0.0/benchmark.rb:296:in `realtime\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:205:in `run\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:267:in `block in reserve_and_run_one_job\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `execute\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:267:in `reserve_and_run_one_job\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:189:in `block in work_off\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:188:in `times\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:188:in `work_off\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:153:in `block (4 levels) in start\'\n/usr/lib64/ruby/2.0.0/benchmark.rb:296:in `realtime\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:152:in `block (3 levels) in start\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `execute\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:151:in `block (2 levels) in start\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:150:in `loop\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:150:in `block in start\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/plugins/clear_locks.rb:7:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:78:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:78:in `block (2 levels) in add\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:78:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:78:in `block in add\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `execute\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:149:in `start\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/command.rb:104:in `run\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/command.rb:92:in `block in run_process\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/application.rb:255:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/application.rb:255:in `block in start_proc\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/daemonize.rb:82:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/daemonize.rb:82:in `call_as_daemon\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/application.rb:259:in `start_proc\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/application.rb:296:in `start\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/controller.rb:70:in `run\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons.rb:197:in `block in run_proc\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/cmdline.rb:109:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/cmdline.rb:109:in `catch_exceptions\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons.rb:196:in `run_proc\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/command.rb:90:in `run_process\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/command.rb:83:in `block in daemonize\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/command.rb:81:in `times\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/command.rb:81:in `daemonize\'\nscript/delayed_job.api.rb:7:in `<main>\'','2019-01-03 14:08:32',NULL,NULL,NULL,NULL),(49,0,5,'--- !ruby/object:Delayed::PerformableMethod\nobject: !ruby/ActiveRecord:IssueTracker\n  attributes:\n    id: 15\n    name: bnc\n    kind: bugzilla\n    description: Novell Bugzilla\n    url: https://bugzilla.novell.com/\n    show_url: https://bugzilla.novell.com/show_bug.cgi?id=@@@\n    regex: (?:bnc|BNC)\\s*[#:]\\s*(\\d+)\n    user: \n    password: \n    label: bnc#@@@\n    issues_updated: 2018-12-31 08:31:24.000000000 Z\n    enable_fetch: true\nmethod_name: :update_issues\nargs: []\n','SSL_connect returned=1 errno=0 state=error: certificate verify failed\n/usr/lib64/ruby/2.0.0/net/http.rb:918:in `connect\'\n/usr/lib64/ruby/2.0.0/net/http.rb:918:in `block in connect\'\n/usr/lib64/ruby/2.0.0/timeout.rb:66:in `timeout\'\n/usr/lib64/ruby/2.0.0/net/http.rb:918:in `connect\'\n/usr/lib64/ruby/2.0.0/net/http.rb:862:in `do_start\'\n/usr/lib64/ruby/2.0.0/net/http.rb:857:in `start\'\n/usr/lib64/ruby/2.0.0/xmlrpc/client.rb:474:in `do_rpc\'\n/usr/lib64/ruby/2.0.0/xmlrpc/client.rb:281:in `call2\'\n/usr/lib64/ruby/2.0.0/xmlrpc/client.rb:262:in `call\'\n/usr/lib64/ruby/2.0.0/xmlrpc/client.rb:592:in `method_missing\'\n/srv/www/obs/api/app/models/issue_tracker.rb:52:in `update_issues_bugzilla\'\n/srv/www/obs/api/app/models/issue_tracker.rb:101:in `update_issues\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/performable_method.rb:26:in `perform\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/backend/base.rb:105:in `block in invoke_job\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `execute\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/backend/base.rb:102:in `invoke_job\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:206:in `block (2 levels) in run\'\n/usr/lib64/ruby/2.0.0/timeout.rb:66:in `timeout\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:206:in `block in run\'\n/usr/lib64/ruby/2.0.0/benchmark.rb:296:in `realtime\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:205:in `run\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:267:in `block in reserve_and_run_one_job\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `execute\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:267:in `reserve_and_run_one_job\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:189:in `block in work_off\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:188:in `times\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:188:in `work_off\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:153:in `block (4 levels) in start\'\n/usr/lib64/ruby/2.0.0/benchmark.rb:296:in `realtime\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:152:in `block (3 levels) in start\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `execute\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:151:in `block (2 levels) in start\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:150:in `loop\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:150:in `block in start\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/plugins/clear_locks.rb:7:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:78:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:78:in `block (2 levels) in add\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:78:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:78:in `block in add\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `execute\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:149:in `start\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/command.rb:104:in `run\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/command.rb:92:in `block in run_process\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/application.rb:255:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/application.rb:255:in `block in start_proc\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/daemonize.rb:82:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/daemonize.rb:82:in `call_as_daemon\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/application.rb:259:in `start_proc\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/application.rb:296:in `start\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/controller.rb:70:in `run\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons.rb:197:in `block in run_proc\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/cmdline.rb:109:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/cmdline.rb:109:in `catch_exceptions\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons.rb:196:in `run_proc\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/command.rb:90:in `run_process\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/command.rb:83:in `block in daemonize\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/command.rb:81:in `times\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/command.rb:81:in `daemonize\'\nscript/delayed_job.api.rb:7:in `<main>\'','2019-01-03 14:03:46',NULL,NULL,NULL,NULL),(50,0,3,'--- !ruby/object:Delayed::PerformableMethod\nobject: !ruby/ActiveRecord:IssueTracker\n  attributes:\n    id: 15\n    name: bnc\n    kind: bugzilla\n    description: Novell Bugzilla\n    url: https://bugzilla.novell.com/\n    show_url: https://bugzilla.novell.com/show_bug.cgi?id=@@@\n    regex: (?:bnc|BNC)\\s*[#:]\\s*(\\d+)\n    user: \n    password: \n    label: bnc#@@@\n    issues_updated: 2018-12-31 08:31:24.000000000 Z\n    enable_fetch: true\nmethod_name: :update_issues\nargs: []\n','SSL_connect returned=1 errno=0 state=error: certificate verify failed\n/usr/lib64/ruby/2.0.0/net/http.rb:918:in `connect\'\n/usr/lib64/ruby/2.0.0/net/http.rb:918:in `block in connect\'\n/usr/lib64/ruby/2.0.0/timeout.rb:66:in `timeout\'\n/usr/lib64/ruby/2.0.0/net/http.rb:918:in `connect\'\n/usr/lib64/ruby/2.0.0/net/http.rb:862:in `do_start\'\n/usr/lib64/ruby/2.0.0/net/http.rb:857:in `start\'\n/usr/lib64/ruby/2.0.0/xmlrpc/client.rb:474:in `do_rpc\'\n/usr/lib64/ruby/2.0.0/xmlrpc/client.rb:281:in `call2\'\n/usr/lib64/ruby/2.0.0/xmlrpc/client.rb:262:in `call\'\n/usr/lib64/ruby/2.0.0/xmlrpc/client.rb:592:in `method_missing\'\n/srv/www/obs/api/app/models/issue_tracker.rb:52:in `update_issues_bugzilla\'\n/srv/www/obs/api/app/models/issue_tracker.rb:101:in `update_issues\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/performable_method.rb:26:in `perform\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/backend/base.rb:105:in `block in invoke_job\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `execute\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/backend/base.rb:102:in `invoke_job\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:206:in `block (2 levels) in run\'\n/usr/lib64/ruby/2.0.0/timeout.rb:66:in `timeout\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:206:in `block in run\'\n/usr/lib64/ruby/2.0.0/benchmark.rb:296:in `realtime\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:205:in `run\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:267:in `block in reserve_and_run_one_job\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `execute\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:267:in `reserve_and_run_one_job\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:189:in `block in work_off\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:188:in `times\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:188:in `work_off\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:153:in `block (4 levels) in start\'\n/usr/lib64/ruby/2.0.0/benchmark.rb:296:in `realtime\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:152:in `block (3 levels) in start\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `execute\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:151:in `block (2 levels) in start\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:150:in `loop\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:150:in `block in start\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/plugins/clear_locks.rb:7:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:78:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:78:in `block (2 levels) in add\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:78:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:78:in `block in add\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `execute\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:149:in `start\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/command.rb:104:in `run\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/command.rb:92:in `block in run_process\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/application.rb:255:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/application.rb:255:in `block in start_proc\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/daemonize.rb:82:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/daemonize.rb:82:in `call_as_daemon\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/application.rb:259:in `start_proc\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/application.rb:296:in `start\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/controller.rb:70:in `run\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons.rb:197:in `block in run_proc\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/cmdline.rb:109:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/cmdline.rb:109:in `catch_exceptions\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons.rb:196:in `run_proc\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/command.rb:90:in `run_process\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/command.rb:83:in `block in daemonize\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/command.rb:81:in `times\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/command.rb:81:in `daemonize\'\nscript/delayed_job.api.rb:7:in `<main>\'','2019-01-03 14:01:22',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `delayed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distribution_icons`
--

DROP TABLE IF EXISTS `distribution_icons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distribution_icons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribution_icons`
--

LOCK TABLES `distribution_icons` WRITE;
/*!40000 ALTER TABLE `distribution_icons` DISABLE KEYS */;
/*!40000 ALTER TABLE `distribution_icons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distribution_icons_distributions`
--

DROP TABLE IF EXISTS `distribution_icons_distributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distribution_icons_distributions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `distribution_id` int(11) DEFAULT NULL,
  `distribution_icon_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribution_icons_distributions`
--

LOCK TABLES `distribution_icons_distributions` WRITE;
/*!40000 ALTER TABLE `distribution_icons_distributions` DISABLE KEYS */;
/*!40000 ALTER TABLE `distribution_icons_distributions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distributions`
--

DROP TABLE IF EXISTS `distributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distributions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `project` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reponame` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `repository` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributions`
--

LOCK TABLES `distributions` WRITE;
/*!40000 ALTER TABLE `distributions` DISABLE KEYS */;
/*!40000 ALTER TABLE `distributions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloads`
--

DROP TABLE IF EXISTS `downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseurl` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `metafile` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `mtype` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `architecture_id` int(11) DEFAULT NULL,
  `db_project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_downloads_on_db_project_id` (`db_project_id`),
  KEY `index_downloads_on_architecture_id` (`architecture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloads`
--

LOCK TABLES `downloads` WRITE;
/*!40000 ALTER TABLE `downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_subscriptions`
--

DROP TABLE IF EXISTS `event_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `receiver_role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `receive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_event_subscriptions_on_user_id` (`user_id`),
  KEY `index_event_subscriptions_on_project_id` (`project_id`),
  KEY `index_event_subscriptions_on_package_id` (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_subscriptions`
--

LOCK TABLES `event_subscriptions` WRITE;
/*!40000 ALTER TABLE `event_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci,
  `queued` tinyint(1) NOT NULL DEFAULT '0',
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `project_logged` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_events_on_queued` (`queued`),
  KEY `index_events_on_project_logged` (`project_logged`),
  KEY `index_events_on_eventtype` (`eventtype`),
  KEY `index_events_on_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (6,'Event::RepoPublishState','{\"project\":\"test\",\"repo\":\"openSUSE_42.3\",\"state\":\"publishing\"}',1,1,'2018-12-31 08:38:24','2018-12-31 08:38:29',0),(7,'Event::RepoPublishState','{\"project\":\"test\",\"repo\":\"openSUSE_42.3\",\"state\":\"published\"}',1,1,'2018-12-31 08:38:29','2018-12-31 08:38:29',0),(9,'Event::RepoPublishState','{\"project\":\"test\",\"repo\":\"openSUSE_42.3\",\"state\":\"publishing\"}',1,1,'2018-12-31 08:41:53','2018-12-31 08:42:00',0),(10,'Event::RepoPublished','{\"project\":\"test\",\"repo\":\"openSUSE_42.3\"}',1,1,'2018-12-31 08:42:10','2018-12-31 08:42:30',0),(11,'Event::RepoPublishState','{\"project\":\"test\",\"repo\":\"openSUSE_42.3\",\"state\":\"published\"}',1,1,'2018-12-31 08:42:11','2018-12-31 08:42:30',0),(12,'Event::RepoPublishState','{\"project\":\"test\",\"repo\":\"mer-core-i486\",\"state\":\"published\"}',1,1,'2019-01-03 13:51:58','2019-01-03 13:52:00',0),(14,'Event::RepoPublishState','{\"project\":\"test\",\"repo\":\"mer-core-armv7l\",\"state\":\"publishing\"}',1,1,'2019-01-03 13:53:28','2019-01-03 13:53:30',0),(15,'Event::RepoPublished','{\"project\":\"test\",\"repo\":\"mer-core-armv7l\"}',1,1,'2019-01-03 13:53:31','2019-01-03 13:54:01',0),(16,'Event::RepoPublishState','{\"project\":\"test\",\"repo\":\"mer-core-armv7l\",\"state\":\"published\"}',1,1,'2019-01-03 13:53:31','2019-01-03 13:54:01',0),(18,'Event::RepoPublishState','{\"project\":\"test\",\"repo\":\"obs2.9\",\"state\":\"publishing\"}',1,1,'2019-01-03 13:54:19','2019-01-03 13:54:31',0),(19,'Event::RepoPublished','{\"project\":\"test\",\"repo\":\"obs2.9\"}',1,1,'2019-01-03 13:54:19','2019-01-03 13:54:31',0),(20,'Event::RepoPublishState','{\"project\":\"test\",\"repo\":\"obs2.9\",\"state\":\"published\"}',1,1,'2019-01-03 13:54:19','2019-01-03 13:54:31',0),(22,'Event::RepoPublishState','{\"project\":\"test\",\"repo\":\"mer-core-armv7tnhl\",\"state\":\"publishing\"}',1,1,'2019-01-03 13:55:49','2019-01-03 13:56:01',0),(23,'Event::RepoPublished','{\"project\":\"test\",\"repo\":\"mer-core-armv7tnhl\"}',1,1,'2019-01-03 13:56:02','2019-01-03 13:56:31',0),(24,'Event::RepoPublishState','{\"project\":\"test\",\"repo\":\"mer-core-armv7tnhl\",\"state\":\"published\"}',1,1,'2019-01-03 13:56:02','2019-01-03 13:56:31',0),(26,'Event::RepoPublishState','{\"project\":\"test\",\"repo\":\"mer-core-64\",\"state\":\"publishing\"}',1,1,'2019-01-03 13:56:39','2019-01-03 13:57:01',0),(27,'Event::RepoPublished','{\"project\":\"test\",\"repo\":\"mer-core-64\"}',1,1,'2019-01-03 13:56:53','2019-01-03 13:57:01',0),(28,'Event::RepoPublishState','{\"project\":\"test\",\"repo\":\"mer-core-64\",\"state\":\"published\"}',1,1,'2019-01-03 13:56:53','2019-01-03 13:57:01',0);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flags`
--

DROP TABLE IF EXISTS `flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('enable','disable') CHARACTER SET utf8 NOT NULL,
  `repo` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `architecture_id` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `flag` enum('useforbuild','sourceaccess','binarydownload','debuginfo','build','publish','access','lock') CHARACTER SET utf8 NOT NULL,
  `pkgname` tinyblob,
  PRIMARY KEY (`id`),
  KEY `index_flags_on_flag` (`flag`),
  KEY `architecture_id` (`architecture_id`),
  KEY `index_flags_on_package_id` (`package_id`),
  KEY `index_flags_on_project_id` (`project_id`),
  CONSTRAINT `flags_ibfk_3` FOREIGN KEY (`architecture_id`) REFERENCES `architectures` (`id`),
  CONSTRAINT `flags_ibfk_4` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `flags_ibfk_5` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flags`
--

LOCK TABLES `flags` WRITE;
/*!40000 ALTER TABLE `flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_request_requests`
--

DROP TABLE IF EXISTS `group_request_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_request_requests` (
  `bs_request_action_group_id` int(11) DEFAULT NULL,
  `bs_request_id` int(11) DEFAULT NULL,
  KEY `index_group_request_requests_on_bs_request_id` (`bs_request_id`),
  KEY `index_group_request_requests_on_bs_request_action_group_id` (`bs_request_action_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_request_requests`
--

LOCK TABLES `group_request_requests` WRITE;
/*!40000 ALTER TABLE `group_request_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_request_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `title` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `parent_id` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_parent_id_index` (`parent_id`),
  KEY `index_groups_on_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_roles`
--

DROP TABLE IF EXISTS `groups_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_roles` (
  `group_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  UNIQUE KEY `groups_roles_all_index` (`group_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `groups_roles_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `groups_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_roles`
--

LOCK TABLES `groups_roles` WRITE;
/*!40000 ALTER TABLE `groups_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_users`
--

DROP TABLE IF EXISTS `groups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_users` (
  `group_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `email` tinyint(1) DEFAULT '1',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups_users_all_index` (`group_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `groups_users_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `groups_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_users`
--

LOCK TABLES `groups_users` WRITE;
/*!40000 ALTER TABLE `groups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incident_counter`
--

DROP TABLE IF EXISTS `incident_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incident_counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maintenance_db_project_id` int(11) DEFAULT NULL,
  `counter` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incident_counter`
--

LOCK TABLES `incident_counter` WRITE;
/*!40000 ALTER TABLE `incident_counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `incident_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_trackers`
--

DROP TABLE IF EXISTS `issue_trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_trackers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `kind` enum('other','bugzilla','cve','fate','trac','launchpad','sourceforge') CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 NOT NULL,
  `show_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `regex` varchar(255) CHARACTER SET utf8 NOT NULL,
  `user` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `label` text CHARACTER SET utf8 NOT NULL,
  `issues_updated` datetime NOT NULL,
  `enable_fetch` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_trackers`
--

LOCK TABLES `issue_trackers` WRITE;
/*!40000 ALTER TABLE `issue_trackers` DISABLE KEYS */;
INSERT INTO `issue_trackers` VALUES (1,'boost','trac','Boost Trac','https://svn.boost.org/trac/boost/','https://svn.boost.org/trac/boost/ticket/@@@','boost#(\\d+)',NULL,NULL,'boost#@@@','2018-12-31 08:31:24',0),(2,'bco','bugzilla','Clutter Project Bugzilla','http://bugzilla.clutter-project.org/','http://bugzilla.clutter-project.org/show_bug.cgi?id=@@@','bco#(\\d+)',NULL,NULL,'bco#@@@','2018-12-31 08:31:24',0),(3,'RT','other','CPAN Bugs','https://rt.cpan.org/','http://rt.cpan.org/Public/Bug/Display.html?id=@@@','RT#(\\d+)',NULL,NULL,'RT#@@@','2018-12-31 08:31:24',0),(4,'cve','cve','CVE Numbers','http://cve.mitre.org/','http://cve.mitre.org/cgi-bin/cvename.cgi?name=@@@','(CVE-\\d\\d\\d\\d-\\d+)',NULL,NULL,'@@@','2018-12-31 08:31:24',0),(5,'deb','bugzilla','Debian Bugzilla','http://bugs.debian.org/','http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=@@@','deb#(\\d+)',NULL,NULL,'deb#@@@','2018-12-31 08:31:24',0),(6,'fdo','bugzilla','Freedesktop.org Bugzilla','https://bugs.freedesktop.org/','https://bugs.freedesktop.org/show_bug.cgi?id=@@@','fdo#(\\d+)',NULL,NULL,'fdo#@@@','2018-12-31 08:31:24',0),(7,'GCC','bugzilla','GCC Bugzilla','http://gcc.gnu.org/bugzilla/','http://gcc.gnu.org/bugzilla/show_bug.cgi?id=@@@','GCC#(\\d+)',NULL,NULL,'GCC#@@@','2018-12-31 08:31:24',0),(8,'bgo','bugzilla','Gnome Bugzilla','https://bugzilla.gnome.org/','https://bugzilla.gnome.org/show_bug.cgi?id=@@@','bgo#(\\d+)',NULL,NULL,'bgo#@@@','2018-12-31 08:31:24',0),(9,'bio','bugzilla','Icculus.org Bugzilla','https://bugzilla.icculus.org/','https://bugzilla.icculus.org/show_bug.cgi?id=@@@','bio#(\\d+)',NULL,NULL,'bio#@@@','2018-12-31 08:31:24',0),(10,'bko','bugzilla','Kernel.org Bugzilla','https://bugzilla.kernel.org/','https://bugzilla.kernel.org/show_bug.cgi?id=@@@','(?:Kernel|K|bko)#(\\d+)',NULL,NULL,'bko#@@@','2018-12-31 08:31:24',0),(11,'kde','bugzilla','KDE Bugzilla','https://bugs.kde.org/','https://bugs.kde.org/show_bug.cgi?id=@@@','kde#(\\d+)',NULL,NULL,'kde#@@@','2018-12-31 08:31:24',0),(12,'lp','launchpad','Launchpad.net Bugtracker','https://bugs.launchpad.net/bugs/','https://bugs.launchpad.net/bugs/@@@','b?lp#(\\d+)',NULL,NULL,'lp#@@@','2018-12-31 08:31:24',0),(13,'Meego','bugzilla','Meego Bugs','https://bugs.meego.com/','https://bugs.meego.com/show_bug.cgi?id=@@@','Meego#(\\d+)',NULL,NULL,'Meego#@@@','2018-12-31 08:31:24',0),(14,'bmo','bugzilla','Mozilla Bugzilla','https://bugzilla.mozilla.org/','https://bugzilla.mozilla.org/show_bug.cgi?id=@@@','bmo#(\\d+)',NULL,NULL,'bmo#@@@','2018-12-31 08:31:24',0),(15,'bnc','bugzilla','Novell Bugzilla','https://bugzilla.novell.com/','https://bugzilla.novell.com/show_bug.cgi?id=@@@','(?:bnc|BNC)\\s*[#:]\\s*(\\d+)',NULL,NULL,'bnc#@@@','2018-12-31 08:31:24',1),(16,'ITS','other','OpenLDAP Issue Tracker','http://www.openldap.org/its/','http://www.openldap.org/its/index.cgi/Contrib?id=@@@','ITS#(\\d+)',NULL,NULL,'ITS#@@@','2018-12-31 08:31:24',0),(17,'i','bugzilla','OpenOffice.org Bugzilla','http://openoffice.org/bugzilla/','http://openoffice.org/bugzilla/show_bug.cgi?id=@@@','i#(\\d+)',NULL,NULL,'boost#@@@','2018-12-31 08:31:24',0),(18,'fate','fate','openSUSE Feature Database','https://features.opensuse.org/','https://features.opensuse.org/@@@','(?:fate|Fate|FATE)\\s*#\\s*(\\d+)',NULL,NULL,'fate#@@@','2018-12-31 08:31:24',0),(19,'rh','bugzilla','RedHat Bugzilla','https://bugzilla.redhat.com/','https://bugzilla.redhat.com/show_bug.cgi?id=@@@','rh#(\\d+)',NULL,NULL,'rh#@@@','2018-12-31 08:31:24',0),(20,'bso','bugzilla','Samba Bugzilla','https://bugzilla.samba.org/','https://bugzilla.samba.org/show_bug.cgi?id=@@@','bso#(\\d+)',NULL,NULL,'bso#@@@','2018-12-31 08:31:24',0),(21,'sf','sourceforge','SourceForge.net Tracker','http://sf.net/support/','http://sf.net/support/tracker.php?aid=@@@','sf#(\\d+)',NULL,NULL,'sf#@@@','2018-12-31 08:31:24',0),(22,'Xamarin','bugzilla','Xamarin Bugzilla','http://bugzilla.xamarin.com/index.cgi','http://bugzilla.xamarin.com/show_bug.cgi?id=@@@','Xamarin#(\\d+)',NULL,NULL,'Xamarin#@@@','2018-12-31 08:31:24',0),(23,'bxo','bugzilla','XFCE Bugzilla','https://bugzilla.xfce.org/','https://bugzilla.xfce.org/show_bug.cgi?id=@@@','bxo#(\\d+)',NULL,NULL,'bxo#@@@','2018-12-31 08:31:24',0);
/*!40000 ALTER TABLE `issue_trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `issue_tracker_id` int(11) NOT NULL,
  `summary` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `state` enum('OPEN','CLOSED','UNKNOWN') CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_id` (`owner_id`),
  KEY `issue_tracker_id` (`issue_tracker_id`),
  KEY `index_issues_on_name_and_issue_tracker_id` (`name`,`issue_tracker_id`),
  CONSTRAINT `issues_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`),
  CONSTRAINT `issues_ibfk_2` FOREIGN KEY (`issue_tracker_id`) REFERENCES `issue_trackers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linked_projects`
--

DROP TABLE IF EXISTS `linked_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linked_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_project_id` int(11) NOT NULL,
  `linked_db_project_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `linked_remote_project_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `linked_projects_index` (`db_project_id`,`linked_db_project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linked_projects`
--

LOCK TABLES `linked_projects` WRITE;
/*!40000 ALTER TABLE `linked_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `linked_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_incidents`
--

DROP TABLE IF EXISTS `maintenance_incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_project_id` int(11) DEFAULT NULL,
  `maintenance_db_project_id` int(11) DEFAULT NULL,
  `request` int(11) DEFAULT NULL,
  `updateinfo_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `incident_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_maintenance_incidents_on_db_project_id` (`db_project_id`),
  KEY `index_maintenance_incidents_on_maintenance_db_project_id` (`maintenance_db_project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_incidents`
--

LOCK TABLES `maintenance_incidents` WRITE;
/*!40000 ALTER TABLE `maintenance_incidents` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_incidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_object_id` int(11) DEFAULT NULL,
  `db_object_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `send_mail` tinyint(1) DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `private` tinyint(1) DEFAULT NULL,
  `severity` int(11) DEFAULT NULL,
  `text` text CHARACTER SET utf8,
  PRIMARY KEY (`id`),
  KEY `object` (`db_object_id`),
  KEY `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_issues`
--

DROP TABLE IF EXISTS `package_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  `change` enum('added','deleted','changed','kept') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_package_issues_on_package_id` (`package_id`),
  KEY `index_package_issues_on_package_id_and_issue_id` (`package_id`,`issue_id`),
  KEY `index_package_issues_on_issue_id` (`issue_id`),
  CONSTRAINT `package_issues_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`),
  CONSTRAINT `package_issues_ibfk_2` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_issues`
--

LOCK TABLES `package_issues` WRITE;
/*!40000 ALTER TABLE `package_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `package_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_kinds`
--

DROP TABLE IF EXISTS `package_kinds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package_kinds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) DEFAULT NULL,
  `kind` enum('patchinfo','aggregate','link','channel','product') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_package_kinds_on_package_id` (`package_id`),
  CONSTRAINT `package_kinds_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_kinds`
--

LOCK TABLES `package_kinds` WRITE;
/*!40000 ALTER TABLE `package_kinds` DISABLE KEYS */;
/*!40000 ALTER TABLE `package_kinds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` text COLLATE utf8_bin,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` text CHARACTER SET utf8,
  `created_at` datetime DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime DEFAULT '0000-00-00 00:00:00',
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `update_counter` int(11) DEFAULT '0',
  `activity_index` float DEFAULT '100',
  `bcntsynctag` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `develpackage_id` int(11) DEFAULT NULL,
  `delta` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `packages_all_index` (`project_id`,`name`(255)),
  KEY `devel_package_id_index` (`develpackage_id`),
  KEY `updated_at_index` (`updated_at`),
  KEY `index_packages_on_project_id` (`project_id`),
  CONSTRAINT `packages_ibfk_3` FOREIGN KEY (`develpackage_id`) REFERENCES `packages` (`id`),
  CONSTRAINT `packages_ibfk_4` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (1,3,'hello','A Friendly Greeting Program','The GNU hello program produces a familiar, friendly greeting.  It\nallows nonprogrammers to use a classic computer science tool that would\notherwise be unavailable to them.  Because it is protected by the GNU\nGeneral Public License, users are free to share and change it.\n\nGNU hello supports many native languages.','2018-12-31 08:36:53','2019-01-03 13:49:17',NULL,1,29.5133,NULL,NULL,1);
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `path_elements`
--

DROP TABLE IF EXISTS `path_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `path_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `repository_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `parent_repository_index` (`parent_id`,`repository_id`),
  UNIQUE KEY `parent_repo_pos_index` (`parent_id`,`position`),
  KEY `repository_id` (`repository_id`),
  CONSTRAINT `path_elements_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `repositories` (`id`),
  CONSTRAINT `path_elements_ibfk_2` FOREIGN KEY (`repository_id`) REFERENCES `repositories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `path_elements`
--

LOCK TABLES `path_elements` WRITE;
/*!40000 ALTER TABLE `path_elements` DISABLE KEYS */;
INSERT INTO `path_elements` VALUES (2,2,3,1),(3,4,9,1),(4,5,10,1),(5,6,11,1),(6,7,12,1),(7,8,13,1);
/*!40000 ALTER TABLE `path_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_channels`
--

DROP TABLE IF EXISTS `product_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_product_channels_on_channel_id_and_product_id` (`channel_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_channels_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  CONSTRAINT `product_channels_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_channels`
--

LOCK TABLES `product_channels` WRITE;
/*!40000 ALTER TABLE `product_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_update_repositories`
--

DROP TABLE IF EXISTS `product_update_repositories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_update_repositories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `repository_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `repository_id` (`repository_id`),
  CONSTRAINT `product_update_repositories_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_update_repositories_ibfk_2` FOREIGN KEY (`repository_id`) REFERENCES `repositories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_update_repositories`
--

LOCK TABLES `product_update_repositories` WRITE;
/*!40000 ALTER TABLE `product_update_repositories` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_update_repositories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `package_id` int(11) NOT NULL,
  `cpe` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_products_on_name_and_package_id` (`name`,`package_id`),
  KEY `package_id` (`package_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_log_entries`
--

DROP TABLE IF EXISTS `project_log_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_log_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `package_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bs_request_id` int(11) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `event_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `additional_info` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `index_project_log_entries_on_user_name` (`user_name`),
  KEY `index_project_log_entries_on_package_name` (`package_name`),
  KEY `index_project_log_entries_on_bs_request_id` (`bs_request_id`),
  KEY `index_project_log_entries_on_event_type` (`event_type`),
  KEY `index_project_log_entries_on_datetime` (`datetime`),
  CONSTRAINT `project_log_entries_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_log_entries`
--

LOCK TABLES `project_log_entries` WRITE;
/*!40000 ALTER TABLE `project_log_entries` DISABLE KEYS */;
INSERT INTO `project_log_entries` VALUES (1,3,'Admin','hello',NULL,'2018-12-31 08:37:03','create_package','--- {}\n'),(2,3,'Admin','hello',NULL,'2018-12-31 08:37:03','commit','---\ncomment: osc copypac from project:openSUSE:Leap:42.3 package:hello revision:5, using\n  expand, using client side copy\nfiles: |+\n  Added:\n    hello-1.3.dif\n    hello-2.9.tar.gz\n    hello-2.9.tar.gz.sig\n    hello.changes\n    hello.keyring\n    hello.spec\n\nrev: \'1\'\n'),(3,3,'Admin','hello',NULL,'2018-12-31 08:37:03','version_change','---\ncomment: osc copypac from project:openSUSE:Leap:42.3 package:hello revision:5, using\n  expand, using client side copy\nfiles: |+\n  Added:\n    hello-1.3.dif\n    hello-2.9.tar.gz\n    hello-2.9.tar.gz.sig\n    hello.changes\n    hello.keyring\n    hello.spec\n\nrev: \'1\'\nnewversion: \'2.9\'\noldversion: unknown\n'),(4,3,NULL,'hello',NULL,'2018-12-31 08:41:51','build_success','---\nrepository: openSUSE_42.3\narch: x86_64\nrelease: \'1.1\'\nreadytime: \'1546245507\'\nsrcmd5: b2e1b1ad23b8aca3179c5c0ec29bea4d\nrev: \'1\'\nreason: new build\nbcnt: \'1\'\nverifymd5: b2e1b1ad23b8aca3179c5c0ec29bea4d\nstarttime: \'1546245518\'\nendtime: \'1546245711\'\nworkerid: ci:1\nversrel: 2.9-1\n'),(5,2,'Admin',NULL,NULL,'2018-12-31 08:36:45','create_project','--- {}\n'),(6,3,'Admin',NULL,NULL,'2018-12-31 08:36:49','create_project','--- {}\n'),(7,3,NULL,'hello',NULL,'2019-01-03 13:53:28','build_success','---\nrepository: mer-core-armv7l\narch: armv7el\nrelease: 2.1.Mer\nreadytime: \'1546523464\'\nsrcmd5: 2bb66be913b79f5f10f977ab3a69c0b2\nrev: \'2\'\nreason: new build\nbcnt: \'1\'\nverifymd5: 2bb66be913b79f5f10f977ab3a69c0b2\nstarttime: \'1546523516\'\nendtime: \'1546523607\'\nworkerid: ci:1\nversrel: 2.9-2\n'),(8,3,NULL,'hello',NULL,'2019-01-03 13:54:08','build_success','---\nrepository: obs2.9\narch: x86_64\nrelease: \'2.1\'\nreadytime: \'1546523479\'\nsrcmd5: 2bb66be913b79f5f10f977ab3a69c0b2\nrev: \'2\'\nreason: new build\nbcnt: \'1\'\nverifymd5: 2bb66be913b79f5f10f977ab3a69c0b2\nstarttime: \'1546523607\'\nendtime: \'1546523648\'\nworkerid: ci:1\nversrel: 2.9-2\n'),(9,3,NULL,'hello',NULL,'2019-01-03 13:55:49','build_success','---\nrepository: mer-core-armv7tnhl\narch: armv8el\nrelease: 1.2.1\nreadytime: \'1546523462\'\nsrcmd5: 2bb66be913b79f5f10f977ab3a69c0b2\nrev: \'2\'\nreason: new build\nbcnt: \'1\'\nverifymd5: 2bb66be913b79f5f10f977ab3a69c0b2\nstarttime: \'1546523649\'\nendtime: \'1546523749\'\nworkerid: ci:1\nversrel: 2.9-2\n'),(10,3,NULL,'hello',NULL,'2019-01-03 13:56:39','build_success','---\nrepository: mer-core-64\narch: x86_64\nrelease: 1.2.1\nreadytime: \'1546523462\'\nsrcmd5: 2bb66be913b79f5f10f977ab3a69c0b2\nrev: \'2\'\nreason: new build\nbcnt: \'1\'\nverifymd5: 2bb66be913b79f5f10f977ab3a69c0b2\nstarttime: \'1546523749\'\nendtime: \'1546523798\'\nworkerid: ci:1\nversrel: 2.9-2\n');
/*!40000 ALTER TABLE `project_log_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_bin,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` text CHARACTER SET utf8,
  `created_at` datetime DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime DEFAULT '0000-00-00 00:00:00',
  `remoteurl` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `remoteproject` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `maintenance_project_id` int(11) DEFAULT NULL,
  `develproject_id` int(11) DEFAULT NULL,
  `delta` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `projects_name_index` (`name`(255)),
  KEY `updated_at_index` (`updated_at`),
  KEY `devel_project_id_index` (`develproject_id`),
  KEY `index_db_projects_on_maintenance_project_id` (`maintenance_project_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `db_project_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'deleted',NULL,NULL,'2018-12-31 08:31:24','2018-12-31 08:31:24',NULL,NULL,1,NULL,NULL,1),(2,'openSUSE.org','build.openSUSE.org','This project allows access to all resources on build.opensuse.org OBS instance. This is needed to build against other distributions.','2018-12-31 08:36:44','2018-12-31 08:36:44','https://build.opensuse.org/public',NULL,1,NULL,NULL,1),(3,'test','','','2018-12-31 08:36:49','2019-01-03 13:50:57',NULL,NULL,1,NULL,NULL,1),(4,'mer','build.merproject.org','','2019-01-03 13:47:48','2019-01-03 13:47:48','https://build.merproject.org/public',NULL,1,NULL,NULL,1);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) DEFAULT NULL,
  `db_object_id` int(11) DEFAULT NULL,
  `db_object_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object` (`db_object_id`),
  KEY `user` (`user_id`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationships`
--

DROP TABLE IF EXISTS `relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_relationships_on_project_id_and_role_id_and_group_id` (`project_id`,`role_id`,`group_id`),
  UNIQUE KEY `index_relationships_on_project_id_and_role_id_and_user_id` (`project_id`,`role_id`,`user_id`),
  UNIQUE KEY `index_relationships_on_package_id_and_role_id_and_group_id` (`package_id`,`role_id`,`group_id`),
  UNIQUE KEY `index_relationships_on_package_id_and_role_id_and_user_id` (`package_id`,`role_id`,`user_id`),
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `relationships_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `relationships_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `relationships_ibfk_3` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `relationships_ibfk_4` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `relationships_ibfk_5` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationships`
--

LOCK TABLES `relationships` WRITE;
/*!40000 ALTER TABLE `relationships` DISABLE KEYS */;
INSERT INTO `relationships` VALUES (1,NULL,2,2,1,NULL),(2,NULL,3,2,1,NULL),(3,NULL,4,2,1,NULL);
/*!40000 ALTER TABLE `relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `release_targets`
--

DROP TABLE IF EXISTS `release_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `release_targets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repository_id` int(11) NOT NULL,
  `target_repository_id` int(11) NOT NULL,
  `trigger` enum('manual','allsucceeded','maintenance') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `repository_id_index` (`repository_id`),
  KEY `index_release_targets_on_target_repository_id` (`target_repository_id`),
  CONSTRAINT `release_targets_ibfk_1` FOREIGN KEY (`repository_id`) REFERENCES `repositories` (`id`),
  CONSTRAINT `release_targets_ibfk_2` FOREIGN KEY (`target_repository_id`) REFERENCES `repositories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `release_targets`
--

LOCK TABLES `release_targets` WRITE;
/*!40000 ALTER TABLE `release_targets` DISABLE KEYS */;
/*!40000 ALTER TABLE `release_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repositories`
--

DROP TABLE IF EXISTS `repositories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repositories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_project_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `remote_project_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `rebuild` enum('transitive','direct','local') CHARACTER SET utf8 DEFAULT NULL,
  `block` enum('all','local','never') CHARACTER SET utf8 DEFAULT NULL,
  `linkedbuild` enum('off','localdep','all') CHARACTER SET utf8 DEFAULT NULL,
  `hostsystem_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projects_name_index` (`db_project_id`,`name`,`remote_project_name`),
  KEY `remote_project_name_index` (`remote_project_name`),
  KEY `hostsystem_id` (`hostsystem_id`),
  CONSTRAINT `repositories_ibfk_1` FOREIGN KEY (`db_project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `repositories_ibfk_2` FOREIGN KEY (`hostsystem_id`) REFERENCES `repositories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repositories`
--

LOCK TABLES `repositories` WRITE;
/*!40000 ALTER TABLE `repositories` DISABLE KEYS */;
INSERT INTO `repositories` VALUES (1,1,'deleted',NULL,NULL,NULL,NULL,NULL),(2,3,'openSUSE_42.3',NULL,NULL,NULL,NULL,NULL),(3,2,'standard','openSUSE:Leap:42.3',NULL,NULL,NULL,NULL),(4,3,'obs2.9',NULL,NULL,NULL,NULL,NULL),(5,3,'mer-core-i486',NULL,NULL,NULL,NULL,NULL),(6,3,'mer-core-armv7tnhl',NULL,NULL,NULL,NULL,NULL),(7,3,'mer-core-armv7l',NULL,NULL,NULL,NULL,NULL),(8,3,'mer-core-64',NULL,NULL,NULL,NULL,NULL),(9,4,'openSUSE_42.3','obs:server:2.9',NULL,NULL,NULL,NULL),(10,4,'Core_i486','mer-core:i486:release',NULL,NULL,NULL,NULL),(11,4,'Core_armv7tnhl','mer-core:armv7tnhl:release',NULL,NULL,NULL,NULL),(12,4,'Core_armv7l','mer-core:armv7l:release',NULL,NULL,NULL,NULL),(13,4,'Core_x86_64','mer-core:x86_64:release',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `repositories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_architectures`
--

DROP TABLE IF EXISTS `repository_architectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_architectures` (
  `repository_id` int(11) NOT NULL,
  `architecture_id` int(11) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `arch_repo_index` (`repository_id`,`architecture_id`),
  KEY `architecture_id` (`architecture_id`),
  CONSTRAINT `repository_architectures_ibfk_1` FOREIGN KEY (`repository_id`) REFERENCES `repositories` (`id`),
  CONSTRAINT `repository_architectures_ibfk_2` FOREIGN KEY (`architecture_id`) REFERENCES `architectures` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_architectures`
--

LOCK TABLES `repository_architectures` WRITE;
/*!40000 ALTER TABLE `repository_architectures` DISABLE KEYS */;
INSERT INTO `repository_architectures` VALUES (2,32,1,2),(4,32,1,3),(5,12,1,4),(6,10,1,5),(7,8,1,6),(8,32,1,7);
/*!40000 ALTER TABLE `repository_architectures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bs_request_id` int(11) DEFAULT NULL,
  `creator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reviewer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reason` text COLLATE utf8_unicode_ci,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `by_group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `by_project` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `by_package` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reviews_on_creator` (`creator`),
  KEY `index_reviews_on_reviewer` (`reviewer`),
  KEY `index_reviews_on_state` (`state`),
  KEY `index_reviews_on_by_user` (`by_user`),
  KEY `index_reviews_on_by_group` (`by_group`),
  KEY `index_reviews_on_by_project` (`by_project`),
  KEY `index_reviews_on_by_package_and_by_project` (`by_package`,`by_project`),
  KEY `bs_request_id` (`bs_request_id`),
  KEY `index_reviews_on_state_and_by_project` (`state`,`by_project`),
  KEY `index_reviews_on_state_and_by_user` (`state`,`by_user`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`bs_request_id`) REFERENCES `bs_requests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `parent_id` int(11) DEFAULT NULL,
  `global` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `roles_parent_id_index` (`parent_id`),
  CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin',NULL,1),(2,'maintainer',NULL,0),(3,'bugowner',NULL,0),(4,'reviewer',NULL,0),(5,'downloader',NULL,0),(6,'reader',NULL,0);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_static_permissions`
--

DROP TABLE IF EXISTS `roles_static_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_static_permissions` (
  `role_id` int(11) NOT NULL DEFAULT '0',
  `static_permission_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `roles_static_permissions_all_index` (`static_permission_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `roles_static_permissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `roles_static_permissions_ibfk_2` FOREIGN KEY (`static_permission_id`) REFERENCES `static_permissions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_static_permissions`
--

LOCK TABLES `roles_static_permissions` WRITE;
/*!40000 ALTER TABLE `roles_static_permissions` DISABLE KEYS */;
INSERT INTO `roles_static_permissions` VALUES (1,1),(1,2),(1,3),(5,3),(1,4),(6,4),(1,5),(6,5),(1,6),(1,7),(1,8),(1,9),(1,10),(2,10),(1,11),(2,11),(1,12),(2,12),(1,13),(2,13);
/*!40000 ALTER TABLE `roles_static_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  UNIQUE KEY `roles_users_all_index` (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `roles_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `roles_users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES (1,1,'2018-12-31 08:31:22');
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('1'),('10'),('11'),('12'),('13'),('14'),('15'),('16'),('17'),('18'),('19'),('2'),('20'),('20090701125033'),('20090703100900'),('20090716174522'),('20090717114240'),('20091017210000'),('20091022210000'),('20091022310000'),('20091029100000'),('20091030060000'),('20091102060000'),('20091111191005'),('20091115101346'),('20091117144409'),('20091117152223'),('20091118000000'),('20091119000000'),('20091119090108'),('20091119090620'),('20091124194151'),('20091206194902'),('20091209193452'),('20091209211754'),('20091226112028'),('20091229115736'),('20100102150000'),('20100104170000'),('20100109145739'),('20100125100000'),('20100202132416'),('20100302100000'),('20100304100000'),('20100315100000'),('20100316100000'),('20100316100001'),('20100327100000'),('20100329191407'),('20100423144748'),('20100426144748'),('20100428144748'),('20100429144748'),('20100506115929'),('20100507115929'),('20100530180617'),('20100609100000'),('20100609200000'),('20100614121047'),('20100629095208'),('20100702082339'),('20100705124948'),('20100705133839'),('20100705141045'),('20100707061034'),('20100805100000'),('20100812100000'),('20100827100000'),('20100903100000'),('20100927110821'),('20100927132716'),('20100927133955'),('20100928081344'),('20101110100000'),('20110117000000'),('20110131100000'),('20110202100000'),('20110202110000'),('20110302100000'),('20110303100000'),('20110309100000'),('20110318112742'),('20110321000000'),('20110322000000'),('20110323000000'),('2011033000000'),('20110331001200'),('20110404085232'),('20110404085325'),('20110404090700'),('20110405151201'),('20110502100000'),('20110519000000'),('20110527000000'),('20110615083665'),('20110615083666'),('20110627001200'),('20110703001200'),('20110711001200'),('20110719142500'),('20110725105426'),('20110728072502'),('20111005000000'),('20111116100002'),('20111117162400'),('20111122000000'),('20111123000000'),('20111206000000'),('20111206151500'),('20111207000000'),('20111213000000'),('20111215094300'),('20111303000000'),('20120110094300'),('20120110104300'),('20120111094300'),('20120112094300'),('20120112194300'),('20120119194300'),('20120119204300'),('20120119204301'),('20120120104301'),('20120120114301'),('20120124114301'),('20120124114302'),('20120124114303'),('20120216114303'),('20120217114303'),('20120217114304'),('20120220114304'),('20120222105426'),('20120223105426'),('20120304205014'),('20120312204300'),('20120313113554'),('20120313131909'),('20120319104301'),('20120319133739'),('20120320134850'),('20120407173644'),('20120411112931'),('20120411121152'),('20120417115800'),('20120418121859'),('20120529150500'),('20120722192000'),('20120903122955'),('20120904122955'),('20120907114304'),('20121014124846'),('20121015121807'),('20121112104534'),('20121112110642'),('20121114093616'),('20121120110642'),('20121120124300'),('20121121142111'),('20121124032111'),('20121130103300'),('20121130143300'),('20121213140751'),('20121213144129'),('20121216151549'),('20121220151549'),('20130111085930'),('20130220160000'),('20130301100000'),('20130409123324'),('20130410124738'),('20130414061002'),('20130603100244'),('20130610100244'),('20130612151549'),('20130618083665'),('20130621083665'),('20130626160000'),('20130627193722'),('20130702083665'),('20130702203665'),('20130723055536'),('20130725123636'),('20130726144516'),('20130802183104'),('20130802183717'),('20130802190951'),('20130805073101'),('20130807071147'),('20130814071147'),('20130816183104'),('20130817082602'),('20130819114303'),('20130820151442'),('20130830043205'),('20130903114302'),('20130904071147'),('20130910162318'),('20130917124132'),('20130920090004'),('20130930130128'),('20131005225515'),('20131006000000'),('20131006162847'),('20131020151037'),('20131020165316'),('20131021063641'),('20131022114302'),('20131023063641'),('20131027122410'),('20131028085325'),('20131029112259'),('20131105112259'),('20131106112233'),('20131111090310'),('20131111193512'),('20131111194720'),('20131112140033'),('20131119195511'),('20131120193512'),('20131123113417'),('20131124071042'),('20131125071042'),('20131125101042'),('20131126074753'),('20131126205430'),('20131127091624'),('20131209095749'),('20131209103450'),('20131210182719'),('20131218071042'),('20140113110551'),('20140123063641'),('20140123071042'),('20140124071042'),('20140516182719'),('20141302101042'),('21'),('22'),('23'),('24'),('25'),('26'),('27'),('28'),('29'),('3'),('30'),('31'),('32'),('33'),('34'),('35'),('36'),('37'),('38'),('39'),('4'),('40'),('41'),('42'),('43'),('44'),('45'),('46'),('47'),('48'),('5'),('6'),('7'),('8'),('9');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_permissions`
--

DROP TABLE IF EXISTS `static_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `static_permissions_title_index` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_permissions`
--

LOCK TABLES `static_permissions` WRITE;
/*!40000 ALTER TABLE `static_permissions` DISABLE KEYS */;
INSERT INTO `static_permissions` VALUES (5,'access'),(12,'change_package'),(10,'change_project'),(13,'create_package'),(11,'create_project'),(3,'download_binaries'),(8,'global_change_package'),(6,'global_change_project'),(9,'global_create_package'),(7,'global_create_project'),(2,'set_download_counters'),(4,'source_access'),(1,'status_message_create');
/*!40000 ALTER TABLE `static_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_histories`
--

DROP TABLE IF EXISTS `status_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `value` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_status_histories_on_time_and_key` (`time`,`key`),
  KEY `index_status_histories_on_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=1018 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_histories`
--

LOCK TABLES `status_histories` WRITE;
/*!40000 ALTER TABLE `status_histories` DISABLE KEYS */;
INSERT INTO `status_histories` VALUES (382,1546523215,'waiting_armv7el',0),(383,1546523215,'waiting_armv8el',0),(384,1546523215,'waiting_i586',0),(385,1546523215,'waiting_x86_64',0),(386,1546523215,'squeue_high_armv7el',0),(387,1546523215,'squeue_next_armv7el',0),(388,1546523215,'squeue_med_armv7el',0),(389,1546523215,'squeue_low_armv7el',0),(390,1546523215,'squeue_high_armv8el',0),(391,1546523215,'squeue_next_armv8el',0),(392,1546523215,'squeue_med_armv8el',0),(393,1546523215,'squeue_low_armv8el',0),(394,1546523215,'squeue_high_i586',0),(395,1546523215,'squeue_next_i586',0),(396,1546523215,'squeue_med_i586',0),(397,1546523215,'squeue_low_i586',0),(398,1546523215,'squeue_high_x86_64',0),(399,1546523215,'squeue_next_x86_64',0),(400,1546523215,'squeue_med_x86_64',0),(401,1546523215,'squeue_low_x86_64',0),(402,1546245000,'blocked_x86_64',0),(403,1546245000,'building_x86_64',0.285714),(404,1546245000,'idle_x86_64',0.714286),(405,1546245000,'squeue_high_armv7l',0),(406,1546245000,'squeue_high_i586',0),(407,1546245000,'squeue_high_x86_64',0),(408,1546245000,'squeue_low_armv7l',0),(409,1546245000,'squeue_low_i586',0),(410,1546245000,'squeue_low_x86_64',0.409091),(411,1546245000,'squeue_med_armv7l',0),(412,1546245000,'squeue_med_i586',0),(413,1546245000,'squeue_med_x86_64',0),(414,1546245000,'squeue_next_armv7l',0),(415,1546245000,'squeue_next_i586',0),(416,1546245000,'squeue_next_x86_64',0),(417,1546245000,'waiting_armv7l',0),(418,1546245000,'waiting_i586',0),(419,1546245000,'waiting_x86_64',0),(420,1546523246,'blocked_x86_64',0),(421,1546523246,'waiting_armv7el',0),(422,1546523246,'waiting_armv8el',0),(423,1546523246,'waiting_i586',0),(424,1546523246,'waiting_x86_64',0),(425,1546523246,'squeue_high_armv7el',0),(426,1546523246,'squeue_next_armv7el',0),(427,1546523246,'squeue_med_armv7el',0),(428,1546523246,'squeue_low_armv7el',0),(429,1546523246,'squeue_high_armv8el',0),(430,1546523246,'squeue_next_armv8el',0),(431,1546523246,'squeue_med_armv8el',0),(432,1546523246,'squeue_low_armv8el',0),(433,1546523246,'squeue_high_i586',0),(434,1546523246,'squeue_next_i586',0),(435,1546523246,'squeue_med_i586',0),(436,1546523246,'squeue_low_i586',0),(437,1546523246,'squeue_high_x86_64',0),(438,1546523246,'squeue_next_x86_64',0),(439,1546523246,'squeue_med_x86_64',0),(440,1546523246,'squeue_low_x86_64',0),(441,1546523246,'building_x86_64',0),(442,1546523246,'idle_x86_64',1),(443,1546523276,'blocked_x86_64',0),(444,1546523276,'waiting_armv7el',0),(445,1546523276,'waiting_armv8el',0),(446,1546523276,'waiting_i586',0),(447,1546523276,'waiting_x86_64',0),(448,1546523276,'squeue_high_armv7el',0),(449,1546523276,'squeue_next_armv7el',0),(450,1546523276,'squeue_med_armv7el',0),(451,1546523276,'squeue_low_armv7el',0),(452,1546523276,'squeue_high_armv8el',0),(453,1546523276,'squeue_next_armv8el',0),(454,1546523276,'squeue_med_armv8el',0),(455,1546523276,'squeue_low_armv8el',0),(456,1546523276,'squeue_high_i586',0),(457,1546523276,'squeue_next_i586',0),(458,1546523276,'squeue_med_i586',0),(459,1546523276,'squeue_low_i586',0),(460,1546523276,'squeue_high_x86_64',0),(461,1546523276,'squeue_next_x86_64',0),(462,1546523276,'squeue_med_x86_64',0),(463,1546523276,'squeue_low_x86_64',0),(464,1546523276,'building_x86_64',0),(465,1546523276,'idle_x86_64',1),(466,1546523306,'blocked_x86_64',0),(467,1546523306,'waiting_armv7el',0),(468,1546523306,'waiting_armv8el',0),(469,1546523306,'waiting_i586',0),(470,1546523306,'waiting_x86_64',0),(471,1546523306,'squeue_high_armv7el',0),(472,1546523306,'squeue_next_armv7el',0),(473,1546523306,'squeue_med_armv7el',0),(474,1546523306,'squeue_low_armv7el',0),(475,1546523306,'squeue_high_armv8el',0),(476,1546523306,'squeue_next_armv8el',0),(477,1546523306,'squeue_med_armv8el',0),(478,1546523306,'squeue_low_armv8el',0),(479,1546523306,'squeue_high_i586',0),(480,1546523306,'squeue_next_i586',0),(481,1546523306,'squeue_med_i586',0),(482,1546523306,'squeue_low_i586',0),(483,1546523306,'squeue_high_x86_64',0),(484,1546523306,'squeue_next_x86_64',0),(485,1546523306,'squeue_med_x86_64',0),(486,1546523306,'squeue_low_x86_64',0),(487,1546523306,'building_x86_64',0),(488,1546523306,'idle_x86_64',1),(489,1546523336,'blocked_x86_64',0),(490,1546523336,'waiting_armv7el',0),(491,1546523336,'waiting_armv8el',0),(492,1546523336,'waiting_i586',0),(493,1546523336,'waiting_x86_64',0),(494,1546523336,'squeue_high_armv7el',0),(495,1546523336,'squeue_next_armv7el',0),(496,1546523336,'squeue_med_armv7el',0),(497,1546523336,'squeue_low_armv7el',0),(498,1546523336,'squeue_high_armv8el',0),(499,1546523336,'squeue_next_armv8el',0),(500,1546523336,'squeue_med_armv8el',0),(501,1546523336,'squeue_low_armv8el',0),(502,1546523336,'squeue_high_i586',0),(503,1546523336,'squeue_next_i586',0),(504,1546523336,'squeue_med_i586',0),(505,1546523336,'squeue_low_i586',0),(506,1546523336,'squeue_high_x86_64',0),(507,1546523336,'squeue_next_x86_64',0),(508,1546523336,'squeue_med_x86_64',0),(509,1546523336,'squeue_low_x86_64',1),(510,1546523336,'building_x86_64',0),(511,1546523336,'idle_x86_64',1),(512,1546523366,'blocked_x86_64',0),(513,1546523366,'waiting_armv7el',0),(514,1546523366,'waiting_armv8el',0),(515,1546523366,'waiting_i586',0),(516,1546523366,'waiting_x86_64',1),(517,1546523366,'squeue_high_armv7el',0),(518,1546523366,'squeue_next_armv7el',0),(519,1546523366,'squeue_med_armv7el',0),(520,1546523366,'squeue_low_armv7el',0),(521,1546523366,'squeue_high_armv8el',0),(522,1546523366,'squeue_next_armv8el',0),(523,1546523366,'squeue_med_armv8el',0),(524,1546523366,'squeue_low_armv8el',0),(525,1546523366,'squeue_high_i586',0),(526,1546523366,'squeue_next_i586',0),(527,1546523366,'squeue_med_i586',0),(528,1546523366,'squeue_low_i586',0),(529,1546523366,'squeue_high_x86_64',0),(530,1546523366,'squeue_next_x86_64',0),(531,1546523366,'squeue_med_x86_64',0),(532,1546523366,'squeue_low_x86_64',1),(533,1546523396,'blocked_x86_64',0),(534,1546523396,'waiting_armv7el',0),(535,1546523396,'waiting_armv8el',0),(536,1546523396,'waiting_i586',0),(537,1546523396,'waiting_x86_64',0),(538,1546523396,'squeue_high_armv7el',0),(539,1546523396,'squeue_next_armv7el',0),(540,1546523396,'squeue_med_armv7el',0),(541,1546523396,'squeue_low_armv7el',0),(542,1546523396,'squeue_high_armv8el',0),(543,1546523396,'squeue_next_armv8el',0),(544,1546523396,'squeue_med_armv8el',0),(545,1546523396,'squeue_low_armv8el',0),(546,1546523396,'squeue_high_i586',0),(547,1546523396,'squeue_next_i586',0),(548,1546523396,'squeue_med_i586',0),(549,1546523396,'squeue_low_i586',0),(550,1546523396,'squeue_high_x86_64',0),(551,1546523396,'squeue_next_x86_64',0),(552,1546523396,'squeue_med_x86_64',0),(553,1546523396,'squeue_low_x86_64',1),(554,1546523396,'building_x86_64',1),(555,1546523396,'idle_x86_64',0),(556,1546523427,'blocked_x86_64',0),(557,1546523427,'waiting_armv7el',0),(558,1546523427,'waiting_armv8el',0),(559,1546523427,'waiting_i586',0),(560,1546523427,'waiting_x86_64',0),(561,1546523427,'squeue_high_armv7el',0),(562,1546523427,'squeue_next_armv7el',0),(563,1546523427,'squeue_med_armv7el',0),(564,1546523427,'squeue_low_armv7el',0),(565,1546523427,'squeue_high_armv8el',0),(566,1546523427,'squeue_next_armv8el',0),(567,1546523427,'squeue_med_armv8el',0),(568,1546523427,'squeue_low_armv8el',0),(569,1546523427,'squeue_high_i586',0),(570,1546523427,'squeue_next_i586',0),(571,1546523427,'squeue_med_i586',0),(572,1546523427,'squeue_low_i586',0),(573,1546523427,'squeue_high_x86_64',0),(574,1546523427,'squeue_next_x86_64',0),(575,1546523427,'squeue_med_x86_64',0),(576,1546523427,'squeue_low_x86_64',1),(577,1546523427,'building_x86_64',0),(578,1546523427,'idle_x86_64',1),(579,1546523457,'blocked_x86_64',0),(580,1546523457,'waiting_armv7el',0),(581,1546523457,'waiting_armv8el',0),(582,1546523457,'waiting_i586',0),(583,1546523457,'waiting_x86_64',0),(584,1546523457,'squeue_high_armv7el',0),(585,1546523457,'squeue_next_armv7el',0),(586,1546523457,'squeue_med_armv7el',0),(587,1546523457,'squeue_low_armv7el',0),(588,1546523457,'squeue_high_armv8el',0),(589,1546523457,'squeue_next_armv8el',0),(590,1546523457,'squeue_med_armv8el',0),(591,1546523457,'squeue_low_armv8el',0),(592,1546523457,'squeue_high_i586',0),(593,1546523457,'squeue_next_i586',0),(594,1546523457,'squeue_med_i586',0),(595,1546523457,'squeue_low_i586',0),(596,1546523457,'squeue_high_x86_64',0),(597,1546523457,'squeue_next_x86_64',0),(598,1546523457,'squeue_med_x86_64',0),(599,1546523457,'squeue_low_x86_64',1),(600,1546523457,'building_x86_64',0),(601,1546523457,'idle_x86_64',1),(602,1546523487,'blocked_armv7el',1),(603,1546523487,'blocked_armv8el',1),(604,1546523487,'blocked_i586',1),(605,1546523487,'blocked_x86_64',2),(606,1546523487,'waiting_armv7el',1),(607,1546523487,'waiting_armv8el',1),(608,1546523487,'waiting_i586',0),(609,1546523487,'waiting_x86_64',2),(610,1546523487,'squeue_high_armv7el',0),(611,1546523487,'squeue_next_armv7el',0),(612,1546523487,'squeue_med_armv7el',0),(613,1546523487,'squeue_low_armv7el',1),(614,1546523487,'squeue_high_armv8el',0),(615,1546523487,'squeue_next_armv8el',0),(616,1546523487,'squeue_med_armv8el',0),(617,1546523487,'squeue_low_armv8el',1),(618,1546523487,'squeue_high_i586',0),(619,1546523487,'squeue_next_i586',0),(620,1546523487,'squeue_med_i586',0),(621,1546523487,'squeue_low_i586',1),(622,1546523487,'squeue_high_x86_64',1),(623,1546523487,'squeue_next_x86_64',0),(624,1546523487,'squeue_med_x86_64',0),(625,1546523487,'squeue_low_x86_64',3),(626,1546523487,'building_x86_64',1),(627,1546523487,'idle_x86_64',0),(628,1546523517,'blocked_armv7el',1),(629,1546523517,'blocked_armv8el',1),(630,1546523517,'blocked_i586',1),(631,1546523517,'blocked_x86_64',2),(632,1546523517,'waiting_armv7el',0),(633,1546523517,'waiting_armv8el',1),(634,1546523517,'waiting_i586',0),(635,1546523517,'waiting_x86_64',2),(636,1546523517,'squeue_high_armv7el',0),(637,1546523517,'squeue_next_armv7el',0),(638,1546523517,'squeue_med_armv7el',0),(639,1546523517,'squeue_low_armv7el',1),(640,1546523517,'squeue_high_armv8el',0),(641,1546523517,'squeue_next_armv8el',0),(642,1546523517,'squeue_med_armv8el',0),(643,1546523517,'squeue_low_armv8el',1),(644,1546523517,'squeue_high_i586',0),(645,1546523517,'squeue_next_i586',0),(646,1546523517,'squeue_med_i586',0),(647,1546523517,'squeue_low_i586',1),(648,1546523517,'squeue_high_x86_64',1),(649,1546523517,'squeue_next_x86_64',0),(650,1546523517,'squeue_med_x86_64',0),(651,1546523517,'squeue_low_x86_64',3),(652,1546523517,'building_x86_64',1),(653,1546523517,'idle_x86_64',0),(654,1546523547,'blocked_armv7el',1),(655,1546523547,'blocked_armv8el',1),(656,1546523547,'blocked_i586',1),(657,1546523547,'blocked_x86_64',2),(658,1546523547,'waiting_armv7el',0),(659,1546523547,'waiting_armv8el',1),(660,1546523547,'waiting_i586',0),(661,1546523547,'waiting_x86_64',2),(662,1546523547,'squeue_high_armv7el',0),(663,1546523547,'squeue_next_armv7el',0),(664,1546523547,'squeue_med_armv7el',0),(665,1546523547,'squeue_low_armv7el',1),(666,1546523547,'squeue_high_armv8el',0),(667,1546523547,'squeue_next_armv8el',0),(668,1546523547,'squeue_med_armv8el',0),(669,1546523547,'squeue_low_armv8el',1),(670,1546523547,'squeue_high_i586',0),(671,1546523547,'squeue_next_i586',0),(672,1546523547,'squeue_med_i586',0),(673,1546523547,'squeue_low_i586',1),(674,1546523547,'squeue_high_x86_64',1),(675,1546523547,'squeue_next_x86_64',0),(676,1546523547,'squeue_med_x86_64',0),(677,1546523547,'squeue_low_x86_64',3),(678,1546523547,'building_x86_64',1),(679,1546523547,'idle_x86_64',0),(680,1546523577,'blocked_armv7el',1),(681,1546523577,'blocked_armv8el',1),(682,1546523577,'blocked_i586',1),(683,1546523577,'blocked_x86_64',2),(684,1546523577,'waiting_armv7el',0),(685,1546523577,'waiting_armv8el',1),(686,1546523577,'waiting_i586',0),(687,1546523577,'waiting_x86_64',2),(688,1546523577,'squeue_high_armv7el',0),(689,1546523577,'squeue_next_armv7el',0),(690,1546523577,'squeue_med_armv7el',0),(691,1546523577,'squeue_low_armv7el',1),(692,1546523577,'squeue_high_armv8el',0),(693,1546523577,'squeue_next_armv8el',0),(694,1546523577,'squeue_med_armv8el',0),(695,1546523577,'squeue_low_armv8el',1),(696,1546523577,'squeue_high_i586',0),(697,1546523577,'squeue_next_i586',0),(698,1546523577,'squeue_med_i586',0),(699,1546523577,'squeue_low_i586',1),(700,1546523577,'squeue_high_x86_64',1),(701,1546523577,'squeue_next_x86_64',0),(702,1546523577,'squeue_med_x86_64',0),(703,1546523577,'squeue_low_x86_64',3),(704,1546523577,'building_x86_64',1),(705,1546523577,'idle_x86_64',0),(706,1546523607,'blocked_armv7el',1),(707,1546523607,'blocked_armv8el',1),(708,1546523607,'blocked_i586',1),(709,1546523607,'blocked_x86_64',2),(710,1546523607,'waiting_armv7el',0),(711,1546523607,'waiting_armv8el',1),(712,1546523607,'waiting_i586',0),(713,1546523607,'waiting_x86_64',2),(714,1546523607,'squeue_high_armv7el',0),(715,1546523607,'squeue_next_armv7el',0),(716,1546523607,'squeue_med_armv7el',0),(717,1546523607,'squeue_low_armv7el',1),(718,1546523607,'squeue_high_armv8el',0),(719,1546523607,'squeue_next_armv8el',0),(720,1546523607,'squeue_med_armv8el',0),(721,1546523607,'squeue_low_armv8el',1),(722,1546523607,'squeue_high_i586',0),(723,1546523607,'squeue_next_i586',0),(724,1546523607,'squeue_med_i586',0),(725,1546523607,'squeue_low_i586',1),(726,1546523607,'squeue_high_x86_64',1),(727,1546523607,'squeue_next_x86_64',0),(728,1546523607,'squeue_med_x86_64',0),(729,1546523607,'squeue_low_x86_64',3),(730,1546523607,'building_x86_64',0),(731,1546523607,'idle_x86_64',1),(732,1546523637,'blocked_armv7el',0),(733,1546523637,'blocked_armv8el',1),(734,1546523637,'blocked_i586',1),(735,1546523637,'blocked_x86_64',2),(736,1546523637,'waiting_armv7el',0),(737,1546523637,'waiting_armv8el',1),(738,1546523637,'waiting_i586',0),(739,1546523637,'waiting_x86_64',1),(740,1546523637,'squeue_high_armv7el',0),(741,1546523637,'squeue_next_armv7el',0),(742,1546523637,'squeue_med_armv7el',0),(743,1546523637,'squeue_low_armv7el',1),(744,1546523637,'squeue_high_armv8el',0),(745,1546523637,'squeue_next_armv8el',0),(746,1546523637,'squeue_med_armv8el',0),(747,1546523637,'squeue_low_armv8el',1),(748,1546523637,'squeue_high_i586',0),(749,1546523637,'squeue_next_i586',0),(750,1546523637,'squeue_med_i586',0),(751,1546523637,'squeue_low_i586',1),(752,1546523637,'squeue_high_x86_64',1),(753,1546523637,'squeue_next_x86_64',0),(754,1546523637,'squeue_med_x86_64',0),(755,1546523637,'squeue_low_x86_64',3),(756,1546523637,'building_x86_64',1),(757,1546523637,'idle_x86_64',0),(758,1546523667,'blocked_armv7el',0),(759,1546523667,'blocked_armv8el',1),(760,1546523667,'blocked_i586',1),(761,1546523667,'blocked_x86_64',1),(762,1546523667,'waiting_armv7el',0),(763,1546523667,'waiting_armv8el',0),(764,1546523667,'waiting_i586',0),(765,1546523667,'waiting_x86_64',1),(766,1546523667,'squeue_high_armv7el',0),(767,1546523667,'squeue_next_armv7el',0),(768,1546523667,'squeue_med_armv7el',0),(769,1546523667,'squeue_low_armv7el',1),(770,1546523667,'squeue_high_armv8el',0),(771,1546523667,'squeue_next_armv8el',0),(772,1546523667,'squeue_med_armv8el',0),(773,1546523667,'squeue_low_armv8el',1),(774,1546523667,'squeue_high_i586',0),(775,1546523667,'squeue_next_i586',0),(776,1546523667,'squeue_med_i586',0),(777,1546523667,'squeue_low_i586',1),(778,1546523667,'squeue_high_x86_64',0),(779,1546523667,'squeue_next_x86_64',0),(780,1546523667,'squeue_med_x86_64',0),(781,1546523667,'squeue_low_x86_64',1),(782,1546523667,'building_x86_64',1),(783,1546523667,'idle_x86_64',0),(784,1546523697,'blocked_armv7el',0),(785,1546523697,'blocked_armv8el',1),(786,1546523697,'blocked_i586',1),(787,1546523697,'blocked_x86_64',1),(788,1546523697,'waiting_armv7el',0),(789,1546523697,'waiting_armv8el',0),(790,1546523697,'waiting_i586',0),(791,1546523697,'waiting_x86_64',1),(792,1546523697,'squeue_high_armv7el',0),(793,1546523697,'squeue_next_armv7el',0),(794,1546523697,'squeue_med_armv7el',0),(795,1546523697,'squeue_low_armv7el',1),(796,1546523697,'squeue_high_armv8el',0),(797,1546523697,'squeue_next_armv8el',0),(798,1546523697,'squeue_med_armv8el',0),(799,1546523697,'squeue_low_armv8el',1),(800,1546523697,'squeue_high_i586',0),(801,1546523697,'squeue_next_i586',0),(802,1546523697,'squeue_med_i586',0),(803,1546523697,'squeue_low_i586',1),(804,1546523697,'squeue_high_x86_64',0),(805,1546523697,'squeue_next_x86_64',0),(806,1546523697,'squeue_med_x86_64',0),(807,1546523697,'squeue_low_x86_64',1),(808,1546523697,'building_x86_64',1),(809,1546523697,'idle_x86_64',0),(810,1546523727,'blocked_armv7el',0),(811,1546523727,'blocked_armv8el',1),(812,1546523727,'blocked_i586',1),(813,1546523727,'blocked_x86_64',1),(814,1546523727,'waiting_armv7el',0),(815,1546523727,'waiting_armv8el',0),(816,1546523727,'waiting_i586',0),(817,1546523727,'waiting_x86_64',1),(818,1546523727,'squeue_high_armv7el',0),(819,1546523727,'squeue_next_armv7el',0),(820,1546523727,'squeue_med_armv7el',0),(821,1546523727,'squeue_low_armv7el',1),(822,1546523727,'squeue_high_armv8el',0),(823,1546523727,'squeue_next_armv8el',0),(824,1546523727,'squeue_med_armv8el',0),(825,1546523727,'squeue_low_armv8el',1),(826,1546523727,'squeue_high_i586',0),(827,1546523727,'squeue_next_i586',0),(828,1546523727,'squeue_med_i586',0),(829,1546523727,'squeue_low_i586',1),(830,1546523727,'squeue_high_x86_64',0),(831,1546523727,'squeue_next_x86_64',0),(832,1546523727,'squeue_med_x86_64',0),(833,1546523727,'squeue_low_x86_64',1),(834,1546523727,'building_x86_64',1),(835,1546523727,'idle_x86_64',0),(836,1546523758,'blocked_armv7el',0),(837,1546523758,'blocked_armv8el',0),(838,1546523758,'blocked_i586',1),(839,1546523758,'blocked_x86_64',1),(840,1546523758,'waiting_armv7el',0),(841,1546523758,'waiting_armv8el',0),(842,1546523758,'waiting_i586',0),(843,1546523758,'waiting_x86_64',0),(844,1546523758,'squeue_high_armv7el',0),(845,1546523758,'squeue_next_armv7el',0),(846,1546523758,'squeue_med_armv7el',0),(847,1546523758,'squeue_low_armv7el',1),(848,1546523758,'squeue_high_armv8el',0),(849,1546523758,'squeue_next_armv8el',0),(850,1546523758,'squeue_med_armv8el',0),(851,1546523758,'squeue_low_armv8el',1),(852,1546523758,'squeue_high_i586',0),(853,1546523758,'squeue_next_i586',0),(854,1546523758,'squeue_med_i586',0),(855,1546523758,'squeue_low_i586',1),(856,1546523758,'squeue_high_x86_64',0),(857,1546523758,'squeue_next_x86_64',0),(858,1546523758,'squeue_med_x86_64',0),(859,1546523758,'squeue_low_x86_64',1),(860,1546523758,'building_x86_64',1),(861,1546523758,'idle_x86_64',0),(862,1546523788,'blocked_armv7el',0),(863,1546523788,'blocked_armv8el',0),(864,1546523788,'blocked_i586',1),(865,1546523788,'blocked_x86_64',1),(866,1546523788,'waiting_armv7el',0),(867,1546523788,'waiting_armv8el',0),(868,1546523788,'waiting_i586',0),(869,1546523788,'waiting_x86_64',0),(870,1546523788,'squeue_high_armv7el',0),(871,1546523788,'squeue_next_armv7el',0),(872,1546523788,'squeue_med_armv7el',0),(873,1546523788,'squeue_low_armv7el',1),(874,1546523788,'squeue_high_armv8el',0),(875,1546523788,'squeue_next_armv8el',0),(876,1546523788,'squeue_med_armv8el',0),(877,1546523788,'squeue_low_armv8el',1),(878,1546523788,'squeue_high_i586',0),(879,1546523788,'squeue_next_i586',0),(880,1546523788,'squeue_med_i586',0),(881,1546523788,'squeue_low_i586',1),(882,1546523788,'squeue_high_x86_64',0),(883,1546523788,'squeue_next_x86_64',0),(884,1546523788,'squeue_med_x86_64',0),(885,1546523788,'squeue_low_x86_64',1),(886,1546523788,'building_x86_64',1),(887,1546523788,'idle_x86_64',0),(888,1546523818,'blocked_armv7el',0),(889,1546523818,'blocked_armv8el',0),(890,1546523818,'blocked_i586',1),(891,1546523818,'blocked_x86_64',0),(892,1546523818,'waiting_armv7el',0),(893,1546523818,'waiting_armv8el',0),(894,1546523818,'waiting_i586',0),(895,1546523818,'waiting_x86_64',0),(896,1546523818,'squeue_high_armv7el',0),(897,1546523818,'squeue_next_armv7el',0),(898,1546523818,'squeue_med_armv7el',0),(899,1546523818,'squeue_low_armv7el',1),(900,1546523818,'squeue_high_armv8el',0),(901,1546523818,'squeue_next_armv8el',0),(902,1546523818,'squeue_med_armv8el',0),(903,1546523818,'squeue_low_armv8el',1),(904,1546523818,'squeue_high_i586',0),(905,1546523818,'squeue_next_i586',0),(906,1546523818,'squeue_med_i586',0),(907,1546523818,'squeue_low_i586',1),(908,1546523818,'squeue_high_x86_64',0),(909,1546523818,'squeue_next_x86_64',0),(910,1546523818,'squeue_med_x86_64',0),(911,1546523818,'squeue_low_x86_64',1),(912,1546523818,'building_x86_64',0),(913,1546523818,'idle_x86_64',1),(914,1546523848,'blocked_armv7el',0),(915,1546523848,'blocked_armv8el',0),(916,1546523848,'blocked_i586',1),(917,1546523848,'blocked_x86_64',0),(918,1546523848,'waiting_armv7el',0),(919,1546523848,'waiting_armv8el',0),(920,1546523848,'waiting_i586',0),(921,1546523848,'waiting_x86_64',0),(922,1546523848,'squeue_high_armv7el',0),(923,1546523848,'squeue_next_armv7el',0),(924,1546523848,'squeue_med_armv7el',0),(925,1546523848,'squeue_low_armv7el',1),(926,1546523848,'squeue_high_armv8el',0),(927,1546523848,'squeue_next_armv8el',0),(928,1546523848,'squeue_med_armv8el',0),(929,1546523848,'squeue_low_armv8el',1),(930,1546523848,'squeue_high_i586',0),(931,1546523848,'squeue_next_i586',0),(932,1546523848,'squeue_med_i586',0),(933,1546523848,'squeue_low_i586',1),(934,1546523848,'squeue_high_x86_64',0),(935,1546523848,'squeue_next_x86_64',0),(936,1546523848,'squeue_med_x86_64',0),(937,1546523848,'squeue_low_x86_64',1),(938,1546523848,'building_x86_64',0),(939,1546523848,'idle_x86_64',1),(940,1546523878,'blocked_armv7el',0),(941,1546523878,'blocked_armv8el',0),(942,1546523878,'blocked_i586',1),(943,1546523878,'blocked_x86_64',0),(944,1546523878,'waiting_armv7el',0),(945,1546523878,'waiting_armv8el',0),(946,1546523878,'waiting_i586',0),(947,1546523878,'waiting_x86_64',0),(948,1546523878,'squeue_high_armv7el',0),(949,1546523878,'squeue_next_armv7el',0),(950,1546523878,'squeue_med_armv7el',0),(951,1546523878,'squeue_low_armv7el',1),(952,1546523878,'squeue_high_armv8el',0),(953,1546523878,'squeue_next_armv8el',0),(954,1546523878,'squeue_med_armv8el',0),(955,1546523878,'squeue_low_armv8el',1),(956,1546523878,'squeue_high_i586',0),(957,1546523878,'squeue_next_i586',0),(958,1546523878,'squeue_med_i586',0),(959,1546523878,'squeue_low_i586',1),(960,1546523878,'squeue_high_x86_64',0),(961,1546523878,'squeue_next_x86_64',0),(962,1546523878,'squeue_med_x86_64',0),(963,1546523878,'squeue_low_x86_64',1),(964,1546523878,'building_x86_64',0),(965,1546523878,'idle_x86_64',1),(966,1546523963,'blocked_armv7el',0),(967,1546523963,'blocked_armv8el',0),(968,1546523963,'blocked_i586',1),(969,1546523963,'blocked_x86_64',0),(970,1546523963,'waiting_armv7el',0),(971,1546523963,'waiting_armv8el',0),(972,1546523963,'waiting_i586',0),(973,1546523963,'waiting_x86_64',0),(974,1546523963,'squeue_high_armv7el',0),(975,1546523963,'squeue_next_armv7el',0),(976,1546523963,'squeue_med_armv7el',0),(977,1546523963,'squeue_low_armv7el',1),(978,1546523963,'squeue_high_armv8el',0),(979,1546523963,'squeue_next_armv8el',0),(980,1546523963,'squeue_med_armv8el',0),(981,1546523963,'squeue_low_armv8el',1),(982,1546523963,'squeue_high_i586',0),(983,1546523963,'squeue_next_i586',0),(984,1546523963,'squeue_med_i586',0),(985,1546523963,'squeue_low_i586',1),(986,1546523963,'squeue_high_x86_64',0),(987,1546523963,'squeue_next_x86_64',0),(988,1546523963,'squeue_med_x86_64',0),(989,1546523963,'squeue_low_x86_64',1),(990,1546523963,'building_x86_64',0),(991,1546523963,'idle_x86_64',1),(992,1546523994,'blocked_armv7el',0),(993,1546523994,'blocked_armv8el',0),(994,1546523994,'blocked_i586',0),(995,1546523994,'blocked_x86_64',0),(996,1546523994,'waiting_armv7el',0),(997,1546523994,'waiting_armv8el',0),(998,1546523994,'waiting_i586',0),(999,1546523994,'waiting_x86_64',0),(1000,1546523994,'squeue_high_armv7el',0),(1001,1546523994,'squeue_next_armv7el',0),(1002,1546523994,'squeue_med_armv7el',0),(1003,1546523994,'squeue_low_armv7el',0),(1004,1546523994,'squeue_high_armv8el',0),(1005,1546523994,'squeue_next_armv8el',0),(1006,1546523994,'squeue_med_armv8el',0),(1007,1546523994,'squeue_low_armv8el',0),(1008,1546523994,'squeue_high_i586',0),(1009,1546523994,'squeue_next_i586',0),(1010,1546523994,'squeue_med_i586',0),(1011,1546523994,'squeue_low_i586',0),(1012,1546523994,'squeue_high_x86_64',0),(1013,1546523994,'squeue_next_x86_64',0),(1014,1546523994,'squeue_med_x86_64',0),(1015,1546523994,'squeue_low_x86_64',2),(1016,1546523994,'building_x86_64',0),(1017,1546523994,'idle_x86_64',1);
/*!40000 ALTER TABLE `status_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_messages`
--

DROP TABLE IF EXISTS `status_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `message` text CHARACTER SET utf8,
  `user_id` int(11) DEFAULT NULL,
  `severity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user_id`),
  KEY `index_status_messages_on_deleted_at_and_created_at` (`deleted_at`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_messages`
--

LOCK TABLES `status_messages` WRITE;
/*!40000 ALTER TABLE `status_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taggable_id` int(11) DEFAULT NULL,
  `taggable_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taggings_taggable_id_index` (`taggable_id`,`taggable_type`,`tag_id`,`user_id`),
  KEY `index_taggings_on_taggable_type` (`taggable_type`),
  KEY `tag_id` (`tag_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `taggings_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`),
  CONSTRAINT `taggings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_name_unique_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tokens_on_string` (`string`),
  KEY `user_id` (`user_id`),
  KEY `package_id` (`package_id`),
  CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `tokens_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updateinfo_counter`
--

DROP TABLE IF EXISTS `updateinfo_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updateinfo_counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maintenance_db_project_id` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `counter` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updateinfo_counter`
--

LOCK TABLES `updateinfo_counter` WRITE;
/*!40000 ALTER TABLE `updateinfo_counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `updateinfo_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_registrations`
--

DROP TABLE IF EXISTS `user_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_registrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `token` text CHARACTER SET utf8 NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_registrations_user_id_index` (`user_id`),
  KEY `user_registrations_expires_at_index` (`expires_at`),
  CONSTRAINT `user_registrations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_registrations`
--

LOCK TABLES `user_registrations` WRITE;
/*!40000 ALTER TABLE `user_registrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `last_logged_in_at` datetime DEFAULT NULL,
  `login_failure_count` int(11) NOT NULL DEFAULT '0',
  `login` text COLLATE utf8_bin,
  `email` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `realname` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `password` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `password_hash_type` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `password_salt` varchar(10) CHARACTER SET utf8 NOT NULL DEFAULT '1234512345',
  `password_crypted` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  `adminnote` text CHARACTER SET utf8,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_login_index` (`login`(255)),
  KEY `users_password_index` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2018-12-31 08:31:22','2018-12-31 08:31:22',NULL,0,'Admin','root@localhost','OBS Instance Superuser','38bfbba7fed0cd6fb2924243bcde8d0a','md5','Wp7AFZTrUJ','osQq6OKjF0f8I',2,NULL),(2,'2018-12-31 08:31:22','2018-12-31 08:31:22',NULL,0,'_nobody_','nobody@localhost','Anonymous User','72e8fb4c992e4b608f0f4223b4e1fe8d','md5','2MuteeZyBY','osEJSjdDGtlBY',3,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watched_projects`
--

DROP TABLE IF EXISTS `watched_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watched_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `watched_projects_users_fk_1` (`user_id`),
  CONSTRAINT `watched_projects_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watched_projects`
--

LOCK TABLES `watched_projects` WRITE;
/*!40000 ALTER TABLE `watched_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `watched_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-03 15:00:11
