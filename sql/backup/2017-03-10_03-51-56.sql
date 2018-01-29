#
# TABLE STRUCTURE FOR: admin_group_module
#

DROP TABLE IF EXISTS `admin_group_module`;

CREATE TABLE `admin_group_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

INSERT INTO `admin_group_module` (`id`, `name`, `description`, `module`) VALUES ('1', 'ฝ่ายซัพพอตเซล', 'ฝ่ายซัพพอตเซล', 'supportsales');
INSERT INTO `admin_group_module` (`id`, `name`, `description`, `module`) VALUES ('2', 'ฝ่ายเอกสาร อย', 'ฝ่ายเอกสาร อย', 'fdadocuments');
INSERT INTO `admin_group_module` (`id`, `name`, `description`, `module`) VALUES ('3', 'ฝ่ายผลิต / สำหรับลูกค้าใหม่', 'ฝ่ายผลิต / สำหรับลูกค้าใหม่', 'productnewcustomers');
INSERT INTO `admin_group_module` (`id`, `name`, `description`, `module`) VALUES ('4', 'ฝ่ายผลิต / สำหรับลูกค้าเก่า', 'ฝ่ายผลิต / สำหรับลูกค้าเก่า', 'productolecustomers');
INSERT INTO `admin_group_module` (`id`, `name`, `description`, `module`) VALUES ('5', 'ฝ่ายบรรจุ / งานสต๊อกกิโลไม่แบ่งบรรจุ', 'ฝ่ายบรรจุ / งานสต๊อกกิโลไม่แบ่งบรรจุ', 'packingstockkilo');
INSERT INTO `admin_group_module` (`id`, `name`, `description`, `module`) VALUES ('6', 'ฝ่ายบรรจุ / งานแบ่งบรรจุ', 'ฝ่ายบรรจุ / งานแบ่งบรรจุ', 'packingrepacking');
INSERT INTO `admin_group_module` (`id`, `name`, `description`, `module`) VALUES ('7', 'แผนกแพกเกต / ลูกค้าใช้แพกแกตบริษัท', 'แผนกแพกเกต / ลูกค้าใช้แพกแกตบริษัท', 'packetcompany');
INSERT INTO `admin_group_module` (`id`, `name`, `description`, `module`) VALUES ('8', 'แผนกแพกเกต / ลูกค้านำแพกแกตมาเอง', 'แผนกแพกเกต / ลูกค้านำแพกแกตมาเอง', 'packetcustomers');
INSERT INTO `admin_group_module` (`id`, `name`, `description`, `module`) VALUES ('9', 'แผนกติดสติ๊กเกอร์ / ใช้ของบริษัท', 'แผนกติดสติ๊กเกอร์ / ใช้ของบริษัท', 'stickerscompany');
INSERT INTO `admin_group_module` (`id`, `name`, `description`, `module`) VALUES ('10', 'แผนกติดสติ๊กเกอร์ /ลูกค้านำมาเอง', 'แผนกติดสติ๊กเกอร์ /ลูกค้านำมาเอง', 'stickerscustomer');
INSERT INTO `admin_group_module` (`id`, `name`, `description`, `module`) VALUES ('11', 'แผนกกราฟฟิก/ ออกแบบใหม่', 'แผนกกราฟฟิก/ ออกแบบใหม่', 'graphicnew');
INSERT INTO `admin_group_module` (`id`, `name`, `description`, `module`) VALUES ('12', 'แผนกกราฟฟิก/ แบบเก่า REODER', 'แผนกกราฟฟิก/ แบบเก่า REODER', 'graphicreoder');
INSERT INTO `admin_group_module` (`id`, `name`, `description`, `module`) VALUES ('13', 'แผนกกราฟฟิก/ ลุกค้าพิมพ์ฉลากมาเอง', 'แผนกกราฟฟิก/ ลุกค้าพิมพ์ฉลากมาเอง', 'graphiccustomer');
INSERT INTO `admin_group_module` (`id`, `name`, `description`, `module`) VALUES ('14', 'QC', 'QC', 'cottonqc');
INSERT INTO `admin_group_module` (`id`, `name`, `description`, `module`) VALUES ('15', 'QC / LAB', 'QC / LAB', 'cottonqclab');
INSERT INTO `admin_group_module` (`id`, `name`, `description`, `module`) VALUES ('16', 'QA', 'QA', 'cottonqa');
INSERT INTO `admin_group_module` (`id`, `name`, `description`, `module`) VALUES ('17', 'ฝ่ายเซล', 'ฝ่ายเซล', 'sales');


#
# TABLE STRUCTURE FOR: admin_groups
#

DROP TABLE IF EXISTS `admin_groups`;

CREATE TABLE `admin_groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES ('1', 'webmaster', 'Webmaster');
INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES ('2', 'admin', 'Administrator');
INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES ('3', 'manager', 'Manager');
INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES ('4', 'staff', 'Staff');


#
# TABLE STRUCTURE FOR: admin_login_attempts
#

DROP TABLE IF EXISTS `admin_login_attempts`;

