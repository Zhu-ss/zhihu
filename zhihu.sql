/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2019-12-30 19:50:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for zh_article
-- ----------------------------
DROP TABLE IF EXISTS `zh_article`;
CREATE TABLE `zh_article` (
  `ID` varchar(50) NOT NULL,
  `TITLE` varchar(50) DEFAULT NULL,
  `MESSAGE` varchar(500) DEFAULT NULL,
  `PL_COUNT` int(5) DEFAULT NULL,
  `SC_COUNT` int(5) DEFAULT NULL,
  `DZ_COUNT` int(5) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zh_article
-- ----------------------------
INSERT INTO `zh_article` VALUES ('201', '哎，太难了', '', '11', '5', '999');
INSERT INTO `zh_article` VALUES ('202', '论Java的重要性', '', '6', '6', '600');

-- ----------------------------
-- Table structure for zh_commend
-- ----------------------------
DROP TABLE IF EXISTS `zh_commend`;
CREATE TABLE `zh_commend` (
  `ID` varchar(50) NOT NULL,
  `CONTENT` varchar(500) DEFAULT NULL,
  `A_ID` varchar(50) DEFAULT NULL,
  `level` varchar(4) DEFAULT NULL,
  `U_ID` varchar(50) DEFAULT NULL,
  `DZ_COUNT` int(5) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zh_commend
-- ----------------------------
INSERT INTO `zh_commend` VALUES ('1d4c9c28-7bab-4d56-8530-cd06984fd251', '难。。。。。。。。。', '201', '1', '101', '1');
INSERT INTO `zh_commend` VALUES ('2d8246c5-31e9-4b32-893f-097fef633b86', '请问请问', '201', '1', '101', '1');
INSERT INTO `zh_commend` VALUES ('301', '迎男而上', '201', '1', '102', '50');
INSERT INTO `zh_commend` VALUES ('302', '知男而退', '201', '1', '101', '105');
INSERT INTO `zh_commend` VALUES ('303', '难个屁', '201', '1', '103', '67');
INSERT INTO `zh_commend` VALUES ('304', '男上加男', '201', '1', '104', '35');

-- ----------------------------
-- Table structure for zh_photo
-- ----------------------------
DROP TABLE IF EXISTS `zh_photo`;
CREATE TABLE `zh_photo` (
  `ID` varchar(50) NOT NULL,
  `PHOTO` varchar(100) DEFAULT NULL,
  `COUNT` int(5) DEFAULT NULL,
  `U_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zh_photo
-- ----------------------------
INSERT INTO `zh_photo` VALUES ('49919158-45d1-44fa-a2bc-d2c11c373181', '/zhihu/upload/护眼色.png', '4', 'f5915ed4-4cde-4f3b-8154-577efae5e170');
INSERT INTO `zh_photo` VALUES ('70fa6d1d-3074-4249-9eee-a3fd79c4db82', '/zhihu/upload/yt_4.png', '4', 'f5915ed4-4cde-4f3b-8154-577efae5e170');
INSERT INTO `zh_photo` VALUES ('74f9a2dd-49bb-4a7c-8a85-5acb211c6c69', '/zhihu/upload/timi_yj.jpg', '5', 'f5915ed4-4cde-4f3b-8154-577efae5e170');
INSERT INTO `zh_photo` VALUES ('dc786c34-c9a2-4c9d-8a9d-5a10a074d9f9', '/zhihu/upload/timi_yj.jpg', '5', 'f5915ed4-4cde-4f3b-8154-577efae5e170');
INSERT INTO `zh_photo` VALUES ('f0670b73-f107-4e74-b9ff-3e1d90f26baa', '/zhihu/upload/chain_70_4.jpg', '4', 'f5915ed4-4cde-4f3b-8154-577efae5e170');

-- ----------------------------
-- Table structure for zh_ua
-- ----------------------------
DROP TABLE IF EXISTS `zh_ua`;
CREATE TABLE `zh_ua` (
  `ID` varchar(50) NOT NULL,
  `U_ID` varchar(50) DEFAULT NULL,
  `A_ID` varchar(50) DEFAULT NULL,
  `SC_STATUS` varchar(10) DEFAULT NULL,
  `PL_STATUS` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zh_ua
-- ----------------------------
INSERT INTO `zh_ua` VALUES ('6c91cdc7-7132-4ed6-a8cf-3bdff77315f1', 'f5915ed4-4cde-4f3b-8154-577efae5e170', '201', '已收藏', '1');

-- ----------------------------
-- Table structure for zh_user
-- ----------------------------
DROP TABLE IF EXISTS `zh_user`;
CREATE TABLE `zh_user` (
  `ID` varchar(50) NOT NULL,
  `REALNAME` varchar(50) DEFAULT NULL,
  `TEL` varchar(15) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  `ICON` varchar(50) DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zh_user
-- ----------------------------
INSERT INTO `zh_user` VALUES ('101', 'qq', '123456', 'qq@qq.com', 'qq', '', '激活');
INSERT INTO `zh_user` VALUES ('102', 'ww', '123456', 'ww@qq.com', 'ww', '', '激活');
INSERT INTO `zh_user` VALUES ('103', 'ee', '56465454', 'ee@qq.com', 'ee', '', '激活');
INSERT INTO `zh_user` VALUES ('104', 'aa', '45454', 'aa@qq.com', 'aa', '', '激活');
INSERT INTO `zh_user` VALUES ('105', 'ss', '455454', 'ss@qq.com', 'ss', '', '激活');
INSERT INTO `zh_user` VALUES ('48db67cf-9c32-4330-8692-6237cf2d72fb', '隔壁老王', 'asd', 'qq@qq.com', 'asd', '/zhihu/upload/chain_changcheng.jpg', '激活');
INSERT INTO `zh_user` VALUES ('f5915ed4-4cde-4f3b-8154-577efae5e170', '蔡徐坤', '2123132', 'zz@qq.com', 'zz', '/zhihu/upload/yt_1.jpg', '激活');
