CREATE DATABASE  IF NOT EXISTS `restaurantedb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `restaurantedb`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: restaurantedb
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.10-MariaDB

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
-- Table structure for table `datosusers`
--

DROP TABLE IF EXISTS `datosusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datosusers` (
  `idDatosUsers` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuarios` int(11) NOT NULL,
  `Nombres` varchar(255) NOT NULL,
  `Apellidos` varchar(255) NOT NULL,
  `FechNace` date NOT NULL,
  `Genero` tinyint(4) NOT NULL,
  `Direccion` varchar(256) NOT NULL,
  `Telefonos` varchar(25) NOT NULL,
  PRIMARY KEY (`idDatosUsers`),
  KEY `fk_DatosUsers_Usuarios1_idx` (`idUsuarios`),
  CONSTRAINT `fk_DatosUsers_Usuarios1` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datosusers`
--

LOCK TABLES `datosusers` WRITE;
/*!40000 ALTER TABLE `datosusers` DISABLE KEYS */;
INSERT INTO `datosusers` VALUES (1,1,'Jhon','Medina','1986-01-12',0,'cr 255 #85-12','4444444'),(2,2,'Alexis','Cardona','2000-08-01',0,'cr 288 #85-12','333333'),(3,3,'Esteban','Flores','1986-09-07',0,'cr 277 #85-12','22222'),(4,4,'ramon','perez','1978-08-12',0,'cr198 #83-11','12345'),(5,5,'luis','gomez','1985-02-01',0,'cr85 #12-05','98625'),(6,6,'juan','ortiz','1955-02-01',0,'cr129 #12-05','8888888'),(7,7,'luis','gomez','1985-02-01',0,'cr92 #12-05','999999'),(8,8,'cristian','catrillon','1986-03-01',0,'cr98 #12-05','555555'),(9,9,'ramiro','portiz','1935-03-01',0,'cr24 #12-08','333333'),(10,10,'lola','perez','1935-03-01',1,'cr24 #12-08','333333'),(11,12,'gorger','cruz','1986-12-01',1,'ca 128-12','45293'),(12,13,'pepe','castrillom','2020-03-11',1,'cr 128-5','245856'),(13,14,'lola','castrillon','1985-05-05',1,'cr45-15','45856962');
/*!40000 ALTER TABLE `datosusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detafopa`
--

DROP TABLE IF EXISTS `detafopa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detafopa` (
  `idDetaFoPa` int(11) NOT NULL AUTO_INCREMENT,
  `idFoPago` int(11) NOT NULL,
  `idTransacciones` int(11) NOT NULL,
  `idTipoTran` int(11) NOT NULL,
  `ValorFoPA` decimal(10,0) NOT NULL COMMENT 'Valor de Forma de Pago',
  PRIMARY KEY (`idDetaFoPa`,`idFoPago`,`idTransacciones`,`idTipoTran`),
  KEY `fk_DetaFoPa_FoPago1_idx` (`idFoPago`),
  KEY `fk_DetaFoPa_Transacciones1_idx` (`idTransacciones`,`idTipoTran`),
  CONSTRAINT `fk_DetaFoPa_FoPago1` FOREIGN KEY (`idFoPago`) REFERENCES `fopago` (`idFoPago`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DetaFoPa_Transacciones1` FOREIGN KEY (`idTransacciones`, `idTipoTran`) REFERENCES `transacciones` (`idTransacciones`, `idTipoTran`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Detalle de forma d epago';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detafopa`
--

LOCK TABLES `detafopa` WRITE;
/*!40000 ALTER TABLE `detafopa` DISABLE KEYS */;
/*!40000 ALTER TABLE `detafopa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detatransaccion`
--

DROP TABLE IF EXISTS `detatransaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detatransaccion` (
  `idDetaTransaccion` int(11) NOT NULL AUTO_INCREMENT,
  `idTransacciones` int(11) NOT NULL,
  `idTipoTran` int(11) NOT NULL,
  `idUsuarios` int(11) NOT NULL,
  `idProductos` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idDetaTransaccion`),
  KEY `fk_DetaTransaccion_Transacciones1_idx` (`idTransacciones`,`idTipoTran`,`idUsuarios`),
  KEY `fk_DetaTransaccion_Productos1_idx` (`idProductos`),
  CONSTRAINT `fk_DetaTransaccion_Productos1` FOREIGN KEY (`idProductos`) REFERENCES `productos` (`idProductos`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DetaTransaccion_Transacciones1` FOREIGN KEY (`idTransacciones`, `idTipoTran`, `idUsuarios`) REFERENCES `transacciones` (`idTransacciones`, `idTipoTran`, `idUsuarios`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detatransaccion`
--

LOCK TABLES `detatransaccion` WRITE;
/*!40000 ALTER TABLE `detatransaccion` DISABLE KEYS */;
INSERT INTO `detatransaccion` VALUES (1,1,3,1,3,20),(2,2,1,2,1,70),(3,3,2,3,2,10),(4,5,3,5,7,20),(5,6,1,6,17,70),(6,7,2,7,26,10),(7,8,2,8,20,50),(8,9,3,9,3,20),(9,10,1,10,1,70),(10,11,2,10,22,10),(11,12,2,9,4,50),(12,13,3,8,24,20),(13,14,1,7,7,70),(14,15,2,6,9,10),(15,16,2,7,24,50),(16,17,3,5,3,20),(17,18,1,4,1,70),(18,19,2,3,2,10),(19,20,2,2,4,50),(20,21,3,1,7,20),(21,22,1,1,17,70),(22,23,2,2,21,10),(23,24,2,3,14,50),(24,25,2,4,4,50),(25,26,3,5,7,20),(26,27,1,6,17,70),(27,28,2,7,24,10),(28,29,2,8,18,50),(29,30,3,9,3,20),(30,31,1,10,11,70),(31,32,3,1,15,70),(32,33,1,2,3,27),(33,34,2,3,1,70),(34,35,2,4,2,10),(35,36,3,5,4,50),(36,37,1,6,7,20),(37,38,2,7,17,76);
/*!40000 ALTER TABLE `detatransaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fopago`
--

DROP TABLE IF EXISTS `fopago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fopago` (
  `idFoPago` int(11) NOT NULL AUTO_INCREMENT,
  `NombFoPA` varchar(45) NOT NULL COMMENT 'Nombre de Forma de pago\nEfe\nTarCred\nTarDeb\n',
  PRIMARY KEY (`idFoPago`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Tabla de Forma de Pago';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fopago`
--

LOCK TABLES `fopago` WRITE;
/*!40000 ALTER TABLE `fopago` DISABLE KEYS */;
INSERT INTO `fopago` VALUES (1,'Efectivo'),(2,'Targeta de credito'),(3,'Targeta debito'),(4,'Giro electronico');
/*!40000 ALTER TABLE `fopago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `idProductos` int(11) NOT NULL AUTO_INCREMENT,
  `idTipoProductos` int(11) NOT NULL,
  `nombreP` varchar(200) NOT NULL COMMENT 'nombre del produto',
  `tiempoP` time(5) NOT NULL COMMENT 'tiempo de preparacion',
  `ingre` varchar(200) DEFAULT NULL COMMENT 'ingredientes',
  `fechaV` datetime NOT NULL COMMENT 'fecha de vencimiento',
  `valorP` double NOT NULL,
  PRIMARY KEY (`idProductos`),
  KEY `fk_Productos_TipoProductos1_idx` (`idTipoProductos`),
  CONSTRAINT `fk_Productos_TipoProductos1` FOREIGN KEY (`idTipoProductos`) REFERENCES `tipopro` (`idTipoProductos`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,1,'jugo de naranja','00:00:10.00000','naranja-agua-azucar','2020-08-14 00:00:00',5000),(2,1,'jugo de mora','00:00:10.00000','mora-agua-azucar','2020-08-14 00:00:00',5000),(3,1,'jugo de lulo','00:00:10.00000','lulo-agua-azucar','2020-08-14 00:00:00',5000),(4,1,'jugo de piña','00:00:10.00000','piña-agua-azucar','2020-08-14 00:00:00',5000),(5,1,'jugo de fresa','00:00:10.00000','fresa-agua-azucar','2020-08-14 00:00:00',5000),(6,1,'jugo de mango','00:00:10.00000','mango-agua-azucar','2020-08-14 00:00:00',5000),(7,1,'jugo de maracuya','00:00:10.00000','maracuya-agua-azucar','2020-08-14 00:00:00',5000),(8,1,'soda michelada','00:00:05.00000','soda-hielo-limon','2020-12-14 00:00:00',5000),(9,1,'gaseosa','00:00:02.00000','gaseosa-hielo','2020-12-14 00:00:00',5000),(10,2,'yogur','00:00:30.00000','leche-agua-azucar','2020-08-14 00:00:00',3000),(11,2,'Helado','00:00:30.00000','leche-agua-azucar-leche condensada','2020-08-14 00:00:00',3000),(12,2,'queso','00:01:20.00000','quajo-leche','2020-09-17 00:00:00',20000),(13,3,'ron','00:00:02.00000','soda,hielo,ron','0000-00-00 00:00:00',10000),(14,3,'aguardiente','00:00:02.00000','Agua-aguardiente','0000-00-00 00:00:00',10000),(15,3,'martini','00:00:08.00000','Vermú Blanco Seco-Ginebra-aceitunas-limón-hielo ','0000-00-00 00:00:00',30000),(16,3,'piña colada','00:00:10.00000','piña-ron-hielo-vainilla','0000-00-00 00:00:00',15000),(17,3,'tequila','00:00:02.00000','limon-sal-tequila','0000-00-00 00:00:00',12000),(18,3,'vino','00:00:02.00000','vino','0000-00-00 00:00:00',25000),(19,3,'cubano','00:00:10.00000','ron-hielo-soda negra-limon','0000-00-00 00:00:00',8000),(20,3,'michelada','00:00:06.00000','cerveza-limon-hielo ','0000-00-00 00:00:00',6000),(21,4,'Ceviche de Chicharrón','00:00:03.00000','ají de tomate de árbol y cebolla morada, con chips de plátano','0000-00-00 00:00:00',23000),(22,4,'Entrada Típica','00:00:02.00000','Chicharrón, chorizo, morcilla, patacón y arepa, con hogao y limón','0000-00-00 00:00:00',28500),(23,4,'Crema de Maíz ','00:00:02.00000','crema de maíz...','0000-00-00 00:00:00',14500),(24,4,'Cazuela Típica','00:00:03.00000','sopa de fríjoles con carne desmechada, chorizo, maicitos y viruta de papa, acompañada de chicharroncitos, trocitos de plátano maduro, arroz y aguacate.','2020-08-14 00:00:00',36000),(25,4,'Ajiaco','00:00:02.00000',' sopa Santafereña a base de pollo, papas capira, pastusa y criolla, mazorcas y guasca, acompañada de crema de leche y alcaparras, arroz y aguacate','0000-00-00 00:00:00',35500),(26,4,'Lengua en salsa de Carne ','00:00:03.00000','Sudado de Lengua servida con papa, yuca, arroz y aguacate.','0000-00-00 00:00:00',39500),(27,4,'Sancocho Antioqueño ','00:00:02.00000','sopa Antioqueña a base de res y cerdo, con mazorca, arracacha, plátano, papa y yuca, acompañado de arroz y aguacate','0000-00-00 00:00:00',42500),(28,4,'Solomito','00:00:03.00000','Nuestro solomito es servido con papa asada o papa rústica. Acompañadas de ensalada.','0000-00-00 00:00:00',46500),(29,4,'Planchita Mixta','00:00:03.00000','Planchita mixta con combinación de carnes (solomito, cañon de cerdo, pollo) y pescado blanco, acompañada con ensalada fresca con vinagreta de albahaca y papa asada con sourcream de la casa.','0000-00-00 00:00:00',50500),(30,4,'Lomito de Res encostrado en 3 pimientas','00:00:02.00000','Lomito de Res encostrado en 3 Pimientas, con salsa de hongos, acompañado de puré de papa criolla y tomates cherry.','0000-00-00 00:00:00',51.5),(31,4,'Medallones de Solomito','00:00:03.00000','Jugosos Medallones de Solomito en salsa de vino tinto y champiñones acompañados de papa rústica y una fresca ensalada con aguacate.','0000-00-00 00:00:00',48500),(32,5,'Flan de Leche','00:00:02.00000','El flan de leche Hatoviejo es fresco, esponjoso y está cubierto de caramelo.','0000-00-00 00:00:00',12500),(33,5,'Postre de Milo','00:00:02.00000','Es un postre hecho a base de Milo, galleta y crema.','0000-00-00 00:00:00',12000),(34,5,'Mousse de chocolate','00:00:35.00000','chocolate-matequilla-huevos-azucar-sal','2020-12-17 00:00:00',10000),(35,5,'Mousse de chocolate blanco','00:00:35.00000','chocolate blanco-matequilla-huevos-azucar-sal','2020-12-17 00:00:00',10000),(36,5,'tartas','00:01:20.00000','harina-matequilla-huevos-azucar-sal','2020-10-17 00:00:00',30000),(37,5,'pastel','00:01:20.00000','harina-matequilla-huevos-azucar-sal-leche','2020-10-17 00:00:00',20000);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `idRoles` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuarios` int(11) NOT NULL,
  `idTipoUsers` int(11) NOT NULL,
  `FechaIni` date NOT NULL,
  `EstaRol` tinyint(4) NOT NULL,
  PRIMARY KEY (`idRoles`),
  KEY `fk_Roles_Usuarios1_idx` (`idUsuarios`),
  KEY `fk_Roles_TipoUsers1_idx` (`idTipoUsers`),
  CONSTRAINT `fk_Roles_TipoUsers1` FOREIGN KEY (`idTipoUsers`) REFERENCES `tipousers` (`idTipoUsers`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Roles_Usuarios1` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,1,1,'2020-09-10',1),(2,2,2,'2019-07-20',1),(3,3,3,'2018-08-22',1),(4,4,2,'2018-08-22',1),(5,4,1,'2018-08-22',1),(6,5,2,'2018-08-22',1),(7,5,3,'2018-08-22',1),(8,6,3,'2018-08-22',1),(9,7,2,'2018-08-22',1),(10,8,3,'2018-08-22',1),(11,9,2,'2018-08-22',1),(12,10,2,'2018-08-22',1),(13,12,2,'2020-05-12',1),(14,12,3,'2020-07-07',1),(15,13,3,'2020-07-07',1),(16,14,3,'2020-05-08',1);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipopro`
--

DROP TABLE IF EXISTS `tipopro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipopro` (
  `idTipoProductos` int(11) NOT NULL AUTO_INCREMENT,
  `nomCat` varchar(200) NOT NULL COMMENT 'nombre categoria',
  PRIMARY KEY (`idTipoProductos`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='se define el tipo de producto';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipopro`
--

LOCK TABLES `tipopro` WRITE;
/*!40000 ALTER TABLE `tipopro` DISABLE KEYS */;
INSERT INTO `tipopro` VALUES (1,'bebidas'),(2,'lacteos'),(3,'licores'),(4,'comidas'),(5,'postres');
/*!40000 ALTER TABLE `tipopro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipotran`
--

DROP TABLE IF EXISTS `tipotran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipotran` (
  `idTipoTran` int(11) NOT NULL AUTO_INCREMENT,
  `NombTipo` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoTran`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipotran`
--

LOCK TABLES `tipotran` WRITE;
/*!40000 ALTER TABLE `tipotran` DISABLE KEYS */;
INSERT INTO `tipotran` VALUES (1,'en proceso'),(2,'cancelado'),(3,'finalizado');
/*!40000 ALTER TABLE `tipotran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousers`
--

DROP TABLE IF EXISTS `tipousers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipousers` (
  `idTipoUsers` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Iterador de Tipo de Usuarios',
  `NombTiUs` varchar(45) NOT NULL COMMENT 'Nombre de tipo de usuario:\nAdministrador\nEmpleado\nEstudiante\netc.',
  PRIMARY KEY (`idTipoUsers`),
  UNIQUE KEY `NombTiUs_UNIQUE` (`NombTiUs`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Tabla para los tipos de usuario:\nAdministrador\nEmpleado\nEstudiante\netc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousers`
--

LOCK TABLES `tipousers` WRITE;
/*!40000 ALTER TABLE `tipousers` DISABLE KEYS */;
INSERT INTO `tipousers` VALUES (1,'administrador'),(3,'cliente'),(2,'vendedor');
/*!40000 ALTER TABLE `tipousers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousers_has_usuarios`
--

DROP TABLE IF EXISTS `tipousers_has_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipousers_has_usuarios` (
  `idTipoUsers` int(11) NOT NULL,
  `idUsuarios` int(11) NOT NULL,
  PRIMARY KEY (`idTipoUsers`,`idUsuarios`),
  KEY `fk_TipoUsers_has_Usuarios_Usuarios1_idx` (`idUsuarios`),
  KEY `fk_TipoUsers_has_Usuarios_TipoUsers1_idx` (`idTipoUsers`),
  CONSTRAINT `fk_TipoUsers_has_Usuarios_TipoUsers1` FOREIGN KEY (`idTipoUsers`) REFERENCES `tipousers` (`idTipoUsers`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_TipoUsers_has_Usuarios_Usuarios1` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousers_has_usuarios`
--

LOCK TABLES `tipousers_has_usuarios` WRITE;
/*!40000 ALTER TABLE `tipousers_has_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipousers_has_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacciones`
--

DROP TABLE IF EXISTS `transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transacciones` (
  `idTransacciones` int(11) NOT NULL AUTO_INCREMENT,
  `idTipoTran` int(11) NOT NULL,
  `idUsuarios` int(11) NOT NULL,
  `idVendedor` int(11) DEFAULT NULL,
  `NumeTran` varchar(255) NOT NULL,
  `fechaTran` date NOT NULL,
  `valorTran` decimal(10,0) NOT NULL,
  `estaTran` tinyint(1) NOT NULL,
  PRIMARY KEY (`idTransacciones`,`idTipoTran`,`idUsuarios`),
  KEY `fk_Transacciones_Usuarios1_idx` (`idUsuarios`),
  KEY `fk_Transacciones_TipoTran1_idx` (`idTipoTran`),
  KEY `fk_Transacciones_Vendedor1_idx` (`idVendedor`),
  CONSTRAINT `fk_Transacciones_TipoTran1` FOREIGN KEY (`idTipoTran`) REFERENCES `tipotran` (`idTipoTran`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Transacciones_Usuarios1` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Transacciones_Vendedor1` FOREIGN KEY (`idVendedor`) REFERENCES `vendedor` (`idVendedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacciones`
--

LOCK TABLES `transacciones` WRITE;
/*!40000 ALTER TABLE `transacciones` DISABLE KEYS */;
INSERT INTO `transacciones` VALUES (1,3,1,1,'1','2020-02-13',40000,1),(2,1,2,2,'2','2020-03-17',80000,0),(3,2,3,3,'3','2020-03-17',50000,1),(4,2,4,1,'4','2020-03-17',200000,1),(5,3,5,3,'5','2020-02-13',40000,1),(6,1,6,2,'6','2020-03-17',80000,0),(7,2,7,3,'7','2020-03-17',50000,1),(8,2,8,2,'8','2020-03-17',200000,1),(9,3,9,1,'9','2020-02-13',40000,1),(10,1,10,2,'10','2020-03-17',80000,0),(11,2,10,3,'11','2020-03-17',50000,1),(12,2,9,1,'12','2020-03-17',200000,1),(13,3,8,3,'13','2020-02-13',40000,1),(14,1,7,2,'14','2020-03-17',80000,0),(15,2,6,3,'15','2020-03-17',50000,1),(16,2,7,2,'16','2020-03-17',200000,1),(17,3,5,1,'17','2020-02-13',40000,1),(18,1,4,2,'18','2020-03-17',80000,0),(19,2,3,3,'19','2020-03-17',50000,1),(20,2,2,1,'20','2020-03-17',200000,1),(21,3,1,2,'21','2020-02-13',40000,1),(22,1,1,2,'22','2020-03-17',80000,0),(23,2,2,3,'23','2020-03-17',50000,1),(24,2,3,1,'24','2020-03-17',200000,1),(25,2,4,1,'25','2020-04-19',850000,1),(26,3,5,3,'26','2020-04-19',47000,1),(27,1,6,2,'27','2020-04-19',87800,0),(28,2,7,3,'28','2020-04-19',54000,1),(29,2,8,1,'29','2020-04-19',560700,1),(30,3,9,1,'30','2020-04-19',24000,1),(31,1,10,2,'31','2020-04-19',74000,0),(32,3,1,1,'32','2020-08-13',40000,1),(33,1,2,2,'33','2020-08-17',80000,0),(34,2,3,3,'34','2020-07-27',50000,1),(35,2,4,1,'35','2020-07-14',200000,1),(36,3,5,2,'36','2020-07-13',40000,1),(37,1,6,2,'37','2020-03-15',80000,0),(38,2,7,3,'38','2020-09-17',50000,1),(39,2,8,3,'39','2020-04-18',200000,1),(40,3,9,1,'40','2020-02-13',40000,1),(41,1,10,2,'41','2020-03-17',80000,0),(42,2,10,3,'42','2020-05-16',50000,1),(43,2,9,1,'43','2020-03-17',200000,1),(44,3,8,2,'44','2020-06-13',40000,1),(45,1,7,2,'45','2020-03-17',80000,0),(46,2,6,3,'46','2020-04-14',50000,1),(47,2,7,1,'47','2020-03-01',200000,1),(48,3,5,1,'48','2020-02-13',40000,1),(49,1,4,2,'49','2020-03-17',80000,0),(50,2,3,1,'50','2020-05-15',50000,1),(51,2,2,1,'51','2020-03-17',200000,1),(52,3,1,2,'52','2020-02-13',40000,1),(53,1,1,2,'53','2020-03-15',80000,0),(54,2,2,3,'54','2020-08-07',50000,1),(55,2,3,3,'55','2020-03-17',200000,1),(56,2,4,1,'56','2020-04-19',850000,1),(57,3,5,2,'57','2020-08-19',47000,1),(58,1,6,2,'58','2020-04-14',87800,0),(59,2,7,3,'59','2020-05-19',54000,1),(60,2,8,1,'60','2020-04-18',560700,1),(61,3,9,1,'61','2020-06-19',24000,1),(62,1,10,2,'62','2020-04-19',74000,0);
/*!40000 ALTER TABLE `transacciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(16) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `create_time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idUsuarios` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Iterador de Usuarios',
  `emailUser` varchar(256) NOT NULL COMMENT 'Correo electrónico del usuario',
  `PassUser` varchar(45) NOT NULL COMMENT 'Contraseña del usuario se usa el método SHA',
  `EstaUser` tinyint(4) NOT NULL COMMENT 'Estado del Usuario',
  PRIMARY KEY (`idUsuarios`),
  UNIQUE KEY `emailUser_UNIQUE` (`emailUser`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='Tabla para los usuarios del sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'camilo@gmail.com','d214d0b5ac513c7e3d8c1fb3206d31fcb0669856',1),(2,'juandavid@gmail.com','37f39fc8167cfd920edb65cea44e92d6cb481dd7',1),(3,'maria9080@gmail.com','7f6f62df65958adec0bdf1330419fc6eb9dbcaec',1),(4,'carlos@gmail.com','18df47070dd7ffe15183293962cd6e3efbfbd2d8',1),(5,'luisr@gmail.com','70f76cfdd1af9fd3baa8c63ac7cbae540e782431',1),(6,'juanPerez@hotmail.com','a0fe408ba444ffe0773480fd893dfb3f0c53f099',1),(7,'Eduardo5670@gmail.com','117b8eb0a565dc54e8f60086dd4ed43253e331ef',1),(8,'juanD10@hotmail.com','4dde630fa7660e37f6c97704203aa7a69a46e86c',1),(9,'Ramiro35Ortiz@gmail.com','efce2b2d412f57f17711654e0c7f6144d673e56e',1),(10,'sofiajh70@hotmail.com','3cfa604628131e18dc6c5df216a6aad20d159be2',1),(11,'fredy@','7110eda4d09e062aa5e4a390b0a572ac0d2c0220',0),(12,'fred@','229be39e04f960e46d8a64cadc8b4534e6bfc364',1),(13,'gorge@','229be39e04f960e46d8a64cadc8b4534e6bfc364',0),(14,'lolo@','d378a7d4f1f8ee5c63220d8ae106aef3b5388371',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendedor` (
  `idVendedor` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuarios` int(11) NOT NULL,
  `FechaIng` varchar(45) NOT NULL,
  `EstaVendedor` tinyint(4) NOT NULL,
  PRIMARY KEY (`idVendedor`),
  KEY `fk_Vendedor_Usuarios1_idx` (`idUsuarios`),
  CONSTRAINT `fk_Vendedor_Usuarios1` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (1,1,'2012-08-14',1),(2,2,'2019-02-17',0),(3,3,'2009-07-20',1),(4,12,'2020-5-12',1);
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'restaurantedb'
--

--
-- Dumping routines for database 'restaurantedb'
--
/*!50003 DROP PROCEDURE IF EXISTS `CRUDUSERS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDUSERS`(
# Parámetros de entrada:
# Tabla usuarios:
in v_iduser int,
in v_email varchar(256),
in v_Pass varchar(45),

# Tabla datosUsuario:
in v_nombre varchar(255),
in v_apellido varchar(255),
in v_fechanace date,
in v_genero tinyint(4),
in v_direccion varchar(256),
in v_tel varchar(25),

# Tabla vendedor:
in v_fechaIng varchar(45),

# tabla de roles
in v_fechaini date,

# tabla tipo de usuario
in v_TipoUsuario varchar(45),
#parametro opcion utilizado para guardar
in opcion varchar(45)
)
BEGIN
#definir constantes
SET @EstaUser=1;
SET @EstaRol =1;
SET @EstaVendedor =1;
# Validamos la opcion a ejecutar;
# Funcion condicional para vaidaciones:
case
 # Si guardaremos un vendedor, validamos el tipo de usuario vendedor:
 when v_TipoUsuario = 'vendedor' then
# -------------------------------------------------------------------------- #
	case
	# Validamos que opcion de CRUD queremos hacer: (CUD)
	when opcion = 'guardar' then
		# Validamos que el tipo de dato sea siempre 0:
		if v_iduser != 0 then 
			set v_iduser = 0; 
		end if;
		# Insertamos datos en las tablas usuarios, datosuser y vendesor:
        
        # Validación de usuarios repetidos:
        if v_email = (select emailUser from usuarios where emailUser = v_email) then 
			select 'Guardado en Usuarios y Datos de Usuario';
		else
			insert into usuarios values (v_iduser,v_email,sha(v_Pass),@EstaUser);
            # Capturar el último dato insertado en la tabla usuarios:
            set @iduser = (select max(idUsuarios) from usuarios);
            insert into datosusers values (0,@iduser,v_nombre,v_apellido,v_fechanace,v_genero,v_direccion,v_tel);
            #Insertando el rol
            insert into roles values (0,@iduser,2,v_fechaini,@EstaRol);
		end if;
        
		# Insertamos en la tabla de vendedor:
		insert into vendedor values (0,@iduser,v_fechaIng,@EstaVendedor);

		# Mostramos los datos de las tablas: 
		select * from usuarios, datosusers, vendedor;
		
	# Cuando la opción sea modificar:    
	when opcion = 'modificar' then
		# Query para modificar datos en una tabla:
		UPDATE datosusers
		SET Nombres = v_nombre, Apellidos = v_apellido, Direccion = v_direccion, Genero = v_genero, FechNce = v_fechanace, Telefonos = v_tel
		WHERE idUsuarios = v_iduser;        
		# mostramos los datos de la tabla modificada:
		select * from datosusers;
		
	# Cuando el caso sea borrar:
	when opcion = 'borrar' then
		UPDATE usuarios
		SET EstaUser = 0
		WHERE idUsuarios = v_iduser;    
		# Mostramos el resultado:
		select * from usuarios where EstaUser = 1;
		
	# Terminamos el segundo caso:
	end case;
# -------------------------------------------------------------------------- #
 
 # Si guardaremos un cliente, validamos el tipo de usuario cliente:
 when v_TipoUsuario = 'cliente' then
 	case
	# Validamos que opcion de CRUD queremos hacer: (CUD)
	when opcion = 'guardar' then
		# Validamos que el tipo de dato sea siempre 0:
		if v_iduser != 0 then 
			set v_iduser = 0; 
		end if;
        
		# Insertamos datos en las tablas usuarios, datosuser y rol:
		# Validación de usuarios repetidos:
        if v_email = (select emailUser from usuarios where emailUser = v_email) then 
			select 'Guardado en Usuarios y Datos de Usuario';
		else
			insert into usuarios values (v_iduser,v_email,sha(v_Pass),@EstaUser);
            # Capturar el último dato insertado en la tabla usuarios:
            set @iduser = (select max(idUsuarios) from usuarios);
            insert into datosusers values (0,@iduser,v_nombre,v_apellido,v_fechanace,v_genero,v_direccion,v_tel);
		end if;
		# Insertamos en la tabla de roles:
		insert into roles values (0,@iduser,3,v_fechaini,@EstaRol);
		
		# Mostramos los datos de las tablas: 
		select * from usuarios, datosusers, roles;
		
	# Cuando la opción sea modificar:    
	when opcion = 'modificar' then
		# Query para modificar datos en una tabla:
		UPDATE datosusers
		SET Nombres = v_nombre, Apellidos = v_apellido, Direccion = v_direccion, Genero = v_genero, FechNace = v_fechanace, Telefonos = v_tel
		WHERE idUsuarios = v_iduser;        
		# mostramos los datos de la tabla modificada:
		select * from datosusers;
		
	# Cuando el caso sea borrar:
	when opcion = 'borrar' then
		UPDATE usuarios
		SET EstaUser = 0
		WHERE idUsuarios = v_iduser;    
		# Mostramos el resultado:
		select * from usuarios where EstaUser = 1;
        
	# Terminamos el Tercer caso:
	end case;
# -------------------------------------------------------------------------- #
 # Si guardaremos un administrador, validamos el tipo de usuario administrador:
 when v_TipoUsuario = 'administrador' then
 	case
	# Validamos que opcion de CRUD queremos hacer: (CUD)
	when opcion = 'guardar' then
		# Validamos que el tipo de dato sea siempre 0:
		if v_iduser != 0 then 
			set v_iduser = 0; 
		end if;
        
		# Insertamos datos en las tablas usuarios, datosuser y rol:
		# Validación de usuarios repetidos:
        if v_email = (select emailUser from usuarios where emailUser = v_email) then 
			select 'Guardado en Usuarios y Datos de Usuario';
		else
			insert into usuarios values (v_iduser,v_email,sha(v_Pass),@EstaUser);
            # Capturar el último dato insertado en la tabla usuarios:
            set @iduser = (select max(idUsuarios) from usuarios);
            insert into datosusers values (0,@iduser,v_nombre,v_apellido,v_fechanace,v_genero,v_direccion,v_tel);
		end if;
		# Insertamos en la tabla de roles:
		insert into roles values (0,@iduser,1,v_fechaini,@EstaRol);
		
		# Mostramos los datos de las tablas: 
		select * from usuarios, datosusers, roles;
		
	# Cuando la opción sea modificar:    
	when opcion = 'modificar' then
		# Query para modificar datos en una tabla:
		UPDATE datosusers
		SET Nombres = v_nombre, Apellidos = v_apellido, Direccion = v_direccion, Genero = v_genero, FechNace = v_fechanace, Telefonos = v_tel
		WHERE idUsuarios = v_iduser;        
		# mostramos los datos de la tabla modificada:
		select * from datosusers;
		
	# Cuando el caso sea borrar:
	when opcion = 'borrar' then
		UPDATE usuarios
		SET EstaUser = 0
		WHERE idUsuarios = v_iduser;    
		# Mostramos el resultado:
		select * from usuarios where EstaUser = 1;
        
	# Terminamos el Cuarto caso:
	end case;
 
 # -------------------------------------------------------------------------- #
# Terminamos el primer caso:
end case;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-23 18:01:15
