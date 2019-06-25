/*
Navicat MySQL Data Transfer

Source Server         : w_mysql
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : mhics

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-06-22 18:29:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `position_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `dept_id` int(12) DEFAULT NULL,
  PRIMARY KEY (`position_id`),
  KEY `Fkaasdfa12323as` (`dept_id`),
  CONSTRAINT `Fkaasdfa12323as` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES ('1', '超级管理员', '1');
INSERT INTO `position` VALUES ('2', 'CEO', '2');
INSERT INTO `position` VALUES ('3', '总经理', '2');
INSERT INTO `position` VALUES ('4', '研发部经理', '1');
INSERT INTO `position` VALUES ('5', '财务部总监', '3');
INSERT INTO `position` VALUES ('6', '人事部经理', '4');
INSERT INTO `position` VALUES ('7', '市场部经理', '5');
INSERT INTO `position` VALUES ('8', 'java工程师', '1');
INSERT INTO `position` VALUES ('9', '前端工程师', '1');
INSERT INTO `position` VALUES ('10', 'UI设计师', '1');
INSERT INTO `position` VALUES ('11', '工程部经理', '6');
INSERT INTO `position` VALUES ('12', '外业专员', '6');
INSERT INTO `position` VALUES ('13', '内业专员', '6');
INSERT INTO `position` VALUES ('14', '财务会计', '3');
INSERT INTO `position` VALUES ('15', '市场调查专员', '5');
