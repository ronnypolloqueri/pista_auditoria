/*
Navicat MySQL Data Transfer

Source Server         : datastore
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : db_auditoria

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2014-04-24 19:35:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auditoria
-- ----------------------------
DROP TABLE IF EXISTS `auditoria`;
CREATE TABLE `auditoria` (
  `id` int(11) NOT NULL,
  `cajero` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `ciudadano` varchar(45) DEFAULT NULL,
  `monto_anterior` decimal(10,2) DEFAULT NULL,
  `monto_saldo` decimal(10,2) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `mac` varchar(45) DEFAULT NULL,
  `nombre_maquina` varchar(45) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `tipo_operacion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`tipo_operacion_id`),
  KEY `fk_auditoria_tipo_operacion1_idx` (`tipo_operacion_id`),
  CONSTRAINT `fk_auditoria_tipo_operacion1` FOREIGN KEY (`tipo_operacion_id`) REFERENCES `tipo_operacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auditoria
-- ----------------------------

-- ----------------------------
-- Table structure for cajero
-- ----------------------------
DROP TABLE IF EXISTS `cajero`;
CREATE TABLE `cajero` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cajero
-- ----------------------------
INSERT INTO `cajero` VALUES ('1', 'roberto', 'sediño', '12345');
INSERT INTO `cajero` VALUES ('2', 'oscar', 'hacker', '1234');

-- ----------------------------
-- Table structure for pago
-- ----------------------------
DROP TABLE IF EXISTS `pago`;
CREATE TABLE `pago` (
  `id` int(11) NOT NULL,
  `ciudadano` varchar(45) DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `cajero_id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`cajero_id`),
  KEY `fk_PAGOS_cajero_idx` (`cajero_id`),
  CONSTRAINT `fk_PAGOS_cajero` FOREIGN KEY (`cajero_id`) REFERENCES `cajero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pago
-- ----------------------------
INSERT INTO `pago` VALUES ('1', 'alex', '100.00', 'disco', '2', '2014-04-08 19:28:53');
INSERT INTO `pago` VALUES ('2', 'ruben', '200.00', 'memoria', '1', '2014-04-08 19:29:57');

-- ----------------------------
-- Table structure for tipo_operacion
-- ----------------------------
DROP TABLE IF EXISTS `tipo_operacion`;
CREATE TABLE `tipo_operacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tipo_operacion
-- ----------------------------
INSERT INTO `tipo_operacion` VALUES ('1', 'insercion');
INSERT INTO `tipo_operacion` VALUES ('2', 'modificacion');
INSERT INTO `tipo_operacion` VALUES ('3', 'eliminacion');
