/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : courseex2

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 29/12/2022 01:28:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dates
-- ----------------------------
DROP TABLE IF EXISTS `dates`;
CREATE TABLE `dates`  (
  `date_number` int NOT NULL,
  `specific_date` date NOT NULL,
  `special_flag` tinyint(1) NOT NULL,
  PRIMARY KEY (`date_number`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dates
-- ----------------------------
INSERT INTO `dates` VALUES (1, '2022-01-01', 0);
INSERT INTO `dates` VALUES (2, '2022-01-02', 1);
INSERT INTO `dates` VALUES (3, '2022-01-03', 0);
INSERT INTO `dates` VALUES (4, '2022-01-04', 0);
INSERT INTO `dates` VALUES (5, '2022-01-05', 1);

-- ----------------------------
-- Table structure for 人员表
-- ----------------------------
DROP TABLE IF EXISTS `人员表`;
CREATE TABLE `人员表`  (
  `人员编号` int NOT NULL,
  `姓名` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `性别` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `出生年份` date NULL DEFAULT NULL,
  `组合标记` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`人员编号`) USING BTREE,
  CONSTRAINT `性别检查` CHECK ((`性别` = _utf8mb3'男') or (`性别` = _utf8mb3'女') or (`性别` = NULL) or (`性别` = _utf8mb3'组合'))
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 人员表
-- ----------------------------
INSERT INTO `人员表` VALUES (1, '周杰伦', '男', '1979-01-18', 0);
INSERT INTO `人员表` VALUES (2, '测试人员1', '男', '2022-01-01', 0);
INSERT INTO `人员表` VALUES (3, '测试人员2', '男', '2022-01-01', 0);
INSERT INTO `人员表` VALUES (4, '测试人员4', '男', '1992-01-01', 0);
INSERT INTO `人员表` VALUES (5, '测试人员5', '男', '1992-01-01', 0);
INSERT INTO `人员表` VALUES (6, '测试人员6', '男', '2002-01-01', 0);
INSERT INTO `人员表` VALUES (7, '测试人员7', '女', '2002-01-01', 0);
INSERT INTO `人员表` VALUES (8, '测试人员8', '女', '2022-01-01', 0);
INSERT INTO `人员表` VALUES (9, '测试人员9', '女', '2022-01-01', 0);
INSERT INTO `人员表` VALUES (10, '测试人员10', '女', '2022-01-01', 0);
INSERT INTO `人员表` VALUES (11, '测试组合1', '组合', '1111-01-01', 1);
INSERT INTO `人员表` VALUES (12, '方文山', '男', '1969-01-26', 0);
INSERT INTO `人员表` VALUES (13, '洪敬尧', '男', '1967-11-01', 0);
INSERT INTO `人员表` VALUES (14, '数据库测试组', '组合', '1111-01-01', 1);

-- ----------------------------
-- Table structure for 歌单音乐表
-- ----------------------------
DROP TABLE IF EXISTS `歌单音乐表`;
CREATE TABLE `歌单音乐表`  (
  `歌单编号` int NOT NULL,
  `音乐编号` int NOT NULL,
  PRIMARY KEY (`歌单编号`, `音乐编号`) USING BTREE,
  INDEX `音乐表外键`(`音乐编号` ASC) USING BTREE,
  CONSTRAINT `音乐表外键` FOREIGN KEY (`音乐编号`) REFERENCES `音乐表` (`音乐编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `歌单音乐表_ibfk_1` FOREIGN KEY (`歌单编号`) REFERENCES `用户歌单表` (`歌单编号`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 歌单音乐表
-- ----------------------------
INSERT INTO `歌单音乐表` VALUES (1, 1);
INSERT INTO `歌单音乐表` VALUES (2, 1);
INSERT INTO `歌单音乐表` VALUES (1, 2);
INSERT INTO `歌单音乐表` VALUES (2, 2);
INSERT INTO `歌单音乐表` VALUES (1, 3);
INSERT INTO `歌单音乐表` VALUES (2, 3);
INSERT INTO `歌单音乐表` VALUES (1, 4);
INSERT INTO `歌单音乐表` VALUES (2, 4);
INSERT INTO `歌单音乐表` VALUES (1, 5);
INSERT INTO `歌单音乐表` VALUES (2, 5);
INSERT INTO `歌单音乐表` VALUES (1, 6);
INSERT INTO `歌单音乐表` VALUES (2, 6);
INSERT INTO `歌单音乐表` VALUES (1, 7);
INSERT INTO `歌单音乐表` VALUES (2, 7);
INSERT INTO `歌单音乐表` VALUES (1, 8);
INSERT INTO `歌单音乐表` VALUES (2, 8);
INSERT INTO `歌单音乐表` VALUES (1, 9);
INSERT INTO `歌单音乐表` VALUES (2, 9);
INSERT INTO `歌单音乐表` VALUES (1, 10);
INSERT INTO `歌单音乐表` VALUES (2, 21);
INSERT INTO `歌单音乐表` VALUES (2, 22);
INSERT INTO `歌单音乐表` VALUES (1, 26);

-- ----------------------------
-- Table structure for 歌曲制作人员
-- ----------------------------
DROP TABLE IF EXISTS `歌曲制作人员`;
CREATE TABLE `歌曲制作人员`  (
  `人员号` int NOT NULL,
  `音乐号` int NOT NULL,
  `是否是歌手` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `是否是词作者` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `是否是曲作者` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`人员号`, `音乐号`) USING BTREE,
  INDEX `音乐外键1`(`音乐号` ASC) USING BTREE,
  CONSTRAINT `歌曲制作人员_ibfk_1` FOREIGN KEY (`人员号`) REFERENCES `人员表` (`人员编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `音乐外键1` FOREIGN KEY (`音乐号`) REFERENCES `音乐表` (`音乐编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `是否是曲作者限定` CHECK (`是否是曲作者` in (_utf8mb3'是',_utf8mb3'否')),
  CONSTRAINT `是否是歌手限定` CHECK (`是否是歌手` in (_utf8mb3'是',_utf8mb3'否')),
  CONSTRAINT `是否是词作者限定` CHECK (`是否是词作者` in (_utf8mb3'是',_utf8mb3'否'))
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 歌曲制作人员
-- ----------------------------
INSERT INTO `歌曲制作人员` VALUES (1, 21, '是', '否', '是');
INSERT INTO `歌曲制作人员` VALUES (1, 22, '是', '否', '是');
INSERT INTO `歌曲制作人员` VALUES (1, 23, '是', '是', '是');
INSERT INTO `歌曲制作人员` VALUES (2, 1, '是', '是', '是');
INSERT INTO `歌曲制作人员` VALUES (2, 2, '是', '是', '是');
INSERT INTO `歌曲制作人员` VALUES (2, 3, '是', '是', '是');
INSERT INTO `歌曲制作人员` VALUES (2, 4, '是', '是', '是');
INSERT INTO `歌曲制作人员` VALUES (2, 5, '是', '是', '是');
INSERT INTO `歌曲制作人员` VALUES (2, 6, '是', '是', '是');
INSERT INTO `歌曲制作人员` VALUES (3, 7, '是', '是', '是');
INSERT INTO `歌曲制作人员` VALUES (3, 8, '是', '是', '是');
INSERT INTO `歌曲制作人员` VALUES (4, 9, '是', '是', '是');
INSERT INTO `歌曲制作人员` VALUES (4, 10, '是', '是', '是');
INSERT INTO `歌曲制作人员` VALUES (4, 11, '是', '是', '是');
INSERT INTO `歌曲制作人员` VALUES (4, 12, '是', '是', '是');
INSERT INTO `歌曲制作人员` VALUES (4, 27, '是', '是', '是');
INSERT INTO `歌曲制作人员` VALUES (5, 13, '是', '否', '否');
INSERT INTO `歌曲制作人员` VALUES (5, 27, '是', '是', '是');
INSERT INTO `歌曲制作人员` VALUES (6, 14, '否', '是', '是');
INSERT INTO `歌曲制作人员` VALUES (6, 15, '否', '否', '是');
INSERT INTO `歌曲制作人员` VALUES (6, 16, '是', '是', '是');
INSERT INTO `歌曲制作人员` VALUES (6, 28, '是', '是', '是');
INSERT INTO `歌曲制作人员` VALUES (7, 17, '是', '否', '否');
INSERT INTO `歌曲制作人员` VALUES (7, 28, '是', '是', '是');
INSERT INTO `歌曲制作人员` VALUES (8, 18, '是', '否', '否');
INSERT INTO `歌曲制作人员` VALUES (9, 19, '否', '是', '是');
INSERT INTO `歌曲制作人员` VALUES (9, 20, '是', '否', '否');
INSERT INTO `歌曲制作人员` VALUES (10, 24, '否', '是', '是');
INSERT INTO `歌曲制作人员` VALUES (11, 25, '是', '否', '否');
INSERT INTO `歌曲制作人员` VALUES (12, 21, '否', '是', '否');
INSERT INTO `歌曲制作人员` VALUES (12, 22, '否', '是', '否');
INSERT INTO `歌曲制作人员` VALUES (13, 21, '否', '否', '是');
INSERT INTO `歌曲制作人员` VALUES (14, 26, '是', '是', '是');

-- ----------------------------
-- Table structure for 歌曲播放表
-- ----------------------------
DROP TABLE IF EXISTS `歌曲播放表`;
CREATE TABLE `歌曲播放表`  (
  `播放编号` int NOT NULL,
  `音乐编号` int NULL DEFAULT NULL,
  `用户编号` int NULL DEFAULT NULL,
  `播放日期` date NULL DEFAULT NULL,
  `播放时间` time NULL DEFAULT NULL,
  PRIMARY KEY (`播放编号`) USING BTREE,
  INDEX `音乐编号`(`音乐编号` ASC) USING BTREE,
  INDEX `用户编号`(`用户编号` ASC) USING BTREE,
  CONSTRAINT `歌曲播放表_ibfk_1` FOREIGN KEY (`音乐编号`) REFERENCES `音乐表` (`音乐编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `歌曲播放表_ibfk_2` FOREIGN KEY (`用户编号`) REFERENCES `用户表` (`用户编号`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 歌曲播放表
-- ----------------------------
INSERT INTO `歌曲播放表` VALUES (1, 1, 1, '2022-09-18', '09:22:54');
INSERT INTO `歌曲播放表` VALUES (2, 21, 1, '2022-09-18', '09:23:46');
INSERT INTO `歌曲播放表` VALUES (3, 22, 2, '2022-09-18', '18:23:41');
INSERT INTO `歌曲播放表` VALUES (4, 23, 2, '2022-10-18', '19:23:41');
INSERT INTO `歌曲播放表` VALUES (5, 26, 7, '2022-12-09', '19:31:45');
INSERT INTO `歌曲播放表` VALUES (6, 26, 3, '2022-12-13', '19:31:46');
INSERT INTO `歌曲播放表` VALUES (7, 26, 4, '2022-12-13', '19:31:47');
INSERT INTO `歌曲播放表` VALUES (8, 26, 5, '2022-12-13', '19:31:48');
INSERT INTO `歌曲播放表` VALUES (9, 21, 6, '2022-12-14', '09:14:23');
INSERT INTO `歌曲播放表` VALUES (10, 22, 7, '2022-12-14', '10:23:23');
INSERT INTO `歌曲播放表` VALUES (11, 23, 7, '2022-12-14', '10:26:23');
INSERT INTO `歌曲播放表` VALUES (12, 21, 6, '2022-12-14', NULL);
INSERT INTO `歌曲播放表` VALUES (13, 21, 6, '2022-12-14', NULL);
INSERT INTO `歌曲播放表` VALUES (14, 21, 5, '2022-12-14', NULL);
INSERT INTO `歌曲播放表` VALUES (15, NULL, NULL, '2022-12-14', NULL);
INSERT INTO `歌曲播放表` VALUES (16, NULL, NULL, '2022-12-14', NULL);

-- ----------------------------
-- Table structure for 用户歌单表
-- ----------------------------
DROP TABLE IF EXISTS `用户歌单表`;
CREATE TABLE `用户歌单表`  (
  `歌单编号` int NOT NULL,
  `用户编号` int NULL DEFAULT NULL,
  `名称` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `介绍` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`歌单编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 用户歌单表
-- ----------------------------
INSERT INTO `用户歌单表` VALUES (1, 1, '张三的歌单1', '测试介绍内容');
INSERT INTO `用户歌单表` VALUES (2, 1, '张三的歌单2', '这是张三的第二张歌单.');

-- ----------------------------
-- Table structure for 用户表
-- ----------------------------
DROP TABLE IF EXISTS `用户表`;
CREATE TABLE `用户表`  (
  `用户编号` int NOT NULL,
  `用户名` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `用户密码` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`用户编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 用户表
-- ----------------------------
INSERT INTO `用户表` VALUES (1, '张三', 'newpassword');
INSERT INTO `用户表` VALUES (2, '李四', 'newpassword');
INSERT INTO `用户表` VALUES (3, '测试用户1', 'newpassword');
INSERT INTO `用户表` VALUES (4, '测试用户2', 'newpassword');
INSERT INTO `用户表` VALUES (5, '康正', 'newpassword');
INSERT INTO `用户表` VALUES (6, '顾总', 'newpassword');
INSERT INTO `用户表` VALUES (7, 'zjm', 'newpassword');

-- ----------------------------
-- Table structure for 音乐表
-- ----------------------------
DROP TABLE IF EXISTS `音乐表`;
CREATE TABLE `音乐表`  (
  `音乐编号` int NOT NULL,
  `音乐名称` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `专辑` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `语种` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `流派` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `唱片公司` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `发行时间` date NULL DEFAULT NULL,
  PRIMARY KEY (`音乐编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 音乐表
-- ----------------------------
INSERT INTO `音乐表` VALUES (1, '测试歌曲11', '测试专辑1', '测试语种1', '测试流派1', '测试唱片公司1', '2022-01-01');
INSERT INTO `音乐表` VALUES (2, '测试歌曲12', '测试专辑1', '测试语种1', '测试流派1', '测试唱片公司1', '2022-01-01');
INSERT INTO `音乐表` VALUES (3, '测试歌曲13', '测试专辑1', '测试语种1', '测试流派1', '测试唱片公司1', '2022-01-01');
INSERT INTO `音乐表` VALUES (4, '测试歌曲14', '测试专辑1', '测试语种1', '测试流派1', '测试唱片公司1', '2022-01-01');
INSERT INTO `音乐表` VALUES (5, '测试歌曲15', '测试专辑1', '测试语种1', '测试流派1', '测试唱片公司1', '2022-01-01');
INSERT INTO `音乐表` VALUES (6, '测试歌曲21', '测试专辑2', '测试语种2', '测试流派2', '测试唱片公司2', '2022-01-02');
INSERT INTO `音乐表` VALUES (7, '测试歌曲22', '测试专辑2', '测试语种2', '测试流派2', '测试唱片公司2', '2022-01-02');
INSERT INTO `音乐表` VALUES (8, '测试歌曲23', '测试专辑2', '测试语种2', '测试流派2', '测试唱片公司2', '2022-01-02');
INSERT INTO `音乐表` VALUES (9, '测试歌曲24', '测试专辑2', '测试语种2', '测试流派2', '测试唱片公司2', '2022-01-02');
INSERT INTO `音乐表` VALUES (10, '测试歌曲25', '测试专辑2', '测试语种2', '测试流派2', '测试唱片公司2', '2022-01-02');
INSERT INTO `音乐表` VALUES (11, '测试歌曲31', '测试专辑3', '测试语言3', '测试流派3', '测试唱片公司3', '2022-01-03');
INSERT INTO `音乐表` VALUES (12, '测试歌曲32', '测试专辑3', '测试语言3', '测试流派3', '测试唱片公司3', '2022-01-03');
INSERT INTO `音乐表` VALUES (13, '测试歌曲33', '测试专辑3', '测试语言3', '测试流派3', '测试唱片公司3', '2022-01-03');
INSERT INTO `音乐表` VALUES (14, '测试歌曲34', '测试专辑3', '测试语言3', '测试流派3', '测试唱片公司3', '2022-01-03');
INSERT INTO `音乐表` VALUES (15, '测试歌曲35', '测试专辑3', '测试语言3', '测试流派3', '测试唱片公司3', '2022-01-03');
INSERT INTO `音乐表` VALUES (16, '测试歌曲41', '测试专辑4', '测试语言4', '测试流派4', '测试唱片公司4', '2022-01-04');
INSERT INTO `音乐表` VALUES (17, '测试歌曲42', '测试专辑4', '测试语言4', '测试流派4', '测试唱片公司4', '2022-01-04');
INSERT INTO `音乐表` VALUES (18, '测试歌曲43', '测试专辑4', '测试语言4', '测试流派4', '测试唱片公司4', '2022-01-04');
INSERT INTO `音乐表` VALUES (19, '测试歌曲44', '测试专辑4', '测试语言4', '测试流派4', '测试唱片公司4', '2022-01-04');
INSERT INTO `音乐表` VALUES (20, '测试歌曲45', '测试专辑4', '测试语言4', '测试流派4', '测试唱片公司4', '2022-01-04');
INSERT INTO `音乐表` VALUES (21, '我的地盘', '七里香', '国语', 'pop流行', '杰威尔音乐有限公司', '2004-08-03');
INSERT INTO `音乐表` VALUES (22, '七里香', '七里香', '国语', 'pop流行', '杰威尔音乐有限公司', '2004-08-03');
INSERT INTO `音乐表` VALUES (23, '借口', '七里香', '国语', 'pop流行', '杰威尔音乐有限公司', '2004-08-03');
INSERT INTO `音乐表` VALUES (24, '粤语歌曲1', '粤语测试专辑', '粤语', '粤语流派1', '粤语音乐公司', '2022-12-18');
INSERT INTO `音乐表` VALUES (25, '粤语歌曲2', '粤语测试专辑', '粤语', '粤语流派1', '粤语音乐公司', '2022-12-18');
INSERT INTO `音乐表` VALUES (26, '我和我的数据库', '数据库课程设计', '粤语', 'pop流行', '索尼公司', '2022-11-30');
INSERT INTO `音乐表` VALUES (27, '英文歌曲1', '英文测试专辑', '英语', '英语流派1', '英语音乐公司', '2022-12-18');
INSERT INTO `音乐表` VALUES (28, '英文歌曲2', '英文测试专辑', '英语', '英语流派1', '英语音乐公司', '2022-12-18');

-- ----------------------------
-- Table structure for 音乐评论表
-- ----------------------------
DROP TABLE IF EXISTS `音乐评论表`;
CREATE TABLE `音乐评论表`  (
  `评论编号` int NOT NULL,
  `音乐编号` int NULL DEFAULT NULL,
  `用户编号` int NOT NULL,
  `评论内容` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `评论日期` date NOT NULL,
  `评论时间` time NOT NULL,
  `父级评论编号` int NULL DEFAULT NULL,
  PRIMARY KEY (`评论编号`) USING BTREE,
  INDEX `音乐编号`(`音乐编号` ASC) USING BTREE,
  INDEX `用户编号`(`用户编号` ASC) USING BTREE,
  INDEX `父级评论编号`(`父级评论编号` ASC) USING BTREE,
  CONSTRAINT `音乐评论表_ibfk_1` FOREIGN KEY (`音乐编号`) REFERENCES `音乐表` (`音乐编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `音乐评论表_ibfk_2` FOREIGN KEY (`用户编号`) REFERENCES `用户表` (`用户编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `音乐评论表_ibfk_3` FOREIGN KEY (`父级评论编号`) REFERENCES `音乐评论表` (`评论编号`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 音乐评论表
-- ----------------------------
INSERT INTO `音乐评论表` VALUES (0, NULL, 3, '0', '1111-11-11', '11:11:11', NULL);
INSERT INTO `音乐评论表` VALUES (1, 26, 1, '这个新人不错！', '2022-12-13', '20:13:45', 0);
INSERT INTO `音乐评论表` VALUES (2, 26, 2, '只有颜值不错！', '2022-12-14', '13:22:09', 1);
INSERT INTO `音乐评论表` VALUES (3, 26, 6, '我觉得这首歌很好!', '2022-12-19', '19:59:43', 0);
INSERT INTO `音乐评论表` VALUES (4, 21, 3, '周杰伦的歌很好!', '2022-12-20', '00:15:23', 0);
INSERT INTO `音乐评论表` VALUES (5, 21, 4, '是的.', '2022-12-20', '00:17:23', 4);
INSERT INTO `音乐评论表` VALUES (6, 22, 5, '也许还不错?', '2022-12-20', '00:18:23', 0);
INSERT INTO `音乐评论表` VALUES (7, 22, 6, '还可以', '2022-12-20', '00:19:23', 0);
INSERT INTO `音乐评论表` VALUES (8, 13, 7, 'OK!', '2022-12-20', '00:45:23', 0);
INSERT INTO `音乐评论表` VALUES (9, 14, 6, 'Well!', '2022-12-20', '00:46:23', 0);
INSERT INTO `音乐评论表` VALUES (10, 27, 4, 'No!', '2022-12-20', '00:47:23', 0);

-- ----------------------------
-- View structure for music_view
-- ----------------------------
DROP VIEW IF EXISTS `music_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `music_view` AS select `m`.`音乐编号` AS `音乐编号`,`m`.`音乐名称` AS `音乐`,group_concat(`p`.`姓名` separator ', ') AS `歌手`,group_concat((case when (`mp`.`是否是词作者` = '是') then `p`.`姓名` end) separator ', ') AS `词作者`,group_concat((case when (`mp`.`是否是曲作者` = '是') then `p`.`姓名` end) separator ', ') AS `曲作者` from ((`音乐表` `m` join `歌曲制作人员` `mp` on((`m`.`音乐编号` = `mp`.`音乐号`))) join `人员表` `p` on((`mp`.`人员号` = `p`.`人员编号`))) group by `m`.`音乐编号`,`m`.`音乐名称`;

-- ----------------------------
-- View structure for record_company_music_comments
-- ----------------------------
DROP VIEW IF EXISTS `record_company_music_comments`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `record_company_music_comments` AS select `音乐表`.`唱片公司` AS `唱片公司`,count(`音乐评论表`.`音乐编号`) AS `评论总数` from (`音乐表` join `音乐评论表` on((`音乐表`.`音乐编号` = `音乐评论表`.`音乐编号`))) group by `音乐表`.`唱片公司`;

-- ----------------------------
-- View structure for singercomments
-- ----------------------------
DROP VIEW IF EXISTS `singercomments`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `singercomments` AS select `p`.`姓名` AS `姓名`,`p`.`出生年份` AS `出生年份`,count(`c`.`评论编号`) AS `评论数` from (((`人员表` `p` join `歌曲制作人员` `r` on((`p`.`人员编号` = `r`.`人员号`))) join `音乐表` `m` on((`r`.`音乐号` = `m`.`音乐编号`))) join `音乐评论表` `c` on((`m`.`音乐编号` = `c`.`音乐编号`))) where ((`p`.`性别` = '男') and (`r`.`是否是歌手` = '是') and ((year(`p`.`出生年份`) between 1990 and 1999) or (year(`p`.`出生年份`) between 2000 and 2009))) group by `p`.`人员编号`;

-- ----------------------------
-- View structure for special_dates
-- ----------------------------
DROP VIEW IF EXISTS `special_dates`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `special_dates` AS select `dates`.`date_number` AS `date_number`,(case when (`dates`.`special_flag` = 1) then 'special' else `dates`.`specific_date` end) AS `specific_date` from `dates` order by `dates`.`date_number`;

-- ----------------------------
-- View structure for testcomments
-- ----------------------------
DROP VIEW IF EXISTS `testcomments`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `testcomments` AS select `c`.`评论编号` AS `评论编号`,`c`.`音乐编号` AS `音乐编号`,`c`.`用户编号` AS `用户编号`,`c`.`评论内容` AS `评论内容`,`c`.`评论日期` AS `评论日期`,`c`.`评论时间` AS `评论时间`,`c`.`父级评论编号` AS `父级评论编号` from (`音乐评论表` `c` join `用户表` `u` on((`c`.`用户编号` = `u`.`用户编号`))) where ((`u`.`用户名` = '张三') or (`u`.`用户名` = '李四'));

-- ----------------------------
-- View structure for 粤语歌英文歌评论平均数视图
-- ----------------------------
DROP VIEW IF EXISTS `粤语歌英文歌评论平均数视图`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `粤语歌英文歌评论平均数视图` AS select avg((case when (`各音乐评论数`.`语种` = '粤语') then `各音乐评论数`.`评论数` else NULL end)) AS `粤语歌平均评论数`,avg((case when (`各音乐评论数`.`语种` = '英语') then `各音乐评论数`.`评论数` else NULL end)) AS `英文歌平均评论数` from (select `音乐表`.`音乐编号` AS `音乐编号`,`音乐表`.`语种` AS `语种`,count(`音乐评论表`.`音乐编号`) AS `评论数` from (`音乐表` left join `音乐评论表` on((`音乐表`.`音乐编号` = `音乐评论表`.`音乐编号`))) group by `音乐表`.`音乐编号`) `各音乐评论数`;

-- ----------------------------
-- Triggers structure for table 人员表
-- ----------------------------
DROP TRIGGER IF EXISTS `触发!`;
delimiter ;;
CREATE TRIGGER `触发!` BEFORE INSERT ON `人员表` FOR EACH ROW IF NEW.组合标记 = 1 THEN
        SET NEW.性别 = '组合';
    END IF
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
