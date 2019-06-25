/*
Navicat MySQL Data Transfer

Source Server         : w_mysql
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : mhics

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-06-22 18:30:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user_login_record
-- ----------------------------
DROP TABLE IF EXISTS `user_login_record`;
CREATE TABLE `user_login_record` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_time` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `login_way` varchar(255) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_login_record
-- ----------------------------
