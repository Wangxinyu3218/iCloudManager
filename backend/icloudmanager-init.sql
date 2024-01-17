/*
 Navicat Premium Data Transfer

 Source Server         : ctyun
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : 121.229.99.43:3306
 Source Schema         : icloudmanager

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 17/01/2024 10:51:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bookkeep
-- ----------------------------
DROP TABLE IF EXISTS `bookkeep`;
CREATE TABLE `bookkeep` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `uuid` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleid` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `typeid` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `methodid` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createtime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bookkeep
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for calendar
-- ----------------------------
DROP TABLE IF EXISTS `calendar`;
CREATE TABLE `calendar` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `uuid` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleid` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `years` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `months` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `days` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contentA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `statusA` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contentB` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `statusB` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contentAtext` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contentBtext` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `others` longtext COLLATE utf8_unicode_ci,
  `othersStatus` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createtime` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of calendar
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for dashcard
-- ----------------------------
DROP TABLE IF EXISTS `dashcard`;
CREATE TABLE `dashcard` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `uuid` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `typeid` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `today` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tamount` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `yesterday` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `yamount` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `week` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wamount` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastweek` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lmamount` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastmonth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lamount` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aamount` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of dashcard
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(2) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(1) NOT NULL DEFAULT '0',
  `createtime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of menu
-- ----------------------------
BEGIN;
INSERT INTO `menu` (`id`, `sort`, `name`, `path`, `icon`, `state`, `createtime`) VALUES ('0413a319-aad8-11ee-baaa-fa163ee05900', 5221, '用户管理', '/manage/user', 'iconfont icon-yonghuguanli', 0, '2024-01-05 12:15:20');
INSERT INTO `menu` (`id`, `sort`, `name`, `path`, `icon`, `state`, `createtime`) VALUES ('5d982fd6-b1bc-11ee-9d3c-8912c08d81e0', 1389, '添加账单', '/manage/addBill', 'iconfont icon-tianjia', 0, '2024-01-13 10:35:07');
INSERT INTO `menu` (`id`, `sort`, `name`, `path`, `icon`, `state`, `createtime`) VALUES ('61edb9ef-ab71-11ee-baaa-fa163ee05900', 5612, '结果页', '/manage/result', 'iconfont icon-xwtubiaoku-13', 0, '2024-01-07 20:51:48');
INSERT INTO `menu` (`id`, `sort`, `name`, `path`, `icon`, `state`, `createtime`) VALUES ('6d748a2a-b1c7-11ee-9d3c-8912c08d81e0', 1482, '日程管理', '/manage/calendar', 'iconfont icon-richeng', 0, '2024-01-13 11:54:18');
INSERT INTO `menu` (`id`, `sort`, `name`, `path`, `icon`, `state`, `createtime`) VALUES ('bbb6aaae-aea5-11ee-b6c3-fa163ee05900', 1932, '字典管理', '/manage/dict', 'iconfont icon-zidianpeizhi', 0, '2024-01-09 12:15:33');
INSERT INTO `menu` (`id`, `sort`, `name`, `path`, `icon`, `state`, `createtime`) VALUES ('d3c4f404-b104-11ee-92bb-578180fe7c6e', 1213, '财务管理', '/manage/bookkeep', 'iconfont icon-shuishoucaiwu', 0, '2024-01-12 12:41:18');
INSERT INTO `menu` (`id`, `sort`, `name`, `path`, `icon`, `state`, `createtime`) VALUES ('d5114e30-aad7-11ee-baaa-fa163ee05900', 2421, '菜单管理', '/manage/menu', 'iconfont icon-caidanguanli', 0, '2024-01-05 12:15:20');
INSERT INTO `menu` (`id`, `sort`, `name`, `path`, `icon`, `state`, `createtime`) VALUES ('e2fb1d5e-aa40-11ee-baaa-fa163ee05900', 0, '首页', '/manage/homePage', 'iconfont icon-shouye', 0, '2024-01-05 12:15:20');
INSERT INTO `menu` (`id`, `sort`, `name`, `path`, `icon`, `state`, `createtime`) VALUES ('e312c0af-aad7-11ee-baaa-fa163ee05900', 3354, '添加菜单', '/manage/addMenu', 'iconfont icon-tianjia', 0, '2024-01-05 12:15:20');
INSERT INTO `menu` (`id`, `sort`, `name`, `path`, `icon`, `state`, `createtime`) VALUES ('ee6023b2-aad7-11ee-baaa-fa163ee05900', 4022, '角色管理', '/manage/role', 'iconfont icon-role', 0, '2024-01-05 12:15:20');
INSERT INTO `menu` (`id`, `sort`, `name`, `path`, `icon`, `state`, `createtime`) VALUES ('f9964d4c-aad7-11ee-baaa-fa163ee05900', 4291, '添加角色', '/manage/addRole', 'iconfont icon-add-role', 0, '2024-01-05 12:15:20');
COMMIT;

-- ----------------------------
-- Table structure for method
-- ----------------------------
DROP TABLE IF EXISTS `method`;
CREATE TABLE `method` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `uuid` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleid` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `methodid` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createtime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of method
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `roleid` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleCode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu` longtext COLLATE utf8_unicode_ci,
  `state` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` (`id`, `roleid`, `roleCode`, `roleName`, `description`, `menu`, `state`) VALUES (1, '46e180fc-a7bc-11ee-9aec-fa163ee05900', 'superAdmin', '超级管理员', '系统管理员', '[{\"id\":\"e2fb1d5e-aa40-11ee-baaa-fa163ee05900\",\"sort\":0,\"name\":\"首页\",\"path\":\"/manage/homePage\",\"icon\":\"iconfont icon-shouye\",\"state\":0,\"createtime\":\"2024-01-05 12:15:20\"},{\"id\":\"d3c4f404-b104-11ee-92bb-578180fe7c6e\",\"sort\":1213,\"name\":\"财务管理\",\"path\":\"/manage/bookkeep\",\"icon\":\"iconfont icon-shuishoucaiwu\",\"state\":0,\"createtime\":\"2024-01-12 12:41:18\"},{\"id\":\"5d982fd6-b1bc-11ee-9d3c-8912c08d81e0\",\"sort\":1389,\"name\":\"添加账单\",\"path\":\"/manage/addBill\",\"icon\":\"iconfont icon-tianjia\",\"state\":0,\"createtime\":\"2024-01-13 10:35:07\"},{\"id\":\"6d748a2a-b1c7-11ee-9d3c-8912c08d81e0\",\"sort\":1482,\"name\":\"日程管理\",\"path\":\"/manage/calendar\",\"icon\":\"iconfont icon-richeng\",\"state\":0,\"createtime\":\"2024-01-13 11:54:18\"},{\"id\":\"bbb6aaae-aea5-11ee-b6c3-fa163ee05900\",\"sort\":1932,\"name\":\"字典管理\",\"path\":\"/manage/dict\",\"icon\":\"iconfont icon-zidianpeizhi\",\"state\":0,\"createtime\":\"2024-01-09 12:15:33\"},{\"id\":\"d5114e30-aad7-11ee-baaa-fa163ee05900\",\"sort\":2421,\"name\":\"菜单管理\",\"path\":\"/manage/menu\",\"icon\":\"iconfont icon-caidanguanli\",\"state\":0,\"createtime\":\"2024-01-05 12:15:20\"},{\"id\":\"e312c0af-aad7-11ee-baaa-fa163ee05900\",\"sort\":3354,\"name\":\"添加菜单\",\"path\":\"/manage/addMenu\",\"icon\":\"iconfont icon-tianjia\",\"state\":0,\"createtime\":\"2024-01-05 12:15:20\"},{\"id\":\"ee6023b2-aad7-11ee-baaa-fa163ee05900\",\"sort\":4022,\"name\":\"角色管理\",\"path\":\"/manage/role\",\"icon\":\"iconfont icon-role\",\"state\":0,\"createtime\":\"2024-01-05 12:15:20\"},{\"id\":\"f9964d4c-aad7-11ee-baaa-fa163ee05900\",\"sort\":4291,\"name\":\"添加角色\",\"path\":\"/manage/addRole\",\"icon\":\"iconfont icon-add-role\",\"state\":0,\"createtime\":\"2024-01-05 12:15:20\"},{\"id\":\"0413a319-aad8-11ee-baaa-fa163ee05900\",\"sort\":5221,\"name\":\"用户管理\",\"path\":\"/manage/user\",\"icon\":\"iconfont icon-yonghuguanli\",\"state\":0,\"createtime\":\"2024-01-05 12:15:20\"},{\"id\":\"61edb9ef-ab71-11ee-baaa-fa163ee05900\",\"sort\":5612,\"name\":\"结果页\",\"path\":\"/manage/result\",\"icon\":\"iconfont icon-xwtubiaoku-13\",\"state\":0,\"createtime\":\"2024-01-07 20:51:48\"}]', 0);
COMMIT;

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `uuid` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleid` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `typeid` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createtime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isdash` int(1) DEFAULT '0',
  `state` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of type
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `uuid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `roleid` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nickname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` int(1) DEFAULT NULL,
  `createtime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`uuid`, `roleid`, `username`, `nickname`, `password`, `sex`, `createtime`, `state`) VALUES ('4432efbf-a952-11ee-9aec-fa163ee05900', '46e180fc-a7bc-11ee-9aec-fa163ee05900', 'admin', '系统根用户', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-02 17:35:29', 0);
COMMIT;

-- ----------------------------
-- Triggers structure for table calendar
-- ----------------------------
DROP TRIGGER IF EXISTS `before_insert_calendar`;
delimiter ;;
CREATE TRIGGER `before_insert_calendar` BEFORE INSERT ON `calendar` FOR EACH ROW BEGIN  
  SET NEW.createtime = DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s');   
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table menu
-- ----------------------------
DROP TRIGGER IF EXISTS `before_insert_menu`;
delimiter ;;
CREATE TRIGGER `before_insert_menu` BEFORE INSERT ON `menu` FOR EACH ROW BEGIN  
  SET NEW.createtime = DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s');   
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table method
-- ----------------------------
DROP TRIGGER IF EXISTS `before_insert_method`;
delimiter ;;
CREATE TRIGGER `before_insert_method` BEFORE INSERT ON `method` FOR EACH ROW BEGIN  
  SET NEW.createtime = DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s');  
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table type
-- ----------------------------
DROP TRIGGER IF EXISTS `before_insert_type`;
delimiter ;;
CREATE TRIGGER `before_insert_type` BEFORE INSERT ON `type` FOR EACH ROW BEGIN  
  SET NEW.createtime = DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s');  
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table users
-- ----------------------------
DROP TRIGGER IF EXISTS `before_insert_user`;
delimiter ;;
CREATE TRIGGER `before_insert_user` BEFORE INSERT ON `users` FOR EACH ROW BEGIN  
  SET NEW.createtime = CONCAT(DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s'));
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
