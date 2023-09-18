/*
 Navicat Premium Data Transfer

 Source Server         : cloud
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : 121.229.99.43:3306
 Source Schema         : bookkeeping_v4

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 15/09/2023 17:25:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bookkeeping_calendar
-- ----------------------------
DROP TABLE IF EXISTS `bookkeeping_calendar`;
CREATE TABLE `bookkeeping_calendar` (
  `bk_id` int(11) DEFAULT NULL,
  `calendar_id` int(11) NOT NULL AUTO_INCREMENT,
  `years` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `months` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `days` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contentA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `statusA` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contentB` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `statusB` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contentAtext` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contentBtext` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `others` varchar(10000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `othersStatus` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`calendar_id`),
  KEY `can_id` (`bk_id`),
  CONSTRAINT `can_id` FOREIGN KEY (`bk_id`) REFERENCES `bookkeeping_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bookkeeping_calendar
-- ----------------------------
BEGIN;
INSERT INTO `bookkeeping_calendar` (`bk_id`, `calendar_id`, `years`, `months`, `days`, `contentA`, `statusA`, `contentB`, `statusB`, `contentAtext`, `contentBtext`, `others`, `othersStatus`) VALUES (825901, 22, '2023', '07', '14', '健身', '0', '每日练习', '0', '晚上有氧40分钟', '做题', NULL, NULL);
INSERT INTO `bookkeeping_calendar` (`bk_id`, `calendar_id`, `years`, `months`, `days`, `contentA`, `statusA`, `contentB`, `statusB`, `contentAtext`, `contentBtext`, `others`, `othersStatus`) VALUES (825901, 23, '2023', '07', '17', '健身', '0', '复习', '0', '上午有氧\n下午力量', '错题看一遍\n4套每日练习', '考勤表', '0');
INSERT INTO `bookkeeping_calendar` (`bk_id`, `calendar_id`, `years`, `months`, `days`, `contentA`, `statusA`, `contentB`, `statusB`, `contentAtext`, `contentBtext`, `others`, `othersStatus`) VALUES (825901, 24, '2023', '07', '18', '健身', '0', '学习', '0', '上午有氧\n下午力量', '一模错题', '考勤表', '0');
INSERT INTO `bookkeeping_calendar` (`bk_id`, `calendar_id`, `years`, `months`, `days`, `contentA`, `statusA`, `contentB`, `statusB`, `contentAtext`, `contentBtext`, `others`, `othersStatus`) VALUES (825901, 25, '2023', '08', '05', '上坟', '0', '做题考试', '1', NULL, NULL, '打篮球', '0');
INSERT INTO `bookkeeping_calendar` (`bk_id`, `calendar_id`, `years`, `months`, `days`, `contentA`, `statusA`, `contentB`, `statusB`, `contentAtext`, `contentBtext`, `others`, `othersStatus`) VALUES (825901, 26, '2023', '08', '06', 'big mom', '1', '报警', '1', 'zxl', NULL, NULL, NULL);
INSERT INTO `bookkeeping_calendar` (`bk_id`, `calendar_id`, `years`, `months`, `days`, `contentA`, `statusA`, `contentB`, `statusB`, `contentAtext`, `contentBtext`, `others`, `othersStatus`) VALUES (825901, 27, '2023', '08', '08', '每日一练', '0', '冲刺模考', '1', NULL, NULL, '直播课', '0');
INSERT INTO `bookkeeping_calendar` (`bk_id`, `calendar_id`, `years`, `months`, `days`, `contentA`, `statusA`, `contentB`, `statusB`, `contentAtext`, `contentBtext`, `others`, `othersStatus`) VALUES (825901, 28, '2023', '08', '10', '每日一练', '0', '刷题', '1', NULL, NULL, NULL, NULL);
INSERT INTO `bookkeeping_calendar` (`bk_id`, `calendar_id`, `years`, `months`, `days`, `contentA`, `statusA`, `contentB`, `statusB`, `contentAtext`, `contentBtext`, `others`, `othersStatus`) VALUES (825901, 29, '2023', '09', '13', 'big mom', '0', NULL, NULL, 'zxl', NULL, NULL, NULL);
INSERT INTO `bookkeeping_calendar` (`bk_id`, `calendar_id`, `years`, `months`, `days`, `contentA`, `statusA`, `contentB`, `statusB`, `contentAtext`, `contentBtext`, `others`, `othersStatus`) VALUES (825901, 30, '2023', '06', '29', 'big mom ', '0', NULL, NULL, 'zxl', NULL, NULL, NULL);
INSERT INTO `bookkeeping_calendar` (`bk_id`, `calendar_id`, `years`, `months`, `days`, `contentA`, `statusA`, `contentB`, `statusB`, `contentAtext`, `contentBtext`, `others`, `othersStatus`) VALUES (825901, 31, '2023', '05', '29', 'big mom', '0', NULL, NULL, 'zxl', NULL, NULL, NULL);
INSERT INTO `bookkeeping_calendar` (`bk_id`, `calendar_id`, `years`, `months`, `days`, `contentA`, `statusA`, `contentB`, `statusB`, `contentAtext`, `contentBtext`, `others`, `othersStatus`) VALUES (825901, 32, '2023', '04', '04', 'big mom ', '0', NULL, NULL, 'zxl', NULL, NULL, NULL);
INSERT INTO `bookkeeping_calendar` (`bk_id`, `calendar_id`, `years`, `months`, `days`, `contentA`, `statusA`, `contentB`, `statusB`, `contentAtext`, `contentBtext`, `others`, `othersStatus`) VALUES (825901, 33, '2023', '01', '26', 'big mom ', '0', NULL, NULL, 'zxl', NULL, NULL, NULL);
COMMIT;

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
INSERT INTO `bookkeeping_dashboard` (`depend_id`, `bk_residue`, `bk_limit`) VALUES (825901, '917', '1500');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bookkeeping_dashboard_list
-- ----------------------------
BEGIN;
INSERT INTO `bookkeeping_dashboard_list` (`bk_id`, `sort_id`, `expenditure_type`, `list_name`, `list_amount`, `list_date`) VALUES (825901, 1, 546963, 'income', '3559.8', '2023-08');
INSERT INTO `bookkeeping_dashboard_list` (`bk_id`, `sort_id`, `expenditure_type`, `list_name`, `list_amount`, `list_date`) VALUES (825901, 2, 600856, 'living', '159.43', '2023-08');
INSERT INTO `bookkeeping_dashboard_list` (`bk_id`, `sort_id`, `expenditure_type`, `list_name`, `list_amount`, `list_date`) VALUES (825901, 3, 659537, 'veg&frt', '2.1', '2023-08');
INSERT INTO `bookkeeping_dashboard_list` (`bk_id`, `sort_id`, `expenditure_type`, `list_name`, `list_amount`, `list_date`) VALUES (825901, 4, 386515, 'food', '564.47', '2023-08');
INSERT INTO `bookkeeping_dashboard_list` (`bk_id`, `sort_id`, `expenditure_type`, `list_name`, `list_amount`, `list_date`) VALUES (825901, 5, 189267, 'snack', '271.13', '2023-08');
INSERT INTO `bookkeeping_dashboard_list` (`bk_id`, `sort_id`, `expenditure_type`, `list_name`, `list_amount`, `list_date`) VALUES (825901, 6, 786789, 'traffic', '383.46', '2023-08');
INSERT INTO `bookkeeping_dashboard_list` (`bk_id`, `sort_id`, `expenditure_type`, `list_name`, `list_amount`, `list_date`) VALUES (825901, 7, 366144, 'Credit', NULL, '2023-08');
INSERT INTO `bookkeeping_dashboard_list` (`bk_id`, `sort_id`, `expenditure_type`, `list_name`, `list_amount`, `list_date`) VALUES (825901, 8, 470356, 'OLshopping', '1374.3', '2023-08');
INSERT INTO `bookkeeping_dashboard_list` (`bk_id`, `sort_id`, `expenditure_type`, `list_name`, `list_amount`, `list_date`) VALUES (825901, 9, 253347, 'deer', '225.91', '2023-08');
INSERT INTO `bookkeeping_dashboard_list` (`bk_id`, `sort_id`, `expenditure_type`, `list_name`, `list_amount`, `list_date`) VALUES (825901, 10, 855669, 'other', '1000', '2023-08');
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
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bookkeeping_list
-- ----------------------------
BEGIN;
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 23, '哈罗', 977656, 786789, '1.5', '2023-07-01', '2023-07-01');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 24, '早点', 977656, 386515, '10', '2023-07-01', '2023-07-01');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 25, '打车', 977656, 786789, '26.46', '2023-07-01', '2023-07-01');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 26, '公交车', 977656, 786789, '5', '2023-07-01', '2023-07-01');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 27, '便利蜂', 977656, 386515, '13.3', '2023-07-01', '2023-07-01');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 28, '水', 977656, 386515, '12', '2023-07-01', '2023-07-01');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 29, '刀削面', 977656, 386515, '22', '2023-07-01', '2023-07-01');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 30, '甜啦啦', 977656, 189267, '8', '2023-07-01', '2023-07-01');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 31, '酸梅汤', 977656, 470356, '19.8', '2023-07-01', '2023-07-02');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 32, '起点', 977656, 470356, '6', '2023-07-01', '2023-07-03');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 33, '健身卡', 977656, 600856, '700', '2023-07-01', '2023-07-09');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 34, '煎饼', 977656, 386515, '15', '2023-07-01', '2023-07-10');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 37, '哈罗', 977656, 786789, '1.5', '2023-07-01', '2023-07-13');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 38, '巴黎贝甜', 977656, 189267, '32', '2023-07-01', '2023-07-13');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 39, '分期', 977656, 366144, '665', '2023-07-01', '2023-07-14');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 40, '瑞幸', 977656, 189267, '9.9', '2023-07-01', '2023-07-14');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 41, '苏打水', 977656, 189267, '3', '2023-07-01', '2023-07-14');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 42, '哈罗', 977656, 786789, '1.5', '2023-07-01', '2023-07-14');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 43, '打车', 977656, 786789, '16.6', '2023-07-01', '2023-07-15');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 44, '宝矿力', 977656, 189267, '6.5', '2023-07-01', '2023-07-15');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 45, '哈罗', 977656, 786789, '1.5', '2023-07-01', '2023-07-15');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 46, '烧麦', 977656, 386515, '112', '2023-07-01', '2023-07-15');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 47, '哈罗', 977656, 786789, '3.8', '2023-07-01', '2023-07-15');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 48, '小笼包', 977656, 386515, '23', '2023-07-01', '2023-07-16');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 49, '新世纪', 977656, 386515, '271', '2023-07-01', '2023-07-16');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 50, '工资', 977656, 546963, '4479.97', '2023-07-01', '2023-07-14');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 51, 'mac保护壳', 977656, 470356, '51.9', '2023-07-01', '2023-07-17');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 52, '充电器', 977656, 470356, '154.9', '2023-07-01', '2023-07-17');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 53, '水', 977656, 189267, '2', '2023-07-01', '2023-07-17');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 54, '微信提现', 977656, 546963, '0.13', '2023-07-01', '2023-07-18');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 55, '洗澡', 977656, 600856, '48', '2023-07-01', '2023-07-18');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 56, '打卤面', 977656, 386515, '12', '2023-07-01', '2023-07-19');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 57, '瑞幸', 977656, 189267, '10', '2023-07-01', '2023-07-21');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 58, '小米巨能写', 977656, 470356, '9.99', '2023-07-01', '2023-07-22');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 59, '哈罗', 977656, 786789, '1.8', '2023-07-01', '2023-07-22');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 60, '菜刀', 977656, 470356, '128', '2023-07-01', '2023-07-22');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 61, '运费', 977656, 470356, '39.99', '2023-07-01', '2023-07-23');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 62, '小笼包', 977656, 386515, '21', '2023-07-01', '2023-07-25');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 63, '红包', 977656, 546963, '30', '2023-07-01', '2023-07-25');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 64, '咸鱼', 977656, 546963, '349.8', '2023-07-01', '2023-07-26');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 65, '红包', 977656, 253347, '40.8', '2023-07-01', '2023-07-26');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 66, '天猫超市', 977656, 470356, '17.7', '2023-07-01', '2023-07-26');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 67, '哈罗', 977656, 786789, '1.3', '2023-07-01', '2023-07-26');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 68, '显示器', 977656, 470356, '699', '2023-07-01', '2023-07-27');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 69, '瑞幸', 977656, 189267, '10', '2023-07-01', '2023-07-28');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 71, '小龙虾', 977656, 253347, '100', '2023-07-01', '2023-07-29');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 72, '小龙虾快递', 977656, 253347, '24', '2023-07-01', '2023-07-30');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 73, '烤箱', 977656, 855669, '69', '2023-07-01', '2023-07-30');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 74, '鲜果时光', 977656, 189267, '15', '2023-08-01', '2023-08-01');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 75, '电解水', 977656, 189267, '6', '2023-08-01', '2023-08-01');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 76, '红包', 977656, 546963, '20', '2023-08-01', '2023-08-02');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 77, '手办', 977656, 470356, '99', '2023-08-01', '2023-08-02');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 78, '瑞幸', 977656, 189267, '10', '2023-08-01', '2023-08-03');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 79, '火车票', 977656, 786789, '90', '2023-08-01', '2023-08-03');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 80, '自行车', 977656, 470356, '377', '2023-08-01', '2023-08-03');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 81, '借钱', 977656, 855669, '500', '2023-08-01', '2023-08-04');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 82, '猫眼', 977656, 470356, '372', '2023-08-01', '2023-08-04');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 83, '电解水', 977656, 189267, '6', '2023-08-01', '2023-08-04');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 84, '押金', 977656, 546963, '1737.5', '2023-08-01', '2023-08-04');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 85, '还款', 977656, 546963, '646.7', '2023-08-01', '2023-08-05');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 86, '蛋挞', 977656, 470356, '55.2', '2023-08-01', '2023-08-05');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 87, '甜啦啦', 977656, 253347, '6', '2023-08-01', '2023-08-06');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 88, '江南糕点', 977656, 253347, '14', '2023-08-01', '2023-08-06');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 89, '表带', 977656, 470356, '43.2', '2023-08-01', '2023-08-08');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 90, '游戏币', 977656, 253347, '23.9', '2023-08-01', '2023-08-08');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 91, '收债', 977656, 546963, '199.1', '2023-08-01', '2023-08-08');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 92, '披萨', 977656, 386515, '50.8', '2023-08-01', '2023-08-08');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 93, '炸鸡', 977656, 386515, '16', '2023-08-01', '2023-08-08');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 94, '提现', 977656, 546963, '70.8', '2023-08-01', '2023-08-08');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 95, '电解水', 977656, 189267, '6', '2023-08-01', '2023-08-08');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 96, '洗澡', 977656, 600856, '48', '2023-08-01', '2023-08-08');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 97, '石膏娃娃', 977656, 253347, '38.8', '2023-08-01', '2023-08-09');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 98, '游戏币', 977656, 470356, '29.9', '2023-08-01', '2023-08-09');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 99, '美团单车', 977656, 786789, '1.5', '2023-08-01', '2023-08-09');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 100, '电影票', 977656, 470356, '30', '2023-08-01', '2023-08-10');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 101, '收债', 977656, 546963, '299.2', '2023-08-01', '2023-08-10');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 102, '哈罗', 977656, 786789, '3.3', '2023-08-01', '2023-08-10');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 103, '沃尔玛', 977656, 253347, '54.81', '2023-08-01', '2023-08-10');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 104, '抓娃娃', 977656, 253347, '39.9', '2023-08-01', '2023-08-11');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 105, '拌饭', 977656, 386515, '47', '2023-08-01', '2023-08-11');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 106, '星巴克', 977656, 189267, '29.83', '2023-08-01', '2023-08-11');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 107, '电影票', 977656, 470356, '40', '2023-08-01', '2023-08-11');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 108, '披萨', 977656, 386515, '220', '2023-08-01', '2023-08-11');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 109, '花小猪', 977656, 786789, '46.16', '2023-08-01', '2023-08-11');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 110, '退款', 977656, 546963, '372', '2023-08-01', '2023-08-11');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 111, '挂号', 977656, 600856, '20', '2023-08-01', '2023-08-13');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 112, '便利店', 977656, 386515, '10.5', '2023-08-01', '2023-08-13');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 113, '止疼药', 977656, 600856, '5.53', '2023-08-01', '2023-08-13');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 114, '唐久', 977656, 386515, '20.67', '2023-08-01', '2023-08-13');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 115, '刮胡刀头', 977656, 600856, '29.9', '2023-08-01', '2023-08-13');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 116, '买菜', 977656, 659537, '2.1', '2023-08-01', '2023-08-14');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 117, '星巴克', 977656, 189267, '42', '2023-08-01', '2023-08-15');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 118, '打印', 977656, 600856, '1', '2023-08-01', '2023-08-15');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 119, '茶百道', 977656, 189267, '18', '2023-08-01', '2023-08-17');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 120, '唐久', 977656, 189267, '7.5', '2023-08-01', '2023-08-17');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 121, '蛋挞皮', 977656, 189267, '29.8', '2023-08-01', '2023-08-17');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 122, '外星人', 977656, 189267, '6.5', '2023-08-01', '2023-08-18');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 123, '苏打水', 977656, 189267, '6', '2023-08-01', '2023-08-20');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 124, '火车票', 977656, 786789, '143', '2023-08-01', '2023-08-20');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 125, '茶百道', 977656, 189267, '34', '2023-08-01', '2023-08-20');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 126, '火车票', 977656, 786789, '90', '2023-08-01', '2023-08-22');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 127, '红包', 977656, 546963, '14.5', '2023-08-01', '2023-08-23');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 128, '礼物', 977656, 470356, '149', '2023-08-01', '2023-08-23');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 129, '朴氏拌饭', 977656, 386515, '23', '2023-08-01', '2023-08-23');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 130, '茶百道', 977656, 189267, '16', '2023-08-01', '2023-08-23');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 131, '外星人', 977656, 189267, '6', '2023-08-01', '2023-08-24');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 132, '东方削面', 977656, 386515, '38', '2023-08-01', '2023-08-24');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 133, '洗澡', 977656, 600856, '55', '2023-08-01', '2023-08-24');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 134, '豆面', 977656, 386515, '13', '2023-08-01', '2023-08-25');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 135, '报销', 977656, 546963, '200', '2023-08-01', '2023-08-25');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 136, '加湿器', 977656, 470356, '179', '2023-08-01', '2023-08-26');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 137, '借钱', 977656, 855669, '500', '2023-08-01', '2023-08-26');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 138, '蛋挞', 977656, 189267, '14', '2023-08-01', '2023-08-28');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 139, '哈罗', 977656, 786789, '3', '2023-08-01', '2023-08-29');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 140, '臭豆腐', 977656, 189267, '10', '2023-08-01', '2023-08-29');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 141, '海鹏', 977656, 253347, '18', '2023-08-01', '2023-08-29');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 142, '超市', 977656, 386515, '17.5', '2023-08-01', '2023-08-29');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 143, '打卤面', 977656, 386515, '21', '2023-08-01', '2023-08-30');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 144, '瑞幸', 977656, 253347, '9.9', '2023-08-01', '2023-08-30');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 145, '凯鸽', 977656, 386515, '87', '2023-08-01', '2023-08-31');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 146, '游戏币', 977656, 253347, '20.6', '2023-08-01', '2023-08-31');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 147, '椰子雪糕', 977656, 189267, '8.5', '2023-08-01', '2023-08-31');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 148, '打车', 977656, 786789, '6.5', '2023-08-01', '2023-08-31');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 149, '修正带', 977656, 600856, '7', '2023-09-01', '2023-09-01');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 150, '运费', 977656, 253347, '3', '2023-09-01', '2023-09-01');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 151, '抖+', 977656, 470356, '30', '2023-09-01', '2023-09-02');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 152, '电话费', 977656, 600856, '180', '2023-09-01', '2023-09-03');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 153, '电视家', 977656, 470356, '8', '2023-09-01', '2023-09-03');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 154, '茶叶', 977656, 470356, '400', '2023-09-01', '2023-09-03');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 155, '电池', 977656, 600856, '14', '2023-09-01', '2023-09-04');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 156, '存款', 977656, 546963, '200', '2023-09-01', '2023-09-04');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 157, 'DP线', 977656, 470356, '26', '2023-09-01', '2023-09-05');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 158, '豆面', 977656, 386515, '13', '2023-09-01', '2023-09-05');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 159, '捐款', 977656, 470356, '20', '2023-09-01', '2023-09-05');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 160, 'LOGO', 977656, 470356, '15', '2023-09-01', '2023-09-05');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 161, '灌饼', 977656, 386515, '6', '2023-09-01', '2023-09-06');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 162, '洗澡', 977656, 600856, '48', '2023-09-01', '2023-09-07');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 163, '寄快递', 977656, 253347, '10', '2023-09-01', '2023-09-07');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 164, '盲盒', 977656, 253347, '49', '2023-09-01', '2023-09-08');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 165, '喜茶', 977656, 189267, '8', '2023-09-01', '2023-09-08');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 166, 'Adobe', 977656, 470356, '17', '2023-09-01', '2023-09-08');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 167, '打车', 977656, 253347, '58.04', '2023-09-01', '2023-09-09');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 168, '海鹏', 977656, 253347, '30.97', '2023-09-01', '2023-09-09');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 169, '乐乐茶', 977656, 253347, '20', '2023-09-01', '2023-09-09');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 170, '玩偶', 977656, 470356, '14.99', '2023-09-01', '2023-09-09');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 171, '借钱', 977656, 855669, '200', '2023-09-01', '2023-09-10');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 172, '转移钱', 977656, 855669, '100', '2023-09-01', '2023-09-10');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 173, '生活费', 977656, 546963, '1000.5', '2023-09-01', '2023-09-11');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 174, '酸辣粉', 977656, 386515, '26', '2023-09-01', '2023-09-12');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 175, '灌饼', 977656, 386515, '7.5', '2023-09-01', '2023-09-13');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 176, '凯鸽', 977656, 386515, '53', '2023-09-01', '2023-09-13');
INSERT INTO `bookkeeping_list` (`bk_id`, `sort_id`, `expenditure_item`, `expenditure_method`, `expenditure_type`, `expenditure_amount`, `startDate`, `createDate`) VALUES (825901, 177, '肯德基', 977656, 386515, '30', '2023-09-01', '2023-09-14');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bookkeeping_method
-- ----------------------------
BEGIN;
INSERT INTO `bookkeeping_method` (`bk_method_id`, `method_id`, `method_sort_id`, `method_dict`, `method_content`, `del_state`) VALUES (825901, 950617, 5, 0, 'AliPay', 0);
INSERT INTO `bookkeeping_method` (`bk_method_id`, `method_id`, `method_sort_id`, `method_dict`, `method_content`, `del_state`) VALUES (825901, 977656, 6, 1, 'ICBC', 0);
INSERT INTO `bookkeeping_method` (`bk_method_id`, `method_id`, `method_sort_id`, `method_dict`, `method_content`, `del_state`) VALUES (825901, 636974, 7, 2, 'CMB', 0);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bookkeeping_schedule
-- ----------------------------
BEGIN;
INSERT INTO `bookkeeping_schedule` (`bk_id`, `sort_id`, `topic`, `details`, `createDate`, `state`) VALUES (825901, 2, '备考PMP', '～', '2023-07-01', 1);
INSERT INTO `bookkeeping_schedule` (`bk_id`, `sort_id`, `topic`, `details`, `createDate`, `state`) VALUES (825901, 3, '分期还款', '10530/13798', '2023-07-01', 0);
INSERT INTO `bookkeeping_schedule` (`bk_id`, `sort_id`, `topic`, `details`, `createDate`, `state`) VALUES (825901, 4, '分期还款', '16/24', '2023-07-01', 0);
INSERT INTO `bookkeeping_schedule` (`bk_id`, `sort_id`, `topic`, `details`, `createDate`, `state`) VALUES (825901, 6, '分期和尾款定值', '4070', '2023-08-05', 0);
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
INSERT INTO `bookkeeping_type` (`bk_type_id`, `type_id`, `type_sort_id`, `type_dict`, `type_content`, `del_state`) VALUES (825901, 659537, 13, 2, 'veg&frt', 0);
INSERT INTO `bookkeeping_type` (`bk_type_id`, `type_id`, `type_sort_id`, `type_dict`, `type_content`, `del_state`) VALUES (825901, 386515, 14, 3, 'food', 0);
INSERT INTO `bookkeeping_type` (`bk_type_id`, `type_id`, `type_sort_id`, `type_dict`, `type_content`, `del_state`) VALUES (825901, 189267, 15, 4, 'snack', 0);
INSERT INTO `bookkeeping_type` (`bk_type_id`, `type_id`, `type_sort_id`, `type_dict`, `type_content`, `del_state`) VALUES (825901, 786789, 16, 5, 'traffic', 0);
INSERT INTO `bookkeeping_type` (`bk_type_id`, `type_id`, `type_sort_id`, `type_dict`, `type_content`, `del_state`) VALUES (825901, 366144, 17, 6, 'Credit', 0);
INSERT INTO `bookkeeping_type` (`bk_type_id`, `type_id`, `type_sort_id`, `type_dict`, `type_content`, `del_state`) VALUES (825901, 470356, 18, 7, 'OLshopping', 0);
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
INSERT INTO `bookkeeping_user` (`user_id`, `user_state`, `user_name`, `nick_name`, `user_password`) VALUES (825901, 0, 'wangxinyu', 'Hsyin Wang', '123456');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
