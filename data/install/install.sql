

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `mini_apiconfig`
-- ----------------------------
DROP TABLE IF EXISTS `mini_apiconfig`;
CREATE TABLE `mini_apiconfig` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `key` varchar(255) NOT NULL COMMENT '配置项名称',
  `value` varchar(255) NOT NULL COMMENT '配置项值',
  `description` varchar(255) DEFAULT NULL COMMENT '配置描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mini_apiconfig`
-- ----------------------------
INSERT INTO `mini_apiconfig` VALUES ('1', 'print_apikey', '', 'API密钥');
INSERT INTO `mini_apiconfig` VALUES ('2', 'print_machine_code', '', '打印机终端号');
INSERT INTO `mini_apiconfig` VALUES ('3', 'print_msign', '', '打印机密钥');
INSERT INTO `mini_apiconfig` VALUES ('4', 'print_mobiliphone', '', '终端内部手机号');
INSERT INTO `mini_apiconfig` VALUES ('5', 'print_partner', '', '易连云用户ID');
INSERT INTO `mini_apiconfig` VALUES ('6', 'print_username', '', '易连云用户名');
INSERT INTO `mini_apiconfig` VALUES ('7', 'print_printname', '', '打印机终端名称');
INSERT INTO `mini_apiconfig` VALUES ('8', 'sms_appkey', '', 'Key值');
INSERT INTO `mini_apiconfig` VALUES ('9', 'sms_secret', '', '密钥');
INSERT INTO `mini_apiconfig` VALUES ('10', 'sms_templatecode', '', '模板ID');
INSERT INTO `mini_apiconfig` VALUES ('11', 'sms_signname', '', '签名名称');
INSERT INTO `mini_apiconfig` VALUES ('12', 'alipay_partner', '', '合作身份者ID，签约账号，以2088开头由16位纯数字组成的字符串');
INSERT INTO `mini_apiconfig` VALUES ('13', 'alipay_key', '', ' MD5密钥，安全检验码，由数字和字母组成的32位字符串');
INSERT INTO `mini_apiconfig` VALUES ('14', 'wxpay_appid', '', '微信公众号身份的唯一标识');
INSERT INTO `mini_apiconfig` VALUES ('15', 'wxpay_mchid', '', '受理商ID，身份标识');
INSERT INTO `mini_apiconfig` VALUES ('16', 'wxpay_key', '', '商户支付密钥Key');
INSERT INTO `mini_apiconfig` VALUES ('17', 'wxpay_appsecret', '', 'JSAPI接口中获取openid');
INSERT INTO `mini_apiconfig` VALUES ('18', 'wxpay_token', '', '微信通讯token值');

-- ----------------------------
--  Table structure for `mini_banner`
-- ----------------------------
DROP TABLE IF EXISTS `mini_banner`;
CREATE TABLE `mini_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '' COMMENT '广告名称',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '广告位置描述',
  `position` int(11) NOT NULL COMMENT '广告位置',
  `banner_path` varchar(140) NOT NULL COMMENT '图片地址',
  `link` varchar(140) NOT NULL DEFAULT '' COMMENT '连接地址',
  `level` int(4) NOT NULL DEFAULT '0' COMMENT '优先级',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用 1：正常）',
  `createtime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


-- ----------------------------
--  Table structure for `mini_banner_position`
-- ----------------------------
DROP TABLE IF EXISTS `mini_banner_position`;
CREATE TABLE `mini_banner_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` char(80) NOT NULL,
  `width` char(20) NOT NULL,
  `height` char(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用 1：正常)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mini_banner_position`
-- ----------------------------

INSERT INTO `mini_banner_position` VALUES ('1', '首页banner图', '1000', '450', '1');


-- ----------------------------
--  Table structure for `mini_cart`
-- ----------------------------
DROP TABLE IF EXISTS `mini_cart`;
CREATE TABLE `mini_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `goods_name` varchar(60) NOT NULL,
  `goods_price` decimal(10,2) NOT NULL,
  `goods_spec` varchar(100) DEFAULT NULL COMMENT '商品规格',
  `goods_num` int(11) NOT NULL COMMENT '数量',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- ----------------------------
