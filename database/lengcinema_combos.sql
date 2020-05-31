-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: lengcinema
-- ------------------------------------------------------
-- Server version	8.0.20

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
  `id` int NOT NULL AUTO_INCREMENT,
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
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Pelicula',7,'add_pelicula'),(26,'Can change Pelicula',7,'change_pelicula'),(27,'Can delete Pelicula',7,'delete_pelicula'),(28,'Can view Pelicula',7,'view_pelicula'),(29,'Can add Asiento',8,'add_asiento'),(30,'Can change Asiento',8,'change_asiento'),(31,'Can delete Asiento',8,'delete_asiento'),(32,'Can view Asiento',8,'view_asiento'),(33,'Can add Funcion',9,'add_funcion'),(34,'Can change Funcion',9,'change_funcion'),(35,'Can delete Funcion',9,'delete_funcion'),(36,'Can view Funcion',9,'view_funcion'),(37,'Can add Sala',10,'add_sala'),(38,'Can change Sala',10,'change_sala'),(39,'Can delete Sala',10,'delete_sala'),(40,'Can view Sala',10,'view_sala'),(41,'Can add Reservar Asiento',11,'add_reservarasientos'),(42,'Can change Reservar Asiento',11,'change_reservarasientos'),(43,'Can delete Reservar Asiento',11,'delete_reservarasientos'),(44,'Can view Reservar Asiento',11,'view_reservarasientos'),(45,'Can add Combo',12,'add_combo'),(46,'Can change Combo',12,'change_combo'),(47,'Can delete Combo',12,'delete_combo'),(48,'Can view Combo',12,'view_combo'),(49,'Can add Entrada',13,'add_entrada'),(50,'Can change Entrada',13,'change_entrada'),(51,'Can delete Entrada',13,'delete_entrada'),(52,'Can view Entrada',13,'view_entrada'),(53,'Can add Compras Combos',14,'add_comprascombos'),(54,'Can change Compras Combos',14,'change_comprascombos'),(55,'Can delete Compras Combos',14,'delete_comprascombos'),(56,'Can view Compras Combos',14,'view_comprascombos'),(57,'Can add Factura',15,'add_factura'),(58,'Can change Factura',15,'change_factura'),(59,'Can delete Factura',15,'delete_factura'),(60,'Can view Factura',15,'view_factura'),(61,'Can add Entrada',16,'add_entrada'),(62,'Can change Entrada',16,'change_entrada'),(63,'Can delete Entrada',16,'delete_entrada'),(64,'Can view Entrada',16,'view_entrada'),(65,'Can add compras entradas',17,'add_comprasentradas'),(66,'Can change compras entradas',17,'change_comprasentradas'),(67,'Can delete compras entradas',17,'delete_comprasentradas'),(68,'Can view compras entradas',17,'view_comprasentradas');
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
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$7n1Xi5IVoWU4$v8GK+cyam5p6gtxX5geNDSvdZruj5nCwGXTVijYqmDE=','2020-05-31 03:30:35.526530',1,'lengcinema','','','cine@gmail.com',1,1,'2020-05-28 21:39:26.073013');
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
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combos_combo`
--

DROP TABLE IF EXISTS `combos_combo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combos_combo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` double NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combos_combo`
--

