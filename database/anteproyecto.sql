# ************************************************************
# Sequel Ace SQL dump
# Versión 20062
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Equipo: 192.168.10.10 (MySQL 8.0.31-0ubuntu0.20.04.2)
# Base de datos: anteproyecto
# Tiempo de generación: 2023-12-12 15:42:58 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla area_usuario
# ------------------------------------------------------------

DROP TABLE IF EXISTS `area_usuario`;

CREATE TABLE `area_usuario` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint unsigned NOT NULL,
  `area_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `area_usuario_usuario_id_foreign` (`usuario_id`),
  KEY `area_usuario_area_id_foreign` (`area_id`),
  CONSTRAINT `area_usuario_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `area_usuario_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `area_usuario` WRITE;
/*!40000 ALTER TABLE `area_usuario` DISABLE KEYS */;

INSERT INTO `area_usuario` (`id`, `usuario_id`, `area_id`, `created_at`, `updated_at`)
VALUES
	(1,1,32,NULL,NULL),
	(2,2,32,'2023-12-04 15:51:07','2023-12-04 15:51:07'),
	(3,3,32,'2023-12-04 15:52:56','2023-12-04 15:52:56'),
	(4,4,8,'2023-12-08 07:04:41','2023-12-08 07:04:41');

/*!40000 ALTER TABLE `area_usuario` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla areas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `areas`;

CREATE TABLE `areas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;

INSERT INTO `areas` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`)
VALUES
	(1,'Presidencia','',NULL,NULL),
	(2,'Ponencia del Magistrado Adolfo Riva Palacio Neri ','',NULL,NULL),
	(3,'Ponencia de la Magistrada Aidé Macedo Barceinas ','',NULL,NULL),
	(4,'Ponencia del Magistrado Alejandro Delint García ','',NULL,NULL),
	(5,'Ponencia del Magistrado Armando Ismael Maitret Hernández ','',NULL,NULL),
	(6,'Ponencia del Magistrado Darío Velasco Gutiérrez','',NULL,NULL),
	(7,'Secretaría General ','',NULL,NULL),
	(8,'Secretaría Administrativa ','',NULL,NULL),
	(9,'Contraloría General','',NULL,NULL),
	(10,'Dirección General Jurídica','',NULL,NULL),
	(11,'Unidad de Jurisprudencia y Estadística','',NULL,NULL),
	(12,'Unidad de Promoción de los Derechos Político-Electorales y de Relación con Organismos Electorales Nacionales e Internacionales','',NULL,NULL),
	(13,'Unidad de Tecnologías de la Información ','',NULL,NULL),
	(14,'Coordinación de Comunicación Social','',NULL,NULL),
	(15,'Coordinación de Transparencia','',NULL,NULL),
	(16,'Centro de Capacitación','',NULL,NULL),
	(17,'Comisión de Conciliación y Arbitraje','',NULL,NULL),
	(18,'Ponencia de la Mgda. Martha Leticia Mercado Ramírez','',NULL,NULL),
	(19,'Ponencia del Magistrado Eduardo Arana Miraval','',NULL,NULL),
	(20,'Ponencia del Magistrado Armando Hernández Cruz','',NULL,NULL),
	(21,'Ponencia de la Magistrada Gabriela Eugenia del Valle Pérez','',NULL,NULL),
	(22,'Ponencia del Magistrado Gustavo Anzaldo Hernández','',NULL,NULL),
	(23,'Comisión de Controversias Laborales y Administrativas','',NULL,NULL),
	(24,'Ponencia de la Magistrada Martha Alejandra Chávez Camarena','',NULL,NULL),
	(25,'Instituto de Formación y Capacitación','',NULL,NULL),
	(26,'Coordinación de Difusión y Publicación','',NULL,NULL),
	(27,'Coordinación de Archivo y Documentación','',NULL,NULL),
	(28,'Coordinación de Género y Derechos Humanos','',NULL,NULL),
	(29,'Contraloría Interna','',NULL,NULL),
	(30,'Unidad de Estadística y Jurisprudencia','',NULL,NULL),
	(31,'Coordinación de Archivo','',NULL,NULL),
	(32,'Unidad de Servicios Informáticos','',NULL,NULL),
	(33,'Defensoria Publica de Participación Ciudadana y de Proceso Democraticos','',NULL,NULL),
	(34,'Coordinación de Vinculación y Relaciones Internacionales','',NULL,NULL),
	(35,'Unidad Especializada de Procedimientos Sancionadores','',NULL,NULL),
	(36,'Coordinación de Derechos Humanos y Género','',NULL,NULL),
	(37,'Coordinación de Transparencia y Protección de Datos Personales','',NULL,NULL),
	(38,'Coordinación de Comunicación Social y Relaciones Públicas','',NULL,NULL),
	(39,'Ponencia del Magistrado Juan Carlos Sánchez León','',NULL,NULL);

/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla capitulos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `capitulos`;

CREATE TABLE `capitulos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `capitulo` int NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `capitulos` WRITE;
/*!40000 ALTER TABLE `capitulos` DISABLE KEYS */;

INSERT INTO `capitulos` (`id`, `capitulo`, `descripcion`, `created_at`, `updated_at`)
VALUES
	(1,1000,'Servicios personales',NULL,NULL),
	(2,2000,'Materiales y suministros',NULL,NULL),
	(3,3000,'Servicios generales',NULL,NULL),
	(4,4000,'Transferencias, asignaciones, subsidios y otras ayudas',NULL,NULL),
	(5,5000,'Bienes muebles, inmuebles e intangibles',NULL,NULL),
	(6,6000,'Inversión pública',NULL,NULL),
	(7,7000,'Inversiones financieras y otras provisiones',NULL,NULL),
	(8,8000,'Participaciones y aportaciones',NULL,NULL),
	(9,9000,'Deuda pública',NULL,NULL);

/*!40000 ALTER TABLE `capitulos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla conceptos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `conceptos`;

CREATE TABLE `conceptos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `capitulo_id` bigint unsigned NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conceptos_capitulo_id_foreign` (`capitulo_id`),
  CONSTRAINT `conceptos_capitulo_id_foreign` FOREIGN KEY (`capitulo_id`) REFERENCES `capitulos` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `conceptos` WRITE;
/*!40000 ALTER TABLE `conceptos` DISABLE KEYS */;

INSERT INTO `conceptos` (`id`, `capitulo_id`, `descripcion`, `numero`, `created_at`, `updated_at`)
VALUES
	(1,2,'MATERIALES DE ADMINISTRACIÓN, EMISIÓN DE DOCUMENTOS Y ARTÍCULOS OFICIALES.','2100',NULL,NULL),
	(2,2,'ALIMENTOS Y UTENSILIOS.','2200',NULL,NULL),
	(3,2,'MATERIALES Y ARTÍCULOS DE CONSTRUCCIÓN Y DE REPARACIÓN.','2400',NULL,NULL),
	(4,2,'PRODUCTOS QUÍMICOS, FARMACÉUTICOS Y DE LABORATORIO.','2500',NULL,NULL),
	(5,2,'COMBUSTIBLES, LUBRICANTES Y ADITIVOS.','2600',NULL,NULL),
	(6,2,'VESTUARIO, BLANCOS, PRENDAS DE PROTECCIÓN Y ARTÍCULOS DEPORTIVOS.','2700',NULL,NULL),
	(7,2,'MATERIALES Y SUMINISTROS PARA SEGURIDAD.','2800',NULL,NULL),
	(8,2,'HERRAMIENTAS, REFACCIONES Y ACCESORIOS MENORES.','2900',NULL,NULL),
	(9,3,'SERVICIOS BÁSICOS.','3100',NULL,NULL),
	(10,3,'SERVICIOS DE ARRENDAMIENTO.','3200',NULL,NULL),
	(11,3,'SERVICIOS PROFESIONALES, CIENTÍFICOS, TÉCNICOS Y OTROS SERVICIOS.','3300',NULL,NULL),
	(12,3,'SERVICIOS FINANCIEROS, BANCARIOS Y COMERCIALES.','3400',NULL,NULL),
	(13,3,'SERVICIOS DE INSTALACIÓN, REPARACIÓN, MANTENIMIENTO Y CONSERVACIÓN.','3500',NULL,NULL),
	(14,3,'SERVICIOS DE COMUNICACIÓN SOCIAL Y PUBLICIDAD.','3600',NULL,NULL),
	(15,3,'SERVICIOS DE TRASLADO Y VIÁTICOS.','3700',NULL,NULL),
	(16,3,'SERVICIOS OFICIALES.','3800',NULL,NULL),
	(17,3,'OTROS SERVICIOS GENERALES.','3900',NULL,NULL),
	(18,4,'TRANSFERENCIAS INTERNAS Y ASIGNACIONES AL SECTOR PÚBLICO.','4100',NULL,NULL),
	(19,4,'TRANSFERENCIAS AL RESTO DEL SECTOR PÚBLICO.','4200',NULL,NULL),
	(20,4,'SUBSIDIOS Y SUBVENCIONES.','4300',NULL,NULL),
	(21,4,'AYUDAS SOCIALES.','4400',NULL,NULL),
	(22,4,'PENSIONES Y JUBILACIONES.','4500',NULL,NULL),
	(23,4,'TRANSFERENCIAS A FIDEICOMISOS, MANDATOS Y OTROS ANÁLOGOS.','4600',NULL,NULL),
	(24,4,'TRANSFERENCIAS A LA SEGURIDAD SOCIAL.','4700',NULL,NULL),
	(25,4,'DONATIVOS.','4800',NULL,NULL),
	(26,4,'TRANSFERENCIAS AL EXTERIOR.','4900',NULL,NULL),
	(27,5,'MOBILIARIO Y EQUIPO DE ADMINISTRACIÓN.','5100',NULL,NULL),
	(28,5,'MOBILIARIO Y EQUIPO EDUCACIONAL Y RECREATIVO.','5200',NULL,NULL),
	(29,5,'EQUIPO E INSTRUMENTAL MÉDICO Y DE LABORATORIO.','5300',NULL,NULL),
	(30,5,'VEHÍCULOS Y EQUIPO DE TRANSPORTE.','5400',NULL,NULL),
	(31,5,'EQUIPO DE DEFENSA Y SEGURIDAD.','5500',NULL,NULL),
	(32,5,'MAQUINARIA, OTROS EQUIPOS Y HERRAMIENTAS.','5600',NULL,NULL),
	(33,5,'ACTIVOS BIOLÓGICOS.','5700',NULL,NULL),
	(34,5,'BIENES INMUEBLES.','5800',NULL,NULL),
	(35,5,'ACTIVOS INTANGIBLES.','5900',NULL,NULL),
	(36,6,'OBRA PÚBLICA EN BIENES DE DOMINIO PÚBLICO.','6100',NULL,NULL),
	(37,6,'OBRA PÚBLICA EN BIENES PROPIOS.','6200',NULL,NULL),
	(38,6,'PROYECTOS PRODUCTIVOS Y ACCIONES DE FOMENTO.','6300',NULL,NULL),
	(39,7,'INVERSIONES PARA EL FOMENTO DE ACTIVIDADES PRODUCTIVAS.','7100',NULL,NULL),
	(40,7,'ACCIONES Y PARTICIPACIONES DE CAPITAL.','7200',NULL,NULL),
	(41,7,'COMPRA DE TÍTULOS Y VALORES.','7300',NULL,NULL),
	(42,7,'CONCESIÓN DE PRÉSTAMOS.','7400',NULL,NULL),
	(43,7,'INVERSIONES EN FIDEICOMISOS, MANDATOS Y OTROS ANÁLOGOS.','7500',NULL,NULL),
	(44,7,'OTRAS INVERSIONES FINANCIERAS.','7600',NULL,NULL),
	(45,7,'PROVISIONES PARA CONTINGENCIAS Y OTRAS EROGACIONES ESPECIALES.','7900',NULL,NULL),
	(46,8,'PARTICIPACIONES.','8100',NULL,NULL),
	(47,8,'APORTACIONES.','8300',NULL,NULL),
	(48,8,'CONVENIOS.','8500',NULL,NULL),
	(49,9,'AMORTIZACIÓN DE LA DEUDA PÚBLICA.','9100',NULL,NULL),
	(50,9,'INTERESES DE LA DEUDA PÚBLICA.','9200',NULL,NULL),
	(51,9,'COMISIONES DE LA DEUDA PÚBLICA.','9300',NULL,NULL),
	(52,9,'GASTOS DE LA DEUDA PÚBLICA.','9400',NULL,NULL),
	(53,9,'COSTO POR COBERTURAS.','9500',NULL,NULL),
	(54,9,'APOYOS FINANCIEROS.','9600',NULL,NULL),
	(55,9,'ADEUDOS DE EJERCICIOS FISCALES ANTERIORES (ADEFAS).','9900',NULL,NULL);

/*!40000 ALTER TABLE `conceptos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla contrato_ejercicio
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contrato_ejercicio`;

CREATE TABLE `contrato_ejercicio` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ejercicio_id` bigint unsigned NOT NULL,
  `contrato_id` bigint unsigned NOT NULL,
  `escenario` int NOT NULL,
  `cerrado` tinyint(1) NOT NULL,
  `seleccionado` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contrato_ejercicio_ejercicio_id_foreign` (`ejercicio_id`),
  KEY `contrato_ejercicio_contrato_id_foreign` (`contrato_id`),
  CONSTRAINT `contrato_ejercicio_contrato_id_foreign` FOREIGN KEY (`contrato_id`) REFERENCES `contratos` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `contrato_ejercicio_ejercicio_id_foreign` FOREIGN KEY (`ejercicio_id`) REFERENCES `ejercicios` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `contrato_ejercicio` WRITE;
/*!40000 ALTER TABLE `contrato_ejercicio` DISABLE KEYS */;

INSERT INTO `contrato_ejercicio` (`id`, `ejercicio_id`, `contrato_id`, `escenario`, `cerrado`, `seleccionado`, `created_at`, `updated_at`)
VALUES
	(5,13,5,1,0,0,'2023-12-01 19:50:25','2023-12-01 19:50:25'),
	(6,13,6,1,0,0,'2023-12-01 20:16:08','2023-12-01 20:16:08'),
	(7,13,7,1,0,0,'2023-12-01 20:18:51','2023-12-01 20:18:51'),
	(8,13,8,1,0,0,'2023-12-01 20:19:52','2023-12-01 20:19:52'),
	(9,13,9,1,0,0,'2023-12-01 20:20:08','2023-12-01 20:20:08'),
	(10,13,10,1,0,0,'2023-12-08 18:19:24','2023-12-08 18:19:24');

/*!40000 ALTER TABLE `contrato_ejercicio` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla contrato_partida
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contrato_partida`;

CREATE TABLE `contrato_partida` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `contrato_ejercicio_id` bigint unsigned NOT NULL,
  `partida_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contrato_partida_contrato_ejercicio_id_foreign` (`contrato_ejercicio_id`),
  KEY `contrato_partida_partida_id_foreign` (`partida_id`),
  CONSTRAINT `contrato_partida_contrato_ejercicio_id_foreign` FOREIGN KEY (`contrato_ejercicio_id`) REFERENCES `contrato_ejercicio` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `contrato_partida_partida_id_foreign` FOREIGN KEY (`partida_id`) REFERENCES `partidas` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `contrato_partida` WRITE;
/*!40000 ALTER TABLE `contrato_partida` DISABLE KEYS */;

INSERT INTO `contrato_partida` (`id`, `contrato_ejercicio_id`, `partida_id`, `created_at`, `updated_at`)
VALUES
	(3,5,1,'2023-12-01 19:50:25','2023-12-01 19:50:25'),
	(4,6,5,'2023-12-01 20:16:08','2023-12-01 20:16:08'),
	(5,7,7,'2023-12-01 20:18:51','2023-12-01 20:18:51'),
	(6,8,7,'2023-12-01 20:19:52','2023-12-01 20:19:52'),
	(7,9,7,'2023-12-01 20:20:08','2023-12-01 20:20:08'),
	(8,10,24,'2023-12-08 18:19:24','2023-12-08 18:19:24');

/*!40000 ALTER TABLE `contrato_partida` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla contratos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contratos`;

CREATE TABLE `contratos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `clave` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `contratos` WRITE;
/*!40000 ALTER TABLE `contratos` DISABLE KEYS */;

INSERT INTO `contratos` (`id`, `clave`, `descripcion`, `created_at`, `updated_at`)
VALUES
	(5,'0101010101','PRUEBA','2023-12-01 19:50:25','2023-12-01 19:50:25'),
	(6,'0101010102','NUEVA PRUEBA','2023-12-01 20:16:08','2023-12-01 20:16:08'),
	(7,'0102010103','PRUEBA CON OTRO RESPONSABLE','2023-12-01 20:18:51','2023-12-01 20:18:51'),
	(8,'0102010103','PRUEBA CON OTRO RESPONSABLE','2023-12-01 20:19:52','2023-12-01 20:19:52'),
	(9,'0103010101','PRUEBA CON OTRO RESPONSABLE 2','2023-12-01 20:20:08','2023-12-01 20:20:08'),
	(10,'0101010101','Detalle de un nuevo contrato','2023-12-08 18:19:24','2023-12-08 18:19:24');

/*!40000 ALTER TABLE `contratos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla contratos_ejecucion
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contratos_ejecucion`;

CREATE TABLE `contratos_ejecucion` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `contrato_ejercicio_id` bigint unsigned NOT NULL,
  `mes_id` bigint unsigned NOT NULL,
  `costo` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contratos_ejecucion_contrato_ejercicio_id_foreign` (`contrato_ejercicio_id`),
  KEY `contratos_ejecucion_mes_id_foreign` (`mes_id`),
  CONSTRAINT `contratos_ejecucion_contrato_ejercicio_id_foreign` FOREIGN KEY (`contrato_ejercicio_id`) REFERENCES `contrato_ejercicio` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `contratos_ejecucion_mes_id_foreign` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `contratos_ejecucion` WRITE;
/*!40000 ALTER TABLE `contratos_ejecucion` DISABLE KEYS */;

INSERT INTO `contratos_ejecucion` (`id`, `contrato_ejercicio_id`, `mes_id`, `costo`, `created_at`, `updated_at`)
VALUES
	(2,9,1,100,'2023-12-04 18:18:39','2023-12-04 18:18:39'),
	(3,9,2,100,NULL,NULL),
	(4,9,3,100,NULL,NULL),
	(5,5,1,152.3,NULL,NULL),
	(6,5,2,314.5,NULL,NULL),
	(7,7,6,257.8,NULL,NULL),
	(8,7,7,987.45,NULL,NULL),
	(9,10,1,10000,'2023-12-08 18:20:19','2023-12-08 18:20:19');

/*!40000 ALTER TABLE `contratos_ejecucion` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla detalles_contratos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `detalles_contratos`;

CREATE TABLE `detalles_contratos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `contrato_ejercicio_id` bigint unsigned NOT NULL,
  `cantidad` double(8,2) NOT NULL,
  `costo_unitario` double NOT NULL,
  `unidad_medida_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `detalles_contratos_contrato_ejercicio_id_foreign` (`contrato_ejercicio_id`),
  KEY `detalles_contratos_unidad_medida_id_foreign` (`unidad_medida_id`),
  CONSTRAINT `detalles_contratos_contrato_ejercicio_id_foreign` FOREIGN KEY (`contrato_ejercicio_id`) REFERENCES `contrato_ejercicio` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detalles_contratos_unidad_medida_id_foreign` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidades_medida` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `detalles_contratos` WRITE;
/*!40000 ALTER TABLE `detalles_contratos` DISABLE KEYS */;

INSERT INTO `detalles_contratos` (`id`, `contrato_ejercicio_id`, `cantidad`, `costo_unitario`, `unidad_medida_id`, `created_at`, `updated_at`)
VALUES
	(2,9,3.00,1259.7,1,'2023-12-04 18:06:15','2023-12-08 03:20:20'),
	(3,7,1.00,20,1,'2023-12-04 18:18:58','2023-12-04 18:18:58');

/*!40000 ALTER TABLE `detalles_contratos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla ejercicio_programa
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ejercicio_programa`;

CREATE TABLE `ejercicio_programa` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ejercicio_id` bigint unsigned NOT NULL,
  `programa_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ejercicio_programa_ejercicio_id_foreign` (`ejercicio_id`),
  KEY `ejercicio_programa_programa_id_foreign` (`programa_id`),
  CONSTRAINT `ejercicio_programa_ejercicio_id_foreign` FOREIGN KEY (`ejercicio_id`) REFERENCES `ejercicios` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ejercicio_programa_programa_id_foreign` FOREIGN KEY (`programa_id`) REFERENCES `programas` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Volcado de tabla ejercicio_urg
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ejercicio_urg`;

CREATE TABLE `ejercicio_urg` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ejercicio_id` bigint unsigned NOT NULL,
  `unidad_responsable_gasto_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ejercicio_urg_ejercicio_id_foreign` (`ejercicio_id`),
  KEY `ejercicio_urg_unidad_responsable_gasto_id_foreign` (`unidad_responsable_gasto_id`),
  CONSTRAINT `ejercicio_urg_ejercicio_id_foreign` FOREIGN KEY (`ejercicio_id`) REFERENCES `ejercicios` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ejercicio_urg_unidad_responsable_gasto_id_foreign` FOREIGN KEY (`unidad_responsable_gasto_id`) REFERENCES `unidades_responsables_gastos` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Volcado de tabla ejercicios
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ejercicios`;

CREATE TABLE `ejercicios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ejercicio` int NOT NULL,
  `permitir_edicion_seguimiento` tinyint(1) NOT NULL,
  `permitir_edicion_seguimiento_derechos_humanos` tinyint(1) NOT NULL,
  `permitir_edicion_elaboracion` tinyint(1) NOT NULL,
  `activo_anteproyecto` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `ejercicios` WRITE;
/*!40000 ALTER TABLE `ejercicios` DISABLE KEYS */;

INSERT INTO `ejercicios` (`id`, `ejercicio`, `permitir_edicion_seguimiento`, `permitir_edicion_seguimiento_derechos_humanos`, `permitir_edicion_elaboracion`, `activo_anteproyecto`, `created_at`, `updated_at`)
VALUES
	(1,2012,0,0,0,0,NULL,'2023-12-08 14:56:33'),
	(2,2013,0,0,0,0,NULL,NULL),
	(3,2014,0,0,0,0,NULL,NULL),
	(4,2015,0,0,0,0,NULL,NULL),
	(5,2016,0,0,0,0,NULL,NULL),
	(6,2017,0,0,1,0,NULL,NULL),
	(7,2018,0,0,1,0,NULL,NULL),
	(8,2019,1,0,1,0,NULL,NULL),
	(9,2020,1,0,0,0,NULL,NULL),
	(10,2021,1,0,1,0,NULL,'2023-12-08 15:00:11'),
	(11,2022,0,0,1,1,NULL,'2023-11-28 19:22:39'),
	(12,2023,1,0,1,1,NULL,'2023-11-28 19:22:39'),
	(13,2024,1,0,1,1,NULL,'2023-11-28 19:22:39');

/*!40000 ALTER TABLE `ejercicios` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Volcado de tabla meses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `meses`;

CREATE TABLE `meses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abreviatura` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `meses` WRITE;
/*!40000 ALTER TABLE `meses` DISABLE KEYS */;

INSERT INTO `meses` (`id`, `descripcion`, `abreviatura`, `created_at`, `updated_at`)
VALUES
	(1,'Enero','Ene',NULL,NULL),
	(2,'Febrero','Feb',NULL,NULL),
	(3,'Marzo','Mar',NULL,NULL),
	(4,'Abril','Abr',NULL,NULL),
	(5,'Mayo','May',NULL,NULL),
	(6,'Junio','Jun',NULL,NULL),
	(7,'Julio','Jul',NULL,NULL),
	(8,'Agosto','Ago',NULL,NULL),
	(9,'Septiembre','Sep',NULL,NULL),
	(10,'Octubre','Oct',NULL,NULL),
	(11,'Noviembre','Nov',NULL,NULL),
	(12,'Diciembre','Dic',NULL,NULL);

