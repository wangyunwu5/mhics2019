/*
Navicat MySQL Data Transfer

Source Server         : w_mysql
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : mhics

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-06-22 18:30:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `role_id` int(12) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1');
INSERT INTO `user_role` VALUES ('2', '2', '2');
INSERT INTO `user_role` VALUES ('3', '2', '3');
INSERT INTO `user_role` VALUES ('4', '4', '4');
INSERT INTO `user_role` VALUES ('5', '1', '5');
INSERT INTO `user_role` VALUES ('6', '1', '6');
