# Host: localhost  (Version: 5.5.53)
# Date: 2018-03-23 13:26:55
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "os_admin_user"
#

DROP TABLE IF EXISTS `os_admin_user`;
CREATE TABLE `os_admin_user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '管理员用户名',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员密码',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1 启用 0 禁用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

#
# Data for table "os_admin_user"
#

/*!40000 ALTER TABLE `os_admin_user` DISABLE KEYS */;
INSERT INTO `os_admin_user` VALUES (1,'admin','0dfc7612f607db6c17fd99388e9e5f9c',1,'2016-10-18 15:28:37','2018-03-23 13:06:43','127.0.0.1');
/*!40000 ALTER TABLE `os_admin_user` ENABLE KEYS */;

#
# Structure for table "os_article"
#

DROP TABLE IF EXISTS `os_article`;
CREATE TABLE `os_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `cid` smallint(5) unsigned NOT NULL COMMENT '分类ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `introduction` varchar(255) DEFAULT '' COMMENT '简介',
  `content` longtext COMMENT '内容',
  `author` varchar(20) DEFAULT '' COMMENT '作者',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0 待审核  1 审核',
  `reading` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阅读量',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图',
  `photo` text COMMENT '图集',
  `is_top` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶  0 不置顶  1 置顶',
  `is_recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐  0 不推荐  1 推荐',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文章表';

#
# Data for table "os_article"
#

/*!40000 ALTER TABLE `os_article` DISABLE KEYS */;
INSERT INTO `os_article` VALUES (1,1,'测试文章一','','<p>测试内容</p>','admin',1,0,'',NULL,0,0,0,'2017-04-11 14:10:10','2017-04-11 14:09:45');
/*!40000 ALTER TABLE `os_article` ENABLE KEYS */;

#
# Structure for table "os_auth_group"
#

DROP TABLE IF EXISTS `os_auth_group`;
CREATE TABLE `os_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(255) NOT NULL COMMENT '权限规则ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='权限组表';

#
# Data for table "os_auth_group"
#

/*!40000 ALTER TABLE `os_auth_group` DISABLE KEYS */;
INSERT INTO `os_auth_group` VALUES (1,'超级管理组',1,'1,2,3,73,74,5,6,7,8,9,10,11,12,39,40,41,42,43,14,13,20,21,22,23,24,15,25,26,27,28,29,30,16,17,44,45,46,47,48,18,49,50,51,52,53,19,31,32,33,34,35,36,37,54,55,58,59,60,61,62,56,63,64,65,66,67,57,68,69,70,71,72'),(2,'部门管理员',1,''),(3,'单位管理员',1,''),(4,'站点管理员',1,'');
/*!40000 ALTER TABLE `os_auth_group` ENABLE KEYS */;

#
# Structure for table "os_auth_group_access"
#

DROP TABLE IF EXISTS `os_auth_group_access`;
CREATE TABLE `os_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限组规则表';

#
# Data for table "os_auth_group_access"
#

/*!40000 ALTER TABLE `os_auth_group_access` DISABLE KEYS */;
INSERT INTO `os_auth_group_access` VALUES (1,1);
/*!40000 ALTER TABLE `os_auth_group_access` ENABLE KEYS */;

#
# Structure for table "os_auth_rule"
#

DROP TABLE IF EXISTS `os_auth_rule`;
CREATE TABLE `os_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `pid` smallint(5) unsigned NOT NULL COMMENT '父级ID',
  `icon` varchar(50) DEFAULT '' COMMENT '图标',
  `sort` tinyint(4) unsigned NOT NULL COMMENT '排序',
  `condition` char(100) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='规则表';

#
# Data for table "os_auth_rule"
#