/*!40000 ALTER TABLE `meses` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2019_08_19_000000_create_failed_jobs_table',1),
	(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
	(5,'2023_10_15_211736_create_roles_table',1),
	(6,'2023_10_15_211800_create_areas_table',1),
	(7,'2023_10_15_220542_create_ejercicios_table',1),
	(8,'2023_10_15_223352_create_unidades_medida_table',1),
	(9,'2023_10_15_224159_create_capitulos_table',1),
	(10,'2023_10_15_225607_create_conceptos_table',1),
	(11,'2023_10_16_042953_create_partidas_table',1),
	(12,'2023_10_16_130640_create_meses_table',1),
	(13,'2023_10_16_132030_create_unidades_responsables_gastos_table',1),
	(14,'2023_10_16_133656_create_programas_table',1),
	(15,'2023_10_16_135211_create_subprogramas_table',1),
	(16,'2023_10_16_163713_create_responsables_operativos_table',1),
	(17,'2023_10_16_164816_create_proyectos_table',1),
	(18,'2023_10_23_053450_create_ejercicio_programa_table',1),
	(19,'2023_10_23_053728_create_ejercicio_unidad_responsable_gasto_table',1),
	(20,'2023_10_23_054840_create_contratos_table',1),
	(21,'2023_10_24_054250_create_contrato_ejercicio_table',1),
	(22,'2023_10_24_054250_create_detalles_contratos_table',1),
	(23,'2023_11_06_150848_create_proyecto_responsable_operativo_table',1),
	(24,'2023_11_06_150917_create_proyecto_subprograma_table',1),
	(25,'2023_11_06_161931_create_area_usuario_table',1),
	(26,'2023_11_06_161955_create_rol_usuario_table',1),
	(27,'2023_11_07_065813_create_programa_subprograma_table',1),
	(28,'2023_11_07_133003_create_responsable_operativo_urg_table',1),
	(29,'2023_11_21_160821_create_contratos_ejecucion_table',1),
	(30,'2023_11_21_173343_create_contrato_partida_table',1),
	(31,'2023_11_28_163755_create_responsable_operativo_usuario_table',1),
	(32,'2023_11_28_185333_add_activo_anteproyecto_column_on_ejercicios_table',1),
	(33,'2023_12_01_001626_create_versiones_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla partidas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `partidas`;

CREATE TABLE `partidas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `concepto_id` bigint unsigned NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `partidas_concepto_id_foreign` (`concepto_id`),
  CONSTRAINT `partidas_concepto_id_foreign` FOREIGN KEY (`concepto_id`) REFERENCES `conceptos` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `partidas` WRITE;
/*!40000 ALTER TABLE `partidas` DISABLE KEYS */;

