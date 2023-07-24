/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : bookkeeping_v3

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 24/07/2023 16:40:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bookkeeping_dashboard
-- ----------------------------
DROP TABLE IF EXISTS `bookkeeping_dashboard`;
CREATE TABLE `bookkeeping_dashboard` (
  `depend_id` int(11) NOT NULL,
  `bk_residue` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `bk_limit` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`depend_id`),
  CONSTRAINT `depend_by` FOREIGN KEY (`depend_id`) REFERENCES `bookkeeping_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bookkeeping_dashboard
-- ----------------------------
BEGIN;
INSERT INTO `bookkeeping_dashboard` (`depend_id`, `bk_residue`, `bk_limit`) VALUES (825901, '1000', '100');
COMMIT;

-- ----------------------------
-- Table structure for bookkeeping_dashboard_list
-- ----------------------------
DROP TABLE IF EXISTS `bookkeeping_dashboard_list`;
CREATE TABLE `bookkeeping_dashboard_list` (
  `bk_id` int(255) NOT NULL,
  `sort_id` int(255) NOT NULL AUTO_INCREMENT,
  `expenditure_type` int(255) DEFAULT NULL,
  `list_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `list_amount` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `list_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sort_id`),
  KEY `id` (`bk_id`),
  KEY `contentName` (`list_name`),
  KEY `typeId` (`expenditure_type`),
  CONSTRAINT `contentName` FOREIGN KEY (`list_name`) REFERENCES `bookkeeping_type` (`type_content`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id` FOREIGN KEY (`bk_id`) REFERENCES `bookkeeping_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bookkeeping_dashboard_list
-- ----------------------------
BEGIN;
INSERT INTO `bookkeeping_dashboard_list` (`bk_id`, `sort_id`, `expenditure_type`, `list_name`, `list_amount`, `list_date`) VALUES (825901, 1, 546963, 'income', NULL, '2023-06');
INSERT INTO `bookkeeping_dashboard_list` (`bk_id`, `sort_id`, `expenditure_type`, `list_name`, `list_amount`, `list_date`) VALUES (825901, 2, 600856, 'living', NULL, '2023-06');
INSERT INTO `bookkeeping_dashboard_list` (`bk_id`, `sort_id`, `expenditure_type`, `list_name`, `list_amount`, `list_date`) VALUES (825901, 3, 659537, 'vegetables&fruits', NULL, '2023-06');
INSERT INTO `bookkeeping_dashboard_list` (`bk_id`, `sort_id`, `expenditure_type`, `list_name`, `list_amount`, `list_date`) VALUES (825901, 4, 386515, 'food', NULL, '2023-06');
INSERT INTO `bookkeeping_dashboard_list` (`bk_id`, `sort_id`, `expenditure_type`, `list_name`, `list_amount`, `list_date`) VALUES (825901, 5, 189267, 'snack', NULL, '2023-06');
INSERT INTO `bookkeeping_dashboard_list` (`bk_id`, `sort_id`, `expenditure_type`, `list_name`, `list_amount`, `list_date`) VALUES (825901, 6, 786789, 'traffic', NULL, '2023-06');
INSERT INTO `bookkeeping_dashboard_list` (`bk_id`, `sort_id`, `expenditure_type`, `list_name`, `list_amount`, `list_date`) VALUES (825901, 7, 366144, 'Credit', NULL, '2023-06');
INSERT INTO `bookkeeping_dashboard_list` (`bk_id`, `sort_id`, `expenditure_type`, `list_name`, `list_amount`, `list_date`) VALUES (825901, 8, 470356, 'shopping', NULL, '2023-06');
INSERT INTO `bookkeeping_dashboard_list` (`bk_id`, `sort_id`, `expenditure_type`, `list_name`, `list_amount`, `list_date`) VALUES (825901, 9, 253347, 'deer', NULL, '2023-06');
INSERT INTO `bookkeeping_dashboard_list` (`bk_id`, `sort_id`, `expenditure_type`, `list_name`, `list_amount`, `list_date`) VALUES (825901, 10, 855669, 'other', NULL, '2023-06');
COMMIT;

-- ----------------------------
-- Table structure for bookkeeping_list
-- ----------------------------
DROP TABLE IF EXISTS `bookkeeping_list`;
CREATE TABLE `bookkeeping_list` (
  `bk_id` int(255) NOT NULL,
  `sort_id` int(255) NOT NULL AUTO_INCREMENT,
  `expenditure_item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expenditure_method` int(255) DEFAULT NULL,
  `expenditure_type` int(255) DEFAULT NULL,
  `expenditure_amount` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `startDate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createDate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sort_id`,`bk_id`) USING BTREE,
  KEY `usr` (`bk_id`),
  KEY `type` (`expenditure_type`),
  KEY `method` (`expenditure_method`),
  CONSTRAINT `method` FOREIGN KEY (`expenditure_method`) REFERENCES `bookkeeping_method` (`method_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `type` FOREIGN KEY (`expenditure_type`) REFERENCES `bookkeeping_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usr` FOREIGN KEY (`bk_id`) REFERENCES `bookkeeping_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bookkeeping_list
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bookkeeping_method
-- ----------------------------
DROP TABLE IF EXISTS `bookkeeping_method`;
CREATE TABLE `bookkeeping_method` (
  `bk_method_id` int(255) DEFAULT NULL,
  `method_id` int(255) NOT NULL,
  `method_sort_id` int(255) NOT NULL AUTO_INCREMENT,
  `method_dict` int(255) DEFAULT NULL,
  `method_content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `del_state` int(1) DEFAULT '0',
  PRIMARY KEY (`method_sort_id`,`method_id`) USING BTREE,
  KEY `method_dict` (`method_dict`),
  KEY `bk_method` (`bk_method_id`),
  KEY `method_id` (`method_id`),
  CONSTRAINT `bk_method` FOREIGN KEY (`bk_method_id`) REFERENCES `bookkeeping_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bookkeeping_method
-- ----------------------------
BEGIN;
INSERT INTO `bookkeeping_method` (`bk_method_id`, `method_id`, `method_sort_id`, `method_dict`, `method_content`, `del_state`) VALUES (825901, 950617, 5, 0, 'AliPay', 0);
INSERT INTO `bookkeeping_method` (`bk_method_id`, `method_id`, `method_sort_id`, `method_dict`, `method_content`, `del_state`) VALUES (825901, 977656, 6, 1, 'ICBC', 0);
INSERT INTO `bookkeeping_method` (`bk_method_id`, `method_id`, `method_sort_id`, `method_dict`, `method_content`, `del_state`) VALUES (825901, 636974, 7, 2, 'CMB', 0);
INSERT INTO `bookkeeping_method` (`bk_method_id`, `method_id`, `method_sort_id`, `method_dict`, `method_content`, `del_state`) VALUES (825901, 891577, 8, 3, 'ABC', 0);
COMMIT;

-- ----------------------------
-- Table structure for bookkeeping_schedule
-- ----------------------------
DROP TABLE IF EXISTS `bookkeeping_schedule`;
CREATE TABLE `bookkeeping_schedule` (
  `bk_id` int(255) DEFAULT NULL,
  `sort_id` int(255) NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createDate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(1) DEFAULT '0',
  PRIMARY KEY (`sort_id`),
  KEY `role_id` (`bk_id`),
  CONSTRAINT `role_id` FOREIGN KEY (`bk_id`) REFERENCES `bookkeeping_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bookkeeping_schedule
-- ----------------------------
BEGIN;
INSERT INTO `bookkeeping_schedule` (`bk_id`, `sort_id`, `topic`, `details`, `createDate`, `state`) VALUES (825901, 1, '1', '1', '2023-06-21', 0);
COMMIT;

-- ----------------------------
-- Table structure for bookkeeping_type
-- ----------------------------
DROP TABLE IF EXISTS `bookkeeping_type`;
CREATE TABLE `bookkeeping_type` (
  `bk_type_id` int(255) DEFAULT NULL,
  `type_id` int(255) NOT NULL,
  `type_sort_id` int(255) NOT NULL AUTO_INCREMENT,
  `type_dict` int(255) DEFAULT NULL,
  `type_content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `del_state` int(1) DEFAULT '0',
  PRIMARY KEY (`type_sort_id`,`type_id`) USING BTREE,
  KEY `type_dict` (`type_dict`),
  KEY `bk_type` (`bk_type_id`),
  KEY `type_id` (`type_id`),
  KEY `type_content` (`type_content`),
  KEY `type_id_2` (`type_id`,`type_content`),
  CONSTRAINT `bk_type` FOREIGN KEY (`bk_type_id`) REFERENCES `bookkeeping_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bookkeeping_type
-- ----------------------------
BEGIN;
INSERT INTO `bookkeeping_type` (`bk_type_id`, `type_id`, `type_sort_id`, `type_dict`, `type_content`, `del_state`) VALUES (825901, 546963, 11, 0, 'income', 0);
INSERT INTO `bookkeeping_type` (`bk_type_id`, `type_id`, `type_sort_id`, `type_dict`, `type_content`, `del_state`) VALUES (825901, 600856, 12, 1, 'living', 0);
INSERT INTO `bookkeeping_type` (`bk_type_id`, `type_id`, `type_sort_id`, `type_dict`, `type_content`, `del_state`) VALUES (825901, 659537, 13, 2, 'vegetables&fruits', 0);
INSERT INTO `bookkeeping_type` (`bk_type_id`, `type_id`, `type_sort_id`, `type_dict`, `type_content`, `del_state`) VALUES (825901, 386515, 14, 3, 'food', 0);
INSERT INTO `bookkeeping_type` (`bk_type_id`, `type_id`, `type_sort_id`, `type_dict`, `type_content`, `del_state`) VALUES (825901, 189267, 15, 4, 'snack', 0);
INSERT INTO `bookkeeping_type` (`bk_type_id`, `type_id`, `type_sort_id`, `type_dict`, `type_content`, `del_state`) VALUES (825901, 786789, 16, 5, 'traffic', 0);
INSERT INTO `bookkeeping_type` (`bk_type_id`, `type_id`, `type_sort_id`, `type_dict`, `type_content`, `del_state`) VALUES (825901, 366144, 17, 6, 'Credit', 0);
INSERT INTO `bookkeeping_type` (`bk_type_id`, `type_id`, `type_sort_id`, `type_dict`, `type_content`, `del_state`) VALUES (825901, 470356, 18, 7, 'shopping', 0);
INSERT INTO `bookkeeping_type` (`bk_type_id`, `type_id`, `type_sort_id`, `type_dict`, `type_content`, `del_state`) VALUES (825901, 253347, 19, 8, 'deer', 0);
INSERT INTO `bookkeeping_type` (`bk_type_id`, `type_id`, `type_sort_id`, `type_dict`, `type_content`, `del_state`) VALUES (825901, 855669, 20, 9, 'other', 0);
COMMIT;

-- ----------------------------
-- Table structure for bookkeeping_user
-- ----------------------------
DROP TABLE IF EXISTS `bookkeeping_user`;
CREATE TABLE `bookkeeping_user` (
  `user_id` int(255) NOT NULL,
  `user_state` int(1) DEFAULT '0',
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nick_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bookkeeping_user
-- ----------------------------
BEGIN;
INSERT INTO `bookkeeping_user` (`user_id`, `user_state`, `user_name`, `nick_name`, `user_password`) VALUES (825901, 0, 'zhangxiaolu', 'Hsielu Chang', '123456');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
