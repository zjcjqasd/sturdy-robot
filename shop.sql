/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-01-04 21:54:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `username` varchar(222) NOT NULL,
  `balance` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('123456', '100');
INSERT INTO `account` VALUES ('12345678', '100');
INSERT INTO `account` VALUES ('fanyuxiao', '888');
INSERT INTO `account` VALUES ('hello123', '651');
INSERT INTO `account` VALUES ('helloworld', '1234');
INSERT INTO `account` VALUES ('lichunpeng', '88');
INSERT INTO `account` VALUES ('lifanfan', '8737');
INSERT INTO `account` VALUES ('lifanfan2', '88');
INSERT INTO `account` VALUES ('mabiao', '66');
INSERT INTO `account` VALUES ('qddaxue', '100');
INSERT INTO `account` VALUES ('tianshuai', '100');
INSERT INTO `account` VALUES ('tianyongxin', '3875');
INSERT INTO `account` VALUES ('tianyongxin8', '66');
INSERT INTO `account` VALUES ('tyx1234', '222');
INSERT INTO `account` VALUES ('zhangyan', '555');
INSERT INTO `account` VALUES ('zhangyihao', '220');
INSERT INTO `account` VALUES ('zhuangguiyao', '30');

-- ----------------------------
-- Table structure for coupon
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon` (
  `couponid` int(8) NOT NULL AUTO_INCREMENT,
  `userid` int(8) NOT NULL,
  `coupon` varchar(255) NOT NULL,
  `couponvalue` int(8) NOT NULL,
  PRIMARY KEY (`couponid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coupon
-- ----------------------------
INSERT INTO `coupon` VALUES ('10', '1', '50减15', '15');
INSERT INTO `coupon` VALUES ('11', '1', '40减10', '10');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goodsid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `salesamount` int(11) DEFAULT NULL,
  `storenumber` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `type` varchar(222) DEFAULT NULL,
  `img` varchar(222) DEFAULT NULL,
  `important` int(11) DEFAULT NULL,
  `news` int(11) DEFAULT NULL,
  PRIMARY KEY (`goodsid`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '七匹狼夹克', '499', '23', '32', '秋款立领商务休闲', 'm', '/static/images/m1.jpg', '0', '7');