CREATE TABLE `admin_login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: admin_users
#

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('1', '127.0.0.1', 'webmaster', '$2y$08$/X5gzWjesYi78GqeAv5tA.dVGBVP7C1e1PzqnYCVe5s1qhlDIPPES', NULL, 'test@mail.com', NULL, NULL, NULL, NULL, '1451900190', '1489113908', '1', 'Webmaster', 'test', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('2', '127.0.0.1', 'admin', '$2y$08$7Bkco6JXtC3Hu6g9ngLZDuHsFLvT7cyAxiz1FzxlX5vwccvRT7nKW', NULL, NULL, NULL, NULL, NULL, NULL, '1451900228', '1451903990', '0', 'Admin', '', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('3', '127.0.0.1', 'manager', '$2y$08$snzIJdFXvg/rSHe0SndIAuvZyjktkjUxBXkrrGdkPy1K6r5r/dMLa', NULL, NULL, NULL, NULL, NULL, NULL, '1451900430', NULL, '1', 'Manager', '', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('4', '127.0.0.1', 'staff', '$2y$08$NigAXjN23CRKllqe3KmjYuWXD5iSRPY812SijlhGeKfkrMKde9da6', NULL, NULL, NULL, NULL, NULL, NULL, '1451900439', NULL, '1', 'Staff', '', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('5', '::1', 'mans1800', '$2y$08$sYJQBACqMLH983PqyiAPXe0I2pKANNP8n5z5AQCGFLdxWSiB06zE2', NULL, 'test@mail.com', NULL, NULL, NULL, NULL, '1483603801', '1489113878', '1', 'Apirat', 'Pakakaew', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('6', '::1', 'mans1900', '$2y$08$3bzbmRVk1jcVzFl8GXvAw.GxtYU4YJtn5nEHdrItkhMrom53JXoKC', NULL, 'test@mail.com', NULL, NULL, NULL, NULL, '1483603891', '1489113892', '1', 'Apirat', 'Pakakaew', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('7', '::1', 'mans1700', '$2y$08$YuSc2EaRrmMNlGx2drwZ7ubRBDnHxZuBLay0i3PW97pS0VegNONiK', NULL, 'test@mail.com', NULL, NULL, NULL, NULL, '1483603909', '1489113668', '1', 'Apirat', 'Pakakaew', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('8', '192.168.1.25', 'mans2000', '$2y$08$S.uNMTICHORkTcoV6ZlsK.BTYa8pH6zkb19FXSR.PlRKUav7D81wC', NULL, NULL, NULL, NULL, NULL, NULL, '1488275960', NULL, '1', 'Apirat', 'Pakakaew', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('11', '192.168.1.25', 'test1', '$2y$08$RHcL2IQWFxND6HASMhZ0muDWLOYo..SIInbVSBpttqaxoYk2N94F6', NULL, 'test@mail.com', NULL, NULL, NULL, NULL, '1488334413', NULL, '1', 'test1', 'test1', 'test.jpg');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('13', '192.168.1.25', 'admin2', '$2y$08$WTCV37lPxD0QHqShgcx0quBUysHtVErj5bTg9CPATCMorIY.utmsS', NULL, 'test@mail.com', NULL, NULL, NULL, NULL, '1488335793', NULL, '1', 'test2', 'test1', '00f6822a2790759885e57e3c6e2b49b4.jpg');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('14', '192.168.1.25', 'admin3', '$2y$08$pd3A.5XCLNM7qomqitd9uOi8xNNCSRl8aVN8Mc7v8W0cDU1qVVLBu', NULL, 'test@mail.com', NULL, NULL, NULL, NULL, '1488336296', NULL, '1', 'test1', 'test1', '0');


#
# TABLE STRUCTURE FOR: admin_users_groups
#

DROP TABLE IF EXISTS `admin_users_groups`;

CREATE TABLE `admin_users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('1', '1', '1');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('2', '2', '2');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('3', '3', '3');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('4', '4', '4');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('8', '8', '2');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('9', '8', '3');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('10', '8', '4');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('25', '14', '2');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('26', '14', '3');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('27', '14', '4');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('56', '13', '2');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('61', '7', '4');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('63', '6', '3');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('65', '5', '2');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('66', '1', '2');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('67', '1', '3');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('68', '1', '4');


#
# TABLE STRUCTURE FOR: admin_users_groups_module
#

DROP TABLE IF EXISTS `admin_users_groups_module`;

