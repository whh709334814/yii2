/*
Navicat MySQL Data Transfer

Source Server         : www.91.com
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : yii2basic

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-04-16 18:59:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `y9_admin`
-- ----------------------------
DROP TABLE IF EXISTS `y9_admin`;
CREATE TABLE `y9_admin` (
  `adminid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `adminuser` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员账号',
  `adminpass` char(64) NOT NULL DEFAULT '',
  `adminemail` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员电子邮箱',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `loginip` bigint(20) NOT NULL DEFAULT '0' COMMENT '登录IP',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`adminid`),
  UNIQUE KEY `shop_admin_adminuser_adminpass` (`adminuser`,`adminpass`),
  UNIQUE KEY `shop_admin_adminuser_adminemail` (`adminuser`,`adminemail`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of y9_admin
-- ----------------------------
INSERT INTO `y9_admin` VALUES ('12', 'admintest', '$2y$13$Mg0SLCS1fXHlvP6W57vFweNYqbLZ4QG91rrLSHzu.JE3tyOBZ18S6', 'admintest@admintest.com', '0', '0', '0');
INSERT INTO `y9_admin` VALUES ('15', 'testuser', '$2y$13$rt8KZr3rwQsZN.ppMnMYIeZqe5FlsbHyaSDhRO2LBg8qvFVE1leJe', 'testuser123@test.com', '0', '0', '0');
INSERT INTO `y9_admin` VALUES ('18', 'ruler', '$2y$13$hFIhJxyDbw/da./ZlXNZqeAOdlF4tT0I0qlCA2xWZMnCCqsq8mDny', 'test@tes123.com', '0', '0', '0');
INSERT INTO `y9_admin` VALUES ('19', 'test1', '$2y$13$WQvJErEPjc1Bze5ryydLHeYqwgw92MDrrhX4rUchYinauA4ls5Gby', 'test@test1.com', '0', '0', '0');

-- ----------------------------
-- Table structure for `y9_auth_assignment`
-- ----------------------------
DROP TABLE IF EXISTS `y9_auth_assignment`;
CREATE TABLE `y9_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `idx-auth_assignment-user_id` (`user_id`),
  CONSTRAINT `y9_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `y9_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of y9_auth_assignment
-- ----------------------------
INSERT INTO `y9_auth_assignment` VALUES ('描写', '2', '1555298456');
INSERT INTO `y9_auth_assignment` VALUES ('超级管理员', '1', '1554954668');

-- ----------------------------
-- Table structure for `y9_auth_item`
-- ----------------------------
DROP TABLE IF EXISTS `y9_auth_item`;
CREATE TABLE `y9_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `y9_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `y9_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of y9_auth_item
-- ----------------------------
INSERT INTO `y9_auth_item` VALUES ('/*', '2', null, null, null, '1554877726', '1554877726');
INSERT INTO `y9_auth_item` VALUES ('/admin/*', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/assignment/*', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/assignment/assign', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/assignment/index', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/assignment/revoke', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/assignment/view', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/default/*', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/default/index', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/menu/*', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/menu/create', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/menu/delete', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/menu/index', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/menu/update', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/menu/view', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/permission/*', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/permission/assign', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/permission/create', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/permission/delete', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/permission/index', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/permission/remove', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/permission/update', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/permission/view', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/role/*', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/role/assign', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/role/create', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/role/delete', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/role/index', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/role/remove', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/role/update', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/role/view', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/route/*', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/route/assign', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/route/create', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/route/index', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/route/refresh', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/route/remove', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/rule/*', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/rule/create', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/rule/delete', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/rule/index', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/rule/update', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/rule/view', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/user/*', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/user/activate', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/user/change-password', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/user/delete', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/user/index', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/user/login', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/user/logout', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/user/request-password-reset', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/user/reset-password', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/user/signup', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/admin/user/view', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/backstage/*', '2', null, null, null, '1554953248', '1554953248');
INSERT INTO `y9_auth_item` VALUES ('/backstage/organ/*', '2', null, null, null, '1555297526', '1555297526');
INSERT INTO `y9_auth_item` VALUES ('/backstage/organ/index', '2', null, null, null, '1555297526', '1555297526');
INSERT INTO `y9_auth_item` VALUES ('/backstage/public/*', '2', null, null, null, '1555297526', '1555297526');
INSERT INTO `y9_auth_item` VALUES ('/backstage/public/captcha', '2', null, null, null, '1555297526', '1555297526');
INSERT INTO `y9_auth_item` VALUES ('/backstage/public/error', '2', null, null, null, '1555297526', '1555297526');
INSERT INTO `y9_auth_item` VALUES ('/backstage/public/login', '2', null, null, null, '1555297526', '1555297526');
INSERT INTO `y9_auth_item` VALUES ('/backstage/public/logout', '2', null, null, null, '1555297526', '1555297526');
INSERT INTO `y9_auth_item` VALUES ('/backstage/site/*', '2', null, null, null, '1554953248', '1554953248');
INSERT INTO `y9_auth_item` VALUES ('/backstage/site/about', '2', null, null, null, '1554953248', '1554953248');
INSERT INTO `y9_auth_item` VALUES ('/backstage/site/captcha', '2', null, null, null, '1554953248', '1554953248');
INSERT INTO `y9_auth_item` VALUES ('/backstage/site/contact', '2', null, null, null, '1554953248', '1554953248');
INSERT INTO `y9_auth_item` VALUES ('/backstage/site/error', '2', null, null, null, '1554953248', '1554953248');
INSERT INTO `y9_auth_item` VALUES ('/backstage/site/index', '2', null, null, null, '1554953248', '1554953248');
INSERT INTO `y9_auth_item` VALUES ('/backstage/site/login', '2', null, null, null, '1554953248', '1554953248');
INSERT INTO `y9_auth_item` VALUES ('/backstage/site/logout', '2', null, null, null, '1554953248', '1554953248');
INSERT INTO `y9_auth_item` VALUES ('/debug/*', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/debug/default/*', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/debug/default/db-explain', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/debug/default/download-mail', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/debug/default/index', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/debug/default/toolbar', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/debug/default/view', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/debug/user/*', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/debug/user/reset-identity', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/debug/user/set-identity', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/front/*', '2', null, null, null, '1555297631', '1555297631');
INSERT INTO `y9_auth_item` VALUES ('/front/default/*', '2', null, null, null, '1555297631', '1555297631');
INSERT INTO `y9_auth_item` VALUES ('/front/default/index', '2', null, null, null, '1555297631', '1555297631');
INSERT INTO `y9_auth_item` VALUES ('/front/index/*', '2', null, null, null, '1555297631', '1555297631');
INSERT INTO `y9_auth_item` VALUES ('/front/index/index', '2', null, null, null, '1555297631', '1555297631');
INSERT INTO `y9_auth_item` VALUES ('/gii/*', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/gii/default/*', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/gii/default/action', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/gii/default/diff', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/gii/default/index', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/gii/default/preview', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/gii/default/view', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/site/*', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/site/about', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/site/captcha', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/site/contact', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/site/error', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/site/index', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/site/login', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('/site/logout', '2', null, null, null, '1554877785', '1554877785');
INSERT INTO `y9_auth_item` VALUES ('描写', '1', null, null, null, '1555298193', '1555298193');
INSERT INTO `y9_auth_item` VALUES ('超级管理员', '1', '所有权限', null, null, '1554953216', '1554953216');

-- ----------------------------
-- Table structure for `y9_auth_item_child`
-- ----------------------------
DROP TABLE IF EXISTS `y9_auth_item_child`;
CREATE TABLE `y9_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `y9_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `y9_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `y9_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `y9_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of y9_auth_item_child
-- ----------------------------
INSERT INTO `y9_auth_item_child` VALUES ('描写', '/backstage/*');
INSERT INTO `y9_auth_item_child` VALUES ('描写', '/backstage/organ/*');
INSERT INTO `y9_auth_item_child` VALUES ('描写', '/backstage/organ/index');
INSERT INTO `y9_auth_item_child` VALUES ('描写', '/backstage/public/*');
INSERT INTO `y9_auth_item_child` VALUES ('描写', '/backstage/public/captcha');
INSERT INTO `y9_auth_item_child` VALUES ('描写', '/backstage/public/error');
INSERT INTO `y9_auth_item_child` VALUES ('描写', '/backstage/public/login');
INSERT INTO `y9_auth_item_child` VALUES ('描写', '/backstage/public/logout');
INSERT INTO `y9_auth_item_child` VALUES ('描写', '/backstage/site/*');
INSERT INTO `y9_auth_item_child` VALUES ('描写', '/backstage/site/about');
INSERT INTO `y9_auth_item_child` VALUES ('描写', '/backstage/site/captcha');
INSERT INTO `y9_auth_item_child` VALUES ('描写', '/backstage/site/contact');
INSERT INTO `y9_auth_item_child` VALUES ('描写', '/backstage/site/error');
INSERT INTO `y9_auth_item_child` VALUES ('描写', '/backstage/site/index');
INSERT INTO `y9_auth_item_child` VALUES ('描写', '/backstage/site/login');
INSERT INTO `y9_auth_item_child` VALUES ('描写', '/backstage/site/logout');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/*');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/*');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/assignment/*');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/assignment/assign');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/assignment/index');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/assignment/revoke');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/assignment/view');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/default/*');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/default/index');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/menu/*');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/menu/create');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/menu/delete');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/permission/*');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/permission/assign');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/permission/create');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/permission/delete');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/permission/index');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/permission/remove');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/permission/update');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/permission/view');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/role/*');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/role/assign');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/role/create');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/role/delete');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/role/index');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/role/remove');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/role/update');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/role/view');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/route/*');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/route/assign');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/route/create');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/route/index');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/route/refresh');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/route/remove');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/rule/*');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/rule/create');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/rule/delete');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/rule/index');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/rule/update');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/rule/view');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/user/*');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/user/activate');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/user/change-password');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/user/delete');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/user/index');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/user/login');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/user/logout');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/user/request-password-reset');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/user/reset-password');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/user/signup');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/user/view');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/debug/*');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/debug/default/*');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/debug/default/db-explain');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/debug/default/download-mail');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/debug/default/index');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/debug/default/toolbar');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/debug/default/view');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/debug/user/*');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/debug/user/reset-identity');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/debug/user/set-identity');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/gii/*');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/gii/default/*');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/gii/default/action');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/gii/default/diff');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/gii/default/index');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/gii/default/preview');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/gii/default/view');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/site/*');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/site/about');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/site/captcha');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/site/contact');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/site/error');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/site/index');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/site/login');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/site/logout');

-- ----------------------------
-- Table structure for `y9_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `y9_auth_rule`;
CREATE TABLE `y9_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of y9_auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for `y9_category`
-- ----------------------------
DROP TABLE IF EXISTS `y9_category`;
CREATE TABLE `y9_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique tree node identifier',
  `root` int(11) DEFAULT NULL COMMENT 'Tree root identifier',
  `lft` int(11) NOT NULL COMMENT 'Nested set left property',
  `rgt` int(11) NOT NULL COMMENT 'Nested set right property',
  `lvl` smallint(5) NOT NULL COMMENT 'Nested set level / depth',
  `name` varchar(60) NOT NULL COMMENT 'The tree node name / label',
  `icon` varchar(255) DEFAULT NULL COMMENT 'The icon to use for the node',
  `icon_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Icon Type: 1 = CSS Class, 2 = Raw Markup',
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Whether the node is active (will be set to false on deletion)',
  `selected` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Whether the node is selected/checked by default',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Whether the node is enabled',
  `readonly` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Whether the node is read only (unlike disabled - will allow toolbar actions)',
  `visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Whether the node is visible',
  `collapsed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Whether the node is collapsed by default',
  `movable_u` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Whether the node is movable one position up',
  `movable_d` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Whether the node is movable one position down',
  `movable_l` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Whether the node is movable to the left (from sibling to parent)',
  `movable_r` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Whether the node is movable to the right (from sibling to child)',
  `removable` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Whether the node is removable (any children below will be moved as siblings before deletion)',
  `removable_all` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Whether the node is removable along with descendants',
  `child_allowed` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Whether to allow adding children to the node',
  PRIMARY KEY (`id`),
  KEY `tbl_tree_NK1` (`root`),
  KEY `tbl_tree_NK2` (`lft`),
  KEY `tbl_tree_NK3` (`rgt`),
  KEY `tbl_tree_NK4` (`lvl`),
  KEY `tbl_tree_NK5` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of y9_category
-- ----------------------------
INSERT INTO `y9_category` VALUES ('1', '1', '1', '4', '0', '留学', '', '1', '1', '0', '0', '1', '1', '0', '1', '1', '1', '1', '1', '0', '1');
INSERT INTO `y9_category` VALUES ('2', '1', '2', '3', '1', '美国留学', '', '1', '1', '0', '0', '0', '1', '0', '1', '1', '1', '1', '1', '0', '1');
INSERT INTO `y9_category` VALUES ('3', '3', '1', '2', '0', '语培机构', '', '1', '1', '0', '0', '0', '1', '0', '1', '1', '1', '1', '1', '0', '1');

-- ----------------------------
-- Table structure for `y9_menu`
-- ----------------------------
DROP TABLE IF EXISTS `y9_menu`;
CREATE TABLE `y9_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `y9_menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `y9_menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of y9_menu
-- ----------------------------
INSERT INTO `y9_menu` VALUES ('7', '系统', null, '/admin/default/index', null, null);
INSERT INTO `y9_menu` VALUES ('8', '权限管理', '7', '/admin/menu/index', null, null);
INSERT INTO `y9_menu` VALUES ('10', '管家', null, '/backstage/site/index', null, null);
INSERT INTO `y9_menu` VALUES ('16', '用户列表', '8', '/admin/user/index', null, null);
INSERT INTO `y9_menu` VALUES ('17', '权限列表', '8', '/admin/permission/index', null, null);
INSERT INTO `y9_menu` VALUES ('18', '规则列表', '8', '/admin/rule/index', null, null);
INSERT INTO `y9_menu` VALUES ('19', '角色列表', '8', '/admin/role/index', null, null);
INSERT INTO `y9_menu` VALUES ('20', '菜单列表', '8', '/admin/menu/index', null, null);
INSERT INTO `y9_menu` VALUES ('21', '分配权限', '8', '/admin/assignment/index', null, null);
INSERT INTO `y9_menu` VALUES ('22', '机构管理', '10', '/backstage/organ/index', '3', null);
INSERT INTO `y9_menu` VALUES ('23', '机构列表', '22', '/backstage/organ/list', null, null);
INSERT INTO `y9_menu` VALUES ('24', '文章管理', '10', '/backstage/article/index', '2', null);
INSERT INTO `y9_menu` VALUES ('25', '文章列表', '24', '/backstage/article/index', null, null);
INSERT INTO `y9_menu` VALUES ('26', '系统设置', '7', '', null, null);
INSERT INTO `y9_menu` VALUES ('27', '首页', '26', '', '1', null);
INSERT INTO `y9_menu` VALUES ('28', '首页', '10', '/backstage/site/index', null, null);
INSERT INTO `y9_menu` VALUES ('29', '网站状况', '28', '/backstage/site/index', null, null);

-- ----------------------------
-- Table structure for `y9_migration`
-- ----------------------------
DROP TABLE IF EXISTS `y9_migration`;
CREATE TABLE `y9_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of y9_migration
-- ----------------------------
INSERT INTO `y9_migration` VALUES ('m000000_000000_base', '1554803044');
INSERT INTO `y9_migration` VALUES ('m140506_102106_rbac_init', '1554806017');
INSERT INTO `y9_migration` VALUES ('m140602_111327_create_menu_table', '1554803082');
INSERT INTO `y9_migration` VALUES ('m160312_050000_create_user', '1554803082');
INSERT INTO `y9_migration` VALUES ('m170907_052038_rbac_add_index_on_auth_assignment_user_id', '1554806017');
INSERT INTO `y9_migration` VALUES ('m180523_151638_rbac_updates_indexes_without_prefix', '1554806017');

-- ----------------------------
-- Table structure for `y9_organ`
-- ----------------------------
DROP TABLE IF EXISTS `y9_organ`;
CREATE TABLE `y9_organ` (
  `organ_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '机构索引id',
  `organ_name` varchar(50) NOT NULL DEFAULT '' COMMENT '机构名称',
  `level_id` int(11) NOT NULL DEFAULT '0' COMMENT '机构等级',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '会员名称',
  `seller_id` varchar(50) DEFAULT '' COMMENT '机构用户名',
  `category_id` varchar(50) NOT NULL DEFAULT '' COMMENT '机构类别',
  `service_id` varchar(50) DEFAULT NULL COMMENT '机构服务项目',
  `DL_area` varchar(50) DEFAULT NULL COMMENT '服务地区',
  `DL_nation` varchar(50) DEFAULT NULL COMMENT '办理国家',
  `province_id` mediumint(8) unsigned DEFAULT '0' COMMENT '机构所在省份ID',
  `city_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '机构所在城市ID',
  `district` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '机构所在地区ID',
  `organ_adress` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地区',
  `organ_zip` varchar(10) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `organ_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '机构状态，0关闭，1开启，2审核中',
  `organ_close_info` varchar(255) DEFAULT '' COMMENT '机构关闭原因',
  `organ_sort` int(11) NOT NULL DEFAULT '0' COMMENT '机构排序',
  `organ_time` int(11) DEFAULT NULL COMMENT '机构开通时间',
  `organ_end_time` int(11) DEFAULT '0' COMMENT '机构有效截止时间',
  `organ_logo` varchar(255) DEFAULT '' COMMENT '机构logo',
  `organ_banner` varchar(255) DEFAULT '' COMMENT '机构横幅',
  `organ_avatar` varchar(150) DEFAULT '' COMMENT '机构头像',
  `seo_keywords` varchar(255) DEFAULT '' COMMENT '机构seo关键字',
  `seo_description` varchar(255) DEFAULT '' COMMENT '机构seo描述',
  `organ_qq` varchar(50) DEFAULT '' COMMENT 'QQ',
  `organ_phone` varchar(20) DEFAULT '' COMMENT '机构电话',
  `organ_zy` text COMMENT '机构主要做那一块',
  `organ_domain` varchar(50) DEFAULT '' COMMENT '机构二级域名',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐，0为否，1为是，默认为0',
  `is_home_recommend` smallint(5) DEFAULT NULL COMMENT '1:上首页，0：正常',
  `organ_theme` varchar(50) NOT NULL DEFAULT 'default' COMMENT '机构当前主题',
  `organ_credit` int(10) NOT NULL DEFAULT '0' COMMENT '机构信用',
  `organ_servicecredit` decimal(3,2) NOT NULL DEFAULT '0.00' COMMENT '服务态度分数',
  `organ_collect` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '机构收藏数量',
  `organ_presales` text COMMENT '机构咨询客服',
  `organ_workingtime` varchar(100) DEFAULT '' COMMENT '工作时间',
  `is_own_shop` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否个人 1是 0否',
  `ensure` tinyint(1) DEFAULT '0' COMMENT '保证服务开关',
  `deposit` decimal(10,2) DEFAULT '0.00' COMMENT '保证金额',
  `deposit_icon` tinyint(1) DEFAULT '0' COMMENT '保证金显示开关',
  `is_delete` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '未删除0，已删除1',
  `goods_examine` tinyint(1) DEFAULT '1' COMMENT '机构发布内容是否需要审核1：需要，0：不需要',
  `domain_enable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用二级域名.1:启用;0:关闭',
  `intro` text COMMENT '机构简介',
  `feedback` varchar(50) DEFAULT NULL COMMENT '好评率',
  `score` varchar(50) DEFAULT NULL COMMENT '综合得分',
  `createtime` int(11) NOT NULL COMMENT '机构添加时间',
  `click` int(11) DEFAULT '0' COMMENT '点击',
  PRIMARY KEY (`organ_id`) USING BTREE,
  KEY `organ_name` (`organ_name`) USING BTREE,
  KEY `organ_id` (`organ_id`) USING BTREE,
  KEY `organ_state` (`organ_state`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=99256325 DEFAULT CHARSET=utf8 COMMENT='机构数据表';

-- ----------------------------
-- Records of y9_organ
-- ----------------------------
INSERT INTO `y9_organ` VALUES ('99256227', '津桥国际', '0', '60', '津桥国际', '', '172', '174,175,176,196,200', '8,13,21,26,27,28,34,35,37,38,46', '1,2,3,4', '0', '0', '0', '', '', '1', '', '0', '1550831642', '1550803798', 'uploads/99256227/20190222/7f9d81c87becd7311a458966a6acfd0c.png', '', '', '', '', '', '', null, '', '1', '1', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '津桥国际隶属于北京华钜津桥联合商务咨询有限公司，由1996年成立的津桥留学发展壮大而来，拥有23年做国际教育的经验和历史，总部坐落于北京中关村高科技产业园区的中国人民大学文化大厦，是一家集出国留学、语言培训、移民、海外置业、海外金融理财、海外短期培训、中外合作办学、中外艺术品交流、企业家联盟培训于一体国际化教育机构。', '95%', '4.5', '1550831642', null);
INSERT INTO `y9_organ` VALUES ('99256228', 'IDP国际', '0', '61', 'IDP国际', '', '172', '174', '8,9,10,11,12,13,16,17,21,28,35', '1,2,3,4,7', '0', '0', '0', '', '', '1', '', '0', '1550832182', '1582340286', 'uploads/99256228/20190222/3f4d26e02971aeecb139a86fdab3bbee.png', '', '', '', '', '', '', null, '', '0', '1', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', 'IDP教育集团由澳大利亚政府于1969年出资设立，50年以来已经成为推动和促进国际教育行业发展的领军者。IDP教育集团是全球领先的留学服务机构之一。竭诚协助学生成功留学实现国际教育梦想是我们的宗旨。根据每个学生的特点，为其量身定制专属课程规划、选校方针以及最适合的留学目的国是我们成功的关键。\r\n', '96%', '4.6', '1550832182', null);
INSERT INTO `y9_organ` VALUES ('99256229', '美世教育', '0', '62', '美世教育', '', '172', '174,176,177', '8,9,10,11,12,15,17,26,27,28,29,30,37,54', '1,2,3,4,7,14', '0', '0', '0', '', '', '1', '', '0', '1550832848', '1582340946', 'uploads/99256229/20190222/cd1478c2753916300dd0a44c6c9f8cbd.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '美世教育专注于服务中国高净值家庭，业务覆盖了从国际幼儿园到硕博阶段的全程国际教育规划及服务、并提供相应产品与解决方案，在英语国家及地区较为突出，有学术规划，课外活动规划，背景提升规划，备考申请规划，后期留学职业规划，一对一语言培训等项目。', '94%', '4.5', '1550832848', null);
INSERT INTO `y9_organ` VALUES ('99256230', '天道教育', '0', '63', '天道教育', '', '172', '174,175,176,177,196', '8,9,10,11,12,13,15,17,28,29,34,35,36,40', '1,2,3,4,5,6,8,13,14,16', '0', '0', '0', '', '', '1', '', '0', '1550833547', '1582341646', 'uploads/99256230/20190222/08f33a4c849d8a3c99c552569f5a616a.png', '', '', '', '', '', '', null, '', '0', '1', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '天道教育成立于2002年，由中美文化商业精英携手共建，一直致力于为华人世界的莘莘学子提供高质量的海外留学申请，出国考试辅导及职业规划咨询服务,公司总部设在北京，并在全国14个城市有分公司，将公司全方位专业化的服务扩展到全国各地。天道教育是中国知名留学申请咨询公司，拥有超过1500名员工，超过1000名咨询顾问。', '95%', '4.6', '1550833547', null);
INSERT INTO `y9_organ` VALUES ('99256231', '新通教育', '0', '64', '新通教育', '', '172', '174,175,176,200', '8,9,10,11,12,13,14,15,16,17,21,26,27,28,29,30,32', '1,2,3,4,5,6,7,8,12,13,14', '0', '0', '0', '', '', '1', '', '0', '1550834297', '1582342942', 'uploads/99256231/20190222/37777ba597535fdb34610defa319e2bb.png', '', '', '', '', '', '', null, '', '0', '1', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '新通教育隶属于浙江新通留学有限公司，创立于1996年。从创立之初就植根中国，积极拓展全球优质教育资源，以“提升中国学子全球竞争力”为使命，构建满足中国中高收入家庭教育国际化、财富国际化、生活国际化的服务链。经过20多年持续高速发展，新通已成长为中国领先的国际化教育集团，核心业务涵盖游学、语培、国际课程、留学规划、海外投资、K12学科辅导等领域。在国内30多个经济发达城市及海外设有分支机构。', '94%', '4.5', '1550834297', null);
INSERT INTO `y9_organ` VALUES ('99256232', '新东方前途', '0', '65', '新东方前途', '', '172', '174,175,176,177,196,197,198,199,200', '8,9,10,11,12,13,14,15,16,17,18,19,20,21,26,27,28', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,16', '0', '0', '0', '', '', '1', '', '0', '1550835440', '1582343544', 'uploads/99256232/20190222/32852f27af1fef1d50bb0f44374dee11.png', '', '', '', '', '', '', null, '', '0', '1', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '新东方前途出国是新东方旗下从事出国留学服务的专职机构，其前身是1996年成立的新东方出国咨询服务中心。2004年，北京新东方前途出国咨询有限公司成立（教外综资认字 [2005] 380号），发展至今分公司已覆盖全国40个城市、海外2个城市。业务范围涵盖广泛，包括考试指导、留学规划、背景提升、学校申请、奖学金申请、文书指导、签证服务、职业规划等方面，让学生轻松享受留学“一站式”服务。', '95%', '4.4', '1550835440', null);
INSERT INTO `y9_organ` VALUES ('99256233', '致胜留学', '0', '66', '致胜留学', '', '171', '174,177', '8', '1,2,3,4,7', '0', '0', '0', '', '', '1', '', '0', '1550836057', '1582344156', 'uploads/99256233/20190222/11aaf9b06d7f175945eaad7b3c37e3e7.png', '', '', '', '', '', '', null, '', '0', '1', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '致胜是一家专门做高质量留学咨询与服务的机构。致胜的每一位老师都有5-9年的从业经验。其中的80%都有海外留学经历。致胜的老师们也期望通过持续的普及留学申请知识，来让学生从纷杂的留学咨询中找到自己的留学道路。致胜期待学生们通过了解老师专业度和服务文件来了解致胜。这是服务机构必须要有的责任和态度。', '96%', '4.5', '1550836057', null);
INSERT INTO `y9_organ` VALUES ('99256234', '东方美誉美', '0', '67', '东方美誉美', '', '172', '174,175,176,199,200', '8', '1', '0', '0', '0', '', '', '2', '', '0', '1550836478', '1582344578', 'uploads/99256234/20190222/5b8314b2a3d973bab125aadf9953dea9.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '美誉美（北京）国际教育咨询有限公司作为美国出国业务的高端品牌，始终为客户提供高品质的服务，很多背景平平，甚至有硬伤的学生，在美誉美申请到了名校和奖学金。美誉美国际教育致力于初中，高本硕博高端申请以及奖学金申请，拥有一支专业，负责，权威的服务团队，在其创办人王红梅的带领下，以头脑风暴式的讨论深度挖掘学生背景，量身定做申请规划，以及贴心周到的后续跟进服务为客户进入世界顶尖学府深造提供全方位服务。', '96%', '4.5', '1550836478', null);
INSERT INTO `y9_organ` VALUES ('99256235', '东方育才', '0', '68', '东方育才', '', '172', '174,176,177', '8', '1,2,3,4,5,8,14', '0', '0', '0', '', '', '1', '', '0', '1550836859', '1582344955', 'uploads/99256235/20190222/5862e448a15e03c70a7f343b340f7965.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '东方育才具有雄厚的国际教育资源优势，总部设在北京，最初以专业办理美国、加拿大、澳大利亚、英国、香港等英语国家留学业务为主，在同行市场占有一定份额后，又相继开展了欧洲和亚洲其他等国家的留学业务。', '95%', '4.6', '1550836859', null);
INSERT INTO `y9_organ` VALUES ('99256236', '炎裔教育', '0', '69', '炎裔教育', '', '172', '174,176,199', '9,11,17', '1,2,3,4,5,6,7,13,14', '0', '0', '0', '', '', '1', '', '0', '1550837337', '1582345436', 'uploads/99256236/20190222/006f4f406897d46bcae34d66f400d26e.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '上海炎裔文化传播有限公司，是国内首家将制造业质量管理体系跨界融合至教育服务体系的创新型企业，我们秉承制造业的规范、标准、控制为产品核心的概念。并且在美国加利福尼亚州注册开设 YANYI International Education Group的教育机构。大陆境内公司通过不同控股公司从事留学咨询、留学申请、语言培训、实习推荐及海外服务等出国留学相关服务业务。\r\n', '95%', '4.6', '1550837337', null);
INSERT INTO `y9_organ` VALUES ('99256237', 'ACG国际', '0', '70', 'ACG国际', '', '172', '196', '8,9,10,11,12,13,15,16,17,21,26,27,28,29,34,35,37,4', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1550843212', '1582351311', 'uploads/99256237/20190222/0203a9afdf2cee7ec4009ed51a100ec3.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', 'ACG国际艺术教育隶属于北京环球艺盟国际教育咨询股份有限公司（以下简称为 ACG），成立于2006年，是由多位国内外资深艺术教育专家联合在华成立的国际标准的艺术教育与交流中心。成立以来，ACG力邀世界TOP艺术大师、奥斯卡获奖者、欧美艺术教育专家来华讲学交流，推动中外艺术产业与国际的学术交往。', '94%', '4.5', '1550843212', null);
INSERT INTO `y9_organ` VALUES ('99256238', 'SIA国际', '0', '71', 'SIA国际', '', '172', '196', '8,9,10,11,12,13,16,17,28', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1550843755', '1582351856', 'uploads/99256238/20190222/f3c5f06ef2d1f6dd3772a114bf63a8df.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', 'SIA国际艺术教育隶属于北京鲲鹏山水教育咨询有限公司，于2011年成立于纽约曼哈顿，有着纯正的西方血统。创始人均为毕业于 Parsons School of Design（帕森斯设计学院）、School of Visual Arts（纽约视觉艺术学院）和 Central Saint Martins College of Art and Design（中央圣马丁艺术与设计学院）的留美艺术家和导师。', '95%', '4.5', '1550843755', null);
INSERT INTO `y9_organ` VALUES ('99256239', '时代艺盟', '0', '72', '时代艺盟', '', '172', '196', '8', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1550844076', '0', 'uploads/99256239/20190222/f46a80a5db8addb9a80b4943077a5309.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', 'AAE国际艺术教育隶属于时代艺盟（北京）国际教育咨询有限公司，由国际教育专家联合国内知名艺术家共同成立，是中国首家专注于音乐、影视、设计、戏剧、舞蹈五大类留学申请和作品集指导的一体化公司。基于对艺术行业需求现状和未来发展趋势的透彻了解，AAE国际艺术教育为每个学生量身定制个性化培养方案，最小的学生从6岁起就已开始接受海外导师的一对一培训。', '96%', '4.5', '1550844076', null);
INSERT INTO `y9_organ` VALUES ('99256240', '创艺典国际', '0', '73', '创艺典国际', '', '172', '174,196', '8', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1550844529', '1582352626', 'uploads/99256240/20190222/db5e4f955734d19697e5507fb570fc3d.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '北京创艺典国际教育咨询有限公司，专业的艺术留学咨询机构。我们为有志于从事艺术和设计的中国学生提供艺术留学咨询和作品集指导。艺术与设计是最需要国际化的领域，无论创作和设计理念的国际化，还是创作方法的国际化，还是艺术眼光和创作视野的国际化，未来的十年到二十年之间，国际化的艺术人才肯定是最为稀缺的资源。', '95%', '4.6', '1550844529', null);
INSERT INTO `y9_organ` VALUES ('99256241', '美行思远', '0', '74', '美行思远', '', '172', '174,176,196', '8,9,10,11,12,13,28', '1,2,3,4,5,6,7,9', '0', '0', '0', '', '', '1', '', '0', '1550845001', '1582353122', 'uploads/99256241/20190222/a3a135e6f933014e441477255062f66c.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '美行思远（隶属于北京美行思远国际教育科技有限公司）始创于2009年，总部位于北京市朝阳区国贸CBD，主营业务包含国际艺术教育、国际音乐教育、MAXSTEAM创新教育、VR教育科技、美行思远营地教育、上苑当代美术馆五大板块。目前在北京、上海、杭州、成都、广州、深圳、武汉开设分校区，并在海外纽约、法兰克福等地设立了内容中心。', '95%', '4.6', '1550845001', null);
INSERT INTO `y9_organ` VALUES ('99256242', '蔚蓝教育', '0', '75', '蔚蓝教育', '', '172', '174,176,200', '8,13,16,32,34,37,44,59', '1,2,3,4,12,13', '0', '0', '0', '', '', '1', '', '0', '1550845433', '1582353543', 'uploads/99256242/20190222/74c140f5b13a8ad6b52a5b40142f5c4f.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '蔚蓝自1996年开始创业，2000年正式设立法人机构，20多年来，秉持“寻找蔚蓝、止于至善”的理念，致力于成长为一个伟大的信息、知识、人才创造企业，提供年轻人成才和梦想实现的解决方案，帮助年轻人做好人生规划，走向成功，走向蔚蓝前程，从而贡献于社会。', '94%', '4.5', '1550845433', null);
INSERT INTO `y9_organ` VALUES ('99256243', '世通美嘉', '0', '76', '世通美嘉', '', '172', '196', '8,9,11,13,16,37', null, '0', '0', '0', '', '', '1', '', '0', '1550845949', '1582354047', 'uploads/99256243/20190222/56d36fd50bf98be99a3603a2ab1ca86f.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', 'PS-ONE (品思）国际艺术教育隶属于北京世通美嘉教育咨询有限公司，PS-ONE专注于国际艺术留学，作品集辅导，留学规划，艺术作品集提升以及点评，为您传授最新的艺术界英、美院校的咨询以及创意信息。', '96%', '4.5', '1550845949', null);
INSERT INTO `y9_organ` VALUES ('99256244', '皖华教育', '0', '77', '皖华教育', '', '172', '174,175,176', '26', '1,2,3,4,7,12,13,14,16', '0', '0', '0', '', '', '1', '', '0', '1550846370', '1582354477', 'uploads/99256244/20190222/66e70b7760f41f6388d223390f6cdd62.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '皖华出国是中华人民共和国教育涉外监管信息网公布的，安徽地区五家教育部予以资格认定的自费出国留学中介机构之一，同时也是美国公费交流生项目、马来西亚公立大学政府补贴项目、西班牙政府补贴项目安徽省唯一官方办理机构。', '94%', '4.5', '1550846370', null);
INSERT INTO `y9_organ` VALUES ('99256245', 'ROSSO', '0', '78', 'ROSSO', '', '172', '196', '9,10,12,13,17', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1550846936', '1550819045', 'uploads/99256245/20190222/623ce0adc2cc318adff4e1b1744f2468.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', 'ROSSO是一所专注于“作品集培训，艺术留学规划”的专业艺术教育培训机构。目前在南京、上海、成都、杭州、广州开设校区。ROSSO以国际顶尖艺术院校归国的艺术家和外籍艺术导师为师资力量，培训超过上千个学生成功案例。在ROSSO你获得的不仅是艺术名校的Offer，还有更宝贵的艺术创造力！', '95%', '4.4', '1550846936', null);
INSERT INTO `y9_organ` VALUES ('99256246', '维欧国际', '0', '79', '维欧国际', '', '172', '174,196,200', '8,9,10,11,12,13,16,17,28,29,34,35,38,46', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1550847352', '1582355449', 'uploads/99256246/20190222/2abbaf79390c54bac6c0a49c2d3e783e.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '维欧国际教育科技（北京）有限公司正式成立于2011年，2008年进入留学市场整体规划，2009年正式累积师资结构开展教学辅导项目，逐步涉足国际艺术留学领域，凭借多年的艺术底蕴文化和师资累积，维欧国际正式在2011年发展为一家国际艺术联盟体系的教育辅导机构。', '94%', '4.5', '1550847352', null);
INSERT INTO `y9_organ` VALUES ('99256247', '尚友教育', '0', '80', '尚友教育', '', '171', '174,176', '8', '1,2,3,4,8,14,16', '0', '0', '0', '', '', '1', '', '0', '1550848034', '1550820145', 'uploads/99256247/20190222/c4b3882023e6d58554520628677fc5f7.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '尚友留学是尚友公司旗下的留学咨询高端品牌,主要为希望去美国、加拿大、英国、澳大利亚、中国香港、新加坡等国家和地区的学生，提供从国内申请到国外校友辅导的全程留学服务。', '94%', '4.5', '1550848034', null);
INSERT INTO `y9_organ` VALUES ('99256248', '铭道教育', '0', '81', '铭道教育', '', '171', '174', '9', '1,2,3,4,7,12,13,14,16', '0', '0', '0', '', '', '1', '', '0', '1550848638', '1582356738', 'uploads/99256248/20190222/7ef6e5e850cbaf5b2360e705e85a17a1.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '铭道教育，全名上海铭道教育科技有限公司，是一家从事高端留学申请服务的教育机构，下辖铭道留学品牌。 铭道教育自成立以来旨在为有志于出国留学的中国学生提供最具针对性的、高质量的留学申请及实习介绍服务；以全透明全公开的服务体系配合全海外留学背景的师资团队，能够精准而高效地帮助同学们成就自己的梦想 公司价值理念： 教育行业是良心行业。', '95%', '4.6', '1550848638', null);
INSERT INTO `y9_organ` VALUES ('99256249', '索引教育', '0', '82', '索引教育', '', '172', '174', '8,9,10,15,16,34,35,39,42,51,59', '1,2,3,4', '0', '0', '0', '', '', '1', '', '0', '1550848933', '1582357031', 'uploads/99256249/20190222/f8181dfb40e8880e7fddf7c039420183.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '“索引留学OfferMachine”是英国近百所顶尖公立大学官方授权的招生代表、美国大学招生协会（AIRC）认证会员机构。自1992年台湾成立，至今已积累了二十余年专业留学服务经验，始终与世界级的优秀国际教育机构一道，专注为学生提供卓越的留学及国际教育服务。索引留学OfferMachine目前已经与全球超过1000多所的大学、学院、中学、各类国际教育机构建立了密切稳定的官方合作关系。', '95%', '4.5', '1550848933', null);
INSERT INTO `y9_organ` VALUES ('99256250', '择由教育', '0', '83', '择由教育', '', '171', '174', '9', '1', '0', '0', '0', '', '', '1', '', '0', '1550849337', '1582357434', 'uploads/99256250/20190222/b6a69c44ac18fb0ea946a986323f1de3.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '择由教育 ChoiceFree 源自于上海，由一群拥有丰富经验和教育情怀的留学行业高管创立，专注于美国高中、本科、研究生的升学指导服务。', '96%', '4.6', '1550849337', null);
INSERT INTO `y9_organ` VALUES ('99256251', '诗途教育', '0', '84', '诗途教育', '', '171', '174', '9', '2,3,5,6,16', '0', '0', '0', '', '', '1', '', '0', '1550849513', '1582357610', 'uploads/99256251/20190222/f248c79d1076dbca95ec27810f08b35d.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '成立于2016年的诗途教育，前身是2008年创立的加拿大本土公司Fulton Holdings Co. LTD，专注从事在世界各地的国际教育相关项目。现位于上海，与美国加拿大以及欧洲各大名校有着密切的合作关系。秉承着“教育为本，从我开始”的服务理念，九年来，诗途教育一直致力于将留学彻底透明化，站在学生的角度，帮助家长与学生做出最好的选择。', '96%', '4.6', '1550849513', null);
INSERT INTO `y9_organ` VALUES ('99256252', '艾芯教育', '0', '85', '艾芯教育', '', '171', '174', '9', '1', '0', '0', '0', '', '', '1', '', '0', '1550849725', '1582357868', 'uploads/99256252/20190222/ddd4c24c8a2a328208cc98fc9f0519a6.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '艾芯留学成立于2006年,由多位曾经供职于国内大型留学公司的资深顾问组成,专注于美国高端留学。迄今为止,我们已经与国内近100余家留学中介公司、各类教育培训机构、大中专院校、和其他有生源基础的个人建立了良好的合作关系,协助为其学生申请世界名校、办理学生签证,安排校内、外住宿,接机等服务;同时为其提供丰厚的学生入学佣金回报体系。', '96%', '4.5', '1550849725', null);
INSERT INTO `y9_organ` VALUES ('99256253', '德师咨询', '0', '87', '德师咨询', '', '171', '174', '9', '1', '0', '0', '0', '', '', '1', '', '0', '1550850016', '1582358130', 'uploads/99256253/20190222/006bedb5f3ec572dcd54a9f5fb10d089.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '德师成立至今，成功将美国商科和法律专业的申请服务打造成自己的优势项目，顺利帮助数百名中国学生如愿取得了留学海外名校的机会。而今，越来越多的家长希望自己的孩子能尽早接受美国高中的教育，以便为未来申请美国大学做足充分的准备，德师为了满足学生的要求及家长的期望，不断加强咨询团队的建设以及学习和业务开拓的能力，力争以扎实的工作和兢兢业业的态度，更好地为每一位学生提供高端，定制化的留学咨询服务。', '96%', '9.5', '1550850016', null);
INSERT INTO `y9_organ` VALUES ('99256254', '嘉际教育', '0', '88', '嘉际教育', '', '172', '174,175,176,177', '8,15', '1,2,3,4', '0', '0', '0', '', '', '1', '', '0', '1550850372', '1582358485', 'uploads/99256254/20190222/8a3e6a27dba247c8da7cfa5b3c344fb4.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '嘉际教育--专注美国留学。因为专注，所以出色。十七年来专注美国留学名校申请为留美学生提供整套留学咨询、背景提升以及文书创作等全套的留学服务。', '94%', '4.5', '1550850372', null);
INSERT INTO `y9_organ` VALUES ('99256255', '英皇教育', '0', '89', '英皇教育', '', '172', '174,176,200', '58', '1,2,3,4,5,6,7,9,12,13,14', '0', '0', '0', '', '', '1', '', '0', '1550850799', '1582358897', 'uploads/99256255/20190222/420602106a8871977b823560e3dbb834.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '英皇海外教育致力于建设一个全球化的教育服务网络，根据学生的需求度身定做专业服务。形成一个为客户提供国际教育资讯、留学申请、签证服务、出国前语言培训、国际合作课程、境外服务跟进、教育展览及其他国际教育服务等一站式、全方位的多功能服务体系。我们还树立了同行业的标杆服务，每年均举办多场不同层次、不同规模的国际教育联展，为广大学生提供最新的留学动向，并与英国、澳洲、加拿大、美国等各国驻华使馆，IELTS、TOEFL等国际语言考试机构，一起成功主办了多个专题国际教育展览，为宁夏成千上万的莘莘学子和海外院校搭建了面对面沟通交流的平台。我公司每年办理的留学签证一次通过率达到99%以上，我们为所有学生提供卓有成效的免费签证面试培训。', '95%', '4.4', '1550850799', null);
INSERT INTO `y9_organ` VALUES ('99256256', '鑫泉教育', '0', '90', '鑫泉教育', '', '172', '174,175,200', '15,17,26,38,40,41,43,48', '1,2,3,4,5,6,7,8,9,12,13,16', '0', '0', '0', '', '', '1', '', '0', '1550851576', '1582359673', 'uploads/99256256/20190223/7428ac93e3564466110bbe910ef6522a.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '鑫泉留学，创建于1998年，是国际教育领域的知名品牌，重视针对学生的留学规划与服务，具有雄厚的国际教育资源优势。鑫泉留学拥有全球鲜有的美国国际招生协会(AIRC)及美国大学招生咨询协会(NACAC)的双重认证会员资格!', '95%', '4.4', '1550851576', null);
INSERT INTO `y9_organ` VALUES ('99256257', '英傲教育', '0', '91', '英傲教育', '', '172', '174', '17', '2,4,7,14', '0', '0', '0', '', '', '1', '', '0', '1550852104', '1550824201', 'uploads/99256257/20190223/600d7394a38cd0681a872d551d50ec98.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '南京英傲教育咨询有限公司，专注英国，澳洲，新西兰留学咨询。因为专注所以专业。英傲教育由业内7到13年的留学顾问老师导师和海外教师组成。主营：英国，澳洲，新西兰，香港地区的留学相关咨询服务。', '95%', '4.5', '1550852104', null);
INSERT INTO `y9_organ` VALUES ('99256258', '美嘉寻鹿', '0', '92', '美嘉寻鹿', '', '172', '174', '13,17,19', '1,2,3,4,7', '0', '0', '0', '', '', '1', '', '0', '1550852509', '1582360607', 'uploads/99256258/20190223/3d511558e57ebf00cd2710d28a650d05.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', ' 美嘉留学国内有成都分公司、南京分公司、徐州分公司，拥有近20年成功运作经验，是全球最大的留学服务机构之一。美嘉教育凭借得天独厚的师资力量，已经形成了集国际教育咨询、留学申请、海外留学陪护三位一体的立体式360°教育服务体系，把中国与世界的教育资源共享、学术对接变为现实，结合国内外企业优质的服务品质，打造独具一格美嘉特色的留学服务。', '95%', '4.5', '1550852509', null);
INSERT INTO `y9_organ` VALUES ('99256259', '金阳光出国', '0', '93', '金阳光出国', '', '172', '174,175', '9,17,18,19,20,21,22,23,25,59', '1,2,3,4,7,8,12,13,14', '0', '0', '0', '', '', '1', '', '0', '1550852644', '1582360745', 'uploads/99256259/20190223/596d922c88df69b7b43a1dab48a3f8bc.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '金阳光留学是教育部批准的从事自费出国留学服务（教外综资认字366号），同各国驻华使馆及国外众多教育机构和大学建立了良好的合作关系。本中心既有具备丰富外事经验及教育经验的资深留学专家，又有长期在国外工作过的资深顾问，能够及时、准确的掌握各国留学信息和使馆签证政策，针对每位学生的教育程度、预科、大专、本科、硕士等各个层次的课程资源，为学生量体裁衣，推荐合适的学校及专业，制定完善合理的留学计划。', '95%', '4.5', '1550852644', null);
INSERT INTO `y9_organ` VALUES ('99256260', '中教国际', '0', '94', '中教国际', '', '172', '174', '8', '1,2,3,4,5,6,7,8,9,10,11,12,13,14', '0', '0', '0', '', '', '1', '', '0', '1550853026', '1582361125', 'uploads/99256260/20190223/e32ffaf27e16c78e30e6aceb255bc0b9.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '中教国际教育交流中心（简称“中教国际”）是由中国教育国际交流协会主办的以从事教育国际合作与交流为主业的独立法人机构，是首批获得教育部、公安部、国家工商总局资格认定，可开展跨省市自费出国留学服务业务的全国性机构之一。中教国际通过中国教育国际交流协会的全国网络以及二十多年来积累的国际教育交流经验、关系和渠道为依托，全面开展自费出国留学、来华留学、国内外教育会议展览和论坛、中外合作办学以及国内外中短期教育考察及资格证书（培训）项目等教育合作与交流业务。', '94%', '4.5', '1550853026', null);
INSERT INTO `y9_organ` VALUES ('99256261', '好年华教育', '0', '95', '好年华教育', '', '172', '174', '17,19,20,21,22,25,59', '1,2,3,4,5,6,7,9,11,12,14', '0', '0', '0', '', '', '1', '', '0', '1550853592', '1582361689', 'uploads/99256261/20190223/2c3c97a8a3e20cd4e9775b7f2f945985.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '好年华出国JS CARNIVAL 好年华出国集团成立于1998年，着力打造留学、移民、海外置业、海外投资等“产业链”，为计划出国的人群提供多元化、多层次、多渠道一站式服务。我们的服务网络遍及连云港、常州、溧阳、盐城、扬州、江都、徐州、南通、如皋、丹阳、镇江、宿迁、蚌埠、宣城十四个城市，并在海外十多个国家和地区设有办事处和联络处。好年华经过21年的发展，现已成为江苏地区规模最大的出国机构。', '95%', '4.5', '1550853592', null);
INSERT INTO `y9_organ` VALUES ('99256262', '智课教育', '0', '96', '智课教育', '', '172', '174,176', '8,9,10,11,12,27,41,42,59', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1550854027', '1582362135', 'uploads/99256262/20190223/b3b4f966b0c2d1ddc2617bdc7eb1fb31.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '智课教育旗下的智课出国精英学习中心的步伐已遍布了包括北京、天津、上海、长春、大连、广州、深圳、杭州等近 30 个国内城市。同时，美国波士顿、纽约智课出国精英学习中心也都相继启航。把智课教育先进的教学模式传播到全球各地，使更多的孩子有机会接受更高品质的国际教育。', '94%', '4.5', '1550854027', null);
INSERT INTO `y9_organ` VALUES ('99256263', '达利通教育', '0', '97', '达利通教育', '', '172', '174,175,176', '8,39', '1,2,3,4,7,12,13', '0', '0', '0', '', '', '1', '', '0', '1550854293', '1582362399', 'uploads/99256263/20190223/bb9656ac35ee939e5096de9af1ec6e4b.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '哈尔滨达利通投资顾问有限公司成立于1998年，是全国最早获得教育部认证的自费出国留学中介机构之一。多年来致力于帮助中国学生升入世界各地的著名学府求学深造。与美国、澳大利亚、英国、加拿大、新西兰、瑞典、爱尔兰、法国、德国、新加坡、韩国、日本等20余个国家数千所大学及中学建立了长期合作关系。近二十年我们一直秉承“让中国学生成为最具国际竞争力的世界公民”的理念，成功帮助数万名学生成功迈入世界名校的大门。同时，在留学与语言这两个重要方面上我们也实现了服务一体化，根据学生自身情况，由核心老师制定学习计划与方案，从而更好更快地实现留学梦想。', '95%', '4.5', '1550854293', null);
INSERT INTO `y9_organ` VALUES ('99256264', '凯银教育', '0', '98', '凯银教育', '', '172', '174', '9,12,18,28,32', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,16', '0', '0', '0', '', '', '1', '', '0', '1550857771', '1550829868', 'uploads/99256264/20190223/a07004e5cc4c6afd152f3170993573c3.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '杭州凯银出国留学服务有限公司 是由德信控股集团旗下凯银投资的合资教育机构，成立于2010年，致力于打造留学一体化解决方案高端机构。德信控股集团是一家全国百强房产企业， 从1993年成立到现在，经过22年的运营，德信控股集团已经发展成为一家拥有4大子公司，员工上万的跨国企业。凯银留学借助德信集团， 为学生提供一系列的留学特殊服务。', '95%', '4.5', '1550857771', null);
INSERT INTO `y9_organ` VALUES ('99256265', '威久教育', '0', '99', '威久教育', '', '172', '174,176', '8,9,10,13,15,16,17,28,34,35,54', '1,2,3,4,5,6,7,8,9,10,11,12,13,14', '0', '0', '0', '', '', '1', '', '0', '1550858768', '1582366865', 'uploads/99256265/20190223/f228aac54a3b5a6b3b3cdff0cacf7ffd.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '北京威久咨询有限公司由资深国际教育专家创办， 成立于1998年，并于2016年5月17日成功挂牌新三板，证券简称：东西方，代码：837491，成为在新三板挂牌的国际教育第一股！长久以来，威久一直专注于国际高等教育，与全球上千家院校结成战略合作伙伴关系, 服务网络遍及全球。旨在为广大客户提供专业、优质的服务。', '94%', '4.5', '1550858768', null);
INSERT INTO `y9_organ` VALUES ('99256266', 'INSTART', '0', '100', 'INSTART', '', '172', '196', '12,29', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1550859543', '1582367641', 'uploads/99256266/20190223/6383fc4f032a76a2a5b247f809f49ebd.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '杭州一沙创意留学（简称INSTART）是一家专注于艺术，设计，传媒和创意产业留学咨询规划的教育机构。提供专业的创意艺术留学规划和作品集培训服务，帮助申请者认识自己，激发潜能，建立正统的西方艺术思维，顺利实现留学梦想。', '94%', '4.5', '1550859543', null);
INSERT INTO `y9_organ` VALUES ('99256267', '学畅出国', '0', '101', '学畅出国', '', '172', '174', '9,12,17', '1,2,4', '0', '0', '0', '', '', '1', '', '0', '1551068606', '1582950220', 'uploads/99256267/20190225/56f4ba655278e393da084748c584f4dd.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '上海学畅出国留学服务有限公司，为客户提供全方位的留学方案，业务涵盖美国、英国、澳大利亚、加拿大、德国、荷兰等国家以及中国香港名校申请。学畅成熟的服务流程体系和海内外广泛的渠道资源，让学畅能够更好地为广大客户提供一站式全球化留学服务。', '95%', '4.5', '1551068606', null);
INSERT INTO `y9_organ` VALUES ('99256268', '环球雅思', '0', '102', '环球雅思', '', '172', '176,177,200', '8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551069040', '1582956218', 'uploads/99256268/20190225/debd0de5b482fe87f419525bb757b88c.png', '', '', '', '', '', '', null, '', '0', '1', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '北京市环球天下教育科技有限公司(简称：环球教育)，20多年来，秉持教育成就未来的理念，专注于为中国学子提供出国语言培训及配套服务。目前，环球教育已构建了包含语言培训、出国咨询、国际课程、游学考察、在线课程等在内的教育生态圈。2017年，环球教育成为朴新教育科技集团的一员，为环球教育更快、更全面的成长奠定了坚实的基础。', '95%', '4.6', '1551069040', null);
INSERT INTO `y9_organ` VALUES ('99256269', '朗阁教育', '0', '103', '朗阁教育', '', '172', '176', '8,9,10,11,12,13,14,15,16,17,18,19,20,21,26,27,28', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551074874', '1582956478', 'uploads/99256269/20190225/cc9e461c762c575569ea43ba1564a0a1.png', '', '', '', '', '', '', null, '', '0', '1', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '朗阁（Longre）教育隶属于上海朗阁教育科技股份有限公司，是中国具有影响力及知名度的教育培训品牌之一。朗阁始终以帮助学员获得更好的教学体验和成绩为己任。朗阁（Longre）教育 旗下拥有深耕雅思、新托福、新SAT等海外考试语言培训多年的朗阁培训、专注于德法西意等欧系语言定制培训课程的欧风教育、专注日韩语纯正之道的日韩道以及提供雅思托福线上教育的朗阁在线等五大教育品牌。', '95%', '4.5', '1551074874', null);
INSERT INTO `y9_organ` VALUES ('99256270', '欧风教育', '0', '104', '欧风教育', '', '172', '176', '8,9,10,11,12,13,14,15,16,17,18,19,21,27,28,29,30', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551075191', '1582956800', 'uploads/99256270/20190225/9093b66c24daecddd23136682be395ea.png', '', '', '', '', '', '', null, '', '0', '1', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '南京欧风外语隶属于江苏朗阁外语培训中心 致力于打造专业的德、法、西、意语言培训服务。目前在上海、北京、南京、无锡、苏州、常州、青岛、济南、南昌、成都、杭州、广州、武汉、宁波、厦门等中国一二线城市拥有数十所独立校区，形成完善的全国教学服务网络。', '95%', '4.6', '1551075191', null);
INSERT INTO `y9_organ` VALUES ('99256271', '贵学教育', '0', '105', '贵学教育', '', '172', '176', '8,9,10,13,15,16,17,26,28,29,34,37,38,39,41,47,48', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551075367', '1582956972', 'uploads/99256271/20190225/2e4f832ff5fc1040d5a23bb61eb494da.png', '', '', '', '', '', '', null, '', '0', '1', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '北京学为贵教育科技有限公司由英语教育家刘洪波创办，汇集海内外语言教育精英，创立GETS英语真经教学体系，其服务涵盖雅思、托福、GMAT、SAT、青少英语、四六级等英语培训及出国留学服务，是雅思考试官方白金级合作伙伴及托福考试官方联盟项目成员。多年学术沉淀，上百本原创英语教材；多款移动App提供个性化、互动化、智能化的学习体验；旗下英澳新留学免申请费+奖学金模式广受好评。', '96%', '4.5', '1551075367', null);
INSERT INTO `y9_organ` VALUES ('99256272', '新航道教育', '0', '106', '新航道教育', '', '172', '176,200', '8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,26', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551075612', '1582957215', 'uploads/99256272/20190225/1ed27466ff9003101d24e9bd41bfb00b.png', '', '', '', '', '', '', null, '', '0', '1', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '新航道国际教育集团(New Channel International Education Group Limited)是由胡敏教授率领一批团队成员共同创办，美国国际数据集团(IDG)和美国KAPLAN国际教育集团参与战略投资的语言教育机构。下辖培训学校、留学咨询公司、美国AP课程中心、在线教育事业部、优加青少英语事业部、派乐多幼少儿英语事业部、图书出版事业部、加盟事业部、各省市分支机构等五十五家机构。', '95%', '4.6', '1551075612', null);
INSERT INTO `y9_organ` VALUES ('99256273', '四达教育', '0', '107', '四达教育', '', '172', '174,176,177', '8', '1,2,3,4', '0', '0', '0', '', '', '1', '', '0', '1551080752', '1582962356', 'uploads/99256273/20190225/aed89759a7cd2d72e999566083600ea9.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '北京四达留学服务有限公司成立于1986年，是全国最早从事留学服务行业机构之一。是首批得到国家认可有留学服务资质的权威机构(教外综资认字【2000】9号)。原隶属于国家劳动和社会保障部，现为中国贸促会直属机构，中国十大出国留学品牌机构，留学行业协会常任理事，出国留学行业协会创始单位之一。', '95%', '4.5', '1551080752', null);
INSERT INTO `y9_organ` VALUES ('99256274', '森淼教育', '0', '108', '森淼教育', '', '172', '174,176', '8,9,10,16,28,37', '9', '0', '0', '0', '', '', '1', '', '0', '1551086707', '1582968331', 'uploads/99256274/20190225/adfd27ba5f3c70d75e699dd8bf9b22ad.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '森淼留学网隶属于北京森淼茂溢国际信息技术有限公司，成立于2006年，是国内最早开设意大利留学资讯服务的网站之一，本着“完成每一位同学赴意梦”的初衷，森淼留学网13年时间内共帮助上万名访客成功赴意留学！', '94%', '4.5', '1551086707', null);
INSERT INTO `y9_organ` VALUES ('99256275', '睿励人生', '0', '109', '睿励人生', '', '172', '174', '8,9,10,13,28', '1,2,3,4', '0', '0', '0', '', '', '1', '', '0', '1551086997', '1582968601', 'uploads/99256275/20190225/bd175cee5520a1e85ae9d5a48a9ec092.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '睿励人生，全称北京睿励人生国际教育咨询有限公司成立于1999年1月，是获得教育部认证的出国留学中介服务机构(教外综资认字[2010] 402号)的企业。网站备案/许可证号:京ICP备09021288号-2。', '94%', '4.4', '1551086997', null);
INSERT INTO `y9_organ` VALUES ('99256276', '金矢教育', '0', '110', '金矢教育', '', '172', '174', '8,9,10,12,15,17,28,29,37,39,40,41,42,48,51,59', '1,2,3,4,5,6,7,8,9,12,13', '0', '0', '0', '', '', '1', '', '0', '1551087341', '1582968951', 'uploads/99256276/20190225/2ee9083bb04c096bddee67d24be9b1ed.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '北京金矢教育信息咨询有限公司（下简称金矢）成立于1998年，是一家从事以英美澳加港为主打项目的留学机构。如今，金矢已成为留学行业的领头羊，业务领域也从单纯的英美澳新等英语国家扩展到韩、日、法、德、荷兰及北欧等国家和地区。目前，金矢在全国设有23家分公司。', '95%', '4.5', '1551087341', null);
INSERT INTO `y9_organ` VALUES ('99256277', '华夏博雅', '0', '111', '华夏博雅', '', '172', '174,176,196', '8,10,16,33,34,35,38,45', '1,2,3,4,7,8,9,10,11,12,13,16', '0', '0', '0', '', '', '1', '', '0', '1551087763', '1582969380', 'uploads/99256277/20190225/e9b98615435b13f7dd6e49d0c1c7a0a2.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '华夏博雅国际教育，隶属于华夏博雅(北京)教育科技有限公司，是一家专注于\"全球国际艺术教育、艺术留学申请规划、艺术作品集培训、TOP艺术院校申请\"的艺术留学服务机构，企业的教学团队均来自于全球顶尖艺术院校的导师、院校教授以及MICA等名校招生官。企业始终秉承“帮助中国有艺术潜力，有梦想的孩子实现自己的人生价值。”的服务理念。华夏博雅国际教育多年来一直致力于打造最专业的国际艺术留学机构，引入国际先进的艺术教学体系课程及教学理念，帮助更多有艺术才华的孩子实现艺术梦想。', '95%', '4.5', '1551087763', null);
INSERT INTO `y9_organ` VALUES ('99256278', 'SIUK', '0', '112', 'SIUK', '', '171', '174,200', '9', '1,2,4,7', '0', '0', '0', '', '', '1', '', '0', '1551092144', '1582973748', 'uploads/99256278/20190225/f9ce694b15b3bf1314ddbed224ee55fe.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '博耘不仅拥有强悍的服务团队，更拥有傲娇于行业的海外教育资源，我们不仅与同众多海外中学、大学、职业课程类学院等保持深入的合作，更是诸多海外企业、律师事务所的战略合作伙伴。我们以全新的理念、开放的心态致力于为客户的不同人生阶段提供科学的规划、便捷的途径、规范的国际教育投资服务，以帮助客户获取最大的国际教育投资收益。', '96%', '4.6', '1551092144', null);
INSERT INTO `y9_organ` VALUES ('99256279', '啄木鸟教育', '0', '113', '啄木鸟教育', '', '172', '174,176', '8,9,10,11,12,13,15,16,17,28,35,37,40,41,48,54,59', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551092341', '1582973949', 'uploads/99256279/20190225/472091b73a9899d23c8497b0c3496af0.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '啄木鸟国际教育咨询(北京)有限公司（简称：啄木鸟教育）成立于2006年，是专注北美出国留学考试培训与留学申请品牌，致力于帮助每一位学生全面认识自我，提升综合能力，成为拥有国际化视野的人才。啄木鸟教育在实现跨越式的超规模发展过程中，目前已形成以北京为集团总部，全资拥有北京、上海、广州、沈阳、武汉、深圳、南京、西安、郑州、太原、大连、昆明、成都、青岛、杭州、重庆等16家分公司，员工人数近800余人。', '95%', '4.5', '1551092341', null);
INSERT INTO `y9_organ` VALUES ('99256280', '樱知叶教育', '0', '114', '樱知叶教育', '', '172', '174,176,200', '8,9', '1,2,3', '0', '0', '0', '', '', '1', '', '0', '1551148139', '1582943347', 'uploads/99256280/20190226/c7a85ee3823543139762ab0159550363.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '樱知叶凭借多年的发展，已形成了以教育资讯，留学，游学，培训为一体的教育集团，下辖万仕达留学、美国高中网、北京赛达学校等知名品牌。强力锻造美国留学的标准化考试培训、美国留学的申请与签证以及旅美后续服务等一条龙专业服务体系，进而形成优势互补、便捷效率的一站式经营模式，方 便所有怀揣留美梦想的莘莘学子。', '95%', '4.5', '1551148139', null);
INSERT INTO `y9_organ` VALUES ('99256281', '信美教育', '0', '115', '信美教育', '', '172', '174,176', '8', '1', '0', '0', '0', '', '', '1', '', '0', '1551148444', '1582943652', 'uploads/99256281/20190226/5dcbfa2a50bc79286a6895e873928749.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '信美留学专注于为客户提供精品出国留学服务，充分整合国内外优质教育资源，信美留学开创了四大产品体系，涵盖留学规划、语言培训、留学申请和境外服务四个环节，以全新的服务模式，将留学服务的重心聚焦于客户成长和综合申请背景的提升，配备中外籍资深学术导师协助完成留学规划和申请工作，在获得院校录取后提供境外服务，持续关注客户在未来职场发展中的需求，让留学提升价值,让教育成就人生。', '95%', '4.5', '1551148444', null);
INSERT INTO `y9_organ` VALUES ('99256282', '藤门国际', '0', '116', '藤门国际', '', '172', '174,176', '8,9,10,11,12,13,15,16,28,35,41', '1', '0', '0', '0', '', '', '1', '', '0', '1551148723', '1582943930', 'uploads/99256282/20190226/bddd949699cc75d6d2ac75236fb4b6f2.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '2007年，藤门品牌前身由初创团队在美国波士顿发起，后成长为国际高等教育领域的专业团队，并在中国本土发展壮大。藤门招生官团队专注美国高端留学申请十余年，开发出独具特色的美国名校申请、规划及培训项目，涵盖了从小学到硕博申请全阶段服务。如今形成了以100余名美国名校前招生官为独家优势资源，中外籍员工人数超800人的规模。', '95%', '4.4', '1551148723', null);
INSERT INTO `y9_organ` VALUES ('99256283', '顺顺教育', '0', '117', '顺顺教育', '', '172', '174,176,177', '8,9,13,17,28,29', '1,2,3,4,7,14', '0', '0', '0', '', '', '1', '', '0', '1551149101', '1582944317', 'uploads/99256283/20190226/bf083412fc0e4c571bd8b61ea1a44bfe.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '顺顺留学是好未来教育集团旗下的专业留学品牌秉承着“透明、专业、高效”的服务理念独有的智能透明留学申请系统，真正做到申请服务全程透明，致力于用科技推动教育进步。', '95%', '4.5', '1551149101', null);
INSERT INTO `y9_organ` VALUES ('99256284', '启德教育', '0', '118', '启德教育', '', '172', '174', '8,9,10,11,12,13,14,15,16,17,27,28,29,30,32,34,35', '1,2,3,4,7,12,13,14', '0', '0', '0', '', '', '1', '', '0', '1551150067', '1551150075', 'uploads/99256284/20190226/d68c626fad1e30a60337cf7f5d4950b0.png', '', '', '', '', '', '', null, '', '0', '1', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '启德教育，是国内留学规划与出国培训的国际教育机构，也是中国较早聚焦于国际教育一站式服务的企业，具有雄厚的国际教育资源优势，提供少儿英语课程、学术英语课程、素质教育、桥梁课程、国际学校、出国留学考试培训、学游、出国留学规划、海外留学服务等国际教育全产业链服务，致力于成为“值得信赖的国际教育机构”。', '95%', '4.5', '1551150067', null);
INSERT INTO `y9_organ` VALUES ('99256285', '美沃德教育', '0', '119', '美沃德教育', '', '172', '174,176', '8', '1', '0', '0', '0', '', '', '1', '', '0', '1551150491', '1582945702', 'uploads/99256285/20190226/1f6b7c38bc5be53df89e658ad4a10377.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '北京美沃德咨询有限公司是一家与美国国家大学招生顾问协会合作的咨询机构，申请留学的学生完全由美国本土专家提供服务。美沃德国际教育自身拥有无可比拟的优势，通过为每位学生量身定制个性化留学方案，精雕细琢、一丝不苟地在学生配合下完成全部申请过程，最终实现同学们追逐美国名校的梦想！美沃德咨询赢得了学生和家长们的充分信赖。', '95%', '4.5', '1551150491', null);
INSERT INTO `y9_organ` VALUES ('99256286', '艾迪教育', '0', '120', '艾迪教育', '', '172', '174', '8,10,16,17,27,34', '2,3,4,7,8,14', '0', '0', '0', '', '', '1', '', '0', '1551168452', '1582963658', 'uploads/99256286/20190226/0d4daf196af086e3b264d3b29c66acfa.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '艾迪与澳大利亚、美国、加拿大、英国、爱尔兰、新西兰、亚洲等世界众多知名院校合作紧密，为数万名学生办理了出国留学业务，在中国留学行业中享有盛誉。艾迪留学凭借十几年来与海外院校紧密的合作关系，在中国境内创立海外院校驻华办公的留学服务模式。院校驻华代表均由海外院校直接委派，代表院校常驻中国全面开展推广和招生工作。', '95%', '4.6', '1551168452', null);
INSERT INTO `y9_organ` VALUES ('99256287', '挚拓教育', '0', '121', '挚拓教育', '', '171', '174', '10', '1,2,3,4,5,6,7,8,9,12,13,14', '0', '0', '0', '', '', '1', '', '0', '1551171577', '1582966787', 'uploads/99256287/20190226/dfe3d1ee1db264eb07fd1a07827e65c0.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '广州挚拓教育科技有限公司（简称：挚拓教育），2010开创于美国加州，而后正式进驻中国教育咨询市场。现已成为坐拥珠三角、辐射全中国，影响力覆盖全球多个国家的留学咨询行业领军品牌。在美国洛杉矶、加拿大温哥华等留学热门城市都设有专门的办公室和咨询点。', '95%', '4.5', '1551171577', null);
INSERT INTO `y9_organ` VALUES ('99256288', '青邻教育', '0', '122', '青邻教育', '', '171', '174', '17', '1,2,3,4', '0', '0', '0', '', '', '1', '', '0', '1551171871', '1582967199', 'uploads/99256288/20190226/bfd27a7085de39b0583aa55efe64a981.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', null, '95%', '4.5', '1551171871', null);
INSERT INTO `y9_organ` VALUES ('99256289', '由如艺术', '0', '123', '由如艺术', '', '172', '196', '9', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551172362', '1582967570', 'uploads/99256289/20190226/a9b7c3b2e5a24cacb87af7258d3cf554.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '2015年由如成立于美国纽约华 尔街金融区，遥望自由女神像。2016年,由如拓展版图，走进上海。将联合纽约与上海，以最包容的态度和最开阔的视野，纵览世界，带给学生最优质的艺术设计精英咨询服务。', '95%', '4.5', '1551172362', null);
INSERT INTO `y9_organ` VALUES ('99256290', '斯芬克国际', '0', '124', '斯芬克国际', '', '172', '196', '8,9,10,11,12,13,15,16,17,28,37', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551172554', '1582967762', 'uploads/99256290/20190226/77c378438329580e04e7df934704120f.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '斯芬克国际艺术教育(隶属于北京斯芬克教育咨询有限公司)是一家专注于国际艺术创新教育、作品集培训、艺术留学规划的专业教育培训机构。2011年初创于美国纽约曼哈顿，中国区总部位于北京，现已于上海、成都、杭州、广州、深圳、南京、武汉、郑州、重庆、西安建立教育机构，是国内最专业的国际艺术教育留学机构。', '95%', '4.5', '1551172554', null);
INSERT INTO `y9_organ` VALUES ('99256291', '雅力国际', '0', '125', '雅力国际', '', '172', '174,175', '9', '1,2', '0', '0', '0', '', '', '1', '', '0', '1551173258', '1582968468', 'uploads/99256291/20190226/f46f6707776bba4c7ef987a910c51180.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '致力于提供高质量的国际教育, 积极建设具有国际化氛围的优异环境，培育和维持学术、管理的卓越。我们的资质授权使我们能够为学生提供好的师资力量、课程活动和领导力发展培训。我们努力实现家长们的期望，因而赢得信任与互赖。', '96%', '4.5', '1551173258', null);
INSERT INTO `y9_organ` VALUES ('99256292', '飞出国教育', '0', '126', '飞出国教育', '', '172', '174', '8', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551173475', '1582968683', 'uploads/99256292/20190226/b528c0947cc8a42a13dcb69a2424023b.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '飞出国是国内首个提供留学全产业服务的第三方平台，也是首个提出B2C留学平台概念的互联网留学解决方案提供者。\r\n通过严格的甄选制度，飞出国把各国精英顾问、语言类培训、游学、海外高校学长学姐、海外住宿、海外汇款、机票与银行卡等服务机构集中在同一个平台上，以B2C模式一站式为学生提供服务。', '95%', '4.5', '1551173475', null);
INSERT INTO `y9_organ` VALUES ('99256293', '优越教育', '0', '127', '优越教育', '', '172', '174,196', '8,9,17', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551173639', '1582968847', 'uploads/99256293/20190226/728efc1a4662e0a749db2bb193e7530d.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '上海优悦教育信息咨询有限公司（优越留学），是英国当地注册的正规教育咨询公司，受英国工商局，外交部、移民局、伦敦使馆、英国本科官方招生中心（UCAS）多重认证。优越留学拥有英国移民局招聘许可（Tier2 Sponsor License，与英国大学Tier4 Sponsor License同类别）。作为英国留学高端品牌，优越留学一直致力于提升留学质量与留学体验，在英国留学领域独树一帜！', '95%', '4.5', '1551173639', '1');
INSERT INTO `y9_organ` VALUES ('99256294', '金吉列教育', '0', '128', '金吉列教育', '', '172', '174,175,176,200', '17', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,16', '0', '0', '0', '', '', '1', '', '0', '1551175037', '1582970244', 'uploads/99256294/20190226/eab77ae6a2d79c9cc884689a2eb9a030.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '金吉列企业集团是中国500家最大私营企业之一，业务涉及出国留学、海外移民、游学、签证、PTE学术英语等领域。', '94%', '4.5', '1551175037', '3');
INSERT INTO `y9_organ` VALUES ('99256295', '土豆教育', '0', '129', '土豆教育', '', '172', '176', '8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551175294', '1582970602', 'uploads/99256295/20190226/536743f872460b7f51ec45c449adfe26.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '土豆教育创立于2017年，由在出国语言培训界被誉为“雅思天后”的刘薇女士以及数位业内资深人士共同创立。土豆教育坚信：不走弯路，就是捷径！土豆教育的通过改善学生英语学习习惯、重塑中国学生英语学习思维来达到夯实基础、快速提分的课程效果。土豆教育以“一手教研，一手科技”作为企业发展的宗旨，高水平的教研、教师团队和高品质的在线课程收到了广大学生和家长的喜爱。土豆教育基于优质学习内容与前沿科技深度结合，为学生们提供领先的、高效的语言学习体验。土豆教育将“为学生创造更多价值”为己任，致力于成为值得大众信赖的国际化教育品牌。', '96%', '4.5', '1551175294', null);
INSERT INTO `y9_organ` VALUES ('99256296', '西奈山国际', '0', '130', '西奈山国际', '', '172', '176', '8,9', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551175660', '1582970881', 'uploads/99256296/20190226/0957c7faccdca4c12a44e9632f7c6359.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '西奈山国际教育是一家提供国际教育课程的教育服务机构，注重学术英语分析技术、教学工具和课程的研发，拥有SAT模考技术AEA系统 ，为中国高中学校提供 iSAT 和 iAP两大系列课程服务。', '95%', '4.5', '1551175660', null);
INSERT INTO `y9_organ` VALUES ('99256297', '全欧教育', '0', '131', '全欧教育', '', '172', '176', '8,9,13,17,21', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551176000', '1582971207', 'uploads/99256297/20190226/283ebe4b3a424d61d1ab7043b4fdffe6.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', 'EAU全欧语言中心，是北京环球艺盟国际教育咨询股份有限公司旗下权威的专业小语种培训基地，从事专业的欧洲语系（德、意、法、西）语言培训及教学研究。目前我们集团在北京、上海、南京、苏州、成都、合肥等中国一二线城市拥有26个校区，形成完善的全国教学服务网络体系。环球艺盟国际教育集团已于2016年12月30日正式挂牌上市。', '95%', '4.5', '1551176000', null);
INSERT INTO `y9_organ` VALUES ('99256302', '韦博英语', '0', '224', '韦博英语', '', '172', '176', '8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551240231', '1582949044', 'uploads/99256302/20190227/ca9fd2be9c9ecf306488c3fb799ff535.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '韦博英语创立于1998年，以英语口语培训为核心，为6周岁以上人群提供以实用为导向的中外教结合英语课程及相关服务。基于科学严谨的学习方法和丰富多元的学习形式，通过创造开放融合的学习环境和广泛联结的学习氛围，实现英语素养的渐进提升，\r\n带来融入生活的英语体验。从而让语言能力助力自在分享，让语言能量激发共同坚持。目前，韦博英语在全国60多个城市150多家中心，帮助近百万名学员自信说英语。', '95%', '4.5', '1551240231', null);
INSERT INTO `y9_organ` VALUES ('99256303', '英培国际', '0', '225', '英培国际', '', '172', '176', '8', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551240404', '1582949218', 'uploads/99256303/20190227/624ab522ed8a5fb6be376c579a21fc4a.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '“英培”源于英语“EXPET”，因专家而得名，为专业而创立。英培创始人与核心管理团队都是国内教育培训行业的领军精英，曾在国内上市教育机构担任高级管理者。自学校成立以来，吐故纳新，创新研发教学与课程，专注打造出国语言考试及学科课程培训，行成一套效能极高的英语学习、考试提分、短期冲刺课程体系。', '94%', '4.5', '1551240404', null);
INSERT INTO `y9_organ` VALUES ('99256304', '樱花日语', '0', '226', '樱花日语', '', '172', '174,176,200', '8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2', '13', '0', '0', '0', '', '', '1', '', '0', '1551241416', '1582950230', 'uploads/99256304/20190227/ec5975b061483fc94e171b6e8e746dfd.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '樱花国际日语是由上海新世界外国语进修学院从日本引进的教育品牌。学院以日语系统教育为基础，依托新世界教育多年来日语本土化辅导经验。', '95%', '4.5', '1551241416', null);
INSERT INTO `y9_organ` VALUES ('99256305', '樱田教育', '0', '227', '樱田教育', '', '172', '176', '8', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551246585', '1582956349', 'uploads/99256305/20190227/b52fee85e59c24b1e21607ab813003d5.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '北京樱田小语种培训注重功能性语言培训，全方面提升听说读写能力，让您在寓教于乐中轻松学习，无论是低调炫耀，还是出国旅游，或是短期游学，甚至是出国留学，通过樱田小语种课堂帮您轻松搞定。', '95%', '4.5', '1551246585', null);
INSERT INTO `y9_organ` VALUES ('99256306', '智赢国际', '0', '228', '智赢国际', '', '172', '176', '8,9', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551248346', '1582957160', 'uploads/99256306/20190227/e1b0b4b2a9fc5f7e7105af643a385fa3.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '作为出国类语言个性化教育机构的翘楚，智赢国际英语秉承个性化教学理念，积极致力于个性化出国语言培训的教学和研发，借鉴及引入国际先进英语教学模式，确立了以英语综合能力提高为教学核心、帮助学员提升出国类考试分数为最终教学目标的个性化教学模式。', '95%', '4.4', '1551248346', null);
INSERT INTO `y9_organ` VALUES ('99256307', '伯克列教育', '0', '229', '伯克列教育', '', '172', '176', '13', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551248775', '1582957587', 'uploads/99256307/20190227/45189528075a2fea78f1fca6941c82f6.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '四川伯克列教育咨询有限公司是中国国际教育语言培训机构自2010年来一直致力于国际出国留学雅思、托福、SAT、GRE、GMAT等语言考试培训，得到加州大学伯克利分校的访问学者的鼎力支持，伯克列在中国地区拥有大规模、高水平培训老师，几年来培训出大量托福、雅思等高分学生，颇受广大师生欢迎。', '95%', '4.5', '1551248775', null);
INSERT INTO `y9_organ` VALUES ('99256308', '沃尔得外语', '0', '230', '沃尔得外语', '', '172', '176', '34', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551249126', '1582957940', 'uploads/99256308/20190227/e6b903a7b3443b42b4206f352afbfef3.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', ' 济南沃尔得英语隶属于沃尔得集团。沃尔得英语是高端个性化成人教育品牌，目前已经有超过30万的学员在沃尔得实现了自己的英语学习梦想，并在全国30多个城市开设了60多家学校。沃尔得创立至今始终坚持帮助更多中国人快乐、自信、便捷地掌握流利英语，并实现成功梦想为使命，全方位地解决不同学员英语学习中遇到的各种问题和困难。每年为国家公务员、跨国机构、各行业职员、在校学生等等在内的数万学员提高英语水平。', '95%', '4.5', '1551249126', null);
INSERT INTO `y9_organ` VALUES ('99256309', '美伦教育', '0', '231', '美伦教育', '', '172', '176', '59', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551249481', '1582958426', 'uploads/99256309/20190227/790dec0bb80c0f6ab48e024c6d527208.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '扬州美伦教育咨询有限公司    扬州美伦教育咨询有限公司2011年正式入驻扬城。中心为广大学员提供专业英语培训4-6人大班、2-4人小班、一对一VIP教学服务，课程体系包含：雅思、北美（托福、GRE、SAT、SSAT、GMAT、托福Junior）、英语口语、大学四六级英语、商务英语、新概念英语、剑桥英语，同时我们还提供企业团体培训的课程，欢迎您的咨询。', '94%', '4.5', '1551249481', null);
INSERT INTO `y9_organ` VALUES ('99256310', '佩克教育', '0', '244', '佩克教育', '', '172', '176', '42', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551250158', '1582958975', 'uploads/99256310/20190227/2f47eadf6190db49eb38a1b3818cf503.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '佩克国际教育，立足于国内、国际考试类研究，涉足中高端培训行业。经过丰富的经验积累和多角度的研发，已形成完善而成熟的教学体系。佩克国际教育，秉承“中西合璧”的教学理念，采用应试技巧和知识拓展相结合的教学模式，提供个性化服务，为学生的前程保驾护航，助力梦想！用专业和耐心，做良心教育！', '95%', '4.5', '1551250158', null);
INSERT INTO `y9_organ` VALUES ('99256311', '新英美教育', '0', '245', '新英美教育', '', '172', '176', '35', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551250567', '1582959718', 'uploads/99256311/20190227/e0afadd6c892c9af6b67d3f5248e2e4c.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '青岛新英美外语是新英美国际教育集团旗下直属一级机构。自入住岛城以来，凭借其深厚的学术功底，务实的教学作风和旺盛的进取精神，在行业内迅速脱颖而出。海外留学名师任教，优美海景教室，我们始终以提高学员的外语学习能力及应用能力为己任，并不断在教学内容、授课质量、环境服务等多个方面，为业界创立了全新的教学理念和服务标准。', '95%', '4.5', '1551250567', null);
INSERT INTO `y9_organ` VALUES ('99256312', '智美教育', '0', '246', '智美教育', '', '172', '176', '15', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551251654', '1582960879', 'uploads/99256312/20190227/5f63a996c5b3dbf0c0366a59328fadbd.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '西安智美教育科技有限公司（简称：智美外国语）是高端专业的小语种培训中心，具体业务分为小语种培训(日，韩，德，法，西，意，俄语)、雅思托福、出国留学语言。', '95%', '4.5', '1551251654', null);
INSERT INTO `y9_organ` VALUES ('99256313', '顶上留园', '0', '247', '顶上留园', '', '172', '176', '8', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551252915', '1582961726', 'uploads/99256313/20190227/ebe75f184f8552bae4e3090da6a956c3.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '我们以专业灵活的培训方式，让众多小语种爱好者体验到了不一样的学习方式，实现了许多人出国留学的梦想。', '95%', '4.5', '1551252915', null);
INSERT INTO `y9_organ` VALUES ('99256314', '文都教育', '0', '248', '文都教育', '', '172', '176', '8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551253425', '1582962302', 'uploads/99256314/20190227/73fbb1aabc67e99d315e172dbc9b6dbd.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '世纪文都教育科技集团股份有限公司创立于2005年11月，注册资本9746万元，是为大学生提供升学、就业和职场提升的综合服务商。公司总部位于北京市海淀区中关村高科技园区，在全国拥有三十多家直营机构，六百多家合作机构，三千多个教学网点，一万多名校园代理，累计录制各类教学视频课程 两百多万课时，年策划发行图书两百多个品种，两亿多码洋，培训学员一千多万人次，以业界名师、精彩课程、优质资料、专业服务、前沿技术、科学管理及全方位品牌建设，成为中国知名教育品牌。', '94%', '4.5', '1551253425', null);
INSERT INTO `y9_organ` VALUES ('99256315', '硕儒教育', '0', '249', '硕儒教育', '', '172', '174,176', '17', '12,13', '0', '0', '0', '', '', '1', '', '0', '1551254067', '1582963892', 'uploads/99256315/20190227/8f60334a46ef5000728576cd84ec3679.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '集团下设有江苏硕儒国际教育咨询集团有限公司、江苏硕儒出国留学服务有限公司、江苏硕儒置业有限公司、南京硕儒语培教育科技有限公司、北硕航空技术无锡有限公司、成均馆学院、大韩小屋(北京)文化发展有限公司7大战略业务单元。集团核心业务有中外学术交流、海外文化交流、出国留学、国际间合作办学、教师互换、航空教育、通航产业等。', '95%', '4.5', '1551254067', null);
INSERT INTO `y9_organ` VALUES ('99256316', '北雅国际', '0', '250', '北雅国际', '', '172', '176', '21', '1,2,3,4,7', '0', '0', '0', '', '', '1', '', '0', '1551256084', '1551256643', 'uploads/99256316/20190227/80301b1c2ed4161563a8da368be467fa.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '苏州北雅国际教育集团成立于2005年11月，在苏州市区、园区中心区域拥有自有办公、教学面积达6000多平。旗下子品牌有：北雅雅思、北雅托福、捷思青少年英语、新概念英语，是集雅思、托福、新概念英语等教育项目为一体的综合性教育集团，本着一切从学员的利益出发的理念，立志扎根于“天堂”苏州，致力于为客户提供专业、学术、优质的教育服务，成为苏州百年诚信品牌。', '95%', '4.5', '1551256084', null);
INSERT INTO `y9_organ` VALUES ('99256317', '小站教育', '0', '251', '小站教育', '', '172', '176', '8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551257157', '1582965972', 'uploads/99256317/20190227/03c5aa6ffa60e25107e2b9fe07dd28e4.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '小站教育 CEO王浩平希望小站不仅仅在出国语言考试上为广大学员提供服务，更能通过小站倡导年轻人热爱梦想并为之战斗的精神。不变的初心，不变的小站，始终陪你到底。 ', '95%', '4.5', '1551257157', null);
INSERT INTO `y9_organ` VALUES ('99256318', '新东方在线', '0', '252', '新东方在线', '', '172', '176', '8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '0', '0', '0', '', '', '1', '', '0', '1551257679', '1551258090', 'uploads/99256318/20190227/e8fc79e32a04fed4ace7bc881ee15499.png', '', '', '', '', '', '', null, '', '0', '1', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '新东方在线是新东方教育科技集团(NYSE:EDU)旗下专业的在线教育网站，是国内首批专业在线教育网站之一，依托新东方强大师资力量与教学资源，拥有中国先进的教学内容开发与制作团队，致力于为广大用户提供个性化、互动化、智能化的卓越在线学习体验。', '95%', '4.5', '1551257679', null);
INSERT INTO `y9_organ` VALUES ('99256319', '英孚教育', '0', '253', '英孚教育', '', '172', '176', '8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2', '1,2,3,4,7', '0', '0', '0', '', '', '1', '', '0', '1551257787', '1582966599', 'uploads/99256319/20190227/f8c718ab755dc38ddeb39f2f89d5c2ab.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', 'EF英孚教育的教学方法与众不同并且快速高效！我们采用由英孚学术专家精心打造并自主研发英语培训教材，我们大部分的外籍培训师持有国际英语教学资格认证，并进行小班教学，我们的每所中心大都处于交通便捷的地段，并配有互联网技术的互动语言实验室和英语学习辅助技术，我们还开设不同主题的英语生活俱乐部，这些都旨在让EF学员学习英语更快捷更高效。 ', '95%', '4.5', '1551257787', null);
INSERT INTO `y9_organ` VALUES ('99256320', '中公教育', '0', '254', '中公教育', '', '172', '176', '8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,2', '1,2,3,4,7', '0', '0', '0', '', '', '1', '', '0', '1551258073', '1582967002', 'uploads/99256320/20190227/a998b4d74ccc7c6815ed1464e302d986.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '北京中公教育科技有限公司成立于2010年。公司创始人团队于1999年开始创业，2000年进入公务员考试培训行业，经过近20年的创业积累，快速带领公司成为国内领先的职业就业培训综合服务提供商，每年培训学员超过140万人。', '95%', '4.5', '1551258073', null);
INSERT INTO `y9_organ` VALUES ('99256321', '乐享佳宁', '0', '255', '乐享佳宁', '', '172', '176', '8', '1,2,3,4,7', '0', '0', '0', '', '', '1', '', '0', '1551258466', '1582967278', 'uploads/99256321/20190227/c5f7412f2abaf689a209602c4dd8bc4b.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '乐享佳宁成立于 2010年，是一家专注于托福、雅思、SAT、ACT、SSAT、SAT2、AP、IB、A-LEVEL等留学考试培训的高端教育咨询公司。', '95%', '4.5', '1551258466', null);
INSERT INTO `y9_organ` VALUES ('99256322', '百弗教育', '0', '256', '百弗教育', '', '172', '176', '16', '1,2,3,4,7', '0', '0', '0', '', '', '1', '', '0', '1551258550', '1582968520', 'uploads/99256322/20190227/e0241110a415db7526226d22505e1950.png', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '百弗英语重庆市沙坪坝区百弗教育培训学校是ETS官方认可的TELA项目合作机构，雅思官方合作伙伴，雅思留美之星称号，具有专业的出国留学培训资质。', '95%', '4.5', '1551258550', null);
INSERT INTO `y9_organ` VALUES ('99256324', '再来人教育', '0', '258', '再来人教育', '', '171', '174,177', '8', '1,2', '0', '0', '0', '', '', '1', '', '0', '1552272272', '1900800', 'uploads/image/0812b6450ecd8c117cf2e0493889e6bd.jpg', '', '', '', '', '', '', null, '', '0', '0', 'default', '0', '0.00', '0', null, '', '0', '0', '0.00', '0', '0', '1', '0', '为保障教育结果，我们结合世界名校招生官，从大数据库中获取海量留学资讯，独立研发KEIS方法论与能够帮助学员从0-100多方面提升的STEP辅导体系。同时，为了能够让学生更便捷的学习，我们上线了MSP服务平台，通过科技优化了教与学的整个过程，实现了学生-家长-导师全程透明的“三位一体”的立体化教学。此外，为了能够帮助更多中国青年在国际舞台释放潜能，我们启动了再来人奖学金项目，提供价值10万元的服务内容，并为学生搭建全球精英社群，让他们获得求学和职业道路上所需的资源和人脉。', '91%', '4.50', '1552272272', null);

-- ----------------------------
-- Table structure for `y9_profile`
-- ----------------------------
DROP TABLE IF EXISTS `y9_profile`;
CREATE TABLE `y9_profile` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `truename` varchar(32) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `age` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '年龄',
  `sex` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '2016-01-01' COMMENT '生日',
  `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '昵称',
  `company` varchar(100) NOT NULL DEFAULT '' COMMENT '公司',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户的ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_profile_userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of y9_profile
-- ----------------------------

-- ----------------------------
-- Table structure for `y9_user`
-- ----------------------------
DROP TABLE IF EXISTS `y9_user`;
CREATE TABLE `y9_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of y9_user
-- ----------------------------
INSERT INTO `y9_user` VALUES ('1', 'admin', '-PqA3gz7yvL098U6Udq13uRBvQCXHRyU', '$2y$13$EXFy9Z59lP/eLn1vd.Qae.sQxaAkqMlQALOZ9EIPDiERZsrwGu.qi', null, '709334814@qq.com', '10', '1554863543', '1554863543');
INSERT INTO `y9_user` VALUES ('2', 'test1', 'PqA3gz7yvL098U6Udq13uRBvQCXHRyU', '$13$EXFy9Z59lP/eLn1vd.Qae.sQxaAkqMlQALOZ9EIPDiERZsrwGu.qi', null, '719334814@qq.com', '10', '1554863543', '1554863543');

-- ----------------------------
-- Table structure for `y9_user1`
-- ----------------------------
DROP TABLE IF EXISTS `y9_user1`;
CREATE TABLE `y9_user1` (
  `userid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(32) NOT NULL DEFAULT '',
  `userpass` char(64) NOT NULL DEFAULT '',
  `useremail` varchar(100) NOT NULL DEFAULT '',
  `openid` char(32) NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `shop_user_username_userpass` (`username`,`userpass`),
  UNIQUE KEY `shop_user_useremail_userpass` (`useremail`,`userpass`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of y9_user1
-- ----------------------------
INSERT INTO `y9_user1` VALUES ('8', 'imooc_584ff2d3690df', '$2y$13$IIHLV1c6b5L2TVdmqmVkVux5zfHRAlekvoc90EYvQbGkaj2RSUD1y', '86267659@qq.com', '0', '1481634515');
INSERT INTO `y9_user1` VALUES ('9', 'imooc_584ff2e9cf596', '$2y$13$fOfENY.LLav0Lyv0x99JveKkun8QuUjmLPobtpepIGC.xpPsxvWs.', '86267659222222@qq.com', '0', '1481634537');
INSERT INTO `y9_user1` VALUES ('10', 'imooc_585009f93169f', '$2y$13$MbfHFopQnzfkcciH49ax/OSbifK1W5lXBOre7dFF1ovd3astSyuVq', 'zhangsan@163.com', '0', '1481640441');
INSERT INTO `y9_user1` VALUES ('11', 'imooc_5850119de9ecd', '$2y$13$szqUH0mYsgsWOPjBp5yFUesmyzKf.grbsbwyGaObOEjx5ozdEr0Km', 'zhangsan123@imooc.com', '0', '1481642398');
INSERT INTO `y9_user1` VALUES ('12', 'zhangsan', '$2y$13$Pk5nMHtAmzMxYVnyGb7ywO8RKAc70C3DpYU.1NRUSeXbBJe5IysHW', 'zhangsan@zhangsan.com', '0', '1481652118');
