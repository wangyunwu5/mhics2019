/*
Navicat MySQL Data Transfer

Source Server         : w_mysql
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : mhics

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-06-22 18:29:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for standard
-- ----------------------------
DROP TABLE IF EXISTS `standard`;
CREATE TABLE `standard` (
  `standard_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description_en` varchar(255) DEFAULT NULL,
  `description_cn` varchar(255) DEFAULT NULL,
  `code_simple` varchar(255) DEFAULT NULL,
  `code_full` varchar(255) DEFAULT NULL,
  `code_mean` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`standard_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of standard
-- ----------------------------
INSERT INTO `standard` VALUES ('1', 'status', '井状况', 'PU', 'Public', '位于公众地方', null);
INSERT INTO `standard` VALUES ('2', 'status', '井状况', 'PR', 'Private', '位于私人地方', null);
INSERT INTO `standard` VALUES ('3', 'status', '井状况', 'HD', 'Highway drain', '位于高速公路', null);
INSERT INTO `standard` VALUES ('4', 'status', '井状况', 'WA', 'Watercourse', '位于河道', null);
INSERT INTO `standard` VALUES ('5', 'status', '井状况', 'TR', 'Trunk', '位于干渠', null);
INSERT INTO `standard` VALUES ('6', 'status', '井状况', 'AB', 'Abandoned', '废弃', null);
INSERT INTO `standard` VALUES ('7', 'status', '井状况', 'TC', 'To be constructed', '待建', null);
INSERT INTO `standard` VALUES ('8', 'status', '井状况', 'HC', 'Housing Company', '房屋署', null);
INSERT INTO `standard` VALUES ('9', 'status', '井状况', 'WA', 'Water Company Maintained', '水务署', null);
INSERT INTO `standard` VALUES ('10', 'status', '井状况', 'U', 'Unspecified', '不清楚', null);
INSERT INTO `standard` VALUES ('11', 'function', '井用途', 'F', 'Foul', '污水', null);
INSERT INTO `standard` VALUES ('12', 'function', '井用途', 'S', 'Surface', '清水', null);
INSERT INTO `standard` VALUES ('13', 'function', '井用途', 'C', 'Combined', '混合', null);
INSERT INTO `standard` VALUES ('14', 'function', '井用途', 'O', 'Overflow', '满溢', null);
INSERT INTO `standard` VALUES ('15', 'function', '井用途', 'U', 'Unspecified', '不清楚', null);
INSERT INTO `standard` VALUES ('16', 'nodetype', '井类别', 'A', 'Catch pit', null, null);
INSERT INTO `standard` VALUES ('17', 'nodetype', '井类别', 'B', 'Hydrobrake', null, null);
INSERT INTO `standard` VALUES ('18', 'nodetype', '井类别', 'C', 'Cascade', null, null);
INSERT INTO `standard` VALUES ('19', 'nodetype', '井类别', 'D', 'Dual function Manhole', null, null);
INSERT INTO `standard` VALUES ('20', 'nodetype', '井类别', 'E', 'Ejector', null, null);
INSERT INTO `standard` VALUES ('21', 'nodetype', '井类别', 'F', 'Outfall', null, null);
INSERT INTO `standard` VALUES ('22', 'nodetype', '井类别', 'G', 'Ghost', null, null);
INSERT INTO `standard` VALUES ('23', 'nodetype', '井类别', 'H', 'Hatchbox', null, null);
INSERT INTO `standard` VALUES ('24', 'nodetype', '井类别', 'I', 'Inlet', null, null);
INSERT INTO `standard` VALUES ('25', 'nodetype', '井类别', 'J', 'Junction', null, null);
INSERT INTO `standard` VALUES ('26', 'nodetype', '井类别', 'K', 'Combined', null, null);
INSERT INTO `standard` VALUES ('27', 'nodetype', '井类别', 'L', 'Lamphole', null, null);
INSERT INTO `standard` VALUES ('28', 'nodetype', '井类别', 'M', 'Manhole', null, null);
INSERT INTO `standard` VALUES ('29', 'nodetype', '井类别', 'N', 'Dead End', null, null);
INSERT INTO `standard` VALUES ('30', 'nodetype', '井类别', 'O', 'Oil Interceptor', null, null);
INSERT INTO `standard` VALUES ('31', 'nodetype', '井类别', 'P', 'Pumping Station', null, null);
INSERT INTO `standard` VALUES ('32', 'nodetype', '井类别', 'Q', 'Transition', null, null);
INSERT INTO `standard` VALUES ('33', 'nodetype', '井类别', 'R', 'Rodding eye', null, null);
INSERT INTO `standard` VALUES ('34', 'nodetype', ' 井类别', 'S', 'Soak away', null, null);
INSERT INTO `standard` VALUES ('35', 'nodetype', '井类别', 'T', 'Vent Column', null, null);
INSERT INTO `standard` VALUES ('36', 'nodetype', '井类别', 'U', 'unspecified', null, null);
INSERT INTO `standard` VALUES ('37', 'nodetype', '井类别', 'V', 'storm overflow', null, null);
INSERT INTO `standard` VALUES ('38', 'nodetype', '井类别', 'W', 'Treatment works', null, null);
INSERT INTO `standard` VALUES ('39', 'nodetype', '井类别', 'X', 'Unreliable', null, null);
INSERT INTO `standard` VALUES ('40', 'nodetype', '井类别', 'Y', 'Gully', null, null);
INSERT INTO `standard` VALUES ('41', 'nodetype', '井类别', 'Z', 'Ghost in rising main', null, null);
INSERT INTO `standard` VALUES ('42', 'covershape', '井盖形状', 'S', 'square', null, null);
INSERT INTO `standard` VALUES ('43', 'covershape', '井盖形状', 'R', 'relangular', null, null);
INSERT INTO `standard` VALUES ('44', 'coverduty', '井盖厚度', 'L', 'light', null, null);
INSERT INTO `standard` VALUES ('45', 'coverduty', '井盖厚度', 'M', 'medium', null, null);
INSERT INTO `standard` VALUES ('46', 'coverduty', '井盖厚度', 'H', 'heavy', null, null);
INSERT INTO `standard` VALUES ('47', 'coverduty', '井盖厚度', 'U', 'unspecified', null, null);
INSERT INTO `standard` VALUES ('48', 'soffit', '胆顶形状', 'S', 'reducing slab', null, null);
INSERT INTO `standard` VALUES ('49', 'soffit', '胆顶形状', 'T', 'taper', null, null);
INSERT INTO `standard` VALUES ('50', 'constructcode', '井胆建造方法', 'B', 'brick', '', '');
INSERT INTO `standard` VALUES ('51', 'constructcode', '井胆建造方法', 'P', 'pre-cast units', '', '');
INSERT INTO `standard` VALUES ('52', 'pipeshape', '渠筒形状', 'A', 'arch(with flat-bottom)', null, null);
INSERT INTO `standard` VALUES ('53', 'pipeshape', '渠筒形状', 'B', 'barrel', null, null);
INSERT INTO `standard` VALUES ('54', 'pipematerial', '渠筒物料', 'Ak', 'alkathene', null, null);
INSERT INTO `standard` VALUES ('55', 'pipematerial', '渠筒物料', 'AC', 'Asbestos cement', null, null);
INSERT INTO `standard` VALUES ('56', 'covertype', '井盖类型', 'SD', 'standard', null, null);
INSERT INTO `standard` VALUES ('57', 'covertype', '井盖类型', 'SL', 'standard large', null, null);