CREATE TABLE `admin_users_groups_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;

INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('28', '14', '4');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('29', '14', '6');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('30', '14', '7');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('31', '14', '10');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('102', '13', '1');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('103', '13', '2');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('104', '13', '8');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('105', '13', '11');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('106', '13', '15');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('123', '7', '1');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('125', '6', '1');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('142', '5', '2');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('143', '5', '3');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('144', '5', '6');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('145', '5', '7');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('146', '5', '9');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('147', '1', '1');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('148', '1', '2');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('149', '1', '3');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('150', '1', '4');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('151', '1', '5');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('152', '1', '6');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('153', '1', '7');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('154', '1', '8');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('155', '1', '9');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('156', '1', '10');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('157', '1', '11');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('158', '1', '12');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('159', '1', '13');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('160', '1', '14');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('161', '1', '15');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('162', '1', '16');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('163', '1', '17');


#
# TABLE STRUCTURE FOR: ci_sessions
#

DROP TABLE IF EXISTS `ci_sessions`;

CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ckdu53e2o7krvqfilmaft936elvhucnp', '::1', '1489109754', '__ci_last_regenerate|i:1489109454;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1489046984\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:17:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";i:16;s:2:\"17\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ov86nmr17sumrbupjpndcl6jbfdce5m6', '::1', '1489109798', '__ci_last_regenerate|i:1489109758;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1489046984\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:17:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";i:16;s:2:\"17\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('2u62u2e5p6cc73mi1q3jfalfvhv08ag6', '::1', '1489109779', '__ci_last_regenerate|i:1489109779;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('rtcv0d547tj1brdrc5s2644b0q4lh0nd', '::1', '1489109796', '__ci_last_regenerate|i:1489109779;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('7q3iur3tpne33apksg7n5q9j6jruj5ok', '::1', '1489110525', '__ci_last_regenerate|i:1489110246;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1489046984\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:17:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";i:16;s:2:\"17\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('2egmv3boqlqj8lga4nq0qpl1tl6me983', '::1', '1489110800', '__ci_last_regenerate|i:1489110580;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1489046984\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:17:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";i:16;s:2:\"17\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('072mff9ctcm55rju3g1fbjvh8l36pvfb', '::1', '1489110610', '__ci_last_regenerate|i:1489110610;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('4gc87po3l7gulpi3mpo3vv63emeauvf1', '::1', '1489110610', '__ci_last_regenerate|i:1489110610;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('2vt8cin1h7vo8t54gei98r38vnajd3h7', '::1', '1489110610', '__ci_last_regenerate|i:1489110610;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('j1im1bq2th115l417cgd5tfu8gvej53l', '::1', '1489110610', '__ci_last_regenerate|i:1489110610;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('7o78osphvfim10baepoarc8n5i8q7td1', '::1', '1489110611', '__ci_last_regenerate|i:1489110611;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('00tq8gknjd81i9h8scmdah8lusoifccl', '::1', '1489110903', '__ci_last_regenerate|i:1489110611;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('vn4650r87pkd08js6p0jp3kl0mr9njeq', '::1', '1489111189', '__ci_last_regenerate|i:1489110902;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1489046984\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:17:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";i:16;s:2:\"17\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('qmelsm31unlmt0scv7baqkpf4tmpedpg', '::1', '1489110957', '__ci_last_regenerate|i:1489110957;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('nlepb49nvdnjktmrocg8jvdk1rj5i5co', '::1', '1489110957', '__ci_last_regenerate|i:1489110957;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('hmrlv3iio3q3p1gqnvt5av6ec1armrok', '::1', '1489110957', '__ci_last_regenerate|i:1489110957;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('vacv23tgjfe0ca24vfqfioip6r0vfvoq', '::1', '1489110957', '__ci_last_regenerate|i:1489110957;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('5hm7jm481pmc7kfccnarp788kghgiv4v', '::1', '1489110957', '__ci_last_regenerate|i:1489110957;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('3av8d574t8h0ukebv365forfj9kkma33', '::1', '1489110957', '__ci_last_regenerate|i:1489110957;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('8foopdidk5eim2thnto594pktbhe5lko', '::1', '1489111250', '__ci_last_regenerate|i:1489110957;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('a6uauamp77d1jjj4g84f6c6lalefm1c2', '::1', '1489111507', '__ci_last_regenerate|i:1489111211;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1489046984\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:17:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";i:16;s:2:\"17\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('urhq9ubik7cpsom567sk5u1p0oc2i5fq', '::1', '1489111281', '__ci_last_regenerate|i:1489111281;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('e7aqr490a5tl7ma63kkosr6fcl09msb0', '::1', '1489111281', '__ci_last_regenerate|i:1489111281;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('2fq4k8le7ek5mubmdrsa8g66vk7e1om7', '::1', '1489111281', '__ci_last_regenerate|i:1489111281;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('to30nkab5et6brhpn7q7o938knltajta', '::1', '1489111281', '__ci_last_regenerate|i:1489111281;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('o4hipatpmgqq30piesnpudhorlpiva6k', '::1', '1489111507', '__ci_last_regenerate|i:1489111281;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('0480bl11sn3qc6v20q094ocakba6tfmh', '::1', '1489111953', '__ci_last_regenerate|i:1489111666;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1489046984\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:17:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";i:16;s:2:\"17\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('lb2eq4pvnk0uhiph32m4uh54d2sulj0t', '::1', '1489111666', '__ci_last_regenerate|i:1489111666;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('erloqba03bojrvhp52fi03ns8al2p63g', '::1', '1489111666', '__ci_last_regenerate|i:1489111666;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('6b0qogriptos3kg538vsrvh9b20pdh6b', '::1', '1489111666', '__ci_last_regenerate|i:1489111666;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('07006sfs0q34mcvc3epgpfa77m32h19d', '::1', '1489111666', '__ci_last_regenerate|i:1489111666;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('7k4uor32ouok6fp64k8e66upn54adifs', '::1', '1489111953', '__ci_last_regenerate|i:1489111666;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('qotpa89mct0ndhk9fc3h51c7783q60od', '::1', '1489112162', '__ci_last_regenerate|i:1489111982;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1489046984\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:17:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";i:16;s:2:\"17\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('4trtfm94826sts0a7334h78hqfuhhm30', '::1', '1489111982', '__ci_last_regenerate|i:1489111982;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ekbqu7oqmk1b0rkl7003fava8elvcam5', '::1', '1489111982', '__ci_last_regenerate|i:1489111982;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('irr6erbkvd2c4p14sbi55p3qeb1i8f6j', '::1', '1489111982', '__ci_last_regenerate|i:1489111982;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('0jnphlroj91bta0hg7sun0lrcuvuccf5', '::1', '1489111982', '__ci_last_regenerate|i:1489111982;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('tqvmv36n8ciajqn1q2ra3o0lun3p0soo', '::1', '1489111982', '__ci_last_regenerate|i:1489111982;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('086leplfqd81vqfqc0o6ogqm83uijddd', '::1', '1489111982', '__ci_last_regenerate|i:1489111982;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ngfs78cinhq1fijtfqnrvo5csmjsjsq1', '::1', '1489112162', '__ci_last_regenerate|i:1489111982;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('v70bhlaga3uovq5bcib0fska9cq58gg8', '::1', '1489112376', '__ci_last_regenerate|i:1489112283;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1489046984\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:17:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";i:16;s:2:\"17\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('m8m3vr8bildd53bu9rql2jmhr7tu43uo', '::1', '1489112283', '__ci_last_regenerate|i:1489112283;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('khbn91b4t3o3310le5dl58h95es0hbjg', '::1', '1489112283', '__ci_last_regenerate|i:1489112283;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('i5aut90fgj4r7ss5qf20n6lspo4psaaq', '::1', '1489112283', '__ci_last_regenerate|i:1489112283;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('q214e8l88lps0k1jph4vg3fgufpkjbs7', '::1', '1489112283', '__ci_last_regenerate|i:1489112283;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('fjhrde5m5nru6vhl2ohfovtoi901ba3k', '::1', '1489112377', '__ci_last_regenerate|i:1489112283;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('js8fjbec57to724p85hjm83qn63qhdlj', '::1', '1489112667', '__ci_last_regenerate|i:1489112648;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1489046984\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:17:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";i:16;s:2:\"17\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('cegmup3n1qv08b1h7qbq4a5c7sqilp2f', '::1', '1489112648', '__ci_last_regenerate|i:1489112648;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('k7srbnkg8dsllgb156joujv0ton5cb13', '::1', '1489112648', '__ci_last_regenerate|i:1489112648;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('jd34qup952bv79t2qomhq7k74ugqkpud', '::1', '1489112648', '__ci_last_regenerate|i:1489112648;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('sf9cn04hobdu7ed9tc04i5tsvi2lugqm', '::1', '1489112648', '__ci_last_regenerate|i:1489112648;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('tjm939osldsl52uf9u2js4f1rd80pakm', '::1', '1489112667', '__ci_last_regenerate|i:1489112648;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('jgirqsam5d3v812b19p5ar52lvbda6uu', '::1', '1489113394', '__ci_last_regenerate|i:1489113394;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ajqpc51do6efivm35u49esbfl2ad7sud', '::1', '1489113394', '__ci_last_regenerate|i:1489113394;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('7pb8d9okmr24j3mbvh5ndqlialf4ct4g', '::1', '1489113394', '__ci_last_regenerate|i:1489113394;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('93l73fkvkpvht53llt8tjq164jrcfqu2', '::1', '1489113394', '__ci_last_regenerate|i:1489113394;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('bl9hhg9u810tuk40p9a2jhorppq1h61t', '::1', '1489113669', '__ci_last_regenerate|i:1489113394;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('nbsr8dekauhloohmhbduupsanr5tm707', '::1', '1489113772', '__ci_last_regenerate|i:1489113772;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('udc8ctnkq62rgkv4kg8rtl45n2c9j72o', '::1', '1489113772', '__ci_last_regenerate|i:1489113772;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('qn706nf1ogqn6qml5gqp7pu7vt2p9ecb', '::1', '1489113772', '__ci_last_regenerate|i:1489113772;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('8fpnr4vesk5bbb8c6g355393iircs7gv', '::1', '1489114065', '__ci_last_regenerate|i:1489113772;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('etctga0q14qrgemc7s1edta68u2gepuv', '::1', '1489113772', '__ci_last_regenerate|i:1489113772;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('t7m0loej0a761tlmlh43fkku5g252ajf', '::1', '1489114202', '__ci_last_regenerate|i:1489113906;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1489113871\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:17:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";i:16;s:2:\"17\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('d6ujduohb2nho0cnhv2q6tre3s29niqo', '::1', '1489114195', '__ci_last_regenerate|i:1489114195;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('7ldlh85dp980fvqo3eb8e9mbtfl5kdsa', '::1', '1489114195', '__ci_last_regenerate|i:1489114195;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('5rri1p42c0uoagfhgo1rel0l91u6arju', '::1', '1489114195', '__ci_last_regenerate|i:1489114195;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('0a0cv392jop5gka6duaf14kgtbjr76m0', '::1', '1489114195', '__ci_last_regenerate|i:1489114195;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('1oph6ulc809427kun4viua0beg6k86ge', '::1', '1489114314', '__ci_last_regenerate|i:1489114195;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('4h7fsjets3lu863b992rmsj1c7jubsid', '::1', '1489114313', '__ci_last_regenerate|i:1489114231;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1489113871\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:17:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";i:16;s:2:\"17\";}');


#
# TABLE STRUCTURE FOR: groups
#

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `groups` (`id`, `name`, `description`) VALUES ('1', 'members', 'General User');


#
# TABLE STRUCTURE FOR: login_attempts
#

DROP TABLE IF EXISTS `login_attempts`;

CREATE TABLE `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: tc_commentorder
#

