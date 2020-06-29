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
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Categoria',7,'add_categoria'),(26,'Can change Categoria',7,'change_categoria'),(27,'Can delete Categoria',7,'delete_categoria'),(28,'Can view Categoria',7,'view_categoria'),(29,'Can add Factura',8,'add_factura'),(30,'Can change Factura',8,'change_factura'),(31,'Can delete Factura',8,'delete_factura'),(32,'Can view Factura',8,'view_factura'),(33,'Can add Pelicula',9,'add_pelicula'),(34,'Can change Pelicula',9,'change_pelicula'),(35,'Can delete Pelicula',9,'delete_pelicula'),(36,'Can view Pelicula',9,'view_pelicula'),(37,'Can add Producto',10,'add_producto'),(38,'Can change Producto',10,'change_producto'),(39,'Can delete Producto',10,'delete_producto'),(40,'Can view Producto',10,'view_producto'),(41,'Can add Promocion',11,'add_promociones'),(42,'Can change Promocion',11,'change_promociones'),(43,'Can delete Promocion',11,'delete_promociones'),(44,'Can view Promocion',11,'view_promociones'),(45,'Can add Sucursal',12,'add_sucursal'),(46,'Can change Sucursal',12,'change_sucursal'),(47,'Can delete Sucursal',12,'delete_sucursal'),(48,'Can view Sucursal',12,'view_sucursal'),(49,'Can add Tipo Producto',13,'add_tipoproductos'),(50,'Can change Tipo Producto',13,'change_tipoproductos'),(51,'Can delete Tipo Producto',13,'delete_tipoproductos'),(52,'Can view Tipo Producto',13,'view_tipoproductos'),(53,'Can add Usuario',14,'add_usuario'),(54,'Can change Usuario',14,'change_usuario'),(55,'Can delete Usuario',14,'delete_usuario'),(56,'Can view Usuario',14,'view_usuario'),(57,'Can add Sala',15,'add_sala'),(58,'Can change Sala',15,'change_sala'),(59,'Can delete Sala',15,'delete_sala'),(60,'Can view Sala',15,'view_sala'),(61,'Can add registro promociones',16,'add_registropromociones'),(62,'Can change registro promociones',16,'change_registropromociones'),(63,'Can delete registro promociones',16,'delete_registropromociones'),(64,'Can view registro promociones',16,'view_registropromociones'),(65,'Can add registro compras',17,'add_registrocompras'),(66,'Can change registro compras',17,'change_registrocompras'),(67,'Can delete registro compras',17,'delete_registrocompras'),(68,'Can view registro compras',17,'view_registrocompras'),(69,'Can add registro combos',18,'add_registrocombos'),(70,'Can change registro combos',18,'change_registrocombos'),(71,'Can delete registro combos',18,'delete_registrocombos'),(72,'Can view registro combos',18,'view_registrocombos'),(73,'Can add registro categorias',19,'add_registrocategorias'),(74,'Can change registro categorias',19,'change_registrocategorias'),(75,'Can delete registro categorias',19,'delete_registrocategorias'),(76,'Can view registro categorias',19,'view_registrocategorias'),(77,'Can add Funcion',20,'add_funcion'),(78,'Can change Funcion',20,'change_funcion'),(79,'Can delete Funcion',20,'delete_funcion'),(80,'Can view Funcion',20,'view_funcion'),(81,'Can add Asiento',21,'add_asiento'),(82,'Can change Asiento',21,'change_asiento'),(83,'Can delete Asiento',21,'delete_asiento'),(84,'Can view Asiento',21,'view_asiento'),(85,'Can add registro asientos reservados',22,'add_registroasientosreservados'),(86,'Can change registro asientos reservados',22,'change_registroasientosreservados'),(87,'Can delete registro asientos reservados',22,'delete_registroasientosreservados'),(88,'Can view registro asientos reservados',22,'view_registroasientosreservados');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$IoI0wGs2k93C$J/oYjTfLhQZCeigemdqlxPtlKDgxuQbZKefpMfgG6xY=','2020-06-21 16:55:48.575040',1,'lengcinema','','','hola@gmail.com',1,1,'2020-06-21 16:55:40.302202');
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
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-06-21 17:51:11.416614','1','Black Widow',1,'[{\"added\": {}}]',9,1),(2,'2020-06-21 17:52:53.224375','1','Black Widow',2,'[{\"changed\": {\"fields\": [\"Imagen\"]}}]',9,1),(3,'2020-06-21 17:53:30.314136','1','Acción',1,'[{\"added\": {}}]',7,1),(4,'2020-06-21 17:53:35.782677','2','Animación',1,'[{\"added\": {}}]',7,1),(5,'2020-06-21 17:53:39.842230','3','Aventura',1,'[{\"added\": {}}]',7,1),(6,'2020-06-21 17:53:45.649995','4','Ciencia Ficción',1,'[{\"added\": {}}]',7,1),(7,'2020-06-21 17:53:50.395580','5','Comedia',1,'[{\"added\": {}}]',7,1),(8,'2020-06-21 17:53:59.786741','6','Fantasía',1,'[{\"added\": {}}]',7,1),(9,'2020-06-21 17:54:04.210497','7','Deporte',1,'[{\"added\": {}}]',7,1),(10,'2020-06-21 17:54:08.663685','8','Documental',1,'[{\"added\": {}}]',7,1),(11,'2020-06-21 17:54:13.431700','9','Drama',1,'[{\"added\": {}}]',7,1),(12,'2020-06-21 17:54:19.182939','10','Historia',1,'[{\"added\": {}}]',7,1),(13,'2020-06-21 17:54:23.948634','11','Infantil',1,'[{\"added\": {}}]',7,1),(14,'2020-06-21 17:54:27.987291','12','Musical',1,'[{\"added\": {}}]',7,1),(15,'2020-06-21 17:54:32.757562','13','Romance',1,'[{\"added\": {}}]',7,1),(16,'2020-06-21 17:54:36.935507','14','Terror',1,'[{\"added\": {}}]',7,1),(17,'2020-06-21 17:55:03.300095','1','registroCategorias object (1)',1,'[{\"added\": {}}]',19,1),(18,'2020-06-21 17:55:16.491018','2','registroCategorias object (2)',1,'[{\"added\": {}}]',19,1),(19,'2020-06-21 18:00:02.833079','2','Godzilla vs. Kong',1,'[{\"added\": {}}]',9,1),(20,'2020-06-21 18:00:28.751278','3','registroCategorias object (3)',1,'[{\"added\": {}}]',19,1),(21,'2020-06-21 18:00:36.164470','4','registroCategorias object (4)',1,'[{\"added\": {}}]',19,1),(22,'2020-06-21 18:09:48.298100','1','Entrada',1,'[{\"added\": {}}]',13,1),(23,'2020-06-21 18:09:53.025751','2','Alimento',1,'[{\"added\": {}}]',13,1),(24,'2020-06-21 18:09:56.024523','3','Combo',1,'[{\"added\": {}}]',13,1),(25,'2020-06-21 18:15:42.674291','1','Entrada Menor de Edad',1,'[{\"added\": {}}]',10,1),(26,'2020-06-21 18:16:17.637138','2','Entrada General',1,'[{\"added\": {}}]',10,1),(27,'2020-06-21 18:16:58.817380','3','Entrada Adulto Mayor',1,'[{\"added\": {}}]',10,1),(28,'2020-06-21 18:27:04.359983','4','Cotufa Pequeña',1,'[{\"added\": {}}]',10,1),(29,'2020-06-21 18:27:32.392427','5','Cotufa Mediana',1,'[{\"added\": {}}]',10,1),(30,'2020-06-21 18:27:52.210388','6','Cotufa Grande',1,'[{\"added\": {}}]',10,1),(31,'2020-06-21 18:28:18.595945','7','Refresco Pequeño',1,'[{\"added\": {}}]',10,1),(32,'2020-06-21 18:28:38.226396','8','Refresco Grande',1,'[{\"added\": {}}]',10,1),(33,'2020-06-21 18:29:19.704237','9','Golosina',1,'[{\"added\": {}}]',10,1),(34,'2020-06-21 18:29:53.559393','10','Bolsa de Maní',1,'[{\"added\": {}}]',10,1),(35,'2020-06-21 18:30:22.944962','11','Perro Caliente',1,'[{\"added\": {}}]',10,1),(36,'2020-06-21 18:30:50.684646','9','Gomitas de Azucar',2,'[{\"changed\": {\"fields\": [\"Nombre\", \"Descripcion\"]}}]',10,1),(37,'2020-06-21 18:31:54.217199','12','Combo Informático',1,'[{\"added\": {}}]',10,1),(38,'2020-06-21 18:32:20.155911','1','registroCombos object (1)',1,'[{\"added\": {}}]',18,1),(39,'2020-06-21 18:32:40.101354','2','registroCombos object (2)',1,'[{\"added\": {}}]',18,1),(40,'2020-06-21 18:33:02.014649','3','registroCombos object (3)',1,'[{\"added\": {}}]',18,1),(41,'2020-06-21 18:33:19.509948','4','registroCombos object (4)',1,'[{\"added\": {}}]',18,1),(42,'2020-06-21 18:41:31.703619','12','Combo Informático',2,'[{\"changed\": {\"fields\": [\"Descripcion\"]}}]',10,1),(43,'2020-06-21 18:42:17.248476','12','Combo Informático',2,'[{\"changed\": {\"fields\": [\"Precio\"]}}]',10,1),(44,'2020-06-21 18:44:54.725828','12','Combo Informático',2,'[{\"changed\": {\"fields\": [\"Descripcion\"]}}]',10,1),(45,'2020-06-21 21:00:55.458072','3','Wonder Woman 2',2,'[{\"changed\": {\"fields\": [\"Titulo\", \"Sinopsis\", \"Imagen\", \"Fecha estreno\", \"Fecha salida\", \"Duracion\"]}}]',9,1),(46,'2020-06-21 21:01:27.005287','5','registroCategorias object (5)',2,'[{\"changed\": {\"fields\": [\"Id pelicula\", \"Id categoria\"]}}]',19,1),(47,'2020-06-21 21:01:36.112069','6','registroCategorias object (6)',2,'[{\"changed\": {\"fields\": [\"Id pelicula\", \"Id categoria\"]}}]',19,1),(48,'2020-06-21 21:03:12.856352','4','El hombre invisible',2,'[{\"changed\": {\"fields\": [\"Titulo\", \"Sinopsis\", \"Imagen\", \"Fecha estreno\", \"Fecha salida\", \"Duracion\"]}}]',9,1),(49,'2020-06-21 21:03:30.430847','15','Suspenso',1,'[{\"added\": {}}]',7,1),(50,'2020-06-21 21:03:50.037627','9','registroCategorias object (9)',1,'[{\"added\": {}}]',19,1),(51,'2020-06-21 21:03:58.217461','10','registroCategorias object (10)',1,'[{\"added\": {}}]',19,1),(52,'2020-06-21 23:56:14.278245','1','LengCinema Sambil',1,'[{\"added\": {}}]',12,1),(53,'2020-06-21 23:57:00.996237','1','Sala 2D',1,'[{\"added\": {}}]',15,1),(54,'2020-06-21 23:57:20.669517','1','Asiento object (1)',1,'[{\"added\": {}}]',21,1),(55,'2020-06-21 23:57:28.241569','2','Asiento object (2)',1,'[{\"added\": {}}]',21,1),(56,'2020-06-21 23:57:34.017922','3','Asiento object (3)',1,'[{\"added\": {}}]',21,1),(57,'2020-06-21 23:57:39.796731','4','Asiento object (4)',1,'[{\"added\": {}}]',21,1),(58,'2020-06-21 23:57:46.747385','5','Asiento object (5)',1,'[{\"added\": {}}]',21,1),(59,'2020-06-21 23:57:53.083151','6','Asiento object (6)',1,'[{\"added\": {}}]',21,1),(60,'2020-06-21 23:57:58.240822','7','Asiento object (7)',1,'[{\"added\": {}}]',21,1),(61,'2020-06-21 23:58:04.206771','8','Asiento object (8)',1,'[{\"added\": {}}]',21,1),(62,'2020-06-21 23:58:09.296494','9','Asiento object (9)',1,'[{\"added\": {}}]',21,1),(63,'2020-06-21 23:58:18.589395','10','Asiento object (10)',1,'[{\"added\": {}}]',21,1),(64,'2020-06-21 23:58:23.085526','11','Asiento object (11)',1,'[{\"added\": {}}]',21,1),(65,'2020-06-21 23:58:27.478095','12','Asiento object (12)',1,'[{\"added\": {}}]',21,1),(66,'2020-06-21 23:58:31.619471','13','Asiento object (13)',1,'[{\"added\": {}}]',21,1),(67,'2020-06-21 23:58:37.919390','14','Asiento object (14)',1,'[{\"added\": {}}]',21,1),(68,'2020-06-21 23:58:43.083998','15','Asiento object (15)',1,'[{\"added\": {}}]',21,1),(69,'2020-06-21 23:58:50.625989','16','Asiento object (16)',1,'[{\"added\": {}}]',21,1),(70,'2020-06-21 23:59:01.711189','17','Asiento object (17)',1,'[{\"added\": {}}]',21,1),(71,'2020-06-21 23:59:07.574817','18','Asiento object (18)',1,'[{\"added\": {}}]',21,1),(72,'2020-06-21 23:59:12.177307','19','Asiento object (19)',1,'[{\"added\": {}}]',21,1),(73,'2020-06-21 23:59:16.630177','20','Asiento object (20)',1,'[{\"added\": {}}]',21,1),(74,'2020-06-21 23:59:21.032205','21','Asiento object (21)',1,'[{\"added\": {}}]',21,1),(75,'2020-06-21 23:59:26.029543','22','Asiento object (22)',1,'[{\"added\": {}}]',21,1),(76,'2020-06-21 23:59:30.595850','23','Asiento object (23)',1,'[{\"added\": {}}]',21,1),(77,'2020-06-21 23:59:36.511813','24','Asiento object (24)',1,'[{\"added\": {}}]',21,1),(78,'2020-06-22 00:00:05.998303','19','Asiento object (19)',2,'[{\"changed\": {\"fields\": [\"Columna\"]}}]',21,1),(79,'2020-06-22 00:00:15.381813','20','Asiento object (20)',2,'[{\"changed\": {\"fields\": [\"Columna\"]}}]',21,1),(80,'2020-06-22 00:00:21.701795','21','Asiento object (21)',2,'[{\"changed\": {\"fields\": [\"Fila\", \"Columna\"]}}]',21,1),(81,'2020-06-22 00:00:27.261297','21','Asiento object (21)',2,'[{\"changed\": {\"fields\": [\"Columna\"]}}]',21,1),(82,'2020-06-22 00:00:41.842196','21','Asiento object (21)',2,'[{\"changed\": {\"fields\": [\"Columna\"]}}]',21,1),(83,'2020-06-22 00:00:46.932053','22','Asiento object (22)',2,'[{\"changed\": {\"fields\": [\"Columna\"]}}]',21,1),(84,'2020-06-22 00:00:51.642034','23','Asiento object (23)',2,'[{\"changed\": {\"fields\": [\"Columna\"]}}]',21,1),(85,'2020-06-22 00:00:54.868085','24','Asiento object (24)',2,'[{\"changed\": {\"fields\": [\"Columna\"]}}]',21,1),(86,'2020-06-22 00:01:00.946960','25','Asiento object (25)',1,'[{\"added\": {}}]',21,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(21,'pelicula','asiento'),(7,'pelicula','categoria'),(8,'pelicula','factura'),(20,'pelicula','funcion'),(9,'pelicula','pelicula'),(10,'pelicula','producto'),(11,'pelicula','promociones'),(22,'pelicula','registroasientosreservados'),(19,'pelicula','registrocategorias'),(18,'pelicula','registrocombos'),(17,'pelicula','registrocompras'),(16,'pelicula','registropromociones'),(15,'pelicula','sala'),(12,'pelicula','sucursal'),(13,'pelicula','tipoproductos'),(14,'pelicula','usuario'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-06-21 16:49:32.986884'),(2,'auth','0001_initial','2020-06-21 16:49:40.228664'),(3,'admin','0001_initial','2020-06-21 16:50:14.467719'),(4,'admin','0002_logentry_remove_auto_add','2020-06-21 16:50:20.383143'),(5,'admin','0003_logentry_add_action_flag_choices','2020-06-21 16:50:20.655414'),(6,'contenttypes','0002_remove_content_type_name','2020-06-21 16:50:29.428567'),(7,'auth','0002_alter_permission_name_max_length','2020-06-21 16:50:33.567709'),(8,'auth','0003_alter_user_email_max_length','2020-06-21 16:50:34.163422'),(9,'auth','0004_alter_user_username_opts','2020-06-21 16:50:34.414414'),(10,'auth','0005_alter_user_last_login_null','2020-06-21 16:50:36.751918'),(11,'auth','0006_require_contenttypes_0002','2020-06-21 16:50:36.854780'),(12,'auth','0007_alter_validators_add_error_messages','2020-06-21 16:50:37.051549'),(13,'auth','0008_alter_user_username_max_length','2020-06-21 16:50:39.962117'),(14,'auth','0009_alter_user_last_name_max_length','2020-06-21 16:50:46.189039'),(15,'auth','0010_alter_group_name_max_length','2020-06-21 16:50:47.520813'),(16,'auth','0011_update_proxy_permissions','2020-06-21 16:50:47.870573'),(17,'pelicula','0001_initial','2020-06-21 16:51:12.575135'),(18,'sessions','0001_initial','2020-06-21 16:52:06.745452'),(19,'pelicula','0002_registroasientosreservados','2020-06-21 16:54:23.814016'),(20,'pelicula','0003_categoria_estado','2020-06-21 22:37:32.305840'),(21,'pelicula','0004_registrocombos_estado','2020-06-21 22:48:12.095081'),(22,'pelicula','0005_factura_puntos_usados','2020-06-21 23:46:21.311332');
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
INSERT INTO `django_session` VALUES ('x59f4fdd71o1vmhk5zlxr341pf3hkg6t','Mzk2NzhhMTQxMDY0NmNlMmE5ZWJmMThjNThjN2M5NGVkYjg3YzkzNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNWRmZWY4MzRiZDEzNTQ5YzkyZTgyMWY4ZjZhZTFiNzNjZTcxYzYzIn0=','2020-07-05 16:55:48.679758');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_asiento`
--

LOCK TABLES `pelicula_asiento` WRITE;
/*!40000 ALTER TABLE `pelicula_asiento` DISABLE KEYS */;
INSERT INTO `pelicula_asiento` VALUES (1,1,1,1),(2,1,2,1),(3,1,3,1),(4,1,4,1),(5,1,5,1),(6,2,1,1),(7,2,2,1),(8,2,3,1),(9,2,4,1),(10,2,5,1),(11,3,1,1),(12,3,2,1),(13,3,3,1),(14,3,4,1),(15,3,5,1),(16,4,1,1),(17,4,2,1),(18,4,3,1),(19,4,4,1),(20,4,5,1),(21,5,1,1),(22,5,2,1),(23,5,3,1),(24,5,4,1),(25,5,5,1);
/*!40000 ALTER TABLE `pelicula_asiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_categoria`
--

DROP TABLE IF EXISTS `pelicula_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula_categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(200) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_categoria`
--

LOCK TABLES `pelicula_categoria` WRITE;
/*!40000 ALTER TABLE `pelicula_categoria` DISABLE KEYS */;
INSERT INTO `pelicula_categoria` VALUES (1,'Acción',1),(2,'Animación',1),(3,'Aventura',1),(4,'Ciencia Ficción',1),(5,'Comedia',1),(6,'Fantasía',1),(7,'Deporte',1),(8,'Documental',1),(9,'Drama',1),(10,'Historia',1),(11,'Infantil',1),(12,'Musical',1),(13,'Romance',1),(14,'Terror',1),(15,'Suspenso',1);
/*!40000 ALTER TABLE `pelicula_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_factura`
--

DROP TABLE IF EXISTS `pelicula_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula_factura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_compra` date NOT NULL,
  `total_factura` double NOT NULL,
  `id_usuario_id` int NOT NULL,
  `puntos_usados` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pelicula_factura_id_usuario_id_ac787fdc_fk_pelicula_usuario_id` (`id_usuario_id`),
  CONSTRAINT `pelicula_factura_id_usuario_id_ac787fdc_fk_pelicula_usuario_id` FOREIGN KEY (`id_usuario_id`) REFERENCES `pelicula_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_factura`
--

LOCK TABLES `pelicula_factura` WRITE;
/*!40000 ALTER TABLE `pelicula_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `pelicula_factura` ENABLE KEYS */;
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
  KEY `pelicula_funcion_id_pelicula_id_0c65fc65_fk_pelicula_pelicula_id` (`id_pelicula_id`),
  KEY `pelicula_funcion_id_sala_id_c8b9d374_fk_pelicula_sala_id` (`id_sala_id`),
  CONSTRAINT `pelicula_funcion_id_pelicula_id_0c65fc65_fk_pelicula_pelicula_id` FOREIGN KEY (`id_pelicula_id`) REFERENCES `pelicula_pelicula` (`id`),
  CONSTRAINT `pelicula_funcion_id_sala_id_c8b9d374_fk_pelicula_sala_id` FOREIGN KEY (`id_sala_id`) REFERENCES `pelicula_sala` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_funcion`
--

LOCK TABLES `pelicula_funcion` WRITE;
/*!40000 ALTER TABLE `pelicula_funcion` DISABLE KEYS */;
INSERT INTO `pelicula_funcion` VALUES (1,'2020-07-01','12:00:00.000000',25,1,1,1);
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
  `imagen` varchar(200) NOT NULL,
  `fecha_estreno` date NOT NULL,
  `fecha_salida` date NOT NULL,
  `duracion` time(6) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_pelicula`
--

LOCK TABLES `pelicula_pelicula` WRITE;
/*!40000 ALTER TABLE `pelicula_pelicula` DISABLE KEYS */;
INSERT INTO `pelicula_pelicula` VALUES (1,'Black Widow','Al nacer, la Viuda Negra, también conocida como Natasha Romanova, se entrega a la KGB para convertirse en su agente definitivo. Cuando la URSS se separa, el gobierno intenta matarla mientras la acción se traslada a la actual Nueva York.','https://es.web.img3.acsta.net/pictures/20/03/09/18/28/5915477.jpg','2020-04-24','2020-06-24','02:30:00.000000',1),(2,'Godzilla vs. Kong','Godzilla y Kong, dos de las fuerzas más poderosas de un planeta habitado por aterradoras criaturas, se enfrentan en un espectacular combate que sacude los cimientos de la humanidad. Monarch se embarca en una misión de alto riesgo y pone rumbo hacia territorios inexplorados para descubrir los orígenes de estos dos titanes, en un último esfuerzo por tratar de salvar a dos bestias que parecen tener las horas contadas sobre la faz de la Tierra.','https://i.pinimg.com/originals/0e/bf/8d/0ebf8d713b883e18d07fad91b0ef095b.jpg','2020-11-18','2021-01-18','02:00:00.000000',1),(3,'Wonder Woman 2','Diana Prince, conocida como Wonder Woman se enfrenta a Cheetah, una villana que posee fuerza y agilidad sobrehumanas.','https://es.web.img2.acsta.net/pictures/20/06/15/17/12/2946915.jpg','2020-08-12','2020-10-12','02:00:00.000000',1),(4,'El hombre invisible','Un científico loco finge su suicidio y luego utiliza su invisibilidad para aterrorizar a su expareja, quien decide enfrentar al hombre invisible ella misma luego de que la policía no creyera su historia.','https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQTtt8FFdTo6AzHAlbhQv2JvKAYfO3OehbiCL8kdBgOi5isjZkk','2020-04-25','2020-07-25','02:05:00.000000',1),(5,'Unidos','Ambientado en un mundo de fantasía suburbana, dos hermanos elfos adolescentes, Ian y Barley Lightfood, se embarcan en una aventura en la que se proponen descubrir si existe aún algo de magia en el mundo que les permita pasar un último día con su padre, que falleció cuando ellos eran aún muy pequeños como para poder recordarlo.','https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQYUG1bSWlMqpoJhnfQBVzYsYX0xzTzPuTaKREpkb-M0QjRy9PB','2020-04-29','2020-07-29','01:42:00.000000',1),(6,'Soul','Un músico que ha perdido su pasión por la música es transportado fuera de su cuerpo y debe encontrar el camino de regreso con la ayuda de un alma infantil que aprende sobre sí misma.','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQZihNrmaDPhGzwiJ90h2JOf1aRQbk398YGPV7yEjMBTY_gGCfI','2020-06-17','2020-08-17','02:00:00.000000',1);
/*!40000 ALTER TABLE `pelicula_pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_producto`
--

DROP TABLE IF EXISTS `pelicula_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula_producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` double NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `id_tipos_productos_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pelicula_producto_id_tipos_productos_i_387bfe3b_fk_pelicula_` (`id_tipos_productos_id`),
  CONSTRAINT `pelicula_producto_id_tipos_productos_i_387bfe3b_fk_pelicula_` FOREIGN KEY (`id_tipos_productos_id`) REFERENCES `pelicula_tipoproductos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_producto`
--

LOCK TABLES `pelicula_producto` WRITE;
/*!40000 ALTER TABLE `pelicula_producto` DISABLE KEYS */;
INSERT INTO `pelicula_producto` VALUES (1,'Entrada Menor de Edad','Entrada para los menores de la casa. Solo para menores de 16 años.',5,1,1),(2,'Entrada General','Entrada para cualquier persona. Para mayores de 16 años y menores de 60.',10,1,1),(3,'Entrada Adulto Mayor','Entrada para personas de la tercera edad. Solo para mayores de 60.',6,1,1),(4,'Cotufa Pequeña','Cotufas de 250 gramos.',3.5,1,2),(5,'Cotufa Mediana','Cotufa de 500 gramos.',4.5,1,2),(6,'Cotufa Grande','Cotufa de 700 gramos.',5,1,2),(7,'Refresco Pequeño','Refresco de 500 mililitros.',3,1,2),(8,'Refresco Grande','Refresco de 750 mililitros.',5,1,2),(9,'Gomitas de Azucar','Chuchería dulce en forma de ositos.',2,1,2),(10,'Bolsa de Maní','Bolsa de manís Jacks.',5,1,2),(11,'Perro Caliente','Delicioso perro caliente con todo.',4,1,2),(12,'Combo Informático','Combo para personas adictas a la tecnología.',16.5,1,3);
/*!40000 ALTER TABLE `pelicula_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_promociones`
--

DROP TABLE IF EXISTS `pelicula_promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula_promociones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` longtext NOT NULL,
  `condicion` varchar(200) NOT NULL,
  `descuento` double NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_promociones`
--

LOCK TABLES `pelicula_promociones` WRITE;
/*!40000 ALTER TABLE `pelicula_promociones` DISABLE KEYS */;
/*!40000 ALTER TABLE `pelicula_promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_registroasientosreservados`
--

DROP TABLE IF EXISTS `pelicula_registroasientosreservados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula_registroasientosreservados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_asientos_id` int NOT NULL,
  `id_factura_id` int NOT NULL,
  `id_funciones_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pelicula_registroasi_id_asientos_id_7ebbee3b_fk_pelicula_` (`id_asientos_id`),
  KEY `pelicula_registroasi_id_factura_id_408eb119_fk_pelicula_` (`id_factura_id`),
  KEY `pelicula_registroasi_id_funciones_id_65f20637_fk_pelicula_` (`id_funciones_id`),
  CONSTRAINT `pelicula_registroasi_id_asientos_id_7ebbee3b_fk_pelicula_` FOREIGN KEY (`id_asientos_id`) REFERENCES `pelicula_asiento` (`id`),
  CONSTRAINT `pelicula_registroasi_id_factura_id_408eb119_fk_pelicula_` FOREIGN KEY (`id_factura_id`) REFERENCES `pelicula_factura` (`id`),
  CONSTRAINT `pelicula_registroasi_id_funciones_id_65f20637_fk_pelicula_` FOREIGN KEY (`id_funciones_id`) REFERENCES `pelicula_funcion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_registroasientosreservados`
--

LOCK TABLES `pelicula_registroasientosreservados` WRITE;
/*!40000 ALTER TABLE `pelicula_registroasientosreservados` DISABLE KEYS */;
/*!40000 ALTER TABLE `pelicula_registroasientosreservados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_registrocategorias`
--

DROP TABLE IF EXISTS `pelicula_registrocategorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula_registrocategorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_categoria_id` int NOT NULL,
  `id_pelicula_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pelicula_registrocat_id_categoria_id_c6389c89_fk_pelicula_` (`id_categoria_id`),
  KEY `pelicula_registrocat_id_pelicula_id_75fe678a_fk_pelicula_` (`id_pelicula_id`),
  CONSTRAINT `pelicula_registrocat_id_categoria_id_c6389c89_fk_pelicula_` FOREIGN KEY (`id_categoria_id`) REFERENCES `pelicula_categoria` (`id`),
  CONSTRAINT `pelicula_registrocat_id_pelicula_id_75fe678a_fk_pelicula_` FOREIGN KEY (`id_pelicula_id`) REFERENCES `pelicula_pelicula` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_registrocategorias`
--

LOCK TABLES `pelicula_registrocategorias` WRITE;
/*!40000 ALTER TABLE `pelicula_registrocategorias` DISABLE KEYS */;
INSERT INTO `pelicula_registrocategorias` VALUES (1,1,1),(2,3,1),(3,4,2),(4,1,2),(5,1,3),(6,3,3),(7,5,5),(8,2,5),(9,14,4),(10,15,4),(11,2,6),(12,5,6);
/*!40000 ALTER TABLE `pelicula_registrocategorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_registrocombos`
--

DROP TABLE IF EXISTS `pelicula_registrocombos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula_registrocombos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `id_producto_id` int NOT NULL,
  `id_producto_combo_id` int NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pelicula_registrocom_id_producto_id_5fe0533c_fk_pelicula_` (`id_producto_id`),
  KEY `pelicula_registrocom_id_producto_combo_id_b2db4991_fk_pelicula_` (`id_producto_combo_id`),
  CONSTRAINT `pelicula_registrocom_id_producto_combo_id_b2db4991_fk_pelicula_` FOREIGN KEY (`id_producto_combo_id`) REFERENCES `pelicula_producto` (`id`),
  CONSTRAINT `pelicula_registrocom_id_producto_id_5fe0533c_fk_pelicula_` FOREIGN KEY (`id_producto_id`) REFERENCES `pelicula_producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_registrocombos`
--

LOCK TABLES `pelicula_registrocombos` WRITE;
/*!40000 ALTER TABLE `pelicula_registrocombos` DISABLE KEYS */;
INSERT INTO `pelicula_registrocombos` VALUES (1,1,5,12,1),(2,1,8,12,1),(3,1,9,12,1),(4,1,10,12,1);
/*!40000 ALTER TABLE `pelicula_registrocombos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_registrocompras`
--

DROP TABLE IF EXISTS `pelicula_registrocompras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula_registrocompras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `precio` double NOT NULL,
  `id_factura_id` int NOT NULL,
  `id_producto_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pelicula_registrocom_id_factura_id_ac6a84da_fk_pelicula_` (`id_factura_id`),
  KEY `pelicula_registrocom_id_producto_id_c394a4bd_fk_pelicula_` (`id_producto_id`),
  CONSTRAINT `pelicula_registrocom_id_factura_id_ac6a84da_fk_pelicula_` FOREIGN KEY (`id_factura_id`) REFERENCES `pelicula_factura` (`id`),
  CONSTRAINT `pelicula_registrocom_id_producto_id_c394a4bd_fk_pelicula_` FOREIGN KEY (`id_producto_id`) REFERENCES `pelicula_producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_registrocompras`
--

LOCK TABLES `pelicula_registrocompras` WRITE;
/*!40000 ALTER TABLE `pelicula_registrocompras` DISABLE KEYS */;
/*!40000 ALTER TABLE `pelicula_registrocompras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_registropromociones`
--

DROP TABLE IF EXISTS `pelicula_registropromociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula_registropromociones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descuento_aplicado` double NOT NULL,
  `id_factura_id` int NOT NULL,
  `id_promociones_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pelicula_registropro_id_factura_id_1bbe0472_fk_pelicula_` (`id_factura_id`),
  KEY `pelicula_registropro_id_promociones_id_f1228753_fk_pelicula_` (`id_promociones_id`),
  CONSTRAINT `pelicula_registropro_id_factura_id_1bbe0472_fk_pelicula_` FOREIGN KEY (`id_factura_id`) REFERENCES `pelicula_factura` (`id`),
  CONSTRAINT `pelicula_registropro_id_promociones_id_f1228753_fk_pelicula_` FOREIGN KEY (`id_promociones_id`) REFERENCES `pelicula_promociones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_registropromociones`
--

LOCK TABLES `pelicula_registropromociones` WRITE;
/*!40000 ALTER TABLE `pelicula_registropromociones` DISABLE KEYS */;
/*!40000 ALTER TABLE `pelicula_registropromociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_sala`
--

DROP TABLE IF EXISTS `pelicula_sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula_sala` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `numero_filas` int NOT NULL,
  `numero_columnas` int NOT NULL,
  `id_sucursal_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pelicula_sala_id_sucursal_id_9d4a5f99_fk_pelicula_sucursal_id` (`id_sucursal_id`),
  CONSTRAINT `pelicula_sala_id_sucursal_id_9d4a5f99_fk_pelicula_sucursal_id` FOREIGN KEY (`id_sucursal_id`) REFERENCES `pelicula_sucursal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_sala`
--

LOCK TABLES `pelicula_sala` WRITE;
/*!40000 ALTER TABLE `pelicula_sala` DISABLE KEYS */;
INSERT INTO `pelicula_sala` VALUES (1,'Sala 2D',5,5,1);
/*!40000 ALTER TABLE `pelicula_sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_sucursal`
--

DROP TABLE IF EXISTS `pelicula_sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula_sucursal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `ubicacion` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_sucursal`
--

LOCK TABLES `pelicula_sucursal` WRITE;
/*!40000 ALTER TABLE `pelicula_sucursal` DISABLE KEYS */;
INSERT INTO `pelicula_sucursal` VALUES (1,'LengCinema Sambil','Chacao, Centro Comercial Sambil');
/*!40000 ALTER TABLE `pelicula_sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_tipoproductos`
--

DROP TABLE IF EXISTS `pelicula_tipoproductos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula_tipoproductos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_tipoproductos`
--

LOCK TABLES `pelicula_tipoproductos` WRITE;
/*!40000 ALTER TABLE `pelicula_tipoproductos` DISABLE KEYS */;
INSERT INTO `pelicula_tipoproductos` VALUES (1,'Entrada'),(2,'Alimento'),(3,'Combo');
/*!40000 ALTER TABLE `pelicula_tipoproductos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_usuario`
--

DROP TABLE IF EXISTS `pelicula_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula_usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cedula` varchar(15) NOT NULL,
  `contrasena` varchar(200) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `puntos` int NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `tipo_usuario` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_usuario`
--

LOCK TABLES `pelicula_usuario` WRITE;
/*!40000 ALTER TABLE `pelicula_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `pelicula_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-21 21:14:18
