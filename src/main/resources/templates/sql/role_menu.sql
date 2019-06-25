/*
Navicat MySQL Data Transfer

Source Server         : w_mysql
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : mhics

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-06-22 18:29:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `rpl_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_show` int(11) DEFAULT NULL,
  `menu_id` bigint(20) DEFAULT NULL,
  `role_id` int(12) DEFAULT NULL,
  PRIMARY KEY (`rpl_id`),
  KEY `menu_id` (`menu_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('1', '1', '1', '1');
INSERT INTO `role_menu` VALUES ('2', '1', '2', '1');
INSERT INTO `role_menu` VALUES ('3', '1', '3', '1');
INSERT INTO `role_menu` VALUES ('4', '1', '4', '1');
INSERT INTO `role_menu` VALUES ('5', '1', '5', '1');
INSERT INTO `role_menu` VALUES ('6', '1', '6', '1');
INSERT INTO `role_menu` VALUES ('7', '1', '7', '1');
INSERT INTO `role_menu` VALUES ('8', '1', '8', '1');
INSERT INTO `role_menu` VALUES ('9', '1', '9', '1');
INSERT INTO `role_menu` VALUES ('10', '1', '10', '1');