INSERT INTO `goods` VALUES ('2', '以纯牛仔', '259', '33', '12', '冬季新品', 'm', '/static/images/m2.jpg', '1', '6');
INSERT INTO `goods` VALUES ('3', 'AK男装', '599', '15', '2', '新品军事轻复古MA-1', 'm', '/static/images/m3.jpg', '0', '9');
INSERT INTO `goods` VALUES ('4', '棒球夹克', '1099', '4', '5', '棒球领夹克中国风', 'm', '/static/images/m4.jpg', '1', '8');
INSERT INTO `goods` VALUES ('5', '冬季黑色夹克', '399', '2', '2', '潮牌大码男装 胖子男士加棉', 'm', '/static/images/m8.jpg', '0', '8');
INSERT INTO `goods` VALUES ('6', 'FIRS杉杉夹克', '359', '5', '7', '男士休闲商务夹克薄款', 'm', '/static/images/m7.jpg', '0', '8');
INSERT INTO `goods` VALUES ('7', 'A21以纯', '269', '21', '33', '2017秋装新品两面穿夹', 'm', '/static/images/m6.jpg', '1', '8');
INSERT INTO `goods` VALUES ('8', '南极人夹克', '128', '77', '2', '冬季新品', 'm', '/static/images/m5.jpg', '0', '7');
INSERT INTO `goods` VALUES ('9', '军事复古直筒裤', '269', '44', '6', '军袢式男士休闲', 'm', '/static/images/m9.jpg', '1', '6');
INSERT INTO `goods` VALUES ('10', '低腰修身', '189', '23', '55', 'A21以纯线上品牌春装新品低腰', 'm', '/static/images/m11.jpg', '1', '6');
INSERT INTO `goods` VALUES ('11', '加绒休闲裤', '199', '88', '12', '七匹狼休闲裤男秋冬装新款加绒', 'm', '/static/images/m10.jpg', '0', '9');
INSERT INTO `goods` VALUES ('12', '修身裤子', '139', '57', '0', '七匹狼休闲裤男秋冬装新款加绒', 'm', '/static/images/m12.jpg', '0', '5');
INSERT INTO `goods` VALUES ('13', '幸运杰克', '88', '58', '21', '买一送一', 'm', '/static/images/m13.jpg', '0', '9');
INSERT INTO `goods` VALUES ('14', '罗蒙棉服', '288', '7', '55', '冬季商务休闲青年男士保', 'm', '/static/images/m14.jpg', '1', '6');
INSERT INTO `goods` VALUES ('15', '七匹狼户外运动', '639', '5', '33', '中长款连帽棉服男 男士', 'm', '/static/images/m8.jpg', '0', '7');
INSERT INTO `goods` VALUES ('16', '顾逸羽绒服', '498', '5', '6', '新品冬装外套羽绒服女中长款加', 'f', '/static/images/m16.jpg', '1', '7');
INSERT INTO `goods` VALUES ('17', '千仞岗羽绒服', '569', '77', '1', '2017冬季新品女装中长款式', 'f', '/static/images/m17.jpg', '0', '5');
INSERT INTO `goods` VALUES ('18', 'MOCO', '2999', '5', '6', '新品翻领纯色束口飘带中长款', 'f', '/static/images/m18.jpg', '1', '7');
INSERT INTO `goods` VALUES ('19', '子牧棉麻大衣', '438', '77', '22', '新款中国风盘扣羽绒服', 'f', '/static/images/m19.jpg', '0', '10');
INSERT INTO `goods` VALUES ('20', '花芙妮', '288', '11', '99', '轻薄羽绒服女装中长款过膝连帽', 'f', '/static/images/m20.jpg', '0', '9');
INSERT INTO `goods` VALUES ('21', '风之雪牛仔裤', '79', '34', '121', '秋冬加绒加厚女士', 'f', '/static/images/m21.jpg', '1', '8');
INSERT INTO `goods` VALUES ('22', '卡芙恋牛仔裤', '123', '99', '222', '春冬紧身加绒牛仔裤女高腰裤', 'f', '/static/images/m22.jpg', '1', '7');
INSERT INTO `goods` VALUES ('23', '布翎情牛仔裤', '178', '3', '44', '女小脚加绒秋冬装新款弹力', 'f', '/static/images/m23.jpg', '0', '8');
INSERT INTO `goods` VALUES ('24', '卡爵伦牛仔裤', '229', '3', '22', '小脚高腰弹力百搭学生长裤子', 'f', '/static/images/m24.jpg', '0', '8');
INSERT INTO `goods` VALUES ('25', 'mineeor牛仔裤', '119', '77', '22', '时尚修身小脚铅笔裤百搭潮', 'f', '/static/images/m25.jpg', '0', '9');
INSERT INTO `goods` VALUES ('26', 'MOCO卫衣', '799', '4', '55', '秋季新品圆领挖肩口袋贴布绣', 'f', '/static/images/m26.jpg', '1', '5');
INSERT INTO `goods` VALUES ('27', '哥弟女装', '320', '4', '55', '冬季新款圆领套头长袖卫衣', 'f', '/static/images/m27.jpg', '0', '9');
INSERT INTO `goods` VALUES ('28', 'Ports/宝姿卫衣', '839', '4', '66', '新款潮牌设计胶囊系列心', 'f', '/static/images/m28.jpg', '0', '7');
INSERT INTO `goods` VALUES ('29', '茵曼卫衣', '179', '55', '22', '新款简约净色抽绳连帽套头卫衣', 'f', '/static/images/m29.jpg', '0', '9');
INSERT INTO `goods` VALUES ('30', 'MO&Co.卫衣', '539', '78', '126', '秋季新品图腾印花字', 'f', '/static/images/m30.jpg', '0', '6');
INSERT INTO `goods` VALUES ('31', '恒葉曼登', '99', '142', '54', '秋款卫衣男装上衣服', 'm', '/static/images/m30.jpg', '1', '8');
INSERT INTO `goods` VALUES ('32', '卡宾休闲卫衣', '289', '290', '432', '百搭套头上衣虎头印花黑色', 'm', '/static/images/m31.jpg', '1', '7');
INSERT INTO `goods` VALUES ('33', 'Baleno/班尼路', '149', '322', '31', '秋季摇粒绒开衫布绒连帽', 'm', '/static/images/m33.jpg', '1', '7');
INSERT INTO `goods` VALUES ('34', 'A21以纯卫衣', '119', '32', '66', '秋装新品圆领修身', 'm', '/static/images/m34.jpg', '0', '8');
INSERT INTO `goods` VALUES ('35', 'AK男装', '299', '33', '54', '使徒行者防水拉链立领', 'm', '/static/images/m35.jpg', '0', '2');
INSERT INTO `goods` VALUES ('36', '木宸卫衣', '118', '33', '214', '秋冬季男装韩版', 'm', '/static/images/m36.jpg', '0', '9');
INSERT INTO `goods` VALUES ('37', '卡宾卫衣', '289', '178', '32', '时尚街头长袖卫衣青年', 'm', '/static/images/m37.jpg', '0', '8');
INSERT INTO `goods` VALUES ('38', 'INTERIGHT连帽卫衣', '116', '444', '46', '男士帽款开衫卫衣', 'm', '/static/images/m38.jpg', '1', '6');
INSERT INTO `goods` VALUES ('39', 'Baleno班尼路卫衣', '199', '176', '23', '纯色休闲加绒运动卫衣', 'm', '/static/images/m39.jpg', '0', '5');
INSERT INTO `goods` VALUES ('40', 'HLA海澜之家', '198', '231', '7', '连帽字母印花', 'm', '/static/images/m40.jpg', '0', '9');
INSERT INTO `goods` VALUES ('41', '红粉宣言', '79', '233', '122', '修身半高领加绒加', 'f', '/static/images/m41.jpg', '1', '8');
INSERT INTO `goods` VALUES ('42', '茵曼打底衫', '159', '1322', '11', '款圆领条纹长袖百搭', 'f', '/static/images/m42.jpg', '1', '9');
INSERT INTO `goods` VALUES ('43', 'LUXLEAD洛诗琳', '219', '32', '177', '蕾丝花边拼接系带', 'f', '/static/images/m43.jpg', '1', '8');
INSERT INTO `goods` VALUES ('44', 'betu百图', '79', '32', '144', '条纹喇叭袖V领', 'f', '/static/images/m44.jpg', '0', '6');
INSERT INTO `goods` VALUES ('45', '都丽雅打底衫', '59', '40', '37', '冬款半高领毛衣', 'f', '/static/images/m45.jpg', '0', '9');
INSERT INTO `goods` VALUES ('46', '茵曼打底衫', '69', '122', '44', '圆领条纹百搭长袖打底', 'f', '/static/images/m46.jpg', '0', '8');
INSERT INTO `goods` VALUES ('47', '伊蔓朵打底衫', '98', '177', '44', '秋冬装新款', 'f', '/static/images/m47.jpg', '0', '9');
INSERT INTO `goods` VALUES ('48', '初棉打底衫', '103', '176', '34', '圆领长袖T恤', 'f', '/static/images/m48.jpg', '0', '4');
INSERT INTO `goods` VALUES ('49', 'LUXLEAD洛诗琳', '199', '38', '60', '春装新款女装', 'f', '/static/images/m49.jpg', '1', '4');
INSERT INTO `goods` VALUES ('50', '梵鈺美打底衫', '88', '88', '6', '新品韩版针织衫', 'f', '/static/images/m50.jpg', '0', '9');
INSERT INTO `goods` VALUES ('51', 'BORCHIARL', '1868', '75', '77', '连衣裙2017秋冬新款', 'f', '/static/images/m51.jpg', '1', '7');
INSERT INTO `goods` VALUES ('52', 'LUXLEAD洛诗琳 ', '334', '101', '85', '冬装新款女装', 'f', '/static/images/m52.jpg', '0', '7');
INSERT INTO `goods` VALUES ('53', 'UR连衣裙', '359', '65', '19', '女装圆领优雅不对称', 'f', '/static/images/m53.jpg', '1', '9');
INSERT INTO `goods` VALUES ('54', '歌莉娅连衣裙', '198', '77', '32', '侧边抽绳不对称式', 'f', '/static/images/m54.jpg', '0', '6');
INSERT INTO `goods` VALUES ('55', '嘉尚铭衣连衣裙', '138', '54', '33', '加绒加厚针织', 'f', '/static/images/m55.jpg', '0', '7');
INSERT INTO `goods` VALUES ('56', '汉尼HANY毛呢大衣', '1299', '88', '43', '外套商务', 'm', '/static/images/m56.jpg', '1', '4');
INSERT INTO `goods` VALUES ('57', '罗蒙（ROMON）', '498', '7', '3', '毛呢大衣男', 'm', '/static/images/m57.jpg', '0', '5');
INSERT INTO `goods` VALUES ('58', '七匹狼毛呢大衣', '779', '72', '6', '商务男士中长款时尚翻领', 'm', '/static/images/m58.jpg', '1', '8');
INSERT INTO `goods` VALUES ('59', '威可多VICUTU', '980', '92', '28', '毛呢大衣男中长款', 'm', '/static/images/m59.jpg', '1', '7');
INSERT INTO `goods` VALUES ('60', '花花公子贵宾', '599', '68', '65', '男装呢子简约修身', 'm', '/static/images/m60.jpg', '0', '7');

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `salesid` int(22) NOT NULL AUTO_INCREMENT,
  `goodsid` int(22) DEFAULT NULL,
  `id` int(22) DEFAULT NULL,
  PRIMARY KEY (`salesid`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sales
-- ----------------------------
INSERT INTO `sales` VALUES ('46', null, null);

-- ----------------------------
-- Table structure for trade
-- ----------------------------
DROP TABLE IF EXISTS `trade`;
CREATE TABLE `trade` (
  `tradeid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `tradetime` datetime DEFAULT NULL,
  PRIMARY KEY (`tradeid`),
  KEY `userid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trade
-- ----------------------------
INSERT INTO `trade` VALUES ('98', '1', '2017-12-26 15:01:58');
INSERT INTO `trade` VALUES ('99', '1', '2017-12-26 15:04:47');
INSERT INTO `trade` VALUES ('100', '1', '2017-12-26 15:13:02');
INSERT INTO `trade` VALUES ('101', '4', '2017-12-28 14:20:59');
INSERT INTO `trade` VALUES ('102', '4', '2017-12-28 14:21:49');
INSERT INTO `trade` VALUES ('103', '4', '2017-12-28 14:23:51');
INSERT INTO `trade` VALUES ('104', '4', '2017-12-30 00:20:47');
INSERT INTO `trade` VALUES ('105', '16', '2018-01-02 19:13:04');
INSERT INTO `trade` VALUES ('106', '17', '2018-01-02 19:54:50');
INSERT INTO `trade` VALUES ('107', '17', '2018-01-02 19:56:29');
INSERT INTO `trade` VALUES ('108', '4', '2018-01-02 22:13:51');
INSERT INTO `trade` VALUES ('109', '4', '2018-01-03 10:26:11');
INSERT INTO `trade` VALUES ('110', '4', '2018-01-03 10:30:03');
INSERT INTO `trade` VALUES ('111', '4', '2018-01-03 10:33:27');
INSERT INTO `trade` VALUES ('112', '4', '2018-01-03 10:35:40');
INSERT INTO `trade` VALUES ('113', '18', '2018-01-03 11:32:21');
INSERT INTO `trade` VALUES ('114', '1', '2019-01-03 14:46:07');
INSERT INTO `trade` VALUES ('115', '1', '2019-01-04 16:40:24');
INSERT INTO `trade` VALUES ('116', '1', '2019-01-04 16:55:33');
INSERT INTO `trade` VALUES ('117', '1', '2019-01-04 16:58:37');
INSERT INTO `trade` VALUES ('118', '1', '2019-01-04 17:04:49');
INSERT INTO `trade` VALUES ('119', '1', '2019-01-04 17:05:41');
INSERT INTO `trade` VALUES ('120', '1', '2019-01-04 17:20:56');
INSERT INTO `trade` VALUES ('121', '1', '2019-01-04 17:22:30');
INSERT INTO `trade` VALUES ('122', '1', '2019-01-04 17:22:52');
INSERT INTO `trade` VALUES ('123', '1', '2019-01-04 17:25:19');
INSERT INTO `trade` VALUES ('124', '1', '2019-01-04 17:34:40');
INSERT INTO `trade` VALUES ('125', '1', '2019-01-04 21:33:10');
INSERT INTO `trade` VALUES ('126', '1', '2019-01-04 21:35:19');

-- ----------------------------
-- Table structure for userlogin
-- ----------------------------
DROP TABLE IF EXISTS `userlogin`;
CREATE TABLE `userlogin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `paypwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `password` (`password`),
  KEY `userlogin_ibfk_1` (`paypwd`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userlogin
-- ----------------------------
INSERT INTO `userlogin` VALUES ('1', 'tianyongxin', '12345678a', '123456@qq.com', '12345678a');
INSERT INTO `userlogin` VALUES ('2', 'lichunpeng', '12345678a', '123456@qq.com', '23456789a');
INSERT INTO `userlogin` VALUES ('3', 'zhuangguiyao', '12345678a', '123456@qq.com', '34567890a');
INSERT INTO `userlogin` VALUES ('4', 'lifanfan2', '12345678a', '123456@qq.com', '11111111a');
INSERT INTO `userlogin` VALUES ('5', 'helloworld', '12345678a', '123456@qq.com', '12345678a');
INSERT INTO `userlogin` VALUES ('6', 'tyx1234', '12345678a', '123456@qq.com', '23456789a');
INSERT INTO `userlogin` VALUES ('7', 'tianyongxin8', '12345678a', '123456@qq.com', '34567890a');
INSERT INTO `userlogin` VALUES ('8', 'fanyuxiao', '12345678a', '123456@qq.com', '12345678a');
INSERT INTO `userlogin` VALUES ('9', 'zhangyihao', '12345678a', '123456@qq.com', '23456789a');
INSERT INTO `userlogin` VALUES ('10', 'zhangyan', '12345678a', '123456@qq.com', '34567890a');
INSERT INTO `userlogin` VALUES ('11', 'tianshuai', '12345678a', '123456@qq.com', '11111111a');
INSERT INTO `userlogin` VALUES ('13', 'qddaxue', '22222222a', '11@qq.com', '22222222a');
INSERT INTO `userlogin` VALUES ('14', '123456', 'fyx998131', '490363108@qq.com', 'fyx998131');
INSERT INTO `userlogin` VALUES ('15', '12345678', 'fyx998131', '490363108@qq.com', 'fyx998131');
INSERT INTO `userlogin` VALUES ('16', 'mabiao', '11111111a', 'qq@qq.com', '11111111a');
INSERT INTO `userlogin` VALUES ('17', 'hello123', '11111111a', '11@qq.com', '11111111a');
INSERT INTO `userlogin` VALUES ('18', 'lifanfan', '11111111a', 'dc@qq.com', '11111111a');
