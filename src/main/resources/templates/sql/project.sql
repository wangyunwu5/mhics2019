/*
Navicat MySQL Data Transfer

Source Server         : w_mysql
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : mhics

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-06-22 18:29:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `project_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_no` varchar(255) DEFAULT NULL,
  `drainage_area_code` varchar(255) DEFAULT NULL,
  `create_man_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `project_leader_id` bigint(20) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  KEY `FK12kkjdfds13` (`create_man_id`),
  KEY `FK2kajsdf2342` (`project_leader_id`),
  CONSTRAINT `FK12kkjdfds13` FOREIGN KEY (`create_man_id`) REFERENCES `person` (`user_id`),
  CONSTRAINT `FK2kajsdf2342` FOREIGN KEY (`project_leader_id`) REFERENCES `person` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', '06SW19B', 'sssssnnnnnnnnn', '1', '2019-06-03 14:55:08', '1', '2019-06-21 00:00:00', '2019-06-23 00:00:00');
INSERT INTO `project` VALUES ('2', 'aaaaaa', 'hsdfgsfsa', '1', '2019-05-29 00:00:00', '1', '2019-06-18 00:00:00', '2019-06-20 00:00:00');