DROP TABLE IF EXISTS `tc_commentorder`;

CREATE TABLE `tc_commentorder` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  `comment_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO `tc_commentorder` (`comment_id`, `order_id`, `admin_id`, `detail`, `comment_date`) VALUES ('8', '1', '1', 'test2', '2017-03-09 09:59:12');


#
# TABLE STRUCTURE FOR: tc_order
#

DROP TABLE IF EXISTS `tc_order`;

CREATE TABLE `tc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `code_id` varchar(255) NOT NULL,
  `name_order` varchar(255) NOT NULL,
  `name_customer` varchar(255) NOT NULL,
  `status` int(2) NOT NULL,
  `type_order` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `order_date` date NOT NULL DEFAULT '0000-00-00',
  `order_datelate` date NOT NULL DEFAULT '0000-00-00',
  `order_workcount` int(11) NOT NULL,
  `order_date_end` date NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `tc_order` (`order_id`, `code_id`, `name_order`, `name_customer`, `status`, `type_order`, `admin_id`, `order_date`, `order_datelate`, `order_workcount`, `order_date_end`) VALUES ('1', 'TC-1501', 'ครีมทาตัว', 'คุณธิติยา', '1', '0', '1', '2017-03-09', '2017-03-24', '15', '0000-00-00');
INSERT INTO `tc_order` (`order_id`, `code_id`, `name_order`, `name_customer`, `status`, `type_order`, `admin_id`, `order_date`, `order_datelate`, `order_workcount`, `order_date_end`) VALUES ('4', 'KG-4510', 'ครีมทาตัว', 'คุณธิติยา', '1', '1', '1', '2017-03-09', '2017-03-14', '5', '0000-00-00');


#
# TABLE STRUCTURE FOR: tc_work_comment
#

DROP TABLE IF EXISTS `tc_work_comment`;