/*!40000 ALTER TABLE `os_auth_rule` DISABLE KEYS */;
INSERT INTO `os_auth_rule` VALUES (1,'admin/System/default','系统配置',1,1,0,'fa fa-gears',0,''),(2,'admin/System/siteConfig','站点配置',1,1,1,'',0,''),(3,'admin/System/updateSiteConfig','更新配置',1,1,1,'',0,''),(5,'admin/Menu/default','菜单管理',1,1,0,'fa fa-bars',0,''),(6,'admin/Menu/index','后台菜单',1,1,5,'',0,''),(7,'admin/Menu/add','添加菜单',1,1,6,'',0,''),(8,'admin/Menu/save','保存菜单',1,1,6,'',0,''),(9,'admin/Menu/edit','编辑菜单',1,1,6,'',0,''),(10,'admin/Menu/update','更新菜单',1,1,6,'',0,''),(11,'admin/Menu/delete','删除菜单',1,1,6,'',0,''),(12,'admin/Nav/index','导航管理',1,1,5,'',0,''),(13,'admin/Category/index','栏目管理',1,1,14,'fa fa-sitemap',0,''),(14,'admin/Content/default','内容管理',1,1,0,'fa fa-file-text',0,''),(15,'admin/Article/index','文章管理',1,1,14,'',0,''),(16,'admin/User/default','用户管理',1,1,0,'fa fa-users',0,''),(17,'admin/User/index','普通用户',1,1,16,'',0,''),(18,'admin/AdminUser/index','管理员',1,1,16,'',0,''),(19,'admin/AuthGroup/index','权限组',1,1,16,'',0,''),(20,'admin/Category/add','添加栏目',1,1,13,'',0,''),(21,'admin/Category/save','保存栏目',1,1,13,'',0,''),(22,'admin/Category/edit','编辑栏目',1,1,13,'',0,''),(23,'admin/Category/update','更新栏目',1,1,13,'',0,''),(24,'admin/Category/delete','删除栏目',1,1,13,'',0,''),(25,'admin/Article/add','添加文章',1,1,15,'',0,''),(26,'admin/Article/save','保存文章',1,1,15,'',0,''),(27,'admin/Article/edit','编辑文章',1,1,15,'',0,''),(28,'admin/Article/update','更新文章',1,1,15,'',0,''),(29,'admin/Article/delete','删除文章',1,1,15,'',0,''),(30,'admin/Article/toggle','文章审核',1,1,15,'',0,''),(31,'admin/AuthGroup/add','添加权限组',1,1,19,'',0,''),(32,'admin/AuthGroup/save','保存权限组',1,1,19,'',0,''),(33,'admin/AuthGroup/edit','编辑权限组',1,1,19,'',0,''),(34,'admin/AuthGroup/update','更新权限组',1,1,19,'',0,''),(35,'admin/AuthGroup/delete','删除权限组',1,1,19,'',0,''),(36,'admin/AuthGroup/auth','授权',1,1,19,'',0,''),(37,'admin/AuthGroup/updateAuthGroupRule','更新权限组规则',1,1,19,'',0,''),(39,'admin/Nav/add','添加导航',1,1,12,'',0,''),(40,'admin/Nav/save','保存导航',1,1,12,'',0,''),(41,'admin/Nav/edit','编辑导航',1,1,12,'',0,''),(42,'admin/Nav/update','更新导航',1,1,12,'',0,''),(43,'admin/Nav/delete','删除导航',1,1,12,'',0,''),(44,'admin/User/add','添加用户',1,1,17,'',0,''),(45,'admin/User/save','保存用户',1,1,17,'',0,''),(46,'admin/User/edit','编辑用户',1,1,17,'',0,''),(47,'admin/User/update','更新用户',1,1,17,'',0,''),(48,'admin/User/delete','删除用户',1,1,17,'',0,''),(49,'admin/AdminUser/add','添加管理员',1,1,18,'',0,''),(50,'admin/AdminUser/save','保存管理员',1,1,18,'',0,''),(51,'admin/AdminUser/edit','编辑管理员',1,1,18,'',0,''),(52,'admin/AdminUser/update','更新管理员',1,1,18,'',0,''),(53,'admin/AdminUser/delete','删除管理员',1,1,18,'',0,''),(54,'admin/Slide/default','扩展管理',1,1,0,'fa fa-wrench',0,''),(55,'admin/SlideCategory/index','轮播分类',1,1,54,'',0,''),(56,'admin/Slide/index','轮播图管理',1,1,54,'',0,''),(57,'admin/Link/index','友情链接',1,1,54,'fa fa-link',0,''),(58,'admin/SlideCategory/add','添加分类',1,1,55,'',0,''),(59,'admin/SlideCategory/save','保存分类',1,1,55,'',0,''),(60,'admin/SlideCategory/edit','编辑分类',1,1,55,'',0,''),(61,'admin/SlideCategory/update','更新分类',1,1,55,'',0,''),(62,'admin/SlideCategory/delete','删除分类',1,1,55,'',0,''),(63,'admin/Slide/add','添加轮播',1,1,56,'',0,''),(64,'admin/Slide/save','保存轮播',1,1,56,'',0,''),(65,'admin/Slide/edit','编辑轮播',1,1,56,'',0,''),(66,'admin/Slide/update','更新轮播',1,1,56,'',0,''),(67,'admin/Slide/delete','删除轮播',1,1,56,'',0,''),(68,'admin/Link/add','添加链接',1,1,57,'',0,''),(69,'admin/Link/save','保存链接',1,1,57,'',0,''),(70,'admin/Link/edit','编辑链接',1,1,57,'',0,''),(71,'admin/Link/update','更新链接',1,1,57,'',0,''),(72,'admin/Link/delete','删除链接',1,1,57,'',0,''),(73,'admin/ChangePassword/index','修改密码',1,1,1,'',0,''),(74,'admin/ChangePassword/updatePassword','更新密码',1,1,1,'',0,'');
/*!40000 ALTER TABLE `os_auth_rule` ENABLE KEYS */;

