/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50534
Source Host           : localhost:8889
Source Database       : daikuan

Target Server Type    : MYSQL
Target Server Version : 50534
File Encoding         : 65001

Date: 2017-10-13 16:48:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `dk_ad`
-- ----------------------------
DROP TABLE IF EXISTS `dk_ad`;
CREATE TABLE `dk_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dk_ad
-- ----------------------------

-- ----------------------------
-- Table structure for `dk_asset`
-- ----------------------------
DROP TABLE IF EXISTS `dk_asset`;
CREATE TABLE `dk_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of dk_asset
-- ----------------------------

-- ----------------------------
-- Table structure for `dk_auth_access`
-- ----------------------------
DROP TABLE IF EXISTS `dk_auth_access`;
CREATE TABLE `dk_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of dk_auth_access
-- ----------------------------

-- ----------------------------
-- Table structure for `dk_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `dk_auth_rule`;
CREATE TABLE `dk_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=185 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of dk_auth_rule
-- ----------------------------
INSERT INTO `dk_auth_rule` VALUES ('1', 'Admin', 'admin_url', 'admin/content/default', null, '内容管理', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('2', 'Api', 'admin_url', 'api/guestbookadmin/index', null, '所有留言', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('3', 'Api', 'admin_url', 'api/guestbookadmin/delete', null, '删除网站留言', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('4', 'Comment', 'admin_url', 'comment/commentadmin/index', null, '评论管理', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('5', 'Comment', 'admin_url', 'comment/commentadmin/delete', null, '删除评论', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('6', 'Comment', 'admin_url', 'comment/commentadmin/check', null, '评论审核', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('7', 'Portal', 'admin_url', 'portal/adminpost/index', null, '文章管理', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('8', 'Portal', 'admin_url', 'portal/adminpost/listorders', null, '文章排序', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('9', 'Portal', 'admin_url', 'portal/adminpost/top', null, '文章置顶', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('10', 'Portal', 'admin_url', 'portal/adminpost/recommend', null, '文章推荐', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('11', 'Portal', 'admin_url', 'portal/adminpost/move', null, '批量移动', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('12', 'Portal', 'admin_url', 'portal/adminpost/check', null, '文章审核', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('13', 'Portal', 'admin_url', 'portal/adminpost/delete', null, '删除文章', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('14', 'Portal', 'admin_url', 'portal/adminpost/edit', null, '编辑文章', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('15', 'Portal', 'admin_url', 'portal/adminpost/edit_post', null, '提交编辑', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('16', 'Portal', 'admin_url', 'portal/adminpost/add', null, '添加文章', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('17', 'Portal', 'admin_url', 'portal/adminpost/add_post', null, '提交添加', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('18', 'Portal', 'admin_url', 'portal/adminterm/index', null, '分类管理', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('19', 'Portal', 'admin_url', 'portal/adminterm/listorders', null, '文章分类排序', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('20', 'Portal', 'admin_url', 'portal/adminterm/delete', null, '删除分类', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('21', 'Portal', 'admin_url', 'portal/adminterm/edit', null, '编辑分类', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('22', 'Portal', 'admin_url', 'portal/adminterm/edit_post', null, '提交编辑', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('23', 'Portal', 'admin_url', 'portal/adminterm/add', null, '添加分类', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('24', 'Portal', 'admin_url', 'portal/adminterm/add_post', null, '提交添加', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('25', 'Portal', 'admin_url', 'portal/adminpage/index', null, '页面管理', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('26', 'Portal', 'admin_url', 'portal/adminpage/listorders', null, '页面排序', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('27', 'Portal', 'admin_url', 'portal/adminpage/delete', null, '删除页面', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('28', 'Portal', 'admin_url', 'portal/adminpage/edit', null, '编辑页面', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('29', 'Portal', 'admin_url', 'portal/adminpage/edit_post', null, '提交编辑', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('30', 'Portal', 'admin_url', 'portal/adminpage/add', null, '添加页面', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('31', 'Portal', 'admin_url', 'portal/adminpage/add_post', null, '提交添加', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('32', 'Admin', 'admin_url', 'admin/recycle/default', null, '回收站', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('33', 'Portal', 'admin_url', 'portal/adminpost/recyclebin', null, '文章回收', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('34', 'Portal', 'admin_url', 'portal/adminpost/restore', null, '文章还原', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('35', 'Portal', 'admin_url', 'portal/adminpost/clean', null, '彻底删除', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('36', 'Portal', 'admin_url', 'portal/adminpage/recyclebin', null, '页面回收', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('37', 'Portal', 'admin_url', 'portal/adminpage/clean', null, '彻底删除', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('38', 'Portal', 'admin_url', 'portal/adminpage/restore', null, '页面还原', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('39', 'Admin', 'admin_url', 'admin/extension/default', null, '扩展工具', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('40', 'Admin', 'admin_url', 'admin/backup/default', null, '备份管理', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('41', 'Admin', 'admin_url', 'admin/backup/restore', null, '数据还原', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('42', 'Admin', 'admin_url', 'admin/backup/index', null, '数据备份', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('43', 'Admin', 'admin_url', 'admin/backup/index_post', null, '提交数据备份', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('44', 'Admin', 'admin_url', 'admin/backup/download', null, '下载备份', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('45', 'Admin', 'admin_url', 'admin/backup/del_backup', null, '删除备份', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('46', 'Admin', 'admin_url', 'admin/backup/import', null, '数据备份导入', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('47', 'Admin', 'admin_url', 'admin/plugin/index', null, '插件管理', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('48', 'Admin', 'admin_url', 'admin/plugin/toggle', null, '插件启用切换', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('49', 'Admin', 'admin_url', 'admin/plugin/setting', null, '插件设置', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('50', 'Admin', 'admin_url', 'admin/plugin/setting_post', null, '插件设置提交', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('51', 'Admin', 'admin_url', 'admin/plugin/install', null, '插件安装', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('52', 'Admin', 'admin_url', 'admin/plugin/uninstall', null, '插件卸载', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('53', 'Admin', 'admin_url', 'admin/slide/default', null, '幻灯片', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('54', 'Admin', 'admin_url', 'admin/slide/index', null, '幻灯片管理', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('55', 'Admin', 'admin_url', 'admin/slide/listorders', null, '幻灯片排序', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('56', 'Admin', 'admin_url', 'admin/slide/toggle', null, '幻灯片显示切换', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('57', 'Admin', 'admin_url', 'admin/slide/delete', null, '删除幻灯片', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('58', 'Admin', 'admin_url', 'admin/slide/edit', null, '编辑幻灯片', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('59', 'Admin', 'admin_url', 'admin/slide/edit_post', null, '提交编辑', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('60', 'Admin', 'admin_url', 'admin/slide/add', null, '添加幻灯片', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('61', 'Admin', 'admin_url', 'admin/slide/add_post', null, '提交添加', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('62', 'Admin', 'admin_url', 'admin/slidecat/index', null, '幻灯片分类', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('63', 'Admin', 'admin_url', 'admin/slidecat/delete', null, '删除分类', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('64', 'Admin', 'admin_url', 'admin/slidecat/edit', null, '编辑分类', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('65', 'Admin', 'admin_url', 'admin/slidecat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('66', 'Admin', 'admin_url', 'admin/slidecat/add', null, '添加分类', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('67', 'Admin', 'admin_url', 'admin/slidecat/add_post', null, '提交添加', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('68', 'Admin', 'admin_url', 'admin/ad/index', null, '网站广告', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('69', 'Admin', 'admin_url', 'admin/ad/toggle', null, '广告显示切换', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('70', 'Admin', 'admin_url', 'admin/ad/delete', null, '删除广告', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('71', 'Admin', 'admin_url', 'admin/ad/edit', null, '编辑广告', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('72', 'Admin', 'admin_url', 'admin/ad/edit_post', null, '提交编辑', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('73', 'Admin', 'admin_url', 'admin/ad/add', null, '添加广告', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('74', 'Admin', 'admin_url', 'admin/ad/add_post', null, '提交添加', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('75', 'Admin', 'admin_url', 'admin/link/index', null, '友情链接', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('76', 'Admin', 'admin_url', 'admin/link/listorders', null, '友情链接排序', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('77', 'Admin', 'admin_url', 'admin/link/toggle', null, '友链显示切换', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('78', 'Admin', 'admin_url', 'admin/link/delete', null, '删除友情链接', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('79', 'Admin', 'admin_url', 'admin/link/edit', null, '编辑友情链接', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('80', 'Admin', 'admin_url', 'admin/link/edit_post', null, '提交编辑', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('81', 'Admin', 'admin_url', 'admin/link/add', null, '添加友情链接', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('82', 'Admin', 'admin_url', 'admin/link/add_post', null, '提交添加', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('83', 'Api', 'admin_url', 'api/oauthadmin/setting', null, '第三方登陆', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('84', 'Api', 'admin_url', 'api/oauthadmin/setting_post', null, '提交设置', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('85', 'Admin', 'admin_url', 'admin/menu/default', null, '菜单管理', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('86', 'Admin', 'admin_url', 'admin/navcat/default1', null, '前台菜单', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('87', 'Admin', 'admin_url', 'admin/nav/index', null, '菜单管理', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('88', 'Admin', 'admin_url', 'admin/nav/listorders', null, '前台导航排序', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('89', 'Admin', 'admin_url', 'admin/nav/delete', null, '删除菜单', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('90', 'Admin', 'admin_url', 'admin/nav/edit', null, '编辑菜单', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('91', 'Admin', 'admin_url', 'admin/nav/edit_post', null, '提交编辑', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('92', 'Admin', 'admin_url', 'admin/nav/add', null, '添加菜单', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('93', 'Admin', 'admin_url', 'admin/nav/add_post', null, '提交添加', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('94', 'Admin', 'admin_url', 'admin/navcat/index', null, '菜单分类', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('95', 'Admin', 'admin_url', 'admin/navcat/delete', null, '删除分类', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('96', 'Admin', 'admin_url', 'admin/navcat/edit', null, '编辑分类', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('97', 'Admin', 'admin_url', 'admin/navcat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('98', 'Admin', 'admin_url', 'admin/navcat/add', null, '添加分类', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('99', 'Admin', 'admin_url', 'admin/navcat/add_post', null, '提交添加', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('100', 'Admin', 'admin_url', 'admin/menu/index', null, '后台菜单', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('101', 'Admin', 'admin_url', 'admin/menu/add', null, '添加菜单', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('102', 'Admin', 'admin_url', 'admin/menu/add_post', null, '提交添加', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('103', 'Admin', 'admin_url', 'admin/menu/listorders', null, '后台菜单排序', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('104', 'Admin', 'admin_url', 'admin/menu/export_menu', null, '菜单备份', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('105', 'Admin', 'admin_url', 'admin/menu/edit', null, '编辑菜单', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('106', 'Admin', 'admin_url', 'admin/menu/edit_post', null, '提交编辑', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('107', 'Admin', 'admin_url', 'admin/menu/delete', null, '删除菜单', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('108', 'Admin', 'admin_url', 'admin/menu/lists', null, '所有菜单', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('109', 'Admin', 'admin_url', 'admin/setting/default', null, '设置', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('110', 'Admin', 'admin_url', 'admin/setting/userdefault', null, '个人信息', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('111', 'Admin', 'admin_url', 'admin/user/userinfo', null, '修改信息', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('112', 'Admin', 'admin_url', 'admin/user/userinfo_post', null, '修改信息提交', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('113', 'Admin', 'admin_url', 'admin/setting/password', null, '修改密码', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('114', 'Admin', 'admin_url', 'admin/setting/password_post', null, '提交修改', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('115', 'Admin', 'admin_url', 'admin/setting/site', null, '网站信息', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('116', 'Admin', 'admin_url', 'admin/setting/site_post', null, '提交修改', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('117', 'Admin', 'admin_url', 'admin/route/index', null, '路由列表', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('118', 'Admin', 'admin_url', 'admin/route/add', null, '路由添加', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('119', 'Admin', 'admin_url', 'admin/route/add_post', null, '路由添加提交', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('120', 'Admin', 'admin_url', 'admin/route/edit', null, '路由编辑', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('121', 'Admin', 'admin_url', 'admin/route/edit_post', null, '路由编辑提交', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('122', 'Admin', 'admin_url', 'admin/route/delete', null, '路由删除', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('123', 'Admin', 'admin_url', 'admin/route/ban', null, '路由禁止', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('124', 'Admin', 'admin_url', 'admin/route/open', null, '路由启用', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('125', 'Admin', 'admin_url', 'admin/route/listorders', null, '路由排序', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('126', 'Admin', 'admin_url', 'admin/mailer/default', null, '邮箱配置', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('127', 'Admin', 'admin_url', 'admin/mailer/index', null, 'SMTP配置', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('128', 'Admin', 'admin_url', 'admin/mailer/index_post', null, '提交配置', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('129', 'Admin', 'admin_url', 'admin/mailer/active', null, '注册邮件模板', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('130', 'Admin', 'admin_url', 'admin/mailer/active_post', null, '提交模板', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('131', 'Admin', 'admin_url', 'admin/setting/clearcache', null, '清除缓存', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('132', 'User', 'admin_url', 'user/indexadmin/default', null, '用户管理', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('133', 'User', 'admin_url', 'user/indexadmin/default1', null, '用户组', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('134', 'User', 'admin_url', 'user/indexadmin/index', null, '本站用户', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('135', 'User', 'admin_url', 'user/indexadmin/ban', null, '拉黑会员', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('136', 'User', 'admin_url', 'user/indexadmin/cancelban', null, '启用会员', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('137', 'User', 'admin_url', 'user/oauthadmin/index', null, '第三方用户', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('138', 'User', 'admin_url', 'user/oauthadmin/delete', null, '第三方用户解绑', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('139', 'User', 'admin_url', 'user/indexadmin/default3', null, '管理组', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('140', 'Admin', 'admin_url', 'admin/rbac/index', null, '角色管理', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('141', 'Admin', 'admin_url', 'admin/rbac/member', null, '成员管理', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('142', 'Admin', 'admin_url', 'admin/rbac/authorize', null, '权限设置', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('143', 'Admin', 'admin_url', 'admin/rbac/authorize_post', null, '提交设置', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('144', 'Admin', 'admin_url', 'admin/rbac/roleedit', null, '编辑角色', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('145', 'Admin', 'admin_url', 'admin/rbac/roleedit_post', null, '提交编辑', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('146', 'Admin', 'admin_url', 'admin/rbac/roledelete', null, '删除角色', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('147', 'Admin', 'admin_url', 'admin/rbac/roleadd', null, '添加角色', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('148', 'Admin', 'admin_url', 'admin/rbac/roleadd_post', null, '提交添加', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('149', 'Admin', 'admin_url', 'admin/user/index', null, '管理员', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('150', 'Admin', 'admin_url', 'admin/user/delete', null, '删除管理员', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('151', 'Admin', 'admin_url', 'admin/user/edit', null, '管理员编辑', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('152', 'Admin', 'admin_url', 'admin/user/edit_post', null, '编辑提交', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('153', 'Admin', 'admin_url', 'admin/user/add', null, '管理员添加', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('154', 'Admin', 'admin_url', 'admin/user/add_post', null, '添加提交', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('155', 'Admin', 'admin_url', 'admin/plugin/update', null, '插件更新', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('156', 'Admin', 'admin_url', 'admin/storage/index', null, '文件存储', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('157', 'Admin', 'admin_url', 'admin/storage/setting_post', null, '文件存储设置提交', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('158', 'Admin', 'admin_url', 'admin/slide/ban', null, '禁用幻灯片', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('159', 'Admin', 'admin_url', 'admin/slide/cancelban', null, '启用幻灯片', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('160', 'Admin', 'admin_url', 'admin/user/ban', null, '禁用管理员', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('161', 'Admin', 'admin_url', 'admin/user/cancelban', null, '启用管理员', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('162', 'Demo', 'admin_url', 'demo/adminindex/index', null, '', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('163', 'Demo', 'admin_url', 'demo/adminindex/last', null, '', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('166', 'Admin', 'admin_url', 'admin/mailer/test', null, '测试邮件', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('167', 'Admin', 'admin_url', 'admin/setting/upload', null, '上传设置', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('168', 'Admin', 'admin_url', 'admin/setting/upload_post', null, '上传设置提交', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('169', 'Portal', 'admin_url', 'portal/adminpost/copy', null, '文章批量复制', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('170', 'Admin', 'admin_url', 'admin/menu/backup_menu', null, '备份菜单', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('171', 'Admin', 'admin_url', 'admin/menu/export_menu_lang', null, '导出后台菜单多语言包', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('172', 'Admin', 'admin_url', 'admin/menu/restore_menu', null, '还原菜单', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('173', 'Admin', 'admin_url', 'admin/menu/getactions', null, '导入新菜单', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('174', 'Qianshan', 'admin_url', 'qianshan/defult/index', null, '产品管理', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('175', 'Qianshan', 'admin_url', 'qianshan/product/index', null, '产品管理', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('176', 'Qianshan', 'admin_url', 'qianshan/product/canshu', null, '用户参数', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('177', 'Qianshan', 'admin_url', 'qianshan/product/attribute', null, '产品属性', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('178', 'Qianshan', 'admin_url', 'qianshan/product/user', null, '用户管理', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('179', 'Qianshan', 'admin_url', 'qianshan/product/conditionmanage', null, '筛选条件', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('180', 'Qianshan', 'admin_url', 'qianshan/user/managelist', null, '信贷经理', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('181', 'Qianshan', 'admin_url', 'qianshan/user/userlist', null, '普通用户', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('182', 'Daikuan', 'admin_url', 'daikuan/admin/index', null, '通用贷款', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('183', 'Daikuan', 'admin_url', 'daikuan/admin/product', null, '产品管理', '1', '');
INSERT INTO `dk_auth_rule` VALUES ('184', 'Daikuan', 'admin_url', 'daikuan/admin/user', null, '用户管理', '1', '');

-- ----------------------------
-- Table structure for `dk_comments`
-- ----------------------------
DROP TABLE IF EXISTS `dk_comments`;
CREATE TABLE `dk_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of dk_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `dk_common_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `dk_common_action_log`;
CREATE TABLE `dk_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录表';

