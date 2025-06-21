/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : secondproductssm_db

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2023-06-27 01:53:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for about
-- ----------------------------
DROP TABLE IF EXISTS `about`;
CREATE TABLE `about` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of about
-- ----------------------------
INSERT INTO `about` VALUES ('1', '欢迎来到校园二手交易平台， 具体地址是河南省南阳宛城区河南南阳市宛城区天山路东华小区，联系人是ysyysyysy01。\r\n主要经营航模飞机。\r\n单位注册资金未知。\r\n我司主要产品有：IT 游戏机 航模 等，公司在激烈的市场竞争中迅速发展壮大，赢得了广泛的支持与用户的信赖。公司秉承“顾客至上，锐意进取”的经营理念，坚持“客户”的原则为广大客户提供优质的服务。本公司在今后的岁月中坚持“以质量求生存，以信誉求发展“的宗旨。将以更高的企业服务回馈朋友们的支持和厚爱，并竭诚欢迎您的惠顾。\r\n我司主要产品有：IT 游戏机 航模 等，公司在激烈的市场竞争中迅速发展壮大，赢得了广泛的支持与用户的信赖。公司秉承“顾客至上，锐意进取”的经营理念，坚持“客户”的原则为广大客户提供优质的服务。本公司在今后的岁月中坚持“以质量求生存，以信誉求发展“的宗旨。将以更高的企业服务回馈朋友们的支持和厚爱，并竭诚欢迎您的惠顾。');

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '11', '张三', '13483098204', '湖北省武汉市洪山广场209号', '1');
INSERT INTO `address` VALUES ('2', '12', '李四', '13732921238', '湖北省武汉市洪山广场109号', '0');
INSERT INTO `address` VALUES ('3', '11', '小白', '13483098200', '湖北省武汉市洪山广场999号', '1');
INSERT INTO `address` VALUES ('4', '11', '孙小梅', '13732921238', '湖北省武汉市洪山广场109号', '1');
INSERT INTO `address` VALUES ('5', '11', '小薇', '13874628204', '学生宿舍001', '0');
INSERT INTO `address` VALUES ('6', '12', '周华', '13483098205', '湖北省武汉市洪山广场109号', '1');
INSERT INTO `address` VALUES ('7', '13', '王五', '13732921234', '武汉光谷广场', '0');
INSERT INTO `address` VALUES ('8', '15', '赵伟', '13483098204', '湖北省武汉市洪山广场209号', '0');

-- ----------------------------
-- Table structure for backproduct
-- ----------------------------
DROP TABLE IF EXISTS `backproduct`;
CREATE TABLE `backproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `content` text,
  `shstatus` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL,
  `saverid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of backproduct
-- ----------------------------
INSERT INTO `backproduct` VALUES ('4', '15', '16', '质量不行', '已退货', '2020-03-20 18:42:49', '13', '12');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `fatherid` int(11) DEFAULT NULL,
  `leaf` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('76', '手机', '0', '0', '0');
