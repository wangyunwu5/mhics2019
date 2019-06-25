/*
Navicat MySQL Data Transfer

Source Server         : w_mysql
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : mhics

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-06-22 18:28:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for diaocha_node
-- ----------------------------
DROP TABLE IF EXISTS `diaocha_node`;
CREATE TABLE `diaocha_node` (
  `dc_node_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `node_no` varchar(255) DEFAULT NULL,
  `year_laid` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `function` varchar(255) DEFAULT NULL,
  `node_type` varchar(255) DEFAULT NULL,
  `cover_shape` varchar(255) DEFAULT NULL,
  `cover_type` varchar(255) DEFAULT NULL,
  `cover_duty` varchar(255) DEFAULT NULL,
  `cover_sizec` double DEFAULT NULL,
  `cover_sizek` double DEFAULT NULL,
  `cover_level` double DEFAULT NULL,
  `hinged` varchar(255) DEFAULT NULL,
  `locked` varchar(255) DEFAULT NULL,
  `shaft_side_entry` varchar(255) DEFAULT NULL,
  `shaft_regular_course` varchar(255) DEFAULT NULL,
  `shaft_depth` double DEFAULT NULL,
  `shaft_sizec` double DEFAULT NULL,
  `shaft_sizek` double DEFAULT NULL,
  `chamber_soffit` varchar(255) DEFAULT NULL,
  `chamber_steps` int(12) DEFAULT NULL,
  `chamber_ladders` int(12) DEFAULT NULL,
  `chamber_lndgs` int(12) DEFAULT NULL,
  `chamber_sizec` double DEFAULT NULL,
  `chamber_sizek` double DEFAULT NULL,
  `toxic` varchar(255) DEFAULT NULL,
  `vermin` varchar(255) DEFAULT NULL,
  `construct_code` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `location_photo` varchar(255) DEFAULT NULL,
  `internal_photo` varchar(255) DEFAULT NULL,
  `location_sketch` varchar(255) DEFAULT NULL,
  `plan_of_mh` varchar(255) DEFAULT NULL,
  `depth_of_flow` float DEFAULT NULL,
  `depth_of_silt` float DEFAULT NULL,
  `height_surch` float DEFAULT NULL,
  `mh_depth` float DEFAULT NULL,
  `zbx` varchar(255) DEFAULT NULL,
  `zby` varchar(255) DEFAULT NULL,
  `utr` varchar(255) DEFAULT NULL,
  `utl` varchar(255) DEFAULT NULL,
  `utga` varchar(255) DEFAULT NULL,
  `uts` varchar(255) DEFAULT NULL,
  `jetting` varchar(255) DEFAULT NULL,
  `on_slope` varchar(255) DEFAULT NULL,
  `slope_no` varchar(255) DEFAULT NULL,
  `cover_condition` varchar(255) DEFAULT NULL,
  `cover_photo` varchar(255) DEFAULT NULL,
  `ladder_condition` varchar(255) DEFAULT NULL,
  `ladder_photo` varchar(255) DEFAULT NULL,
  `shaft_condition` varchar(255) DEFAULT NULL,
  `shaft_photo` varchar(255) DEFAULT NULL,
  `chamber_condition` varchar(255) DEFAULT NULL,
  `chamber_photo` varchar(255) DEFAULT NULL,
  `benching_condition` varchar(255) DEFAULT NULL,
  `benching_photo` varchar(255) DEFAULT NULL,
  `others_condition` varchar(255) DEFAULT NULL,
  `others_photo` varchar(255) DEFAULT NULL,
  `cctv_cond` varchar(255) DEFAULT NULL,
  `crity` varchar(255) DEFAULT NULL,
  `record_plan_difference` varchar(255) DEFAULT NULL,
  `idms_manhole_id` varchar(255) DEFAULT NULL,
  `dsd_ref` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  `survey_date` datetime DEFAULT NULL,
  `insert_man_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `work_no` varchar(255) DEFAULT NULL,
  `drainage_area_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dc_node_id`),
  KEY `FKaldf23adk345q` (`insert_man_id`) USING BTREE,
  KEY `FKassd2322kk23` (`project_id`) USING BTREE,
  CONSTRAINT `diaocha_node_ibfk_1` FOREIGN KEY (`insert_man_id`) REFERENCES `person` (`user_id`),
  CONSTRAINT `diaocha_node_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of diaocha_node
-- ----------------------------
INSERT INTO `diaocha_node` VALUES ('1', 'Y19-P022-999', '2019-06-11 00:00:00', 'PU', 'F', 'A', 'S', 'SD', 'L', '0', '0', '0', '有', '有', '有', '0', '0', '0', '0', 'S', '0', '0', '2', '0', '0', '有', '有', 'B', '--', '--', '--', '--', '--', '0', '0', '0', '0', '0', '0', '是', '是', '是', '是', '是', '是', 'aa', '否', '--', '否', '--', '否', '--', '否', '--', '否', '--', '否', '--', '否', '否', '否', '--', '--', '--', '2019-06-05 11:43:53', '2019-01-28 00:00:00', '2', '1', 'FT01', '1');
INSERT INTO `diaocha_node` VALUES ('2', 'Y19-P022-999', '2019-06-11 00:00:00', 'PR', 'F', 'M', 'S', 'SD', 'L', '580', '580', '8.09', '有', '有', '无', '0', '160', '470', '630', 'S', '3', '0', '2', '730', '800', '有', '有', 'B', 'Tai Lam Correctional Institution Junior Staff Married Quarters Block B', 'P1281247.JPG,P1281248.JPG,P1281249.JPG', 'P1281225.JPG,P1281227.JPG,P1281229.JPG,P1281232.JPG,P1281236.JPG', '--', '--', '0', '50', '0', '1.73', '0', '0', '是', '是', '是', '是', '是', '是', 'aa', '否', '--', '否', '--', '否', '--', '否', '--', '否', '--', '否', '--', '否', '否', '否', '--', '--', '--', '2019-06-04 11:44:05', '2019-01-28 00:00:00', '3', '2', 'FT01', '2');
INSERT INTO `diaocha_node` VALUES ('3', 'Y19-P022-999', '2019-06-11 00:00:00', 'PU', 'F', 'A', 'S', 'SD', 'L', '580', '580', '8.09', '有', '有', '有', '3', '160', '470', '630', 'S', '3', '3', '0', '730', '800', '有', '有', 'B', 'Tai Lam Correctional Institution Junior Staff Married Quarters Block B', '', '', '', '', '0', '50', '0', '1.73', '0', '0', '是', '是', '是', '是', '是', '是', '', '否', '', '否', '', '否', '', '否', '', '否', '', '否', '', '否', '否', '否', '', '', 'rfsfgsfgsfggsddfgsfg', null, '2019-01-28 00:00:00', '2', '1', 'FT01', '06SW19B');
INSERT INTO `diaocha_node` VALUES ('4', 'Y19-P022-999', '2019-06-11 00:00:00', 'PU', 'F', 'A', 'S', 'SD', 'L', '580', '580', '0', '有', '有', '有', '12', '154', '470', '630', 'S', '3', '0', '0', '0', '0', '有', '有', 'B', 'Tai Lam Correctional Institution Junior Staff Married Quarters Block B', '', '', '', '', '0', '0', '0', '0', '0', '0', '是', '是', '是', '是', '是', '是', '--', '否', '', '否', '', '否', '', '否', '', '否', '', '否', '', '否', '否', '否', 'as', 'as', 'rfsfgsfgsfggsddfgsfg', null, '2019-01-28 00:00:00', '4', '2', 'FT01', 'hsdfgsfsa');
INSERT INTO `diaocha_node` VALUES ('5', 'Y19-P022-999', '2019-06-11 00:00:00', 'PU', 'F', 'A', 'S', 'SD', 'L', '0', '0', '0', '有', '有', '有', '0', '0', '0', '0', 'S', '0', '0', '0', '0', '0', '有', '有', 'B', 'Tai Lam Correctional Institution Junior Staff Married Quarters Block B', '', '', '', '', '0', '0', '0', '0', '22.552728', '22.552728', '是', '是', '是', '是', '是', '是', '--', '否', '', '否', '', '否', '', '否', '', '否', '', '否', '', '否', '否', '否', 'as', 'as', 'rfsfgsfgsfggsddfgsfg', null, '2019-06-19 00:00:00', '4', '2', 'FT01', '06SW19B');
INSERT INTO `diaocha_node` VALUES ('6', 'Y19-P022-999', '2019-06-11 00:00:00', 'PU', 'F', 'A', 'S', 'SD', 'L', '0', '0', '0', '有', '有', '有', '0', '0', '0', '0', 'S', '0', '0', '0', '0', '0', '有', '有', 'B', 'Tai Lam Correctional Institution Junior Staff Married Quarters Block B', '', '', '', '', '0', '0', '0', '0', '22.537641', '22.537641', '是', '是', '是', '是', '是', '是', '--', '否', '', '否', '', '否', '', '否', '', '否', '', '否', '', '否', '否', '否', 'as', 'as', 'rfsfgsfgsfggsddfgsfg', null, '2019-06-19 00:00:00', '1', '1', 'FT01', '06SW19B');
INSERT INTO `diaocha_node` VALUES ('7', 'Y19-P022-999', '2019-06-11 00:00:00', 'PU', 'F', 'A', 'S', 'SD', 'L', '580', '580', '2345', '有', '有', '有', '12', '154', '470', '630', 'S', '3', '524', '5', '730', '800', '有', '有', 'B', 'Tai Lam Correctional Institution Junior Staff Married Quarters Block B', '', '', '', '', '2435', '234', '52345', '1.73', '22.522418', '22.522418', '是', '是', '是', '是', '是', '是', '--', '否', '', '否', '', '否', '', '否', '', '否', '', '否', '', '否', '否', '否', 'as', 'as', 'rfsfgsfgsfggsddfgsfg', null, '2019-06-19 00:00:00', '1', '1', 'FT01', '06SW19B');
INSERT INTO `diaocha_node` VALUES ('8', 'Y19-P022-999', '2019-06-11 00:00:00', 'PU', 'F', 'A', 'S', 'SD', 'L', '4524', '580', '2345', '有', '有', '无', '12', '160', '470', '630', 'S', '3', '524', '5', '730', '800', '有', '有', 'B', 'Tai Lam Correctional Institution Junior Staff Married Quarters Block B', '', '', '', '', '0', '50', '52345', '1.73', '113.928872', '22.511067', '是', '是', '是', '是', '是', '是', 'sdfa', '否', '', '否', '', '否', '', '否', '', '否', '', '否', '', '否', '否', '否', 'as', 'as', '哈哈', null, '2019-06-19 00:00:00', '6', '2', 'FT01', 'hsdfgsfsa');
INSERT INTO `diaocha_node` VALUES ('9', 'S51', '2019-06-12 00:00:00', 'PU', 'F', 'A', 'S', 'SD', 'L', '580', '580', '8.09', '有', '有', '有', '0', '154', '470', '345234', 'S', '3', '524', '5', '2435', '245', '有', '有', 'B', 'Tai Lam Correctional Institution Junior Staff Married Quarters Block B', '', '', '', '', '0', '234', '52345', '1.73', '113.951869', '22.533502', '是', '是', '是', '是', '是', '是', '--', '否', '', '否', '', '否', '', '否', '', '否', '', '否', '', '否', '否', '否', 'as', 'as', '哈哈', null, '2019-01-28 00:00:00', '5', '2', 'FT01', '06SW19B');
INSERT INTO `diaocha_node` VALUES ('10', 's52', '2019-06-11 00:00:00', 'PU', 'F', 'A', 'S', 'SD', 'L', '4524', '2345', '0', '有', '有', '有', '0', '0', '0', '0', 'S', '0', '0', '0', '0', '0', '有', '有', 'B', 'Tai Lam Correctional Institution Junior Staff Married Quarters Block B', '', '', '', '', '0', '0', '0', '0', '113.950948', '22.537211', '是', '是', '是', '是', '是', '是', '--', '否', '', '否', '', '否', '', '否', '', '否', '', '否', '', '否', '否', '否', 'as', 'as', 'rfsfgsfgsfggsddfgsfg', '2019-06-18 00:00:00', '2019-06-19 00:00:00', '6', '2', 'FT01', '06SW19B');
INSERT INTO `diaocha_node` VALUES ('11', 's53', '2019-06-11 00:00:00', 'PU', 'F', 'A', 'S', 'SD', 'L', '0', '0', '0', '有', '有', '有', '0', '0', '0', '0', 'S', '0', '0', '0', '0', '0', '有', '有', 'B', 'Tai Lam Correctional Institution Junior Staff Married Quarters Block B', '', '', '', '', '0', '0', '0', '0', '113.935555', '22.567881', '是', '是', '是', '是', '是', '是', '--', '否', '', '否', '', '否', '', '否', '', '否', '', '否', '', '否', '否', '否', 'as', 'as', '哈哈', '2019-06-19 15:02:45', '2019-06-19 00:00:00', '5', '1', 'FT01', 'hsdfgsfsa');
