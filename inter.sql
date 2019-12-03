/*
 Navicat Premium Data Transfer

 Source Server         : inter
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : inter

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 03/12/2019 14:56:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `taskId` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务编号',
  `taskName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `releasePerson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布者',
  `Time` datetime(0) NOT NULL COMMENT '发布时间',
  `debrief` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务描述',
  PRIMARY KEY (`taskId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (6, '测试', '王皓伟', '2019-12-03 14:50:43', '测试');
INSERT INTO `task` VALUES (7, 'ww', 'ww', '2019-12-03 14:54:23', '。。。。。');
INSERT INTO `task` VALUES (9, 'ss', 'ss', '2019-12-03 14:54:39', 'ss');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL COMMENT '用户ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'admin');
INSERT INTO `users` VALUES (2, 'whw', 'whw');
INSERT INTO `users` VALUES (3, 'zxh', 'zxh');

SET FOREIGN_KEY_CHECKS = 1;
