/*
Navicat MySQL Data Transfer

Source Server         : beautyguru.speranzainc.net
Source Server Version : 50554
Source Host           : beautyguru.speranzainc.net:3306
Source Database       : beautyguru

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2017-11-06 09:57:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_users
-- ----------------------------
DROP TABLE IF EXISTS `auth_users`;
CREATE TABLE `auth_users` (
  `ause_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `ause_key` varchar(32) NOT NULL,
  `ause_trademark_id` int(11) DEFAULT NULL,
  `ause_company_id` smallint(6) DEFAULT NULL,
  `ause_name` varchar(100) NOT NULL,
  `ause_username` varchar(50) NOT NULL,
  `ause_email` varchar(50) NOT NULL,
  `ause_secretkey` varchar(52) NOT NULL,
  `ause_salt` varchar(32) NOT NULL,
  `ause_password` varchar(120) NOT NULL,
  `ause_position` smallint(6) NOT NULL,
  `ause_status` varchar(5) DEFAULT NULL,
  `ause_created` datetime NOT NULL,
  `ause_modified` datetime DEFAULT NULL,
  `ause_picture` varchar(120) DEFAULT NULL,
  `ause_authority` varchar(20) DEFAULT NULL,
  `ause_lastlogin` datetime DEFAULT NULL,
  `ause_sorting` int(11) DEFAULT NULL,
  `ause_deleted` datetime DEFAULT NULL,
  `ause_level` int(11) DEFAULT NULL,
  `ause_country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ause_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10137 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_users
-- ----------------------------
INSERT INTO `auth_users` VALUES ('10001', 'V9ZXr6Uw', null, null, 'Trường Khương', 'khuongxuantruong@gmail.com', 'khuongxuantruong@gmail.com', '7PtY3oAdRdK6P7YncnroQ2KLnLoPjrnW', 'FA04iw9qhWlT', '$S$5XyAXQCmMm7T9Mqg6gmFPKti2bxVaVdq7U5YL/WJpL5KZeDDw5dr', '1', 'true', '2013-04-02 16:43:42', '2017-06-11 21:40:38', 'https://lh5.googleusercontent.com/-WAMgTlfd5og/AAAAAAAAAAI/AAAAAAAAAP0/b0LCEJbexS4/photo.jpg', '1,999', '2013-04-08 10:01:04', null, null, '0', null);
INSERT INTO `auth_users` VALUES ('10018', 'QOEb1vsc', null, null, 'Admin', 'admin', 'Admin@gmail.com', 'qBKh4pA07aiU4WNbLCHLjhzpaFnjWXYP', '7PrSkIXh', '$S$5TeYdRnr7kYTZXde7/rMtd/yfcVlFBt5JnQoFSGCYTY3CAel46oC', '1', 'true', '2014-12-11 23:01:35', '2017-10-19 11:00:57', 'http://beautyguru.speranzainc.net/data/1002/1386662148-13455094851361762701-574-0.jpg', '1,2,3,1003,1002', null, null, null, '0', null);
INSERT INTO `auth_users` VALUES ('10134', 'zX6G8mOS', null, null, 'VN001', 'VN001', 'VN001@gmail.com', 'jyDuvRmgal1IhrfBkoYnzJc9CtsGx540', 'ZijMNzKe', '$S$5VXinpX18saHHjqfdyhVx0GvP4kjr2I009VegDc3cqaCLQjAJ5UK', '2', 'true', '2017-11-02 11:35:19', null, '', null, null, '6', null, '1', '237');
INSERT INTO `auth_users` VALUES ('10130', 'c5QuPfeJ', '1', null, '2222', '22222222', 'khuongxuantruong@gmail.com', 'p6ucrqYXHZgzm8EKDt4SayPlf0JLAOWF', '95plgsj8', '$S$5CsQqTpX8iHPgS.ZKXumbtiAvmWteioVoZ1.4AkPfrr2actl4G.R', '2', 'true', '2017-10-19 15:39:26', '2017-10-19 15:43:11', '', null, null, '2', '2017-10-19 15:43:07', '2', '237');
INSERT INTO `auth_users` VALUES ('10131', '5PquRsVD', '6', null, 'User 01', 'user01', 'khuongxuantruong@gmail.com', 'nRQLG8B9IEqwANVxCzJS5gydolh1XtFp', 'r1vslfTL', '$S$5wM0hln8BiRaRJRGLBH2OZ/DF9zc8VzIWge7dTWUkgL7.Ts0X0Rj', '3', 'true', '2017-10-19 15:48:36', null, '', null, null, '3', null, '2', '237');
INSERT INTO `auth_users` VALUES ('10132', 'JBO0sD8h', '1', null, 'Brand Manager', 'Temple', 'tklong@apcs.vn', 'NuXmnJzQd8UMA9BCaLRiOrEcoetIH3pb', '4sHM8uT5', '$S$59lfmWsNi6UcNC1E.YYK7.CaOl1F669dlmrRKEF2L9K/U67MnDHI', '3', 'true', '2017-10-19 17:01:43', null, '/data/image/Logo.png', null, null, '4', null, '2', '237');
INSERT INTO `auth_users` VALUES ('10133', 'LElbSUXV', '12', null, 'User02', 'user02', 'user02@gmail.com', 'FvQxCdWE3cNq0A2lUg7BphZ8aM1DTryw', '8zZgpGaD', '$S$5g/LU/EmWpkq8BPejx5Xyf5suAqWhGjzduWE/6TfBdAPDy/H0ZbI', '3', 'true', '2017-11-01 21:18:03', '2017-11-01 22:26:14', 'http://beautyguru.speranzainc.net/data/image/avatar/12.jpg', null, null, '5', null, '2', '237');
INSERT INTO `auth_users` VALUES ('10135', 'hFosm4xK', null, null, 'Local Admin VN', 'adminVN', 'tklong@apcs.vn', '0yp8oicnueDP1EtQdT24GMCW37qRxSYJ', 'vqrPax56', '$S$55y/yr5osvGM9Mc4.W0YeWrUPRAofIR0Daw5nRXNFuputfrA03W5', '2', 'true', '2017-11-02 15:35:59', null, '', null, null, '7', null, '1', '237');
INSERT INTO `auth_users` VALUES ('10136', 'zroj2JB4', null, null, 'Local Admin Sing', 'adminSG', 'admin@gmail.com', '9uIB35xinKXwa0zVoSrENjZeftqc7DGp', 'nyquedtD', '$S$5DFcXhGTBNTY5XPZYEBzwJQI/90HHpT/UZwjwef2MNYAs4i3SRhS', '2', 'true', '2017-11-02 15:58:45', null, '', null, null, '8', null, '1', '195');

-- ----------------------------
-- Table structure for ci_sessions
-- ----------------------------
DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ci_sessions
-- ----------------------------
INSERT INTO `ci_sessions` VALUES ('6pg27q5k87jp3cdvqkjjdb6rmupp8ep8', '127.0.0.1', '1509935101', 0x5F5F63695F6C6173745F726567656E65726174657C693A313530393933353130313B);
INSERT INTO `ci_sessions` VALUES ('gjai9f9korc925rudsbneh83kof5j6hq', '127.0.0.1', '1509935459', 0x5F5F63695F6C6173745F726567656E65726174657C693A313530393933353136383B6E6C6F67696E7C693A303B4B4346494E4445527C613A343A7B733A383A2264697361626C6564223B623A303B733A393A2275706C6F616455524C223B733A33383A22687474703A2F2F626561757479677572752E73706572616E7A61696E632E6E65742F64617461223B733A393A2275706C6F6164446972223B733A33333A22433A5C526F6F745C426561757479677572755C73797374656D5C2E2E2F64617461223B733A363A22616363657373223B613A323A7B733A353A2266696C6573223B613A363A7B733A363A2275706C6F6164223B623A313B733A363A2264656C657465223B623A313B733A343A22636F7079223B623A313B733A343A226D6F7665223B623A313B733A363A2272656E616D65223B623A313B733A343A2265646974223B623A313B7D733A343A2264697273223B613A333A7B733A363A22637265617465223B623A313B733A363A2264656C657465223B623A313B733A363A2272656E616D65223B623A313B7D7D7D64617362626F6172645F757365727C4F3A383A22737464436C617373223A31383A7B733A373A22617573655F6964223B733A353A223130303138223B733A383A22617573655F6B6579223B733A383A22514F456231767363223B733A31373A22617573655F74726164656D61726B5F6964223B4E3B733A31353A22617573655F636F6D70616E795F6964223B4E3B733A393A22617573655F6E616D65223B733A353A2241646D696E223B733A31333A22617573655F757365726E616D65223B733A353A2261646D696E223B733A31303A22617573655F656D61696C223B733A31353A2241646D696E40676D61696C2E636F6D223B733A31333A22617573655F706F736974696F6E223B733A313A2231223B733A31313A22617573655F737461747573223B733A343A2274727565223B733A31323A22617573655F63726561746564223B733A31393A22323031342D31322D31312032333A30313A3335223B733A31333A22617573655F6D6F646966696564223B733A31393A22323031372D31302D31392031313A30303A3537223B733A31323A22617573655F70696374757265223B733A38353A22687474703A2F2F626561757479677572752E73706572616E7A61696E632E6E65742F646174612F313030322F313338363636323134382D31333435353039343835313336313736323730312D3537342D302E6A7067223B733A31343A22617573655F617574686F72697479223B733A31353A22312C322C332C313030332C31303032223B733A31343A22617573655F6C6173746C6F67696E223B4E3B733A31323A22617573655F736F7274696E67223B4E3B733A31323A22617573655F64656C65746564223B4E3B733A31303A22617573655F6C6576656C223B733A313A2230223B733A31353A22617573655F636F756E7472795F6964223B4E3B7D);
INSERT INTO `ci_sessions` VALUES ('kl6qqk3jt74l4h076800sb9i3oa4nuih', '127.0.0.1', '1509936608', 0x5F5F63695F6C6173745F726567656E65726174657C693A313530393933363433333B);
INSERT INTO `ci_sessions` VALUES ('srkesrcvrqi2lm24t80bf1atmgrl1mqf', '127.0.0.1', '1509935891', 0x5F5F63695F6C6173745F726567656E65726174657C693A313530393933353735373B6E6C6F67696E7C693A323B);
INSERT INTO `ci_sessions` VALUES ('sucj5mpqgeak3g070a5i0up4ofl9put2', '127.0.0.1', '1509937008', 0x5F5F63695F6C6173745F726567656E65726174657C693A313530393933373030313B6E6C6F67696E7C693A303B4B4346494E4445527C613A343A7B733A383A2264697361626C6564223B623A303B733A393A2275706C6F616455524C223B733A33383A22687474703A2F2F626561757479677572752E73706572616E7A61696E632E6E65742F64617461223B733A393A2275706C6F6164446972223B733A33333A22433A5C526F6F745C426561757479677572755C73797374656D5C2E2E2F64617461223B733A363A22616363657373223B613A323A7B733A353A2266696C6573223B613A363A7B733A363A2275706C6F6164223B623A313B733A363A2264656C657465223B623A313B733A343A22636F7079223B623A313B733A343A226D6F7665223B623A313B733A363A2272656E616D65223B623A313B733A343A2265646974223B623A313B7D733A343A2264697273223B613A333A7B733A363A22637265617465223B623A313B733A363A2264656C657465223B623A313B733A363A2272656E616D65223B623A313B7D7D7D64617362626F6172645F757365727C4F3A383A22737464436C617373223A31383A7B733A373A22617573655F6964223B733A353A223130303138223B733A383A22617573655F6B6579223B733A383A22514F456231767363223B733A31373A22617573655F74726164656D61726B5F6964223B4E3B733A31353A22617573655F636F6D70616E795F6964223B4E3B733A393A22617573655F6E616D65223B733A353A2241646D696E223B733A31333A22617573655F757365726E616D65223B733A353A2261646D696E223B733A31303A22617573655F656D61696C223B733A31353A2241646D696E40676D61696C2E636F6D223B733A31333A22617573655F706F736974696F6E223B733A313A2231223B733A31313A22617573655F737461747573223B733A343A2274727565223B733A31323A22617573655F63726561746564223B733A31393A22323031342D31322D31312032333A30313A3335223B733A31333A22617573655F6D6F646966696564223B733A31393A22323031372D31302D31392031313A30303A3537223B733A31323A22617573655F70696374757265223B733A38353A22687474703A2F2F626561757479677572752E73706572616E7A61696E632E6E65742F646174612F313030322F313338363636323134382D31333435353039343835313336313736323730312D3537342D302E6A7067223B733A31343A22617573655F617574686F72697479223B733A31353A22312C322C332C313030332C31303032223B733A31343A22617573655F6C6173746C6F67696E223B4E3B733A31323A22617573655F736F7274696E67223B4E3B733A31323A22617573655F64656C65746564223B4E3B733A31303A22617573655F6C6576656C223B733A313A2230223B733A31353A22617573655F636F756E7472795F6964223B4E3B7D);
INSERT INTO `ci_sessions` VALUES ('vblqc1mtl5q5nvcsu2397bp51nera2r9', '127.0.0.1', '1509872314', 0x5F5F63695F6C6173745F726567656E65726174657C693A313530393837323238393B);
INSERT INTO `ci_sessions` VALUES ('veu5tuj8j424s9jd26ftrsco0tpvhcqf', '127.0.0.1', '1509899935', 0x5F5F63695F6C6173745F726567656E65726174657C693A313530393839393933353B);

-- ----------------------------
-- Table structure for tbl_category
-- ----------------------------
DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE `tbl_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `data` longtext,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  `pid` int(11) DEFAULT '0',
  `value` varchar(255) DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_category
-- ----------------------------
INSERT INTO `tbl_category` VALUES ('1', 'Content Provider', 'content-provider', 'a:2:{s:4:\"link\";s:0:\"\";s:4:\"icon\";s:9:\"icon-home\";}', '2017-05-03 15:41:34', '2017-09-02 22:10:55', 'dashboard', '1', '0', '>1', '0');
INSERT INTO `tbl_category` VALUES ('2', 'News & Blogs', 'news-blogs', 'a:2:{s:4:\"link\";s:0:\"\";s:4:\"icon\";s:10:\"fa fa-bars\";}', '2017-05-03 15:51:09', '2017-09-02 22:10:55', 'dashboard', '0', '1', '>1>2', '0');
INSERT INTO `tbl_category` VALUES ('20', 'Events Category', 'events-category', 'a:2:{s:4:\"link\";s:27:\"/dashboard/category/view/10\";s:4:\"icon\";s:0:\"\";}', '2017-05-16 14:56:06', '2017-09-02 22:10:55', 'dashboard', '0', '30', '>1>30>20', '7');
INSERT INTO `tbl_category` VALUES ('4', 'AAAA', 'aaaa', 'a:2:{s:4:\"link\";s:0:\"\";s:4:\"icon\";s:0:\"\";}', '2017-05-03 16:57:43', '2017-09-02 22:10:55', 'dashboard2', '0', null, '>4', '0');
INSERT INTO `tbl_category` VALUES ('5', 'Category', 'category', 'a:2:{s:4:\"link\";s:26:\"/dashboard/category/view/5\";s:4:\"icon\";s:0:\"\";}', '2017-05-03 21:43:59', '2017-09-02 22:10:55', 'dashboard', '0', '2', '>1>2>5', '0');
INSERT INTO `tbl_category` VALUES ('6', 'Service Operator', 'service-operator', 'a:2:{s:4:\"link\";s:0:\"\";s:4:\"icon\";s:13:\"icon-settings\";}', '2017-05-03 21:59:44', '2017-09-02 22:10:55', 'dashboard', '1', '0', '>6', '0');
INSERT INTO `tbl_category` VALUES ('7', 'Setting', 'setting', 'a:2:{s:4:\"link\";s:0:\"\";s:4:\"icon\";s:10:\"fa fa-cogs\";}', '2017-05-03 22:00:16', '2017-09-02 22:10:55', 'dashboard', '1', '6', '>6>7', '0');
INSERT INTO `tbl_category` VALUES ('8', 'User Managerment', 'user-managerment', 'a:2:{s:4:\"link\";s:0:\"\";s:4:\"icon\";s:9:\"icon-user\";}', '2017-05-03 22:00:48', '2017-09-02 22:10:55', 'dashboard', '1', '6', '>6>8', '0');
INSERT INTO `tbl_category` VALUES ('9', 'File Manager', 'file-manager', 'a:2:{s:4:\"link\";s:0:\"\";s:4:\"icon\";s:11:\"fa fa-image\";}', '2017-05-03 22:01:19', '2017-09-02 22:10:55', 'dashboard', '1', '6', '>6>9', '0');
INSERT INTO `tbl_category` VALUES ('10', 'Mobile Developer', 'mobile-developer', 'a:2:{s:4:\"link\";s:0:\"\";s:4:\"icon\";s:0:\"\";}', '2017-05-05 19:39:38', '2017-09-02 22:10:55', 'news', '0', null, '>10', '0');
INSERT INTO `tbl_category` VALUES ('11', 'Web Development', 'web-development', 'a:2:{s:4:\"link\";s:0:\"\";s:4:\"icon\";s:0:\"\";}', '2017-05-05 19:39:49', '2017-09-02 22:10:55', 'news', '0', null, '>11', '0');
INSERT INTO `tbl_category` VALUES ('12', 'Graphic Design', 'graphic-design', 'a:2:{s:4:\"link\";s:0:\"\";s:4:\"icon\";s:0:\"\";}', '2017-05-05 19:40:00', '2017-09-02 22:10:55', 'news', '0', null, '>12', '0');
INSERT INTO `tbl_category` VALUES ('13', 'Printing', 'printing', 'a:2:{s:4:\"link\";s:0:\"\";s:4:\"icon\";s:0:\"\";}', '2017-05-05 19:40:05', '2017-09-02 22:10:55', 'news', '0', null, '>13', '0');
INSERT INTO `tbl_category` VALUES ('14', 'Thiết Kế Đồ Họa', 'thiet-ke-do-hoa', 'a:4:{s:8:\"subtitle\";s:51:\"Đưa ý tưởng đến gần với cuộc sống.\";s:4:\"desc\";s:336:\"Chúng tôi không biết điều gì sẽ cứu vãn thế giới, nhưng chúng tôi chắc chắn rằng bất kể nó là gì, nó phải được thiết kế hoàn hảo. Cho dù đó là đồ họa, bố cục quảng cáo hoặc thiết kế bao bì, hoạt động của chúng tôi thúc đẩy mọi người hành động.\";s:5:\"cover\";s:31:\"/assets/creative/images/107.jpg\";s:5:\"links\";s:119:\"<li>Thiết Kế Ấn Phẩm.</li>\n<li>Làm & Chỉnh Sửa Phim/Clip.</li>\n<li>Thiết Kế Bao Bì Sản Phẩm.</li>\";}', '2017-05-15 21:57:19', '2017-09-02 22:10:55', 'services', '1', null, '>14', '22');
INSERT INTO `tbl_category` VALUES ('15', 'Thiết Kế & Phát Triển Website/App', 'thiet-ke-phat-trien-websiteapp', 'a:4:{s:8:\"subtitle\";s:63:\"Hãy để chúng tôi thay bạn tạo nên sự khác biệt.\";s:4:\"desc\";s:420:\"Tùy thuộc vào nhiệm vụ, chúng tôi sẽ nghĩ về một vài bước tiếp theo trong mong muốn của khách hàng về quá trình phát triển website của họ dựa trên những giải pháp của chúng tôi, cho dù đó là thiết kế hoặc công nghệ được sử dụng. Kết quả là có dễ sử dụng, thỏa mái, thực tiễn và hỗ trợ sản phẩm trên mọi thiết bị.\";s:5:\"cover\";s:23:\"/data/image/img/108.jpg\";s:5:\"links\";s:120:\"<li>Đáp ứng cho mọi thiết bị.</li>\n<li>Thiết kế UX/UI.</li>\n<li>Thiết kế website dành cho mobile</li>\";}', '2017-05-15 22:03:13', '2017-09-02 22:10:55', 'services', '1', null, '>15', '21');
INSERT INTO `tbl_category` VALUES ('16', 'Phát Triển Website', 'phat-trien-website', 'a:4:{s:8:\"subtitle\";s:32:\"Lorem Ipsum is simply dummy text\";s:4:\"desc\";s:73:\"Lorem Ipsum is simply dummy text of the printing and typesetting industry\";s:5:\"cover\";s:23:\"/data/image/img/103.jpg\";s:5:\"links\";s:107:\"<li>Ipsum is simply dummy text</li>\n<li>Ipsum is simply dummy text</li>\n<li>Ipsum is simply dummy text</li>\";}', '2017-05-15 22:08:13', '2017-09-02 22:10:55', 'services', '1', null, '>16', '20');
INSERT INTO `tbl_category` VALUES ('17', 'All News & Blogs', 'all-news-blogs', 'a:2:{s:4:\"link\";s:13:\"/dashboard/20\";s:4:\"icon\";s:0:\"\";}', '2017-05-16 10:51:33', '2017-09-02 22:10:55', 'dashboard', '0', '2', '>1>2>17', '4');
INSERT INTO `tbl_category` VALUES ('18', 'Service Category', 'service-category', 'a:2:{s:4:\"link\";s:26:\"/dashboard/category/view/9\";s:4:\"icon\";s:0:\"\";}', '2017-05-16 10:56:52', '2017-09-02 22:10:55', 'dashboard', '0', '28', '>1>28>18', '5');
INSERT INTO `tbl_category` VALUES ('19', 'Home Slider', 'home-slider', 'a:2:{s:4:\"link\";s:12:\"/dashboard/8\";s:4:\"icon\";s:0:\"\";}', '2017-05-16 10:57:39', '2017-09-02 22:10:55', 'dashboard', '0', '1', '>1>19', '6');
INSERT INTO `tbl_category` VALUES ('21', 'Projects Category', 'projects-category', 'a:2:{s:4:\"link\";s:27:\"/dashboard/category/view/11\";s:4:\"icon\";s:0:\"\";}', '2017-05-16 14:56:35', '2017-09-02 22:10:55', 'dashboard', '0', '34', '>1>34>21', '8');
INSERT INTO `tbl_category` VALUES ('22', 'Web Development', 'web-development', 'N;', '2017-05-16 14:58:42', '2017-09-02 22:10:55', 'projects', '1', null, '>22', '9');
INSERT INTO `tbl_category` VALUES ('23', 'Mobile Developer', 'mobile-developer', 'N;', '2017-05-16 14:58:49', '2017-09-02 22:10:55', 'projects', '1', null, '>23', '10');
INSERT INTO `tbl_category` VALUES ('24', 'App Developer', 'app-developer', 'N;', '2017-05-16 14:58:59', '2017-09-02 22:10:55', 'projects', '1', null, '>24', '11');
INSERT INTO `tbl_category` VALUES ('25', 'Thiết Kế In Ấn', 'thiet-ke-in-an', 'a:4:{s:8:\"subtitle\";s:32:\"Lorem Ipsum is simply dummy text\";s:4:\"desc\";s:73:\"Lorem Ipsum is simply dummy text of the printing and typesetting industry\";s:5:\"cover\";s:23:\"/data/image/img/105.jpg\";s:5:\"links\";s:107:\"<li>Ipsum is simply dummy text</li>\n<li>Ipsum is simply dummy text</li>\n<li>Ipsum is simply dummy text</li>\";}', '2017-05-18 15:49:15', '2017-09-02 22:10:55', 'services', '1', null, '>25', '19');
INSERT INTO `tbl_category` VALUES ('26', 'Thiết Kế & Xây Dựng Thương Hiệu', 'thiet-ke-xay-dung-thuong-hieu', 'a:4:{s:8:\"subtitle\";s:32:\"Lorem Ipsum is simply dummy text\";s:4:\"desc\";s:73:\"Lorem Ipsum is simply dummy text of the printing and typesetting industry\";s:5:\"cover\";s:23:\"/data/image/img/106.jpg\";s:5:\"links\";s:107:\"<li>Ipsum is simply dummy text</li>\n<li>Ipsum is simply dummy text</li>\n<li>Ipsum is simply dummy text</li>\";}', '2017-05-18 15:49:35', '2017-09-02 22:10:55', 'services', '1', null, '>26', '18');
INSERT INTO `tbl_category` VALUES ('27', 'Marketing Online', 'marketing-online', 'a:4:{s:8:\"subtitle\";s:32:\"Lorem Ipsum is simply dummy text\";s:4:\"desc\";s:73:\"Lorem Ipsum is simply dummy text of the printing and typesetting industry\";s:5:\"cover\";s:26:\"/data/image/img/design.jpg\";s:5:\"links\";s:107:\"<li>Ipsum is simply dummy text</li>\n<li>Ipsum is simply dummy text</li>\n<li>Ipsum is simply dummy text</li>\";}', '2017-05-18 15:49:48', '2017-09-02 22:10:55', 'services', '1', null, '>27', '17');
INSERT INTO `tbl_category` VALUES ('28', 'Services', 'services', 'a:2:{s:4:\"link\";s:0:\"\";s:4:\"icon\";s:0:\"\";}', '2017-05-19 21:58:10', '2017-09-02 22:10:55', 'dashboard', '0', '1', '>1>28', '23');
INSERT INTO `tbl_category` VALUES ('29', 'All Services', 'all-services', 'a:2:{s:4:\"link\";s:13:\"/dashboard/16\";s:4:\"icon\";s:0:\"\";}', '2017-05-19 21:58:46', '2017-09-02 22:10:55', 'dashboard', '0', '28', '>1>28>29', '24');
INSERT INTO `tbl_category` VALUES ('30', 'Events', 'events', 'a:2:{s:4:\"link\";s:0:\"\";s:4:\"icon\";s:0:\"\";}', '2017-05-19 22:32:57', '2017-09-02 22:10:55', 'dashboard', '0', '1', '>1>30', '25');
INSERT INTO `tbl_category` VALUES ('31', 'All Events', 'all-events', 'a:2:{s:4:\"link\";s:13:\"/dashboard/17\";s:4:\"icon\";s:0:\"\";}', '2017-05-19 22:34:14', '2017-09-02 22:10:55', 'dashboard', '0', '30', '>1>30>31', '26');
INSERT INTO `tbl_category` VALUES ('32', 'Tuần', 'tuan', 'N;', '2017-05-19 22:45:29', '2017-09-02 22:10:55', 'events', '1', null, '>32', '27');
INSERT INTO `tbl_category` VALUES ('33', 'Tháng', 'thang', 'N;', '2017-05-19 22:45:34', '2017-09-02 22:10:55', 'events', '1', null, '>33', '28');
INSERT INTO `tbl_category` VALUES ('34', 'Projects', 'projects', 'a:2:{s:4:\"link\";s:0:\"\";s:4:\"icon\";s:0:\"\";}', '2017-05-20 11:48:42', '2017-09-02 22:10:55', 'dashboard', '0', '1', '>1>34', '29');
INSERT INTO `tbl_category` VALUES ('35', 'All Projects', 'all-projects', 'a:2:{s:4:\"link\";s:13:\"/dashboard/19\";s:4:\"icon\";s:0:\"\";}', '2017-05-20 11:49:03', '2017-09-02 22:10:55', 'dashboard', '0', '34', '>1>34>35', '30');
INSERT INTO `tbl_category` VALUES ('36', 'Home', 'home', 'N;', '2017-05-24 14:10:16', '2017-09-02 22:10:55', 'creative', '1', null, '>36', '31');
INSERT INTO `tbl_category` VALUES ('37', 'Contact', 'contact', 'N;', '2017-05-24 14:10:26', '2017-09-02 22:10:55', 'creative', '1', null, '>37', '32');
INSERT INTO `tbl_category` VALUES ('38', 'Other', 'other', 'N;', '2017-05-24 14:10:32', '2017-09-02 22:10:55', 'creative', '1', null, '>38', '33');
INSERT INTO `tbl_category` VALUES ('39', 'Web Mail', 'web-mail', 'a:2:{s:4:\"link\";s:123:\"https://sg2plcpnl0035.prod.sin2.secureserver.net:2096/cpsess1946835589/webmail/gl_paper_lantern/index.html?mailclient=horde\";s:4:\"icon\";s:18:\"icon-envelope-open\";}', '2017-05-25 00:14:23', '2017-09-02 22:10:55', 'dashboard', '1', '0', '>39', '34');
INSERT INTO `tbl_category` VALUES ('40', 'About us', 'about-us', 'a:2:{s:4:\"link\";s:23:\"/dashboard/detail/12/15\";s:4:\"icon\";s:0:\"\";}', '2017-05-30 01:32:45', '2017-09-02 22:10:55', 'dashboard', '0', '1', '>1>40', '35');
INSERT INTO `tbl_category` VALUES ('41', 'Staff', 'staff', 'a:2:{s:4:\"link\";s:13:\"/dashboard/14\";s:4:\"icon\";s:0:\"\";}', '2017-05-30 01:34:58', '2017-09-02 22:10:55', 'dashboard', '0', '1', '>1>41', '36');
INSERT INTO `tbl_category` VALUES ('42', 'Recruitment', 'recruitment', 'a:2:{s:4:\"link\";s:13:\"/dashboard/21\";s:4:\"icon\";s:0:\"\";}', '2017-05-30 01:44:03', '2017-09-02 22:10:55', 'dashboard', '0', '1', '>1>42', '37');
INSERT INTO `tbl_category` VALUES ('77', 'Project complexity', 'project-complexity', 'a:1:{s:4:\"desc\";s:217:\"Complexity describes the behaviour of a system or model whose components interact in multiple ways and follow local rules, meaning there is no reasonable higher instruction to define the various possible interactions.\";}', '2017-07-06 13:54:51', '2017-09-02 22:10:55', 'risk', '1', '0', '>77', '72');
INSERT INTO `tbl_category` VALUES ('78', 'Project environment', 'project-environment', 'a:1:{s:4:\"desc\";s:366:\"Project environment represents a connection, where the project is processed. It impacts the project and is, therefore, conditioned. Such an interaction is provided by numerous factors as operational, physical, ecological, social, cultural, economic, psychological, financial, organizational etc. The environment not only formulates the project but also estimates it.\";}', '2017-07-06 13:55:07', '2017-09-02 22:10:55', 'risk', '1', '0', '>78', '73');
INSERT INTO `tbl_category` VALUES ('79', 'Project stakeholders', 'project-stakeholders', 'a:1:{s:4:\"desc\";s:286:\"According to the Project Management Institute (PMI), the term project stakeholder refers to, \"an individual, group, or organization, who may affect, be affected by, or perceive itself to be affected by a decision, activity, or outcome of a project\" (Project Management Institute, 2013).\";}', '2017-07-06 13:55:20', '2017-09-02 22:10:55', 'risk', '1', '0', '>79', '74');
INSERT INTO `tbl_category` VALUES ('80', 'Technical', 'technical', 'a:4:{s:4:\"desc\";s:198:\"The technical aspect of any project considers the familiarity of the project requirements and the expertise required at the organisational level to ensure that the project is executed successfully. \";s:5:\"lower\";s:673:\"The initial high-level profiling of your project appears to be within the capabilities of your organisation. It is likely that you will have most of the expertise, tools and templates to ensure that you can move into the planning phase and continue with detailed planning  and undertake an initial risk assessment. Since the technical aspect of the project appears to be ‘low’, it is advisable that you consider lessons learnt from previous projects to move forward. Bear in mind, that the technical aspect is only one sub-component of assessing overall project complexity, so be sure to continue answering the questions on ‘Economic’ and ‘Commercial’ sections.\";s:6:\"medium\";s:677:\"The initial high-level profiling of your project appears to be within some of the capabilities of your organisation. It is likely that you will have some of the expertise, tools and templates to ensure that you can delivery on the project but it is advised that draw on others’ expertise and conduct your own ‘desk’ research to collect information on this particular project and align to the experiences and expertise of others within and external to the organisation. Bear in mind, that the technical aspect is only one sub-component of assessing overall project complexity, so be sure to continue answering the questions on ‘Economic’ and ‘Commercial’ sections.\";s:6:\"higher\";s:725:\"Considering the definition of ‘technical’, the initial high-level profile appears that currently, your organisation does not have all of the necessary capability requirements to deliver this project effectively. You may need to investigate the tools, templates and procedures currently in place, and suggest amendments to improve processes to specifically support your project. Although you have scored ‘high’ on technical, you can make certain changes and draw on the expertise of others to move to medium or low. Bear in mind, that the technical aspect is only one sub-component of assessing overall project complexity, so be sure to continue answering the questions on ‘Economic’ and ‘Commercial’ sections.\";}', '2017-07-06 13:57:53', '2017-09-02 22:10:55', 'risk', '1', '77', '>77>80', '75');
INSERT INTO `tbl_category` VALUES ('81', 'Economic', 'economic', 'a:4:{s:4:\"desc\";s:142:\"The economic aspect considers some of the initial factors that may significantly impact on the value to be created by undertaking the project.\";s:5:\"lower\";s:819:\"The initial high-level profiling of your project appears to show that funding, partnerships and resourcing will have low impact on the economics in achieving  project objectives. It is likely that the business case has considered the deliverables of the project and secured the appropriate funding to ensure the project can be planned and executed effectively. If there are any partnerships, they have been secured and resourcing has been sourced appropriately. Since the economic aspect of the project appears to be ‘low’, it is advisable that you consider lessons learnt from previous projects to move forward. Bear in mind, that the economic aspect is only one sub-component of assessing overall project complexity, so be sure to continue answering the questions on ‘Technical’ and ‘Commercial’ sections.\";s:6:\"medium\";s:774:\"The initial high-level profiling of your project appears to show that there are some areas that will affect your project economics. It is likely that the business case has considered. Although there is current lack of clarity on funding, partnerships and resourcing, there is sufficient information for you to collate information and draw on experts to lower the economic profile. Since the economic aspect of the project appears to be of ‘medium’, it is advisable that you revisit the business case and consider lessons learnt from previous projects to move forward. Bear in mind, that the economic aspect is only one sub-component of assessing overall project complexity, so be sure to continue answering the questions on ‘Technical’ and ‘Commercial’ sections.\";s:6:\"higher\";s:677:\"Considering the definition of ‘economic’ factors affecting the complexity of your project, the initial high-level profile appears that there is insufficient funding and resourcing to execute the project effectively. You will need to develop or reconsider your business case to carefully assess the feasibility of the project. Although you have scored ‘high’ on economic, you can make certain changes and draw on the expertise of others to move to medium or low. Bear in mind, that the ‘economic’ aspect is only one sub-component of assessing overall project complexity, so be sure to continue answering the questions on ‘Economic’ and ‘Commercial’ sections.\";}', '2017-07-06 13:58:03', '2017-09-02 22:10:55', 'risk', '1', '77', '>77>81', '76');
INSERT INTO `tbl_category` VALUES ('82', 'Commercial', 'commercial', 'a:4:{s:4:\"desc\";s:241:\"The commercial aspect considers some of the initial market conditions, together with other commercial requirements necessary in order to secure supply of the necessary resources (i.e materials and labour) to successfully deliver the project.\";s:5:\"lower\";s:626:\"The initial high-level profiling of your project’s commercial aspects appear to show clarity of deliverables and clear awareness of systems, resources and people required to execute the project effectively. It is likely that contractors and suppliers are in place. Since the commercial aspect of the project appears to be ‘low’, it is advisable that you consider lessons learnt from previous projects to move forward. Bear in mind, that the commercial aspect is only one sub-component of assessing overall project complexity, so be sure to continue answering the questions on ‘Technical’ and ‘Economic’ sections.\";s:6:\"medium\";s:769:\"The initial high-level profiling of your project’s commercial aspects appear to show some clarity on the deliverables, contractors and resourcing of your project. It is likely that you have some contracts in place but you will need to secure other contracts and/or resource requirements to meet the critical path of the project. Since the commercial aspect of the project appears to be of ‘medium’, it is advisable that you ensure a complete understanding of market conditions, meet with contractors to secure their input and resources before moving forward. Bear in mind, that the commercial aspect is only one sub-component of assessing overall project complexity, so be sure to continue answering the questions on ‘Technical’ and ‘Commercial’ sections.\";s:6:\"higher\";s:707:\"The initial high-level profiling of your project’s commercial aspects appear to show a lack of clarity on the ‘commercial’ factors affecting the complexity of your project.  It is likely that are insufficient contracts in place to ensure resourcing and work-requirements. Although you have scored ‘high-’ on commercial, you need to ensure an enhanced understanding of market conditions, draw on experts and access contractors and suppliers for this project before proceeding any further Bear in mind, that the ‘commercial’ aspect is only one sub-component of assessing overall project complexity, so be sure to continue answering the questions on ‘Technical’ and ‘Commercial’ sections.\";}', '2017-07-06 13:58:13', '2017-09-02 22:10:55', 'risk', '1', '77', '>77>82', '77');
INSERT INTO `tbl_category` VALUES ('83', 'Governance', 'governance', 'a:1:{s:4:\"desc\";s:0:\"\";}', '2017-07-06 13:58:40', '2017-09-02 22:10:55', 'risk', '1', '78', '>78>83', '78');
INSERT INTO `tbl_category` VALUES ('84', 'Economic', 'economic', 'a:1:{s:4:\"desc\";s:0:\"\";}', '2017-07-06 14:01:37', '2017-09-02 22:10:55', 'risk', '1', '78', '>78>84', '79');
INSERT INTO `tbl_category` VALUES ('85', 'Context', 'context', 'a:1:{s:4:\"desc\";s:0:\"\";}', '2017-07-06 14:01:53', '2017-09-02 22:10:55', 'risk', '1', '78', '>78>85', '80');
INSERT INTO `tbl_category` VALUES ('86', 'Category', 'category', 'a:1:{s:4:\"desc\";s:0:\"\";}', '2017-07-06 14:02:17', '2017-09-02 22:10:55', 'risk', '1', '79', '>79>86', '81');
INSERT INTO `tbl_category` VALUES ('87', 'Communication', 'communication', 'a:1:{s:4:\"desc\";s:0:\"\";}', '2017-07-06 14:02:27', '2017-09-02 22:10:55', 'risk', '1', '79', '>79>87', '82');
INSERT INTO `tbl_category` VALUES ('88', 'Interest & Influence', 'interest-influence', 'a:1:{s:4:\"desc\";s:0:\"\";}', '2017-07-06 14:02:47', '2017-09-02 22:10:55', 'risk', '1', '79', '>79>88', '83');
INSERT INTO `tbl_category` VALUES ('89', 'Mailler Setting', 'mailler-setting', 'a:2:{s:4:\"link\";s:16:\"/dashboard/31/41\";s:4:\"icon\";s:18:\"icon-envelope-open\";}', '2017-07-20 14:57:47', '2017-09-02 22:10:55', 'dashboard', '1', '6', '>6>89', '84');
INSERT INTO `tbl_category` VALUES ('91', 'Category', 'category', 'a:2:{s:4:\"link\";s:27:\"/dashboard/category/view/26\";s:4:\"icon\";s:0:\"\";}', '2017-07-20 14:59:19', '2017-09-02 22:10:55', 'dashboard', '1', '1', '>1>91', '85');
INSERT INTO `tbl_category` VALUES ('92', 'Questions', 'questions', 'a:2:{s:4:\"link\";s:13:\"/dashboard/27\";s:4:\"icon\";s:0:\"\";}', '2017-07-20 15:02:13', '2017-09-02 22:10:55', 'dashboard', '1', '1', '>1>92', '86');
INSERT INTO `tbl_category` VALUES ('93', 'Project', 'project', 'a:2:{s:4:\"link\";s:13:\"/dashboard/32\";s:4:\"icon\";s:0:\"\";}', '2017-07-20 15:26:04', '2017-09-02 22:10:55', 'dashboard', '1', '1', '>1>93', '87');

-- ----------------------------
-- Table structure for tbl_data
-- ----------------------------
DROP TABLE IF EXISTS `tbl_data`;
CREATE TABLE `tbl_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `data` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  `category` int(11) DEFAULT '-1',
  `pid` int(11) DEFAULT '-1',
  `longdata` longtext,
  `key` varchar(32) DEFAULT NULL,
  `sorting` int(11) DEFAULT '1',
  `author` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_data
-- ----------------------------
INSERT INTO `tbl_data` VALUES ('41', 'Mailer Setting', 'mailer-setting', 'a:10:{s:4:\"host\";s:14:\"smtp.gmail.com\";s:4:\"port\";s:3:\"465\";s:10:\"smtpsecure\";s:3:\"ssl\";s:8:\"smtpauth\";s:1:\"1\";s:7:\"mailler\";s:4:\"smtp\";s:8:\"username\";s:28:\"connect.beautyguru@gmail.com\";s:8:\"password\";s:10:\"SPZ@123123\";s:6:\"sender\";s:11:\"Beauty Guru\";s:6:\"mailer\";s:4:\"smtp\";s:6:\"active\";s:1:\"1\";}', '2017-07-20 14:23:23', '2017-10-25 10:45:08', 'mailler', '1', '-1', '-1', null, null, '40', '10018');

-- ----------------------------
-- Table structure for tbl_module
-- ----------------------------
DROP TABLE IF EXISTS `tbl_module`;
CREATE TABLE `tbl_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `data` longtext,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  `category` int(11) DEFAULT '-1',
  `sorting` int(11) DEFAULT NULL,
  `help` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_module
-- ----------------------------
INSERT INTO `tbl_module` VALUES ('4', 'Dashboard Menu', 'dashboard-menu', 'a:9:{s:7:\"storage\";s:8:\"tbl_data\";s:4:\"size\";s:3:\"320\";s:3:\"add\";s:4:\"true\";s:4:\"edit\";s:4:\"true\";s:6:\"delete\";s:4:\"true\";s:4:\"type\";s:9:\"dashboard\";s:8:\"catetype\";s:9:\"dashboard\";s:10:\"cateviewer\";s:4:\"tree\";s:7:\"columns\";a:2:{i:0;a:6:{s:4:\"name\";s:4:\"link\";s:5:\"title\";s:4:\"Link\";s:4:\"type\";s:6:\"string\";s:3:\"col\";s:2:\"12\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}i:1;a:6:{s:4:\"name\";s:4:\"icon\";s:5:\"title\";s:4:\"Icon\";s:4:\"type\";s:6:\"string\";s:3:\"col\";s:2:\"12\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}}}', '2017-05-02 21:33:34', '2017-05-03 16:54:04', null, '0', '-1', null, null);
INSERT INTO `tbl_module` VALUES ('6', 'Image', 'image', 'a:9:{s:7:\"storage\";s:8:\"tbl_data\";s:4:\"size\";s:3:\"320\";s:3:\"add\";s:4:\"true\";s:4:\"edit\";s:4:\"true\";s:6:\"delete\";s:4:\"true\";s:4:\"type\";s:5:\"image\";s:8:\"catetype\";s:0:\"\";s:10:\"cateviewer\";s:4:\"list\";s:7:\"columns\";a:1:{i:0;a:7:{s:4:\"type\";s:5:\"image\";s:3:\"col\";s:2:\"12\";s:4:\"name\";s:5:\"image\";s:5:\"title\";s:5:\"Image\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:3:\"biz\";s:1:\"0\";}}}', '2017-05-06 13:44:52', '2017-05-07 20:44:29', null, '0', '-1', null, null);
INSERT INTO `tbl_module` VALUES ('38', 'Dashboard Menu', 'dashboard-menu', 'a:23:{s:5:\"group\";s:6:\"Common\";s:4:\"size\";s:0:\"\";s:7:\"storage\";s:6:\"__menu\";s:6:\"prefix\";s:0:\"\";s:3:\"add\";s:4:\"true\";s:4:\"edit\";s:4:\"true\";s:6:\"delete\";s:4:\"true\";s:4:\"type\";s:7:\"bo-menu\";s:10:\"typeviewer\";s:0:\"\";s:8:\"catetype\";s:0:\"\";s:10:\"cateviewer\";s:0:\"\";s:15:\"grid_datafields\";s:168:\"[\n    {name: \"id\", type: \"int\"},\n    {name: \"title\"},\n    {name: \"status\" , type: \"bool\"},\n    {name: \"created\" , type: \"date\"},\n    {name: \"modified\" , type: \"date\"}\n]\";s:12:\"grid_columns\";s:568:\"[{\n    text: \"Title\", datafield: \"title\", minWidth: 180, sortable: true, columntype: \"textbox\", filtertype: \"textbox\", filtercondition: \"CONTAINS\",\n},{\n    text: \"Status\"    , datafield: \"status\" , cellsalign: \"center\", width: 44, columntype: \"checkbox\", threestatecheckbox: false, filtertype: \"bool\", filterable: true, sortable: true,editable: true\n},{\n    text: \"Created\" , datafield: \"created\", width: 120, cellsalign: \"right\", filterable: true, columntype: \"datetimeinput\", filtertype: \"range\", cellsformat: \"yyyy-MM-dd HH:mm:ss\", sortable: true,editable: false\n}]\";s:12:\"grid_options\";s:0:\"\";s:5:\"debug\";s:1:\"0\";s:11:\"binding_url\";s:23:\"/dashboardapi/menu/bind\";s:11:\"bind_select\";s:1:\"*\";s:9:\"bind_from\";s:6:\"__menu\";s:10:\"bind_where\";s:4:\"true\";s:16:\"bind_columns_map\";s:0:\"\";s:13:\"bind_order_by\";s:0:\"\";s:6:\"groups\";a:1:{i:0;a:2:{s:4:\"name\";s:11:\"Information\";s:6:\"length\";s:1:\"2\";}}s:7:\"columns\";a:2:{i:0;a:7:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:1:\"0\";s:4:\"name\";s:5:\"title\";s:5:\"title\";s:5:\"Title\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}i:1;a:6:{s:4:\"type\";s:20:\"server-multidropdown\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:1:\"0\";s:4:\"name\";s:9:\"privilege\";s:5:\"title\";s:9:\"Privilege\";s:3:\"sid\";s:2:\"37\";}}}', '2017-08-31 14:54:48', null, '', '0', '-1', '30', null);
INSERT INTO `tbl_module` VALUES ('23', 'String', 'string', 'a:12:{s:4:\"site\";s:4:\"Core\";s:4:\"size\";s:0:\"\";s:7:\"storage\";s:8:\"tbl_data\";s:4:\"type\";s:4:\"core\";s:8:\"catetype\";s:0:\"\";s:10:\"cateviewer\";s:4:\"list\";s:7:\"columns\";a:1:{i:0;a:7:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:2:\"12\";s:4:\"name\";s:5:\"value\";s:5:\"title\";s:5:\"Value\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:3:\"biz\";s:1:\"0\";}}s:3:\"add\";s:5:\"false\";s:4:\"edit\";s:5:\"false\";s:6:\"delete\";s:5:\"false\";s:6:\"unique\";s:5:\"false\";s:9:\"showthumb\";s:5:\"false\";}', '2017-06-01 15:03:48', null, 'var', '0', '-1', '15', null);
INSERT INTO `tbl_module` VALUES ('24', 'Text', 'text', 'a:12:{s:4:\"site\";s:4:\"Core\";s:4:\"size\";s:0:\"\";s:7:\"storage\";s:8:\"tbl_data\";s:4:\"type\";s:4:\"core\";s:8:\"catetype\";s:0:\"\";s:10:\"cateviewer\";s:4:\"list\";s:7:\"columns\";a:1:{i:0;a:7:{s:4:\"type\";s:4:\"text\";s:3:\"col\";s:2:\"12\";s:4:\"name\";s:5:\"value\";s:5:\"title\";s:5:\"Value\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:3:\"biz\";s:1:\"0\";}}s:3:\"add\";s:5:\"false\";s:4:\"edit\";s:5:\"false\";s:6:\"delete\";s:5:\"false\";s:6:\"unique\";s:5:\"false\";s:9:\"showthumb\";s:5:\"false\";}', '2017-06-01 15:30:38', '2017-06-01 15:33:01', 'var', '0', '-1', '16', null);
INSERT INTO `tbl_module` VALUES ('25', 'Image', 'image', 'a:12:{s:4:\"site\";s:4:\"Core\";s:4:\"size\";s:0:\"\";s:7:\"storage\";s:8:\"tbl_data\";s:4:\"type\";s:4:\"core\";s:8:\"catetype\";s:0:\"\";s:10:\"cateviewer\";s:4:\"list\";s:7:\"columns\";a:1:{i:0;a:7:{s:4:\"type\";s:5:\"image\";s:3:\"col\";s:2:\"12\";s:4:\"name\";s:5:\"value\";s:5:\"title\";s:5:\"Image\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:3:\"biz\";s:1:\"0\";}}s:3:\"add\";s:5:\"false\";s:4:\"edit\";s:5:\"false\";s:6:\"delete\";s:5:\"false\";s:6:\"unique\";s:5:\"false\";s:9:\"showthumb\";s:5:\"false\";}', '2017-06-01 16:11:17', null, 'var', '0', '-1', '17', null);
INSERT INTO `tbl_module` VALUES ('26', 'Category', 'category', 'a:25:{s:5:\"group\";s:6:\"Common\";s:4:\"size\";s:3:\"480\";s:7:\"storage\";s:10:\"__category\";s:6:\"prefix\";s:0:\"\";s:9:\"privieges\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:3:\"add\";s:4:\"true\";s:4:\"edit\";s:4:\"true\";s:6:\"delete\";s:4:\"true\";s:4:\"type\";s:0:\"\";s:10:\"typeviewer\";s:0:\"\";s:8:\"catetype\";s:0:\"\";s:10:\"cateviewer\";s:4:\"tree\";s:15:\"grid_datafields\";s:189:\"[\n    {name: \"id\", type: \"int\"},\n    {name: \"title\"},\n    {name: \"level\"},\n    {name: \"status\" , type: \"bool\"},\n    {name: \"created\" , type: \"date\"},\n    {name: \"modified\" , type: \"date\"}\n]\";s:12:\"grid_columns\";s:1057:\"[{\n    text: \'Title\', dataField: \'title\', minWidth: 180, sortable: true,\n    columntype: \'textbox\', filtertype: \'textbox\', filtercondition: \'CONTAINS\',\n    cellsrenderer: function (row, columnfield, value, defaulthtml, columnproperties) {\n        var dataRow = $(gridElm).jqxGrid(\'getrowdata\', row);\n        var str = \'<div style=\"overflow: hidden; text-overflow: ellipsis; padding-bottom: 4px; text-align: left; margin-right: 2px; margin-left: 4px; padding-top: 4px;\">\';\n        str+=\'<span style=\"padding-left:\'+dataRow.level*20+\'px;\">\'+value+\'</span>\';\n        //str+=dataRow.Display;\n        str+=\'</div>\';\n        return str;\n    }\n},{\n    text: \"Status\"    , datafield: \"status\" , cellsalign: \"center\", width: 44, columntype: \"checkbox\", threestatecheckbox: false, filtertype: \"bool\", filterable: true, sortable: true,editable: true\n},{\n    text: \"Created\" , datafield: \"created\", width: 120, cellsalign: \"right\", filterable: true, columntype: \"datetimeinput\", filtertype: \"range\", cellsformat: \"yyyy-MM-dd HH:mm:ss\", sortable: true,editable: false\n}]\";s:12:\"grid_options\";s:0:\"\";s:5:\"debug\";s:1:\"0\";s:11:\"binding_url\";s:30:\"/dashboardapi/menu/custom_bind\";s:11:\"bind_select\";s:1:\"*\";s:9:\"bind_from\";s:10:\"__category\";s:10:\"bind_where\";s:4:\"true\";s:16:\"bind_columns_map\";s:0:\"\";s:13:\"bind_order_by\";s:0:\"\";s:6:\"groups\";a:1:{i:0;a:2:{s:4:\"name\";s:11:\"Information\";s:6:\"length\";s:1:\"1\";}}s:7:\"columns\";a:1:{i:0;a:7:{s:4:\"type\";s:11:\"stringalias\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:5:\"title\";s:5:\"title\";s:5:\"Title\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}}s:15:\"companyrequired\";s:5:\"false\";}', '2017-07-02 22:03:29', '2017-09-04 21:29:58', '', '0', '-1', '18', null);
INSERT INTO `tbl_module` VALUES ('27', 'Questions', 'questions', 'a:13:{s:4:\"site\";s:8:\"Risk App\";s:4:\"size\";s:3:\"480\";s:7:\"storage\";s:9:\"tbl_data2\";s:3:\"add\";s:4:\"true\";s:4:\"edit\";s:4:\"true\";s:6:\"delete\";s:4:\"true\";s:4:\"type\";s:4:\"risk\";s:8:\"catetype\";s:4:\"risk\";s:10:\"cateviewer\";s:4:\"tree\";s:6:\"groups\";a:3:{i:0;a:2:{s:4:\"name\";s:11:\"Information\";s:6:\"length\";s:1:\"3\";}i:1;a:2:{s:4:\"name\";s:7:\"Answers\";s:6:\"length\";s:1:\"1\";}i:2;a:2:{s:4:\"name\";s:8:\"Comments\";s:6:\"length\";s:1:\"3\";}}s:7:\"columns\";a:7:{i:0;a:7:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:2:\"12\";s:4:\"name\";s:8:\"question\";s:5:\"title\";s:8:\"Question\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:3:\"biz\";s:1:\"0\";}i:1;a:8:{s:4:\"type\";s:8:\"dropdown\";s:3:\"col\";s:2:\"12\";s:4:\"name\";s:6:\"global\";s:5:\"title\";s:13:\"Global Scrore\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:3:\"biz\";s:1:\"0\";s:4:\"data\";a:3:{i:0;a:2:{s:7:\"display\";s:5:\"Lower\";s:5:\"value\";s:1:\"0\";}i:1;a:2:{s:7:\"display\";s:6:\"Medium\";s:5:\"value\";s:1:\"1\";}i:2;a:2:{s:7:\"display\";s:6:\"Higher\";s:5:\"value\";s:1:\"2\";}}}i:2;a:7:{s:4:\"type\";s:4:\"text\";s:3:\"col\";s:2:\"12\";s:4:\"name\";s:4:\"desc\";s:5:\"title\";s:4:\"Desc\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:3:\"biz\";s:1:\"0\";}i:3;a:7:{s:4:\"type\";s:4:\"list\";s:3:\"col\";s:2:\"12\";s:4:\"name\";s:7:\"answers\";s:5:\"title\";s:7:\"Answers\";s:6:\"server\";s:0:\"\";s:3:\"sid\";s:2:\"28\";s:3:\"biz\";s:1:\"0\";}i:4;a:7:{s:4:\"type\";s:4:\"text\";s:3:\"col\";s:2:\"12\";s:4:\"name\";s:5:\"lower\";s:5:\"title\";s:5:\"Lower\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:3:\"biz\";s:1:\"0\";}i:5;a:7:{s:4:\"type\";s:4:\"text\";s:3:\"col\";s:2:\"12\";s:4:\"name\";s:6:\"medium\";s:5:\"title\";s:6:\"Medium\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:3:\"biz\";s:1:\"0\";}i:6;a:7:{s:4:\"type\";s:4:\"text\";s:3:\"col\";s:2:\"12\";s:4:\"name\";s:6:\"higher\";s:5:\"title\";s:6:\"Higher\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:3:\"biz\";s:1:\"0\";}}s:6:\"unique\";s:5:\"false\";s:9:\"showthumb\";s:5:\"false\";}', '2017-07-06 13:17:04', '2017-07-12 14:55:52', '', '0', '-1', '19', null);
INSERT INTO `tbl_module` VALUES ('28', 'Answers', 'answers', 'a:13:{s:4:\"site\";s:8:\"Risk App\";s:4:\"size\";s:3:\"320\";s:7:\"storage\";s:9:\"tbl_data3\";s:3:\"add\";s:4:\"true\";s:4:\"edit\";s:4:\"true\";s:6:\"delete\";s:4:\"true\";s:4:\"type\";s:7:\"answers\";s:8:\"catetype\";s:0:\"\";s:10:\"cateviewer\";s:4:\"list\";s:6:\"groups\";a:1:{i:0;a:2:{s:4:\"name\";s:11:\"Information\";s:6:\"length\";s:1:\"2\";}}s:7:\"columns\";a:2:{i:0;a:8:{s:4:\"type\";s:8:\"dropdown\";s:3:\"col\";s:2:\"12\";s:4:\"name\";s:5:\"score\";s:5:\"title\";s:5:\"Score\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:3:\"biz\";s:1:\"0\";s:4:\"data\";a:3:{i:0;a:2:{s:7:\"display\";s:5:\"Lower\";s:5:\"value\";s:1:\"0\";}i:1;a:2:{s:7:\"display\";s:6:\"Medium\";s:5:\"value\";s:1:\"1\";}i:2;a:2:{s:7:\"display\";s:6:\"Higher\";s:5:\"value\";s:1:\"2\";}}}i:1;a:7:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:2:\"12\";s:4:\"name\";s:4:\"desc\";s:5:\"title\";s:4:\"Desc\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:3:\"biz\";s:1:\"0\";}}s:6:\"unique\";s:5:\"false\";s:9:\"showthumb\";s:5:\"false\";}', '2017-07-06 15:36:02', '2017-07-11 09:56:21', '', '0', '-1', '20', null);
INSERT INTO `tbl_module` VALUES ('29', 'Boolean Dropdown', 'boolean-dropdown', 'a:13:{s:4:\"site\";s:4:\"Core\";s:4:\"size\";s:0:\"\";s:7:\"storage\";s:8:\"tbl_data\";s:3:\"add\";s:4:\"true\";s:4:\"edit\";s:4:\"true\";s:6:\"delete\";s:4:\"true\";s:4:\"type\";s:4:\"core\";s:8:\"catetype\";s:0:\"\";s:10:\"cateviewer\";s:4:\"list\";s:6:\"groups\";a:1:{i:0;a:2:{s:4:\"name\";s:11:\"Information\";s:6:\"length\";s:1:\"1\";}}s:7:\"columns\";a:1:{i:0;a:8:{s:4:\"type\";s:8:\"dropdown\";s:3:\"col\";s:2:\"12\";s:4:\"name\";s:5:\"value\";s:5:\"title\";s:5:\"Value\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:3:\"biz\";s:1:\"0\";s:4:\"data\";a:2:{i:0;a:2:{s:7:\"display\";s:2:\"On\";s:5:\"value\";s:1:\"1\";}i:1;a:2:{s:7:\"display\";s:3:\"Off\";s:5:\"value\";s:1:\"0\";}}}}s:6:\"unique\";s:5:\"false\";s:9:\"showthumb\";s:5:\"false\";}', '2017-07-20 13:41:07', '2017-07-20 14:09:00', 'var', '0', '-1', '21', null);
INSERT INTO `tbl_module` VALUES ('31', 'Mailler Setting', 'mailler-setting', 'a:24:{s:5:\"group\";s:6:\"Common\";s:4:\"size\";s:0:\"\";s:7:\"storage\";s:8:\"tbl_data\";s:6:\"prefix\";s:0:\"\";s:3:\"add\";s:4:\"true\";s:4:\"edit\";s:4:\"true\";s:6:\"delete\";s:4:\"true\";s:4:\"type\";s:7:\"mailler\";s:10:\"typeviewer\";s:0:\"\";s:8:\"catetype\";s:0:\"\";s:10:\"cateviewer\";s:4:\"list\";s:15:\"grid_datafields\";s:0:\"\";s:12:\"grid_columns\";s:0:\"\";s:12:\"grid_options\";s:0:\"\";s:5:\"debug\";s:1:\"0\";s:11:\"binding_url\";s:0:\"\";s:11:\"bind_select\";s:0:\"\";s:9:\"bind_from\";s:0:\"\";s:10:\"bind_where\";s:0:\"\";s:16:\"bind_columns_map\";s:0:\"\";s:13:\"bind_order_by\";s:0:\"\";s:6:\"groups\";a:1:{i:0;a:2:{s:4:\"name\";s:11:\"Information\";s:6:\"length\";s:1:\"9\";}}s:7:\"columns\";a:9:{i:0;a:12:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:1:\"0\";s:4:\"name\";s:4:\"host\";s:5:\"title\";s:4:\"Host\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:8:\"onchange\";s:0:\"\";s:11:\"group_field\";s:0:\"\";s:8:\"group_id\";s:0:\"\";s:10:\"group_join\";s:0:\"\";s:8:\"group_on\";s:0:\"\";}i:1;a:12:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:1:\"6\";s:10:\"columndata\";s:1:\"0\";s:4:\"name\";s:4:\"port\";s:5:\"title\";s:4:\"Port\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:8:\"onchange\";s:0:\"\";s:11:\"group_field\";s:0:\"\";s:8:\"group_id\";s:0:\"\";s:10:\"group_join\";s:0:\"\";s:8:\"group_on\";s:0:\"\";}i:2;a:12:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:1:\"6\";s:10:\"columndata\";s:1:\"0\";s:4:\"name\";s:10:\"smtpsecure\";s:5:\"title\";s:10:\"SMTPSecure\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:8:\"onchange\";s:0:\"\";s:11:\"group_field\";s:0:\"\";s:8:\"group_id\";s:0:\"\";s:10:\"group_join\";s:0:\"\";s:8:\"group_on\";s:0:\"\";}i:3;a:12:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:1:\"0\";s:4:\"name\";s:6:\"sender\";s:5:\"title\";s:6:\"Sender\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:8:\"onchange\";s:0:\"\";s:11:\"group_field\";s:0:\"\";s:8:\"group_id\";s:0:\"\";s:10:\"group_join\";s:0:\"\";s:8:\"group_on\";s:0:\"\";}i:4;a:12:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:1:\"6\";s:10:\"columndata\";s:1:\"0\";s:4:\"name\";s:8:\"username\";s:5:\"title\";s:8:\"Username\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:8:\"onchange\";s:0:\"\";s:11:\"group_field\";s:0:\"\";s:8:\"group_id\";s:0:\"\";s:10:\"group_join\";s:0:\"\";s:8:\"group_on\";s:0:\"\";}i:5;a:12:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:1:\"6\";s:10:\"columndata\";s:1:\"0\";s:4:\"name\";s:8:\"password\";s:5:\"title\";s:8:\"Password\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:8:\"onchange\";s:0:\"\";s:11:\"group_field\";s:0:\"\";s:8:\"group_id\";s:0:\"\";s:10:\"group_join\";s:0:\"\";s:8:\"group_on\";s:0:\"\";}i:6;a:12:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:1:\"6\";s:10:\"columndata\";s:1:\"0\";s:4:\"name\";s:6:\"mailer\";s:5:\"title\";s:6:\"Mailer\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:8:\"onchange\";s:0:\"\";s:11:\"group_field\";s:0:\"\";s:8:\"group_id\";s:0:\"\";s:10:\"group_join\";s:0:\"\";s:8:\"group_on\";s:0:\"\";}i:7;a:12:{s:4:\"type\";s:8:\"checkbox\";s:3:\"col\";s:1:\"3\";s:10:\"columndata\";s:1:\"0\";s:4:\"name\";s:8:\"smtpauth\";s:5:\"title\";s:8:\"SMTPAuth\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:8:\"onchange\";s:0:\"\";s:11:\"group_field\";s:0:\"\";s:8:\"group_id\";s:0:\"\";s:10:\"group_join\";s:0:\"\";s:8:\"group_on\";s:0:\"\";}i:8;a:12:{s:4:\"type\";s:8:\"checkbox\";s:3:\"col\";s:1:\"3\";s:10:\"columndata\";s:1:\"0\";s:4:\"name\";s:6:\"active\";s:5:\"title\";s:6:\"Status\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:8:\"onchange\";s:0:\"\";s:11:\"group_field\";s:0:\"\";s:8:\"group_id\";s:0:\"\";s:10:\"group_join\";s:0:\"\";s:8:\"group_on\";s:0:\"\";}}s:15:\"companyrequired\";s:5:\"false\";}', '2017-07-20 14:22:17', '2017-10-25 10:42:49', '', '0', '-1', '23', null);
INSERT INTO `tbl_module` VALUES ('30', 'Boolean', 'boolean', 'a:13:{s:4:\"site\";s:4:\"Core\";s:4:\"size\";s:0:\"\";s:7:\"storage\";s:8:\"tbl_data\";s:4:\"type\";s:4:\"core\";s:8:\"catetype\";s:0:\"\";s:10:\"cateviewer\";s:4:\"list\";s:6:\"groups\";a:1:{i:0;a:2:{s:4:\"name\";s:11:\"Information\";s:6:\"length\";s:1:\"1\";}}s:7:\"columns\";a:1:{i:0;a:7:{s:4:\"type\";s:8:\"checkbox\";s:3:\"col\";s:2:\"12\";s:4:\"name\";s:5:\"value\";s:5:\"title\";s:5:\"Value\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:3:\"biz\";s:1:\"0\";}}s:3:\"add\";s:5:\"false\";s:4:\"edit\";s:5:\"false\";s:6:\"delete\";s:5:\"false\";s:6:\"unique\";s:5:\"false\";s:9:\"showthumb\";s:5:\"false\";}', '2017-07-20 13:53:57', null, 'var', '0', '-1', '22', null);
INSERT INTO `tbl_module` VALUES ('32', 'Project', 'project', 'a:13:{s:4:\"site\";s:8:\"Risk App\";s:4:\"size\";s:0:\"\";s:7:\"storage\";s:11:\"tbl_project\";s:4:\"edit\";s:4:\"true\";s:4:\"type\";s:0:\"\";s:8:\"catetype\";s:0:\"\";s:10:\"cateviewer\";s:4:\"list\";s:6:\"groups\";a:1:{i:0;a:2:{s:4:\"name\";s:11:\"Information\";s:6:\"length\";s:1:\"1\";}}s:7:\"columns\";a:1:{i:0;a:7:{s:4:\"type\";s:4:\"text\";s:3:\"col\";s:2:\"12\";s:4:\"name\";s:4:\"desc\";s:5:\"title\";s:4:\"Desc\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:3:\"biz\";s:1:\"0\";}}s:3:\"add\";s:5:\"false\";s:6:\"delete\";s:5:\"false\";s:6:\"unique\";s:5:\"false\";s:9:\"showthumb\";s:5:\"false\";}', '2017-07-20 15:11:19', '2017-07-20 16:19:23', '', '0', '-1', '24', null);
INSERT INTO `tbl_module` VALUES ('33', 'Content', 'content', 'a:14:{s:4:\"site\";s:8:\"Risk App\";s:4:\"size\";s:0:\"\";s:7:\"storage\";s:8:\"tbl_data\";s:3:\"add\";s:4:\"true\";s:4:\"edit\";s:4:\"true\";s:6:\"delete\";s:4:\"true\";s:4:\"type\";s:12:\"risk_content\";s:10:\"typeviewer\";s:0:\"\";s:8:\"catetype\";s:0:\"\";s:10:\"cateviewer\";s:0:\"\";s:6:\"groups\";a:1:{i:0;a:2:{s:4:\"name\";s:11:\"Information\";s:6:\"length\";s:1:\"1\";}}s:7:\"columns\";a:1:{i:0;a:7:{s:4:\"type\";s:4:\"html\";s:3:\"col\";s:2:\"12\";s:4:\"name\";s:7:\"content\";s:5:\"title\";s:7:\"Content\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:3:\"biz\";s:1:\"0\";}}s:6:\"unique\";s:5:\"false\";s:9:\"showthumb\";s:5:\"false\";}', '2017-07-28 08:59:16', null, '', '0', '-1', '25', null);
INSERT INTO `tbl_module` VALUES ('34', 'Type', 'type', 'a:25:{s:5:\"group\";s:6:\"Common\";s:4:\"size\";s:3:\"320\";s:7:\"storage\";s:6:\"__type\";s:6:\"prefix\";s:0:\"\";s:9:\"privieges\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:3:\"add\";s:4:\"true\";s:4:\"edit\";s:4:\"true\";s:6:\"delete\";s:4:\"true\";s:4:\"type\";s:0:\"\";s:10:\"typeviewer\";s:0:\"\";s:8:\"catetype\";s:0:\"\";s:10:\"cateviewer\";s:0:\"\";s:15:\"grid_datafields\";s:168:\"[\n    {name: \"id\", type: \"int\"},\n    {name: \"title\"},\n    {name: \"status\" , type: \"bool\"},\n    {name: \"created\" , type: \"date\"},\n    {name: \"modified\" , type: \"date\"}\n]\";s:12:\"grid_columns\";s:568:\"[{\n    text: \"Title\", datafield: \"title\", minWidth: 180, sortable: true, columntype: \"textbox\", filtertype: \"textbox\", filtercondition: \"CONTAINS\",\n},{\n    text: \"Status\"    , datafield: \"status\" , cellsalign: \"center\", width: 44, columntype: \"checkbox\", threestatecheckbox: false, filtertype: \"bool\", filterable: true, sortable: true,editable: true\n},{\n    text: \"Created\" , datafield: \"created\", width: 120, cellsalign: \"right\", filterable: true, columntype: \"datetimeinput\", filtertype: \"range\", cellsformat: \"yyyy-MM-dd HH:mm:ss\", sortable: true,editable: false\n}]\";s:12:\"grid_options\";s:0:\"\";s:5:\"debug\";s:1:\"0\";s:11:\"binding_url\";s:32:\"/dashboardapi/common/custom_bind\";s:11:\"bind_select\";s:1:\"*\";s:9:\"bind_from\";s:6:\"__type\";s:10:\"bind_where\";s:4:\"true\";s:16:\"bind_columns_map\";s:17:\"{\"c\":\"type_type\"}\";s:13:\"bind_order_by\";s:6:\"id ASC\";s:6:\"groups\";a:1:{i:0;a:2:{s:4:\"name\";s:11:\"Information\";s:6:\"length\";s:1:\"1\";}}s:7:\"columns\";a:1:{i:0;a:12:{s:4:\"type\";s:11:\"stringalias\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:5:\"title\";s:5:\"title\";s:5:\"Title\";s:6:\"client\";s:31:\"validate[required,maxSize[120]]\";s:6:\"server\";s:0:\"\";s:8:\"onchange\";s:0:\"\";s:11:\"group_field\";s:0:\"\";s:8:\"group_id\";s:0:\"\";s:10:\"group_join\";s:0:\"\";s:8:\"group_on\";s:0:\"\";}}s:15:\"companyrequired\";s:5:\"false\";}', '2017-08-22 09:48:56', '2017-09-05 13:27:28', '', '0', '-1', '26', null);
INSERT INTO `tbl_module` VALUES ('35', 'Post', 'post', 'a:23:{s:5:\"group\";s:4:\"Guru\";s:4:\"size\";s:3:\"320\";s:7:\"storage\";s:11:\"tbl_project\";s:6:\"prefix\";s:0:\"\";s:3:\"add\";s:4:\"true\";s:4:\"edit\";s:4:\"true\";s:6:\"delete\";s:4:\"true\";s:4:\"type\";s:4:\"post\";s:10:\"typeviewer\";s:6:\"string\";s:8:\"catetype\";s:0:\"\";s:10:\"cateviewer\";s:0:\"\";s:15:\"grid_datafields\";s:168:\"[\n    {name: \"id\", type: \"int\"},\n    {name: \"title\"},\n    {name: \"status\" , type: \"bool\"},\n    {name: \"created\" , type: \"date\"},\n    {name: \"modified\" , type: \"date\"}\n]\";s:12:\"grid_columns\";s:568:\"[{\n    text: \"Title\", dataField: \"title\", minWidth: 180, sortable: true, columntype: \"textbox\", filtertype: \"textbox\", filtercondition: \"CONTAINS\",\n},{\n    text: \"Status\"    , dataField: \"status\" , cellsalign: \"center\", width: 44, columntype: \"checkbox\", threestatecheckbox: false, filtertype: \"bool\", filterable: true, sortable: true,editable: true\n},{\n    text: \"Created\" , dataField: \"created\", width: 120, cellsalign: \"right\", filterable: true, columntype: \"datetimeinput\", filtertype: \"range\", cellsformat: \"yyyy-MM-dd HH:mm:ss\", sortable: true,editable: false\n}]\";s:12:\"grid_options\";s:0:\"\";s:5:\"debug\";s:1:\"0\";s:11:\"binding_url\";s:32:\"/dashboardapi/common/custom_bind\";s:11:\"bind_select\";s:1:\"*\";s:9:\"bind_from\";s:11:\"tbl_project\";s:10:\"bind_where\";s:4:\"true\";s:16:\"bind_columns_map\";s:0:\"\";s:13:\"bind_order_by\";s:0:\"\";s:6:\"groups\";a:1:{i:0;a:2:{s:4:\"name\";s:11:\"Information\";s:6:\"length\";s:1:\"3\";}}s:7:\"columns\";a:3:{i:0;a:7:{s:4:\"type\";s:11:\"stringalias\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:5:\"title\";s:5:\"title\";s:5:\"Title\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}i:1;a:6:{s:4:\"type\";s:20:\"server-multidropdown\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:8:\"category\";s:5:\"title\";s:6:\"Filter\";s:3:\"sid\";s:2:\"34\";}i:2;a:6:{s:4:\"type\";s:4:\"list\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:1:\"0\";s:4:\"name\";s:3:\"aaa\";s:5:\"title\";s:3:\"AAA\";s:3:\"sid\";s:2:\"34\";}}}', '2017-08-22 14:01:58', '2017-08-22 15:20:39', 'guru', '0', '-1', '27', null);
INSERT INTO `tbl_module` VALUES ('36', 'Company', 'company', 'a:25:{s:5:\"group\";s:6:\"Common\";s:4:\"size\";s:3:\"320\";s:7:\"storage\";s:9:\"__company\";s:6:\"prefix\";s:0:\"\";s:9:\"privieges\";a:1:{i:0;s:1:\"1\";}s:3:\"add\";s:4:\"true\";s:4:\"edit\";s:4:\"true\";s:6:\"delete\";s:4:\"true\";s:4:\"type\";s:0:\"\";s:10:\"typeviewer\";s:0:\"\";s:8:\"catetype\";s:0:\"\";s:10:\"cateviewer\";s:0:\"\";s:15:\"grid_datafields\";s:188:\"[\n    {name: \"id\", type: \"int\"},\n    {name: \"title\"},\n    {name: \"logo\"},\n    {name: \"status\" , type: \"bool\"},\n    {name: \"created\" , type: \"date\"},\n    {name: \"modified\" , type: \"date\"}\n]\";s:12:\"grid_columns\";s:941:\"[{\n    text: \"Name\", datafield: \"title\", minWidth: 180, sortable: true, columntype: \"textbox\", filtertype: \"textbox\", filtercondition: \"CONTAINS\",\n},{\n    text: \'Logo\'    , dataField: \'logo\' ,width: 36,\n    filterable: false, sortable: false,editable: false,\n    cellsrenderer: function (row, column, value) {\n        var html = [\n            \'<div style=\"width:36px;height:28px;background-image:url(\'+App.Helper.ImageUrl(value)+\')\" class=\"contain\">\',\n            \'</div>\',\n        ];\n        return html.join(\'\');\n    }\n},{\n    text: \"Status\"    , datafield: \"status\" , cellsalign: \"center\", width: 44, columntype: \"checkbox\", threestatecheckbox: false, filtertype: \"bool\", filterable: true, sortable: true,editable: true\n},{\n    text: \"Created\" , datafield: \"created\", width: 120, cellsalign: \"right\", filterable: true, columntype: \"datetimeinput\", filtertype: \"range\", cellsformat: \"yyyy-MM-dd HH:mm:ss\", sortable: true,editable: false\n}]\";s:12:\"grid_options\";s:0:\"\";s:5:\"debug\";s:1:\"0\";s:11:\"binding_url\";s:32:\"/dashboardapi/common/custom_bind\";s:11:\"bind_select\";s:1:\"*\";s:9:\"bind_from\";s:9:\"__company\";s:10:\"bind_where\";s:4:\"true\";s:16:\"bind_columns_map\";s:0:\"\";s:13:\"bind_order_by\";s:0:\"\";s:6:\"groups\";a:1:{i:0;a:2:{s:4:\"name\";s:11:\"Information\";s:6:\"length\";s:1:\"3\";}}s:7:\"columns\";a:3:{i:0;a:12:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:5:\"title\";s:5:\"title\";s:4:\"Name\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:13:\"trim|required\";s:8:\"onchange\";s:0:\"\";s:11:\"group_field\";s:0:\"\";s:8:\"group_id\";s:0:\"\";s:10:\"group_join\";s:0:\"\";s:8:\"group_on\";s:0:\"\";}i:1;a:7:{s:4:\"type\";s:4:\"text\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:4:\"desc\";s:5:\"title\";s:4:\"Desc\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}i:2;a:7:{s:4:\"type\";s:5:\"image\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:4:\"logo\";s:5:\"title\";s:4:\"Logo\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}}s:15:\"companyrequired\";s:5:\"false\";}', '2017-08-25 14:21:43', '2017-09-04 21:59:55', '', '0', '-1', '28', null);
INSERT INTO `tbl_module` VALUES ('37', 'Privilege', 'privilege', 'a:23:{s:5:\"group\";s:6:\"Common\";s:4:\"size\";s:3:\"320\";s:7:\"storage\";s:11:\"__privilege\";s:6:\"prefix\";s:0:\"\";s:3:\"add\";s:4:\"true\";s:4:\"edit\";s:4:\"true\";s:6:\"delete\";s:4:\"true\";s:4:\"type\";s:0:\"\";s:10:\"typeviewer\";s:0:\"\";s:8:\"catetype\";s:0:\"\";s:10:\"cateviewer\";s:0:\"\";s:15:\"grid_datafields\";s:167:\"[\n    {name: \"id\", type: \"int\"},\n    {name: \"name\"},\n    {name: \"status\" , type: \"bool\"},\n    {name: \"created\" , type: \"date\"},\n    {name: \"modified\" , type: \"date\"}\n]\";s:12:\"grid_columns\";s:566:\"[{\n    text: \"Name\", datafield: \"name\", minWidth: 180, sortable: true, columntype: \"textbox\", filtertype: \"textbox\", filtercondition: \"CONTAINS\",\n},{\n    text: \"Status\"    , datafield: \"status\" , cellsalign: \"center\", width: 44, columntype: \"checkbox\", threestatecheckbox: false, filtertype: \"bool\", filterable: true, sortable: true,editable: true\n},{\n    text: \"Created\" , datafield: \"created\", width: 120, cellsalign: \"right\", filterable: true, columntype: \"datetimeinput\", filtertype: \"range\", cellsformat: \"yyyy-MM-dd HH:mm:ss\", sortable: true,editable: false\n}]\";s:12:\"grid_options\";s:0:\"\";s:5:\"debug\";s:1:\"0\";s:11:\"binding_url\";s:32:\"/dashboardapi/common/custom_bind\";s:11:\"bind_select\";s:1:\"*\";s:9:\"bind_from\";s:11:\"__privilege\";s:10:\"bind_where\";s:4:\"true\";s:16:\"bind_columns_map\";s:0:\"\";s:13:\"bind_order_by\";s:0:\"\";s:6:\"groups\";a:1:{i:0;a:2:{s:4:\"name\";s:11:\"Information\";s:6:\"length\";s:1:\"1\";}}s:7:\"columns\";a:1:{i:0;a:7:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:4:\"name\";s:5:\"title\";s:4:\"Name\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}}}', '2017-08-31 11:24:21', null, '', '0', '-1', '29', null);
INSERT INTO `tbl_module` VALUES ('39', 'Countries', 'countries', 'a:25:{s:5:\"group\";s:6:\"Common\";s:4:\"size\";s:3:\"320\";s:7:\"storage\";s:11:\"__countries\";s:6:\"prefix\";s:0:\"\";s:9:\"privieges\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:3:\"add\";s:4:\"true\";s:4:\"edit\";s:4:\"true\";s:6:\"delete\";s:4:\"true\";s:4:\"type\";s:0:\"\";s:10:\"typeviewer\";s:0:\"\";s:8:\"catetype\";s:0:\"\";s:10:\"cateviewer\";s:0:\"\";s:15:\"grid_datafields\";s:188:\"[\n    {name: \"id\", type: \"int\"},\n    {name: \"title\"},\n    {name: \"code\"},\n    {name: \"status\" , type: \"bool\"},\n    {name: \"created\" , type: \"date\"},\n    {name: \"modified\" , type: \"date\"}\n]\";s:12:\"grid_columns\";s:712:\"[{\n    text: \"Title\", datafield: \"title\", minWidth: 180, sortable: true, columntype: \"textbox\", filtertype: \"textbox\", filtercondition: \"CONTAINS\",\n},{\n    text: \"Code\", datafield: \"code\", width: 100, sortable: true, columntype: \"textbox\", filtertype: \"textbox\", filtercondition: \"CONTAINS\",\n},{\n    text: \"Status\"    , datafield: \"status\" , cellsalign: \"center\", width: 44, columntype: \"checkbox\", threestatecheckbox: false, filtertype: \"bool\", filterable: true, sortable: true,editable: true\n},{\n    text: \"Created\" , datafield: \"created\", width: 120, cellsalign: \"right\", filterable: true, columntype: \"datetimeinput\", filtertype: \"range\", cellsformat: \"yyyy-MM-dd HH:mm:ss\", sortable: true,editable: false\n}]\";s:12:\"grid_options\";s:0:\"\";s:5:\"debug\";s:1:\"0\";s:11:\"binding_url\";s:32:\"/dashboardapi/common/custom_bind\";s:11:\"bind_select\";s:1:\"*\";s:9:\"bind_from\";s:11:\"__countries\";s:10:\"bind_where\";s:4:\"true\";s:16:\"bind_columns_map\";s:17:\"{\"c\":\"type_type\"}\";s:13:\"bind_order_by\";s:0:\"\";s:6:\"groups\";a:1:{i:0;a:2:{s:4:\"name\";s:11:\"Information\";s:6:\"length\";s:1:\"2\";}}s:7:\"columns\";a:2:{i:0;a:7:{s:4:\"type\";s:11:\"stringalias\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:5:\"title\";s:5:\"title\";s:7:\"Country\";s:6:\"client\";s:31:\"validate[required,maxSize[120]]\";s:6:\"server\";s:0:\"\";}i:1;a:7:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:4:\"code\";s:5:\"title\";s:4:\"Code\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}}s:15:\"companyrequired\";s:5:\"false\";}', '2017-09-02 11:42:54', '2017-09-05 14:18:07', '', '0', '-1', '31', null);
INSERT INTO `tbl_module` VALUES ('40', 'Region', 'region', 'a:25:{s:5:\"group\";s:6:\"Common\";s:4:\"size\";s:3:\"320\";s:7:\"storage\";s:8:\"__region\";s:6:\"prefix\";s:0:\"\";s:9:\"privieges\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:3:\"add\";s:4:\"true\";s:4:\"edit\";s:4:\"true\";s:6:\"delete\";s:4:\"true\";s:4:\"type\";s:0:\"\";s:10:\"typeviewer\";s:0:\"\";s:8:\"catetype\";s:0:\"\";s:10:\"cateviewer\";s:0:\"\";s:15:\"grid_datafields\";s:188:\"[\n    {name: \"id\", type: \"int\"},\n    {name: \"title\"},\n    {name: \"code\"},\n    {name: \"status\" , type: \"bool\"},\n    {name: \"created\" , type: \"date\"},\n    {name: \"modified\" , type: \"date\"}\n]\";s:12:\"grid_columns\";s:712:\"[{\n    text: \"Title\", datafield: \"title\", minWidth: 180, sortable: true, columntype: \"textbox\", filtertype: \"textbox\", filtercondition: \"CONTAINS\",\n},{\n    text: \"Code\", datafield: \"code\", width: 100, sortable: true, columntype: \"textbox\", filtertype: \"textbox\", filtercondition: \"CONTAINS\",\n},{\n    text: \"Status\"    , datafield: \"status\" , cellsalign: \"center\", width: 44, columntype: \"checkbox\", threestatecheckbox: false, filtertype: \"bool\", filterable: true, sortable: true,editable: true\n},{\n    text: \"Created\" , datafield: \"created\", width: 120, cellsalign: \"right\", filterable: true, columntype: \"datetimeinput\", filtertype: \"range\", cellsformat: \"yyyy-MM-dd HH:mm:ss\", sortable: true,editable: false\n}]\";s:12:\"grid_options\";s:0:\"\";s:5:\"debug\";s:1:\"0\";s:11:\"binding_url\";s:32:\"/dashboardapi/common/custom_bind\";s:11:\"bind_select\";s:1:\"*\";s:9:\"bind_from\";s:8:\"__region\";s:10:\"bind_where\";s:4:\"true\";s:16:\"bind_columns_map\";s:17:\"{\"c\":\"type_type\"}\";s:13:\"bind_order_by\";s:0:\"\";s:6:\"groups\";a:1:{i:0;a:2:{s:4:\"name\";s:11:\"Information\";s:6:\"length\";s:1:\"3\";}}s:7:\"columns\";a:3:{i:0;a:6:{s:4:\"type\";s:15:\"server-dropdown\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:10:\"country_id\";s:5:\"title\";s:7:\"Country\";s:3:\"sid\";s:2:\"39\";}i:1;a:7:{s:4:\"type\";s:11:\"stringalias\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:5:\"title\";s:5:\"title\";s:11:\"Region Name\";s:6:\"client\";s:31:\"validate[required,maxSize[120]]\";s:6:\"server\";s:0:\"\";}i:2;a:7:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:4:\"code\";s:5:\"title\";s:4:\"Code\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}}s:15:\"companyrequired\";s:5:\"false\";}', '2017-09-02 11:47:42', '2017-09-04 21:29:14', '', '0', '-1', '32', null);
INSERT INTO `tbl_module` VALUES ('41', 'Province/City', 'provincecity', 'a:25:{s:5:\"group\";s:6:\"Common\";s:4:\"size\";s:3:\"480\";s:7:\"storage\";s:10:\"__province\";s:6:\"prefix\";s:0:\"\";s:9:\"privieges\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:3:\"add\";s:4:\"true\";s:4:\"edit\";s:4:\"true\";s:6:\"delete\";s:4:\"true\";s:4:\"type\";s:0:\"\";s:10:\"typeviewer\";s:0:\"\";s:8:\"catetype\";s:0:\"\";s:10:\"cateviewer\";s:0:\"\";s:15:\"grid_datafields\";s:217:\"[\n    {name: \"id\", type: \"int\"},\n    {name: \"title\"},\n    {name: \"country_title\"},\n    {name: \"code\"},\n    {name: \"status\" , type: \"bool\"},\n    {name: \"created\" , type: \"date\"},\n    {name: \"modified\" , type: \"date\"}\n]\";s:12:\"grid_columns\";s:868:\"[{\n    text: \"Country\", datafield: \"country_title\", width: 180, sortable: true, columntype: \"textbox\", filtertype: \"textbox\", filtercondition: \"CONTAINS\",\n},{\n    text: \"Title\", datafield: \"title\", minWidth: 180, sortable: true, columntype: \"textbox\", filtertype: \"textbox\", filtercondition: \"CONTAINS\",\n},{\n    text: \"Code\", datafield: \"code\", width: 100, sortable: true, columntype: \"textbox\", filtertype: \"textbox\", filtercondition: \"CONTAINS\",\n},{\n    text: \"Status\"    , datafield: \"status\" , cellsalign: \"center\", width: 44, columntype: \"checkbox\", threestatecheckbox: false, filtertype: \"bool\", filterable: true, sortable: true,editable: true\n},{\n    text: \"Created\" , datafield: \"created\", width: 120, cellsalign: \"right\", filterable: true, columntype: \"datetimeinput\", filtertype: \"range\", cellsformat: \"yyyy-MM-dd HH:mm:ss\", sortable: true,editable: false\n}]\";s:12:\"grid_options\";s:24:\"{\"showfilterrow\": false}\";s:5:\"debug\";s:1:\"0\";s:11:\"binding_url\";s:32:\"/dashboardapi/common/custom_bind\";s:11:\"bind_select\";s:118:\"__province.id,__province.title,__province.code,__province.created,__countries.title as country_title,__province.status\";s:9:\"bind_from\";s:77:\"__province INNER JOIN __countries ON (__countries.id = __province.country_id)\";s:10:\"bind_where\";s:4:\"true\";s:16:\"bind_columns_map\";s:237:\"{\n    \"id\": \"__province.id\",\n    \"title\": \"__province.id\",\n    \"country_title\": \"__countries.title\",\n    \"title\": \"__province.title\",\n    \"code\": \"__province.code\",\n    \"created\": \"__province.created\",\n    \"status\": \"__province.status\"\n}\";s:13:\"bind_order_by\";s:66:\"__province.type ASC, __province.sorting DESC, __province.title ASC\";s:6:\"groups\";a:1:{i:0;a:2:{s:4:\"name\";s:11:\"Information\";s:6:\"length\";s:1:\"4\";}}s:7:\"columns\";a:4:{i:0;a:6:{s:4:\"type\";s:15:\"server-dropdown\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:10:\"country_id\";s:5:\"title\";s:7:\"Country\";s:3:\"sid\";s:2:\"39\";}i:1;a:7:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:5:\"title\";s:5:\"title\";s:15:\"Province / City\";s:6:\"client\";s:31:\"validate[required,maxSize[120]]\";s:6:\"server\";s:0:\"\";}i:2;a:7:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:4:\"code\";s:5:\"title\";s:4:\"Code\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}i:3;a:7:{s:4:\"type\";s:3:\"map\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:7:\"lat,lon\";s:5:\"title\";s:3:\"Map\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}}s:15:\"companyrequired\";s:5:\"false\";}', '2017-09-02 12:18:57', '2017-09-15 16:07:09', '', '0', '-1', '33', null);
INSERT INTO `tbl_module` VALUES ('42', 'Trademark', 'trademark', 'a:25:{s:5:\"group\";s:6:\"Common\";s:4:\"size\";s:0:\"\";s:7:\"storage\";s:11:\"__trademark\";s:6:\"prefix\";s:0:\"\";s:9:\"privieges\";a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:4:\"1003\";i:3;s:4:\"1002\";}s:3:\"add\";s:4:\"true\";s:4:\"edit\";s:4:\"true\";s:6:\"delete\";s:4:\"true\";s:15:\"companyrequired\";s:4:\"true\";s:4:\"type\";s:0:\"\";s:10:\"typeviewer\";s:0:\"\";s:8:\"catetype\";s:0:\"\";s:10:\"cateviewer\";s:0:\"\";s:15:\"grid_datafields\";s:168:\"[\n    {name: \"id\", type: \"int\"},\n    {name: \"title\"},\n    {name: \"status\" , type: \"bool\"},\n    {name: \"created\" , type: \"date\"},\n    {name: \"modified\" , type: \"date\"}\n]\";s:12:\"grid_columns\";s:568:\"[{\n    text: \"Title\", datafield: \"title\", minWidth: 180, sortable: true, columntype: \"textbox\", filtertype: \"textbox\", filtercondition: \"CONTAINS\",\n},{\n    text: \"Status\"    , datafield: \"status\" , cellsalign: \"center\", width: 44, columntype: \"checkbox\", threestatecheckbox: false, filtertype: \"bool\", filterable: true, sortable: true,editable: true\n},{\n    text: \"Created\" , datafield: \"created\", width: 120, cellsalign: \"right\", filterable: true, columntype: \"datetimeinput\", filtertype: \"range\", cellsformat: \"yyyy-MM-dd HH:mm:ss\", sortable: true,editable: false\n}]\";s:12:\"grid_options\";s:0:\"\";s:5:\"debug\";s:1:\"0\";s:11:\"binding_url\";s:32:\"/dashboardapi/common/custom_bind\";s:11:\"bind_select\";s:1:\"*\";s:9:\"bind_from\";s:11:\"__trademark\";s:10:\"bind_where\";s:4:\"true\";s:16:\"bind_columns_map\";s:0:\"\";s:13:\"bind_order_by\";s:0:\"\";s:6:\"groups\";a:1:{i:0;a:2:{s:4:\"name\";s:11:\"Information\";s:6:\"length\";s:2:\"11\";}}s:7:\"columns\";a:11:{i:0;a:7:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:5:\"title\";s:5:\"title\";s:5:\"Title\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}i:1;a:11:{s:4:\"type\";s:15:\"server-dropdown\";s:3:\"col\";s:1:\"6\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:10:\"country_Id\";s:5:\"title\";s:7:\"Country\";s:3:\"sid\";s:2:\"39\";s:8:\"onchange\";s:0:\"\";s:11:\"group_field\";s:0:\"\";s:8:\"group_id\";s:0:\"\";s:10:\"group_join\";s:0:\"\";s:8:\"group_on\";s:0:\"\";}i:2;a:11:{s:4:\"type\";s:20:\"server-multidropdown\";s:3:\"col\";s:1:\"6\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:11:\"category_id\";s:5:\"title\";s:8:\"Category\";s:3:\"sid\";s:2:\"26\";s:8:\"onchange\";s:0:\"\";s:11:\"group_field\";s:0:\"\";s:8:\"group_id\";s:0:\"\";s:10:\"group_join\";s:0:\"\";s:8:\"group_on\";s:0:\"\";}i:3;a:7:{s:4:\"type\";s:4:\"text\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:4:\"desc\";s:5:\"title\";s:4:\"Desc\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}i:4;a:7:{s:4:\"type\";s:5:\"image\";s:3:\"col\";s:1:\"6\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:4:\"logo\";s:5:\"title\";s:4:\"Logo\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}i:5;a:7:{s:4:\"type\";s:5:\"image\";s:3:\"col\";s:1:\"6\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:5:\"image\";s:5:\"title\";s:5:\"Image\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}i:6;a:7:{s:4:\"type\";s:4:\"html\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:7:\"content\";s:5:\"title\";s:7:\"Content\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}i:7;a:12:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:1:\"6\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:5:\"email\";s:5:\"title\";s:5:\"Email\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:8:\"onchange\";s:0:\"\";s:11:\"group_field\";s:0:\"\";s:8:\"group_id\";s:0:\"\";s:10:\"group_join\";s:0:\"\";s:8:\"group_on\";s:0:\"\";}i:8;a:12:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:12:\"contact_name\";s:5:\"title\";s:14:\"Contact Person\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:8:\"onchange\";s:0:\"\";s:11:\"group_field\";s:0:\"\";s:8:\"group_id\";s:0:\"\";s:10:\"group_join\";s:0:\"\";s:8:\"group_on\";s:0:\"\";}i:9;a:12:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:13:\"contact_phone\";s:5:\"title\";s:5:\"Phone\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:8:\"onchange\";s:0:\"\";s:11:\"group_field\";s:0:\"\";s:8:\"group_id\";s:0:\"\";s:10:\"group_join\";s:0:\"\";s:8:\"group_on\";s:0:\"\";}i:10;a:12:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:15:\"contact_address\";s:5:\"title\";s:7:\"Address\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:8:\"onchange\";s:0:\"\";s:11:\"group_field\";s:0:\"\";s:8:\"group_id\";s:0:\"\";s:10:\"group_join\";s:0:\"\";s:8:\"group_on\";s:0:\"\";}}}', '2017-09-03 18:00:59', '2017-10-13 13:15:55', '', '0', '-1', '34', null);
INSERT INTO `tbl_module` VALUES ('43', 'Shop', 'shop', 'a:25:{s:5:\"group\";s:6:\"Common\";s:4:\"size\";s:0:\"\";s:7:\"storage\";s:6:\"__shop\";s:6:\"prefix\";s:0:\"\";s:9:\"privieges\";a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:4:\"1003\";i:3;s:4:\"1002\";}s:3:\"add\";s:4:\"true\";s:4:\"edit\";s:4:\"true\";s:6:\"delete\";s:4:\"true\";s:15:\"companyrequired\";s:4:\"true\";s:4:\"type\";s:0:\"\";s:10:\"typeviewer\";s:0:\"\";s:8:\"catetype\";s:0:\"\";s:10:\"cateviewer\";s:0:\"\";s:15:\"grid_datafields\";s:168:\"[\n    {name: \"id\", type: \"int\"},\n    {name: \"title\"},\n    {name: \"status\" , type: \"bool\"},\n    {name: \"created\" , type: \"date\"},\n    {name: \"modified\" , type: \"date\"}\n]\";s:12:\"grid_columns\";s:568:\"[{\n    text: \"Title\", datafield: \"title\", minWidth: 180, sortable: true, columntype: \"textbox\", filtertype: \"textbox\", filtercondition: \"CONTAINS\",\n},{\n    text: \"Status\"    , datafield: \"status\" , cellsalign: \"center\", width: 44, columntype: \"checkbox\", threestatecheckbox: false, filtertype: \"bool\", filterable: true, sortable: true,editable: true\n},{\n    text: \"Created\" , datafield: \"created\", width: 120, cellsalign: \"right\", filterable: true, columntype: \"datetimeinput\", filtertype: \"range\", cellsformat: \"yyyy-MM-dd HH:mm:ss\", sortable: true,editable: false\n}]\";s:12:\"grid_options\";s:0:\"\";s:5:\"debug\";s:1:\"0\";s:11:\"binding_url\";s:32:\"/dashboardapi/common/custom_bind\";s:11:\"bind_select\";s:1:\"*\";s:9:\"bind_from\";s:6:\"__shop\";s:10:\"bind_where\";s:4:\"true\";s:16:\"bind_columns_map\";s:0:\"\";s:13:\"bind_order_by\";s:0:\"\";s:6:\"groups\";a:1:{i:0;a:2:{s:4:\"name\";s:11:\"Information\";s:6:\"length\";s:1:\"5\";}}s:7:\"columns\";a:5:{i:0;a:6:{s:4:\"type\";s:15:\"server-dropdown\";s:3:\"col\";s:1:\"6\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:12:\"trademark_id\";s:5:\"title\";s:9:\"Trademark\";s:3:\"sid\";s:2:\"42\";}i:1;a:11:{s:4:\"type\";s:15:\"server-dropdown\";s:3:\"col\";s:1:\"6\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:11:\"province_id\";s:5:\"title\";s:13:\"Province/City\";s:3:\"sid\";s:2:\"41\";s:8:\"onchange\";s:0:\"\";s:11:\"group_field\";s:0:\"\";s:8:\"group_id\";s:0:\"\";s:10:\"group_join\";s:0:\"\";s:8:\"group_on\";s:0:\"\";}i:2;a:7:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:5:\"title\";s:5:\"title\";s:5:\"Title\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}i:3;a:7:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:7:\"address\";s:5:\"title\";s:7:\"Address\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}i:4;a:7:{s:4:\"type\";s:3:\"map\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:7:\"lat,lon\";s:5:\"title\";s:3:\"Map\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}}}', '2017-09-03 21:00:35', '2017-10-13 13:07:50', '', '0', '-1', '35', null);
INSERT INTO `tbl_module` VALUES ('44', 'Campaign', 'campaign', 'a:25:{s:5:\"group\";s:6:\"Common\";s:4:\"size\";s:0:\"\";s:7:\"storage\";s:10:\"__campaign\";s:6:\"prefix\";s:0:\"\";s:9:\"privieges\";a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:4:\"1003\";i:3;s:4:\"1002\";}s:3:\"add\";s:4:\"true\";s:4:\"edit\";s:4:\"true\";s:6:\"delete\";s:4:\"true\";s:15:\"companyrequired\";s:4:\"true\";s:4:\"type\";s:0:\"\";s:10:\"typeviewer\";s:0:\"\";s:8:\"catetype\";s:0:\"\";s:10:\"cateviewer\";s:0:\"\";s:15:\"grid_datafields\";s:168:\"[\n    {name: \"id\", type: \"int\"},\n    {name: \"title\"},\n    {name: \"status\" , type: \"bool\"},\n    {name: \"created\" , type: \"date\"},\n    {name: \"modified\" , type: \"date\"}\n]\";s:12:\"grid_columns\";s:568:\"[{\n    text: \"Title\", datafield: \"title\", minWidth: 180, sortable: true, columntype: \"textbox\", filtertype: \"textbox\", filtercondition: \"CONTAINS\",\n},{\n    text: \"Status\"    , datafield: \"status\" , cellsalign: \"center\", width: 44, columntype: \"checkbox\", threestatecheckbox: false, filtertype: \"bool\", filterable: true, sortable: true,editable: true\n},{\n    text: \"Created\" , datafield: \"created\", width: 120, cellsalign: \"right\", filterable: true, columntype: \"datetimeinput\", filtertype: \"range\", cellsformat: \"yyyy-MM-dd HH:mm:ss\", sortable: true,editable: false\n}]\";s:12:\"grid_options\";s:0:\"\";s:5:\"debug\";s:1:\"0\";s:11:\"binding_url\";s:32:\"/dashboardapi/common/custom_bind\";s:11:\"bind_select\";s:1:\"*\";s:9:\"bind_from\";s:10:\"__campaign\";s:10:\"bind_where\";s:4:\"true\";s:16:\"bind_columns_map\";s:0:\"\";s:13:\"bind_order_by\";s:0:\"\";s:6:\"groups\";a:1:{i:0;a:2:{s:4:\"name\";s:11:\"Information\";s:6:\"length\";s:2:\"12\";}}s:7:\"columns\";a:12:{i:0;a:7:{s:4:\"type\";s:15:\"server-dropdown\";s:3:\"col\";s:1:\"6\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:12:\"trademark_id\";s:5:\"title\";s:9:\"Trademark\";s:3:\"sid\";s:2:\"42\";s:8:\"onchange\";s:51:\"App.Common.onFolowChange(\'trademark_id\',\'shop_ids\')\";}i:1;a:13:{s:4:\"type\";s:26:\"group-server-multidropdown\";s:3:\"col\";s:1:\"6\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:8:\"shop_ids\";s:5:\"title\";s:5:\"Shops\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:3:\"sid\";s:2:\"43\";s:8:\"onchange\";s:0:\"\";s:11:\"group_field\";s:5:\"title\";s:8:\"group_id\";s:2:\"id\";s:10:\"group_join\";s:11:\"__trademark\";s:8:\"group_on\";s:36:\"__trademark.id = __shop.trademark_id\";}i:2;a:11:{s:4:\"type\";s:15:\"server-dropdown\";s:3:\"col\";s:1:\"6\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:7:\"type_id\";s:5:\"title\";s:4:\"Type\";s:3:\"sid\";s:2:\"34\";s:8:\"onchange\";s:0:\"\";s:11:\"group_field\";s:0:\"\";s:8:\"group_id\";s:0:\"\";s:10:\"group_join\";s:0:\"\";s:8:\"group_on\";s:0:\"\";}i:3;a:11:{s:4:\"type\";s:15:\"server-dropdown\";s:3:\"col\";s:1:\"6\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:11:\"category_id\";s:5:\"title\";s:8:\"Category\";s:3:\"sid\";s:2:\"26\";s:8:\"onchange\";s:0:\"\";s:11:\"group_field\";s:0:\"\";s:8:\"group_id\";s:0:\"\";s:10:\"group_join\";s:0:\"\";s:8:\"group_on\";s:0:\"\";}i:4;a:7:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:5:\"title\";s:5:\"title\";s:5:\"Title\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}i:5;a:7:{s:4:\"type\";s:4:\"text\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:4:\"desc\";s:5:\"title\";s:4:\"Desc\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}i:6;a:7:{s:4:\"type\";s:5:\"image\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:5:\"image\";s:5:\"title\";s:5:\"Image\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}i:7;a:7:{s:4:\"type\";s:8:\"datetime\";s:3:\"col\";s:1:\"6\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:10:\"start_date\";s:5:\"title\";s:10:\"Start Date\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}i:8;a:7:{s:4:\"type\";s:8:\"datetime\";s:3:\"col\";s:1:\"6\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:8:\"end_date\";s:5:\"title\";s:8:\"End Date\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}i:9;a:7:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:1:\"6\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:7:\"website\";s:5:\"title\";s:7:\"Website\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}i:10;a:7:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:1:\"6\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:7:\"hotline\";s:5:\"title\";s:7:\"Hotline\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}i:11;a:7:{s:4:\"type\";s:4:\"html\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:7:\"content\";s:5:\"title\";s:7:\"Content\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}}}', '2017-09-04 08:23:28', '2017-09-05 13:25:11', '', '0', '-1', '36', null);
INSERT INTO `tbl_module` VALUES ('45', 'CMS Menu', 'cms-menu', 'a:25:{s:5:\"group\";s:6:\"Common\";s:4:\"size\";s:3:\"480\";s:7:\"storage\";s:6:\"__menu\";s:6:\"prefix\";s:0:\"\";s:9:\"privieges\";a:1:{i:0;s:1:\"1\";}s:3:\"add\";s:4:\"true\";s:4:\"edit\";s:4:\"true\";s:6:\"delete\";s:4:\"true\";s:4:\"type\";s:0:\"\";s:10:\"typeviewer\";s:0:\"\";s:8:\"catetype\";s:0:\"\";s:10:\"cateviewer\";s:4:\"tree\";s:15:\"grid_datafields\";s:189:\"[\n    {name: \"id\", type: \"int\"},\n    {name: \"title\"},\n    {name: \"level\"},\n    {name: \"status\" , type: \"bool\"},\n    {name: \"created\" , type: \"date\"},\n    {name: \"modified\" , type: \"date\"}\n]\";s:12:\"grid_columns\";s:1141:\"[{\n    text: \'Title\', dataField: \'title\', minWidth: 180, sortable: true,\n    columntype: \'textbox\', filtertype: \'textbox\', filtercondition: \'CONTAINS\',\n    cellsrenderer: function (row, columnfield, value, defaulthtml, columnproperties) {\n                    var dataRow = $(gridElm).jqxGrid(\'getrowdata\', row);\n                    var str = \'<div style=\"overflow: hidden; text-overflow: ellipsis; padding-bottom: 4px; text-align: left; margin-right: 2px; margin-left: 4px; padding-top: 4px;\">\';\n                    str+=\'<span style=\"padding-left:\'+dataRow.level*20+\'px;\">\'+value+\'</span>\';\n                    //str+=dataRow.Display;\n                    str+=\'</div>\';\n                    return str;\n                }\n},{\n    text: \"Status\"    , datafield: \"status\" , cellsalign: \"center\", width: 44, columntype: \"checkbox\", threestatecheckbox: false, filtertype: \"bool\", filterable: true, sortable: true,editable: true\n},{\n    text: \"Created\" , datafield: \"created\", width: 120, cellsalign: \"right\", filterable: true, columntype: \"datetimeinput\", filtertype: \"range\", cellsformat: \"yyyy-MM-dd HH:mm:ss\", sortable: true,editable: false\n}]\";s:12:\"grid_options\";s:0:\"\";s:5:\"debug\";s:1:\"0\";s:11:\"binding_url\";s:37:\"/dashboardapi/common/custom_tree_bind\";s:11:\"bind_select\";s:1:\"*\";s:9:\"bind_from\";s:6:\"__menu\";s:10:\"bind_where\";s:4:\"true\";s:16:\"bind_columns_map\";s:0:\"\";s:13:\"bind_order_by\";s:0:\"\";s:6:\"groups\";a:1:{i:0;a:2:{s:4:\"name\";s:11:\"Information\";s:6:\"length\";s:1:\"5\";}}s:7:\"columns\";a:5:{i:0;a:7:{s:4:\"type\";s:11:\"stringalias\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:5:\"title\";s:5:\"title\";s:5:\"Title\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";}i:1;a:13:{s:4:\"type\";s:6:\"parent\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:9:\"parent_id\";s:5:\"title\";s:6:\"Parent\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:3:\"sid\";s:2:\"45\";s:8:\"onchange\";s:0:\"\";s:11:\"group_field\";s:0:\"\";s:8:\"group_id\";s:0:\"\";s:10:\"group_join\";s:0:\"\";s:8:\"group_on\";s:0:\"\";}i:2;a:12:{s:4:\"type\";s:9:\"privilege\";s:3:\"col\";s:2:\"12\";s:10:\"columndata\";s:0:\"\";s:4:\"name\";s:9:\"privilege\";s:5:\"title\";s:9:\"Privilege\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:8:\"onchange\";s:0:\"\";s:11:\"group_field\";s:0:\"\";s:8:\"group_id\";s:0:\"\";s:10:\"group_join\";s:0:\"\";s:8:\"group_on\";s:0:\"\";}i:3;a:12:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:1:\"6\";s:10:\"columndata\";s:1:\"0\";s:4:\"name\";s:4:\"link\";s:5:\"title\";s:4:\"Link\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:8:\"onchange\";s:0:\"\";s:11:\"group_field\";s:0:\"\";s:8:\"group_id\";s:0:\"\";s:10:\"group_join\";s:0:\"\";s:8:\"group_on\";s:0:\"\";}i:4;a:12:{s:4:\"type\";s:6:\"string\";s:3:\"col\";s:1:\"6\";s:10:\"columndata\";s:1:\"0\";s:4:\"name\";s:4:\"icon\";s:5:\"title\";s:4:\"Icon\";s:6:\"client\";s:0:\"\";s:6:\"server\";s:0:\"\";s:8:\"onchange\";s:0:\"\";s:11:\"group_field\";s:0:\"\";s:8:\"group_id\";s:0:\"\";s:10:\"group_join\";s:0:\"\";s:8:\"group_on\";s:0:\"\";}}s:15:\"companyrequired\";s:5:\"false\";}', '2017-09-04 11:56:37', '2017-09-04 19:27:40', '', '0', '-1', '37', null);

-- ----------------------------
-- Table structure for tbl_setting
-- ----------------------------
DROP TABLE IF EXISTS `tbl_setting`;
CREATE TABLE `tbl_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `data` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  `category` int(11) DEFAULT '-1',
  `pid` int(11) DEFAULT '-1',
  `key` varchar(32) DEFAULT NULL,
  `sorting` int(11) DEFAULT '1',
  `author` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_setting
-- ----------------------------
INSERT INTO `tbl_setting` VALUES ('11', 'Description', 'description', 'a:2:{s:3:\"sid\";s:2:\"24\";s:4:\"desc\";s:22:\"Description of website\";}', '2017-06-01 15:31:07', null, 'creative', '0', '36', '-1', null, '5', null);
INSERT INTO `tbl_setting` VALUES ('9', 'Tel', 'tel', 'a:3:{s:3:\"sid\";s:2:\"23\";s:4:\"desc\";s:52:\"A portable telephone that can make and receive calls\";s:5:\"value\";s:10:\"0985747240\";}', '2017-06-01 10:51:55', '2017-06-01 15:56:43', 'creative', '0', '37', '-1', null, '3', null);
INSERT INTO `tbl_setting` VALUES ('8', 'Mobile Phone', 'mobile-phone', 'a:3:{s:3:\"sid\";s:2:\"23\";s:4:\"desc\";s:52:\"A portable telephone that can make and receive calls\";s:5:\"value\";s:30:\"+61 8 8274 7000 - 1800 809 991\";}', '2017-06-01 10:50:23', '2017-06-02 12:07:13', 'creative', '0', '37', '-1', null, '2', null);
INSERT INTO `tbl_setting` VALUES ('7', 'Địa chỉ', 'address', 'a:3:{s:3:\"sid\";s:2:\"23\";s:5:\"value\";s:45:\"215 Greenhill Rd, Eastwood SA 5063, Australia\";s:4:\"desc\";s:18:\"Address of company\";}', '2017-06-01 09:59:06', '2017-06-02 12:17:33', 'creative', '0', '37', '-1', null, '1', null);
INSERT INTO `tbl_setting` VALUES ('10', 'Keywork', 'keywork', 'a:2:{s:3:\"sid\";s:2:\"23\";s:4:\"desc\";s:16:\"Keyword meta tag\";}', '2017-06-01 11:00:14', null, 'creative', '0', '36', '-1', null, '4', null);
INSERT INTO `tbl_setting` VALUES ('12', 'Logo', 'logo', 'a:3:{s:3:\"sid\";s:2:\"25\";s:4:\"desc\";s:15:\"Logo of website\";s:5:\"value\";s:21:\"/data/image/img/1.jpg\";}', '2017-06-01 16:11:35', '2017-06-01 16:11:48', 'creative', '0', '36', '-1', null, '6', null);
INSERT INTO `tbl_setting` VALUES ('13', 'Email', 'email', 'a:3:{s:3:\"sid\";s:2:\"23\";s:4:\"desc\";s:33:\"Email to contact and send request\";s:5:\"value\";s:29:\"nhungbui@creativedesignvn.com\";}', '2017-06-02 11:12:45', '2017-06-02 11:12:50', 'creative', '0', '37', '-1', null, '7', null);
INSERT INTO `tbl_setting` VALUES ('14', 'Map', 'map', 'a:3:{s:3:\"sid\";s:2:\"23\";s:4:\"desc\";s:22:\"Location of Google Map\";s:5:\"value\";s:21:\"10.892048, 106.679982\";}', '2017-06-02 11:23:28', '2017-06-02 12:14:20', 'creative', '0', '37', '-1', null, '8', null);
INSERT INTO `tbl_setting` VALUES ('15', 'LIÊN HỆ VỚI CHÚNG TÔI', 'lien-he-voi-chung-toi', 'a:3:{s:3:\"sid\";s:2:\"24\";s:4:\"desc\";s:28:\"LIÊN HỆ VỚI CHÚNG TÔI\";s:5:\"value\";s:87:\"Vui lòng để lại thông tin, chúng tôi sẽ liên hệ với bạn sớm nhất.\";}', '2017-06-02 12:10:34', '2017-06-02 12:12:40', 'creative', '0', '37', '-1', null, '9', null);
INSERT INTO `tbl_setting` VALUES ('16', 'Title', 'title', 'a:3:{s:3:\"sid\";s:2:\"23\";s:4:\"desc\";s:16:\"Title of website\";s:5:\"value\";s:23:\"Creative Design Studio \";}', '2017-06-02 12:15:13', '2017-06-02 12:15:31', 'creative', '0', '36', '-1', null, '10', null);
INSERT INTO `tbl_setting` VALUES ('17', 'Khách hàng hài lòng', 'testimonial', 'a:3:{s:3:\"sid\";s:2:\"24\";s:4:\"desc\";s:26:\"Testimonial from customer.\";s:5:\"value\";s:245:\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\";}', '2017-06-02 13:19:07', '2017-06-02 13:19:36', 'creative', '0', '38', '-1', null, '11', null);
INSERT INTO `tbl_setting` VALUES ('18', 'Công việc của chúng tôi', 'cong-viec-cua-chung-toi', 'a:3:{s:3:\"sid\";s:2:\"24\";s:4:\"desc\";s:30:\"Công việc của chúng tôi\";s:5:\"value\";s:170:\"Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\";}', '2017-06-02 14:04:21', '2017-06-02 14:04:31', 'creative', '0', '38', '-1', null, '12', null);
INSERT INTO `tbl_setting` VALUES ('24', 'SMTPSecure', 'smtpsecure', 'a:2:{s:3:\"sid\";s:2:\"23\";s:4:\"desc\";s:10:\"SMTPSecure\";}', '2017-07-20 14:09:35', null, 'email', '0', '0', '-1', null, '18', null);
INSERT INTO `tbl_setting` VALUES ('23', 'SMTPAuth', 'smtpauth', 'a:2:{s:3:\"sid\";s:2:\"29\";s:4:\"desc\";s:8:\"SMTPAuth\";}', '2017-07-20 14:09:24', null, 'email', '0', '0', '-1', null, '17', null);
INSERT INTO `tbl_setting` VALUES ('21', 'Host', 'host', 'a:2:{s:3:\"sid\";s:2:\"23\";s:4:\"desc\";s:15:\"The SMTP server\";}', '2017-07-20 13:55:33', null, 'email', '0', '0', '-1', null, '15', null);
INSERT INTO `tbl_setting` VALUES ('22', 'Port', 'port', 'a:2:{s:3:\"sid\";s:2:\"23\";s:4:\"desc\";s:33:\"The SMTP port for the mail server\";}', '2017-07-20 13:55:58', null, 'email', '0', '0', '-1', null, '16', null);
INSERT INTO `tbl_setting` VALUES ('25', 'Mailer', 'mailer', 'a:2:{s:3:\"sid\";s:2:\"23\";s:4:\"desc\";s:6:\"Mailer\";}', '2017-07-20 14:09:46', null, 'email', '0', '0', '-1', null, '19', null);
INSERT INTO `tbl_setting` VALUES ('26', 'Username', 'username', 'a:2:{s:3:\"sid\";s:2:\"23\";s:4:\"desc\";s:8:\"Username\";}', '2017-07-20 14:10:00', null, 'email', '0', '0', '-1', null, '20', null);
INSERT INTO `tbl_setting` VALUES ('27', 'Password', 'password', 'a:2:{s:3:\"sid\";s:2:\"23\";s:4:\"desc\";s:8:\"Password\";}', '2017-07-20 14:10:11', null, 'email', '0', '0', '-1', null, '21', null);
INSERT INTO `tbl_setting` VALUES ('28', 'Sender name', 'sender-name', 'a:2:{s:3:\"sid\";s:2:\"23\";s:4:\"desc\";s:11:\"Sender name\";}', '2017-07-20 14:11:16', null, 'email', '0', '0', '-1', null, '22', null);

-- ----------------------------
-- Table structure for __campaign
-- ----------------------------
DROP TABLE IF EXISTS `__campaign`;
CREATE TABLE `__campaign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `trademark_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `title_long` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `available_to` varchar(20) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `count_like` int(11) DEFAULT '0',
  `count_view` int(11) DEFAULT '0',
  `website` varchar(255) DEFAULT NULL,
  `rating` float DEFAULT '0',
  `content` text,
  `sorting` int(11) DEFAULT '0',
  `author` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `apply_for` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __campaign
-- ----------------------------
INSERT INTO `__campaign` VALUES ('1', null, '1', 'Miễn phí vé', null, 'Miễn phí vé Spa cho Ông Bà,Mẹ,Con, Bạn gái', 'http://beautyguru.speranzainc.net/data/image/camp8.jpg', '2017-10-10 11:06:00', '2017-11-03 16:16:42', '3', '1', '2017-10-15 11:06:00', '2017-12-10 11:00:00', '2', '0', 'https://www.facebook.com/pages/Temple-Leaf-Spa-Sauna/847583248685100', '0', 'THÁNG 9, 10 - 4 chương trình ƯU ĐÃI BUỔI TỐI \n\n1.Bạn gái được miễn phí 1 vé Spa Jjim Jil Bang khi đi cùng với bạn trai\n\nƯu đãi thêm:\n\n- Phiếu quà tặng Games & Karaoke ( trị giá 70k/ cặp)\n\n- Giảm 35% Buffet tối (trị giá 175k/người)\n\n- Giảm 20% Massage Foot / Body / Facial 60p\n\nÁp dụng từ 18h hàng ngày đến hết ngày 31/10\n\n* Điều kiện: Cặp đôi 15-30t mặc áo đôi, mang CMND đến quầy lễ tân\n\n2.Ông bà được miễn phí 1 vé Spa dành cho người Việt Nam từ 60t trở lên\n\nƯu đãi thêm:\n\n- Giảm 40% Jjim Jil Bang cho người đi cùng ( tối đa 3 người) . Trị giá 200k/ người\n\n- Phiếu quà tặng Games & Karaoke trị giá 70k\n\n- Giảm 35% Buffet tối (trị giá 175k/người)\n\n- Giảm 20% Massage Foot / Body / Facial 60p\n\nÁp dụng từ 16h hàng ngày đến hết ngày 31/10\n\n* Điều kiện: Kèm theo 1 người từ 18t trở lên\n\nMang CMND đến quầy lễ tân\n\n3.Miễn phí vé spa cho mẹ yêu\n\nƯu đãi thêm:\n\n- Phiếu quà tặng Games & Karaoke trị giá 70k\n\n- Giảm 35% Buffet tối (trị giá 175k/người)\n\n- Giảm 20% Massage Foot / Body / Facial 60p\n\nÁp dụng từ 18h hàng ngày đến hết ngày 31/10\n\nÁp dụng cho mẹ đi cùng 1 người con trên 18t ( Con giảm còn 265k)\n\n* Điều kiện: Kèm hình gia đình chụp trong vòng 5 năm\n\n4. Con được miễn phí, giảm 20% cho bố hoặc mẹ \n\nBé dưới 0.8m miễn phí\n\nQuà tặng kèm trị giá 210k\n\n- 4 tiếng trong Kid Care Cafe trị giá 140k ( tối đa 2 bé)\n\n- Phiếu quà tặng dịch vụ Games & Karaoke trị giá 70k\n\nƯu đãi thêm:\n\n- Giảm 35% Buffet tối (trị giá 175k/người)\n\n- Giảm 20% Massage Foot / Body / Facial 60p\n\nÁp dụng từ 18h hàng ngày đến hết ngày 31/10\n\nÁp dụng cho con cao từ 0.8 - 1.2m ( tối đa 2 bé)', '0', '10018', '50', null);
INSERT INTO `__campaign` VALUES ('2', null, '1', '43%', null, 'Nếu bạn muốn sở hữu một làn da trắng sáng không tì vết, dịch vụ tắm trắng mặt và body từ A đến Z tại Hasaki Beauty & Spa với khuyến mãi giảm đến 43% là gợi ý tuyệt vời dành cho bạn!', 'http://beautyguru.speranzainc.net/data/image/camp9.png', '2017-10-10 11:06:00', '2017-11-02 20:15:07', '3', '1,2', '2017-10-15 11:06:00', '2017-12-15 11:00:00', '3', '0', 'https://www.facebook.com/pages/Temple-Leaf-Spa-Sauna/847583248685100', '0', 'Nhân dịp khai trương, bên cạnh dịch vụ giảm mỡ bụng chuyên sâu ưu đãi đến 77%, Hasaki Beauty & Spa còn cung cấp liệu trình tắm trắng mặt và body độc đáo với mức chi phí không thể rẻ hơn, chỉ 199.000 VNĐ (giá gốc 350.000 VNĐ).', '0', '10018', '50', null);
INSERT INTO `__campaign` VALUES ('3', null, '1', 'XUÂN 2017', null, 'Combo khuyến mãi cực sốc giảm tới 40% dịch vụ làm tóc tại', 'http://beautyguru.speranzainc.net/data/image/camp16.jpg', '2017-10-10 11:06:00', '2017-11-02 20:00:44', '3', '1', '2017-10-20 11:06:00', '2017-11-30 11:00:00', '1', '0', 'https://www.facebook.com/pages/Temple-Leaf-Spa-Sauna/847583248685100', '0', 'Combo Cắt + Gội + Ép : chỉ còn 399.000đ\n\n- Combo Cắt + Gội + Uốn: chỉ còn 399.000đ\n\n- Combo Cắt + Gội + Nhuộm: chỉ còn 399.000đ\n\n- Combo Cắt + Uốn + Nhuộm + Hấp Collagen: chỉ còn 750.000đ\n\n- Dập: chỉ còn 300.000đ', '0', '10018', '50', null);
INSERT INTO `__campaign` VALUES ('4', null, '2', '50%', null, 'Cơ hội làm đẹp cho mái tóc và làm mới phong cách của mình với dịch vụ làm tóc trọn gói gồm cắt tóc kết hợp duỗi, nhuộm hoặc uốn lạnh tại Angel Beauty Spa. Chỉ 200.000đ cho trị giá 400.000đ', 'http://beautyguru.speranzainc.net/data/image/camp15.jpg', '2017-10-10 11:06:00', '2017-11-02 20:24:53', '3', '1,2', '2017-10-05 11:06:00', '2017-11-30 11:00:00', '3', '0', 'http://www.vietnam-guide.com/ho-chi-minh-city/spas-massage/saigon-heritage-spa.htm', '0', '1 phiếu/1 người. 1 lần sử dụng. Áp dụng 01 trong 03 dịch vụ làm tóc trọn gói:\n- Cắt và duỗi.\n- Cắt và nhuộm.\n- Cắt và uốn lạnh.\n- Không phân biệt độ dài hay ngắn của tóc.', '0', '10018', '50', null);
INSERT INTO `__campaign` VALUES ('5', null, '2', '99.000đ', null, 'SALON TÓC NGỌC NỮ KHUYẾN MÃI TỪ NGÀY 10/10 - 31/12/2017', 'http://beautyguru.speranzainc.net/data/image/camp14.jpg', '2017-10-10 11:06:00', '2017-11-02 19:58:52', '3', '1', '2017-10-10 11:06:00', '2017-12-31 11:00:00', '2', '0', 'http://www.vietnam-guide.com/ho-chi-minh-city/spas-massage/saigon-heritage-spa.htm', '0', 'KHÁCH HÀNG VUI LÒNG NHẮN TIN ĐẾN SỐ 096.200.7650 ĐỂ NHẬN MÃ SỐ, NỘI DUNG TIN NHẮN NHƯ SAU: \"HỌ TÊN - ĐỊA CHỈ EMAIL - DỊCH VỤ CẦN LÀM\"\nCông nghệ nhuộm phủ mịn làm suôn mượt, phục hồi tóc hư tổn tại hệ thống Salon Ngọc Nữ (không áp dụng chi nhánh 61 Hoàng Hoa Thám) chỉ có 99.000đ bao gồm gội + sấy (không bao gồm cắt).\nQuy trình nhuộm phủ mịn làm suôn tóc:\n1 - Tư vấn và giải thích về kỹ thuật phủ mịn 10 phút\n2 - Gội đầu thư giãn 15 phút\n3 - Thực hiện bước 1 của kỹ thuật phủ mịn 25 phút\n4 - Thực hiện bước 2 của kỹ thuật phủ mịn 15 phút\n5 - Kiểm tra kết quả tóc, ghi nhận sự hài lòng của khách hàng\n- Thời gian áp dụng: 9:00am- 21:00pm các ngày trong tuần, trừ ngày lễ\nTóc trên vai, tóc nam không bù. Tóc ngang vai bù 50.000đ, trên dây áo ngực bù 100.000đ và từ dây áo ngực trở xuống bù 150.000đ\n- Áp dụng tất cả các ngày trong tuần từ 9h đến 20h.\n- Khách hàng liên hệ với số điện thoại tại cơ sở mình muốn làm để đặt chỗ trước khi đến.\n- Không dùng chung với khuyến mãi khác.', '0', '10018', '50', null);
INSERT INTO `__campaign` VALUES ('6', null, '3', '500K', null, '6 Tuần Tập TDTT Tại Hệ Thống California Fitness & Yoga Centers\nTăng cường thể lực góp phần mang lại vóc dáng hoàn hảo cho bạn với 6 tuần tập thể dục thể thao tại Hệ thống California Fitness & Yoga toàn quốc.', 'http://beautyguru.speranzainc.net/data/image/camp13.jpg', '2017-10-10 11:06:00', '2017-11-02 20:15:02', '3', '1', '2017-10-13 11:06:00', '2018-03-30 23:00:00', '1', '0', 'http://www.saigonsc.vn/', '0', 'VOUCHER TRỊ GIÁ 6.000.000Đ CHO 6 TUẦN TẬP Thể Dục Thể Hình\nVOUCHER TRỊ GIÁ 7.000.000Đ CHO 6 TUẦN TẬP Thể Dục Thể Hình & Yoga.\nThời gian áp dụng:\nThứ 2 - Thứ 6: 06h - 23h (không áp dụng check in sau 15h).  Thứ 7 - Chủ Nhật: 08h - 22h.\nHạn sử dụng: 14/01/2015 -  08/02/2015.\nLịch nghỉ Tết xem tại đây.\n01 voucher/ 01 người/ 01 lần. 06 tuần học cho các môn thể dục thể thao ', '0', '10018', '50', null);
INSERT INTO `__campaign` VALUES ('7', null, '3', 'Tập thử miễn phí', null, 'Khuyến mãi giảm giá tập Gym, Yoga', 'http://beautyguru.speranzainc.net/data/image/camp12.jpg', '2017-10-10 11:06:00', '2017-10-25 16:54:51', '2', '2', '2017-10-10 11:06:00', '2017-11-25 11:00:00', '0', '0', 'http://www.saigonsc.vn/', '0', 'Nếu bạn đang muốn giảm cân & tăng cường sức khỏe, thì các bài tập  tại đây sẽ giúp bạn làm điều này. Đến với phòng tập của chúng tôi, bạn sẽ được hướng dẫn bới các huấn luyện viên chuyên nghiệp.\n\nở đây có hơn 20 bộ môn dành cho cả nam & nữ để theo học và tập luyện, cùng nhiều trang thiết bị hiện đại.\nNếu bạn muốn tham gia tập thử tại đây, thì bạn có thể đăng ký gói tập thử 1 tháng chỉ với 400.000đ, và được miễn phí 2 buổi tập với Huấn Luyện Viên riêng. Tuy nhiên, nếu bạn tin tưởng vào chất lượng tập ở đây. Bạn hãy đăng ký gói 1 năm luôn ngay vào ngày tư vấn, thì khả năng deal giá tốt sẽ cao nhất. Và nhớ các cách mà mình đã nói ở trên, để deal được giá tập tốt nhất nhé!', '0', '10018', '50', null);
INSERT INTO `__campaign` VALUES ('9', null, '9', 'VÒNG QUAY MAY MẮN FORTUNE', null, 'Khi mua các dịch vụ thuộc bất kỳ Thương hiệu Thể dục Thể hình California Fitness & Yoga, Centuryon, UFC Gym, Yoga Plus, Cali Kids, bạn sẽ được nhận 01 lượt chơi Vòng quay May Mắn.', 'http://beautyguru.speranzainc.net/data/image/camp10.jpg', '2017-10-21 11:43:26', '2017-11-03 11:36:05', '3', '1,2', '2017-10-21 11:42:45', '2017-12-28 11:42:50', '3', '0', 'http://www.cfyc.com.vn/?lang=en', '2', '<div class=\"col-sm-4\" style=\"box-sizing: border-box; position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: left; width: 390px; font-family: roboto, sans-serif; font-size: 14px;\">\n<div class=\"wrap-eli-item\" style=\"box-sizing: border-box;\">\n<div class=\"eli-content\" style=\"box-sizing: border-box;\">\n<h3>MUA CÁC DỊCH VỤ <br />\n<span class=\"red-text\" style=\"color:rgb(195, 26, 31); font-size:26px\">Thể dục thể hình</span></h3>\n\n<p>Tổng giá trị của 01 hợp đồng từ <strong>15.000.000 VNĐ</strong> trở lên trong thời gian khuyến mãi 18.09.2017 – 12.12.2017.</p>\n</div>\n</div>\n</div>\n\n<div class=\"col-sm-4\" style=\"box-sizing: border-box; position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: left; width: 390px; font-family: roboto, sans-serif; font-size: 14px;\">\n<div class=\"wrap-eli-item\" style=\"box-sizing: border-box;\">\n<div class=\"wrap-img text-center\" style=\"box-sizing: border-box; text-align: center;\"><img alt=\"\" class=\"img-responsive\" src=\"https://landing.cfyc.com.vn/themes/landing/assets/landingpages/wof/img/eli-2.png?v=1.2\" style=\"border:0px; box-sizing:border-box; display:inline-block; height:auto; vertical-align:middle\" /></div>\n\n<div class=\"eli-content\" style=\"box-sizing: border-box;\">\n<h3>GÓI TẬP LUYỆN CÁ NHÂN <br />\n<span class=\"red-text\" style=\"color:rgb(195, 26, 31); font-size:26px\">Cùng HLV hoặc Yogi</span></h3>\n\n<p>Sử dụng <strong>12 buổi luyện tập với Huấn luyện viên Cá nhân hoặc Yogi</strong> (trong thời gian khuyến mãi).</p>\n</div>\n</div>\n</div>\n\n<div class=\"col-sm-4\" style=\"box-sizing: border-box; position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: left; width: 390px; font-family: roboto, sans-serif; font-size: 14px;\">\n<div class=\"wrap-eli-item\" style=\"box-sizing: border-box;\">\n<div class=\"wrap-img text-center\" style=\"box-sizing: border-box; text-align: center;\"><img alt=\"\" class=\"img-responsive\" src=\"https://landing.cfyc.com.vn/themes/landing/assets/landingpages/wof/img/eli-3.png?v=1.2\" style=\"border:0px; box-sizing:border-box; display:inline-block; height:auto; vertical-align:middle\" /></div>\n\n<div class=\"eli-content\" style=\"box-sizing: border-box;\">\n<h3>GIỚI THIỆU BẠN BÈ <br />\n<span class=\"red-text\" style=\"color:rgb(195, 26, 31); font-size:26px\">Tham gia</span></h3>\n\n<p>Giới thiệu cho 01 người bạn tham gia Thẻ Hội Viên có <strong>thời hạn từ 01 năm trở lên</strong> trong thời gian khuyến mãi.</p>\n</div>\n</div>\n</div>\n', '2', '10018', '50', null);
INSERT INTO `__campaign` VALUES ('10', null, '9', '20/10', null, 'NÂNG NIU VẺ ĐẸP NGƯỜI PHỤ NỮ VIỆT NAM', 'http://beautyguru.speranzainc.net/data/image/camp1.jpg', '2017-10-21 11:47:22', '2017-10-25 18:17:31', '3', '1', '2017-10-19 11:46:45', '2017-12-30 11:46:46', '5', '0', 'http://www.cfyc.com.vn/?lang=en', '5', '<div class=\"col-md-4\" style=\"box-sizing: border-box; position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: left; width: 390px; font-family: utmavo, sans-serif; font-size: 14px;\">\n<div class=\"intro-item\" style=\"box-sizing: border-box; margin-top: 30px; background-color: rgb(248, 248, 248); border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;\">\n<p>Nuôi dưỡng và tái tạo vẻ đẹp từ bên trong bằng công nghệ đỉnh cao. <strong>Hiệu quả - an toàn – không phẫu thuật</strong>.</p>\n</div>\n</div>\n\n<div class=\"col-md-4\" style=\"box-sizing: border-box; position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: left; width: 390px; font-family: utmavo, sans-serif; font-size: 14px;\">\n<div class=\"intro-item\" style=\"box-sizing: border-box; margin-top: 30px; background-color: rgb(248, 248, 248); border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;\">\n<div class=\"text-center\" style=\"box-sizing: border-box; text-align: center;\"><img alt=\"\" class=\"img-intro img-responsive\" src=\"https://landing.cfyc.com.vn/themes/landing/assets/landingpages/fit-is-beautiful/img/v2/intro-2.png?v=0.4\" style=\"border:0px; box-sizing:border-box; display:block; height:auto; vertical-align:middle\" /></div>\n\n<p>Dr.Eri là bàn tay vàng thẩm mỹ Nhật Bản với <strong>30 năm kinh nghiệm</strong> điều trị 100,000 ca.</p>\n</div>\n</div>\n\n<div class=\"col-md-4\" style=\"box-sizing: border-box; position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: left; width: 390px; font-family: utmavo, sans-serif; font-size: 14px;\">\n<div class=\"intro-item\" style=\"box-sizing: border-box; margin-top: 30px; background-color: rgb(248, 248, 248); border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;\">\n<div class=\"text-center\" style=\"box-sizing: border-box; text-align: center;\"><img alt=\"\" class=\"img-intro img-responsive\" src=\"https://landing.cfyc.com.vn/themes/landing/assets/landingpages/fit-is-beautiful/img/v2/intro-3.png?v=0.4\" style=\"border:0px; box-sizing:border-box; display:block; height:auto; vertical-align:middle\" /></div>\n\n<p>Cảm giác thư giãn tuyệt đối trong <strong>không gian sang trọng, tinh tế</strong> - tận hưởng dịch vụ tiêu chuẩn 5 sao.</p>\n</div>\n</div>\n', '3', '10018', '50', null);
INSERT INTO `__campaign` VALUES ('11', null, '10', 'BODY TRANSFORMATION', null, 'Cuộc thi hình thể', 'http://beautyguru.speranzainc.net/data/image/camp2.jpg', '2017-10-21 11:50:40', '2017-11-03 17:38:51', '3', '1', '2017-10-21 11:49:35', '2017-11-23 11:49:37', '2', '0', 'https://www.facebook.com/39fitness/', '0', 'Xem website thể lệ chi tiết', '4', '10018', '50', null);
INSERT INTO `__campaign` VALUES ('12', null, '11', '3 Tháng', null, 'Gym + Aerobic + Xông Hơi Không Giới Hạn - 39 Fitness', 'http://beautyguru.speranzainc.net/data/image/camp3.jpg', '2017-10-21 11:53:19', '2017-11-03 16:24:44', '3', '2', '2017-10-18 11:52:51', '2017-11-24 11:53:00', '2', '0', 'https://www.facebook.com/39fitness/', '0', '<div><span style=\"font-family:helvetica,arial,sans-serif; font-size:14px\">Tập Luyện Chuyên Nghiệp Để Sở Hữu Vóc Dáng Chuẩn Với Thẻ Tập 3 Tháng Gym + Aerobic + Xông Hơi Không Giới Hạn - 39 Fitness . Voucher 2,260,000 VNĐ, Còn 420,000 VNĐ, Giảm 81%. Chỉ Có Tại Hotdeal.vn!</span></div>\n\n<div>\n<div class=\"product__price product__price--list-price _product_price_old\" style=\"box-sizing: border-box; font-size: 18px; white-space: nowrap; margin-right: 10px; display: inline-block; line-height: 30px; vertical-align: -7px; font-family: Helvetica, Arial, sans-serif;\">Giá gốc:  2,260,000 <span class=\"price__symbol\" style=\"font-size:14.4px\">đ</span></div>\n<span style=\"font-family:helvetica,arial,sans-serif; font-size:14px\"> </span>\n\n<div class=\"product__price _product_price\" style=\"box-sizing: border-box; color: rgb(237, 28, 36); font-size: 36px; font-weight: 700; white-space: nowrap; display: inline-block; line-height: 30px; vertical-align: middle; font-family: Helvetica, Arial, sans-serif;\">420,000<span class=\"price__symbol\" style=\"font-size:28.8px\">đ</span> <span class=\"price__discount\" style=\"color:rgb(255, 255, 255); font-size:16px\">-81 %</span></div>\n</div>\n', '5', '10018', '50', null);
INSERT INTO `__campaign` VALUES ('13', null, '8', 'GIẢM 30% ', null, 'Trong tháng 2 và tháng 3 này, Spa triển khai chương trình ưu đãi đặc biệt với rất nhiều chương trình ưu đãi thiết thực cho chị em phụ nữ chăm sóc sắc đẹp bản thân.', 'http://beautyguru.speranzainc.net/data/image/camp4.jpg', '2017-10-21 11:55:24', '2017-11-03 17:38:56', '3', '1', '2017-10-15 11:53:56', '2017-12-08 11:54:01', '3', '0', '', '0', '<h2 class=\"contentheading \">GIẢM 30% C&Aacute;C DỊCH VỤ NAILS</h2>\n\n<div id=\"zt-wg\" style=\"position: absolute; top: 0px; left: -5000px; color: rgb(89, 89, 89); font-family: Arial; font-size: 14px;\"><a href=\"http://web-creator.org/\" style=\"color: rgb(231, 127, 5); outline: none medium; text-decoration-line: none; transition: color 0.2s ease 0s;\" target=\"_blank\" title=\"модули Joomla 2.5\">модули Joomla 2.5</a><br />\n<a href=\"http://joomla-master.org/kalendari-i-sobitiya.html\" style=\"color: rgb(231, 127, 5); outline: none medium; text-decoration-line: none; transition: color 0.2s ease 0s;\" target=\"_blank\" title=\"календарь для joomla\">календарь для joomla</a></div>\n\n<p><em><strong>HappySpa</strong>&nbsp;</em>l&agrave; trung t&acirc;m Spa l&agrave;m đẹp v&agrave; chăm s&oacute;c cơ thể uy t&iacute;n h&agrave;ng đầu Việt Nam chuy&ecirc;n chăm s&oacute;c da, tư vấn thẩm mỹ, c&aacute;c dịch vụ về nails v&agrave; t&oacute;c n&oacute;i ri&ecirc;ng v&agrave; vấn đề l&agrave;m đẹp to&agrave;n diện n&oacute;i chung sẽ gi&uacute;p chị em phụ nữ n&acirc;ng cao vẻ đẹp v&agrave; duy tr&igrave; n&eacute;t thanh xu&acirc;n vượt thời gian.Tọa lạc tại trung t&acirc;m Tp. Hồ Ch&iacute; Minh,&nbsp;<em><strong>HappySpa</strong>&nbsp;</em>l&agrave; một trong những địa chỉ uy t&iacute;n h&agrave;ng đầu về chăm s&oacute;c da v&agrave; sắc đẹp cho phụ nữ. Với đội ngũ chuy&ecirc;n gia gi&agrave;u kinh nghiệm trong lĩnh vực chăm s&oacute;c sắc đẹp, với sự kết hợp h&agrave;i h&ograve;a khi sử dụng c&aacute;c nh&atilde;n h&agrave;ng mỹ phẩm cao cấp c&ugrave;ng những trang thiết bị c&ocirc;ng nghệ cao đạt ti&ecirc;u chuẩn Ch&acirc;u &Acirc;u, Ch&acirc;u Mỹ,&nbsp;<em><strong>HappySpa</strong>&nbsp;</em>lu&ocirc;n mang lại phương ph&aacute;p l&agrave;m đẹp an to&agrave;n v&agrave; hiệu quả.</p>\n', '6', '10018', '50', null);
INSERT INTO `__campaign` VALUES ('14', null, '7', 'Giảm giá 20%', null, 'Giảm giá 20% dịch vụ làm móng, tặng cốp đồ trị giá 2 TRIỆU cho học viên đăng ký học tới 6/5/2017', 'http://beautyguru.speranzainc.net/data/image/camp5.jpg', '2017-10-21 11:58:32', '2017-11-03 11:36:03', '3', '1', '2017-10-21 11:58:19', '2017-11-15 11:58:23', '0', '0', 'https://www.facebook.com/pages/Quy%C3%AAn-Angel/767079206643145', '0', '<p><strong>NÂNG CẤP SALON GIÁ KHÔNG ĐỔI</strong></p>\n\n<p>Để phục vụ chị em ngày càng tốt hơn, chuyên nghiệp hơn. Năm 2017, Huyền Nail đã tiến hành nâng cấp toàn bộ trang thiết bị và đào tạo nâng cao kỹ năng phục vụ chuyên nghiệp cho đội ngũ nhân viên. Tất cả những cố gắng trên, Huyền Nail làm chỉ với mong muốn duy nhất là được phục vụ khách hàng hoàn thiện, không với mục đích tăng giá cả.</p>\n\n<p><strong>Hot.. Hot.. Hot: TẶNG BẠN ĐIỀU TUYỆT VỜI NHẤT ĐÓN MÙA HÈ 2017</strong></p>\n\n<p><strong>Giảm ngay 20% tất cả dịch vụ làm móng.</strong></p>\n\n<p><strong>Đăng ký học móng tặng ngay cốp đồ 2.000.000₫ cho học viên.</strong></p>\n\n<p>Khuyến mãi áp dụng từ: <strong>16/4 - 6/5/2017</strong>.</p>\n', '7', '10018', '50', null);
INSERT INTO `__campaign` VALUES ('15', null, '7', 'giá sốc', null, 'Khuyến mãi giá sốc cắt – gội – sấy tạo kiểu', 'http://beautyguru.speranzainc.net/data/image/camp6.jpg', '2017-10-21 12:01:19', '2017-10-25 16:56:03', '3', '1', '2017-10-22 11:58:44', '2018-02-03 11:58:45', '1', '0', 'https://www.facebook.com/pages/Quy%C3%AAn-Angel/767079206643145', '0', '<h2 class=\"deal_detail_name_long\" style=\"text-align:justify\">Chương trình khuyến mãi cực kỳ hấp dẫn gói dịch vụ làm tóc bao gồm cắt, gội đầu và sấy tạo kiểu tóc dành cho cả nam và nữ tại Salon Chỉ 15.000đ cho trị giá 300.000đ.</h2>\n\n<div> </div>\n\n<div>\n<ul>\n	<li style=\"text-align:justify\"><strong><span style=\"font-size:small\"><em>Dịch vụ làm tóc trọn gói</em> tại Salon sẽ mang đến cho bạn vẻ đẹp thời trang, tự tin, quyến rũ với mức giá siêu khuyến mãi chỉ 15.000đ.</span></strong></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:small\">Salon với 25 hơn năm hoạt động, là một địa chỉ uy tín trong lĩnh vực làm đẹp và chăm sóc tóc, được nhiều khách hàng tin tưởng lựa chọn.</span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:small\">Đạt nhiều danh hiệu trong các cuộc thi và tham gia nhiều lễ hội tóc, thời trang tóc.</span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:small\">Không gian sang trọng, thoáng mát, trang thiết bị hiện đại sẽ cho bạn cảm giác thoải mái khi sử dụng dịch vụ tại đây.</span></li>\n</ul>\n</div>\n', '8', '10018', '50', null);
INSERT INTO `__campaign` VALUES ('16', null, '11', 'Big sale', null, 'Khuyến mãi khủng', 'http://beautyguru.speranzainc.net/data/image/camp6.jpg', '2017-10-21 12:04:44', '2017-10-30 15:59:22', '3', '1', '2017-10-22 12:03:35', '2017-10-31 12:03:37', '2', '0', 'https://www.facebook.com/39fitness/', '0', '<div>Cơ hội nhận hàng ngàn quà tặng khuyến mãi</div>\n\n<div>Chi tiêt liên hệ 19006543</div>\n', '9', '10018', '50', null);
INSERT INTO `__campaign` VALUES ('17', null, '1', 'Maybelline ', null, 'Kem che khuyết điểm Maybelline New York Fit Me Concealer với công thức không dầu, không hương liệu, độ bám tốt và không gây vết hằn trên da.', 'http://beautyguru.speranzainc.net/data/image/camp7.jpg', '2017-10-21 12:08:49', '2017-11-03 16:24:47', '3', '2', '2017-10-21 12:06:25', '2017-11-30 12:06:27', '2', '0', 'https://www.facebook.com/pages/Temple-Leaf-Spa-Sauna/847583248685100', '0', '<div style=\"margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;\"><strong>THÔNG TIN CHI TIẾT</strong></div>\n\n<p><strong>Loại sản phẩm</strong><br />\nKem che khuyết điểm đa năng với chất kem dạng lỏng mỏng mịn, có độ bám tốt nhưng không dầy cộp, không gây vết hằn trên da.</p>\n\n<p><strong>Loại da phù hợp</strong><br />\nMọi loại da, kể cả làn da dầu hay da có mụn.</p>\n', '10', '10018', '50', null);
INSERT INTO `__campaign` VALUES ('18', null, '12', 'Ngọc nữ tâm kinh', null, 'Ngọc nữ tâm kinh Ngọc nữ tâm kinh Ngọc nữ tâm kinh', 'http://beautyguru.speranzainc.net', '2017-10-23 08:56:33', '2017-10-30 15:11:56', '2', '1,2', '2017-10-23 08:56:12', '2018-01-30 08:56:12', '0', '0', 'https://www.sellmyapp.com/', '0', '<div>Ngọc nữ t&acirc;m kinh</div>\n\n<div>Ngọc nữ t&acirc;m kinh</div>\n\n<div>Ngọc nữ t&acirc;m kinh</div>\n\n<div>Ngọc nữ t&acirc;m kinh</div>\n\n<div>Ngọc nữ t&acirc;m kinhNgọc nữ t&acirc;m kinh</div>\n\n<div>Ngọc nữ t&acirc;m kinhNgọc nữ t&acirc;m kinh</div>\n', '11', '10018', '50', null);
INSERT INTO `__campaign` VALUES ('19', null, '11', 'Test Hiển thị NewData', null, 'Test Hiển thị NewData', 'http://beautyguru.speranzainc.net/data/image/saigon-sports-club-cover.jpg', '2017-10-23 17:01:55', '2017-11-02 20:01:58', '3', '1', '2017-10-23 17:00:50', '2017-12-30 17:00:54', '1', '0', 'https://www.facebook.com/39fitness/', '0', 'Test Hiển thị NewData', '12', '10018', '50', null);

-- ----------------------------
-- Table structure for __campaign_category
-- ----------------------------
DROP TABLE IF EXISTS `__campaign_category`;
CREATE TABLE `__campaign_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __campaign_category
-- ----------------------------
INSERT INTO `__campaign_category` VALUES ('20', '13', '97');
INSERT INTO `__campaign_category` VALUES ('31', '8', '97');
INSERT INTO `__campaign_category` VALUES ('32', '8', '95');
INSERT INTO `__campaign_category` VALUES ('51', '1', '98');
INSERT INTO `__campaign_category` VALUES ('52', '1', '97');
INSERT INTO `__campaign_category` VALUES ('53', '1', '95');
INSERT INTO `__campaign_category` VALUES ('55', '3', '98');
INSERT INTO `__campaign_category` VALUES ('56', '3', '95');
INSERT INTO `__campaign_category` VALUES ('57', '17', '96');
INSERT INTO `__campaign_category` VALUES ('58', '17', '95');
INSERT INTO `__campaign_category` VALUES ('59', '5', '96');
INSERT INTO `__campaign_category` VALUES ('60', '5', '95');
INSERT INTO `__campaign_category` VALUES ('61', '4', '98');
INSERT INTO `__campaign_category` VALUES ('62', '4', '95');
INSERT INTO `__campaign_category` VALUES ('64', '7', '94');
INSERT INTO `__campaign_category` VALUES ('66', '10', '94');
INSERT INTO `__campaign_category` VALUES ('67', '15', '97');
INSERT INTO `__campaign_category` VALUES ('68', '15', '95');
INSERT INTO `__campaign_category` VALUES ('69', '14', '97');
INSERT INTO `__campaign_category` VALUES ('70', '12', '94');
INSERT INTO `__campaign_category` VALUES ('71', '16', '94');
INSERT INTO `__campaign_category` VALUES ('72', '11', '94');
INSERT INTO `__campaign_category` VALUES ('74', '19', '94');
INSERT INTO `__campaign_category` VALUES ('75', '18', '97');
INSERT INTO `__campaign_category` VALUES ('76', '18', '95');
INSERT INTO `__campaign_category` VALUES ('77', '9', '94');
INSERT INTO `__campaign_category` VALUES ('78', '2', '96');
INSERT INTO `__campaign_category` VALUES ('79', '6', '94');

-- ----------------------------
-- Table structure for __campaign_rating
-- ----------------------------
DROP TABLE IF EXISTS `__campaign_rating`;
CREATE TABLE `__campaign_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `rating` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of __campaign_rating
-- ----------------------------
INSERT INTO `__campaign_rating` VALUES ('1', '5', '1', '2017-10-25 14:26:47', '2017-10-25 14:26:47', '0', '4');
INSERT INTO `__campaign_rating` VALUES ('2', '5', '5', '2017-10-25 14:26:47', '2017-10-25 14:26:47', '0', '3');
INSERT INTO `__campaign_rating` VALUES ('5', '10', '4', '2017-10-25 14:26:47', '2017-10-25 14:40:58', '0', '5');
INSERT INTO `__campaign_rating` VALUES ('6', '9', '4', '2017-10-25 14:41:07', '2017-10-25 14:55:23', '0', '2');

-- ----------------------------
-- Table structure for __campaign_shop
-- ----------------------------
DROP TABLE IF EXISTS `__campaign_shop`;
CREATE TABLE `__campaign_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __campaign_shop
-- ----------------------------
INSERT INTO `__campaign_shop` VALUES ('68', '13', '40');
INSERT INTO `__campaign_shop` VALUES ('102', '8', '16');
INSERT INTO `__campaign_shop` VALUES ('132', '1', '1');
INSERT INTO `__campaign_shop` VALUES ('133', '1', '2');
INSERT INTO `__campaign_shop` VALUES ('134', '1', '3');
INSERT INTO `__campaign_shop` VALUES ('135', '1', '4');
INSERT INTO `__campaign_shop` VALUES ('136', '1', '5');
INSERT INTO `__campaign_shop` VALUES ('137', '1', '6');
INSERT INTO `__campaign_shop` VALUES ('142', '3', '3');
INSERT INTO `__campaign_shop` VALUES ('143', '17', '1');
INSERT INTO `__campaign_shop` VALUES ('144', '17', '2');
INSERT INTO `__campaign_shop` VALUES ('145', '17', '3');
INSERT INTO `__campaign_shop` VALUES ('146', '17', '4');
INSERT INTO `__campaign_shop` VALUES ('147', '17', '5');
INSERT INTO `__campaign_shop` VALUES ('148', '17', '6');
INSERT INTO `__campaign_shop` VALUES ('149', '5', '7');
INSERT INTO `__campaign_shop` VALUES ('150', '5', '8');
INSERT INTO `__campaign_shop` VALUES ('151', '5', '9');
INSERT INTO `__campaign_shop` VALUES ('152', '4', '7');
INSERT INTO `__campaign_shop` VALUES ('156', '7', '10');
INSERT INTO `__campaign_shop` VALUES ('157', '7', '11');
INSERT INTO `__campaign_shop` VALUES ('158', '7', '12');
INSERT INTO `__campaign_shop` VALUES ('173', '10', '26');
INSERT INTO `__campaign_shop` VALUES ('174', '10', '27');
INSERT INTO `__campaign_shop` VALUES ('175', '10', '28');
INSERT INTO `__campaign_shop` VALUES ('176', '10', '29');
INSERT INTO `__campaign_shop` VALUES ('177', '10', '30');
INSERT INTO `__campaign_shop` VALUES ('178', '10', '31');
INSERT INTO `__campaign_shop` VALUES ('179', '10', '32');
INSERT INTO `__campaign_shop` VALUES ('180', '10', '33');
INSERT INTO `__campaign_shop` VALUES ('181', '15', '16');
INSERT INTO `__campaign_shop` VALUES ('182', '14', '16');
INSERT INTO `__campaign_shop` VALUES ('183', '12', '21');
INSERT INTO `__campaign_shop` VALUES ('184', '16', '21');
INSERT INTO `__campaign_shop` VALUES ('185', '11', '22');
INSERT INTO `__campaign_shop` VALUES ('186', '11', '23');
INSERT INTO `__campaign_shop` VALUES ('187', '11', '24');
INSERT INTO `__campaign_shop` VALUES ('188', '11', '25');
INSERT INTO `__campaign_shop` VALUES ('190', '19', '21');
INSERT INTO `__campaign_shop` VALUES ('191', '18', '18');
INSERT INTO `__campaign_shop` VALUES ('192', '18', '19');
INSERT INTO `__campaign_shop` VALUES ('193', '18', '20');
INSERT INTO `__campaign_shop` VALUES ('194', '9', '26');
INSERT INTO `__campaign_shop` VALUES ('195', '9', '27');
INSERT INTO `__campaign_shop` VALUES ('196', '9', '28');
INSERT INTO `__campaign_shop` VALUES ('197', '9', '29');
INSERT INTO `__campaign_shop` VALUES ('198', '9', '30');
INSERT INTO `__campaign_shop` VALUES ('199', '9', '31');
INSERT INTO `__campaign_shop` VALUES ('200', '9', '32');
INSERT INTO `__campaign_shop` VALUES ('201', '9', '33');
INSERT INTO `__campaign_shop` VALUES ('202', '9', '34');
INSERT INTO `__campaign_shop` VALUES ('203', '9', '35');
INSERT INTO `__campaign_shop` VALUES ('204', '9', '36');
INSERT INTO `__campaign_shop` VALUES ('205', '9', '37');
INSERT INTO `__campaign_shop` VALUES ('206', '9', '38');
INSERT INTO `__campaign_shop` VALUES ('207', '9', '39');
INSERT INTO `__campaign_shop` VALUES ('208', '2', '1');
INSERT INTO `__campaign_shop` VALUES ('209', '2', '2');
INSERT INTO `__campaign_shop` VALUES ('210', '2', '4');
INSERT INTO `__campaign_shop` VALUES ('211', '2', '5');
INSERT INTO `__campaign_shop` VALUES ('212', '6', '10');
INSERT INTO `__campaign_shop` VALUES ('213', '6', '11');
INSERT INTO `__campaign_shop` VALUES ('214', '6', '12');

-- ----------------------------
-- Table structure for __campaign_status
-- ----------------------------
DROP TABLE IF EXISTS `__campaign_status`;
CREATE TABLE `__campaign_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __campaign_status
-- ----------------------------
INSERT INTO `__campaign_status` VALUES ('1', 'Draft');
INSERT INTO `__campaign_status` VALUES ('2', 'New');
INSERT INTO `__campaign_status` VALUES ('3', 'Active');
INSERT INTO `__campaign_status` VALUES ('4', 'Archived');

-- ----------------------------
-- Table structure for __campaign_wish
-- ----------------------------
DROP TABLE IF EXISTS `__campaign_wish`;
CREATE TABLE `__campaign_wish` (
  `campaign_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `status` varchar(5) DEFAULT 'true',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`campaign_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __campaign_wish
-- ----------------------------
INSERT INTO `__campaign_wish` VALUES ('1', '2', '1', '2017-10-23 23:36:24', null);
INSERT INTO `__campaign_wish` VALUES ('1', '5', '1', '2017-10-24 15:15:44', '2017-10-24 17:13:33');
INSERT INTO `__campaign_wish` VALUES ('1', '15', '0', '2017-10-26 14:23:25', '2017-11-03 16:16:42');
INSERT INTO `__campaign_wish` VALUES ('2', '2', '1', '2017-10-23 23:36:31', null);
INSERT INTO `__campaign_wish` VALUES ('2', '5', '0', '2017-10-24 15:15:40', '2017-11-02 18:17:52');
INSERT INTO `__campaign_wish` VALUES ('2', '15', '0', '2017-10-24 10:50:08', '2017-11-02 20:15:07');
INSERT INTO `__campaign_wish` VALUES ('2', '32', '1', '2017-10-23 14:43:11', '2017-11-02 17:43:45');
INSERT INTO `__campaign_wish` VALUES ('2', '34', '1', '2017-10-24 18:16:05', null);
INSERT INTO `__campaign_wish` VALUES ('3', '2', '1', '2017-09-05 21:06:29', '2017-10-23 23:36:34');
INSERT INTO `__campaign_wish` VALUES ('3', '3', 'true', '2017-09-05 21:06:19', null);
INSERT INTO `__campaign_wish` VALUES ('3', '5', '0', '2017-10-31 17:57:17', '2017-10-31 17:57:19');
INSERT INTO `__campaign_wish` VALUES ('3', '15', '0', '2017-10-31 15:45:17', '2017-11-02 20:00:44');
INSERT INTO `__campaign_wish` VALUES ('4', '2', '1', '2017-10-23 23:36:37', null);
INSERT INTO `__campaign_wish` VALUES ('4', '5', '1', '2017-10-24 15:24:46', '2017-11-02 16:36:46');
INSERT INTO `__campaign_wish` VALUES ('4', '15', '1', '2017-10-24 10:34:00', '2017-11-02 20:24:53');
INSERT INTO `__campaign_wish` VALUES ('4', '34', '0', '2017-10-24 18:15:15', '2017-10-24 18:16:14');
INSERT INTO `__campaign_wish` VALUES ('5', '2', '1', '2017-10-21 11:12:32', '2017-10-23 23:36:39');
INSERT INTO `__campaign_wish` VALUES ('5', '5', '1', '2017-11-01 11:15:16', null);
INSERT INTO `__campaign_wish` VALUES ('5', '15', '0', '2017-10-24 10:34:02', '2017-11-02 19:58:52');
INSERT INTO `__campaign_wish` VALUES ('6', '2', '1', '2017-10-21 11:14:56', '2017-10-23 23:36:52');
INSERT INTO `__campaign_wish` VALUES ('6', '5', '0', '2017-10-31 16:55:59', '2017-11-01 11:05:39');
INSERT INTO `__campaign_wish` VALUES ('6', '15', '0', '2017-11-02 16:24:48', '2017-11-02 20:15:02');
INSERT INTO `__campaign_wish` VALUES ('9', '2', '1', '2017-10-23 23:37:01', null);
INSERT INTO `__campaign_wish` VALUES ('9', '5', '0', '2017-10-23 16:54:29', '2017-11-02 18:27:20');
INSERT INTO `__campaign_wish` VALUES ('9', '15', '0', '2017-10-23 14:15:48', '2017-11-03 11:36:05');
INSERT INTO `__campaign_wish` VALUES ('9', '32', '1', '2017-11-02 10:26:59', null);
INSERT INTO `__campaign_wish` VALUES ('9', '34', '1', '2017-10-24 17:51:53', null);
INSERT INTO `__campaign_wish` VALUES ('10', '2', '1', '2017-10-23 23:37:21', '2017-10-24 19:59:48');
INSERT INTO `__campaign_wish` VALUES ('10', '4', '1', '2017-10-25 14:51:44', '2017-10-25 14:54:57');
INSERT INTO `__campaign_wish` VALUES ('10', '5', '1', '2017-10-24 15:15:42', '2017-10-25 18:17:31');
INSERT INTO `__campaign_wish` VALUES ('10', '15', '1', '2017-10-23 14:18:42', '2017-10-25 10:45:51');
INSERT INTO `__campaign_wish` VALUES ('10', '32', '1', '2017-10-25 09:07:10', null);
INSERT INTO `__campaign_wish` VALUES ('11', '5', '0', '2017-10-23 16:53:56', '2017-11-02 18:27:22');
INSERT INTO `__campaign_wish` VALUES ('11', '15', '1', '2017-10-23 16:07:37', '2017-11-03 14:22:44');
INSERT INTO `__campaign_wish` VALUES ('11', '32', '0', '2017-10-21 23:49:57', '2017-11-03 17:38:51');
INSERT INTO `__campaign_wish` VALUES ('11', '34', '1', '2017-10-24 18:23:57', '2017-10-24 18:24:05');
INSERT INTO `__campaign_wish` VALUES ('12', '5', '1', '2017-10-24 15:54:08', '2017-11-01 11:15:09');
INSERT INTO `__campaign_wish` VALUES ('12', '15', '0', '2017-10-23 14:15:40', '2017-11-03 16:24:44');
INSERT INTO `__campaign_wish` VALUES ('12', '32', '1', '2017-10-22 00:02:47', '2017-11-02 10:27:02');
INSERT INTO `__campaign_wish` VALUES ('13', '5', '1', '2017-10-24 15:24:19', '2017-11-02 18:17:45');
INSERT INTO `__campaign_wish` VALUES ('13', '15', '1', '2017-10-26 17:50:21', '2017-11-03 16:30:27');
INSERT INTO `__campaign_wish` VALUES ('13', '32', '1', '2017-11-03 17:38:48', '2017-11-03 17:38:56');
INSERT INTO `__campaign_wish` VALUES ('14', '15', '0', '2017-11-02 17:52:38', '2017-11-03 11:36:03');
INSERT INTO `__campaign_wish` VALUES ('15', '32', '1', '2017-10-22 00:02:27', null);
INSERT INTO `__campaign_wish` VALUES ('16', '5', '1', '2017-10-24 15:24:32', '2017-10-25 18:39:52');
INSERT INTO `__campaign_wish` VALUES ('16', '15', '0', '2017-10-23 14:29:35', '2017-10-30 15:59:22');
INSERT INTO `__campaign_wish` VALUES ('16', '32', '1', '2017-10-21 23:50:56', '2017-10-21 23:54:51');
INSERT INTO `__campaign_wish` VALUES ('17', '5', '0', '2017-10-24 15:24:25', '2017-10-26 18:12:13');
INSERT INTO `__campaign_wish` VALUES ('17', '15', '1', '2017-10-24 10:50:11', '2017-11-03 16:24:47');
INSERT INTO `__campaign_wish` VALUES ('17', '34', '1', '2017-10-24 17:51:27', null);
INSERT INTO `__campaign_wish` VALUES ('19', '5', '1', '2017-10-24 11:53:06', '2017-11-02 18:27:26');
INSERT INTO `__campaign_wish` VALUES ('19', '15', '0', '2017-10-24 09:56:20', '2017-11-02 20:01:58');

-- ----------------------------
-- Table structure for __category
-- ----------------------------
DROP TABLE IF EXISTS `__category`;
CREATE TABLE `__category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `data` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(5) DEFAULT '0',
  `parent_id` int(11) DEFAULT '0',
  `value` varchar(255) DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __category
-- ----------------------------
INSERT INTO `__category` VALUES ('94', 'Fitness', 'fitness', null, '2017-09-02 22:37:55', '2017-09-15 16:02:05', null, 'true', '0', null, '1', '10001');
INSERT INTO `__category` VALUES ('95', 'Hair Salon', 'hair-salon', null, '2017-09-03 09:45:11', '2017-09-15 16:01:51', null, 'true', '0', null, '2', '10001');
INSERT INTO `__category` VALUES ('96', 'Beauty Salon', 'beauty-salon', null, '2017-09-03 09:45:28', '2017-09-15 16:01:35', null, 'true', '0', null, '3', '10001');
INSERT INTO `__category` VALUES ('97', 'Nail', 'nail', null, '2017-09-03 09:45:43', '2017-09-15 16:01:15', null, 'true', '0', null, '4', '10001');
INSERT INTO `__category` VALUES ('98', 'Spa', 'spa', null, '2017-09-03 09:46:03', '2017-09-15 16:01:02', null, 'true', '0', null, '5', '10001');

-- ----------------------------
-- Table structure for __city
-- ----------------------------
DROP TABLE IF EXISTS `__city`;
CREATE TABLE `__city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` varchar(5) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lon` float DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `sorting` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __city
-- ----------------------------
INSERT INTO `__city` VALUES ('1', '1', 'Hà Nội', 'HNA', '2017-09-02 11:22:42', '2017-09-02 15:37:30', 'true', '10.8232', '106.63', '10001', '2');
INSERT INTO `__city` VALUES ('2', '1', 'TP Ho Chi Minh', 'HCM', '2017-09-02 21:38:41', '2017-09-02 21:39:08', '1', '10.8232', '106.63', '10001', '1');

-- ----------------------------
-- Table structure for __comment
-- ----------------------------
DROP TABLE IF EXISTS `__comment`;
CREATE TABLE `__comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(50) NOT NULL,
  `message` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `type` int(11) NOT NULL,
  `count_like` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of __comment
-- ----------------------------
INSERT INTO `__comment` VALUES ('1', '0', '1', '0', 'Test first comment', 'This is first test comment data', '2017-09-27 00:00:00', '2017-09-27 00:00:00', '1', '1', '0');
INSERT INTO `__comment` VALUES ('2', '6', '5', '0', 'Viet test', 'Body comment', '2017-10-25 14:26:47', '2017-10-25 14:26:47', '0', '0', '0');
INSERT INTO `__comment` VALUES ('3', '6', '5', '0', 'Viet test', 'Body comment', '2017-10-25 14:26:47', '2017-10-25 14:26:47', '0', '0', '0');
INSERT INTO `__comment` VALUES ('4', '6', '5', '0', 'Viet test', 'Body comment', '2017-10-25 14:26:47', '2017-10-25 14:26:47', '0', '0', '0');
INSERT INTO `__comment` VALUES ('5', '6', '5', '0', 'Viet test', 'Body comment', '2017-10-25 14:26:47', '2017-10-25 14:26:47', '0', '0', '0');
INSERT INTO `__comment` VALUES ('6', '6', '5', '4', 'Viet test', 'Body comment', '2017-10-25 14:26:47', '2017-10-25 14:26:47', '0', '0', '0');
INSERT INTO `__comment` VALUES ('7', '6', '5', '4', 'Viet test', 'Body comment', '2017-10-25 14:26:47', '2017-10-25 14:26:47', '0', '0', '0');
INSERT INTO `__comment` VALUES ('12', '5', '32', '0', 'abc', '123', '2017-10-28 12:12:29', '2017-10-28 12:30:43', '1', '1', '0');
INSERT INTO `__comment` VALUES ('13', '5', '32', '12', 'abc', 'reply', '2017-10-28 12:23:35', '2017-10-25 14:26:47', '1', '1', '0');

-- ----------------------------
-- Table structure for __comment_like
-- ----------------------------
DROP TABLE IF EXISTS `__comment_like`;
CREATE TABLE `__comment_like` (
  `id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of __comment_like
-- ----------------------------
INSERT INTO `__comment_like` VALUES ('0', '4', '5', '2017-10-25 14:26:47', '2017-10-25 14:26:47', '0');
INSERT INTO `__comment_like` VALUES ('0', '10', '4', '2017-10-27 22:45:21', '2017-10-25 14:26:47', '1');
INSERT INTO `__comment_like` VALUES ('0', '8', '4', '2017-10-27 22:49:38', '2017-10-25 14:26:47', '1');
INSERT INTO `__comment_like` VALUES ('0', '9', '4', '2017-10-27 22:49:42', '2017-10-25 14:26:47', '1');
INSERT INTO `__comment_like` VALUES ('0', '11', '4', '2017-10-27 22:49:45', '2017-10-25 14:26:47', '1');
INSERT INTO `__comment_like` VALUES ('0', '12', '32', '2017-10-28 12:30:43', '2017-10-25 14:26:47', '0');

-- ----------------------------
-- Table structure for __company
-- ----------------------------
DROP TABLE IF EXISTS `__company`;
CREATE TABLE `__company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `sorting` int(11) DEFAULT '0',
  `logo` varchar(120) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1176 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __company
-- ----------------------------
INSERT INTO `__company` VALUES ('1000', 'Cty CPDVTMTH VINCOMMERCE', 'CÔNG TY CỔ PHẦN DỊCH VỤ THƯƠNG MẠI TỔNG HỢP VINCOMMERCE', '2017-08-25 14:25:25', '2017-09-05 13:10:10', 'true', '1', 'https://www.adayroi.com/build/assets/images/logo-20161115.png', '10018');
INSERT INTO `__company` VALUES ('1001', 'Zenrin ZDC', 'Zenrin', '2017-08-25 14:25:43', '2017-08-25 15:18:09', 'true', '2', '/data/image/slider/slider1.jpg', '10018');
INSERT INTO `__company` VALUES ('1002', 'Guru', '', '2017-08-27 10:48:57', null, 'true', '3', 'https://yt3.ggpht.com/-Fymur8Pg968/AAAAAAAAAAI/AAAAAAAAAAA/Eas7WgEModI/s88-c-k-no-mo-rj-c0xffffff/photo.jpg', '10001');
INSERT INTO `__company` VALUES ('1174', 'SPZ Test', 'tai.nguyen test', '2017-09-23 06:54:57', null, 'true', '6', 'http://beautyguru.speranzainc.net/data/1002/21078599-1561855287168060-7531853224628620472-n.jpg', '10018');

-- ----------------------------
-- Table structure for __countries
-- ----------------------------
DROP TABLE IF EXISTS `__countries`;
CREATE TABLE `__countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(2) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` varchar(5) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `sorting` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=246 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __countries
-- ----------------------------
INSERT INTO `__countries` VALUES ('195', 'SG', 'Singapore', '2017-09-05 14:16:26', '2017-09-14 15:32:30', 'true', null, '0');
INSERT INTO `__countries` VALUES ('229', 'GB', 'United Kingdom', '2017-09-05 14:16:26', '2017-09-14 15:44:12', 'true', null, '0');
INSERT INTO `__countries` VALUES ('230', 'US', 'United States', '2017-09-05 14:16:26', '2017-09-14 15:33:12', 'true', null, '0');
INSERT INTO `__countries` VALUES ('237', 'VN', 'Vietnam', '2017-09-05 14:16:26', '2017-09-14 15:32:02', 'true', null, '0');

-- ----------------------------
-- Table structure for __country
-- ----------------------------
DROP TABLE IF EXISTS `__country`;
CREATE TABLE `__country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` varchar(5) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `sorting` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __country
-- ----------------------------
INSERT INTO `__country` VALUES ('1', 'Việt Nam', 'vi', '2017-09-02 11:38:55', '2017-09-02 11:47:35', 'true', null, '0');

-- ----------------------------
-- Table structure for __device
-- ----------------------------
DROP TABLE IF EXISTS `__device`;
CREATE TABLE `__device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) DEFAULT NULL,
  `device_token` varchar(255) DEFAULT NULL,
  `device_info` text,
  `author` int(11) DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `status` varchar(5) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __device
-- ----------------------------
INSERT INTO `__device` VALUES ('1', '12345', null, null, null, null, null, '2017-09-05 19:54:58', null);
INSERT INTO `__device` VALUES ('2', '123456', null, null, null, null, null, '2017-09-05 20:38:48', null);

-- ----------------------------
-- Table structure for __member
-- ----------------------------
DROP TABLE IF EXISTS `__member`;
CREATE TABLE `__member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT '',
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(180) DEFAULT NULL,
  `sex` int(11) DEFAULT '0',
  `birthday` varchar(50) NOT NULL,
  `province_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` varchar(5) DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `password_tmp` varchar(255) NOT NULL,
  `password_tmp_expired` int(11) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __member
-- ----------------------------
INSERT INTO `__member` VALUES ('1', 'user2', '', 'a906449d5769fa7361d7ecc6aa3f6d28', 'khuongxuantruong@gmail.com', '12345', null, '1', '', '22', '2017-09-05 20:26:45', '2017-10-25 13:04:32', 'true', null, null, '52e88df1fcccd098857866091406eb7b', '1508918672', null);
INSERT INTO `__member` VALUES ('2', 'user3', '', 'a906449d5769fa7361d7ecc6aa3f6d28', 'user3@gmail.com', '12345', null, '0', '', '22', '2017-09-05 21:00:10', null, 'true', null, null, '', '0', null);
INSERT INTO `__member` VALUES ('3', 'user4', '', 'a906449d5769fa7361d7ecc6aa3f6d28', 'user4@gmail.com', '12345', null, '1', '', '22', '2017-09-05 21:00:16', null, 'true', null, null, '', '0', null);
INSERT INTO `__member` VALUES ('4', 'user5', 'Cui bap', 'a906449d5769fa7361d7ecc6aa3f6d28', 'user5@gmail.com', '1111', null, '1', 'now', '10', '2017-09-05 21:00:21', '2017-10-31 16:55:04', 'true', null, null, '', '0', '237');
INSERT INTO `__member` VALUES ('5', 'kien', 'tran trung kien', '5b5f61893a41721b8906582b47f2fb1c', 'userK9@gmail.com', '01697417731', null, '1', '20/11/1991', '50', '2017-09-26 14:35:58', '2017-10-31 17:54:24', 'true', null, null, '8f339d07802607243ca56cb221eb7f44', '1507278260', '237');
INSERT INTO `__member` VALUES ('6', 'huunam1001', '', 'e10adc3949ba59abbe56e057f20f883e', 'abc@abc.com', '0902850001', null, '0', '', '22', '2017-09-28 17:01:55', '2017-10-05 10:42:01', 'true', null, null, 'fef2f1a96bcde0e256ab0bd759a702af', '1507182121', null);
INSERT INTO `__member` VALUES ('7', 'abcd', '', 'e10adc3949ba59abbe56e057f20f883e', 'ccc@ccc.com', '123456', null, '1', '', '22', '2017-09-29 16:08:08', null, 'true', null, null, '', '0', null);
INSERT INTO `__member` VALUES ('8', 'zzzz', '', 'e10adc3949ba59abbe56e057f20f883e', 'ddd@ddd.com', '2222222', null, '0', '', '22', '2017-09-29 16:11:21', null, 'true', null, null, '', '0', null);
INSERT INTO `__member` VALUES ('9', 'z999', '', 'e10adc3949ba59abbe56e057f20f883e', 'uuu@uuu.com', '2222222', null, '1', '', '22', '2017-09-29 16:12:05', null, 'true', null, null, '', '0', null);
INSERT INTO `__member` VALUES ('10', 'kkkkk', '', 'e10adc3949ba59abbe56e057f20f883e', 'kkk@kkk.com', '12345678', null, '0', '', '22', '2017-09-29 16:14:03', null, 'true', null, null, '', '0', null);
INSERT INTO `__member` VALUES ('11', '123456', '', 'e10adc3949ba59abbe56e057f20f883e', 'home@ccc.com', '12345678', null, '1', '', '22', '2017-10-03 13:42:43', null, 'true', null, null, '', '0', null);
INSERT INTO `__member` VALUES ('12', 'uuuuuu', '', '8de1ebe5220196d6acdb486f346fe162', 'u12@ccc.com', '1234567', null, '0', '', '22', '2017-10-03 13:45:18', null, 'true', null, null, '', '0', null);
INSERT INTO `__member` VALUES ('13', 'kkkkkk', '', 'c08ac56ae1145566f2ce54cbbea35fa3', 'k123@kkk.com', '12345678', null, '1', '', '22', '2017-10-03 13:47:40', null, 'true', null, null, '', '0', null);
INSERT INTO `__member` VALUES ('14', 'kien1', '', '5b5f61893a41721b8906582b47f2fb1c', 'userK1@gmail.com', '19001009a', null, '0', '', '22', '2017-10-03 13:57:53', null, 'true', null, null, '', '0', null);
INSERT INTO `__member` VALUES ('15', 'abc123', 'default name', '25f9e794323b453885f5181f1b624d0b', 'abc@ddd.com', '12345678', null, '1', '10/01/1987', '50', '2017-10-03 14:02:07', '2017-11-03 16:41:58', 'true', null, null, '', '0', '237');
INSERT INTO `__member` VALUES ('16', 'kien2', '', '5b5f61893a41721b8906582b47f2fb1c', 'userK2@gmail.com', '19001009', null, '0', '', '22', '2017-10-03 14:09:33', null, 'true', null, null, '', '0', null);
INSERT INTO `__member` VALUES ('17', 'kientran', '', '5b5f61893a41721b8906582b47f2fb1c', 'userK3@gmail.com', '1654651', null, '1', '', '22', '2017-10-03 14:22:27', null, 'true', null, null, '', '0', null);
INSERT INTO `__member` VALUES ('18', 'kien4', '', '5b5f61893a41721b8906582b47f2fb1c', 'userK4@gmail.com', '19001009', null, '0', '', '0', '2017-10-04 16:40:08', null, 'true', null, null, '', '0', null);
INSERT INTO `__member` VALUES ('19', 'kien5', '', '5b5f61893a41721b8906582b47f2fb1c', 'userK5@gmail.com', '19001009', null, '1', '', '0', '2017-10-04 16:41:11', null, 'true', null, null, '', '0', null);
INSERT INTO `__member` VALUES ('20', 'trungkien', '', '5b5f61893a41721b8906582b47f2fb1c', 'trungkienldit@gmail.com', '01697417731', null, '0', '20/11/1991', '0', '2017-10-05 10:36:08', '2017-10-05 14:31:18', 'true', null, null, 'efdbae3ef145571904b6e287403fda49', '1507186387', null);
INSERT INTO `__member` VALUES ('21', 'kien6', '', '5b5f61893a41721b8906582b47f2fb1c', 'userK6@gmail.com', '19001009', null, '1', '20/11/1999', '1', '2017-10-05 11:02:39', '2017-10-06 15:01:24', 'true', null, null, '', '0', null);
INSERT INTO `__member` VALUES ('22', 'aaaa', '', '61d1917a72e3958f1338820a9512c1ee', 'viiet122@fdsfsd.com', null, null, '0', '', '22', '2017-10-06 13:59:34', null, 'true', null, null, '', '0', null);
INSERT INTO `__member` VALUES ('23', 'aaaa1', '', '61d1917a72e3958f1338820a9512c1ee', 'viiet1sss22@fdsfsd.com', null, null, '1', '', '0', '2017-10-06 14:01:30', null, 'true', null, null, '', '0', null);
INSERT INTO `__member` VALUES ('24', 'kien7', '', '5b5f61893a41721b8906582b47f2fb1c', 'userK7@gmail.com', '19001009', null, '0', '', '0', '2017-10-06 14:25:54', null, 'true', null, null, '', '0', null);
INSERT INTO `__member` VALUES ('25', 'kien8', '', '5b5f61893a41721b8906582b47f2fb1c', 'userK8@gmail.com', '19001009', null, '1', '20/11/1992', '50', '2017-10-06 14:40:32', '2017-10-06 14:54:36', 'true', null, null, '', '0', null);
INSERT INTO `__member` VALUES ('26', 'kien9', '', '5b5f61893a41721b8906582b47f2fb1c', 'userK@gmail.com', '19001009', null, '0', '20/11/1991', '0', '2017-10-09 14:50:18', '2017-10-09 14:51:19', 'true', null, null, '', '0', null);
INSERT INTO `__member` VALUES ('27', 'thanhtest', 'thanh Luu', 'ed1c84c72be57733dbee7b8f13bfc6df', 'thanhtest@gmail.com', '0983333009', null, '1', '', '0', '2017-10-13 13:33:24', null, 'true', null, null, '', '0', null);
INSERT INTO `__member` VALUES ('28', 'dddddd', null, 'e10adc3949ba59abbe56e057f20f883e', 'ddd@dec.com', '12345678', null, '0', '', '0', '2017-10-16 11:30:30', null, 'true', null, null, '', '0', null);
INSERT INTO `__member` VALUES ('29', 'huunam101', null, 'e10adc3949ba59abbe56e057f20f883e', 'abcd@abc.com', '12345678', null, '1', '', '0', '2017-10-19 11:48:19', null, 'true', null, null, '', '0', null);
INSERT INTO `__member` VALUES ('32', 'tklong234', 'abc', 'e10adc3949ba59abbe56e057f20f883e', 'tklong@apcs.vn', '19001009', null, '0', '', '50', '2017-10-20 14:33:06', '2017-11-03 17:38:13', 'true', null, null, '', '0', '237');
INSERT INTO `__member` VALUES ('33', 'xxxxxx', null, '25f9e794323b453885f5181f1b624d0b', 'xxx@abc.com', '123456789', null, '1', '', '0', '2017-10-23 15:04:49', null, 'true', null, null, '', '0', null);
INSERT INTO `__member` VALUES ('34', 'thanghong', null, '459fb01a65eb19ccaba4a69846a4f959', 'thang.hong@live.com', '09835352', null, '0', '', '0', '2017-10-24 17:50:56', '2017-11-05 11:43:25', 'true', null, null, '', '0', null);
INSERT INTO `__member` VALUES ('35', 'kiennew', null, '5b5f61893a41721b8906582b47f2fb1c', 'userK9@gmail.com', '19001009', null, '1', '', null, '2017-10-31 15:28:05', null, 'true', null, null, '', '0', null);

-- ----------------------------
-- Table structure for __menu
-- ----------------------------
DROP TABLE IF EXISTS `__menu`;
CREATE TABLE `__menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `data` longtext,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(5) DEFAULT '0',
  `parent_id` int(11) DEFAULT '0',
  `value` varchar(255) DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `privilege` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1018 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __menu
-- ----------------------------
INSERT INTO `__menu` VALUES ('1001', 'Content Provider', 'content-provider', 'a:2:{s:4:\"link\";s:0:\"\";s:4:\"icon\";s:0:\"\";}', '2017-09-04 12:05:55', '2017-09-04 20:26:45', null, 'true', '0', '>1001', '1', '10001', '1,2,1003,1002');
INSERT INTO `__menu` VALUES ('1002', 'Service Operator', 'service-operator', 'a:2:{s:4:\"link\";s:0:\"\";s:4:\"icon\";s:15:\"fa fa-dashboard\";}', '2017-09-04 12:06:20', '2017-09-04 21:20:46', null, 'true', '0', '>1002', '2', '10001', '1,2');
INSERT INTO `__menu` VALUES ('1003', 'Country', 'country', 'a:2:{s:4:\"link\";s:13:\"/dashboard/39\";s:4:\"icon\";s:11:\"fa fa-globe\";}', '2017-09-04 13:49:41', '2017-09-04 19:39:16', null, 'true', '1001', '>1001>1003', '3', '10001', '1,2');
INSERT INTO `__menu` VALUES ('1004', 'Province/City', 'provincecity', 'a:2:{s:4:\"link\";s:13:\"/dashboard/41\";s:4:\"icon\";s:16:\"fa fa-building-o\";}', '2017-09-04 14:04:21', '2017-09-04 19:40:15', null, 'true', '1001', '>1001>1004', '4', '10001', '1,2');
INSERT INTO `__menu` VALUES ('1005', 'Type', 'type', 'a:2:{s:4:\"link\";s:13:\"/dashboard/34\";s:4:\"icon\";s:14:\"fa fa-list-alt\";}', '2017-09-04 14:05:12', '2017-09-04 19:45:07', null, 'true', '1001', '>1001>1005', '5', '10001', '1,2');
INSERT INTO `__menu` VALUES ('1006', 'Category', 'category', 'a:2:{s:4:\"link\";s:13:\"/dashboard/26\";s:4:\"icon\";s:13:\"fa fa-list-ul\";}', '2017-09-04 14:06:27', '2017-09-04 19:44:15', null, 'true', '1001', '>1001>1006', '6', '10001', '1,2');
INSERT INTO `__menu` VALUES ('1007', 'Company', 'company', 'a:2:{s:4:\"link\";s:13:\"/dashboard/36\";s:4:\"icon\";s:20:\"fa fa-address-card-o\";}', '2017-09-04 14:07:08', '2017-09-04 21:21:16', null, 'true', '1002', '>1002>1007', '7', '10001', '1');
INSERT INTO `__menu` VALUES ('1008', 'Trademark', 'trademark', 'a:2:{s:4:\"link\";s:13:\"/dashboard/42\";s:4:\"icon\";s:20:\"fa fa-address-book-o\";}', '2017-09-04 14:07:35', '2017-09-04 19:38:36', null, 'true', '1010', '>1010>1008', '8', '10001', '1,2,1003,1002');
INSERT INTO `__menu` VALUES ('1009', 'Campaign', 'campaign', 'a:2:{s:4:\"link\";s:13:\"/dashboard/44\";s:4:\"icon\";s:17:\"fa fa-newspaper-o\";}', '2017-09-04 14:07:58', '2017-09-04 19:37:55', null, 'true', '1010', '>1010>1009', '9', '10001', '1,2,1003,1002');
INSERT INTO `__menu` VALUES ('1010', 'Content Management', 'content-management', 'a:2:{s:4:\"link\";s:0:\"\";s:4:\"icon\";s:10:\"fa fa-book\";}', '2017-09-04 14:30:04', '2017-09-04 19:57:54', null, 'true', '0', '>1010', '10', '10001', '1,2,1003,1002');
INSERT INTO `__menu` VALUES ('1011', 'Module', 'module', 'a:2:{s:4:\"link\";s:23:\"/dashboard/module/view/\";s:4:\"icon\";s:11:\"fa fa-cubes\";}', '2017-09-04 14:32:31', '2017-10-12 12:03:36', null, 'true', '1016', '>1016>1011', '11', '10001', '1');
INSERT INTO `__menu` VALUES ('1012', 'CMS Menu', 'cms-menu', 'a:2:{s:4:\"link\";s:13:\"/dashboard/45\";s:4:\"icon\";s:10:\"fa fa-bars\";}', '2017-09-04 14:32:58', '2017-09-05 11:38:24', null, 'true', '1016', '>1016>1012', '12', '10001', '999');
INSERT INTO `__menu` VALUES ('1013', 'Application', 'application', 'a:2:{s:4:\"link\";s:0:\"\";s:4:\"icon\";s:13:\"fa fa-desktop\";}', '2017-09-04 14:34:03', '2017-09-04 21:12:44', null, 'true', '0', '>1013', '13', '10001', '1,2,1003,1002');
INSERT INTO `__menu` VALUES ('1014', 'User Management', 'user-management', 'a:2:{s:4:\"link\";s:15:\"/dashboard/user\";s:4:\"icon\";s:11:\"fa fa-users\";}', '2017-09-04 16:08:07', '2017-09-04 19:33:21', null, 'true', '1002', '>1002>1014', '14', '10001', '1,2');
INSERT INTO `__menu` VALUES ('1015', 'Shop', 'shop', 'a:2:{s:4:\"link\";s:13:\"/dashboard/43\";s:4:\"icon\";s:18:\"fa fa-shopping-bag\";}', '2017-09-04 19:41:40', '2017-09-04 19:42:01', null, 'true', '1010', '>1010>1015', '15', '10001', '1,2,1003,1002');
INSERT INTO `__menu` VALUES ('1016', 'AdminSuperviser', 'adminsuperviser', 'a:2:{s:4:\"link\";s:0:\"\";s:4:\"icon\";s:10:\"fa fa-cogs\";}', '2017-09-04 19:47:35', '2017-10-12 12:03:23', null, 'true', '0', '>1016', '16', '10001', '1');
INSERT INTO `__menu` VALUES ('1017', 'KCFinder', 'kcfinder', 'a:2:{s:4:\"link\";s:19:\"/dashboard/kcfinder\";s:4:\"icon\";s:11:\"fa fa-image\";}', '2017-09-04 20:58:37', '2017-09-04 21:05:41', null, 'true', '1013', '>1013>1017', '17', '10001', '1,2,1003,1002');

-- ----------------------------
-- Table structure for __privilege
-- ----------------------------
DROP TABLE IF EXISTS `__privilege`;
CREATE TABLE `__privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `sorting` int(11) DEFAULT '0',
  `author` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __privilege
-- ----------------------------
INSERT INTO `__privilege` VALUES ('1002', 'Content Provider', null, '2017-08-31 11:29:58', null, 'true', '3', '10001');
INSERT INTO `__privilege` VALUES ('1003', 'Service Operation', null, '2017-08-31 11:30:09', null, 'true', '4', '10001');

-- ----------------------------
-- Table structure for __province
-- ----------------------------
DROP TABLE IF EXISTS `__province`;
CREATE TABLE `__province` (
  `code` varchar(5) NOT NULL,
  `title` varchar(100) NOT NULL,
  `type` varchar(30) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `status` varchar(5) DEFAULT NULL,
  `sorting` int(11) DEFAULT '0',
  `alias` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __province
-- ----------------------------
INSERT INTO `__province` VALUES ('01', 'Hà Nội', 'Thành Phố', '1', '2017-09-05 14:16:55', null, '237', null, 'true', '1', 'ha-noi');
INSERT INTO `__province` VALUES ('02', 'Hà Giang', 'Tỉnh', '2', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'ha-giang');
INSERT INTO `__province` VALUES ('04', 'Cao Bằng', 'Tỉnh', '3', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'cao-bang');
INSERT INTO `__province` VALUES ('06', 'Bắc Kạn', 'Tỉnh', '4', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'bac-kan');
INSERT INTO `__province` VALUES ('08', 'Tuyên Quang', 'Tỉnh', '5', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'tuyen-quang');
INSERT INTO `__province` VALUES ('10', 'Lào Cai', 'Tỉnh', '6', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'lao-cai');
INSERT INTO `__province` VALUES ('11', 'Điện Biên', 'Tỉnh', '7', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'dien-bien');
INSERT INTO `__province` VALUES ('12', 'Lai Châu', 'Tỉnh', '8', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'lai-chau');
INSERT INTO `__province` VALUES ('14', 'Sơn La', 'Tỉnh', '9', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'son-la');
INSERT INTO `__province` VALUES ('15', 'Yên Bái', 'Tỉnh', '10', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'yen-bai');
INSERT INTO `__province` VALUES ('17', 'Hòa Bình', 'Tỉnh', '11', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'hoa-binh');
INSERT INTO `__province` VALUES ('19', 'Thái Nguyên', 'Tỉnh', '12', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'thai-nguyen');
INSERT INTO `__province` VALUES ('20', 'Lạng Sơn', 'Tỉnh', '13', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'lang-son');
INSERT INTO `__province` VALUES ('22', 'Quảng Ninh', 'Tỉnh', '14', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'quang-ninh');
INSERT INTO `__province` VALUES ('24', 'Bắc Giang', 'Tỉnh', '15', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'bac-giang');
INSERT INTO `__province` VALUES ('25', 'Phú Thọ', 'Tỉnh', '16', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'phu-tho');
INSERT INTO `__province` VALUES ('26', 'Vĩnh Phúc', 'Tỉnh', '17', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'vinh-phuc');
INSERT INTO `__province` VALUES ('27', 'Bắc Ninh', 'Tỉnh', '18', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'bac-ninh');
INSERT INTO `__province` VALUES ('30', 'Hải Dương', 'Tỉnh', '19', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'hai-duong');
INSERT INTO `__province` VALUES ('31', 'Hải Phòng', 'Thành Phố', '20', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'hai-phong');
INSERT INTO `__province` VALUES ('33', 'Hưng Yên', 'Tỉnh', '21', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'hung-yen');
INSERT INTO `__province` VALUES ('34', 'Thái Bình', 'Tỉnh', '22', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'thai-binh');
INSERT INTO `__province` VALUES ('35', 'Hà Nam', 'Tỉnh', '23', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'ha-nam');
INSERT INTO `__province` VALUES ('36', 'Nam Định', 'Tỉnh', '24', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'nam-dinh');
INSERT INTO `__province` VALUES ('37', 'Ninh Bình', 'Tỉnh', '25', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'ninh-binh');
INSERT INTO `__province` VALUES ('38', 'Thanh Hóa', 'Tỉnh', '26', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'thanh-hoa');
INSERT INTO `__province` VALUES ('40', 'Nghệ An', 'Tỉnh', '27', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'nghe-an');
INSERT INTO `__province` VALUES ('42', 'Hà Tĩnh', 'Tỉnh', '28', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'ha-tinh');
INSERT INTO `__province` VALUES ('44', 'Quảng Bình', 'Tỉnh', '29', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'quang-binh');
INSERT INTO `__province` VALUES ('45', 'Quảng Trị', 'Tỉnh', '30', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'quang-tri');
INSERT INTO `__province` VALUES ('46', 'Thừa Thiên Huế', 'Tỉnh', '31', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'thua-thien-hue');
INSERT INTO `__province` VALUES ('48', 'Đà Nẵng', 'Thành Phố', '32', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'da-nang');
INSERT INTO `__province` VALUES ('49', 'Quảng Nam', 'Tỉnh', '33', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'quang-nam');
INSERT INTO `__province` VALUES ('51', 'Quảng Ngãi', 'Tỉnh', '34', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'quang-ngai');
INSERT INTO `__province` VALUES ('52', 'Bình Định', 'Tỉnh', '35', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'binh-dinh');
INSERT INTO `__province` VALUES ('54', 'Phú Yên', 'Tỉnh', '36', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'phu-yen');
INSERT INTO `__province` VALUES ('56', 'Khánh Hòa', 'Tỉnh', '37', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'khanh-hoa');
INSERT INTO `__province` VALUES ('58', 'Ninh Thuận', 'Tỉnh', '38', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'ninh-thuan');
INSERT INTO `__province` VALUES ('60', 'Bình Thuận', 'Tỉnh', '39', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'binh-thuan');
INSERT INTO `__province` VALUES ('62', 'Kon Tum', 'Tỉnh', '40', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'kon-tum');
INSERT INTO `__province` VALUES ('64', 'Gia Lai', 'Tỉnh', '41', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'gia-lai');
INSERT INTO `__province` VALUES ('66', 'Đắk Lắk', 'Tỉnh', '42', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'dak-lak');
INSERT INTO `__province` VALUES ('67', 'Đắk Nông', 'Tỉnh', '43', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'dak-nong');
INSERT INTO `__province` VALUES ('68', 'Lâm Đồng', 'Tỉnh', '44', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'lam-dong');
INSERT INTO `__province` VALUES ('70', 'Bình Phước', 'Tỉnh', '45', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'binh-phuoc');
INSERT INTO `__province` VALUES ('72', 'Tây Ninh', 'Tỉnh', '46', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'tay-ninh');
INSERT INTO `__province` VALUES ('74', 'Bình Dương', 'Tỉnh', '47', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'binh-duong');
INSERT INTO `__province` VALUES ('75', 'Đồng Nai', 'Tỉnh', '48', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'dong-nai');
INSERT INTO `__province` VALUES ('77', 'Bà Rịa - Vũng Tàu', 'Tỉnh', '49', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'ba-ria-vung-tau');
INSERT INTO `__province` VALUES ('79', 'Hồ Chí Minh', 'Thành Phố', '50', '2017-09-05 14:16:55', null, '237', null, 'true', '2', 'ho-chi-minh');
INSERT INTO `__province` VALUES ('80', 'Long An', 'Tỉnh', '51', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'long-an');
INSERT INTO `__province` VALUES ('82', 'Tiền Giang', 'Tỉnh', '52', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'tien-giang');
INSERT INTO `__province` VALUES ('83', 'Bến Tre', 'Tỉnh', '53', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'ben-tre');
INSERT INTO `__province` VALUES ('84', 'Trà Vinh', 'Tỉnh', '54', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'tra-vinh');
INSERT INTO `__province` VALUES ('86', 'Vĩnh Long', 'Tỉnh', '55', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'vinh-long');
INSERT INTO `__province` VALUES ('87', 'Đồng Tháp', 'Tỉnh', '56', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'dong-thap');
INSERT INTO `__province` VALUES ('89', 'An Giang', 'Tỉnh', '57', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'an-giang');
INSERT INTO `__province` VALUES ('91', 'Kiên Giang', 'Tỉnh', '58', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'kien-giang');
INSERT INTO `__province` VALUES ('92', 'Cần Thơ', 'Thành Phố', '59', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'can-tho');
INSERT INTO `__province` VALUES ('93', 'Hậu Giang', 'Tỉnh', '60', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'hau-giang');
INSERT INTO `__province` VALUES ('94', 'Sóc Trăng', 'Tỉnh', '61', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'soc-trang');
INSERT INTO `__province` VALUES ('95', 'Bạc Liêu', 'Tỉnh', '62', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'bac-lieu');
INSERT INTO `__province` VALUES ('96', 'Cà Mau', 'Tỉnh', '63', '2017-09-05 14:16:55', null, '237', null, 'true', '0', 'ca-mau');
INSERT INTO `__province` VALUES ('97', 'Bukit Timah', '', '64', '2017-09-05 14:16:55', null, '195', null, 'true', '0', 'Bukit');

-- ----------------------------
-- Table structure for __region
-- ----------------------------
DROP TABLE IF EXISTS `__region`;
CREATE TABLE `__region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT '0',
  `country_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` varchar(5) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `_name` (`title`,`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __region
-- ----------------------------
INSERT INTO `__region` VALUES ('1', 'TP Hồ Chí Minh', '0', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('2', 'Q.Tân Bình', '1', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('3', 'Hà Nội', '0', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('4', 'Đà Nẵng', '0', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('5', 'Đồng Nai', '0', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('26', 'Q.1', '1', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('27', 'Q.3', '1', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('29', 'Q. 2', '1', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('30', 'Q. Ba Đình', '3', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('31', 'Q.Hai Bà Trưng', '3', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('32', 'Q. Đống Đa', '3', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('33', 'Q. Gò Vấp', '1', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('34', 'P. 1', '2', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('35', 'P. 2', '2', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('36', 'P. 3', '2', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('37', 'P.Tân Định', '26', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('38', 'P. 3', '27', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('39', 'P.Thủ Thiêm', '29', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('41', 'P.Dakao', '26', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('42', 'P. 5', '27', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('43', 'P.An Lợi Đông', '29', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('45', 'P. Hàng Xanh', '30', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('46', 'P. 4', '30', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('47', 'P. 4', '31', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('48', 'P. 1', '31', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('52', 'Q.4', '1', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('53', 'Q.5', '1', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('54', 'Q.6', '1', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('55', 'Q.7', '1', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('56', 'Q.8', '1', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('57', 'Q.9', '1', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('58', 'Q.10', '1', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('59', 'Q.11', '1', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('60', 'Q.12', '1', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('61', 'P.Bến Nghé', '26', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('62', 'P.Bến Thành', '26', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('63', 'P.Cầu Ông Lãnh', '26', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('64', 'P.Nguyễn Cư Trinh', '26', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('65', 'P.Nguyễn Thái Bình', '26', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('66', 'P.Phạm Ngũ Lão', '26', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('67', 'P.Cầu Kho', '26', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('68', 'P.Cô Giang', '26', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('69', 'Phường Khác', '26', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('71', 'P.Bình Trưng Tây', '29', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('72', 'P.Bình Trưng Đông', '29', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('73', 'P.Bình An', '29', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('74', 'P.Bình Khánh', '29', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('75', 'P.An Phú', '29', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('76', 'P.Thảo Điền', '29', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('77', 'P.Thạch Mỹ Lợi', '29', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('78', 'P.Cát Lái', '29', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('79', 'P.An Khánh', '29', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('80', 'Phường Khác', '29', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('81', 'P.1', '33', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('82', 'P.2', '33', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('83', 'P.3', '33', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('84', 'P.4', '33', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('85', 'P.5', '33', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('86', 'P.6', '33', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('87', 'P.7', '33', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('88', 'P.8', '33', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('89', 'P.9', '33', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('90', 'P.10', '33', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('91', 'P.11', '33', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('92', 'P.12', '33', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('93', 'P.13', '33', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('94', 'P.14', '33', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('95', 'P.15', '33', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('96', 'P.16', '33', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('97', 'P.17', '33', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('98', 'Phường Khác', '33', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('99', 'P.1', '52', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('100', 'P.2', '52', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('101', 'P.3', '52', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('102', 'P.4', '52', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('103', 'P.5', '52', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('104', 'P.6', '52', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('105', 'P.7', '52', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('106', 'P.8', '52', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('107', 'P.9', '52', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('108', 'P.10', '52', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('109', 'P.11', '52', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('110', 'P.12', '52', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('111', 'P.13', '52', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('112', 'P.14', '52', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('113', 'P.15', '52', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('114', 'P.16', '52', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('115', 'P.17', '52', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('116', 'P.18', '52', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('117', 'Phường Khác', '52', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('118', 'P.1', '53', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('119', 'P.2', '53', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('120', 'P.3', '53', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('121', 'P.4', '53', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('122', 'P.5', '53', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('123', 'P.6', '53', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('124', 'P.7', '53', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('125', 'P.8', '53', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('126', 'P.9', '53', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('127', 'P.10', '53', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('128', 'P.11', '53', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('129', 'P.12', '53', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('130', 'P.13', '53', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('131', 'P.14', '53', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('132', 'P.15', '53', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('133', 'Phường Khác', '53', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('134', 'P.1', '54', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('135', 'P.2', '54', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('136', 'P.3', '54', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('137', 'P.4', '54', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('138', 'P.5', '54', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('139', 'P.6', '54', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('140', 'P.7', '54', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('141', 'P.8', '54', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('142', 'P.9', '54', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('143', 'P.10', '54', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('144', 'P.11', '54', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('145', 'P.12', '54', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('146', 'P.13', '54', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('147', 'P.14', '54', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('148', 'Phường Khác', '54', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('149', 'P.Tân Thuận Đông', '55', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('150', 'P.Tân Thuận Tây', '55', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('151', 'P.Tân Kiểng', '55', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('152', 'P.Tân Qui', '55', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('153', 'P.Tân Hưng', '55', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('154', 'P.Tân Phong', '55', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('155', 'P.Tân Phú', '55', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('156', 'P.Bình Thuận', '55', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('157', 'P.Phú Thuận', '55', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('158', 'P.Phú Mỹ', '55', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('159', 'Phường Khác', '55', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('160', 'P.1', '56', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('161', 'P.2', '56', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('162', 'P.3', '56', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('163', 'P.4', '56', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('164', 'P.5', '56', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('165', 'P.6', '56', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('166', 'P.7', '56', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('167', 'P.8', '56', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('168', 'P.9', '56', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('169', 'P.10', '56', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('170', 'P.11', '56', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('171', 'P.12', '56', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('172', 'P.13', '56', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('173', 'P.14', '56', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('174', 'P.15', '56', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('175', 'P.16', '56', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('176', 'Phường Khác', '56', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('177', 'P.1', '58', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('178', 'P.2', '58', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('179', 'P.3', '58', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('180', 'P.4', '58', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('181', 'P.5', '58', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('182', 'P.6', '58', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('183', 'P.7', '58', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('184', 'P.8', '58', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('185', 'P.9', '58', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('186', 'P.10', '58', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('187', 'P.11', '58', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('188', 'P.12', '58', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('189', 'P.13', '58', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('190', 'P.14', '58', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('191', 'P.15', '58', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('192', 'Phường Khác', '58', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('193', 'P.1', '59', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('194', 'P.2', '59', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('195', 'P.3', '59', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('196', 'P.4', '59', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('197', 'P.5', '59', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('198', 'P.6', '59', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('199', 'P.7', '59', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('200', 'P.8', '59', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('201', 'P.9', '59', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('202', 'P.10', '59', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('203', 'P.11', '59', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('204', 'P.12', '59', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('205', 'P.13', '59', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('206', 'P.14', '59', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('207', 'P.15', '59', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('208', 'P.16', '59', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('209', 'Q.Tân Phú', '1', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('210', 'P.Hiệp Tân', '209', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('211', 'P.Hòa Thạnh', '209', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('212', 'P.Phú Thạnh', '209', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('213', 'P.Phú Thọ Hòa', '209', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('214', 'P.Phú Trung', '209', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('215', 'P.Sơn Kỳ', '209', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('216', 'P.Tân Quý', '209', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('217', 'P.Tân Sơn Nhì', '209', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('218', 'P.Tân Thành', '209', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('219', 'P.Tây Thạnh', '209', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('220', 'P.Tân Thới Hòa', '209', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('221', 'Phường Khác', '209', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('222', 'Q.Bình Thạnh', '1', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('223', 'P.1', '222', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('224', 'P.2', '222', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('225', 'P.3', '222', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('226', 'P.4', '222', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('227', 'P.5', '222', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('228', 'P.6', '222', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('229', 'P.7', '222', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('230', 'P.8', '222', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('231', 'P.9', '222', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('232', 'P.10', '222', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('233', 'P.11', '222', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('234', 'P.12', '222', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('235', 'P.13', '222', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('236', 'P.14', '222', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('237', 'P.15', '222', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('238', 'Phường Khác', '222', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('239', 'Q.Phú Nhuận', '1', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('240', 'P.1', '239', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('241', 'P.2', '239', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('242', 'P.3', '239', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('243', 'Phường Khác', '239', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('244', 'P.9', '27', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('245', 'P.10', '27', '1', null, null, 'true', null, null);
INSERT INTO `__region` VALUES ('246', 'Phường khác', '27', '1', null, null, 'true', null, null);

-- ----------------------------
-- Table structure for __shop
-- ----------------------------
DROP TABLE IF EXISTS `__shop`;
CREATE TABLE `__shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) DEFAULT NULL,
  `trademark_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` varchar(5) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lon` float DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `sorting` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __shop
-- ----------------------------
INSERT INTO `__shop` VALUES ('1', '50', '1', 'Temple Leaf Spa HCM', '74/1 Haibatrung.Dist.1, Ho Chi Minh City 70000, Vietnam', '2017-10-10 11:06:00', '2017-10-10 11:06:00', 'true', '10.7781', '106.704', null, '0');
INSERT INTO `__shop` VALUES ('2', '50', '1', 'Temple Leaf Spa District 1', '32 Thái Văn Lung Quận 1', '2017-10-10 11:06:00', '2017-10-10 11:06:00', 'true', '10.7803', '106.704', null, '0');
INSERT INTO `__shop` VALUES ('3', '1', '1', 'Temple Leaf Spa Ha Noi', 'Ho Hoan Kiem', '2017-10-10 11:06:00', '2017-10-10 11:06:00', 'true', '21.0223', '105.829', null, '0');
INSERT INTO `__shop` VALUES ('4', '50', '1', 'Shop near SPZ', 'Somewhere near SPZ company', '2017-10-10 11:06:00', '2017-10-10 11:06:00', 'true', '10.7922', '106.678', null, '0');
INSERT INTO `__shop` VALUES ('5', '50', '1', 'Test shop location at SPZ', 'The Prince-residence Novaland', '2017-10-10 11:06:00', '2017-10-10 11:06:00', 'true', '10.7921', '106.681', null, '0');
INSERT INTO `__shop` VALUES ('6', '51', '1', 'Shop Long An', 'Thi xa Kien Tuong Quoc Lo 62', '2017-10-10 11:06:00', '2017-10-10 11:06:00', 'true', '10.7148', '105.989', null, '0');
INSERT INTO `__shop` VALUES ('7', '50', '2', 'Heritage Spa Saigon', '69 Hai Bà Trưng, Quận 1, TP.HCM', '2017-10-10 11:06:00', '2017-10-10 11:06:00', 'true', '10.7768', '106.704', null, '0');
INSERT INTO `__shop` VALUES ('8', '50', '2', 'Heritage Spa CLB Lan Anh', '285 CMT8', '2017-10-10 11:06:00', '2017-10-10 11:06:00', 'true', '10.7793', '106.679', null, '0');
INSERT INTO `__shop` VALUES ('9', '50', '2', 'Heritage Spa Chua Vinh Nghiem', '339 Nam Kỳ Khởi Nghĩa, thuộc phường 7, quận 3, Thành phố Hồ Chí Minh, Việt Nam', '2017-10-10 11:06:00', '2017-10-10 11:06:00', 'true', '10.7905', '106.682', null, '0');
INSERT INTO `__shop` VALUES ('10', '50', '3', 'Headquarters', '514B Huỳnh Tấn Phát, Bình Thuận Ward, Dist.7, HCMC', '2017-10-10 11:06:00', '2017-10-10 11:06:00', 'true', '10.7395', '106.729', null, '0');
INSERT INTO `__shop` VALUES ('11', '50', '3', 'Club District 11', 'Dam Sen', '2017-10-10 11:06:00', '2017-10-10 11:06:00', 'true', '10.7659', '106.64', null, '0');
INSERT INTO `__shop` VALUES ('12', '1', '3', 'Shop in Hanoi', 'Cau Long Bien', '2017-10-10 11:06:00', '2017-10-10 11:06:00', 'true', '21.044', '105.86', null, '0');
INSERT INTO `__shop` VALUES ('13', '64', '4', 'IKEDA SPA PRESTIGE', '6 Eu Tong Sen Street, Clarke Quay Central #05-22 (Level 5 Carpark) Singapore 059817-10 11:06:00', '2017-10-10 11:06:00', '2017-10-10 11:06:00', 'true', '1.28943', '103.847', null, '0');
INSERT INTO `__shop` VALUES ('14', '64', '4', 'IKEDA Secondary', '787 Bukit Timah Rd, Xinh-ga-po 269762', '2017-10-10 11:06:00', '2017-10-10 11:06:00', 'true', '1.33105', '103.796', null, '0');
INSERT INTO `__shop` VALUES ('15', '64', '5', 'NatureLand Spa', '57 Cuppage Rd, Xinh-ga-po 229468', '2017-10-10 11:06:00', '2017-10-10 11:06:00', 'true', '1.30191', '103.841', null, '0');
INSERT INTO `__shop` VALUES ('16', '1', '7', 'Outlet Hanoi', '891 Cách Mạng Tháng Tám, P.7, Hanoi', '2017-10-19 11:28:52', null, 'true', '10.6748', '106.348', '10018', '1');
INSERT INTO `__shop` VALUES ('17', '1', '6', 'Shop 001', 'Address 001', '2017-10-19 16:21:32', null, 'true', '10.7596', '106.423', '10131', '2');
INSERT INTO `__shop` VALUES ('18', '50', '12', 'Chi nhánh 1', 'Số 61 Hoàng Hoa Thám - P. 13 - Q. Tân Bình - Tp. HCM   ', '2017-10-21 11:17:35', null, 'true', '10.8202', '106.624', '10018', '3');
INSERT INTO `__shop` VALUES ('19', '50', '12', 'Chi nhánh 2', 'Số 255 Phan Xích Long - P. 07 - Q. Phú Nhuận - Tp. HCM', '2017-10-21 11:18:19', null, 'true', '10.8031', '106.674', '10018', '4');
INSERT INTO `__shop` VALUES ('20', '50', '12', 'Hair & Spa GlamourZ', 'Số 181 Đinh Tiên Hoàng - P. Đa Kao - Q. 1 - Tp. HCM', '2017-10-21 11:19:29', null, 'true', '10.7879', '106.7', '10018', '5');
INSERT INTO `__shop` VALUES ('21', '50', '11', 'trụ sở', 'phường 11, Quận 6, Hồ Chí Minh', '2017-10-21 11:20:23', null, 'true', '10.7484', '106.634', '10018', '6');
INSERT INTO `__shop` VALUES ('22', '50', '10', 'TÂN BÌNH - PHẠM VĂN HAI', 'Lầu K, Central Plaza, 91 Phạm Văn Hai, P.3, Q.Tân Bình (028) 7307 2424', '2017-10-21 11:22:03', null, 'true', '10.7936', '106.663', '10018', '7');
INSERT INTO `__shop` VALUES ('23', '50', '10', 'QUẬN 3 - HỒ XUÂN HƯƠNG', '02 Hồ Xuân Hương, P.6, Q.3, TPHCM', '2017-10-21 11:24:33', null, 'true', '10.7783', '106.689', '10018', '8');
INSERT INTO `__shop` VALUES ('24', '50', '10', 'QUẬN 3 - HOÀNG SA', '621 Hoàng Sa, P.7, Q.3, TPHCM', '2017-10-21 11:25:38', null, 'true', '10.7879', '106.684', '10018', '9');
INSERT INTO `__shop` VALUES ('25', '50', '10', 'QUẬN 7 - THIÊN SƠN PLAZA', 'Tầng 2 Thiên Sơn Plaza - 800 Nguyễn Văn Linh, P. Tân Phú, Q.7, TPHCM', '2017-10-21 11:26:41', null, 'true', '10.7252', '106.686', '10018', '10');
INSERT INTO `__shop` VALUES ('26', '50', '9', 'QUẬN TÂN BÌNH', 'Pico Plaza, 20 Cộng Hoà, P.12, Quận Tân Bình', '2017-10-21 11:28:30', null, 'true', '10.8006', '106.653', '10018', '11');
INSERT INTO `__shop` VALUES ('27', '50', '9', 'QUẬN 3', '62A Cách Mạng Tháng 8, Phường 6, Quận 3, TP. HCM', '2017-10-21 11:29:29', null, 'true', '10.7781', '106.68', '10018', '12');
INSERT INTO `__shop` VALUES ('28', '50', '9', 'QUẬN 1', 'Queen Ann Building ,28-30-32 Lê Lai , Quận 1 HCMC', '2017-10-21 11:30:47', null, 'true', '10.7693', '106.692', '10018', '13');
INSERT INTO `__shop` VALUES ('29', '50', '9', 'QUẬN 11', 'Lầu 5, Parkson Flemington, 184 Lê Đại Hành, Phường 15, Quận 11, TP.HCM.', '2017-10-21 11:31:57', null, 'true', '10.7644', '106.656', '10018', '14');
INSERT INTO `__shop` VALUES ('30', '50', '9', 'QUẬN 4', 'California at the Waterfront 5 Nguyễn Tất Thành, P.12, Quận 4', '2017-10-21 11:32:43', '2017-10-21 11:35:02', 'true', '10.7587', '106.714', '10018', '15');
INSERT INTO `__shop` VALUES ('31', '50', '9', 'QUẬN 5', 'Tầng 5 Hùng Vương Plaza, 126 Hùng Vương , Quận 5', '2017-10-21 11:33:32', null, 'true', '10.7541', '106.674', '10018', '16');
INSERT INTO `__shop` VALUES ('32', '50', '9', 'QUẬN PHÚ NHUẬN', 'Cali Tower, 464-466-468 Phan Xích Long, P.2, Q. Phú Nhuận, TP.HCM', '2017-10-21 11:34:44', null, 'true', '10.7984', '106.688', '10018', '17');
INSERT INTO `__shop` VALUES ('33', '50', '9', 'QUẬN BÌNH THẠNH', 'PEARL PLAZA 561A Điện Biên, Phủ Phường 25, Q:Bình Thạnh, T.P Hồ Chí Minh', '2017-10-21 11:36:03', null, 'true', '10.8003', '106.717', '10018', '18');
INSERT INTO `__shop` VALUES ('34', '1', '9', 'QUẬN HOÀN KIẾM', 'Capital Building, 41, Hai Bà Trưng , Quận Hoàn Kiếm, HN', '2017-10-21 11:37:01', null, 'true', '21.0558', '105.741', '10018', '19');
INSERT INTO `__shop` VALUES ('35', '1', '9', 'QUẬN ĐỐNG ĐA', 'Sky City Tower, 88, Láng Hạ ,Quận Đống Đa, HN', '2017-10-21 11:37:29', null, 'true', '21.0701', '105.957', '10018', '20');
INSERT INTO `__shop` VALUES ('36', '1', '9', 'QUẬN HAI BÀ TRƯNG', 'Times City - Thành Phố Của Thời Đại Mới,Tòa nhà T18 - 458 Minh Khai, Quận Hai Bà Trưng, HN', '2017-10-21 11:38:01', null, 'true', '21.1316', '105.88', '10018', '21');
INSERT INTO `__shop` VALUES ('37', '1', '9', 'QUẬN LONG BIÊN', 'Tòa nhà Mipec Riverside tại số 2, phố Long Biên II, quận Long Biên, Tp Hà Nội', '2017-10-21 11:38:32', null, 'true', '20.7479', '105.873', '10018', '22');
INSERT INTO `__shop` VALUES ('38', '32', '9', 'CLB ĐÀ NẴNG', '155 Nguyễn Văn Linh, Quận Thanh Khê, TP. Đà Nẵng', '2017-10-21 11:39:40', null, 'true', '16.0067', '108.179', '10018', '23');
INSERT INTO `__shop` VALUES ('39', '47', '9', 'CLB BÌNH DƯƠNG', 'ầng 3, Tòa nhà Bình Dương Square, 01 Phú Lợi, Khu 1, Phường Phú Lợi TP. Thủ Dầu Một, Tỉnh Bình Dương', '2017-10-21 11:40:33', null, 'true', '10.9487', '106.671', '10018', '24');
INSERT INTO `__shop` VALUES ('40', '50', '8', 'tân bình', ' 222 Phạm Văn Hai, phường 3, Hồ Chí Minh', '2017-10-21 11:41:20', null, 'true', '0', '0', '10018', '25');

-- ----------------------------
-- Table structure for __token
-- ----------------------------
DROP TABLE IF EXISTS `__token`;
CREATE TABLE `__token` (
  `uuid` varchar(255) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `token` varchar(120) NOT NULL,
  `expried` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __token
-- ----------------------------
INSERT INTO `__token` VALUES (null, '15', '1ZuCKiWyAkBSczpglVP7nM4htOLYo58m', '2018-10-26 11:33:29', '2017-10-26 11:29:47', '2017-10-26 11:33:29');
INSERT INTO `__token` VALUES (null, '32', '2xXJZd8eivoMg0wKfh5tkbUrzO9n3Q7m', '2018-10-26 18:21:06', '2017-10-26 18:21:06', null);
INSERT INTO `__token` VALUES (null, '15', '37bDQIesh9W1uaE2pM6JfTxyzUwSRXl0', '2018-10-25 09:11:06', '2017-10-25 09:10:58', '2017-10-25 09:11:06');
INSERT INTO `__token` VALUES (null, '32', '3HsCfK9nD5gL6xE8BRWOIJjqQVeavltU', '2018-10-30 13:40:34', '2017-10-30 12:56:02', '2017-10-30 13:40:34');
INSERT INTO `__token` VALUES ('123456', '2', '3i9gdmj5bkRGNfWKlh7M2EwpPFzAOBev', '2018-10-27 13:11:46', '2017-10-24 22:59:41', '2017-10-27 13:11:46');
INSERT INTO `__token` VALUES (null, '15', '3rsVnMjBWpibqGPeYFKIuU0aXJ17CTSf', '2018-11-02 21:00:19', '2017-11-02 19:53:24', '2017-11-02 21:00:19');
INSERT INTO `__token` VALUES (null, '15', '4NUKFEkt6isGlCILWdJ3BAqRvP9Dxwbg', '2018-10-26 13:39:12', '2017-10-26 13:33:23', '2017-10-26 13:39:12');
INSERT INTO `__token` VALUES (null, '5', '5emiqI76cuLnNSQBDpOPxFE02dbGCvot', '2018-10-25 18:44:25', '2017-10-25 18:42:39', '2017-10-25 18:44:25');
INSERT INTO `__token` VALUES (null, '5', '6RJ8tPabOvTSl7psE5r3h2kZ1gLDdAuN', '2018-10-25 11:56:05', '2017-10-25 11:38:28', '2017-10-25 11:56:05');
INSERT INTO `__token` VALUES (null, '32', '7HmvoxOgpNFjeJWr4Pk5D9a3SRMn2uTB', '2018-11-02 18:18:47', '2017-10-26 16:23:55', '2017-11-02 18:18:47');
INSERT INTO `__token` VALUES (null, '15', '7jNtcnGKbeYOm9qr0328F6VLEDhJvRXg', '2018-10-25 09:12:39', '2017-10-25 09:12:33', '2017-10-25 09:12:39');
INSERT INTO `__token` VALUES (null, '34', '8gpXDRIqQe3KcoVnh6SzFPwEClvja7UJ', '2018-11-05 15:49:02', '2017-11-05 11:43:25', '2017-11-05 15:49:02');
INSERT INTO `__token` VALUES (null, '5', 'aORkvlmgAx4E5jbBnYKp6rHZ2c9FsiQy', '2018-10-27 10:24:27', '2017-10-25 11:23:00', '2017-10-27 10:24:27');
INSERT INTO `__token` VALUES (null, '5', 'Bhkve6trQR8odbDypu1LmjqnZHx49OsG', '2018-10-31 16:39:05', '2017-10-26 13:50:12', '2017-10-31 16:39:05');
INSERT INTO `__token` VALUES (null, '15', 'BZOzYqgkfj0slCdEwX2hoamT57u3F9Kc', '2018-10-26 16:06:46', '2017-10-26 13:49:58', '2017-10-26 16:06:46');
INSERT INTO `__token` VALUES (null, '15', 'C50qAnYb7QcvagMJDBTGdhO6fzspmtX2', '2018-10-26 13:49:40', '2017-10-26 13:49:25', '2017-10-26 13:49:40');
INSERT INTO `__token` VALUES (null, '5', 'ce3hrSj6abAL1UCpVnZWKl9NGY0XxHJw', '2018-10-26 16:23:25', '2017-10-26 14:21:51', '2017-10-26 16:23:25');
INSERT INTO `__token` VALUES (null, '5', 'cofTVeNC94JsgStLzOyUrKkGDIdZ5aF1', '2018-10-25 11:18:01', '2017-10-25 11:17:57', '2017-10-25 11:18:01');
INSERT INTO `__token` VALUES (null, '5', 'D0Z35sThxKANdSkIRMGvcuBe9FOpf6gq', '2018-10-25 18:33:49', '2017-10-25 18:33:48', '2017-10-25 18:33:49');
INSERT INTO `__token` VALUES (null, '32', 'D3ciIVuF76rJLAU2Ejnmqby9zso1xlWY', '2018-10-26 18:20:23', '2017-10-26 18:20:23', null);
INSERT INTO `__token` VALUES (null, '15', 'E3DYeGLuJVawNh2zk6gH8nMFyZxpWd1q', '2018-11-02 21:57:45', '2017-11-02 21:02:29', '2017-11-02 21:57:45');
INSERT INTO `__token` VALUES (null, '4', 'eCzt4bGoNcJHy9hAgvrKi8wVxm7UkpQD', '2018-10-30 13:44:27', '2017-10-30 13:35:19', '2017-10-30 13:44:27');
INSERT INTO `__token` VALUES (null, '15', 'eo3f1JiaQdICYgt7mBxO2DVX0NjGvWzn', '2018-10-25 09:12:12', '2017-10-25 09:12:01', '2017-10-25 09:12:12');
INSERT INTO `__token` VALUES (null, '5', 'EVQRMXinUdZPbxOL9fJHkF3e86T7j0YA', '2018-10-30 17:54:57', '2017-10-30 17:53:46', '2017-10-30 17:54:57');
INSERT INTO `__token` VALUES (null, '5', 'FExrQB31hSoiRjp9bgUmJW6P2DNtszZL', '2018-10-25 18:46:31', '2017-10-25 18:44:42', '2017-10-25 18:46:31');
INSERT INTO `__token` VALUES (null, '5', 'FuZ3vSwrdfIgtPOUEWemTJH0C5cok9Ny', '2018-10-25 18:47:22', '2017-10-25 18:47:21', '2017-10-25 18:47:22');
INSERT INTO `__token` VALUES (null, '15', 'GFmYvDU9f3Zb5NqXtepIM7crdCSgVxoz', '2018-10-26 13:32:26', '2017-10-26 11:36:06', '2017-10-26 13:32:26');
INSERT INTO `__token` VALUES (null, '15', 'GkZYue2sPmJDKSHEzXgda8lo35w4fxVh', '2018-10-30 13:26:25', '2017-10-27 15:24:40', '2017-10-30 13:26:25');
INSERT INTO `__token` VALUES (null, '15', 'hmnrIO0YB5P4UlgbfyoxLQ8cesNWSjvK', '2018-11-02 18:21:42', '2017-11-02 14:36:31', '2017-11-02 18:21:42');
INSERT INTO `__token` VALUES (null, '5', 'HqaQsoDW5RETNbS6FtV7y2UYO1vILlPr', '2018-10-25 18:42:13', '2017-10-25 18:42:12', '2017-10-25 18:42:13');
INSERT INTO `__token` VALUES (null, '15', 'IpuG9lH61NLmwijzoDZ073xtQnqJ5AEg', '2018-10-26 13:49:02', '2017-10-26 13:40:21', '2017-10-26 13:49:02');
INSERT INTO `__token` VALUES (null, '15', 'IY7sdOSfiN1cpxmEyg3zZPCnU8wtDeqX', '2018-11-03 15:48:17', '2017-11-03 14:58:46', '2017-11-03 15:48:17');
INSERT INTO `__token` VALUES (null, '15', 'jafIUOqXmi6e9lVCxNT5h3Bdob1RtFv0', '2018-11-03 17:37:48', '2017-11-03 16:06:25', '2017-11-03 17:37:48');
INSERT INTO `__token` VALUES (null, '15', 'k0tvxnWcrAXUoFsmfa9yzKIH2gR8bliO', '2018-11-02 13:55:50', '2017-11-01 16:35:02', '2017-11-02 13:55:50');
INSERT INTO `__token` VALUES (null, '5', 'k7R4iv1usl6VA3Wj9fqJ2XZ8dHCPDxhg', '2018-10-30 16:08:32', '2017-10-30 15:05:14', '2017-10-30 16:08:32');
INSERT INTO `__token` VALUES (null, '15', 'lAtaKLCxMygiR9qTdpSUWZeNHE3soPOr', '2018-11-03 14:57:21', '2017-11-03 09:46:25', '2017-11-03 14:57:21');
INSERT INTO `__token` VALUES (null, '3', 'LepSkDiKJPYzC9qysuVM8lcBQajIdXmW', '2018-10-25 07:55:51', '2017-10-25 07:55:51', null);
INSERT INTO `__token` VALUES (null, '4', 'LfBAVgj1Fb2dWlsqhxctONXIH4Pk6CuE', '2018-10-27 10:18:54', '2017-10-26 21:45:23', '2017-10-27 10:18:54');
INSERT INTO `__token` VALUES (null, '5', 'lztde2qnXcY5gkf0TNEOpxAWrFyuPm7I', '2018-10-26 17:54:53', '2017-10-26 14:40:41', '2017-10-26 17:54:53');
INSERT INTO `__token` VALUES (null, '15', 'm9QXja2G7FrR5KCpIbiL6oJMVwZEntWu', '2018-11-01 16:34:42', '2017-10-30 15:58:14', '2017-11-01 16:34:42');
INSERT INTO `__token` VALUES (null, '4', 'MTGLgmrOnFiIK9qdvcsfoQjtC6hBEWaJ', '2018-10-31 16:55:09', '2017-10-31 16:24:04', '2017-10-31 16:55:09');
INSERT INTO `__token` VALUES (null, '5', 'NdL59MKjpXbtJriFnBv24PHEI1UuQDYZ', '2018-10-25 11:22:37', '2017-10-25 11:22:20', '2017-10-25 11:22:37');
INSERT INTO `__token` VALUES (null, '4', 'NOI2JdtL36uSGX81me5fTVkBz7CRQbrD', '2018-10-27 22:49:48', '2017-10-25 13:26:37', '2017-10-27 22:49:48');
INSERT INTO `__token` VALUES (null, '5', 'nPcQNJulIUw3hkF8qZ9e2SXs1vRGiK6y', '2018-11-02 18:40:11', '2017-10-26 16:25:04', '2017-11-02 18:40:11');
INSERT INTO `__token` VALUES (null, '5', 'oyYlNTKf9qM7LieH3GtxcB0JvVXRpASw', '2018-10-26 11:46:49', '2017-10-26 10:36:54', '2017-10-26 11:46:49');
INSERT INTO `__token` VALUES (null, '32', 'p9H0DgbedwovkrT6SL8PtJEN4B5huacx', '2018-10-26 18:26:35', '2017-10-26 18:21:40', '2017-10-26 18:26:35');
INSERT INTO `__token` VALUES (null, '15', 'SHQKjceElDTBh0A3p185nzOdxVfvR9q6', '2018-10-30 14:49:02', '2017-10-30 13:28:42', '2017-10-30 14:49:02');
INSERT INTO `__token` VALUES (null, '32', 'siDnljKtNEBMf0FU5rPTWo389CXa7ZOR', '2018-10-27 09:43:41', '2017-10-25 08:40:09', '2017-10-27 09:43:41');
INSERT INTO `__token` VALUES (null, '15', 'skLcN7XQq1W50twApS9HuOZMorCJyR2E', '2018-10-25 09:11:31', '2017-10-25 09:11:25', '2017-10-25 09:11:31');
INSERT INTO `__token` VALUES (null, '5', 'sqG2blIiRDAuvV8a4SzXKMm59YkLC71B', '2018-10-25 18:26:38', '2017-10-25 18:26:31', '2017-10-25 18:26:38');
INSERT INTO `__token` VALUES (null, '32', 'T0J1rEMp5hfUlsRB7vuwWQjqatIz9V2L', '2018-11-03 18:09:39', '2017-11-02 18:22:43', '2017-11-03 18:09:39');
INSERT INTO `__token` VALUES (null, '15', 'TbvIsQehU36jR2AE9puocrKgSaJHNmXq', '2018-11-03 09:21:37', '2017-11-03 09:21:15', '2017-11-03 09:21:37');
INSERT INTO `__token` VALUES (null, '15', 'u9vLwYotWA28b6FXJkNHMsR7DdziCV4r', '2018-10-25 09:13:09', '2017-10-25 09:13:04', '2017-10-25 09:13:09');
INSERT INTO `__token` VALUES (null, '4', 'UDKyNv5m3Y0wFIWos1QLhnbcMS6g7qp9', '2018-10-25 07:55:46', '2017-10-25 07:55:46', null);
INSERT INTO `__token` VALUES (null, '5', 'Ut8B9JR1ZuXwEa6q0NfmVz7v5gsSpIyo', '2018-10-25 11:25:02', '2017-10-25 11:24:53', '2017-10-25 11:25:02');
INSERT INTO `__token` VALUES (null, '32', 'vlUOjYNnSgfup5CbHqJRseX0r684AoPy', '2018-10-26 18:22:15', '2017-10-26 18:22:15', null);
INSERT INTO `__token` VALUES (null, '15', 'W23z5CEFON1pXdKJr7ehaIPbRBZMQ4xV', '2018-10-25 14:17:30', '2017-10-25 10:44:47', '2017-10-25 14:17:30');
INSERT INTO `__token` VALUES (null, '5', 'wX8u3nqmZMyhjpJsY92oL5zr6Q17kae4', '2018-10-25 18:46:47', '2017-10-25 18:46:46', '2017-10-25 18:46:47');
INSERT INTO `__token` VALUES (null, '5', 'x2PtwXLFJlpDQdMuza5fUnITKZjik6ry', '2018-10-25 18:41:49', '2017-10-25 18:36:51', '2017-10-25 18:41:49');
INSERT INTO `__token` VALUES (null, '5', 'xiQ62psh3OS0EPaefZgkjHrbI84FcJwo', '2018-10-25 18:36:29', '2017-10-25 18:34:14', '2017-10-25 18:36:29');
INSERT INTO `__token` VALUES (null, '5', 'yGMpFQqm2LjCXAYRiuDPNa8ozIf1JWO0', '2018-10-25 11:21:14', '2017-10-25 11:17:29', '2017-10-25 11:21:14');
INSERT INTO `__token` VALUES (null, '5', 'yM4LwsN3DQHaSx0ofJbquvI8C9rtEmUK', '2018-10-26 14:21:18', '2017-10-26 14:20:54', '2017-10-26 14:21:18');
INSERT INTO `__token` VALUES (null, '5', 'YoPkRvnSxtCp31Ob06sQNBXHMwy7r5e2', '2018-10-26 14:16:31', '2017-10-26 14:15:48', '2017-10-26 14:16:31');
INSERT INTO `__token` VALUES (null, '15', 'z45VtgRJmrnW78AIuyXF3NKao9ZjUPQB', '2018-10-27 14:51:01', '2017-10-26 16:09:02', '2017-10-27 14:51:01');
INSERT INTO `__token` VALUES (null, '5', 'ZNLEPAQOi41KFd0JDMnVj3ogbacIlph8', '2018-10-25 18:23:33', '2017-10-25 12:03:57', '2017-10-25 18:23:33');
INSERT INTO `__token` VALUES (null, '32', 'ZzJMfapbs2l8D1KOGcTxXkqQnoR97rv6', '2018-10-28 12:30:43', '2017-10-27 09:45:33', '2017-10-28 12:30:43');

-- ----------------------------
-- Table structure for __trademark
-- ----------------------------
DROP TABLE IF EXISTS `__trademark`;
CREATE TABLE `__trademark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` varchar(5) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `content` text,
  `author` int(11) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(20) DEFAULT NULL,
  `contact_address` varchar(255) DEFAULT NULL,
  `sorting` int(11) DEFAULT '0',
  `hotline` varchar(20) DEFAULT NULL,
  `count_like` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __trademark
-- ----------------------------
INSERT INTO `__trademark` VALUES ('1', null, '237', 'Temple Leaf Spa', 'Welcome to Temple Leaf Spa & Sauna', '2017-10-10 11:06:00', '2017-11-05 23:36:19', 'true', 'http://beautyguru.speranzainc.net/data/image/templetealeaf.png', 'http://beautyguru.speranzainc.net/data/image/templetealeaf-cover.png', 'Our concept is that Japanese Traditional Hot Spa “ONSEN” which is Communal Baths and humid and Dry Sauna and Vietnamese Traditional Massage. We are located at 32 Thai Van Lung street, District 1,HCM City.\nWe always research the better relaxation for our valuable customers with the skills of traditional massage & spa aroma oil from Vietnam & Thailand.', '10018', 'Spa1@gmail.com', '', '', '', '0', '19006079', '0');
INSERT INTO `__trademark` VALUES ('2', null, '237', 'Saigon Heritage Spa', 'Welcome to Saigon Heritage spa & massage by expert', '2017-10-10 11:06:00', '2017-10-21 11:13:21', 'true', 'http://beautyguru.speranzainc.net/data/image/saigonheritage.jpg', 'http://beautyguru.speranzainc.net/data/image/saigonheritage-cover.jpg', 'The Ultimate Luxury', '10018', 'Spa2@gmail.com', '', '', '', '0', '19006079', '1');
INSERT INTO `__trademark` VALUES ('3', null, '237', 'Saigon Sports Club', 'Do you think you’re ready to take your training to the next level with top-notch trainers and professional equipment? Have you been looking for a more personalized training experience that will give you the results you want most?', '2017-10-10 11:06:00', '2017-10-21 11:13:51', 'true', 'http://beautyguru.speranzainc.net/data/image/saigon-sports-club.jpg', 'http://beautyguru.speranzainc.net/data/image/saigon-sports-club-cover.jpg', 'Our trainers have exceptional credentials and have trained and competed against many of the world’s top mixed martial arts fighters. Many of our trainers are national and world champions themselves, providing an invaluable level of experience from which our members can benefit. They are dedicated to offering credible, safe, and effective training of real martial arts for those who wish to learn. In addition to the expertise of our unparalleled staff, we also offer:', '10018', 'sportclub@gmail.com', '', '', '514B Huỳnh Tấn Phát, Bình Thuận Ward, Dist.7, HCMC', '0', '19006079', '0');
INSERT INTO `__trademark` VALUES ('4', null, '195', 'Ikeda Spa', 'To deliver the Japanese WOW experience through Omotenashi', '2017-10-10 11:06:00', '2017-10-21 11:14:16', 'true', 'http://beautyguru.speranzainc.net/data/image/ikeda.jpg', 'http://www.marry.vn/wp-content/uploads/2014/11/28/Dang-Viet-Spa_8.jpg', '', '10018', 'ikeda@gmail.com', '', '+65 6388 8080,1', '', '0', '19006079', '2');
INSERT INTO `__trademark` VALUES ('5', null, '195', 'Natureland', 'Natureland Care is an award winning Massage and Spa centre in Singapore. ', '2017-10-10 11:06:00', '2017-10-21 11:14:40', 'true', 'http://beautyguru.speranzainc.net/data/image/natureland.jpg', 'http://www.marry.vn/wp-content/uploads/2014/11/28/Dang-Viet-Spa_8.jpg', ' Experience true massage and therapy when you visit our outlets. All our outlets are open 24-hours (House-keeping between 5am-10am)', '10018', 'natureland@gmail.com', '', '+65 6733 6780', '', '0', '19006079', '1');
INSERT INTO `__trademark` VALUES ('7', null, '237', 'Quyen Angel', 'Top nơi làm tóc đẹp nhất Tp.HCM', '2017-10-19 11:26:48', '2017-10-21 11:15:03', 'true', 'http://beautyguru.speranzainc.net/data/image/quyenangel.jpg', 'http://www.marry.vn/wp-content/uploads/2014/11/28/Dang-Viet-Spa_8.jpg', 'Lam toc va Nail', '10018', '', '', '', '', '2', '19006079', '0');
INSERT INTO `__trademark` VALUES ('8', null, '237', 'Oanh Nail', 'Nail Oanh Lê chuyên chăm sóc và trang trí móng chuyên nghiệp', '2017-10-21 10:31:08', null, 'true', 'http://beautyguru.speranzainc.net/data/image/nailoanh.jpg', 'http://beautyguru.speranzainc.net/data/image/nailoanh-cover.jpg', '<span style=\"color:rgb(29, 33, 41); font-family:helvetica,arial,sans-serif; font-size:14px\">-Đ&agrave;o tạo nghề Nail Academy, li&ecirc;n hệ với t&ocirc;i: 090 984 42 40 - Oanh</span>', '10018', '', '', '', '', '3', '19006079', '4');
INSERT INTO `__trademark` VALUES ('9', null, '237', 'California Fitness', 'Hiện chúng tôi đã có mặt trên 7 thành phố lớn trên khắp Việt Nam, hãy chọn trung tâm phù hợp nhất để bắt đầu tập luyện với cách giảm cân nhanh nhất của chúng tôi hoặc khám phá thêm về những trung tâm sắp mở cửa gần nơi bạn sống', '2017-10-21 10:34:36', '2017-10-22 14:16:31', 'true', 'http://beautyguru.speranzainc.net/data/image/califitness.jpg', 'http://beautyguru.speranzainc.net/data/image/califitness-cover.jpg', '<p>Tập luyện thường xuyên giúp tôi khoẻ mạnh cả thể chất lẫn tinh thần. Tôi cảm thấy mọi thứ tuyệt vời hơn rất nhiều khi tôi thay đổi lối sống để có thân hình cân đối và khoẻ mạnh, nhưng tôi biết ơn vì mình đã làm được điều đó. Sau đây là một số điều mà tập luyện thể dục đã cải thiện cuộc sống của tôi: </p>\n\n<p>1. Nó giúp tôi thay đổi những thói quen xấu. Tôi sẽ về nhà, vào guồng tập luyện, thúc ép bản thân và uống nước thay vì rượu vodka.</p>\n\n<p>2. Đối thủ của tôi là chính mình. Chúng ta sống trong xã hội mà ta liên tục so sánh mình với những người khác. Điều làm tôi yêu việc luyện tập là bạn sẽ cạnh tranh với chính mình. Càng tập càng tăng cường ý chí, tôi luôn muốn mình làm tốt hơn lần trước.</p>\n\n<p>3. Những ý tưởng tuyệt vời nhất của tôi đều nhờ tập luyện mà có. Khi tập, tinh thần thoải mái, tỉnh táo, mang đến những ý tưởng hay ho cho công việc.</p>\n\n<p>4. Tôi muốn ăn những thực phẩm tốt cho sức khoẻ nhiều hơn, cũng như tôi không còn thèm đồ uống có cồn vào cuối ngày. Khi bắt đầu tập luyện nhiều hơn, tôi bắt đầu muốn ăn những thực phẩm tốt và lành mạnh cho sức khoẻ hơn.</p>\n\n<p>5. Tôi có nhiều động lực hơn, cũng việc vươn đến các mục tiêu nhỏ sẽ tạo động lực cho bạn ở những lĩnh vực khác trong cuộc sống. Bạn càng có nhiều mục tiêu trong việc tập luyện, bạn càng muốn có nhiều mục tiêu hơn ở những mặt khác trong cuộc sống. Luyện tập giúp cải thiện sự nghiệp, các mối quan hệ và cái nhìn chung về cuộc sống của tôi.</p>\n\n<p>6. Tôi ý thức rõ hơn về năng lực bản thân. Tôi càng luyện tập để có sức mạnh, tôi càng làm được những việc đòi hỏi thể chất.</p>\n\n<p>7. Tôi có thái độ tích cực hơn về mọi chuyện, hy vọng và vươn tới. Việc biết được mình có thể chạm đến những mục tiêu trong việc tập luyện cho tôi tinh thần rằng mình-có-thể-làm-bất-kỳ-điều-gì, một tinh thần rất cần thiết khi tôi tuyệt vọng.</p>\n\n<p>8. Tôi cảm thấy đẹp hơn.</p>\n', '10018', '', '', '+840245678', '', '4', '19006079', '3');
INSERT INTO `__trademark` VALUES ('10', null, '237', 'Fit24', 'TRUNG TÂM THỂ DỤC VÀ YOGA TIÊU CHUẨN CHÂU ÂU, LẦN ĐẦU TIÊN CÓ MẶT TẠI VIỆT NAM', '2017-10-21 10:37:17', null, 'true', 'http://beautyguru.speranzainc.net/data/image/fit24.png', 'http://beautyguru.speranzainc.net/data/image/fit24-cover.jpg', '<p style=\"text-align:justify\">Bắt nguồn từ tập đo&agrave;n EuroFit (c&oacute; trụ sở tại Đức) với kinh nghiệm l&acirc;u đời trong lĩnh vực thể dục thể thao, Fit24 l&agrave; c&aacute;i t&ecirc;n mới ở thị trường Việt Nam.</p>\n\n<p style=\"text-align:justify\">Năm 2012 l&agrave; năm đ&aacute;nh dấu sự ra đời của Fit24 tại Việt Nam, Với diện t&iacute;ch hơn 2500 m2 nằm ở Lầu 2 Thi&ecirc;n Sơn plaza, 800 Nguyễn Văn Linh, quận 7, TPHCM. Kể từ đ&acirc;y, khởi đầu 1 chặng đường mới, kế thừa những g&igrave; m&agrave; EuroFit đ&atilde; đạt được, ph&aacute;t huy những gi&aacute; trị mới ph&ugrave; hợp với thị trường Việt Nam</p>\n\n<p style=\"text-align:justify\">Fit24 lu&ocirc;n ch&uacute; trọng sự thoải m&aacute;i v&agrave; sự đảm bảo sức khoẻ cho Hội vi&ecirc;n từ tổng thể đến chi tiết, từ thiết kế theo kh&ocirc;ng gian mở rộng r&atilde;i với trang thiết bị nhập khẩu từ nước ngo&agrave;i, cho đến những&nbsp; lựa chọn yếu phẩm chi tiết từ những thương hiệu lớn như Lavie, Sunsilk...</p>\n\n<p style=\"text-align:justify\">Năm 2015, h&agrave;ng loạt ph&ograve;ng tập ti&ecirc;u chuẩn Ch&acirc;u &Acirc;u ra đời tại TPHCM, l&agrave; cột mốc cho sự trưởng th&agrave;nh v&agrave; ph&aacute;t triển bền vững của Fit24.</p>\n\n<p style=\"text-align:justify\">Với khẩu hiệu &ldquo;Fit for life&rdquo;, Fit24 mong muốn đem lại sức khoẻ, chuẩn ho&aacute; v&oacute;c d&aacute;ng v&agrave; c&acirc;n bằng cuộc sống cho người Việt.</p>\n\n<p style=\"text-align:center\"><strong>Giờ mở cửa</strong></p>\n\n<div class=\"text-center\" style=\"box-sizing: border-box; text-align: center; font-size: 14px; color: rgb(1, 1, 1); font-family: &quot;Open Sans&quot;, sans-serif; line-height: 18.1818px;\">\n<p>6:00 - 22:00</p>\n\n<p>Ch&uacute;ng t&ocirc;i mở cửa 365 ng&agrave;y trong năm</p>\n</div>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n', '10018', 'fit24@gmail.com', 'Jeremy', '', '', '5', '19006079', '3');
INSERT INTO `__trademark` VALUES ('11', null, '237', '39 Fitness', 'Hãy đến với chúng tôi nếu bạn đang lo lắng về Cân nặng và Sức khỏe !!!\n', '2017-10-21 10:39:20', null, 'true', 'http://beautyguru.speranzainc.net/data/image/39fitness.jpg', 'http://beautyguru.speranzainc.net/data/image/39fitness-cover.jpeg', '<span style=\"color:rgb(102, 102, 102); font-family:helvetica,arial,sans-serif; font-size:12px\">Lịch tập trong tuần đối với người x&acirc;y dựng cơ bắp:</span><br />\n<span style=\"color:rgb(102, 102, 102); font-family:helvetica,arial,sans-serif; font-size:12px\">- thứ 2: đ&ugrave;i + bụng</span><br />\n<span style=\"color:rgb(102, 102, 102); font-family:helvetica,arial,sans-serif; font-size:12px\">- thứ 3: ngực + tay trước</span><br />\n<span style=\"color:rgb(102, 102, 102); font-family:helvetica,arial,sans-serif; font-size:12px\">- thứ 4: lưng + bụng</span><br />\n<span style=\"color:rgb(102, 102, 102); font-family:helvetica,arial,sans-serif; font-size:12px\">- thứ 5: vai + tay sau</span><br />\n<span class=\"text_exposed_show\" style=\"color:rgb(102, 102, 102); font-family:helvetica,arial,sans-serif; font-size:12px\">Cứ thế m&agrave; quay lại ban đầu<br />\nĐ&acirc;y l&agrave; lịch cơ bản , tuỳ theo cơ địa mỗi người m&agrave; sẽ đi v&agrave;o c&aacute;c b&agrave;i tập kh&aacute;c nhau. Những bạn muốn x&acirc;y dựng cơ bắp n&ecirc;n tập nặng v&agrave;o nha.v&agrave; đặc biệt phải nạp đủ protein để cơ khoẻ v&agrave; ph&aacute;t triển nha.</span>', '10018', 'fit39@gmail.com', '', '', '', '6', '19006079', '4');
INSERT INTO `__trademark` VALUES ('12', null, '237', 'Ngoc Nu Hair Salon', '         Ngọc Nữ đã tạo dựng một đội ngũ trên 40 nhân viên chuyên nghiệp, được đào tạo theo giáo trình chuyên nghiệp nhằm tư vấn và thực hiện cho khách hàng những mẫu tóc mới nhất của thế giới nhưng cũng hợp với khuôn mặt và vóc dáng của bạn.', '2017-10-21 11:11:59', '2017-11-06 09:13:55', 'false', 'http://beautyguru.speranzainc.net/data/image/ngocnu.jpg', 'http://beautyguru.speranzainc.net/data/image/ngocnu-cover.jpg', '<p style=\"text-align:justify\">Hệ thống Hair Salon Ngọc Nữ, được thành lập từ 2000, nhu cầu làm đẹp ngày càng tăng cao cùng với nhịp điệu hối hả của cuộc sống thì quỹ thời gian cho việc làm đẹp ngày càng eo hẹp.! Nắm bắt được nhu cầu đó, nhằm xây dựng những Salon nhỏ nhưng chuyên nghiệp, đáp ứng được yêu cầu khắt khe về thời gian, chất lượng, phong cách phục vụ, giá cả tốt nhất cho khách hàng.</p>\n\n<p style=\"text-align:justify\">Với nền kinh tế, nhu cầu làm đẹp ngày càng tăng cao cùng với nhịp điệu hối hả của cuộc sống thì quỹ thời gian cho việc làm đẹp ngày càng eo hẹp.! Nắm bắt được nhu cầu đó, nhằm xây dựng những Salon nhỏ nhưng chuyên nghiệp, đáp ứng được yêu cầu khắt khe về thời gian, chất lượng, phong cách phục vụ, giá cả tốt nhất cho khách hàng.</p>\n\n<p style=\"text-align:justify\">Từ năm 2001 đến nay, một hệ thống Salon mang thương hiệu Ngọc Nữ đã ra đời tại TPHCM với phương châm phục vụ:</p>\n\n<p style=\"text-align:justify\">“<strong><em>Phong cách chuyên nghiệp - Chất lượng Quốc tế - Giá thành Việt</em></strong>”  </p>\n', '10018', 'contact@ngocnu.com', '', '', '', '7', '19006079', '1');

-- ----------------------------
-- Table structure for __trademark_category
-- ----------------------------
DROP TABLE IF EXISTS `__trademark_category`;
CREATE TABLE `__trademark_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trademark_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __trademark_category
-- ----------------------------
INSERT INTO `__trademark_category` VALUES ('12', '6', '98');
INSERT INTO `__trademark_category` VALUES ('13', '6', '97');
INSERT INTO `__trademark_category` VALUES ('16', '8', '97');
INSERT INTO `__trademark_category` VALUES ('18', '10', '94');
INSERT INTO `__trademark_category` VALUES ('19', '11', '94');
INSERT INTO `__trademark_category` VALUES ('25', '2', '96');
INSERT INTO `__trademark_category` VALUES ('26', '2', '95');
INSERT INTO `__trademark_category` VALUES ('27', '3', '94');
INSERT INTO `__trademark_category` VALUES ('28', '4', '98');
INSERT INTO `__trademark_category` VALUES ('29', '4', '97');
INSERT INTO `__trademark_category` VALUES ('30', '4', '96');
INSERT INTO `__trademark_category` VALUES ('31', '4', '95');
INSERT INTO `__trademark_category` VALUES ('32', '5', '97');
INSERT INTO `__trademark_category` VALUES ('33', '7', '97');
INSERT INTO `__trademark_category` VALUES ('34', '7', '95');
INSERT INTO `__trademark_category` VALUES ('35', '2', '98');
INSERT INTO `__trademark_category` VALUES ('36', '1', '98');
INSERT INTO `__trademark_category` VALUES ('37', '1', '97');
INSERT INTO `__trademark_category` VALUES ('38', '1', '96');
INSERT INTO `__trademark_category` VALUES ('39', '1', '95');
INSERT INTO `__trademark_category` VALUES ('40', '9', '98');
INSERT INTO `__trademark_category` VALUES ('41', '9', '94');
INSERT INTO `__trademark_category` VALUES ('42', '12', '97');
INSERT INTO `__trademark_category` VALUES ('43', '12', '95');

-- ----------------------------
-- Table structure for __trademark_wish
-- ----------------------------
DROP TABLE IF EXISTS `__trademark_wish`;
CREATE TABLE `__trademark_wish` (
  `trademark_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `status` int(1) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`trademark_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __trademark_wish
-- ----------------------------
INSERT INTO `__trademark_wish` VALUES ('1', '5', '0', '2017-10-25 16:29:53', '2017-11-02 18:27:49');
INSERT INTO `__trademark_wish` VALUES ('1', '15', '1', '2017-10-26 14:40:01', '2017-11-03 16:44:00');
INSERT INTO `__trademark_wish` VALUES ('1', '32', '0', null, '2017-11-03 17:39:16');
INSERT INTO `__trademark_wish` VALUES ('1', '34', '0', '2017-10-24 17:51:36', '2017-11-05 11:47:39');
INSERT INTO `__trademark_wish` VALUES ('2', '2', '1', '2017-10-21 00:59:38', null);
INSERT INTO `__trademark_wish` VALUES ('2', '5', '0', '2017-10-23 16:44:06', '2017-11-02 17:57:26');
INSERT INTO `__trademark_wish` VALUES ('2', '15', '1', '2017-10-26 14:38:37', '2017-11-03 14:31:41');
INSERT INTO `__trademark_wish` VALUES ('2', '32', '0', null, '2017-11-03 17:39:18');
INSERT INTO `__trademark_wish` VALUES ('2', '34', '1', '2017-11-05 15:43:53', null);
INSERT INTO `__trademark_wish` VALUES ('3', '2', '1', '2017-09-05 21:06:29', null);
INSERT INTO `__trademark_wish` VALUES ('3', '3', '1', '2017-09-05 21:06:19', null);
INSERT INTO `__trademark_wish` VALUES ('3', '5', '0', '2017-09-26 17:04:48', '2017-10-23 16:42:29');
INSERT INTO `__trademark_wish` VALUES ('3', '15', '1', '2017-10-26 14:39:58', '2017-11-03 14:32:33');
INSERT INTO `__trademark_wish` VALUES ('4', '5', '0', '2017-10-23 16:43:53', '2017-10-27 18:09:17');
INSERT INTO `__trademark_wish` VALUES ('4', '15', '1', '2017-10-23 12:03:03', '2017-11-03 14:33:25');
INSERT INTO `__trademark_wish` VALUES ('4', '32', '1', '2017-11-03 17:39:32', null);
INSERT INTO `__trademark_wish` VALUES ('5', '2', '1', '2017-10-21 00:46:36', null);
INSERT INTO `__trademark_wish` VALUES ('5', '5', '1', '2017-10-25 11:41:01', '2017-11-01 11:17:29');
INSERT INTO `__trademark_wish` VALUES ('5', '15', '0', '2017-10-23 12:02:31', '2017-11-03 13:29:53');
INSERT INTO `__trademark_wish` VALUES ('5', '32', '0', '2017-10-20 15:22:32', '2017-10-20 15:24:13');
INSERT INTO `__trademark_wish` VALUES ('6', '5', '0', '2017-10-23 16:43:53', '2017-10-31 17:04:10');
INSERT INTO `__trademark_wish` VALUES ('6', '15', '0', '2017-10-23 11:27:01', '2017-11-03 14:33:10');
INSERT INTO `__trademark_wish` VALUES ('6', '33', '1', '2017-10-23 15:05:40', null);
INSERT INTO `__trademark_wish` VALUES ('6', '34', '1', '2017-10-24 17:54:43', null);
INSERT INTO `__trademark_wish` VALUES ('7', '5', '0', '2017-10-25 11:41:04', '2017-10-25 12:04:31');
INSERT INTO `__trademark_wish` VALUES ('7', '15', '0', '2017-10-23 12:02:36', '2017-11-03 11:36:10');
INSERT INTO `__trademark_wish` VALUES ('7', '32', '1', null, null);
INSERT INTO `__trademark_wish` VALUES ('8', '4', '1', '2017-10-30 13:36:12', null);
INSERT INTO `__trademark_wish` VALUES ('8', '5', '1', '2017-10-25 11:41:03', '2017-11-02 18:11:20');
INSERT INTO `__trademark_wish` VALUES ('8', '15', '1', '2017-10-23 12:03:07', '2017-11-03 16:43:39');
INSERT INTO `__trademark_wish` VALUES ('8', '34', '1', '2017-11-05 11:44:18', '2017-11-05 11:44:23');
INSERT INTO `__trademark_wish` VALUES ('9', '5', '1', '2017-10-23 16:18:29', '2017-11-01 11:08:42');
INSERT INTO `__trademark_wish` VALUES ('9', '15', '1', '2017-10-23 16:34:02', '2017-11-03 09:59:14');
INSERT INTO `__trademark_wish` VALUES ('9', '32', '1', null, '2017-11-02 17:40:36');
INSERT INTO `__trademark_wish` VALUES ('9', '34', '1', '2017-10-24 17:51:51', null);
INSERT INTO `__trademark_wish` VALUES ('10', '5', '0', '2017-10-23 16:43:01', '2017-11-01 11:08:02');
INSERT INTO `__trademark_wish` VALUES ('10', '15', '1', '2017-10-23 12:03:01', '2017-11-03 09:59:27');
INSERT INTO `__trademark_wish` VALUES ('10', '32', '1', '2017-11-03 17:39:31', null);
INSERT INTO `__trademark_wish` VALUES ('10', '34', '1', '2017-10-24 18:14:16', null);
INSERT INTO `__trademark_wish` VALUES ('11', '5', '0', '2017-10-23 15:39:17', '2017-11-01 11:09:06');
INSERT INTO `__trademark_wish` VALUES ('11', '15', '1', '2017-10-23 11:25:51', '2017-11-03 16:42:30');
INSERT INTO `__trademark_wish` VALUES ('11', '32', '1', '2017-11-02 17:45:42', null);
INSERT INTO `__trademark_wish` VALUES ('11', '33', '1', '2017-10-23 15:05:38', null);
INSERT INTO `__trademark_wish` VALUES ('11', '34', '1', '2017-10-24 17:53:26', null);
INSERT INTO `__trademark_wish` VALUES ('12', '5', '1', '2017-10-25 11:41:02', '2017-11-01 11:17:30');
INSERT INTO `__trademark_wish` VALUES ('12', '15', '0', '2017-10-23 12:03:06', '2017-11-03 11:36:12');

-- ----------------------------
-- Table structure for __type
-- ----------------------------
DROP TABLE IF EXISTS `__type`;
CREATE TABLE `__type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `status` varchar(5) DEFAULT '0',
  `sorting` int(11) DEFAULT '1',
  `author` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of __type
-- ----------------------------
INSERT INTO `__type` VALUES ('49', 'Hoàn Tiền', 'hoan-tien', '2017-08-22 13:57:51', '2017-09-02 21:58:51', 'filter', 'true', '9', '10018');
INSERT INTO `__type` VALUES ('50', 'Mã Ưu Đãi', 'ma-uu-dai', '2017-08-22 13:58:36', '2017-09-02 21:59:10', 'filter', 'true', '10', '10018');

-- ----------------------------
-- Function structure for get_distance_in_miles_between_geo_locations
-- ----------------------------
DROP FUNCTION IF EXISTS `get_distance_in_miles_between_geo_locations`;
DELIMITER ;;
CREATE DEFINER=`beautyguru`@`%` FUNCTION `get_distance_in_miles_between_geo_locations`(lat1 DOUBLE, lon1 DOUBLE, lat2 DOUBLE, lon2 DOUBLE) RETURNS double
    DETERMINISTIC
BEGIN
RETURN ACOS( SIN(lat1*PI()/180)*SIN(lat2*PI()/180) + COS(lat1*PI()/180)*COS(lat2*PI()/180)*COS(lon2*PI()/180-lon1*PI()/180) ) * 6371000;
END
;;
DELIMITER ;
