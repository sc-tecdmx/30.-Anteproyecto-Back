# ************************************************************
# Sequel Ace SQL dump
# Versión 20062
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Equipo: 192.168.10.10 (MySQL 8.0.31-0ubuntu0.20.04.2)
# Base de datos: anteproyecto_bien
# Tiempo de generación: 2024-02-18 18:56:19 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


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
	(1,'Comisión Controversias Laborales y Administrativas','Comisión de Controversias Laborales y Administrativas',NULL,NULL),
	(2,'Contraloría Interna','Contraloría Interna',NULL,NULL),
	(3,'Coordinación de Archivo','Coordinación de Archivo',NULL,NULL),
	(4,'Coordinación de Comun. Soc. y  Relaciones Públicas','Coordinación de Comunicación Social y Relaciones Públicas',NULL,NULL),
	(5,'Coordinación de Difusión y Publicación','Coordinación de Difusión y Publicación',NULL,NULL),
	(6,'Coordinación de Transparencia y Datos Personales','Coordinación de Transparencia y Datos Personales',NULL,NULL),
	(7,'Coordinación de Vinculación y Relaciones Intern.','Coordinación de Vinculación y Relaciones Internacionales',NULL,NULL),
	(8,'Defensoría Pública Ciudadana de Procesos Democráti','Defensoría Pública Ciudadana de Procesos Democráticos',NULL,NULL),
	(9,'Dirección General Jurídica','Dirección General Jurídica',NULL,NULL),
	(10,'Instituto de Formación y Capacitación','Instituto de Formación y Capacitación',NULL,NULL),
	(11,'Pleno del Tribunal','Pleno del Tribunal',NULL,NULL),
	(12,'Ponencia de la Magistrada Martha L Mercado Ramírez','Ponencia de la Magistrada Martha Leticia Mercado Ramírez',NULL,NULL),
	(13,'Ponencia del Magistrado Armando Ambriz Hernández','Ponencia del Magistrado Armando Ambriz Hernández',NULL,NULL),
	(14,'Ponencia del Magistrado Juan Carlos Sánchez León','Ponencia del Magistrado Juan Carlos Sánchez León',NULL,NULL),
	(15,'Ponencia Vacante A','Ponencia de Magistratura Electoral Vacante',NULL,NULL),
	(16,'Ponencia Vacante B','Ponencia de Magistratura Electoral Vacante',NULL,NULL),
	(17,'Presidencia','Presidencia',NULL,NULL),
	(18,'S.A. Dirección de Planeación y Recursos Financieros','Secretaría Administrativa DRF',NULL,NULL),
	(19,'S.A. Dirección de Recursos Humanos','Secretaría Administrativa DRH',NULL,NULL),
	(20,'S.A. Dirección de Recursos Mat. y Serv. General','Secretaría Administrativa RMSG',NULL,NULL),
	(21,'Secretaría Administrativa','Secretaría Administrativa',NULL,NULL),
	(22,'Secretaría General','Secretaría General',NULL,NULL),
	(23,'Unidad de Estadística y Jurisprudencia','Unidad de Estadística y Jurisprudencia',NULL,NULL),
	(24,'Unidad de Servicios Informáticos','Unidad de Servicios Informáticos',NULL,NULL),
	(25,'Unidad Especializada de Procedimientos Sancionador','Unidad Especializada de Procedimientos Sancionadores',NULL,NULL),
	(26,'Coordinación de Derechos Humanos y Género','Coordinación de Derechos Humanos y Género',NULL,NULL);

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
	(1,1,'REMUNERACIONES AL PERSONAL DE CARÁCTER PERMANENTE.','1100',NULL,NULL),
	(2,1,'REMUNERACIONES AL PERSONAL DE CARÁCTER TRANSITORIO.','1200',NULL,NULL),
	(3,1,'REMUNERACIONES ADICIONALES Y ESPECIALES.','1300',NULL,NULL),
	(4,1,'SEGURIDAD SOCIAL.','1400',NULL,NULL),
	(5,1,'OTRAS PRESTACIONES SOCIALES Y ECONÓMICAS.','1500',NULL,NULL),
	(6,1,'PREVISIONES.','1600',NULL,NULL),
	(7,1,'PAGO DE ESTÍMULOS A SERVIDORES PÚBLICOS.','1700',NULL,NULL),
	(8,2,'MATERIALES DE ADMINISTRACIÓN, EMISIÓN DE DOCUMENTOS Y ARTÍCULOS OFICIALES.','2100',NULL,NULL),
	(9,2,'ALIMENTOS Y UTENSILIOS.','2200',NULL,NULL),
	(10,2,'MATERIALES Y ARTÍCULOS DE CONSTRUCCIÓN Y DE REPARACIÓN.','2400',NULL,NULL),
	(11,2,'PRODUCTOS QUÍMICOS, FARMACÉUTICOS Y DE LABORATORIO.','2500',NULL,NULL),
	(12,2,'COMBUSTIBLES, LUBRICANTES Y ADITIVOS.','2600',NULL,NULL),
	(13,2,'VESTUARIO, BLANCOS, PRENDAS DE PROTECCIÓN Y ARTÍCULOS DEPORTIVOS.','2700',NULL,NULL),
	(14,2,'MATERIALES Y SUMINISTROS PARA SEGURIDAD.','2800',NULL,NULL),
	(15,2,'HERRAMIENTAS, REFACCIONES Y ACCESORIOS MENORES.','2900',NULL,NULL),
	(16,3,'SERVICIOS BÁSICOS.','3100',NULL,NULL),
	(17,3,'SERVICIOS DE ARRENDAMIENTO.','3200',NULL,NULL),
	(18,3,'SERVICIOS PROFESIONALES, CIENTÍFICOS, TÉCNICOS Y OTROS SERVICIOS.','3300',NULL,NULL),
	(19,3,'SERVICIOS FINANCIEROS, BANCARIOS Y COMERCIALES.','3400',NULL,NULL),
	(20,3,'SERVICIOS DE INSTALACIÓN, REPARACIÓN, MANTENIMIENTO Y CONSERVACIÓN.','3500',NULL,NULL),
	(21,3,'SERVICIOS DE COMUNICACIÓN SOCIAL Y PUBLICIDAD.','3600',NULL,NULL),
	(22,3,'SERVICIOS DE TRASLADO Y VIÁTICOS.','3700',NULL,NULL),
	(23,3,'SERVICIOS OFICIALES.','3800',NULL,NULL),
	(24,3,'OTROS SERVICIOS GENERALES.','3900',NULL,NULL),
	(25,4,'TRANSFERENCIAS INTERNAS Y ASIGNACIONES AL SECTOR PÚBLICO.','4100',NULL,NULL),
	(26,4,'TRANSFERENCIAS AL RESTO DEL SECTOR PÚBLICO.','4200',NULL,NULL),
	(27,4,'SUBSIDIOS Y SUBVENCIONES.','4300',NULL,NULL),
	(28,4,'AYUDAS SOCIALES.','4400',NULL,NULL),
	(29,4,'PENSIONES Y JUBILACIONES.','4500',NULL,NULL),
	(30,4,'TRANSFERENCIAS A FIDEICOMISOS, MANDATOS Y OTROS ANÁLOGOS.','4600',NULL,NULL),
	(31,4,'TRANSFERENCIAS A LA SEGURIDAD SOCIAL.','4700',NULL,NULL),
	(32,4,'DONATIVOS.','4800',NULL,NULL),
	(33,4,'TRANSFERENCIAS AL EXTERIOR.','4900',NULL,NULL),
	(34,5,'MOBILIARIO Y EQUIPO DE ADMINISTRACIÓN.','5100',NULL,NULL),
	(35,5,'MOBILIARIO Y EQUIPO EDUCACIONAL Y RECREATIVO.','5200',NULL,NULL),
	(36,5,'EQUIPO E INSTRUMENTAL MÉDICO Y DE LABORATORIO.','5300',NULL,NULL),
	(37,5,'VEHÍCULOS Y EQUIPO DE TRANSPORTE.','5400',NULL,NULL),
	(38,5,'EQUIPO DE DEFENSA Y SEGURIDAD.','5500',NULL,NULL),
	(39,5,'MAQUINARIA, OTROS EQUIPOS Y HERRAMIENTAS.','5600',NULL,NULL),
	(40,5,'ACTIVOS BIOLÓGICOS.','5700',NULL,NULL),
	(41,5,'BIENES INMUEBLES.','5800',NULL,NULL),
	(42,5,'ACTIVOS INTANGIBLES.','5900',NULL,NULL),
	(43,6,'OBRA PÚBLICA EN BIENES DE DOMINIO PÚBLICO.','6100',NULL,NULL),
	(44,6,'OBRA PÚBLICA EN BIENES PROPIOS.','6200',NULL,NULL),
	(45,6,'PROYECTOS PRODUCTIVOS Y ACCIONES DE FOMENTO.','6300',NULL,NULL),
	(46,7,'INVERSIONES PARA EL FOMENTO DE ACTIVIDADES PRODUCTIVAS.','7100',NULL,NULL),
	(47,7,'ACCIONES Y PARTICIPACIONES DE CAPITAL.','7200',NULL,NULL),
	(48,7,'COMPRA DE TÍTULOS Y VALORES.','7300',NULL,NULL),
	(49,7,'CONCESIÓN DE PRÉSTAMOS.','7400',NULL,NULL),
	(50,7,'INVERSIONES EN FIDEICOMISOS, MANDATOS Y OTROS ANÁLOGOS.','7500',NULL,NULL),
	(51,7,'OTRAS INVERSIONES FINANCIERAS.','7600',NULL,NULL),
	(52,7,'PROVISIONES PARA CONTINGENCIAS Y OTRAS EROGACIONES ESPECIALES.','7900',NULL,NULL),
	(53,8,'PARTICIPACIONES.','8100',NULL,NULL),
	(54,8,'APORTACIONES.','8300',NULL,NULL),
	(55,8,'CONVENIOS.','8500',NULL,NULL),
	(56,9,'AMORTIZACIÓN DE LA DEUDA PÚBLICA.','9100',NULL,NULL),
	(57,9,'INTERESES DE LA DEUDA PÚBLICA.','9200',NULL,NULL),
	(58,9,'COMISIONES DE LA DEUDA PÚBLICA.','9300',NULL,NULL),
	(59,9,'GASTOS DE LA DEUDA PÚBLICA.','9400',NULL,NULL),
	(60,9,'COSTO POR COBERTURAS.','9500',NULL,NULL),
	(61,9,'APOYOS FINANCIEROS.','9600',NULL,NULL),
	(62,9,'ADEUDOS DE EJERCICIOS FISCALES ANTERIORES (ADEFAS).','9900',NULL,NULL);

/*!40000 ALTER TABLE `conceptos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla contrato_ejecucion
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contrato_ejecucion`;

CREATE TABLE `contrato_ejecucion` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `contrato_ejercicio_proyecto_id` bigint unsigned NOT NULL,
  `mes_id` bigint unsigned NOT NULL,
  `costo` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contrato_ejecucion_contrato_ejercicio_proyecto_id_foreign` (`contrato_ejercicio_proyecto_id`),
  KEY `contrato_ejecucion_mes_id_foreign` (`mes_id`),
  CONSTRAINT `contrato_ejecucion_contrato_ejercicio_proyecto_id_foreign` FOREIGN KEY (`contrato_ejercicio_proyecto_id`) REFERENCES `contrato_ejercicio_proyecto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `contrato_ejecucion_mes_id_foreign` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `contrato_ejecucion` WRITE;
/*!40000 ALTER TABLE `contrato_ejecucion` DISABLE KEYS */;

INSERT INTO `contrato_ejecucion` (`id`, `contrato_ejercicio_proyecto_id`, `mes_id`, `costo`, `created_at`, `updated_at`)
VALUES
	(1,1,1,0,NULL,NULL),
	(2,1,2,0,NULL,NULL),
	(3,1,3,0,NULL,NULL),
	(4,1,4,0,NULL,NULL),
	(5,1,5,0,NULL,NULL),
	(6,1,6,0,NULL,NULL),
	(7,1,7,0,NULL,NULL),
	(8,1,8,0,NULL,NULL),
	(9,1,9,0,NULL,NULL),
	(10,1,10,0,NULL,NULL),
	(11,1,11,0,NULL,NULL),
	(12,1,12,0,NULL,NULL);

/*!40000 ALTER TABLE `contrato_ejecucion` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla contrato_ejercicio_proyecto
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contrato_ejercicio_proyecto`;

CREATE TABLE `contrato_ejercicio_proyecto` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `contrato_id` bigint unsigned NOT NULL,
  `ejercicio_proyecto_id` bigint unsigned NOT NULL,
  `partida_id` bigint unsigned NOT NULL,
  `escenario` int NOT NULL,
  `importe` double NOT NULL DEFAULT '0.00',
  `cerrado` tinyint(1) NOT NULL,
  `seleccionado` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contrato_ejercicio_proyecto_ejercicio_proyecto_id_foreign` (`ejercicio_proyecto_id`),
  KEY `contrato_ejercicio_proyecto_contrato_id_foreign` (`contrato_id`),
  KEY `contrato_ejercicio_proyecto_partida_id_foreign` (`partida_id`),
  CONSTRAINT `contrato_ejercicio_proyecto_contrato_id_foreign` FOREIGN KEY (`contrato_id`) REFERENCES `contratos` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `contrato_ejercicio_proyecto_ejercicio_proyecto_id_foreign` FOREIGN KEY (`ejercicio_proyecto_id`) REFERENCES `ejercicio_proyecto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `contrato_ejercicio_proyecto_partida_id_foreign` FOREIGN KEY (`partida_id`) REFERENCES `partidas` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `contrato_ejercicio_proyecto` WRITE;
/*!40000 ALTER TABLE `contrato_ejercicio_proyecto` DISABLE KEYS */;

INSERT INTO `contrato_ejercicio_proyecto` (`id`, `contrato_id`, `ejercicio_proyecto_id`, `partida_id`, `escenario`, `importe`, `cerrado`, `seleccionado`, `created_at`, `updated_at`)
VALUES
	(1,1,1,1,1,0.00,0,0,NULL,NULL);

/*!40000 ALTER TABLE `contrato_ejercicio_proyecto` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla contratos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contratos`;

CREATE TABLE `contratos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parcialidad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `contratos` WRITE;
/*!40000 ALTER TABLE `contratos` DISABLE KEYS */;

INSERT INTO `contratos` (`id`, `descripcion`, `parcialidad`, `tipo`, `created_at`, `updated_at`)
VALUES
	(1,'Primer Contrato del ejercicio','Mensual','F','2023-12-13 20:07:32','2023-12-13 20:07:32');

/*!40000 ALTER TABLE `contratos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla detalles_contratos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `detalles_contratos`;

CREATE TABLE `detalles_contratos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `contrato_ejercicio_proyecto_id` bigint unsigned NOT NULL,
  `cantidad` double NOT NULL,
  `costo_unitario` double NOT NULL,
  `unidad_medida_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `detalles_contratos_contrato_ejercicio_proyecto_id_foreign` (`contrato_ejercicio_proyecto_id`),
  KEY `detalles_contratos_unidad_medida_id_foreign` (`unidad_medida_id`),
  CONSTRAINT `detalles_contratos_contrato_ejercicio_proyecto_id_foreign` FOREIGN KEY (`contrato_ejercicio_proyecto_id`) REFERENCES `contrato_ejercicio_proyecto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detalles_contratos_unidad_medida_id_foreign` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidades_medidas_anteproyecto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `detalles_contratos` WRITE;
/*!40000 ALTER TABLE `detalles_contratos` DISABLE KEYS */;

INSERT INTO `detalles_contratos` (`id`, `contrato_ejercicio_proyecto_id`, `cantidad`, `costo_unitario`, `unidad_medida_id`, `created_at`, `updated_at`)
VALUES
	(1,1,0.00,0,1,NULL,NULL);

/*!40000 ALTER TABLE `detalles_contratos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla ejercicio_proyecto
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ejercicio_proyecto`;

CREATE TABLE `ejercicio_proyecto` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ejercicio_id` bigint unsigned NOT NULL,
  `proyecto_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ejercicio_proyecto_ejercicio_id_foreign` (`ejercicio_id`),
  KEY `ejercicio_proyecto_proyecto_id_foreign` (`proyecto_id`),
  CONSTRAINT `ejercicio_proyecto_ejercicio_id_foreign` FOREIGN KEY (`ejercicio_id`) REFERENCES `ejercicios` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ejercicio_proyecto_proyecto_id_foreign` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `ejercicio_proyecto` WRITE;
/*!40000 ALTER TABLE `ejercicio_proyecto` DISABLE KEYS */;

INSERT INTO `ejercicio_proyecto` (`id`, `ejercicio_id`, `proyecto_id`, `created_at`, `updated_at`)
VALUES
	(1,6,1,NULL,NULL),
	(2,6,2,NULL,NULL),
	(3,6,3,NULL,NULL),
	(4,6,4,NULL,NULL),
	(5,6,5,NULL,NULL),
	(6,6,6,NULL,NULL),
	(7,6,7,NULL,NULL),
	(8,6,8,NULL,NULL),
	(9,6,9,NULL,NULL),
	(10,6,10,NULL,NULL),
	(11,6,11,NULL,NULL),
	(12,6,12,NULL,NULL),
	(13,6,13,NULL,NULL),
	(14,6,14,NULL,NULL),
	(15,6,15,NULL,NULL),
	(16,6,16,NULL,NULL),
	(17,6,17,NULL,NULL),
	(18,6,18,NULL,NULL),
	(19,6,19,NULL,NULL),
	(20,6,20,NULL,NULL),
	(21,6,21,NULL,NULL),
	(22,6,22,NULL,NULL),
	(23,6,23,NULL,NULL),
	(24,6,24,NULL,NULL),
	(25,6,25,NULL,NULL),
	(26,6,26,NULL,NULL),
	(27,6,27,NULL,NULL),
	(28,6,28,NULL,NULL),
	(29,6,29,NULL,NULL),
	(30,6,30,NULL,NULL),
	(31,6,31,NULL,NULL),
	(32,6,32,NULL,NULL),
	(33,6,33,NULL,NULL),
	(34,6,34,NULL,NULL),
	(35,6,35,NULL,NULL),
	(36,6,36,NULL,NULL),
	(37,6,37,NULL,NULL),
	(38,6,38,NULL,NULL),
	(39,6,39,NULL,NULL),
	(40,6,40,NULL,NULL),
	(41,6,41,NULL,NULL),
	(42,6,42,NULL,NULL),
	(43,6,43,NULL,NULL),
	(44,6,44,NULL,NULL),
	(45,6,45,NULL,NULL),
	(46,6,46,NULL,NULL),
	(47,6,47,NULL,NULL),
	(48,6,48,NULL,NULL),
	(49,6,49,NULL,NULL),
	(50,6,50,NULL,NULL);

/*!40000 ALTER TABLE `ejercicio_proyecto` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla ejercicios
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ejercicios`;

CREATE TABLE `ejercicios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ejercicio` int NOT NULL,
  `permitir_edicion_seguimiento` tinyint(1) NOT NULL,
  `permitir_edicion_seguimiento_derechos_humanos` tinyint(1) NOT NULL,
  `permitir_edicion_elaboracion` tinyint(1) NOT NULL,
  `activo_anteproyecto` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `ejercicios` WRITE;
/*!40000 ALTER TABLE `ejercicios` DISABLE KEYS */;