LOCK TABLES `combos_combo` WRITE;
/*!40000 ALTER TABLE `combos_combo` DISABLE KEYS */;
INSERT INTO `combos_combo` VALUES (1,'Combo Informático','1 Cotufa, 1 Refresco, 1 Golosina, 1 Chuchería salada.',9,1),(2,'Combo Leng en Familia','2 Cotufas y 4 Refrescos',15,1),(3,'Combo Caliente','1 Perro Caliente y 1 Refresco',6,1),(4,'Combo Caliente Caliente','2 Perros Calientes y 2 Refrescos',12,1),(5,'Combo Acompañado','2 Cotufas, 2 Refrescos y 2 Chucherías saladas',14.5,1),(6,'Combo Enamorado','1 Cotufa, 2 Refescos y 1 Golosina',9.25,1);
/*!40000 ALTER TABLE `combos_combo` ENABLE KEYS */;
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
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-05-28 21:44:21.032836','1','Los Vengadores',1,'[{\"added\": {}}]',7,1),(2,'2020-05-28 22:01:07.805171','2','Maléfica 2',1,'[{\"added\": {}}]',7,1),(3,'2020-05-28 22:01:56.681335','1','Los Vengadores',2,'[{\"changed\": {\"fields\": [\"Imagen\"]}}]',7,1),(4,'2020-05-28 22:06:05.485878','3','Wonder Woman 1984',1,'[{\"added\": {}}]',7,1),(5,'2020-05-28 22:06:57.962101','1','Los Vengadores',2,'[{\"changed\": {\"fields\": [\"Fecha estreno\", \"Duracion\"]}}]',7,1),(6,'2020-05-28 22:07:31.321876','2','Maléfica 2',2,'[{\"changed\": {\"fields\": [\"Fecha estreno\", \"Fecha salida\", \"Duracion\"]}}]',7,1),(7,'2020-05-28 22:08:29.227062','3','Wonder Woman 1984',2,'[{\"changed\": {\"fields\": [\"Fecha estreno\", \"Duracion\"]}}]',7,1),(8,'2020-05-29 18:06:40.521344','4','Minions: The Rise of Gru',1,'[{\"added\": {}}]',7,1),(9,'2020-05-30 17:01:16.965515','1','Avengers: Endgame',2,'[{\"changed\": {\"fields\": [\"Titulo\", \"Sinopsis\", \"Categoria\", \"Imagen\", \"Fecha estreno\", \"Duracion\"]}}]',7,1),(10,'2020-05-30 17:01:47.543162','2','Maléfica 2',3,'',7,1),(11,'2020-05-30 17:02:00.897146','4','Minions: The Rise of Gru',3,'',7,1),(12,'2020-05-30 17:02:01.067791','3','Wonder Woman 1984',3,'',7,1),(13,'2020-05-30 17:04:33.957473','5','Minions: The Rise of Gru',1,'[{\"added\": {}}]',7,1),(14,'2020-05-30 17:07:30.289473','6','Wonder Woman 2',1,'[{\"added\": {}}]',7,1),(15,'2020-05-30 17:12:20.696456','7','Hotel Transylvania 3: Monstruos de Vacaciones',1,'[{\"added\": {}}]',7,1),(16,'2020-05-30 17:14:23.452600','8','Escuadrón de la muerte',1,'[{\"added\": {}}]',7,1),(17,'2020-05-30 17:15:44.080141','9','Spider-Man: De regreso a casa',1,'[{\"added\": {}}]',7,1),(18,'2020-05-30 17:16:44.904058','10','Mulán',1,'[{\"added\": {}}]',7,1),(19,'2020-05-30 17:18:09.800441','11','Bad Boys para siempre',1,'[{\"added\": {}}]',7,1),(20,'2020-05-30 17:20:06.446827','12','Sonic la película',1,'[{\"added\": {}}]',7,1),(21,'2020-05-30 17:21:02.644541','13','¡Scooby!',1,'[{\"added\": {}}]',7,1),(22,'2020-05-30 17:21:54.612127','14','Amenaza en lo profundo',1,'[{\"added\": {}}]',7,1),(23,'2020-05-30 17:22:59.582413','15','Black Widow',1,'[{\"added\": {}}]',7,1),(24,'2020-05-30 17:24:14.285978','16','Rápidos y Furiosos 9',1,'[{\"added\": {}}]',7,1),(25,'2020-05-30 17:26:00.160839','17','Godzilla vs. Kong',1,'[{\"added\": {}}]',7,1),(26,'2020-05-30 17:27:09.531219','18','Gretel y Hansel',1,'[{\"added\": {}}]',7,1),(27,'2020-05-30 17:28:20.893609','19','El conjuro 3',1,'[{\"added\": {}}]',7,1),(28,'2020-05-30 17:29:20.186991','20','Violet y Finch',1,'[{\"added\": {}}]',7,1),(29,'2020-05-30 17:30:15.954615','21','Free Guy',1,'[{\"added\": {}}]',7,1),(30,'2020-05-30 17:31:28.565003','22','Te quiero, imbécil',1,'[{\"added\": {}}]',7,1),(31,'2020-05-30 17:32:15.365405','23','Divino amor',1,'[{\"added\": {}}]',7,1),(32,'2020-05-30 17:32:27.875109','23','Divino amor',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',7,1),(33,'2020-05-30 17:33:21.417801','24','The Room',1,'[{\"added\": {}}]',7,1),(34,'2020-05-30 17:37:34.614703','25','Escape Room: sin salida',1,'[{\"added\": {}}]',7,1),(35,'2020-05-30 17:38:32.020705','26','El jardín secreto',1,'[{\"added\": {}}]',7,1),(36,'2020-05-30 17:38:47.452884','26','El jardín secreto',2,'[]',7,1),(37,'2020-05-30 17:39:33.625280','27','La cabaña',1,'[{\"added\": {}}]',7,1),(38,'2020-05-30 17:40:18.493574','28','El hoyo',1,'[{\"added\": {}}]',7,1),(39,'2020-05-30 17:46:54.396030','29','Los Croods 2',1,'[{\"added\": {}}]',7,1),(40,'2020-05-30 17:48:46.719140','30','Si supieras',1,'[{\"added\": {}}]',7,1),(41,'2020-05-30 18:38:57.182403','31','Love Wedding Repeat',1,'[{\"added\": {}}]',7,1),(42,'2020-05-30 18:41:27.592469','32','Modo Avión',1,'[{\"added\": {}}]',7,1),(43,'2020-05-30 18:44:54.971568','33','West Side Story',1,'[{\"added\": {}}]',7,1),(44,'2020-05-30 18:46:30.346258','34','18 Presents',1,'[{\"added\": {}}]',7,1),(45,'2020-05-30 18:48:51.811720','35','Dolittle',1,'[{\"added\": {}}]',7,1),(46,'2020-05-30 18:50:06.130430','36','Los nuevos mutantes',1,'[{\"added\": {}}]',7,1),(47,'2020-05-30 18:51:35.737192','37','Invasión: el fin de los tiempos',1,'[{\"added\": {}}]',7,1),(48,'2020-05-30 18:54:58.024052','38','Dune',1,'[{\"added\": {}}]',7,1),(49,'2020-05-30 18:56:38.590636','39','Artemis Fowl: el mundo subterráneo',1,'[{\"added\": {}}]',7,1),(50,'2020-05-30 18:57:51.104560','40','El llamado salvaje',1,'[{\"added\": {}}]',7,1),(51,'2020-05-30 18:59:25.490734','41','Soul',1,'[{\"added\": {}}]',7,1),(52,'2020-05-30 19:02:02.425450','42','The Lovebirds',1,'[{\"added\": {}}]',7,1),(53,'2020-05-30 19:04:03.491386','43','The Photograph',1,'[{\"added\": {}}]',7,1),(54,'2020-05-30 19:05:34.747349','44','Emma',1,'[{\"added\": {}}]',7,1),(55,'2020-05-30 19:14:33.026852','1','Sala 2D',1,'[{\"added\": {}}]',10,1),(56,'2020-05-30 19:17:04.436329','2','Sala 3D',1,'[{\"added\": {}}]',10,1),(57,'2020-05-30 19:42:44.467761','3','Sala VIP',1,'[{\"added\": {}}]',10,1),(58,'2020-05-30 19:43:01.730997','4','Sala 4DX',1,'[{\"added\": {}}]',10,1),(59,'2020-05-30 19:43:34.860657','1','Asiento object (1)',1,'[{\"added\": {}}]',8,1),(60,'2020-05-30 19:43:43.792914','2','Asiento object (2)',1,'[{\"added\": {}}]',8,1),(61,'2020-05-30 19:43:50.951488','3','Asiento object (3)',1,'[{\"added\": {}}]',8,1),(62,'2020-05-30 19:43:58.302043','4','Asiento object (4)',1,'[{\"added\": {}}]',8,1),(63,'2020-05-30 19:44:06.448623','5','Asiento object (5)',1,'[{\"added\": {}}]',8,1),(64,'2020-05-30 19:44:15.233214','6','Asiento object (6)',1,'[{\"added\": {}}]',8,1),(65,'2020-05-30 19:44:24.295121','7','Asiento object (7)',1,'[{\"added\": {}}]',8,1),(66,'2020-05-30 19:44:33.961979','8','Asiento object (8)',1,'[{\"added\": {}}]',8,1),(67,'2020-05-30 19:44:51.892470','9','Asiento object (9)',1,'[{\"added\": {}}]',8,1),(68,'2020-05-30 19:45:00.762741','10','Asiento object (10)',1,'[{\"added\": {}}]',8,1),(69,'2020-05-30 19:45:08.354300','11','Asiento object (11)',1,'[{\"added\": {}}]',8,1),(70,'2020-05-30 19:45:19.303100','12','Asiento object (12)',1,'[{\"added\": {}}]',8,1),(71,'2020-05-30 19:45:27.417003','13','Asiento object (13)',1,'[{\"added\": {}}]',8,1),(72,'2020-05-30 19:45:34.757141','14','Asiento object (14)',1,'[{\"added\": {}}]',8,1),(73,'2020-05-30 19:45:43.723499','15','Asiento object (15)',1,'[{\"added\": {}}]',8,1),(74,'2020-05-30 19:45:51.837404','16','Asiento object (16)',1,'[{\"added\": {}}]',8,1),(75,'2020-05-30 19:45:58.734342','17','Asiento object (17)',1,'[{\"added\": {}}]',8,1),(76,'2020-05-30 19:46:04.748232','18','Asiento object (18)',1,'[{\"added\": {}}]',8,1),(77,'2020-05-30 19:46:11.375812','19','Asiento object (19)',1,'[{\"added\": {}}]',8,1),(78,'2020-05-30 19:46:18.074266','20','Asiento object (20)',1,'[{\"added\": {}}]',8,1),(79,'2020-05-30 19:46:23.984434','21','Asiento object (21)',1,'[{\"added\": {}}]',8,1),(80,'2020-05-30 19:46:29.261251','22','Asiento object (22)',1,'[{\"added\": {}}]',8,1),(81,'2020-05-30 19:46:34.974805','23','Asiento object (23)',1,'[{\"added\": {}}]',8,1),(82,'2020-05-30 19:46:45.697181','24','Asiento object (24)',1,'[{\"added\": {}}]',8,1),(83,'2020-05-30 19:47:01.423727','25','Asiento object (25)',1,'[{\"added\": {}}]',8,1),(84,'2020-05-30 19:47:07.534920','26','Asiento object (26)',1,'[{\"added\": {}}]',8,1),(85,'2020-05-30 19:47:17.373929','27','Asiento object (27)',1,'[{\"added\": {}}]',8,1),(86,'2020-05-30 19:47:23.689803','28','Asiento object (28)',1,'[{\"added\": {}}]',8,1),(87,'2020-05-30 19:47:33.863558','29','Asiento object (29)',1,'[{\"added\": {}}]',8,1),(88,'2020-05-30 19:47:40.240774','30','Asiento object (30)',1,'[{\"added\": {}}]',8,1),(89,'2020-05-30 19:47:45.673562','31','Asiento object (31)',1,'[{\"added\": {}}]',8,1),(90,'2020-05-30 19:47:51.685577','32','Asiento object (32)',1,'[{\"added\": {}}]',8,1),(91,'2020-05-30 19:47:58.631375','33','Asiento object (33)',1,'[{\"added\": {}}]',8,1),(92,'2020-05-30 19:48:03.690044','34','Asiento object (34)',1,'[{\"added\": {}}]',8,1),(93,'2020-05-30 19:48:10.025665','35','Asiento object (35)',1,'[{\"added\": {}}]',8,1),(94,'2020-05-30 19:48:15.553229','36','Asiento object (36)',1,'[{\"added\": {}}]',8,1),(95,'2020-05-30 19:48:21.126324','37','Asiento object (37)',1,'[{\"added\": {}}]',8,1),(96,'2020-05-30 19:48:27.607542','38','Asiento object (38)',1,'[{\"added\": {}}]',8,1),(97,'2020-05-30 19:48:32.974665','39','Asiento object (39)',1,'[{\"added\": {}}]',8,1),(98,'2020-05-30 19:48:39.085373','40','Asiento object (40)',1,'[{\"added\": {}}]',8,1),(99,'2020-05-30 19:48:45.256135','41','Asiento object (41)',1,'[{\"added\": {}}]',8,1),(100,'2020-05-30 19:48:50.919921','42','Asiento object (42)',1,'[{\"added\": {}}]',8,1),(101,'2020-05-30 19:48:56.176525','43','Asiento object (43)',1,'[{\"added\": {}}]',8,1),(102,'2020-05-30 19:49:01.380188','44','Asiento object (44)',1,'[{\"added\": {}}]',8,1),(103,'2020-05-30 19:49:06.387541','45','Asiento object (45)',1,'[{\"added\": {}}]',8,1),(104,'2020-05-30 19:49:12.412518','46','Asiento object (46)',1,'[{\"added\": {}}]',8,1),(105,'2020-05-30 19:49:18.482657','47','Asiento object (47)',1,'[{\"added\": {}}]',8,1),(106,'2020-05-30 19:49:23.744380','48','Asiento object (48)',1,'[{\"added\": {}}]',8,1),(107,'2020-05-30 19:49:28.491734','49','Asiento object (49)',1,'[{\"added\": {}}]',8,1),(108,'2020-05-30 19:50:18.874613','50','Asiento object (50)',1,'[{\"added\": {}}]',8,1),(109,'2020-05-30 19:50:25.557933','51','Asiento object (51)',1,'[{\"added\": {}}]',8,1),(110,'2020-05-30 19:50:35.930821','52','Asiento object (52)',1,'[{\"added\": {}}]',8,1),(111,'2020-05-30 19:51:14.077931','53','Asiento object (53)',1,'[{\"added\": {}}]',8,1),(112,'2020-05-30 19:51:21.010144','54','Asiento object (54)',1,'[{\"added\": {}}]',8,1),(113,'2020-05-30 19:51:28.391071','55','Asiento object (55)',1,'[{\"added\": {}}]',8,1),(114,'2020-05-30 19:51:33.666760','56','Asiento object (56)',1,'[{\"added\": {}}]',8,1),(115,'2020-05-30 19:51:38.518807','57','Asiento object (57)',1,'[{\"added\": {}}]',8,1),(116,'2020-05-30 19:51:45.203816','58','Asiento object (58)',1,'[{\"added\": {}}]',8,1),(117,'2020-05-30 19:55:06.279650','59','Asiento object (59)',1,'[{\"added\": {}}]',8,1),(118,'2020-05-30 19:55:13.476373','60','Asiento object (60)',1,'[{\"added\": {}}]',8,1),(119,'2020-05-30 19:55:17.938370','61','Asiento object (61)',1,'[{\"added\": {}}]',8,1),(120,'2020-05-30 19:55:22.944585','62','Asiento object (62)',1,'[{\"added\": {}}]',8,1),(121,'2020-05-30 19:55:27.731377','63','Asiento object (63)',1,'[{\"added\": {}}]',8,1),(122,'2020-05-30 19:55:34.271966','64','Asiento object (64)',1,'[{\"added\": {}}]',8,1),(123,'2020-05-30 20:10:35.280918','65','Asiento object (65)',1,'[{\"added\": {}}]',8,1),(124,'2020-05-30 20:10:41.349330','66','Asiento object (66)',1,'[{\"added\": {}}]',8,1),(125,'2020-05-30 20:10:46.074508','67','Asiento object (67)',1,'[{\"added\": {}}]',8,1),(126,'2020-05-30 20:10:52.385297','68','Asiento object (68)',1,'[{\"added\": {}}]',8,1),(127,'2020-05-30 20:10:58.084277','69','Asiento object (69)',1,'[{\"added\": {}}]',8,1),(128,'2020-05-30 20:11:03.811844','70','Asiento object (70)',1,'[{\"added\": {}}]',8,1),(129,'2020-05-30 20:11:12.599497','71','Asiento object (71)',1,'[{\"added\": {}}]',8,1),(130,'2020-05-30 20:11:17.324869','72','Asiento object (72)',1,'[{\"added\": {}}]',8,1),(131,'2020-05-30 20:11:22.127704','73','Asiento object (73)',1,'[{\"added\": {}}]',8,1),(132,'2020-05-30 20:11:27.236656','74','Asiento object (74)',1,'[{\"added\": {}}]',8,1),(133,'2020-05-30 20:11:32.117049','75','Asiento object (75)',1,'[{\"added\": {}}]',8,1),(134,'2020-05-30 20:11:36.622539','76','Asiento object (76)',1,'[{\"added\": {}}]',8,1),(135,'2020-05-30 20:11:40.874943','77','Asiento object (77)',1,'[{\"added\": {}}]',8,1),(136,'2020-05-30 20:11:45.856900','78','Asiento object (78)',1,'[{\"added\": {}}]',8,1),(137,'2020-05-30 20:11:59.077668','79','Asiento object (79)',1,'[{\"added\": {}}]',8,1),(138,'2020-05-30 20:12:08.704988','80','Asiento object (80)',1,'[{\"added\": {}}]',8,1),(139,'2020-05-30 20:12:13.937590','81','Asiento object (81)',1,'[{\"added\": {}}]',8,1),(140,'2020-05-30 20:12:18.930565','82','Asiento object (82)',1,'[{\"added\": {}}]',8,1),(141,'2020-05-30 20:12:25.495778','83','Asiento object (83)',1,'[{\"added\": {}}]',8,1),(142,'2020-05-30 20:12:30.116473','84','Asiento object (84)',1,'[{\"added\": {}}]',8,1),(143,'2020-05-30 20:12:34.793998','85','Asiento object (85)',1,'[{\"added\": {}}]',8,1),(144,'2020-05-30 20:12:45.543377','86','Asiento object (86)',1,'[{\"added\": {}}]',8,1),(145,'2020-05-30 20:12:51.543312','87','Asiento object (87)',1,'[{\"added\": {}}]',8,1),(146,'2020-05-30 20:12:56.595231','88','Asiento object (88)',1,'[{\"added\": {}}]',8,1),(147,'2020-05-30 20:37:53.432908','1','Menor de Edad',1,'[{\"added\": {}}]',16,1),(148,'2020-05-30 20:38:00.923444','2','General',1,'[{\"added\": {}}]',16,1),(149,'2020-05-30 20:38:09.441624','3','Tercera Edad',1,'[{\"added\": {}}]',16,1),(150,'2020-05-31 16:09:27.460808','1','Combo Informático',1,'[{\"added\": {}}]',12,1),(151,'2020-05-31 16:10:26.380291','1','Combo Informático',2,'[{\"changed\": {\"fields\": [\"Precio\"]}}]',12,1),(152,'2020-05-31 16:11:48.201454','2','Combo Leng en Familia',1,'[{\"added\": {}}]',12,1),(153,'2020-05-31 16:12:34.799791','3','Combo caliente',1,'[{\"added\": {}}]',12,1),(154,'2020-05-31 16:13:06.417660','4','Combo Caliente Caliente',1,'[{\"added\": {}}]',12,1),(155,'2020-05-31 16:13:21.959775','3','Combo Caliente',2,'[{\"changed\": {\"fields\": [\"Nombre\", \"Descripcion\"]}}]',12,1),(156,'2020-05-31 16:14:43.238036','5','Combo Acompañado',1,'[{\"added\": {}}]',12,1),(157,'2020-05-31 16:15:30.468490','6','Combo Enamorado',1,'[{\"added\": {}}]',12,1),(158,'2020-05-31 16:15:36.503872','6','Combo Enamorado',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',12,1);
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
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(12,'combos','combo'),(13,'combos','entrada'),(5,'contenttypes','contenttype'),(14,'factura','comprascombos'),(17,'factura','comprasentradas'),(15,'factura','factura'),(8,'pelicula','asiento'),(16,'pelicula','entrada'),(9,'pelicula','funcion'),(7,'pelicula','pelicula'),(11,'pelicula','reservarasientos'),(10,'pelicula','sala'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-05-28 21:35:53.471853'),(2,'auth','0001_initial','2020-05-28 21:36:02.899499'),(3,'admin','0001_initial','2020-05-28 21:36:39.305712'),(4,'admin','0002_logentry_remove_auto_add','2020-05-28 21:36:44.762021'),(5,'admin','0003_logentry_add_action_flag_choices','2020-05-28 21:36:44.850601'),(6,'contenttypes','0002_remove_content_type_name','2020-05-28 21:36:54.950830'),(7,'auth','0002_alter_permission_name_max_length','2020-05-28 21:37:01.522834'),(8,'auth','0003_alter_user_email_max_length','2020-05-28 21:37:02.381173'),(9,'auth','0004_alter_user_username_opts','2020-05-28 21:37:02.528775'),(10,'auth','0005_alter_user_last_login_null','2020-05-28 21:37:06.053961'),(11,'auth','0006_require_contenttypes_0002','2020-05-28 21:37:06.232483'),(12,'auth','0007_alter_validators_add_error_messages','2020-05-28 21:37:06.414997'),(13,'auth','0008_alter_user_username_max_length','2020-05-28 21:37:11.242226'),(14,'auth','0009_alter_user_last_name_max_length','2020-05-28 21:37:14.813687'),(15,'auth','0010_alter_group_name_max_length','2020-05-28 21:37:15.953480'),(16,'auth','0011_update_proxy_permissions','2020-05-28 21:37:16.207798'),(17,'pelicula','0001_initial','2020-05-28 21:37:18.493228'),(18,'pelicula','0002_auto_20200528_1732','2020-05-28 21:37:20.052576'),(19,'sessions','0001_initial','2020-05-28 21:37:22.429808'),(20,'combos','0001_initial','2020-05-30 16:42:15.419638'),(21,'combos','0002_delete_pelicula','2020-05-30 16:42:16.738188'),(22,'combos','0003_auto_20200530_0424','2020-05-30 16:42:17.043582'),(23,'factura','0001_initial','2020-05-30 16:42:19.557824'),(24,'factura','0002_auto_20200530_0425','2020-05-30 16:42:19.734952'),(25,'pelicula','0003_auto_20200530_0229','2020-05-30 16:42:39.048634'),(26,'pelicula','0004_auto_20200530_0237','2020-05-30 16:42:56.228571'),(27,'pelicula','0005_auto_20200530_0419','2020-05-30 16:42:57.179392'),(28,'pelicula','0006_auto_20200530_0420','2020-05-30 16:42:57.531496'),(29,'pelicula','0007_auto_20200530_0422','2020-05-30 16:42:57.927733'),(30,'combos','0004_auto_20200530_1632','2020-05-30 20:33:20.802994'),(31,'pelicula','0008_auto_20200530_1632','2020-05-30 20:33:22.300267'),(32,'factura','0003_auto_20200530_1632','2020-05-30 20:33:34.437335');
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
INSERT INTO `django_session` VALUES ('9s7nvf22xa7s9uli07n8cesxhvyfcoji','N2FiMWNkYzhlMzliOTliOTE1NTMzOTdmNmYzYTdhMmY3N2I2MGM4Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3ZjkzZWE1MzJlZWY5NDQwYjczNzA3Yjg5NmVkMWU4NTJlZjNmZmU4In0=','2020-06-11 21:39:34.568544'),('pgple7zysw1i1c5v6052yxnzpncn0fg9','N2FiMWNkYzhlMzliOTliOTE1NTMzOTdmNmYzYTdhMmY3N2I2MGM4Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3ZjkzZWE1MzJlZWY5NDQwYjczNzA3Yjg5NmVkMWU4NTJlZjNmZmU4In0=','2020-06-12 17:24:44.251055'),('zrd28rx3slefi7n858lu9gh1e697z3fe','N2FiMWNkYzhlMzliOTliOTE1NTMzOTdmNmYzYTdhMmY3N2I2MGM4Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3ZjkzZWE1MzJlZWY5NDQwYjczNzA3Yjg5NmVkMWU4NTJlZjNmZmU4In0=','2020-06-14 03:30:35.531493');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_comprascombos`
--

DROP TABLE IF EXISTS `factura_comprascombos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_comprascombos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `id_combos_id` int NOT NULL,
  `id_factura_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `factura_comprascombos_id_combos_id_4d0e9547_fk_combos_combo_id` (`id_combos_id`),
  KEY `factura_comprascombo_id_factura_id_f955b6db_fk_factura_f` (`id_factura_id`),
  CONSTRAINT `factura_comprascombo_id_factura_id_f955b6db_fk_factura_f` FOREIGN KEY (`id_factura_id`) REFERENCES `factura_factura` (`id`),
  CONSTRAINT `factura_comprascombos_id_combos_id_4d0e9547_fk_combos_combo_id` FOREIGN KEY (`id_combos_id`) REFERENCES `combos_combo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_comprascombos`
--

LOCK TABLES `factura_comprascombos` WRITE;
/*!40000 ALTER TABLE `factura_comprascombos` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_comprascombos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_comprasentradas`
--

DROP TABLE IF EXISTS `factura_comprasentradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_comprasentradas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_asiento_id` int NOT NULL,
  `id_entrada_id` int NOT NULL,
  `id_factura_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `factura_comprasentra_id_asiento_id_ab0f053c_fk_pelicula_` (`id_asiento_id`),
  KEY `factura_comprasentra_id_entrada_id_9639526c_fk_pelicula_` (`id_entrada_id`),
  KEY `factura_comprasentra_id_factura_id_a30f0691_fk_factura_f` (`id_factura_id`),
  CONSTRAINT `factura_comprasentra_id_asiento_id_ab0f053c_fk_pelicula_` FOREIGN KEY (`id_asiento_id`) REFERENCES `pelicula_asiento` (`id`),
  CONSTRAINT `factura_comprasentra_id_entrada_id_9639526c_fk_pelicula_` FOREIGN KEY (`id_entrada_id`) REFERENCES `pelicula_entrada` (`id`),
  CONSTRAINT `factura_comprasentra_id_factura_id_a30f0691_fk_factura_f` FOREIGN KEY (`id_factura_id`) REFERENCES `factura_factura` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_comprasentradas`
--

LOCK TABLES `factura_comprasentradas` WRITE;
/*!40000 ALTER TABLE `factura_comprasentradas` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_comprasentradas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_factura`
--

DROP TABLE IF EXISTS `factura_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_factura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_compra` date NOT NULL,
  `id_funcion_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `factura_factura_id_funcion_id_b6a76d08_fk_pelicula_funcion_id` (`id_funcion_id`),
  CONSTRAINT `factura_factura_id_funcion_id_b6a76d08_fk_pelicula_funcion_id` FOREIGN KEY (`id_funcion_id`) REFERENCES `pelicula_funcion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_factura`
--

LOCK TABLES `factura_factura` WRITE;
/*!40000 ALTER TABLE `factura_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_asiento`
--

DROP TABLE IF EXISTS `pelicula_asiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula_asiento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fila` int NOT NULL,
  `columna` int NOT NULL,
  `id_sala_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pelicula_asiento_id_sala_id_4862913f_fk_pelicula_sala_id` (`id_sala_id`),
  CONSTRAINT `pelicula_asiento_id_sala_id_4862913f_fk_pelicula_sala_id` FOREIGN KEY (`id_sala_id`) REFERENCES `pelicula_sala` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_asiento`
--

LOCK TABLES `pelicula_asiento` WRITE;
/*!40000 ALTER TABLE `pelicula_asiento` DISABLE KEYS */;
INSERT INTO `pelicula_asiento` VALUES (1,1,1,1),(2,1,2,1),(3,1,3,1),(4,1,4,1),(5,1,5,1),(6,1,6,1),(7,1,7,1),(8,1,8,1),(9,2,1,1),(10,2,2,1),(11,2,3,1),(12,2,4,1),(13,2,5,1),(14,2,6,1),(15,2,7,1),(16,2,8,1),(17,3,1,1),(18,3,2,1),(19,3,3,1),(20,3,4,1),(21,3,5,1),(22,3,6,1),(23,3,7,1),(24,3,8,1),(25,1,1,2),(26,1,2,2),(27,1,3,2),(28,1,4,2),(29,2,1,2),(30,2,2,2),(31,2,3,2),(32,2,4,2),(33,3,1,2),(34,3,2,2),(35,3,3,2),(36,3,4,2),(37,4,1,2),(38,4,2,2),(39,4,3,2),(40,4,4,2),(41,5,1,2),(42,5,2,2),(43,5,3,2),(44,5,4,2),(45,6,1,2),(46,6,2,2),(47,6,3,2),(48,6,4,2),(49,7,1,2),(50,7,2,2),(51,7,3,2),(52,7,4,2),(53,1,1,3),(54,1,2,3),(55,1,3,3),(56,1,4,3),(57,1,5,3),(58,1,6,3),(59,2,1,3),(60,2,2,3),(61,2,3,3),(62,2,4,3),(63,2,5,3),(64,2,6,3),(65,3,1,3),(66,3,2,3),(67,3,3,3),(68,3,4,3),(69,3,5,3),(70,3,6,3),(71,1,1,4),(72,1,2,4),(73,1,3,4),(74,1,4,4),(75,1,5,4),(76,1,6,4),(77,2,1,4),(78,2,2,4),(79,2,3,4),(80,2,4,4),(81,2,5,4),(82,2,6,4),(83,3,1,4),(84,3,2,4),(85,3,3,4),(86,3,4,4),(87,3,5,4),(88,3,6,4);
/*!40000 ALTER TABLE `pelicula_asiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_entrada`
--

DROP TABLE IF EXISTS `pelicula_entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula_entrada` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) NOT NULL,
  `precio` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_entrada`
--

LOCK TABLES `pelicula_entrada` WRITE;
/*!40000 ALTER TABLE `pelicula_entrada` DISABLE KEYS */;
INSERT INTO `pelicula_entrada` VALUES (1,'Menor de Edad',5),(2,'General',10),(3,'Tercera Edad',4);
/*!40000 ALTER TABLE `pelicula_entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_funcion`
--

DROP TABLE IF EXISTS `pelicula_funcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula_funcion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time(6) NOT NULL,
  `butacas_disponibles` int NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `id_pelicula_id` int NOT NULL,
  `id_sala_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pelicula_funcion_id_sala_id_c8b9d374_fk_pelicula_sala_id` (`id_sala_id`),
  KEY `pelicula_funcion_id_pelicula_id_0c65fc65_fk_pelicula_pelicula_id` (`id_pelicula_id`),
  CONSTRAINT `pelicula_funcion_id_pelicula_id_0c65fc65_fk_pelicula_pelicula_id` FOREIGN KEY (`id_pelicula_id`) REFERENCES `pelicula_pelicula` (`id`),
  CONSTRAINT `pelicula_funcion_id_sala_id_c8b9d374_fk_pelicula_sala_id` FOREIGN KEY (`id_sala_id`) REFERENCES `pelicula_sala` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_funcion`
--

LOCK TABLES `pelicula_funcion` WRITE;
/*!40000 ALTER TABLE `pelicula_funcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `pelicula_funcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_pelicula`
--

DROP TABLE IF EXISTS `pelicula_pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula_pelicula` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `sinopsis` longtext NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `fecha_estreno` date NOT NULL,
  `fecha_salida` date NOT NULL,
  `duracion` time(6) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_pelicula`
--

LOCK TABLES `pelicula_pelicula` WRITE;
/*!40000 ALTER TABLE `pelicula_pelicula` DISABLE KEYS */;
INSERT INTO `pelicula_pelicula` VALUES (1,'Avengers: Endgame','Los Vengadores restantes deben encontrar una manera de recuperar a sus aliados para un enfrentamiento épico con Thanos, el malvado que diezmó el planeta y el universo.','Acción','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiC3mSrAdG2_Tkuz5CbCm2TA-wYikac3dOPVlzb5jCk1gqsHOD','2020-04-22','2020-08-31','00:03:02.000000',1),(5,'Minions: The Rise of Gru','En los años 70, Gru crece siendo un gran admirador de \"Los salvajes seis\", un supergrupo de villanos. Para demostrarles que puede ser malvado, Gru idea un plan con la esperanza de formar parte de la banda. Por suerte, cuenta con la ayuda de sus fieles seguidores, los Minions, siempre dispuestos a sembrar el caos.','Animación','https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSstyN1_KkleU06pFzCU1eX2DnLVdYSkeXmEJbqhYOGHB5nUUQ1','2021-07-01','2021-09-01','00:01:30.000000',1),(6,'Wonder Woman 2','Diana Prince, conocida como Wonder Woman se enfrenta a Cheetah, una villana que posee fuerza y agilidad sobrehumanas.','Aventura','https://es.web.img3.acsta.net/pictures/20/03/25/15/45/1789056.jpg','2020-08-12','2020-10-12','00:02:00.000000',1),(7,'Hotel Transylvania 3: Monstruos de Vacaciones','Drácula se enamora de una mujer misteriosa durante un crucero en el que toda la familia de monstruos se ha embarcado para disfrutar de unas vacaciones. ¡Lo que no sabe es que es la descendiente de una saga de cazadores de vampiros!','Animación','https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRqa7i5MFUcdzcC9AYrt4dXoXO8eObartH_mANk9_mz4_sf15v0','2020-04-28','2020-07-28','00:01:37.000000',1),(8,'Escuadrón de la muerte','El soldado Andrew Briggman es un ambicioso miembro de infantería que acaba de llegar a Afganistán. Tras su ascenso a segundo de su unidad, comienza a ser testigo de los crímenes contra los derechos humanos que se cometen por parte de su propio pelotón. Briggman se verá obligado a decidir entre denunciarlo, arriesgando su vida de inmediato, o callar y ser partícipe de tales crímenes.','Acción','https://pics.filmaffinity.com/Escuadr_n_de_la_muerte-986450096-large.jpg','2020-02-13','2020-06-13','00:01:27.000000',1),(9,'Spider-Man: De regreso a casa','Peter Parker asume su nueva identidad como Spider-Man y regresa a vivir con su tía después de su aventura con los Vengadores. Al volver, mientras sigue bajo la tutela de Tony Stark, descubre que ha surgido un nuevo y despiadado enemigo que pretende destruir todo lo que ama: el Buitre.','Aventura','https://vignette.wikia.nocookie.net/spiderman/images/2/21/Spider_Man_Homecoming_One_Sheet_1.png/revision/latest?cb=20170524163000&path-prefix=es','2020-05-26','2020-07-26','00:02:13.000000',1),(10,'Mulán','El emperador chino emite un decreto que exige que cada hogar debe reclutar a un varón para luchar con el ejército imperial en la guerra contra los Hunos. Para salvar a su anciano padre de este deber, su única hija Fa Mulán se hace pasar por soldado y toma su lugar. La joven se someterá a un duro entrenamiento hasta hacerse merecedora de la estima y de la confianza del resto de su escuadrón.','Aventura','https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSPO5lOKd7RPvg5wdNS6ZYMfC392opn2pGBxlX0My_nmXHf1RSI','2020-03-20','2020-06-20','00:02:00.000000',1),(11,'Bad Boys para siempre','Los policías de la vieja escuela Mike Lowery y Marcus Burnett vuelven a patrullar juntos para derrotar al líder vicioso de un cartel de drogas de Miami. El recién creado equipo de élite AMMO del departamento de policía de Miami junto con Mike y Marcus se enfrentan al despiadado Armando Armas.','Acción','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQdTJl17J5_VdMVx85Krry9e2j2KZKkuuE92ejNVAtHsNGN-3l8','2020-01-07','2020-06-07','00:02:04.000000',1),(12,'Sonic la película','Sonic intenta navegar por las complejidades de la vida en la Tierra con su nuevo mejor amigo, un humano llamado Tom Wachowski. Pronto deben unir fuerzas para evitar que el malvado Dr. Robotnik capture a Sonic y use sus poderes para dominar el mundo.','Comedia','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0ijOSqW5zTSrLn_TTyoBBR6Fi8WkMkndqmj6KpihRgPA2isJQ','2020-02-09','2020-07-09','00:01:40.000000',1),(13,'¡Scooby!','Con cientos de casos resueltos y aventuras compartidas, Scooby y la pandilla se enfrentan al misterio más grande y desafiante de todos los tiempos: un complot para liberar al perro fantasma Cerberus en el mundo. Mientras compiten para detener esta escasez de perros global, la pandilla descubre que Scooby tiene un legado secreto y un destino épico más grande de lo que cualquiera podría haber imaginado.','Animación','https://e00-marca.uecdn.es/assets/multimedia/imagenes/2020/03/04/15833407274962.jpg','2020-05-13','2020-07-13','00:01:34.000000',1),(14,'Amenaza en lo profundo','Seis científicos intentan escapar cuando un terremoto destroza su instalación submarina. La única salida posible implica caminar por el lecho marino, pero unas criaturas monstruosas acechan en la profundidad del océano.','Terror','https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTocp6XEMxbMDBNd1ysOfD6t3ttes1PJ5QfFaUkhTBQ6KwKuSZC','2020-04-08','2020-07-08','00:01:35.000000',1),(15,'Black Widow','Al nacer, la Viuda Negra, también conocida como Natasha Romanova, se entrega a la KGB para convertirse en su agente definitivo. Cuando la URSS se separa, el gobierno intenta matarla mientras la acción se traslada a la actual Nueva York.','Acción','https://es.web.img3.acsta.net/pictures/20/03/09/18/28/5915477.jpg','2020-04-29','2020-06-29','00:02:00.000000',1),(16,'Rápidos y Furiosos 9','La novena película Fast and Furious sigue las emocionantes aventuras y carreras del equipo de amigos, tras la traición de Dominic Toretto.','Acción','https://www.procinal.com/uploads/PELICULAS/Img_movies/Img_360x500/rapidosyfuriosos9.jpg','2020-05-20','2020-08-20','00:02:15.000000',1),(17,'Godzilla vs. Kong','Godzilla y Kong, dos de las fuerzas más poderosas de un planeta habitado por aterradoras criaturas, se enfrentan en un espectacular combate que sacude los cimientos de la humanidad. Monarch se embarca en una misión de alto riesgo y pone rumbo hacia territorios inexplorados para descubrir los orígenes de estos dos titanes, en un último esfuerzo por tratar de salvar a dos bestias que parecen tener las horas contadas sobre la faz de la Tierra.','Ciencia Ficción','https://i.pinimg.com/originals/ee/9a/bd/ee9abd1e77f11149e2eb336c664df783.jpg','2020-11-18','2021-01-18','00:02:00.000000',1),(18,'Gretel y Hansel','A principios del siglo XIV en Baviera, Gretel y Hansel viven en la miseria desde que su padre falleció. Por la falta de recursos su padrastro se embarca con ellos en una huída por el bosque donde un cazador les indica el camino seguro. Así, los hermanos encontrarán la cabaña de Holda, una simpática mujer. Todo va bien y la comida abunda, pero algo les huele mal. Gretel y Hansel se vana enfrentar a sus peores miedos.','Terror','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkWKtZSg_u563SNEaRjLt6dU-SCsT3QR3ekApe_a6vLPJ9ejiC','2020-03-30','2020-06-30','00:01:27.000000',1),(19,'El conjuro 3','La nueva historia se enmarcará en un caso real al que los Warren se enfrentaron en 1981, donde un hombre fue acusado de asesinato y su defensa fue manifestar que cometió el crimen bajo la influencia de varias decenas de demonios.','Terror','https://i.pinimg.com/564x/95/f6/a4/95f6a4945b35e1739ff82634da6865b5.jpg','2020-09-10','2020-11-10','00:02:00.000000',1),(20,'Violet y Finch','Dos adolescentes luchan con las heridas emocionales y físicas de su pasado. Juntos, descubren que hasta los momentos más pequeños pueden ser relevantes.','Drama','https://www.lavanguardia.com/r/GODO/LV/p7/WebSite/2020/03/03/Recortada/img_jdelriov_20200303-112904_imagenes_lv_terceros_91s-vjhht2l-283-kMU--656x1012@LaVanguardia-Web.jpg','2020-02-28','2020-07-20','00:01:48.000000',1),(21,'Free Guy','Un cajero de un banco descubre que en realidad es un personaje sin papel dentro de un brutal videojuego de mundo interactivo.','Comedia','https://pics.filmaffinity.com/Free_Guy-226404946-large.jpg','2020-07-01','2020-09-01','00:02:00.000000',1),(22,'Te quiero, imbécil','Contamos cómo una nueva generación de hombres de 30 años se sienten perdidos frente al nuevo rol de la mujer y al suyo propio. En realidad, la sociedad ha cambiado y, con ella, las relaciones. El \"machote\" ya no está de moda y hay que adaptarse a los nuevos referentes masculinos. Marcos, intentará convertirse en un hombre actual de los que se depila y se interesa por la moda.','Comedia','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRL1ShRbw-eTUJHRTvODXX5JlOduvw0G1u52jz_uMUfIa0jdiOw','2020-06-02','2020-08-02','00:02:00.000000',1),(23,'Divino amor','Una mujer religiosa usa su posición en el trabajo para ayudar a las parejas con dificultades a salvar su matrimonio. Ella hace todo lo posible para que los clientes asistan a una terapia de reconciliación religiosa en el grupo de \" Amor Divino\". Mientras, se enfrenta a su propia crisis personal.','Drama','https://pics.filmaffinity.com/Divino_Amor-560557785-large.jpg','2020-06-27','2020-08-27','00:01:41.000000',1),(24,'The Room','Matt y Kate compran una casa aislada. A medida que se mudan, descubren una habitación extraña que les da un número ilimitado de deseos materiales. Pero, como Kate ha tenido dos abortos involuntarios, lo que más extrañan es un niño.','Terror','https://pics.filmaffinity.com/the_room-379033639-large.jpg','2020-09-19','2020-11-19','00:01:39.000000',1),(25,'Escape Room: sin salida','Seis personas quedan atrapadas en un escape room cuyo creador ha diseñado una trampa mortal en cada habitación. No saben por qué les está haciendo esto, pero sí saben que un solo error les costará la vida.','Terror','https://http2.mlstatic.com/escape-room-pelicula-digital-2019-pago-movil-latino-D_NQ_NP_927952-MLV29348042935_022019-F.jpg','2020-02-04','2020-06-04','00:01:39.000000',1),(26,'El jardín secreto','Una amistad surge entre una huérfana y el hijo de su tío, cuando ella descubre y cuida de un jardín abandonado.','Drama','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR8UTDt_fSaZ-Dyq4bPNwgsZSKFSZISMOgoL14suoWSnbNIf0Jh','2020-04-08','2020-06-08','00:01:46.000000',1),(27,'La cabaña','Después de sufrir una tragedia familiar, Mack Phillips cae en una profunda depresión que le lleva a cuestionar todas sus creencias. Sumido en una crisis de fe, recibe una enigmática carta donde un misterioso personaje le cita en una cabaña abandonada en lo más profundo de los bosques de Oregón. A pesar de sus dudas, Mack viaja a la cabaña, donde se encontrará con alguien inesperado.','Drama','https://es.web.img3.acsta.net/pictures/17/07/05/11/16/462370.jpg','2020-04-04','2020-07-04','00:02:13.000000',1),(28,'El hoyo','En el futuro, los prisioneros se alojan en celdas verticales, observando cómo los presos de las celdas superiores son alimentados mientras los de abajo mueren de hambre. Una jungla de supervivencia donde solo hay tres tipos de personas: los que están arriba, los que están abajo y los que deciden saltar, incapaces de soportar esa agonía por más tiempo.','Ciencia Ficción','https://pics.filmaffinity.com/El_hoyo-987825598-large.jpg','2020-02-21','2020-06-21','00:01:34.000000',1),(29,'Los Croods 2','La pintoresca familia prehistórica de Los Croods vuelve a hacer de las suyas. Este divertido clan formado por la joven e inquieta Eep, su gruñón padre Grug, su comprensiva aunque despistada madre Ugga, además del friki Thunk y la bebé Sandi, regresan a la gran pantalla en una nueva aventura troglodítica, recordándonos la importancia de la familia... Y lo poco que hemos evolucionado. Esta vez, Los Croods se enfrentarán a su mayor amenaza desde que abandonaron la cueva: otra familia.','Animación','https://pics.filmaffinity.com/Los_Croods_Una_nueva_era-752893207-large.jpg','2020-12-23','2021-02-23','00:01:38.000000',1),(30,'Si supieras','Una joven y tímida muchacha de la escuela secundaria ayuda a un amigo a escribir una carta de amor para una persona que ambos desean.','Romance','https://pmcdeadline2.files.wordpress.com/2020/04/thoi_vertical_main_rgb_en-us.jpg?w=691&h=1024','2020-05-01','2020-07-01','00:01:44.000000',1),(31,'Love Wedding Repeat','Una exnovia enfadada. Un invitado no deseado. Un secreto. Una pastilla que no está donde debería. El gran amor que se escapó. Dos versiones alternativas de una misma boda en las que Jack (Sam Claflin), hermano de la novia, tendrá que lidiar con una exnovia un poco alterada (Freida Pinto), un invitado no deseado que guarda un secreto, una pastilla para dormir en el lugar incorrecto y la chica que lo plantó (Olivia Munn). Cada una con un final distinto... Remake de la francesa \'Plan de Table\' (2012)','Romance','https://pics.filmaffinity.com/Amor_Boda_Azar-707127718-large.jpg','2020-04-10','2020-07-10','00:01:40.000000',1),(32,'Modo Avión','Una influencer choca su auto mientras usa su teléfono celular y se exilia a la granja de su abuelo, donde se aleja de la vida lejos de las redes sociales.','Comedia','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSkG0OdI0oQ-Ud8yOPGt1E5zOIZTcIo6P_A4o9_nOJdyN9nbisB','2020-04-23','2020-06-23','00:01:35.000000',1),(33,'West Side Story','Nueva versión del legendario musical \'West Side Story\' sobre el enfrentamiento entre dos bandas callejeras de Nueva York, adaptación de una famosa obra de teatro de Broadway que modernizaba el relato de \"Romeo y Julieta\" de Shakespeare','Romance','https://es.web.img2.acsta.net/pictures/19/06/17/16/53/3841963.jpg','2020-12-16','2021-02-16','00:02:00.000000',1),(34,'18 Presents','Basada en la historia real de Elisa Girotto, una mujer italiana que falleció a los 40 años, dejándole a su hija recién nacida un regalo para acompañarla en cada uno de sus cumpleaños hasta que cumpliese 18 años.','Drama','https://pics.filmaffinity.com/18_regali-782967126-large.jpg','2020-03-02','2020-07-02','00:01:55.000000',1),(35,'Dolittle','El Dr. John Dolittle vive solo detrás de los muros de su exuberante mansión en la Inglaterra del siglo XIX. Su única compañía proviene de una variedad de animales exóticos con los que habla a diario. Pero cuando la joven reina Victoria se enferma gravemente, el médico excéntrico y sus amigos peludos se embarcan en una aventura épica en una isla mítica para encontrar la cura.','Aventura','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQwHXNRv8Q3mlztfhOGvmZZX7P4iNnSiG6BGkbsazDx5QZfgf_k','2020-03-02','2020-06-20','00:01:41.000000',1),(36,'Los nuevos mutantes','La historia se centra en los Nuevos Mutantes, un grupo de mutantes formado por los primeros graduados en la escuela de Charles Xavier.','Ciencia Ficción','https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRcEeuBLIoFxTCRrBu0Fqg2X3XLntcdl57L8L-jyJwIfeBQObgx','2020-04-03','2020-07-03','00:01:39.000000',1),(37,'Invasión: el fin de los tiempos','Tres años después de la invasión extraterrestre, Yulia ha desarrollado habilidades especiales. Sus poderes no solo atraen la atención del Gobierno ruso, también la de entidades alienígenas dispuestas a cualquier cosa por capturarla.','Ciencia Ficción','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcS9RZW8g3sG_s1gXAORVWZirdJxFjo-JnmSHJja_REJ9GmH5Cgy','2020-04-09','2020-07-09','00:02:13.000000',1),(38,'Dune','Dune nos cuenta la historia de Paul Atreides, un joven brillante que ha nacido con un destino mucho más grande que él mismo, y deberá viajar al planeta más peligroso del universo para asegurar el futuro de su familia y de su gente.','Ciencia Ficción','https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2018/07/dune_2.jpg?itok=lafzPkTx','2020-11-18','2021-01-18','00:02:00.000000',1),(39,'Artemis Fowl: el mundo subterráneo','Adaptación del libro de Eoin Colfer. Artemis Fowl es un joven irlandés descendiente de una larga línea de criminales intelectuales. Artemis rapta a Holly Short, un hada, con la intención de pedir un rescate que le permita salvar a su padre. Una vez logra cumplir sus intenciones, se embarca en una aventura que le llevará a luchar contra el maléfico hada Opal Koboi.','Aventura','https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2020/03/artemis-fowl-caratula-1881595.jpg?itok=q-roDoRH','2020-05-29','2020-07-29','00:01:55.000000',1),(40,'El llamado salvaje','En el Yukón canadiense en la década de 1890 se está produciendo la fiebre del oro. Los perros de trineo que pueden cubrir el terreno difícil a lo largo del río Klondike son codiciados por muchos y se convierten en un activo valioso. Como resultado, Buck es robado y vendido.','Aventura','https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRaOjB451KHnAsXZDNzjdiVVFkOAnoOxlOOJY-wzEM2ZwM4ITQT','2020-02-19','2020-06-19','00:01:40.000000',1),(41,'Soul','Un músico que ha perdido su pasión por la música es transportado fuera de su cuerpo y debe encontrar el camino de regreso con la ayuda de un alma infantil que aprende sobre sí misma.','Animación','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQZihNrmaDPhGzwiJ90h2JOf1aRQbk398YGPV7yEjMBTY_gGCfI','2020-06-17','2020-08-17','00:02:00.000000',1),(42,'The Lovebirds','A punto de separarse, una pareja se enreda involuntariamente en un divertido y misterioso asesinato. A medida que se acercan al momento de limpiar sus nombres y resolver el caso, necesitan descubrir cómo ellos y su relación pueden sobrevivir a esa noche.','Comedia','https://cdn2-www.comingsoon.net/assets/uploads/gallery/the-lovebirds/lb_dom_online_teaser_1-sheet_street-glow.jpg','2020-04-24','2020-06-24','00:01:27.000000',1),(43,'The Photograph','Cuando la famosa fotógrafa Christina Eames muere inesperadamente, su hija Mae se queda destrozada y confusa. Cuando encuentra una fotografía escondida en una caja de seguridad, Mae decide investigar sobre la juventud de su madre, mientras comienza al mismo tiempo un apasionado e inesperado romance con un periodista, Michael Block.','Romance','https://dx35vtwkllhj9.cloudfront.net/universalstudios/the-photograph/images/regions/us/gallery/image10.jpg','2020-02-14','2020-07-14','00:01:46.000000',1),(44,'Emma','Conocemos la vida de la joven Emma Woodhouse, que vive en la Inglaterra georgiana. Emma se ocupa de emparejar, unas veces más acertadamente que otras, a sus amigos y familiares.','Romance','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRffgpCjPSTDaf1yTXbsmC7mWMqqsM2DpFyfFnTnkl55gWZhIO3','2020-02-13','2020-07-13','00:02:12.000000',1);
/*!40000 ALTER TABLE `pelicula_pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_reservarasientos`
--

DROP TABLE IF EXISTS `pelicula_reservarasientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula_reservarasientos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) NOT NULL,
  `id_asiento_id` int NOT NULL,
  `id_funcion_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pelicula_reservaasie_id_asiento_id_b784471f_fk_pelicula_` (`id_asiento_id`),
  KEY `pelicula_reservaasie_id_funcion_id_00f3ce6f_fk_pelicula_` (`id_funcion_id`),
  CONSTRAINT `pelicula_reservaasie_id_asiento_id_b784471f_fk_pelicula_` FOREIGN KEY (`id_asiento_id`) REFERENCES `pelicula_asiento` (`id`),
  CONSTRAINT `pelicula_reservaasie_id_funcion_id_00f3ce6f_fk_pelicula_` FOREIGN KEY (`id_funcion_id`) REFERENCES `pelicula_funcion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_reservarasientos`
--

LOCK TABLES `pelicula_reservarasientos` WRITE;
/*!40000 ALTER TABLE `pelicula_reservarasientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pelicula_reservarasientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_sala`
--

DROP TABLE IF EXISTS `pelicula_sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula_sala` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_sala` varchar(200) NOT NULL,
  `numero_filas` int NOT NULL,
  `numero_columnas` int NOT NULL,
  `imagen` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_sala`
--

LOCK TABLES `pelicula_sala` WRITE;
/*!40000 ALTER TABLE `pelicula_sala` DISABLE KEYS */;
INSERT INTO `pelicula_sala` VALUES (1,'Sala 2D',3,8,'https://i.imgur.com/duLgFBH.png'),(2,'Sala 3D',7,4,'https://i.imgur.com/Sm9qmv9.png'),(3,'Sala VIP',3,6,'https://i.imgur.com/qKWPSBl.png'),(4,'Sala 4DX',3,6,'https://i.imgur.com/qKWPSBl.png');
/*!40000 ALTER TABLE `pelicula_sala` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-31 13:10:18
