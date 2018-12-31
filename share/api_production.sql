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
INSERT INTO `architectures` VALUES (1,'aarch64',0),(2,'armv4l',0),(3,'armv5l',0),(4,'armv6l',0),(5,'armv7l',1),(6,'armv5el',0),(7,'armv6el',0),(8,'armv7el',0),(9,'armv7hl',0),(10,'armv8el',0),(11,'hppa',0),(12,'i586',1),(13,'i686',0),(14,'ia64',0),(15,'local',0),(16,'m68k',0),(17,'mips',0),(18,'mips32',0),(19,'mips64',0),(20,'ppc',0),(21,'ppc64',0),(22,'ppc64p7',0),(23,'ppc64le',0),(24,'s390',0),(25,'s390x',0),(26,'sparc',0),(27,'sparc64',0),(28,'sparc64v',0),(29,'sparcv8',0),(30,'sparcv9',0),(31,'sparcv9v',0),(32,'x86_64',1);
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
INSERT INTO `backend_infos` VALUES (1,'lastnotification_nr','12','2018-12-31 08:36:45','2018-12-31 08:42:11');
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
INSERT INTO `backend_packages` VALUES (1,NULL,'2018-12-31 08:37:04','b2e1b1ad23b8aca3179c5c0ec29bea4d','181ba4e795315384eabb9bd6f2a07609','b2e1b1ad23b8aca3179c5c0ec29bea4d','b2e1b1ad23b8aca3179c5c0ec29bea4d',NULL,'2018-12-31 08:36:58');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_lines`
--

LOCK TABLES `cache_lines` WRITE;
/*!40000 ALTER TABLE `cache_lines` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delayed_jobs`
--