-- ----------------------------
-- Records of dk_common_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for `dk_guestbook`
-- ----------------------------
DROP TABLE IF EXISTS `dk_guestbook`;
CREATE TABLE `dk_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of dk_guestbook
-- ----------------------------

-- ----------------------------
-- Table structure for `dk_js_district`
-- ----------------------------
DROP TABLE IF EXISTS `dk_js_district`;
CREATE TABLE `dk_js_district` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `level` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `upid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `usetype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `displayorder` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `upid` (`upid`,`displayorder`)
) ENGINE=MyISAM AUTO_INCREMENT=45052 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dk_js_district
-- ----------------------------
INSERT INTO `dk_js_district` VALUES ('1', '北京市', '2', '566', '3', '0');
INSERT INTO `dk_js_district` VALUES ('2', '天津市', '2', '566', '3', '0');
INSERT INTO `dk_js_district` VALUES ('3', '河北省', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('4', '山西省', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('5', '内蒙古自治区', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('6', '辽宁省', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('7', '吉林省', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('8', '黑龙江省', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('9', '上海市', '2', '566', '3', '0');
INSERT INTO `dk_js_district` VALUES ('10', '江苏省', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('11', '浙江省', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('12', '安徽省', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('13', '福建省', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('14', '江西省', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('15', '山东省', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('16', '河南省', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('17', '湖北省', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('18', '湖南省', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('19', '广东省', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('20', '广西壮族自治区', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('21', '海南省', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('22', '重庆市', '2', '566', '3', '0');
INSERT INTO `dk_js_district` VALUES ('23', '四川省', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('24', '贵州省', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('25', '云南省', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('26', '西藏自治区', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('27', '陕西省', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('28', '甘肃省', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('29', '青海省', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('30', '宁夏回族自治区', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('31', '新疆维吾尔自治区', '1', '0', '3', '0');
INSERT INTO `dk_js_district` VALUES ('73', '石家庄市', '2', '3', '0', '0');
INSERT INTO `dk_js_district` VALUES ('74', '唐山市', '2', '3', '0', '0');
INSERT INTO `dk_js_district` VALUES ('75', '秦皇岛市', '2', '3', '0', '0');
INSERT INTO `dk_js_district` VALUES ('76', '邯郸市', '2', '3', '0', '0');
INSERT INTO `dk_js_district` VALUES ('77', '邢台市', '2', '3', '0', '0');
INSERT INTO `dk_js_district` VALUES ('78', '保定市', '2', '3', '0', '0');
INSERT INTO `dk_js_district` VALUES ('79', '张家口市', '2', '3', '0', '0');
INSERT INTO `dk_js_district` VALUES ('80', '承德市', '2', '3', '0', '0');
INSERT INTO `dk_js_district` VALUES ('81', '衡水市', '2', '3', '0', '0');
INSERT INTO `dk_js_district` VALUES ('82', '廊坊市', '2', '3', '0', '0');
INSERT INTO `dk_js_district` VALUES ('83', '沧州市', '2', '3', '0', '0');
INSERT INTO `dk_js_district` VALUES ('84', '太原市', '2', '4', '0', '0');
INSERT INTO `dk_js_district` VALUES ('85', '大同市', '2', '4', '0', '0');
INSERT INTO `dk_js_district` VALUES ('86', '阳泉市', '2', '4', '0', '0');
INSERT INTO `dk_js_district` VALUES ('87', '长治市', '2', '4', '0', '0');
INSERT INTO `dk_js_district` VALUES ('88', '晋城市', '2', '4', '0', '0');
INSERT INTO `dk_js_district` VALUES ('89', '朔州市', '2', '4', '0', '0');
INSERT INTO `dk_js_district` VALUES ('90', '晋中市', '2', '4', '0', '0');
INSERT INTO `dk_js_district` VALUES ('91', '运城市', '2', '4', '0', '0');
INSERT INTO `dk_js_district` VALUES ('92', '忻州市', '2', '4', '0', '0');
INSERT INTO `dk_js_district` VALUES ('93', '临汾市', '2', '4', '0', '0');
INSERT INTO `dk_js_district` VALUES ('94', '吕梁市', '2', '4', '0', '0');
INSERT INTO `dk_js_district` VALUES ('95', '呼和浩特市', '2', '5', '0', '0');
INSERT INTO `dk_js_district` VALUES ('96', '包头市', '2', '5', '0', '0');
INSERT INTO `dk_js_district` VALUES ('97', '乌海市', '2', '5', '0', '0');
INSERT INTO `dk_js_district` VALUES ('98', '赤峰市', '2', '5', '0', '0');
INSERT INTO `dk_js_district` VALUES ('99', '通辽市', '2', '5', '0', '0');
INSERT INTO `dk_js_district` VALUES ('100', '鄂尔多斯市', '2', '5', '0', '0');
INSERT INTO `dk_js_district` VALUES ('101', '呼伦贝尔市', '2', '5', '0', '0');
INSERT INTO `dk_js_district` VALUES ('102', '巴彦淖尔市', '2', '5', '0', '0');
INSERT INTO `dk_js_district` VALUES ('103', '乌兰察布市', '2', '5', '0', '0');
INSERT INTO `dk_js_district` VALUES ('104', '兴安盟', '2', '5', '0', '0');
INSERT INTO `dk_js_district` VALUES ('105', '锡林郭勒盟', '2', '5', '0', '0');
INSERT INTO `dk_js_district` VALUES ('106', '阿拉善盟', '2', '5', '0', '0');
INSERT INTO `dk_js_district` VALUES ('107', '沈阳市', '2', '6', '0', '0');
INSERT INTO `dk_js_district` VALUES ('108', '大连市', '2', '6', '0', '0');
INSERT INTO `dk_js_district` VALUES ('109', '鞍山市', '2', '6', '0', '0');
INSERT INTO `dk_js_district` VALUES ('110', '抚顺市', '2', '6', '0', '0');
INSERT INTO `dk_js_district` VALUES ('111', '本溪市', '2', '6', '0', '0');
INSERT INTO `dk_js_district` VALUES ('112', '丹东市', '2', '6', '0', '0');
INSERT INTO `dk_js_district` VALUES ('113', '锦州市', '2', '6', '0', '0');
INSERT INTO `dk_js_district` VALUES ('114', '营口市', '2', '6', '0', '0');
INSERT INTO `dk_js_district` VALUES ('115', '阜新市', '2', '6', '0', '0');
INSERT INTO `dk_js_district` VALUES ('116', '辽阳市', '2', '6', '0', '0');
INSERT INTO `dk_js_district` VALUES ('117', '盘锦市', '2', '6', '0', '0');
INSERT INTO `dk_js_district` VALUES ('118', '铁岭市', '2', '6', '0', '0');
INSERT INTO `dk_js_district` VALUES ('119', '朝阳市', '2', '6', '0', '0');
INSERT INTO `dk_js_district` VALUES ('120', '葫芦岛市', '2', '6', '0', '0');
INSERT INTO `dk_js_district` VALUES ('121', '长春市', '2', '7', '0', '0');
INSERT INTO `dk_js_district` VALUES ('122', '吉林市', '2', '7', '0', '0');
INSERT INTO `dk_js_district` VALUES ('123', '四平市', '2', '7', '0', '0');
INSERT INTO `dk_js_district` VALUES ('124', '辽源市', '2', '7', '0', '0');
INSERT INTO `dk_js_district` VALUES ('125', '通化市', '2', '7', '0', '0');
INSERT INTO `dk_js_district` VALUES ('126', '白山市', '2', '7', '0', '0');
INSERT INTO `dk_js_district` VALUES ('127', '松原市', '2', '7', '0', '0');
INSERT INTO `dk_js_district` VALUES ('128', '白城市', '2', '7', '0', '0');
INSERT INTO `dk_js_district` VALUES ('129', '延边朝鲜族自治州', '2', '7', '0', '0');
INSERT INTO `dk_js_district` VALUES ('130', '哈尔滨市', '2', '8', '0', '0');
INSERT INTO `dk_js_district` VALUES ('131', '齐齐哈尔市', '2', '8', '0', '0');
INSERT INTO `dk_js_district` VALUES ('132', '鸡西市', '2', '8', '0', '0');
INSERT INTO `dk_js_district` VALUES ('133', '鹤岗市', '2', '8', '0', '0');
INSERT INTO `dk_js_district` VALUES ('134', '双鸭山市', '2', '8', '0', '0');
INSERT INTO `dk_js_district` VALUES ('135', '大庆市', '2', '8', '0', '0');
INSERT INTO `dk_js_district` VALUES ('136', '伊春市', '2', '8', '0', '0');
INSERT INTO `dk_js_district` VALUES ('137', '佳木斯市', '2', '8', '0', '0');
INSERT INTO `dk_js_district` VALUES ('138', '七台河市', '2', '8', '0', '0');
INSERT INTO `dk_js_district` VALUES ('139', '牡丹江市', '2', '8', '0', '0');
INSERT INTO `dk_js_district` VALUES ('140', '黑河市', '2', '8', '0', '0');
INSERT INTO `dk_js_district` VALUES ('141', '绥化市', '2', '8', '0', '0');
INSERT INTO `dk_js_district` VALUES ('142', '大兴安岭地区', '2', '8', '0', '0');
INSERT INTO `dk_js_district` VALUES ('162', '南京市', '2', '10', '0', '0');
INSERT INTO `dk_js_district` VALUES ('163', '无锡市', '2', '10', '0', '0');
INSERT INTO `dk_js_district` VALUES ('164', '徐州市', '2', '10', '0', '0');
INSERT INTO `dk_js_district` VALUES ('165', '常州市', '2', '10', '0', '0');
INSERT INTO `dk_js_district` VALUES ('166', '苏州市', '2', '10', '0', '0');
INSERT INTO `dk_js_district` VALUES ('167', '南通市', '2', '10', '0', '0');
INSERT INTO `dk_js_district` VALUES ('168', '连云港市', '2', '10', '0', '0');
INSERT INTO `dk_js_district` VALUES ('169', '淮安市', '2', '10', '0', '0');
INSERT INTO `dk_js_district` VALUES ('170', '盐城市', '2', '10', '0', '0');
INSERT INTO `dk_js_district` VALUES ('171', '扬州市', '2', '10', '0', '0');
INSERT INTO `dk_js_district` VALUES ('172', '镇江市', '2', '10', '0', '0');
INSERT INTO `dk_js_district` VALUES ('173', '泰州市', '2', '10', '0', '0');
INSERT INTO `dk_js_district` VALUES ('174', '宿迁市', '2', '10', '0', '0');
INSERT INTO `dk_js_district` VALUES ('175', '杭州市', '2', '11', '0', '0');
INSERT INTO `dk_js_district` VALUES ('176', '宁波市', '2', '11', '0', '0');
INSERT INTO `dk_js_district` VALUES ('177', '温州市', '2', '11', '0', '0');
INSERT INTO `dk_js_district` VALUES ('178', '嘉兴市', '2', '11', '0', '0');
INSERT INTO `dk_js_district` VALUES ('179', '湖州市', '2', '11', '0', '0');
INSERT INTO `dk_js_district` VALUES ('180', '绍兴市', '2', '11', '0', '0');
INSERT INTO `dk_js_district` VALUES ('181', '舟山市', '2', '11', '0', '0');
INSERT INTO `dk_js_district` VALUES ('182', '衢州市', '2', '11', '0', '0');
INSERT INTO `dk_js_district` VALUES ('183', '金华市', '2', '11', '0', '0');
INSERT INTO `dk_js_district` VALUES ('184', '台州市', '2', '11', '0', '0');
INSERT INTO `dk_js_district` VALUES ('185', '丽水市', '2', '11', '0', '0');
INSERT INTO `dk_js_district` VALUES ('186', '合肥市', '2', '12', '0', '0');
INSERT INTO `dk_js_district` VALUES ('187', '芜湖市', '2', '12', '0', '0');
INSERT INTO `dk_js_district` VALUES ('188', '蚌埠市', '2', '12', '0', '0');
INSERT INTO `dk_js_district` VALUES ('189', '淮南市', '2', '12', '0', '0');
INSERT INTO `dk_js_district` VALUES ('190', '马鞍山市', '2', '12', '0', '0');
INSERT INTO `dk_js_district` VALUES ('191', '淮北市', '2', '12', '0', '0');
INSERT INTO `dk_js_district` VALUES ('192', '铜陵市', '2', '12', '0', '0');
INSERT INTO `dk_js_district` VALUES ('193', '安庆市', '2', '12', '0', '0');
INSERT INTO `dk_js_district` VALUES ('194', '黄山市', '2', '12', '0', '0');
INSERT INTO `dk_js_district` VALUES ('195', '滁州市', '2', '12', '0', '0');
INSERT INTO `dk_js_district` VALUES ('196', '阜阳市', '2', '12', '0', '0');
INSERT INTO `dk_js_district` VALUES ('197', '宿州市', '2', '12', '0', '0');
INSERT INTO `dk_js_district` VALUES ('198', '巢湖市', '2', '12', '0', '0');
INSERT INTO `dk_js_district` VALUES ('199', '六安市', '2', '12', '0', '0');
INSERT INTO `dk_js_district` VALUES ('200', '亳州市', '2', '12', '0', '0');
INSERT INTO `dk_js_district` VALUES ('201', '池州市', '2', '12', '0', '0');
INSERT INTO `dk_js_district` VALUES ('202', '宣城市', '2', '12', '0', '0');
INSERT INTO `dk_js_district` VALUES ('203', '福州市', '2', '13', '0', '0');
INSERT INTO `dk_js_district` VALUES ('204', '厦门市', '2', '13', '0', '0');
INSERT INTO `dk_js_district` VALUES ('205', '莆田市', '2', '13', '0', '0');
INSERT INTO `dk_js_district` VALUES ('206', '三明市', '2', '13', '0', '0');
INSERT INTO `dk_js_district` VALUES ('207', '泉州市', '2', '13', '0', '0');
INSERT INTO `dk_js_district` VALUES ('208', '漳州市', '2', '13', '0', '0');
INSERT INTO `dk_js_district` VALUES ('209', '南平市', '2', '13', '0', '0');
INSERT INTO `dk_js_district` VALUES ('210', '龙岩市', '2', '13', '0', '0');
INSERT INTO `dk_js_district` VALUES ('211', '宁德市', '2', '13', '0', '0');
INSERT INTO `dk_js_district` VALUES ('212', '南昌市', '2', '14', '0', '0');
INSERT INTO `dk_js_district` VALUES ('213', '景德镇市', '2', '14', '0', '0');
INSERT INTO `dk_js_district` VALUES ('214', '萍乡市', '2', '14', '0', '0');
INSERT INTO `dk_js_district` VALUES ('215', '九江市', '2', '14', '0', '0');
INSERT INTO `dk_js_district` VALUES ('216', '新余市', '2', '14', '0', '0');
INSERT INTO `dk_js_district` VALUES ('217', '鹰潭市', '2', '14', '0', '0');
INSERT INTO `dk_js_district` VALUES ('218', '赣州市', '2', '14', '0', '0');
INSERT INTO `dk_js_district` VALUES ('219', '吉安市', '2', '14', '0', '0');
INSERT INTO `dk_js_district` VALUES ('220', '宜春市', '2', '14', '0', '0');
INSERT INTO `dk_js_district` VALUES ('221', '抚州市', '2', '14', '0', '0');
INSERT INTO `dk_js_district` VALUES ('222', '上饶市', '2', '14', '0', '0');
INSERT INTO `dk_js_district` VALUES ('223', '济南市', '2', '15', '0', '0');
INSERT INTO `dk_js_district` VALUES ('224', '青岛市', '2', '15', '0', '0');
INSERT INTO `dk_js_district` VALUES ('225', '淄博市', '2', '15', '0', '0');
INSERT INTO `dk_js_district` VALUES ('226', '枣庄市', '2', '15', '0', '0');
INSERT INTO `dk_js_district` VALUES ('227', '东营市', '2', '15', '0', '0');
INSERT INTO `dk_js_district` VALUES ('228', '烟台市', '2', '15', '0', '0');
INSERT INTO `dk_js_district` VALUES ('229', '潍坊市', '2', '15', '0', '0');
INSERT INTO `dk_js_district` VALUES ('230', '济宁市', '2', '15', '0', '0');
INSERT INTO `dk_js_district` VALUES ('231', '泰安市', '2', '15', '0', '0');
INSERT INTO `dk_js_district` VALUES ('232', '威海市', '2', '15', '0', '0');
INSERT INTO `dk_js_district` VALUES ('233', '日照市', '2', '15', '0', '0');
INSERT INTO `dk_js_district` VALUES ('234', '莱芜市', '2', '15', '0', '0');
INSERT INTO `dk_js_district` VALUES ('235', '临沂市', '2', '15', '0', '0');
INSERT INTO `dk_js_district` VALUES ('236', '德州市', '2', '15', '0', '0');
INSERT INTO `dk_js_district` VALUES ('237', '聊城市', '2', '15', '0', '0');
INSERT INTO `dk_js_district` VALUES ('238', '滨州市', '2', '15', '0', '0');
INSERT INTO `dk_js_district` VALUES ('239', '菏泽市', '2', '15', '0', '0');
INSERT INTO `dk_js_district` VALUES ('240', '郑州市', '2', '16', '0', '0');
INSERT INTO `dk_js_district` VALUES ('241', '开封市', '2', '16', '0', '0');
INSERT INTO `dk_js_district` VALUES ('242', '洛阳市', '2', '16', '0', '0');
INSERT INTO `dk_js_district` VALUES ('243', '平顶山市', '2', '16', '0', '0');
INSERT INTO `dk_js_district` VALUES ('244', '安阳市', '2', '16', '0', '0');
INSERT INTO `dk_js_district` VALUES ('245', '鹤壁市', '2', '16', '0', '0');
INSERT INTO `dk_js_district` VALUES ('246', '新乡市', '2', '16', '0', '0');
INSERT INTO `dk_js_district` VALUES ('247', '焦作市', '2', '16', '0', '0');
INSERT INTO `dk_js_district` VALUES ('248', '濮阳市', '2', '16', '0', '0');
INSERT INTO `dk_js_district` VALUES ('249', '许昌市', '2', '16', '0', '0');
INSERT INTO `dk_js_district` VALUES ('250', '漯河市', '2', '16', '0', '0');
INSERT INTO `dk_js_district` VALUES ('251', '三门峡市', '2', '16', '0', '0');
INSERT INTO `dk_js_district` VALUES ('252', '南阳市', '2', '16', '0', '0');
INSERT INTO `dk_js_district` VALUES ('253', '商丘市', '2', '16', '0', '0');
INSERT INTO `dk_js_district` VALUES ('254', '信阳市', '2', '16', '0', '0');
INSERT INTO `dk_js_district` VALUES ('255', '周口市', '2', '16', '0', '0');
INSERT INTO `dk_js_district` VALUES ('256', '驻马店市', '2', '16', '0', '0');
INSERT INTO `dk_js_district` VALUES ('257', '济源市', '2', '16', '0', '0');
INSERT INTO `dk_js_district` VALUES ('258', '武汉市', '2', '17', '0', '0');
INSERT INTO `dk_js_district` VALUES ('259', '黄石市', '2', '17', '0', '0');
INSERT INTO `dk_js_district` VALUES ('260', '十堰市', '2', '17', '0', '0');
INSERT INTO `dk_js_district` VALUES ('261', '宜昌市', '2', '17', '0', '0');
INSERT INTO `dk_js_district` VALUES ('262', '襄樊市', '2', '17', '0', '0');
INSERT INTO `dk_js_district` VALUES ('263', '鄂州市', '2', '17', '0', '0');
INSERT INTO `dk_js_district` VALUES ('264', '荆门市', '2', '17', '0', '0');
INSERT INTO `dk_js_district` VALUES ('265', '孝感市', '2', '17', '0', '0');
INSERT INTO `dk_js_district` VALUES ('266', '荆州市', '2', '17', '0', '0');
INSERT INTO `dk_js_district` VALUES ('267', '黄冈市', '2', '17', '0', '0');
INSERT INTO `dk_js_district` VALUES ('268', '咸宁市', '2', '17', '0', '0');
INSERT INTO `dk_js_district` VALUES ('269', '随州市', '2', '17', '0', '0');
INSERT INTO `dk_js_district` VALUES ('270', '恩施土家族苗族自治州', '2', '17', '0', '0');
INSERT INTO `dk_js_district` VALUES ('271', '仙桃市', '2', '17', '0', '0');
INSERT INTO `dk_js_district` VALUES ('272', '潜江市', '2', '17', '0', '0');
INSERT INTO `dk_js_district` VALUES ('273', '天门市', '2', '17', '0', '0');
INSERT INTO `dk_js_district` VALUES ('274', '神农架林区', '2', '17', '0', '0');
INSERT INTO `dk_js_district` VALUES ('275', '长沙市', '2', '18', '0', '0');
INSERT INTO `dk_js_district` VALUES ('276', '株洲市', '2', '18', '0', '0');
INSERT INTO `dk_js_district` VALUES ('277', '湘潭市', '2', '18', '0', '0');
INSERT INTO `dk_js_district` VALUES ('278', '衡阳市', '2', '18', '0', '0');
INSERT INTO `dk_js_district` VALUES ('279', '邵阳市', '2', '18', '0', '0');
INSERT INTO `dk_js_district` VALUES ('280', '岳阳市', '2', '18', '0', '0');
INSERT INTO `dk_js_district` VALUES ('281', '常德市', '2', '18', '0', '0');
INSERT INTO `dk_js_district` VALUES ('282', '张家界市', '2', '18', '0', '0');
INSERT INTO `dk_js_district` VALUES ('283', '益阳市', '2', '18', '0', '0');
INSERT INTO `dk_js_district` VALUES ('284', '郴州市', '2', '18', '0', '0');
INSERT INTO `dk_js_district` VALUES ('285', '永州市', '2', '18', '0', '0');
INSERT INTO `dk_js_district` VALUES ('286', '怀化市', '2', '18', '0', '0');
INSERT INTO `dk_js_district` VALUES ('287', '娄底市', '2', '18', '0', '0');
INSERT INTO `dk_js_district` VALUES ('288', '湘西土家族苗族自治州', '2', '18', '0', '0');
INSERT INTO `dk_js_district` VALUES ('289', '广州市', '2', '19', '0', '0');
INSERT INTO `dk_js_district` VALUES ('290', '韶关市', '2', '19', '0', '0');
INSERT INTO `dk_js_district` VALUES ('291', '深圳市', '2', '19', '0', '0');
INSERT INTO `dk_js_district` VALUES ('292', '珠海市', '2', '19', '0', '0');
INSERT INTO `dk_js_district` VALUES ('293', '汕头市', '2', '19', '0', '0');
INSERT INTO `dk_js_district` VALUES ('294', '佛山市', '2', '19', '0', '0');
INSERT INTO `dk_js_district` VALUES ('295', '江门市', '2', '19', '0', '0');
INSERT INTO `dk_js_district` VALUES ('296', '湛江市', '2', '19', '0', '0');
INSERT INTO `dk_js_district` VALUES ('297', '茂名市', '2', '19', '0', '0');
INSERT INTO `dk_js_district` VALUES ('298', '肇庆市', '2', '19', '0', '0');
INSERT INTO `dk_js_district` VALUES ('299', '惠州市', '2', '19', '0', '0');
INSERT INTO `dk_js_district` VALUES ('300', '梅州市', '2', '19', '0', '0');
INSERT INTO `dk_js_district` VALUES ('301', '汕尾市', '2', '19', '0', '0');
INSERT INTO `dk_js_district` VALUES ('302', '河源市', '2', '19', '0', '0');
INSERT INTO `dk_js_district` VALUES ('303', '阳江市', '2', '19', '0', '0');
INSERT INTO `dk_js_district` VALUES ('304', '清远市', '2', '19', '0', '0');
INSERT INTO `dk_js_district` VALUES ('305', '东莞市', '2', '19', '0', '0');
INSERT INTO `dk_js_district` VALUES ('306', '中山市', '2', '19', '0', '0');
INSERT INTO `dk_js_district` VALUES ('307', '潮州市', '2', '19', '0', '0');
INSERT INTO `dk_js_district` VALUES ('308', '揭阳市', '2', '19', '0', '0');
INSERT INTO `dk_js_district` VALUES ('309', '云浮市', '2', '19', '0', '0');
INSERT INTO `dk_js_district` VALUES ('310', '南宁市', '2', '20', '0', '0');
INSERT INTO `dk_js_district` VALUES ('311', '柳州市', '2', '20', '0', '0');
INSERT INTO `dk_js_district` VALUES ('312', '桂林市', '2', '20', '0', '0');
INSERT INTO `dk_js_district` VALUES ('313', '梧州市', '2', '20', '0', '0');
INSERT INTO `dk_js_district` VALUES ('314', '北海市', '2', '20', '0', '0');
INSERT INTO `dk_js_district` VALUES ('315', '防城港市', '2', '20', '0', '0');
INSERT INTO `dk_js_district` VALUES ('316', '钦州市', '2', '20', '0', '0');
INSERT INTO `dk_js_district` VALUES ('317', '贵港市', '2', '20', '0', '0');
INSERT INTO `dk_js_district` VALUES ('318', '玉林市', '2', '20', '0', '0');
INSERT INTO `dk_js_district` VALUES ('319', '百色市', '2', '20', '0', '0');
INSERT INTO `dk_js_district` VALUES ('320', '贺州市', '2', '20', '0', '0');
INSERT INTO `dk_js_district` VALUES ('321', '河池市', '2', '20', '0', '0');
INSERT INTO `dk_js_district` VALUES ('322', '来宾市', '2', '20', '0', '0');
INSERT INTO `dk_js_district` VALUES ('323', '崇左市', '2', '20', '0', '0');
INSERT INTO `dk_js_district` VALUES ('324', '海口市', '2', '21', '0', '0');
INSERT INTO `dk_js_district` VALUES ('325', '三亚市', '2', '21', '0', '0');
INSERT INTO `dk_js_district` VALUES ('326', '五指山市', '2', '21', '0', '0');
INSERT INTO `dk_js_district` VALUES ('327', '琼海市', '2', '21', '0', '0');
INSERT INTO `dk_js_district` VALUES ('328', '儋州市', '2', '21', '0', '0');
INSERT INTO `dk_js_district` VALUES ('329', '文昌市', '2', '21', '0', '0');
INSERT INTO `dk_js_district` VALUES ('330', '万宁市', '2', '21', '0', '0');
INSERT INTO `dk_js_district` VALUES ('331', '东方市', '2', '21', '0', '0');
INSERT INTO `dk_js_district` VALUES ('332', '定安县', '2', '21', '0', '0');
INSERT INTO `dk_js_district` VALUES ('333', '屯昌县', '2', '21', '0', '0');
INSERT INTO `dk_js_district` VALUES ('334', '澄迈县', '2', '21', '0', '0');
INSERT INTO `dk_js_district` VALUES ('335', '临高县', '2', '21', '0', '0');
INSERT INTO `dk_js_district` VALUES ('336', '白沙黎族自治县', '2', '21', '0', '0');
INSERT INTO `dk_js_district` VALUES ('337', '昌江黎族自治县', '2', '21', '0', '0');
INSERT INTO `dk_js_district` VALUES ('338', '乐东黎族自治县', '2', '21', '0', '0');
INSERT INTO `dk_js_district` VALUES ('339', '陵水黎族自治县', '2', '21', '0', '0');
INSERT INTO `dk_js_district` VALUES ('340', '保亭黎族苗族自治县', '2', '21', '0', '0');
INSERT INTO `dk_js_district` VALUES ('341', '琼中黎族苗族自治县', '2', '21', '0', '0');
INSERT INTO `dk_js_district` VALUES ('342', '西沙群岛', '2', '21', '0', '0');
INSERT INTO `dk_js_district` VALUES ('343', '南沙群岛', '2', '21', '0', '0');
INSERT INTO `dk_js_district` VALUES ('344', '中沙群岛的岛礁及其海域', '2', '21', '0', '0');
INSERT INTO `dk_js_district` VALUES ('385', '成都市', '2', '23', '0', '0');
INSERT INTO `dk_js_district` VALUES ('386', '自贡市', '2', '23', '0', '0');
INSERT INTO `dk_js_district` VALUES ('387', '攀枝花市', '2', '23', '0', '0');
INSERT INTO `dk_js_district` VALUES ('388', '泸州市', '2', '23', '0', '0');
INSERT INTO `dk_js_district` VALUES ('389', '德阳市', '2', '23', '0', '0');
INSERT INTO `dk_js_district` VALUES ('390', '绵阳市', '2', '23', '0', '0');
INSERT INTO `dk_js_district` VALUES ('391', '广元市', '2', '23', '0', '0');
INSERT INTO `dk_js_district` VALUES ('392', '遂宁市', '2', '23', '0', '0');
INSERT INTO `dk_js_district` VALUES ('393', '内江市', '2', '23', '0', '0');
INSERT INTO `dk_js_district` VALUES ('394', '乐山市', '2', '23', '0', '0');
INSERT INTO `dk_js_district` VALUES ('395', '南充市', '2', '23', '0', '0');
INSERT INTO `dk_js_district` VALUES ('396', '眉山市', '2', '23', '0', '0');
INSERT INTO `dk_js_district` VALUES ('397', '宜宾市', '2', '23', '0', '0');
INSERT INTO `dk_js_district` VALUES ('398', '广安市', '2', '23', '0', '0');
INSERT INTO `dk_js_district` VALUES ('399', '达州市', '2', '23', '0', '0');
INSERT INTO `dk_js_district` VALUES ('400', '雅安市', '2', '23', '0', '0');
INSERT INTO `dk_js_district` VALUES ('401', '巴中市', '2', '23', '0', '0');
INSERT INTO `dk_js_district` VALUES ('402', '资阳市', '2', '23', '0', '0');
INSERT INTO `dk_js_district` VALUES ('403', '阿坝藏族羌族自治州', '2', '23', '0', '0');
INSERT INTO `dk_js_district` VALUES ('404', '甘孜藏族自治州', '2', '23', '0', '0');
INSERT INTO `dk_js_district` VALUES ('405', '凉山彝族自治州', '2', '23', '0', '0');
INSERT INTO `dk_js_district` VALUES ('406', '贵阳市', '2', '24', '0', '0');
INSERT INTO `dk_js_district` VALUES ('407', '六盘水市', '2', '24', '0', '0');
INSERT INTO `dk_js_district` VALUES ('408', '遵义市', '2', '24', '0', '0');
INSERT INTO `dk_js_district` VALUES ('409', '安顺市', '2', '24', '0', '0');
INSERT INTO `dk_js_district` VALUES ('410', '铜仁地区', '2', '24', '0', '0');
INSERT INTO `dk_js_district` VALUES ('411', '黔西南布依族苗族自治州', '2', '24', '0', '0');
INSERT INTO `dk_js_district` VALUES ('412', '毕节地区', '2', '24', '0', '0');
INSERT INTO `dk_js_district` VALUES ('413', '黔东南苗族侗族自治州', '2', '24', '0', '0');
INSERT INTO `dk_js_district` VALUES ('414', '黔南布依族苗族自治州', '2', '24', '0', '0');
INSERT INTO `dk_js_district` VALUES ('415', '昆明市', '2', '25', '0', '0');
INSERT INTO `dk_js_district` VALUES ('416', '曲靖市', '2', '25', '0', '0');
INSERT INTO `dk_js_district` VALUES ('417', '玉溪市', '2', '25', '0', '0');
INSERT INTO `dk_js_district` VALUES ('418', '保山市', '2', '25', '0', '0');
INSERT INTO `dk_js_district` VALUES ('419', '昭通市', '2', '25', '0', '0');
INSERT INTO `dk_js_district` VALUES ('420', '丽江市', '2', '25', '0', '0');
INSERT INTO `dk_js_district` VALUES ('421', '思茅市', '2', '25', '0', '0');
INSERT INTO `dk_js_district` VALUES ('422', '临沧市', '2', '25', '0', '0');
INSERT INTO `dk_js_district` VALUES ('423', '楚雄彝族自治州', '2', '25', '0', '0');
INSERT INTO `dk_js_district` VALUES ('424', '红河哈尼族彝族自治州', '2', '25', '0', '0');
INSERT INTO `dk_js_district` VALUES ('425', '文山壮族苗族自治州', '2', '25', '0', '0');
INSERT INTO `dk_js_district` VALUES ('426', '西双版纳傣族自治州', '2', '25', '0', '0');
INSERT INTO `dk_js_district` VALUES ('427', '大理白族自治州', '2', '25', '0', '0');
INSERT INTO `dk_js_district` VALUES ('428', '德宏傣族景颇族自治州', '2', '25', '0', '0');
INSERT INTO `dk_js_district` VALUES ('429', '怒江傈僳族自治州', '2', '25', '0', '0');
INSERT INTO `dk_js_district` VALUES ('430', '迪庆藏族自治州', '2', '25', '0', '0');
INSERT INTO `dk_js_district` VALUES ('431', '拉萨市', '2', '26', '0', '0');
INSERT INTO `dk_js_district` VALUES ('432', '昌都地区', '2', '26', '0', '0');
INSERT INTO `dk_js_district` VALUES ('433', '山南地区', '2', '26', '0', '0');
INSERT INTO `dk_js_district` VALUES ('434', '日喀则地区', '2', '26', '0', '0');
INSERT INTO `dk_js_district` VALUES ('435', '那曲地区', '2', '26', '0', '0');
INSERT INTO `dk_js_district` VALUES ('436', '阿里地区', '2', '26', '0', '0');
INSERT INTO `dk_js_district` VALUES ('437', '林芝地区', '2', '26', '0', '0');
INSERT INTO `dk_js_district` VALUES ('438', '西安市', '2', '27', '0', '0');
INSERT INTO `dk_js_district` VALUES ('439', '铜川市', '2', '27', '0', '0');
INSERT INTO `dk_js_district` VALUES ('440', '宝鸡市', '2', '27', '0', '0');
INSERT INTO `dk_js_district` VALUES ('441', '咸阳市', '2', '27', '0', '0');
INSERT INTO `dk_js_district` VALUES ('442', '渭南市', '2', '27', '0', '0');
INSERT INTO `dk_js_district` VALUES ('443', '延安市', '2', '27', '0', '0');
INSERT INTO `dk_js_district` VALUES ('444', '汉中市', '2', '27', '0', '0');
INSERT INTO `dk_js_district` VALUES ('445', '榆林市', '2', '27', '0', '0');
INSERT INTO `dk_js_district` VALUES ('446', '安康市', '2', '27', '0', '0');
INSERT INTO `dk_js_district` VALUES ('447', '商洛市', '2', '27', '0', '0');
INSERT INTO `dk_js_district` VALUES ('448', '兰州市', '2', '28', '0', '0');
INSERT INTO `dk_js_district` VALUES ('449', '嘉峪关市', '2', '28', '0', '0');
INSERT INTO `dk_js_district` VALUES ('450', '金昌市', '2', '28', '0', '0');
INSERT INTO `dk_js_district` VALUES ('451', '白银市', '2', '28', '0', '0');
INSERT INTO `dk_js_district` VALUES ('452', '天水市', '2', '28', '0', '0');
INSERT INTO `dk_js_district` VALUES ('453', '武威市', '2', '28', '0', '0');
INSERT INTO `dk_js_district` VALUES ('454', '张掖市', '2', '28', '0', '0');
INSERT INTO `dk_js_district` VALUES ('455', '平凉市', '2', '28', '0', '0');
INSERT INTO `dk_js_district` VALUES ('456', '酒泉市', '2', '28', '0', '0');
INSERT INTO `dk_js_district` VALUES ('457', '庆阳市', '2', '28', '0', '0');
INSERT INTO `dk_js_district` VALUES ('458', '定西市', '2', '28', '0', '0');
INSERT INTO `dk_js_district` VALUES ('459', '陇南市', '2', '28', '0', '0');
INSERT INTO `dk_js_district` VALUES ('460', '临夏回族自治州', '2', '28', '0', '0');
INSERT INTO `dk_js_district` VALUES ('461', '甘南藏族自治州', '2', '28', '0', '0');
INSERT INTO `dk_js_district` VALUES ('462', '西宁市', '2', '29', '0', '0');
INSERT INTO `dk_js_district` VALUES ('463', '海东地区', '2', '29', '0', '0');
INSERT INTO `dk_js_district` VALUES ('464', '海北藏族自治州', '2', '29', '0', '0');
INSERT INTO `dk_js_district` VALUES ('465', '黄南藏族自治州', '2', '29', '0', '0');
INSERT INTO `dk_js_district` VALUES ('466', '海南藏族自治州', '2', '29', '0', '0');
INSERT INTO `dk_js_district` VALUES ('467', '果洛藏族自治州', '2', '29', '0', '0');
INSERT INTO `dk_js_district` VALUES ('468', '玉树藏族自治州', '2', '29', '0', '0');
INSERT INTO `dk_js_district` VALUES ('469', '海西蒙古族藏族自治州', '2', '29', '0', '0');
INSERT INTO `dk_js_district` VALUES ('470', '银川市', '2', '30', '0', '0');
INSERT INTO `dk_js_district` VALUES ('471', '石嘴山市', '2', '30', '0', '0');
INSERT INTO `dk_js_district` VALUES ('472', '吴忠市', '2', '30', '0', '0');
INSERT INTO `dk_js_district` VALUES ('473', '固原市', '2', '30', '0', '0');
INSERT INTO `dk_js_district` VALUES ('474', '中卫市', '2', '30', '0', '0');
INSERT INTO `dk_js_district` VALUES ('475', '乌鲁木齐市', '2', '31', '0', '0');
INSERT INTO `dk_js_district` VALUES ('476', '克拉玛依市', '2', '31', '0', '0');
INSERT INTO `dk_js_district` VALUES ('477', '吐鲁番地区', '2', '31', '0', '0');
INSERT INTO `dk_js_district` VALUES ('478', '哈密地区', '2', '31', '0', '0');
INSERT INTO `dk_js_district` VALUES ('479', '昌吉回族自治州', '2', '31', '0', '0');
INSERT INTO `dk_js_district` VALUES ('480', '博尔塔拉蒙古自治州', '2', '31', '0', '0');
INSERT INTO `dk_js_district` VALUES ('481', '巴音郭楞蒙古自治州', '2', '31', '0', '0');
INSERT INTO `dk_js_district` VALUES ('482', '阿克苏地区', '2', '31', '0', '0');
INSERT INTO `dk_js_district` VALUES ('483', '克孜勒苏柯尔克孜自治州', '2', '31', '0', '0');
INSERT INTO `dk_js_district` VALUES ('484', '喀什地区', '2', '31', '0', '0');
INSERT INTO `dk_js_district` VALUES ('485', '和田地区', '2', '31', '0', '0');
INSERT INTO `dk_js_district` VALUES ('486', '伊犁哈萨克自治州', '2', '31', '0', '0');
INSERT INTO `dk_js_district` VALUES ('487', '塔城地区', '2', '31', '0', '0');
INSERT INTO `dk_js_district` VALUES ('488', '阿勒泰地区', '2', '31', '0', '0');
INSERT INTO `dk_js_district` VALUES ('489', '石河子市', '2', '31', '0', '0');
INSERT INTO `dk_js_district` VALUES ('490', '阿拉尔市', '2', '31', '0', '0');
INSERT INTO `dk_js_district` VALUES ('491', '图木舒克市', '2', '31', '0', '0');
INSERT INTO `dk_js_district` VALUES ('492', '五家渠市', '2', '31', '0', '0');
INSERT INTO `dk_js_district` VALUES ('566', '直辖市', '1', '0', '3', '0');

-- ----------------------------
-- Table structure for `dk_js_loan_manager`
-- ----------------------------
DROP TABLE IF EXISTS `dk_js_loan_manager`;
CREATE TABLE `dk_js_loan_manager` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of dk_js_loan_manager
-- ----------------------------
INSERT INTO `dk_js_loan_manager` VALUES ('1', 'xdjl1');
INSERT INTO `dk_js_loan_manager` VALUES ('3', '测试经理ce');
INSERT INTO `dk_js_loan_manager` VALUES ('4', '信贷经理1');

-- ----------------------------
-- Table structure for `dk_js_pro`
-- ----------------------------
DROP TABLE IF EXISTS `dk_js_pro`;
CREATE TABLE `dk_js_pro` (
  `pid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '名称',
  `due_time_from` smallint(6) NOT NULL COMMENT '贷款期限开始',
  `due_time_to` smallint(6) NOT NULL COMMENT '贷款期限结束',
  `credit_from` smallint(6) NOT NULL COMMENT '额度开始',
  `credit_to` smallint(6) NOT NULL COMMENT '额度结束',
  `interest` text NOT NULL COMMENT '利息',
  `commission` decimal(10,2) NOT NULL COMMENT '手续费',
  `commission_type` smallint(3) NOT NULL,
  `apply_material` varchar(255) NOT NULL COMMENT '申请资料',
  `prepayment_notice` varchar(255) NOT NULL COMMENT '提前还款备注',
  `overdue_repayment_notice` varchar(255) NOT NULL COMMENT '逾期还款备注',
  `occupation` text NOT NULL COMMENT '职业',
  `createtime` int(10) unsigned NOT NULL,
  `updatetime` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `displayorder` mediumint(8) NOT NULL,
  `city` text NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dk_js_pro