INSERT INTO `ejercicios` (`id`, `ejercicio`, `permitir_edicion_seguimiento`, `permitir_edicion_seguimiento_derechos_humanos`, `permitir_edicion_elaboracion`, `activo_anteproyecto`, `created_at`, `updated_at`)
VALUES
	(1,2019,1,0,1,0,NULL,NULL),
	(2,2020,1,0,0,0,NULL,NULL),
	(3,2021,1,0,1,0,NULL,'2023-12-08 21:00:11'),
	(4,2022,0,0,1,1,NULL,'2023-11-29 01:22:39'),
	(5,2023,1,0,1,1,NULL,'2023-11-29 01:22:39'),
	(6,2024,1,0,1,1,NULL,'2023-11-29 01:22:39');

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
	(1,'2014_10_11_211736_create_roles_table',1),
	(2,'2014_10_11_211800_create_areas_table',1),
	(3,'2014_10_12_000000_create_users_table',1),
	(4,'2014_10_12_100000_create_password_resets_table',1),
	(5,'2019_08_19_000000_create_failed_jobs_table',1),
	(6,'2019_12_14_000001_create_personal_access_tokens_table',1),
	(7,'2023_10_15_220542_create_ejercicios_table',1),
	(8,'2023_10_15_223352_create_unidades_medida_anteproyecto_table',1),
	(9,'2023_10_15_224159_create_capitulos_table',1),
	(10,'2023_10_15_225607_create_conceptos_table',1),
	(11,'2023_10_16_042953_create_partidas_table',1),
	(12,'2023_10_16_130640_create_meses_table',1),
	(13,'2023_10_16_132030_create_unidades_responsables_gastos_table',1),
	(14,'2023_10_16_133656_create_programas_table',1),
	(15,'2023_10_16_135211_create_subprogramas_table',1),
	(16,'2023_10_16_163713_create_responsables_operativos_table',1),
	(17,'2023_10_16_164816_create_proyectos_table',1),
	(18,'2023_10_17_163758_create_ejercicio_proyecto_table',1),
	(19,'2023_10_23_054840_create_contratos_table',1),
	(20,'2023_10_24_054250_create_contrato_ejercicio_proyecto_table',1),
	(21,'2023_10_24_054250_create_detalles_contratos_table',1),
	(22,'2023_11_21_160821_create_contratos_ejecucion_table',1),
	(23,'2023_11_28_163755_create_responsable_operativo_usuario_table copy',1);

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
	(1,1,'Dietas.','1110',NULL,NULL),
	(2,1,'Dietas.','1111',NULL,NULL),
	(3,1,'Haberes.','1120',NULL,NULL),
	(4,1,'Haberes para personal de seguridad pública y bomberos.','1121',NULL,NULL),
	(5,1,'Sueldos base al personal permanente.','1130',NULL,NULL),
	(6,1,'Sueldos base al personal permanente.','1131',NULL,NULL),
	(7,1,'Sueldos al personal a lista de raya base.','1132',NULL,NULL),
	(8,1,'Remuneraciones por adscripción laboral en el extranjero.','1140',NULL,NULL),
	(9,2,'Honorarios asimilables a salarios.','1210',NULL,NULL),
	(10,2,'Honorarios asimilables a salarios.','1211',NULL,NULL),
	(11,2,'Sueldos base al personal eventual.','1220',NULL,NULL),
	(12,2,'Sueldos base al personal eventual.','1221',NULL,NULL),
	(13,2,'Retribuciones por servicios de carácter social.','1230',NULL,NULL),
	(14,2,'Retribuciones por servicios de carácter social.','1231',NULL,NULL),
	(15,2,'Retribución a los representantes de los trabajadores y de los patrones en la Junta de Conciliación y Arbitraje.','1240',NULL,NULL),
	(16,2,'Retribución a los representantes de los trabajadores y de los patrones en la Junta de Conciliación y Arbitraje.','1241',NULL,NULL),
	(17,3,'Primas por años de servicios efectivos prestados.','1310',NULL,NULL),
	(18,3,'Prima quinquenal por años de servicios efectivos prestados.','1311',NULL,NULL),
	(19,3,'Primas por años de servicio activo.','1312',NULL,NULL),
	(20,3,'Otras primas por años de servicios efectivos prestados.','1319',NULL,NULL),
	(21,3,'Primas de vacaciones, dominical y gratificación de fin de año.','1320',NULL,NULL),
	(22,3,'Prima de vacaciones.','1321',NULL,NULL),
	(23,3,'Prima dominical.','1322',NULL,NULL),
	(24,3,'Gratificación de fin de año.','1323',NULL,NULL),
	(25,3,'Horas extraordinarias.','1330',NULL,NULL),
	(26,3,'Horas extraordinarias.','1331',NULL,NULL),
	(27,3,'Guardias.','1332',NULL,NULL),
	(28,3,'Compensaciones.','1340',NULL,NULL),
	(29,3,'Compensaciones.','1341',NULL,NULL),
	(30,3,'Compensaciones por servicios eventuales.','1342',NULL,NULL),
	(31,3,'Compensaciones adicionales y provisionales por servicios especiales.','1343',NULL,NULL),
	(32,3,'Sobrehaberes.','1350',NULL,NULL),
	(33,3,'Asignaciones de técnico, de mando, por comisión, de vuelo y de técnico especial.','1360',NULL,NULL),
	(34,3,'Honorarios especiales.','1370',NULL,NULL),
	(35,3,'Honorarios especiales.','1371',NULL,NULL),
	(36,3,'Participaciones por vigilancia en el cumplimiento de las leyes y custodia de valores.','1380',NULL,NULL),
	(37,4,'Aportaciones de seguridad social.','1410',NULL,NULL),
	(38,4,'Aportaciones a instituciones de seguridad social.','1411',NULL,NULL),
	(39,4,'Aportaciones al Instituto Mexicano del Seguro Social.','1412',NULL,NULL),
	(40,4,'Aportaciones a fondos de vivienda.','1420',NULL,NULL),
	(41,4,'Aportaciones a fondos de vivienda.','1421',NULL,NULL),
	(42,4,'Aportaciones al fondo de vivienda del INFONAVIT.','1422',NULL,NULL),
	(43,4,'Aportaciones al sistema para el retiro.','1430',NULL,NULL),
	(44,4,'Aportaciones al sistema para el retiro o a la administradora de fondos para el retiro y ahorro solidario.','1431',NULL,NULL),
	(45,4,'Aportaciones para seguros.','1440',NULL,NULL),
	(46,4,'Primas por seguro de vida del personal civil.','1441',NULL,NULL),
	(47,4,'Primas por seguro de vida del personal de los cuerpos de seguridad pública y bomberos.','1442',NULL,NULL),
	(48,4,'Primas por seguro de retiro del personal al servicio de las unidades responsables del gasto del Distrito Federal.','1443',NULL,NULL),
	(49,4,'Primas por seguro de responsabilidad civil y asistencia legal.','1444',NULL,NULL),
	(50,4,'Otras aportaciones para seguros.','1449',NULL,NULL),
	(51,5,'Cuotas para el fondo de ahorro y fondo de trabajo.','1510',NULL,NULL),
	(52,5,'Cuotas para el fondo de ahorro y fondo de trabajo.','1511',NULL,NULL),
	(53,5,'Indemnizaciones.','1520',NULL,NULL),
	(54,5,'Liquidaciones por indemnizaciones y por sueldos y salarios caídos.','1521',NULL,NULL),
	(55,5,'Liquidaciones por haberes caídos.','1522',NULL,NULL),
	(56,5,'Prestaciones y haberes de retiro.','1530',NULL,NULL),
	(57,5,'Prestaciones y haberes de retiro.','1531',NULL,NULL),
	(58,5,'Prestaciones contractuales.','1540',NULL,NULL),
	(59,5,'Vales.','1541',NULL,NULL),
	(60,5,'Apoyo económico por defunción de familiares directos.','1542',NULL,NULL),
	(61,5,'Estancias de Desarrollo Infantil.','1543',NULL,NULL),
	(62,5,'Asignaciones para requerimiento de cargos de servidores públicos de nivel técnico operativo, de confianza y personal de la rama médica.','1544',NULL,NULL),
	(63,5,'Asignaciones para prestaciones a personal sindicalizado y no sindicalizado.','1545',NULL,NULL),
	(64,5,'Otras prestaciones contractuales.','1546',NULL,NULL),
	(65,5,'Asignaciones conmemorativas.','1547',NULL,NULL),
	(66,5,'Asignaciones para pago de antigüedad.','1548',NULL,NULL),
	(67,5,'Apoyos colectivos.','1549',NULL,NULL),
	(68,5,'Apoyos a la capacitación de los servidores públicos.','1550',NULL,NULL),
	(69,5,'Apoyos a la capacitación de los servidores públicos.','1551',NULL,NULL),
	(70,5,'Otras prestaciones sociales y económicas.','1590',NULL,NULL),
	(71,5,'Asignaciones para requerimiento de cargos de servidores públicos superiores y de mandos medios así como de líderes coordinadores y enlaces.','1591',NULL,NULL),
	(72,5,'Asignaciones para servidores públicos del Ministerio Público.','1592',NULL,NULL),
	(73,5,'Becas a hijos de trabajadores.','1593',NULL,NULL),
	(74,5,'Becas de licenciatura.','1594',NULL,NULL),
	(75,5,'Otras prestaciones sociales y económicas.','1599',NULL,NULL),
	(76,6,'Previsiones de carácter laboral, económica y de seguridad social.','1610',NULL,NULL),
	(77,6,'Previsiones de carácter laboral, económica y de seguridad social.','1611',NULL,NULL),
	(78,7,'Estímulos.','1710',NULL,NULL),
	(79,7,'Estímulos por productividad, eficiencia y calidad en el desempeño.','1711',NULL,NULL),
	(80,7,'Premio de puntualidad.','1712',NULL,NULL),
	(81,7,'Premio de antigüedad.','1713',NULL,NULL),
	(82,7,'Premio de asistencia.','1714',NULL,NULL),
	(83,7,'Otros estímulos.','1719',NULL,NULL),
	(84,7,'Recompensas.','1720',NULL,NULL),
	(85,8,'Materiales, útiles y equipos menores de oficina.','2110',NULL,NULL),
	(86,8,'Materiales, útiles y equipos menores de oficina.','2111',NULL,NULL),
	(87,8,'Materiales y útiles de impresión y reproducción.','2120',NULL,NULL),
	(88,8,'Materiales y útiles de impresión y reproducción.','2121',NULL,NULL),
	(89,8,'Material estadístico y geográfico.','2130',NULL,NULL),
	(90,8,'Material estadístico y geográfico.','2131',NULL,NULL),
	(91,8,'Materiales, útiles y equipos menores de tecnologías de la información y comunicaciones.','2140',NULL,NULL),
	(92,8,'Materiales, útiles y equipos menores de tecnologías de la información y comunicaciones.','2141',NULL,NULL),
	(93,8,'Material impreso e información digital.','2150',NULL,NULL),
	(94,8,'Material impreso e información digital.','2151',NULL,NULL),
	(95,8,'Material de limpieza.','2160',NULL,NULL),
	(96,8,'Material de limpieza.','2161',NULL,NULL),
	(97,8,'Materiales y útiles de enseñanza.','2170',NULL,NULL),
	(98,8,'Materiales y útiles de enseñanza.','2171',NULL,NULL),
	(99,8,'Materiales para el registro e identificación de bienes y personas.','2180',NULL,NULL),
	(100,8,'Materiales para el registro e identificación de bienes y personas.','2181',NULL,NULL),
	(101,9,'Productos alimenticios para personas.','2210',NULL,NULL),
	(102,9,'Productos alimenticios y bebidas para personas.','2211',NULL,NULL),
	(103,9,'Productos alimenticios para animales.','2220',NULL,NULL),
	(104,9,'Productos alimenticios para animales.','2221',NULL,NULL),
	(105,9,'Utensilios para el servicio de alimentación.','2230',NULL,NULL),
	(106,9,'Utensilios para el servicio de alimentación.','2231',NULL,NULL),
	(107,10,'Productos minerales no metálicos.','2410',NULL,NULL),
	(108,10,'Mezcla asfáltica.','2411',NULL,NULL),
	(109,10,'Otros productos minerales no metálicos.','2419',NULL,NULL),
	(110,10,'Cemento y productos de concreto.','2420',NULL,NULL),
	(111,10,'Cemento y productos de concreto.','2421',NULL,NULL),
	(112,10,'Cal, yeso y productos de yeso.','2430',NULL,NULL),
	(113,10,'Cal, yeso y productos de yeso.','2431',NULL,NULL),
	(114,10,'Madera y productos de madera.','2440',NULL,NULL),
	(115,10,'Madera y productos de madera.','2441',NULL,NULL),
	(116,10,'Vidrio y productos de vidrio.','2450',NULL,NULL),
	(117,10,'Vidrio y productos de vidrio.','2451',NULL,NULL),
	(118,10,'Material eléctrico y electrónico.','2460',NULL,NULL),
	(119,10,'Material eléctrico y electrónico.','2461',NULL,NULL),
	(120,10,'Artículos metálicos para la construcción.','2470',NULL,NULL),
	(121,10,'Artículos metálicos para la construcción.','2471',NULL,NULL),
	(122,10,'Materiales complementarios.','2480',NULL,NULL),
	(123,10,'Materiales complementarios.','2481',NULL,NULL),
	(124,10,'Otros materiales y artículos de construcción y reparación.','2490',NULL,NULL),
	(125,10,'Otros materiales y artículos de construcción y reparación.','2491',NULL,NULL),
	(126,11,'Productos químicos básicos.','2510',NULL,NULL),
	(127,11,'Productos químicos básicos.','2511',NULL,NULL),
	(128,11,'Fertilizantes, pesticidas y otros agroquímicos.','2520',NULL,NULL),
	(129,11,'Fertilizantes, pesticidas y otros agroquímicos.','2521',NULL,NULL),
	(130,11,'Medicinas y productos farmacéuticos.','2530',NULL,NULL),
	(131,11,'Medicinas y productos farmacéuticos.','2531',NULL,NULL),
	(132,11,'Materiales, accesorios y suministros médicos.','2540',NULL,NULL),
	(133,11,'Materiales, accesorios y suministros médicos.','2541',NULL,NULL),
	(134,11,'Materiales, accesorios y suministros de laboratorio.','2550',NULL,NULL),
	(135,11,'Materiales, accesorios y suministros de laboratorio.','2551',NULL,NULL),
	(136,11,'Fibras sintéticas, hules, plásticos y derivados.','2560',NULL,NULL),
	(137,11,'Fibras sintéticas, hules, plásticos y derivados.','2561',NULL,NULL),
	(138,11,'Otros productos químicos.','2590',NULL,NULL),
	(139,11,'Otros productos químicos.','2591',NULL,NULL),
	(140,12,'Combustibles, lubricantes y aditivos.','2610',NULL,NULL),
	(141,12,'Combustibles, lubricantes y aditivos.','2611',NULL,NULL),
	(142,12,'Carbón y sus derivados.','2620',NULL,NULL),
	(143,12,'Carbón y sus derivados.','2621',NULL,NULL),
	(144,13,'Vestuario y uniformes.','2710',NULL,NULL),
	(145,13,'Vestuario y uniformes.','2711',NULL,NULL),
	(146,13,'Prendas de seguridad y protección personal.','2720',NULL,NULL),
	(147,13,'Prendas de seguridad y protección personal.','2721',NULL,NULL),
	(148,13,'Artículos deportivos.','2730',NULL,NULL),
	(149,13,'Artículos deportivos.','2731',NULL,NULL),
	(150,13,'Productos textiles.','2740',NULL,NULL),
	(151,13,'Productos textiles.','2741',NULL,NULL),
	(152,13,'Blancos y otros productos textiles, excepto prendas de vestir.','2750',NULL,NULL),
	(153,13,'Blancos y otros productos textiles, excepto prendas de vestir.','2751',NULL,NULL),
	(154,14,'Sustancias y materiales explosivos.','2810',NULL,NULL),
	(155,14,'Sustancias y materiales explosivos.','2811',NULL,NULL),
	(156,14,'Materiales de seguridad pública.','2820',NULL,NULL),
	(157,14,'Materiales de seguridad pública.','2821',NULL,NULL),
	(158,14,'Prendas de protección para seguridad pública y nacional.','2830',NULL,NULL),
	(159,14,'Prendas de protección para seguridad pública y nacional.','2831',NULL,NULL),
	(160,15,'Herramientas menores.','2910',NULL,NULL),
	(161,15,'Herramientas menores.','2911',NULL,NULL),
	(162,15,'Refacciones y accesorios menores de edificios.','2920',NULL,NULL),
	(163,15,'Refacciones y accesorios menores de edificios.','2921',NULL,NULL),
	(164,15,'Refacciones y accesorios menores de mobiliario y equipo de administración, educacional y recreativo.','2930',NULL,NULL),
	(165,15,'Refacciones y accesorios menores de mobiliario y equipo de administración, educacional y recreativo.','2931',NULL,NULL),
	(166,15,'Refacciones y accesorios menores de equipo de cómputo y tecnologías de la información.','2940',NULL,NULL),
	(167,15,'Refacciones y accesorios menores de equipo de cómputo y tecnologías de la información.','2941',NULL,NULL),
	(168,15,'Refacciones y accesorios menores de equipo e instrumental médico y de laboratorio.','2950',NULL,NULL),
	(169,15,'Refacciones y accesorios menores de equipo e instrumental médico y de laboratorio.','2951',NULL,NULL),
	(170,15,'Refacciones y accesorios menores de equipo de transporte.','2960',NULL,NULL),
	(171,15,'Refacciones y accesorios menores de equipo de transporte.','2961',NULL,NULL),
	(172,15,'Refacciones y accesorios menores de equipo de defensa y seguridad.','2970',NULL,NULL),
	(173,15,'Refacciones y accesorios menores de equipo de defensa y seguridad.','2971',NULL,NULL),
	(174,15,'Refacciones y accesorios menores de maquinaria y otros equipos.','2980',NULL,NULL),
	(175,15,'Refacciones y accesorios menores de maquinaria y otros equipos.','2981',NULL,NULL),
	(176,15,'Refacciones y accesorios menores otros bienes muebles.','2990',NULL,NULL),
	(177,15,'Refacciones y accesorios menores otros bienes muebles.','2991',NULL,NULL),
	(178,16,'Energía eléctrica.','3110',NULL,NULL),
	(179,16,'Contratación e instalación de energía eléctrica.','3111',NULL,NULL),
	(180,16,'Servicio de energía eléctrica.','3112',NULL,NULL),
	(181,16,'Gas.','3120',NULL,NULL),
	(182,16,'Gas.','3121',NULL,NULL),
	(183,16,'Agua.','3130',NULL,NULL),
	(184,16,'Agua potable.','3131',NULL,NULL),
	(185,16,'Agua tratada.','3132',NULL,NULL),
	(186,16,'Telefonía tradicional.','3140',NULL,NULL),
	(187,16,'Telefonía tradicional.','3141',NULL,NULL),
	(188,16,'Telefonía celular.','3150',NULL,NULL),
	(189,16,'Telefonía celular.','3151',NULL,NULL),
	(190,16,'Servicios de telecomunicaciones y satélites.','3160',NULL,NULL),
	(191,16,'Servicios de telecomunicaciones y satélites.','3161',NULL,NULL),
	(192,16,'Servicios de acceso de Internet, redes y procesamiento de información.','3170',NULL,NULL),
	(193,16,'Servicios de acceso de Internet, redes y procesamiento de información.','3171',NULL,NULL),
	(194,16,'Servicios postales y telegráficos.','3180',NULL,NULL),
	(195,16,'Servicios postales y telegráficos.','3181',NULL,NULL),
	(196,16,'Servicios integrales y otros servicios.','3190',NULL,NULL),
	(197,16,'Servicios integrales y otros servicios.','3191',NULL,NULL),
	(198,17,'Arrendamiento de terrenos.','3210',NULL,NULL),
	(199,17,'Arrendamiento de terrenos.','3211',NULL,NULL),
	(200,17,'Arrendamiento de edificios.','3220',NULL,NULL),
	(201,17,'Arrendamiento de edificios.','3221',NULL,NULL),
	(202,17,'Arrendamiento de mobiliario y equipo de administración, educacional y recreativo.','3230',NULL,NULL),
	(203,17,'Arrendamiento de mobiliario y equipo de administración, educacional y recreativo.','3231',NULL,NULL),
	(204,17,'Arrendamiento de equipo e instrumental médico y de laboratorio.','3240',NULL,NULL),
	(205,17,'Arrendamiento de equipo e instrumental médico y de laboratorio.','3241',NULL,NULL),
	(206,17,'Arrendamiento de equipo de transporte.','3250',NULL,NULL),
	(207,17,'Arrendamiento de equipo de transporte para la ejecución de programas de seguridad pública y atención de desastres naturales.','3251',NULL,NULL),
	(208,17,'Arrendamiento de equipo de transporte destinado a servicios públicos y la operación de programas públicos.','3252',NULL,NULL),
	(209,17,'Arrendamiento de equipo de transporte destinado a servidores públicos y servicios administrativos.','3253',NULL,NULL),
	(210,17,'Arrendamiento de maquinaria, otros equipos y herramientas.','3260',NULL,NULL),
	(211,17,'Arrendamiento de maquinaria, otros equipos y herramientas.','3261',NULL,NULL),
	(212,17,'Arrendamiento de activos intangibles.','3270',NULL,NULL),
	(213,17,'Arrendamiento de activos intangibles.','3271',NULL,NULL),
	(214,17,'Arrendamiento financiero.','3280',NULL,NULL),
	(215,17,'Arrendamiento financiero.','3281',NULL,NULL),
	(216,17,'Otros arrendamientos.','3290',NULL,NULL),
	(217,17,'Otros arrendamientos.','3291',NULL,NULL),
	(218,18,'Servicios legales, de contabilidad, auditoría y relacionados.','3310',NULL,NULL),
	(219,18,'Servicios legales, de contabilidad, auditoría y relacionados.','3311',NULL,NULL),
	(220,18,'Servicios de diseño, arquitectura, ingeniería y actividades relacionadas.','3320',NULL,NULL),
	(221,18,'Servicios de diseño, arquitectura, ingeniería y actividades relacionadas.','3321',NULL,NULL),
	(222,18,'Servicios de consultoría administrativa, procesos, técnica y en tecnologías de la información.','3330',NULL,NULL),
	(223,18,'Servicios de consultoría administrativa, procesos, técnica y en tecnologías de la información.','3331',NULL,NULL),
	(224,18,'Servicios de capacitación.','3340',NULL,NULL),
	(225,18,'Servicios de capacitación.','3341',NULL,NULL),
	(226,18,'Servicios de investigación científica y desarrollo.','3350',NULL,NULL),
	(227,18,'Servicios de investigación científica y desarrollo.','3351',NULL,NULL),
	(228,18,'Servicios de apoyo administrativo, fotocopiado e impresión.','3360',NULL,NULL),
	(229,18,'Servicios de apoyo administrativo y fotocopiado.','3361',NULL,NULL),
	(230,18,'Servicios de impresión.','3362',NULL,NULL),
	(231,18,'Servicios de protección y seguridad.','3370',NULL,NULL),
	(232,18,'Servicios de protección y seguridad.','3371',NULL,NULL),
	(233,18,'Servicios de vigilancia.','3380',NULL,NULL),
	(234,18,'Servicios de vigilancia.','3381',NULL,NULL),
	(235,18,'Servicios profesionales, científicos y técnicos integrales.','3390',NULL,NULL),
	(236,18,'Servicios profesionales, científicos, técnicos integrales y otros.','3391',NULL,NULL),
	(237,19,'Servicios financieros y bancarios.','3410',NULL,NULL),
	(238,19,'Servicios financieros y bancarios.','3411',NULL,NULL),
	(239,19,'Servicios de cobranza, investigación crediticia y similar.','3420',NULL,NULL),
	(240,19,'Servicios de cobranza, investigación crediticia y similar.','3421',NULL,NULL),
	(241,19,'Servicios de recaudación, traslado y custodia de valores.','3430',NULL,NULL),
	(242,19,'Gastos inherentes a la recaudación.','3431',NULL,NULL),
	(243,19,'Gastos de ensobretado y traslado de nómina.','3432',NULL,NULL),
	(244,19,'Otros servicios de recaudación, traslado y custodia de valores.','3439',NULL,NULL),
	(245,19,'Seguros de responsabilidad patrimonial y fianzas.','3440',NULL,NULL),
	(246,19,'Seguros de responsabilidad patrimonial y fianzas.','3441',NULL,NULL),
	(247,19,'Seguro de bienes patrimoniales.','3450',NULL,NULL),
	(248,19,'Seguro de bienes patrimoniales.','3451',NULL,NULL),
	(249,19,'Almacenaje, envase y embalaje.','3460',NULL,NULL),
	(250,19,'Almacenaje, envase y embalaje.','3461',NULL,NULL),
	(251,19,'Fletes y maniobras.','3470',NULL,NULL),
	(252,19,'Fletes y maniobras.','3471',NULL,NULL),
	(253,19,'Comisiones por ventas.','3480',NULL,NULL),
	(254,19,'Comisiones por ventas.','3481',NULL,NULL),
	(255,19,'Servicios financieros, bancarios y comerciales integrales.','3490',NULL,NULL),
	(256,19,'Diferencias por variaciones en el tipo de cambio.','3491',NULL,NULL),
	(257,19,'Otros Servicios financieros, bancarios y comerciales integrales.','3499',NULL,NULL),
	(258,20,'Conservación y mantenimiento menor de inmuebles.','3510',NULL,NULL),
	(259,20,'Conservación y mantenimiento menor de inmuebles.','3511',NULL,NULL),
	(260,20,'Instalación, reparación y mantenimiento de mobiliario y equipo de administración, educacional y recreativo.','3520',NULL,NULL),
	(261,20,'Instalación, reparación y mantenimiento de mobiliario y equipo de administración, educacional y recreativo.','3521',NULL,NULL),
	(262,20,'Instalación, reparación y mantenimiento de equipo de cómputo y tecnologías de la información.','3530',NULL,NULL),
	(263,20,'Instalación, reparación y mantenimiento de equipo de cómputo y tecnologías de la información.','3531',NULL,NULL),
	(264,20,'Instalación, reparación y mantenimiento de equipo e instrumental médico y de laboratorio.','3540',NULL,NULL),
	(265,20,'Instalación, reparación y mantenimiento de equipo e instrumental médico y de laboratorio.','3541',NULL,NULL),
	(266,20,'Reparación y mantenimiento de equipo de transporte.','3550',NULL,NULL),
	(267,20,'Reparación, mantenimiento y conservación de equipo de transporte para la ejecución de programas de seguridad pública y atención de desastres naturales.','3551',NULL,NULL),
	(268,20,'Reparación, mantenimiento y conservación de equipo de transporte destinados a servicios públicos y operación de programas públicos.','3552',NULL,NULL),
	(269,20,'Reparación, mantenimiento y conservación de equipo de transporte destinados a servidores públicos y servicios administrativos.','3553',NULL,NULL),
	(270,20,'Reparación y mantenimiento de equipo de defensa y seguridad.','3560',NULL,NULL),
	(271,20,'Reparación y mantenimiento de equipo de defensa y seguridad.','3561',NULL,NULL),
	(272,20,'Instalación, reparación y mantenimiento de maquinaria, otros equipos y herramienta.','3570',NULL,NULL),
	(273,20,'Instalación, reparación y mantenimiento de maquinaria, otros equipos y herramienta.','3571',NULL,NULL),
	(274,20,'Servicios de limpieza y manejo de desechos.','3580',NULL,NULL),
	(275,20,'Servicios de limpieza y manejo de desechos.','3581',NULL,NULL),
	(276,20,'Servicios de jardinería y fumigación.','3590',NULL,NULL),
	(277,20,'Servicios de jardinería y fumigación.','3591',NULL,NULL),
	(278,21,'Difusión por radio, televisión y otros medios de mensajes sobre programas y actividades gubernamentales.','3610',NULL,NULL),
	(279,21,'Difusión por radio, televisión y otros medios de mensajes sobre programas y actividades gubernamentales.','3611',NULL,NULL),
	(280,21,'Difusión por radio, televisión y otros medios de mensajes comerciales para promover la venta de bienes o servicios.','3620',NULL,NULL),
	(281,21,'Difusión por radio, televisión y otros medios de mensajes comerciales para promover la venta de bienes o servicios.','3621',NULL,NULL),
	(282,21,'Servicios de creatividad, preproducción y producción de publicidad, excepto Internet.','3630',NULL,NULL),
	(283,21,'Servicios de creatividad, preproducción y producción de publicidad, excepto Internet.','3631',NULL,NULL),
	(284,21,'Servicios de revelado de fotografías.','3640',NULL,NULL),
	(285,21,'Servicios de revelado de fotografías.','3641',NULL,NULL),
	(286,21,'Servicios de la industria fílmica, del sonido y del video.','3650',NULL,NULL),
	(287,21,'Servicios de la industria fílmica, del sonido y del video.','3651',NULL,NULL),
	(288,21,'Servicio de creación y difusión de contenido exclusivamente a través de Internet.','3660',NULL,NULL),
	(289,21,'Servicio de creación y difusión de contenido exclusivamente a través de Internet.','3661',NULL,NULL),
	(290,21,'Otros servicios de información.','3690',NULL,NULL),
	(291,21,'Otros servicios de información.','3691',NULL,NULL),
	(292,22,'Pasajes aéreos.','3710',NULL,NULL),
	(293,22,'Pasajes aéreos nacionales.','3711',NULL,NULL),
	(294,22,'Pasajes aéreos internacionales.','3712',NULL,NULL),
	(295,22,'Traslado aéreo de personas.','3712',NULL,NULL),
	(296,22,'Pasajes terrestres.','3720',NULL,NULL),
	(297,22,'Pasajes terrestres nacionales.','3721',NULL,NULL),
	(298,22,'Pasajes terrestres al interior del Distrito Federal.','3722',NULL,NULL),
	(299,22,'Traslado terrestre de personas.','3723',NULL,NULL),
	(300,22,'Pasajes terrestres internacionales.','3724',NULL,NULL),
	(301,22,'Pasajes marítimos, lacustres y fluviales.','3730',NULL,NULL),
	(302,22,'Pasajes marítimos, lacustres y fluviales.','3731',NULL,NULL),
	(303,22,'Traslado marítimo, lacustre y fluvial de personas.','3732',NULL,NULL),
	(304,22,'Autotransporte.','3740',NULL,NULL),
	(305,22,'Autotransporte.','3741',NULL,NULL),
	(306,22,'Viáticos en el país.','3750',NULL,NULL),
	(307,22,'Viáticos en el país.','3751',NULL,NULL),
	(308,22,'Viáticos en el extranjero.','3760',NULL,NULL),
	(309,22,'Viáticos en el extranjero.','3761',NULL,NULL),
	(310,22,'Gastos de instalación y traslado de menaje.','3770',NULL,NULL),
	(311,22,'Gastos de instalación y traslado de menaje.','3771',NULL,NULL),
	(312,22,'Servicios integrales de traslado y viáticos.','3780',NULL,NULL),
	(313,22,'Servicios integrales de traslado y viáticos.','3781',NULL,NULL),
	(314,22,'Otros servicios de traslado y hospedaje.','3790',NULL,NULL),
	(315,22,'Otros servicios de traslado y hospedaje.','3791',NULL,NULL),
	(316,23,'Gastos de ceremonial.','3810',NULL,NULL),
	(317,23,'Gastos de ceremonial.','3811',NULL,NULL),
	(318,23,'Gastos de orden social y cultural.','3820',NULL,NULL),
	(319,23,'Espectáculos culturales.','3821',NULL,NULL),
	(320,23,'Gastos de orden social.','3822',NULL,NULL),
	(321,23,'Gastos de difusión y extensión universitaria.','3823',NULL,NULL),
	(322,23,'Congresos y convenciones.','3830',NULL,NULL),
	(323,23,'Congresos y convenciones.','3831',NULL,NULL),
	(324,23,'Gastos de orden académico.','3832',NULL,NULL),
	(325,23,'Exposiciones.','3840',NULL,NULL),
	(326,23,'Exposiciones.','3841',NULL,NULL),
	(327,24,'Servicios funerarios y de cementerios.','3910',NULL,NULL),
	(328,24,'Servicios funerarios y de cementerio a los familiares de los civiles y pensionistas directos.','3911',NULL,NULL),
	(329,24,'Impuestos y derechos.','3920',NULL,NULL),
	(330,24,'Impuestos y derechos.','3921',NULL,NULL),
	(331,24,'Impuestos y derechos de importación.','3930',NULL,NULL),
	(332,24,'Impuestos y derechos de importación.','3931',NULL,NULL),
	(333,24,'Sentencias y resoluciones por autoridad competente.','3940',NULL,NULL),
	(334,24,'Sentencias y resoluciones por autoridad competente.','3941',NULL,NULL),
	(335,24,'Penas, multas, accesorios y actualizaciones.','3950',NULL,NULL),
	(336,24,'Penas, multas, accesorios y actualizaciones.','3951',NULL,NULL),
	(337,24,'Otros gastos por responsabilidades.','3960',NULL,NULL),
	(338,24,'Gastos por concepto de responsabilidades del Gobierno del Distrito Federal.','3961',NULL,NULL),
	(339,24,'Otros gastos por responsabilidades.','3969',NULL,NULL),
	(340,24,'Utilidades.','3970',NULL,NULL),
	(341,24,'Utilidades.','3971',NULL,NULL),
	(342,24,'Impuesto sobre nóminas y otros que se deriven de una relación laboral.','3980',NULL,NULL),
	(343,24,'Impuesto sobre nóminas.','3981',NULL,NULL),
	(344,24,'Otros impuestos derivados de una relación laboral.','3982',NULL,NULL),
	(345,24,'Otros servicios generales.','3990',NULL,NULL),
	(346,24,'Servicios para la promoción deportiva.','3991',NULL,NULL),
	(347,24,'Servicios para la promoción y difusión de sitios turísticos, culturales, recreativos y deportivos del Distrito Federal.','3992',NULL,NULL),
	(348,24,'Subrogaciones.','3993',NULL,NULL),
	(349,24,'Erogaciones derivadas de ingresos por cuenta de terceros.','3994',NULL,NULL),
	(350,24,'Otros servicios generales.','3999',NULL,NULL),
	(351,25,'Asignaciones presupuestarias al Poder Ejecutivo.','4110',NULL,NULL),
	(352,25,'Asignaciones presupuestarias al Órgano Ejecutivo del Distrito Federal.','4111',NULL,NULL),
	(353,25,'Asignaciones presupuestarias al Poder Legislativo.','4120',NULL,NULL),
	(354,25,'Asignaciones presupuestarias al Órgano Legislativo del Distrito Federal.','4121',NULL,NULL),
	(355,25,'Asignaciones presupuestarias al Poder Judicial.','4130',NULL,NULL),
	(356,25,'Asignaciones presupuestarias al Órgano Superior de Justicia del Distrito Federal.','4131',NULL,NULL),
	(357,25,'Asignaciones presupuestarias a Órganos Autónomos.','4140',NULL,NULL),
	(358,25,'Asignaciones presupuestarias a Órganos Autónomos del Distrito Federal.','4141',NULL,NULL),
	(359,25,'Transferencias internas otorgadas a entidades paraestatales no empresariales y no financieras.','4150',NULL,NULL),
	(360,25,'Transferencias otorgadas a entidades paraestatales no empresariales y no financieras.','4151',NULL,NULL),
	(361,25,'Aportaciones otorgadas a entidades paraestatales no empresariales y no financieras.','4152',NULL,NULL),
	(362,25,'Transferencias internas otorgadas a entidades paraestatales empresariales y no financieras.','4160',NULL,NULL),
	(363,25,'Transferencias otorgadas a entidades paraestatales empresariales y no financieras.','4161',NULL,NULL),
	(364,25,'Aportaciones otorgadas a entidades paraestatales empresariales y no financieras.','4162',NULL,NULL),
	(365,25,'Transferencias internas otorgadas a fideicomisos públicos empresariales y no financieros.','4170',NULL,NULL),
	(366,25,'Transferencias otorgadas a fideicomisos públicos empresariales y no financieros.','4171',NULL,NULL),
	(367,25,'Aportaciones otorgadas a fideicomisos públicos empresariales y no financieros.','4172',NULL,NULL),
	(368,25,'Transferencias internas otorgadas a instituciones paraestatales públicas financieras.','4180',NULL,NULL),
	(369,25,'Transferencias otorgadas a instituciones paraestatales públicas financieras.','4181',NULL,NULL),
	(370,25,'Aportaciones otorgadas a instituciones paraestatales públicas financieras.','4182',NULL,NULL),
	(371,25,'Transferencias internas otorgadas a fideicomisos públicos financieros.','4190',NULL,NULL),
	(372,25,'Transferencias otorgadas a fideicomisos públicos financieros.','4191',NULL,NULL),
	(373,25,'Aportaciones otorgadas a fideicomisos públicos financieros.','4192',NULL,NULL),
	(374,26,'Transferencias otorgadas a organismos entidades paraestatales no empresariales y no financieras.','4210',NULL,NULL),
	(375,26,'Transferencias otorgadas a entidades paraestatales no empresariales y no financieras.','4211',NULL,NULL),
	(376,26,'Transferencias otorgadas para entidades paraestatales empresariales y no financieras.','4220',NULL,NULL),
	(377,26,'Transferencias otorgadas para entidades paraestatales empresariales y no financieras.','4221',NULL,NULL),
	(378,26,'Transferencias otorgadas para instituciones paraestatales públicas financieras.','4230',NULL,NULL),
	(379,26,'Transferencias otorgadas para instituciones paraestatales públicas financieras.','4231',NULL,NULL),
	(380,26,'Transferencias otorgadas a entidades federativas y municipios.','4240',NULL,NULL),
	(381,26,'Transferencias otorgadas a entidades federativas y municipios.','4241',NULL,NULL),
	(382,26,'Transferencias a fideicomisos de entidades federativas y municipios.','4250',NULL,NULL),
	(383,26,'Transferencias a fideicomisos de entidades federativas y municipios.','4251',NULL,NULL),
	(384,27,'Subsidios a la producción.','4310',NULL,NULL),
	(385,27,'Subsidios a la producción.','4311',NULL,NULL),
	(386,27,'Subsidios a la distribución.','4320',NULL,NULL),
	(387,27,'Subsidios a la distribución.','4321',NULL,NULL),
	(388,27,'Subsidios a la inversión.','4330',NULL,NULL),
	(389,27,'Subsidios a la inversión.','4331',NULL,NULL),
	(390,27,'Subsidios a la prestación de servicios públicos.','4340',NULL,NULL),
	(391,27,'Subsidios a la prestación de servicios públicos.','4341',NULL,NULL),
	(392,27,'Subsidios para cubrir diferenciales de tasas de interés.','4350',NULL,NULL),
	(393,27,'Subsidios a la vivienda.','4360',NULL,NULL),
	(394,27,'Subsidios a la vivienda.','4361',NULL,NULL),
	(395,27,'Subvenciones al consumo.','4370',NULL,NULL),
	(396,27,'Subsidios a entidades federativas y municipios.','4380',NULL,NULL),
	(397,27,'Subsidios a entidades federativas y municipios.','4381',NULL,NULL),
	(398,27,'Otros subsidios.','4390',NULL,NULL),
	(399,27,'Otros subsidios.','4391',NULL,NULL),
	(400,28,'Ayudas sociales a personas.','4410',NULL,NULL),
	(401,28,'Premios.','4411',NULL,NULL),
	(402,28,'Ayudas sociales a personas u hogares de escasos recursos.','4412',NULL,NULL),
	(403,28,'Otras ayudas sociales a personas.','4419',NULL,NULL),
	(404,28,'Becas y otras ayudas para programas de capacitación.','4420',NULL,NULL),
	(405,28,'Becas y otras ayudas para programas de capacitación.','4421',NULL,NULL),
	(406,28,'Ayudas sociales a instituciones de enseñanza.','4431',NULL,NULL),
	(407,28,'Ayudas sociales a actividades científicas o académicas.','4440',NULL,NULL),
	(408,28,'Ayudas sociales a actividades científicas o académicas.','4441',NULL,NULL),
	(409,28,'Ayudas sociales a instituciones sin fines de lucro.','4450',NULL,NULL),
	(410,28,'Ayudas sociales a instituciones sin fines de lucro.','4451',NULL,NULL),
	(411,28,'Ayudas sociales a cooperativas.','4460',NULL,NULL),
	(412,28,'Ayudas sociales a cooperativas.','4461',NULL,NULL),
	(413,28,'Ayudas sociales a entidades de interés público.','4470',NULL,NULL),
	(414,28,'Ayudas sociales a entidades de interés público.','4471',NULL,NULL),
	(415,28,'Ayudas por desastres naturales y otros siniestros.','4480',NULL,NULL),
	(416,28,'Ayudas por desastres naturales y otros siniestros.','4481',NULL,NULL),
	(417,29,'Pensiones.','4510',NULL,NULL),
	(418,29,'Pensiones.','4511',NULL,NULL),
	(419,29,'Jubilaciones.','4520',NULL,NULL),
	(420,29,'Jubilaciones.','4521',NULL,NULL),
	(421,29,'Otras pensiones y jubilaciones.','4590',NULL,NULL),
	(422,29,'Otras pensiones y jubilaciones.','4591',NULL,NULL),
	(423,30,'Transferencias a fideicomisos del Poder Ejecutivo.','4610',NULL,NULL),
	(424,30,'Transferencias a fideicomisos del Órgano Ejecutivo del Distrito Federal.','4611',NULL,NULL),
	(425,30,'Aportaciones a fideicomisos del Órgano Ejecutivo del Distrito Federal.','4612',NULL,NULL),
	(426,30,'Transferencias a fideicomisos del Poder Legislativo.','4620',NULL,NULL),
	(427,30,'Transferencias a fideicomisos del Órgano Legislativo del Distrito Federal.','4621',NULL,NULL),
	(428,30,'Transferencias a fideicomisos del Poder Judicial.','4630',NULL,NULL),
	(429,30,'Transferencias a fideicomisos del Órgano Superior de Justicia del Distrito Federal.','4631',NULL,NULL),
	(430,30,'Transferencias a fideicomisos públicos de entidades paraestatales no empresariales y no financieras.','4640',NULL,NULL),
	(431,30,'Transferencias a fideicomisos no empresariales y no financieros.','4641',NULL,NULL),
	(432,30,'Aportaciones a fideicomisos no empresariales y no financieros.','4642',NULL,NULL),
	(433,30,'Transferencias a fideicomisos públicos de entidades paraestatales empresariales y no financieras.','4650',NULL,NULL),
	(434,30,'Transferencias a fideicomisos públicos de entidades paraestatales empresariales y no financieras.','4651',NULL,NULL),
	(435,30,'Aportaciones a fideicomisos públicos de entidades paraestatales empresariales y no financieras.','4652',NULL,NULL),
	(436,30,'Transferencias a fideicomisos de instituciones públicas financieras.','4660',NULL,NULL),
	(437,31,'Transferencias por obligación de ley.','4710',NULL,NULL),
	(438,31,'Transferencias por obligación de ley.','4711',NULL,NULL),
	(439,32,'Donativos a instituciones sin fines de lucro.','4810',NULL,NULL),
	(440,32,'Donativos a instituciones sin fines de lucro.','4811',NULL,NULL),
	(441,32,'Donativos a entidades federativas.','4820',NULL,NULL),
	(442,32,'Donativos a entidades federativas.','4821',NULL,NULL),
	(443,32,'Donativos a fideicomisos privados.','4830',NULL,NULL),
	(444,32,'Donativos a fideicomisos privados.','4831',NULL,NULL),
	(445,32,'Donativos a fideicomisos estatales.','4840',NULL,NULL),
	(446,32,'Donativos a fideicomisos estatales.','4841',NULL,NULL),
	(447,32,'Donativos internacionales.','4850',NULL,NULL),
	(448,32,'Donativos internacionales.','4851',NULL,NULL),
	(449,33,'Transferencias para gobiernos extranjeros.','4910',NULL,NULL),
	(450,33,'Transferencias para organismos internacionales.','4920',NULL,NULL),
	(451,33,'Transferencias para organismos internacionales.','4921',NULL,NULL),
	(452,33,'Transferencias para el sector privado externo.','4930',NULL,NULL),
	(453,33,'Transferencias para el sector privado externo.','4931',NULL,NULL),
	(454,34,'Muebles de oficina y estantería.','5110',NULL,NULL),
	(455,34,'Muebles de oficina y estantería.','5111',NULL,NULL),
	(456,34,'Muebles, excepto de oficina y estantería.','5120',NULL,NULL),
	(457,34,'Muebles, excepto de oficina y estantería.','5121',NULL,NULL),
	(458,34,'Bienes artísticos, culturales y científicos.','5130',NULL,NULL),
	(459,34,'Bienes artísticos, culturales y científicos.','5131',NULL,NULL),
	(460,34,'Objetos de valor.','5140',NULL,NULL),
	(461,34,'Objetos de valor.','5141',NULL,NULL),
	(462,34,'Equipo de cómputo y de tecnologías de la información.','5150',NULL,NULL),
	(463,34,'Equipo de cómputo y de tecnologías de la información.','5151',NULL,NULL),
	(464,34,'Otros mobiliarios y equipos de administración.','5190',NULL,NULL),
	(465,34,'Otros mobiliarios y equipos de administración.','5191',NULL,NULL),
	(466,35,'Equipos y aparatos audiovisuales.','5210',NULL,NULL),
	(467,35,'Equipos y aparatos audiovisuales.','5211',NULL,NULL),
	(468,35,'Aparatos deportivos.','5220',NULL,NULL),
	(469,35,'Aparatos deportivos.','5221',NULL,NULL),
	(470,35,'Cámaras fotográficas y de video.','5230',NULL,NULL),
	(471,35,'Cámaras fotográficas y de video.','5231',NULL,NULL),
	(472,35,'Otro mobiliario y equipo educacional y recreativo.','5290',NULL,NULL),
	(473,35,'Otro mobiliario y equipo educacional y recreativo.','5291',NULL,NULL),
	(474,36,'Equipo médico y de laboratorio.','5310',NULL,NULL),
	(475,36,'Equipo médico y de laboratorio.','5311',NULL,NULL),
	(476,36,'Instrumental médico y de laboratorio.','5320',NULL,NULL),
	(477,36,'Instrumental médico y de laboratorio.','5321',NULL,NULL),
	(478,37,'Vehículos y equipo terrestre.','5410',NULL,NULL),
	(479,37,'Vehículos y equipo terrestre para la ejecución de programas de seguridad pública y atención de desastres naturales.','5411',NULL,NULL),
	(480,37,'Vehículos y equipo terrestre destinados a servicios públicos y la operación de programas públicos.','5412',NULL,NULL),
	(481,37,'Vehículos y equipo terrestre destinados a servidores públicos y servicios administrativos.','5413',NULL,NULL),
	(482,37,'Carrocerías y remolques.','5420',NULL,NULL),
	(483,37,'Carrocerías y remolques para la ejecución de programas de seguridad pública y atención de desastres naturales.','5421',NULL,NULL),
	(484,37,'Carrocerías y remolques destinados a servicios públicos y la operación de programas públicos.','5422',NULL,NULL),
	(485,37,'Carrocerías y remolques destinado a servidores públicos y servicios administrativos.','5423',NULL,NULL),
	(486,37,'Equipo aeroespacial.','5430',NULL,NULL),
	(487,37,'Equipo aeroespacial.','5431',NULL,NULL),
	(488,37,'Equipo ferroviario.','5440',NULL,NULL),
	(489,37,'Equipo ferroviario.','5441',NULL,NULL),
	(490,37,'Embarcaciones.','5450',NULL,NULL),
	(491,37,'Embarcaciones.','5451',NULL,NULL),
	(492,37,'Otros equipos de transporte.','5490',NULL,NULL),
	(493,37,'Otros equipos de transporte.','5491',NULL,NULL),
	(494,38,'Equipo de defensa y seguridad.','5510',NULL,NULL),
	(495,38,'Equipo de defensa y seguridad.','5511',NULL,NULL),
	(496,39,'Maquinaria y equipo agropecuario.','5610',NULL,NULL),
	(497,39,'Maquinaria y equipo agropecuario.','5611',NULL,NULL),
	(498,39,'Maquinaria y equipo industrial.','5620',NULL,NULL),
	(499,39,'Maquinaria y equipo industrial.','5621',NULL,NULL),
	(500,39,'Maquinaria y equipo de construcción.','5630',NULL,NULL),
	(501,39,'Maquinaria y equipo de construcción.','5631',NULL,NULL),
	(502,39,'Sistemas de aire acondicionado, calefacción y de refrigeración industrial y comercial.','5640',NULL,NULL),
	(503,39,'Sistemas de aire acondicionado, calefacción y de refrigeración industrial y comercial.','5641',NULL,NULL),
	(504,39,'Equipo de comunicación y telecomunicación.','5650',NULL,NULL),
	(505,39,'Equipo de comunicación y telecomunicación.','5651',NULL,NULL),
	(506,39,'Equipos de generación eléctrica, aparatos y accesorios eléctricos.','5660',NULL,NULL),
	(507,39,'Equipos de generación eléctrica, aparatos y accesorios eléctricos.','5661',NULL,NULL),
	(508,39,'Herramientas y máquinas-herramienta.','5670',NULL,NULL),
	(509,39,'Herramientas y máquinas–herramienta.','5671',NULL,NULL),
	(510,39,'Otros equipos.','5690',NULL,NULL),
	(511,39,'Otros equipos.','5691',NULL,NULL),
	(512,40,'Bovinos.','5710',NULL,NULL),
	(513,40,'Bovinos.','5711',NULL,NULL),
	(514,40,'Porcinos.','5720',NULL,NULL),
	(515,40,'Porcinos.','5721',NULL,NULL),
	(516,40,'Aves.','5730',NULL,NULL),
	(517,40,'Aves.','5731',NULL,NULL),
	(518,40,'Ovinos y caprinos.','5740',NULL,NULL),
	(519,40,'Ovinos y caprinos.','5741',NULL,NULL),
	(520,40,'Peces y acuicultura.','5750',NULL,NULL),
	(521,40,'Peces y acuicultura.','5751',NULL,NULL),
	(522,40,'Equinos.','5760',NULL,NULL),
	(523,40,'Equinos.','5761',NULL,NULL),
	(524,40,'Especies menores y de zoológico.','5770',NULL,NULL),
	(525,40,'Especies menores y de zoológico.','5771',NULL,NULL),
	(526,40,'Árboles y plantas.','5780',NULL,NULL),
	(527,40,'Árboles y plantas.','5781',NULL,NULL),
	(528,40,'Otros activos biológicos.','5790',NULL,NULL),
	(529,40,'Otros activos biológicos.','5791',NULL,NULL),
	(530,41,'Terrenos.','5810',NULL,NULL),
	(531,41,'Adquisición de terrenos.','5811',NULL,NULL),
	(532,41,'Adjudicaciones, expropiaciones e indemnizaciones de terrenos.','5812',NULL,NULL),
	(533,41,'Viviendas.','5820',NULL,NULL),
	(534,41,'Adquisición de viviendas.','5821',NULL,NULL),
	(535,41,'Adjudicaciones, expropiaciones e indemnizaciones de viviendas.','5822',NULL,NULL),
	(536,41,'Edificios no residenciales.','5830',NULL,NULL),
	(537,41,'Adquisición de edificios no residenciales.','5831',NULL,NULL),
	(538,41,'Adjudicaciones, expropiaciones e indemnizaciones de edificios no residenciales.','5832',NULL,NULL),
	(539,41,'Otros bienes inmuebles.','5890',NULL,NULL),
	(540,41,'Adquisición de otros bienes inmuebles.','5891',NULL,NULL),
	(541,41,'Adjudicaciones, expropiaciones e indemnizaciones de otros bienes inmuebles.','5892',NULL,NULL),
	(542,42,'Software.','5910',NULL,NULL),
	(543,42,'Software.','5911',NULL,NULL),
	(544,42,'Patentes.','5920',NULL,NULL),
	(545,42,'Patentes.','5921',NULL,NULL),
	(546,42,'Marcas.','5930',NULL,NULL),
	(547,42,'Marcas.','5931',NULL,NULL),
	(548,42,'Derechos.','5940',NULL,NULL),
	(549,42,'Derechos.','5941',NULL,NULL),
	(550,42,'Concesiones.','5950',NULL,NULL),
	(551,42,'Concesiones.','5951',NULL,NULL),
	(552,42,'Franquicias.','5960',NULL,NULL),
	(553,42,'Franquicias.','5961',NULL,NULL),
	(554,42,'Licencias informáticas e intelectuales.','5970',NULL,NULL),
	(555,42,'Licencias informáticas e intelectuales.','5971',NULL,NULL),
	(556,42,'Licencias industriales, comerciales y otras.','5980',NULL,NULL),
	(557,42,'Licencias industriales, comerciales y otras.','5981',NULL,NULL),
	(558,42,'Otros activos intangibles.','5990',NULL,NULL),
	(559,42,'Otros activos intangibles.','5991',NULL,NULL),
	(560,43,'Edificación habitacional.','6110',NULL,NULL),
	(561,43,'Edificación habitacional.','6111',NULL,NULL),
	(562,43,'Edificación no habitacional.','6120',NULL,NULL),
	(563,43,'Edificación no habitacional.','6121',NULL,NULL),
	(564,43,'Construcción de obras para el abastecimiento de agua, petróleo, gas, electricidad y telecomunicaciones.','6130',NULL,NULL),
	(565,43,'Construcción de obras para el abastecimiento de agua, petróleo, gas, electricidad y telecomunicaciones.','6131',NULL,NULL),
	(566,43,'División de terrenos y construcción de obras de urbanización.','6140',NULL,NULL),
	(567,43,'División de terrenos y construcción de obras de urbanización.','6141',NULL,NULL),
	(568,43,'Construcción de vías de comunicación.','6150',NULL,NULL),
	(569,43,'Construcción de vías de comunicación.','6151',NULL,NULL),
	(570,43,'Otras construcciones de ingeniería civil u obra pesada.','6160',NULL,NULL),
	(571,43,'Otras construcciones de ingeniería civil u obra pesada.','6161',NULL,NULL),
	(572,43,'Instalaciones y equipamiento en construcciones.','6170',NULL,NULL),
	(573,43,'Instalaciones y equipamiento en construcciones.','6171',NULL,NULL),
	(574,43,'Trabajos de acabados en edificaciones y otros trabajos especializados.','6190',NULL,NULL),
	(575,43,'Trabajos de acabados en edificaciones y otros trabajos especializados.','6191',NULL,NULL),
	(576,44,'Edificación habitacional.','6210',NULL,NULL),
	(577,44,'Edificación habitacional.','6211',NULL,NULL),
	(578,44,'Edificación no habitacional.','6220',NULL,NULL),
	(579,44,'Edificación no habitacional.','6221',NULL,NULL),
	(580,44,'Construcción de obras para el abastecimiento de agua, petróleo, gas, electricidad y telecomunicaciones.','6230',NULL,NULL),
	(581,44,'Construcción de obras para el abastecimiento de agua, petróleo, gas, electricidad y telecomunicaciones.','6231',NULL,NULL),
	(582,44,'División de terrenos y construcción de obras de urbanización.','6240',NULL,NULL),
	(583,44,'División de terrenos y construcción de obras de urbanización.','6241',NULL,NULL),
	(584,44,'Construcción de vías de comunicación.','6250',NULL,NULL),
	(585,44,'Construcción de vías de comunicación.','6251',NULL,NULL),
	(586,44,'Otras construcciones de ingeniería civil u obra pesada.','6260',NULL,NULL),
	(587,44,'Otras construcciones de ingeniería civil u obra pesada.','6261',NULL,NULL),
	(588,44,'Instalaciones y equipamiento en construcciones.','6270',NULL,NULL),
	(589,44,'Instalaciones y equipamiento en construcciones.','6271',NULL,NULL),
	(590,44,'Trabajos de acabados en edificaciones y otros trabajos especializados.','6290',NULL,NULL),
	(591,44,'Trabajos de acabados en edificaciones y otros trabajos especializados.','6291',NULL,NULL),
	(592,45,'Estudios, formulación y evaluación de proyectos productivos no incluidos en conceptos anteriores de este capítulo.','6310',NULL,NULL),
	(593,45,'Estudios, formulación y evaluación de proyectos productivos no incluidos en conceptos anteriores de este capítulo.','6311',NULL,NULL),
	(594,45,'Ejecución de proyectos productivos no incluidos en conceptos anteriores de este capítulo.','6320',NULL,NULL),
	(595,45,'Ejecución de proyectos productivos no incluidos en conceptos anteriores de este capítulo.','6321',NULL,NULL),
	(596,46,'Créditos otorgados por entidades federativas y municipios al sector social y privado para el fomento de actividades productivas.','7110',NULL,NULL),
	(597,46,'Créditos otorgados por entidades federativas y municipios al sector social y privado para el fomento de actividades productivas.','7111',NULL,NULL),
	(598,46,'Otros créditos otorgados al sector social y privado para el fomento de actividades productivas.','7119',NULL,NULL),
	(599,46,'Créditos otorgados por entidades federativas a municipios para el fomento de actividades productivas.','7120',NULL,NULL),
	(600,47,'Acciones y participaciones de capital en entidades paraestatales no empresariales y no financieras con fines de política económica.','7210',NULL,NULL),
	(601,47,'Acciones y participaciones de capital en entidades paraestatales no empresariales y no financieras con fines de política económica.','7211',NULL,NULL),
	(602,47,'Acciones y participaciones de capital en entidades paraestatales empresariales y no financieras con fines de política económica.','7220',NULL,NULL),
	(603,47,'Acciones y participaciones de capital en entidades paraestatales empresariales y no financieras con fines de política económica.','7221',NULL,NULL),
	(604,47,'Acciones y participaciones de capital en instituciones paraestatales públicas financieras con fines de política económica.','7230',NULL,NULL),
	(605,47,'Acciones y participaciones de capital en instituciones paraestatales públicas financieras con fines de política económica.','7231',NULL,NULL),
	(606,47,'Acciones y participaciones de capital en el sector privado con fines de política económica.','7240',NULL,NULL),
	(607,47,'Acciones y participaciones de capital en el sector privado con fines de política económica.','7241',NULL,NULL),
	(608,47,'Acciones y participaciones de capital en organismos internacionales con fines de política económica.','7250',NULL,NULL),
	(609,47,'Acciones y participaciones de capital en organismos internacionales con fines de política económica.','7251',NULL,NULL),
	(610,47,'Acciones y participaciones de capital en el sector externo con fines de política económica.','7260',NULL,NULL),
	(611,47,'Acciones y participaciones de capital en el sector externo con fines de política económica.','7261',NULL,NULL),
	(612,47,'Acciones y participaciones de capital en el sector público con fines de gestión de la liquidez.','7270',NULL,NULL),
	(613,47,'Acciones y participaciones de capital en el sector público con fines de gestión de la liquidez.','7271',NULL,NULL),
	(614,47,'Acciones y participaciones de capital en el sector privado con fines de gestión de la liquidez.','7280',NULL,NULL),
	(615,47,'Acciones y participaciones de capital en el sector privado con fines de gestión de la liquidez.','7281',NULL,NULL),
	(616,47,'Acciones y participaciones de capital en el sector externo con fines de gestión de la liquidez.','7290',NULL,NULL),
	(617,47,'Acciones y participaciones de capital en el sector externo con fines de gestión de la liquidez.','7291',NULL,NULL),
	(618,48,'Bonos.','7310',NULL,NULL),
	(619,48,'Bonos.','7311',NULL,NULL),
	(620,48,'Valores representativos de deuda adquiridos con fines de política económica.','7320',NULL,NULL),
	(621,48,'Valores representativos de deuda adquiridos con fines de política económica.','7321',NULL,NULL),
	(622,48,'Valores representativos de deuda adquiridos con fines de gestión de liquidez.','7330',NULL,NULL),
	(623,48,'Valores representativos de deuda adquiridos con fines de gestión de liquidez.','7331',NULL,NULL),
	(624,48,'Obligaciones negociables adquiridas con fines de política económica.','7340',NULL,NULL),
	(625,48,'Obligaciones negociables adquiridas con fines de política económica.','7341',NULL,NULL),
	(626,48,'Obligaciones negociables adquiridas con fines de gestión de liquidez.','7350',NULL,NULL),
	(627,48,'Obligaciones negociables adquiridas con fines de gestión de liquidez.','7351',NULL,NULL),
	(628,48,'Otros valores.','7390',NULL,NULL),
	(629,48,'Otros valores.','7391',NULL,NULL),
	(630,49,'Concesión de préstamos a entidades paraestatales no empresariales y no financieras con fines de política económica.','7410',NULL,NULL),
	(631,49,'Concesión de préstamos a entidades paraestatales no empresariales y no financieras.','7411',NULL,NULL),
	(632,49,'Concesión de préstamos a entidades paraestatales empresariales y no financieras con fines de política económica.','7420',NULL,NULL),
	(633,49,'Concesión de préstamos a entidades paraestatales empresariales y no financieras.','7421',NULL,NULL),
	(634,49,'Concesión de préstamos a instituciones paraestatales públicas financieras con fines de política económica.','7430',NULL,NULL),
	(635,49,'Concesión de préstamos a instituciones paraestatales públicas financieras.','7431',NULL,NULL),
	(636,49,'Concesión de préstamos a entidades federativas y municipios con fines de política económica.','7440',NULL,NULL),
	(637,49,'Concesión de préstamos al sector privado con fines de política económica.','7450',NULL,NULL),
	(638,49,'Concesión de préstamos al sector privado.','7451',NULL,NULL),
	(639,49,'Concesión de préstamos al sector externo con fines de política económica.','7460',NULL,NULL),
	(640,49,'Concesión de préstamos al sector externo.','7461',NULL,NULL),
	(641,49,'Concesión de préstamos al sector público con fines de gestión de liquidez.','7470',NULL,NULL),
	(642,49,'Concesión de préstamos al sector público.','7471',NULL,NULL),
	(643,49,'Concesión de préstamos al sector privado con fines de gestión de liquidez.','7480',NULL,NULL),
	(644,49,'Concesión de préstamos al sector privado.','7481',NULL,NULL),
	(645,49,'Concesión de préstamos al sector externo con fines de gestión de liquidez.','7490',NULL,NULL),
	(646,49,'Concesión de préstamos al sector externo.','7491',NULL,NULL),
	(647,50,'Inversiones en fideicomisos del Poder Ejecutivo.','7510',NULL,NULL),
	(648,50,'Inversiones en fideicomisos del Órgano Ejecutivo del Distrito Federal.','7511',NULL,NULL),
	(649,50,'Inversiones en fideicomisos del Poder Legislativo.','7520',NULL,NULL),
	(650,50,'Inversiones en fideicomisos del Órgano Legislativo del Distrito Federal.','7521',NULL,NULL),
	(651,50,'Inversiones en fideicomisos del Poder Judicial.','7530',NULL,NULL),
	(652,50,'Inversiones en fideicomisos del Órgano Superior de Justicia del Distrito Federal.','7531',NULL,NULL),
	(653,50,'Inversiones en fideicomisos públicos no empresariales y no financieros.','7540',NULL,NULL),
	(654,50,'Inversiones en fideicomisos públicos no empresariales y no financieros.','7541',NULL,NULL),
	(655,50,'Inversiones en fideicomisos públicos empresariales y no financieros.','7550',NULL,NULL),
	(656,50,'Inversiones en fideicomisos públicos empresariales y no financieros.','7551',NULL,NULL),
	(657,50,'Inversiones en fideicomisos públicos financieros.','7560',NULL,NULL),
	(658,50,'Inversiones en fideicomisos públicos financieros.','7561',NULL,NULL),
	(659,50,'Inversiones en fideicomisos de entidades federativas.','7570',NULL,NULL),
	(660,50,'Inversiones en fideicomisos de entidades federativas.','7571',NULL,NULL),
	(661,50,'Inversiones en fideicomisos de municipios.','7580',NULL,NULL),
	(662,50,'Fideicomisos de empresas privadas y particulares.','7590',NULL,NULL),
	(663,50,'Fideicomisos de empresas privadas y particulares.','7591',NULL,NULL),
	(664,51,'Depósitos a largo plazo en moneda nacional.','7610',NULL,NULL),
	(665,51,'Depósitos a largo plazo en moneda nacional.','7611',NULL,NULL),
	(666,51,'Erogaciones recuperables por concepto de reserva.','7612',NULL,NULL),
	(667,51,'Depósitos a largo plazo en moneda extranjera.','7620',NULL,NULL),
	(668,51,'Depósitos a largo plazo en moneda extranjera.','7621',NULL,NULL),
	(669,52,'Contingencias por fenómenos naturales.','7910',NULL,NULL),
	(670,52,'Contingencias por fenómenos naturales.','7911',NULL,NULL),
	(671,52,'Contingencias socioeconómicas.','7920',NULL,NULL),
	(672,52,'Contingencias socioeconómicas.','7921',NULL,NULL),
	(673,52,'Otras erogaciones especiales.','7990',NULL,NULL),
	(674,52,'Otras erogaciones especiales.','7999',NULL,NULL),
	(675,53,'Fondo general de participaciones.','8110',NULL,NULL),
	(676,53,'Fondo de fomento municipal.','8120',NULL,NULL),
	(677,53,'Participaciones de las entidades federativas a los municipios.','8130',NULL,NULL),
	(678,53,'Otros conceptos participables de la Federación a entidades federativas.','8140',NULL,NULL),
	(679,53,'Otros conceptos participables de la Federación a municipios.','8150',NULL,NULL),
	(680,53,'Convenios de colaboración administrativa.','8160',NULL,NULL),
	(681,54,'Aportaciones de la Federación a las entidades federativas.','8310',NULL,NULL),
	(682,54,'Aportaciones de la Federación a municipios.','8320',NULL,NULL),
	(683,54,'Aportaciones de las entidades federativas a los municipios.','8330',NULL,NULL),
	(684,54,'Aportaciones previstas en leyes y decretos al sistema de protección social.','8340',NULL,NULL),
	(685,54,'Aportaciones previstas en leyes y decretos compensatorias a entidades federativas y municipios.','8350',NULL,NULL),
	(686,55,'Convenios de reasignación.','8510',NULL,NULL),
	(687,55,'Convenios de descentralización.','8520',NULL,NULL),
	(688,55,'Otros Convenios.','8530',NULL,NULL),
	(689,56,'Amortización de la deuda interna con instituciones de crédito.','9110',NULL,NULL),
	(690,56,'Amortización de la deuda interna con instituciones de crédito.','9111',NULL,NULL),
	(691,56,'Amortización de la deuda interna por emisión de títulos y valores.','9120',NULL,NULL),
	(692,56,'Amortización de la deuda interna por emisión de títulos y valores.','9121',NULL,NULL),
	(693,56,'Amortización de arrendamientos financieros nacionales.','9130',NULL,NULL),
	(694,56,'Amortización de arrendamientos financieros nacionales.','9131',NULL,NULL),
	(695,56,'Amortización de la deuda externa con instituciones de crédito.','9140',NULL,NULL),
	(696,56,'Amortización de la deuda externa con instituciones de crédito.','9141',NULL,NULL),
	(697,56,'Amortización de deuda  externa con organismos financieros internacionales.','9150',NULL,NULL),
	(698,56,'Amortización de deuda externa con organismos financieros internacionales.','9151',NULL,NULL),
	(699,56,'Amortización de la deuda bilateral.','9160',NULL,NULL),
	(700,56,'Amortización de la deuda bilateral.','9161',NULL,NULL),
	(701,56,'Amortización de la deuda externa por emisión de títulos y valores.','9170',NULL,NULL),
	(702,56,'Amortización de la deuda externa por emisión de títulos y valores.','9171',NULL,NULL),
	(703,56,'Amortización de arrendamientos financieros internacionales.','9180',NULL,NULL),
	(704,56,'Amortización de arrendamientos financieros internacionales.','9181',NULL,NULL),
	(705,57,'Intereses de la deuda interna con instituciones de crédito.','9210',NULL,NULL),
	(706,57,'Intereses de la deuda interna con instituciones de crédito.','9211',NULL,NULL),
	(707,57,'Intereses derivados de la colocación de títulos y valores.','9220',NULL,NULL),
	(708,57,'Intereses derivados de la colocación de títulos y valores.','9221',NULL,NULL),
	(709,57,'Intereses por arrendamientos financieros nacionales.','9230',NULL,NULL),
	(710,57,'Intereses por arrendamientos financieros nacionales.','9231',NULL,NULL),
	(711,57,'Intereses de la deuda externa con instituciones de crédito.','9240',NULL,NULL),
	(712,57,'Intereses de la deuda externa con instituciones de crédito.','9241',NULL,NULL),
	(713,57,'Intereses de la deuda con organismos financieros Internacionales.','9250',NULL,NULL),
	(714,57,'Intereses de la deuda con organismos financieros Internacionales.','9251',NULL,NULL),
	(715,57,'Intereses de la deuda bilateral.','9260',NULL,NULL),
	(716,57,'Intereses de la deuda bilateral.','9261',NULL,NULL),
	(717,57,'Intereses derivados de la colocación de títulos y valores en el exterior.','9270',NULL,NULL),
	(718,57,'Intereses derivados de la colocación de títulos y valores en el exterior.','9271',NULL,NULL),
	(719,57,'Intereses por arrendamientos financieros internacionales.','9280',NULL,NULL),
	(720,57,'Intereses por arrendamientos financieros internacionales.','9281',NULL,NULL),
	(721,58,'Comisiones de la deuda pública interna.','9310',NULL,NULL),
	(722,58,'Comisiones de la deuda pública interna.','9311',NULL,NULL),
	(723,58,'Comisiones de la deuda pública externa.','9320',NULL,NULL),
	(724,58,'Comisiones de la deuda pública externa.','9321',NULL,NULL),
	(725,59,'Gastos de la deuda pública interna.','9410',NULL,NULL),
	(726,59,'Gastos de la deuda pública interna.','9411',NULL,NULL),
	(727,59,'Gastos de la deuda pública externa.','9420',NULL,NULL),
	(728,59,'Gastos de la deuda pública externa.','9421',NULL,NULL),
	(729,60,'Costos por coberturas.','9510',NULL,NULL),
	(730,60,'Costos por coberturas.','9511',NULL,NULL),
	(731,61,'Apoyos a intermediarios financieros.','9610',NULL,NULL),
	(732,61,'Apoyos a intermediarios financieros.','9611',NULL,NULL),
	(733,61,'Apoyos a ahorradores y deudores del Sistema Financiero Nacional.','9620',NULL,NULL),
	(734,61,'Apoyos a ahorradores y deudores del Sistema Financiero Nacional.','9621',NULL,NULL),
	(735,62,'ADEFAS.','9910',NULL,NULL),
	(736,62,'ADEFAS.','9911',NULL,NULL),
	(737,62,'Devolución de ingresos percibidos indebidamente en ejercicios fiscales anteriores.','9912',NULL,NULL);

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