LOCK TABLES `delayed_jobs` WRITE;
/*!40000 ALTER TABLE `delayed_jobs` DISABLE KEYS */;
INSERT INTO `delayed_jobs` VALUES (2,0,5,'--- !ruby/object:Delayed::PerformableMethod\nobject: !ruby/ActiveRecord:IssueTracker\n  attributes:\n    id: 15\n    name: bnc\n    kind: bugzilla\n    description: Novell Bugzilla\n    url: https://bugzilla.novell.com/\n    show_url: https://bugzilla.novell.com/show_bug.cgi?id=@@@\n    regex: (?:bnc|BNC)\\s*[#:]\\s*(\\d+)\n    user: \n    password: \n    label: bnc#@@@\n    issues_updated: 2018-12-31 08:31:24.000000000 Z\n    enable_fetch: true\nmethod_name: :update_issues\nargs: []\n','SSL_connect returned=1 errno=0 state=error: certificate verify failed\n/usr/lib64/ruby/2.0.0/net/http.rb:918:in `connect\'\n/usr/lib64/ruby/2.0.0/net/http.rb:918:in `block in connect\'\n/usr/lib64/ruby/2.0.0/timeout.rb:66:in `timeout\'\n/usr/lib64/ruby/2.0.0/net/http.rb:918:in `connect\'\n/usr/lib64/ruby/2.0.0/net/http.rb:862:in `do_start\'\n/usr/lib64/ruby/2.0.0/net/http.rb:857:in `start\'\n/usr/lib64/ruby/2.0.0/xmlrpc/client.rb:474:in `do_rpc\'\n/usr/lib64/ruby/2.0.0/xmlrpc/client.rb:281:in `call2\'\n/usr/lib64/ruby/2.0.0/xmlrpc/client.rb:262:in `call\'\n/usr/lib64/ruby/2.0.0/xmlrpc/client.rb:592:in `method_missing\'\n/srv/www/obs/api/app/models/issue_tracker.rb:52:in `update_issues_bugzilla\'\n/srv/www/obs/api/app/models/issue_tracker.rb:101:in `update_issues\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/performable_method.rb:26:in `perform\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/backend/base.rb:105:in `block in invoke_job\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `execute\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/backend/base.rb:102:in `invoke_job\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:206:in `block (2 levels) in run\'\n/usr/lib64/ruby/2.0.0/timeout.rb:66:in `timeout\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:206:in `block in run\'\n/usr/lib64/ruby/2.0.0/benchmark.rb:296:in `realtime\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:205:in `run\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:267:in `block in reserve_and_run_one_job\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `execute\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:267:in `reserve_and_run_one_job\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:189:in `block in work_off\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:188:in `times\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:188:in `work_off\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:153:in `block (4 levels) in start\'\n/usr/lib64/ruby/2.0.0/benchmark.rb:296:in `realtime\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:152:in `block (3 levels) in start\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `execute\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:151:in `block (2 levels) in start\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:150:in `loop\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:150:in `block in start\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/plugins/clear_locks.rb:7:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:78:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:78:in `block (2 levels) in add\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:78:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:78:in `block in add\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:65:in `execute\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/worker.rb:149:in `start\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/command.rb:104:in `run\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/command.rb:92:in `block in run_process\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/application.rb:255:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/application.rb:255:in `block in start_proc\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/daemonize.rb:82:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/daemonize.rb:82:in `call_as_daemon\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/application.rb:259:in `start_proc\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/application.rb:296:in `start\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/controller.rb:70:in `run\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons.rb:197:in `block in run_proc\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/cmdline.rb:109:in `call\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons/cmdline.rb:109:in `catch_exceptions\'\n/usr/lib64/ruby/gems/2.0.0/gems/daemons-1.1.9/lib/daemons.rb:196:in `run_proc\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/command.rb:90:in `run_process\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/command.rb:83:in `block in daemonize\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/command.rb:81:in `times\'\n/usr/lib64/ruby/gems/2.0.0/gems/delayed_job-4.0.0/lib/delayed/command.rb:81:in `daemonize\'\nscript/delayed_job.api.rb:7:in `<main>\'','2018-12-31 08:48:50',NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Event::CreateProject','{\"project\":\"openSUSE.org\",\"sender\":\"Admin\"}',1,1,'2018-12-31 08:36:45','2018-12-31 08:36:59',1),(2,'Event::CreateProject','{\"project\":\"test\",\"sender\":\"Admin\"}',1,1,'2018-12-31 08:36:49','2018-12-31 08:36:59',1),(3,'Event::CreatePackage','{\"project\":\"test\",\"package\":\"hello\",\"sender\":\"Admin\"}',1,1,'2018-12-31 08:37:03','2018-12-31 08:37:29',1),(4,'Event::Commit','{\"project\":\"test\",\"package\":\"hello\",\"comment\":\"osc copypac from project:openSUSE:Leap:42.3 package:hello revision:5, using expand, using client side copy\",\"user\":\"Admin\",\"files\":\"Added:\\n  hello-1.3.dif\\n  hello-2.9.tar.gz\\n  hello-2.9.tar.gz.sig\\n  hello.changes\\n  hello.keyring\\n  hello.spec\\n\\n\",\"rev\":\"1\"}',1,1,'2018-12-31 08:37:03','2018-12-31 08:37:29',1),(5,'Event::VersionChange','{\"project\":\"test\",\"package\":\"hello\",\"comment\":\"osc copypac from project:openSUSE:Leap:42.3 package:hello revision:5, using expand, using client side copy\",\"files\":\"Added:\\n  hello-1.3.dif\\n  hello-2.9.tar.gz\\n  hello-2.9.tar.gz.sig\\n  hello.changes\\n  hello.keyring\\n  hello.spec\\n\\n\",\"rev\":\"1\",\"newversion\":\"2.9\",\"user\":\"Admin\",\"oldversion\":\"unknown\"}',1,1,'2018-12-31 08:37:03','2018-12-31 08:37:29',1),(6,'Event::RepoPublishState','{\"project\":\"test\",\"repo\":\"openSUSE_42.3\",\"state\":\"publishing\"}',1,1,'2018-12-31 08:38:24','2018-12-31 08:38:29',0),(7,'Event::RepoPublishState','{\"project\":\"test\",\"repo\":\"openSUSE_42.3\",\"state\":\"published\"}',1,1,'2018-12-31 08:38:29','2018-12-31 08:38:29',0),(8,'Event::BuildSuccess','{\"project\":\"test\",\"package\":\"hello\",\"repository\":\"openSUSE_42.3\",\"arch\":\"x86_64\",\"release\":\"1.1\",\"readytime\":\"1546245507\",\"srcmd5\":\"b2e1b1ad23b8aca3179c5c0ec29bea4d\",\"rev\":\"1\",\"reason\":\"new build\",\"bcnt\":\"1\",\"verifymd5\":\"b2e1b1ad23b8aca3179c5c0ec29bea4d\",\"starttime\":\"1546245518\",\"endtime\":\"1546245711\",\"workerid\":\"ci:1\",\"versrel\":\"2.9-1\"}',1,1,'2018-12-31 08:41:51','2018-12-31 08:42:00',1),(9,'Event::RepoPublishState','{\"project\":\"test\",\"repo\":\"openSUSE_42.3\",\"state\":\"publishing\"}',1,1,'2018-12-31 08:41:53','2018-12-31 08:42:00',0),(10,'Event::RepoPublished','{\"project\":\"test\",\"repo\":\"openSUSE_42.3\"}',1,1,'2018-12-31 08:42:10','2018-12-31 08:42:30',0),(11,'Event::RepoPublishState','{\"project\":\"test\",\"repo\":\"openSUSE_42.3\",\"state\":\"published\"}',1,1,'2018-12-31 08:42:11','2018-12-31 08:42:30',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flags`
--

LOCK TABLES `flags` WRITE;
/*!40000 ALTER TABLE `flags` DISABLE KEYS */;
INSERT INTO `flags` VALUES (1,'disable',NULL,NULL,1,12,1,'build',NULL);
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
INSERT INTO `packages` VALUES (1,3,'hello','A Friendly Greeting Program','The GNU hello program produces a familiar, friendly greeting.  It\nallows nonprogrammers to use a classic computer science tool that would\notherwise be unavailable to them.  Because it is protected by the GNU\nGeneral Public License, users are free to share and change it.\n\nGNU hello supports many native languages.','2018-12-31 08:36:53','2018-12-31 08:36:58',NULL,0,19.9884,NULL,NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `path_elements`
--

LOCK TABLES `path_elements` WRITE;
/*!40000 ALTER TABLE `path_elements` DISABLE KEYS */;
INSERT INTO `path_elements` VALUES (1,2,3,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_log_entries`
--

LOCK TABLES `project_log_entries` WRITE;
/*!40000 ALTER TABLE `project_log_entries` DISABLE KEYS */;
INSERT INTO `project_log_entries` VALUES (1,3,'Admin','hello',NULL,'2018-12-31 08:37:03','create_package','--- {}\n'),(2,3,'Admin','hello',NULL,'2018-12-31 08:37:03','commit','---\ncomment: osc copypac from project:openSUSE:Leap:42.3 package:hello revision:5, using\n  expand, using client side copy\nfiles: |+\n  Added:\n    hello-1.3.dif\n    hello-2.9.tar.gz\n    hello-2.9.tar.gz.sig\n    hello.changes\n    hello.keyring\n    hello.spec\n\nrev: \'1\'\n'),(3,3,'Admin','hello',NULL,'2018-12-31 08:37:03','version_change','---\ncomment: osc copypac from project:openSUSE:Leap:42.3 package:hello revision:5, using\n  expand, using client side copy\nfiles: |+\n  Added:\n    hello-1.3.dif\n    hello-2.9.tar.gz\n    hello-2.9.tar.gz.sig\n    hello.changes\n    hello.keyring\n    hello.spec\n\nrev: \'1\'\nnewversion: \'2.9\'\noldversion: unknown\n'),(4,3,NULL,'hello',NULL,'2018-12-31 08:41:51','build_success','---\nrepository: openSUSE_42.3\narch: x86_64\nrelease: \'1.1\'\nreadytime: \'1546245507\'\nsrcmd5: b2e1b1ad23b8aca3179c5c0ec29bea4d\nrev: \'1\'\nreason: new build\nbcnt: \'1\'\nverifymd5: b2e1b1ad23b8aca3179c5c0ec29bea4d\nstarttime: \'1546245518\'\nendtime: \'1546245711\'\nworkerid: ci:1\nversrel: 2.9-1\n'),(5,2,'Admin',NULL,NULL,'2018-12-31 08:36:45','create_project','--- {}\n'),(6,3,'Admin',NULL,NULL,'2018-12-31 08:36:49','create_project','--- {}\n');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'deleted',NULL,NULL,'2018-12-31 08:31:24','2018-12-31 08:31:24',NULL,NULL,1,NULL,NULL,1),(2,'openSUSE.org','build.openSUSE.org','This project allows access to all resources on build.opensuse.org OBS instance. This is needed to build against other distributions.','2018-12-31 08:36:44','2018-12-31 08:36:44','https://build.opensuse.org/public',NULL,1,NULL,NULL,1),(3,'test','','','2018-12-31 08:36:49','2018-12-31 08:36:49',NULL,NULL,1,NULL,NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationships`
--

LOCK TABLES `relationships` WRITE;
/*!40000 ALTER TABLE `relationships` DISABLE KEYS */;
INSERT INTO `relationships` VALUES (1,NULL,2,2,1,NULL),(2,NULL,3,2,1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repositories`
--

LOCK TABLES `repositories` WRITE;
/*!40000 ALTER TABLE `repositories` DISABLE KEYS */;
INSERT INTO `repositories` VALUES (1,1,'deleted',NULL,NULL,NULL,NULL,NULL),(2,3,'openSUSE_42.3',NULL,NULL,NULL,NULL,NULL),(3,2,'standard','openSUSE:Leap:42.3',NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_architectures`
--

LOCK TABLES `repository_architectures` WRITE;
/*!40000 ALTER TABLE `repository_architectures` DISABLE KEYS */;
INSERT INTO `repository_architectures` VALUES (2,32,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=382 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_histories`
--

LOCK TABLES `status_histories` WRITE;
/*!40000 ALTER TABLE `status_histories` DISABLE KEYS */;
INSERT INTO `status_histories` VALUES (1,1546245116,'waiting_armv7l',0),(2,1546245116,'waiting_i586',0),(3,1546245116,'waiting_x86_64',0),(4,1546245116,'squeue_high_armv7l',0),(5,1546245116,'squeue_next_armv7l',0),(6,1546245116,'squeue_med_armv7l',0),(7,1546245116,'squeue_low_armv7l',0),(8,1546245116,'squeue_high_i586',0),(9,1546245116,'squeue_next_i586',0),(10,1546245116,'squeue_med_i586',0),(11,1546245116,'squeue_low_i586',0),(12,1546245116,'squeue_high_x86_64',0),(13,1546245116,'squeue_next_x86_64',0),(14,1546245116,'squeue_med_x86_64',0),(15,1546245116,'squeue_low_x86_64',0),(16,1546245146,'waiting_armv7l',0),(17,1546245146,'waiting_i586',0),(18,1546245146,'waiting_x86_64',0),(19,1546245146,'squeue_high_armv7l',0),(20,1546245146,'squeue_next_armv7l',0),(21,1546245146,'squeue_med_armv7l',0),(22,1546245146,'squeue_low_armv7l',0),(23,1546245146,'squeue_high_i586',0),(24,1546245146,'squeue_next_i586',0),(25,1546245146,'squeue_med_i586',0),(26,1546245146,'squeue_low_i586',0),(27,1546245146,'squeue_high_x86_64',0),(28,1546245146,'squeue_next_x86_64',0),(29,1546245146,'squeue_med_x86_64',0),(30,1546245146,'squeue_low_x86_64',0),(31,1546245146,'building_x86_64',0),(32,1546245146,'idle_x86_64',1),(33,1546245176,'waiting_armv7l',0),(34,1546245176,'waiting_i586',0),(35,1546245176,'waiting_x86_64',0),(36,1546245176,'squeue_high_armv7l',0),(37,1546245176,'squeue_next_armv7l',0),(38,1546245176,'squeue_med_armv7l',0),(39,1546245176,'squeue_low_armv7l',0),(40,1546245176,'squeue_high_i586',0),(41,1546245176,'squeue_next_i586',0),(42,1546245176,'squeue_med_i586',0),(43,1546245176,'squeue_low_i586',0),(44,1546245176,'squeue_high_x86_64',0),(45,1546245176,'squeue_next_x86_64',0),(46,1546245176,'squeue_med_x86_64',0),(47,1546245176,'squeue_low_x86_64',0),(48,1546245176,'building_x86_64',0),(49,1546245176,'idle_x86_64',1),(50,1546245207,'waiting_armv7l',0),(51,1546245207,'waiting_i586',0),(52,1546245207,'waiting_x86_64',0),(53,1546245207,'squeue_high_armv7l',0),(54,1546245207,'squeue_next_armv7l',0),(55,1546245207,'squeue_med_armv7l',0),(56,1546245207,'squeue_low_armv7l',0),(57,1546245207,'squeue_high_i586',0),(58,1546245207,'squeue_next_i586',0),(59,1546245207,'squeue_med_i586',0),(60,1546245207,'squeue_low_i586',0),(61,1546245207,'squeue_high_x86_64',0),(62,1546245207,'squeue_next_x86_64',0),(63,1546245207,'squeue_med_x86_64',0),(64,1546245207,'squeue_low_x86_64',0),(65,1546245207,'building_x86_64',0),(66,1546245207,'idle_x86_64',1),(67,1546245237,'waiting_armv7l',0),(68,1546245237,'waiting_i586',0),(69,1546245237,'waiting_x86_64',0),(70,1546245237,'squeue_high_armv7l',0),(71,1546245237,'squeue_next_armv7l',0),(72,1546245237,'squeue_med_armv7l',0),(73,1546245237,'squeue_low_armv7l',0),(74,1546245237,'squeue_high_i586',0),(75,1546245237,'squeue_next_i586',0),(76,1546245237,'squeue_med_i586',0),(77,1546245237,'squeue_low_i586',0),(78,1546245237,'squeue_high_x86_64',0),(79,1546245237,'squeue_next_x86_64',0),(80,1546245237,'squeue_med_x86_64',0),(81,1546245237,'squeue_low_x86_64',0),(82,1546245237,'building_x86_64',0),(83,1546245237,'idle_x86_64',1),(84,1546245267,'waiting_armv7l',0),(85,1546245267,'waiting_i586',0),(86,1546245267,'waiting_x86_64',0),(87,1546245267,'squeue_high_armv7l',0),(88,1546245267,'squeue_next_armv7l',0),(89,1546245267,'squeue_med_armv7l',0),(90,1546245267,'squeue_low_armv7l',0),(91,1546245267,'squeue_high_i586',0),(92,1546245267,'squeue_next_i586',0),(93,1546245267,'squeue_med_i586',0),(94,1546245267,'squeue_low_i586',0),(95,1546245267,'squeue_high_x86_64',0),(96,1546245267,'squeue_next_x86_64',0),(97,1546245267,'squeue_med_x86_64',0),(98,1546245267,'squeue_low_x86_64',0),(99,1546245267,'building_x86_64',0),(100,1546245267,'idle_x86_64',1),(101,1546245297,'waiting_armv7l',0),(102,1546245297,'waiting_i586',0),(103,1546245297,'waiting_x86_64',0),(104,1546245297,'squeue_high_armv7l',0),(105,1546245297,'squeue_next_armv7l',0),(106,1546245297,'squeue_med_armv7l',0),(107,1546245297,'squeue_low_armv7l',0),(108,1546245297,'squeue_high_i586',0),(109,1546245297,'squeue_next_i586',0),(110,1546245297,'squeue_med_i586',0),(111,1546245297,'squeue_low_i586',0),(112,1546245297,'squeue_high_x86_64',0),(113,1546245297,'squeue_next_x86_64',0),(114,1546245297,'squeue_med_x86_64',0),(115,1546245297,'squeue_low_x86_64',0),(116,1546245297,'building_x86_64',0),(117,1546245297,'idle_x86_64',1),(118,1546245327,'waiting_armv7l',0),(119,1546245327,'waiting_i586',0),(120,1546245327,'waiting_x86_64',0),(121,1546245327,'squeue_high_armv7l',0),(122,1546245327,'squeue_next_armv7l',0),(123,1546245327,'squeue_med_armv7l',0),(124,1546245327,'squeue_low_armv7l',0),(125,1546245327,'squeue_high_i586',0),(126,1546245327,'squeue_next_i586',0),(127,1546245327,'squeue_med_i586',0),(128,1546245327,'squeue_low_i586',0),(129,1546245327,'squeue_high_x86_64',0),(130,1546245327,'squeue_next_x86_64',0),(131,1546245327,'squeue_med_x86_64',0),(132,1546245327,'squeue_low_x86_64',0),(133,1546245327,'building_x86_64',0),(134,1546245327,'idle_x86_64',1),(135,1546245357,'waiting_armv7l',0),(136,1546245357,'waiting_i586',0),(137,1546245357,'waiting_x86_64',0),(138,1546245357,'squeue_high_armv7l',0),(139,1546245357,'squeue_next_armv7l',0),(140,1546245357,'squeue_med_armv7l',0),(141,1546245357,'squeue_low_armv7l',0),(142,1546245357,'squeue_high_i586',0),(143,1546245357,'squeue_next_i586',0),(144,1546245357,'squeue_med_i586',0),(145,1546245357,'squeue_low_i586',0),(146,1546245357,'squeue_high_x86_64',0),(147,1546245357,'squeue_next_x86_64',0),(148,1546245357,'squeue_med_x86_64',0),(149,1546245357,'squeue_low_x86_64',0),(150,1546245357,'building_x86_64',0),(151,1546245357,'idle_x86_64',1),(152,1546245387,'waiting_armv7l',0),(153,1546245387,'waiting_i586',0),(154,1546245387,'waiting_x86_64',0),(155,1546245387,'squeue_high_armv7l',0),(156,1546245387,'squeue_next_armv7l',0),(157,1546245387,'squeue_med_armv7l',0),(158,1546245387,'squeue_low_armv7l',0),(159,1546245387,'squeue_high_i586',0),(160,1546245387,'squeue_next_i586',0),(161,1546245387,'squeue_med_i586',0),(162,1546245387,'squeue_low_i586',0),(163,1546245387,'squeue_high_x86_64',0),(164,1546245387,'squeue_next_x86_64',0),(165,1546245387,'squeue_med_x86_64',0),(166,1546245387,'squeue_low_x86_64',0),(167,1546245387,'building_x86_64',0),(168,1546245387,'idle_x86_64',1),(169,1546245417,'waiting_armv7l',0),(170,1546245417,'waiting_i586',0),(171,1546245417,'waiting_x86_64',0),(172,1546245417,'squeue_high_armv7l',0),(173,1546245417,'squeue_next_armv7l',0),(174,1546245417,'squeue_med_armv7l',0),(175,1546245417,'squeue_low_armv7l',0),(176,1546245417,'squeue_high_i586',0),(177,1546245417,'squeue_next_i586',0),(178,1546245417,'squeue_med_i586',0),(179,1546245417,'squeue_low_i586',0),(180,1546245417,'squeue_high_x86_64',0),(181,1546245417,'squeue_next_x86_64',0),(182,1546245417,'squeue_med_x86_64',0),(183,1546245417,'squeue_low_x86_64',0),(184,1546245417,'building_x86_64',0),(185,1546245417,'idle_x86_64',1),(186,1546245447,'waiting_armv7l',0),(187,1546245447,'waiting_i586',0),(188,1546245447,'waiting_x86_64',0),(189,1546245447,'squeue_high_armv7l',0),(190,1546245447,'squeue_next_armv7l',0),(191,1546245447,'squeue_med_armv7l',0),(192,1546245447,'squeue_low_armv7l',0),(193,1546245447,'squeue_high_i586',0),(194,1546245447,'squeue_next_i586',0),(195,1546245447,'squeue_med_i586',0),(196,1546245447,'squeue_low_i586',0),(197,1546245447,'squeue_high_x86_64',0),(198,1546245447,'squeue_next_x86_64',0),(199,1546245447,'squeue_med_x86_64',0),(200,1546245447,'squeue_low_x86_64',0),(201,1546245447,'building_x86_64',0),(202,1546245447,'idle_x86_64',1),(203,1546245477,'waiting_armv7l',0),(204,1546245477,'waiting_i586',0),(205,1546245477,'waiting_x86_64',0),(206,1546245477,'squeue_high_armv7l',0),(207,1546245477,'squeue_next_armv7l',0),(208,1546245477,'squeue_med_armv7l',0),(209,1546245477,'squeue_low_armv7l',0),(210,1546245477,'squeue_high_i586',0),(211,1546245477,'squeue_next_i586',0),(212,1546245477,'squeue_med_i586',0),(213,1546245477,'squeue_low_i586',0),(214,1546245477,'squeue_high_x86_64',0),(215,1546245477,'squeue_next_x86_64',0),(216,1546245477,'squeue_med_x86_64',0),(217,1546245477,'squeue_low_x86_64',0),(218,1546245477,'building_x86_64',0),(219,1546245477,'idle_x86_64',1),(220,1546245508,'blocked_x86_64',0),(221,1546245508,'waiting_armv7l',0),(222,1546245508,'waiting_i586',0),(223,1546245508,'waiting_x86_64',0),(224,1546245508,'squeue_high_armv7l',0),(225,1546245508,'squeue_next_armv7l',0),(226,1546245508,'squeue_med_armv7l',0),(227,1546245508,'squeue_low_armv7l',0),(228,1546245508,'squeue_high_i586',0),(229,1546245508,'squeue_next_i586',0),(230,1546245508,'squeue_med_i586',0),(231,1546245508,'squeue_low_i586',0),(232,1546245508,'squeue_high_x86_64',0),(233,1546245508,'squeue_next_x86_64',0),(234,1546245508,'squeue_med_x86_64',0),(235,1546245508,'squeue_low_x86_64',1),(236,1546245508,'building_x86_64',0),(237,1546245508,'idle_x86_64',1),(238,1546245538,'blocked_x86_64',0),(239,1546245538,'waiting_armv7l',0),(240,1546245538,'waiting_i586',0),(241,1546245538,'waiting_x86_64',0),(242,1546245538,'squeue_high_armv7l',0),(243,1546245538,'squeue_next_armv7l',0),(244,1546245538,'squeue_med_armv7l',0),(245,1546245538,'squeue_low_armv7l',0),(246,1546245538,'squeue_high_i586',0),(247,1546245538,'squeue_next_i586',0),(248,1546245538,'squeue_med_i586',0),(249,1546245538,'squeue_low_i586',0),(250,1546245538,'squeue_high_x86_64',0),(251,1546245538,'squeue_next_x86_64',0),(252,1546245538,'squeue_med_x86_64',0),(253,1546245538,'squeue_low_x86_64',1),(254,1546245538,'building_x86_64',1),(255,1546245538,'idle_x86_64',0),(256,1546245568,'blocked_x86_64',0),(257,1546245568,'waiting_armv7l',0),(258,1546245568,'waiting_i586',0),(259,1546245568,'waiting_x86_64',0),(260,1546245568,'squeue_high_armv7l',0),(261,1546245568,'squeue_next_armv7l',0),(262,1546245568,'squeue_med_armv7l',0),(263,1546245568,'squeue_low_armv7l',0),(264,1546245568,'squeue_high_i586',0),(265,1546245568,'squeue_next_i586',0),(266,1546245568,'squeue_med_i586',0),(267,1546245568,'squeue_low_i586',0),(268,1546245568,'squeue_high_x86_64',0),(269,1546245568,'squeue_next_x86_64',0),(270,1546245568,'squeue_med_x86_64',0),(271,1546245568,'squeue_low_x86_64',1),(272,1546245568,'building_x86_64',1),(273,1546245568,'idle_x86_64',0),(274,1546245598,'blocked_x86_64',0),(275,1546245598,'waiting_armv7l',0),(276,1546245598,'waiting_i586',0),(277,1546245598,'waiting_x86_64',0),(278,1546245598,'squeue_high_armv7l',0),(279,1546245598,'squeue_next_armv7l',0),(280,1546245598,'squeue_med_armv7l',0),(281,1546245598,'squeue_low_armv7l',0),(282,1546245598,'squeue_high_i586',0),(283,1546245598,'squeue_next_i586',0),(284,1546245598,'squeue_med_i586',0),(285,1546245598,'squeue_low_i586',0),(286,1546245598,'squeue_high_x86_64',0),(287,1546245598,'squeue_next_x86_64',0),(288,1546245598,'squeue_med_x86_64',0),(289,1546245598,'squeue_low_x86_64',1),(290,1546245598,'building_x86_64',1),(291,1546245598,'idle_x86_64',0),(292,1546245628,'blocked_x86_64',0),(293,1546245628,'waiting_armv7l',0),(294,1546245628,'waiting_i586',0),(295,1546245628,'waiting_x86_64',0),(296,1546245628,'squeue_high_armv7l',0),(297,1546245628,'squeue_next_armv7l',0),(298,1546245628,'squeue_med_armv7l',0),(299,1546245628,'squeue_low_armv7l',0),(300,1546245628,'squeue_high_i586',0),(301,1546245628,'squeue_next_i586',0),(302,1546245628,'squeue_med_i586',0),(303,1546245628,'squeue_low_i586',0),(304,1546245628,'squeue_high_x86_64',0),(305,1546245628,'squeue_next_x86_64',0),(306,1546245628,'squeue_med_x86_64',0),(307,1546245628,'squeue_low_x86_64',1),(308,1546245628,'building_x86_64',1),(309,1546245628,'idle_x86_64',0),(310,1546245658,'blocked_x86_64',0),(311,1546245658,'waiting_armv7l',0),(312,1546245658,'waiting_i586',0),(313,1546245658,'waiting_x86_64',0),(314,1546245658,'squeue_high_armv7l',0),(315,1546245658,'squeue_next_armv7l',0),(316,1546245658,'squeue_med_armv7l',0),(317,1546245658,'squeue_low_armv7l',0),(318,1546245658,'squeue_high_i586',0),(319,1546245658,'squeue_next_i586',0),(320,1546245658,'squeue_med_i586',0),(321,1546245658,'squeue_low_i586',0),(322,1546245658,'squeue_high_x86_64',0),(323,1546245658,'squeue_next_x86_64',0),(324,1546245658,'squeue_med_x86_64',0),(325,1546245658,'squeue_low_x86_64',1),(326,1546245658,'building_x86_64',1),(327,1546245658,'idle_x86_64',0),(328,1546245688,'blocked_x86_64',0),(329,1546245688,'waiting_armv7l',0),(330,1546245688,'waiting_i586',0),(331,1546245688,'waiting_x86_64',0),(332,1546245688,'squeue_high_armv7l',0),(333,1546245688,'squeue_next_armv7l',0),(334,1546245688,'squeue_med_armv7l',0),(335,1546245688,'squeue_low_armv7l',0),(336,1546245688,'squeue_high_i586',0),(337,1546245688,'squeue_next_i586',0),(338,1546245688,'squeue_med_i586',0),(339,1546245688,'squeue_low_i586',0),(340,1546245688,'squeue_high_x86_64',0),(341,1546245688,'squeue_next_x86_64',0),(342,1546245688,'squeue_med_x86_64',0),(343,1546245688,'squeue_low_x86_64',1),(344,1546245688,'building_x86_64',1),(345,1546245688,'idle_x86_64',0),(346,1546245718,'blocked_x86_64',0),(347,1546245718,'waiting_armv7l',0),(348,1546245718,'waiting_i586',0),(349,1546245718,'waiting_x86_64',0),(350,1546245718,'squeue_high_armv7l',0),(351,1546245718,'squeue_next_armv7l',0),(352,1546245718,'squeue_med_armv7l',0),(353,1546245718,'squeue_low_armv7l',0),(354,1546245718,'squeue_high_i586',0),(355,1546245718,'squeue_next_i586',0),(356,1546245718,'squeue_med_i586',0),(357,1546245718,'squeue_low_i586',0),(358,1546245718,'squeue_high_x86_64',0),(359,1546245718,'squeue_next_x86_64',0),(360,1546245718,'squeue_med_x86_64',0),(361,1546245718,'squeue_low_x86_64',1),(362,1546245718,'building_x86_64',0),(363,1546245718,'idle_x86_64',1),(364,1546245749,'blocked_x86_64',0),(365,1546245749,'waiting_armv7l',0),(366,1546245749,'waiting_i586',0),(367,1546245749,'waiting_x86_64',0),(368,1546245749,'squeue_high_armv7l',0),(369,1546245749,'squeue_next_armv7l',0),(370,1546245749,'squeue_med_armv7l',0),(371,1546245749,'squeue_low_armv7l',0),(372,1546245749,'squeue_high_i586',0),(373,1546245749,'squeue_next_i586',0),(374,1546245749,'squeue_med_i586',0),(375,1546245749,'squeue_low_i586',0),(376,1546245749,'squeue_high_x86_64',0),(377,1546245749,'squeue_next_x86_64',0),(378,1546245749,'squeue_med_x86_64',0),(379,1546245749,'squeue_low_x86_64',1),(380,1546245749,'building_x86_64',0),(381,1546245749,'idle_x86_64',1);
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

-- Dump completed on 2018-12-31  9:42:38
