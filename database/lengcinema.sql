-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
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
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Pelicula',7,'add_pelicula'),(26,'Can change Pelicula',7,'change_pelicula'),(27,'Can delete Pelicula',7,'delete_pelicula'),(28,'Can view Pelicula',7,'view_pelicula'),(29,'Can add Asiento',8,'add_asiento'),(30,'Can change Asiento',8,'change_asiento'),(31,'Can delete Asiento',8,'delete_asiento'),(32,'Can view Asiento',8,'view_asiento'),(33,'Can add Funcion',9,'add_funcion'),(34,'Can change Funcion',9,'change_funcion'),(35,'Can delete Funcion',9,'delete_funcion'),(36,'Can view Funcion',9,'view_funcion'),(37,'Can add Sala',10,'add_sala'),(38,'Can change Sala',10,'change_sala'),(39,'Can delete Sala',10,'delete_sala'),(40,'Can view Sala',10,'view_sala'),(41,'Can add Reservar Asiento',11,'add_reservarasientos'),(42,'Can change Reservar Asiento',11,'change_reservarasientos'),(43,'Can delete Reservar Asiento',11,'delete_reservarasientos'),(44,'Can view Reservar Asiento',11,'view_reservarasientos'),(45,'Can add Combo',12,'add_combo'),(46,'Can change Combo',12,'change_combo'),(47,'Can delete Combo',12,'delete_combo'),(48,'Can view Combo',12,'view_combo'),(49,'Can add Entrada',13,'add_entrada'),(50,'Can change Entrada',13,'change_entrada'),(51,'Can delete Entrada',13,'delete_entrada'),(52,'Can view Entrada',13,'view_entrada'),(53,'Can add Compras Combos',14,'add_comprascombos'),(54,'Can change Compras Combos',14,'change_comprascombos'),(55,'Can delete Compras Combos',14,'delete_comprascombos'),(56,'Can view Compras Combos',14,'view_comprascombos'),(57,'Can add Factura',15,'add_factura'),(58,'Can change Factura',15,'change_factura'),(59,'Can delete Factura',15,'delete_factura'),(60,'Can view Factura',15,'view_factura'),(61,'Can add Entrada',16,'add_entrada'),(62,'Can change Entrada',16,'change_entrada'),(63,'Can delete Entrada',16,'delete_entrada'),(64,'Can view Entrada',16,'view_entrada'),(65,'Can add compras entradas',17,'add_comprasentradas'),(66,'Can change compras entradas',17,'change_comprasentradas'),(67,'Can delete compras entradas',17,'delete_comprasentradas'),(68,'Can view compras entradas',17,'view_comprasentradas'),(69,'Can add Combo',18,'add_combo'),(70,'Can change Combo',18,'change_combo'),(71,'Can delete Combo',18,'delete_combo'),(72,'Can view Combo',18,'view_combo'),(73,'Can add Factura',19,'add_factura'),(74,'Can change Factura',19,'change_factura'),(75,'Can delete Factura',19,'delete_factura'),(76,'Can view Factura',19,'view_factura'),(77,'Can add Compra Entrada',20,'add_comprasentradas'),(78,'Can change Compra Entrada',20,'change_comprasentradas'),(79,'Can delete Compra Entrada',20,'delete_comprasentradas'),(80,'Can view Compra Entrada',20,'view_comprasentradas'),(81,'Can add Compra Combo',21,'add_comprascombos'),(82,'Can change Compra Combo',21,'change_comprascombos'),(83,'Can delete Compra Combo',21,'delete_comprascombos'),(84,'Can view Compra Combo',21,'view_comprascombos'),(85,'Can add Usuario',22,'add_usuarios'),(86,'Can change Usuario',22,'change_usuarios'),(87,'Can delete Usuario',22,'delete_usuarios'),(88,'Can view Usuario',22,'view_usuarios'),(89,'Can add Usuario',23,'add_usuario'),(90,'Can change Usuario',23,'change_usuario'),(91,'Can delete Usuario',23,'delete_usuario'),(92,'Can view Usuario',23,'view_usuario'),(93,'Can add categoria',24,'add_categoria'),(94,'Can change categoria',24,'change_categoria'),(95,'Can delete categoria',24,'delete_categoria'),(96,'Can view categoria',24,'view_categoria'),(97,'Can add registro categorias',25,'add_registrocategorias'),(98,'Can change registro categorias',25,'change_registrocategorias'),(99,'Can delete registro categorias',25,'delete_registrocategorias'),(100,'Can view registro categorias',25,'view_registrocategorias'),(101,'Can add sucursal',26,'add_sucursal'),(102,'Can change sucursal',26,'change_sucursal'),(103,'Can delete sucursal',26,'delete_sucursal'),(104,'Can view sucursal',26,'view_sucursal'),(105,'Can add producto',27,'add_producto'),(106,'Can change producto',27,'change_producto'),(107,'Can delete producto',27,'delete_producto'),(108,'Can view producto',27,'view_producto'),(109,'Can add tipo productos',28,'add_tipoproductos'),(110,'Can change tipo productos',28,'change_tipoproductos'),(111,'Can delete tipo productos',28,'delete_tipoproductos'),(112,'Can view tipo productos',28,'view_tipoproductos'),(113,'Can add registro combos',29,'add_registrocombos'),(114,'Can change registro combos',29,'change_registrocombos'),(115,'Can delete registro combos',29,'delete_registrocombos'),(116,'Can view registro combos',29,'view_registrocombos'),(117,'Can add promociones',30,'add_promociones'),(118,'Can change promociones',30,'change_promociones'),(119,'Can delete promociones',30,'delete_promociones'),(120,'Can view promociones',30,'view_promociones'),(121,'Can add registro promociones',31,'add_registropromociones'),(122,'Can change registro promociones',31,'change_registropromociones'),(123,'Can delete registro promociones',31,'delete_registropromociones'),(124,'Can view registro promociones',31,'view_registropromociones'),(125,'Can add registro compras',32,'add_registrocompras'),(126,'Can change registro compras',32,'change_registrocompras'),(127,'Can delete registro compras',32,'delete_registrocompras'),(128,'Can view registro compras',32,'view_registrocompras'),(129,'Can add registro asientos reservados',33,'add_registroasientosreservados'),(130,'Can change registro asientos reservados',33,'change_registroasientosreservados'),(131,'Can delete registro asientos reservados',33,'delete_registroasientosreservados'),(132,'Can view registro asientos reservados',33,'view_registroasientosreservados');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$7n1Xi5IVoWU4$v8GK+cyam5p6gtxX5geNDSvdZruj5nCwGXTVijYqmDE=','2020-06-06 16:56:25.275838',1,'lengcinema','','','cine@gmail.com',1,1,'2020-05-28 21:39:26.073013'),(2,'pbkdf2_sha256$180000$AQyONRKpKDnx$xXIaquq8o/itpIGRNDbqeSP/uICLMI1yP28mA8ccDSo=','2020-06-21 06:06:37.971246',1,'edwjon','','','',1,1,'2020-06-21 06:06:30.577837');
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
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-05-28 21:44:21.032836','1','Los Vengadores',1,'[{\"added\": {}}]',7,1),(2,'2020-05-28 22:01:07.805171','2','Maléfica 2',1,'[{\"added\": {}}]',7,1),(3,'2020-05-28 22:01:56.681335','1','Los Vengadores',2,'[{\"changed\": {\"fields\": [\"Imagen\"]}}]',7,1),(4,'2020-05-28 22:06:05.485878','3','Wonder Woman 1984',1,'[{\"added\": {}}]',7,1),(5,'2020-05-28 22:06:57.962101','1','Los Vengadores',2,'[{\"changed\": {\"fields\": [\"Fecha estreno\", \"Duracion\"]}}]',7,1),(6,'2020-05-28 22:07:31.321876','2','Maléfica 2',2,'[{\"changed\": {\"fields\": [\"Fecha estreno\", \"Fecha salida\", \"Duracion\"]}}]',7,1),(7,'2020-05-28 22:08:29.227062','3','Wonder Woman 1984',2,'[{\"changed\": {\"fields\": [\"Fecha estreno\", \"Duracion\"]}}]',7,1),(8,'2020-05-29 18:06:40.521344','4','Minions: The Rise of Gru',1,'[{\"added\": {}}]',7,1),(9,'2020-05-30 17:01:16.965515','1','Avengers: Endgame',2,'[{\"changed\": {\"fields\": [\"Titulo\", \"Sinopsis\", \"Categoria\", \"Imagen\", \"Fecha estreno\", \"Duracion\"]}}]',7,1),(10,'2020-05-30 17:01:47.543162','2','Maléfica 2',3,'',7,1),(11,'2020-05-30 17:02:00.897146','4','Minions: The Rise of Gru',3,'',7,1),(12,'2020-05-30 17:02:01.067791','3','Wonder Woman 1984',3,'',7,1),(13,'2020-05-30 17:04:33.957473','5','Minions: The Rise of Gru',1,'[{\"added\": {}}]',7,1),(14,'2020-05-30 17:07:30.289473','6','Wonder Woman 2',1,'[{\"added\": {}}]',7,1),(15,'2020-05-30 17:12:20.696456','7','Hotel Transylvania 3: Monstruos de Vacaciones',1,'[{\"added\": {}}]',7,1),(16,'2020-05-30 17:14:23.452600','8','Escuadrón de la muerte',1,'[{\"added\": {}}]',7,1),(17,'2020-05-30 17:15:44.080141','9','Spider-Man: De regreso a casa',1,'[{\"added\": {}}]',7,1),(18,'2020-05-30 17:16:44.904058','10','Mulán',1,'[{\"added\": {}}]',7,1),(19,'2020-05-30 17:18:09.800441','11','Bad Boys para siempre',1,'[{\"added\": {}}]',7,1),(20,'2020-05-30 17:20:06.446827','12','Sonic la película',1,'[{\"added\": {}}]',7,1),(21,'2020-05-30 17:21:02.644541','13','¡Scooby!',1,'[{\"added\": {}}]',7,1),(22,'2020-05-30 17:21:54.612127','14','Amenaza en lo profundo',1,'[{\"added\": {}}]',7,1),(23,'2020-05-30 17:22:59.582413','15','Black Widow',1,'[{\"added\": {}}]',7,1),(24,'2020-05-30 17:24:14.285978','16','Rápidos y Furiosos 9',1,'[{\"added\": {}}]',7,1),(25,'2020-05-30 17:26:00.160839','17','Godzilla vs. Kong',1,'[{\"added\": {}}]',7,1),(26,'2020-05-30 17:27:09.531219','18','Gretel y Hansel',1,'[{\"added\": {}}]',7,1),(27,'2020-05-30 17:28:20.893609','19','El conjuro 3',1,'[{\"added\": {}}]',7,1),(28,'2020-05-30 17:29:20.186991','20','Violet y Finch',1,'[{\"added\": {}}]',7,1),(29,'2020-05-30 17:30:15.954615','21','Free Guy',1,'[{\"added\": {}}]',7,1),(30,'2020-05-30 17:31:28.565003','22','Te quiero, imbécil',1,'[{\"added\": {}}]',7,1),(31,'2020-05-30 17:32:15.365405','23','Divino amor',1,'[{\"added\": {}}]',7,1),(32,'2020-05-30 17:32:27.875109','23','Divino amor',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',7,1),(33,'2020-05-30 17:33:21.417801','24','The Room',1,'[{\"added\": {}}]',7,1),(34,'2020-05-30 17:37:34.614703','25','Escape Room: sin salida',1,'[{\"added\": {}}]',7,1),(35,'2020-05-30 17:38:32.020705','26','El jardín secreto',1,'[{\"added\": {}}]',7,1),(36,'2020-05-30 17:38:47.452884','26','El jardín secreto',2,'[]',7,1),(37,'2020-05-30 17:39:33.625280','27','La cabaña',1,'[{\"added\": {}}]',7,1),(38,'2020-05-30 17:40:18.493574','28','El hoyo',1,'[{\"added\": {}}]',7,1),(39,'2020-05-30 17:46:54.396030','29','Los Croods 2',1,'[{\"added\": {}}]',7,1),(40,'2020-05-30 17:48:46.719140','30','Si supieras',1,'[{\"added\": {}}]',7,1),(41,'2020-05-30 18:38:57.182403','31','Love Wedding Repeat',1,'[{\"added\": {}}]',7,1),(42,'2020-05-30 18:41:27.592469','32','Modo Avión',1,'[{\"added\": {}}]',7,1),(43,'2020-05-30 18:44:54.971568','33','West Side Story',1,'[{\"added\": {}}]',7,1),(44,'2020-05-30 18:46:30.346258','34','18 Presents',1,'[{\"added\": {}}]',7,1),(45,'2020-05-30 18:48:51.811720','35','Dolittle',1,'[{\"added\": {}}]',7,1),(46,'2020-05-30 18:50:06.130430','36','Los nuevos mutantes',1,'[{\"added\": {}}]',7,1),(47,'2020-05-30 18:51:35.737192','37','Invasión: el fin de los tiempos',1,'[{\"added\": {}}]',7,1),(48,'2020-05-30 18:54:58.024052','38','Dune',1,'[{\"added\": {}}]',7,1),(49,'2020-05-30 18:56:38.590636','39','Artemis Fowl: el mundo subterráneo',1,'[{\"added\": {}}]',7,1),(50,'2020-05-30 18:57:51.104560','40','El llamado salvaje',1,'[{\"added\": {}}]',7,1),(51,'2020-05-30 18:59:25.490734','41','Soul',1,'[{\"added\": {}}]',7,1),(52,'2020-05-30 19:02:02.425450','42','The Lovebirds',1,'[{\"added\": {}}]',7,1),(53,'2020-05-30 19:04:03.491386','43','The Photograph',1,'[{\"added\": {}}]',7,1),(54,'2020-05-30 19:05:34.747349','44','Emma',1,'[{\"added\": {}}]',7,1),(55,'2020-05-30 19:14:33.026852','1','Sala 2D',1,'[{\"added\": {}}]',10,1),(56,'2020-05-30 19:17:04.436329','2','Sala 3D',1,'[{\"added\": {}}]',10,1),(57,'2020-05-30 19:42:44.467761','3','Sala VIP',1,'[{\"added\": {}}]',10,1),(58,'2020-05-30 19:43:01.730997','4','Sala 4DX',1,'[{\"added\": {}}]',10,1),(59,'2020-05-30 19:43:34.860657','1','Asiento object (1)',1,'[{\"added\": {}}]',8,1),(60,'2020-05-30 19:43:43.792914','2','Asiento object (2)',1,'[{\"added\": {}}]',8,1),(61,'2020-05-30 19:43:50.951488','3','Asiento object (3)',1,'[{\"added\": {}}]',8,1),(62,'2020-05-30 19:43:58.302043','4','Asiento object (4)',1,'[{\"added\": {}}]',8,1),(63,'2020-05-30 19:44:06.448623','5','Asiento object (5)',1,'[{\"added\": {}}]',8,1),(64,'2020-05-30 19:44:15.233214','6','Asiento object (6)',1,'[{\"added\": {}}]',8,1),(65,'2020-05-30 19:44:24.295121','7','Asiento object (7)',1,'[{\"added\": {}}]',8,1),(66,'2020-05-30 19:44:33.961979','8','Asiento object (8)',1,'[{\"added\": {}}]',8,1),(67,'2020-05-30 19:44:51.892470','9','Asiento object (9)',1,'[{\"added\": {}}]',8,1),(68,'2020-05-30 19:45:00.762741','10','Asiento object (10)',1,'[{\"added\": {}}]',8,1),(69,'2020-05-30 19:45:08.354300','11','Asiento object (11)',1,'[{\"added\": {}}]',8,1),(70,'2020-05-30 19:45:19.303100','12','Asiento object (12)',1,'[{\"added\": {}}]',8,1),(71,'2020-05-30 19:45:27.417003','13','Asiento object (13)',1,'[{\"added\": {}}]',8,1),(72,'2020-05-30 19:45:34.757141','14','Asiento object (14)',1,'[{\"added\": {}}]',8,1),(73,'2020-05-30 19:45:43.723499','15','Asiento object (15)',1,'[{\"added\": {}}]',8,1),(74,'2020-05-30 19:45:51.837404','16','Asiento object (16)',1,'[{\"added\": {}}]',8,1),(75,'2020-05-30 19:45:58.734342','17','Asiento object (17)',1,'[{\"added\": {}}]',8,1),(76,'2020-05-30 19:46:04.748232','18','Asiento object (18)',1,'[{\"added\": {}}]',8,1),(77,'2020-05-30 19:46:11.375812','19','Asiento object (19)',1,'[{\"added\": {}}]',8,1),(78,'2020-05-30 19:46:18.074266','20','Asiento object (20)',1,'[{\"added\": {}}]',8,1),(79,'2020-05-30 19:46:23.984434','21','Asiento object (21)',1,'[{\"added\": {}}]',8,1),(80,'2020-05-30 19:46:29.261251','22','Asiento object (22)',1,'[{\"added\": {}}]',8,1),(81,'2020-05-30 19:46:34.974805','23','Asiento object (23)',1,'[{\"added\": {}}]',8,1),(82,'2020-05-30 19:46:45.697181','24','Asiento object (24)',1,'[{\"added\": {}}]',8,1),(83,'2020-05-30 19:47:01.423727','25','Asiento object (25)',1,'[{\"added\": {}}]',8,1),(84,'2020-05-30 19:47:07.534920','26','Asiento object (26)',1,'[{\"added\": {}}]',8,1),(85,'2020-05-30 19:47:17.373929','27','Asiento object (27)',1,'[{\"added\": {}}]',8,1),(86,'2020-05-30 19:47:23.689803','28','Asiento object (28)',1,'[{\"added\": {}}]',8,1),(87,'2020-05-30 19:47:33.863558','29','Asiento object (29)',1,'[{\"added\": {}}]',8,1),(88,'2020-05-30 19:47:40.240774','30','Asiento object (30)',1,'[{\"added\": {}}]',8,1),(89,'2020-05-30 19:47:45.673562','31','Asiento object (31)',1,'[{\"added\": {}}]',8,1),(90,'2020-05-30 19:47:51.685577','32','Asiento object (32)',1,'[{\"added\": {}}]',8,1),(91,'2020-05-30 19:47:58.631375','33','Asiento object (33)',1,'[{\"added\": {}}]',8,1),(92,'2020-05-30 19:48:03.690044','34','Asiento object (34)',1,'[{\"added\": {}}]',8,1),(93,'2020-05-30 19:48:10.025665','35','Asiento object (35)',1,'[{\"added\": {}}]',8,1),(94,'2020-05-30 19:48:15.553229','36','Asiento object (36)',1,'[{\"added\": {}}]',8,1),(95,'2020-05-30 19:48:21.126324','37','Asiento object (37)',1,'[{\"added\": {}}]',8,1),(96,'2020-05-30 19:48:27.607542','38','Asiento object (38)',1,'[{\"added\": {}}]',8,1),(97,'2020-05-30 19:48:32.974665','39','Asiento object (39)',1,'[{\"added\": {}}]',8,1),(98,'2020-05-30 19:48:39.085373','40','Asiento object (40)',1,'[{\"added\": {}}]',8,1),(99,'2020-05-30 19:48:45.256135','41','Asiento object (41)',1,'[{\"added\": {}}]',8,1),(100,'2020-05-30 19:48:50.919921','42','Asiento object (42)',1,'[{\"added\": {}}]',8,1),(101,'2020-05-30 19:48:56.176525','43','Asiento object (43)',1,'[{\"added\": {}}]',8,1),(102,'2020-05-30 19:49:01.380188','44','Asiento object (44)',1,'[{\"added\": {}}]',8,1),(103,'2020-05-30 19:49:06.387541','45','Asiento object (45)',1,'[{\"added\": {}}]',8,1),(104,'2020-05-30 19:49:12.412518','46','Asiento object (46)',1,'[{\"added\": {}}]',8,1),(105,'2020-05-30 19:49:18.482657','47','Asiento object (47)',1,'[{\"added\": {}}]',8,1),(106,'2020-05-30 19:49:23.744380','48','Asiento object (48)',1,'[{\"added\": {}}]',8,1),(107,'2020-05-30 19:49:28.491734','49','Asiento object (49)',1,'[{\"added\": {}}]',8,1),(108,'2020-05-30 19:50:18.874613','50','Asiento object (50)',1,'[{\"added\": {}}]',8,1),(109,'2020-05-30 19:50:25.557933','51','Asiento object (51)',1,'[{\"added\": {}}]',8,1),(110,'2020-05-30 19:50:35.930821','52','Asiento object (52)',1,'[{\"added\": {}}]',8,1),(111,'2020-05-30 19:51:14.077931','53','Asiento object (53)',1,'[{\"added\": {}}]',8,1),(112,'2020-05-30 19:51:21.010144','54','Asiento object (54)',1,'[{\"added\": {}}]',8,1),(113,'2020-05-30 19:51:28.391071','55','Asiento object (55)',1,'[{\"added\": {}}]',8,1),(114,'2020-05-30 19:51:33.666760','56','Asiento object (56)',1,'[{\"added\": {}}]',8,1),(115,'2020-05-30 19:51:38.518807','57','Asiento object (57)',1,'[{\"added\": {}}]',8,1),(116,'2020-05-30 19:51:45.203816','58','Asiento object (58)',1,'[{\"added\": {}}]',8,1),(117,'2020-05-30 19:55:06.279650','59','Asiento object (59)',1,'[{\"added\": {}}]',8,1),(118,'2020-05-30 19:55:13.476373','60','Asiento object (60)',1,'[{\"added\": {}}]',8,1),(119,'2020-05-30 19:55:17.938370','61','Asiento object (61)',1,'[{\"added\": {}}]',8,1),(120,'2020-05-30 19:55:22.944585','62','Asiento object (62)',1,'[{\"added\": {}}]',8,1),(121,'2020-05-30 19:55:27.731377','63','Asiento object (63)',1,'[{\"added\": {}}]',8,1),(122,'2020-05-30 19:55:34.271966','64','Asiento object (64)',1,'[{\"added\": {}}]',8,1),(123,'2020-05-30 20:10:35.280918','65','Asiento object (65)',1,'[{\"added\": {}}]',8,1),(124,'2020-05-30 20:10:41.349330','66','Asiento object (66)',1,'[{\"added\": {}}]',8,1),(125,'2020-05-30 20:10:46.074508','67','Asiento object (67)',1,'[{\"added\": {}}]',8,1),(126,'2020-05-30 20:10:52.385297','68','Asiento object (68)',1,'[{\"added\": {}}]',8,1),(127,'2020-05-30 20:10:58.084277','69','Asiento object (69)',1,'[{\"added\": {}}]',8,1),(128,'2020-05-30 20:11:03.811844','70','Asiento object (70)',1,'[{\"added\": {}}]',8,1),(129,'2020-05-30 20:11:12.599497','71','Asiento object (71)',1,'[{\"added\": {}}]',8,1),(130,'2020-05-30 20:11:17.324869','72','Asiento object (72)',1,'[{\"added\": {}}]',8,1),(131,'2020-05-30 20:11:22.127704','73','Asiento object (73)',1,'[{\"added\": {}}]',8,1),(132,'2020-05-30 20:11:27.236656','74','Asiento object (74)',1,'[{\"added\": {}}]',8,1),(133,'2020-05-30 20:11:32.117049','75','Asiento object (75)',1,'[{\"added\": {}}]',8,1),(134,'2020-05-30 20:11:36.622539','76','Asiento object (76)',1,'[{\"added\": {}}]',8,1),(135,'2020-05-30 20:11:40.874943','77','Asiento object (77)',1,'[{\"added\": {}}]',8,1),(136,'2020-05-30 20:11:45.856900','78','Asiento object (78)',1,'[{\"added\": {}}]',8,1),(137,'2020-05-30 20:11:59.077668','79','Asiento object (79)',1,'[{\"added\": {}}]',8,1),(138,'2020-05-30 20:12:08.704988','80','Asiento object (80)',1,'[{\"added\": {}}]',8,1),(139,'2020-05-30 20:12:13.937590','81','Asiento object (81)',1,'[{\"added\": {}}]',8,1),(140,'2020-05-30 20:12:18.930565','82','Asiento object (82)',1,'[{\"added\": {}}]',8,1),(141,'2020-05-30 20:12:25.495778','83','Asiento object (83)',1,'[{\"added\": {}}]',8,1),(142,'2020-05-30 20:12:30.116473','84','Asiento object (84)',1,'[{\"added\": {}}]',8,1),(143,'2020-05-30 20:12:34.793998','85','Asiento object (85)',1,'[{\"added\": {}}]',8,1),(144,'2020-05-30 20:12:45.543377','86','Asiento object (86)',1,'[{\"added\": {}}]',8,1),(145,'2020-05-30 20:12:51.543312','87','Asiento object (87)',1,'[{\"added\": {}}]',8,1),(146,'2020-05-30 20:12:56.595231','88','Asiento object (88)',1,'[{\"added\": {}}]',8,1),(147,'2020-05-30 20:37:53.432908','1','Menor de Edad',1,'[{\"added\": {}}]',16,1),(148,'2020-05-30 20:38:00.923444','2','General',1,'[{\"added\": {}}]',16,1),(149,'2020-05-30 20:38:09.441624','3','Tercera Edad',1,'[{\"added\": {}}]',16,1),(150,'2020-05-31 16:09:27.460808','1','Combo Informático',1,'[{\"added\": {}}]',12,1),(151,'2020-05-31 16:10:26.380291','1','Combo Informático',2,'[{\"changed\": {\"fields\": [\"Precio\"]}}]',12,1),(152,'2020-05-31 16:11:48.201454','2','Combo Leng en Familia',1,'[{\"added\": {}}]',12,1),(153,'2020-05-31 16:12:34.799791','3','Combo caliente',1,'[{\"added\": {}}]',12,1),(154,'2020-05-31 16:13:06.417660','4','Combo Caliente Caliente',1,'[{\"added\": {}}]',12,1),(155,'2020-05-31 16:13:21.959775','3','Combo Caliente',2,'[{\"changed\": {\"fields\": [\"Nombre\", \"Descripcion\"]}}]',12,1),(156,'2020-05-31 16:14:43.238036','5','Combo Acompañado',1,'[{\"added\": {}}]',12,1),(157,'2020-05-31 16:15:30.468490','6','Combo Enamorado',1,'[{\"added\": {}}]',12,1),(158,'2020-05-31 16:15:36.503872','6','Combo Enamorado',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',12,1),(159,'2020-06-02 14:28:16.946460','34','18 Presents',3,'',7,1),(160,'2020-06-02 14:28:17.094017','14','Amenaza en lo profundo',3,'',7,1),(161,'2020-06-02 14:28:17.301249','39','Artemis Fowl: el mundo subterráneo',3,'',7,1),(162,'2020-06-02 14:28:17.407483','11','Bad Boys para siempre',3,'',7,1),(163,'2020-06-02 14:28:17.522518','23','Divino amor',3,'',7,1),(164,'2020-06-02 14:28:17.602133','35','Dolittle',3,'',7,1),(165,'2020-06-02 14:28:17.722296','38','Dune',3,'',7,1),(166,'2020-06-02 14:28:17.775743','40','El llamado salvaje',3,'',7,1),(167,'2020-06-02 14:28:17.932253','44','Emma',3,'',7,1),(168,'2020-06-02 14:28:18.038034','25','Escape Room: sin salida',3,'',7,1),(169,'2020-06-02 14:28:18.099044','8','Escuadrón de la muerte',3,'',7,1),(170,'2020-06-02 14:28:18.498529','7','Hotel Transylvania 3: Monstruos de Vacaciones',3,'',7,1),(171,'2020-06-02 14:28:18.664814','37','Invasión: el fin de los tiempos',3,'',7,1),(172,'2020-06-02 14:28:18.768698','27','La cabaña',3,'',7,1),(173,'2020-06-02 14:28:18.866620','29','Los Croods 2',3,'',7,1),(174,'2020-06-02 14:28:18.950662','36','Los nuevos mutantes',3,'',7,1),(175,'2020-06-02 14:28:19.056346','31','Love Wedding Repeat',3,'',7,1),(176,'2020-06-02 14:28:19.184445','32','Modo Avión',3,'',7,1),(177,'2020-06-02 14:28:19.318816','16','Rápidos y Furiosos 9',3,'',7,1),(178,'2020-06-02 14:28:19.472587','41','Soul',3,'',7,1),(179,'2020-06-02 14:28:19.608882','9','Spider-Man: De regreso a casa',3,'',7,1),(180,'2020-06-02 14:28:19.730355','22','Te quiero, imbécil',3,'',7,1),(181,'2020-06-02 14:28:19.831571','42','The Lovebirds',3,'',7,1),(182,'2020-06-02 14:28:19.947744','43','The Photograph',3,'',7,1),(183,'2020-06-02 14:28:20.058825','24','The Room',3,'',7,1),(184,'2020-06-02 14:30:10.838566','28','El hoyo',2,'[{\"changed\": {\"fields\": [\"Imagen\"]}}]',7,1),(185,'2020-06-02 14:30:53.491939','21','Free Guy',2,'[{\"changed\": {\"fields\": [\"Imagen\"]}}]',7,1),(186,'2020-06-02 14:33:06.438501','45','dsfgh',1,'[{\"added\": {}}]',7,1),(187,'2020-06-02 14:34:50.337270','45','dsfgh',3,'',7,1),(188,'2020-06-03 03:41:30.328752','1','Combo Informático',1,'[{\"added\": {}}]',18,1),(189,'2020-06-03 03:41:55.870605','2','Combo Leng en Familia',1,'[{\"added\": {}}]',18,1),(190,'2020-06-03 03:42:15.904879','3','Combo Caliente',1,'[{\"added\": {}}]',18,1),(191,'2020-06-03 03:42:42.675524','4','Combo Caliente Caliente',1,'[{\"added\": {}}]',18,1),(192,'2020-06-03 03:43:14.010712','5','Combo Acompañado',1,'[{\"added\": {}}]',18,1),(193,'2020-06-03 03:43:36.507847','6','Combo Enamorado',1,'[{\"added\": {}}]',18,1),(194,'2020-06-06 20:42:23.095577','13','¡Scooby!',2,'[{\"changed\": {\"fields\": [\"Fecha salida\"]}}]',7,1),(195,'2020-06-06 21:48:28.679193','19','El conjuro 3',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',7,1),(196,'2020-06-07 18:06:55.514456','12','Sonic la película',2,'[{\"changed\": {\"fields\": [\"Duracion\"]}}]',7,1),(197,'2020-06-07 18:43:12.913373','13','¡Scooby!',2,'[{\"changed\": {\"fields\": [\"Duracion\"]}}]',7,1),(198,'2020-06-07 18:43:24.517287','1','Avengers: Endgame',2,'[{\"changed\": {\"fields\": [\"Duracion\"]}}]',7,1),(199,'2020-06-07 18:43:35.528856','15','Black Widow',2,'[{\"changed\": {\"fields\": [\"Duracion\"]}}]',7,1),(200,'2020-06-07 18:43:47.315454','19','El conjuro 3',2,'[{\"changed\": {\"fields\": [\"Duracion\"]}}]',7,1),(201,'2020-06-07 18:43:58.407685','28','El hoyo',2,'[{\"changed\": {\"fields\": [\"Duracion\"]}}]',7,1),(202,'2020-06-07 18:44:08.686044','26','El jardín secreto',2,'[{\"changed\": {\"fields\": [\"Duracion\"]}}]',7,1),(203,'2020-06-07 18:44:17.128982','21','Free Guy',2,'[{\"changed\": {\"fields\": [\"Duracion\"]}}]',7,1),(204,'2020-06-07 18:44:25.336341','17','Godzilla vs. Kong',2,'[{\"changed\": {\"fields\": [\"Duracion\"]}}]',7,1),(205,'2020-06-07 18:44:35.493993','18','Gretel y Hansel',2,'[{\"changed\": {\"fields\": [\"Duracion\"]}}]',7,1),(206,'2020-06-07 18:44:49.523172','5','Minions: The Rise of Gru',2,'[{\"changed\": {\"fields\": [\"Duracion\"]}}]',7,1),(207,'2020-06-07 18:44:57.821952','10','Mulán',2,'[{\"changed\": {\"fields\": [\"Duracion\"]}}]',7,1),(208,'2020-06-07 18:45:08.265179','30','Si supieras',2,'[{\"changed\": {\"fields\": [\"Duracion\"]}}]',7,1),(209,'2020-06-07 18:45:26.800725','12','Sonic la película',2,'[]',7,1),(210,'2020-06-07 18:45:32.762632','12','Sonic la película',2,'[]',7,1),(211,'2020-06-07 18:47:50.504926','47','Unidos',2,'[]',7,1),(212,'2020-06-07 18:48:01.198595','20','Violet y Finch',2,'[{\"changed\": {\"fields\": [\"Duracion\"]}}]',7,1),(213,'2020-06-07 18:48:09.356297','33','West Side Story',2,'[{\"changed\": {\"fields\": [\"Duracion\"]}}]',7,1),(214,'2020-06-07 18:48:18.041165','6','Wonder Woman 2',2,'[{\"changed\": {\"fields\": [\"Duracion\"]}}]',7,1),(215,'2020-06-07 19:15:17.355288','19','El conjuro 3',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',7,1),(216,'2020-06-07 19:46:50.808434','1','Avengers: Endgame',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',7,1),(217,'2020-06-07 19:46:56.356823','15','Black Widow',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',7,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(12,'combos','combo'),(13,'combos','entrada'),(5,'contenttypes','contenttype'),(14,'factura','comprascombos'),(17,'factura','comprasentradas'),(15,'factura','factura'),(8,'pelicula','asiento'),(24,'pelicula','categoria'),(18,'pelicula','combo'),(21,'pelicula','comprascombos'),(20,'pelicula','comprasentradas'),(16,'pelicula','entrada'),(19,'pelicula','factura'),(9,'pelicula','funcion'),(7,'pelicula','pelicula'),(27,'pelicula','producto'),(30,'pelicula','promociones'),(33,'pelicula','registroasientosreservados'),(25,'pelicula','registrocategorias'),(29,'pelicula','registrocombos'),(32,'pelicula','registrocompras'),(31,'pelicula','registropromociones'),(11,'pelicula','reservarasientos'),(10,'pelicula','sala'),(26,'pelicula','sucursal'),(28,'pelicula','tipoproductos'),(23,'pelicula','usuario'),(22,'pelicula','usuarios'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-05-28 21:35:53.471853'),(2,'auth','0001_initial','2020-05-28 21:36:02.899499'),(3,'admin','0001_initial','2020-05-28 21:36:39.305712'),(4,'admin','0002_logentry_remove_auto_add','2020-05-28 21:36:44.762021'),(5,'admin','0003_logentry_add_action_flag_choices','2020-05-28 21:36:44.850601'),(6,'contenttypes','0002_remove_content_type_name','2020-05-28 21:36:54.950830'),(7,'auth','0002_alter_permission_name_max_length','2020-05-28 21:37:01.522834'),(8,'auth','0003_alter_user_email_max_length','2020-05-28 21:37:02.381173'),(9,'auth','0004_alter_user_username_opts','2020-05-28 21:37:02.528775'),(10,'auth','0005_alter_user_last_login_null','2020-05-28 21:37:06.053961'),(11,'auth','0006_require_contenttypes_0002','2020-05-28 21:37:06.232483'),(12,'auth','0007_alter_validators_add_error_messages','2020-05-28 21:37:06.414997'),(13,'auth','0008_alter_user_username_max_length','2020-05-28 21:37:11.242226'),(14,'auth','0009_alter_user_last_name_max_length','2020-05-28 21:37:14.813687'),(15,'auth','0010_alter_group_name_max_length','2020-05-28 21:37:15.953480'),(16,'auth','0011_update_proxy_permissions','2020-05-28 21:37:16.207798'),(17,'pelicula','0001_initial','2020-05-28 21:37:18.493228'),(18,'pelicula','0002_auto_20200528_1732','2020-05-28 21:37:20.052576'),(19,'sessions','0001_initial','2020-05-28 21:37:22.429808'),(20,'combos','0001_initial','2020-05-30 16:42:15.419638'),(21,'combos','0002_delete_pelicula','2020-05-30 16:42:16.738188'),(22,'combos','0003_auto_20200530_0424','2020-05-30 16:42:17.043582'),(23,'factura','0001_initial','2020-05-30 16:42:19.557824'),(24,'factura','0002_auto_20200530_0425','2020-05-30 16:42:19.734952'),(25,'pelicula','0003_auto_20200530_0229','2020-05-30 16:42:39.048634'),(26,'pelicula','0004_auto_20200530_0237','2020-05-30 16:42:56.228571'),(27,'pelicula','0005_auto_20200530_0419','2020-05-30 16:42:57.179392'),(28,'pelicula','0006_auto_20200530_0420','2020-05-30 16:42:57.531496'),(29,'pelicula','0007_auto_20200530_0422','2020-05-30 16:42:57.927733'),(30,'combos','0004_auto_20200530_1632','2020-05-30 20:33:20.802994'),(31,'pelicula','0008_auto_20200530_1632','2020-05-30 20:33:22.300267'),(32,'factura','0003_auto_20200530_1632','2020-05-30 20:33:34.437335'),(33,'factura','0004_auto_20200602_2246','2020-06-03 02:46:54.463995'),(34,'combos','0005_delete_combo','2020-06-03 02:46:55.448359'),(35,'pelicula','0009_combo_comprascombos_comprasentradas_factura','2020-06-03 02:53:32.136578'),(36,'pelicula','0010_auto_20200602_2252','2020-06-03 02:53:54.505564'),(37,'pelicula','0011_auto_20200602_2253','2020-06-03 02:53:54.683034'),(38,'pelicula','0012_usuarios','2020-06-03 03:03:54.515766'),(39,'pelicula','0013_auto_20200602_2306','2020-06-03 03:06:40.926149'),(40,'pelicula','0014_delete_usuarios','2020-06-03 03:07:39.866825'),(41,'pelicula','0015_usuarios','2020-06-03 03:08:12.273843'),(42,'pelicula','0016_auto_20200602_2309','2020-06-03 03:09:16.770091'),(43,'pelicula','0017_factura_id_usuario','2020-06-03 03:21:57.291201'),(44,'pelicula','0018_auto_20200602_2335','2020-06-03 03:35:39.242307'),(45,'pelicula','0019_auto_20200621_0606','2020-06-21 06:06:08.159060'),(46,'pelicula','0020_usuario','2020-06-21 06:08:40.864941'),(47,'pelicula','0021_pelicula','2020-06-21 06:12:30.307796'),(48,'pelicula','0022_categoria_registrocategorias','2020-06-21 06:13:42.563267'),(49,'pelicula','0023_sala_sucursal','2020-06-21 06:14:41.991546'),(50,'pelicula','0024_asiento_funcion','2020-06-21 06:15:51.352074'),(51,'pelicula','0025_auto_20200621_0617','2020-06-21 06:17:30.178685'),(52,'pelicula','0026_factura_promociones','2020-06-21 06:18:41.373115'),(53,'pelicula','0027_registropromociones','2020-06-21 06:23:22.778641'),(54,'pelicula','0028_registroasientosreservados_registrocompras','2020-06-21 06:28:10.658985'),(55,'pelicula','0029_auto_20200621_0653','2020-06-21 06:53:12.646831');
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
INSERT INTO `django_session` VALUES ('9s7nvf22xa7s9uli07n8cesxhvyfcoji','N2FiMWNkYzhlMzliOTliOTE1NTMzOTdmNmYzYTdhMmY3N2I2MGM4Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3ZjkzZWE1MzJlZWY5NDQwYjczNzA3Yjg5NmVkMWU4NTJlZjNmZmU4In0=','2020-06-11 21:39:34.568544'),('lkimip6vp1vprov38h0felgt575n1cmq','MGYzZDY2MThiODIzZWI4Mzg4Y2QxMGE0ZDM4ODRlNWNiNjM0OWViYjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4MDdkYzJhZDQxMzA1OWEyNzQ5ZjVlYzA2ODI1MGEwNDIzMGVhNmQwIn0=','2020-07-05 06:06:37.974205'),('pgple7zysw1i1c5v6052yxnzpncn0fg9','N2FiMWNkYzhlMzliOTliOTE1NTMzOTdmNmYzYTdhMmY3N2I2MGM4Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3ZjkzZWE1MzJlZWY5NDQwYjczNzA3Yjg5NmVkMWU4NTJlZjNmZmU4In0=','2020-06-12 17:24:44.251055'),('vcyqwr7464oczfrlbl0q4os13t27fssu','N2FiMWNkYzhlMzliOTliOTE1NTMzOTdmNmYzYTdhMmY3N2I2MGM4Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3ZjkzZWE1MzJlZWY5NDQwYjczNzA3Yjg5NmVkMWU4NTJlZjNmZmU4In0=','2020-06-20 16:56:25.284740'),('zrd28rx3slefi7n858lu9gh1e697z3fe','N2FiMWNkYzhlMzliOTliOTE1NTMzOTdmNmYzYTdhMmY3N2I2MGM4Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3ZjkzZWE1MzJlZWY5NDQwYjczNzA3Yjg5NmVkMWU4NTJlZjNmZmU4In0=','2020-06-14 03:30:35.531493');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_asiento`
--

LOCK TABLES `pelicula_asiento` WRITE;
/*!40000 ALTER TABLE `pelicula_asiento` DISABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_categoria`
--

LOCK TABLES `pelicula_categoria` WRITE;
/*!40000 ALTER TABLE `pelicula_categoria` DISABLE KEYS */;
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
  `imagen` varchar(200) NOT NULL,
  `fecha_estreno` date NOT NULL,
  `fecha_salida` date NOT NULL,
  `duracion` time(6) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_pelicula`
--

LOCK TABLES `pelicula_pelicula` WRITE;
/*!40000 ALTER TABLE `pelicula_pelicula` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_producto`
--

LOCK TABLES `pelicula_producto` WRITE;
/*!40000 ALTER TABLE `pelicula_producto` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_registrocategorias`
--

LOCK TABLES `pelicula_registrocategorias` WRITE;
/*!40000 ALTER TABLE `pelicula_registrocategorias` DISABLE KEYS */;
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
  `id_producto_combo_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pelicula_registrocom_id_producto_combo_id_b2db4991_fk_pelicula_` (`id_producto_combo_id`),
  CONSTRAINT `pelicula_registrocom_id_producto_combo_id_b2db4991_fk_pelicula_` FOREIGN KEY (`id_producto_combo_id`) REFERENCES `pelicula_producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_registrocombos`
--

LOCK TABLES `pelicula_registrocombos` WRITE;
/*!40000 ALTER TABLE `pelicula_registrocombos` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_sala`
--

LOCK TABLES `pelicula_sala` WRITE;
/*!40000 ALTER TABLE `pelicula_sala` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_sucursal`
--

LOCK TABLES `pelicula_sucursal` WRITE;
/*!40000 ALTER TABLE `pelicula_sucursal` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_tipoproductos`
--

LOCK TABLES `pelicula_tipoproductos` WRITE;
/*!40000 ALTER TABLE `pelicula_tipoproductos` DISABLE KEYS */;
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
  `tipo_usuario` int NOT NULL,
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

-- Dump completed on 2020-06-21  3:03:43