INSERT INTO `partidas` (`id`, `concepto_id`, `descripcion`, `numero`, `created_at`, `updated_at`)
VALUES
	(1,1,'Materiales, útiles y equipos menores de oficina.','2110',NULL,NULL),
	(2,1,'Materiales, útiles y equipos menores de oficina.','2111',NULL,NULL),
	(3,1,'Materiales y útiles de impresión y reproducción.','2120',NULL,NULL),
	(4,1,'Materiales y útiles de impresión y reproducción.','2121',NULL,NULL),
	(5,1,'Material estadístico y geográfico.','2130',NULL,NULL),
	(6,1,'Material estadístico y geográfico.','2131',NULL,NULL),
	(7,1,'Materiales, útiles y equipos menores de tecnologías de la información y comunicaciones.','2140',NULL,NULL),
	(8,1,'Materiales, útiles y equipos menores de tecnologías de la información y comunicaciones.','2141',NULL,NULL),
	(9,1,'Material impreso e información digital.','2150',NULL,NULL),
	(10,1,'Material impreso e información digital.','2151',NULL,NULL),
	(11,1,'Material de limpieza.','2160',NULL,NULL),
	(12,1,'Material de limpieza.','2161',NULL,NULL),
	(13,1,'Materiales y útiles de enseñanza.','2170',NULL,NULL),
	(14,1,'Materiales y útiles de enseñanza.','2171',NULL,NULL),
	(15,1,'Materiales para el registro e identificación de bienes y personas.','2180',NULL,NULL),
	(16,1,'Materiales para el registro e identificación de bienes y personas.','2181',NULL,NULL),
	(17,2,'Productos alimenticios para personas.','2210',NULL,NULL),
	(18,2,'Productos alimenticios y bebidas para personas.','2211',NULL,NULL),
	(19,2,'Productos alimenticios para animales.','2220',NULL,NULL),
	(20,2,'Productos alimenticios para animales.','2221',NULL,NULL),
	(21,2,'Utensilios para el servicio de alimentación.','2230',NULL,NULL),
	(22,2,'Utensilios para el servicio de alimentación.','2231',NULL,NULL),
	(23,3,'Productos minerales no metálicos.','2410',NULL,NULL),
	(24,3,'Mezcla asfáltica.','2411',NULL,NULL),
	(25,3,'Otros productos minerales no metálicos.','2419',NULL,NULL),
	(26,3,'Cemento y productos de concreto.','2420',NULL,NULL),
	(27,3,'Cemento y productos de concreto.','2421',NULL,NULL),
	(28,3,'Cal, yeso y productos de yeso.','2430',NULL,NULL),
	(29,3,'Cal, yeso y productos de yeso.','2431',NULL,NULL),
	(30,3,'Madera y productos de madera.','2440',NULL,NULL),
	(31,3,'Madera y productos de madera.','2441',NULL,NULL),
	(32,3,'Vidrio y productos de vidrio.','2450',NULL,NULL),
	(33,3,'Vidrio y productos de vidrio.','2451',NULL,NULL),
	(34,3,'Material eléctrico y electrónico.','2460',NULL,NULL),
	(35,3,'Material eléctrico y electrónico.','2461',NULL,NULL),
	(36,3,'Artículos metálicos para la construcción.','2470',NULL,NULL),
	(37,3,'Artículos metálicos para la construcción.','2471',NULL,NULL),
	(38,3,'Materiales complementarios.','2480',NULL,NULL),
	(39,3,'Materiales complementarios.','2481',NULL,NULL),
	(40,3,'Otros materiales y artículos de construcción y reparación.','2490',NULL,NULL),
	(41,3,'Otros materiales y artículos de construcción y reparación.','2491',NULL,NULL),
	(42,4,'Productos químicos básicos.','2510',NULL,NULL),
	(43,4,'Productos químicos básicos.','2511',NULL,NULL),
	(44,4,'Fertilizantes, pesticidas y otros agroquímicos.','2520',NULL,NULL),
	(45,4,'Fertilizantes, pesticidas y otros agroquímicos.','2521',NULL,NULL),
	(46,4,'Medicinas y productos farmacéuticos.','2530',NULL,NULL),
	(47,4,'Medicinas y productos farmacéuticos.','2531',NULL,NULL),
	(48,4,'Materiales, accesorios y suministros médicos.','2540',NULL,NULL),
	(49,4,'Materiales, accesorios y suministros médicos.','2541',NULL,NULL),
	(50,4,'Materiales, accesorios y suministros de laboratorio.','2550',NULL,NULL),
	(51,4,'Materiales, accesorios y suministros de laboratorio.','2551',NULL,NULL),
	(52,4,'Fibras sintéticas, hules, plásticos y derivados.','2560',NULL,NULL),
	(53,4,'Fibras sintéticas, hules, plásticos y derivados.','2561',NULL,NULL),
	(54,4,'Otros productos químicos.','2590',NULL,NULL),
	(55,4,'Otros productos químicos.','2591',NULL,NULL),
	(56,5,'Combustibles, lubricantes y aditivos.','2610',NULL,NULL),
	(57,5,'Combustibles, lubricantes y aditivos.','2611',NULL,NULL),
	(58,5,'Carbón y sus derivados.','2620',NULL,NULL),
	(59,5,'Carbón y sus derivados.','2621',NULL,NULL),
	(60,6,'Vestuario y uniformes.','2710',NULL,NULL),
	(61,6,'Vestuario y uniformes.','2711',NULL,NULL),
	(62,6,'Prendas de seguridad y protección personal.','2720',NULL,NULL),
	(63,6,'Prendas de seguridad y protección personal.','2721',NULL,NULL),
	(64,6,'Artículos deportivos.','2730',NULL,NULL),
	(65,6,'Artículos deportivos.','2731',NULL,NULL),
	(66,6,'Productos textiles.','2740',NULL,NULL),
	(67,6,'Productos textiles.','2741',NULL,NULL),
	(68,6,'Blancos y otros productos textiles, excepto prendas de vestir.','2750',NULL,NULL),
	(69,6,'Blancos y otros productos textiles, excepto prendas de vestir.','2751',NULL,NULL),
	(70,7,'Sustancias y materiales explosivos.','2810',NULL,NULL),
	(71,7,'Sustancias y materiales explosivos.','2811',NULL,NULL),
	(72,7,'Materiales de seguridad pública.','2820',NULL,NULL),
	(73,7,'Materiales de seguridad pública.','2821',NULL,NULL),
	(74,7,'Prendas de protección para seguridad pública y nacional.','2830',NULL,NULL),
	(75,7,'Prendas de protección para seguridad pública y nacional.','2831',NULL,NULL),
	(76,8,'Herramientas menores.','2910',NULL,NULL),
	(77,8,'Herramientas menores.','2911',NULL,NULL),
	(78,8,'Refacciones y accesorios menores de edificios.','2920',NULL,NULL),
	(79,8,'Refacciones y accesorios menores de edificios.','2921',NULL,NULL),
	(80,8,'Refacciones y accesorios menores de mobiliario y equipo de administración, educacional y recreativo.','2930',NULL,NULL),
	(81,8,'Refacciones y accesorios menores de mobiliario y equipo de administración, educacional y recreativo.','2931',NULL,NULL),
	(82,8,'Refacciones y accesorios menores de equipo de cómputo y tecnologías de la información.','2940',NULL,NULL),
	(83,8,'Refacciones y accesorios menores de equipo de cómputo y tecnologías de la información.','2941',NULL,NULL),
	(84,8,'Refacciones y accesorios menores de equipo e instrumental médico y de laboratorio.','2950',NULL,NULL),
	(85,8,'Refacciones y accesorios menores de equipo e instrumental médico y de laboratorio.','2951',NULL,NULL),
	(86,8,'Refacciones y accesorios menores de equipo de transporte.','2960',NULL,NULL),
	(87,8,'Refacciones y accesorios menores de equipo de transporte.','2961',NULL,NULL),
	(88,8,'Refacciones y accesorios menores de equipo de defensa y seguridad.','2970',NULL,NULL),
	(89,8,'Refacciones y accesorios menores de equipo de defensa y seguridad.','2971',NULL,NULL),
	(90,8,'Refacciones y accesorios menores de maquinaria y otros equipos.','2980',NULL,NULL),
	(91,8,'Refacciones y accesorios menores de maquinaria y otros equipos.','2981',NULL,NULL),
	(92,8,'Refacciones y accesorios menores otros bienes muebles.','2990',NULL,NULL),
	(93,8,'Refacciones y accesorios menores otros bienes muebles.','2991',NULL,NULL),
	(94,9,'Energía eléctrica.','3110',NULL,NULL),
	(95,9,'Contratación e instalación de energía eléctrica.','3111',NULL,NULL),
	(96,9,'Servicio de energía eléctrica.','3112',NULL,NULL),
	(97,9,'Gas.','3120',NULL,NULL),
	(98,9,'Gas.','3121',NULL,NULL),
	(99,9,'Agua.','3130',NULL,NULL),
	(100,9,'Agua potable.','3131',NULL,NULL),
	(101,9,'Agua tratada.','3132',NULL,NULL),
	(102,9,'Telefonía tradicional.','3140',NULL,NULL),
	(103,9,'Telefonía tradicional.','3141',NULL,NULL),
	(104,9,'Telefonía celular.','3150',NULL,NULL),
	(105,9,'Telefonía celular.','3151',NULL,NULL),
	(106,9,'Servicios de telecomunicaciones y satélites.','3160',NULL,NULL),
	(107,9,'Servicios de telecomunicaciones y satélites.','3161',NULL,NULL),
	(108,9,'Servicios de acceso de Internet, redes y procesamiento de información.','3170',NULL,NULL),
	(109,9,'Servicios de acceso de Internet, redes y procesamiento de información.','3171',NULL,NULL),
	(110,9,'Servicios postales y telegráficos.','3180',NULL,NULL),
	(111,9,'Servicios postales y telegráficos.','3181',NULL,NULL),
	(112,9,'Servicios integrales y otros servicios.','3190',NULL,NULL),
	(113,9,'Servicios integrales y otros servicios.','3191',NULL,NULL),
	(114,10,'Arrendamiento de terrenos.','3210',NULL,NULL),
	(115,10,'Arrendamiento de terrenos.','3211',NULL,NULL),
	(116,10,'Arrendamiento de edificios.','3220',NULL,NULL),
	(117,10,'Arrendamiento de edificios.','3221',NULL,NULL),
	(118,10,'Arrendamiento de mobiliario y equipo de administración, educacional y recreativo.','3230',NULL,NULL),
	(119,10,'Arrendamiento de mobiliario y equipo de administración, educacional y recreativo.','3231',NULL,NULL),
	(120,10,'Arrendamiento de equipo e instrumental médico y de laboratorio.','3240',NULL,NULL),
	(121,10,'Arrendamiento de equipo e instrumental médico y de laboratorio.','3241',NULL,NULL),
	(122,10,'Arrendamiento de equipo de transporte.','3250',NULL,NULL),
	(123,10,'Arrendamiento de equipo de transporte para la ejecución de programas de seguridad pública y atención de desastres naturales.','3251',NULL,NULL),
	(124,10,'Arrendamiento de equipo de transporte destinado a servicios públicos y la operación de programas públicos.','3252',NULL,NULL),
	(125,10,'Arrendamiento de equipo de transporte destinado a servidores públicos y servicios administrativos.','3253',NULL,NULL),
	(126,10,'Arrendamiento de maquinaria, otros equipos y herramientas.','3260',NULL,NULL),
	(127,10,'Arrendamiento de maquinaria, otros equipos y herramientas.','3261',NULL,NULL),
	(128,10,'Arrendamiento de activos intangibles.','3270',NULL,NULL),
	(129,10,'Arrendamiento de activos intangibles.','3271',NULL,NULL),
	(130,10,'Arrendamiento financiero.','3280',NULL,NULL),
	(131,10,'Arrendamiento financiero.','3281',NULL,NULL),
	(132,10,'Otros arrendamientos.','3290',NULL,NULL),
	(133,10,'Otros arrendamientos.','3291',NULL,NULL),
	(134,11,'Servicios legales, de contabilidad, auditoría y relacionados.','3310',NULL,NULL),
	(135,11,'Servicios legales, de contabilidad, auditoría y relacionados.','3311',NULL,NULL),
	(136,11,'Servicios de diseño, arquitectura, ingeniería y actividades relacionadas.','3320',NULL,NULL),
	(137,11,'Servicios de diseño, arquitectura, ingeniería y actividades relacionadas.','3321',NULL,NULL),
	(138,11,'Servicios de consultoría administrativa, procesos, técnica y en tecnologías de la información.','3330',NULL,NULL),
	(139,11,'Servicios de consultoría administrativa, procesos, técnica y en tecnologías de la información.','3331',NULL,NULL),
	(140,11,'Servicios de capacitación.','3340',NULL,NULL),
	(141,11,'Servicios de capacitación.','3341',NULL,NULL),
	(142,11,'Servicios de investigación científica y desarrollo.','3350',NULL,NULL),
	(143,11,'Servicios de investigación científica y desarrollo.','3351',NULL,NULL),
	(144,11,'Servicios de apoyo administrativo, fotocopiado e impresión.','3360',NULL,NULL),
	(145,11,'Servicios de apoyo administrativo y fotocopiado.','3361',NULL,NULL),
	(146,11,'Servicios de impresión.','3362',NULL,NULL),
	(147,11,'Servicios de protección y seguridad.','3370',NULL,NULL),
	(148,11,'Servicios de protección y seguridad.','3371',NULL,NULL),
	(149,11,'Servicios de vigilancia.','3380',NULL,NULL),
	(150,11,'Servicios de vigilancia.','3381',NULL,NULL),
	(151,11,'Servicios profesionales, científicos y técnicos integrales.','3390',NULL,NULL),
	(152,11,'Servicios profesionales, científicos, técnicos integrales y otros.','3391',NULL,NULL),
	(153,12,'Servicios financieros y bancarios.','3410',NULL,NULL),
	(154,12,'Servicios financieros y bancarios.','3411',NULL,NULL),
	(155,12,'Servicios de cobranza, investigación crediticia y similar.','3420',NULL,NULL),
	(156,12,'Servicios de cobranza, investigación crediticia y similar.','3421',NULL,NULL),
	(157,12,'Servicios de recaudación, traslado y custodia de valores.','3430',NULL,NULL),
	(158,12,'Gastos inherentes a la recaudación.','3431',NULL,NULL),
	(159,12,'Gastos de ensobretado y traslado de nómina.','3432',NULL,NULL),
	(160,12,'Otros servicios de recaudación, traslado y custodia de valores.','3439',NULL,NULL),
	(161,12,'Seguros de responsabilidad patrimonial y fianzas.','3440',NULL,NULL),
	(162,12,'Seguros de responsabilidad patrimonial y fianzas.','3441',NULL,NULL),
	(163,12,'Seguro de bienes patrimoniales.','3450',NULL,NULL),
	(164,12,'Seguro de bienes patrimoniales.','3451',NULL,NULL),
	(165,12,'Almacenaje, envase y embalaje.','3460',NULL,NULL),
	(166,12,'Almacenaje, envase y embalaje.','3461',NULL,NULL),
	(167,12,'Fletes y maniobras.','3470',NULL,NULL),
	(168,12,'Fletes y maniobras.','3471',NULL,NULL),
	(169,12,'Comisiones por ventas.','3480',NULL,NULL),
	(170,12,'Comisiones por ventas.','3481',NULL,NULL),
	(171,12,'Servicios financieros, bancarios y comerciales integrales.','3490',NULL,NULL),
	(172,12,'Diferencias por variaciones en el tipo de cambio.','3491',NULL,NULL),
	(173,12,'Otros Servicios financieros, bancarios y comerciales integrales.','3499',NULL,NULL),
	(174,13,'Conservación y mantenimiento menor de inmuebles.','3510',NULL,NULL),
	(175,13,'Conservación y mantenimiento menor de inmuebles.','3511',NULL,NULL),
	(176,13,'Instalación, reparación y mantenimiento de mobiliario y equipo de administración, educacional y recreativo.','3520',NULL,NULL),
	(177,13,'Instalación, reparación y mantenimiento de mobiliario y equipo de administración, educacional y recreativo.','3521',NULL,NULL),
	(178,13,'Instalación, reparación y mantenimiento de equipo de cómputo y tecnologías de la información.','3530',NULL,NULL),
	(179,13,'Instalación, reparación y mantenimiento de equipo de cómputo y tecnologías de la información.','3531',NULL,NULL),
	(180,13,'Instalación, reparación y mantenimiento de equipo e instrumental médico y de laboratorio.','3540',NULL,NULL),
	(181,13,'Instalación, reparación y mantenimiento de equipo e instrumental médico y de laboratorio.','3541',NULL,NULL),
	(182,13,'Reparación y mantenimiento de equipo de transporte.','3550',NULL,NULL),
	(183,13,'Reparación, mantenimiento y conservación de equipo de transporte para la ejecución de programas de seguridad pública y atención de desastres naturales.','3551',NULL,NULL),
	(184,13,'Reparación, mantenimiento y conservación de equipo de transporte destinados a servicios públicos y operación de programas públicos.','3552',NULL,NULL),
	(185,13,'Reparación, mantenimiento y conservación de equipo de transporte destinados a servidores públicos y servicios administrativos.','3553',NULL,NULL),
	(186,13,'Reparación y mantenimiento de equipo de defensa y seguridad.','3560',NULL,NULL),
	(187,13,'Reparación y mantenimiento de equipo de defensa y seguridad.','3561',NULL,NULL),
	(188,13,'Instalación, reparación y mantenimiento de maquinaria, otros equipos y herramienta.','3570',NULL,NULL),
	(189,13,'Instalación, reparación y mantenimiento de maquinaria, otros equipos y herramienta.','3571',NULL,NULL),
	(190,13,'Servicios de limpieza y manejo de desechos.','3580',NULL,NULL),
	(191,13,'Servicios de limpieza y manejo de desechos.','3581',NULL,NULL),
	(192,13,'Servicios de jardinería y fumigación.','3590',NULL,NULL),
	(193,13,'Servicios de jardinería y fumigación.','3591',NULL,NULL),
	(194,14,'Difusión por radio, televisión y otros medios de mensajes sobre programas y actividades gubernamentales.','3610',NULL,NULL),
	(195,14,'Difusión por radio, televisión y otros medios de mensajes sobre programas y actividades gubernamentales.','3611',NULL,NULL),
	(196,14,'Difusión por radio, televisión y otros medios de mensajes comerciales para promover la venta de bienes o servicios.','3620',NULL,NULL),
	(197,14,'Difusión por radio, televisión y otros medios de mensajes comerciales para promover la venta de bienes o servicios.','3621',NULL,NULL),
	(198,14,'Servicios de creatividad, preproducción y producción de publicidad, excepto Internet.','3630',NULL,NULL),
	(199,14,'Servicios de creatividad, preproducción y producción de publicidad, excepto Internet.','3631',NULL,NULL),
	(200,14,'Servicios de revelado de fotografías.','3640',NULL,NULL),
	(201,14,'Servicios de revelado de fotografías.','3641',NULL,NULL),
	(202,14,'Servicios de la industria fílmica, del sonido y del video.','3650',NULL,NULL),
	(203,14,'Servicios de la industria fílmica, del sonido y del video.','3651',NULL,NULL),
	(204,14,'Servicio de creación y difusión de contenido exclusivamente a través de Internet.','3660',NULL,NULL),
	(205,14,'Servicio de creación y difusión de contenido exclusivamente a través de Internet.','3661',NULL,NULL),
	(206,14,'Otros servicios de información.','3690',NULL,NULL),
	(207,14,'Otros servicios de información.','3691',NULL,NULL),
	(208,15,'Pasajes aéreos.','3710',NULL,NULL),
	(209,15,'Pasajes aéreos nacionales.','3711',NULL,NULL),
	(210,15,'Pasajes aéreos internacionales.','3712',NULL,NULL),
	(211,15,'Traslado aéreo de personas.','3712',NULL,NULL),
	(212,15,'Pasajes terrestres.','3720',NULL,NULL),
	(213,15,'Pasajes terrestres nacionales.','3721',NULL,NULL),
	(214,15,'Pasajes terrestres al interior del Distrito Federal.','3722',NULL,NULL),
	(215,15,'Traslado terrestre de personas.','3723',NULL,NULL),
	(216,15,'Pasajes terrestres internacionales.','3724',NULL,NULL),
	(217,15,'Pasajes marítimos, lacustres y fluviales.','3730',NULL,NULL),
	(218,15,'Pasajes marítimos, lacustres y fluviales.','3731',NULL,NULL),
	(219,15,'Traslado marítimo, lacustre y fluvial de personas.','3732',NULL,NULL),
	(220,15,'Autotransporte.','3740',NULL,NULL),
	(221,15,'Autotransporte.','3741',NULL,NULL),
	(222,15,'Viáticos en el país.','3750',NULL,NULL),
	(223,15,'Viáticos en el país.','3751',NULL,NULL),
	(224,15,'Viáticos en el extranjero.','3760',NULL,NULL),
	(225,15,'Viáticos en el extranjero.','3761',NULL,NULL),
	(226,15,'Gastos de instalación y traslado de menaje.','3770',NULL,NULL),
	(227,15,'Gastos de instalación y traslado de menaje.','3771',NULL,NULL),
	(228,15,'Servicios integrales de traslado y viáticos.','3780',NULL,NULL),
	(229,15,'Servicios integrales de traslado y viáticos.','3781',NULL,NULL),
	(230,15,'Otros servicios de traslado y hospedaje.','3790',NULL,NULL),
	(231,15,'Otros servicios de traslado y hospedaje.','3791',NULL,NULL),
	(232,16,'Gastos de ceremonial.','3810',NULL,NULL),
	(233,16,'Gastos de ceremonial.','3811',NULL,NULL),
	(234,16,'Gastos de orden social y cultural.','3820',NULL,NULL),
	(235,16,'Espectáculos culturales.','3821',NULL,NULL),
	(236,16,'Gastos de orden social.','3822',NULL,NULL),
	(237,16,'Gastos de difusión y extensión universitaria.','3823',NULL,NULL),
	(238,16,'Congresos y convenciones.','3830',NULL,NULL),
	(239,16,'Congresos y convenciones.','3831',NULL,NULL),
	(240,16,'Gastos de orden académico.','3832',NULL,NULL),
	(241,16,'Exposiciones.','3840',NULL,NULL),
	(242,16,'Exposiciones.','3841',NULL,NULL),
	(243,17,'Servicios funerarios y de cementerios.','3910',NULL,NULL),
	(244,17,'Servicios funerarios y de cementerio a los familiares de los civiles y pensionistas directos.','3911',NULL,NULL),
	(245,17,'Impuestos y derechos.','3920',NULL,NULL),
	(246,17,'Impuestos y derechos.','3921',NULL,NULL),
	(247,17,'Impuestos y derechos de importación.','3930',NULL,NULL),
	(248,17,'Impuestos y derechos de importación.','3931',NULL,NULL),
	(249,17,'Sentencias y resoluciones por autoridad competente.','3940',NULL,NULL),
	(250,17,'Sentencias y resoluciones por autoridad competente.','3941',NULL,NULL),
	(251,17,'Penas, multas, accesorios y actualizaciones.','3950',NULL,NULL),
	(252,17,'Penas, multas, accesorios y actualizaciones.','3951',NULL,NULL),
	(253,17,'Otros gastos por responsabilidades.','3960',NULL,NULL),
	(254,17,'Gastos por concepto de responsabilidades del Gobierno del Distrito Federal.','3961',NULL,NULL),
	(255,17,'Otros gastos por responsabilidades.','3969',NULL,NULL),
	(256,17,'Utilidades.','3970',NULL,NULL),
	(257,17,'Utilidades.','3971',NULL,NULL),
	(258,17,'Impuesto sobre nóminas y otros que se deriven de una relación laboral.','3980',NULL,NULL),
	(259,17,'Impuesto sobre nóminas.','3981',NULL,NULL),
	(260,17,'Otros impuestos derivados de una relación laboral.','3982',NULL,NULL),
	(261,17,'Otros servicios generales.','3990',NULL,NULL),
	(262,17,'Servicios para la promoción deportiva.','3991',NULL,NULL),
	(263,17,'Servicios para la promoción y difusión de sitios turísticos, culturales, recreativos y deportivos del Distrito Federal.','3992',NULL,NULL),
	(264,17,'Subrogaciones.','3993',NULL,NULL),
	(265,17,'Erogaciones derivadas de ingresos por cuenta de terceros.','3994',NULL,NULL),
	(266,17,'Otros servicios generales.','3999',NULL,NULL),
	(267,18,'Asignaciones presupuestarias al Poder Ejecutivo.','4110',NULL,NULL),
	(268,18,'Asignaciones presupuestarias al Órgano Ejecutivo del Distrito Federal.','4111',NULL,NULL),
	(269,18,'Asignaciones presupuestarias al Poder Legislativo.','4120',NULL,NULL),
	(270,18,'Asignaciones presupuestarias al Órgano Legislativo del Distrito Federal.','4121',NULL,NULL),
	(271,18,'Asignaciones presupuestarias al Poder Judicial.','4130',NULL,NULL),
	(272,18,'Asignaciones presupuestarias al Órgano Superior de Justicia del Distrito Federal.','4131',NULL,NULL),
	(273,18,'Asignaciones presupuestarias a Órganos Autónomos.','4140',NULL,NULL),
	(274,18,'Asignaciones presupuestarias a Órganos Autónomos del Distrito Federal.','4141',NULL,NULL),
	(275,18,'Transferencias internas otorgadas a entidades paraestatales no empresariales y no financieras.','4150',NULL,NULL),
	(276,18,'Transferencias otorgadas a entidades paraestatales no empresariales y no financieras.','4151',NULL,NULL),
	(277,18,'Aportaciones otorgadas a entidades paraestatales no empresariales y no financieras.','4152',NULL,NULL),
	(278,18,'Transferencias internas otorgadas a entidades paraestatales empresariales y no financieras.','4160',NULL,NULL),
	(279,18,'Transferencias otorgadas a entidades paraestatales empresariales y no financieras.','4161',NULL,NULL),
	(280,18,'Aportaciones otorgadas a entidades paraestatales empresariales y no financieras.','4162',NULL,NULL),
	(281,18,'Transferencias internas otorgadas a fideicomisos públicos empresariales y no financieros.','4170',NULL,NULL),
	(282,18,'Transferencias otorgadas a fideicomisos públicos empresariales y no financieros.','4171',NULL,NULL),
	(283,18,'Aportaciones otorgadas a fideicomisos públicos empresariales y no financieros.','4172',NULL,NULL),
	(284,18,'Transferencias internas otorgadas a instituciones paraestatales públicas financieras.','4180',NULL,NULL),
	(285,18,'Transferencias otorgadas a instituciones paraestatales públicas financieras.','4181',NULL,NULL),
	(286,18,'Aportaciones otorgadas a instituciones paraestatales públicas financieras.','4182',NULL,NULL),
	(287,18,'Transferencias internas otorgadas a fideicomisos públicos financieros.','4190',NULL,NULL),
	(288,18,'Transferencias otorgadas a fideicomisos públicos financieros.','4191',NULL,NULL),
	(289,18,'Aportaciones otorgadas a fideicomisos públicos financieros.','4192',NULL,NULL),
	(290,19,'Transferencias otorgadas a organismos entidades paraestatales no empresariales y no financieras.','4210',NULL,NULL),
	(291,19,'Transferencias otorgadas a entidades paraestatales no empresariales y no financieras.','4211',NULL,NULL),
	(292,19,'Transferencias otorgadas para entidades paraestatales empresariales y no financieras.','4220',NULL,NULL),
	(293,19,'Transferencias otorgadas para entidades paraestatales empresariales y no financieras.','4221',NULL,NULL),
	(294,19,'Transferencias otorgadas para instituciones paraestatales públicas financieras.','4230',NULL,NULL),
	(295,19,'Transferencias otorgadas para instituciones paraestatales públicas financieras.','4231',NULL,NULL),
	(296,19,'Transferencias otorgadas a entidades federativas y municipios.','4240',NULL,NULL),
	(297,19,'Transferencias otorgadas a entidades federativas y municipios.','4241',NULL,NULL),
	(298,19,'Transferencias a fideicomisos de entidades federativas y municipios.','4250',NULL,NULL),
	(299,19,'Transferencias a fideicomisos de entidades federativas y municipios.','4251',NULL,NULL),
	(300,20,'Subsidios a la producción.','4310',NULL,NULL),
	(301,20,'Subsidios a la producción.','4311',NULL,NULL),
	(302,20,'Subsidios a la distribución.','4320',NULL,NULL),
	(303,20,'Subsidios a la distribución.','4321',NULL,NULL),
	(304,20,'Subsidios a la inversión.','4330',NULL,NULL),
	(305,20,'Subsidios a la inversión.','4331',NULL,NULL),
	(306,20,'Subsidios a la prestación de servicios públicos.','4340',NULL,NULL),
	(307,20,'Subsidios a la prestación de servicios públicos.','4341',NULL,NULL),
	(308,20,'Subsidios para cubrir diferenciales de tasas de interés.','4350',NULL,NULL),
	(309,20,'Subsidios a la vivienda.','4360',NULL,NULL),
	(310,20,'Subsidios a la vivienda.','4361',NULL,NULL),
	(311,20,'Subvenciones al consumo.','4370',NULL,NULL),
	(312,20,'Subsidios a entidades federativas y municipios.','4380',NULL,NULL),
	(313,20,'Subsidios a entidades federativas y municipios.','4381',NULL,NULL),
	(314,20,'Otros subsidios.','4390',NULL,NULL),
	(315,20,'Otros subsidios.','4391',NULL,NULL),
	(316,21,'Ayudas sociales a personas.','4410',NULL,NULL),
	(317,21,'Premios.','4411',NULL,NULL),
	(318,21,'Ayudas sociales a personas u hogares de escasos recursos.','4412',NULL,NULL),
	(319,21,'Otras ayudas sociales a personas.','4419',NULL,NULL),
	(320,21,'Becas y otras ayudas para programas de capacitación.','4420',NULL,NULL),
	(321,21,'Becas y otras ayudas para programas de capacitación.','4421',NULL,NULL),
	(322,21,'Ayudas sociales a instituciones de enseñanza.','4431',NULL,NULL),
	(323,21,'Ayudas sociales a actividades científicas o académicas.','4440',NULL,NULL),
	(324,21,'Ayudas sociales a actividades científicas o académicas.','4441',NULL,NULL),
	(325,21,'Ayudas sociales a instituciones sin fines de lucro.','4450',NULL,NULL),
	(326,21,'Ayudas sociales a instituciones sin fines de lucro.','4451',NULL,NULL),
	(327,21,'Ayudas sociales a cooperativas.','4460',NULL,NULL),
	(328,21,'Ayudas sociales a cooperativas.','4461',NULL,NULL),
	(329,21,'Ayudas sociales a entidades de interés público.','4470',NULL,NULL),
	(330,21,'Ayudas sociales a entidades de interés público.','4471',NULL,NULL),
	(331,21,'Ayudas por desastres naturales y otros siniestros.','4480',NULL,NULL),
	(332,21,'Ayudas por desastres naturales y otros siniestros.','4481',NULL,NULL),
	(333,22,'Pensiones.','4510',NULL,NULL),
	(334,22,'Pensiones.','4511',NULL,NULL),
	(335,22,'Jubilaciones.','4520',NULL,NULL),
	(336,22,'Jubilaciones.','4521',NULL,NULL),
	(337,22,'Otras pensiones y jubilaciones.','4590',NULL,NULL),
	(338,22,'Otras pensiones y jubilaciones.','4591',NULL,NULL),
	(339,23,'Transferencias a fideicomisos del Poder Ejecutivo.','4610',NULL,NULL),
	(340,23,'Transferencias a fideicomisos del Órgano Ejecutivo del Distrito Federal.','4611',NULL,NULL),
	(341,23,'Aportaciones a fideicomisos del Órgano Ejecutivo del Distrito Federal.','4612',NULL,NULL),
	(342,23,'Transferencias a fideicomisos del Poder Legislativo.','4620',NULL,NULL),
	(343,23,'Transferencias a fideicomisos del Órgano Legislativo del Distrito Federal.','4621',NULL,NULL),
	(344,23,'Transferencias a fideicomisos del Poder Judicial.','4630',NULL,NULL),
	(345,23,'Transferencias a fideicomisos del Órgano Superior de Justicia del Distrito Federal.','4631',NULL,NULL),
	(346,23,'Transferencias a fideicomisos públicos de entidades paraestatales no empresariales y no financieras.','4640',NULL,NULL),
	(347,23,'Transferencias a fideicomisos no empresariales y no financieros.','4641',NULL,NULL),
	(348,23,'Aportaciones a fideicomisos no empresariales y no financieros.','4642',NULL,NULL),
	(349,23,'Transferencias a fideicomisos públicos de entidades paraestatales empresariales y no financieras.','4650',NULL,NULL),
	(350,23,'Transferencias a fideicomisos públicos de entidades paraestatales empresariales y no financieras.','4651',NULL,NULL),
	(351,23,'Aportaciones a fideicomisos públicos de entidades paraestatales empresariales y no financieras.','4652',NULL,NULL),
	(352,23,'Transferencias a fideicomisos de instituciones públicas financieras.','4660',NULL,NULL),
	(353,24,'Transferencias por obligación de ley.','4710',NULL,NULL),
	(354,24,'Transferencias por obligación de ley.','4711',NULL,NULL),
	(355,25,'Donativos a instituciones sin fines de lucro.','4810',NULL,NULL),
	(356,25,'Donativos a instituciones sin fines de lucro.','4811',NULL,NULL),
	(357,25,'Donativos a entidades federativas.','4820',NULL,NULL),
	(358,25,'Donativos a entidades federativas.','4821',NULL,NULL),
	(359,25,'Donativos a fideicomisos privados.','4830',NULL,NULL),
	(360,25,'Donativos a fideicomisos privados.','4831',NULL,NULL),
	(361,25,'Donativos a fideicomisos estatales.','4840',NULL,NULL),
	(362,25,'Donativos a fideicomisos estatales.','4841',NULL,NULL),
	(363,25,'Donativos internacionales.','4850',NULL,NULL),
	(364,25,'Donativos internacionales.','4851',NULL,NULL),
	(365,26,'Transferencias para gobiernos extranjeros.','4910',NULL,NULL),
	(366,26,'Transferencias para organismos internacionales.','4920',NULL,NULL),
	(367,26,'Transferencias para organismos internacionales.','4921',NULL,NULL),
	(368,26,'Transferencias para el sector privado externo.','4930',NULL,NULL),
	(369,26,'Transferencias para el sector privado externo.','4931',NULL,NULL),
	(370,27,'Muebles de oficina y estantería.','5110',NULL,NULL),
	(371,27,'Muebles de oficina y estantería.','5111',NULL,NULL),
	(372,27,'Muebles, excepto de oficina y estantería.','5120',NULL,NULL),
	(373,27,'Muebles, excepto de oficina y estantería.','5121',NULL,NULL),
	(374,27,'Bienes artísticos, culturales y científicos.','5130',NULL,NULL),
	(375,27,'Bienes artísticos, culturales y científicos.','5131',NULL,NULL),
	(376,27,'Objetos de valor.','5140',NULL,NULL),
	(377,27,'Objetos de valor.','5141',NULL,NULL),
	(378,27,'Equipo de cómputo y de tecnologías de la información.','5150',NULL,NULL),
	(379,27,'Equipo de cómputo y de tecnologías de la información.','5151',NULL,NULL),
	(380,27,'Otros mobiliarios y equipos de administración.','5190',NULL,NULL),
	(381,27,'Otros mobiliarios y equipos de administración.','5191',NULL,NULL),
	(382,28,'Equipos y aparatos audiovisuales.','5210',NULL,NULL),
	(383,28,'Equipos y aparatos audiovisuales.','5211',NULL,NULL),
	(384,28,'Aparatos deportivos.','5220',NULL,NULL),
	(385,28,'Aparatos deportivos.','5221',NULL,NULL),
	(386,28,'Cámaras fotográficas y de video.','5230',NULL,NULL),
	(387,28,'Cámaras fotográficas y de video.','5231',NULL,NULL),
	(388,28,'Otro mobiliario y equipo educacional y recreativo.','5290',NULL,NULL),
	(389,28,'Otro mobiliario y equipo educacional y recreativo.','5291',NULL,NULL),
	(390,29,'Equipo médico y de laboratorio.','5310',NULL,NULL),
	(391,29,'Equipo médico y de laboratorio.','5311',NULL,NULL),
	(392,29,'Instrumental médico y de laboratorio.','5320',NULL,NULL),
	(393,29,'Instrumental médico y de laboratorio.','5321',NULL,NULL),
	(394,30,'Vehículos y equipo terrestre.','5410',NULL,NULL),
	(395,30,'Vehículos y equipo terrestre para la ejecución de programas de seguridad pública y atención de desastres naturales.','5411',NULL,NULL),
	(396,30,'Vehículos y equipo terrestre destinados a servicios públicos y la operación de programas públicos.','5412',NULL,NULL),
	(397,30,'Vehículos y equipo terrestre destinados a servidores públicos y servicios administrativos.','5413',NULL,NULL),
	(398,30,'Carrocerías y remolques.','5420',NULL,NULL),
	(399,30,'Carrocerías y remolques para la ejecución de programas de seguridad pública y atención de desastres naturales.','5421',NULL,NULL),
	(400,30,'Carrocerías y remolques destinados a servicios públicos y la operación de programas públicos.','5422',NULL,NULL),
	(401,30,'Carrocerías y remolques destinado a servidores públicos y servicios administrativos.','5423',NULL,NULL),
	(402,30,'Equipo aeroespacial.','5430',NULL,NULL),
	(403,30,'Equipo aeroespacial.','5431',NULL,NULL),
	(404,30,'Equipo ferroviario.','5440',NULL,NULL),
	(405,30,'Equipo ferroviario.','5441',NULL,NULL),
	(406,30,'Embarcaciones.','5450',NULL,NULL),
	(407,30,'Embarcaciones.','5451',NULL,NULL),
	(408,30,'Otros equipos de transporte.','5490',NULL,NULL),
	(409,30,'Otros equipos de transporte.','5491',NULL,NULL),
	(410,31,'Equipo de defensa y seguridad.','5510',NULL,NULL),
	(411,31,'Equipo de defensa y seguridad.','5511',NULL,NULL),
	(412,32,'Maquinaria y equipo agropecuario.','5610',NULL,NULL),
	(413,32,'Maquinaria y equipo agropecuario.','5611',NULL,NULL),
	(414,32,'Maquinaria y equipo industrial.','5620',NULL,NULL),
	(415,32,'Maquinaria y equipo industrial.','5621',NULL,NULL),
	(416,32,'Maquinaria y equipo de construcción.','5630',NULL,NULL),
	(417,32,'Maquinaria y equipo de construcción.','5631',NULL,NULL),
	(418,32,'Sistemas de aire acondicionado, calefacción y de refrigeración industrial y comercial.','5640',NULL,NULL),
	(419,32,'Sistemas de aire acondicionado, calefacción y de refrigeración industrial y comercial.','5641',NULL,NULL),
	(420,32,'Equipo de comunicación y telecomunicación.','5650',NULL,NULL),
	(421,32,'Equipo de comunicación y telecomunicación.','5651',NULL,NULL),
	(422,32,'Equipos de generación eléctrica, aparatos y accesorios eléctricos.','5660',NULL,NULL),
	(423,32,'Equipos de generación eléctrica, aparatos y accesorios eléctricos.','5661',NULL,NULL),
	(424,32,'Herramientas y máquinas-herramienta.','5670',NULL,NULL),
	(425,32,'Herramientas y máquinas–herramienta.','5671',NULL,NULL),
	(426,32,'Otros equipos.','5690',NULL,NULL),
	(427,32,'Otros equipos.','5691',NULL,NULL),
	(428,33,'Bovinos.','5710',NULL,NULL),
	(429,33,'Bovinos.','5711',NULL,NULL),
	(430,33,'Porcinos.','5720',NULL,NULL),
	(431,33,'Porcinos.','5721',NULL,NULL),
	(432,33,'Aves.','5730',NULL,NULL),
	(433,33,'Aves.','5731',NULL,NULL),
	(434,33,'Ovinos y caprinos.','5740',NULL,NULL),
	(435,33,'Ovinos y caprinos.','5741',NULL,NULL),
	(436,33,'Peces y acuicultura.','5750',NULL,NULL),
	(437,33,'Peces y acuicultura.','5751',NULL,NULL),
	(438,33,'Equinos.','5760',NULL,NULL),
	(439,33,'Equinos.','5761',NULL,NULL),
	(440,33,'Especies menores y de zoológico.','5770',NULL,NULL),
	(441,33,'Especies menores y de zoológico.','5771',NULL,NULL),
	(442,33,'Árboles y plantas.','5780',NULL,NULL),
	(443,33,'Árboles y plantas.','5781',NULL,NULL),
	(444,33,'Otros activos biológicos.','5790',NULL,NULL),
	(445,33,'Otros activos biológicos.','5791',NULL,NULL),
	(446,34,'Terrenos.','5810',NULL,NULL),
	(447,34,'Adquisición de terrenos.','5811',NULL,NULL),
	(448,34,'Adjudicaciones, expropiaciones e indemnizaciones de terrenos.','5812',NULL,NULL),
	(449,34,'Viviendas.','5820',NULL,NULL),
	(450,34,'Adquisición de viviendas.','5821',NULL,NULL),
	(451,34,'Adjudicaciones, expropiaciones e indemnizaciones de viviendas.','5822',NULL,NULL),
	(452,34,'Edificios no residenciales.','5830',NULL,NULL),
	(453,34,'Adquisición de edificios no residenciales.','5831',NULL,NULL),
	(454,34,'Adjudicaciones, expropiaciones e indemnizaciones de edificios no residenciales.','5832',NULL,NULL),
	(455,34,'Otros bienes inmuebles.','5890',NULL,NULL),
	(456,34,'Adquisición de otros bienes inmuebles.','5891',NULL,NULL),
	(457,34,'Adjudicaciones, expropiaciones e indemnizaciones de otros bienes inmuebles.','5892',NULL,NULL),
	(458,35,'Software.','5910',NULL,NULL),
	(459,35,'Software.','5911',NULL,NULL),
	(460,35,'Patentes.','5920',NULL,NULL),
	(461,35,'Patentes.','5921',NULL,NULL),
	(462,35,'Marcas.','5930',NULL,NULL),
	(463,35,'Marcas.','5931',NULL,NULL),
	(464,35,'Derechos.','5940',NULL,NULL),
	(465,35,'Derechos.','5941',NULL,NULL),
	(466,35,'Concesiones.','5950',NULL,NULL),
	(467,35,'Concesiones.','5951',NULL,NULL),
	(468,35,'Franquicias.','5960',NULL,NULL),
	(469,35,'Franquicias.','5961',NULL,NULL),
	(470,35,'Licencias informáticas e intelectuales.','5970',NULL,NULL),
	(471,35,'Licencias informáticas e intelectuales.','5971',NULL,NULL),
	(472,35,'Licencias industriales, comerciales y otras.','5980',NULL,NULL),
	(473,35,'Licencias industriales, comerciales y otras.','5981',NULL,NULL),
	(474,35,'Otros activos intangibles.','5990',NULL,NULL),
	(475,35,'Otros activos intangibles.','5991',NULL,NULL),
	(476,36,'Edificación habitacional.','6110',NULL,NULL),
	(477,36,'Edificación habitacional.','6111',NULL,NULL),
	(478,36,'Edificación no habitacional.','6120',NULL,NULL),
	(479,36,'Edificación no habitacional.','6121',NULL,NULL),
	(480,36,'Construcción de obras para el abastecimiento de agua, petróleo, gas, electricidad y telecomunicaciones.','6130',NULL,NULL),
	(481,36,'Construcción de obras para el abastecimiento de agua, petróleo, gas, electricidad y telecomunicaciones.','6131',NULL,NULL),
	(482,36,'División de terrenos y construcción de obras de urbanización.','6140',NULL,NULL),
	(483,36,'División de terrenos y construcción de obras de urbanización.','6141',NULL,NULL),
	(484,36,'Construcción de vías de comunicación.','6150',NULL,NULL),
	(485,36,'Construcción de vías de comunicación.','6151',NULL,NULL),
	(486,36,'Otras construcciones de ingeniería civil u obra pesada.','6160',NULL,NULL),
	(487,36,'Otras construcciones de ingeniería civil u obra pesada.','6161',NULL,NULL),
	(488,36,'Instalaciones y equipamiento en construcciones.','6170',NULL,NULL),
	(489,36,'Instalaciones y equipamiento en construcciones.','6171',NULL,NULL),
	(490,36,'Trabajos de acabados en edificaciones y otros trabajos especializados.','6190',NULL,NULL),
	(491,36,'Trabajos de acabados en edificaciones y otros trabajos especializados.','6191',NULL,NULL),
	(492,37,'Edificación habitacional.','6210',NULL,NULL),
	(493,37,'Edificación habitacional.','6211',NULL,NULL),
	(494,37,'Edificación no habitacional.','6220',NULL,NULL),
	(495,37,'Edificación no habitacional.','6221',NULL,NULL),
	(496,37,'Construcción de obras para el abastecimiento de agua, petróleo, gas, electricidad y telecomunicaciones.','6230',NULL,NULL),
	(497,37,'Construcción de obras para el abastecimiento de agua, petróleo, gas, electricidad y telecomunicaciones.','6231',NULL,NULL),
	(498,37,'División de terrenos y construcción de obras de urbanización.','6240',NULL,NULL),
	(499,37,'División de terrenos y construcción de obras de urbanización.','6241',NULL,NULL),
	(500,37,'Construcción de vías de comunicación.','6250',NULL,NULL),
	(501,37,'Construcción de vías de comunicación.','6251',NULL,NULL),
	(502,37,'Otras construcciones de ingeniería civil u obra pesada.','6260',NULL,NULL),
	(503,37,'Otras construcciones de ingeniería civil u obra pesada.','6261',NULL,NULL),
	(504,37,'Instalaciones y equipamiento en construcciones.','6270',NULL,NULL),
	(505,37,'Instalaciones y equipamiento en construcciones.','6271',NULL,NULL),
	(506,37,'Trabajos de acabados en edificaciones y otros trabajos especializados.','6290',NULL,NULL),
	(507,37,'Trabajos de acabados en edificaciones y otros trabajos especializados.','6291',NULL,NULL),
	(508,38,'Estudios, formulación y evaluación de proyectos productivos no incluidos en conceptos anteriores de este capítulo.','6310',NULL,NULL),
	(509,38,'Estudios, formulación y evaluación de proyectos productivos no incluidos en conceptos anteriores de este capítulo.','6311',NULL,NULL),
	(510,38,'Ejecución de proyectos productivos no incluidos en conceptos anteriores de este capítulo.','6320',NULL,NULL),
	(511,38,'Ejecución de proyectos productivos no incluidos en conceptos anteriores de este capítulo.','6321',NULL,NULL),
	(512,39,'Créditos otorgados por entidades federativas y municipios al sector social y privado para el fomento de actividades productivas.','7110',NULL,NULL),
	(513,39,'Créditos otorgados por entidades federativas y municipios al sector social y privado para el fomento de actividades productivas.','7111',NULL,NULL),
	(514,39,'Otros créditos otorgados al sector social y privado para el fomento de actividades productivas.','7119',NULL,NULL),
	(515,39,'Créditos otorgados por entidades federativas a municipios para el fomento de actividades productivas.','7120',NULL,NULL),
	(516,40,'Acciones y participaciones de capital en entidades paraestatales no empresariales y no financieras con fines de política económica.','7210',NULL,NULL),
	(517,40,'Acciones y participaciones de capital en entidades paraestatales no empresariales y no financieras con fines de política económica.','7211',NULL,NULL),
	(518,40,'Acciones y participaciones de capital en entidades paraestatales empresariales y no financieras con fines de política económica.','7220',NULL,NULL),
	(519,40,'Acciones y participaciones de capital en entidades paraestatales empresariales y no financieras con fines de política económica.','7221',NULL,NULL),
	(520,40,'Acciones y participaciones de capital en instituciones paraestatales públicas financieras con fines de política económica.','7230',NULL,NULL),
	(521,40,'Acciones y participaciones de capital en instituciones paraestatales públicas financieras con fines de política económica.','7231',NULL,NULL),
	(522,40,'Acciones y participaciones de capital en el sector privado con fines de política económica.','7240',NULL,NULL),
	(523,40,'Acciones y participaciones de capital en el sector privado con fines de política económica.','7241',NULL,NULL),
	(524,40,'Acciones y participaciones de capital en organismos internacionales con fines de política económica.','7250',NULL,NULL),
	(525,40,'Acciones y participaciones de capital en organismos internacionales con fines de política económica.','7251',NULL,NULL),
	(526,40,'Acciones y participaciones de capital en el sector externo con fines de política económica.','7260',NULL,NULL),
	(527,40,'Acciones y participaciones de capital en el sector externo con fines de política económica.','7261',NULL,NULL),
	(528,40,'Acciones y participaciones de capital en el sector público con fines de gestión de la liquidez.','7270',NULL,NULL),
	(529,40,'Acciones y participaciones de capital en el sector público con fines de gestión de la liquidez.','7271',NULL,NULL),
	(530,40,'Acciones y participaciones de capital en el sector privado con fines de gestión de la liquidez.','7280',NULL,NULL),
	(531,40,'Acciones y participaciones de capital en el sector privado con fines de gestión de la liquidez.','7281',NULL,NULL),
	(532,40,'Acciones y participaciones de capital en el sector externo con fines de gestión de la liquidez.','7290',NULL,NULL),
	(533,40,'Acciones y participaciones de capital en el sector externo con fines de gestión de la liquidez.','7291',NULL,NULL),
	(534,41,'Bonos.','7310',NULL,NULL),
	(535,41,'Bonos.','7311',NULL,NULL),
	(536,41,'Valores representativos de deuda adquiridos con fines de política económica.','7320',NULL,NULL),
	(537,41,'Valores representativos de deuda adquiridos con fines de política económica.','7321',NULL,NULL),
	(538,41,'Valores representativos de deuda adquiridos con fines de gestión de liquidez.','7330',NULL,NULL),
	(539,41,'Valores representativos de deuda adquiridos con fines de gestión de liquidez.','7331',NULL,NULL),
	(540,41,'Obligaciones negociables adquiridas con fines de política económica.','7340',NULL,NULL),
	(541,41,'Obligaciones negociables adquiridas con fines de política económica.','7341',NULL,NULL),
	(542,41,'Obligaciones negociables adquiridas con fines de gestión de liquidez.','7350',NULL,NULL),
	(543,41,'Obligaciones negociables adquiridas con fines de gestión de liquidez.','7351',NULL,NULL),
	(544,41,'Otros valores.','7390',NULL,NULL),
	(545,41,'Otros valores.','7391',NULL,NULL),
	(546,42,'Concesión de préstamos a entidades paraestatales no empresariales y no financieras con fines de política económica.','7410',NULL,NULL),
	(547,42,'Concesión de préstamos a entidades paraestatales no empresariales y no financieras.','7411',NULL,NULL),
	(548,42,'Concesión de préstamos a entidades paraestatales empresariales y no financieras con fines de política económica.','7420',NULL,NULL),
	(549,42,'Concesión de préstamos a entidades paraestatales empresariales y no financieras.','7421',NULL,NULL),
	(550,42,'Concesión de préstamos a instituciones paraestatales públicas financieras con fines de política económica.','7430',NULL,NULL),
	(551,42,'Concesión de préstamos a instituciones paraestatales públicas financieras.','7431',NULL,NULL),
	(552,42,'Concesión de préstamos a entidades federativas y municipios con fines de política económica.','7440',NULL,NULL),
	(553,42,'Concesión de préstamos al sector privado con fines de política económica.','7450',NULL,NULL),
	(554,42,'Concesión de préstamos al sector privado.','7451',NULL,NULL),
	(555,42,'Concesión de préstamos al sector externo con fines de política económica.','7460',NULL,NULL),
	(556,42,'Concesión de préstamos al sector externo.','7461',NULL,NULL),
	(557,42,'Concesión de préstamos al sector público con fines de gestión de liquidez.','7470',NULL,NULL),
	(558,42,'Concesión de préstamos al sector público.','7471',NULL,NULL),
	(559,42,'Concesión de préstamos al sector privado con fines de gestión de liquidez.','7480',NULL,NULL),
	(560,42,'Concesión de préstamos al sector privado.','7481',NULL,NULL),
	(561,42,'Concesión de préstamos al sector externo con fines de gestión de liquidez.','7490',NULL,NULL),
	(562,42,'Concesión de préstamos al sector externo.','7491',NULL,NULL),
	(563,43,'Inversiones en fideicomisos del Poder Ejecutivo.','7510',NULL,NULL),
	(564,43,'Inversiones en fideicomisos del Órgano Ejecutivo del Distrito Federal.','7511',NULL,NULL),
	(565,43,'Inversiones en fideicomisos del Poder Legislativo.','7520',NULL,NULL),
	(566,43,'Inversiones en fideicomisos del Órgano Legislativo del Distrito Federal.','7521',NULL,NULL),
	(567,43,'Inversiones en fideicomisos del Poder Judicial.','7530',NULL,NULL),
	(568,43,'Inversiones en fideicomisos del Órgano Superior de Justicia del Distrito Federal.','7531',NULL,NULL),
	(569,43,'Inversiones en fideicomisos públicos no empresariales y no financieros.','7540',NULL,NULL),
	(570,43,'Inversiones en fideicomisos públicos no empresariales y no financieros.','7541',NULL,NULL),
	(571,43,'Inversiones en fideicomisos públicos empresariales y no financieros.','7550',NULL,NULL),
	(572,43,'Inversiones en fideicomisos públicos empresariales y no financieros.','7551',NULL,NULL),
	(573,43,'Inversiones en fideicomisos públicos financieros.','7560',NULL,NULL),
	(574,43,'Inversiones en fideicomisos públicos financieros.','7561',NULL,NULL),
	(575,43,'Inversiones en fideicomisos de entidades federativas.','7570',NULL,NULL),
	(576,43,'Inversiones en fideicomisos de entidades federativas.','7571',NULL,NULL),
	(577,43,'Inversiones en fideicomisos de municipios.','7580',NULL,NULL),
	(578,43,'Fideicomisos de empresas privadas y particulares.','7590',NULL,NULL),
	(579,43,'Fideicomisos de empresas privadas y particulares.','7591',NULL,NULL),
	(580,44,'Depósitos a largo plazo en moneda nacional.','7610',NULL,NULL),
	(581,44,'Depósitos a largo plazo en moneda nacional.','7611',NULL,NULL),
	(582,44,'Erogaciones recuperables por concepto de reserva.','7612',NULL,NULL),
	(583,44,'Depósitos a largo plazo en moneda extranjera.','7620',NULL,NULL),
	(584,44,'Depósitos a largo plazo en moneda extranjera.','7621',NULL,NULL),
	(585,45,'Contingencias por fenómenos naturales.','7910',NULL,NULL),
	(586,45,'Contingencias por fenómenos naturales.','7911',NULL,NULL),
	(587,45,'Contingencias socioeconómicas.','7920',NULL,NULL),
	(588,45,'Contingencias socioeconómicas.','7921',NULL,NULL),
	(589,45,'Otras erogaciones especiales.','7990',NULL,NULL),
	(590,45,'Otras erogaciones especiales.','7999',NULL,NULL),
	(591,46,'Fondo general de participaciones.','8110',NULL,NULL),
	(592,46,'Fondo de fomento municipal.','8120',NULL,NULL),
	(593,46,'Participaciones de las entidades federativas a los municipios.','8130',NULL,NULL),
	(594,46,'Otros conceptos participables de la Federación a entidades federativas.','8140',NULL,NULL),
	(595,46,'Otros conceptos participables de la Federación a municipios.','8150',NULL,NULL),
	(596,46,'Convenios de colaboración administrativa.','8160',NULL,NULL),
	(597,47,'Aportaciones de la Federación a las entidades federativas.','8310',NULL,NULL),
	(598,47,'Aportaciones de la Federación a municipios.','8320',NULL,NULL),
	(599,47,'Aportaciones de las entidades federativas a los municipios.','8330',NULL,NULL),
	(600,47,'Aportaciones previstas en leyes y decretos al sistema de protección social.','8340',NULL,NULL),
	(601,47,'Aportaciones previstas en leyes y decretos compensatorias a entidades federativas y municipios.','8350',NULL,NULL),
	(602,48,'Convenios de reasignación.','8510',NULL,NULL),
	(603,48,'Convenios de descentralización.','8520',NULL,NULL),
	(604,48,'Otros Convenios.','8530',NULL,NULL),
	(605,49,'Amortización de la deuda interna con instituciones de crédito.','9110',NULL,NULL),
	(606,49,'Amortización de la deuda interna con instituciones de crédito.','9111',NULL,NULL),
	(607,49,'Amortización de la deuda interna por emisión de títulos y valores.','9120',NULL,NULL),
	(608,49,'Amortización de la deuda interna por emisión de títulos y valores.','9121',NULL,NULL),
	(609,49,'Amortización de arrendamientos financieros nacionales.','9130',NULL,NULL),
	(610,49,'Amortización de arrendamientos financieros nacionales.','9131',NULL,NULL),
	(611,49,'Amortización de la deuda externa con instituciones de crédito.','9140',NULL,NULL),
	(612,49,'Amortización de la deuda externa con instituciones de crédito.','9141',NULL,NULL),
	(613,49,'Amortización de deuda  externa con organismos financieros internacionales.','9150',NULL,NULL),
	(614,49,'Amortización de deuda externa con organismos financieros internacionales.','9151',NULL,NULL),
	(615,49,'Amortización de la deuda bilateral.','9160',NULL,NULL),
	(616,49,'Amortización de la deuda bilateral.','9161',NULL,NULL),
	(617,49,'Amortización de la deuda externa por emisión de títulos y valores.','9170',NULL,NULL),
	(618,49,'Amortización de la deuda externa por emisión de títulos y valores.','9171',NULL,NULL),
	(619,49,'Amortización de arrendamientos financieros internacionales.','9180',NULL,NULL),
	(620,49,'Amortización de arrendamientos financieros internacionales.','9181',NULL,NULL),
	(621,50,'Intereses de la deuda interna con instituciones de crédito.','9210',NULL,NULL),
	(622,50,'Intereses de la deuda interna con instituciones de crédito.','9211',NULL,NULL),
	(623,50,'Intereses derivados de la colocación de títulos y valores.','9220',NULL,NULL),
	(624,50,'Intereses derivados de la colocación de títulos y valores.','9221',NULL,NULL),
	(625,50,'Intereses por arrendamientos financieros nacionales.','9230',NULL,NULL),
	(626,50,'Intereses por arrendamientos financieros nacionales.','9231',NULL,NULL),
	(627,50,'Intereses de la deuda externa con instituciones de crédito.','9240',NULL,NULL),
	(628,50,'Intereses de la deuda externa con instituciones de crédito.','9241',NULL,NULL),
	(629,50,'Intereses de la deuda con organismos financieros Internacionales.','9250',NULL,NULL),
	(630,50,'Intereses de la deuda con organismos financieros Internacionales.','9251',NULL,NULL),
	(631,50,'Intereses de la deuda bilateral.','9260',NULL,NULL),
	(632,50,'Intereses de la deuda bilateral.','9261',NULL,NULL),
	(633,50,'Intereses derivados de la colocación de títulos y valores en el exterior.','9270',NULL,NULL),
	(634,50,'Intereses derivados de la colocación de títulos y valores en el exterior.','9271',NULL,NULL),
	(635,50,'Intereses por arrendamientos financieros internacionales.','9280',NULL,NULL),
	(636,50,'Intereses por arrendamientos financieros internacionales.','9281',NULL,NULL),
	(637,51,'Comisiones de la deuda pública interna.','9310',NULL,NULL),
	(638,51,'Comisiones de la deuda pública interna.','9311',NULL,NULL),
	(639,51,'Comisiones de la deuda pública externa.','9320',NULL,NULL),
	(640,51,'Comisiones de la deuda pública externa.','9321',NULL,NULL),
	(641,52,'Gastos de la deuda pública interna.','9410',NULL,NULL),
	(642,52,'Gastos de la deuda pública interna.','9411',NULL,NULL),
	(643,52,'Gastos de la deuda pública externa.','9420',NULL,NULL),
	(644,52,'Gastos de la deuda pública externa.','9421',NULL,NULL),
	(645,53,'Costos por coberturas.','9510',NULL,NULL),
	(646,53,'Costos por coberturas.','9511',NULL,NULL),
	(647,54,'Apoyos a intermediarios financieros.','9610',NULL,NULL),
	(648,54,'Apoyos a intermediarios financieros.','9611',NULL,NULL),
	(649,54,'Apoyos a ahorradores y deudores del Sistema Financiero Nacional.','9620',NULL,NULL),
	(650,54,'Apoyos a ahorradores y deudores del Sistema Financiero Nacional.','9621',NULL,NULL),
	(651,55,'ADEFAS.','9910',NULL,NULL),
	(652,55,'ADEFAS.','9911',NULL,NULL),
	(653,55,'Devolución de ingresos percibidos indebidamente en ejercicios fiscales anteriores.','9912',NULL,NULL);