# Volcado de tabla proyectos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `proyectos`;

CREATE TABLE `proyectos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subprograma_id` bigint unsigned NOT NULL,
  `responsable_operativo_id` bigint unsigned NOT NULL,
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
  PRIMARY KEY (`id`),
  KEY `proyectos_subprograma_id_foreign` (`subprograma_id`),
  KEY `proyectos_responsable_operativo_id_foreign` (`responsable_operativo_id`),
  CONSTRAINT `proyectos_responsable_operativo_id_foreign` FOREIGN KEY (`responsable_operativo_id`) REFERENCES `responsables_operativos` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `proyectos_subprograma_id_foreign` FOREIGN KEY (`subprograma_id`) REFERENCES `subprogramas` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;

INSERT INTO `proyectos` (`id`, `subprograma_id`, `responsable_operativo_id`, `numero`, `nombre`, `tipo`, `version`, `objetivo`, `justificacion`, `descripcion`, `fecha`, `nombre_responsable_operativo`, `cargo_responsable_operativo`, `nombre_titular`, `responsable_ficha`, `autorizado_por`, `status`, `created_at`, `updated_at`)
VALUES
	(1,1,1,'01','Acciones del Pleno, administrativas y jurisdiccionales\nnecesarias, para impartir justicia en los medios de impugnación\nen materia electoral y controversias laborales y administrativas;\nasí como para el fortalecimiento institucional.','normal',1,'Garantizar a la ciudadanía y asociaciones políticas la impartición de justicia en materia político electoral en el ámbito jurisdiccional, así como fijar las políticas y lineamientos administrativos que contribuyan en el fortalecimiento y consolidación institucional.','La ejecución de estas actividades tiene como finalidad elaborar los proyectos de resolución relativos a los medios de impugnación y controversias planteadas ante este Tribunal.','Que el Pleno realice las acciones jurisdiccionales y administrativas necesarias para recibir, sustanciar y resolver en definitiva las impugnaciones y controversias sometidas a su consideración.','2023-10-23','Lic. Diego Ochoa Ochoa y María del Pilar Meza Robert ','Secretario Auxiliar y Secretaria Ejecutiva','Magistrado Armando Ambriz Hernández ','Lic. Diego Ochoa Ochoa y María del Pilar Meza Robert ','EL PLENO EN REUNIÓN PRIVADA DE 2 DE DICIEMBRE 2020','0',NULL,NULL),
	(2,1,1,'02','Acciones que la Ponencia realiza para la impartición de justicia electoral, laboral y administrativa.','normal',1,'Garantizar a la ciudadanía y asociaciones políticas la impartición de justicia en materia político electoral en el ámbito jurisdiccional, así como fijar las políticas y lineamientos administrativos que contribuyan en el fortalecimiento y consolidación institucional.','La ejecución de este proyecto tiene como finalidad la impartición de justicia electoral, laboral y administrativa mediante la resolución definitiva de impugnaciones y controversias competencia de este Tribunal.\n\n','Que la Ponencia reciba, sustancie y elabore proyectos de resolución y/o acuerdos plenarios de los asuntos turnados.','2023-10-23','Lic. Diego Ochoa Ochoa y María del Pilar Meza Robert  ','Secretario Auxiliar y Secretaria Ejecutiva','Magistrado Armando Ambriz Hernández ','Lic. Diego Ochoa Ochoa y María del Pilar Meza Robert ','EL PLENO EN REUNIÓN PRIVADA DE 2 DE DICIEMBRE 2020','0',NULL,NULL),
	(3,1,3,'01','Acciones del Pleno, administrativas y jurisdiccionales necesarias, para impartir justicia en los medios de impugnación en materia electoral y controversias laborales y administrativas; así como para el fortalecimiento institucional.','normal',1,'Garantizar a la ciudadanía y asociaciones políticas la impartición de justicia en materia político electoral en el ámbito jurisdiccional, así como fijar las políticas y lineamientos administrativos que contribuyan en el fortalecimiento y consolidación institucional.','La ejecución de este proyecto tiene como finalidad la impartición de justicia electoral, laboral y administrativa mediante la resolución definitiva de impugnaciones y controversias competencia de este Tribunal. ','Que el Pleno realice las acciones jurisdiccionales y administrativas necesarias para recibir, sustanciar y resolver en definitiva las impugnaciones y controversias sometidas a su consideración.','2023-10-23','Lcdo. Carlos Antonio Neri Carrillo','Coordinador de Ponencia','Magistrada Martha Leticia Mercado Ramírez','Lcdo. Carlos Antonio Neri Carrillo','EL PLENO EN REUNIÓN PRIVADA DEL 02 DICIEMBRE DE 2020','0',NULL,NULL),
	(4,1,3,'02','Acciones que la Ponencia realiza para la impartición de justicia electoral, laboral y administrativa.','normal',1,'Garantizar a la ciudadanía y asociaciones políticas la impartición de justicia en materia político electoral en el ámbito jurisdiccional, así como fijar las políticas y lineamientos administrativos que contribuyan en el fortalecimiento y consolidación institucional.','La ejecución de estas actividades tiene como finalidad elaborar los proyectos de resolución relativos a los medios de impugnación y controversias planteadas ante este Tribunal.\n','Que la Ponencia reciba, sustancie y elabore proyectos de resolución y/o acuerdos plenarios de los asuntos turnados.\n\n','2023-10-23','Lcdo. Carlos Antonio Neri Carrillo','Coordinador de Ponencia','Magistrada Martha Leticia Mercado Ramírez','Lcdo. Carlos Antonio Neri Carrillo','EL PLENO EN REUNIÓN PRIVADA DEL 02 DICIEMBRE DE 2020','0',NULL,NULL),
	(5,1,4,'01','Acciones del Pleno, administrativas y jurisdiccionales necesarias, para impartir justicia en los medios de impugnación en materia electoral y controversias laborales y administrativas; así como para el fortalecimiento institucional.','normal',1,'Garantizar a la ciudadanía y asociaciones políticas la impartición de justicia en materia político electoral en el ámbito jurisdiccional, así como fijar las políticas y lineamientos administrativos que contribuyan en el fortalecimiento y consolidación institucional.','La ejecución de este proyecto tiene como finalidad la impartición de justicia electoral, laboral y administrativa mediante la resolución definitiva de impugnaciones y controversias competencia de este Tribunal. ','Que el Pleno realice las acciones jurisdiccionales y administrativas necesarias para recibir, sustanciar y resolver en definitiva las impugnaciones y controversias sometidas a su consideración. ','2023-10-23','Lcda. Lilián Herrera Guzmán','Secretaria de Estudio y Cuenta','Magistrado Armando Ambriz Hernández','Lcda. Lilián Herrera Guzmán','EL PLENO EN REUNIÓN PRIVADA DE 2 DE DICIEMBRE 2020','0',NULL,NULL),
	(6,1,4,'02','Acciones que la Ponencia realiza para la impartición de justicia electoral, laboral y administrativa.','normal',1,'Garantizar a la ciudadanía y asociaciones políticas la impartición de justicia en materia político electoral en el ámbito jurisdiccional, así como fijar las políticas y lineamientos administrativos que contribuyan en el fortalecimiento y consolidación institucional.','La ejecución de estas actividades tiene como finalidad elaborar los proyectos de resolución relativos a los medios de impugnación y controversias planteadas ante este Tribunal.','Que la Ponencia reciba, sustancie y elabore proyectos de resolución y/o acuerdos plenarios de los asuntos turnados.','2023-10-23','Lcda. Lilián Herrera Guzmán','Secretaria de Estudio y Cuenta','Magistrado Armando Ambriz Hernández','Lic. Lilián Herrera Guzmán','EL PLENO EN REUNIÓN PRIVADA DE 2 DE DICIEMBRE 2020','0',NULL,NULL),
	(7,2,25,'04','Elaboración de Anteproyectos de Jurisprudencias y Tesis Relevantes','normal',1,'Que los criterios, Jurisprudencia y Tesis Relevantes aprobados por el Pleno del Tribunal Electoral de la Ciudad de México, cumplan con las formalidades técnico-jurídicas para su integración al marco legal en materia electoral de la Ciudad de México, a través de presentar a la persona que ejerza la Presidencia, los anteproyectos de textos que conforman dichos criterios, para su análisis y eventual aprobación. Asimismo, llevar el registro y difusión de la Jurisprudencia y Tesis Relevantes aprobadas por el Tribunal Electoral del Poder Judicial de la Federación, por conducto de su Sala Superior y la Sala Regional correspondiente a la Cuarta Circunscripción Electoral Federal. De igual forma, se lleva el registro de personas sancionadas por Violencia Política contra las Mujeres en razón de  Género.','La implementación de este proyecto es fundamental ya que derivado de estas actividades se elaborarán los criterios de Jurisprudencia y Tesis Relevantes, así como su registro, compilación y difusión, previa aprobación del Pleno del Tribunal Electoral de la Ciudad de México. Asimismo, se efectuará la difusión y archivo de la Jurisprudencia y Tesis Relevantes emitidas por el Tribunal Electoral del Poder Judicial de la Federación y se dará seguimiento a las sesiones de la Sala Superior, la Sala Regional Ciudad de México y Sala Regional Especializada de ese Tribunal. De igual forma, se coadyuva con la sistematización del registro de personas sancionadas por Violencia Política contra las Mujeres en Razón de Género.','Formulación de anteproyectos de Jurisprudencia y Tesis Relevantes, detección de criterios y contradicción de los mismos, elaboración de las carpetas, índices y sistemas de clasificación para el registro, compilación y difusión de Jurisprudencias y Tesis relevantes que apruebe el Pleno de este Órgano Jurisdiccional; así como el archivo y difusión de las Jurisprudencias y Tesis relevantes que aprueba el Tribunal Electoral del Poder Judicial de la Federación.','2023-10-23','Lcdo. Marco Antonio Ambriz Carreón','Subdirector de Jurisprudencia','Lcda Elvira Susana Guevara Ortega','Lcdo. Marco Antonio Ambriz Carreón ','EL PLENO EN REUNIÓN PRIVADA ','0',NULL,NULL),
	(8,5,6,'01','Representación del Tribunal en los distintos eventos de carácter local, nacional e internacional. Celebrar los convenios institucionales que se requieran; así como realizar los actos administrativos necesarios para el buen funcionamiento del Tribunal.','normal',1,'Coordinar los trabajos de los órganos y áreas del Tribunal, de acuerdo con la normatividad jurídica aplicable.','Este proyecto se requiere ejecutar ya que concentra las actividades de representación institucional en los diversos eventos en que debe participar el Tribunal Electoral de la Ciudad de México, lo cual le da presencia a este Órgano Autónomo ante la ciudadanía. Asimismo, el proyecto es necesario debido a que en él se consideran las actividades de coordinación de las áreas que lo integran.','El proyecto tiene como propósito representar al Tribunal en el ámbito local, nacional e internacional en materia de impartición de justicia electoral, a través del diálogo con diversos organismos públicos y privados, organizaciones de la sociedad civil, entre otros. Las acciones de este proyecto están orientadas a establecer y consolidar los vínculos con los diferentes actores de la sociedad con los cuales el Tribunal fortalece su operación, desarrollo, resultados, posicionamiento, imagen y autonomía en el ámbito de impartición de justicia electoral.  Asimismo, busca fomentar y mantener una adecuada operación interna a través de la oportuna coordinación de las actividades y funciones que desempeña cada unidad administrativa del TECDMX e informar de ello al Pleno.','2023-10-23','Lcda. Lilián Herrera Guzmán','Secretaria de Estudio y Cuenta','Magistrado Presidente Interino Armando Ambriz Hernández','Lcda. Lilián Herrera Guzmán','EL PLENO EN REUNIÓN PRIVADA','0',NULL,NULL),
	(9,16,13,'01','Presentación del informes de la Contraloría Interna','normal',1,' Fiscalizar el manejo, custodia y aplicación de los recursos del Tribunal Electoral, así como instruir los procedimientos y, en su caso, aplicar las sanciones establecidas en la Ley de Responsabilidades Administrativas de la Ciudad de México, conforme al artículo 202, fracciones VI, XI, XIV, XVIII y XX del Código de Instituciones y Procedimientos Electorales de la Ciudad de México.','Transparentar las actividades de la Contraloría Interna en términos de lo dispuesto en el Código de Instituciones y Procedimientos Electorales de la Ciudad de México.','Rendir cuentas sobre las actividades institucionales de la Contraloría Interna','2023-10-23','Lcdo. Marco Antonio Guerra Castillo','Secretario Particular de la Contraloría Interna','Mtra. Agar Leslie Serrano Álvarez, Encargada de Despacho de la Contraloría Interna','Lcdo. Marco Antonio Guerra Castillo','EL PLENO EN REUNIÓN PRIVADA DEL 1° FEBRERO DE 2012','0',NULL,NULL),
	(10,8,16,'01','Coordinación de la representación legal y asesoramiento jurídico del Tribunal Electoral de la Ciudad de México.','normal',1,'Apoyar a la o el Presidente en la representación legal del Tribunal ante las autoridades administrativas y judiciales, ya sean locales o federales, así como atender los asuntos de este órgano jurisdiccional en materia contenciosa, consultiva, contractual y normativa a excepción de los asuntos relacionados con la materia electoral o de participación ciudadana.','La implementación del proyecto es prioritaria dado que la representación legal del Tribunal ante las autoridades administrativas, laborales o judiciales, locales o federales, es imprescindible a fin de atender y dar seguimiento a los asuntos que en materia contenciosa, contractual, consultiva y normativa, tiene esta Institución.','La Dirección General Jurídica tiene por objeto, fundamentalmente, apoyar en la representación legal del Tribunal ante las autoridades administrativas, laborales o judiciales, locales o federales, así como coordinar la atención y seguimiento de los asuntos de este órgano jurisdiccional en las materias de su competencia, de conformidad con la normativa aplicable.','2022-10-23','Lic. María Magdalena Roque Morales','Secretaria Ejecutiva','Lic. Eber Dario Comonfort Palacios','Lic. María Magdalena Roque Morales','El Pleno del Tribunal Electoral de la Ciudad de México, en Reunión Privada del veintinueve de octubre de 2020','0',NULL,NULL),
	(11,12,24,'02','Soluciones de tecnologías de la información que coadyuven a la transparencia, rendición de cuentas, difusión de la información y gobierno abierto.','normal',1,'La Unidad de Servicios Informáticos, es el área que dirige la actividad informática del Tribunal Electoral de la Ciudad de México que, bajo la jerarquía del Pleno y su Presidente/a, tiene a su cargo el manejo eficaz y eficiente de los servicios y asuntos relacionados con la informática de la institución.Uno de los principales objetivos es apoyar al desarrollo informático dentro del Tribunal, mediante una contribución profesional y de alto nivel que garantice la continuidad de los servicios electrónicos existentes; así como organizar y fortalecer el rumbo informático para producir e implementar las herramientas relevantes y útiles que los usuarios de los órganos y áreas requieren para el desempeño de las funciones que tienen asignadas. Para responder al objetivo previamente indicado, la Unidad de Servicios Informáticos, apoya y desarrolla varias líneas básicas de actividades: desarrollo de sistemas, asesoría y capacitación especializada, administración de servicios (correo electrónico, Internet/Intranet, Telefonía y Red de Datos) y difusión de información relevante a través de Internet e Intranet, así como fortalecer la infraestructura informática e implementar los nuevos proyectos que surjan en  los órganos y áreas del Tribunal.Es decir, implementar las bases tecnológicas, para la estandarización de la infraestructura de cómputo, que permitan dirigir el rumbo informático a corto, mediano y largo plazo del Tribunal, haciendo uso de las mejores prácticas de tecnologías de la información y comunicaciones, aplicadas al ámbito jurídico-electoral y administrativo.','Con el objetivo de cumplir con la doctrina de un Gobierno Abierto, ser un Tribunal transparente y proporcionar un acceso a la información con igualdad de oportunidades para todos los ciudadanos y ciudadanas, es necesario contar con las herramientas tecnológicas que permitan la mejor rendición de cuentas y difusión de la información.','Creación de nuevos sitios web, así como el mantenimiento y actualización a los que se tienen actualmente para su buen funcionamiento:\n- Portal de transparencia alineándolo a la ley de transparencia, acceso a la información pública y rendición de cuentas de la Ciudad de México.\n- Transmisión de sesiones públicas y eventos a través de la página web del Tribunal, Intranet y redes sociales. \n- Mantenimiento y actualización de los diferentes sitios web del Tribunal.\n- Creación de nuevos sitios web acorde a las necesidades del Tribunal, incorporando herramientas de accesibilidad.','2023-10-23','Ing. Isaí Fararoni Ramírez','Subdirector de Servicios Informáticos','Lcdo. Otilio Esteban Hernández Pérez','Ing. Isaí Fararoni Ramírez','Lcdo. Otilio Esteban Hernández Pérez','0',NULL,NULL),
	(12,8,17,'02','Atención y seguimiento a los procedimientos jurisdiccionales, procesos y trámites en los que este Tribunal, sea parte.','normal',1,'Apoyar a la o el Presidente en la representación legal del Tribunal ante las autoridades administrativas y judiciales, ya sean locales o federales, así como atender los asuntos de este órgano colegiado en materia contenciosa y consultiva.','La implementación del proyecto es necesaria porque se deben atender en tiempo y forma los juicios de amparo y laborales que deriven de las resoluciones de índole laboral o de responsabilidad administrativa promovidos por personas servidoras públicas del IECDMX ó de este Tribunal, así como realizar diversos trámites ante autoridades administrativas.','Entre las actividades que contiene el proyecto se encuentra representar al Tribunal en los juicios de amparo derivados de las resoluciones de índole laboral o de responsabilidad administrativa promovidos por personas servidoras públicas del IECDMX o del propio órgano jurisdiccional; y sustanciar ante la Comisión de Controversias Laborales y Administrativas los juicios laborales y administrativos promovidos por personas ex servidoras públicas del Tribunal, en su carácter de demandado. Se contempla representar a esta institución cuando acude como parte actora o demandada en algún juicio así como atender las instancias penales. Representación que implica realizar todas las diligencias necesarias, para defender los intereses del TECDMX. Asimismo, conocer de trámites ante autoridades administrativas del Instituto Nacional de Derechos de Autor (INDAUTOR), Instituto Nacional Electoral (INE) y Dirección General Jurídica y de Estudios Legislativos (Gaceta Oficial de la Ciudad de México), así como las demás que se instruyan por los superiores jerárquicos.','2023-10-23','Lic. Luis Sánchez Baltazar','Subdirector de lo Contencioso y Consultivo','Lic. Eber Dario Comonfort Palacios','Lic. Luis Sánchez Baltzar','EL PLENO EN REUNIÓN PRIVADA DEL 1° DE FEBRERO DE 2012','0',NULL,NULL),
	(13,7,10,'02','Administración de Recursos Financieros','normal',1,'Administrar eficiente y eficazmente los recursos financieros, con la finalidad de contribuir al logro de los objetivos institucionales, garantizando el cumplimiento oportuno de las obligaciones laborales y económicas, con estricto apego a la normatividad aplicable vigente; vigilando el ejercicio transparente del presupuesto institucional y la satisfacción de las áreas requirentes mediante la mejora continua de nuestros procesos.','Es pilar fundamental de la gestión institucional, la administración de los recursos financieros, por ello este proyecto esta orientado al manejo del presupuesto, la contabilidad y las finanzas institucionales, a fin de atender de manera oportuna los requerimientos presupuestales de las áreas, para cumplir con la actividad jurisdiccional del Tribunal y lograr las metas consideradas en el Programa Operativo Anual 2025; a fin de generar información veraz y oportuna que permita transparentar las atribuciones conferidas a este órgano autónomo y el manejo eficiente del presupuesto asignado.\nAsimismo, se deben desarrollar actividades orientadas a consolidar el marco procedimental del Tribunal.','En cumplimiento a lo dispuesto en el Artículo 42 del Reglamento Interior del Tribunal Electoral de la Ciudad de México, la Dirección de Planeación y Recursos Financieros realizará actividades encaminadas a la administración eficiente de los recursos presupuestales, el oportuno registro contable y la emisión en tiempo de los estados financieros, presupuestales y contables del Tribunal. \n\nCon el proyecto se atenderá oportuna y eficientemente a las unidades administrativas del Tribunal, respecto de los requerimientos de gasto, control e información presupuestal y contable; se desarrollarán y aplicarán instrumentos para la planeación, programación, presupuestación, seguimiento y evaluación para el ejercicio del gasto; y las funciones que deriven de las disposiciones aplicables y las que le encomienden el Pleno, el/la Presidente/a y el/la Secretario/a Administrativo/a. También se efectuarán las actividades para crear y actualizar el marco procedimental del órgano jurisdiccional.','2023-10-23','L.C. Fernando Cortés Figueroa','Encargado de despacho de  la Dirección de Planeación y Recursos Financieros','Lcdo. Luis Martín Flores Mejia','L.C. Fernando Cortés Figueroa','','0',NULL,NULL),
	(14,15,15,'01','Diseño, ejecución y seguimiento del Programa Interno de Auditoría (PIA)','normal',1,'El Programa Interno de Auditoría se elabora para dar cumplimiento a los artículos 200 y 202, fracciones I, II, III, IV y XIX del Código de Instituciones y Procedimientos Electorales de la Ciudad de México, así como a los artículos 50, 51 bis y 54 del Reglamento Interior del Tribunal Electoral de la Ciudad de México, haciéndolo del conocimiento del Pleno. La programación de éstas permite identificar el periodo de ejecución y presentación de los informes finales de cada una de las auditorías de mérito. ','Fiscalizar el manejo, custodia y aplicación de los recursos del Tribunal Electoral, así como instruir los procedimientos y, en su caso, aplicar las sanciones establecidas en la Ley de Responsabilidades Administrativas de la Ciudad de México. ','El Programa Interno de Auditoría se realizará de conformidad con la calendarización y los periodos de ejecución de cada una de éstas.','2023-10-23','Lcda. Orquídea Mayalli González Torres','Directora de Auditoría, Control y Evaluación','Mtra. Agar Leslie Serrano Álvarez, Encargada de Despacho de la Contraloría Interna','Lcda. Orquídea Mayalli González Torres','EL PLENO EN REUNIÓN PRIVADA DEL 1° FEBRERO DE 2012','0',NULL,NULL),
	(15,17,14,'02','Procedimientos Administrativos','normal',1,'Fiscalizar el manejo, custodia y aplicación de los recursos del Tribunal Electoral, así como instruir los procedimientos y, en su caso, aplicar las sanciones establecidas en la Ley de Responsabilidades Administrativas de la Ciudad de México, de conformidad con lo establecido en el artículo 202, fracciones III, IX, X, XI y XV del Código de Instituciones y Procedimientos Electorales de la Ciudad de México.','Es necesario para controlar las acciones vinculadas con los procedimientos administrativos por faltas no graves a cargo de la Dirección.','El proyecto contempla actividades que coadyuvan en la tramitación, sustanciación y resolución de los procedimientos de responsabilidad administrativa, de adquisiciones y de obra.','2023-10-23','Lcdo. José de Jesús Ruíz Gallegos','Jefe de Departamento de Responsabilidades','Mtra. Agar Leslie Serrano Álvarez, Encargada de Despacho de la Contraloría Interna','Mtra. Agar Leslie Serrano Álvarez','EL PLENO EN REUNIÓN PRIVADA DEL 1° FEBRERO DE 2012','0',NULL,NULL),
	(16,7,12,'04','Administración de recursos materiales y servicios generales','normal',1,'Coordinar la administración de los recursos materiales del Tribunal Electoral aplicando políticas, normas y procedimientos emitidos; vigilando el manejo del patrimonio y el eficiente uso de los bienes muebles e inmuebles para garantizar el ejercicio adecuado del presupuesto institucional.','En virtud de que existen necesidades de adquisición y/o contratación de bienes, servicios y obra que pueden requerir las diversas áreas de este Órgano Autónomo, es necesario crear un proyecto que concentre las actividades encaminadas a llevar a cabo dichos procesos con el fin de tener una aplicación eficiente de los recursos presupuestales y proveer oportunamente de los insumos que permitan la operación institucional. También es necesario ejecutar el proyecto para garantizar el óptimo funcionamiento de las instalaciones del Tribunal y con ello aportar elementos de seguridad e higiene, tanto para el personal como para el edificio sede.','Realizar la planeación, programación, presupuestación, gasto, ejecución y control de activo fijo, adquisiciones y servicios detectados por esta Dirección y solicitados por las Unidades Administrativas. Este proyecto considera brindar mantenimiento preventivo y correctivo a las instalaciones del Tribunal.','2023-10-23','Lcda. Yolanda Sánchez Cervantes','Directora de Recursos Materiales y Servicios Generales','Lcdo. Luis Martín Flores Mejia','Lcda.. Yolanda Sánchez Cervantes','','0',NULL,NULL),
	(17,2,8,'03','Apoyo técnico jurídico del Pleno','normal',1,'Apoyar al Pleno y al Magistrado Presidente del Tribunal, con acciones de carácter jurídico-administrativo, destacando entre ellas, la recepción de los medios de impugnación que se presenten ante la Oficialía de Partes; su registro en los libros de gobierno respectivos; y turno a las Ponencias de este órgano jurisdiccional para la sustanciación y resolución correspondiente. Asimismo, proveer lo necesario para la celebración de las sesiones y reuniones del Pleno, elaborando las respectivas actas y acuerdos. Supervisar que se hagan en tiempo y forma las notificaciones y finalmente el registro en las tesis relevantes y de jurisprudencia así como la sistematización de datos estadísticos de la actividad jurisdiccional.','Las actividades del Pleno de este Tribunal Electoral requieren del apoyo técnico jurídico para generar, de manera oportuna, información actualizada y ordenada de los acuerdos que tome; con el fin de llevar un adecuado control de las actividades del órgano superior de dirección.','En el marco de este proyecto se realizará la elaboración y registro de las actas y acuerdos tomados con motivo de las reuniones privadas y sesiones públicas celebradas por el Pleno del Tribunal Electoral de la Ciudad de México.','2023-10-23','Lcda. Karla Carina Chaparro Blancas','Secretaria Técnica de la Secretaría General','Lcda. Elizabeth Valderrama López','Lcda. Karla Carina Chaparro Blancas','EL PLENO EN REUNIÓN PRIVADA DEL 1° DE FEBRERO DE 2012','0',NULL,NULL),
	(18,2,7,'01','Control de Gestión Jurisdiccional','normal',1,'Apoyar al Pleno y al Magistrado Presidente del Tribunal, con acciones de carácter jurídico-administrativo, destacando entre ellas, la recepción de los medios de impugnación que se presenten ante la Oficialía de Partes; su registro en los libros de gobierno respectivos; y turno a las Ponencias de esta Institución para la sustanciación y resolución correspondiente. Asimismo, proveer lo necesario para la celebración de las sesiones y reuniones del Pleno, elaborando las respectivas actas y acuerdos. Supervisar que se hagan en tiempo y forma las notificaciones y finalmente el debido resguardo de los expedientes jurisdiccionales y su conservación como acervo de la actividad jurisdiccional.','Es un proyecto sustantivo que refleja la actividad esencial y sustantiva del Tribunal que, en su carácter de autoridad jurisdiccional especializado en materia electoral en la Ciudad de México, resuelve los medios de impugnación en esa materia, y demás procedimientos jurisdiccionales de su competencia, por lo que es indispensable ejecutar este proyecto para recibir, gestionar y resguardar  la correspondencia jurisdiccional de esta autoridad, de acuerdo con la normativa atinente. Lo anterior, permite la debida atención de solicitudes de información pública, requerimientos formulados por los integrantes del Pleno y en su caso, la certificación de documentación jurisdiccional que obre en poder de la Secretaría General. Finalmente, se da puntual seguimiento y atención a los medios de impugnación interpuestos a fin de controvertir las resoluciones de esta autoridad, así como el desahogo de requerimientos que la autoridad federal formule a esta instancia.','Las actividades del proyecto se enfocarán a efectuar la recepción y gestión de documentación jurisdiccional, así como  la integración y resguardo de expedientes jurisdiccionales.','2023-10-23','Lcdo. Víctor Adrián Rodríguez Castillo','Subdirector de Oficialía de Partes y Archivo Jurisdiccional','Lcda. Elizabeth Valderrama López','Lcdo. Víctor Adrián Rodríguez Castillo','EL PLENO EN REUNIÓN PRIVADA DEL 1° DE FEBRERO DE 2012','0',NULL,NULL),
	(19,2,25,'05','Sistematización de la Estadística Jurisdiccional','normal',1,'Realizar la recolección de datos a fin de organizar, procesar, sintetizar, analizar y presentar los informes estadísticos de la actividad jurisdiccional que genera el Tribunal.','La elaboración de la información estadística en materia jurisdiccional permite al Pleno del TECDMX y a sus áreas, contar con elementos cuantificables suficientes para emitir decisiones, criterios jurisdiccionales o empleo de precedentes, lo que facilita su labor jurisdiccional, siempre apegado a la normativa electoral vigente.','El proyecto consiste en recopilar, clasificar, cuantificar e integrar la actividad jurisdiccional que realiza el TECDMX, desde contabilizar el número de medios de impugnación o demandas que son recibidas, hasta la relación de sentencias que fueron emitidas por el Pleno del TECDMX y en su caso el seguimiento a la cadena impugnativa de las Salas del Tribunal Electoral del Poder Judicial de la Federación. Establecida la clasificación de la información en distintos rubros, permite el desahogo de las consultas y requerimientos de información formulados por parte del Pleno y las distintas áreas del Tribunal.','2023-10-23','Lcdo Marco Antonio Ambriz Carréon','Subdirector de Jurisprudencia encargo de la Subdirección de Estadística','Lcda Elvira Susana Guevara Ortega','Lcdo Marco Antonio Ambriz Carreón','EL PLENO EN REUNIÓN PRIVADA ','0',NULL,NULL),
	(20,2,7,'02','Diligencias practicadas del Tribunal Electoral de la Ciudad de México','normal',1,'Apoyar al Pleno y al Magistrado Presidente del Tribunal, con acciones de carácter jurídico-administrativo, destacando entre ellas, la recepción de los medios de impugnación que se presenten ante la Oficialía de Partes; su registro en los libros de gobierno respectivos; y turno a las Ponencias de esta Institución para la sustanciación y resolución correspondiente. Asimismo, proveer lo necesario para la celebración de las sesiones y reuniones del Pleno, elaborando las respectivas actas y acuerdos. Supervisar que se hagan en tiempo y forma las notificaciones y finalmente el registro en las tesis relevantes y de jurisprudencia así como la sistematización de datos estadísticos de la actividad jurisdiccional.','Una de las tareas primordiales en el trabajo jurisdiccional y el de carácter administrativo es la práctica de diligencias, ya que en el primer caso, dichas actividades coadyuvan a la sustanciación y resolución de asuntos sometidos al Pleno del TECDMX y, en el segundo, a la resolución de situaciones jurídicas concretas.','Las acciones de este proyecto se orientan a desahogar las diligencias jurisdiccionales ordenadas en aquellas determinaciones procesales, emitidas por el Pleno del Tribunal Electoral de la Ciudad de México,  por su Presidente, o por alguno de los/as Magistrados/as integrantes, relativo al trámite, cumplimiento o ejecución de aquellos actos inherentes a la sustanciación y resolución de los asuntos sometidos a la competencia de este Órgano Jurisdiccional local. Asimismo, se practicarán las diligencias ordenadas por autoridades administrativas, pertenecientes al Tribunal Electoral local, que emiten actos que resuelven situaciones jurídicas concretas en atención a sus respectivas competencias.  Finalmente, y con el objeto de transparentar la actividad jurisdiccional de este Tribunal Electoral local, llevar a cabo el registro en el portal de internet de los acuerdos y/o sentencias dictados por el Pleno, o por algún/a Magistrado/a en lo individual.','2023-10-23','Lcdo. Alfonso Martínez López','Subdirector de la Oficina de Actuarios','Lcda. Elizabeth Valderrama López','Lcdo. Alfonso Martínez López','EL PLENO EN REUNIÓN PRIVADA DEL 1° DE FEBRERO DE 2012','0',NULL,NULL),
	(21,3,23,'01','Sustanciación de los juicios especiales laborales  entre sus trabajadores y el Tribunal Electoral de la Ciudad  de México, derivados de las relaciones de trabajo; y de los juicios de inconformidad administrativa entre el Tribunal y sus servidores, emanados de la determinación de sanciones administrativas.','normal',1,'Garantizar al Tribunal y a las personas servidoras del mismo, que la instrucción de los juicios especiales laborales y las inconformidades administrativas que se susciten entre ellos, se lleven a cabo con estricto apego a la Ley; observando los principios de legalidad, objetividad, imparcialidad, certeza y transparencia.','Garantizar la atención de los juicios especiales laborales y de los de inconformidad administrativa que se susciten entre los trabajadores y el Tribunal Electoral, observando las medidas necesarias para lograr la mayor economía, concentración y sencillez del proceso.\n\n','Conforme lo establece el Código de Instituciones y Procedimientos Electorales de la Ciudad México, esta Comisión tiene a su cargo el conocimiento de los juicios especiales laborales que se susciten entre los trabajadores y el Tribunal Electoral; persiguiendo con ello garantizar la correcta aplicación de la ley, instruyendo los juicios desde la presentación de la demanda, hasta la emisión del proyecto de sentencia; promoviendo, en primer término, la conciliación entre las partes involucradas; así como la sustanciación de los juicios de inconformidad administrativa.\n\nAsimismo, se brindarán servicios de consultoría jurídica en materia laboral y administrativa; y se prevé participar con proyectos de reformas a la normatividad interna, en los casos que se le requiera.','2023-10-23','Lcda. María Dolores Corona López','Secretaria Técnica de la Comisión de Controversias Laborales y Administrativas','Lcda. María Dolores Corona López','Verónica González Pérez','EL PLENO EN REUNIÓN PRIVADA DEL 1° DE FEBRERO DE 2012','0',NULL,NULL),
	(22,7,9,'01','Administración de los Recursos Humanos, Materiales y Financieros','normal',1,'Coordinar la administración de los recursos humanos, materiales y financieros del Tribunal aplicando políticas, normas y procedimientos emitidos; vigilando el manejo del patrimonio y el eficiente uso de los bienes muebles e inmuebles para garantizar el ejercicio adecuado del presupuesto institucional.','Este proyecto es fundamental ya que se requiere efectuar la coordinación de las actividades de las direcciones de Recursos Humanos, Planeación y Recursos Financieros, así como Recursos Materiales y Servicios Generales, que son las encargadas de llevar a cabo la administración de los diversos recursos de este Órgano Jurisdiccional, por lo que, con el proyecto se abocará al manejo del presupuesto, de los bienes y servicios y de los recursos humanos del Tribunal.','Entre las tareas que se ejecutarán, se encuentra coordinar los procesos de planeación, organización, dirección, control y supervisión de los recursos asignados al Tribunal para el desempeño de sus funciones y mantener informado al Pleno. Asimismo, supervisar que las Unidades Responsables del Gasto se apeguen a las normas vigentes en el ejercicio del presupuesto para el cumplimiento de sus metas, utilizando de forma eficiente y eficaz los recursos asignados.','2023-10-23','L.C. Gilberto Flores Gómez','Jefe de Departamento de Control y Seguimiento','Lcdo. Luis Martín Flores Mejía','L.C. Gilberto Gómez Flores','EL PLENO EN REUNIÓN PRIVADA DEL 1° DE FEBRERO DE 2012','0',NULL,NULL),
	(23,13,21,'03','Cumplimiento a las obligaciones del TECDMX en materia de solicitudes de información pública, presentación de informes internos o externos y actualización normativa en la materia.\n','normal',1,'Ejecutar y dar seguimiento a las labores de transparencia y acceso a la información pública, toda vez que estas tareas constituyen un ámbito genérico de difusión de las actividades de este Tribunal, a fin de ponerlas al alcance de la ciudadanía para brindar mayor confianza y credibilidad de la institución.','De conformidad con el artículo 24 fracciones II, X Y XI de la Ley de Transparencia, Acceso a la Información Pública y Rendición de cuentas de la Ciudad de México, el proyecto se orienta a atender y dar seguimiento a las solicitudes que se reciban en la Coordinación de Transparencia y Datos Personales, a través de la Unidad de Transparencia (UT), a los recursos de revisión que sean presentados, así como a proporcionar la información que le sea requerida.\nSu principal objetivo es dar respuesta a los requerimientos de información de la ciudadanía mediante procedimientos sencillos, expeditos y gratuitos. Por otro lado, en observancia a lo establecido en los artículos 181 fracción X y 207 fracción V del Código de Instituciones y Procedimientos Electorales de la Ciudad de México, así como numerales 4.1.7., 4.1.10. 5.1.15, 5.2.14, 5.2.15 y 5.2.16. la CTyDP proporcionará los informes que le sean requeridos.','El proyecto permitirá dar cumplimiento a la Ley de Transparencia, Acceso a la Información Pública y Rendición de Cuentas de la Ciudad de México, mediante la atención de los requerimientos de la ciudadanía en tiempo y forma y bajo el principio de máxima publicidad de los actos, el seguimiento a los recursos de revisión que de ellos deriven, así como al suministro de información para la generación de informes en la materia.','2023-10-23','Lcdo. Ricardo Zozaya González','Subdirector de Transparencia y Acceso a la Información Pública','Mtra. Haydeé María Cruz González.','Lcda. Karla Olivia Flores Cortés','Mtra. Haydeé María Cruz González','0',NULL,NULL),
	(24,13,21,'02','Protección de Datos Personales: atención y seguimiento de solicitudes de acceso, rectificación, cancelación, oposición y portabilidad (ARCOP) de Datos Personales; atención a recursos de revisión en la materia e identificación, registro, control y atención a incidencias de los sistemas de Datos Personales del Tribunal.','normal',1,'Proteger los datos personales que obran en los archivos institucionales, derivado del ejercicio de atribuciones y las actividades de este Tribunal; atender las solicitudes ARCOP que reciba el Tribunal, los recursos de revisión interpuestos con motivo de las respuestas a ellas otorgadas;así como brindar capacitación en materia de transparencia, acceso a la información pública, protección de datos personales y estado abierto, a personas servidoras públicas del Tribunal y público en general.','La protección de los datos personales implica atender oportunamente las solicitudes de Acceso, Rectificación, Cancelación, Oposición y Portabilidad de datos personales que se reciben en la Unidad de Transparencia. Del mismo modo, los datos personales que posee este Órgano Jurisdiccional deben registrarse en los sistemas que correspondan con la finalidad de implementar las medidas de seguridad necesarias para la custodia, tratamiento y atención de contingencias. Lo anterior, en términos de lo dispuesto en el artículo 23 de la Ley de Protección de Datos Personales en Posesión de Sujetos Obligados de la Ciudad de México, así como la norma interna aplicable del Tribunal.','Garantizar la protección de los datos personales que obran en los archivos institucionales, derivado del ejercicio de atribuciones y las actividades que realiza este Tribunal, así como el ejercicio de los derechos ARCOP, otorgando atención a los recursos de revisión que resulten de la respuesta otorgada a esas solicitudes y promover capacitaciones en materia de transparencia, acceso a la información pública, protección de datos personales y estado abierto, dirigidas a las personas servidoras públicas del mismo y a público en general.','2023-10-23','Lcdo. Ricardo Zozaya González','Subdirector de Transparencia y Acceso a la Información Pública','Mtra. Haydeé María Cruz González','Mtra. Haydeé María Cruz González','Mtra. Haydeé María Cruz González','0',NULL,NULL),
	(25,11,24,'01','Continuidad y mantenimiento de servicios informáticos','normal',1,'La Unidad de Servicios Informáticos, es el área que dirige la actividad informática del Tribunal Electoral de la Ciudad de México que, bajo la jerarquía del Pleno y su Presidente/a, tiene a su cargo el manejo eficaz y eficiente de los servicios y asuntos relacionados con la informática del órgano autónomo. Uno de los principales objetivos es apoyar al desarrollo informático dentro del Tribunal, mediante una contribución profesional y de alto nivel que garantice la continuidad de los servicios electrónicos existentes; así como organizar y fortalecer el rumbo informático para producir e implementar las herramientas relevantes y útiles que los usuarios de los órganos y áreas requieren para el desempeño de las funciones que tienen asignadas. Para responder al objetivo previamente indicado, la Unidad de Servicios Informáticos, apoya y desarrolla varias líneas básicas de actividades: desarrollo de sistemas, asesoría y capacitación especializada, administración de servicios (correo electrónico, Internet/Intranet, Telefonía y Red de Datos) y difusión de información relevante a través de Internet e Intranet, así como fortalecer la infraestructura informática e implementar los nuevos proyectos que surjan en  los órganos y áreas del Tribunal.Es decir, implementar las bases tecnológicas, para la estandarización de la infraestructura de cómputo, que permitan dirigir el rumbo informático a corto, mediano y largo plazo del Tribunal, haciendo uso de las mejores prácticas de tecnologías de la información y comunicaciones, aplicadas al ámbito jurídico-electoral y administrativo.','Mantener en un alto nivel de disponibilidad los servicios informáticos, apegado a normas internacionales, para que contribuyan al cumplimiento de la misión y visión establecidos en el marco normativo.','Mantener la operación optima de los servicios Informáticos, así como proveer los recursos tecnológicos necesarios para el desempeño de las funciones de las personas usuarias, mejorar el conocimiento acerca de las herramientas informáticas y promover el uso apropiado de los servicios y recursos de TI, tales como: Servicio de Internet, Servicio de telefonía institucional, servicio de red de datos local, servicio de impresión, servicio de unidades de red compartidas, servicio de correo electrónico y herramientas ofimáticas.','2023-10-23','Ing. Isaí Fararoni Ramírez','Subdirector de Servicios Informáticos','Lcdo. Otilio Esteban Hernández Pérez','Ing. Isaí Fararoni Ramírez','Lcdo. Otilio Esteban Hernández Pérez','0',NULL,NULL),
	(26,12,24,'01','Identificación, sistematización y mejora de procesos jurídicos, administrativos y de apoyo.','normal',1,'La Unidad de Servicios Informáticos, es el área que dirige la actividad informática del Tribunal Electoral de la Ciudad de México que, bajo la jerarquía del Pleno y su Presidente/a, tiene a su cargo el manejo eficaz y eficiente de los servicios y asuntos relacionados con la informática del órgano jurisdiccional.Uno de los principales objetivos es apoyar al desarrollo informático dentro del Tribunal, mediante una contribución profesional y de alto nivel que garantice la continuidad de los servicios electrónicos existentes; así como organizar y fortalecer el rumbo informático para producir e implementar las herramientas relevantes y útiles que los usuarios de los órganos y áreas requieren para el desempeño de las funciones que tienen asignadas. Para responder al objetivo previamente indicado, la Unidad de Servicios Informáticos, apoya y desarrolla varias líneas básicas de actividades: desarrollo de sistemas, asesoría y capacitación especializada, administración de servicios (correo electrónico, Internet/Intranet, Telefonía y Red de Datos) y difusión de información relevante a través de Internet e Intranet, así como fortalecer la infraestructura informática e implementar los nuevos proyectos que surjan en  los órganos y áreas del Tribunal.Es decir, implementar las bases tecnológicas, para la estandarización de la infraestructura de cómputo, que permitan dirigir el rumbo informático a corto, mediano y largo plazo del Tribunal, haciendo uso de las mejores prácticas de tecnologías de la información y comunicaciones, aplicadas al ámbito jurídico-electoral y administrativo.','Desarrollar, mantener y actualizar los diferentes sistemas de información  y/o módulos correspondientes a la operación de las actividades sustantivas de las áreas del Tribunal.','Verificar y garantizar que los programas informáticos, operen de manera correcta y óptima, actualizando las funciones de los módulos de acuerdo con los requerimientos que, en su caso, soliciten las áreas o puntos de mejora que eficienten su funcionamiento.','2023-10-23','Ing. Isaí Fararoni Ramírez','Subdirector de Servicios Informáticos','Lcdo. Otilio Esteban Hernández Pérez','Ing. Isaí Fararoni Ramírez','Lcdo. Otilio Esteban Hernández Pérez','0',NULL,NULL),
	(27,17,14,'03','Acompañamiento en el cumplimiento de las obligaciones del TECDMX y de las personas servidoras públicas que en él laboran','normal',1,'Fiscalizar el manejo, custodia y aplicación de los recursos del Tribunal Electoral, así como instruir los procedimientos y, en su caso, aplicar las sanciones establecidas en la Ley de Responsabilidades Administrativas de la Ciudad de México, conforme al artículo 202, fracciones VI, VIII, XIII, XIV y XVII del Código de Instituciones y Procedimientos Electorales de la Ciudad de México.','Ante la necesidad de administrar los riesgos del Tribunal Electoral, la Contraloría realiza diversas actividades de carácter preventivo para coadyuvar al mejor uso de los recursos públicos que emplea el Tribunal. ','Acompañar a las áreas que conforman el TECDMX, así como a las personas servidoras públicas que en él laboran, en el cumplimiento de sus obligaciones.','2023-10-23','Lcdo. José de Jesús Ruíz Gallegos','Jefe de Departamento de Responsabilidades','Mtra. Agar Leslie Serrano Álvarez, Encargada de Despacho de la Contraloría Interna','Lcdo. José de Jesús Ruíz Gallegos','EL PLENO EN REUNIÓN PRIVADA DEL 1° FEBRERO DE 2012','0',NULL,NULL),
	(28,18,22,'01','Capacitación Formativa','normal',1,'El Instituto de Formación y Capacitación tienen a su cargo la planeación, organización y ejecución de todo tipo de actividades académicas y de investigación sobre derecho electoral, sobre su rama procesal, disciplinas afines y cualquier otra que resulte necesaria para el buen funcionamiento del Tribunal.','Las actividades del Instituto de Formación y Capacitación tienen por objeto desarrollar la formación profesional del personal del Tribunal, así como contribuir a la creación y desarrollo de la cultura de la democracia y legalidad para la ciudadanía. En este contexto, las metas planteadas en el POA 2024, responden a la detección de necesidades identificadas a partir de un proceso estructurado con metas bien definidas para alcanzar el objetivo, misión y visión que dan sustento al actuar institucional, así como al desarrollo integral y mejoramiento de la calidad de vida de quienes con su trabajo cotidiano contribuyen al quehacer de este Órgano Jurisdiccional.\n','El Programa Operativo Anual 2024, esta sustentado en la metodología aplicada, conforme a lo establecido en los lineamientos en materia de capacitación, denominada DNC-01 y DNC-02; asimismo prevé las acciones correspondientes a la formación en ciudadanía y cultura democrática. Este programa considera actividades de capacitación y eventos dirigidos a las personas servidoras públicas que colaboran en este Órgano Colegido en materia de Derecho Electoral, disciplinas afines y cualquier otra que resulte necesaria para alcanzar la meta institucional; así como a la ciudadanía en educación cívica.','2023-10-23','Lcda. Anabell Arellano Mendoza','Directora del Instituto de Formación y Capacitación','Lcda. Anabell Arellano Mendoza','Lcda. Anabell Arellano Mendoza','EL PLENO EN REUNIÓN PRIVADA DEL 1° FEBRERO DE 2012','0',NULL,NULL),
	(29,10,24,'01','Infraestructura tecnológica en alta disponibilidad, arquitectura web y servicios en la nube','normal',1,'La Unidad de Servicios Informáticos, es el área que dirige la actividad informática del Tribunal Electoral de la Ciudad de México que, bajo la jerarquía del Pleno y su Presidente/a, tiene a su cargo el manejo eficaz y eficiente de los servicios y asuntos relacionados con la informática de la institución.Uno de los principales objetivos es apoyar al desarrollo informático dentro del Tribunal, mediante una contribución profesional y de alto nivel que garantice la continuidad de los servicios electrónicos existentes; así como organizar y fortalecer el rumbo informático para producir e implementar las herramientas relevantes y útiles que los usuarios de los órganos y áreas requieren para el desempeño de las funciones que tienen asignadas. Para responder al objetivo previamente indicado, la Unidad de Servicios Informáticos, apoya y desarrolla varias líneas básicas de actividades: desarrollo de sistemas, asesoría y capacitación especializada, administración de servicios (correo electrónico, Internet/Intranet, Telefonía y Red de Datos) y difusión de información relevante a través de Internet e Intranet, así como fortalecer la infraestructura informática e implementar los nuevos proyectos que surjan en  los órganos y áreas del Tribunal.Es decir, implementar las bases tecnológicas, para la estandarización de la infraestructura de cómputo, que permitan dirigir el rumbo informático a corto, mediano y largo plazo del Tribunal, haciendo uso de las mejores prácticas de tecnologías de la información y comunicaciones, aplicadas al ámbito jurídico-electoral y administrativo.','Fortalecer y mantener el uso eficiente de la infraestructura tecnológica que se utiliza para proporcionar los servicios informáticos al personal del Tribunal, con la finalidad de elevar su calidad, nivel de disponibilidad y seguridad, minimizando la ocurrencia de incidentes que puedan generar riesgos para la operación de las funciones de este Tribunal.','Actualizar la arquitectura tecnológica de infraestructura, adoptar mejores prácticas y estándares de desarrollo de sistemas, elevar el nivel de disponibilidad y seguridad de la información institucional mediante la migración de portales y sistemas a la nube. Gestionar los servicios informáticos implementando mejores prácticas alineado a estándares internacionales.','2023-10-23','Ing. Isaí Fararoni Ramírez','Subdirector de Servicios Informáticos','Lcdo. Otilio Esteban Hernández Pérez','Ing. Isaí Fararoni Ramírez','Lcdo. Otilio Esteban Hernández Pérez','0',NULL,NULL),
	(30,9,18,'01','Atención de asuntos normativos y apoyo jurídico.','normal',1,'Apoyar a la o el Presidente en la representación legal del Tribunal ante las autoridades administrativas y judiciales, ya sean locales o federales, así como atender los asuntos de este órgano colegiado en materia contenciosa, consultiva, contractual y normativa.','Elaborar, revisar y proponer la actualización del marco normativo interno del Tribunal que regula su estructura, organización y funcionamiento, con el fin de cumplir con los objetivos institucionales (visión y misión) de este órgano jurisdiccional; así como coadyuvar con los órganos y áreas, que así lo requieran, conforme a las atribuciones de la Dirección General Jurídica.','Elaboración, análisis y/o revisión de proyectos de normativa interna del Tribunal; así como el desarrollo de tareas jurídicas como asesorías, consultas, opiniones, estudios, asistencia a reuniones y cualquier otra que marque la normativa aplicable, a petición de los órganos y áreas del órgano jurisdiccional.','2023-10-23','Lcda. Talina Castillo Solano ','Subdirectora de Contratos y Normativa','Lic. Eber Dario Comonfort Palacios','Lcda. Talina Castillo Solano ','EL PLENO EN REUNIÓN PRIVADA','0',NULL,NULL),
	(31,7,11,'03','Operación y control de pago de nóminas, prestaciones y enteros institucionales','normal',1,'Coordinar la administración de los recursos humanos, materiales y financieros del Tribunal aplicando políticas, normas y procedimientos emitidos; vigilando el manejo del patrimonio y el eficiente uso de los bienes muebles e inmuebles para garantizar el ejercicio adecuado del presupuesto institucional.','Una de las responsabilidades de mayor trascendencia en materia de Recursos Humanos dentro de este Tribunal es la integración, cálculo y pago de nóminas, ya sean ordinarias o extraordinarias. Adicionalmente, es importante señalar que aunado al pago de los emolumentos a las personas servidoras públicas, el cálculo y trámite para pago de nóminas, implica el cálculo de las aportaciones de seguridad social, impuestos y las prestaciones a que se tiene derecho conforme a la normatividad aplicable. Finalmente, es necesaria la formalización de las actividades realizadas por el área las cuales deben plasmarse a través de diferentes procedimientos y mecanismos de control.','El ejercicio de las actividades bajo la responsabilidad de la Dirección de Recursos Humanos contribuye a que la Secretaría Administrativa cumpla con las atribuciones que le confieren el Código de Instituciones y Procedimientos Electorales de la Ciudad de México y el Reglamento Interior del Tribunal Electoral de la Ciudad de México, en materia de remuneraciones y prestaciones al personal del Tribunal y el cálculo de obligaciones de seguridad social e impuestos. Asimismo, con el objeto de regular la operación del área de Recursos Humanos, ésta se dará a la tarea de elaborar y actualizar sus procedimientos.','2023-10-23','Lcdo. Miguel Angel Santos Morales','Director de Recursos Humanos','Lcdo. Luis Martín Flores Mejía','Lcdo. Miguel Angel Santos Morales','','abierto',NULL,NULL),
	(32,8,18,'03','Convenios interinstitucionales.','normal',1,'Apoyar a la o el Presidente en la representación legal del Tribunal ante las autoridades administrativas y judiciales, ya sean locales o federales, así como atender los asuntos de este órgano colegiado en materia contenciosa, consultiva, contractual y normativa.','El proyecto se requiere para supervisar la elaboración y/o verificación del contenido jurídico de los convenios interinstitucionales en los que el Tribunal sea parte.','Elaborar, revisar, validar y brindar asesoría para la celebración de los convenios de apoyo y colaboración interinstitucional que soliciten los órganos y áreas del Tribunal en ejercicio de sus atribuciones.','2023-10-23','Lcda. Talina Castillo Solano ','Subdirectora de Contratos y Normativa','Lic. Eber Dario Comonfort Palacios','Lcda. Talina Castillo Solano ','EL PLENO EN REUNIÓN PRIVADA ','abierto',NULL,NULL),
	(33,13,21,'01','Gestión de sesiones del Comité de Transparencia, de participación en eventos ciudadanos y de actualización de Obligaciones de Transparencia en SIPOT y Portal de Transparencia','normal',1,'Gestionar la celebración de sesiones del Comité de Transparencia, registrar la participación de la CTyDP en eventos ciudadanos, así como requerir, coordinar y verificar la actualización oportuna de las obligaciones de Transparencia en el sitio de internet del Tribunal (Portal de Transparencia) y en la Plataforma Nacional de Transparencia.','La Ley de Transparencia, Acceso a la Información Pública y Rendición de Cuentas de la Ciudad de México, establece en el artículo 88, la obligación de contar con un Comité de Transparencia que confirme, modifique y/o revoque la información que se le proponga reservar, clasificar y/o declarar inexistente; de igual manera,  el artículo 93 fracción XIII, faculta a la Unidad de Transparencia adscrita a la CTyDP, a fomentar la cultura de la transparencia, de ahí la pertinencia de su participación en eventos ciudadanos que promuevan los derechos de acceso a la información pública y protección de datos personales, finalmente, el artículo 121 de la citada Ley, obliga a este Tribunal en cuanto Sujeto Obligado, a publicar en el Portal de Transparencia y en la Plataforma Nacional de Transparencia la información que genere, derivado del ejercicio de sus atribuciones, conforme a los formatos y temporalidad establecidos.','Se efectuarán las gestiones necesarias para la celebración de las sesiones del Comité de Transparencia; se promoverá la cultura de la transparencia y la labor del Tribunal Electoral a través de la participación en eventos ciudadanos a los que sea convocada y autorizada a participar la CTyDP; se actualizará permanentemente en el Portal de Transparencia del Tribunal y en la Plataforma Nacional de Transparencia, la información pública de oficio generada por las unidades administrativas y áreas de éste Órgano Jurisdiccional, con la finalidad de cumplir con el calendario de actualización de la información de carácter público en los periodos establecidos por la Ley de la materia. ','2023-10-23','Lcdo. Ricardo Zozaya González','Subdirector de Transparencia y Acceso a la Información Pública','Mtra. Haydeé María Cruz González','Lcdo. Ricardo Zozaya González','Mtra. Haydeé María Cruz González','abierto',NULL,NULL),
	(34,14,27,'02','Seguimiento y Control del Programa Anual de Desarrollo Archivístico del Tribunal Electoral de la Ciudad de México','normal',1,'Coordinar la integración y la administración de los archivos que conforman el acervo documental del Tribunal Electoral de la Ciudad de México, así como, establecer las bases para el funcionamiento y composición del Sistema Institucional de Archivos conforme a la Ley y a las directrices que emita la autoridad de la materia.','Con el objetivo de salvaguardar la información documental, garantizar el derecho a la verdad, el acceso a la información pública y la protección de los datos personales que obren en poder del Tribunal Electoral de la Ciudad de México, es necesario establecer mecanismos archivísticos para la adecuada conservación y organización de la información de conformidad con las disposiciones normativas vigentes.','Dentro de las obligaciones establecidas en la Constitución Política de la Ciudad de México, la Ley General de Archivos y Ley de Archivos de la Ciudad de México (LACDMX), se encuentra la de contar con mecanismos archivísticos expeditos que permitan la correcta organización y conservación de la información documental para preservar el acervo y proporcionar un eficiente acceso a la información pública en poder del Tribunal. Esto en el marco del Programa Anual de Desarrollo Archivístico 2024, obligación que de conformidad con los artículos 12, 28, 29 y 30 de la LACDMX, contempla realizar diversos proyectos y acciones en materia de normatividad, tecnologías de la información, capacitación, difusión archivística, conservación y prevención documental. En estas acciones están involucradas todas las unidades administrativas del Tribunal.','2023-10-23','Lcdo. Vicente Bonilla Hernandez','Subdirector de Archivos y Documentación','Lcda. Sabina Reyna Fregoso Reyes ','Lcdo. Vicente Bonilla Hernandez','EL PLENO EN REUNIÓN PRIVADA DEL 1° FEBRERO DE 2012','0',NULL,NULL),
	(35,19,26,'02','Elaboración de Obras  colectivas','normal',1,'Contribuir al desarrollo de la cultura democrática en la Ciudad de México','De conformidad con el artículo 214 del Código de Instituciones y Procedimientos Electorales de la Ciudad de México, la Coordinación de Difusión y Publicación tiene entre sus atribuciones programar y coordinar la edición de publicaciones que recibe el Tribunal.  ','Publicar trabajos que contribuyan al desarrollo de la cultura democrática en la Ciudad de México; divulgar temas relativos al quehacer institucional y que aporten a la comprensión de los dilemas, retos y oportunidades de los derechos político-electorales de la ciudadanía.','2023-10-23','Miguel Ángel Quiroz Velázquez','Coordinador de Difusión y Publicación','Miguel Ángel Quiroz Velázquez','Miguel Ángel Quiroz Velázquez','EL PLENO EN REUNIÓN PRIVADA DEL 1° FEBRERO DE 2012','0',NULL,NULL),
	(36,6,26,'02','Servicios de Préstamo de material bibliográfico','normal',1,'Contribuir a la creación y difusión de la cultura de la democracia y legalidad para los habitantes de la Ciudad de México.','Es de primordial importancia proveer al personal del Tribunal, de información doctrinal actualizada, que se desprende del acervo bibliohemerográfico de la Biblioteca. Dada la demanda del servicio de consulta y préstamo bibliotecario por parte de las/os usuarias/os del Tribunal y de la población en general, es necesario automatizar el servicio para elevar su calidad; coadyuvar en paralelo a un mejor control del acervo biblio-hemerográfico con el que cuenta el Órgano Jurisdiccional; y, facilitar la consulta y búsqueda de material a las personas usuarias/os, a través del manejo de unidades remotas.','Brindar el servicio de consulta de material bibliográfico a todas las personas servidoras públicas del Tribunal y público en general. Del mismo modo, facilitar la ubicación de títulos tanto en el acervo propio como en el de aquellas bibliotecas con las que se tenga convenio interbibliotecario.\n\nTambién se efectuarán actividades para conformar, organizar, administrar y resguardar el acervo bibliográfico de la Biblioteca, a fin de satisfacer las necesidades de información y brindar un servicio de calidad al personal de este órgano autónomo y población en general. En particular, se continuará con la organización automatizada del acervo bibliográfico de la Biblioteca para un mejor control.','2022-10-23','Miguel Ángel Quiroz Velázquez','Coordinador de Difusión y Publicación','Miguel Ángel Quiroz Velázquez','Miguel Ángel Quiroz Velázquez','EL PLENO EN REUNIÓN PRIVADA DEL 1° DE FEBRERO DE 2012','0',NULL,NULL),
	(37,4,28,'04','Cultura Democrática Derechos Humanos y Género','normal',1,'Coordinar con enfoque de transversalidad la política institucional del Tribunal Electoral de la Ciudad de México en materia de derechos humanos, igualdad sustantiva y laboral, perspectiva de género, inclusión y no discriminación y, protección de población de atención prioritaria, para la promoción, garantía, respeto, protección, defensa y progresividad de los derechos político-electorales en el marco del sistema constitucional, convencional y legal aplicable de derechos humanos.','Contribuir a fortalecer la integridad institucional en el cumplimiento de su función constitucional, promover la construcción de ciudadanía, impulsar la cultura democrática y, dar atención a las directrices que para el efecto emita el Pleno, la Presidencia del Tribunal, las que surjan de la actividad del Comité de Género y Derechos Humanos y/o del Grupo de Igualdad Laboral y No Discriminación, así como, de las atribuciones que son propias de la Coordinación, atendiendo el mandato constitucional de garantizar los derechos humanos y promover la igualdad sustantiva en la judicatura electoral local.','Promover y sistematizar con transversalidad el  enfoque de derechos humanos y género en la función jurisdiccional y administrativa del Tribunal, mediante el diseño, desarrollo y seguimiento de propuestas, acciones, políticas, estrategias, sinergias interinstitucionales, mecanismos normativos, procedimentales y organizacionales y buenas prácticas dirigidas a la ciudadanía y a las personas servidoras públicas del Tribunal con enfoque de progresividad, inclusión, no discriminación  e interculturalidad.','2023-10-23','Lcdo. Juan Antonio Mejía Ortiz','Subdirector de Género y Derechos Humanos','Mtra. Norma Elena Flores García','Lcdo. Juan Antonio Mejía Ortiz','EL PLENO EN REUNIÓN PRIVADA DEL 28 DE MARZO DE 2017','0',NULL,NULL),
	(38,4,20,'02','Posicionamiento de la imagen institucional y Cultura Democrática en la Ciudad de México. ','normal',1,'Propiciar el fortalecimiento y la consolidación de la imagen institucional del Tribunal Electoral de la Ciudad de México ante la ciudadanía en general, mediante la comunicación de información relevante sobre sus acciones y logros alcanzados. Diseñar, establecer y fortalecer  una relación permanente, transparente y respetuosa con los medios de comunicación, a fin de difundir una imagen positiva de la institución y resaltar la importancia de la labor que ésta desempeña en la construcción y consolidación del sistema democrático de la Ciudad de México.','Se requiere la ejecución del proyecto para cumplir con lo contenido en el artículo 71 del Reglamento Interior del Tribunal Electoral de la Ciudad de México, por medio del posicionamiento de la imagen y el quehacer del Tribunal en la agenda democrática de la Ciudad.','La ejecución del proyecto busca posicionar la imagen y quehacer del Tribunal por medio de las relaciones públicas y a través de las distintas rutas informativas: reuniones con medios de comunicación, gestión de entrevistas a las Magistradas, los Magistrados y las personas servidoras públicas del órgano jurisdiccional, así como la difusión de campañas en diferentes medios.\nCabe señalar que la intervención de las diferentes áreas que integran a este órgano jurisdiccional es sustantiva, ya  que proporciona el insumo informativo para su adecuada y oportuna promoción.','2023-10-31','Lic. Jorge Alberto Díaz Stringel','Subdirector de Comunicación Social','Mtro. Orlando Anaya González','Mtro. Orlando Anaya González','EL PLENO EN REUNIÓN PRIVADA DEL 28 DE MARZO DE 2017 ','0',NULL,NULL),
	(39,4,20,'01','Comunicación e Información institucional.','normal',1,'Contribuir con el propósito de fortalecer y consolidar la imagen y  presencia del Tribunal ante medios de comunicación y la ciudadanía; mediante el desarrollo, cumplimiento y evaluación de las estrategias de comunicación social y relaciones públicas que se diseñen con tales propósitos. Así mismo, fortalecer las relaciones con los diferentes organismos representativos de los sectores público y privado vinculados con el quehacer institucional del Tribunal Electoral de la Ciudad de México. Diseñar, establecer y fortalecer una relación permanente, transparente y respetuosa con los medios de comunicación a fin de transmitir una imagen positiva de la institución y resaltar la importancia de la labor que ésta desempeña en la construcción y consolidación del sistema democrático de la Ciudad de México.','El proyecto se requiere para fortalecer la imagen institucional mediante la comunicación de información relevante sobre sus acciones y logros alcanzados dirigidos a los habitantes de la Ciudad de México que permitan dar a conocer las actividades que realiza el Tribunal.','Adicionalmente, el proyecto considera definir las estrategias de información que logren una comunicación adecuada de la imagen y el quehacer del Tribunal para los diferentes medios de comunicación y público objetivo; generar líneas discursivas y contenidos enfocados a los medios de comunicación masivos tanto impresos, electrónicos y digitales; así como coordinar la producción de los materiales comunicacionales derivados de dichos contenidos; generar y/o coordinar la producción de materiales fotográficos, audiovisuales y de redes sociales y medios autogenerados; prestar servicios de logística y cobertura de eventos en el ámbito periodístico para la generación de contenidos en texto, audio o video, que documenten la vida institucional al exterior.\n\nNota: La programación de las metas de estas actividades están sujetas a la demanda de las diversas áreas incluida la propia Coordinación, así como a la suficiencia presupuestal correspondiente.','2023-10-31','Lic. Jorge Alberto Díaz Stringel','Subdirector de Comunicación Social','Mtro. Orlando Anaya González','Mtro. Orlando Anaya González','EL PLENO EN REUNIÓN PRIVADA DEL 28 DE MARZO DE 2017 ','0',NULL,NULL),
	(40,4,26,'03','Fortalecimiento de la Imagen Institucional en la Ciudad de México.','normal',1,'Propiciar el fortalecimiento y la consolidación de la imagen institucional de este Tribunal Electoral ante la ciudadanía en general, mediante la difusión de información relevante sobre sus acciones y logros alcanzados. A nivel interno, promover las acciones de comunicación organizacional que propicien la integración y el conocimiento pleno de los propósitos y estrategias de la Institución con los órganos y áreas que lo conforman.','El proyecto se requiere para fortalecer la imagen institucional a través del diseño, diagramación y elaboración de materiales impresos y/o digitales dirigidos a los habitantes de la Ciudad de México y/o a las personas servidoras públicas del TECDMX,  que permitan dar a conocer las actividades que realiza el Tribunal.','A través del proyecto se programarán y supervisarán actividades encaminadas al fortalecimiento y posicionamiento de la Imagen Institucional, ante la sociedad en general, las instituciones y el personal del Tribunal, por medio del diseño, elaboración y distribución de diversos materiales.\nLa ejecución del proyecto busca posicionar la imagen y quehacer del Tribunal Electoral de la Ciudad de México también a través de la contratación y de supervisar la  producción de spots para su transmisión en tiempos oficiales de radio y televisión.\nAdicionalmente, el proyecto considera la actualización de los sitios institucionales. \nCabe señalar que la intervención de las diferentes áreas que integran este órgano jurisdiccional es sustantiva, ya que proporciona el insumo informativo para su adecuada y oportuna difusión.\n\nNota: La programación de las metas de estas actividades están sujetas a la demanda de las diversas áreas incluida la propia Coordinación, así como a la suficiencia presupuestal correspondiente.','2023-10-23','Miguel Ángel Quiroz Velázquez','Coordinador de Difusión y Publicación','Miguel Ángel Quiroz Velázquez','Miguel Ángel Quiroz Velázquez','EL PLENO EN REUNIÓN PRIVADA DEL 28 DE MARZO DE 2017 ','0',NULL,NULL),
	(41,10,24,'02','Gestión de los servicios informáticos de infraestructura, desarrollo y portales.','normal',1,'La Unidad de Servicios Informáticos, es el área que dirige la actividad informática del Tribunal Electoral de la Ciudad de México que, bajo la jerarquía del Pleno y su Presidente/a, tiene a su cargo el manejo eficaz y eficiente de los servicios y asuntos relacionados con la informática de la institución.Uno de los principales objetivos es apoyar al desarrollo informático dentro del Tribunal, mediante una contribución profesional y de alto nivel que garantice la continuidad de los servicios electrónicos existentes; así como organizar y fortalecer el rumbo informático para producir e implementar las herramientas relevantes y útiles que los usuarios de los órganos y áreas requieren para el desempeño de las funciones que tienen asignadas. Para responder al objetivo previamente indicado, la Unidad de Servicios Informáticos, apoya y desarrolla varias líneas básicas de actividades: desarrollo de sistemas, asesoría y capacitación especializada, administración de servicios (correo electrónico, Internet/Intranet, Telefonía y Red de Datos) y difusión de información relevante a través de Internet e Intranet, así como fortalecer la infraestructura informática e implementar los nuevos proyectos que surjan en los órganos y áreas del Tribunal.Es decir, implementar las bases tecnológicas, para la estandarización de la infraestructura de cómputo, que permitan dirigir el rumbo informático a corto, mediano y largo plazo del Tribunal, haciendo uso de las mejores prácticas de tecnologías de la información y comunicaciones, aplicadas al ámbito jurídico-electoral y administrativo.','Desarrollar e implementar un esquema de seguridad en los servicios informáticos del Tribunal ,alineado a estándares internacionales con la finalidad de resguardar y proteger la información buscando mantener la confidencialidad, la disponibilidad e integridad de los  datos.','Aplicar un plan de mantenimiento preventivo y correctivo que evite o minimice las posibles fallas a los diversos elementos que conforman la infraestructura tecnológica del Tribunal, como son; Centro de Datos, Infraestructura de comunicaciones de la red local y de Internet, Infraestructura de equipo de cómputo, infraestructura de respaldo de información e infraestructura de virtualización. Mantener un monitoreo proactivo de la infraestructura, así como, implementar un esquema de seguridad para la protección y continuidad de los servicios informáticos.','2023-10-23','Ing. Isaí Fararoni Ramírez','Subdirector de Servicios Informáticos','Lcdo. Otilio Esteban Hernández Pérez','Ing. Isaí Fararoni Ramírez','Lcdo. Otilio Esteban Hernández Pérez','abierto',NULL,NULL),
	(42,1,29,'03','Proporcionar a la ciudadanía de manera gratuita servicios de asesoría y defensa en los procesos de participación ciudadana y democráticos, en los mecanismos de democracia directa, así como en los instrumentos de democracia participativa.\nGarantizar los derechos político-electorales de la ciudadanía que habita la Ciudad de México, sin menoscabo de su sexo, afiliación partidista, condición social, discapacidad, origen étnico, religión, opiniones o preferencias sexuales.','normal',1,'Brindar acceso a las personas habitantes, ciudadanía, organizaciones y órganos de representación ciudadana electos en las colonias, barrios y pueblos originarios, así como de las comunidades indígenas residentes de la Ciudad de México, una correcta promoción, protección, respeto y garantía de sus derechos político - electorales.','Dar cumplimiento a lo establecido en el artículo 192 del Código de Instituciones y Procedimientos Electorales de la Ciudad de México y a los artículos 55 al 57 del Reglamento Interior del Tribunal Electoral de la Ciudad de México.','La Defensoría como parte de éste órgano jurisdiccional coadyuvará en la promoción, protección, respeto y garantía de los derechos político-electorales de la ciudadanía que habita la Ciudad de México, sin menoscabo de su sexo, afiliación partidista, condición social, discapacidad, origen étnico, religión, opiniones o preferencias sexuales, en todos los procesos de participación ciudadana y democráticos, en los mecanismos de democracia directa y en los instrumentos de democracia participativa.','2023-10-23','Mtra. Sandra Araceli Vivanco Morales','Titular de la Defensoría Pública de Participación Ciudadana y Procesos Democráticos','Mtra. Sandra Araceli Vivanco Morales','Titular de la Defensoría Pública de Participación Ciudadana y Procesos Democráticos','Mtra. Sandra Araceli Vivanco Morales','abierto',NULL,NULL),
	(43,5,30,'02','Vinculación y Convenios con Organismos Nacionales e Internacionales ','normal',1,'Establecer mecanismos y procedimientos para la vinculación con organismos electorales nacionales e internaciones, y/o instituciones u organizaciones interesadas en la materia electoral, o especializadas  en diversas materias  que sean  de interés institucional, que  permitan captar propuestas y experiencias que fortalezcan el ámbito electoral local.','Interactuar con organismos electorales nacionales e internacionales, a fin de intercambiar experiencias y propuestas que permitan fortalecer el ámbito electoral local, asi como para dar cumplimiento a lo establecido en los artículos 217 del Código de Instituciones y Procedimientos Electorales y al 72 del Reglamento Interior del Tribunal Electoral de la Ciudad de México.','Establecer mecanismos y procedimientos para que las experiencias y propuestas recibidas de otros organismos electorales del país o internacionales, se promuevan entre las diversas áreas y los colaboradores de este Tribunal para su fortalecimiento y mejor desempeño en  sus funciones.','2022-10-23','Lcdo. Christian Alberto Ruiz Sánchez','Director de Vinculación y Enlace','','Lcdo. Christian Alberto Ruiz Sánchez','','abierto',NULL,NULL),
	(44,1,31,'04','Estudio y análisis de los procedimientos sancionadores remitidos por el Instituto Electoral de la Ciudad de México.','normal',1,'Realizar el estudio y análisis de los procedimientos sancionadores que sean remitidos por el Instituto Electoral de la Ciudad de México, así como instruir y resolver los medios de impugnación que se promuevan en contra de las resoluciones emitidas por el Instituto en comento en los procedimientos ordinarios que se instauren por las faltas cometidas dentro o fuera de los procesos electorales.','Estudiar y analizar los procedimientos sancionadores que sean remitidos por el Instituto Electoral de la Ciudad de México para la elaboración de los proyectos de resolución de los procedimientos especiales y ordinarios sancionadores que remita dicho Instituto, así como los medios de impugnación que se presenten en contra de estos últimos para su instrucción y propuesta al Pleno. \n\nA fin de dar cumplimiento a lo establecido en los artículos 223 a 226 del Código de Instituciones y Procedimientos Electorales de la Ciudad de México y el 79 del Reglamento Interior del Tribunal Electoral de la Ciudad de México.','Instruir y proponer al Pleno los proyectos de resolución de los procedimientos especiales y ordinarios sancionadores que remita el Instituto Electoral de la Ciudad de México, que deriven de infracciones a la normatividad electoral y de los medios de impugnación que se presenten en contra de los procedimientos ordinarios','2023-10-23','C. María de los Ángeles Olivares Hernánez','Secretaria','Lic. Armando Azael Alvarado Castillo ','C. María de los Ángeles Olivares Hernánez','Lic. Armando Azael Alvarado Castillo ','abierto',NULL,NULL),
	(45,5,30,'03','Vinculación entre las áreas del Tribunal y organismos nacionales e internacionales','normal',1,'Establecer mecanismos y procedimientos para la vinculación con organismos electorales nacionales e internaciones, y/o instituciones u organizaciones interesadas en la materia electoral, o especializadas en diversas materias que sean de interés institucional, que permitan captar propuestas y experiencias que fortalezcan el ámbito electoral local.','Interactuar con organismos electorales nacionales e internacionales, a fin de intercambiar experiencias y propuestas que permitan fortalecer el ámbito electoral local, así como para dar cumplimiento a lo establecido en los artículos 217 del Código de Instituciones Procedimientos Electorales y al 72 del Reglamento Interior del Tribunal Electoral de la Ciudad de México.','Establecer mecanismos y procedimientos para que las experiencias y propuestas recibidas de otros organismos electorales del país o internacionales, se promuevan entre las diversas áreas y los colaboradores de este Tribunal para su fortalecimiento y mejor desempeño en sus funciones.','2022-10-23','Lcdo. Christian Alberto Ruiz Sánchez','Director de Vinculación y Enlace','','Lcdo. Christian Alberto Ruiz Sánchez','','abierto',NULL,NULL),
	(46,8,18,'04','Contratos administrativos.','normal',1,'Apoyar a la o el Presidente en la representación legal del Tribunal ante las autoridades administrativas y judiciales, ya sean locales o federales, así como atender los asuntos de este órgano colegiado en materia contenciosa, consultiva, contractual y normativa.','El proyecto se requiere para supervisar la elaboración, revisión y validación de los contratos administrativos en los que el Tribunal es parte.','Elaborar, revisar, validar y brindar asesoría para la celebración de los contratos administrativos que solicita la Secretaría Administrativa. ','2023-10-23','Lcda. Talina Castillo Solano ','Subdirectora de Contratos y Normativa','Lic. Eber Dario Comonfort Palacios','Lcda. Talina Castillo Solano ','EL PLENO EN REUNIÓN PRIVADA ','abierto',NULL,NULL),
	(47,1,2,'01','Acciones del Pleno, administrativas y jurisdiccionales necesarias, para impartir justicia en los medios de impugnación en materia electoral y controversias laborales y administrativas; así como para el fortalecimiento institucional','normal',1,'Garantizar a la ciudadanía y asociaciones políticas la impartición de justicia en materia político electoral en el ámbito jurisdiccional, así como fijar las políticas y lineamientos administrativos que contribuyan en el fortalecimiento y consolidación institucional.','La ejecución de este proyecto tiene como finalidad la impartición de justicia electoral, laboral y administrativa mediante la resolución definitiva de impugnaciones y controversias competencia de este Tribunal.\n','Que la Ponencia reciba, sustancie y elabore proyectos de resolución y/o acuerdos plenarios de los asuntos turnados.\n','2023-10-23','Andrea De La O Flores','Secretaria Ejecutiva','Magistrado Juan Carlos Sánchez León','Andrea De La O Flores','Magistrado Juan Carlos Sánchez León','abierto',NULL,NULL),
	(48,1,2,'02','Acciones que la Ponencia realiza para la impartición de justicia electoral, laboral y administrativa.','normal',1,'Garantizar a la ciudadanía y asociaciones políticas la impartición de justicia en materia político electoral en el ámbito jurisdiccional, así como fijar las políticas y lineamientos administrativos que contribuyan en el fortalecimiento y consolidación institucional.','La ejecución de estas actividades tiene como finalidad elaborar los proyectos de resolución relativos a los medios de impugnación y controversias planteadas ante este Tribunal.\n','Que el Pleno realice las acciones jurisdiccionales y administrativas necesarias para recibir, sustanciar y resolver en definitiva las impugnaciones y controversias sometidas a su consideración\n','2023-10-23','Andrea De La O Flores','Secretaria Ejecutiva','Magistrado Juan Carlos Sánchez León','Andrea De La O Flores','Magistrado Juan Carlos Sánchez León','abierto',NULL,NULL),
	(49,1,5,'01','Acciones del Pleno, administrativas y jurisdiccionales necesarias, para impartir justicia en los medios de impugnación en materia electoral y controversias laborales y administrativas; así como para el fortalecimiento institucional.','normal',1,'Garantizar a la ciudadanía y asociaciones políticas la impartición de justicia en materia político electoral en el ámbito jurisdiccional, así como fijar las políticas y lineamientos administrativos que contribuyan en el fortalecimiento y consolidación institucional.','La ejecución de este proyecto tiene como finalidad la impartición de justicia electoral, laboral y administrativa mediante la resolución definitiva de impugnaciones y controversias competencia de este Tribunal.','Que el Pleno realice las acciones jurisdiccionales y administrativas necesarias para recibir, sustanciar y resolver en definitiva las impugnaciones y controversias sometidas a su consideración.','2022-09-13','Lic. Gerardo Martínez Cruz','Secretario Prarticular de Magistrada','Magda. Martha Alejandra Chávez Camarena','Lic. Gerardo Martínez Cruz','EL PLENO EN REUNIÓN PRIVADA DEL 1° DE FEBRERO DE 2012','0',NULL,NULL),
	(50,1,5,'02','Acciones que la Ponencia realiza para la impartición de justicia electoral, laboral y administrativa.','normal',1,'Garantizar a la ciudadanía y asociaciones políticas la impartición de justicia en materia político electoral en el ámbito jurisdiccional, así como fijar las políticas y lineamientos administrativos que contribuyan en el fortalecimiento y consolidación institucional.','La ejecución de estas actividades tiene como finalidad elaborar los proyectos de resolución relativos a los medios de impugnación y controversias planteadas ante este Tribunal.\r\n','Que la Ponencia reciba, sustancie y elabore proyectos de resolución y/o acuerdos plenarios de los asuntos turnados.\r\n','2022-09-13','Lic. Gerardo Martínez Cruz','Secretario Particular de Magistrada','Magda. Martha Alejandra Chávez Camarena','Lic. Gerardo Martínez Cruz','EL PLENO EN REUNIÓN PRIVADA DEL 1° DE FEBRERO DE 2012','0',NULL,NULL);

