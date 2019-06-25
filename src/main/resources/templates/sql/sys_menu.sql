/*
Navicat MySQL Data Transfer

Source Server         : w_mysql
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : mhics

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-06-22 18:29:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_show` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `menu_icon` varchar(255) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `menu_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '1', '系统管理', '0', 'glyphicon-cog', '1', '#');
INSERT INTO `sys_menu` VALUES ('2', '1', '用户管理', '0', 'glyphicon-user', '2', '#');
INSERT INTO `sys_menu` VALUES ('3', '1', '沙井管理', '0', 'glyphicon-oil', '6', '#');
INSERT INTO `sys_menu` VALUES ('4', '1', '项目管理', '0', 'glyphicon-folder-open', '3', '#');
INSERT INTO `sys_menu` VALUES ('5', '1', '菜单管理', '1', 'glyphicon-record', '1', '/index/menumanage');
INSERT INTO `sys_menu` VALUES ('6', '1', '用户管理', '2', 'glyphicon-record', '1', '/user/usermanage');
INSERT INTO `sys_menu` VALUES ('7', '1', '部门管理', '2', 'glyphicon-record', '2', '/dept/deptmanage');
INSERT INTO `sys_menu` VALUES ('8', '1', '职位管理', '2', 'glyphicon-record', '3', '/position/positionmanage');
INSERT INTO `sys_menu` VALUES ('9', '1', '角色管理', '2', 'glyphicon-record', '4', null);
INSERT INTO `sys_menu` VALUES ('10', '1', '项目管理', '4', 'glyphicon-record', '1', '/project/projectmanage');
INSERT INTO `sys_menu` VALUES ('11', '1', '任务管理', '0', 'glyphicon-flag', '4', '#');
INSERT INTO `sys_menu` VALUES ('12', '1', '调查管理', '0', 'glyphicon-edit', '5', '#');
INSERT INTO `sys_menu` VALUES ('13', '1', '任务管理', '11', 'glyphicon-record', '1', '/task/taskmanage');
INSERT INTO `sys_menu` VALUES ('14', '1', '调查管理', '12', 'glyphicon-record', '1', '/investigation/investigationmanage');
INSERT INTO `sys_menu` VALUES ('15', '1', '我的任务', '11', 'glyphicon-record', '2', '/task/mytask');
INSERT INTO `sys_menu` VALUES ('16', '1', '公告管理', '1', 'glyphicon-record', '2', null);
INSERT INTO `sys_menu` VALUES ('17', '1', '所有沙井', '3', 'glyphicon-record', '1', '/node/nodemanage');
INSERT INTO `sys_menu` VALUES ('18', '1', '沙井管理', '3', 'glyphicon-record', '2', null);
INSERT INTO `sys_menu` VALUES ('19', '1', '标准管理', '4', 'glyphicon-record', '2', '/standard/standardmanage');
