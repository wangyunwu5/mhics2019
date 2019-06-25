/*
Navicat MySQL Data Transfer

Source Server         : w_mysql
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : mhics

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-06-22 18:28:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `dept_id` int(12) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) DEFAULT NULL,
  `dept_tel` varchar(255) DEFAULT NULL,
  `dept_addr` varchar(255) DEFAULT NULL,
  `manager_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`dept_id`),
  KEY `FKwewew2231gs` (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '研发部', '123456', '深圳南山', '1');
INSERT INTO `dept` VALUES ('2', '总经办', '345678', '中国香港', '2');
INSERT INTO `dept` VALUES ('3', '财务部', '213643', '中国香港', '1');
INSERT INTO `dept` VALUES ('4', '人事部', '967454', '中国香港', '1');
INSERT INTO `dept` VALUES ('5', '市场部', '234122', '中国香港', '1');
INSERT INTO `dept` VALUES ('6', '工程部', '642421', '中国香港', '3');
