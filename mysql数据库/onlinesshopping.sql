/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : onlinesshopping

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2018-05-16 00:30:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL auto_increment,
  `userid` int(11) NOT NULL,
  `address` varchar(200) collate utf8_unicode_ci NOT NULL,
  `creater` varchar(30) collate utf8_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `updater` varchar(30) collate utf8_unicode_ci default NULL,
  `updatedate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('11', '10', '天津市河西区丰和路1039号', 'USER', '2018-04-20 00:34:41', '', '2018-04-21 15:33:09');
INSERT INTO `address` VALUES ('12', '10', '天津市南开区1048号', 'USER', '2018-04-20 00:35:14', '', '2018-04-21 15:33:09');
INSERT INTO `address` VALUES ('13', '12', '江苏省苏州市工业区1039号', 'USER', '2018-04-20 00:47:58', '', '2018-04-21 15:33:09');
INSERT INTO `address` VALUES ('14', '9', '成都红星路13号', 'USER', '2018-05-15 11:57:59', null, null);

-- ----------------------------
-- Table structure for `aftersales`
-- ----------------------------
DROP TABLE IF EXISTS `aftersales`;
CREATE TABLE `aftersales` (
  `int` int(11) NOT NULL auto_increment,
  `userid` int(11) NOT NULL,
  `goodsid` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `type` varchar(20) collate utf8_unicode_ci NOT NULL,
  `cause` varchar(255) collate utf8_unicode_ci NOT NULL,
  `creater` varchar(20) collate utf8_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  PRIMARY KEY  (`int`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of aftersales
-- ----------------------------
INSERT INTO `aftersales` VALUES ('1', '10', '18', '31', '2', '2', 'dddd', 'USER', '2018-04-21 15:37:10');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) collate utf8_unicode_ci NOT NULL,
  `typeid` int(11) NOT NULL,
  `title` varchar(150) collate utf8_unicode_ci NOT NULL,
  `descript` varchar(500) collate utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `messageurl` varchar(200) collate utf8_unicode_ci NOT NULL,
  `photourl` varchar(200) collate utf8_unicode_ci NOT NULL,
  `weight` decimal(10,2) NOT NULL,
  `total` int(11) NOT NULL,
  `count` int(11) NOT NULL COMMENT '还剩下多少',
  `tuijian` int(11) NOT NULL,
  `creater` varchar(30) collate utf8_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `updater` varchar(30) collate utf8_unicode_ci default NULL,
  `updatedate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('30', 'PHP从入门到精通', '14', 'PHP从入门到精通 第3版，PHP从入门到精通 第3版', '连续8月PHP类全国零售排行前2名，41小时视频，808个经典实例、15项面试真题、626项测试史上最全资源库）\r\n定 价： ￥69.80\r\n作 者： 明日科技 编\r\n出 版 社： 清华大学出版社\r\n出版时间： 2012-07-01\r\nＩＳＢＮ： 9787302288534', '39.00', '74861770-419e-4d99-b689-6a289a57ff1b.jpg', '63b15b71-1f71-4b6e-8b0a-a34dbf185166.jpg', '0.25', '2', '28', '1', 'ADMIN', '2018-05-15 23:49:05', null, null);
INSERT INTO `goods` VALUES ('31', 'html5+css web前端开发书籍', '14', '程序设计html5实战html5游戏开发网页设计与制作教程', '零基础学HTML5+CSS3视频教程高级程序设计html5实战html5游戏开发网页设计与制作教程 html5+css web前端开发书籍', '59.00', '5c35e602-b53c-478d-8253-26a682c2034c.jpg', 'b6e6d139-387a-4038-9453-f51e362efa64.jpg', '0.30', '1', '22', '1', 'ADMIN', '2018-05-16 00:00:01', null, null);
INSERT INTO `goods` VALUES ('32', '模拟电子技术基础', '16', '模拟电子技术基础//面向21世纪课程教材(第三版) 童诗白 华成英', '本书主要内容包括:常用半导体器件、基本放大电路、多级放大电路、集成运算放大电路、放大电路的频率响应、放大电路中的反馈、信号的运算和处理、波形的发生和信号的变换、功率放大电路、直流电源和模拟电子电路读图。', '50.00', 'a9a1eb15-dad6-4483-b720-0dc3532fbbcd.jpg', '3c7c9e28-16ca-48ea-a983-1f589181910e.jpg', '0.35', '0', '50', '0', 'ADMIN', '2018-05-16 00:09:47', null, null);