INSERT INTO `category` VALUES ('77', '苹果', '76', '1', '0');
INSERT INTO `category` VALUES ('78', '电脑', '0', '0', '0');
INSERT INTO `category` VALUES ('79', '笔记本', '78', '1', '0');
INSERT INTO `category` VALUES ('80', '平板电脑', '78', '1', '0');
INSERT INTO `category` VALUES ('81', '相机', '0', '0', '0');
INSERT INTO `category` VALUES ('82', '佳能', '81', '1', '0');
INSERT INTO `category` VALUES ('83', 'SONY', '81', '1', '0');
INSERT INTO `category` VALUES ('84', '三星', '76', '1', '0');
INSERT INTO `category` VALUES ('85', 'VIVO', '76', '1', '0');
INSERT INTO `category` VALUES ('92', '测试大类', '0', '1', '1');
INSERT INTO `category` VALUES ('93', '测试小类', '92', '1', '1');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `content` text,
  `replycontent` text,
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for fav
-- ----------------------------
DROP TABLE IF EXISTS `fav`;
CREATE TABLE `fav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fav
-- ----------------------------
INSERT INTO `fav` VALUES ('1', '3', '15');

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES ('9', '3', 'in', '10');
INSERT INTO `inventory` VALUES ('10', '3', 'out', '1');
INSERT INTO `inventory` VALUES ('11', '2', 'in', '10');
INSERT INTO `inventory` VALUES ('12', '2', 'out', '1');
INSERT INTO `inventory` VALUES ('13', '6', 'in', '10');
INSERT INTO `inventory` VALUES ('14', '6', 'out', '1');
INSERT INTO `inventory` VALUES ('15', '5', 'in', '10');
INSERT INTO `inventory` VALUES ('16', '5', 'out', '2');
INSERT INTO `inventory` VALUES ('17', '16', 'in', '10');
INSERT INTO `inventory` VALUES ('18', '16', 'out', '2');
INSERT INTO `inventory` VALUES ('19', '16', 'out', '1');
INSERT INTO `inventory` VALUES ('20', '17', 'in', '10');
INSERT INTO `inventory` VALUES ('21', '14', 'in', '10');
INSERT INTO `inventory` VALUES ('22', '13', 'in', '10');
INSERT INTO `inventory` VALUES ('23', '12', 'in', '10');
INSERT INTO `inventory` VALUES ('24', '11', 'in', '10');
INSERT INTO `inventory` VALUES ('25', '11', 'in', '10');
INSERT INTO `inventory` VALUES ('26', '10', 'in', '10');
INSERT INTO `inventory` VALUES ('27', '9', 'in', '10');
INSERT INTO `inventory` VALUES ('28', '8', 'in', '10');
INSERT INTO `inventory` VALUES ('29', '17', 'out', '1');
INSERT INTO `inventory` VALUES ('30', '16', 'out', '2');
INSERT INTO `inventory` VALUES ('31', '17', 'in', '1');
INSERT INTO `inventory` VALUES ('32', '16', 'in', '2');
INSERT INTO `inventory` VALUES ('33', '16', 'out', '2');
INSERT INTO `inventory` VALUES ('34', '16', 'in', '2');
INSERT INTO `inventory` VALUES ('35', '19', 'in', '1000');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL,
  `upass` varchar(255) DEFAULT NULL,
  `tname` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `content` text,
  `lev` varchar(255) DEFAULT NULL,
  `integral` int(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  `yue` double(255,0) DEFAULT NULL,
  `bj` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('11', '0001', '202CB962AC59075B964B07152D234B70', '张三', '1552227390747.jpg', '13874628201', '1225272681@qq.com', '上个王者真不容易', '普通会员', '0', '2020-03-19 21:23:18', '0', '0', '计算机二班');
INSERT INTO `member` VALUES ('12', '0002', '202CB962AC59075B964B07152D234B70', '李四', '1546867459559.jpg', '13874628204', 'lisi@126.com', '上个王者真不容易', '普通会员', '0', '2020-03-19 21:24:44', '0', '1293', null);
INSERT INTO `member` VALUES ('15', '0003', '202CB962AC59075B964B07152D234B70', '赵伟', '1555756715353.jpg', '13483098204', 'zhaowei@126.com', '111', '普通会员', '0', '2020-03-20 18:39:13', '0', '3800', ' 计算机一班');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(255) DEFAULT NULL,
  `content` text,
  `savetime` varchar(255) DEFAULT NULL,
  `replycontent` text,
  `replysavetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `content` text,
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '2018年航空模型、无人机飞行器科普大赛精彩开幕！', '1555756642920.jpg', '本届大赛是在2017年首届青少年科普大赛的基础上推出的第二届大型青少年航空科普赛事。今年的比赛将从9月持续至11月,面向上海及各地区小学、初中、高中、技校、中专和职高的在读学生,进行航空科普、无人机编程、多旋翼DIY制作、多旋翼飞行、航空模型科普、航空模型专项竞技类及纸火箭制作等六个项目的比拼。比赛将航空知识科普和体育锻炼有机结合,内容涵盖航空科普、飞行原理、人工智能、电子技术、机械构造等多项科普及专项知识,以推广普及航空科技知识,带领青少年们走近航空运动和科技体育。', '2020-03-19 20:28:16');
INSERT INTO `news` VALUES ('7', '滨州学院学生利用自制航模 成就自己的飞天梦', '1546872276084.jpg', '“毕业后我想找一份能够与航模有关的工作。“大学时光过得太快，已经大四的王斌摆弄着手中的飞行器显得格外不舍。在众多社团成员眼中，王斌是他们的师哥，也是他们的老师，只要王斌一进入实验室，这里就会成为课堂。\r\n&emsp;&emsp;实验室内，摆放着各式各样的航模，如今的社团部长董建伟告诉记者，看似一台简单的航模，从设计到制作组装都要花掉他们数日的时间，甚至更长。\r\n&emsp;&emsp;“这些航模里边很多都是我们亲手制作的，虽然买台成品也并不贵，但我们享受的就是这个过程。”董建伟说。航模是个烧钱的爱好，如果操控过程中出现失误，很容易导致航模损坏。为避免出现事故，每位社团成员的电脑上都有一个模拟飞行的软件，没事的时候就会对着电脑练习操控。\r\n&emsp;&emsp;“这台飞行器是我自己攒的，结构与零件加起来至少花了我两万多块钱。”王斌告诉记者，自己的这个爱好家里非常支持，但过多的花费也让他非常头疼，于是在经过深思熟虑之后，他成立了自己的航拍公司，并逐渐开始盈利。\r\n&emsp;&emsp;“我就是想把我的爱好发展成为我将来的事业，利用我手中的飞行器成就我自己的飞天梦。”王斌说。1', '2020-03-19 20:50:39');

