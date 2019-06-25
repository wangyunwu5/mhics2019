/*
Navicat MySQL Data Transfer

Source Server         : w_mysql
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : mhics

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-06-22 18:28:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pipe
-- ----------------------------
DROP TABLE IF EXISTS `pipe`;
CREATE TABLE `pipe` (
  `pipe_id` int(12) NOT NULL AUTO_INCREMENT,
  `pipe_no` varchar(255) DEFAULT NULL,
  `node_id` int(12) DEFAULT NULL,
  `pipe_type` varchar(255) DEFAULT NULL,
  `pipe_sizec` double DEFAULT NULL,
  `pipe_sizek` double DEFAULT NULL,
  `backdrop` float(255,0) DEFAULT NULL,
  `pipe_material` varchar(255) DEFAULT NULL,
  `lining` double DEFAULT NULL,
  `pipe_depth` float DEFAULT NULL,
  `invert` float DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `wallno` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  `survey_date` datetime DEFAULT NULL,
  `insert_man_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`pipe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pipe
-- ----------------------------