-- ----------------------------
INSERT INTO `dk_js_pro` VALUES ('1', 'POS流水贷简版', '6', '36', '5', '60', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:1:\"1\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:3:\"1.5\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"3\";s:5:\"lixi1\";s:3:\"1.2\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:4:\"1.75\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"2\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '12.00', '0', '申请资料', '提前还款须', '逾期还款须知', 'a:4:{i:0;s:9:\"公务员\";i:1;s:12:\"公立医院\";i:2;s:6:\"银行\";i:3;s:6:\"律师\";}', '1503370024', '1507599036', '1', '0', 'a:11:{i:0;s:3:\"289\";i:1;s:3:\"291\";i:2;s:3:\"292\";i:3;s:3:\"293\";i:4;s:3:\"294\";i:5;s:3:\"295\";i:6;s:3:\"299\";i:7;s:3:\"302\";i:8;s:3:\"303\";i:9;s:3:\"305\";i:10;s:3:\"306\";}');
INSERT INTO `dk_js_pro` VALUES ('2', '168金融秒贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:3:\"1.3\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:3:\"1.3\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1503370139', '1507692033', '1', '3', 'N;');
INSERT INTO `dk_js_pro` VALUES ('3', '168金融同行贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '1.25', '0', '', '', '', 'N;', '1503370163', '1507692087', '1', '4', 'N;');
INSERT INTO `dk_js_pro` VALUES ('4', '168金融家贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:3:\"7.5\";s:7:\"lixidw1\";s:2:\"li\";s:5:\"lixi2\";s:3:\"1.2\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1503370191', '1507692160', '1', '5', 'N;');
INSERT INTO `dk_js_pro` VALUES ('5', '168抵押贷', '1', '60', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:3:\"8.5\";s:7:\"lixidw1\";s:2:\"li\";s:5:\"lixi2\";s:3:\"8.5\";s:7:\"lixidw2\";s:2:\"li\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"3\";s:5:\"lixi1\";s:3:\"1.3\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:3:\"1.3\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"4\";s:5:\"lixi1\";s:3:\"0.5\";s:7:\"lixidw1\";s:2:\"li\";s:5:\"lixi2\";s:3:\"0.5\";s:7:\"lixidw2\";s:2:\"li\";}}', '0.00', '0', '', '', '', 'N;', '1503370213', '1507692392', '1', '6', 'a:2:{i:0;s:3:\"292\";i:1;s:3:\"306\";}');
INSERT INTO `dk_js_pro` VALUES ('6', '恒信易贷押车', '0', '0', '3', '100', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:3:\"2.5\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:3:\"2.5\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '5.00', '0', '', '', '', 'N;', '1503370297', '1507601658', '1', '7', 'N;');
INSERT INTO `dk_js_pro` VALUES ('7', '恒信易贷不押车', '1', '24', '3', '60', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"3\";s:5:\"lixi1\";s:3:\"2.5\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:3:\"1.5\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '5.00', '0', '', '', '', 'N;', '1503370311', '1507601845', '1', '8', 'N;');
INSERT INTO `dk_js_pro` VALUES ('8', 'POS流水贷标准版', '6', '36', '60', '100', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:3:\"1.3\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:3:\"1.8\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '10.00', '0', '', 'dasdqd', 'dqwdqw', 'N;', '1503371617', '1507601000', '1', '1', 'a:11:{i:0;s:3:\"289\";i:1;s:3:\"291\";i:2;s:3:\"292\";i:3;s:3:\"293\";i:4;s:3:\"294\";i:5;s:3:\"295\";i:6;s:3:\"299\";i:7;s:3:\"302\";i:8;s:3:\"303\";i:9;s:3:\"305\";i:10;s:3:\"306\";}');
INSERT INTO `dk_js_pro` VALUES ('9', 'POS流水贷特批客户', '6', '36', '100', '500', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:3:\"1.3\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:3:\"1.8\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '10.00', '0', '', '', '', 'N;', '1503371645', '1507601383', '1', '2', 'a:11:{i:0;s:3:\"289\";i:1;s:3:\"291\";i:2;s:3:\"292\";i:3;s:3:\"293\";i:4;s:3:\"294\";i:5;s:3:\"295\";i:6;s:3:\"299\";i:7;s:3:\"302\";i:8;s:3:\"303\";i:9;s:3:\"305\";i:10;s:3:\"306\";}');
INSERT INTO `dk_js_pro` VALUES ('10', '无抵押信用贷款——工薪贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1506578057', '1507693692', '1', '0', 'a:361:{i:0;s:2:\"73\";i:1;s:2:\"74\";i:2;s:2:\"75\";i:3;s:2:\"76\";i:4;s:2:\"77\";i:5;s:2:\"78\";i:6;s:2:\"79\";i:7;s:2:\"80\";i:8;s:2:\"81\";i:9;s:2:\"82\";i:10;s:2:\"83\";i:11;s:2:\"84\";i:12;s:2:\"85\";i:13;s:2:\"86\";i:14;s:2:\"87\";i:15;s:2:\"88\";i:16;s:2:\"89\";i:17;s:2:\"90\";i:18;s:2:\"91\";i:19;s:2:\"92\";i:20;s:2:\"93\";i:21;s:2:\"94\";i:22;s:2:\"95\";i:23;s:2:\"96\";i:24;s:2:\"97\";i:25;s:2:\"98\";i:26;s:2:\"99\";i:27;s:3:\"100\";i:28;s:3:\"101\";i:29;s:3:\"102\";i:30;s:3:\"103\";i:31;s:3:\"104\";i:32;s:3:\"105\";i:33;s:3:\"106\";i:34;s:3:\"107\";i:35;s:3:\"108\";i:36;s:3:\"109\";i:37;s:3:\"110\";i:38;s:3:\"111\";i:39;s:3:\"112\";i:40;s:3:\"113\";i:41;s:3:\"114\";i:42;s:3:\"115\";i:43;s:3:\"116\";i:44;s:3:\"117\";i:45;s:3:\"118\";i:46;s:3:\"119\";i:47;s:3:\"120\";i:48;s:3:\"121\";i:49;s:3:\"122\";i:50;s:3:\"123\";i:51;s:3:\"124\";i:52;s:3:\"125\";i:53;s:3:\"126\";i:54;s:3:\"127\";i:55;s:3:\"128\";i:56;s:3:\"129\";i:57;s:3:\"130\";i:58;s:3:\"131\";i:59;s:3:\"132\";i:60;s:3:\"133\";i:61;s:3:\"134\";i:62;s:3:\"135\";i:63;s:3:\"136\";i:64;s:3:\"137\";i:65;s:3:\"138\";i:66;s:3:\"139\";i:67;s:3:\"140\";i:68;s:3:\"141\";i:69;s:3:\"142\";i:70;s:3:\"162\";i:71;s:3:\"163\";i:72;s:3:\"164\";i:73;s:3:\"165\";i:74;s:3:\"166\";i:75;s:3:\"167\";i:76;s:3:\"168\";i:77;s:3:\"169\";i:78;s:3:\"170\";i:79;s:3:\"171\";i:80;s:3:\"172\";i:81;s:3:\"173\";i:82;s:3:\"174\";i:83;s:3:\"175\";i:84;s:3:\"176\";i:85;s:3:\"177\";i:86;s:3:\"178\";i:87;s:3:\"179\";i:88;s:3:\"180\";i:89;s:3:\"181\";i:90;s:3:\"182\";i:91;s:3:\"183\";i:92;s:3:\"184\";i:93;s:3:\"185\";i:94;s:3:\"186\";i:95;s:3:\"187\";i:96;s:3:\"188\";i:97;s:3:\"189\";i:98;s:3:\"190\";i:99;s:3:\"191\";i:100;s:3:\"192\";i:101;s:3:\"193\";i:102;s:3:\"194\";i:103;s:3:\"195\";i:104;s:3:\"196\";i:105;s:3:\"197\";i:106;s:3:\"198\";i:107;s:3:\"199\";i:108;s:3:\"200\";i:109;s:3:\"201\";i:110;s:3:\"202\";i:111;s:3:\"203\";i:112;s:3:\"204\";i:113;s:3:\"205\";i:114;s:3:\"206\";i:115;s:3:\"207\";i:116;s:3:\"208\";i:117;s:3:\"209\";i:118;s:3:\"210\";i:119;s:3:\"211\";i:120;s:3:\"212\";i:121;s:3:\"213\";i:122;s:3:\"214\";i:123;s:3:\"215\";i:124;s:3:\"216\";i:125;s:3:\"217\";i:126;s:3:\"218\";i:127;s:3:\"219\";i:128;s:3:\"220\";i:129;s:3:\"221\";i:130;s:3:\"222\";i:131;s:3:\"223\";i:132;s:3:\"224\";i:133;s:3:\"225\";i:134;s:3:\"226\";i:135;s:3:\"227\";i:136;s:3:\"228\";i:137;s:3:\"229\";i:138;s:3:\"230\";i:139;s:3:\"231\";i:140;s:3:\"232\";i:141;s:3:\"233\";i:142;s:3:\"234\";i:143;s:3:\"235\";i:144;s:3:\"236\";i:145;s:3:\"237\";i:146;s:3:\"238\";i:147;s:3:\"239\";i:148;s:3:\"240\";i:149;s:3:\"241\";i:150;s:3:\"242\";i:151;s:3:\"243\";i:152;s:3:\"244\";i:153;s:3:\"245\";i:154;s:3:\"246\";i:155;s:3:\"247\";i:156;s:3:\"248\";i:157;s:3:\"249\";i:158;s:3:\"250\";i:159;s:3:\"251\";i:160;s:3:\"252\";i:161;s:3:\"253\";i:162;s:3:\"254\";i:163;s:3:\"255\";i:164;s:3:\"256\";i:165;s:3:\"257\";i:166;s:3:\"258\";i:167;s:3:\"259\";i:168;s:3:\"260\";i:169;s:3:\"261\";i:170;s:3:\"262\";i:171;s:3:\"263\";i:172;s:3:\"264\";i:173;s:3:\"265\";i:174;s:3:\"266\";i:175;s:3:\"267\";i:176;s:3:\"268\";i:177;s:3:\"269\";i:178;s:3:\"270\";i:179;s:3:\"271\";i:180;s:3:\"272\";i:181;s:3:\"273\";i:182;s:3:\"274\";i:183;s:3:\"275\";i:184;s:3:\"276\";i:185;s:3:\"277\";i:186;s:3:\"278\";i:187;s:3:\"279\";i:188;s:3:\"280\";i:189;s:3:\"281\";i:190;s:3:\"282\";i:191;s:3:\"283\";i:192;s:3:\"284\";i:193;s:3:\"285\";i:194;s:3:\"286\";i:195;s:3:\"287\";i:196;s:3:\"288\";i:197;s:3:\"289\";i:198;s:3:\"290\";i:199;s:3:\"291\";i:200;s:3:\"292\";i:201;s:3:\"293\";i:202;s:3:\"294\";i:203;s:3:\"295\";i:204;s:3:\"296\";i:205;s:3:\"297\";i:206;s:3:\"298\";i:207;s:3:\"299\";i:208;s:3:\"300\";i:209;s:3:\"301\";i:210;s:3:\"302\";i:211;s:3:\"303\";i:212;s:3:\"304\";i:213;s:3:\"305\";i:214;s:3:\"306\";i:215;s:3:\"307\";i:216;s:3:\"308\";i:217;s:3:\"309\";i:218;s:3:\"310\";i:219;s:3:\"311\";i:220;s:3:\"312\";i:221;s:3:\"313\";i:222;s:3:\"314\";i:223;s:3:\"315\";i:224;s:3:\"316\";i:225;s:3:\"317\";i:226;s:3:\"318\";i:227;s:3:\"319\";i:228;s:3:\"320\";i:229;s:3:\"321\";i:230;s:3:\"322\";i:231;s:3:\"323\";i:232;s:3:\"324\";i:233;s:3:\"325\";i:234;s:3:\"326\";i:235;s:3:\"327\";i:236;s:3:\"328\";i:237;s:3:\"329\";i:238;s:3:\"330\";i:239;s:3:\"331\";i:240;s:3:\"332\";i:241;s:3:\"333\";i:242;s:3:\"334\";i:243;s:3:\"335\";i:244;s:3:\"336\";i:245;s:3:\"337\";i:246;s:3:\"338\";i:247;s:3:\"339\";i:248;s:3:\"340\";i:249;s:3:\"341\";i:250;s:3:\"342\";i:251;s:3:\"343\";i:252;s:3:\"344\";i:253;s:3:\"385\";i:254;s:3:\"386\";i:255;s:3:\"387\";i:256;s:3:\"388\";i:257;s:3:\"389\";i:258;s:3:\"390\";i:259;s:3:\"391\";i:260;s:3:\"392\";i:261;s:3:\"393\";i:262;s:3:\"394\";i:263;s:3:\"395\";i:264;s:3:\"396\";i:265;s:3:\"397\";i:266;s:3:\"398\";i:267;s:3:\"399\";i:268;s:3:\"400\";i:269;s:3:\"401\";i:270;s:3:\"402\";i:271;s:3:\"403\";i:272;s:3:\"404\";i:273;s:3:\"405\";i:274;s:3:\"406\";i:275;s:3:\"407\";i:276;s:3:\"408\";i:277;s:3:\"409\";i:278;s:3:\"410\";i:279;s:3:\"411\";i:280;s:3:\"412\";i:281;s:3:\"413\";i:282;s:3:\"414\";i:283;s:3:\"415\";i:284;s:3:\"416\";i:285;s:3:\"417\";i:286;s:3:\"418\";i:287;s:3:\"419\";i:288;s:3:\"420\";i:289;s:3:\"421\";i:290;s:3:\"422\";i:291;s:3:\"423\";i:292;s:3:\"424\";i:293;s:3:\"425\";i:294;s:3:\"426\";i:295;s:3:\"427\";i:296;s:3:\"428\";i:297;s:3:\"429\";i:298;s:3:\"430\";i:299;s:3:\"431\";i:300;s:3:\"432\";i:301;s:3:\"433\";i:302;s:3:\"434\";i:303;s:3:\"435\";i:304;s:3:\"436\";i:305;s:3:\"437\";i:306;s:3:\"438\";i:307;s:3:\"439\";i:308;s:3:\"440\";i:309;s:3:\"441\";i:310;s:3:\"442\";i:311;s:3:\"443\";i:312;s:3:\"444\";i:313;s:3:\"445\";i:314;s:3:\"446\";i:315;s:3:\"447\";i:316;s:3:\"448\";i:317;s:3:\"449\";i:318;s:3:\"450\";i:319;s:3:\"451\";i:320;s:3:\"452\";i:321;s:3:\"453\";i:322;s:3:\"454\";i:323;s:3:\"455\";i:324;s:3:\"456\";i:325;s:3:\"457\";i:326;s:3:\"458\";i:327;s:3:\"459\";i:328;s:3:\"460\";i:329;s:3:\"461\";i:330;s:3:\"462\";i:331;s:3:\"463\";i:332;s:3:\"464\";i:333;s:3:\"465\";i:334;s:3:\"466\";i:335;s:3:\"467\";i:336;s:3:\"468\";i:337;s:3:\"469\";i:338;s:3:\"470\";i:339;s:3:\"471\";i:340;s:3:\"472\";i:341;s:3:\"473\";i:342;s:3:\"474\";i:343;s:3:\"475\";i:344;s:3:\"476\";i:345;s:3:\"477\";i:346;s:3:\"478\";i:347;s:3:\"479\";i:348;s:3:\"480\";i:349;s:3:\"481\";i:350;s:3:\"482\";i:351;s:3:\"483\";i:352;s:3:\"484\";i:353;s:3:\"485\";i:354;s:3:\"486\";i:355;s:3:\"487\";i:356;s:3:\"488\";i:357;s:3:\"489\";i:358;s:3:\"490\";i:359;s:3:\"491\";i:360;s:3:\"492\";}');
INSERT INTO `dk_js_pro` VALUES ('11', '华发金融房供贷', '6', '36', '2', '50', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507606955', '1507690713', '0', '0', 'a:25:{i:0;s:3:\"162\";i:1;s:3:\"163\";i:2;s:3:\"165\";i:3;s:3:\"166\";i:4;s:3:\"171\";i:5;s:3:\"172\";i:6;s:3:\"175\";i:7;s:3:\"176\";i:8;s:3:\"180\";i:9;s:3:\"204\";i:10;s:3:\"224\";i:11;s:3:\"228\";i:12;s:3:\"258\";i:13;s:3:\"289\";i:14;s:3:\"291\";i:15;s:3:\"292\";i:16;s:3:\"294\";i:17;s:3:\"299\";i:18;s:3:\"305\";i:19;s:3:\"306\";i:20;s:3:\"385\";i:21;s:1:\"1\";i:22;s:1:\"2\";i:23;s:1:\"9\";i:24;s:2:\"22\";}');
INSERT INTO `dk_js_pro` VALUES ('12', '薪粤贷', '6', '36', '3', '50', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '5.00', '0', '', '', '', 'N;', '1507689681', '1507690704', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('13', '华发金融保单贷', '6', '36', '2', '50', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '5.00', '0', '', '', '', 'N;', '1507691250', '1507691250', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('14', '华发金融工薪贷', '6', '36', '2', '50', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507691491', '1507691491', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('15', '厦门国际银行“欢欣贷”抵押消费贷', '6', '240', '1', '1000', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507691938', '1507691938', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('16', '无抵押信用贷款——公务员贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507693712', '1507693712', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('17', '无抵押信用贷款——保单贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507693728', '1507693728', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('18', '无抵押信用贷款——精英贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507693743', '1507693743', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('19', '无抵押信用贷款——优房贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507693766', '1507693766', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('20', '无抵押信用贷款——公积金贷', '6', '36', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507694733', '1507694733', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('21', '华发POS贷', '12', '36', '5', '50', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:3:\"1.2\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:3:\"1.5\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507695069', '1507695122', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('22', '商业现金垫款(MCA)POS贷', '3', '12', '15', '300', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:1:\"1\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:1:\"1\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507695525', '1507695525', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('23', '阳光工薪寿险贷', '3', '36', '5', '20', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:3:\"1.5\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507695764', '1507695913', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('24', '阳光法人寿险贷', '3', '36', '5', '20', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507695950', '1507695950', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('25', '阳光阳房贷', '0', '0', '5', '30', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:4:\"1.03\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:3:\"1.5\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507701530', '1507701530', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('26', '阳光物业贷', '0', '0', '2', '15', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:1:\"2\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:4:\"2.18\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507701691', '1507701691', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('27', '点融网——精英贷', '0', '0', '2', '30', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:4:\"1.49\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:4:\"1.81\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '1', '', '', '', 'N;', '1507702506', '1507877190', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('28', '点融网——寿险贷', '0', '0', '1', '15', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:3:\"1.7\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:4:\"2.06\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '1', '', '', '', 'N;', '1507702702', '1507877148', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('29', '点融网——业主贷', '0', '0', '5', '15', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:3:\"1.7\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:4:\"2.35\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '1', '', '', '', 'N;', '1507702717', '1507877097', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('30', '点融网——MCA企业贷', '3', '36', '10', '100', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:3:\"1.2\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:3:\"1.5\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '1', '', '', '', 'N;', '1507702745', '1507879121', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('31', '点融网——小微企业贷', '0', '0', '10', '100', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:3:\"1.2\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:3:\"1.5\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '1', '', '', '', 'N;', '1507703406', '1507876699', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('32', '善悉－精英贷', '12', '36', '1', '20', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:4:\"1.58\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '1', '', '', '', 'N;', '1507703464', '1507879290', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('33', '善悉－善美贷', '12', '36', '1', '20', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:4:\"2.18\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '1', '', '', '', 'N;', '1507703487', '1507879331', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('34', '善悉－善薪贷', '12', '36', '1', '30', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:4:\"2.28\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '1', '', '', '', 'N;', '1507703524', '1507879376', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('35', '中腾信——薪期贷', '0', '0', '8', '20', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:4:\"0.99\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '1', '', '', '', 'N;', '1507705639', '1507879448', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('36', '中腾信——信优贷', '12', '36', '3', '25', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:4:\"1.49\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:3:\"2.1\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '1', '', '', '', 'N;', '1507705679', '1507879491', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('37', '中腾信——信薪佳人贷', '25', '45', '4', '25', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:4:\"0.69\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:3:\"2.1\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '1', '', '', '', 'N;', '1507705733', '1507879552', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('38', '中腾信——工薪按揭贷', '0', '0', '8', '15', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507705783', '1507705783', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('39', '中腾信——信薪贷', '0', '0', '1', '25', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507705818', '1507705818', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('40', '宜信基础贷', '12', '36', '3', '30', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:4:\"1.29\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:4:\"2.39\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '1', '', '', '', 'N;', '1507705906', '1507881596', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('41', '银谷普惠——保单贷', '1', '24', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:4:\"2.07\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '1', '', '', '', 'N;', '1507705983', '1507881701', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('42', '银谷普惠——社保贷', '1', '24', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:4:\"2.07\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:4:\"2.07\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"3\";s:5:\"lixi1\";s:4:\"3.23\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:4:\"3.23\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '1', '', '', '', 'N;', '1507706339', '1507881748', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('43', '银谷普惠——公积金贷', '1', '24', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:4:\"1.96\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:4:\"1.96\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"3\";s:5:\"lixi1\";s:4:\"3.10\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:4:\"3.10\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '1', '', '', '', 'N;', '1507706368', '1507881791', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('44', '银谷普惠——金领贷', '1', '24', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:4:\"1.76\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:4:\"1.76\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"3\";s:5:\"lixi1\";s:4:\"2.91\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:4:\"2.91\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '1', '', '', '', 'N;', '1507706410', '1507881854', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('45', '银谷普惠——精英贷/工薪贷', '1', '36', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:4:\"1.78\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:4:\"2.38\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '1', '', '', '', 'N;', '1507706483', '1507881892', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('46', '银谷普惠——法人贷（个体户）', '1', '24', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:4:\"2.38\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '1', '', '', '', 'N;', '1507706526', '1507882005', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('47', '银谷普惠——法人贷（企业法人）', '6', '24', '10', '100', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:4:\"2.33\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '1', '', '', '', 'N;', '1507706573', '1507882044', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('48', '银谷普惠——按揭房贷', '1', '36', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:4:\"1.86\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:4:\"1.89\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '1', '', '', '', 'N;', '1507706621', '1507882085', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('49', '银谷普惠——婚庆贷', '1', '24', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:4:\"2.03\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507706675', '1507706675', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('50', '银谷普惠——房东贷', '1', '24', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:1:\"2\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507706709', '1507706709', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('51', '和信——公积金贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507706756', '1507706756', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('52', '和信——寿险贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507706793', '1507706793', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('53', '和信——车主贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507706811', '1507706811', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('54', '和信——社保贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507706826', '1507706826', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('55', '信用家——金领贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507707003', '1507707003', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('56', '信用家——精英贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507707015', '1507707015', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('57', '信用家——公积金贷', '0', '0', '1', '50', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507707049', '1507707049', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('58', '信用家——社保贷', '0', '0', '1', '50', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507707088', '1507707088', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('59', '信用家——保单贷', '0', '0', '1', '50', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507707114', '1507707114', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('60', '信用家——淘金贷', '0', '0', '3', '8', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507707137', '1507707137', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('61', '信用家——微速贷', '0', '0', '2', '15', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507707195', '1507707195', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('62', '信用家——业主贷', '12', '36', '1', '15', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507707300', '1507707300', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('63', '信用家——生意贷', '12', '36', '1', '15', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507707344', '1507707344', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('64', '大地时贷——按揭房贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507707424', '1507707424', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('65', '大地时贷——首寿险贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507707460', '1507707460', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('66', '大地时贷——车主贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507707474', '1507707474', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('67', '大地时贷——社保贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507707491', '1507707491', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('68', '大地时贷——薪金贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507707519', '1507707519', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('69', '证大财富——精英贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507707558', '1507707558', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('70', '证大财富——随房贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507707577', '1507707577', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('71', '证大财富——随车贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507707595', '1507707595', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('72', '证大财富——京东贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507707614', '1507707614', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('73', '证大财富——保单贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507707625', '1507707625', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('74', '证大财富——淘宝贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507707641', '1507707641', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('75', '证大财富——本科贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507707678', '1507707678', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('76', '证大财富——信用卡贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507707696', '1507707696', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('77', '人保普惠——业主贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507708160', '1507708160', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('78', '人保普惠——保单贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507708176', '1507708176', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('79', '人保普惠——车主贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507708192', '1507708192', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('80', '人保普惠——公积金/社保贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507708215', '1507708215', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('81', '人保普惠——优卡贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507708233', '1507708233', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('82', '人保普惠——法人贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507708249', '1507708249', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('83', '人保普惠——工薪贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507708263', '1507708263', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('84', '珠海大阳光——阳房贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507708305', '1507708305', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('85', '珠海大阳光——普通房贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507708328', '1507708328', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('86', '珠海大阳光——金宝贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507708345', '1507708345', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('87', '珠海大阳光——工薪贷/社保贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507708369', '1507708369', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('88', '珠海大阳光——企业贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507708387', '1507708387', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('89', '珠海大阳光——车贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507708399', '1507708399', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('90', '珠海大阳光——保单贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507708408', '1507708408', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('91', '珠海大阳光——车抵快贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507708435', '1507708435', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('92', '阳光时贷——阳房贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507708478', '1507708478', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('93', '阳光时贷——车贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507708492', '1507708492', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('94', '阳光时贷——物业贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507708503', '1507708503', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('95', '阳光时贷——私营业主贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507708524', '1507708524', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('96', '恒昌——社保贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507708548', '1507708548', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('97', '恒昌——精英贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507708631', '1507708631', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('98', '恒昌——工薪贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507708641', '1507708641', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('99', '恒昌——保单贷', '0', '0', '0', '0', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '0.00', '0', '', '', '', 'N;', '1507708651', '1507708651', '0', '0', 'N;');
INSERT INTO `dk_js_pro` VALUES ('100', '恒昌——优保贷', '3', '36', '2', '50', 'a:3:{i:0;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:3:\"1.0\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:4:\"1.25\";s:7:\"lixidw2\";s:3:\"fen\";}i:1;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}i:2;a:5:{s:8:\"lixitype\";s:1:\"1\";s:5:\"lixi1\";s:0:\"\";s:7:\"lixidw1\";s:3:\"fen\";s:5:\"lixi2\";s:0:\"\";s:7:\"lixidw2\";s:3:\"fen\";}}', '12.00', '2', '', '', '', 'N;', '1507708671', '1507875125', '0', '0', 'N;');

-- ----------------------------
-- Table structure for `dk_js_pro_condition`
-- ----------------------------
DROP TABLE IF EXISTS `dk_js_pro_condition`;
CREATE TABLE `dk_js_pro_condition` (
  `cid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) unsigned NOT NULL,
  `optionname` varchar(100) NOT NULL,
  `equationtype` char(20) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dk_js_pro_condition
-- ----------------------------
INSERT INTO `dk_js_pro_condition` VALUES ('15', '1', 'pos_register_date', 'gt', '12');
INSERT INTO `dk_js_pro_condition` VALUES ('16', '1', 'company_register_duration', 'gt', '12');
INSERT INTO `dk_js_pro_condition` VALUES ('17', '1', 'pos_money', 'eq', '2');
INSERT INTO `dk_js_pro_condition` VALUES ('18', '8', 'pos_register_date', 'gt', '12');
INSERT INTO `dk_js_pro_condition` VALUES ('19', '8', 'company_register_duration', 'gt', '12');
INSERT INTO `dk_js_pro_condition` VALUES ('20', '8', 'pos_money', 'gt', '10');
INSERT INTO `dk_js_pro_condition` VALUES ('21', '9', 'company_owner', 'eq', '1');
INSERT INTO `dk_js_pro_condition` VALUES ('22', '9', 'pos_register_date', 'gt', '12');
INSERT INTO `dk_js_pro_condition` VALUES ('23', '9', 'pos_money', 'gt', '10');
INSERT INTO `dk_js_pro_condition` VALUES ('24', '9', 'company_register_duration', 'gt', '12');
INSERT INTO `dk_js_pro_condition` VALUES ('27', '6', 'car_age', 'elt', '120');
INSERT INTO `dk_js_pro_condition` VALUES ('28', '6', 'car_value', 'egt', '3');
INSERT INTO `dk_js_pro_condition` VALUES ('31', '7', 'car_age', 'egt', '10');
INSERT INTO `dk_js_pro_condition` VALUES ('32', '7', 'car_value', 'egt', '3');
INSERT INTO `dk_js_pro_condition` VALUES ('33', '12', 'salary', 'egt', '3000');
INSERT INTO `dk_js_pro_condition` VALUES ('34', '12', 'housing_fund_fee', 'egt', '720');
INSERT INTO `dk_js_pro_condition` VALUES ('35', '12', 'occupation_duration', 'egt', '6');
INSERT INTO `dk_js_pro_condition` VALUES ('36', '14', 'salary', 'egt', '2000');
INSERT INTO `dk_js_pro_condition` VALUES ('37', '14', 'housing_fund_duration', 'egt', '6');
INSERT INTO `dk_js_pro_condition` VALUES ('38', '14', 'social_security_duration', 'egt', '6');
INSERT INTO `dk_js_pro_condition` VALUES ('39', '2', 'oroperty_register_date', 'egt', '3');
INSERT INTO `dk_js_pro_condition` VALUES ('40', '3', 'oroperty_register_date', 'egt', '3');
INSERT INTO `dk_js_pro_condition` VALUES ('42', '4', 'oroperty_register_date', 'egt', '1');
INSERT INTO `dk_js_pro_condition` VALUES ('43', '5', 'oroperty_register_date', 'egt', '3');
INSERT INTO `dk_js_pro_condition` VALUES ('44', '10', 'occupation_duration', 'egt', '12');
INSERT INTO `dk_js_pro_condition` VALUES ('45', '10', 'social_security_duration', 'egt', '12');
INSERT INTO `dk_js_pro_condition` VALUES ('46', '16', 'occpation', 'eq', 'a:7:{i:0;s:9:\"公务员\";i:1;s:12:\"事业单位\";i:2;s:12:\"公立学校\";i:3;s:6:\"银行\";i:4;s:6:\"国企\";i:5;s:0:\"\";i:6;s:0:\"\";}');
INSERT INTO `dk_js_pro_condition` VALUES ('47', '16', 'social_security_duration', 'egt', '6');
INSERT INTO `dk_js_pro_condition` VALUES ('48', '17', 'insurance_fee_type', 'eq', 'a:2:{i:0;s:6:\"月缴\";i:1;s:3:\"200\";}');
INSERT INTO `dk_js_pro_condition` VALUES ('49', '17', 'insurance_effective_time', 'egt', '24');
INSERT INTO `dk_js_pro_condition` VALUES ('50', '17', 'company_owner', 'eq', '1');
INSERT INTO `dk_js_pro_condition` VALUES ('51', '17', 'company_register_duration', 'egt', '12');
INSERT INTO `dk_js_pro_condition` VALUES ('52', '20', 'housing_fund_duration', 'egt', '9');
INSERT INTO `dk_js_pro_condition` VALUES ('53', '18', 'housing_fund_duration', 'egt', '6');
INSERT INTO `dk_js_pro_condition` VALUES ('54', '18', 'housing_fund_fee', 'egt', '3500');
INSERT INTO `dk_js_pro_condition` VALUES ('55', '21', 'company_owner', 'eq', '1');
INSERT INTO `dk_js_pro_condition` VALUES ('56', '21', 'company_register_duration', 'egt', '12');
INSERT INTO `dk_js_pro_condition` VALUES ('57', '21', 'pos_register_date', 'egt', '6');
INSERT INTO `dk_js_pro_condition` VALUES ('58', '22', 'company_owner', 'eq', '1');
INSERT INTO `dk_js_pro_condition` VALUES ('59', '23', 'insurance_effective_time', 'egt', '36');
INSERT INTO `dk_js_pro_condition` VALUES ('60', '23', 'insurance_fee_type', 'eq', 'a:2:{i:0;s:6:\"月缴\";i:1;s:3:\"200\";}');

-- ----------------------------
-- Table structure for `dk_js_pro_type`
-- ----------------------------
DROP TABLE IF EXISTS `dk_js_pro_type`;
CREATE TABLE `dk_js_pro_type` (
  `aid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) NOT NULL,
  `type` char(20) NOT NULL,
  `ptype` smallint(3) NOT NULL,
  `data1` int(6) NOT NULL,
  `data2` int(6) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dk_js_pro_type
-- ----------------------------
INSERT INTO `dk_js_pro_type` VALUES ('4', '12', 'age', '1', '22', '55');
INSERT INTO `dk_js_pro_type` VALUES ('5', '11', 'age', '2', '23', '52');
INSERT INTO `dk_js_pro_type` VALUES ('6', '11', 'age', '3', '25', '55');
INSERT INTO `dk_js_pro_type` VALUES ('7', '13', 'age', '2', '23', '52');
INSERT INTO `dk_js_pro_type` VALUES ('8', '13', 'age', '3', '25', '55');
INSERT INTO `dk_js_pro_type` VALUES ('9', '14', 'age', '2', '23', '52');
INSERT INTO `dk_js_pro_type` VALUES ('10', '2', 'age', '1', '23', '60');
INSERT INTO `dk_js_pro_type` VALUES ('11', '3', 'age', '1', '23', '60');
INSERT INTO `dk_js_pro_type` VALUES ('12', '4', 'age', '2', '23', '60');
INSERT INTO `dk_js_pro_type` VALUES ('13', '4', 'age', '3', '28', '65');
INSERT INTO `dk_js_pro_type` VALUES ('15', '5', 'age', '1', '18', '65');
INSERT INTO `dk_js_pro_type` VALUES ('16', '20', 'age', '1', '21', '56');
INSERT INTO `dk_js_pro_type` VALUES ('18', '21', 'age', '1', '25', '55');
INSERT INTO `dk_js_pro_type` VALUES ('19', '22', 'age', '1', '20', '60');
INSERT INTO `dk_js_pro_type` VALUES ('20', '25', 'age', '1', '25', '54');
INSERT INTO `dk_js_pro_type` VALUES ('22', '38', 'age', '1', '25', '45');
INSERT INTO `dk_js_pro_type` VALUES ('23', '39', 'age', '1', '22', '60');
INSERT INTO `dk_js_pro_type` VALUES ('33', '49', 'age', '1', '22', '40');
INSERT INTO `dk_js_pro_type` VALUES ('34', '50', 'age', '1', '20', '60');
INSERT INTO `dk_js_pro_type` VALUES ('40', '100', 'age', '1', '25', '55');
INSERT INTO `dk_js_pro_type` VALUES ('41', '28', 'age', '1', '22', '60');
INSERT INTO `dk_js_pro_type` VALUES ('42', '27', 'age', '1', '22', '60');
INSERT INTO `dk_js_pro_type` VALUES ('43', '32', 'age', '1', '20', '60');
INSERT INTO `dk_js_pro_type` VALUES ('44', '35', 'age', '1', '25', '55');
INSERT INTO `dk_js_pro_type` VALUES ('45', '36', 'age', '1', '25', '55');
INSERT INTO `dk_js_pro_type` VALUES ('46', '40', 'age', '1', '22', '60');
INSERT INTO `dk_js_pro_type` VALUES ('47', '41', 'age', '1', '22', '55');
INSERT INTO `dk_js_pro_type` VALUES ('48', '42', 'age', '1', '18', '55');
INSERT INTO `dk_js_pro_type` VALUES ('49', '43', 'age', '1', '18', '55');
INSERT INTO `dk_js_pro_type` VALUES ('50', '44', 'age', '1', '22', '55');
INSERT INTO `dk_js_pro_type` VALUES ('51', '45', 'age', '1', '22', '57');
INSERT INTO `dk_js_pro_type` VALUES ('52', '46', 'age', '1', '22', '55');
INSERT INTO `dk_js_pro_type` VALUES ('53', '47', 'age', '1', '22', '55');
INSERT INTO `dk_js_pro_type` VALUES ('54', '48', 'age', '1', '22', '55');

-- ----------------------------
-- Table structure for `dk_js_pro_user`
-- ----------------------------
DROP TABLE IF EXISTS `dk_js_pro_user`;
CREATE TABLE `dk_js_pro_user` (
  `cid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) NOT NULL,
  `ukeyid` mediumint(8) NOT NULL,
  `pkeyid` mediumint(8) NOT NULL,
  `tiaojian` int(3) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dk_js_pro_user
-- ----------------------------

-- ----------------------------
-- Table structure for `dk_js_user_profile`
-- ----------------------------
DROP TABLE IF EXISTS `dk_js_user_profile`;
CREATE TABLE `dk_js_user_profile` (
  `id` bigint(20) unsigned NOT NULL,
  `loan_manager_id` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `idno` varchar(18) NOT NULL COMMENT '身份证号码',
  `mobile` char(20) NOT NULL,
  `birthday` varchar(10) NOT NULL,
  `marry_status` smallint(3) NOT NULL,
  `marry_date` char(20) NOT NULL,
  `gender` char(3) NOT NULL COMMENT '性别',
  `educational` smallint(3) NOT NULL,
  `graduation_after_time` smallint(3) NOT NULL,
  `province` char(8) NOT NULL,
  `city` char(20) NOT NULL,
  `required_load_amount` smallint(3) NOT NULL,
  `required_load_term` smallint(3) NOT NULL,
  `salary` decimal(10,2) NOT NULL COMMENT '平均月薪',
  `income_tax_duration` int(10) NOT NULL COMMENT '个税缴纳时间',
  `housing_fund_base_fee` decimal(10,0) NOT NULL,
  `housing_fund_fee` decimal(10,2) NOT NULL COMMENT '公积金缴费金额',
  `housing_fund_duration` int(10) NOT NULL COMMENT '公积金缴费时间',
  `occpation` varchar(100) NOT NULL COMMENT '职业',
  `occupation_duration` int(10) NOT NULL COMMENT '入职时间',
  `social_security_fee` decimal(10,2) NOT NULL COMMENT '社保缴纳金额',
  `social_security_duration` int(10) NOT NULL COMMENT '社保缴纳时间',
  `sesame_credit` decimal(10,2) NOT NULL COMMENT '芝麻信用分数',
  `alipay_register_date` int(10) NOT NULL COMMENT '支付宝注册时间',
  `credit_line` decimal(10,2) NOT NULL COMMENT '信用卡授信额度',
  `credit_card_duration` int(10) NOT NULL COMMENT '信用卡使用时间',
  `car_hand` varchar(100) NOT NULL COMMENT '一手车 二手车',
  `car_age` int(10) NOT NULL COMMENT '车龄',
  `car_value` decimal(10,2) NOT NULL COMMENT '车估值',
  `oroperty_register_date` smallint(3) NOT NULL,
  `rental_property_check` tinyint(1) NOT NULL,
  `mortgage_property_fee` decimal(10,2) NOT NULL COMMENT '按揭物业月供金额',
  `mortgage_property_duration` int(10) NOT NULL COMMENT '按揭物业时间',
  `mortgage_property_paid_off_duration` int(10) NOT NULL COMMENT '已结清按揭房产的时间',
  `pos_register_date` int(10) NOT NULL COMMENT 'pos安装时间',
  `pos_money` decimal(10,2) NOT NULL COMMENT 'pos月流水金额',
  `company_owner` varchar(10) NOT NULL COMMENT '是否是公司法人',
  `company_share` decimal(10,2) NOT NULL COMMENT '占公司股份百分比',
  `company_register_duration` int(10) NOT NULL COMMENT '公司注册时间',
  `company_sales` decimal(10,2) NOT NULL COMMENT '公司月营业额',
  `company_capital` int(10) NOT NULL,
  `insurance_type` varchar(200) NOT NULL COMMENT '保单类型',
  `insurance_effective_time` int(10) NOT NULL COMMENT '保单生效时间',
  `insurance_monthly_fee` decimal(10,0) NOT NULL COMMENT '保单月缴金额',
  `insurance_quarterly_fee` decimal(10,0) NOT NULL COMMENT '保单季缴费用',
  `insurance_fee_type` smallint(3) NOT NULL COMMENT '保单年交',
  `insurance_paid_fee_duration` int(10) NOT NULL COMMENT '保单缴费年限',
  `insurance_fee_time` int(6) NOT NULL,
  `taobao_register_duration` int(10) NOT NULL COMMENT '淘宝注册时间',
  `taobao_credit_min` int(10) NOT NULL COMMENT '淘宝信用等级',
  `taobao_credit_max` int(10) NOT NULL,
  `taobao_comment_rate` decimal(10,2) NOT NULL COMMENT '淘宝好评率',
  `jingdong_credit_line` smallint(3) NOT NULL,
  `jingdong_rate` int(6) NOT NULL,
  `taobao_credit_line` smallint(3) NOT NULL,
  `taobao_credit_type` smallint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of dk_js_user_profile
-- ----------------------------
INSERT INTO `dk_js_user_profile` VALUES ('1', '3', '测试1', '123456789012345678', '12345678901', '1995-09-06', '2', '2003-04-01', '1', '2', '3', '3', '石家庄市', '120', '10', '2000.00', '3', '1000', '12.00', '4', '公立医院', '1', '20.00', '3', '40.00', '5', '60.00', '7', '2', '8', '9.00', '1111', '1', '10.00', '11', '12', '13', '14.00', '1', '15.00', '16', '17.00', '0', '2', '18', '19', '0', '3', '0', '20', '20', '2001', '5000', '22.00', '1', '12', '4', '2');
INSERT INTO `dk_js_user_profile` VALUES ('2', '4', 'test', '', '10987654321', '0', '1', '', '1', '1', '0', '10', '苏州市', '0', '0', '0.00', '0', '0', '0.00', '0', '', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0', '0', '0.00', '0', '0', '0.00', '0', '0', '0', '0.00', '1', '0.00', '0', '0.00', '0', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0.00', '0', '0', '0', '0');
INSERT INTO `dk_js_user_profile` VALUES ('3', '3', '测试2', '130106196806050971', '13113890914', '1968', '0', '', '2', '0', '0', '0', '0', '0', '0', '0.00', '0', '0', '0.00', '0', '', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0', '0', '0.00', '0', '0', '0.00', '0', '0', '0', '0.00', '', '0.00', '0', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0', '0', '0', '0');
INSERT INTO `dk_js_user_profile` VALUES ('4', '4', '测试3', '130106196806050971', '13113890914', '1968', '0', '', '2', '0', '0', '0', '0', '0', '0', '0.00', '0', '0', '0.00', '0', '', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0', '0', '0.00', '0', '0', '0.00', '0', '0', '0', '0.00', '', '0.00', '0', '0.00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `dk_links`
-- ----------------------------
DROP TABLE IF EXISTS `dk_links`;
CREATE TABLE `dk_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of dk_links
-- ----------------------------
INSERT INTO `dk_links` VALUES ('1', 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '', '1', '0', '', '0');

-- ----------------------------
-- Table structure for `dk_menu`
-- ----------------------------
DROP TABLE IF EXISTS `dk_menu`;
CREATE TABLE `dk_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` varchar(30) NOT NULL DEFAULT '' COMMENT '应用名称app',
  `model` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称',
  `data` varchar(50) NOT NULL DEFAULT '' COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=198 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of dk_menu
-- ----------------------------
INSERT INTO `dk_menu` VALUES ('1', '0', 'Admin', 'Content', 'default', '', '0', '0', '内容管理', 'th', '', '30');
INSERT INTO `dk_menu` VALUES ('2', '1', 'Api', 'Guestbookadmin', 'index', '', '1', '1', '所有留言', '', '', '0');
INSERT INTO `dk_menu` VALUES ('3', '2', 'Api', 'Guestbookadmin', 'delete', '', '1', '0', '删除网站留言', '', '', '0');
INSERT INTO `dk_menu` VALUES ('4', '1', 'Comment', 'Commentadmin', 'index', '', '1', '1', '评论管理', '', '', '0');
INSERT INTO `dk_menu` VALUES ('5', '4', 'Comment', 'Commentadmin', 'delete', '', '1', '0', '删除评论', '', '', '0');
INSERT INTO `dk_menu` VALUES ('6', '4', 'Comment', 'Commentadmin', 'check', '', '1', '0', '评论审核', '', '', '0');
INSERT INTO `dk_menu` VALUES ('7', '1', 'Portal', 'AdminPost', 'index', '', '1', '1', '文章管理', '', '', '1');
INSERT INTO `dk_menu` VALUES ('8', '7', 'Portal', 'AdminPost', 'listorders', '', '1', '0', '文章排序', '', '', '0');
INSERT INTO `dk_menu` VALUES ('9', '7', 'Portal', 'AdminPost', 'top', '', '1', '0', '文章置顶', '', '', '0');
INSERT INTO `dk_menu` VALUES ('10', '7', 'Portal', 'AdminPost', 'recommend', '', '1', '0', '文章推荐', '', '', '0');
INSERT INTO `dk_menu` VALUES ('11', '7', 'Portal', 'AdminPost', 'move', '', '1', '0', '批量移动', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('12', '7', 'Portal', 'AdminPost', 'check', '', '1', '0', '文章审核', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('13', '7', 'Portal', 'AdminPost', 'delete', '', '1', '0', '删除文章', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('14', '7', 'Portal', 'AdminPost', 'edit', '', '1', '0', '编辑文章', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('15', '14', 'Portal', 'AdminPost', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `dk_menu` VALUES ('16', '7', 'Portal', 'AdminPost', 'add', '', '1', '0', '添加文章', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('17', '16', 'Portal', 'AdminPost', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `dk_menu` VALUES ('18', '1', 'Portal', 'AdminTerm', 'index', '', '0', '1', '分类管理', '', '', '2');
INSERT INTO `dk_menu` VALUES ('19', '18', 'Portal', 'AdminTerm', 'listorders', '', '1', '0', '文章分类排序', '', '', '0');
INSERT INTO `dk_menu` VALUES ('20', '18', 'Portal', 'AdminTerm', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('21', '18', 'Portal', 'AdminTerm', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('22', '21', 'Portal', 'AdminTerm', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `dk_menu` VALUES ('23', '18', 'Portal', 'AdminTerm', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('24', '23', 'Portal', 'AdminTerm', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `dk_menu` VALUES ('25', '1', 'Portal', 'AdminPage', 'index', '', '1', '1', '页面管理', '', '', '3');
INSERT INTO `dk_menu` VALUES ('26', '25', 'Portal', 'AdminPage', 'listorders', '', '1', '0', '页面排序', '', '', '0');
INSERT INTO `dk_menu` VALUES ('27', '25', 'Portal', 'AdminPage', 'delete', '', '1', '0', '删除页面', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('28', '25', 'Portal', 'AdminPage', 'edit', '', '1', '0', '编辑页面', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('29', '28', 'Portal', 'AdminPage', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `dk_menu` VALUES ('30', '25', 'Portal', 'AdminPage', 'add', '', '1', '0', '添加页面', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('31', '30', 'Portal', 'AdminPage', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `dk_menu` VALUES ('32', '1', 'Admin', 'Recycle', 'default', '', '1', '1', '回收站', '', '', '4');
INSERT INTO `dk_menu` VALUES ('33', '32', 'Portal', 'AdminPost', 'recyclebin', '', '1', '1', '文章回收', '', '', '0');
INSERT INTO `dk_menu` VALUES ('34', '33', 'Portal', 'AdminPost', 'restore', '', '1', '0', '文章还原', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('35', '33', 'Portal', 'AdminPost', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('36', '32', 'Portal', 'AdminPage', 'recyclebin', '', '1', '1', '页面回收', '', '', '1');
INSERT INTO `dk_menu` VALUES ('37', '36', 'Portal', 'AdminPage', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('38', '36', 'Portal', 'AdminPage', 'restore', '', '1', '0', '页面还原', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('39', '0', 'Admin', 'Extension', 'default', '', '0', '0', '扩展工具', 'cloud', '', '40');
INSERT INTO `dk_menu` VALUES ('40', '39', 'Admin', 'Backup', 'default', '', '1', '0', '备份管理', '', '', '0');
INSERT INTO `dk_menu` VALUES ('41', '40', 'Admin', 'Backup', 'restore', '', '1', '1', '数据还原', '', '', '0');
INSERT INTO `dk_menu` VALUES ('42', '40', 'Admin', 'Backup', 'index', '', '1', '1', '数据备份', '', '', '0');
INSERT INTO `dk_menu` VALUES ('43', '42', 'Admin', 'Backup', 'index_post', '', '1', '0', '提交数据备份', '', '', '0');
INSERT INTO `dk_menu` VALUES ('44', '40', 'Admin', 'Backup', 'download', '', '1', '0', '下载备份', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('45', '40', 'Admin', 'Backup', 'del_backup', '', '1', '0', '删除备份', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('46', '40', 'Admin', 'Backup', 'import', '', '1', '0', '数据备份导入', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('47', '39', 'Admin', 'Plugin', 'index', '', '1', '1', '插件管理', '', '', '0');
INSERT INTO `dk_menu` VALUES ('48', '47', 'Admin', 'Plugin', 'toggle', '', '1', '0', '插件启用切换', '', '', '0');
INSERT INTO `dk_menu` VALUES ('49', '47', 'Admin', 'Plugin', 'setting', '', '1', '0', '插件设置', '', '', '0');
INSERT INTO `dk_menu` VALUES ('50', '49', 'Admin', 'Plugin', 'setting_post', '', '1', '0', '插件设置提交', '', '', '0');
INSERT INTO `dk_menu` VALUES ('51', '47', 'Admin', 'Plugin', 'install', '', '1', '0', '插件安装', '', '', '0');
INSERT INTO `dk_menu` VALUES ('52', '47', 'Admin', 'Plugin', 'uninstall', '', '1', '0', '插件卸载', '', '', '0');
INSERT INTO `dk_menu` VALUES ('53', '39', 'Admin', 'Slide', 'default', '', '1', '1', '幻灯片', '', '', '1');
INSERT INTO `dk_menu` VALUES ('54', '53', 'Admin', 'Slide', 'index', '', '1', '1', '幻灯片管理', '', '', '0');
INSERT INTO `dk_menu` VALUES ('55', '54', 'Admin', 'Slide', 'listorders', '', '1', '0', '幻灯片排序', '', '', '0');
INSERT INTO `dk_menu` VALUES ('56', '54', 'Admin', 'Slide', 'toggle', '', '1', '0', '幻灯片显示切换', '', '', '0');
INSERT INTO `dk_menu` VALUES ('57', '54', 'Admin', 'Slide', 'delete', '', '1', '0', '删除幻灯片', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('58', '54', 'Admin', 'Slide', 'edit', '', '1', '0', '编辑幻灯片', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('59', '58', 'Admin', 'Slide', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `dk_menu` VALUES ('60', '54', 'Admin', 'Slide', 'add', '', '1', '0', '添加幻灯片', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('61', '60', 'Admin', 'Slide', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `dk_menu` VALUES ('62', '53', 'Admin', 'Slidecat', 'index', '', '1', '1', '幻灯片分类', '', '', '0');
INSERT INTO `dk_menu` VALUES ('63', '62', 'Admin', 'Slidecat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('64', '62', 'Admin', 'Slidecat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('65', '64', 'Admin', 'Slidecat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `dk_menu` VALUES ('66', '62', 'Admin', 'Slidecat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('67', '66', 'Admin', 'Slidecat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `dk_menu` VALUES ('68', '39', 'Admin', 'Ad', 'index', '', '1', '1', '网站广告', '', '', '2');
INSERT INTO `dk_menu` VALUES ('69', '68', 'Admin', 'Ad', 'toggle', '', '1', '0', '广告显示切换', '', '', '0');
INSERT INTO `dk_menu` VALUES ('70', '68', 'Admin', 'Ad', 'delete', '', '1', '0', '删除广告', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('71', '68', 'Admin', 'Ad', 'edit', '', '1', '0', '编辑广告', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('72', '71', 'Admin', 'Ad', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `dk_menu` VALUES ('73', '68', 'Admin', 'Ad', 'add', '', '1', '0', '添加广告', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('74', '73', 'Admin', 'Ad', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `dk_menu` VALUES ('75', '39', 'Admin', 'Link', 'index', '', '0', '1', '友情链接', '', '', '3');
INSERT INTO `dk_menu` VALUES ('76', '75', 'Admin', 'Link', 'listorders', '', '1', '0', '友情链接排序', '', '', '0');
INSERT INTO `dk_menu` VALUES ('77', '75', 'Admin', 'Link', 'toggle', '', '1', '0', '友链显示切换', '', '', '0');
INSERT INTO `dk_menu` VALUES ('78', '75', 'Admin', 'Link', 'delete', '', '1', '0', '删除友情链接', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('79', '75', 'Admin', 'Link', 'edit', '', '1', '0', '编辑友情链接', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('80', '79', 'Admin', 'Link', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `dk_menu` VALUES ('81', '75', 'Admin', 'Link', 'add', '', '1', '0', '添加友情链接', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('82', '81', 'Admin', 'Link', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `dk_menu` VALUES ('83', '39', 'Api', 'Oauthadmin', 'setting', '', '1', '1', '第三方登陆', 'leaf', '', '4');
INSERT INTO `dk_menu` VALUES ('84', '83', 'Api', 'Oauthadmin', 'setting_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `dk_menu` VALUES ('85', '0', 'Admin', 'Menu', 'default', '', '1', '1', '菜单管理', 'list', '', '20');
INSERT INTO `dk_menu` VALUES ('86', '85', 'Admin', 'Navcat', 'default1', '', '1', '1', '前台菜单', '', '', '0');
INSERT INTO `dk_menu` VALUES ('87', '86', 'Admin', 'Nav', 'index', '', '1', '1', '菜单管理', '', '', '0');
INSERT INTO `dk_menu` VALUES ('88', '87', 'Admin', 'Nav', 'listorders', '', '1', '0', '前台导航排序', '', '', '0');
INSERT INTO `dk_menu` VALUES ('89', '87', 'Admin', 'Nav', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('90', '87', 'Admin', 'Nav', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('91', '90', 'Admin', 'Nav', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `dk_menu` VALUES ('92', '87', 'Admin', 'Nav', 'add', '', '1', '0', '添加菜单', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('93', '92', 'Admin', 'Nav', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `dk_menu` VALUES ('94', '86', 'Admin', 'Navcat', 'index', '', '1', '1', '菜单分类', '', '', '0');
INSERT INTO `dk_menu` VALUES ('95', '94', 'Admin', 'Navcat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('96', '94', 'Admin', 'Navcat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('97', '96', 'Admin', 'Navcat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `dk_menu` VALUES ('98', '94', 'Admin', 'Navcat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('99', '98', 'Admin', 'Navcat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `dk_menu` VALUES ('100', '85', 'Admin', 'Menu', 'index', '', '1', '1', '后台菜单', '', '', '0');
INSERT INTO `dk_menu` VALUES ('101', '100', 'Admin', 'Menu', 'add', '', '1', '0', '添加菜单', '', '', '0');
INSERT INTO `dk_menu` VALUES ('102', '101', 'Admin', 'Menu', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `dk_menu` VALUES ('103', '100', 'Admin', 'Menu', 'listorders', '', '1', '0', '后台菜单排序', '', '', '0');
INSERT INTO `dk_menu` VALUES ('104', '100', 'Admin', 'Menu', 'export_menu', '', '1', '0', '菜单备份', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('105', '100', 'Admin', 'Menu', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('106', '105', 'Admin', 'Menu', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `dk_menu` VALUES ('107', '100', 'Admin', 'Menu', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('108', '100', 'Admin', 'Menu', 'lists', '', '1', '0', '所有菜单', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('109', '0', 'Admin', 'Setting', 'default', '', '0', '1', '设置', 'cogs', '', '0');
INSERT INTO `dk_menu` VALUES ('110', '109', 'Admin', 'Setting', 'userdefault', '', '0', '1', '个人信息', '', '', '0');
INSERT INTO `dk_menu` VALUES ('111', '110', 'Admin', 'User', 'userinfo', '', '1', '0', '修改信息', '', '', '0');
INSERT INTO `dk_menu` VALUES ('112', '111', 'Admin', 'User', 'userinfo_post', '', '1', '0', '修改信息提交', '', '', '0');
INSERT INTO `dk_menu` VALUES ('113', '110', 'Admin', 'Setting', 'password', '', '1', '1', '修改密码', '', '', '0');
INSERT INTO `dk_menu` VALUES ('114', '113', 'Admin', 'Setting', 'password_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `dk_menu` VALUES ('115', '109', 'Admin', 'Setting', 'site', '', '1', '1', '网站信息', '', '', '0');
INSERT INTO `dk_menu` VALUES ('116', '115', 'Admin', 'Setting', 'site_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `dk_menu` VALUES ('117', '115', 'Admin', 'Route', 'index', '', '1', '0', '路由列表', '', '', '0');
INSERT INTO `dk_menu` VALUES ('118', '115', 'Admin', 'Route', 'add', '', '1', '0', '路由添加', '', '', '0');
INSERT INTO `dk_menu` VALUES ('119', '118', 'Admin', 'Route', 'add_post', '', '1', '0', '路由添加提交', '', '', '0');
INSERT INTO `dk_menu` VALUES ('120', '115', 'Admin', 'Route', 'edit', '', '1', '0', '路由编辑', '', '', '0');
INSERT INTO `dk_menu` VALUES ('121', '120', 'Admin', 'Route', 'edit_post', '', '1', '0', '路由编辑提交', '', '', '0');
INSERT INTO `dk_menu` VALUES ('122', '115', 'Admin', 'Route', 'delete', '', '1', '0', '路由删除', '', '', '0');
INSERT INTO `dk_menu` VALUES ('123', '115', 'Admin', 'Route', 'ban', '', '1', '0', '路由禁止', '', '', '0');
INSERT INTO `dk_menu` VALUES ('124', '115', 'Admin', 'Route', 'open', '', '1', '0', '路由启用', '', '', '0');
INSERT INTO `dk_menu` VALUES ('125', '115', 'Admin', 'Route', 'listorders', '', '1', '0', '路由排序', '', '', '0');
INSERT INTO `dk_menu` VALUES ('126', '109', 'Admin', 'Mailer', 'default', '', '1', '0', '邮箱配置', '', '', '0');
INSERT INTO `dk_menu` VALUES ('127', '126', 'Admin', 'Mailer', 'index', '', '1', '1', 'SMTP配置', '', '', '0');
INSERT INTO `dk_menu` VALUES ('128', '127', 'Admin', 'Mailer', 'index_post', '', '1', '0', '提交配置', '', '', '0');
INSERT INTO `dk_menu` VALUES ('129', '126', 'Admin', 'Mailer', 'active', '', '1', '1', '注册邮件模板', '', '', '0');
INSERT INTO `dk_menu` VALUES ('130', '129', 'Admin', 'Mailer', 'active_post', '', '1', '0', '提交模板', '', '', '0');
INSERT INTO `dk_menu` VALUES ('131', '109', 'Admin', 'Setting', 'clearcache', '', '1', '1', '清除缓存', '', '', '1');
INSERT INTO `dk_menu` VALUES ('132', '0', 'User', 'Indexadmin', 'default', '', '1', '1', '用户管理', 'group', '', '10');
INSERT INTO `dk_menu` VALUES ('133', '132', 'User', 'Indexadmin', 'default1', '', '1', '0', '用户组', '', '', '0');
INSERT INTO `dk_menu` VALUES ('134', '133', 'User', 'Indexadmin', 'index', '', '1', '1', '本站用户', 'leaf', '', '0');
INSERT INTO `dk_menu` VALUES ('135', '134', 'User', 'Indexadmin', 'ban', '', '1', '0', '拉黑会员', '', '', '0');
INSERT INTO `dk_menu` VALUES ('136', '134', 'User', 'Indexadmin', 'cancelban', '', '1', '0', '启用会员', '', '', '0');
INSERT INTO `dk_menu` VALUES ('137', '133', 'User', 'Oauthadmin', 'index', '', '1', '1', '第三方用户', 'leaf', '', '0');
INSERT INTO `dk_menu` VALUES ('138', '137', 'User', 'Oauthadmin', 'delete', '', '1', '0', '第三方用户解绑', '', '', '0');
INSERT INTO `dk_menu` VALUES ('139', '132', 'User', 'Indexadmin', 'default3', '', '1', '1', '管理组', '', '', '0');
INSERT INTO `dk_menu` VALUES ('140', '139', 'Admin', 'Rbac', 'index', '', '1', '1', '角色管理', '', '', '0');
INSERT INTO `dk_menu` VALUES ('141', '140', 'Admin', 'Rbac', 'member', '', '1', '0', '成员管理', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('142', '140', 'Admin', 'Rbac', 'authorize', '', '1', '0', '权限设置', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('143', '142', 'Admin', 'Rbac', 'authorize_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `dk_menu` VALUES ('144', '140', 'Admin', 'Rbac', 'roleedit', '', '1', '0', '编辑角色', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('145', '144', 'Admin', 'Rbac', 'roleedit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `dk_menu` VALUES ('146', '140', 'Admin', 'Rbac', 'roledelete', '', '1', '1', '删除角色', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('147', '140', 'Admin', 'Rbac', 'roleadd', '', '1', '1', '添加角色', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('148', '147', 'Admin', 'Rbac', 'roleadd_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `dk_menu` VALUES ('149', '139', 'Admin', 'User', 'index', '', '1', '1', '管理员', '', '', '0');
INSERT INTO `dk_menu` VALUES ('150', '149', 'Admin', 'User', 'delete', '', '1', '0', '删除管理员', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('151', '149', 'Admin', 'User', 'edit', '', '1', '0', '管理员编辑', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('152', '151', 'Admin', 'User', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `dk_menu` VALUES ('153', '149', 'Admin', 'User', 'add', '', '1', '0', '管理员添加', '', '', '1000');
INSERT INTO `dk_menu` VALUES ('154', '153', 'Admin', 'User', 'add_post', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `dk_menu` VALUES ('155', '47', 'Admin', 'Plugin', 'update', '', '1', '0', '插件更新', '', '', '0');
INSERT INTO `dk_menu` VALUES ('156', '109', 'Admin', 'Storage', 'index', '', '1', '0', '文件存储', '', '', '0');
INSERT INTO `dk_menu` VALUES ('157', '156', 'Admin', 'Storage', 'setting_post', '', '1', '0', '文件存储设置提交', '', '', '0');
INSERT INTO `dk_menu` VALUES ('158', '54', 'Admin', 'Slide', 'ban', '', '1', '0', '禁用幻灯片', '', '', '0');
INSERT INTO `dk_menu` VALUES ('159', '54', 'Admin', 'Slide', 'cancelban', '', '1', '0', '启用幻灯片', '', '', '0');
INSERT INTO `dk_menu` VALUES ('160', '149', 'Admin', 'User', 'ban', '', '1', '0', '禁用管理员', '', '', '0');
INSERT INTO `dk_menu` VALUES ('161', '149', 'Admin', 'User', 'cancelban', '', '1', '0', '启用管理员', '', '', '0');
INSERT INTO `dk_menu` VALUES ('166', '127', 'Admin', 'Mailer', 'test', '', '1', '0', '测试邮件', '', '', '0');
INSERT INTO `dk_menu` VALUES ('167', '109', 'Admin', 'Setting', 'upload', '', '1', '0', '上传设置', '', '', '0');
INSERT INTO `dk_menu` VALUES ('168', '167', 'Admin', 'Setting', 'upload_post', '', '1', '0', '上传设置提交', '', '', '0');
INSERT INTO `dk_menu` VALUES ('169', '7', 'Portal', 'AdminPost', 'copy', '', '1', '0', '文章批量复制', '', '', '0');
INSERT INTO `dk_menu` VALUES ('174', '100', 'Admin', 'Menu', 'backup_menu', '', '1', '0', '备份菜单', '', '', '0');
INSERT INTO `dk_menu` VALUES ('175', '100', 'Admin', 'Menu', 'export_menu_lang', '', '1', '0', '导出后台菜单多语言包', '', '', '0');
INSERT INTO `dk_menu` VALUES ('176', '100', 'Admin', 'Menu', 'restore_menu', '', '1', '0', '还原菜单', '', '', '0');
INSERT INTO `dk_menu` VALUES ('177', '100', 'Admin', 'Menu', 'getactions', '', '1', '0', '导入新菜单', '', '', '0');
INSERT INTO `dk_menu` VALUES ('187', '0', 'Qianshan', 'defult', 'index', '', '0', '1', '产品管理', '', '', '0');
INSERT INTO `dk_menu` VALUES ('188', '187', 'Qianshan', 'product', 'index', '', '1', '1', '产品管理', '', '', '0');
INSERT INTO `dk_menu` VALUES ('189', '187', 'Qianshan', 'product', 'canshu', '', '1', '0', '用户参数', '', '', '3');
INSERT INTO `dk_menu` VALUES ('190', '187', 'Qianshan', 'product', 'attribute', '', '1', '0', '产品属性', '', '', '1');
INSERT INTO `dk_menu` VALUES ('191', '187', 'Qianshan', 'product', 'user', '', '1', '0', '用户管理', '', '', '2');
INSERT INTO `dk_menu` VALUES ('193', '132', 'Qianshan', 'User', 'managelist', '', '1', '1', '信贷经理', '', '', '0');
INSERT INTO `dk_menu` VALUES ('194', '132', 'Qianshan', 'User', 'userlist', '', '1', '1', '普通用户', '', '', '0');
INSERT INTO `dk_menu` VALUES ('195', '0', 'Daikuan', 'Admin', 'index', '', '0', '0', '通用贷款', '', '', '0');
INSERT INTO `dk_menu` VALUES ('196', '195', 'Daikuan', 'Admin', 'Product', '', '1', '1', '产品管理', '', '', '0');
INSERT INTO `dk_menu` VALUES ('197', '195', 'Daikuan', 'Admin', 'User', '', '1', '1', '用户管理', '', '', '0');

-- ----------------------------
-- Table structure for `dk_nav`
-- ----------------------------
DROP TABLE IF EXISTS `dk_nav`;
CREATE TABLE `dk_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='前台导航表';

-- ----------------------------
-- Records of dk_nav
-- ----------------------------
INSERT INTO `dk_nav` VALUES ('1', '1', '0', '首页', '', 'home', '', '1', '0', '0-1');
INSERT INTO `dk_nav` VALUES ('2', '1', '0', '列表演示', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}', '', '1', '0', '0-2');
INSERT INTO `dk_nav` VALUES ('3', '1', '0', '瀑布流', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"2\";}}', '', '1', '0', '0-3');

-- ----------------------------
-- Table structure for `dk_nav_cat`
-- ----------------------------
DROP TABLE IF EXISTS `dk_nav_cat`;
CREATE TABLE `dk_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='前台导航分类表';

-- ----------------------------
-- Records of dk_nav_cat
-- ----------------------------
INSERT INTO `dk_nav_cat` VALUES ('1', '主导航', '1', '主导航');

-- ----------------------------
-- Table structure for `dk_oauth_user`
-- ----------------------------
DROP TABLE IF EXISTS `dk_oauth_user`;
CREATE TABLE `dk_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表';

-- ----------------------------
-- Records of dk_oauth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `dk_options`
-- ----------------------------
DROP TABLE IF EXISTS `dk_options`;
CREATE TABLE `dk_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='全站配置表';

-- ----------------------------
-- Records of dk_options
-- ----------------------------
INSERT INTO `dk_options` VALUES ('1', 'member_email_active', '{\"title\":\"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.thinkcmf.com\\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}', '1');
INSERT INTO `dk_options` VALUES ('6', 'site_options', '{\"site_name\":\"\\u94b1\\u5c71\\u91d1\\u670d-\\u8bc4\\u4f30\\u7cfb\\u7edf\",\"site_admin_url_password\":\"\",\"site_tpl\":\"qianshan\",\"mobile_tpl_enabled\":\"1\",\"site_adminstyle\":\"flat\",\"site_icp\":\"\",\"site_admin_email\":\"admin@admin.com\",\"site_tongji\":\"\",\"site_copyright\":\"\",\"site_seo_title\":\"\\u94b1\\u5c71\\u91d1\\u670d-\\u8bc4\\u4f30\\u7cfb\\u7edf\",\"site_seo_keywords\":\"\\u94b1\\u5c71\\u91d1\\u670d-\\u8bc4\\u4f30\\u7cfb\\u7edf\",\"site_seo_description\":\"\\u94b1\\u5c71\\u91d1\\u670d-\\u8bc4\\u4f30\\u7cfb\\u7edf\",\"urlmode\":\"0\",\"html_suffix\":\"\",\"comment_time_interval\":\"60\"}', '1');
INSERT INTO `dk_options` VALUES ('7', 'cmf_settings', '{\"banned_usernames\":\"\"}', '1');
INSERT INTO `dk_options` VALUES ('8', 'cdn_settings', '{\"cdn_static_root\":\"\"}', '1');

-- ----------------------------
-- Table structure for `dk_plugins`
-- ----------------------------
DROP TABLE IF EXISTS `dk_plugins`;
CREATE TABLE `dk_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of dk_plugins
-- ----------------------------
INSERT INTO `dk_plugins` VALUES ('1', 'Comment', '系统评论插件', '系统评论插件', '0', '1', '[]', 'comment', '0', 'ThinkCMF', '1.0', '0', '0');
INSERT INTO `dk_plugins` VALUES ('2', 'Demo', '插件演示', '插件演示', '0', '1', '{\"text\":\"hello,ThinkCMF!\",\"password\":\"\",\"select\":\"1\",\"checkbox\":1,\"radio\":\"1\",\"textarea\":\"\\u8fd9\\u91cc\\u662f\\u4f60\\u8981\\u586b\\u5199\\u7684\\u5185\\u5bb9\"}', 'footer', '1', 'ThinkCMF', '1.0', '0', '0');
INSERT INTO `dk_plugins` VALUES ('3', 'Mobileverify', '手机验证码', '手机验证码', '0', '1', '{\"account_sid\":\"\",\"auth_token\":\"\",\"app_id\":\"\",\"template_id\":\"\",\"expire_minute\":\"30\"}', 'send_mobile_verify_code', '1', 'ThinkCMF', '1.0', '0', '0');

-- ----------------------------
-- Table structure for `dk_posts`
-- ----------------------------
DROP TABLE IF EXISTS `dk_posts`;
CREATE TABLE `dk_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post发布日期',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核,3删除',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT '1' COMMENT 'post类型，1文章,2页面',
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Portal文章表';

-- ----------------------------
-- Records of dk_posts
-- ----------------------------

-- ----------------------------
-- Table structure for `dk_role`
-- ----------------------------
DROP TABLE IF EXISTS `dk_role`;
CREATE TABLE `dk_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of dk_role
-- ----------------------------
INSERT INTO `dk_role` VALUES ('1', '超级管理员', '0', '1', '拥有网站最高管理员权限！', '1329633709', '1329633709', '0');

-- ----------------------------
-- Table structure for `dk_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `dk_role_user`;
CREATE TABLE `dk_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of dk_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for `dk_route`
-- ----------------------------
DROP TABLE IF EXISTS `dk_route`;
CREATE TABLE `dk_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='url路由表';

-- ----------------------------
-- Records of dk_route
-- ----------------------------

-- ----------------------------
-- Table structure for `dk_slide`
-- ----------------------------
DROP TABLE IF EXISTS `dk_slide`;
CREATE TABLE `dk_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of dk_slide
-- ----------------------------

-- ----------------------------
-- Table structure for `dk_slide_cat`
-- ----------------------------
DROP TABLE IF EXISTS `dk_slide_cat`;
CREATE TABLE `dk_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表';

-- ----------------------------
-- Records of dk_slide_cat
-- ----------------------------

-- ----------------------------
-- Table structure for `dk_term_relationships`
-- ----------------------------
DROP TABLE IF EXISTS `dk_term_relationships`;
CREATE TABLE `dk_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表';

-- ----------------------------
-- Records of dk_term_relationships
-- ----------------------------

-- ----------------------------
-- Table structure for `dk_terms`
-- ----------------------------
DROP TABLE IF EXISTS `dk_terms`;
CREATE TABLE `dk_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表';

-- ----------------------------
-- Records of dk_terms
-- ----------------------------
INSERT INTO `dk_terms` VALUES ('1', '列表演示', '', 'article', '', '0', '0', '0-1', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `dk_terms` VALUES ('2', '瀑布流', '', 'article', '', '0', '0', '0-2', '', '', '', 'list_masonry', 'article', '0', '1');

-- ----------------------------
-- Table structure for `dk_user_favorites`
-- ----------------------------
DROP TABLE IF EXISTS `dk_user_favorites`;
CREATE TABLE `dk_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

-- ----------------------------
-- Records of dk_user_favorites
-- ----------------------------

-- ----------------------------
-- Table structure for `dk_users`
-- ----------------------------
DROP TABLE IF EXISTS `dk_users`;
CREATE TABLE `dk_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) NOT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) NOT NULL DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date NOT NULL DEFAULT '2000-01-01' COMMENT '生日',
  `signature` varchar(255) NOT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of dk_users
-- ----------------------------
INSERT INTO `dk_users` VALUES ('1', 'admin', '###0cd65a782c32c8200ac911602a225b9f', 'admin', 'admin@admin.com', '', '', '0', '2000-01-01', '', '127.0.0.1', '2017-10-13 10:05:24', '2017-08-15 11:16:45', '', '1', '0', '1', '0', '');
INSERT INTO `dk_users` VALUES ('2', '111111_qq_com', '###463c1d022c9038109f928226deb2b77c', '111111_qq_com', '111111@qq.com', '', '', '0', '2000-01-01', '', '127.0.0.1', '2017-09-25 14:14:23', '2017-09-25 14:14:23', '', '1', '0', '2', '0', '');
INSERT INTO `dk_users` VALUES ('3', '', '###463c1d022c9038109f928226deb2b77c', '', '', '', '', '0', '2000-01-01', '', '127.0.0.1', '2017-10-09 14:30:40', '2017-09-27 10:37:07', '', '1', '0', '3', '0', '13113890911');
INSERT INTO `dk_users` VALUES ('4', '', '###463c1d022c9038109f928226deb2b77c', '', '', '', '', '0', '2000-01-01', '', '127.0.0.1', '2017-09-27 10:41:50', '2017-09-27 10:41:50', '', '1', '0', '3', '0', '13113890912');
INSERT INTO `dk_users` VALUES ('5', '', '###287b0f942807960c71ea583e37431d2c', '', '', '', '', '0', '2000-01-01', '', '127.0.0.1', '2017-09-29 16:55:52', '2017-09-29 16:55:52', '', '1', '0', '2', '0', '13113890914');
INSERT INTO `dk_users` VALUES ('6', '', '###49ce6143bc42f3845e3fd0f731658b31', '', '', '', '', '0', '2000-01-01', '', '127.0.0.1', '2017-09-29 17:06:40', '2017-09-29 17:06:40', '', '1', '0', '2', '0', '12345678901');
