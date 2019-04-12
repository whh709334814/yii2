/*
Navicat MySQL Data Transfer

Source Server         : www.91.com
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : yii2basic

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-04-12 18:57:41
*/

SET FOREIGN_KEY_CHECKS=0;

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
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/menu/index');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/menu/update');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/admin/menu/view');
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
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/backstage/*');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/backstage/site/*');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/backstage/site/about');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/backstage/site/captcha');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/backstage/site/contact');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/backstage/site/error');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/backstage/site/index');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/backstage/site/login');
INSERT INTO `y9_auth_item_child` VALUES ('超级管理员', '/backstage/site/logout');
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of y9_user
-- ----------------------------
INSERT INTO `y9_user` VALUES ('1', 'admin', '-PqA3gz7yvL098U6Udq13uRBvQCXHRyU', '$2y$13$EXFy9Z59lP/eLn1vd.Qae.sQxaAkqMlQALOZ9EIPDiERZsrwGu.qi', null, '709334814@qq.com', '10', '1554863543', '1554863543');