/*!40000 ALTER TABLE `partidas` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Volcado de tabla personal_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`)
VALUES
	(1,'App\\Models\\Usuario',1,'token','2c2da4931301f66324ba134d97eafaf525f04e8cece3f3aeaa5e3af53bb57e3d','[\"*\"]',NULL,NULL,'2023-12-01 16:02:56','2023-12-01 16:02:56'),
	(2,'App\\Models\\Usuario',1,'token','4927eaf4fa9f52f491cd4594fb3a5119a8cf72e06466f49e0f358d74636588d5','[\"*\"]',NULL,NULL,'2023-12-01 16:04:55','2023-12-01 16:04:55'),
	(3,'App\\Models\\Usuario',1,'token','999cdc3352793e30b32576ca7e56cc8175ad9c5bda81c740ac342fbf507b7feb','[\"*\"]',NULL,NULL,'2023-12-01 16:11:59','2023-12-01 16:11:59'),
	(4,'App\\Models\\Usuario',1,'token','8d4050b6311168ca1181d60a21dba10fb29a7de480ad9ed30b7f8bac5075d7b0','[\"*\"]',NULL,NULL,'2023-12-01 16:14:16','2023-12-01 16:14:16'),
	(5,'App\\Models\\Usuario',1,'token','1867828f5f4e3e5f3ac5a876cc467b007fe2db2e3a1ee13ce3d39816cc194132','[\"*\"]',NULL,NULL,'2023-12-01 16:17:27','2023-12-01 16:17:27'),
	(6,'App\\Models\\Usuario',1,'token','8c50941b5b04dbbec98deab957a77e0173ab8c5be603a7555d7b5d8ae4a90759','[\"*\"]',NULL,NULL,'2023-12-01 16:17:42','2023-12-01 16:17:42'),
	(7,'App\\Models\\Usuario',1,'token','1fc9d59644319f374f0764f67fdb97222d072359c37711c72d6103682ab624bf','[\"*\"]',NULL,NULL,'2023-12-01 16:23:15','2023-12-01 16:23:15'),
	(8,'App\\Models\\Usuario',1,'token','50d98d3921de4e0955460b845647efdcc2bbc0083424d29fd1728e52d41eb327','[\"*\"]',NULL,NULL,'2023-12-01 16:28:57','2023-12-01 16:28:57'),
	(9,'App\\Models\\Usuario',1,'token','b97c110efadb8de230a1f15491fbcf4ca755190450263e2ac6351f21cfb79aaf','[\"*\"]',NULL,NULL,'2023-12-01 22:37:47','2023-12-01 22:37:47'),
	(10,'App\\Models\\Usuario',1,'token','1586f94f4e68624504fb69be61e5d28e1db2daccd6cf47027f250c90f832873e','[\"*\"]',NULL,NULL,'2023-12-03 05:14:35','2023-12-03 05:14:35'),
	(11,'App\\Models\\Usuario',1,'token','1fe7988dd544e95a7b3fa07c9097281432b630fe70116b3f46844c618a366030','[\"*\"]',NULL,NULL,'2023-12-03 05:53:34','2023-12-03 05:53:34'),
	(12,'App\\Models\\Usuario',1,'token','8f1412df58f47a5f94459eb1f244d08a1efb9a2517efd3c2ad407513ab78d49c','[\"*\"]',NULL,NULL,'2023-12-04 02:39:54','2023-12-04 02:39:54'),
	(13,'App\\Models\\Usuario',1,'token','d7c4334bbcfcb7981aa2f69038d42bc65e10a11d2fe073fde697b9111dcaa5ef','[\"*\"]',NULL,NULL,'2023-12-04 03:22:43','2023-12-04 03:22:43'),
	(14,'App\\Models\\Usuario',1,'token','c763f2f872355dcf54280431b27a2e32427c559f18eff822f06499e43d54eb41','[\"*\"]',NULL,NULL,'2023-12-04 06:57:30','2023-12-04 06:57:30'),
	(15,'App\\Models\\Usuario',1,'token','e8ad95b2b12c6dc07ebc539d5bea94af4aa7af7f7590922d55296b75da35f5e6','[\"*\"]',NULL,NULL,'2023-12-04 07:37:47','2023-12-04 07:37:47'),
	(16,'App\\Models\\Usuario',1,'token','cb1eeafb3f7d58a9bf1eacfdc8bde617c8f0ccb8eba19465ad798ce57486b4fc','[\"*\"]',NULL,NULL,'2023-12-04 13:41:18','2023-12-04 13:41:18'),
	(17,'App\\Models\\Usuario',1,'token','b7164efd145f60f873393ff8c1ca3413061cb4c2a6eebcb1c93ef95630620e3a','[\"*\"]',NULL,NULL,'2023-12-04 15:16:24','2023-12-04 15:16:24'),
	(18,'App\\Models\\Usuario',1,'token','a97ab65589e108e35c51d78239534ef2515b319b39ee3bde2119f56de99e2500','[\"*\"]',NULL,NULL,'2023-12-04 15:30:52','2023-12-04 15:30:52'),
	(19,'App\\Models\\Usuario',1,'token','ffd1c763ed08820ea311bf397fb3ad6081e100c0f14ed71d0c5f955cf75b7e9c','[\"*\"]',NULL,NULL,'2023-12-04 16:41:34','2023-12-04 16:41:34'),
	(20,'App\\Models\\Usuario',1,'token','07a0493d6104551dbb02401e3dc2f488a0a173e3251acb9b307c1800722113fc','[\"*\"]','2023-12-05 07:21:33',NULL,'2023-12-04 17:02:15','2023-12-05 07:21:33'),
	(21,'App\\Models\\Usuario',1,'token','5473de9dc6d8b228bda57d24b2def0b248716ab954e95e9f5ac62c70c06e6382','[\"*\"]','2023-12-05 07:22:54',NULL,'2023-12-05 07:22:50','2023-12-05 07:22:54'),
	(22,'App\\Models\\Usuario',1,'token','c8f67c0cb8ff4da3b6132a0678f181315d149a1f72fb8de81b847fea90aaadd7','[\"*\"]','2023-12-05 19:39:54',NULL,'2023-12-05 16:21:53','2023-12-05 19:39:54'),
	(23,'App\\Models\\Usuario',1,'token','21994064a41d13b3864a0dec04c7f23db81cf87d429f7fda02f3682f0745bac2','[\"*\"]','2023-12-08 18:05:33',NULL,'2023-12-05 19:42:15','2023-12-08 18:05:33'),
	(24,'App\\Models\\Usuario',1,'token','1c6f8e094a1e81bbf0997fa77a8a44c63d60d4a016b080ca9d3076158c06a92e','[\"*\"]','2023-12-08 19:02:12',NULL,'2023-12-08 18:07:30','2023-12-08 19:02:12');

/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla programa_subprograma
# ------------------------------------------------------------

DROP TABLE IF EXISTS `programa_subprograma`;

CREATE TABLE `programa_subprograma` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `programa_id` bigint unsigned NOT NULL,
  `subprograma_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `programa_subprograma_programa_id_foreign` (`programa_id`),
  KEY `programa_subprograma_subprograma_id_foreign` (`subprograma_id`),
  CONSTRAINT `programa_subprograma_programa_id_foreign` FOREIGN KEY (`programa_id`) REFERENCES `programas` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `programa_subprograma_subprograma_id_foreign` FOREIGN KEY (`subprograma_id`) REFERENCES `subprogramas` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Volcado de tabla programas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `programas`;

CREATE TABLE `programas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `numero` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `programas` WRITE;
/*!40000 ALTER TABLE `programas` DISABLE KEYS */;

INSERT INTO `programas` (`id`, `numero`, `nombre`, `created_at`, `updated_at`)
VALUES
	(1,'01','Impartición de Justicia',NULL,NULL),
	(2,'02','Promoción de la Imagen Institucional y la Cultura Democrática',NULL,NULL),
	(3,'03','Incrementar la eficiencia administrativa',NULL,NULL),
	(4,'04','Modernización Tecnológica',NULL,NULL),
	(5,'05','Transparencia y Protección de Datos Personales',NULL,NULL),
	(6,'06','Rendición de Cuentas',NULL,NULL),
	(7,'07','Formación y Capacitación del Personal',NULL,NULL);