-- ----------------------------
-- Table structure for ordermsg
-- ----------------------------
DROP TABLE IF EXISTS `ordermsg`;
CREATE TABLE `ordermsg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderno` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `fkstatus` varchar(255) DEFAULT NULL,
  `shstatus` varchar(255) DEFAULT NULL,
  `addrid` varchar(255) DEFAULT NULL,
  `zffs` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `waybillno` varchar(255) DEFAULT NULL,
  `sellerid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ordermsg
-- ----------------------------
INSERT INTO `ordermsg` VALUES ('12', '541785', '15', '2600.00', '已付款', '待发货', '8', null, '2020-03-20 18:40:28', null, null, '11');
INSERT INTO `ordermsg` VALUES ('13', '742528', '15', '1800.00', '已付款', '已收货', '8', null, '2020-03-20 18:40:28', null, null, '12');
INSERT INTO `ordermsg` VALUES ('14', '026250', '15', '1300.00', '待付款', '', '8', null, '2020-05-08 10:12:44', null, null, '11');
INSERT INTO `ordermsg` VALUES ('15', '098363', '11', '4400.00', '待付款', '', '5', null, '2020-05-08 10:17:04', null, null, '15');
INSERT INTO `ordermsg` VALUES ('16', '175697', '15', '1300.00', '待付款', '', '8', null, '2020-05-08 10:52:38', null, null, '11');

-- ----------------------------
-- Table structure for ordermsgdetails
-- ----------------------------
DROP TABLE IF EXISTS `ordermsgdetails`;
CREATE TABLE `ordermsgdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderno` varchar(255) DEFAULT NULL,
  `productid` int(255) DEFAULT NULL,
  `sellerid` int(11) DEFAULT NULL,
  `memberid` int(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  `thstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ordermsgdetails
