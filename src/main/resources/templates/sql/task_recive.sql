/*
Navicat MySQL Data Transfer

Source Server         : w_mysql
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : mhics

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-06-22 18:30:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for task_recive
-- ----------------------------
DROP TABLE IF EXISTS `task_recive`;
CREATE TABLE `task_recive` (
  `recive_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) DEFAULT NULL,
  `recive_user_id` bigint(20) DEFAULT NULL,
  `recive_time` datetime DEFAULT NULL,
  `with_risk_assessment` varchar(255) DEFAULT NULL,
  `with_permit_towork` varchar(255) DEFAULT NULL,
  `with_traff_permit` varchar(255) DEFAULT NULL,
  `work_no` varchar(255) DEFAULT NULL,
  `survey_date` datetime DEFAULT NULL,
  PRIMARY KEY (`recive_id`),
  KEY `FKasdkjf232kwwesa` (`task_id`),
  KEY `FKwerw1234kjkjh112` (`recive_user_id`),
  CONSTRAINT `FKasdkjf232kwwesa` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`),
  CONSTRAINT `FKwerw1234kjkjh112` FOREIGN KEY (`recive_user_id`) REFERENCES `person` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task_recive
-- ----------------------------
INSERT INTO `task_recive` VALUES ('1', '1', '3', '2019-06-04 18:06:32', null, null, null, null, null);
INSERT INTO `task_recive` VALUES ('2', '2', '5', '2019-06-04 18:12:56', null, null, null, null, null);
INSERT INTO `task_recive` VALUES ('4', '4', '5', '2019-06-05 16:13:29', null, null, null, null, null);