/*!40000 ALTER TABLE `programas` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla proyecto_responsable_operativo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `proyecto_responsable_operativo`;

CREATE TABLE `proyecto_responsable_operativo` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `responsable_operativo_id` bigint unsigned NOT NULL,
  `proyecto_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proyecto_responsable_operativo_responsable_operativo_id_foreign` (`responsable_operativo_id`),
  KEY `proyecto_responsable_operativo_proyecto_id_foreign` (`proyecto_id`),
  CONSTRAINT `proyecto_responsable_operativo_proyecto_id_foreign` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `proyecto_responsable_operativo_responsable_operativo_id_foreign` FOREIGN KEY (`responsable_operativo_id`) REFERENCES `responsables_operativos` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Volcado de tabla proyecto_subprograma
# ------------------------------------------------------------

DROP TABLE IF EXISTS `proyecto_subprograma`;

CREATE TABLE `proyecto_subprograma` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subprograma_id` bigint unsigned NOT NULL,
  `proyecto_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proyecto_subprograma_subprograma_id_foreign` (`subprograma_id`),
  KEY `proyecto_subprograma_proyecto_id_foreign` (`proyecto_id`),
  CONSTRAINT `proyecto_subprograma_proyecto_id_foreign` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `proyecto_subprograma_subprograma_id_foreign` FOREIGN KEY (`subprograma_id`) REFERENCES `subprogramas` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Volcado de tabla proyectos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `proyectos`;

CREATE TABLE `proyectos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `numero` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int NOT NULL,
  `objetivo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `justificacion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `nombre_responsable_operativo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cargo_responsable_operativo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_titular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsable_ficha` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `autorizado_por` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;

INSERT INTO `proyectos` (`id`, `numero`, `nombre`, `tipo`, `version`, `objetivo`, `justificacion`, `descripcion`, `fecha`, `nombre_responsable_operativo`, `cargo_responsable_operativo`, `nombre_titular`, `responsable_ficha`, `autorizado_por`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'01','Acciones del Pleno, administrativas y jurisdiccionales\nnecesarias, para impartir justicia en los medios de impugnación\nen materia electoral y controversias laborales y administrativas;\nasí como para el fortalecimiento institucional.','normal',1,'Garantizar a la ciudadanía y asociaciones políticas la impartición de justicia en materia político electoral en el ámbito jurisdiccional, así como fijar las políticas y lineamientos administrativos que contribuyan en el fortalecimiento y consolidación institucional.','La ejecución de estas actividades tiene como finalidad elaborar los proyectos de resolución relativos a los medios de impugnación y controversias planteadas ante este Tribunal.','Que el Pleno realice las acciones jurisdiccionales y administrativas necesarias para recibir, sustanciar y resolver en definitiva las impugnaciones y controversias sometidas a su consideración.','2022-10-17','Lic. Ricardo Zozaya González y María del Pilar Meza Robert ','Secretario y Secretaria Ejecutiva','Magistrado Armando Ambriz Hernández ','Lic. Ricardo Zozaya González y María del Pilar Meza Robert ','EL PLENO EN REUNIÓN PRIVADA ','0',NULL,NULL),
	(2,'02','Acciones que la Ponencia realiza para la impartición de justicia electoral, laboral y administrativa.','normal',1,'Garantizar a la ciudadanía y asociaciones políticas la impartición de justicia en materia político electoral en el ámbito jurisdiccional, así como fijar las políticas y lineamientos administrativos que contribuyan en el fortalecimiento y consolidación institucional.','La ejecución de este proyecto tiene como finalidad la impartición de justicia electoral, laboral y administrativa mediante la resolución definitiva de impugnaciones y controversias competencia de este Tribunal.\n\n','Que la Ponencia reciba, sustancie y elabore proyectos de resolución y/o acuerdos plenarios de los asuntos turnados.','2022-10-17','María del Pilar Meza Robert y Lic. Ricardo Zozaya González  ','Secretaria Ejecutiva y Secretario  ','Magistrado Armando Ambriz Hernández ','María del Pilar Meza Robert y Lic. Ricardo Zozaya González  ','EL PLENO EN REUNIÓN PRIVADA ','0',NULL,NULL),
	(3,'01','Acciones del Pleno, administrativas y jurisdiccionales necesarias, para impartir justicia en los medios de impugnación en materia electoral y controversias laborales y administrativas; así como para el fortalecimiento institucional.','normal',1,'Garantizar a la ciudadanía y asociaciones políticas la impartición de justicia en materia político electoral en el ámbito jurisdiccional, así como fijar las políticas y lineamientos administrativos que contribuyan en el fortalecimiento y consolidación institucional.','La ejecución de este proyecto tiene como finalidad la impartición de justicia electoral, laboral y administrativa mediante la resolución definitiva de impugnaciones y controversias competencia de este Tribunal. ','Que el Pleno realice las acciones jurisdiccionales y administrativas necesarias para recibir, sustanciar y resolver en definitiva las impugnaciones y controversias sometidas a su consideración.','2022-10-17','Lcdo. Carlos Antonio Neri Carrillo','Coordinador de Ponencia','Magistrada Martha Leticia Mercado Ramírez','Lcdo. Carlos Antonio Neri Carrillo','EL PLENO EN REUNIÓN PRIVADA DEL 02 DICIEMBRE DE 2020','0',NULL,NULL),
	(4,'02','Acciones que la Ponencia realiza para la impartición de justicia electoral, laboral y administrativa.','normal',1,'Garantizar a la ciudadanía y asociaciones políticas la impartición de justicia en materia político electoral en el ámbito jurisdiccional, así como fijar las políticas y lineamientos administrativos que contribuyan en el fortalecimiento y consolidación institucional.','La ejecución de estas actividades tiene como finalidad elaborar los proyectos de resolución relativos a los medios de impugnación y controversias planteadas ante este Tribunal.\n','Que la Ponencia reciba, sustancie y elabore proyectos de resolución y/o acuerdos plenarios de los asuntos turnados.\n\n','2022-10-17','Lcdo. Carlos Antonio Neri Carrillo','Coordinador de Ponencia','Magistrada Martha Leticia Mercado Ramírez','Lcdo. Carlos Antonio Neri Carrillo','EL PLENO EN REUNIÓN PRIVADA DEL 02 DICIEMBRE DE 2020','0',NULL,NULL),
	(5,'01','Acciones del Pleno, administrativas y jurisdiccionales necesarias, para impartir justicia en los medios de impugnación en materia electoral y controversias laborales y administrativas; así como para el fortalecimiento institucional.','normal',1,'Garantizar a la ciudadanía y asociaciones políticas la impartición de justicia en materia político electoral en el ámbito jurisdiccional, así como fijar las políticas y lineamientos administrativos que contribuyan en el fortalecimiento y consolidación institucional.','La ejecución de este proyecto tiene como finalidad la impartición de justicia electoral, laboral y administrativa mediante la resolución definitiva de impugnaciones y controversias competencia de este Tribunal. ','Que el Pleno realice las acciones jurisdiccionales y administrativas necesarias para recibir, sustanciar y resolver en definitiva las impugnaciones y controversias sometidas a su consideración. ','2022-10-17','Lcda. Lilián Herrera Guzmán','Secretaria de Estudio y Cuenta','VACANTE','Lcda. Lilián Herrera Guzmán','EL PLENO EN REUNIÓN PRIVADA ','0',NULL,NULL),
	(6,'02','Acciones que la Ponencia realiza para la impartición de justicia electoral, laboral y administrativa.','normal',1,'Garantizar a la ciudadanía y asociaciones políticas la impartición de justicia en materia político electoral en el ámbito jurisdiccional, así como fijar las políticas y lineamientos administrativos que contribuyan en el fortalecimiento y consolidación institucional.','La ejecución de estas actividades tiene como finalidad elaborar los proyectos de resolución relativos a los medios de impugnación y controversias planteadas ante este Tribunal.','Que la Ponencia reciba, sustancie y elabore proyectos de resolución y/o acuerdos plenarios de los asuntos turnados.','2022-10-17','Lcda. Lilián Herrera Guzmán','Secretaria de Estudio y Cuenta','VACANTE','Lic. Lilián Herrera Guzmán','EL PLENO EN REUNIÓN PRIVADA','0',NULL,NULL),
	(7,'01','Acciones del Pleno, administrativas y jurisdiccionales necesarias, para impartir justicia en los medios de impugnación en materia electoral y controversias laborales y administrativas; así como para el fortalecimiento institucional.','normal',1,'Garantizar a la ciudadanía y asociaciones políticas la impartición de justicia en materia político electoral en el ámbito jurisdiccional, así como fijar las políticas y lineamientos administrativos que contribuyan en el fortalecimiento y consolidación institucional.','La ejecución de este proyecto tiene como finalidad la impartición de justicia electoral, laboral y administrativa mediante la resolución definitiva de impugnaciones y controversias competencia de este Tribunal.','Que el Pleno realice las acciones jurisdiccionales y administrativas necesarias para recibir, sustanciar y resolver en definitiva las impugnaciones y controversias sometidas a su consideración.','2022-09-13','Lic. Gerardo Martínez Cruz','Secretario Prarticular de Magistrada','Magda. Martha Alejandra Chávez Camarena','Lic. Gerardo Martínez Cruz','EL PLENO EN REUNIÓN PRIVADA DEL 1° DE FEBRERO DE 2012','0',NULL,NULL),
	(8,'02','Acciones que la Ponencia realiza para la impartición de justicia electoral, laboral y administrativa.','normal',1,'Garantizar a la ciudadanía y asociaciones políticas la impartición de justicia en materia político electoral en el ámbito jurisdiccional, así como fijar las políticas y lineamientos administrativos que contribuyan en el fortalecimiento y consolidación institucional.','La ejecución de estas actividades tiene como finalidad elaborar los proyectos de resolución relativos a los medios de impugnación y controversias planteadas ante este Tribunal.\n','Que la Ponencia reciba, sustancie y elabore proyectos de resolución y/o acuerdos plenarios de los asuntos turnados.\n','2022-09-13','Lic. Gerardo Martínez Cruz','Secretario Particular de Magistrada','Magda. Martha Alejandra Chávez Camarena','Lic. Gerardo Martínez Cruz','EL PLENO EN REUNIÓN PRIVADA DEL 1° DE FEBRERO DE 2012','0',NULL,NULL),
	(9,'04','Elaboración de Anteproyectos de Jurisprudencias y Tesis Relevantes','normal',1,'Que los criterios, Jurisprudencia y Tesis Relevantes emitidos por el Pleno del Tribunal Electoral de la Ciudad de México, cumplan con las formalidades técnico-jurídicas para su integración al marco legal en materia electoral de la Ciudad de México, a través de presentar a la/el Presidenta/e los anteproyectos de textos que forman los criterios, para su análisis y eventual aprobación. Asimismo, llevar el registro y difusión de la Jurisprudencia y Tesis Relevantes aprobadas por el Tribunal Electoral del Poder Judicial de la Federación, por conducto de su Sala Superior y la Sala Regional correspondiente a la Cuarta Circunscripción Electoral Federal. Del mismo modo, el registro de personas sancionadas por Violencia Política contra las Mujeres en razón de  Género.','La implementación de este proyecto es fundamental ya que derivado de sus actividades se elaborarán los criterios de Jurisprudencia y Tesis Relevantes; así como su registro, compilación y difusión, previa aprobación del Pleno del Tribunal Electoral de la Ciudad de México. Asimismo, se efectuará la difusión y archivo de la Jurisprudencia y Tesis Relevantes emitidas por el Tribunal Electoral del Poder Judicial de la Federación y se dará seguimiento a las sesiones de la Sala Superior, la Sala Regional Ciudad de México y Sala Regional Especializada de ese Tribunal. Asimismo, se coadyuva con la sistematización del registro de personas sancionadas por Violencia Política contra las Mujeres en Razón de Género.','Formulación de anteproyectos de Jurisprudencia y Tesis Relevantes, detección de criterios y contradicción de los mismos, elaboración de las carpetas, índices y sistemas de clasificación para el registro, compilación y difusión de Jurisprudencias y Tesis relevantes que apruebe el Pleno de este Órgano Jurisdiccional; así como el archivo y difusión de las Jurisprudencias y Tesis relevantes que aprueba el Tribunal Electoral del Poder Judicial de la Federación.','2022-10-17','Lcdo. Marco Antonio Ambriz Carreón','Subdirector de Jurisprudencia','Lcdo. Luis Martín Flores Mejia','Lcdo. Marco Antonio Ambriz Carreón ','EL PLENO EN REUNIÓN PRIVADA ','0',NULL,NULL),
	(10,'01','Representación del Tribunal en los distintos eventos de carácter local, nacional e internacional. Celebrar los convenios institucionales que se requieran; así como realizar los actos administrativos necesarios para el buen funcionamiento del Tribunal.','normal',1,'Coordinar los trabajos de los órganos y áreas del Tribunal, de acuerdo con la normatividad jurídica aplicable.','Este proyecto se requiere ejecutar ya que concentra las actividades de representación institucional en los diversos eventos en que debe participar el Tribunal Electoral de la Ciudad de México, lo cual le da presencia a este Órgano Autónomo ante la ciudadanía. Asimismo, el proyecto es necesario debido a que en él se consideran las actividades de coordinación de las áreas que lo integran.','El proyecto tiene como propósito representar al Tribunal en el ámbito local, nacional e internacional en materia de impartición de justicia electoral, a través del diálogo con diversos organismos públicos y privados, organizaciones de la sociedad civil, entre otros. Las acciones de este proyecto están orientadas a establecer y consolidar los vínculos con los diferentes actores de la sociedad con los cuales el Tribunal fortalece su operación, desarrollo, resultados, posicionamiento, imagen y autonomía en el ámbito de impartición de justicia electoral.  Asimismo, busca fomentar y mantener una adecuada operación interna a través de la oportuna coordinación de las actividades y funciones que desempeña cada unidad administrativa del TECDMX e informar de ello al Pleno.','2022-10-17','Lcda. Lilián Herrera Guzmán','Secretaria de Estudio y Cuenta','Magistrado Presidente Interino Armando Ambriz Hernández','Lcda. Lilián Herrera Guzmán','EL PLENO EN REUNIÓN PRIVADA','0',NULL,NULL),
	(11,'01','Presentación del informes de la Contraloría Interna','normal',1,' Fiscalizar el manejo, custodia y aplicación de los recursos del Tribunal Electoral, así como instruir los procedimientos y, en su caso, aplicar las sanciones establecidas en la Ley de Responsabilidades Administrativas de la Ciudad de México, conforme al artículo 202, fracciones VI, XI, XIV, XVIII y XX del Código de Instituciones y Procedimientos Electorales de la Ciudad de México.','Transparentar las actividades de la Contraloría Interna en términos de lo dispuesto en el Código de Instituciones y Procedimientos Electorales de la Ciudad de México.','Rendir cuentas sobre las actividades institucionales de la Contraloría Interna','2022-10-17','Lcdo. Marco Antonio Guerra Castillo','Secretario Particular de la Contraloría Interna','Mtra. Agar Leslie Serrano Álvarez, Encargada de Despacho de la Contraloría Interna','Lcdo. Marco Antonio Guerra Castillo','EL PLENO EN REUNIÓN PRIVADA DEL 1° FEBRERO DE 2012','0',NULL,NULL),
	(12,'01','Coordinación de la representación legal y asesoramiento jurídico del Tribunal Electoral de la Ciudad de México.','normal',1,'Apoyar a la o el Presidente en la representación legal del Tribunal ante las autoridades administrativas y judiciales, ya sean locales o federales, así como atender los asuntos de este órgano jurisdiccional en materia contenciosa, consultiva, contractual y normativa a excepción de los asuntos relacionados con la materia electoral o de participación ciudadana.','La implementación del proyecto es prioritaria dado que la representación legal del Tribunal ante las autoridades administrativas, laborales o judiciales, locales o federales, es imprescindible a fin de atender y dar seguimiento a los asuntos que en materia contenciosa, contractual, consultiva y normativa, tiene esta Institución.','La Dirección General Jurídica tiene por objeto, fundamentalmente, apoyar en la representación legal del Tribunal ante las autoridades administrativas, laborales o judiciales, locales o federales, así como coordinar la atención y seguimiento de los asuntos de este órgano jurisdiccional en las materias de su competencia, de conformidad con la normativa aplicable.','2022-10-17','Lic. María Magdalena Roque Morales','Secretaria Ejecutiva','Lic. Eber Dario Comonfort Palacios','Lic. María Magdalena Roque Morales','El Pleno del Tribunal Electoral de la Ciudad de México, en Reunión Privada del veintinueve de octubre de 2020','0',NULL,NULL),
	(13,'02','Soluciones de tecnologías de la información que coadyuven a la transparencia, rendición de cuentas, difusión de la información y gobierno abierto.','normal',1,'La Unidad de Servicios Informáticos, es el área que dirige la actividad informática del Tribunal Electoral de la Ciudad de México que, bajo la jerarquía del Pleno y su Presidente/a, tiene a su cargo el manejo eficaz y eficiente de los servicios y asuntos relacionados con la informática de la institución.Uno de los principales objetivos es apoyar al desarrollo informático dentro del Tribunal, mediante una contribución profesional y de alto nivel que garantice la continuidad de los servicios electrónicos existentes; así como organizar y fortalecer el rumbo informático para producir e implementar las herramientas relevantes y útiles que los usuarios de los órganos y áreas requieren para el desempeño de las funciones que tienen asignadas. Para responder al objetivo previamente indicado, la Unidad de Servicios Informáticos, apoya y desarrolla varias líneas básicas de actividades: desarrollo de sistemas, asesoría y capacitación especializada, administración de servicios (correo electrónico, Internet/Intranet, Telefonía y Red de Datos) y difusión de información relevante a través de Internet e Intranet, así como fortalecer la infraestructura informática e implementar los nuevos proyectos que surjan en  los órganos y áreas del Tribunal.Es decir, implementar las bases tecnológicas, para la estandarización de la infraestructura de cómputo, que permitan dirigir el rumbo informático a corto, mediano y largo plazo del Tribunal, haciendo uso de las mejores prácticas de tecnologías de la información y comunicaciones, aplicadas al ámbito jurídico-electoral y administrativo.','Con el objetivo de cumplir con la doctrina de un Gobierno Abierto, ser un Tribunal transparente y proporcionar un acceso a la información con igualdad de oportunidades para todos los ciudadanos y ciudadanas, es necesario contar con las herramientas tecnológicas que permitan la mejor rendición de cuentas y difusión de la información.','Creación de nuevos sitios web, así como el mantenimiento y actualización a los que se tienen actualmente para su buen funcionamiento:\n- Portal de transparencia alineándolo a la ley de transparencia, acceso a la información pública y rendición de cuentas de la Ciudad de México.\n- Transmisión de sesiones públicas y eventos a través de la página web del Tribunal, Intranet y redes sociales. \n- Mantenimiento y actualización de los diferentes sitios web del Tribunal.\n- Creación de nuevos sitios web acorde a las necesidades del Tribunal, incorporando herramientas de accesibilidad.','2022-10-17','Lcda. Mónica Uribe Pineda','Subdirectora de Servicios Informáticos','Lcdo. Alan Edgar Emmanuel Gutiérrez Monroy','Lcda. Mónica Uribe Pineda','','0',NULL,NULL),
	(14,'02','Atención y seguimiento a los procedimientos jurisdiccionales, procesos y trámites en los que este Tribunal, sea parte.','normal',1,'Apoyar a la o el Presidente en la representación legal del Tribunal ante las autoridades administrativas y judiciales, ya sean locales o federales, así como atender los asuntos de este órgano colegiado en materia contenciosa y consultiva.','La implementación del proyecto es necesaria porque se deben atender en tiempo y forma los juicios de amparo y laborales que deriven de las resoluciones de índole laboral o de responsabilidad administrativa promovidos por personas servidoras públicas del IECDMX ó de este Tribunal, así como realizar diversos trámites ante autoridades administrativas.','Entre las actividades que contiene el proyecto se encuentra representar al Tribunal en los juicios de amparo derivados de las resoluciones de índole laboral o de responsabilidad administrativa promovidos por personas servidoras públicas del IECDMX o del propio órgano jurisdiccional; y sustanciar ante la Comisión de Controversias Laborales y Administrativas los juicios laborales y administrativos promovidos por personas ex servidoras públicas del Tribunal, en su carácter de demandado. Se contempla representar a esta institución cuando acude como parte actora o demandada en algún juicio así como atender las instancias penales. Representación que implica realizar todas las diligencias necesarias, para defender los intereses del TECDMX. Asimismo, conocer de trámites ante autoridades administrativas del Instituto Nacional de Derechos de Autor (INDAUTOR), Instituto Nacional Electoral (INE) y Dirección General Jurídica y de Estudios Legislativos (Gaceta Oficial de la Ciudad de México), así como las demás que se instruyan por los superiores jerárquicos.','2022-10-17','Lic. Luis Sánchez Baltazar','Subdirector de lo Contencioso y Consultivo','Lic. Eber Dario Comonfort Palacios','Lic. Luis Sánchez Baltzar','EL PLENO EN REUNIÓN PRIVADA DEL 1° DE FEBRERO DE 2012','0',NULL,NULL),
	(15,'02','Administración de Recursos Financieros','normal',1,'Administrar eficiente y eficazmente los recursos financieros, con la finalidad de contribuir al logro de los objetivos institucionales, garantizando el cumplimiento oportuno de las obligaciones laborales y económicas, con estricto apego a la normatividad aplicable vigente; vigilando el ejercicio transparente del presupuesto institucional y la satisfacción de las áreas requirentes mediante la mejora continua de nuestros procesos.','Es pilar fundamental de la gestión institucional, la administración de los recursos financieros, por ello este proyecto esta orientado al manejo del presupuesto, la contabilidad y las finanzas institucionales, a fin de atender de manera oportuna los requerimientos presupuestales de las áreas, para cumplir con la actividad jurisdiccional del Tribunal y lograr las metas consideradas en el Programa Operativo Anual 2019; a fin de generar información veraz y oportuna que permita transparentar las atribuciones conferidas a este órgano autónomo y el manejo eficiente del presupuesto asignado.\nAsimismo, se deben desarrollar actividades orientadas a consolidar el marco procedimental del Tribunal.','En cumplimiento a lo dispuesto en el Artículo 42 del Reglamento Interior del Tribunal Electoral de la Ciudad de México, la Dirección de Planeación y Recursos Financieros realizará actividades encaminadas a la administración eficiente de los recursos presupuestales, el oportuno registro contable y la emisión en tiempo de los estados financieros, presupuestales y contables del Tribunal. \n\nCon el proyecto se atenderá oportuna y eficientemente a las unidades administrativas del Tribunal, respecto de los requerimientos de gasto, control e información presupuestal y contable; se desarrollarán y aplicarán instrumentos para la planeación, programación, presupuestación, seguimiento y evaluación para el ejercicio del gasto; y las funciones que deriven de las disposiciones aplicables y las que le encomienden el Pleno, el/la Presidente/a y el/la Secretario/a Administrativo/a. También se efectuarán las actividades para crear y actualizar el marco procedimental del órgano jurisdiccional.','2022-10-17','L.C. Tomás Juan Godínez Torres','Director de Planeación y Recursos Financieros','Lcdo. Héctor Ángeles Hernández','L.C. Tomás Juan Godínez Torres','EL PLENO EN REUNIÓN PRIVADA DEL 1° DE FEBRERO DE 2012','0',NULL,NULL),
	(16,'01','Diseño, ejecución y seguimiento del Programa Interno de Auditoría (PIA)','normal',1,'El Programa Interno de Auditoría se elabora para dar cumplimiento a los artículos 200 y 202, fracciones I, II, III, IV y XIX del Código de Instituciones y Procedimientos Electorales de la Ciudad de México, así como a los artículos 50, 51 bis y 54 del Reglamento Interior del Tribunal Electoral de la Ciudad de México, haciéndolo del conocimiento del Pleno. La programación de éstas permite identificar el periodo de ejecución y presentación de los informes finales de cada una de las auditorías de mérito. ','Fiscalizar el manejo, custodia y aplicación de los recursos del Tribunal Electoral, así como instruir los procedimientos y, en su caso, aplicar las sanciones establecidas en la Ley de Responsabilidades Administrativas de la Ciudad de México. ','El Programa Interno de Auditoría se realizará de conformidad con la calendarización y los periodos de ejecución de cada una de éstas.','2022-10-17','Lcda. Orquídea Mayalli González Torres','Directora de Auditoría, Control y Evaluación','Mtra. Agar Leslie Serrano Álvarez, Encargada de Despacho de la Contraloría Interna','Lcda. Orquídea Mayalli González Torres','EL PLENO EN REUNIÓN PRIVADA DEL 1° FEBRERO DE 2012','0',NULL,NULL),
	(17,'02','Procedimientos Administrativos','normal',1,'Fiscalizar el manejo, custodia y aplicación de los recursos del Tribunal Electoral, así como instruir los procedimientos y, en su caso, aplicar las sanciones establecidas en la Ley de Responsabilidades Administrativas de la Ciudad de México, de conformidad con lo establecido en el artículo 202, fracciones III, IX, X, XI y XV del Código de Instituciones y Procedimientos Electorales de la Ciudad de México.','Es necesario para controlar las acciones vinculadas con los procedimientos administrativos por faltas no graves a cargo de la Dirección.','El proyecto contempla actividades que coadyuvan en la tramitación, sustanciación y resolución de los procedimientos de responsabilidad administrativa, de adquisiciones y de obra.','2022-10-17','Lcdo. José de Jesús Ruíz Gallegos','Jefe de Departamento de Responsabilidades','Mtra. Agar Leslie Serrano Álvarez, Encargada de Despacho de la Contraloría Interna','Mtra. Agar Leslie Serrano Álvarez','EL PLENO EN REUNIÓN PRIVADA DEL 1° FEBRERO DE 2012','0',NULL,NULL),
	(18,'04','Administración de recursos materiales y servicios generales','normal',1,'Coordinar la administración de los recursos materiales del Tribunal Electoral aplicando políticas, normas y procedimientos emitidos; vigilando el manejo del patrimonio y el eficiente uso de los bienes muebles e inmuebles para garantizar el ejercicio adecuado del presupuesto institucional.','En virtud de que existen necesidades de adquisición y/o contratación de bienes, servicios y obra que pueden requerir las diversas áreas de este Órgano Autónomo, es necesario crear un proyecto que concentre las actividades encaminadas a llevar a cabo dichos procesos con el fin de tener una aplicación eficiente de los recursos presupuestales y proveer oportunamente de los insumos que permitan la operación institucional. También es necesario ejecutar el proyecto para garantizar el óptimo funcionamiento de las instalaciones del Tribunal y con ello aportar elementos de seguridad e higiene, tanto para el personal como para el edificio sede.','Realizar la planeación, programación, presupuestación, gasto, ejecución y control de activo fijo, adquisiciones y servicios detectados por esta Dirección y solicitados por las Unidades Administrativas. Este proyecto considera brindar mantenimiento preventivo y correctivo a las instalaciones del Tribunal.','2022-10-07','Lcda.  Itzel Romero Ponce','Directora de Recursos Materiales y Servicios Generales','Lcdo. Héctor Ángeles Hernández','Lcda.  Itzel Romero Ponce','EL PLENO EN REUNIÓN PRIVADA DEL 1° DE FEBRERO DE 2012','0',NULL,NULL),
	(19,'03','Apoyo técnico jurídico del Pleno','normal',1,'Apoyar al Pleno y a la o el Magistrado Presidente del Tribunal, con acciones de carácter jurídico-administrativo, destacando entre ellas, la recepción de los medios de impugnación que se presenten ante la Oficialía de Partes; su registro en los libros de gobierno respectivos; y turno a las Ponencias de esta Institución para la sustanciación y resolución correspondiente. Asimismo, proveer lo necesario para la celebración de las sesiones y reuniones del Pleno, elaborando las respectivas actas y acuerdos. Supervisar que se hagan en tiempo y forma las notificaciones y finalmente el registro en las tesis relevantes y de jurisprudencia así como la sistematización de datos estadísticos de la actividad jurisdiccional.','Las actividades del Pleno requieren del apoyo técnico jurídico que genere de manera oportuna información actualizada y ordenada de las actas y acuerdos que tome el Pleno de este Tribunal con el fin de llevar un adecuado control de la información derivada de las actividades del órgano superior de dirección.','En el marco de este proyecto se realizará la elaboración y registro de las actas y acuerdos tomados con motivo de las reuniones privadas y sesiones públicas celebradas por el Pleno del Tribunal Electoral de la Ciudad de México.','2022-10-17','Licdo. Alfredo Soto Rodriguez','Secretario Técnico de la Secretaría General','Licdo. Pablo Francisco Hernández Hernández','Licdo. Alfredo Soto Rodríguez','EL PLENO EN REUNIÓN PRIVADA DEL 1° DE FEBRERO DE 2012','0',NULL,NULL),
	(20,'01','Control de Gestión Jurisdiccional','normal',1,'Apoyar al Pleno y a la o el Magistrado Presidente del Tribunal, con acciones de carácter jurídico-administrativo, destacando entre ellas, la recepción de los medios de impugnación que se presenten ante la Oficialía de Partes; su registro en los libros de gobierno respectivos; y turno a las Ponencias de esta Institución para la sustanciación y resolución correspondiente. Asimismo, proveer lo necesario para la celebración de las sesiones y reuniones del Pleno, elaborando las respectivas actas y acuerdos. Supervisar que se hagan en tiempo y forma las notificaciones y finalmente el debido resguardo de los expedientes jurisdiccionales y su conservación como acervo de la actividad jurisdiccional de esta autoridad. ','Es un proyecto sustantivo que refleja la actividad esencial y sustantiva del Tribunal que, en su carácter de autoridad jurisdiccional especializado en materia electoral en la Ciudad de México, resuelve los medios de impugnación en esa materia, y demás procedimientos jurisdiccionales de su competencia, por lo que es indispensable ejecutar este proyecto para recibir, gestionar y resguardar  la correspondencia jurisdiccional de esta autoridad, de acuerdo con la normativa atinente. Lo anterior, permite la debida atención de solicitudes de información pública, requerimientos formulados por los integrantes del Pleno y en su caso, la certificación de documentación jurisdiccional que obre en poder de la Secretaría General. Finalmente, se da puntual seguimiento y atención a los medios de impugnación interpuestos a fin de controvertir las resoluciones de esta autoridad, así como el desahogo de requerimientos que la autoridad federal formule a esta instancia.','Las actividades del proyecto se enfocarán a efectuar la recepción y gestión de documentación jurisdiccional, así como  la integración y resguardo de expedientes jurisdiccionales.','2022-10-17','Licdo. Víctor Adrián Rodríguez Castillo','Subdirector de Oficialía de Partes y Archivo Jurisdiccional','Licdo. Pablo Francisco Hernández Hernández','Licdo. Víctor Adrián Rodríguez Castillo','EL PLENO EN REUNIÓN PRIVADA DEL 1° DE FEBRERO DE 2012','0',NULL,NULL),
	(21,'05','Sistematización de la Estadística Jurisdiccional','normal',1,'Realizar la recolección de datos a fin de organizar, procesar, sintetizar, analizar y presentar los informes estadísticos de la actividad jurisdiccional que genera el Tribunal.','La elaboración de la información estadística en materia jurisdiccional permite al Pleno del TECDMX y a sus áreas, contar con elementos cuantificables suficientes para emitir decisiones, criterios jurisdiccionales o empleo de precedentes, lo que facilita su labor jurisdiccional, siempre apegado a la normativa electoral vigente.','El proyecto consiste en recopilar, clasificar, cuantificar e integrar la actividad jurisdiccional que realiza el TECDMX, desde contabilizar el número de medios de impugnación o demandas que son recibidas, hasta la relación de sentencias que fueron emitidas por el Pleno del TECDMX; establecida la clasificación de la información en distintos rubros, permite el desahogo de las consultas y requerimientos de información formulados por parte del Pleno y las distintas áreas del Tribunal.','2022-10-17','Lcda. Elvira Susana Guevara Ortega ','Subdirectora de Estadística','Lcdo. Luis Martín Flores Mejía','Lcda. Elvira Susana Guevara Ortega ','EL PLENO EN REUNIÓN PRIVADA ','0',NULL,NULL),
	(22,'02','Diligencias practicadas del Tribunal Electoral de la Ciudad de México','normal',1,'Apoyar al Pleno y al Magistrado Presidente del Tribunal, con acciones de carácter jurídico-administrativo, destacando entre ellas, la recepción de los medios de impugnación que se presenten ante la Oficialía de Partes; su registro en los libros de gobierno respectivos; y turno a las Ponencias de esta Institución para la sustanciación y resolución correspondiente. Asimismo, proveer lo necesario para la celebración de las sesiones y reuniones del Pleno, elaborando las respectivas actas y acuerdos. Supervisar que se hagan en tiempo y forma las notificaciones y finalmente el registro en las tesis relevantes y de jurisprudencia así como la sistematización de datos estadísticos de la actividad jurisdiccional.','Una de las tareas primordiales en el trabajo jurisdiccional y el de carácter administrativo es la práctica de diligencias, ya que en el primer caso, dichas actividades coadyuvan a la sustanciación y resolución de asuntos sometidos al Pleno del TECDMX y, en el segundo, a la resolución de situaciones jurídicas concretas.','Las acciones de este proyecto se orientan a desahogar las diligencias jurisdiccionales ordenadas en aquellas determinaciones procesales, emitidas por el Pleno del Tribunal Electoral de la Ciudad de México,  por su Presidente, o por alguno de los/as Magistrados/as integrantes, relativo al trámite, cumplimiento o ejecución de aquellos actos inherentes a la sustanciación y resolución de los asuntos sometidos a la competencia de este Órgano Jurisdiccional local. Asimismo, se practicarán las diligencias ordenadas por autoridades administrativas, pertenecientes al Tribunal Electoral local, que emiten actos que resuelven situaciones jurídicas concretas en atención a sus respectivas competencias.  Finalmente, y con el objeto de transparentar la actividad jurisdiccional de este Tribunal Electoral local, llevar a cabo el registro en el portal de internet de los acuerdos y/o sentencias dictados por el Pleno, o por algún/a Magistrado/a en lo individual.','2022-10-17','Licda. Susan Paulet Velázquez Pedral','Subdirectora de la Oficina de Actuarios','Lic. Pablo Francisco Hernández Hernández','Licda. Susan Paulet Velázquez Pedral','EL PLENO EN REUNIÓN PRIVADA DEL 1° DE FEBRERO DE 2012','0',NULL,NULL),
	(23,'01','Sustanciación de los juicios especiales laborales  entre sus trabajadores y el Tribunal Electoral de la Ciudad  de México, derivados de las relaciones de trabajo; y de los juicios de inconformidad administrativa entre el Tribunal y sus servidores, emanados de la determinación de sanciones administrativas.','normal',1,'Garantizar al Tribunal y a las personas servidoras del mismo, que la instrucción de los juicios especiales laborales y las inconformidades administrativas que se susciten entre ellos, se lleven a cabo con estricto apego a la Ley; observando los principios de legalidad, objetividad, imparcialidad, certeza y transparencia.','Garantizar la atención de los juicios especiales laborales y de los de inconformidad administrativa que se susciten entre los trabajadores y el Tribunal Electoral, observando las medidas necesarias para lograr la mayor economía, concentración y sencillez del proceso.\n\n','Conforme lo establece el Código de Instituciones y Procedimientos Electorales de la Ciudad México, esta Comisión tiene a su cargo el conocimiento de los juicios especiales laborales que se susciten entre los trabajadores y el Tribunal Electoral; persiguiendo con ello garantizar la correcta aplicación de la ley, instruyendo los juicios desde la presentación de la demanda, hasta la emisión del proyecto de sentencia; promoviendo, en primer término, la conciliación entre las partes involucradas; así como la sustanciación de los juicios de inconformidad administrativa.\n\nAsimismo, se brindarán servicios de consultoría jurídica en materia laboral y administrativa; y se prevé participar con proyectos de reformas a la normatividad interna, en los casos que se le requiera.','2022-10-17','Lcda. María Dolores Corona López','Secretaria Técnica de la Comisión de Controversias Laborales y Administrativas','Lcda. María Dolores Corona López','Verónica González Pérez','EL PLENO EN REUNIÓN PRIVADA DEL 1° DE FEBRERO DE 2012','0',NULL,NULL),
	(24,'01','Administración de los Recursos Humanos, Materiales y Financieros','normal',1,'Coordinar la administración de los recursos humanos, materiales y financieros del Tribunal aplicando políticas, normas y procedimientos emitidos; vigilando el manejo del patrimonio y el eficiente uso de los bienes muebles e inmuebles para garantizar el ejercicio adecuado del presupuesto institucional.','Este proyecto es fundamental ya que se requiere efectuar la coordinación de las actividades de la Secretaría Administrativa que es el área que lleva a cabo la administración de los diversos recursos del Órgano Jurisdiccional, por lo que con el proyecto se abocará al manejo del presupuesto, de los bienes y servicios y de los recursos humanos del Tribunal.\n\n','Entre las tareas que se ejecutarán, se encuentra coordinar los procesos de planeación, organización, dirección, control y supervisión de los recursos asignados al Tribunal para el desempeño de sus funciones y mantener informado al Pleno. Asimismo, supervisar que las Unidades Responsables del Gasto se apeguen a las normas vigentes en el ejercicio del presupuesto para el cumplimiento de sus metas, utilizando de forma eficiente y eficaz los recursos asignados.','2022-10-17','Lcdo. Héctor Ángeles Hernández','Secretario Administrativo','Lcdo. Héctor Ángeles Hernández','Lcda. Claudia Angélica Prado Miranda','EL PLENO EN REUNIÓN PRIVADA DEL 1° DE FEBRERO DE 2012','0',NULL,NULL),
	(25,'03','Cumplimiento a las obligaciones  del TECDMX en materia de solicitudes de información pública, presentación de informes internos o externos y actualización normativa. ','normal',1,'Dar seguimiento a las labores de transparencia y acceso a la información pública, toda vez que estas tareas constituyen un ámbito genérico de difusión de las actividades de este Tribunal, a fin de ponerlas al alcance de la ciudadanía para brindar mayor confianza y credibilidad de la institución.','De conformidad con el artículo 24 fracción II de la Ley  de Transparencia, Acceso a la Información Pública y Rendición de cuentas de la Ciudad de México, el proyecto se orienta a atender y dar seguimiento a las solicitudes que se reciban en la Coordinación de Transparencia y Datos Personales, a través de la Unidad de Transparencia (UT).\nSu principal objetivo es dar respuesta a los requerimientos de información de la ciudadanía mediante procedimientos sencillos, expeditos y gratuitos. ','El proyecto permitirá dar cumplimiento a la Ley de Transparencia, Acceso a la Información Pública y Rendición de Cuentas de la Ciudad de México, mediante la atención de los requerimientos de la ciudadanía en tiempo y forma y bajo el principio de máxima publicidad de los actos.','2022-10-17','Mtro. Ricardo Vázquez Rosas','Subdirector de Transparencia y Acceso a la Información Pública','Mtra. Haydeé María Cruz González.','Lcda. Karla Olivia Flores Cortés','Mtra. Haydeé María Cruz González','0',NULL,NULL),
	(26,'02','Protección de Datos Personales; atención y seguimiento de solicitudes de acceso, rectificación, cancelación y oposición (ARCO) de Datos Personales, e identificación, registro y control de los sistemas de Datos Personales del Tribunal.','normal',1,'Proteger los datos personales que obran en los archivos institucionales, derivado del ejercicio de atribuciones y las actividades de este Tribunal, así como brindar capacitación en la materia para las personas servidoras públicas del mismo.','La protección de los datos personales implica atender oportunamente las solicitudes de Acceso, Rectificación, Cancelación y Oposición de datos personales que se reciben en la Unidad de Transparencia. Del mismo modo, los datos personales que posee este órgano jurisdiccional deben registrarse en los sistemas que correspondan con la finalidad de implementar las medidas de seguridad necesarias para su custodia y tratamiento. Lo anterior, en términos de lo dispuesto en el artículo 23 de la Ley de Protección de Datos Personales en Posesión de Sujetos Obligados de la Ciudad de México , así como la norma interna aplicable del Tribunal.','Garantizar la protección de los datos personales que obran en los archivos institucionales, derivado del ejercicio de atribuciones y las actividades que realiza este Tribunal, el ejercicio de los derechos ARCO, así como la atención a recursos de revisión que resulten de esas solicitudes, y  promover  capacitaciones en la materia dirigida a las personas servidoras públicas del mismo.','2022-09-17','Mtro. Ricardo Vázquez Rosas','Subdirector de Transparencia y Acceso a la Información Pública','Mtra. Haydeé María Cruz González','Mtra. Haydeé María Cruz González','Mtra. Haydeé María Cruz González','0',NULL,NULL),
	(27,'01','Continuidad y mantenimiento de servicios informáticos','normal',1,'La Unidad de Servicios Informáticos, es el área que dirige la actividad informática del Tribunal Electoral de la Ciudad de México que, bajo la jerarquía del Pleno y su Presidente/a, tiene a su cargo el manejo eficaz y eficiente de los servicios y asuntos relacionados con la informática del órgano autónomo. Uno de los principales objetivos es apoyar al desarrollo informático dentro del Tribunal, mediante una contribución profesional y de alto nivel que garantice la continuidad de los servicios electrónicos existentes; así como organizar y fortalecer el rumbo informático para producir e implementar las herramientas relevantes y útiles que los usuarios de los órganos y áreas requieren para el desempeño de las funciones que tienen asignadas. Para responder al objetivo previamente indicado, la Unidad de Servicios Informáticos, apoya y desarrolla varias líneas básicas de actividades: desarrollo de sistemas, asesoría y capacitación especializada, administración de servicios (correo electrónico, Internet/Intranet, Telefonía y Red de Datos) y difusión de información relevante a través de Internet e Intranet, así como fortalecer la infraestructura informática e implementar los nuevos proyectos que surjan en  los órganos y áreas del Tribunal.Es decir, implementar las bases tecnológicas, para la estandarización de la infraestructura de cómputo, que permitan dirigir el rumbo informático a corto, mediano y largo plazo del Tribunal, haciendo uso de las mejores prácticas de tecnologías de la información y comunicaciones, aplicadas al ámbito jurídico-electoral y administrativo.','Mantener en un alto nivel de disponibilidad los servicios informáticos, apegado a normas internacionales, para que contribuyan al cumplimiento de la misión y visión establecidos en el marco normativo.','Mantener la operación optima de los servicios Informáticos, así como proveer los recursos tecnológicos necesarios para el desempeño de las funciones de las personas usuarias, mejorar el conocimiento acerca de las herramientas informáticas y promover el uso apropiado de los servicios y recursos de TI, tales como:  Servicio de Internet, Servicio de telefonía institucional, servicio de red de datos local, servicio de impresión, servicio de unidades de red compartidas, servicio de correo electrónico y herramientas ofimáticas.','2022-10-17','Lcda. Mónica Uribe Pineda','Subdirectora de Servicios Informáticos','Lcdo. Alan Edgar Emmanuel Gutiérrez Monroy','Lcda. Mónica Uribe Pineda','','0',NULL,NULL),
	(28,'01','Identificación, sistematización y mejora de procesos jurídicos, administrativos y de apoyo.','normal',1,'La Unidad de Servicios Informáticos, es el área que dirige la actividad informática del Tribunal Electoral de la Ciudad de México que, bajo la jerarquía del Pleno y su Presidente/a, tiene a su cargo el manejo eficaz y eficiente de los servicios y asuntos relacionados con la informática del órgano jurisdiccional.Uno de los principales objetivos es apoyar al desarrollo informático dentro del Tribunal, mediante una contribución profesional y de alto nivel que garantice la continuidad de los servicios electrónicos existentes; así como organizar y fortalecer el rumbo informático para producir e implementar las herramientas relevantes y útiles que los usuarios de los órganos y áreas requieren para el desempeño de las funciones que tienen asignadas. Para responder al objetivo previamente indicado, la Unidad de Servicios Informáticos, apoya y desarrolla varias líneas básicas de actividades: desarrollo de sistemas, asesoría y capacitación especializada, administración de servicios (correo electrónico, Internet/Intranet, Telefonía y Red de Datos) y difusión de información relevante a través de Internet e Intranet, así como fortalecer la infraestructura informática e implementar los nuevos proyectos que surjan en  los órganos y áreas del Tribunal.Es decir, implementar las bases tecnológicas, para la estandarización de la infraestructura de cómputo, que permitan dirigir el rumbo informático a corto, mediano y largo plazo del Tribunal, haciendo uso de las mejores prácticas de tecnologías de la información y comunicaciones, aplicadas al ámbito jurídico-electoral y administrativo.','Desarrollar, mantener y actualizar los diferentes sistemas de información  y/o módulos correspondientes a la operación de las actividades sustantivas de las áreas del Tribunal.','Verificar y garantizar que los programas informáticos, operen de manera correcta y óptima, actualizando las funciones de los módulos de acuerdo con los requerimientos que, en su caso, soliciten las áreas o puntos de mejora que eficienten su funcionamiento.','2022-10-17','Lcda. Mónica Uribe Pineda','Subdirectora de Servicios Informáticos','Lcdo. Alan Edgar Emmanuel Gutiérrez Monroy','Lcda. Mónica Uribe Pineda','','0',NULL,NULL),
	(29,'03','Acompañamiento en el cumplimiento de las obligaciones del TECDMX y de las personas servidoras públicas que en él laboran','normal',1,'Fiscalizar el manejo, custodia y aplicación de los recursos del Tribunal Electoral, así como instruir los procedimientos y, en su caso, aplicar las sanciones establecidas en la Ley de Responsabilidades Administrativas de la Ciudad de México, conforme al artículo 202, fracciones VI, VIII, XIII, XIV y XVII del Código de Instituciones y Procedimientos Electorales de la Ciudad de México.','Ante la necesidad de administrar los riesgos del Tribunal Electoral, la Contraloría realiza diversas actividades de carácter preventivo para coadyuvar al mejor uso de los recursos públicos que emplea el Tribunal. ','Acompañar a las áreas que conforman el TECDMX, así como a las personas servidoras públicas que en él laboran, en el cumplimiento de sus obligaciones.','2022-10-17','Lcdo. José de Jesús Ruíz Gallegos','Jefe de Departamento de Responsabilidades','Mtra. Agar Leslie Serrano Álvarez, Encargada de Despacho de la Contraloría Interna','Lcdo. Marco Antonio Guerra Castillo','EL PLENO EN REUNIÓN PRIVADA DEL 1° FEBRERO DE 2012','0',NULL,NULL),
	(30,'01','Capacitación Formativa','normal',1,'El Instituto de Formación y Capacitación tienen a su cargo la planeación, organización y ejecución de todo tipo de actividades académicas y de investigación sobre derecho electoral, sobre su rama procesal, disciplinas afines y cualquier otra que resulte necesaria para el buen funcionamiento del Tribunal.','Las actividades del Instituto de Formación y Capacitación tienen por objeto desarrollar la formación profesional del personal del Tribunal, así como contribuir a la creación y desarrollo de la cultura de la democracia y legalidad para la ciudadanía. En este contexto, las metas planteadas en el POA 2023, responden a la detección de necesidades identificadas a partir de un proceso estructurado con metas bien definidas para alcanzar el objetivo, misión y visión que dan sustento al actuar institucional, así como al desarrollo integral y mejoramiento de la calidad de vida de quienes con su trabajo cotidiano contribuyen al quehacer de este Órgano Jurisdiccional.\n','El Programa Operativo Anual 2023, esta sustentado en la metodología aplicada, conforme a lo establecido en los lineamientos en materia de capacitación, denominada DNC-01 y DNC-02; asimismo prevé las acciones correspondientes a la formación en ciudadanía y cultura democrática. Este programa considera actividades de capacitación y eventos dirigidos a las personas servidoras públicas que colaboran en este Órgano Colegido en materia de Derecho Electoral, disciplinas afines y cualquier otra que resulte necesaria para alcanzar la meta institucional; así como a la ciudadanía en educación cívica.','2022-10-17','Lcda. Anabell Arellano Mendoza','Directora del Instituto de Formación y Capacitación','Lcda. Anabell Arellano Mendoza','Lcda. Anabell Arellano Mendoza','EL PLENO EN REUNIÓN PRIVADA DEL 1° FEBRERO DE 2012','0',NULL,NULL),
	(31,'01','Infraestructura tecnológica de vanguardia en ambiente de alta disponibilidad y seguridad','normal',1,'La Unidad de Servicios Informáticos, es el área que dirige la actividad informática del Tribunal Electoral de la Ciudad de México que, bajo la jerarquía del Pleno y su Presidente/a, tiene a su cargo el manejo eficaz y eficiente de los servicios y asuntos relacionados con la informática de la institución.Uno de los principales objetivos es apoyar al desarrollo informático dentro del Tribunal, mediante una contribución profesional y de alto nivel que garantice la continuidad de los servicios electrónicos existentes; así como organizar y fortalecer el rumbo informático para producir e implementar las herramientas relevantes y útiles que los usuarios de los órganos y áreas requieren para el desempeño de las funciones que tienen asignadas. Para responder al objetivo previamente indicado, la Unidad de Servicios Informáticos, apoya y desarrolla varias líneas básicas de actividades: desarrollo de sistemas, asesoría y capacitación especializada, administración de servicios (correo electrónico, Internet/Intranet, Telefonía y Red de Datos) y difusión de información relevante a través de Internet e Intranet, así como fortalecer la infraestructura informática e implementar los nuevos proyectos que surjan en  los órganos y áreas del Tribunal.Es decir, implementar las bases tecnológicas, para la estandarización de la infraestructura de cómputo, que permitan dirigir el rumbo informático a corto, mediano y largo plazo del Tribunal, haciendo uso de las mejores prácticas de tecnologías de la información y comunicaciones, aplicadas al ámbito jurídico-electoral y administrativo.','Fortalecer y mantener el uso eficiente de la infraestructura tecnológica que se utiliza para proporcionar los servicios informáticos al personal del Tribunal, con la finalidad de elevar su calidad, nivel de disponibilidad y seguridad, minimizando la ocurrencia de incidentes que puedan generar riesgos para la operación de las funciones de este Tribunal.','Aplicar un plan de mantenimiento preventivo y correctivo que evite o minimice las posibles fallas a los diversos elementos que conforman la infraestructura tecnológica del Tribunal, como son; Centro de Datos, Infraestructura de comunicaciones de la red local y de Internet, Infraestructura de equipo de cómputo, infraestructura de respaldo de información e infraestructura de virtualización. Mantener un monitoreo proactivo de la infraestructura que permita garantizar el buen funcionamiento de los componentes.\n','2022-10-17','Lcda. Mónica Uribe Pineda','Subdirectora de Servicios Informáticos','Lcdo. Alan Edgar Emmanuel Gutiérrez Monroy','Lcda. Mónica Uribe Pineda','','0',NULL,NULL),
	(32,'01','Atención de asuntos normativos y apoyo jurídico.','normal',1,'Apoyar a la o el Presidente en la representación legal del Tribunal ante las autoridades administrativas y judiciales, ya sean locales o federales, así como atender los asuntos de este órgano colegiado en materia contenciosa, consultiva, contractual y normativa.','Elaborar, revisar y proponer la actualización del marco normativo interno del Tribunal que regula su estructura, organización y funcionamiento, con el fin de cumplir con los objetivos institucionales (visión y misión) de este órgano jurisdiccional; así como coadyuvar con los órganos y áreas, que así lo requieran, conforme a las atribuciones de la Dirección General Jurídica.','Elaboración, análisis y/o revisión de proyectos de normativa interna del Tribunal; así como el desarrollo de tareas jurídicas como asesorías, consultas, opiniones, estudios, asistencia a reuniones y cualquier otra que marque la normativa aplicable, a petición de los órganos y áreas del órgano jurisdiccional.','2022-10-17','Lcda. Talina Castillo Solano ','Subdirectora de Contratos y Normativa','Lic. Eber Dario Comonfort Palacios','Lcda. Talina Castillo Solano ','EL PLENO EN REUNIÓN PRIVADA','0',NULL,NULL),
	(33,'03','Operación y control de pago de nóminas, prestaciones y enteros institucionales','normal',1,'Coordinar la administración de los recursos humanos, materiales y financieros del Tribunal aplicando políticas, normas y procedimientos emitidos; vigilando el manejo del patrimonio y el eficiente uso de los bienes muebles e inmuebles para garantizar el ejercicio adecuado del presupuesto institucional.','Una de las responsabilidades de mayor trascendencia en materia de Recursos Humanos dentro de este Tribunal es la integración, cálculo y pago de nóminas, ya sean ordinarias o extraordinarias. Adicionalmente, es importante señalar que aunado al pago de los emolumentos a las personas servidoras públicas, el cálculo y trámite para pago de nóminas, implica el cálculo de las aportaciones de seguridad social, impuestos y las prestaciones a que se tiene derecho conforme a la normatividad aplicable. Finalmente, es necesaria la formalización de las actividades realizadas por el área las cuales deben plasmarse a través de diferentes procedimientos y mecanismos de control.','El ejercicio de las actividades bajo la responsabilidad de la Dirección de Recursos Humanos contribuye a que la Secretaría Administrativa cumpla con las atribuciones que le confieren el Código de Instituciones y Procedimientos Electorales de la Ciudad de México y el Reglamento Interior del Tribunal Electoral de la Ciudad de México, en materia de remuneraciones y prestaciones al personal del Tribunal y el cálculo de obligaciones de seguridad social e impuestos. Asimismo, con el objeto de regular la operación del área de Recursos Humanos, ésta se dará a la tarea de elaborar y actualizar sus procedimientos.','2022-10-17','Lcdo. Miguel Angel Santos Morales','Director de Recursos Humanos','Lcdo. Héctor Ángeles Hernández','Lcdo. Miguel Angel Santos Morales','','abierto',NULL,NULL),
	(34,'03','Convenios interinstitucionales.','normal',1,'Apoyar a la o el Presidente en la representación legal del Tribunal ante las autoridades administrativas y judiciales, ya sean locales o federales, así como atender los asuntos de este órgano colegiado en materia contenciosa, consultiva, contractual y normativa.','El proyecto se requiere para supervisar la elaboración y/o verificación del contenido jurídico de los convenios interinstitucionales en los que el Tribunal sea parte.','Elaborar, revisar, validar y brindar asesoría para la celebración de los convenios de apoyo y colaboración interinstitucional que soliciten los órganos y áreas del Tribunal en ejercicio de sus atribuciones.','2022-10-17','Lcda. Talina Castillo Solano ','Subdirectora de Contratos y Normativa','Lic. Eber Dario Comonfort Palacios','Lcda. Talina Castillo Solano ','EL PLENO EN REUNIÓN PRIVADA ','abierto',NULL,NULL),
	(35,'01','Gestión de sesiones del Comité de Transparencia y actualización de Obligaciones de Transparencia en SIPOT y Portal de Transparencia','normal',1,'Gestionar la celebración de sesiones del Comité de Transparencia, así como coordinar y verificar la actualización de las obligaciones de Transparencia en el sitio de internet del Tribunal (Portal de Transparencia) y en la Plataforma Nacional de Transparencia.','La Ley de Transparencia, Acceso a la Información Pública y Rendición de Cuentas de la Ciudad de México, establece en el artículo 88, la obligación de contar con un Comité de Transparencia que confirme, modifique y/o revoque la información que se le proponga reservar, clasificar y/o declarar inexistente; de igual manera, el artículo 121 de la citada Ley, obliga a este Tribunal en cuanto Sujeto Obligado, a publicar en el Portal de Transparencia y en la Plataforma Nacional de Transparencia la información que genere este Tribunal, derivada de sus atribuciones, conforme a los formatos y temporalidad establecidos.','Actualizar permanentemente en el Portal de Transparencia del Tribunal y en la Plataforma Nacional de Transparencia, las obligaciones generadas por las unidades administrativas y áreas de éste órgano jurisdiccional, con la finalidad de cumplir con el calendario de actualización de la información de carácter público en los periodos establecidos por la Ley de la materia. ','2022-09-17','Mtro. Ricardo Vázquez Rosas','Subdirector de Transparencia y Acceso a la Información Pública','Mtra. Haydeé María Cruz González','Mtro. Ricardo Vázquez Rosas','Mtra. Haydeé María Cruz González','abierto',NULL,NULL),
	(36,'02','Seguimiento y Control del Programa Anual de Desarrollo Archivístico del Tribunal Electoral de la Ciudad de México','normal',1,'Coordinar la integración y la administración de los archivos que conforman el acervo documental del Tribunal Electoral de la Ciudad de México, así como, establecer las bases para el funcionamiento y composición del Sistema Institucional de Archivos conforme a la Ley y a las directrices que emita la autoridad de la materia.','Con el objetivo de salvaguardar la información documental, garantizar el derecho a la verdad, el acceso a la información pública y la protección de los datos personales que obra en poder del Tribunal Electoral de la Ciudad de México, es necesario establecer mecanismos archivísticos para la adecuada conservación y organización de la información de conformidad con las disposiciones normativas vigentes.','Dentro de las obligaciones establecidas en la Constitución Política de la Ciudad de México, la Ley General de Archivos y Ley de Archivos de la Ciudad de México (LACDMX), se encuentra la de contar con mecanismos archivísticos expeditos que permitan la correcta organización y conservación de la información documental para preservar el acervo y proporcionar un eficiente acceso a la información pública en poder del Tribunal. Esto en el marco del Programa Anual de Desarrollo Archivístico 2023, obligación que de conformidad con los artículos 12, 28, 29 y 30 de la LACDMX, contempla realizar diversos proyectos y acciones en materia de normatividad, tecnologías de la información, capacitación, difusión y divulgación archivística, conservación y prevención documental. En estas acciones están involucradas todas las unidades administrativas del Tribunal.','2022-10-17','Lcdo. Vicente Bonilla Hernandez','Subdirector de Archivos y Documentación','Lcda. Sabina Reyna Fregoso Reyes ','Lcdo. Vicente Bonilla Hernandez','EL PLENO EN REUNIÓN PRIVADA DEL 1° FEBRERO DE 2012','0',NULL,NULL),
	(37,'02','Elaboración de Obras  colectivas','normal',1,'Contribuir al desarrollo de la cultura democrática en la Ciudad de México','De conformidad con el artículo 214 del Código de Instituciones y Procedimientos Electorales de la Ciudad de México, la Coordinación de Difusión y Publicación tiene entre sus atribuciones programar y coordinar la edición de publicaciones que recibe el Tribunal.  ','Publicar trabajos que contribuyan al desarrollo de la cultura democrática en la Ciudad de México; divulgar temas relativos al quehacer institucional y que aporten a la comprensión de los dilemas, retos y oportunidades de los derechos político-electorales de la ciudadanía.','2022-10-17','Miguel Ángel Quiroz Velázquez','Coordinador de Difusión y Publicación','Miguel Ángel Quiroz Velázquez','Miguel Ángel Quiroz Velázquez','EL PLENO EN REUNIÓN PRIVADA DEL 1° FEBRERO DE 2012','0',NULL,NULL),
	(38,'02','Servicios de Préstamo de material bibliográfico','normal',1,'Contribuir a la creación y difusión de la cultura de la democracia y legalidad para los habitantes de la Ciudad de México.','Es de primordial importancia proveer al personal del Tribunal, de información doctrinal actualizada, que se desprende del acervo bibliohemerográfico de la Biblioteca. Dada la demanda del servicio de consulta y préstamo bibliotecario por parte de las/os usuarias/os del Tribunal y de la población en general, es necesario automatizar el servicio para elevar su calidad; coadyuvar en paralelo a un mejor control del acervo biblio-hemerográfico con el que cuenta el Órgano Jurisdiccional; y, facilitar la consulta y búsqueda de material a las personas usuarias/os, a través del manejo de unidades remotas.','Brindar el servicio de consulta de material bibliográfico a todas las personas servidoras públicas del Tribunal y público en general. Del mismo modo, facilitar la ubicación de títulos tanto en el acervo propio como en el de aquellas bibliotecas con las que se tenga convenio interbibliotecario.\n\nTambién se efectuarán actividades para conformar, organizar, administrar y resguardar el acervo bibliográfico de la Biblioteca, a fin de satisfacer las necesidades de información y brindar un servicio de calidad al personal de este órgano autónomo y población en general. En particular, se continuará con la organización automatizada del acervo bibliográfico de la Biblioteca para un mejor control.','2022-10-17','Miguel Ángel Quiroz Velázquez','Coordinador de Difusión y Publicación','Miguel Ángel Quiroz Velázquez','Miguel Ángel Quiroz Velázquez','EL PLENO EN REUNIÓN PRIVADA DEL 1° DE FEBRERO DE 2012','0',NULL,NULL),
	(39,'04','Cultura Democrática Derechos Humanos y Género','normal',1,'La Coordinación de Derechos Humanos y Género tiene por objetivo impulsar, promover, desarrollar y realizar un modelo institucional transversal en materia de derechos humanos, igualdad sustantiva y laboral, paridad, perspectiva de género, atención a la violencia política contra las mujeres en razón de género y protección a la población de atención prioritaria, para contribuir en la optimización de las funciones jurisdiccional y administrativa del Tribunal.','La promoción de acciones encaminadas a la formación e implementación de normas, políticas y buenas prácticas, en materia de derechos humanos, igualdad sustantiva y laboral, paridad, perspectiva de género, atención a la violencia política contra las mujeres en razón de género y protección a la población de atención prioritaria, permitirá el cumplimiento de las obligaciones legales del Tribunal en la materia, la adquisición de conocimientos, habilidades y actitudes que optimicen su función jurisdiccional y administrativa, lo cual, impulsará la superación de las personas servidoras públicas del TECDMX y fortalecerá la construcción de ciudadanía de las personas de la Ciudad de México.','Proponer, implementar y dar seguimiento a las estrategias, mecanismos normativos e institucionales y buenas prácticas adoptadas por la Presidencia, el Pleno y el Comité de Género y Derechos Humanos (CGyDH), de conformidad con las normas aplicables, mediante acuerdos y directrices, en materia de derechos humanos, igualdad sustantiva y laboral, paridad, perspectiva de género, atención a la violencia política contra las mujeres en razón de género y protección a la población de atención prioritaria, asi como apoyar en la construcción de redes de colaboración y sinergias interinstitucionales.','2022-10-17','Lcdo. Juan Antonio Mejía Ortiz','Subdirector de Género y Derechos Humanos','Lcda. Iris González Vázquez','Lcdo. Juan Antonio Mejía Ortiz','EL PLENO EN REUNIÓN PRIVADA DEL 28 DE MARZO DE 2017','0',NULL,NULL),
	(40,'02','Posicionamiento de la imagen institucional y Cultura Democrática en la Ciudad de México. ','normal',1,'Propiciar el fortalecimiento y la consolidación de la imagen institucional del Tribunal Electoral de la Ciudad de México ante la ciudadanía en general, mediante la comunicación de información relevante sobre sus acciones y logros alcanzados. Diseñar, establecer y fortalecer  una relación permanente, transparente y respetuosa con los medios de comunicación, a fin de difundir una imagen positiva de la institución y resaltar la importancia de la labor que ésta desempeña en la construcción y consolidación del sistema democrático de la Ciudad de México.','Se requiere la ejecución del proyecto para cumplir con lo contenido en el artículo 71 del Reglamento Interior del Tribunal Electoral de la Ciudad de México, por medio del posicionamiento de la imagen y el quehacer del Tribunal en la agenda democrática de la Ciudad.','La ejecución del proyecto busca posicionar la imagen y quehacer del Tribunal por medio de las relaciones públicas y a través de las distintas rutas informativas: reuniones con medios de comunicación, gestión de entrevistas a las Magistradas, los Magistrados y las personas servidoras públicas del órgano jurisdiccional, así como la difusión de campañas en diferentes medios.\nCabe señalar que la intervención de las diferentes áreas que integran a este órgano jurisdiccional es sustantiva, ya  que proporciona el insumo informativo para su adecuada y oportuna promoción.','2022-10-17','Lic. Jorge Alberto Aranda Vargas','Subdirector de Comunicación Social','Lic. Orlando Anaya González','Lic. Orlando Anaya González','EL PLENO EN REUNIÓN PRIVADA DEL 28 DE MARZO DE 2017 ','0',NULL,NULL),
	(41,'01','Comunicación e Información institucional.','normal',1,'Contribuir con el propósito de fortalecer y consolidar la imagen y  presencia del Tribunal ante medios de comunicación y la ciudadanía; mediante el desarrollo, cumplimiento y evaluación de las estrategias de comunicación social y relaciones públicas que se diseñen con tales propósitos. Así mismo, fortalecer las relaciones con los diferentes organismos representativos de los sectores público y privado vinculados con el quehacer institucional del Tribunal Electoral de la Ciudad de México. Diseñar, establecer y fortalecer una relación permanente, transparente y respetuosa con los medios de comunicación a fin de transmitir una imagen positiva de la institución y resaltar la importancia de la labor que ésta desempeña en la construcción y consolidación del sistema democrático de la Ciudad de México.','El proyecto se requiere para fortalecer la imagen institucional mediante la comunicación de información relevante sobre sus acciones y logros alcanzados dirigidos a los habitantes de la Ciudad de México que permitan dar a conocer las actividades que realiza el Tribunal.','Adicionalmente, el proyecto considera definir las estrategias de información que logren una comunicación adecuada de la imagen y el quehacer del Tribunal para los diferentes medios de comunicación y público objetivo; generar líneas discursivas y contenidos enfocados a los medios de comunicación masivos tanto impresos, electrónicos y digitales; así como coordinar la producción de los materiales comunicacionales derivados de dichos contenidos; generar y/o coordinar la producción de materiales fotográficos, audiovisuales y de redes sociales y medios autogenerados; prestar servicios de logística y cobertura de eventos en el ámbito periodístico para la generación de contenidos en texto, audio o video, que documenten la vida institucional al exterior.\n\nNota: La programación de las metas de estas actividades están sujetas a la demanda de las diversas áreas incluida la propia Coordinación, así como a la suficiencia presupuestal correspondiente.','2022-10-17','Lic. Jorge Alberto Aranda Vargas','Subdirector de Comunicación Social','Lic. Orlando Anaya González','Lic. Orlando Anaya González','EL PLENO EN REUNIÓN PRIVADA DEL 28 DE MARZO DE 2017 ','0',NULL,NULL),
	(42,'03','Fortalecimiento de la Imagen Institucional en la Ciudad de México.','normal',1,'Propiciar el fortalecimiento y la consolidación de la imagen institucional de este Tribunal Electoral ante la ciudadanía en general, mediante la difusión de información relevante sobre sus acciones y logros alcanzados. A nivel interno, promover las acciones de comunicación organizacional que propicien la integración y el conocimiento pleno de los propósitos y estrategias de la Institución con los órganos y áreas que lo conforman.','El proyecto se requiere para fortalecer la imagen institucional a través del diseño, diagramación y elaboración de materiales impresos y/o digitales dirigidos a los habitantes de la Ciudad de México y/o a las personas servidoras públicas del TECDMX,  que permitan dar a conocer las actividades que realiza el Tribunal.','A través del proyecto se programarán y supervisarán actividades encaminadas al fortalecimiento y posicionamiento de la Imagen Institucional, ante la sociedad en general, las instituciones y el personal del Tribunal, por medio del diseño, elaboración y distribución de diversos materiales.\nLa ejecución del proyecto busca posicionar la imagen y quehacer del Tribunal Electoral de la Ciudad de México también a través de la contratación y de supervisar la  producción de spots para su transmisión en tiempos oficiales de radio y televisión.\nAdicionalmente, el proyecto considera la actualización de los sitios institucionales. \nCabe señalar que la intervención de las diferentes áreas que integran este órgano jurisdiccional es sustantiva, ya que proporciona el insumo informativo para su adecuada y oportuna difusión.\n\nNota: La programación de las metas de estas actividades están sujetas a la demanda de las diversas áreas incluida la propia Coordinación, así como a la suficiencia presupuestal correspondiente.','2022-10-17','Miguel Ángel Quiroz Velázquez','Coordinador de Difusión y Publicación','Miguel Ángel Quiroz Velázquez','Miguel Ángel Quiroz Velázquez','EL PLENO EN REUNIÓN PRIVADA DEL 28 DE MARZO DE 2017 ','0',NULL,NULL),
	(43,'02','Seguridad de la información','',1,'La Unidad de Servicios Informáticos, es el área que dirige la actividad informática del Tribunal Electoral de la Ciudad de México que, bajo la jerarquía del Pleno y su Presidente/a, tiene a su cargo el manejo eficaz y eficiente de los servicios y asuntos relacionados con la informática de la institución.Uno de los principales objetivos es apoyar al desarrollo informático dentro del Tribunal, mediante una contribución profesional y de alto nivel que garantice la continuidad de los servicios electrónicos existentes; así como organizar y fortalecer el rumbo informático para producir e implementar las herramientas relevantes y útiles que los usuarios de los órganos y áreas requieren para el desempeño de las funciones que tienen asignadas. Para responder al objetivo previamente indicado, la Unidad de Servicios Informáticos, apoya y desarrolla varias líneas básicas de actividades: desarrollo de sistemas, asesoría y capacitación especializada, administración de servicios (correo electrónico, Internet/Intranet, Telefonía y Red de Datos) y difusión de información relevante a través de Internet e Intranet, así como fortalecer la infraestructura informática e implementar los nuevos proyectos que surjan en los órganos y áreas del Tribunal.Es decir, implementar las bases tecnológicas, para la estandarización de la infraestructura de cómputo, que permitan dirigir el rumbo informático a corto, mediano y largo plazo del Tribunal, haciendo uso de las mejores prácticas de tecnologías de la información y comunicaciones, aplicadas al ámbito jurídico-electoral y administrativo.','Desarrollar e implementar un esquema de seguridad en los servicios informáticos del Tribunal ,alineado a estándares internacionales con la finalidad de resguardar y proteger la información buscando mantener la confidencialidad, la disponibilidad e integridad de los  datos.','Desarrollar e implementar un esquema de seguridad para la protección y continuidad de los servicios informáticos, aplicaciones, sistemas institucionales e información, alineados a estándares internacionales mediante el establecimiento de las medidas tecnológicas de seguridad.','2022-10-17','Lcda. Mónica Uribe Pineda','Subdirectora de Servicios Informáticos','Lcdo. Alan Edgar Emmanuel Gutiérrez Monroy','Lcda. Mónica Uribe Pineda','','abierto',NULL,NULL),
	(44,'03','Proporcionar a la ciudadanía de manera gratuita servicios de asesoría y defensa en los procesos de participación ciudadana y democráticos, en los mecanismos de democracia directa, así como en los instrumentos de democracia participativa.\nGarantizar los derechos político-electorales de la ciudadanía que habita la Ciudad de México, sin menoscabo de su sexo, afiliación partidista, condición social, discapacidad, origen étnico, religión, opiniones o preferencias sexuales.','normal',1,'Brindar acceso a las personas habitantes, ciudadanía, organizaciones y órganos de representación ciudadana electos en las colonias, barrios y pueblos originarios, así como de las comunidades indígenas residentes de la Ciudad de México, una correcta promoción, protección, respeto y garantía de sus derechos político - electorales.','Dar cumplimiento a lo establecido en el artículo 192 del Código de Instituciones y Procedimientos Electorales de la Ciudad de México y a los artículos 55 al 57 del Reglamento Interior del Tribunal Electoral de la Ciudad de México.','La Defensoría como parte de éste órgano jurisdiccional coadyuvará en la promoción, protección, respeto y garantía de los derechos político-electorales de la ciudadanía que habita la Ciudad de México, sin menoscabo de su sexo, afiliación partidista, condición social, discapacidad, origen étnico, religión, opiniones o preferencias sexuales, en todos los procesos de participación ciudadana y democráticos, en los mecanismos de democracia directa y en los instrumentos de democracia participativa.','2022-10-17','Mtra. Sandra Araceli Vivanco Morales','Titular de la Defensoría Pública de Participación Ciudadana y Procesos Democráticos','Mtra. Sandra Araceli Vivanco Morales','Titular de la Defensoría Pública de Participación Ciudadana y Procesos Democráticos','Mtra. Sandra Araceli Vivanco Morales','abierto',NULL,NULL),
	(45,'02','Vinculación y Convenios con Organismos Nacionales e Internacionales ','normal',1,'Establecer mecanismos y procedimientos para la vinculación con organismos electorales nacionales e internaciones, y/o instituciones u organizaciones interesadas en la materia electoral, o especializadas  en diversas materias  que sean  de interés institucional, que  permitan captar propuestas y experiencias que fortalezcan el ámbito electoral local.','Interactuar con organismos electorales nacionales e internacionales, a fin de intercambiar experiencias y propuestas que permitan fortalecer el ámbito electoral local, asi como para dar cumplimiento a lo establecido en los artículos 217 del Código de Instituciones y Procedimientos Electorales y al 72 del Reglamento Interior del Tribunal Electoral de la Ciudad de México.','Establecer mecanismos y procedimientos para que las experiencias y propuestas recibidas de otros organismos electorales del país o internacionales, se promuevan entre las diversas áreas y los colaboradores de este Tribunal para su fortalecimiento y mejor desempeño en  sus funciones.','2022-10-17','Lcda. Daniela Paola García Luises','Titular de la Coordinación de Vinculación y Relaciones Internacionales','Lcda. Daniela Paola García Luises','Lcda. Daniela Paola García Luises','Lcda. Daniela Paola García Luises ','abierto',NULL,NULL),
	(46,'04','Estudio y análisis de los procedimientos sancionadores remitidos por el Instituto Electoral de la Ciudad de México.','normal',1,'Realizar el estudio y análisis de los procedimientos sancionadores que sean remitidos por el Instituto Electoral de la Ciudad de México, así como instruir y resolver los medios de impugnación que se promuevan en contra de las resoluciones emitidas por el Instituto en comento en los procedimientos ordinarios que se instauren por las faltas cometidas dentro o fuera de los procesos electorales.','Estudiar y analizar los procedimientos sancionadores que sean remitidos por el Instituto Electoral de la Ciudad de México para la elaboración de los proyectos de resolución de los procedimientos especiales y ordinarios sancionadores que remita dicho Instituto, así como los medios de impugnación que se presenten en contra de estos últimos para su instrucción y propuesta al Pleno. \n\nA fin de dar cumplimiento a lo establecido en los artículos 223 a 226 del Código de Instituciones y Procedimientos Electorales de la Ciudad de México y el 79 del Reglamento Interior del Tribunal Electoral de la Ciudad de México.','Instruir y proponer al Pleno los proyectos de resolución de los procedimientos especiales y ordinarios sancionadores que remita el Instituto Electoral de la Ciudad de México, que deriven de infracciones a la normatividad electoral y de los medios de impugnación que se presenten en contra de los procedimientos ordinarios','2022-10-17','Lcda. Luisa Fernanda Monterde García','Secretaria','Mtra. Berenice García Dávila','Lcda. Luisa Fernanda Monterde García','Mtra. Berenice García Dávila','abierto',NULL,NULL),
	(47,'05','Cultura Democrática Igualdad Laboral y No Discriminación','normal',1,'La Coordinación de Derechos Humanos y Género tiene por objetivo impulsar, promover, desarrollar y realizar un modelo institucional transversal en materia de derechos humanos, igualdad sustantiva y laboral, paridad, perspectiva de género, atención a la violencia política contra las mujeres en razón de género y protección a la población de atención prioritaria, para contribuir en la optimización de las funciones jurisdiccional y administrativa del Tribunal.','El 22 de diciembre de 2017, el TECDMX alcanzó la Certificación en la Norma Mexicana NMX-R-025-SCFI-2015 de Igualdad laboral y No discriminación y, en diciembre de 2021 obtuvo la Recertificación, la cual, requiere de acciones para su permanencia.','Dar seguimiento a la normatividad, directrices y acciones institucionales en materia de Igualdad Laboral y No Discriminación para la permanencia de la Recertificación del TECDMX en la Norma Mexicana NMX-R-025-SCFI-2015, con el fin de dar seguimiento y atención a las determinaciones derivadas de los resultados del proceso de Recertificación de este Órgano Jurisdiccional realizado en 2021 y la Auditoria de Vigilancia, la cual, deberá llevarse a cabo en diciembre de 2023.','2022-10-17','Lcdo. Juan Antonio Mejia Ortiz','Subdirector de Coordinación','Lcda. Iris González Vázquez','Lcdo. Juan Antonio Mejía Ortiz','EL PLENO EN REUNIÓN PRIVADA DEL 28 DE MARZO DE 2017','abierto',NULL,NULL),
	(48,'03','Vinculación entre las áreas del Tribunal y organismos nacionales e internacionales','normal',1,'Establecer mecanismos y procedimientos para la vinculación con organismos electorales nacionales e internaciones, y/o instituciones u organizaciones interesadas en la materia electoral, o especializadas en diversas materias que sean de interés institucional, que permitan captar propuestas y experiencias que fortalezcan el ámbito electoral local.','Interactuar con organismos electorales nacionales e internacionales, a fin de intercambiar experiencias y propuestas que permitan fortalecer el ámbito electoral local, así como para dar cumplimiento a lo establecido en los artículos 217 del Código de Instituciones Procedimientos Electorales y al 72 del Reglamento Interior del Tribunal Electoral de la Ciudad de México.','Establecer mecanismos y procedimientos para que las experiencias y propuestas recibidas de otros organismos electorales del país o internacionales, se promuevan entre las diversas áreas y los colaboradores de este Tribunal para su fortalecimiento y mejor desempeño en sus funciones.','2022-10-17','Lcda. Daniela Paola García Luises','Coordinadora de Vinculacion y Relaciones Internacionales','Lcda. Daniela Paola García Luises','Lcda. Daniela Paola García Luises','Lcda. Daniela Paola García Luises','abierto',NULL,NULL),
	(49,'04','Contratos administrativos.','normal',1,'Apoyar a la o el Presidente en la representación legal del Tribunal ante las autoridades administrativas y judiciales, ya sean locales o federales, así como atender los asuntos de este órgano colegiado en materia contenciosa, consultiva, contractual y normativa.','El proyecto se requiere para supervisar la elaboración, revisión y validación de los contratos administrativos en los que el Tribunal es parte.','Elaborar, revisar, validar y brindar asesoría para la celebración de los contratos administrativos que solicita la Secretaría Administrativa. ','2022-10-17','Lcda. Talina Castillo Solano ','Subdirectora de Contratos y Normativa','Lic. Eber Dario Comonfort Palacios','Lcda. Talina Castillo Solano ','EL PLENO EN REUNIÓN PRIVADA ','abierto',NULL,NULL),
	(50,'01','Acciones del Pleno, administrativas y jurisdiccionales necesarias, para impartir justicia en los medios de impugnación en materia electoral y controversias laborales y administrativas; así como para el fortalecimiento institucional','normal',1,'Garantizar a la ciudadanía y asociaciones políticas la impartición de justicia en materia político electoral en el ámbito jurisdiccional, así como fijar las políticas y lineamientos administrativos que contribuyan en el fortalecimiento y consolidación institucional.','La ejecución de este proyecto tiene como finalidad la impartición de justicia electoral, laboral y administrativa mediante la resolución definitiva de impugnaciones y controversias competencia de este Tribunal.\n','Que la Ponencia reciba, sustancie y elabore proyectos de resolución y/o acuerdos plenarios de los asuntos turnados.\n','2022-10-17','Andrea De La O Flores','Secretaria Ejecutiva','Magistrado Juan Carlos Sánchez León','Andrea De La O Flores','Magistrado Juan Carlos Sánchez León','abierto',NULL,NULL),
	(51,'02','Acciones que la Ponencia realiza para la impartición de justicia electoral, laboral y administrativa.','normal',1,'Garantizar a la ciudadanía y asociaciones políticas la impartición de justicia en materia político electoral en el ámbito jurisdiccional, así como fijar las políticas y lineamientos administrativos que contribuyan en el fortalecimiento y consolidación institucional.','La ejecución de estas actividades tiene como finalidad elaborar los proyectos de resolución relativos a los medios de impugnación y controversias planteadas ante este Tribunal.\n','Que el Pleno realice las acciones jurisdiccionales y administrativas necesarias para recibir, sustanciar y resolver en definitiva las impugnaciones y controversias sometidas a su consideración\n','2022-10-17','Andrea De La O Flores','Secretaria Ejecutiva','Magistrado Juan Carlos Sánchez León','Andrea De La O Flores','Magistrado Juan Carlos Sánchez León','abierto',NULL,NULL);

/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla responsable_operativo_urg
# ------------------------------------------------------------

DROP TABLE IF EXISTS `responsable_operativo_urg`;

CREATE TABLE `responsable_operativo_urg` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `responsable_operativo_id` bigint unsigned NOT NULL,
  `unidad_responsable_gasto_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `responsable_operativo_urg_responsable_operativo_id_foreign` (`responsable_operativo_id`),
  KEY `responsable_operativo_urg_unidad_responsable_gasto_id_foreign` (`unidad_responsable_gasto_id`),
  CONSTRAINT `responsable_operativo_urg_responsable_operativo_id_foreign` FOREIGN KEY (`responsable_operativo_id`) REFERENCES `responsables_operativos` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `responsable_operativo_urg_unidad_responsable_gasto_id_foreign` FOREIGN KEY (`unidad_responsable_gasto_id`) REFERENCES `unidades_responsables_gastos` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Volcado de tabla responsable_operativo_usuario
# ------------------------------------------------------------

DROP TABLE IF EXISTS `responsable_operativo_usuario`;

CREATE TABLE `responsable_operativo_usuario` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `responsable_operativo_id` bigint unsigned NOT NULL,
  `usuario_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `responsable_operativo_usuario_responsable_operativo_id_foreign` (`responsable_operativo_id`),
  KEY `responsable_operativo_usuario_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `responsable_operativo_usuario_responsable_operativo_id_foreign` FOREIGN KEY (`responsable_operativo_id`) REFERENCES `responsables_operativos` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `responsable_operativo_usuario_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `responsable_operativo_usuario` WRITE;
/*!40000 ALTER TABLE `responsable_operativo_usuario` DISABLE KEYS */;