#
# Structure for table "os_category"
#

DROP TABLE IF EXISTS `os_category`;
CREATE TABLE `os_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `alias` varchar(50) DEFAULT '' COMMENT '导航别名',
  `content` longtext COMMENT '分类内容',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图',
  `icon` varchar(20) DEFAULT '' COMMENT '分类图标',
  `list_template` varchar(50) DEFAULT '' COMMENT '分类列表模板',
  `detail_template` varchar(50) DEFAULT '' COMMENT '分类详情模板',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '分类类型  1  列表  2 单页',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `path` varchar(255) DEFAULT '' COMMENT '路径',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='分类表';

#
# Data for table "os_category"
#

/*!40000 ALTER TABLE `os_category` DISABLE KEYS */;
INSERT INTO `os_category` VALUES (1,'分类一','','','','','','',1,0,0,'0,','2016-12-22 18:22:24');
/*!40000 ALTER TABLE `os_category` ENABLE KEYS */;

#
# Structure for table "os_link"
#

DROP TABLE IF EXISTS `os_link`;
CREATE TABLE `os_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '链接名称',
  `link` varchar(255) DEFAULT '' COMMENT '链接地址',
  `image` varchar(255) DEFAULT '' COMMENT '链接图片',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1 显示  2 隐藏',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='友情链接表';

#
# Data for table "os_link"
#

/*!40000 ALTER TABLE `os_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `os_link` ENABLE KEYS */;

#
# Structure for table "os_nav"
#

DROP TABLE IF EXISTS `os_nav`;
CREATE TABLE `os_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL COMMENT '父ID',
  `name` varchar(20) NOT NULL COMMENT '导航名称',
  `alias` varchar(20) DEFAULT '' COMMENT '导航别称',
  `link` varchar(255) DEFAULT '' COMMENT '导航链接',
  `icon` varchar(255) DEFAULT '' COMMENT '导航图标',
  `target` varchar(10) DEFAULT '' COMMENT '打开方式',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态  0 隐藏  1 显示',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='导航表';

#
# Data for table "os_nav"
#

/*!40000 ALTER TABLE `os_nav` DISABLE KEYS */;
/*!40000 ALTER TABLE `os_nav` ENABLE KEYS */;

#
# Structure for table "os_slide"
#

DROP TABLE IF EXISTS `os_slide`;
CREATE TABLE `os_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `name` varchar(50) NOT NULL COMMENT '轮播图名称',
  `description` varchar(255) DEFAULT '' COMMENT '说明',
  `link` varchar(255) DEFAULT '' COMMENT '链接',
  `target` varchar(10) DEFAULT '' COMMENT '打开方式',
  `image` varchar(255) DEFAULT '' COMMENT '轮播图片',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态  1 显示  0  隐藏',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='轮播图表';

#
# Data for table "os_slide"
#

/*!40000 ALTER TABLE `os_slide` DISABLE KEYS */;
/*!40000 ALTER TABLE `os_slide` ENABLE KEYS */;

#
# Structure for table "os_slide_category"
#

DROP TABLE IF EXISTS `os_slide_category`;
CREATE TABLE `os_slide_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '轮播图分类',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='轮播图分类表';

#
# Data for table "os_slide_category"
#

/*!40000 ALTER TABLE `os_slide_category` DISABLE KEYS */;
INSERT INTO `os_slide_category` VALUES (1,'首页轮播');
/*!40000 ALTER TABLE `os_slide_category` ENABLE KEYS */;

#
# Structure for table "os_system"
#

DROP TABLE IF EXISTS `os_system`;
CREATE TABLE `os_system` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '配置项名称',
  `value` text NOT NULL COMMENT '配置项值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

#
# Data for table "os_system"
#

/*!40000 ALTER TABLE `os_system` DISABLE KEYS */;
INSERT INTO `os_system` VALUES (1,'site_config','a:7:{s:10:\"site_title\";s:30:\"Think Admin 后台管理系统\";s:9:\"seo_title\";s:0:\"\";s:11:\"seo_keyword\";s:0:\"\";s:15:\"seo_description\";s:0:\"\";s:14:\"site_copyright\";s:0:\"\";s:8:\"site_icp\";s:0:\"\";s:11:\"site_tongji\";s:0:\"\";}');
/*!40000 ALTER TABLE `os_system` ENABLE KEYS */;

#
# Structure for table "os_user"
#

DROP TABLE IF EXISTS `os_user`;
CREATE TABLE `os_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态  1 正常  2 禁止',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `last_login_ip` varchar(50) DEFAULT '' COMMENT '最后登录IP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表';

#
# Data for table "os_user"
#

/*!40000 ALTER TABLE `os_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `os_user` ENABLE KEYS */;