/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
UNLOCK TABLES;


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
	(1,24,4,'2024-02-16 05:27:04','2024-02-16 05:27:04');

/*!40000 ALTER TABLE `responsable_operativo_usuario` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla responsables_operativos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `responsables_operativos`;

CREATE TABLE `responsables_operativos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `unidad_responsable_gasto_id` bigint unsigned NOT NULL,
  `numero` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `responsables_operativos_unidad_responsable_gasto_id_foreign` (`unidad_responsable_gasto_id`),
  CONSTRAINT `responsables_operativos_unidad_responsable_gasto_id_foreign` FOREIGN KEY (`unidad_responsable_gasto_id`) REFERENCES `unidades_responsables_gastos` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `responsables_operativos` WRITE;
/*!40000 ALTER TABLE `responsables_operativos` DISABLE KEYS */;

INSERT INTO `responsables_operativos` (`id`, `unidad_responsable_gasto_id`, `numero`, `nombre`, `created_at`, `updated_at`)
VALUES
	(1,1,'01','Ponencia del Magistrado Armando Ambriz Hernández',NULL,NULL),
	(2,1,'02','Ponencia del Magistrado Juan Carlos Sánchez León',NULL,NULL),
	(3,1,'03','Ponencia de la Magistrada Martha Leticia Mercado Ramírez',NULL,NULL),
	(4,1,'04','Ponencia del Magistratura VACANTE',NULL,NULL),
	(5,1,'05','Ponencia de la Magistrada Martha Alejandra Chávez Camarena',NULL,NULL),
	(6,2,'01','Magistrado (a) Presidente (a)',NULL,NULL),
	(7,3,'01','Secretario (a) General',NULL,NULL),
	(8,3,'02','Secretario (a) Técnico (a)',NULL,NULL),
	(9,4,'01','Secretario (a)  Administrativo (a)',NULL,NULL),
	(10,4,'02','Director (a) de Planeación y Recursos Financieros',NULL,NULL),
	(11,4,'03','Director (a) de Recursos Humanos',NULL,NULL),
	(12,4,'04','Director (a) de Recursos Materiales y Servicios Generales',NULL,NULL),
	(13,5,'01','Contralor (a) Interno (a)',NULL,NULL),
	(14,5,'02','Director (a) de Responsabilidades y Atención a Quejas',NULL,NULL),
	(15,5,'03','Director (a) de Auditoría, Control y Evaluación',NULL,NULL),
	(16,6,'01','Director (a) General Jurídico (a)',NULL,NULL),
	(17,6,'02','Subdirector (a) de lo Contencioso y Consultivo',NULL,NULL),
	(18,6,'03','Subdirector (a) de Contratos y Normatividad',NULL,NULL),
	(19,6,'04','Encargado (a) del Despacho de la Dirección General Jurídica',NULL,NULL),
	(20,7,'01','Coordinador (a) de Comunicación Social y Relaciones Públicas',NULL,NULL),
	(21,8,'01','Director (a) de la Coordinación de Transparencia y Datos Personales',NULL,NULL),
	(22,9,'01','Director (a) del Instituto de Formación y Capacitación',NULL,NULL),
	(23,10,'01','Secretaria Técnica de la Comisión de Controversias Laborales y Administrativas',NULL,NULL),
	(24,11,'01','Director (a) de la Unidad de Servicios Informáticos',NULL,NULL),
	(25,12,'01','Director (a) de la Unidad de Estadística y Jurisprudencia',NULL,NULL),
	(26,13,'01','Coordinador/a de Difusión y Publicación',NULL,NULL),
	(27,14,'01','Coordinador (a) de Archivo',NULL,NULL),
	(28,15,'01','Coordinador (a) de Derechos Humanos y Género',NULL,NULL),
	(29,16,'01','Defensor(a) Ciudadano(a)',NULL,NULL),
	(30,17,'01','Coordinador(a) de Vinculación y Relaciones Internacionales',NULL,NULL),
	(31,18,'01','Director(a) de la Unidad Especializada de Procedimientos Sancionadores',NULL,NULL);