INSERT INTO `responsable_operativo_usuario` (`id`, `responsable_operativo_id`, `usuario_id`, `created_at`, `updated_at`)
VALUES
	(4,10,2,'2023-12-08 06:53:50','2023-12-08 06:53:50'),
	(5,11,2,'2023-12-08 06:53:50','2023-12-08 06:53:50'),
	(6,12,2,'2023-12-08 06:53:50','2023-12-08 06:53:50'),
	(7,1,1,'2023-12-08 07:00:22','2023-12-08 07:00:22'),
	(8,2,1,'2023-12-08 07:00:22','2023-12-08 07:00:22');

/*!40000 ALTER TABLE `responsable_operativo_usuario` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla responsables_operativos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `responsables_operativos`;

CREATE TABLE `responsables_operativos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `numero` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `responsables_operativos` WRITE;
/*!40000 ALTER TABLE `responsables_operativos` DISABLE KEYS */;

INSERT INTO `responsables_operativos` (`id`, `numero`, `nombre`, `created_at`, `updated_at`)
VALUES
	(1,'01','Ponencia del Magistrado Armando Ambriz Hernández',NULL,NULL),
	(2,'02','Ponencia del Magistrado Juan Carlos Sánchez León',NULL,NULL),
	(3,'03','Ponencia de la Magistrada Martha Leticia Mercado Ramírez',NULL,NULL),
	(4,'04','Ponencia del Magistratura VACANTE',NULL,NULL),
	(5,'05','Ponencia de la Magistrada Martha Alejandra Chávez Camarena',NULL,NULL),
	(6,'01','Magistrado (a) Presidente (a)',NULL,NULL),
	(7,'01','Secretario (a) General',NULL,NULL),
	(8,'02','Secretario (a) Técnico (a)',NULL,NULL),
	(9,'01','Secretario (a)  Administrativo (a)',NULL,NULL),
	(10,'02','Director (a) de Planeación y Recursos Financieros',NULL,NULL),
	(11,'03','Director (a) de Recursos Humanos',NULL,NULL),
	(12,'04','Director (a) de Recursos Materiales y Servicios Generales',NULL,NULL),
	(13,'01','Contralor (a) Interno (a)',NULL,NULL),
	(14,'02','Director (a) de Responsabilidades y Atención a Quejas',NULL,NULL),
	(15,'03','Director (a) de Auditoría, Control y Evaluación',NULL,NULL),
	(16,'01','Director (a) General Jurídico (a)',NULL,NULL),
	(17,'02','Subdirector (a) de lo Contencioso y Consultivo',NULL,NULL),
	(18,'03','Subdirector (a) de Contratos y Normatividad',NULL,NULL),
	(19,'04','Encargado (a) del Despacho de la Dirección General Jurídica',NULL,NULL),
	(20,'01','Director (a) de la Coordinación de Transparencia y Datos Personales',NULL,NULL),
	(21,'01','Director (a) del Instituto de Formación y Capacitación',NULL,NULL),
	(22,'01','Encargado de Despacho de la Secretaría Técnica de la Comisión de Controversias Laborales y Administrativas',NULL,NULL),
	(23,'01','Director (a) de la Unidad de Servicios Informáticos',NULL,NULL),
	(24,'01','Director (a) de la Unidad de Estadística y Jurisprudencia',NULL,NULL),
	(25,'01','Coordinador/a de Difusión y Publicación',NULL,NULL),
	(26,'01','Coordinador (a) de Archivo',NULL,NULL),
	(27,'01','Coordinador (a) de Derechos Humanos y Género',NULL,NULL),
	(28,'01','Defensor(a) Ciudadano(a)',NULL,NULL),
	(29,'01','Coordinador(a) de Vinculación y Relaciones Internacionales',NULL,NULL),
	(30,'01','Director(a) de la Unidad Especializada de Procedimientos Sancionadores',NULL,NULL),
	(31,'01','Coordinador (a) de Comunicación Social y Relaciones Públicas',NULL,NULL);