-- ----------------------------
INSERT INTO `ordermsgdetails` VALUES ('12', '541785', '17', '11', '15', '2', '2020-03-20 18:40:27', null);
INSERT INTO `ordermsgdetails` VALUES ('13', '742528', '16', '12', '15', '2', '2020-03-20 18:40:28', '已退货');
INSERT INTO `ordermsgdetails` VALUES ('14', '026250', '17', '11', '15', '1', '2020-05-08 10:12:44', null);
INSERT INTO `ordermsgdetails` VALUES ('15', '098363', '19', '15', '11', '1', '2020-05-08 10:17:04', null);
INSERT INTO `ordermsgdetails` VALUES ('16', '175697', '17', '11', '15', '1', '2020-05-08 10:52:38', null);

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES ('7', '1545279392511.jpg');
INSERT INTO `picture` VALUES ('8', '1545279402117.jpg');
INSERT INTO `picture` VALUES ('9', '1545279413276.jpg');
INSERT INTO `picture` VALUES ('10', '1545279439999.jpg');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productname` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `oldprice` double DEFAULT NULL,
  `price` double(255,0) DEFAULT NULL,
  `memberid` int(255) DEFAULT NULL,
  `fid` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `content` text,
  `vote` int(11) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  `issj` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  `looknum` int(11) DEFAULT NULL,
  `shstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'Apple iPhone X', '1545283942389.jpg', '7499', '6499', '12', '76', '77', '0', '<img src=\"/secondproductssm/attached/image/20181220/20181220133252_158.jpg\" alt=\"\" />', '0', '0', 'yes', '2020-03-19', '0', '通过审核');
