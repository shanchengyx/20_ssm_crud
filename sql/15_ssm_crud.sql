/*
 Navicat Premium Data Transfer

 Source Server         : gyx
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : 15_ssm_crud

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 27/06/2021 11:30:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id，主键，自增',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES (1, '开发部');
INSERT INTO `t_department` VALUES (2, '测试部');

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id，主键，自增',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'name，非空，唯一',
  `sex` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `dept_id`(`dept_id`) USING BTREE,
  CONSTRAINT `t_employee_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `t_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2019 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee` VALUES (13, 'e1e0011', 'M', 'e1e0011@ssm.com', 1);
INSERT INTO `t_employee` VALUES (15, '07ef113', 'M', '07ef113@ssm.com', 1);
INSERT INTO `t_employee` VALUES (16, '37cfe14', 'M', '37cfe14@ssm.com', 1);
INSERT INTO `t_employee` VALUES (17, 'f694015', 'M', 'f694015@ssm.com', 1);
INSERT INTO `t_employee` VALUES (18, '0b07316', 'M', '0b07316@ssm.com', 1);
INSERT INTO `t_employee` VALUES (19, 'fb09c17', 'M', 'fb09c17@ssm.com', 1);
INSERT INTO `t_employee` VALUES (20, '156d818', 'M', '156d818@ssm.com', 1);
INSERT INTO `t_employee` VALUES (21, '2a65919', 'M', '2a65919@ssm.com', 1);
INSERT INTO `t_employee` VALUES (37, '42eac35', 'M', '42eac35@ssm.com', 1);
INSERT INTO `t_employee` VALUES (38, '2c1fa36', 'M', '2c1fa36@ssm.com', 1);
INSERT INTO `t_employee` VALUES (39, '5b02337', 'M', '5b02337@ssm.com', 1);
INSERT INTO `t_employee` VALUES (40, '6b02538', 'M', '6b02538@ssm.com', 1);
INSERT INTO `t_employee` VALUES (41, 'e57c739', 'M', 'e57c739@ssm.com', 1);
INSERT INTO `t_employee` VALUES (42, '5477b40', 'M', '5477b40@ssm.com', 1);
INSERT INTO `t_employee` VALUES (43, 'f14d041', 'M', 'f14d041@ssm.com', 1);
INSERT INTO `t_employee` VALUES (44, 'd67cb42', 'M', 'd67cb42@ssm.com', 1);
INSERT INTO `t_employee` VALUES (45, '9bd4f43', 'M', '9bd4f43@ssm.com', 1);
INSERT INTO `t_employee` VALUES (46, '229f344', 'M', '229f344@ssm.com', 1);
INSERT INTO `t_employee` VALUES (47, '59efe45', 'M', '59efe45@ssm.com', 1);
INSERT INTO `t_employee` VALUES (48, 'dd0f846', 'M', 'dd0f846@ssm.com', 1);
INSERT INTO `t_employee` VALUES (49, 'e8c2a47', 'M', 'e8c2a47@ssm.com', 1);
INSERT INTO `t_employee` VALUES (50, '06d3c48', 'M', '06d3c48@ssm.com', 1);
INSERT INTO `t_employee` VALUES (51, '202f849', 'M', '202f849@ssm.com', 1);
INSERT INTO `t_employee` VALUES (52, 'ced8c50', 'M', 'ced8c50@ssm.com', 1);
INSERT INTO `t_employee` VALUES (53, '9177f51', 'M', '9177f51@ssm.com', 1);
INSERT INTO `t_employee` VALUES (54, '0b0d352', 'M', '0b0d352@ssm.com', 1);
INSERT INTO `t_employee` VALUES (55, '9fd1053', 'M', '9fd1053@ssm.com', 1);
INSERT INTO `t_employee` VALUES (56, '0847154', 'M', '0847154@ssm.com', 1);
INSERT INTO `t_employee` VALUES (57, 'e181355', 'M', 'e181355@ssm.com', 1);
INSERT INTO `t_employee` VALUES (58, '1dbd856', 'M', '1dbd856@ssm.com', 1);
INSERT INTO `t_employee` VALUES (59, '5a33957', 'M', '5a33957@ssm.com', 1);
INSERT INTO `t_employee` VALUES (60, 'b86a658', 'M', 'b86a658@ssm.com', 1);
INSERT INTO `t_employee` VALUES (61, '8c87659', 'M', '8c87659@ssm.com', 1);
INSERT INTO `t_employee` VALUES (62, 'd860960', 'M', 'd860960@ssm.com', 1);
INSERT INTO `t_employee` VALUES (63, '8ae9e61', 'M', '8ae9e61@ssm.com', 1);
INSERT INTO `t_employee` VALUES (64, '0f89062', 'M', '0f89062@ssm.com', 1);
INSERT INTO `t_employee` VALUES (65, 'fc88d63', 'M', 'fc88d63@ssm.com', 1);
INSERT INTO `t_employee` VALUES (66, 'b757064', 'M', 'b757064@ssm.com', 1);
INSERT INTO `t_employee` VALUES (67, '1a93065', 'M', '1a93065@ssm.com', 1);
INSERT INTO `t_employee` VALUES (68, '9df8c66', 'M', '9df8c66@ssm.com', 1);
INSERT INTO `t_employee` VALUES (69, '2d69467', 'M', '2d69467@ssm.com', 1);
INSERT INTO `t_employee` VALUES (70, 'ce5e168', 'M', 'ce5e168@ssm.com', 1);
INSERT INTO `t_employee` VALUES (71, '5c81069', 'M', '5c81069@ssm.com', 1);
INSERT INTO `t_employee` VALUES (72, 'f868370', 'M', 'f868370@ssm.com', 1);
INSERT INTO `t_employee` VALUES (73, 'd348a71', 'M', 'd348a71@ssm.com', 1);
INSERT INTO `t_employee` VALUES (74, '5fa7972', 'M', '5fa7972@ssm.com', 1);
INSERT INTO `t_employee` VALUES (75, '9efd573', 'M', '9efd573@ssm.com', 1);
INSERT INTO `t_employee` VALUES (76, '1f17074', 'M', '1f17074@ssm.com', 1);
INSERT INTO `t_employee` VALUES (77, '9f0a575', 'M', '9f0a575@ssm.com', 1);
INSERT INTO `t_employee` VALUES (78, '1304f76', 'M', '1304f76@ssm.com', 1);
INSERT INTO `t_employee` VALUES (79, '0fb1e77', 'M', '0fb1e77@ssm.com', 1);
INSERT INTO `t_employee` VALUES (80, 'd60a478', 'M', 'd60a478@ssm.com', 1);
INSERT INTO `t_employee` VALUES (81, 'ad88779', 'M', 'ad88779@ssm.com', 1);
INSERT INTO `t_employee` VALUES (82, 'a6b7580', 'M', 'a6b7580@ssm.com', 1);
INSERT INTO `t_employee` VALUES (83, 'bd48181', 'M', 'bd48181@ssm.com', 1);
INSERT INTO `t_employee` VALUES (84, 'ceb1682', 'M', 'ceb1682@ssm.com', 1);
INSERT INTO `t_employee` VALUES (85, '5462383', 'M', '5462383@ssm.com', 1);
INSERT INTO `t_employee` VALUES (86, '13b5184', 'M', '13b5184@ssm.com', 1);
INSERT INTO `t_employee` VALUES (87, '7a0cd85', 'M', '7a0cd85@ssm.com', 1);
INSERT INTO `t_employee` VALUES (88, '52ced86', 'M', '52ced86@ssm.com', 1);
INSERT INTO `t_employee` VALUES (89, '5e8f687', 'M', '5e8f687@ssm.com', 1);
INSERT INTO `t_employee` VALUES (90, 'cbaa588', 'M', 'cbaa588@ssm.com', 1);
INSERT INTO `t_employee` VALUES (91, 'aec1289', 'M', 'aec1289@ssm.com', 1);
INSERT INTO `t_employee` VALUES (92, 'f558290', 'M', 'f558290@ssm.com', 1);
INSERT INTO `t_employee` VALUES (93, '6964e91', 'M', '6964e91@ssm.com', 1);
INSERT INTO `t_employee` VALUES (94, '8975792', 'M', '8975792@ssm.com', 1);
INSERT INTO `t_employee` VALUES (95, '75cb093', 'M', '75cb093@ssm.com', 1);
INSERT INTO `t_employee` VALUES (96, 'f45be94', 'M', 'f45be94@ssm.com', 1);
INSERT INTO `t_employee` VALUES (97, '9904a95', 'M', '9904a95@ssm.com', 1);
INSERT INTO `t_employee` VALUES (98, '28cab96', 'M', '28cab96@ssm.com', 1);
INSERT INTO `t_employee` VALUES (99, 'fce7a97', 'M', 'fce7a97@ssm.com', 1);

SET FOREIGN_KEY_CHECKS = 1;