/*!40000 ALTER TABLE `responsables_operativos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla rol_usuario
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rol_usuario`;

CREATE TABLE `rol_usuario` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint unsigned NOT NULL,
  `rol_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rol_usuario_usuario_id_foreign` (`usuario_id`),
  KEY `rol_usuario_rol_id_foreign` (`rol_id`),
  CONSTRAINT `rol_usuario_rol_id_foreign` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rol_usuario_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rol_usuario` WRITE;
/*!40000 ALTER TABLE `rol_usuario` DISABLE KEYS */;

INSERT INTO `rol_usuario` (`id`, `usuario_id`, `rol_id`, `created_at`, `updated_at`)
VALUES
	(1,1,1,'2023-11-28 16:25:02','2023-11-28 16:25:02'),
	(2,2,2,'2023-12-04 15:51:07','2023-12-04 15:51:07'),
	(3,3,3,'2023-12-04 15:52:56','2023-12-04 15:52:56'),
	(4,4,4,'2023-12-08 07:04:41','2023-12-08 07:04:41');

/*!40000 ALTER TABLE `rol_usuario` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `descripcion`, `created_at`, `updated_at`)
VALUES
	(1,'Superadministrador',NULL,NULL),
	(2,'Administrador',NULL,NULL),
	(3,'Contador',NULL,NULL),
	(4,'Capturador',NULL,NULL),
	(5,'Validador',NULL,NULL),
	(6,'Consultor',NULL,NULL);

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla subprogramas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subprogramas`;

CREATE TABLE `subprogramas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `numero` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `subprogramas` WRITE;
/*!40000 ALTER TABLE `subprogramas` DISABLE KEYS */;

