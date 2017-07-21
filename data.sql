/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : ybcb

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-05-31 17:29:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `mini_apiconfig`
-- ----------------------------
DROP TABLE IF EXISTS `mini_apiconfig`;
CREATE TABLE `mini_apiconfig` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `key` varchar(255) NOT NULL COMMENT '配置项名称',
  `value` varchar(255) NOT NULL COMMENT '配置项值',
  `description` varchar(255) NOT NULL COMMENT '配置描述',
  `type` varchar(5) NOT NULL DEFAULT '0' COMMENT '配置类型1:数字，2:字符，3:枚举，4:图片',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置项',
  `group` varchar(5) NOT NULL DEFAULT '0' COMMENT '配置分组0:用户，1:系统，2:基本，3:内容，4:备用,5:备用，6:小票打印机接口，7:短信接口，8:支付宝接口，9:微信接口，10:百度地图接口，11:QQ邮箱接口',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `status` decimal(8,0) NOT NULL DEFAULT '1' COMMENT '状态1可见2隐藏',
  `sort` decimal(8,0) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_apiconfig
-- ----------------------------
INSERT INTO `mini_apiconfig` VALUES ('1', 'print_apikey', '', 'API密钥', '0', '', '', '6', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('2', 'print_machine_code', '', '打印机终端号', '0', '', '', '6', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('3', 'print_msign', '', '打印机密钥', '0', '', '', '6', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('4', 'print_mobiliphone', '', '终端内部手机号', '0', '', '', '6', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('5', 'print_partner', '581', '易连云用户ID', '0', '', '', '6', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('6', 'print_username', '', '易连云用户名', '0', '', '', '6', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('7', 'print_printname', '', '打印机终端名称', '0', '', '', '6', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('8', 'sms_appkey', '', 'Key值', '0', '', '', '7', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('9', 'sms_appsecret', '', '密钥', '0', '', '', '7', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('10', 'sms_template_code', '', '模板ID', '0', '', '', '7', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('11', 'sms_signname', '', '签名名称', '0', '', '', '7', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('12', 'alipay_partner', '', '合作身份者ID，签约账号，以2088开头由16位纯数字组成的字符串', '0', '', '', '8', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('13', 'alipay_appkey', '', ' MD5密钥，安全检验码，由数字和字母组成的32位字符串', '0', '', '', '8', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('14', 'wechat_appid', '', '微信公众号身份的唯一标识', '0', '', '', '9', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('15', 'wechat_mchid', '', '受理商ID，身份标识', '0', '', '', '9', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('16', 'wechat_appkey', '', '商户支付密钥Key', '0', '', '', '9', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('17', 'wechat_appsecret', '', 'JSAPI接口中获取openid', '0', '', '', '9', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('18', 'wechat_token', '', '微信通讯token值', '0', '', '', '9', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('19', 'baidu_map_ak', '', '百度地图秘钥(ak)', '0', '', '', '10', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('20', 'baidu_map_lon', '', '中心点经度', '0', '', '', '10', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('21', 'baidu_map_lat', '', '中心点纬度', '0', '', '', '10', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('22', 'mail_address', '', '邮件发送地址', '0', '', '', '11', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('23', 'mail_loginname', '', '邮箱登陆账号', '0', '', '', '11', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('24', 'mail_password', '', '邮箱授权码', '0', '', '', '11', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('26', 'web_site_description', '钢板,钢材,彩钢板,彩涂板,河北彩钢板,河北彩涂板,迁安彩钢板,迁安彩涂板,彦博,迁安彦博,河北彦博,河北彦博彩涂板业有限公司', '网站搜索引擎描述', '2', '网站描述', '', '0', '', '1', '3');
INSERT INTO `mini_apiconfig` VALUES ('27', 'web_site_keyword', '钢板,钢材,彩钢板,彩涂板,河北彩钢板,河北彩涂板,迁安彩钢板,迁安彩涂板,彦博,迁安彦博,河北彦博,河北彦博彩涂板业有限公司', '网站搜索引擎关键字', '2', '网站关键字', '', '0', '', '1', '2');
INSERT INTO `mini_apiconfig` VALUES ('52', 'web_site_title', '河北彦博彩涂板业有限公司', '网站标题前台显示标题', '2', '小微云商', '', '0', '', '1', '1');
INSERT INTO `mini_apiconfig` VALUES ('53', 'web_site_icp', '冀ICP备12014292号-2', '设置在网站底部显示的备案号', '2', '网站备案号', '', '0', '', '1', '4');
INSERT INTO `mini_apiconfig` VALUES ('54', 'web_site_wx', '/uploads/picture/20161229/9674d2050adfef60a5f0a87b9e9a011b.png', '微信扫一扫', '4', '微信扫一扫', '', '0', '', '1', '5');
INSERT INTO `mini_apiconfig` VALUES ('55', 'web_site_tel', '0', '联系手机号', '1', '手机', '', '0', '', '1', '6');
INSERT INTO `mini_apiconfig` VALUES ('56', 'web_site_fax', '03157273913', '联系传真', '1', '传真', '', '0', '', '1', '7');
INSERT INTO `mini_apiconfig` VALUES ('59', 'web_site_close', '0', '网站关闭，任何人无法从互联网访问此网站', '3', '网站开启与关闭', '开启|关闭', '0', '', '1', '8');
INSERT INTO `mini_apiconfig` VALUES ('60', 'web_print_times', '0', '小票打印机次数', '3', '小票打印机打印次数', '一次|两次|三次|四次|五次', '0', '', '1', '10');
INSERT INTO `mini_apiconfig` VALUES ('61', 'web_allow_ticket', '0', '开启小票打印机，后台配置接口即可打印', '3', '是否开启小票打印机', '关闭|开启', '0', '', '1', '9');
INSERT INTO `mini_apiconfig` VALUES ('62', 'pingxx_api_key', '', 'ping++支付秘钥', '0', '', '', '12', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('63', 'pingxx_app_id', '', 'ping++AppId', '0', '', '', '12', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('64', 'pingxx_client_ip', '', '服务器IP', '0', '', '', '12', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('65', 'wx_app_id', '', '微信登录AppId', '0', '', '', '12', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('66', 'wx_app_secret', '', '微信登录秘钥', '0', '', '', '12', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('67', 'qq_app_key', '', 'QQ登录key', '0', '', '', '12', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('68', 'qq_app_secret', '', 'QQ登录秘钥', '0', '', '', '12', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('69', 'sina_app_key', '', '新浪登录key', '0', '', '', '12', '', '0', '0');
INSERT INTO `mini_apiconfig` VALUES ('70', 'sina_app_secret', '', '新浪登录秘钥', '0', '', '', '12', '', '0', '0');

-- ----------------------------
-- Table structure for `mini_banner`
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
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态（2：禁用 1：正常）',
  `createtime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of mini_banner
-- ----------------------------
INSERT INTO `mini_banner` VALUES ('1', 'banner图1', 'banner图1', '1', '/uploads/picture/20161206/f35076869e060e67c3ba2e5976f1b160.png', '#', '0', '1', '1474862526', '0');
INSERT INTO `mini_banner` VALUES ('2', 'banner图2', 'banner图2', '1', '/uploads/picture/20161206/cc4f215bece9b8fa9eebbe83bbb75960.png', '#', '0', '1', '1474862717', '0');
INSERT INTO `mini_banner` VALUES ('3', 'banner图3', 'banner图3', '1', '/uploads/picture/20161206/d4d9d5d1735c2c55dff4c77dc4e76d68.png', '#', '0', '1', '1474862753', '0');
INSERT INTO `mini_banner` VALUES ('5', '首页广告图', '首页广告图', '3', '/uploads/picture/20161209/d08256b4d28db935eabe9012c7fe78a7.png', '#', '0', '1', '1478664585', '0');
INSERT INTO `mini_banner` VALUES ('6', '单页广告', '单页广告', '4', '/uploads/picture/20161223/bc7d829ba8c3e1d73a29bf7f00696e31.jpg', '#', '0', '1', '1482475484', '0');

-- ----------------------------
-- Table structure for `mini_banner_position`
-- ----------------------------
DROP TABLE IF EXISTS `mini_banner_position`;
CREATE TABLE `mini_banner_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` char(80) NOT NULL,
  `width` char(20) NOT NULL,
  `height` char(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用 1：正常)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_banner_position
-- ----------------------------
INSERT INTO `mini_banner_position` VALUES ('1', 'pc首页banner图', '1200', '300', '1');
INSERT INTO `mini_banner_position` VALUES ('2', '商品页推荐', '200', '260', '1');
INSERT INTO `mini_banner_position` VALUES ('3', 'wap首页焦点图', '', '', '1');
INSERT INTO `mini_banner_position` VALUES ('4', 'pc端单页广告', '1200', '140', '1');

-- ----------------------------
-- Table structure for `mini_cart`
-- ----------------------------
DROP TABLE IF EXISTS `mini_cart`;
CREATE TABLE `mini_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `createtime` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1：正常，2：已购买',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_cart
-- ----------------------------
INSERT INTO `mini_cart` VALUES ('2', '3', '1', '1', '1478593753', '1');
INSERT INTO `mini_cart` VALUES ('3', '3', '5', '2', '1478595020', '1');
INSERT INTO `mini_cart` VALUES ('4', '2', '3', '1', '1478596776', '2');
INSERT INTO `mini_cart` VALUES ('5', '3', '2', '1', '1478614451', '1');
INSERT INTO `mini_cart` VALUES ('6', '13', '5', '2', '1478614564', '1');
INSERT INTO `mini_cart` VALUES ('8', '15', '3', '1', '1478659235', '2');
INSERT INTO `mini_cart` VALUES ('9', '1', '3', '2', '1478659592', '2');
INSERT INTO `mini_cart` VALUES ('10', '15', '3', '2', '1478661479', '2');
INSERT INTO `mini_cart` VALUES ('11', '17', '3', '1', '1478662257', '2');
INSERT INTO `mini_cart` VALUES ('12', '4', '3', '2', '1478663223', '2');
INSERT INTO `mini_cart` VALUES ('13', '4', '3', '1', '1478670712', '2');
INSERT INTO `mini_cart` VALUES ('14', '7', '3', '1', '1478743399', '1');
INSERT INTO `mini_cart` VALUES ('15', '7', '29', '2', '1478830808', '1');
INSERT INTO `mini_cart` VALUES ('17', '2', '27', '1', '1479085360', '1');
INSERT INTO `mini_cart` VALUES ('18', '25', '26', '1', '1479085436', '1');
INSERT INTO `mini_cart` VALUES ('19', '7', '27', '1', '1479085474', '1');
INSERT INTO `mini_cart` VALUES ('20', '7', '28', '1', '1479260511', '2');
INSERT INTO `mini_cart` VALUES ('21', '28', '29', '3', '1480004568', '1');
INSERT INTO `mini_cart` VALUES ('22', '17', '29', '2', '1480563324', '1');
INSERT INTO `mini_cart` VALUES ('24', '17', '28', '1', '1480582765', '2');
INSERT INTO `mini_cart` VALUES ('30', '1', '37', '9', '1482389386', '2');
INSERT INTO `mini_cart` VALUES ('32', '29', '37', '2', '1482393339', '2');
INSERT INTO `mini_cart` VALUES ('34', '1', '37', '1', '1482395461', '2');
INSERT INTO `mini_cart` VALUES ('35', '1', '37', '1', '1482395653', '2');
INSERT INTO `mini_cart` VALUES ('36', '1', '37', '1', '1482395757', '2');
INSERT INTO `mini_cart` VALUES ('37', '1', '37', '2', '1482395834', '2');
INSERT INTO `mini_cart` VALUES ('38', '1', '37', '1', '1482396045', '2');
INSERT INTO `mini_cart` VALUES ('39', '1', '37', '1', '1482396146', '2');
INSERT INTO `mini_cart` VALUES ('40', '1', '37', '1', '1482396349', '2');
INSERT INTO `mini_cart` VALUES ('41', '29', '39', '2', '1482396474', '1');
INSERT INTO `mini_cart` VALUES ('42', '29', '37', '1', '1482396533', '2');
INSERT INTO `mini_cart` VALUES ('43', '1', '37', '1', '1482398609', '2');
INSERT INTO `mini_cart` VALUES ('44', '1', '37', '1', '1482398894', '2');
INSERT INTO `mini_cart` VALUES ('45', '1', '37', '1', '1482399041', '2');
INSERT INTO `mini_cart` VALUES ('46', '1', '37', '1', '1482399157', '2');
INSERT INTO `mini_cart` VALUES ('47', '1', '37', '1', '1482399300', '2');
INSERT INTO `mini_cart` VALUES ('48', '1', '41', '1', '1482399300', '2');
INSERT INTO `mini_cart` VALUES ('49', '1', '37', '1', '1482399401', '2');
INSERT INTO `mini_cart` VALUES ('50', '1', '37', '1', '1482399680', '2');
INSERT INTO `mini_cart` VALUES ('51', '1', '37', '1', '1482399778', '2');
INSERT INTO `mini_cart` VALUES ('52', '1', '37', '1', '1482400107', '2');
INSERT INTO `mini_cart` VALUES ('53', '1', '37', '1', '1482401276', '2');
INSERT INTO `mini_cart` VALUES ('54', '1', '37', '1', '1482401596', '2');
INSERT INTO `mini_cart` VALUES ('55', '1', '37', '3', '1482402468', '1');
INSERT INTO `mini_cart` VALUES ('56', '1', '45', '3', '1482561329', '2');
INSERT INTO `mini_cart` VALUES ('57', '1', '45', '1', '1482561685', '2');
INSERT INTO `mini_cart` VALUES ('58', '1', '45', '1', '1482561848', '2');
INSERT INTO `mini_cart` VALUES ('59', '1', '45', '1', '1482561916', '2');
INSERT INTO `mini_cart` VALUES ('60', '1', '45', '1', '1482562249', '2');
INSERT INTO `mini_cart` VALUES ('61', '1', '45', '1', '1482562447', '2');
INSERT INTO `mini_cart` VALUES ('62', '1', '45', '1', '1482562500', '2');
INSERT INTO `mini_cart` VALUES ('63', '1', '45', '1', '1482562620', '2');
INSERT INTO `mini_cart` VALUES ('64', '1', '45', '1', '1482562815', '2');
INSERT INTO `mini_cart` VALUES ('65', '1', '45', '1', '1482565146', '2');
INSERT INTO `mini_cart` VALUES ('66', '1', '45', '1', '1482565257', '2');
INSERT INTO `mini_cart` VALUES ('67', '1', '45', '1', '1482565399', '2');
INSERT INTO `mini_cart` VALUES ('68', '1', '45', '1', '1482565643', '2');
INSERT INTO `mini_cart` VALUES ('69', '1', '45', '1', '1482565782', '2');
INSERT INTO `mini_cart` VALUES ('70', '1', '45', '3', '1482566026', '2');
INSERT INTO `mini_cart` VALUES ('71', '1', '45', '1', '1482568534', '2');
INSERT INTO `mini_cart` VALUES ('72', '1', '45', '1', '1482569703', '2');
INSERT INTO `mini_cart` VALUES ('73', '1', '45', '1', '1482569999', '2');
INSERT INTO `mini_cart` VALUES ('74', '1', '45', '1', '1482570602', '2');
INSERT INTO `mini_cart` VALUES ('75', '1', '45', '1', '1482570705', '2');
INSERT INTO `mini_cart` VALUES ('76', '1', '45', '1', '1482570993', '2');
INSERT INTO `mini_cart` VALUES ('77', '1', '45', '1', '1482571030', '2');
INSERT INTO `mini_cart` VALUES ('78', '1', '45', '1', '1482571224', '2');
INSERT INTO `mini_cart` VALUES ('79', '1', '45', '1', '1482571408', '2');
INSERT INTO `mini_cart` VALUES ('110', '1', '45', '2', '1482827903', '1');
INSERT INTO `mini_cart` VALUES ('111', '1', '44', '1', '1482827903', '1');
INSERT INTO `mini_cart` VALUES ('112', '1', '46', '6', '1482827937', '1');
INSERT INTO `mini_cart` VALUES ('113', '1', '47', '5', '1482828001', '1');
INSERT INTO `mini_cart` VALUES ('114', '1', '42', '1', '1482975479', '1');

-- ----------------------------
-- Table structure for `mini_code`
-- ----------------------------
DROP TABLE IF EXISTS `mini_code`;
CREATE TABLE `mini_code` (
  `id` int(60) NOT NULL AUTO_INCREMENT,
  `mobile` char(128) DEFAULT NULL,
  `code` char(30) DEFAULT NULL,
  `yzm_time` int(60) DEFAULT NULL,
  `num` int(60) NOT NULL DEFAULT '0',
  `captcha` char(30) NOT NULL,
  `date` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_code
-- ----------------------------

-- ----------------------------
-- Table structure for `mini_email_check`
-- ----------------------------
DROP TABLE IF EXISTS `mini_email_check`;
CREATE TABLE `mini_email_check` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `username` char(128) NOT NULL,
  `email` char(128) NOT NULL,
  `passtime` int(128) NOT NULL,
  `token` char(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_email_check
-- ----------------------------

-- ----------------------------
-- Table structure for `mini_goods`
-- ----------------------------
DROP TABLE IF EXISTS `mini_goods`;
CREATE TABLE `mini_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `num` int(11) NOT NULL COMMENT '商品库存数量',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `description` text NOT NULL COMMENT '商品描述',
  `standard` varchar(255) NOT NULL COMMENT '规格型号',
  `cover_path` varchar(255) NOT NULL COMMENT '封面图',
  `photo_path_1` varchar(255) DEFAULT NULL,
  `photo_path_2` varchar(255) DEFAULT NULL,
  `photo_path_3` varchar(255) DEFAULT NULL,
  `content` text NOT NULL COMMENT '商品详情',
  `click_count` int(11) NOT NULL DEFAULT '0' COMMENT '商品点击数',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:上架，2：下架',
  `is_best` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为精品',
  `is_new` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为新品',
  `is_hot` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为热销',
  `sell_num` int(11) NOT NULL DEFAULT '0' COMMENT '已经出售的数量',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `score_num` tinyint(2) NOT NULL DEFAULT '1' COMMENT '平均评分',
  `score` int(11) DEFAULT NULL COMMENT '积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `mini_goods_cate`
-- ----------------------------
DROP TABLE IF EXISTS `mini_goods_cate`;
CREATE TABLE `mini_goods_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '分类名',
  `slug` varchar(200) NOT NULL COMMENT '缩略名',
  `cover_path` varchar(200) NOT NULL COMMENT '分类封面图',
  `pid` int(11) NOT NULL DEFAULT '0',
  `page_num` int(11) NOT NULL COMMENT '每页显示商品数量',
  `lists_tpl` varchar(200) NOT NULL COMMENT '列表页模板',
  `detail_tpl` varchar(200) NOT NULL COMMENT '详情页模板',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:启用，2：禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_goods_cate
-- ----------------------------

-- ----------------------------
-- Table structure for `mini_goods_cate_relationships`
-- ----------------------------
DROP TABLE IF EXISTS `mini_goods_cate_relationships`;
CREATE TABLE `mini_goods_cate_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `cate_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_goods_cate_relationships
-- ----------------------------

-- ----------------------------
-- Table structure for `mini_goods_collection`
-- ----------------------------
DROP TABLE IF EXISTS `mini_goods_collection`;
CREATE TABLE `mini_goods_collection` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT NULL COMMENT '用户id',
  `goods_id` int(10) DEFAULT NULL COMMENT '商品id',
  `createtime` varchar(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_goods_collection
-- ----------------------------

-- ----------------------------
-- Table structure for `mini_goods_comment`
-- ----------------------------
DROP TABLE IF EXISTS `mini_goods_comment`;
CREATE TABLE `mini_goods_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增唯一ID',
  `uid` int(20) DEFAULT NULL,
  `goods_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '对应文章ID',
  `order_id` varchar(20) DEFAULT NULL COMMENT '订单号',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论正文',
  `approved` varchar(20) NOT NULL DEFAULT '0' COMMENT '审核 0-待审核  1-已审核',
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父评论ID',
  `score` int(2) DEFAULT NULL COMMENT '商品评分',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 -1-删除  1-正常',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`goods_id`),
  KEY `comment_approved_date_gmt` (`approved`),
  KEY `comment_parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_goods_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `mini_guestbook`
-- ----------------------------
DROP TABLE IF EXISTS `mini_guestbook`;
CREATE TABLE `mini_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `sex` varchar(4) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` longtext,
  `reply` longtext,
  `ip` varchar(50) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_guestbook
-- ----------------------------

-- ----------------------------
-- Table structure for `mini_key_value`
-- ----------------------------
DROP TABLE IF EXISTS `mini_key_value`;
CREATE TABLE `mini_key_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection` varchar(128) NOT NULL COMMENT '命名集合键和值对',
  `uuid` varchar(128) NOT NULL DEFAULT 'default' COMMENT '系统唯一标识',
  `name` varchar(128) NOT NULL COMMENT '键名',
  `value` longtext NOT NULL COMMENT 'The value.',
  PRIMARY KEY (`id`,`collection`,`uuid`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_key_value
-- ----------------------------
INSERT INTO `mini_key_value` VALUES ('1', 'config.base', 'default', 'web_allow_register', '1');
INSERT INTO `mini_key_value` VALUES ('2', 'config.base', 'default', 'web_site_close', '0');
INSERT INTO `mini_key_value` VALUES ('3', 'config.base', 'default', 'web_site_description', '小微企业电子商城');
INSERT INTO `mini_key_value` VALUES ('4', 'config.base', 'default', 'web_site_icp', '冀ICP备XXXXXXX');
INSERT INTO `mini_key_value` VALUES ('5', 'config.base', 'default', 'web_site_keyword', '小微，云商，商城，官网');
INSERT INTO `mini_key_value` VALUES ('6', 'config.base', 'default', 'web_site_title', '小微云商');
INSERT INTO `mini_key_value` VALUES ('7', 'config.base', 'default', 'web_allow_ticket', '0');
INSERT INTO `mini_key_value` VALUES ('8', 'indextheme', 'default', 'name', 'default');
INSERT INTO `mini_key_value` VALUES ('49', 'users', '9fe83c25-864e-7fe8-370d-d97799be1d7e', 'is_root', '1');
INSERT INTO `mini_key_value` VALUES ('74', 'config.base', 'default', 'web_print_times', '1');
INSERT INTO `mini_key_value` VALUES ('217', 'config.base', 'default', 'name', '沪ICP备12345678号');
INSERT INTO `mini_key_value` VALUES ('218', 'config.base', 'default', 'value', '/uploads/picture/20161229/36b597e99abfc30bf1e968a0fba211f3.gif');
INSERT INTO `mini_key_value` VALUES ('219', 'posts.form', 'd97a6197-a9ef-94ba-bc34-30f20f24974f', '', '{\"page_tpl\":\"contact\"}');
INSERT INTO `mini_key_value` VALUES ('220', 'posts.form', '218f1c67-c151-3179-4344-991776719041', '', '{\"page_tpl\":\"contact\"}');
INSERT INTO `mini_key_value` VALUES ('221', 'posts.form', '5e3cff2f-875a-4e40-7496-0e94c40d88f8', '', '{\"page_tpl\":\"contact\"}');
INSERT INTO `mini_key_value` VALUES ('222', 'posts.form', '1c2fd4a6-e0d3-309f-c7e1-3c7f14b8199f', '', '{\"page_tpl\":\"contact\"}');
INSERT INTO `mini_key_value` VALUES ('224', 'posts.form', '1d6dde2b-0db7-2bcb-6c77-1d312277889f', '', '{\"description\":\"\"}');

-- ----------------------------
-- Table structure for `mini_links`
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
-- Records of mini_links
-- ----------------------------
INSERT INTO `mini_links` VALUES ('1', 'http://www.baidu.com', '百度', '/uploads/picture/20161209/707e87d63b2b3b561df33d8a510b19cf.png', '_blank', '百度', 'Y', '1', '1474877272');

-- ----------------------------
-- Table structure for `mini_menu`
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
  `group_id` int(10) DEFAULT '0' COMMENT '菜单组id',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_menu
-- ----------------------------
INSERT INTO `mini_menu` VALUES ('1', '文章管理', 'fa fa-fw fa-files-o', '0', '0', '0', '0', '0', '2');
INSERT INTO `mini_menu` VALUES ('2', '订单', 'fa fa-fw fa-exchange', '0', '3', '#', '0', '0', '3');
INSERT INTO `mini_menu` VALUES ('3', '会员', 'fa fa-fw fa-users', '0', '4', '#', '0', '0', '4');
INSERT INTO `mini_menu` VALUES ('4', '设置', 'fa fa-gears', '0', '5', '#', '0', '0', '5');
INSERT INTO `mini_menu` VALUES ('5', '个人', 'fa fa-fw fa-user', '0', '6', '#', '0', '0', '4');
INSERT INTO `mini_menu` VALUES ('31', '写文章', 'fa fa-fw fa-edit', '1', '1', 'post/add', '0', '0', '2');
INSERT INTO `mini_menu` VALUES ('32', '所有文章', 'fa fa-fw fa-file', '1', '0', 'post/index', '0', '0', '2');
INSERT INTO `mini_menu` VALUES ('37', '分类目录', 'fa fa-fw fa-cubes', '1', '2', 'terms/index', '0', '0', '2');
INSERT INTO `mini_menu` VALUES ('38', '订单列表', 'fa fa-money', '2', '0', 'order/index', '0', '0', '3');
INSERT INTO `mini_menu` VALUES ('39', '会员列表', 'fa fa-fw fa-user', '3', '0', 'member/index', '0', '0', '4');
INSERT INTO `mini_menu` VALUES ('40', '添加会员', 'fa fa-fw fa-user-plus', '3', '1', 'member/add', '0', '0', '4');
INSERT INTO `mini_menu` VALUES ('41', '基本设置', 'fa  fa-wrench', '4', '0', 'config/consumer', '0', '0', '5');
INSERT INTO `mini_menu` VALUES ('42', '菜单设置', 'fa  fa-navicon ', '4', '1', 'menu/index', '0', '0', '5');
INSERT INTO `mini_menu` VALUES ('43', '个人资料', 'fa fa-user-times', '5', '0', 'user/edit', '0', '0', '4');
INSERT INTO `mini_menu` VALUES ('44', '修改密码', 'fa fa-fw fa-key', '5', '1', 'user/password', '0', '0', '4');
INSERT INTO `mini_menu` VALUES ('48', '插件', 'fa fa-puzzle-piece', '0', '7', '#', '0', '0', '6');
INSERT INTO `mini_menu` VALUES ('49', '广告管理', 'fa  fa-picture-o', '48', '1', 'banner/index', '0', '0', '6');
INSERT INTO `mini_menu` VALUES ('50', '导航设置', 'fa  fa-cog', '4', '2', 'navigation/index', '0', '0', '5');
INSERT INTO `mini_menu` VALUES ('51', '页面', 'fa fa-newspaper-o', '0', '1', '#', '0', '0', '2');
INSERT INTO `mini_menu` VALUES ('52', '所有页面', 'fa fa-fw fa-file', '51', '0', 'page/index', '0', '0', '2');
INSERT INTO `mini_menu` VALUES ('53', '新增页面', 'fa fa-edit (alias)', '51', '1', 'page/add', '0', '0', '2');
INSERT INTO `mini_menu` VALUES ('54', '权限设置', 'fa fa-plug', '3', '3', 'authmanager/index', '0', '0', '4');
INSERT INTO `mini_menu` VALUES ('55', '广告位置', 'fa fa-picture-o', '48', '0', 'bannerposition/index', '0', '0', '6');
INSERT INTO `mini_menu` VALUES ('56', '链接管理', 'fa fa-link', '48', '3', 'links/index', '0', '0', '6');
INSERT INTO `mini_menu` VALUES ('59', '登录', '', '0', '0', 'index/index', '1', '0', '1');
INSERT INTO `mini_menu` VALUES ('58', '评论管理', 'fa fa-comment-o', '48', '0', 'comment/index', '1', '0', '6');
INSERT INTO `mini_menu` VALUES ('60', '删除分类', '', '37', '0', 'terms/setStatus', '1', '0', '2');
INSERT INTO `mini_menu` VALUES ('61', '编辑分类目录', '', '37', '0', 'terms/edit', '1', '0', '2');
INSERT INTO `mini_menu` VALUES ('64', '主题设置', 'fa fa-sliders', '4', '5', 'theme/index', '0', '0', '5');
INSERT INTO `mini_menu` VALUES ('65', '微信设置', 'fa fa-plug', '4', '4', 'wx/index', '0', '0', '5');
INSERT INTO `mini_menu` VALUES ('67', '接口设置', 'fa fa-support', '4', '7', 'apiconfig/edit', '0', '0', '5');
INSERT INTO `mini_menu` VALUES ('68', '数据库', 'fa fa-cog', '0', '8', '#', '0', '0', '5');
INSERT INTO `mini_menu` VALUES ('69', '数据库备份', 'fa fa-cog', '68', '0', 'database/backup', '0', '0', '5');
INSERT INTO `mini_menu` VALUES ('70', '数据库还原', 'fa fa-cog', '68', '0', 'database/reduction', '0', '0', '5');
INSERT INTO `mini_menu` VALUES ('71', '商品', 'fa fa-shopping-cart', '0', '2', '#', '1', '0', '3');
INSERT INTO `mini_menu` VALUES ('72', '所有商品', ' fa fa-shopping-cart', '71', '0', 'goods/index', '0', '0', '3');
INSERT INTO `mini_menu` VALUES ('73', '添加商品', 'fa  fa-plus-square', '71', '1', 'goods/goodsAdd', '0', '0', '3');
INSERT INTO `mini_menu` VALUES ('74', '商品分类', 'fa fa-list', '71', '2', 'goods/category', '0', '0', '3');
INSERT INTO `mini_menu` VALUES ('75', '注销用户', 'fa fa-fw fa-exchange', '5', '3', 'common/logout', '0', '0', '1');
INSERT INTO `mini_menu` VALUES ('142', '广告位编辑', '', '55', '0', 'bannerposition/edit', '0', '0', '6');
INSERT INTO `mini_menu` VALUES ('144', '链接编辑', '', '56', '0', 'links/edit', '0', '0', '6');
INSERT INTO `mini_menu` VALUES ('119', '统计', 'fa fa-dashboard', '0', '0', '#', '0', '0', '1');
INSERT INTO `mini_menu` VALUES ('121', '仪表盘', 'fa fa-dashboard', '119', '0', 'index/index', '0', '0', '1');
INSERT INTO `mini_menu` VALUES ('122', '编辑文章', '', '32', '0', 'post/edit', '0', '0', '2');
INSERT INTO `mini_menu` VALUES ('124', '编辑单页', '', '52', '0', 'page/edit', '0', '0', '2');
INSERT INTO `mini_menu` VALUES ('125', '编辑商品', '', '72', '0', 'goods/goodsedit', '0', '0', '3');
INSERT INTO `mini_menu` VALUES ('126', '编辑商品分类', '', '74', '0', 'goods/categoryedit', '0', '0', '3');
INSERT INTO `mini_menu` VALUES ('127', '编辑会员', '', '39', '0', 'member/edit', '0', '0', '4');
INSERT INTO `mini_menu` VALUES ('128', '新增用户组', '', '54', '0', 'authmanager/add', '0', '0', '4');
INSERT INTO `mini_menu` VALUES ('129', '编辑用户组', '', '54', '0', 'authmanager/edit', '0', '0', '4');
INSERT INTO `mini_menu` VALUES ('130', '访问授权', '', '54', '0', 'authmanager/access', '0', '0', '4');
INSERT INTO `mini_menu` VALUES ('131', '分类授权', '', '54', '0', 'authmanager/category', '0', '0', '4');
INSERT INTO `mini_menu` VALUES ('132', '成员授权', '', '54', '0', 'authmanager/member', '0', '0', '4');
INSERT INTO `mini_menu` VALUES ('133', '添加成员', '', '54', '0', 'authmanager/adduser', '0', '0', '4');
INSERT INTO `mini_menu` VALUES ('134', '开发者模式', '', '41', '0', 'config/developer', '0', '0', '5');
INSERT INTO `mini_menu` VALUES ('135', '编辑菜单', '', '42', '0', 'menu/edit', '0', '0', '5');
INSERT INTO `mini_menu` VALUES ('136', '编辑导航', '', '50', '0', 'navigation/edit', '0', '0', '5');
INSERT INTO `mini_menu` VALUES ('137', '菜单设置', '', '65', '0', 'wx/wxmenu', '0', '0', '5');
INSERT INTO `mini_menu` VALUES ('138', '(添加/消息)自动回复', '', '65', '0', 'wx/reply', '0', '0', '5');
INSERT INTO `mini_menu` VALUES ('139', '关键词回复', '', '65', '0', 'wx/keywords', '0', '0', '5');
INSERT INTO `mini_menu` VALUES ('140', '评论详情', '', '58', '0', 'comment/detail', '0', '0', '6');
INSERT INTO `mini_menu` VALUES ('143', '广告管理', '', '49', '0', 'banner/edit', '0', '0', '6');
INSERT INTO `mini_menu` VALUES ('145', '留言管理', 'fa fa-comment-o', '48', '0', 'guestbook/index', '0', '0', '6');

-- ----------------------------
-- Table structure for `mini_menu_group`
-- ----------------------------
DROP TABLE IF EXISTS `mini_menu_group`;
CREATE TABLE `mini_menu_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '菜单组名称',
  `status` tinyint(4) DEFAULT '1' COMMENT '1正常2禁用',
  `sort` tinyint(4) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_menu_group
-- ----------------------------
INSERT INTO `mini_menu_group` VALUES ('1', '首页', '1', '0');
INSERT INTO `mini_menu_group` VALUES ('2', '内容', '1', '1');
INSERT INTO `mini_menu_group` VALUES ('3', '商城', '2', '2');
INSERT INTO `mini_menu_group` VALUES ('4', '用户', '1', '3');
INSERT INTO `mini_menu_group` VALUES ('5', '系统', '1', '4');
INSERT INTO `mini_menu_group` VALUES ('6', '插件', '1', '5');

-- ----------------------------
-- Table structure for `mini_navigation`
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
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_navigation
-- ----------------------------
INSERT INTO `mini_navigation` VALUES ('1', '网站首页', 'fa fa-fw fa-files-o', '0', '0', 'index/index', '0');
INSERT INTO `mini_navigation` VALUES ('2', '迁图简介', 'fa fa-fw fa-exchange', '0', '1', 'article/page?name=company', '0');
INSERT INTO `mini_navigation` VALUES ('3', '新闻动态', 'fa fa-fw fa-users', '0', '2', 'article/lists?category=news', '0');
INSERT INTO `mini_navigation` VALUES ('4', '服务指南', 'fa fa-gears', '0', '3', 'goods/index', '0');
INSERT INTO `mini_navigation` VALUES ('5', '书刊推介', 'fa fa-fw fa-edit', '0', '5', 'article/page?name=address', '0');
INSERT INTO `mini_navigation` VALUES ('6', '迁图讲堂', '', '0', '0', '', '0');
INSERT INTO `mini_navigation` VALUES ('7', '数字资源', '', '0', '0', '', '0');
INSERT INTO `mini_navigation` VALUES ('8', '政务公开', '', '0', '0', '', '0');
INSERT INTO `mini_navigation` VALUES ('9', '本馆公告', '', '0', '0', '', '0');
INSERT INTO `mini_navigation` VALUES ('10', '馆长信箱', '', '0', '0', '', '0');

-- ----------------------------
-- Table structure for `mini_orders`
-- ----------------------------
DROP TABLE IF EXISTS `mini_orders`;
CREATE TABLE `mini_orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(128) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `order_no` varchar(20) NOT NULL COMMENT '订单号',
  `print_no` varchar(30) DEFAULT NULL COMMENT '小票打印机单号',
  `express_type` varchar(100) DEFAULT NULL COMMENT '快递方式',
  `express_no` varchar(100) DEFAULT NULL COMMENT '快递编号',
  `pay_type` varchar(10) NOT NULL COMMENT '支付方式',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `createtime` int(11) NOT NULL,
  `is_pay` int(11) NOT NULL DEFAULT '0',
  `status` varchar(10) NOT NULL COMMENT '支付状态',
  `memo` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `consignee_name` varchar(100) DEFAULT NULL COMMENT '收货人',
  `address` text COMMENT '收货地址',
  `mobile` varchar(11) DEFAULT NULL COMMENT '收货人电话',
  PRIMARY KEY (`id`,`uuid`,`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_orders
-- ----------------------------

-- ----------------------------
-- Table structure for `mini_orders_address`
-- ----------------------------
DROP TABLE IF EXISTS `mini_orders_address`;
CREATE TABLE `mini_orders_address` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `consignee_name` varchar(100) NOT NULL COMMENT '收货人',
  `province` varchar(100) NOT NULL COMMENT '省',
  `city` varchar(100) NOT NULL COMMENT '市',
  `county` varchar(100) NOT NULL COMMENT '县/区',
  `address` text NOT NULL COMMENT '详细地址',
  `mobile` varchar(11) NOT NULL COMMENT '联系电话',
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '1-正常 -1-已删除',
  `default` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为默认收货地址1-是 0-否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_orders_address
-- ----------------------------

-- ----------------------------
-- Table structure for `mini_orders_goods`
-- ----------------------------
DROP TABLE IF EXISTS `mini_orders_goods`;
CREATE TABLE `mini_orders_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(11) NOT NULL COMMENT '订单号',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `name` varchar(255) NOT NULL,
  `num` int(10) NOT NULL COMMENT '购买数量',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `description` text NOT NULL,
  `standard` varchar(255) NOT NULL,
  `cover_path` varchar(255) NOT NULL,
  `is_comment` varchar(10) NOT NULL DEFAULT '-1' COMMENT '商品是否评论 -1-否  1-是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_orders_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `mini_orders_status`
-- ----------------------------
DROP TABLE IF EXISTS `mini_orders_status`;
CREATE TABLE `mini_orders_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) NOT NULL COMMENT '订单号',
  `approve_uid` int(50) DEFAULT NULL COMMENT '审核人',
  `trade_no` varchar(50) DEFAULT NULL COMMENT '支付接口流水号',
  `trade_status` varchar(50) DEFAULT NULL COMMENT '支付接口状态',
  `status` varchar(30) NOT NULL COMMENT 'nopaid-未支付 paid-已支付,待发货  shipped-已发货  completed-收货已完成',
  `createtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_orders_status
-- ----------------------------

-- ----------------------------
-- Table structure for `mini_posts`
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
  `view` int(11) NOT NULL DEFAULT '0' COMMENT '文章浏览量',
  `position` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0：不推荐，1：首页推荐，2：栏目推荐，4：内页推荐',
  PRIMARY KEY (`id`),
  KEY `post_name` (`name`(191)),
  KEY `type_status_date` (`type`,`status`,`createtime`,`id`),
  KEY `post_parent` (`pid`),
  KEY `post_author` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_posts
-- ----------------------------
INSERT INTO `mini_posts` VALUES ('1', '1', '5e01e276-1b2b-ceab-c82c-e7314371f408', '1495872248', '<p>关于我们</p>', '关于我们', '', 'publish', 'open', '', 'gywm', '1496192109', '9', '0', 'page', '0', '0', '0');
INSERT INTO `mini_posts` VALUES ('2', '1', '50d5b380-0e89-a369-40ec-62fed62cbf2a', '1495872281', '<p>公司简介</p>', '公司简介', '', 'publish', 'open', '', 'gsjj', '1495872281', '1', '0', 'page', '0', '0', '0');
INSERT INTO `mini_posts` VALUES ('3', '1', '02e93d98-08ad-140a-88b9-a24b0517c6f9', '1495872349', '<p>企业文化</p>', '企业文化', '', 'publish', 'open', '', 'qywh', '1495872349', '1', '0', 'page', '0', '0', '0');
INSERT INTO `mini_posts` VALUES ('4', '1', '363fc2cd-9bbc-8ed8-3a0a-fef34cfc9551', '1495872399', '<p>领导关怀</p>', '领导关怀', '', 'publish', 'open', '', 'ldgh', '1495872399', '1', '0', 'page', '0', '0', '0');
INSERT INTO `mini_posts` VALUES ('5', '1', 'e8b7acfd-ce1e-3e5b-1ffe-dfa0067079ed', '1495872468', '<p>组织结构</p>', '组织结构', '', 'publish', 'open', '', 'zzjg', '1495872468', '1', '0', 'page', '0', '0', '0');
INSERT INTO `mini_posts` VALUES ('6', '1', 'c8ffc13f-8d9e-4ea8-bf79-e5d688ca320e', '1495872528', '<p>资质荣誉</p>', '资质荣誉', '', 'publish', 'open', '', 'zzry', '1495872553', '1', '0', 'page', '0', '0', '0');
INSERT INTO `mini_posts` VALUES ('7', '1', '6e05b8b5-4619-c9ce-743c-06bc362d49fd', '1495872588', '<p>发展历程<br/></p>', '发展历程', '', 'publish', 'open', '', 'fzlc', '1495872588', '1', '0', 'page', '0', '0', '0');
INSERT INTO `mini_posts` VALUES ('8', '1', '1c2fd4a6-e0d3-309f-c7e1-3c7f14b8199f', '1495872686', '			<li class=\"contactinfo\">\r\n				<h5>国内业务部</h5>\r\n				<ul>\r\n					<li><span>电话：</span><span>0315-5359886</span><span>0315-5359830</span></li>\r\n					<li><span>传真：</span><span>0315-359889</span></li>\r\n					<li><span>邮箱：</span><span>ybccb@ybcb.com.cn</span></li>\r\n				</ul>\r\n			</li>\r\n			<li class=\"contactinfo\">\r\n				<h5>国际业务部</h5>\r\n				<ul>\r\n					<li><span>电话：</span><span>0315-5359886</span><span>0315-5359830</span></li>\r\n					<li><span>传真：</span><span>0315-359889</span></li>\r\n					<li><span>邮箱：</span><span>polly_1982-2001@yahoo.com.cn</span></li>\r\n				</ul>\r\n			</li>', '联系我们', '', 'publish', 'open', '', 'lxwm', '1496214826', '9', '0', 'page', '0', '0', '0');
INSERT INTO `mini_posts` VALUES ('9', '1', 'b232aa09-8a22-c5c8-3c9d-1779b7389296', '1496192077', '<p>中文站</p>', '中文站', '', 'publish', 'open', '', '', '1496192077', '0', '0', 'page', '0', '0', '0');
INSERT INTO `mini_posts` VALUES ('10', '1', '1d6dde2b-0db7-2bcb-6c77-1d312277889f', '1496222048', '<p>彦博彩板<br/></p>', '彦博彩板', '', 'publish', 'open', '', '', '1496222867', '0', '0', 'post', '0', '0', '7');

-- ----------------------------
-- Table structure for `mini_terms`
-- ----------------------------
DROP TABLE IF EXISTS `mini_terms`;
CREATE TABLE `mini_terms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '分类名',
  `slug` varchar(200) NOT NULL DEFAULT '' COMMENT '缩略名',
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级分类ID，无则为0',
  `sort` tinyint(10) unsigned NOT NULL COMMENT '用于排序',
  `icon` varchar(255) DEFAULT NULL COMMENT '分类图标',
  `status` tinyint(6) unsigned NOT NULL COMMENT '状态，1正常，2禁用',
  `page_num` int(11) unsigned NOT NULL COMMENT '每页显示文章数量',
  `lists_tpl` varchar(200) NOT NULL COMMENT '列表页模板',
  `detail_tpl` varchar(200) NOT NULL COMMENT '详情页模板',
  `bind_form` varchar(50) NOT NULL COMMENT '绑定的表单',
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_terms
-- ----------------------------
INSERT INTO `mini_terms` VALUES ('2', '新闻动态', 'xwdt', '7', '0', '', '1', '3', 'news_list', 'news_detail', 'article');
INSERT INTO `mini_terms` VALUES ('3', '公司动态', 'gsdt', '2', '0', '', '0', '3', 'news_list', 'news_detail', 'article');
INSERT INTO `mini_terms` VALUES ('4', '行业动态', 'hydt', '2', '0', '', '0', '3', 'news_list', 'news_detail', 'article');
INSERT INTO `mini_terms` VALUES ('5', '产品中心', 'cpzx', '7', '0', '', '1', '6', 'product', 'detail', 'article');
INSERT INTO `mini_terms` VALUES ('6', '建筑类彩涂板', 'jzlctb', '5', '0', '', '0', '6', 'product', 'detail', 'article');
INSERT INTO `mini_terms` VALUES ('7', '中文站', 'zwz', '0', '0', '', '0', '20', 'news_list', 'news_detail', 'article');
INSERT INTO `mini_terms` VALUES ('8', '家电类彩涂板', 'jdlctb', '5', '0', '', '0', '6', 'product', 'detail', 'article');
INSERT INTO `mini_terms` VALUES ('9', '迷彩彩涂板', 'mcctb', '5', '0', '', '0', '6', 'product', 'detail', 'article');
INSERT INTO `mini_terms` VALUES ('10', '建筑类镀锌板', 'jzldxb', '5', '0', '', '0', '6', 'product', 'detail', 'article');
INSERT INTO `mini_terms` VALUES ('11', '民用镀锌板', 'mydxb', '5', '0', '', '0', '6', 'product', 'detail', 'article');
INSERT INTO `mini_terms` VALUES ('12', '黑退板', 'htb', '5', '0', '', '0', '6', 'product', 'detail', 'article');
INSERT INTO `mini_terms` VALUES ('13', '酸洗板', 'sxb', '5', '0', '', '0', '6', 'product', 'detail', 'article');
INSERT INTO `mini_terms` VALUES ('14', '冷轧', 'lz', '5', '0', '', '0', '6', 'product', 'detail', 'article');
INSERT INTO `mini_terms` VALUES ('15', '公司实力', 'gssl', '7', '0', '', '0', '6', 'company_strength', 'detail', 'article');
INSERT INTO `mini_terms` VALUES ('16', '人力资源', 'rlzy', '7', '0', '', '0', '3', 'news_list', 'news_detail', 'article');
INSERT INTO `mini_terms` VALUES ('17', '领导关怀', 'ldgh', '7', '0', '', '0', '3', 'news_list', 'news_detail', 'article');

-- ----------------------------
-- Table structure for `mini_term_relationships`
-- ----------------------------
DROP TABLE IF EXISTS `mini_term_relationships`;
CREATE TABLE `mini_term_relationships` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章ID',
  `term_id` varchar(50) NOT NULL DEFAULT '0' COMMENT '分类ID，多个时以“,”隔开',
  PRIMARY KEY (`id`,`post_id`),
  KEY `term_taxonomy_id` (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_term_relationships
-- ----------------------------
INSERT INTO `mini_term_relationships` VALUES ('2', '10', '3');

-- ----------------------------
-- Table structure for `mini_users`
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
  `last_login` int(11) DEFAULT NULL COMMENT '最后登录时间',
  `wechat_openid` varchar(255) DEFAULT NULL COMMENT '微信openid',
  `qq_openid` varchar(255) DEFAULT NULL COMMENT 'qqopenid',
  `sina_openid` varchar(255) NOT NULL COMMENT '微博openid',
  `score` int(11) DEFAULT '0' COMMENT '积分',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_users
-- ----------------------------
INSERT INTO `mini_users` VALUES ('1', '9fe83c25-864e-7fe8-370d-d97799be1d7e', 'administrator', '39a42c5339fae42dea760b9303ef87f6', 'administrator', 'administrator@qq.com', '15076569631', '1474947164', '27.191.7.89', 'cba1d7', '1', '1491553261', '', '', '', '2065809');

-- ----------------------------
-- Table structure for `mini_user_extend`
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
-- Records of mini_user_extend
-- ----------------------------

-- ----------------------------
-- Table structure for `mini_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `mini_user_group`;
CREATE TABLE `mini_user_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为-1禁用',
  `rules` varchar(500) DEFAULT '' COMMENT '用户组拥有的权限id，多个规则 , 隔开',
  `group_ids` varchar(255) DEFAULT '' COMMENT '菜单组权限',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_user_group
-- ----------------------------
INSERT INTO `mini_user_group` VALUES ('1', 'admin', '1', '测试用户组', '', '1', '59,119,121,1,32,122,37,60,61,2,38,71,72,73,74,5,43,75', '1,2,3,4');
INSERT INTO `mini_user_group` VALUES ('3', '', '0', '编辑', '', '1', '', '');

-- ----------------------------
-- Table structure for `mini_user_group_access`
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
-- Records of mini_user_group_access
-- ----------------------------
INSERT INTO `mini_user_group_access` VALUES ('29', '1');

-- ----------------------------
-- Table structure for `mini_user_rule`
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
-- Records of mini_user_rule
-- ----------------------------

-- ----------------------------
-- Table structure for `mini_wx_menu`
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_wx_menu
-- ----------------------------
INSERT INTO `mini_wx_menu` VALUES ('5', '关于我们', '1', 'http://mp.weixin.qq.com/s?__biz=MzI0MDU3ODAwNg==&mid=100000001&idx=1&sn=d67476007d2c5f45968728bad566d502&chksm=6919fdb85e6e74ae433d3477273da032c6592df7b101cc634d053269ebd0c32e026f150923f9&scene=0#wechat_redirect', '', '0', 'K_1478569936');
INSERT INTO `mini_wx_menu` VALUES ('6', '了解我们', '1', 'http://mp.weixin.qq.com/s?__biz=MzI0MDU3ODAwNg==&mid=100000001&idx=1&sn=d67476007d2c5f45968728bad566d502&chksm=6919fdb85e6e74ae433d3477273da032c6592df7b101cc634d053269ebd0c32e026f150923f9&scene=0#wechat_redirect', '', '5', 'K_1478571036');
INSERT INTO `mini_wx_menu` VALUES ('7', '联系我们', '1', 'http://mp.weixin.qq.com/s?__biz=MzI0MDU3ODAwNg==&mid=100000006&idx=1&sn=fade5699ef8038d20d8ffc205d01d933&chksm=6919fdbf5e6e74a9b7a47641f4800f3f32fb6d1b4a44604ffcc82e3054697d57fc625531c1a9&scene=0#wechat_redirect', '', '5', 'K_1478743249');
INSERT INTO `mini_wx_menu` VALUES ('8', '最新活动', '2', '', '更多精彩内容，敬请期待！', '0', 'K_1479093098');
INSERT INTO `mini_wx_menu` VALUES ('9', '线上商城', '1', 'http://www.zhenliangyuan.com/wx.php', '', '0', 'K_1479432793');

-- ----------------------------
-- Table structure for `mini_wx_reply`
-- ----------------------------
DROP TABLE IF EXISTS `mini_wx_reply`;
CREATE TABLE `mini_wx_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` mediumint(2) NOT NULL COMMENT '回复类型，1关注回复2消息回复3关键词回复',
  `key` varchar(225) DEFAULT NULL COMMENT '关键词',
  `msg` varchar(1000) DEFAULT NULL COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mini_wx_reply
-- ----------------------------