/*!40000 ALTER TABLE `responsables_operativos` ENABLE KEYS */;
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
  `programa_id` bigint unsigned NOT NULL,
  `numero` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subprogramas_programa_id_foreign` (`programa_id`),
  CONSTRAINT `subprogramas_programa_id_foreign` FOREIGN KEY (`programa_id`) REFERENCES `programas` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `subprogramas` WRITE;
/*!40000 ALTER TABLE `subprogramas` DISABLE KEYS */;

INSERT INTO `subprogramas` (`id`, `programa_id`, `numero`, `nombre`, `created_at`, `updated_at`)
VALUES
	(1,1,'01','Impartición de Justicia Electoral, Laboral y Administrativa',NULL,NULL),
	(2,1,'02','Apoyo al Funcionamiento Técnico Jurídico del Pleno',NULL,NULL),
	(3,1,'03','Controversias Laborales y Administrativas',NULL,NULL),
	(4,2,'04','Imagen Institucional',NULL,NULL),
	(5,2,'05','Relación y Cooperación Institucional',NULL,NULL),
	(6,2,'06','Documentación y Servicios Bibliotecarios',NULL,NULL),
	(7,3,'07','Gestión y Modernización Administrativa',NULL,NULL),
	(8,3,'08','Servicios Jurídicos',NULL,NULL),
	(9,3,'09','Creación, Revisión y Actualización de Normatividad',NULL,NULL),
	(10,4,'10','Estandarización de la Infraestructura de Tecnologías de la Información y Comunicaciones',NULL,NULL),
	(11,4,'11','Prestación de Servicios Informáticos',NULL,NULL),
	(12,4,'12','Implantación de Sistemas',NULL,NULL),
	(13,5,'13','Transparencia y Acceso a la Información Pública',NULL,NULL),
	(14,5,'14','Sistema Institucional de Archivos',NULL,NULL),
	(15,6,'15','Auditoría',NULL,NULL),
	(16,6,'16','Seguimiento y Evaluación',NULL,NULL),
	(17,6,'17','Responsabilidades',NULL,NULL),
	(18,7,'18','Capacitación',NULL,NULL),
	(19,7,'19','Investigación',NULL,NULL);

/*!40000 ALTER TABLE `subprogramas` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla unidades_medidas_anteproyecto
# ------------------------------------------------------------

DROP TABLE IF EXISTS `unidades_medidas_anteproyecto`;

CREATE TABLE `unidades_medidas_anteproyecto` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `unidades_medidas_anteproyecto` WRITE;
/*!40000 ALTER TABLE `unidades_medidas_anteproyecto` DISABLE KEYS */;

INSERT INTO `unidades_medidas_anteproyecto` (`id`, `descripcion`, `created_at`, `updated_at`)
VALUES
	(1,'Unidad de medida 1',NULL,NULL);

/*!40000 ALTER TABLE `unidades_medidas_anteproyecto` ENABLE KEYS */;
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
  `area_id` bigint unsigned NOT NULL,
  `rol_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuarios_email_unique` (`email`),
  KEY `usuarios_area_id_foreign` (`area_id`),
  KEY `usuarios_rol_id_foreign` (`rol_id`),
  CONSTRAINT `usuarios_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `usuarios_rol_id_foreign` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;

