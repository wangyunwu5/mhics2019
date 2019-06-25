/*
Navicat MySQL Data Transfer

Source Server         : w_mysql
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : mhics

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-06-22 18:28:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_account` varchar(255) DEFAULT NULL,
  `user_pass` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `hire_date` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_tel` varchar(255) DEFAULT NULL,
  `user_img` varchar(255) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user_id` bigint(20) DEFAULT NULL,
  `position_id` bigint(20) DEFAULT NULL,
  `dept_id` int(12) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `is_lock` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FKlkajd123lklkj23` (`position_id`),
  KEY `FKlkajd234ewd23` (`dept_id`),
  CONSTRAINT `FKlkajd123lklkj23` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`),
  CONSTRAINT `FKlkajd234ewd23` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('1', '郭德纲', '123456', '郭德纲', null, 'sfdss@163.com', '1615342', null, '2019-06-19 12:04:03', null, '1', '1', '男', '0');
INSERT INTO `person` VALUES ('2', '小a', '123456', '罗密欧', null, 'w234@163.com', '62135', null, null, null, '2', '2', '男', '1');
INSERT INTO `person` VALUES ('3', '小b', '123456', '朱丽叶', null, 'w234@163.com', '356352', null, null, null, '2', '2', '男', '0');
INSERT INTO `person` VALUES ('4', '小c', '123456', '蔡徐坤', null, 'w6334@163.com', '1351343', null, null, null, '1', '3', '女', '0');
INSERT INTO `person` VALUES ('5', '小d', '123456', '古巨基', null, 'w532234@163.com', '356352', null, null, null, '1', '2', '男', '0');
INSERT INTO `person` VALUES ('6', '罗玉凤', '123456', '罗玉凤', null, 'w532234@163.com', '13563527567', null, null, null, '1', '1', '男', '0');