INSERT INTO `product` VALUES ('2', 'Apple iPhone XS', '1545284871821.jpg', '9999', '8888', '12', '76', '77', '0', '<img src=\"/secondproductssm/attached/image/20181220/20181220134820_623.jpg\" alt=\"\" />', '4', '0', 'yes', '2020-03-19', '0', '通过审核');
INSERT INTO `product` VALUES ('3', 'Apple iPhone 8', '1545287142681.jpg', '4599', '4099', '12', '76', '77', '0', '<img src=\"/secondproductssm/attached/image/20181220/20181220142603_642.jpg\" alt=\"\" />', '2', '0', 'yes', '2020-03-19', '0', '通过审核');
INSERT INTO `product` VALUES ('4', '三星 Galaxy A9', '1545287241304.jpg', '1699', '1499', '12', '76', '84', '0', '<img src=\"/secondproductssm/attached/image/20181220/20181220142755_938.jpg\" alt=\"\" />', '0', '0', 'yes', '2020-03-19', '0', '通过审核');
INSERT INTO `product` VALUES ('5', '三星 Galaxy A6s', '1545287815837.jpg', '1999', '1799', '12', '76', '84', '0', '<img src=\"/secondproductssm/attached/image/20181220/20181220143725_152.jpg\" alt=\"\" />', '5', '0', 'yes', '2020-03-19', '0', '通过审核');
INSERT INTO `product` VALUES ('6', 'vivo X23全息幻彩版', '1545287938279.jpg', '2998', '2750', '12', '76', '85', '0', '<img src=\"/secondproductssm/attached/image/20181220/20181220143952_702.jpg\" alt=\"\" />', '1', '0', 'yes', '2020-03-19', '0', '通过审核');
INSERT INTO `product` VALUES ('7', '小米 (MI)Ruby 15.6英寸金属轻薄笔记本电脑', '1545288342203.jpg', '5998', '4999', '12', '78', '79', '0', '<img src=\"/secondproductssm/attached/image/20181220/20181220144559_440.jpg\" alt=\"\" />', '2', '0', 'yes', '2020-03-19', '0', '通过审核');
INSERT INTO `product` VALUES ('8', '荣耀MagicBook', '1545288405922.jpg', '4788', '3788', '11', '78', '79', '0', '<img src=\"/secondproductssm/attached/image/20181220/20181220144731_64.jpg\" alt=\"\" />', '1', '0', 'yes', '2020-03-19', '0', '通过审核');
INSERT INTO `product` VALUES ('9', '联想ThinkPad', '1545288484443.jpg', '6499', '5499', '11', '78', '79', '0', '<img src=\"/secondproductssm/attached/image/20181220/20181220144830_995.jpg\" alt=\"\" />', '0', '0', 'yes', '2020-03-19', '0', '通过审核');
INSERT INTO `product` VALUES ('10', 'Apple iPad 平板电脑', '1545288565886.jpg', '4359', '3359', '11', '78', '80', '0', '<img src=\"/secondproductssm/attached/image/20181220/20181220145004_306.jpg\" alt=\"\" />', '3', '0', 'yes', '2020-03-19', '0', '通过审核');
INSERT INTO `product` VALUES ('11', '微软（Microsoft）Surface Go ', '1545288639969.jpg', '4888', '3888', '11', '78', '80', '0', '<img src=\"/secondproductssm/attached/image/20181220/20181220145115_127.jpg\" alt=\"\" />', '3', '0', 'yes', '2020-03-19', '0', '通过审核');
INSERT INTO `product` VALUES ('12', '佳能（Canon）EOS 80D', '1545288734910.jpg', '9579', '8579', '11', '81', '82', '0', '<img src=\"/secondproductssm/attached/image/20181220/20181220145256_431.jpg\" alt=\"\" />', '3', '0', 'yes', '2020-03-19', '0', '通过审核');
INSERT INTO `product` VALUES ('13', '索尼（SONY） DSC-W800', '1545288835753.jpg', '669', '569', '11', '81', '83', '0', '<img src=\"/secondproductssm/attached/image/20181220/20181220145414_898.jpg\" alt=\"\" />', '2', '0', 'yes', '2020-03-19', '0', '通过审核');
INSERT INTO `product` VALUES ('14', 'vivo Z1青春版', '1545320084301.jpg', '1098', '1000', '11', '76', '85', '0', '<img src=\"/secondproductssm/attached/image/20181220/20181220233520_103.jpg\" alt=\"\" />111', '8', '0', 'yes', '2020-03-19', '0', '通过审核');
INSERT INTO `product` VALUES ('16', '微型单电套机', '1552228028979.jpg', '1000', '900', '12', '81', '83', '0', '1111', '37', '0', 'yes', '2020-03-19 22:27:25', '0', '通过审核');
INSERT INTO `product` VALUES ('17', '荣耀10青春版', '1552359317796.jpg', '1500', '1300', '11', '76', '85', '0', '111', '15', '0', 'yes', '2020-03-19 10:55:30', '0', '通过审核');
INSERT INTO `product` VALUES ('18', '测试商品', '1555757170866.jpg', '4000', '3000', '12', '76', '77', '0', '111', '0', '1', 'yes', '2020-03-20 18:46:21', '0', '通过审核');
INSERT INTO `product` VALUES ('19', '苹果手机', '1588904114215.png', '5000', '4400', '15', '76', '77', '0', '苹果手机', '3', '0', 'yes', '2020-05-08 10:15:45', '0', '待审核');

-- ----------------------------
-- Table structure for tousu
-- ----------------------------
DROP TABLE IF EXISTS `tousu`;
CREATE TABLE `tousu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `saverid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `content` text,
  `hfcontent` text,
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tousu
-- ----------------------------
INSERT INTO `tousu` VALUES ('6', '15', '12', '16', '卖假货', '好的，我处理', '2020-03-20 18:44:57');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `userpassword` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  `usertype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123', '张大仙', '男', '13872867577', '0', '超级管理员');
INSERT INTO `user` VALUES ('2', 'test', 'test', 'test', '男', '13212345678', '0', '管理员');

-- ----------------------------
-- Table structure for vote
-- ----------------------------
DROP TABLE IF EXISTS `vote`;
CREATE TABLE `vote` (
  `int` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  PRIMARY KEY (`int`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vote
-- ----------------------------