INSERT INTO `usuarios` (`id`, `nombre`, `apellido_paterno`, `apellido_materno`, `genero`, `usuario`, `password`, `email`, `foto`, `area_id`, `rol_id`, `created_at`, `updated_at`)
VALUES
	(1,'Admin','Admin','Admin','Hombre','admin','$2y$10$0lbt.LxzVxTF54c0Oww4COo8x/G.ofFLtdqRl3aC0hDNAxTvfyc9e','admin@tecdmx.com','',24,1,'2023-11-28 22:25:02','2023-11-28 22:25:02'),
	(2,'Miguel','Federico','Gutierrez','Hombre','miguel.gutierrez','$2y$10$q0nH2ztgUUBMt.8my77Oc.UJYqX5TkrWcbCfyw33.PUk.T4FMEsiO','miguel.gutierrez@tecdmx.org.mx','',18,3,'2024-02-16 04:16:23','2024-02-16 04:16:23'),
	(3,'Fernando','Cortes','Figueroa','Hombre','fernando.cortes','$2y$10$S6XGa2YYMpeiKwPQX1V5PuVLGKkpTcVBKIeHWA034Jdrql5zmrc16','fernando.cortes@tecdmx.org.mx','',18,2,'2024-02-16 04:17:16','2024-02-16 04:17:16'),
	(4,'René','Navarrete','Tenco','Hombre','rene.navarrete','$2y$10$YyKhUfn3mugLdPYu6gt5VeLqbYC.9xkAq.0SxmuMDQd1LxQ1BDFIS','rene.navarrete@tecdmx.org.mx','',24,4,'2024-02-16 05:21:20','2024-02-16 05:21:20');

/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
