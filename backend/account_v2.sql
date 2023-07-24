/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : account

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 08/04/2023 17:08:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for expenditurestatistics
-- ----------------------------
DROP TABLE IF EXISTS `expenditurestatistics`;
CREATE TABLE `expenditurestatistics` (
  `id` int(1) NOT NULL AUTO_INCREMENT COMMENT '标识\n',
  `item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '内容',
  `payWay` int(1) DEFAULT NULL COMMENT '0:花呗\n1:工行\n2:招行\n3:农行',
  `payType` int(1) DEFAULT NULL COMMENT '0:房租水电\n1:买菜\n2:零食\n3:交通\n4:还款\n5:人情礼品\n6:其他',
  `amount` double(255,2) DEFAULT NULL COMMENT '金额',
  `startDate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '起始日期',
  `createDate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建日期\n',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `payType` (`payType`),
  KEY `payWay` (`payWay`),
  CONSTRAINT `payType` FOREIGN KEY (`payType`) REFERENCES `payType` (`type_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payWay` FOREIGN KEY (`payWay`) REFERENCES `payWay` (`way_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=489 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of expenditurestatistics
-- ----------------------------
BEGIN;
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (43, '哈罗月卡', 1, 3, 12.20, '2022-12-01', '2022-12-01');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (44, '哈罗单车', 1, 3, 1.00, '2022-12-01', '2022-12-01');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (45, '美团买药', 1, 7, 80.37, '2022-12-01', '2022-12-01');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (46, '面包+豆浆', 1, 7, 11.50, '2022-12-01', '2022-12-02');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (47, '烤肉饭', 1, 7, 20.19, '2022-12-01', '2022-12-02');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (48, '工卡', 1, 5, 20.00, '2022-12-01', '2022-12-02');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (49, '电话费', 1, 7, 129.99, '2022-12-01', '2022-12-03');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (50, '面包', 1, 7, 9.50, '2022-12-01', '2022-12-03');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (51, '公交卡', 1, 3, 11.00, '2022-12-01', '2022-12-04');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (52, '灌饼', 1, 7, 11.00, '2022-12-01', '2022-12-04');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (53, '椰汁', 1, 2, 15.00, '2022-12-01', '2022-12-04');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (54, '锅仔', 2, 7, 46.00, '2022-12-01', '2022-12-04');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (55, '鸡腿香菇', 1, 1, 11.80, '2022-12-01', '2022-12-05');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (56, '馒头', 1, 1, 1.40, '2022-12-01', '2022-12-05');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (57, '麦当劳', 2, 5, 118.90, '2022-12-01', '2022-12-06');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (58, '关东煮', 1, 5, 12.60, '2022-12-01', '2022-12-06');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (59, '大波浪薯片', 0, 5, 29.90, '2022-12-01', '2022-12-06');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (60, '鞋', 0, 5, 260.50, '2022-12-01', '2022-11-30');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (61, '红包', 2, 5, 88.00, '2022-12-01', '2022-12-05');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (62, '土豆', 2, 1, 2.90, '2022-12-01', '2022-12-07');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (63, '鸡蛋', 2, 1, 15.00, '2022-12-01', '2022-12-07');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (64, '花呗还款', 2, 4, 260.50, '2022-12-01', '2022-12-08');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (65, '面条', 2, 1, 3.90, '2022-12-01', '2022-12-08');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (66, '宽粉', 2, 1, 25.60, '2022-12-01', '2022-12-08');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (67, '水', 2, 1, 2.20, '2022-12-01', '2022-12-08');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (68, '肉馅', 2, 1, 25.90, '2022-12-01', '2022-12-09');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (69, '公交卡', 1, 3, 16.00, '2022-12-01', '2022-12-10');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (70, '肯德基', 1, 2, 13.00, '2022-12-01', '2022-12-10');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (71, '矿泉水', 1, 7, 3.00, '2022-12-01', '2022-12-10');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (72, '眼镜', 1, 5, 300.00, '2022-12-01', '2022-12-10');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (73, '晚饭', 1, 7, 75.00, '2022-12-01', '2022-12-10');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (74, '证件照', 1, 5, 220.00, '2022-12-01', '2022-12-11');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (75, '电费', 1, 0, 100.30, '2022-12-01', '2022-12-11');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (76, '8', 1, 3, 8.00, '2022-12-01', '2022-12-11');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (77, '包子', 1, 2, 18.00, '2022-12-01', '2022-12-11');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (78, '面包', 1, 7, 3.80, '2022-12-01', '2022-12-12');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (79, '水果', 1, 1, 30.00, '2022-12-01', '2022-12-13');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (80, '面包', 1, 2, 4.50, '2022-12-01', '2022-12-13');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (81, '布洛芬', 1, 7, 50.00, '2022-12-01', '2022-12-13');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (82, '宝矿力', 1, 7, 15.00, '2022-12-01', '2022-12-13');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (83, '水', 1, 1, 2.20, '2022-12-01', '2022-12-13');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (84, '土豆丝盖饭', 1, 7, 22.00, '2022-12-01', '2022-12-13');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (85, '酸菜肉丝盖饭', 1, 1, 14.00, '2022-12-01', '2022-12-14');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (86, '手套', 1, 7, 190.00, '2022-12-01', '2022-12-14');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (87, '面包', 1, 2, 14.00, '2022-12-01', '2022-12-15');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (88, '罐头', 1, 2, 14.00, '2022-12-01', '2022-12-15');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (89, '水', 1, 7, 2.20, '2022-12-01', '2022-12-15');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (90, '工资', 2, 6, 6676.75, '2022-12-01', '2022-12-15');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (91, '主食', 1, 1, 18.00, '2022-12-01', '2022-12-16');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (92, '买菜', 1, 1, 18.70, '2022-12-01', '2022-12-16');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (93, '验证码', 1, 7, 7.22, '2022-12-01', '2022-12-17');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (94, '公交卡', 1, 3, 28.00, '2022-12-01', '2022-12-18');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (95, '火车票', 1, 3, 109.00, '2022-12-01', '2022-12-18');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (96, '早点', 1, 7, 8.50, '2022-12-01', '2022-12-18');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (97, '打车', 1, 3, 38.51, '2022-12-01', '2022-12-18');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (98, '大铁勺', 1, 5, 254.00, '2022-12-01', '2022-12-18');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (99, '井弘饭团', 1, 7, 32.00, '2022-12-01', '2022-12-18');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (100, '西村叔叔', 1, 2, 71.00, '2022-12-01', '2022-12-18');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (101, '南洋大师傅', 1, 2, 29.90, '2022-12-01', '2022-12-18');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (102, '土豆丝盖饭', 1, 7, 22.00, '2022-12-01', '2022-12-19');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (103, '烤肠', 1, 7, 4.00, '2022-12-01', '2022-12-19');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (104, '水', 1, 7, 1.80, '2022-12-01', '2022-12-19');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (105, '自行车', 1, 3, 1.50, '2022-12-01', '2022-12-20');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (106, '打车', 1, 3, 23.72, '2022-12-01', '2022-12-20');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (107, '麻辣香锅', 1, 7, 31.15, '2022-12-01', '2022-12-20');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (108, '房租', 1, 0, 1970.00, '2022-12-01', '2022-12-20');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (109, '分期', 1, 4, 665.00, '2022-12-01', '2022-12-20');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (110, '柠檬汁', 1, 2, 9.90, '2022-12-01', '2022-12-20');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (111, '打包盒', 1, 7, 1.00, '2022-12-01', '2022-12-20');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (112, '充电宝', 1, 7, 3.00, '2022-12-01', '2022-12-20');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (113, '自行车', 1, 3, 1.50, '2022-12-01', '2022-12-21');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (114, '饭卡', 1, 7, 10.00, '2022-12-01', '2022-12-21');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (115, '豆浆', 1, 7, 3.00, '2022-12-01', '2022-12-21');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (116, '买菜', 1, 1, 47.10, '2022-12-01', '2022-12-21');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (117, '盖码饭', 1, 7, 14.20, '2022-12-01', '2022-12-21');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (118, '面包', 1, 2, 14.80, '2022-12-01', '2022-12-21');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (119, '盖码饭', 1, 7, 22.00, '2022-12-01', '2022-12-22');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (120, '草莓', 1, 1, 78.50, '2022-12-01', '2022-12-22');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (121, '自行车', 1, 3, 1.50, '2022-12-01', '2022-12-23');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (122, '盖码饭', 1, 7, 17.27, '2022-12-01', '2022-12-23');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (123, '饭店', 1, 7, 51.71, '2022-12-01', '2022-12-23');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (124, '汇源', 1, 7, 15.00, '2022-12-01', '2022-12-23');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (125, '橘子', 1, 1, 12.71, '2022-12-01', '2022-12-24');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (126, '烤肠', 1, 2, 10.00, '2022-12-01', '2022-12-24');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (127, '蛋糕', 1, 2, 15.88, '2022-12-01', '2022-12-24');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (128, 't', 1, 7, 50.90, '2022-12-01', '2022-12-24');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (129, '方便面', 1, 1, 20.69, '2022-12-01', '2022-12-25');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (130, '公交卡', 1, 3, 8.00, '2022-12-01', '2022-12-25');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (131, '冰淇淋', 1, 2, 7.50, '2022-12-01', '2022-12-25');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (132, '711', 1, 2, 14.60, '2022-12-01', '2022-12-25');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (133, '面包', 1, 2, 5.00, '2022-12-01', '2022-12-25');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (134, '午饭', 1, 7, 46.00, '2022-12-01', '2022-12-26');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (135, '买菜', 1, 1, 10.22, '2022-12-01', '2022-12-27');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (136, '电话费', 1, 7, 9.99, '2022-12-01', '2022-12-27');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (138, '债', 1, 5, 520.00, '2022-12-01', '2022-12-28');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (139, '盖饭', 1, 7, 28.82, '2022-12-01', '2022-12-28');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (140, '黄桥烧饼', 1, 2, 26.00, '2022-12-01', '2022-12-28');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (141, '烤鱼', 1, 7, 156.00, '2022-12-01', '2022-12-28');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (142, '果汁', 1, 7, 14.91, '2022-12-01', '2022-12-29');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (143, '电话费', 1, 7, 10.00, '2022-12-01', '2022-12-29');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (144, '金', 1, 6, 4224.00, '2022-12-01', '2022-12-27');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (145, '电费', 1, 0, 40.00, '2022-12-01', '2022-12-30');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (146, '吸尘器', 1, 5, 2199.11, '2022-12-01', '2022-12-30');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (147, '土豆丝盖饭', 1, 7, 11.00, '2022-12-01', '2022-12-30');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (148, '辣条', 1, 2, 5.50, '2022-12-01', '2022-12-30');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (149, '公交卡', 1, 3, 5.00, '2022-12-01', '2022-12-30');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (150, '太二', 1, 7, 179.00, '2022-12-01', '2022-12-30');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (151, '公交卡', 1, 3, 24.00, '2022-12-01', '2022-12-31');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (152, '早点', 1, 2, 17.50, '2022-12-01', '2022-12-31');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (153, '蜜雪冰城', 1, 2, 12.00, '2022-12-01', '2022-12-31');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (154, '盖饭', 2, 8, 23.00, '2023-01-01', '2023-01-01');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (155, '快递', 2, 9, 28.00, '2023-01-01', '2023-01-01');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (156, '火车票退款', 2, 6, 105.00, '2023-01-01', '2023-01-01');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (157, '燃气费', 2, 0, 199.50, '2023-01-01', '2023-01-01');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (158, '生煎套餐', 2, 8, 19.00, '2023-01-01', '2023-01-01');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (159, '利息', 1, 6, 0.02, '2023-01-01', '2023-01-02');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (160, 'QQ红包', 1, 6, 10.82, '2023-01-01', '2023-01-02');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (161, '微信红包', 1, 6, 13.66, '2023-01-01', '2023-01-02');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (162, '超市', 0, 8, 16.50, '2023-01-01', '2023-01-02');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (163, '电话费', 2, 0, 130.00, '2023-01-01', '2023-01-02');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (164, '火车票', 2, 3, 146.00, '2023-01-01', '2023-01-03');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (165, '白菜', 2, 1, 5.00, '2023-01-01', '2023-01-03');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (166, '面包', 2, 2, 20.00, '2023-01-01', '2023-01-04');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (167, '榨菜', 2, 1, 3.00, '2023-01-01', '2023-01-04');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (168, '香菇肉片盖饭', 2, 8, 14.00, '2023-01-01', '2023-01-05');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (169, '加多宝', 2, 8, 4.00, '2023-01-01', '2023-01-05');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (170, '打水', 2, 0, 1.30, '2023-01-01', '2023-01-05');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (171, '面包下午茶', 2, 2, 43.80, '2023-01-01', '2023-01-06');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (172, '微信提现', 2, 6, 0.10, '2023-01-01', '2023-01-06');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (173, '土豆丝盖饭', 2, 8, 11.00, '2023-01-01', '2023-01-06');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (174, '汇源苹果汁', 2, 2, 15.00, '2023-01-01', '2023-01-06');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (175, '单车', 2, 3, 3.00, '2023-01-01', '2023-01-07');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (176, '黄桥烧饼', 2, 8, 19.00, '2023-01-01', '2023-01-07');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (177, '竹乡抄手', 2, 8, 28.00, '2023-01-01', '2023-01-07');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (178, '椰奶', 2, 2, 15.00, '2023-01-01', '2023-01-07');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (179, '饺子', 2, 1, 23.00, '2023-01-01', '2023-01-08');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (180, '白菜炒肉盖饭', 2, 8, 14.00, '2023-01-01', '2023-01-08');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (181, '美汁源', 2, 8, 4.00, '2023-01-01', '2023-01-08');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (182, '冷水费', 2, 0, 136.91, '2023-01-01', '2023-01-08');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (183, '电费', 2, 0, 100.30, '2023-01-01', '2023-01-09');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (184, '大锅菜+饮料', 2, 8, 20.00, '2023-01-01', '2023-01-09');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (185, '微信提现', 2, 6, 0.21, '2023-01-01', '2023-01-09');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (186, '方便面', 2, 1, 5.21, '2023-01-01', '2023-01-09');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (188, '红烧肉', 2, 8, 20.00, '2023-01-01', '2023-01-10');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (189, '差价', 2, 9, 50.00, '2023-01-01', '2023-01-10');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (190, '元宵', 2, 1, 20.00, '2023-01-01', '2023-01-10');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (191, '烤肉饭', 2, 8, 20.00, '2023-01-01', '2023-01-11');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (192, '炒饼', 2, 8, 13.00, '2023-01-01', '2023-01-11');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (193, '膏药', 2, 7, 85.00, '2023-01-01', '2023-01-11');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (194, '豆浆', 2, 8, 3.00, '2023-01-01', '2023-01-12');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (195, '板面', 2, 8, 17.00, '2023-01-01', '2023-01-12');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (196, '土豆丝盖饭', 2, 8, 19.00, '2023-01-01', '2023-01-12');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (197, '打车', 2, 3, 18.46, '2023-01-01', '2023-01-13');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (198, '饺子', 2, 8, 25.00, '2023-01-01', '2023-01-13');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (199, '公交卡', 2, 3, 1.00, '2023-01-01', '2023-01-13');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (200, '蛋糕', 2, 9, 168.00, '2023-01-01', '2023-01-13');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (201, '分期还款', 2, 4, 665.00, '2023-01-01', '2023-01-14');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (202, '红包', 2, 9, 1100.00, '2023-01-01', '2023-01-14');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (203, '工资', 2, 6, 6626.45, '2023-01-01', '2023-01-13');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (204, '打车', 2, 3, 7.00, '2023-01-01', '2023-01-14');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (205, '游戏币', 2, 9, 10.00, '2023-01-01', '2023-01-14');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (206, '水+皮筋', 2, 9, 13.40, '2023-01-01', '2023-01-14');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (207, 'KTV', 2, 9, 76.00, '2023-01-01', '2023-01-14');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (208, '海底捞', 2, 9, 200.00, '2023-01-01', '2023-01-14');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (209, '电费', 2, 0, 99.98, '2023-01-01', '2023-01-14');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (210, '洗澡', 2, 7, 92.00, '2023-01-01', '2023-01-14');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (211, '打车', 2, 3, 16.94, '2023-01-01', '2023-01-15');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (213, '蜜雪冰城', 2, 2, 6.00, '2023-01-01', '2023-01-15');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (214, '打车', 2, 3, 10.74, '2023-01-01', '2023-01-15');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (215, '鞋', 2, 7, 583.00, '2023-01-01', '2023-01-15');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (216, '鞋', 2, 7, 399.00, '2023-01-01', '2023-01-15');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (217, '削面', 2, 8, 23.00, '2023-01-01', '2023-01-15');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (218, '花呗', 2, 4, 52.40, '2023-01-01', '2023-01-15');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (219, '微信提现', 2, 6, 0.19, '2023-01-01', '2023-01-15');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (220, '内存条', 1, 9, 110.00, '2023-01-01', '2023-01-16');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (221, '硬盘', 1, 9, 95.00, '2023-01-01', '2023-01-16');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (222, '应酬', 2, 7, 131.00, '2023-01-01', '2023-01-16');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (223, '电话费', 1, 0, 50.00, '2023-01-01', '2023-01-17');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (224, '蜜雪冰城', 1, 2, 12.00, '2023-01-01', '2023-01-17');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (225, '卖硬盘', 2, 6, 110.00, '2023-01-01', '2023-01-18');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (226, '广顺兴', 0, 8, 370.00, '2023-01-01', '2023-01-17');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (227, '火车票', 2, 3, 470.00, '2023-01-01', '2023-01-19');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (228, '红包', 2, 5, 500.00, '2023-01-01', '2023-01-20');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (229, '房租', 2, 0, 1970.00, '2023-01-01', '2023-01-20');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (230, '报名费', 1, 7, 90.00, '2023-01-01', '2023-01-18');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (231, '灯具', 1, 7, 40.00, '2023-01-01', '2023-01-19');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (232, '游戏币', 1, 5, 100.00, '2023-01-01', '2023-01-19');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (233, '微信提现', 1, 6, 0.09, '2023-01-01', '2023-01-20');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (234, '打车', 1, 3, 14.76, '2023-01-01', '2023-01-20');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (235, '茶百道', 1, 2, 25.00, '2023-01-01', '2023-01-20');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (236, '打车', 1, 3, 13.00, '2023-01-01', '2023-01-20');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (237, '微信提现', 1, 6, 0.99, '2023-01-01', '2023-01-20');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (238, '抢红包', 1, 6, 74.20, '2023-01-01', '2023-01-21');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (239, '红包', 1, 5, 21.71, '2023-01-01', '2023-01-22');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (240, '抖音', 1, 5, 1.00, '2023-01-01', '2023-01-22');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (241, '微信提现', 1, 6, 20.71, '2023-01-01', '2023-01-23');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (242, '打车', 1, 3, 13.58, '2023-01-01', '2023-01-23');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (243, '蜜雪冰城', 1, 2, 12.00, '2023-01-01', '2023-01-23');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (244, '烤串', 1, 8, 122.00, '2023-01-01', '2023-01-23');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (245, 'KTV', 1, 7, 60.00, '2023-01-01', '2023-01-23');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (246, '微信提现', 1, 6, 0.58, '2023-01-01', '2023-01-24');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (247, '打车', 1, 3, 19.26, '2023-01-01', '2023-01-25');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (248, '烤肉饭', 1, 8, 25.00, '2023-01-01', '2023-01-25');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (249, '打车', 1, 3, 19.88, '2023-01-01', '2023-01-25');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (250, '快递', 1, 7, 33.00, '2023-01-01', '2023-01-26');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (251, '打车', 1, 3, 8.27, '2023-01-01', '2023-01-26');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (252, '打车', 1, 3, 8.66, '2023-01-01', '2023-01-26');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (253, '打车', 1, 3, 17.44, '2023-01-01', '2023-01-26');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (254, '烤肠', 1, 2, 6.00, '2023-01-01', '2023-01-26');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (255, '爆米花', 1, 2, 18.00, '2023-01-01', '2023-01-26');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (256, '打车', 1, 3, 19.96, '2023-01-01', '2023-01-26');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (257, '打车', 1, 3, 24.12, '2023-01-01', '2023-01-26');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (258, '洗澡', 1, 7, 48.00, '2023-01-01', '2023-01-26');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (259, '微信充值', 1, 7, 0.41, '2023-01-01', '2023-01-26');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (260, '公交卡', 1, 3, 8.00, '2023-01-01', '2023-01-27');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (261, '打车', 1, 3, 13.76, '2023-01-01', '2023-01-27');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (262, '微信充值', 1, 7, 0.24, '2023-01-01', '2023-01-27');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (263, '黄焖鸡', 1, 8, 17.00, '2023-01-01', '2023-01-28');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (264, '饭卡', 1, 8, 20.00, '2023-01-01', '2023-01-29');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (265, '拌饭酱', 1, 8, 13.50, '2023-01-01', '2023-01-29');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (266, '百度会员', 1, 7, 1.50, '2023-01-01', '2023-01-30');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (267, '水煮鱼', 1, 8, 19.00, '2023-01-01', '2023-01-30');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (268, '火车票', 0, 3, 146.00, '2023-01-01', '2023-01-29');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (269, '自行车', 1, 3, 1.50, '2023-01-01', '2023-01-30');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (270, '油菜', 1, 1, 5.30, '2023-01-01', '2023-01-30');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (271, '辣白菜猪肉双拼', 1, 8, 24.90, '2023-01-01', '2023-01-31');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (272, '辣白菜猪肉', 1, 8, 29.40, '2023-01-01', '2023-01-31');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (273, '打水', 1, 0, 2.30, '2023-01-01', '2023-01-31');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (274, '饭卡', 1, 8, 20.00, '2023-02-01', '2023-02-01');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (275, '酥肉丸子大锅菜', 1, 8, 16.00, '2023-02-01', '2023-02-01');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (276, '蜜雪冰城', 1, 2, 28.20, '2023-02-01', '2023-02-01');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (277, '主食饼', 1, 8, 10.50, '2023-02-01', '2023-02-01');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (278, '微信提现', 1, 6, 0.50, '2023-02-01', '2023-02-01');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (279, '微信提现', 1, 6, 43.00, '2023-02-01', '2023-02-02');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (280, '面包', 1, 2, 12.49, '2023-02-01', '2023-02-02');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (281, '煎饼', 1, 9, 15.00, '2023-02-01', '2023-02-02');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (282, '土豆', 1, 1, 2.70, '2023-02-01', '2023-02-02');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (283, '微信提现', 1, 6, 0.19, '2023-02-01', '2023-02-02');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (284, '牛奶', 1, 8, 2.30, '2023-02-01', '2023-02-03');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (285, '菜', 1, 1, 3.90, '2023-02-01', '2023-02-03');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (286, '面膜', 1, 9, 10.90, '2023-02-01', '2023-02-03');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (287, '花母猪', 1, 3, 44.20, '2023-02-01', '2023-02-04');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (288, '汗巴巴', 1, 8, 300.00, '2023-02-01', '2023-02-04');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (289, '屏幕', 1, 7, 140.00, '2023-02-01', '2023-02-04');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (290, '饺子', 1, 1, 8.00, '2023-02-01', '2023-02-04');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (291, '吸尘器', 2, 0, 199.00, '2023-02-01', '2023-02-04');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (292, '面包', 1, 2, 18.00, '2023-02-01', '2023-02-05');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (293, '大锅菜+饮料', 1, 8, 24.00, '2023-02-01', '2023-02-06');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (294, '微信提现', 1, 6, 0.30, '2023-02-01', '2023-02-07');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (295, '醋+奶', 1, 1, 11.00, '2023-02-01', '2023-02-07');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (296, '公交卡', 1, 3, 10.00, '2023-02-01', '2023-02-07');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (297, '公交卡', 1, 3, 8.00, '2023-02-01', '2023-02-08');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (298, '物业费', 2, 0, 5955.00, '2023-02-01', '2023-02-08');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (299, '打车', 1, 3, 15.61, '2023-02-01', '2023-02-08');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (300, '大铁勺', 1, 8, 78.00, '2023-02-01', '2023-02-08');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (301, '打车', 1, 3, 19.05, '2023-02-01', '2023-02-08');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (302, '宝矿力', 1, 2, 6.49, '2023-02-01', '2023-02-08');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (303, '电脑', 1, 6, 1000.00, '2023-02-01', '2023-02-08');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (304, '充电宝', 1, 7, 3.00, '2023-02-01', '2023-02-08');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (305, '火车票', 1, 3, 109.00, '2023-02-01', '2023-02-08');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (306, '拿铁', 1, 2, 12.00, '2023-02-01', '2023-02-08');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (307, '火车票', 1, 3, 79.00, '2023-02-01', '2023-02-08');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (308, '微信提现', 1, 6, 0.15, '2023-02-01', '2023-02-08');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (309, '蒜苔肉丝盖饭', 1, 8, 15.00, '2023-02-01', '2023-02-08');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (310, '小酥肉', 1, 8, 17.00, '2023-02-01', '2023-02-09');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (311, '抱枕', 1, 0, 59.80, '2023-02-01', '2023-02-09');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (312, '水', 1, 0, 2.50, '2023-02-01', '2023-02-09');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (313, '微信提现', 1, 6, 0.30, '2023-02-01', '2023-02-09');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (314, '虾', 1, 1, 52.50, '2023-02-01', '2023-02-11');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (315, '自行车', 1, 3, 1.50, '2023-02-01', '2023-02-11');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (316, '汇源', 1, 2, 15.00, '2023-02-01', '2023-02-11');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (317, '茶百道', 1, 2, 15.00, '2023-02-01', '2023-02-11');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (318, '面包牛奶', 1, 2, 21.00, '2023-02-01', '2023-02-11');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (319, '电费', 1, 0, 100.00, '2023-02-01', '2023-02-12');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (320, '顺丰', 1, 9, 35.20, '2023-02-01', '2023-02-12');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (321, '顺丰-手机', 1, 5, 12.00, '2023-02-01', '2023-02-12');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (322, '屈臣氏', 1, 6, 10.20, '2023-02-01', '2023-02-12');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (323, '面包+牛奶', 1, 8, 10.30, '2023-02-01', '2023-02-14');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (324, '打水', 1, 0, 2.30, '2023-02-01', '2023-02-14');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (325, '牛奶', 1, 8, 9.00, '2023-02-01', '2023-02-14');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (326, '微信提现', 1, 6, 0.30, '2023-02-01', '2023-02-15');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (327, '面包+豆浆', 1, 8, 8.00, '2023-02-01', '2023-02-15');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (328, '返现', 1, 6, 3.00, '2023-02-01', '2023-02-15');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (329, '水果', 1, 1, 78.15, '2023-02-01', '2023-02-15');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (330, '蜜雪冰城', 1, 2, 18.20, '2023-02-01', '2023-02-15');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (331, '自行车', 1, 3, 3.00, '2023-02-01', '2023-02-15');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (332, '分期还款', 1, 4, 665.00, '2023-02-01', '2023-02-15');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (333, '花呗还款', 2, 4, 516.00, '2023-02-01', '2023-02-15');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (334, '旺仔牛奶', 1, 2, 5.90, '2023-02-01', '2023-02-17');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (335, '工资', 2, 6, 4684.34, '2023-02-01', '2023-02-15');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (336, '房租', 1, 0, 1970.00, '2023-02-01', '2023-02-18');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (337, '虾', 1, 1, 32.70, '2023-02-01', '2023-02-18');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (338, '自行车', 1, 3, 1.50, '2023-02-01', '2023-02-18');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (339, '香菇', 1, 1, 16.80, '2023-02-01', '2023-02-18');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (340, '油菜', 1, 1, 2.60, '2023-02-01', '2023-02-18');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (341, '微信提现', 1, 6, 0.60, '2023-02-01', '2023-02-18');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (342, '火腿肠', 1, 1, 14.50, '2023-02-01', '2023-02-19');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (343, '微信充值', 1, 7, 0.02, '2023-02-01', '2023-02-20');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (344, '打水', 1, 0, 2.00, '2023-02-01', '2023-02-20');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (345, '住宿', 1, 0, 79.00, '2023-02-01', '2023-02-21');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (346, '微信提现', 1, 6, 0.20, '2023-02-01', '2023-02-21');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (347, '烤肉饭', 1, 8, 23.00, '2023-02-01', '2023-02-21');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (348, '话剧', 1, 7, 280.00, '2023-02-01', '2023-02-21');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (349, '公交车', 1, 3, 1.00, '2023-02-01', '2023-02-21');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (350, '饼干', 1, 2, 8.00, '2023-02-01', '2023-02-21');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (351, '酸奶', 1, 2, 14.00, '2023-02-01', '2023-02-22');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (352, '买菜', 1, 1, 29.88, '2023-02-01', '2023-02-23');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (353, '卤肉料', 1, 1, 19.80, '2023-02-01', '2023-02-23');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (354, '饭卡', 1, 8, 10.00, '2023-02-01', '2023-02-24');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (355, '公交卡', 1, 3, 10.00, '2023-02-01', '2023-02-24');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (356, '拼车', 1, 3, 151.00, '2023-02-01', '2023-02-24');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (357, '砂锅豆腐+盖饭', 1, 8, 28.00, '2023-02-01', '2023-02-24');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (358, '洗漱用品', 1, 0, 4.00, '2023-02-01', '2023-02-24');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (359, '电费', 1, 0, 100.30, '2023-02-01', '2023-02-25');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (360, '水', 1, 8, 2.00, '2023-02-01', '2023-02-25');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (361, 'Tim咖', 1, 8, 71.00, '2023-02-01', '2023-02-25');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (362, '公交卡', 1, 3, 20.00, '2023-02-01', '2023-02-25');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (363, '火车票', 1, 3, 56.00, '2023-02-01', '2023-02-25');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (364, '辣白菜猪肉', 1, 8, 24.90, '2023-02-01', '2023-02-25');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (365, '喜茶', 1, 8, 19.00, '2023-02-01', '2023-02-25');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (366, '便利蜂', 1, 8, 17.30, '2023-02-01', '2023-02-25');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (367, '打车', 1, 3, 13.29, '2023-02-01', '2023-02-25');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (368, '微信充值', 1, 7, 0.41, '2023-02-01', '2023-02-26');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (369, '日料', 1, 8, 154.90, '2023-02-01', '2023-02-26');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (370, '小碗菜', 1, 8, 20.40, '2023-02-01', '2023-02-27');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (371, '多菲角', 1, 2, 5.00, '2023-02-01', '2023-02-27');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (372, '面包', 1, 8, 4.50, '2023-02-01', '2023-02-28');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (373, '买菜', 1, 1, 34.59, '2023-02-01', '2023-02-28');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (374, '微信提现', 1, 6, 3.29, '2023-02-01', '2023-02-28');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (375, '打水', 1, 0, 2.00, '2023-02-01', '2023-02-28');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (376, '除臭喷雾', 1, 7, 28.60, '2023-03-01', '2023-03-02');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (377, '电话费', 1, 0, 129.99, '2023-03-01', '2023-03-02');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (378, '饭卡', 1, 8, 20.00, '2023-03-01', '2023-03-03');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (379, '微信提现', 1, 6, 67.59, '2023-03-01', '2023-03-03');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (380, '买菜', 1, 1, 37.00, '2023-03-01', '2023-03-03');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (381, '椰子', 1, 2, 12.00, '2023-03-01', '2023-03-03');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (382, '椰子', 1, 2, 12.00, '2023-03-01', '2023-03-04');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (383, '公交卡', 1, 3, 15.00, '2023-03-01', '2023-03-04');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (384, '圆明园', 1, 7, 20.00, '2023-03-01', '2023-03-04');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (385, '凝胶', 1, 7, 28.33, '2023-03-01', '2023-03-04');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (386, '南京大排档', 1, 8, 19.90, '2023-03-01', '2023-03-04');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (387, '公交卡', 1, 3, 10.00, '2023-03-01', '2023-03-05');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (388, '自行车', 1, 3, 3.00, '2023-03-01', '2023-03-05');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (389, '捐款', 1, 7, 0.27, '2023-03-01', '2023-03-05');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (390, '雪糕', 1, 2, 20.00, '2023-03-01', '2023-03-05');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (391, '必胜客', 1, 8, 164.00, '2023-03-01', '2023-03-05');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (392, '可乐', 1, 8, 9.50, '2023-03-01', '2023-03-05');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (393, '公交车', 1, 3, 1.00, '2023-03-01', '2023-03-06');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (394, '公交卡', 1, 3, 3.00, '2023-03-01', '2023-03-06');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (395, '小碗菜', 1, 8, 19.40, '2023-03-01', '2023-03-06');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (396, '土豆丝盖饭', 1, 8, 11.00, '2023-03-01', '2023-03-06');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (397, '微信提现', 1, 6, 0.40, '2023-03-01', '2023-03-07');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (398, '烤肠+面包', 1, 2, 9.00, '2023-03-01', '2023-03-07');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (399, '蜜雪冰城', 1, 2, 18.00, '2023-03-01', '2023-03-08');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (400, '香菇油菜', 1, 1, 3.00, '2023-03-01', '2023-03-08');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (401, '药品', 1, 9, 26.40, '2023-03-01', '2023-03-09');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (402, '哈罗月卡', 1, 3, 13.53, '2023-03-01', '2023-03-09');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (403, '买菜', 1, 1, 3.70, '2023-03-01', '2023-03-09');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (404, '方便面', 1, 1, 12.00, '2023-03-01', '2023-03-09');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (405, '微信充值', 1, 7, 0.37, '2023-03-01', '2023-03-09');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (406, '面包', 1, 9, 36.90, '2023-03-01', '2023-03-10');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (407, '蜜雪冰城', 1, 2, 17.20, '2023-03-01', '2023-03-10');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (408, '微信提现', 1, 6, 0.10, '2023-03-01', '2023-03-10');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (409, '顺丰', 1, 7, 15.00, '2023-03-01', '2023-03-10');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (410, '猪脚饭', 1, 8, 26.00, '2023-03-01', '2023-03-10');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (411, '买米', 1, 1, 12.30, '2023-03-01', '2023-03-11');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (412, '打水', 1, 0, 2.30, '2023-03-01', '2023-03-11');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (413, '电费', 1, 0, 100.30, '2023-03-01', '2023-03-11');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (414, '买菜', 1, 1, 13.00, '2023-03-01', '2023-03-11');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (415, '微信充值', 1, 7, 0.10, '2023-03-01', '2023-03-11');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (416, '面包', 1, 2, 24.00, '2023-03-01', '2023-03-12');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (417, '饭卡', 1, 8, 20.00, '2023-03-01', '2023-03-13');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (418, '买菜', 1, 1, 3.00, '2023-03-01', '2023-03-13');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (419, '火腿', 1, 1, 8.00, '2023-03-01', '2023-03-13');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (420, '袖套', 1, 7, 6.00, '2023-03-01', '2023-03-14');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (421, '买菜', 1, 1, 6.50, '2023-03-01', '2023-03-14');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (422, '买菜', 1, 1, 3.90, '2023-03-01', '2023-03-15');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (423, '粮油', 1, 1, 47.50, '2023-03-01', '2023-03-15');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (424, '自行车', 1, 3, 1.50, '2023-03-01', '2023-03-16');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (425, '工资', 2, 6, 6266.65, '2023-03-01', '2023-03-15');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (426, '微信充值', 1, 7, 0.25, '2023-03-01', '2023-03-16');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (427, '棒', 1, 9, 36.80, '2023-03-01', '2023-03-16');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (428, '香菇肉片盖饭', 1, 8, 26.00, '2023-03-01', '2023-03-16');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (429, '果粒橙', 1, 2, 4.00, '2023-03-01', '2023-03-16');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (430, '红包', 1, 9, 100.00, '2023-03-01', '2023-03-16');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (431, '公交卡', 1, 3, 25.00, '2023-03-01', '2023-03-17');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (432, '炸酱面', 1, 8, 15.00, '2023-03-01', '2023-03-17');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (433, '挂号费', 1, 7, 80.00, '2023-03-01', '2023-03-17');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (434, '妙芙', 1, 2, 10.00, '2023-03-01', '2023-03-17');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (435, '百岁山', 1, 8, 8.00, '2023-03-01', '2023-03-17');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (436, '牙刷', 1, 0, 5.00, '2023-03-01', '2023-03-17');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (437, '火车票', 1, 3, 58.00, '2023-03-01', '2023-03-19');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (438, '理发', 1, 7, 17.05, '2023-03-01', '2023-03-19');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (439, '打车', 1, 3, 30.98, '2023-03-01', '2023-03-19');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (440, '必胜客', 1, 8, 298.00, '2023-03-01', '2023-03-19');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (441, '公交卡', 1, 3, 5.00, '2023-03-01', '2023-03-19');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (442, '椰子', 1, 2, 12.00, '2023-03-01', '2023-03-19');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (443, '饭卡', 1, 8, 20.00, '2023-03-01', '2023-03-20');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (444, '吉野家', 1, 8, 24.90, '2023-03-01', '2023-03-20');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (445, '微信提现', 1, 6, 30.23, '2023-03-01', '2023-03-20');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (446, '房租', 1, 0, 2000.00, '2023-03-01', '2023-03-20');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (447, '还款', 1, 4, 665.00, '2023-03-01', '2023-03-20');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (448, '还花呗', 1, 4, 104.50, '2023-03-01', '2023-03-20');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (449, '面包', 1, 8, 6.50, '2023-03-01', '2023-03-21');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (450, '结息', 2, 6, 8.55, '2023-03-01', '2023-03-21');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (451, '微信充值', 1, 7, 0.05, '2023-03-01', '2023-03-21');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (452, '买菜', 1, 1, 8.00, '2023-03-01', '2023-03-21');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (453, '面包', 1, 2, 11.00, '2023-03-01', '2023-03-22');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (458, '汉堡套餐', 1, 8, 40.90, '2023-04-01', '2023-04-01');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (459, 'QQ糖', 1, 2, 11.00, '2023-04-01', '2023-04-01');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (460, '油菜', 1, 1, 1.30, '2023-04-01', '2023-04-01');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (461, '鸡翅中', 1, 1, 12.70, '2023-04-01', '2023-04-02');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (462, '宝矿力', 1, 2, 5.00, '2023-04-01', '2023-04-02');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (463, '公交卡', 1, 3, 10.00, '2023-04-01', '2023-04-02');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (464, '茶百道', 1, 2, 22.90, '2023-04-01', '2023-04-02');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (465, '面包', 1, 2, 20.00, '2023-04-01', '2023-04-02');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (466, '御皇铠甲', 1, 7, 47.00, '2023-04-01', '2023-04-02');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (467, '微信提现', 1, 6, 0.80, '2023-04-01', '2023-04-02');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (468, '电话费', 0, 7, 119.99, '2023-04-01', '2023-04-02');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (469, '饭卡', 1, 8, 20.00, '2023-04-01', '2023-04-03');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (470, '面包', 1, 2, 15.00, '2023-04-01', '2023-04-03');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (471, '豆腐大葱', 1, 1, 3.60, '2023-04-01', '2023-04-03');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (472, '电费', 1, 0, 100.30, '2023-04-01', '2023-04-03');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (473, '炒米粉', 2, 8, 12.00, '2023-04-01', '2023-04-03');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (474, '煎饼', 2, 8, 9.00, '2023-04-01', '2023-04-03');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (475, '面包', 1, 8, 4.50, '2023-04-01', '2023-04-04');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (476, '快递', 1, 7, 22.00, '2023-04-01', '2023-04-04');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (477, '打赏红包', 1, 5, 20.00, '2023-04-01', '2023-04-04');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (478, '取快递', 1, 5, 1.00, '2023-04-01', '2023-04-04');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (479, '土豆丝盖饭', 1, 8, 11.00, '2023-04-01', '2023-04-04');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (480, '干香菇', 1, 1, 19.50, '2023-04-01', '2023-04-05');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (481, '薯片', 2, 2, 13.50, '2023-04-01', '2023-04-05');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (482, '面包', 2, 8, 4.50, '2023-04-01', '2023-04-06');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (483, '麻花', 2, 2, 6.80, '2023-04-01', '2023-04-06');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (484, '吉野家', 2, 8, 23.80, '2023-04-01', '2023-04-06');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (485, '面包', 2, 8, 5.50, '2023-04-01', '2023-04-07');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (486, '软糖', 2, 2, 10.80, '2023-04-01', '2023-04-07');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (487, '红包', 1, 9, 10.00, '2023-04-01', '2023-04-08');
INSERT INTO `expenditurestatistics` (`id`, `item`, `payWay`, `payType`, `amount`, `startDate`, `createDate`) VALUES (488, '微信提现', 1, 6, 0.80, '2023-04-01', '2023-04-08');
COMMIT;

-- ----------------------------
-- Table structure for financialanalysis
-- ----------------------------
DROP TABLE IF EXISTS `financialanalysis`;
CREATE TABLE `financialanalysis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of financialanalysis
-- ----------------------------
BEGIN;
INSERT INTO `financialanalysis` (`id`, `number`) VALUES (1, '9');
INSERT INTO `financialanalysis` (`id`, `number`) VALUES (2, '3000');
INSERT INTO `financialanalysis` (`id`, `number`) VALUES (3, '');
COMMIT;

-- ----------------------------
-- Table structure for payType
-- ----------------------------
DROP TABLE IF EXISTS `payType`;
CREATE TABLE `payType` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_number` int(11) DEFAULT NULL,
  `type_content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`type_id`) USING BTREE,
  KEY `type_number` (`type_number`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of payType
-- ----------------------------
BEGIN;
INSERT INTO `payType` (`type_id`, `type_number`, `type_content`) VALUES (18, 0, '房租');
INSERT INTO `payType` (`type_id`, `type_number`, `type_content`) VALUES (19, 1, '买菜');
INSERT INTO `payType` (`type_id`, `type_number`, `type_content`) VALUES (20, 2, '零食');
INSERT INTO `payType` (`type_id`, `type_number`, `type_content`) VALUES (21, 3, '交通');
INSERT INTO `payType` (`type_id`, `type_number`, `type_content`) VALUES (22, 4, '还款');
INSERT INTO `payType` (`type_id`, `type_number`, `type_content`) VALUES (23, 5, '人情礼品');
INSERT INTO `payType` (`type_id`, `type_number`, `type_content`) VALUES (24, 6, '收入');
INSERT INTO `payType` (`type_id`, `type_number`, `type_content`) VALUES (25, 7, '其它');
INSERT INTO `payType` (`type_id`, `type_number`, `type_content`) VALUES (26, 8, '餐饮');
INSERT INTO `payType` (`type_id`, `type_number`, `type_content`) VALUES (27, 9, '流水');
INSERT INTO `payType` (`type_id`, `type_number`, `type_content`) VALUES (28, 10, '生活');
COMMIT;

-- ----------------------------
-- Table structure for payWay
-- ----------------------------
DROP TABLE IF EXISTS `payWay`;
CREATE TABLE `payWay` (
  `way_id` int(11) NOT NULL AUTO_INCREMENT,
  `way_number` int(11) DEFAULT NULL,
  `way_content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`way_id`),
  KEY `way_number` (`way_number`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of payWay
-- ----------------------------
BEGIN;
INSERT INTO `payWay` (`way_id`, `way_number`, `way_content`) VALUES (9, 0, 'AliPay');
INSERT INTO `payWay` (`way_id`, `way_number`, `way_content`) VALUES (10, 1, 'ICBC');
INSERT INTO `payWay` (`way_id`, `way_number`, `way_content`) VALUES (11, 2, 'CMB');
INSERT INTO `payWay` (`way_id`, `way_number`, `way_content`) VALUES (12, 3, 'ABC');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `isUse` int(11) NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`isUse`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`isUse`, `username`, `password`) VALUES (0, 'wang', '123456');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