INSERT INTO `subprogramas` (`id`, `numero`, `nombre`, `created_at`, `updated_at`)
VALUES
	(1,'01','Impartición de Justicia Electoral, Laboral y Administrativa',NULL,NULL),
	(2,'02','Apoyo al Funcionamiento Técnico Jurídico del Pleno',NULL,NULL),
	(3,'03','Controversias Laborales y Administrativas',NULL,NULL),
	(4,'04','Imagen Institucional',NULL,NULL),
	(5,'05','Relación y Cooperación Institucional',NULL,NULL),
	(6,'06','Documentación y Servicios Bibliotecarios',NULL,NULL),
	(7,'07','Gestión y Modernización Administrativa',NULL,NULL),
	(8,'08','Servicios Jurídicos',NULL,NULL),
	(9,'09','Creación, Revisión y Actualización de Normatividad',NULL,NULL),
	(10,'10','Estandarización de la Infraestructura de Tecnologías de la Información y Comunicaciones',NULL,NULL),
	(11,'11','Prestación de Servicios Informáticos',NULL,NULL),
	(12,'12','Implantación de Sistemas',NULL,NULL),
	(13,'13','Transparencia y Acceso a la Información Pública',NULL,NULL),
	(14,'14','Sistema Institucional de Archivos',NULL,NULL),
	(15,'15','Auditoría',NULL,NULL),
	(16,'16','Seguimiento y Evaluación',NULL,NULL),
	(17,'17','Responsabilidades',NULL,NULL),
	(18,'18','Capacitación',NULL,NULL),
	(19,'19','Investigación',NULL,NULL);

/*!40000 ALTER TABLE `subprogramas` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla unidades_medida
# ------------------------------------------------------------

DROP TABLE IF EXISTS `unidades_medida`;

CREATE TABLE `unidades_medida` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unidades_medida_parent_id_foreign` (`parent_id`),
  CONSTRAINT `unidades_medida_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `unidades_medida` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `unidades_medida` WRITE;
/*!40000 ALTER TABLE `unidades_medida` DISABLE KEYS */;

INSERT INTO `unidades_medida` (`id`, `descripcion`, `parent_id`, `created_at`, `updated_at`)
VALUES
	(1,'Unidad de medida 1',NULL,'2023-12-01 06:14:24','2023-12-01 06:14:24'),
	(2,'Unidad de medida 1',NULL,'2023-12-01 06:16:18','2023-12-01 06:16:18'),
	(3,'Prueba desde front',NULL,'2023-12-07 22:14:41','2023-12-07 22:14:41');

/*!40000 ALTER TABLE `unidades_medida` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla unidades_responsables_gastos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `unidades_responsables_gastos`;

CREATE TABLE `unidades_responsables_gastos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `numero` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `unidades_responsables_gastos` WRITE;
/*!40000 ALTER TABLE `unidades_responsables_gastos` DISABLE KEYS */;

INSERT INTO `unidades_responsables_gastos` (`id`, `numero`, `nombre`, `created_at`, `updated_at`)
VALUES
	(1,'01','Pleno',NULL,NULL),
	(2,'02','Presidencia',NULL,NULL),
	(3,'03','Secretaría General',NULL,NULL),
	(4,'04','Secretaría Administrativa',NULL,NULL),
	(5,'05','Contraloría Interna',NULL,NULL),
	(6,'06','Dirección General Jurídica',NULL,NULL),
	(7,'07','Coordinación de Comunicación Social y Relaciones Públicas',NULL,NULL),
	(8,'08','Coordinación de Transparencia y Datos Personales',NULL,NULL),
	(9,'09','Instituto de Formación y Capacitación',NULL,NULL),
	(10,'10','Comisión de Controversias Laborales y Administrativas',NULL,NULL),
	(11,'11','Unidad de Servicios Informáticos',NULL,NULL),
	(12,'12','Unidad de Estadística y Jurisprudencia',NULL,NULL),
	(13,'13','Coordinación de Difusión y Publicación',NULL,NULL),
	(14,'14','Coordinación de Archivo',NULL,NULL),
	(15,'15','Coordinación de Derechos Humanos y Género',NULL,NULL),
	(16,'16','Defensoria Publica de Participación Ciudadana de Proceso Democraticos',NULL,NULL),
	(17,'17','Coordinación de Vinculación y Relaciones Internacionales',NULL,NULL),
	(18,'18','Unidad Especializada de Procedimientos Sancionadores',NULL,NULL);

/*!40000 ALTER TABLE `unidades_responsables_gastos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla usuarios
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido_paterno` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido_materno` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genero` char(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuarios_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;

INSERT INTO `usuarios` (`id`, `nombre`, `apellido_paterno`, `apellido_materno`, `genero`, `usuario`, `password`, `email`, `foto`, `created_at`, `updated_at`)
VALUES
	(1,'Luis Angel','Romero','Escalona','Hombre','luis.romero','$2y$10$0lbt.LxzVxTF54c0Oww4COo8x/G.ofFLtdqRl3aC0hDNAxTvfyc9e','luis.romero@tecdmx.com','','2023-11-28 16:25:02','2023-11-28 16:25:02'),
	(2,'Rene','Navarrete','Tenco','Hombre','rene.navarrete','$2y$10$VWxNzousdsY2V2sLkEhF6.smtI7Zq.u0mAcMr22mTTB5/2ejqxL/G','rene.navarrete@tecdmx.org.mx','','2023-12-04 15:51:06','2023-12-04 15:51:06'),
	(3,'Isai','Fararoni','Ramirez','Hombre','isai.fararoni','$2y$10$FAGhc4SEwnHCS2Q0mHVMwu.trqnJIgqIEPOEO/dSA2QZM8AZqSv/.','isai.fararoni@tecdmx.org.mx','','2023-12-04 15:52:56','2023-12-04 15:52:56'),
	(4,'Jose','Rodriguez','Martinez','Hombre','jose.rodriguez','$2y$10$REnWOknYLb7WK/rtAK7S9.Hll4.bMgd7f0LAYRCTx7bxO/BHnkXgW','jose.rodriguez@tecdmx.org.mx','','2023-12-08 07:04:41','2023-12-08 07:04:41');

/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla versiones
# ------------------------------------------------------------

DROP TABLE IF EXISTS `versiones`;

CREATE TABLE `versiones` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `contrato_ejercicio_id` bigint unsigned NOT NULL,
  `version` int NOT NULL,
  `importe` double NOT NULL,
  `seleccionado` tinyint(1) NOT NULL,
  `aprobado` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `versiones_contrato_ejercicio_id_foreign` (`contrato_ejercicio_id`),
  CONSTRAINT `versiones_contrato_ejercicio_id_foreign` FOREIGN KEY (`contrato_ejercicio_id`) REFERENCES `contrato_ejercicio` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `versiones` WRITE;
/*!40000 ALTER TABLE `versiones` DISABLE KEYS */;

INSERT INTO `versiones` (`id`, `contrato_ejercicio_id`, `version`, `importe`, `seleccionado`, `aprobado`, `created_at`, `updated_at`)
VALUES
	(6,5,1,7000,0,0,'2023-12-01 19:50:25','2023-12-08 03:57:09'),
	(7,5,2,13452.9,0,0,'2023-12-01 19:55:53','2023-12-01 19:55:53'),
	(8,5,3,9000,1,1,'2023-12-01 20:12:45','2023-12-01 20:13:11'),
	(9,6,1,12345.6,0,0,'2023-12-01 20:16:08','2023-12-01 20:16:08'),
	(10,7,1,12345.6,0,0,'2023-12-01 20:18:51','2023-12-01 20:18:51'),
	(12,9,1,13459.6,1,1,'2023-12-01 20:20:08','2023-12-01 20:26:51'),
	(13,7,2,12000,1,1,'2023-12-01 20:24:40','2023-12-01 20:26:16'),
	(14,7,3,15000,0,0,'2023-12-01 20:24:46','2023-12-01 20:24:46'),
	(15,9,2,11232,0,0,'2023-12-01 20:25:05','2023-12-08 04:08:36'),
	(16,9,3,13267.1,0,0,'2023-12-01 20:25:17','2023-12-01 20:25:17'),
	(17,6,2,15000,0,0,'2023-12-08 18:11:23','2023-12-08 18:11:23'),
	(18,10,1,120000,0,0,'2023-12-08 18:19:24','2023-12-08 18:19:24');

/*!40000 ALTER TABLE `versiones` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
