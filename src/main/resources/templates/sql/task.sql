/*
Navicat MySQL Data Transfer

Source Server         : w_mysql
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : mhics

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-06-22 18:30:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `task_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) DEFAULT NULL,
  `create_person_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `status_id` int(12) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  KEY `FKad123llsals31` (`project_id`),
  KEY `FKas232lkhk23` (`create_person_id`),
  CONSTRAINT `FKad123llsals31` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  CONSTRAINT `FKas232lkhk23` FOREIGN KEY (`create_person_id`) REFERENCES `person` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('1', '2', '1', '2019-06-03 00:00:00', '1', '2019-06-18 00:00:00', '2019-06-24 00:00:00', '今晚学英语');
INSERT INTO `task` VALUES ('2', '2', '2', '2019-06-04 00:00:00', '1', '2019-06-04 00:00:00', '2019-06-20 00:00:00', '你喜欢唱、跳、rap、篮球');
INSERT INTO `task` VALUES ('3', '1', '3', '2019-06-04 00:00:00', '1', '2019-06-04 00:00:00', '2019-06-19 00:00:00', '今晚打灭霸');
INSERT INTO `task` VALUES ('4', '1', '1', '2019-06-04 00:00:00', '1', '2019-06-04 00:00:00', '2019-06-20 00:00:00', '今晚吃屎');