CREATE TABLE `tc_work_comment` (
  `work_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `work_now_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `work_comment_detail` text NOT NULL,
  `comment_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`work_comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

INSERT INTO `tc_work_comment` (`work_comment_id`, `work_now_id`, `admin_id`, `work_comment_detail`, `comment_date`) VALUES ('19', '1', '1', 'test', '2017-03-09 10:27:53');


#
# TABLE STRUCTURE FOR: tc_work_list
#

DROP TABLE IF EXISTS `tc_work_list`;

CREATE TABLE `tc_work_list` (
  `work_id` int(11) NOT NULL AUTO_INCREMENT,
  `work_detail` varchar(255) NOT NULL,
  `work_status` int(2) NOT NULL,
  `group_module_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  PRIMARY KEY (`work_id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('2', 'ตรวจสอบบิล', '1', '1', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('3', 'ส่งใบสั่งผลิตลงทุกแผนก', '1', '1', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('4', 'เอกสารขอไอดีให้ลูกค้าใหม่มาครบแล้ว', '1', '1', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('5', 'ส่งเอกสารขอไอดีไปแผนกขอไอดีแล้ว', '1', '1', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('6', 'ไอดีลูกค้ามาแล้ว เลขที่ .......', '1', '1', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('7', 'เป็นลุกค้าเก่า/ใช้ไอดีเก่า', '1', '1', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('8', 'รับแจ้งไอดีแล้ว', '1', '2', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('9', 'รับเมล์ใบสั่งผลิตจากซัพพอตแล้ว', '1', '2', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('10', 'รับรูปเพื่อ ขอ อย แล้ว ', '1', '2', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('11', 'รับสูตรจากฝ่ายผลิต', '1', '2', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('12', 'จดแจ้งแล้วได้เลข อย .....', '1', '2', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('13', 'ส่งใบ อย และสรรพคุณให้เซลแล้ว ', '1', '2', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('14', 'ส่ง BOOKLET เพื่อทำฉลากแล้ว', '1', '2', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('15', 'PIF ดำเนินการแล้ว', '1', '2', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('16', 'วางแผนผลิต', '1', '3', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('17', 'เบิกวัตถุดิบ', '1', '3', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('18', 'ผลิตแบต RD', '1', '3', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('19', 'ส่ง QC', '1', '3', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('20', 'ส่ง QA', '1', '3', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('21', 'ส่งลูกค้า ', '1', '3', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('22', 'ส่ง BOSS ', '1', '3', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('23', 'ลูกค้าตอบกลับ /ครั้งที่', '1', '3', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('24', 'ส่งสูตรการผลิตไป แผนก อย ', '1', '3', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('25', 'ผลิตจริง', '1', '3', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('26', 'ผลิตเสร็จแล้วส่งต่องานไปแผนกแบ่งบรรจุ ', '1', '3', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('27', 'วางแผนผลิต', '1', '4', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('28', 'เบิกวัตถุดิบ', '1', '4', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('29', 'ผลิตจริง', '1', '4', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('30', 'ส่งสูตรการผลิตไป แผนก อย ', '1', '4', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('31', 'ส่ง QC', '1', '4', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('32', 'ส่ง QA', '1', '4', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('33', 'ผลิตเสร็จแล้วส่งต่องานไปแผนกแบ่งบรรจุ ', '1', '4', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('34', 'เก็บเข้าสต๊อก', '1', '5', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('35', 'ทำป้ายชี้บ่งแล้ว', '1', '5', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('36', 'คีย์เข้าระบบรับแล้ว ', '1', '5', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('37', 'รับมอบสินค้าสำเร็จรุปรอบรรจุแล้ว', '1', '6', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('38', 'เบิกแพ็กเกตแล้ว ', '1', '6', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('39', 'ล้างทำความสะอาดแพกเกตแล้ว', '1', '6', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('40', 'บรรจุลงในภาชนะแล้ว', '1', '6', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('41', 'ทำโอนย้ายไปแผนกสติกเกอร์แล้ว ', '1', '6', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('42', 'ส่งคืนแพกเก็ตที่เหลือให้ QC แล้ว ', '1', '6', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('43', 'จัดซื้อแพกแกตแล้ว ', '1', '7', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('44', 'ส่งไปแผนกแบ่งบรรจุแล้ว', '1', '7', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('45', 'ได้รับแพกเกตจากลูกค้าแล้ว', '1', '8', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('46', 'แพกเกตครบตามหน้าบิล', '1', '8', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('47', 'แพกเกตไม่ครบตามหน้าบิล', '1', '8', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('48', 'รายงานแพ็กแกตให้เซลแล้ว ', '1', '8', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('49', 'ส่งไปแผนกแบ่งบรรจุแล้ว', '1', '8', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('50', 'รับสินค้าที่แบ่งบรรจุถุกต้องครบ', '1', '9', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('51', 'รับสติ๊กเกอร์จากแผนกสติ๊กเกอร์แล้ว ', '1', '9', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('52', 'รับกล่องจากโรงพิมพ์แล้ว ', '1', '9', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('53', 'ติดฉลาก+ซีลลงในแพกแกตแล้ว', '1', '9', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('54', 'โอนย้ายไปแผนก QC', '1', '9', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('55', 'ได้รับสติกเกอร์จากลูกค้าแล้ว', '1', '10', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('56', 'สติกเกอร์  ครบ ตามหน้าบิล', '1', '10', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('57', 'สติกเกอร์ ไม่ครบ ตามหน้าบิล', '1', '10', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('58', 'กล่อง ครบ ตามหน้าบิล', '1', '10', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('59', 'กล่องไม่ครบ ตามหน้าบิล', '1', '10', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('60', 'รายงานสติกเกอร์ ให้เซลแล้ว ', '1', '10', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('61', 'รายงานกล่องให้เซลแล้ว ', '1', '10', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('62', 'ติดฉลาก+ซีลลงในแพกแกตแล้ว', '1', '10', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('63', 'พับกล่อง+ซีลลงในแพกแกตแล้ว', '1', '10', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('64', 'โอนย้ายสินค้าที่ติดฉลากไปแผนก QC', '1', '10', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('65', 'คืน สติกเกอร์ ไปแผนก QC', '1', '10', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('66', 'คืน กล่อง ไปแผนก QC', '1', '10', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('67', 'ได้รับ DIS จากลูกค้าแล้ว ', '1', '11', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('68', 'กำลังออกแบบ', '1', '11', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('69', 'ส่งแบบให้ลูกค้าอนุมัติ', '1', '11', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('70', 'รอการอนุมัติ ', '1', '11', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('71', 'ลุกค้าอนุมัติ คอนเฟริ์มแล้ว ', '1', '11', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('72', 'ตรวจแบบ ', '1', '11', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('73', 'สั่งพิมพ์ ', '1', '11', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('74', 'ส่งแบบเดิมที่เปลี่ยนเลข LOT / วันที่ให้ลุกค้าอนุมัติ', '1', '12', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('75', 'ส่งแบบให้ลูกค้าอนุมัติ', '1', '12', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('76', 'รอการอนุมัติ ', '1', '12', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('77', 'ลุกค้าอนุมัติ คอนเฟริ์มให้พิมพ์ได้ ', '1', '12', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('78', 'สั่งพิมพ์ ', '1', '12', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('79', 'ลูกค้าส่งแบบมาให้บริษัทตรวจ ', '1', '13', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('80', 'กำลังตรวจสอบแบบที่ลุกค้าส่งมา ', '1', '13', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('81', 'แบบถูกต้อง / แจ้งเซลให้แจ้งลุกค้าพิมพ์ได้เลย ', '1', '13', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('82', 'แบบไม่ถูกต้อง / แจ้งเซลให้แจ้งลุกค้าแก้', '1', '13', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('83', 'รับสินค้าสำเร็จ', '1', '14', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('84', 'ตรวจสอบกับใบสั่งผลิต', '1', '14', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('85', 'มีคืนแพกแกตและอุปกรณ์ ', '1', '14', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('86', 'ไม่มีคืนแพกแกตและอุปกรณ์', '1', '14', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('87', 'ทำการ PACKING  ลงลัง', '1', '14', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('88', 'แจ้งเซลพร้อมส่งวันที่...............', '1', '14', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('89', 'จัดส่งทางมือ', '1', '14', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('90', 'จัดส่งโดยขนส่ง', '1', '14', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('91', 'จัดส่งโดย ปณ', '1', '14', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('92', 'ตรวจเชื้อ ', '1', '15', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('93', 'ตรวจ สารปรอท', '1', '15', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('94', 'ตรวจสาร ไฮโดรควินโนน', '1', '15', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('95', 'ตรวจสาร PH', '1', '15', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('96', 'ส่งรายงานแล้ว ', '1', '15', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('97', 'ทำการวัดบ่ม STAYBILITY  ครั้งที่ 1', '1', '15', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('98', 'ทำการวัดบ่ม STAYBILITY  ครั้งที่ 2', '1', '15', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('99', 'เทสสินค้าก่อนส่งไปแผนกบรรจุ', '1', '16', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('100', 'ส่งรายงานประจำวันครั้งที่  1', '1', '16', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('101', 'วัดค่า PH  / ที่เป็นบ่ม ครั้งที่ 1', '1', '16', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('102', 'ส่งรายงานประจำวันครั้งที่ 2', '1', '16', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('103', 'วัดค่า PH  / ที่เป็นบ่ม ครั้งที่ 2', '1', '16', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('104', 'บันทึกรายงานสรุปผล ', '1', '16', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('105', 'เก็บ RETENSION SAMPLING แล้ว ', '1', '16', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('106', 'ทำใบเสนอราคาให้ลูกค้า', '1', '17', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('107', 'เช็ค แพกเกจ กับ ซัพพอต', '1', '17', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('108', 'เช็คราคาเรทขั้นต่ำ', '1', '17', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('109', 'เมื่อใบเสนอราคาถูกต้องแจ้งข้อมูลส่งเอกสาร', '1', '17', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('110', 'เช็คชื่อแบรนด์', '1', '17', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('111', 'ส่งข้อมูลเอกสารที่ต้องใช้', '1', '17', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('112', 'รอไอดีสั่งผลิต', '1', '17', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('113', 'ทำใบสั่งผลิตให้ตรวจ', '1', '17', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('114', 'รอส่งต้นแบบ', '1', '17', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('115', 'ต้นแบบโอเคค่อยออกแบบ', '1', '17', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('116', 'รอกราฟฟิกออกแบบโลโก้', '1', '17', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('117', 'เมื่อ อย. ออก รอแบบฉลากหลังเพื่อยืนยันส่งพิมพ์', '1', '17', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('118', 'หากมีกล่อง รอยืนยันแบบ', '1', '17', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('119', 'รอบรู๊ทดิจิตอล และราคา', '1', '17', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('120', 'ยืนยันสั่งกล่อง', '1', '17', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('121', 'รอพร้อมส่ง', '1', '17', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('122', 'ตามยอดคงเหลือ', '1', '17', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('123', 'ส่งใบ อย. ให้ลูกค้า', '1', '17', '1');
INSERT INTO `tc_work_list` (`work_id`, `work_detail`, `work_status`, `group_module_id`, `admin_id`) VALUES ('124', 'ส่งรูปถ่ายสินค้าให้ลูกค้า', '1', '17', '1');


#
# TABLE STRUCTURE FOR: tc_work_now
#

DROP TABLE IF EXISTS `tc_work_now`;

CREATE TABLE `tc_work_now` (
  `work_now_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `group_module_id` int(11) NOT NULL,
  `work_now_detail` varchar(255) NOT NULL,
  `work_now_status` int(2) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `work_now_dateend` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`work_now_id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8;

INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('1', '1', '1', 'ตรวจสอบบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('2', '1', '1', 'ส่งใบสั่งผลิตลงทุกแผนก', '3', '0', '0', '2017-03-09');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('3', '1', '1', 'เอกสารขอไอดีให้ลูกค้าใหม่มาครบแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('4', '1', '1', 'ส่งเอกสารขอไอดีไปแผนกขอไอดีแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('5', '1', '1', 'ไอดีลูกค้ามาแล้ว เลขที่ .......', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('6', '1', '1', 'เป็นลุกค้าเก่า/ใช้ไอดีเก่า', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('7', '1', '2', 'รับแจ้งไอดีแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('8', '1', '2', 'รับเมล์ใบสั่งผลิตจากซัพพอตแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('9', '1', '2', 'รับรูปเพื่อ ขอ อย แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('10', '1', '2', 'รับสูตรจากฝ่ายผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('11', '1', '2', 'จดแจ้งแล้วได้เลข อย .....', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('12', '1', '2', 'ส่งใบ อย และสรรพคุณให้เซลแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('13', '1', '2', 'ส่ง BOOKLET เพื่อทำฉลากแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('14', '1', '2', 'PIF ดำเนินการแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('15', '1', '3', 'วางแผนผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('16', '1', '3', 'เบิกวัตถุดิบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('17', '1', '3', 'ผลิตแบต RD', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('18', '1', '3', 'ส่ง QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('19', '1', '3', 'ส่ง QA', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('20', '1', '3', 'ส่งลูกค้า ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('21', '1', '3', 'ส่ง BOSS ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('22', '1', '3', 'ลูกค้าตอบกลับ /ครั้งที่', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('23', '1', '3', 'ส่งสูตรการผลิตไป แผนก อย ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('24', '1', '3', 'ผลิตจริง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('25', '1', '3', 'ผลิตเสร็จแล้วส่งต่องานไปแผนกแบ่งบรรจุ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('26', '1', '4', 'วางแผนผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('27', '1', '4', 'เบิกวัตถุดิบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('28', '1', '4', 'ผลิตจริง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('29', '1', '4', 'ส่งสูตรการผลิตไป แผนก อย ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('30', '1', '4', 'ส่ง QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('31', '1', '4', 'ส่ง QA', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('32', '1', '4', 'ผลิตเสร็จแล้วส่งต่องานไปแผนกแบ่งบรรจุ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('33', '1', '5', 'เก็บเข้าสต๊อก', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('34', '1', '5', 'ทำป้ายชี้บ่งแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('35', '1', '5', 'คีย์เข้าระบบรับแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('36', '1', '6', 'รับมอบสินค้าสำเร็จรุปรอบรรจุแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('37', '1', '6', 'เบิกแพ็กเกตแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('38', '1', '6', 'ล้างทำความสะอาดแพกเกตแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('39', '1', '6', 'บรรจุลงในภาชนะแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('40', '1', '6', 'ทำโอนย้ายไปแผนกสติกเกอร์แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('41', '1', '6', 'ส่งคืนแพกเก็ตที่เหลือให้ QC แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('42', '1', '7', 'จัดซื้อแพกแกตแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('43', '1', '7', 'ส่งไปแผนกแบ่งบรรจุแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('44', '1', '8', 'ได้รับแพกเกตจากลูกค้าแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('45', '1', '8', 'แพกเกตครบตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('46', '1', '8', 'แพกเกตไม่ครบตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('47', '1', '8', 'รายงานแพ็กแกตให้เซลแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('48', '1', '8', 'ส่งไปแผนกแบ่งบรรจุแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('49', '1', '9', 'รับสินค้าที่แบ่งบรรจุถุกต้องครบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('50', '1', '9', 'รับสติ๊กเกอร์จากแผนกสติ๊กเกอร์แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('51', '1', '9', 'รับกล่องจากโรงพิมพ์แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('52', '1', '9', 'ติดฉลาก+ซีลลงในแพกแกตแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('53', '1', '9', 'โอนย้ายไปแผนก QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('54', '1', '10', 'ได้รับสติกเกอร์จากลูกค้าแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('55', '1', '10', 'สติกเกอร์  ครบ ตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('56', '1', '10', 'สติกเกอร์ ไม่ครบ ตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('57', '1', '10', 'กล่อง ครบ ตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('58', '1', '10', 'กล่องไม่ครบ ตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('59', '1', '10', 'รายงานสติกเกอร์ ให้เซลแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('60', '1', '10', 'รายงานกล่องให้เซลแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('61', '1', '10', 'ติดฉลาก+ซีลลงในแพกแกตแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('62', '1', '10', 'พับกล่อง+ซีลลงในแพกแกตแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('63', '1', '10', 'โอนย้ายสินค้าที่ติดฉลากไปแผนก QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('64', '1', '10', 'คืน สติกเกอร์ ไปแผนก QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('65', '1', '10', 'คืน กล่อง ไปแผนก QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('66', '1', '11', 'ได้รับ DIS จากลูกค้าแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('67', '1', '11', 'กำลังออกแบบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('68', '1', '11', 'ส่งแบบให้ลูกค้าอนุมัติ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('69', '1', '11', 'รอการอนุมัติ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('70', '1', '11', 'ลุกค้าอนุมัติ คอนเฟริ์มแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('71', '1', '11', 'ตรวจแบบ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('72', '1', '11', 'สั่งพิมพ์ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('73', '1', '12', 'ส่งแบบเดิมที่เปลี่ยนเลข LOT / วันที่ให้ลุกค้าอนุมัติ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('74', '1', '12', 'ส่งแบบให้ลูกค้าอนุมัติ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('75', '1', '12', 'รอการอนุมัติ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('76', '1', '12', 'ลุกค้าอนุมัติ คอนเฟริ์มให้พิมพ์ได้ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('77', '1', '12', 'สั่งพิมพ์ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('78', '1', '13', 'ลูกค้าส่งแบบมาให้บริษัทตรวจ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('79', '1', '13', 'กำลังตรวจสอบแบบที่ลุกค้าส่งมา ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('80', '1', '13', 'แบบถูกต้อง / แจ้งเซลให้แจ้งลุกค้าพิมพ์ได้เลย ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('81', '1', '13', 'แบบไม่ถูกต้อง / แจ้งเซลให้แจ้งลุกค้าแก้', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('82', '1', '14', 'รับสินค้าสำเร็จ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('83', '1', '14', 'ตรวจสอบกับใบสั่งผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('84', '1', '14', 'มีคืนแพกแกตและอุปกรณ์ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('85', '1', '14', 'ไม่มีคืนแพกแกตและอุปกรณ์', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('86', '1', '14', 'ทำการ PACKING  ลงลัง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('87', '1', '14', 'แจ้งเซลพร้อมส่งวันที่...............', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('88', '1', '14', 'จัดส่งทางมือ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('89', '1', '14', 'จัดส่งโดยขนส่ง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('90', '1', '14', 'จัดส่งโดย ปณ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('91', '1', '15', 'ตรวจเชื้อ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('92', '1', '15', 'ตรวจ สารปรอท', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('93', '1', '15', 'ตรวจสาร ไฮโดรควินโนน', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('94', '1', '15', 'ตรวจสาร PH', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('95', '1', '15', 'ส่งรายงานแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('96', '1', '15', 'ทำการวัดบ่ม STAYBILITY  ครั้งที่ 1', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('97', '1', '15', 'ทำการวัดบ่ม STAYBILITY  ครั้งที่ 2', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('98', '1', '16', 'เทสสินค้าก่อนส่งไปแผนกบรรจุ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('99', '1', '16', 'ส่งรายงานประจำวันครั้งที่  1', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('100', '1', '16', 'วัดค่า PH  / ที่เป็นบ่ม ครั้งที่ 1', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('101', '1', '16', 'ส่งรายงานประจำวันครั้งที่ 2', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('102', '1', '16', 'วัดค่า PH  / ที่เป็นบ่ม ครั้งที่ 2', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('103', '1', '16', 'บันทึกรายงานสรุปผล ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('104', '1', '16', 'เก็บ RETENSION SAMPLING แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('105', '1', '17', 'ทำใบเสนอราคาให้ลูกค้า', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('106', '1', '17', 'เช็ค แพกเกจ กับ ซัพพอต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('107', '1', '17', 'เช็คราคาเรทขั้นต่ำ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('108', '1', '17', 'เมื่อใบเสนอราคาถูกต้องแจ้งข้อมูลส่งเอกสาร', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('109', '1', '17', 'เช็คชื่อแบรนด์', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('110', '1', '17', 'ส่งข้อมูลเอกสารที่ต้องใช้', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('111', '1', '17', 'รอไอดีสั่งผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('112', '1', '17', 'ทำใบสั่งผลิตให้ตรวจ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('113', '1', '17', 'รอส่งต้นแบบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('114', '1', '17', 'ต้นแบบโอเคค่อยออกแบบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('115', '1', '17', 'รอกราฟฟิกออกแบบโลโก้', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('116', '1', '17', 'เมื่อ อย. ออก รอแบบฉลากหลังเพื่อยืนยันส่งพิมพ์', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('117', '1', '17', 'หากมีกล่อง รอยืนยันแบบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('118', '1', '17', 'รอบรู๊ทดิจิตอล และราคา', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('119', '1', '17', 'ยืนยันสั่งกล่อง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('120', '1', '17', 'รอพร้อมส่ง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('121', '1', '17', 'ตามยอดคงเหลือ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('122', '1', '17', 'ส่งใบ อย. ให้ลูกค้า', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('123', '1', '17', 'ส่งรูปถ่ายสินค้าให้ลูกค้า', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('174', '4', '1', 'ตรวจสอบบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('175', '4', '1', 'ส่งใบสั่งผลิตลงทุกแผนก', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('176', '4', '1', 'เอกสารขอไอดีให้ลูกค้าใหม่มาครบแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('177', '4', '1', 'ส่งเอกสารขอไอดีไปแผนกขอไอดีแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('178', '4', '1', 'ไอดีลูกค้ามาแล้ว เลขที่ .......', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('179', '4', '1', 'เป็นลุกค้าเก่า/ใช้ไอดีเก่า', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('180', '4', '4', 'วางแผนผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('181', '4', '4', 'เบิกวัตถุดิบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('182', '4', '4', 'ผลิตจริง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('183', '4', '4', 'ส่งสูตรการผลิตไป แผนก อย ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('184', '4', '4', 'ส่ง QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('185', '4', '4', 'ส่ง QA', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('186', '4', '4', 'ผลิตเสร็จแล้วส่งต่องานไปแผนกแบ่งบรรจุ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('187', '4', '5', 'เก็บเข้าสต๊อก', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('188', '4', '5', 'ทำป้ายชี้บ่งแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('189', '4', '5', 'คีย์เข้าระบบรับแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('190', '4', '14', 'รับสินค้าสำเร็จ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('191', '4', '14', 'ตรวจสอบกับใบสั่งผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('192', '4', '14', 'มีคืนแพกแกตและอุปกรณ์ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('193', '4', '14', 'ไม่มีคืนแพกแกตและอุปกรณ์', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('194', '4', '14', 'ทำการ PACKING  ลงลัง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('195', '4', '14', 'แจ้งเซลพร้อมส่งวันที่...............', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('196', '4', '14', 'จัดส่งทางมือ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('197', '4', '14', 'จัดส่งโดยขนส่ง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('198', '4', '14', 'จัดส่งโดย ปณ', '1', '0', '0', '0000-00-00');


#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES ('1', '127.0.0.1', 'member', '$2y$08$kkqUE2hrqAJtg.pPnAhvL.1iE7LIujK5LZ61arONLpaBBWh/ek61G', NULL, 'member@member.com', NULL, NULL, NULL, NULL, '1451903855', '1451905011', '1', 'Member', 'One', NULL, NULL);


#
# TABLE STRUCTURE FOR: users_groups
#

DROP TABLE IF EXISTS `users_groups`;

CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('1', '1', '1');


