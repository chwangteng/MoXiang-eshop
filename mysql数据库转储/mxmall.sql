/*
Navicat MySQL Data Transfer

Source Server         : mysqlconnection
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : mxmall

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-01-05 00:04:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(20) NOT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '家用电器');
INSERT INTO `category` VALUES ('2', '手机/运营商/数码');
INSERT INTO `category` VALUES ('3', '电脑办公');
INSERT INTO `category` VALUES ('4', '家居/家具/家装/厨具');
INSERT INTO `category` VALUES ('5', '男装/女装/童装/内衣');
INSERT INTO `category` VALUES ('6', '个护化妆/清洁用品/宠物');
INSERT INTO `category` VALUES ('7', '鞋靴/箱包/珠宝/奢侈品');
INSERT INTO `category` VALUES ('8', '运动/户外/钟表');
INSERT INTO `category` VALUES ('9', '汽车/汽车用品');
INSERT INTO `category` VALUES ('10', '母婴/玩具乐器');
INSERT INTO `category` VALUES ('11', '食品/酒类/生鲜/特产');
INSERT INTO `category` VALUES ('12', '医药保健');
INSERT INTO `category` VALUES ('13', '图书/音像/电子书');
INSERT INTO `category` VALUES ('14', '机票/酒店/旅游/生活');
INSERT INTO `category` VALUES ('15', '理财/众筹/保险');

-- ----------------------------
-- Table structure for consignee
-- ----------------------------
DROP TABLE IF EXISTS `consignee`;
CREATE TABLE `consignee` (
  `consigneeid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `consigneename` varchar(10) NOT NULL,
  `consigneeaddress` varchar(255) NOT NULL,
  `consigneephone` varchar(20) NOT NULL,
  PRIMARY KEY (`consigneeid`),
  KEY `foreign_userid_in_consignee` (`userid`),
  CONSTRAINT `foreign_userid_in_consignee` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consignee
-- ----------------------------
INSERT INTO `consignee` VALUES ('1', '3', '王腾处', '浙江省杭州市西湖区留下街道浙江工业大学', '17816875157');
INSERT INTO `consignee` VALUES ('2', '3', '王腾处', '浙江省绍兴市上虞区龙山玫瑰园8号楼', '13616852040');
INSERT INTO `consignee` VALUES ('3', '-1', 'w', 'ffgf', '111');
INSERT INTO `consignee` VALUES ('4', '-1', '呃呃呃', '11', '14');
INSERT INTO `consignee` VALUES ('5', '-1', '111', '绍兴', '131685204');
INSERT INTO `consignee` VALUES ('6', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('7', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('8', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('9', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('10', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('11', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('12', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('13', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('14', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('15', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('16', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('17', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('18', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('19', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('20', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('21', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('22', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('23', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('24', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('25', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('26', '-1', '王', '嘎嘎嘎但是', '1223123123');
INSERT INTO `consignee` VALUES ('27', '-1', '老周处', '安徽省合肥市包河区芜湖路街道合工大屯溪路校区6区606室', '17816875157');
INSERT INTO `consignee` VALUES ('28', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('29', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('30', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('31', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('32', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('33', '-1', '王', '地址', '啊啊');
INSERT INTO `consignee` VALUES ('34', '-1', '大是大非', '这阿金', '121312312');
INSERT INTO `consignee` VALUES ('36', '3', '测测12213', '的首发式地方', '123123');
INSERT INTO `consignee` VALUES ('37', '8', 'huhuhu', '侯辉华和iuhiu', '678676');
INSERT INTO `consignee` VALUES ('38', '-1', '', '', '');
INSERT INTO `consignee` VALUES ('39', '3', '王腾腾', '发哥发噶分三个撒个', '17816875157');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `messageid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `messagetime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `messagecontent` varchar(255) NOT NULL,
  PRIMARY KEY (`messageid`),
  KEY `foreign_userid_in_message` (`userid`),
  KEY `foreign_productid_in_message` (`productid`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '3', '1', '2016-12-24 15:16:16', '这款带加热功能吗？');
INSERT INTO `message` VALUES ('2', '3', '1', '2016-12-24 15:16:56', '还想问一下功率多达，能打全鱼骨汤吗？刀头会不会容易磨损。');
INSERT INTO `message` VALUES ('6', '-1', '2', '2016-12-26 14:52:49', '多大的尺码');
INSERT INTO `message` VALUES ('8', '-1', '2', '2016-12-26 14:53:51', '这衣服我喜欢');
INSERT INTO `message` VALUES ('9', '-1', '4', '2016-12-26 14:54:20', '小米怎么老是没有货，饥饿营销啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊');
INSERT INTO `message` VALUES ('10', '-1', '3', '2016-12-26 14:57:58', '支持国产');
INSERT INTO `message` VALUES ('12', '-1', '6', '2016-12-27 16:07:44', '哈哈，不知道这个镜头好不好呢');
INSERT INTO `message` VALUES ('17', '1', '12', '2016-12-28 21:07:16', '这款商品很好哦，大家可以试试看');
INSERT INTO `message` VALUES ('18', '-1', '2', '2016-12-28 23:57:25', '好看吗');

-- ----------------------------
-- Table structure for oderitem
-- ----------------------------
DROP TABLE IF EXISTS `oderitem`;
CREATE TABLE `oderitem` (
  `orderid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `oderitemquantity` int(11) NOT NULL,
  `orderitemprice` decimal(10,2) NOT NULL,
  `orderitemid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`orderitemid`),
  KEY `foreign_orderid_in_orderitem` (`orderid`),
  KEY `foreign_productid_in_orderitem` (`productid`),
  CONSTRAINT `foreign_orderid_in_orderitem` FOREIGN KEY (`orderid`) REFERENCES `order` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foreign_productid_in_orderitem` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oderitem
-- ----------------------------
INSERT INTO `oderitem` VALUES ('149', '3', '1', '2799.00', '212');
INSERT INTO `oderitem` VALUES ('151', '3', '1', '2799.00', '214');
INSERT INTO `oderitem` VALUES ('157', '3', '9', '25191.00', '220');
INSERT INTO `oderitem` VALUES ('160', '3', '1', '2799.00', '223');
INSERT INTO `oderitem` VALUES ('164', '3', '1', '2799.00', '227');
INSERT INTO `oderitem` VALUES ('166', '2', '1', '368.00', '229');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `consigneeid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `orderpricetotal` decimal(10,2) NOT NULL,
  `ordertime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `orderstateid` int(11) NOT NULL,
  `orderpricereal` decimal(10,2) NOT NULL,
  `orderpricepoint` decimal(10,2) NOT NULL,
  PRIMARY KEY (`orderid`),
  KEY `foreign_userid_in_order` (`userid`),
  KEY `foreign_orderstateid_in_order` (`orderstateid`),
  KEY `foreign_consigneeid_in_order` (`consigneeid`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`consigneeid`) REFERENCES `consignee` (`consigneeid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`orderstateid`) REFERENCES `orderstate` (`orderstateid`),
  CONSTRAINT `order_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('149', '1', '3', '2799.00', '2016-12-26 19:08:58', '5', '2799.00', '0.00');
INSERT INTO `order` VALUES ('151', '1', '3', '2799.00', '2016-12-26 19:09:35', '5', '2798.00', '100.00');
INSERT INTO `order` VALUES ('157', '1', '3', '25191.00', '2016-12-28 13:52:10', '4', '25191.00', '0.00');
INSERT INTO `order` VALUES ('160', '37', '8', '2799.00', '2016-12-28 17:36:54', '5', '2799.00', '0.00');
INSERT INTO `order` VALUES ('164', '1', '3', '2799.00', '2016-12-28 23:59:45', '4', '2794.00', '500.00');
INSERT INTO `order` VALUES ('166', '1', '3', '368.00', '2017-01-04 22:38:57', '2', '368.00', '0.00');

-- ----------------------------
-- Table structure for orderstate
-- ----------------------------
DROP TABLE IF EXISTS `orderstate`;
CREATE TABLE `orderstate` (
  `orderstateid` int(11) NOT NULL AUTO_INCREMENT,
  `orderstatename` varchar(20) NOT NULL,
  PRIMARY KEY (`orderstateid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderstate
-- ----------------------------
INSERT INTO `orderstate` VALUES ('1', '未支付');
INSERT INTO `orderstate` VALUES ('2', '已支付，待发货');
INSERT INTO `orderstate` VALUES ('3', '已发货');
INSERT INTO `orderstate` VALUES ('4', '交易完成');
INSERT INTO `orderstate` VALUES ('5', '交易失败');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `productprice` decimal(10,2) NOT NULL,
  `productname` varchar(255) NOT NULL,
  `productdetail` text,
  `productstock` int(11) NOT NULL,
  `producttag` varchar(10) NOT NULL DEFAULT '第三方',
  PRIMARY KEY (`productid`),
  KEY `foreign_categoryid_in_product` (`categoryid`),
  KEY `foreign_userid_in_product` (`userid`),
  CONSTRAINT `foreign_categoryid_in_product` FOREIGN KEY (`categoryid`) REFERENCES `category` (`categoryid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foreign_userid_in_product` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '1', '1', '3999.00', '飞利浦（PHILIPS）高速破壁料理机HR3868/00 榨汁机辅食多功能搅拌机', '高达45000转/分,轻松粉碎坚硬食物！溶解食物纤维,97%营养释放！一机多用，满足全家需求，释放厨房空间！', '197', '自营');
INSERT INTO `product` VALUES ('2', '3', '5', '368.00', 'Ralph Lauren衬衫拉夫劳伦衬衣男士长袖 纯色/细条纹 纯蓝 M', null, '8', '第三方');
INSERT INTO `product` VALUES ('3', '3', '2', '2799.00', '华为 Mate 8 3GB+32GB版 月光银 移动联通电信4G手机 双卡双待', '麒麟950芯片，高性能与长续航的结合！', '645', '第三方');
INSERT INTO `product` VALUES ('4', '1', '2', '3999.00', '小米MIX 全网通 尊享版 6GB内存 256GB ROM 陶瓷黑 移动联通电信4G手机', '6.4英寸全面屏概念手机，陶瓷声学系统，别具匠心！', '999', '自营');
INSERT INTO `product` VALUES ('5', '1', '11', '108.00', '名家厨房 澳洲菲力牛排10片装 1300g 赠双刀叉黄油酱包', '新年下单送110g意面', '689', '自营');
INSERT INTO `product` VALUES ('6', '1', '2', '6999.99', '尼康（Nikon） D7100 单反双镜头套机（DX 35mm自动对焦镜头）黑色', '【好评如潮！摄影天，35和18-140更配哦】更长焦距、更多精彩！女友的靓照、宝娃的萌图，只需一个35 1.8G！', '89', '自营');
INSERT INTO `product` VALUES ('7', '3', '1', '999.00', '飞利浦(PHILIPS)智能扫地机器人FC8710/82 纤薄吸尘器', '【约惠圣诞，享劲爆价，数量有限，售完即止！】【电池升级，续航加持】6cm纤薄款再升级，待机时长增至130分钟，轻松出入床底打扫！四种清洁模式，能遥控!', '45', '第三方');
INSERT INTO `product` VALUES ('12', '1', '1', '5999.00', '西门子冰箱西门子冰箱西门子冰箱冰箱冰箱冰箱', '西门子冰箱西门子冰箱西门子冰箱西门子冰箱西门子冰箱西门子冰箱', '12', '自营');
INSERT INTO `product` VALUES ('13', '3', '10', '78.00', '日本花王(Merries)妙而舒纸尿裤 新生儿NB90片(0-5kg) 原装进口', '【新老包装随机发货】日本原装花王！腰贴式棉柔弹性设计，温柔呵护宝宝娇嫩肌肤~凹凸透气柔点网层设计，让每根纤维都含植物精华，有效预防和控制尿布疹~更有变色尿显、棉柔魔术贴等贴心设计，妈妈们好评如潮！', '78', '第三方');
INSERT INTO `product` VALUES ('14', '3', '12', '1688.00', '胡庆余堂 冬虫夏草 虫草 冬虫夏草礼盒 7克精选35#西藏那曲', '新版烤漆木盒倾情巨献，新版烤漆礼盒与之前的礼盒随机发送。《本草从新》记载：“冬虫夏草性味甘，温。功能补肺益肾，化痰止咳。可用之于久咳虚喘，产后虚弱、阳痿阴冷等” 【百年老店，上层品质，送礼佳品】', '1688', '第三方');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  `userpassword` varchar(20) NOT NULL DEFAULT '',
  `userpoint` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('-1', '游客', '', '0.00');
INSERT INTO `user` VALUES ('1', '自营商品账号', '88888888', '0.00');
INSERT INTO `user` VALUES ('3', 'chwangteng', '123456', '227.94');
INSERT INTO `user` VALUES ('8', 'zjut', '123456', '20.00');
INSERT INTO `user` VALUES ('10', '67676767', '111111', '500.00');
INSERT INTO `user` VALUES ('11', '123', '123456', '0.00');
SET FOREIGN_KEY_CHECKS=1;