--  Table structure for `mini_code`
-- ----------------------------
DROP TABLE IF EXISTS `mini_code`;
CREATE TABLE `mini_code` (
  `id` int(60) NOT NULL AUTO_INCREMENT,
  `mobile` char(128) DEFAULT NULL,
  `code` char(30) DEFAULT NULL,
  `yzm_time` int(60) DEFAULT NULL,
  `num` int(60) NOT NULL DEFAULT '0',
  `captcha` char(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



-- ----------------------------
--  Table structure for `mini_comment`
-- ----------------------------
DROP TABLE IF EXISTS `mini_comment`;
CREATE TABLE `mini_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增唯一ID',
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '对应文章ID',
  `author` tinytext NOT NULL COMMENT '评论者',
  `author_email` varchar(100) NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `author_url` varchar(200) NOT NULL DEFAULT '' COMMENT '评论者网址',
  `author_ip` varchar(100) NOT NULL DEFAULT '' COMMENT '评论者IP',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论正文',
  `approved` varchar(20) NOT NULL DEFAULT '1' COMMENT '评论是否被批准',
  `agent` varchar(255) NOT NULL DEFAULT '' COMMENT '评论者的USER AGENT',
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父评论ID',
  `uid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '评论者用户ID（不一定存在）',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`approved`),
  KEY `comment_parent` (`pid`),
  KEY `comment_author_email` (`author_email`(10))
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



-- ----------------------------
--  Table structure for `mini_email_check`
-- ----------------------------
DROP TABLE IF EXISTS `mini_email_check`;
CREATE TABLE `mini_email_check` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `username` char(128) NOT NULL,
  `email` char(128) NOT NULL,
  `passtime` int(128) NOT NULL,
  `token` char(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- ----------------------------
--  Table structure for `mini_key_value`
-- ----------------------------
DROP TABLE IF EXISTS `mini_key_value`;
CREATE TABLE `mini_key_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection` varchar(128) NOT NULL COMMENT '命名集合键和值对',
  `uuid` varchar(128) NOT NULL DEFAULT 'default' COMMENT '系统唯一标识',
  `name` varchar(128) NOT NULL COMMENT '键名',
  `value` longtext NOT NULL COMMENT 'The value.',
  PRIMARY KEY (`id`,`collection`,`uuid`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mini_key_value`
-- ----------------------------

INSERT INTO `mini_key_value` VALUES ('1', 'config.base', 'default', 'web_allow_register', '1');
INSERT INTO `mini_key_value` VALUES ('2', 'config.base', 'default', 'web_site_close', '0');
INSERT INTO `mini_key_value` VALUES ('3', 'config.base', 'default', 'web_site_description', '小微企业电子商城解决方案');
INSERT INTO `mini_key_value` VALUES ('4', 'config.base', 'default', 'web_site_icp', '');
INSERT INTO `mini_key_value` VALUES ('5', 'config.base', 'default', 'web_site_keyword', '小微企业电子商城');
INSERT INTO `mini_key_value` VALUES ('6', 'config.base', 'default', 'web_site_title', '小微企业电子商城');
INSERT INTO `mini_key_value` VALUES ('7', 'config.base', 'default', 'web_allow_ticket', '0');
INSERT INTO `mini_key_value` VALUES ('8', 'indextheme', 'default', 'name', 'demo');


-- ----------------------------
--  Table structure for `mini_links`
-- ----------------------------
DROP TABLE IF EXISTS `mini_links`;
CREATE TABLE `mini_links` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增唯一ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接URL',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '链接标题',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '链接图片',
  `target` varchar(25) NOT NULL DEFAULT '' COMMENT '链接打开方式',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '链接描述',
  `visible` varchar(20) NOT NULL DEFAULT 'Y' COMMENT '是否可见（Y/N）',
  `owner` bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '添加者用户ID',
  `createtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `link_visible` (`visible`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mini_links`
-- ----------------------------

INSERT INTO `mini_links` VALUES ('1', 'http://qasl/cn', '深蓝科技', '', '_blank', 'http://qasl.cn', 'N', '1', '1467343979');

-- ----------------------------
--  Table structure for `mini_menu`
-- ----------------------------
DROP TABLE IF EXISTS `mini_menu`;
CREATE TABLE `mini_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `icon` varchar(50) DEFAULT '' COMMENT '图标',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mini_menu`
-- ----------------------------
INSERT INTO `mini_menu` VALUES ('1', '文章', 'fa fa-fw fa-files-o', '0', '0', '#', '0', '0');
INSERT INTO `mini_menu` VALUES ('2', '交易', 'fa fa-fw fa-exchange', '0', '1', '#', '0', '0');
INSERT INTO `mini_menu` VALUES ('3', '会员', 'fa fa-fw fa-users', '0', '2', '#', '0', '0');
INSERT INTO `mini_menu` VALUES ('4', '设置', 'fa fa-gears', '0', '3', '#', '0', '0');
INSERT INTO `mini_menu` VALUES ('5', '个人', 'fa fa-fw fa-user', '0', '4', '#', '0', '0');
INSERT INTO `mini_menu` VALUES ('32', '所有文章', 'fa fa-fw fa-file', '1', '0', 'post/index', '0', '0');
INSERT INTO `mini_menu` VALUES ('31', '写文章', 'fa fa-fw fa-edit', '1', '1', 'post/add', '0', '0');
INSERT INTO `mini_menu` VALUES ('37', '分类目录', 'fa fa-fw fa-cubes', '1', '2', 'taxonomy/index', '0', '0');
INSERT INTO `mini_menu` VALUES ('38', '订单列表', 'fa fa-money', '2', '0', 'order/index', '0', '0');
INSERT INTO `mini_menu` VALUES ('39', '会员列表', 'fa fa-fw fa-user', '3', '0', 'member/index', '0', '0');
INSERT INTO `mini_menu` VALUES ('40', '添加会员', 'fa fa-fw fa-user-plus', '3', '1', 'member/add', '0', '0');
INSERT INTO `mini_menu` VALUES ('41', '基本设置', 'fa  fa-wrench', '4', '0', 'config/edit', '0', '0');
INSERT INTO `mini_menu` VALUES ('42', '菜单设置', 'fa  fa-navicon ', '4', '1', 'menu/index', '0', '0');
INSERT INTO `mini_menu` VALUES ('43', '个人资料', 'fa fa-user-times', '5', '0', 'user/edit', '0', '0');
INSERT INTO `mini_menu` VALUES ('44', '修改密码', 'fa fa-fw fa-key', '5', '1', 'user/password', '0', '0');
INSERT INTO `mini_menu` VALUES ('48', '插件', 'fa fa-puzzle-piece', '0', '5', '#', '0', '0');
INSERT INTO `mini_menu` VALUES ('49', '广告管理', 'fa  fa-picture-o', '48', '0', 'banner/index', '0', '0');
INSERT INTO `mini_menu` VALUES ('50', '导航设置', 'fa  fa-cog', '4', '2', 'navigation/index', '0', '0');
INSERT INTO `mini_menu` VALUES ('51', '页面', 'fa fa-newspaper-o', '0', '1', '#', '0', '0');
INSERT INTO `mini_menu` VALUES ('52', '所有页面', 'fa fa-fw fa-file', '51', '0', 'page/index', '0', '0');
INSERT INTO `mini_menu` VALUES ('53', '新增页面', 'fa fa-edit (alias)', '51', '1', 'page/add', '0', '0');
INSERT INTO `mini_menu` VALUES ('54', '权限设置', 'fa fa-plug', '4', '0', 'authmanager/index', '0', '0');
INSERT INTO `mini_menu` VALUES ('55', '广告位置', 'fa fa-picture-o', '48', '0', 'banner_position/index', '0', '0');
INSERT INTO `mini_menu` VALUES ('56', '链接管理', 'fa fa-link', '48', '3', 'links/index', '0', '0');
INSERT INTO `mini_menu` VALUES ('59', '登录', '', '0', '0', 'index/index', '1', '0');
INSERT INTO `mini_menu` VALUES ('58', '评论管理', 'fa fa-comment-o', '48', '0', 'comment/index', '0', '0');
INSERT INTO `mini_menu` VALUES ('60', '删除分类', '', '37', '0', 'taxonomyt/setStatus', '1', '0');
INSERT INTO `mini_menu` VALUES ('61', '添加分类目录', '', '37', '0', 'taxonomy/edit', '1', '0');
INSERT INTO `mini_menu` VALUES ('64', '主题设置', 'fa fa-sliders', '4', '5', 'theme/index', '0', '0');
INSERT INTO `mini_menu` VALUES ('65', '微信设置', 'fa fa-plug', '4', '0', 'wx/index', '0', '0');
INSERT INTO `mini_menu` VALUES ('67', '接口设置', 'fa fa-support', '4', '7', 'apiconfig/edit', '0', '0');
INSERT INTO `mini_menu` VALUES ('68', '数据库', 'fa fa-cog', '0', '0', '#', '0', '0');
INSERT INTO `mini_menu` VALUES ('69', '数据库备份', 'fa fa-cog', '68', '0', 'Database/index?type=export', '0', '0');
INSERT INTO `mini_menu` VALUES ('70', '数据库还原', 'fa fa-cog', '68', '0', 'Database/index?type=import', '0', '0');
INSERT INTO `mini_menu` VALUES ('71','系统版本','fa fa-gears','0','7','#','0','0');
INSERT INTO `mini_menu` VALUES ('72','版本检测','fa fa-gears','71','0','Upgrade/index','0','0');
INSERT INTO `mini_menu` VALUES ('73','版本还原','fa fa-gears','71','0','Upgrade/lists','0','0');
-- ----------------------------
--  Table structure for `mini_navigation`
-- ----------------------------
DROP TABLE IF EXISTS `mini_navigation`;
CREATE TABLE `mini_navigation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `icon` varchar(50) DEFAULT '' COMMENT '图标',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mini_navigation`
-- ----------------------------
INSERT INTO `mini_navigation` VALUES ('1', '网站首页', 'fa fa-fw fa-files-o', '0', '0', 'index.php/index/index/index', '0');
INSERT INTO `mini_navigation` VALUES ('2', '公司简介', 'fa fa-fw fa-exchange', '0', '1', 'index.php/index/article/page?name=introduction', '0');
INSERT INTO `mini_navigation` VALUES ('3', '新闻中心', 'fa fa-fw fa-users', '0', '2', 'index.php/index/article/lists?category=dynamic', '0');
INSERT INTO `mini_navigation` VALUES ('4', '产品中心', 'fa fa-gears', '0', '3', 'index.php/index/article/lists?category=specialities', '0');
INSERT INTO `mini_navigation` VALUES ('5', '案例展示', 'fa fa-fw fa-user', '0', '4', 'index.php/index/article/lists?category=case', '0');
INSERT INTO `mini_navigation` VALUES ('6', '招贤纳士', 'fa fa-fw fa-file', '0', '5', 'index.php/index/article/lists?category=job', '0');
INSERT INTO `mini_navigation` VALUES ('7', '联系我们', 'fa fa-fw fa-edit', '0', '6', 'index.php/index/article/page?name=contactus', '0');


-- ----------------------------
--  Table structure for `mini_orders`
-- ----------------------------
DROP TABLE IF EXISTS `mini_orders`;
CREATE TABLE `mini_orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(128) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `order_no` varchar(20) NOT NULL COMMENT '订单号',
  `ticket_no` varchar(30) DEFAULT NULL,
  `post_id` bigint(20) NOT NULL,
  `post_title` text NOT NULL,
  `post_address` text NOT NULL,
  `pay_type` varchar(10) NOT NULL COMMENT '支付方式',
  `send_tel` varchar(11) NOT NULL,
  `send_name` text NOT NULL,
  `price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '商品单价',
  `num` int(11) NOT NULL COMMENT '购买数量',
  `amount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `createtime` int(11) NOT NULL,
  `is_pay` int(11) NOT NULL DEFAULT '0',
  `status` varchar(10) NOT NULL COMMENT '支付状态',
  `memo` varchar(255) DEFAULT NULL COMMENT '订单备注',
  PRIMARY KEY (`id`,`uuid`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



-- ----------------------------
--  Table structure for `mini_orders_status`
-- ----------------------------
DROP TABLE IF EXISTS `mini_orders_status`;
CREATE TABLE `mini_orders_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) NOT NULL,
  `status` varchar(30) NOT NULL,
  `createtime` int(11) NOT NULL,
  `user` varchar(50) DEFAULT NULL,
  `trade_no` varchar(50) DEFAULT NULL COMMENT '支付接口流水号',
  `trade_status` varchar(50) DEFAULT NULL COMMENT '支付接口状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;



-- ----------------------------
--  Table structure for `mini_posts`
-- ----------------------------
DROP TABLE IF EXISTS `mini_posts`;
CREATE TABLE `mini_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增唯一ID',
  `uid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '对应作者ID',
  `uuid` varchar(128) NOT NULL,
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '发布时间',
  `content` longtext NOT NULL COMMENT '正文',
  `title` text NOT NULL COMMENT '标题',
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'publish' COMMENT '文章状态（publish/draft/inherit等）',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open' COMMENT '评论状态（open/closed）',
  `password` varchar(20) NOT NULL DEFAULT '' COMMENT '文章密码',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '文章缩略名',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父文章，主要用于PAGE',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `type` varchar(20) NOT NULL DEFAULT 'post' COMMENT '文章类型（post/page等）',
  `comment` bigint(20) NOT NULL DEFAULT '0' COMMENT '评论总数',
  PRIMARY KEY (`id`),
  KEY `post_name` (`name`(191)),
  KEY `type_status_date` (`type`,`status`,`createtime`,`id`),
  KEY `post_parent` (`pid`),
  KEY `post_author` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mini_posts`
-- ----------------------------
INSERT INTO `mini_posts` VALUES ('1', '1', '607394d6-d3e1-b35e-5a01-75cf22118fc9', '1466737925', '<p>关于我们</p>', '关于我们', '', 'publish', 'open', '', 'about', '1466758544', '0', '0', 'page', '0');
INSERT INTO `mini_posts` VALUES ('3', '1', '2170dd35-9568-328b-1da1-2bdb450480ad', '1466758651', '<p>企业简介<br/></p>', '企业简介', '', 'publish', 'open', '', 'introduction', '1466758651', '1', '0', 'page', '0');
INSERT INTO `mini_posts` VALUES ('4', '1', 'ab4e656f-3cfc-5e2d-639c-4f60192c823a', '1466758770', '<p>公司文化</p>', '公司文化', '', 'publish', 'open', '', 'culture', '1466758770', '1', '0', 'page', '0');
INSERT INTO `mini_posts` VALUES ('5', '1', '6eb418c0-61e8-0f26-b603-e5bec677e567', '1466758843', '<p>品牌战略<br/></p>', '品牌战略', '', 'publish', 'open', '', 'brand', '1466758843', '1', '0', 'page', '0');
INSERT INTO `mini_posts` VALUES ('6', '1', '65db7a13-6b1c-5b00-014c-71d10883b7fc', '1466758905', '<p>产品服务</p>', '产品服务', '', 'publish', 'open', '', 'service', '1466988431', '0', '0', 'page', '0');
INSERT INTO `mini_posts` VALUES ('7', '1', 'cd80d7f1-663e-6b89-c981-ae31857683c7', '1466758970', '<p>服务与支持</p>', '服务与支持', '', 'publish', 'open', '', 'servicesupport', '1466758970', '6', '0', 'page', '0');
INSERT INTO `mini_posts` VALUES ('8', '1', 'c25536ae-e314-6081-9044-433b00e1e50a', '1466759023', '<p>隐私条款</p>', '隐私条款', '', 'publish', 'open', '', 'privacy', '1466759023', '6', '0', 'page', '0');
INSERT INTO `mini_posts` VALUES ('9', '1', 'b797f897-d837-2da3-1676-2cd2e9a81406', '1466759077', '<p>联系我们</p>', '联系我们', '', 'publish', 'open', '', 'contactus', '1466759077', '0', '0', 'page', '0');
-- ----------------------------
--  Table structure for `mini_term_relationships`
-- ----------------------------
DROP TABLE IF EXISTS `mini_term_relationships`;
CREATE TABLE `mini_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '对应文章ID/链接ID',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '对应分类方法ID',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



-- ----------------------------
--  Table structure for `mini_term_taxonomy`
-- ----------------------------
DROP TABLE IF EXISTS `mini_term_taxonomy`;
CREATE TABLE `mini_term_taxonomy` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类方法ID',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类方法(post_tag)',
  `uuid` varchar(128) NOT NULL,
  `taxonomy` varchar(32) NOT NULL DEFAULT '' COMMENT '分类方法(category)',
  `description` longtext NOT NULL,
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '所属父分类方法ID',
  `count` bigint(20) NOT NULL DEFAULT '0' COMMENT '文章数统计',
  PRIMARY KEY (`id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



-- ----------------------------
--  Table structure for `mini_terms`
-- ----------------------------
DROP TABLE IF EXISTS `mini_terms`;
CREATE TABLE `mini_terms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '分类名',
  `slug` varchar(200) NOT NULL DEFAULT '' COMMENT '缩略名',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mini_terms`
-- ----------------------------
INSERT INTO `mini_terms` VALUES ('1', '新闻中心', 'news', '0');
INSERT INTO `mini_terms` VALUES ('2', '产品中心', 'product', '0');
INSERT INTO `mini_terms` VALUES ('3', '案例展示', 'case', '0');
INSERT INTO `mini_terms` VALUES ('4', '招贤纳士', 'job', '0');

-- ----------------------------
--  Table structure for `mini_user_extend`
-- ----------------------------
DROP TABLE IF EXISTS `mini_user_extend`;
CREATE TABLE `mini_user_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` varchar(300) NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';



-- ----------------------------
--  Table structure for `mini_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `mini_user_group`;
CREATE TABLE `mini_user_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为-1禁用',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mini_user_group`
-- ----------------------------

INSERT INTO `mini_user_group` VALUES ('1', 'admin', '1', '测试用户组', '', '1', '');


-- ----------------------------
--  Table structure for `mini_user_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `mini_user_group_access`;
CREATE TABLE `mini_user_group_access` (
  `uid` bigint(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



-- ----------------------------
--  Table structure for `mini_user_rule`
-- ----------------------------
DROP TABLE IF EXISTS `mini_user_rule`;
CREATE TABLE `mini_user_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `mini_users`
-- ----------------------------
DROP TABLE IF EXISTS `mini_users`;
CREATE TABLE `mini_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(128) NOT NULL COMMENT '系统唯一标识符',
  `username` varchar(60) DEFAULT NULL,
  `password` varchar(64) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(11) NOT NULL,
  `regdate` int(10) NOT NULL DEFAULT '0',
  `regip` char(15) NOT NULL DEFAULT '0',
  `salt` varchar(6) NOT NULL DEFAULT '0' COMMENT '加密盐',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1正常，2禁用，-1删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



-- ----------------------------
--  Table structure for `mini_wx_menu`
-- ----------------------------
DROP TABLE IF EXISTS `mini_wx_menu`;
CREATE TABLE `mini_wx_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '菜单名',
  `type` mediumint(2) NOT NULL COMMENT '菜单类型(1跳转，2消息)',
  `url` varchar(225) NOT NULL COMMENT '菜单跳转地址',
  `msg` varchar(1000) NOT NULL COMMENT '回复消息',
  `parent` int(11) NOT NULL DEFAULT '0' COMMENT '父id',
  `key` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;



-- ----------------------------
--  Table structure for `mini_wx_reply`
-- ----------------------------
DROP TABLE IF EXISTS `mini_wx_reply`;
CREATE TABLE `mini_wx_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` mediumint(2) NOT NULL COMMENT '回复类型，1关注回复2消息回复3关键词回复',
  `key` varchar(225) DEFAULT NULL COMMENT '关键词',
  `msg` varchar(1000) DEFAULT NULL COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;