-- ----------------------------
-- Table structure for `goodstype`
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype` (
  `id` int(11) NOT NULL auto_increment,
  `goodstype` varchar(30) collate utf8_unicode_ci NOT NULL,
  `creater` varchar(30) collate utf8_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `updater` varchar(30) collate utf8_unicode_ci default NULL,
  `updatedate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of goodstype
-- ----------------------------
INSERT INTO `goodstype` VALUES ('14', '计算机', 'ADMIN', '2018-04-21 14:58:14', null, null);
INSERT INTO `goodstype` VALUES ('16', '电子技术', 'ADMIN', '2018-04-21 14:58:39', null, null);
INSERT INTO `goodstype` VALUES ('17', '历史政治', 'ADMIN', '2018-04-21 14:58:57', null, null);
INSERT INTO `goodstype` VALUES ('18', '英语', 'ADMIN', '2018-04-21 14:59:41', null, null);
INSERT INTO `goodstype` VALUES ('19', '文学', 'ADMIN', '2018-04-21 15:00:17', null, null);

-- ----------------------------
-- Table structure for `orderdetail`
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL auto_increment,
  `userid` int(11) NOT NULL,
  `ordernum` varchar(20) collate utf8_unicode_ci NOT NULL,
  `goodsid` int(11) NOT NULL,
  `address` varchar(100) collate utf8_unicode_ci NOT NULL,
  `count` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` varchar(5) collate utf8_unicode_ci NOT NULL,
  `senddate` datetime default NULL,
  `creater` varchar(30) collate utf8_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `updater` varchar(30) collate utf8_unicode_ci default NULL,
  `updatedate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES ('34', '9', '347938', '31', '14', '1', '59.00', '2', null, 'USER', '2018-05-16 00:11:27', null, null);
INSERT INTO `orderdetail` VALUES ('35', '9', '347938', '30', '14', '2', '78.00', '1', null, 'USER', '2018-05-16 00:11:27', null, null);

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL auto_increment,
  `ordernum` varchar(20) collate utf8_unicode_ci NOT NULL,
  `userid` int(11) NOT NULL,
  `creater` varchar(30) collate utf8_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `updater` varchar(30) collate utf8_unicode_ci default NULL,
  `updatedate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('44', '347938', '9', 'USER', '2018-05-16 00:11:27', null, null);

-- ----------------------------
-- Table structure for `shoppingcart`
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart` (
  `id` int(11) NOT NULL auto_increment,
  `userid` int(11) NOT NULL,
  `goodsid` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `creater` varchar(30) collate utf8_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `updater` varchar(30) collate utf8_unicode_ci default NULL,
  `updatedate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------
INSERT INTO `shoppingcart` VALUES ('1', '10', '23', '1', '80.00', 'USER', '2018-04-21 15:32:16', null, null);
INSERT INTO `shoppingcart` VALUES ('9', '9', '31', '1', '59.00', 'USER', '2018-05-16 00:17:22', null, null);
INSERT INTO `shoppingcart` VALUES ('10', '9', '30', '2', '78.00', 'USER', '2018-05-16 00:17:42', null, null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(20) default NULL,
  `sex` varchar(10) default NULL,
  `age` varchar(10) default NULL,
  `mobile` varchar(20) default NULL,
  `role` int(11) NOT NULL,
  `usersign` varchar(200) default NULL,
  `creater` varchar(20) NOT NULL,
  `createdate` datetime NOT NULL,
  `updater` varchar(20) default NULL,
  `updatedate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('9', 'lingyu', '111111', '143wee4545@qq.com', '1', '23', '18322698594', '0', '如风如雨', 'REGISTER', '2018-04-01 02:58:43', '', '2018-04-21 14:48:02');
INSERT INTO `user` VALUES ('10', 'fengyu', '111111', '34343434545@qq.com', '2', '23', '15210259635', '0', '再见为了下一次相遇', 'REGISTER', '2018-04-01 03:03:20', '', '2018-04-21 14:48:07');
INSERT INTO `user` VALUES ('11', 'admin', 'admin', '14567676545@qq.com', '1', '44', '15825789685', '1', '开开心心就好', 'admin', '2018-04-01 03:35:17', '', '2018-04-21 14:48:09');
INSERT INTO `user` VALUES ('12', 'suhong', '111111', '14676004545@qq.com', '1', '22', '13958642589', '0', '无心无为', 'REGISTER', '2018-04-01 03:03:20', '', '2018-04-19 23:03:41');
