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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Categoria',7,'add_categoria'),(26,'Can change Categoria',7,'change_categoria'),(27,'Can delete Categoria',7,'delete_categoria'),(28,'Can view Categoria',7,'view_categoria'),(29,'Can add Factura',8,'add_factura'),(30,'Can change Factura',8,'change_factura'),(31,'Can delete Factura',8,'delete_factura'),(32,'Can view Factura',8,'view_factura'),(33,'Can add Pelicula',9,'add_pelicula'),(34,'Can change Pelicula',9,'change_pelicula'),(35,'Can delete Pelicula',9,'delete_pelicula'),(36,'Can view Pelicula',9,'view_pelicula'),(37,'Can add Producto',10,'add_producto'),(38,'Can change Producto',10,'change_producto'),(39,'Can delete Producto',10,'delete_producto'),(40,'Can view Producto',10,'view_producto'),(41,'Can add Promocion',11,'add_promociones'),(42,'Can change Promocion',11,'change_promociones'),(43,'Can delete Promocion',11,'delete_promociones'),(44,'Can view Promocion',11,'view_promociones'),(45,'Can add Sucursal',12,'add_sucursal'),(46,'Can change Sucursal',12,'change_sucursal'),(47,'Can delete Sucursal',12,'delete_sucursal'),(48,'Can view Sucursal',12,'view_sucursal'),(49,'Can add Tipo Producto',13,'add_tipoproductos'),(50,'Can change Tipo Producto',13,'change_tipoproductos'),(51,'Can delete Tipo Producto',13,'delete_tipoproductos'),(52,'Can view Tipo Producto',13,'view_tipoproductos'),(53,'Can add Usuario',14,'add_usuario'),(54,'Can change Usuario',14,'change_usuario'),(55,'Can delete Usuario',14,'delete_usuario'),(56,'Can view Usuario',14,'view_usuario'),(57,'Can add Sala',15,'add_sala'),(58,'Can change Sala',15,'change_sala'),(59,'Can delete Sala',15,'delete_sala'),(60,'Can view Sala',15,'view_sala'),(61,'Can add registro promociones',16,'add_registropromociones'),(62,'Can change registro promociones',16,'change_registropromociones'),(63,'Can delete registro promociones',16,'delete_registropromociones'),(64,'Can view registro promociones',16,'view_registropromociones'),(65,'Can add registro compras',17,'add_registrocompras'),(66,'Can change registro compras',17,'change_registrocompras'),(67,'Can delete registro compras',17,'delete_registrocompras'),(68,'Can view registro compras',17,'view_registrocompras'),(69,'Can add registro combos',18,'add_registrocombos'),(70,'Can change registro combos',18,'change_registrocombos'),(71,'Can delete registro combos',18,'delete_registrocombos'),(72,'Can view registro combos',18,'view_registrocombos'),(73,'Can add registro categorias',19,'add_registrocategorias'),(74,'Can change registro categorias',19,'change_registrocategorias'),(75,'Can delete registro categorias',19,'delete_registrocategorias'),(76,'Can view registro categorias',19,'view_registrocategorias'),(77,'Can add Funcion',20,'add_funcion'),(78,'Can change Funcion',20,'change_funcion'),(79,'Can delete Funcion',20,'delete_funcion'),(80,'Can view Funcion',20,'view_funcion'),(81,'Can add Asiento',21,'add_asiento'),(82,'Can change Asiento',21,'change_asiento'),(83,'Can delete Asiento',21,'delete_asiento'),(84,'Can view Asiento',21,'view_asiento'),(85,'Can add registro asientos reservados',22,'add_registroasientosreservados'),(86,'Can change registro asientos reservados',22,'change_registroasientosreservados'),(87,'Can delete registro asientos reservados',22,'delete_registroasientosreservados'),(88,'Can view registro asientos reservados',22,'view_registroasientosreservados'),(89,'Can add Entrada',23,'add_entrada'),(90,'Can change Entrada',23,'change_entrada'),(91,'Can delete Entrada',23,'delete_entrada'),(92,'Can view Entrada',23,'view_entrada'),(93,'Can add Empleado',24,'add_empleado'),(94,'Can change Empleado',24,'change_empleado'),(95,'Can delete Empleado',24,'delete_empleado'),(96,'Can view Empleado',24,'view_empleado'),(97,'Can add Combo Cine',25,'add_combocine'),(98,'Can change Combo Cine',25,'change_combocine'),(99,'Can delete Combo Cine',25,'delete_combocine'),(100,'Can view Combo Cine',25,'view_combocine'),(101,'Can add Cliente',26,'add_cliente'),(102,'Can change Cliente',26,'change_cliente'),(103,'Can delete Cliente',26,'delete_cliente'),(104,'Can view Cliente',26,'view_cliente'),(105,'Can add Alimento',27,'add_alimento'),(106,'Can change Alimento',27,'change_alimento'),(107,'Can delete Alimento',27,'delete_alimento'),(108,'Can view Alimento',27,'view_alimento');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$IoI0wGs2k93C$J/oYjTfLhQZCeigemdqlxPtlKDgxuQbZKefpMfgG6xY=','2020-07-08 13:19:15.281215',1,'lengcinema','','','hola@gmail.com',1,1,'2020-06-21 16:55:40.302202');
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
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-06-21 17:51:11.416614','1','Black Widow',1,'[{\"added\": {}}]',9,1),(2,'2020-06-21 17:52:53.224375','1','Black Widow',2,'[{\"changed\": {\"fields\": [\"Imagen\"]}}]',9,1),(3,'2020-06-21 17:53:30.314136','1','Acción',1,'[{\"added\": {}}]',7,1),(4,'2020-06-21 17:53:35.782677','2','Animación',1,'[{\"added\": {}}]',7,1),(5,'2020-06-21 17:53:39.842230','3','Aventura',1,'[{\"added\": {}}]',7,1),(6,'2020-06-21 17:53:45.649995','4','Ciencia Ficción',1,'[{\"added\": {}}]',7,1),(7,'2020-06-21 17:53:50.395580','5','Comedia',1,'[{\"added\": {}}]',7,1),(8,'2020-06-21 17:53:59.786741','6','Fantasía',1,'[{\"added\": {}}]',7,1),(9,'2020-06-21 17:54:04.210497','7','Deporte',1,'[{\"added\": {}}]',7,1),(10,'2020-06-21 17:54:08.663685','8','Documental',1,'[{\"added\": {}}]',7,1),(11,'2020-06-21 17:54:13.431700','9','Drama',1,'[{\"added\": {}}]',7,1),(12,'2020-06-21 17:54:19.182939','10','Historia',1,'[{\"added\": {}}]',7,1),(13,'2020-06-21 17:54:23.948634','11','Infantil',1,'[{\"added\": {}}]',7,1),(14,'2020-06-21 17:54:27.987291','12','Musical',1,'[{\"added\": {}}]',7,1),(15,'2020-06-21 17:54:32.757562','13','Romance',1,'[{\"added\": {}}]',7,1),(16,'2020-06-21 17:54:36.935507','14','Terror',1,'[{\"added\": {}}]',7,1),(17,'2020-06-21 17:55:03.300095','1','registroCategorias object (1)',1,'[{\"added\": {}}]',19,1),(18,'2020-06-21 17:55:16.491018','2','registroCategorias object (2)',1,'[{\"added\": {}}]',19,1),(19,'2020-06-21 18:00:02.833079','2','Godzilla vs. Kong',1,'[{\"added\": {}}]',9,1),(20,'2020-06-21 18:00:28.751278','3','registroCategorias object (3)',1,'[{\"added\": {}}]',19,1),(21,'2020-06-21 18:00:36.164470','4','registroCategorias object (4)',1,'[{\"added\": {}}]',19,1),(22,'2020-06-21 18:09:48.298100','1','Entrada',1,'[{\"added\": {}}]',13,1),(23,'2020-06-21 18:09:53.025751','2','Alimento',1,'[{\"added\": {}}]',13,1),(24,'2020-06-21 18:09:56.024523','3','Combo',1,'[{\"added\": {}}]',13,1),(25,'2020-06-21 18:15:42.674291','1','Entrada Menor de Edad',1,'[{\"added\": {}}]',10,1),(26,'2020-06-21 18:16:17.637138','2','Entrada General',1,'[{\"added\": {}}]',10,1),(27,'2020-06-21 18:16:58.817380','3','Entrada Adulto Mayor',1,'[{\"added\": {}}]',10,1),(28,'2020-06-21 18:27:04.359983','4','Cotufa Pequeña',1,'[{\"added\": {}}]',10,1),(29,'2020-06-21 18:27:32.392427','5','Cotufa Mediana',1,'[{\"added\": {}}]',10,1),(30,'2020-06-21 18:27:52.210388','6','Cotufa Grande',1,'[{\"added\": {}}]',10,1),(31,'2020-06-21 18:28:18.595945','7','Refresco Pequeño',1,'[{\"added\": {}}]',10,1),(32,'2020-06-21 18:28:38.226396','8','Refresco Grande',1,'[{\"added\": {}}]',10,1),(33,'2020-06-21 18:29:19.704237','9','Golosina',1,'[{\"added\": {}}]',10,1),(34,'2020-06-21 18:29:53.559393','10','Bolsa de Maní',1,'[{\"added\": {}}]',10,1),(35,'2020-06-21 18:30:22.944962','11','Perro Caliente',1,'[{\"added\": {}}]',10,1),(36,'2020-06-21 18:30:50.684646','9','Gomitas de Azucar',2,'[{\"changed\": {\"fields\": [\"Nombre\", \"Descripcion\"]}}]',10,1),(37,'2020-06-21 18:31:54.217199','12','Combo Informático',1,'[{\"added\": {}}]',10,1),(38,'2020-06-21 18:32:20.155911','1','registroCombos object (1)',1,'[{\"added\": {}}]',18,1),(39,'2020-06-21 18:32:40.101354','2','registroCombos object (2)',1,'[{\"added\": {}}]',18,1),(40,'2020-06-21 18:33:02.014649','3','registroCombos object (3)',1,'[{\"added\": {}}]',18,1),(41,'2020-06-21 18:33:19.509948','4','registroCombos object (4)',1,'[{\"added\": {}}]',18,1),(42,'2020-06-21 18:41:31.703619','12','Combo Informático',2,'[{\"changed\": {\"fields\": [\"Descripcion\"]}}]',10,1),(43,'2020-06-21 18:42:17.248476','12','Combo Informático',2,'[{\"changed\": {\"fields\": [\"Precio\"]}}]',10,1),(44,'2020-06-21 18:44:54.725828','12','Combo Informático',2,'[{\"changed\": {\"fields\": [\"Descripcion\"]}}]',10,1),(45,'2020-06-21 21:00:55.458072','3','Wonder Woman 2',2,'[{\"changed\": {\"fields\": [\"Titulo\", \"Sinopsis\", \"Imagen\", \"Fecha estreno\", \"Fecha salida\", \"Duracion\"]}}]',9,1),(46,'2020-06-21 21:01:27.005287','5','registroCategorias object (5)',2,'[{\"changed\": {\"fields\": [\"Id pelicula\", \"Id categoria\"]}}]',19,1),(47,'2020-06-21 21:01:36.112069','6','registroCategorias object (6)',2,'[{\"changed\": {\"fields\": [\"Id pelicula\", \"Id categoria\"]}}]',19,1),(48,'2020-06-21 21:03:12.856352','4','El hombre invisible',2,'[{\"changed\": {\"fields\": [\"Titulo\", \"Sinopsis\", \"Imagen\", \"Fecha estreno\", \"Fecha salida\", \"Duracion\"]}}]',9,1),(49,'2020-06-21 21:03:30.430847','15','Suspenso',1,'[{\"added\": {}}]',7,1),(50,'2020-06-21 21:03:50.037627','9','registroCategorias object (9)',1,'[{\"added\": {}}]',19,1),(51,'2020-06-21 21:03:58.217461','10','registroCategorias object (10)',1,'[{\"added\": {}}]',19,1),(52,'2020-06-21 23:56:14.278245','1','LengCinema Sambil',1,'[{\"added\": {}}]',12,1),(53,'2020-06-21 23:57:00.996237','1','Sala 2D',1,'[{\"added\": {}}]',15,1),(54,'2020-06-21 23:57:20.669517','1','Asiento object (1)',1,'[{\"added\": {}}]',21,1),(55,'2020-06-21 23:57:28.241569','2','Asiento object (2)',1,'[{\"added\": {}}]',21,1),(56,'2020-06-21 23:57:34.017922','3','Asiento object (3)',1,'[{\"added\": {}}]',21,1),(57,'2020-06-21 23:57:39.796731','4','Asiento object (4)',1,'[{\"added\": {}}]',21,1),(58,'2020-06-21 23:57:46.747385','5','Asiento object (5)',1,'[{\"added\": {}}]',21,1),(59,'2020-06-21 23:57:53.083151','6','Asiento object (6)',1,'[{\"added\": {}}]',21,1),(60,'2020-06-21 23:57:58.240822','7','Asiento object (7)',1,'[{\"added\": {}}]',21,1),(61,'2020-06-21 23:58:04.206771','8','Asiento object (8)',1,'[{\"added\": {}}]',21,1),(62,'2020-06-21 23:58:09.296494','9','Asiento object (9)',1,'[{\"added\": {}}]',21,1),(63,'2020-06-21 23:58:18.589395','10','Asiento object (10)',1,'[{\"added\": {}}]',21,1),(64,'2020-06-21 23:58:23.085526','11','Asiento object (11)',1,'[{\"added\": {}}]',21,1),(65,'2020-06-21 23:58:27.478095','12','Asiento object (12)',1,'[{\"added\": {}}]',21,1),(66,'2020-06-21 23:58:31.619471','13','Asiento object (13)',1,'[{\"added\": {}}]',21,1),(67,'2020-06-21 23:58:37.919390','14','Asiento object (14)',1,'[{\"added\": {}}]',21,1),(68,'2020-06-21 23:58:43.083998','15','Asiento object (15)',1,'[{\"added\": {}}]',21,1),(69,'2020-06-21 23:58:50.625989','16','Asiento object (16)',1,'[{\"added\": {}}]',21,1),(70,'2020-06-21 23:59:01.711189','17','Asiento object (17)',1,'[{\"added\": {}}]',21,1),(71,'2020-06-21 23:59:07.574817','18','Asiento object (18)',1,'[{\"added\": {}}]',21,1),(72,'2020-06-21 23:59:12.177307','19','Asiento object (19)',1,'[{\"added\": {}}]',21,1),(73,'2020-06-21 23:59:16.630177','20','Asiento object (20)',1,'[{\"added\": {}}]',21,1),(74,'2020-06-21 23:59:21.032205','21','Asiento object (21)',1,'[{\"added\": {}}]',21,1),(75,'2020-06-21 23:59:26.029543','22','Asiento object (22)',1,'[{\"added\": {}}]',21,1),(76,'2020-06-21 23:59:30.595850','23','Asiento object (23)',1,'[{\"added\": {}}]',21,1),(77,'2020-06-21 23:59:36.511813','24','Asiento object (24)',1,'[{\"added\": {}}]',21,1),(78,'2020-06-22 00:00:05.998303','19','Asiento object (19)',2,'[{\"changed\": {\"fields\": [\"Columna\"]}}]',21,1),(79,'2020-06-22 00:00:15.381813','20','Asiento object (20)',2,'[{\"changed\": {\"fields\": [\"Columna\"]}}]',21,1),(80,'2020-06-22 00:00:21.701795','21','Asiento object (21)',2,'[{\"changed\": {\"fields\": [\"Fila\", \"Columna\"]}}]',21,1),(81,'2020-06-22 00:00:27.261297','21','Asiento object (21)',2,'[{\"changed\": {\"fields\": [\"Columna\"]}}]',21,1),(82,'2020-06-22 00:00:41.842196','21','Asiento object (21)',2,'[{\"changed\": {\"fields\": [\"Columna\"]}}]',21,1),(83,'2020-06-22 00:00:46.932053','22','Asiento object (22)',2,'[{\"changed\": {\"fields\": [\"Columna\"]}}]',21,1),(84,'2020-06-22 00:00:51.642034','23','Asiento object (23)',2,'[{\"changed\": {\"fields\": [\"Columna\"]}}]',21,1),(85,'2020-06-22 00:00:54.868085','24','Asiento object (24)',2,'[{\"changed\": {\"fields\": [\"Columna\"]}}]',21,1),(86,'2020-06-22 00:01:00.946960','25','Asiento object (25)',1,'[{\"added\": {}}]',21,1),(87,'2020-06-29 18:53:39.848084','1','Black Widow',2,'[{\"changed\": {\"fields\": [\"Fecha salida\"]}}]',9,1),(88,'2020-07-07 18:48:34.736968','1','Fin del Trimestre',1,'[{\"added\": {}}]',11,1),(89,'2020-07-08 13:19:42.437482','1','Empleado object (1)',1,'[{\"added\": {}}]',24,1),(90,'2020-07-08 21:11:09.978575','1','Entrada para personas de tercera edad',1,'[{\"added\": {}}]',23,1),(91,'2020-07-08 21:11:29.664353','2','Entraga general de LengCinema',1,'[{\"added\": {}}]',23,1),(92,'2020-07-08 21:11:51.189379','3','Entrada para niños de 4 a 16 años.',1,'[{\"added\": {}}]',23,1),(93,'2020-07-09 00:25:25.210299','1','Factura object (1)',1,'[{\"added\": {}}]',8,1),(94,'2020-07-09 00:25:43.340414','1','RegistroAsientosReservados object (1)',1,'[{\"added\": {}}]',22,1),(95,'2020-07-09 00:54:53.123653','1','RegistroAsientosReservados object (1)',3,'',22,1),(96,'2020-07-09 00:55:06.631666','2','RegistroAsientosReservados object (2)',1,'[{\"added\": {}}]',22,1),(97,'2020-07-09 00:59:51.851884','2','RegistroAsientosReservados object (2)',2,'[{\"changed\": {\"fields\": [\"Id funciones\"]}}]',22,1),(98,'2020-07-09 01:15:18.581455','2','RegistroAsientosReservados object (2)',3,'',22,1),(99,'2020-07-09 23:42:07.519072','3','RegistroAsientosReservados object (3)',1,'[{\"added\": {}}]',22,1),(100,'2020-07-09 23:42:17.650765','4','RegistroAsientosReservados object (4)',1,'[{\"added\": {}}]',22,1),(101,'2020-07-09 23:43:47.185771','3','RegistroAsientosReservados object (3)',2,'[]',22,1),(102,'2020-07-09 23:43:56.671539','5','RegistroAsientosReservados object (5)',1,'[{\"added\": {}}]',22,1),(103,'2020-07-09 23:44:04.590927','6','RegistroAsientosReservados object (6)',1,'[{\"added\": {}}]',22,1),(104,'2020-07-09 23:44:14.239492','7','RegistroAsientosReservados object (7)',1,'[{\"added\": {}}]',22,1),(105,'2020-07-09 23:44:22.812808','8','RegistroAsientosReservados object (8)',1,'[{\"added\": {}}]',22,1),(106,'2020-07-09 23:44:33.077941','9','RegistroAsientosReservados object (9)',1,'[{\"added\": {}}]',22,1),(107,'2020-07-10 01:01:35.389223','1','Promo Vacaciones',2,'[{\"changed\": {\"fields\": [\"Fecha inicio\"]}}]',11,1),(108,'2020-07-10 01:14:18.161697','4','RegistroCompras object (4)',3,'',17,1),(109,'2020-07-10 01:14:18.208611','3','RegistroCompras object (3)',3,'',17,1),(110,'2020-07-10 01:14:18.297335','2','RegistroCompras object (2)',3,'',17,1),(111,'2020-07-10 01:14:18.537693','1','RegistroCompras object (1)',3,'',17,1),(112,'2020-07-10 01:14:35.854737','1','Factura object (1)',3,'',8,1),(113,'2020-07-10 01:14:35.898444','2','Factura object (2)',3,'',8,1),(114,'2020-07-10 01:19:29.877032','3','Factura object (3)',3,'',8,1),(115,'2020-07-10 01:34:51.203572','4','Factura object (4)',3,'',8,1),(116,'2020-07-10 01:38:43.222081','5','Factura object (5)',3,'',8,1),(117,'2020-07-10 01:39:15.393680','2','Funcion object (2)',2,'[{\"changed\": {\"fields\": [\"Butacas disponibles\"]}}]',20,1),(118,'2020-07-10 01:43:03.466501','6','Factura object (6)',3,'',8,1),(119,'2020-07-10 01:56:09.946001','2','Funcion object (2)',2,'[{\"changed\": {\"fields\": [\"Butacas disponibles\"]}}]',20,1),(120,'2020-07-11 00:08:11.853668','1','Cliente object (1)',2,'[{\"changed\": {\"fields\": [\"Puntos\"]}}]',26,1),(121,'2020-07-11 04:52:56.397785','1','Acción',3,'',7,1),(122,'2020-07-11 04:52:56.485115','2','Animacion',3,'',7,1),(123,'2020-07-11 04:52:56.595488','3','Aventura',3,'',7,1),(124,'2020-07-11 04:52:56.696272','4','Ciencia Ficción',3,'',7,1),(125,'2020-07-11 04:52:56.841832','5','Comedia',3,'',7,1),(126,'2020-07-11 04:52:57.140033','16','Crimen',3,'',7,1),(127,'2020-07-11 04:52:57.237772','7','Deporte',3,'',7,1),(128,'2020-07-11 04:52:57.349479','8','Documental',3,'',7,1),(129,'2020-07-11 04:52:57.440231','9','Drama',3,'',7,1),(130,'2020-07-11 04:52:57.504072','6','Fantasía',3,'',7,1),(131,'2020-07-11 04:52:57.569884','17','Ganas de morir',3,'',7,1),(132,'2020-07-11 04:52:57.636709','10','Historia',3,'',7,1),(133,'2020-07-11 04:52:57.702535','11','Infantil',3,'',7,1),(134,'2020-07-11 04:52:57.802702','12','Musical',3,'',7,1),(135,'2020-07-11 04:52:57.947131','13','Romance',3,'',7,1),(136,'2020-07-11 04:52:58.013155','15','Suspenso',3,'',7,1),(137,'2020-07-11 04:52:58.146603','14','Terror',3,'',7,1),(138,'2020-07-11 04:53:26.354434','1','Black Widow',3,'',9,1),(139,'2020-07-11 04:53:26.497056','7','dghnmqe',3,'',9,1),(140,'2020-07-11 04:53:26.594792','4','El hombre invisible',3,'',9,1),(141,'2020-07-11 04:53:26.662616','2','Godzilla vs. Kong',3,'',9,1),(142,'2020-07-11 04:53:26.753896','6','Soul',3,'',9,1),(143,'2020-07-11 04:53:26.827213','5','Unidos',3,'',9,1),(144,'2020-07-11 04:53:27.039172','3','Wonder Woman 2',3,'',9,1),(145,'2020-07-11 04:54:05.447847','10','Bolsa de Mani',3,'',10,1),(146,'2020-07-11 04:54:05.541595','15','Combo Caliente',3,'',10,1),(147,'2020-07-11 04:54:05.627365','20','Combo Enamorados',3,'',10,1),(148,'2020-07-11 04:54:05.715836','17','Combo mani',3,'',10,1),(149,'2020-07-11 04:54:05.827061','16','Combo Sistemista',3,'',10,1),(150,'2020-07-11 04:54:05.981646','12','Combo Sistemistas',3,'',10,1),(151,'2020-07-11 04:54:06.130261','6','Cotufa Grande',3,'',10,1),(152,'2020-07-11 04:54:06.237964','5','Cotufa Mediana',3,'',10,1),(153,'2020-07-11 04:54:06.336703','4','Cotufa Pequeña',3,'',10,1),(154,'2020-07-11 04:54:06.403528','21','dfgh',3,'',10,1),(155,'2020-07-11 04:54:06.502791','3','Entrada Adulto Mayor',3,'',10,1),(156,'2020-07-11 04:54:06.669857','2','Entrada General',3,'',10,1),(157,'2020-07-11 04:54:06.800508','1','Entrada Menor de Edad',3,'',10,1),(158,'2020-07-11 04:54:06.900245','18','gfnh',3,'',10,1),(159,'2020-07-11 04:54:07.091735','9','Gomitas de Azucar',3,'',10,1),(160,'2020-07-11 04:54:07.177503','19','Mamenlo',3,'',10,1),(161,'2020-07-11 04:54:07.266264','13','Pan',3,'',10,1),(162,'2020-07-11 04:54:07.311148','11','Perro Caliente',3,'',10,1),(163,'2020-07-11 04:54:07.365998','14','Queso',3,'',10,1),(164,'2020-07-11 04:54:07.456156','8','Refresco Grande',3,'',10,1),(165,'2020-07-11 04:54:07.499046','7','Refresco Pequeño',3,'',10,1),(166,'2020-07-11 04:54:07.565870','22','uyjhgb',3,'',10,1),(167,'2020-07-11 04:54:23.892227','3','Maldito wilmer',3,'',11,1),(168,'2020-07-11 04:54:23.992958','2','Promo Navidad',3,'',11,1),(169,'2020-07-11 04:54:24.092699','1','Promo Vacaciones',3,'',11,1),(170,'2020-07-11 04:54:55.547094','1','Sala Dos Dimensiones',3,'',15,1),(171,'2020-07-11 04:54:55.641849','2','Sala MaxiCinema',3,'',15,1),(172,'2020-07-11 04:54:55.790445','3','tucupita',3,'',15,1),(173,'2020-07-11 04:55:07.031399','1','Leng Cinema Sambil',3,'',12,1),(174,'2020-07-11 04:55:07.278735','2','LengCinema San Ignacio',3,'',12,1),(175,'2020-07-11 04:55:07.677979','3','pupis',3,'',12,1),(176,'2020-07-11 04:55:19.966589','2','Alimento',3,'',13,1),(177,'2020-07-11 04:55:20.028423','3','Combo',3,'',13,1),(178,'2020-07-11 04:55:20.206950','1','Entrada',3,'',13,1),(179,'2020-07-11 04:55:31.378241','4','Pizzu',3,'',14,1),(180,'2020-07-11 04:55:31.465008','3','Leonardo',3,'',14,1),(181,'2020-07-11 04:55:31.555767','2','Nicole',3,'',14,1),(182,'2020-07-11 04:55:31.652925','1','Giselle',3,'',14,1),(183,'2020-07-11 11:42:59.808711','5','Giselle',1,'[{\"added\": {}}]',14,1),(184,'2020-07-11 11:43:32.137945','4','LengCinema Sambil',1,'[{\"added\": {}}]',12,1),(185,'2020-07-11 11:43:51.527465','3','Empleado object (3)',1,'[{\"added\": {}}]',24,1),(186,'2020-07-11 12:04:01.228852','5','Promo Apertura LengCinema',2,'[{\"changed\": {\"fields\": [\"Fecha inicio\"]}}]',11,1),(187,'2020-07-11 12:32:41.713250','4','300 gramos',1,'[{\"added\": {}}]',27,1),(188,'2020-07-11 12:55:14.347457','26','Factura object (26)',3,'',8,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(27,'pelicula','alimento'),(21,'pelicula','asiento'),(7,'pelicula','categoria'),(26,'pelicula','cliente'),(25,'pelicula','combocine'),(24,'pelicula','empleado'),(23,'pelicula','entrada'),(8,'pelicula','factura'),(20,'pelicula','funcion'),(9,'pelicula','pelicula'),(10,'pelicula','producto'),(11,'pelicula','promociones'),(22,'pelicula','registroasientosreservados'),(19,'pelicula','registrocategorias'),(18,'pelicula','registrocombos'),(17,'pelicula','registrocompras'),(16,'pelicula','registropromociones'),(15,'pelicula','sala'),(12,'pelicula','sucursal'),(13,'pelicula','tipoproductos'),(14,'pelicula','usuario'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-06-21 16:49:32.986884'),(2,'auth','0001_initial','2020-06-21 16:49:40.228664'),(3,'admin','0001_initial','2020-06-21 16:50:14.467719'),(4,'admin','0002_logentry_remove_auto_add','2020-06-21 16:50:20.383143'),(5,'admin','0003_logentry_add_action_flag_choices','2020-06-21 16:50:20.655414'),(6,'contenttypes','0002_remove_content_type_name','2020-06-21 16:50:29.428567'),(7,'auth','0002_alter_permission_name_max_length','2020-06-21 16:50:33.567709'),(8,'auth','0003_alter_user_email_max_length','2020-06-21 16:50:34.163422'),(9,'auth','0004_alter_user_username_opts','2020-06-21 16:50:34.414414'),(10,'auth','0005_alter_user_last_login_null','2020-06-21 16:50:36.751918'),(11,'auth','0006_require_contenttypes_0002','2020-06-21 16:50:36.854780'),(12,'auth','0007_alter_validators_add_error_messages','2020-06-21 16:50:37.051549'),(13,'auth','0008_alter_user_username_max_length','2020-06-21 16:50:39.962117'),(14,'auth','0009_alter_user_last_name_max_length','2020-06-21 16:50:46.189039'),(15,'auth','0010_alter_group_name_max_length','2020-06-21 16:50:47.520813'),(16,'auth','0011_update_proxy_permissions','2020-06-21 16:50:47.870573'),(17,'pelicula','0001_initial','2020-06-21 16:51:12.575135'),(18,'sessions','0001_initial','2020-06-21 16:52:06.745452'),(19,'pelicula','0002_registroasientosreservados','2020-06-21 16:54:23.814016'),(20,'pelicula','0003_categoria_estado','2020-06-21 22:37:32.305840'),(21,'pelicula','0004_registrocombos_estado','2020-06-21 22:48:12.095081'),(22,'pelicula','0005_factura_puntos_usados','2020-06-21 23:46:21.311332'),(23,'pelicula','0006_auto_20200622_2159','2020-06-29 04:44:25.747511'),(24,'pelicula','0007_auto_20200622_2214','2020-06-29 04:44:26.324645'),(25,'pelicula','0008_auto_20200629_0044','2020-06-29 04:44:45.524428'),(26,'pelicula','0009_auto_20200629_1716','2020-07-07 18:45:59.509032'),(27,'pelicula','0010_auto_20200629_1826','2020-07-07 18:45:59.646848'),(28,'pelicula','0011_auto_20200705_2048','2020-07-07 18:45:59.794689'),(29,'pelicula','0012_auto_20200705_2048','2020-07-07 18:45:59.931327'),(30,'pelicula','0013_auto_20200706_1729','2020-07-07 18:46:00.075906'),(31,'pelicula','0014_auto_20200707_1445','2020-07-07 18:46:00.420010');
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
INSERT INTO `django_session` VALUES ('ek5d7b2lflg93bubb5fcuf59fod4k1pu','Mzk2NzhhMTQxMDY0NmNlMmE5ZWJmMThjNThjN2M5NGVkYjg3YzkzNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNWRmZWY4MzRiZDEzNTQ5YzkyZTgyMWY4ZjZhZTFiNzNjZTcxYzYzIn0=','2020-07-21 18:37:20.013489'),('qdyu9zmapupsmz7cm4r7f5dlfky6wq6k','Mzk2NzhhMTQxMDY0NmNlMmE5ZWJmMThjNThjN2M5NGVkYjg3YzkzNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNWRmZWY4MzRiZDEzNTQ5YzkyZTgyMWY4ZjZhZTFiNzNjZTcxYzYzIn0=','2020-07-22 13:19:15.479920'),('x59f4fdd71o1vmhk5zlxr341pf3hkg6t','Mzk2NzhhMTQxMDY0NmNlMmE5ZWJmMThjNThjN2M5NGVkYjg3YzkzNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNWRmZWY4MzRiZDEzNTQ5YzkyZTgyMWY4ZjZhZTFiNzNjZTcxYzYzIn0=','2020-07-05 16:55:48.679758');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_alimento`
--

DROP TABLE IF EXISTS `pelicula_alimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula_alimento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contenido_neto` varchar(100) NOT NULL,
  `id_producto_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pelicula_alimento_id_producto_id_42634ea9_fk_pelicula_` (`id_producto_id`),
  CONSTRAINT `pelicula_alimento_id_producto_id_42634ea9_fk_pelicula_` FOREIGN KEY (`id_producto_id`) REFERENCES `pelicula_producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_alimento`
--

LOCK TABLES `pelicula_alimento` WRITE;
/*!40000 ALTER TABLE `pelicula_alimento` DISABLE KEYS */;
INSERT INTO `pelicula_alimento` VALUES (4,'300 gramos',23),(5,'500 mililitros',24),(6,'150 gramos',25),(7,'100 gramos',26),(8,'250 mililitros',27),(9,'150 gramos',28);
/*!40000 ALTER TABLE `pelicula_alimento` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=330 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_asiento`
--

LOCK TABLES `pelicula_asiento` WRITE;
/*!40000 ALTER TABLE `pelicula_asiento` DISABLE KEYS */;
INSERT INTO `pelicula_asiento` VALUES (62,1,2,4),(63,1,1,4),(64,1,4,4),(65,2,1,4),(66,2,2,4),(67,2,3,4),(68,3,3,4),(69,3,1,4),(70,2,4,4),(71,3,2,4),(72,3,4,4),(73,4,1,4),(74,4,3,4),(75,4,2,4),(76,4,4,4),(77,5,1,4),(78,5,2,4),(79,1,3,4),(80,5,3,4),(81,5,4,4),(82,1,1,5),(83,1,3,5),(84,2,1,5),(85,1,4,5),(86,2,2,5),(87,1,2,5),(88,2,3,5),(89,2,4,5),(90,3,1,5),(91,3,2,5),(92,3,3,5),(93,3,4,5),(94,4,1,5),(95,4,2,5),(96,4,3,5),(97,4,4,5),(98,5,1,5),(99,5,2,5),(100,5,3,5),(101,5,4,5),(102,6,1,5),(103,6,2,5),(104,6,3,5),(105,6,4,5),(106,7,1,5),(107,7,3,5),(108,7,2,5),(109,7,4,5),(110,2,1,6),(111,1,1,6),(112,1,2,6),(113,1,4,6),(114,1,3,6),(115,2,2,6),(116,2,3,6),(117,3,1,6),(118,3,3,6),(119,3,2,6),(120,2,4,6),(121,3,4,6),(122,4,1,6),(123,4,2,6),(124,4,3,6),(125,4,4,6),(126,1,2,7),(127,1,3,7),(128,2,1,7),(129,2,2,7),(130,1,4,7),(131,1,1,7),(132,2,3,7),(133,2,4,7),(134,3,1,7),(135,3,2,7),(136,3,3,7),(137,3,4,7),(138,4,1,7),(139,4,2,7),(140,4,4,7),(141,4,3,7),(142,5,1,7),(143,5,2,7),(144,5,3,7),(145,5,4,7),(146,6,2,7),(147,6,1,7),(148,6,3,7),(149,6,4,7),(150,7,1,7),(151,7,3,7),(152,7,4,7),(153,7,2,7),(154,8,1,7),(155,8,2,7),(156,8,3,7),(157,8,4,7),(158,1,2,8),(159,1,4,8),(160,1,3,8),(161,1,1,8),(162,2,2,8),(163,2,1,8),(164,2,3,8),(165,3,3,8),(166,3,1,8),(167,2,4,8),(168,3,2,8),(169,3,4,8),(170,2,1,9),(171,1,1,9),(172,1,3,9),(173,1,2,9),(174,2,2,9),(175,2,3,9),(176,3,1,9),(177,3,2,9),(178,3,3,9),(179,4,1,9),(180,4,2,9),(181,5,1,9),(182,4,3,9),(183,5,2,9),(184,5,3,9),(185,2,1,10),(186,1,4,10),(187,1,5,10),(188,1,1,10),(189,1,2,10),(190,1,3,10),(191,2,2,10),(192,2,3,10),(193,2,4,10),(194,3,1,10),(195,3,2,10),(196,2,5,10),(197,3,3,10),(198,3,4,10),(199,4,1,10),(200,3,5,10),(201,4,4,10),(202,4,2,10),(203,4,3,10),(204,4,5,10),(205,5,1,10),(206,5,2,10),(207,5,5,10),(208,5,3,10),(209,5,4,10),(210,1,2,11),(211,1,4,11),(212,1,5,11),(213,2,1,11),(214,1,3,11),(215,1,1,11),(216,2,2,11),(217,2,5,11),(218,2,4,11),(219,2,3,11),(220,3,1,11),(221,3,2,11),(222,3,3,11),(223,3,4,11),(224,4,1,11),(225,4,2,11),(226,3,5,11),(227,4,3,11),(228,4,4,11),(229,4,5,11),(230,5,1,11),(231,5,2,11),(232,5,3,11),(233,5,5,11),(234,6,1,11),(235,5,4,11),(236,6,2,11),(237,6,5,11),(238,6,3,11),(239,6,4,11),(240,7,2,11),(241,7,1,11),(242,7,3,11),(243,7,4,11),(244,7,5,11),(245,8,2,11),(246,8,3,11),(247,8,4,11),(248,8,1,11),(249,8,5,11),(250,1,1,12),(251,1,2,12),(252,1,4,12),(253,2,1,12),(254,1,5,12),(255,1,3,12),(256,2,2,12),(257,2,3,12),(258,3,1,12),(259,2,4,12),(260,2,5,12),(261,3,2,12),(262,3,3,12),(263,3,4,12),(264,3,5,12),(265,4,1,12),(266,4,2,12),(267,4,3,12),(268,4,4,12),(269,4,5,12),(270,5,1,12),(271,5,2,12),(272,5,3,12),(273,5,4,12),(274,5,5,12),(275,6,1,12),(276,6,2,12),(277,6,3,12),(278,6,4,12),(279,7,1,12),(280,7,2,12),(281,6,5,12),(282,7,3,12),(283,7,4,12),(284,7,5,12),(285,8,1,12),(286,8,2,12),(287,8,4,12),(288,8,3,12),(289,8,5,12),(290,1,1,13),(291,1,5,13),(292,1,3,13),(293,2,1,13),(294,1,4,13),(295,1,2,13),(296,2,2,13),(297,2,4,13),(298,2,3,13),(299,2,5,13),(300,3,1,13),(301,3,3,13),(302,3,2,13),(303,3,4,13),(304,3,5,13),(305,4,1,13),(306,4,3,13),(307,4,2,13),(308,4,4,13),(309,4,5,13),(310,5,1,13),(311,5,2,13),(312,5,4,13),(313,6,1,13),(314,5,3,13),(315,6,2,13),(316,5,5,13),(317,6,3,13),(318,6,5,13),(319,6,4,13),(320,7,2,13),(321,7,1,13),(322,7,4,13),(323,7,3,13),(324,7,5,13),(325,8,2,13),(326,8,1,13),(327,8,3,13),(328,8,4,13),(329,8,5,13);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `pelicula_categoria_categoria_9dc5469f_uniq` (`categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_categoria`
--

LOCK TABLES `pelicula_categoria` WRITE;
/*!40000 ALTER TABLE `pelicula_categoria` DISABLE KEYS */;
INSERT INTO `pelicula_categoria` VALUES (18,'Acción',1),(19,'Aventura',1),(20,'Familiar',1),(21,'Animación',1),(22,'Comedia',1),(23,'Suspenso',1),(24,'Terror',1);
/*!40000 ALTER TABLE `pelicula_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_cliente`
--

DROP TABLE IF EXISTS `pelicula_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula_cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `puntos` int NOT NULL,
  `id_usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pelicula_cliente_id_usuario_id_58917882_fk_pelicula_usuario_id` (`id_usuario_id`),
  CONSTRAINT `pelicula_cliente_id_usuario_id_58917882_fk_pelicula_usuario_id` FOREIGN KEY (`id_usuario_id`) REFERENCES `pelicula_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_cliente`
--

LOCK TABLES `pelicula_cliente` WRITE;
/*!40000 ALTER TABLE `pelicula_cliente` DISABLE KEYS */;
INSERT INTO `pelicula_cliente` VALUES (4,1,5),(5,2,7),(6,1,8);
/*!40000 ALTER TABLE `pelicula_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_combocine`
--

DROP TABLE IF EXISTS `pelicula_combocine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula_combocine` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` longtext NOT NULL,
  `descuento` double NOT NULL,
  `id_producto_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pelicula_combocine_id_producto_id_a68de568_fk_pelicula_` (`id_producto_id`),
  CONSTRAINT `pelicula_combocine_id_producto_id_a68de568_fk_pelicula_` FOREIGN KEY (`id_producto_id`) REFERENCES `pelicula_producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_combocine`
--

LOCK TABLES `pelicula_combocine` WRITE;
/*!40000 ALTER TABLE `pelicula_combocine` DISABLE KEYS */;
INSERT INTO `pelicula_combocine` VALUES (8,'Combo para las parejas.',20,32),(9,'Combo para los más fanáticos de LengCinema.',30,33),(10,'Combo para parejas',15,34);
/*!40000 ALTER TABLE `pelicula_combocine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_empleado`
--

DROP TABLE IF EXISTS `pelicula_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula_empleado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tiene_permisos` tinyint(1) NOT NULL,
  `id_sucursal_id` int NOT NULL,
  `id_usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pelicula_empleado_id_sucursal_id_c16156e2_fk_pelicula_` (`id_sucursal_id`),
  KEY `pelicula_empleado_id_usuario_id_d6e91110_fk_pelicula_usuario_id` (`id_usuario_id`),
  CONSTRAINT `pelicula_empleado_id_sucursal_id_c16156e2_fk_pelicula_` FOREIGN KEY (`id_sucursal_id`) REFERENCES `pelicula_sucursal` (`id`),
  CONSTRAINT `pelicula_empleado_id_usuario_id_d6e91110_fk_pelicula_usuario_id` FOREIGN KEY (`id_usuario_id`) REFERENCES `pelicula_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_empleado`
--

LOCK TABLES `pelicula_empleado` WRITE;
/*!40000 ALTER TABLE `pelicula_empleado` DISABLE KEYS */;
INSERT INTO `pelicula_empleado` VALUES (3,1,4,5),(4,0,4,6);
/*!40000 ALTER TABLE `pelicula_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_entrada`
--

DROP TABLE IF EXISTS `pelicula_entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula_entrada` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  `id_producto_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pelicula_entrada_id_producto_id_5777ec57_fk_pelicula_producto_id` (`id_producto_id`),
  CONSTRAINT `pelicula_entrada_id_producto_id_5777ec57_fk_pelicula_producto_id` FOREIGN KEY (`id_producto_id`) REFERENCES `pelicula_producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_entrada`
--

LOCK TABLES `pelicula_entrada` WRITE;
/*!40000 ALTER TABLE `pelicula_entrada` DISABLE KEYS */;
INSERT INTO `pelicula_entrada` VALUES (4,'Entrada para niños de 4 a 16 años.',29),(5,'Entraga general de LengCinema.',30),(6,'Entrada para personas de tercera edad.',31);
/*!40000 ALTER TABLE `pelicula_entrada` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_factura`
--

LOCK TABLES `pelicula_factura` WRITE;
/*!40000 ALTER TABLE `pelicula_factura` DISABLE KEYS */;
INSERT INTO `pelicula_factura` VALUES (21,'2020-07-11',4,5,0),(22,'2020-07-11',34.4,7,0),(23,'2020-07-11',20.2,5,0),(24,'2020-07-11',6,8,0),(25,'2020-07-11',22,5,0),(27,'2020-07-11',12,8,0),(28,'2020-07-11',18.2,5,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_funcion`
--

LOCK TABLES `pelicula_funcion` WRITE;
/*!40000 ALTER TABLE `pelicula_funcion` DISABLE KEYS */;
INSERT INTO `pelicula_funcion` VALUES (6,'2020-07-19','13:00:00.000000',20,1,9,4),(7,'2020-07-18','13:00:00.000000',18,1,9,4),(8,'2020-07-17','13:00:00.000000',16,1,9,4),(9,'2020-07-17','16:00:00.000000',19,1,8,4),(10,'2020-07-17','12:00:00.000000',18,1,14,4),(11,'2020-07-17','15:00:00.000000',40,1,14,12),(12,'2020-07-17','12:00:00.000000',23,0,10,10),(13,'2020-07-13','13:00:00.000000',40,0,11,11),(14,'2020-07-13','16:00:00.000000',14,1,13,6),(15,'2020-07-13','12:00:00.000000',20,1,13,4),(16,'2020-07-20','12:00:00.000000',28,1,11,7),(17,'2020-07-12','16:00:00.000000',12,1,10,9);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_pelicula`
--

LOCK TABLES `pelicula_pelicula` WRITE;
/*!40000 ALTER TABLE `pelicula_pelicula` DISABLE KEYS */;
INSERT INTO `pelicula_pelicula` VALUES (8,'Mulán','El emperador chino emite un decreto que exige que cada hogar debe reclutar a un varón para luchar con el ejército imperial en la guerra contra los Hunos. Para salvar a su anciano padre de este deber, su única hija Fa Mulan se hace pasar por soldado y toma su lugar. La joven se someterá a un duro entrenamiento hasta hacerse merecedora de la estima y de la confianza del resto de su escuadrón.','https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSPO5lOKd7RPvg5wdNS6ZYMfC392opn2pGBxlX0My_nmXHf1RSI','2020-03-03','2020-09-03','02:00:00.000000',1),(9,'Black Widow','Al nacer, la Viuda Negra, también conocida como Natasha Romanova, se entrega a la KGB para convertirse en su agente definitivo. Cuando la URSS se separa, el gobierno intenta matarla mientras la acción se traslada a la actual Nueva York.','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRinPn-3xCLTzDjihVvZpxhDgrZXnVuYpGGWZHlyIRMGPCLXSrL','2020-04-24','2020-09-24','02:30:00.000000',1),(10,'Unidos','Ambientado en un mundo de fantasía suburbana, dos hermanos elfos adolescentes, Ian y Barley Lightfood, se embarcan en una aventura en la que se proponen descubrir si existe aún algo de magia en el mundo que les permita pasar un último día con su padre, que falleció cuando ellos eran aún muy pequeños como para poder recordarlo.','https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQYUG1bSWlMqpoJhnfQBVzYsYX0xzTzPuTaKREpkb-M0QjRy9PB','2020-02-29','2020-09-29','01:42:00.000000',1),(11,'Sonic la película','Sonic intenta navegar por las complejidades de la vida en la Tierra con su nuevo mejor amigo, un humano llamado Tom Wachowski. Pronto deben unir fuerzas para evitar que el malvado Dr. Robotnik capture a Sonic y use sus poderes para dominar el mundo.','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0ijOSqW5zTSrLn_TTyoBBR6Fi8WkMkndqmj6KpihRgPA2isJQ','2020-02-14','2020-09-14','01:40:00.000000',1),(12,'Bond 25','El legendario espía James Bond ha dejado el servicio activo. Su paz dura poco ya que su viejo amigo Felix Leiter de la CIA aparece pidiendo ayuda, lo que lleva a Bond al rastro de un misterioso villano armado con nueva tecnología peligrosa.','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvd_mwrGOmpDdlrJcSoaZhMD2SktaLxRg9Bicc4nhl-FO_aNOj','2020-11-12','2021-01-12','02:43:00.000000',1),(13,'El hombre invisible','Un científico loco finge su suicidio y luego utiliza su invisibilidad para aterrorizar a su expareja, quien decide enfrentar al hombre invisible ella misma luego de que la policía no creyera su historia.','https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQTtt8FFdTo6AzHAlbhQv2JvKAYfO3OehbiCL8kdBgOi5isjZkk','2020-03-05','2020-09-05','02:05:00.000000',1),(14,'Bad Boys para siempre','Los policías de la vieja escuela Mike Lowery y Marcus Burnett vuelven a patrullar juntos para derrotar al líder vicioso de un cartel de drogas de Miami. El recién creado equipo de élite AMMO del departamento de policía de Miami junto con Mike y Marcus se enfrentan al despiadado Armando Armas.','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQdTJl17J5_VdMVx85Krry9e2j2KZKkuuE92ejNVAtHsNGN-3l8','2020-01-07','2020-08-07','02:04:00.000000',1);
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
  `precio` double NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `id_tipos_productos_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pelicula_producto_nombre_a12f2279_uniq` (`nombre`),
  KEY `pelicula_producto_id_tipos_productos_i_387bfe3b_fk_pelicula_` (`id_tipos_productos_id`),
  CONSTRAINT `pelicula_producto_id_tipos_productos_i_387bfe3b_fk_pelicula_` FOREIGN KEY (`id_tipos_productos_id`) REFERENCES `pelicula_tipoproductos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_producto`
--

LOCK TABLES `pelicula_producto` WRITE;
/*!40000 ALTER TABLE `pelicula_producto` DISABLE KEYS */;
INSERT INTO `pelicula_producto` VALUES (23,'Cotufa Grande',3,1,1),(24,'Reresco Grande',2.5,1,1),(25,'Doritos Medianos',1.5,1,1),(26,'Cotufa Pequeña',1,1,1),(27,'Refresco Pequeño',1.2,1,1),(28,'Platanitos Medianos',3,1,1),(29,'Entrada Menor de Edad',1,1,2),(30,'Entrada General',3,1,2),(31,'Entrada Adulto Mayor',1.7,1,2),(32,'Combo Enamorados',14,0,3),(33,'Combo Leng Individual',7,1,3),(34,'Combo enamorado',8.5,1,3);
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
  `descuento` double NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_inicio` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pelicula_promociones_nombre_0923fd6c_uniq` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_promociones`
--

LOCK TABLES `pelicula_promociones` WRITE;
/*!40000 ALTER TABLE `pelicula_promociones` DISABLE KEYS */;
INSERT INTO `pelicula_promociones` VALUES (4,'Promo Navidad','Promoción durante todas las fiestas navideñas.',25,1,'2021-02-01','2020-12-01'),(5,'Promo Apertura LengCinema','Promoción para celebrar la apertura de LengCinema',30,1,'2020-08-11','2020-07-11'),(6,'Promo Halloween','Promoción para disfrutar la temporada de terror con nosotros.',10,1,'2020-11-01','2020-10-01');
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_registroasientosreservados`
--

LOCK TABLES `pelicula_registroasientosreservados` WRITE;
/*!40000 ALTER TABLE `pelicula_registroasientosreservados` DISABLE KEYS */;
INSERT INTO `pelicula_registroasientosreservados` VALUES (47,62,21,10),(48,63,21,10),(49,63,22,8),(50,62,22,8),(51,64,22,8),(52,79,22,8),(53,111,23,14),(54,112,23,14),(55,72,24,9),(56,150,25,16),(57,151,25,16),(58,153,25,16),(59,152,25,16),(62,176,27,17),(63,178,27,17),(64,177,27,17),(65,69,28,7),(66,71,28,7);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_registrocategorias`
--

LOCK TABLES `pelicula_registrocategorias` WRITE;
/*!40000 ALTER TABLE `pelicula_registrocategorias` DISABLE KEYS */;
INSERT INTO `pelicula_registrocategorias` VALUES (14,18,8),(15,19,8),(16,18,9),(17,19,9),(18,20,10),(19,21,10),(20,22,11),(21,20,11),(22,23,12),(23,19,12),(24,23,13),(25,24,13),(26,18,14),(27,22,14);
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
  PRIMARY KEY (`id`),
  KEY `pelicula_registrocom_id_producto_id_5fe0533c_fk_pelicula_` (`id_producto_id`),
  KEY `pelicula_registrocom_id_producto_combo_id_b2db4991_fk_pelicula_` (`id_producto_combo_id`),
  CONSTRAINT `pelicula_registrocom_id_producto_combo_id_b2db4991_fk_pelicula_` FOREIGN KEY (`id_producto_combo_id`) REFERENCES `pelicula_producto` (`id`),
  CONSTRAINT `pelicula_registrocom_id_producto_id_5fe0533c_fk_pelicula_` FOREIGN KEY (`id_producto_id`) REFERENCES `pelicula_producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_registrocombos`
--

LOCK TABLES `pelicula_registrocombos` WRITE;
/*!40000 ALTER TABLE `pelicula_registrocombos` DISABLE KEYS */;
INSERT INTO `pelicula_registrocombos` VALUES (7,2,23,32),(8,1,28,32),(9,2,24,32),(10,1,23,33),(11,1,25,33),(12,1,24,33),(13,2,23,34),(14,1,24,34);
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
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_registrocompras`
--

LOCK TABLES `pelicula_registrocompras` WRITE;
/*!40000 ALTER TABLE `pelicula_registrocompras` DISABLE KEYS */;
INSERT INTO `pelicula_registrocompras` VALUES (55,1,1,21,29),(56,1,1,21,26),(57,1,1.2,21,27),(58,1,1.7,21,31),(59,4,3,22,30),(60,2,11.2,22,32),(61,2,3,23,30),(62,1,3,23,28),(63,1,11.2,23,32),(64,1,3,24,30),(65,1,3,24,28),(66,2,3,25,30),(67,4,2.5,25,24),(68,2,1,25,29),(69,4,1,25,26),(70,2,1.5,25,25),(73,3,1,27,26),(74,3,3,27,30),(75,1,1.5,28,25),(76,2,3,28,30),(77,1,11.2,28,32);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_registropromociones`
--

LOCK TABLES `pelicula_registropromociones` WRITE;
/*!40000 ALTER TABLE `pelicula_registropromociones` DISABLE KEYS */;
INSERT INTO `pelicula_registropromociones` VALUES (20,30,21,5),(21,30,22,5),(22,30,23,5),(23,30,24,5),(24,30,25,5),(26,30,27,5),(27,30,28,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_sala`
--

LOCK TABLES `pelicula_sala` WRITE;
/*!40000 ALTER TABLE `pelicula_sala` DISABLE KEYS */;
INSERT INTO `pelicula_sala` VALUES (4,'Sala 2D',5,4,4),(5,'Sala MaxiCinema',7,4,4),(6,'Sala 3D',4,4,5),(7,'Sala Digital',8,4,5),(8,'Sala 4D',3,4,8),(9,'Sala 4DX',5,3,8),(10,'Sala VIP',5,5,9),(11,'Sala Dos Dimensiones',8,5,9),(12,'Sala Maxi',8,5,6),(13,'Sala 2D',8,5,6);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `pelicula_sucursal_nombre_1205a8dc_uniq` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_sucursal`
--

LOCK TABLES `pelicula_sucursal` WRITE;
/*!40000 ALTER TABLE `pelicula_sucursal` DISABLE KEYS */;
INSERT INTO `pelicula_sucursal` VALUES (4,'LengCinema Sambil','Chacao, Centro Comercial Sambil'),(5,'LengCinema Líder','Centro Comercial Líder, La California'),(6,'LengCinema San Ignacio','Centro Comercial San Ignacio, Chacao'),(7,'LengCinema Tolón','C. C. Tolón Fashion Mall, Las Mercedes'),(8,'LengCinema Millenium','Centro Comercial Millenium, Los Dos Caminos'),(9,'LengCinema El Hatillo','Centro Comercial Paseo El Hatillo, La Lagunita');
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
INSERT INTO `pelicula_tipoproductos` VALUES (1,'Alimento'),(2,'Entrada'),(3,'Combo');
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
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pelicula_usuario_cedula_fdb022e3_uniq` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_usuario`
--

LOCK TABLES `pelicula_usuario` WRITE;
/*!40000 ALTER TABLE `pelicula_usuario` DISABLE KEYS */;
INSERT INTO `pelicula_usuario` VALUES (5,'28052067','Giselle','Ferreira'),(6,'27252353','Nicole','Brito'),(7,'26465846','Leonardo','Gonzalez'),(8,'27000000','Edward','Pizzurro');
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

-- Dump completed on 2020-07-11 10:06:41
