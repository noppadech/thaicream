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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('1', '127.0.0.1', 'webmaster', '$2y$08$/X5gzWjesYi78GqeAv5tA.dVGBVP7C1e1PzqnYCVe5s1qhlDIPPES', NULL, 'test@mail.com', NULL, NULL, NULL, NULL, '1451900190', '1490589295', '1', 'Webmaster', 'test', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('2', '127.0.0.1', 'admin', '$2y$08$7Bkco6JXtC3Hu6g9ngLZDuHsFLvT7cyAxiz1FzxlX5vwccvRT7nKW', NULL, NULL, NULL, NULL, NULL, NULL, '1451900228', '1451903990', '0', 'Admin', '', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('3', '127.0.0.1', 'manager', '$2y$08$snzIJdFXvg/rSHe0SndIAuvZyjktkjUxBXkrrGdkPy1K6r5r/dMLa', NULL, NULL, NULL, NULL, NULL, NULL, '1451900430', NULL, '1', 'Manager', '', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('4', '127.0.0.1', 'staff', '$2y$08$NigAXjN23CRKllqe3KmjYuWXD5iSRPY812SijlhGeKfkrMKde9da6', NULL, NULL, NULL, NULL, NULL, NULL, '1451900439', NULL, '1', 'Staff', '', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('15', '171.7.104.45', 'aumawan', '$2y$08$Z/wh.nVvIyzPYwhJBVs1wOoNNFG7Gk.UE4osrD93n4q1XoWAospx.', NULL, 'aumawan@thaicream.com', NULL, NULL, NULL, NULL, '1489569146', '1489569184', '1', 'aumawan', 'ruangchai', '');


#
# TABLE STRUCTURE FOR: admin_users_groups
#

DROP TABLE IF EXISTS `admin_users_groups`;

CREATE TABLE `admin_users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

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
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('69', '15', '3');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('70', '15', '4');


#
# TABLE STRUCTURE FOR: admin_users_groups_module
#

DROP TABLE IF EXISTS `admin_users_groups_module`;

CREATE TABLE `admin_users_groups_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;

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
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('164', '15', '1');


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

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('769b1184f9dc94311d418fc78d461195a3faeb2c', '172.68.6.57', '1490584241', '__ci_last_regenerate|i:1490584241;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1490322663\";img|s:17:\"sales-icon-32.png\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:17:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";i:16;s:2:\"17\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('33acf64fde31ed1fe5dd2e3ebcb6565460598ea8', '172.68.6.57', '1490584632', '__ci_last_regenerate|i:1490584632;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1490322663\";img|s:17:\"sales-icon-32.png\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:17:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";i:16;s:2:\"17\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('dcf8e01c4f0aab6609ced429dea8969cace3e0f9', '172.68.6.93', '1490584394', '__ci_last_regenerate|i:1490584394;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('1d298d686fef53ec56a2773b6de9e67ffdfd7686', '172.68.6.21', '1490584394', '__ci_last_regenerate|i:1490584394;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('e44b85355ad73184b133ac1d628c7be44d02bf42', '172.68.6.93', '1490584505', '__ci_last_regenerate|i:1490584505;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('5d1f30785d0a21bf4420bd48f460016328ea944c', '172.68.6.21', '1490584505', '__ci_last_regenerate|i:1490584505;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('215e2213e58bbbe4e97c1d6424504e4d53112d48', '172.68.6.93', '1490584515', '__ci_last_regenerate|i:1490584515;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('87e30a6e154eb0153d93795d5107340caef5aafa', '172.68.6.21', '1490584516', '__ci_last_regenerate|i:1490584515;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('8ae595c468556f5422999501b2a7e555625511ee', '172.68.6.21', '1490584532', '__ci_last_regenerate|i:1490584532;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('9d8ffff3b42accc5ce419417b9c0582b0be0e88e', '172.68.6.93', '1490584532', '__ci_last_regenerate|i:1490584532;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('60941d58f3b0d66eb598bf5a7dda3e494698d725', '172.68.6.57', '1490584946', '__ci_last_regenerate|i:1490584946;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1490322663\";img|s:17:\"sales-icon-32.png\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:17:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";i:16;s:2:\"17\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('e2167376651a17da2dd167363a00eda0a3a7c15e', '172.68.6.21', '1490584640', '__ci_last_regenerate|i:1490584640;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('f9da3a872cc963931101754e2381cbb189d91bb6', '172.68.6.93', '1490584640', '__ci_last_regenerate|i:1490584640;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('e1b52ada9b8a4c4f452c89a082555ee644cc13bc', '172.68.6.93', '1490584644', '__ci_last_regenerate|i:1490584644;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('65cb772adac7a96a9d04b12493694f4140cc5ac6', '172.68.6.21', '1490584644', '__ci_last_regenerate|i:1490584644;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('5b16d4907ce7489c33027e30c5f1db298d82e48d', '172.68.6.57', '1490585386', '__ci_last_regenerate|i:1490585386;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1490322663\";img|s:17:\"sales-icon-32.png\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:17:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";i:16;s:2:\"17\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('d700ffe72db3026260fc1607b2660f0b255f960a', '172.68.6.93', '1490584947', '__ci_last_regenerate|i:1490584947;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('28231d127b7ac651b6367657fb0e07f963042898', '172.68.6.27', '1490584947', '__ci_last_regenerate|i:1490584947;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('1ddeb90a0cb32d015de149fafe54a26ae41f1ef0', '172.68.6.93', '1490584957', '__ci_last_regenerate|i:1490584957;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('224adef131501d61765b8006bcee019ae0ccd135', '172.68.6.27', '1490584957', '__ci_last_regenerate|i:1490584957;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('c7d0bf6961892bcb4f64f95428c96089ef7d84c6', '172.68.6.93', '1490584962', '__ci_last_regenerate|i:1490584962;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('09ff6964771978e7dd6fd8bb50900f751bf49f3e', '172.68.6.27', '1490584962', '__ci_last_regenerate|i:1490584962;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('f0eae4509614d15be43feb622cb2b8b4182f82d9', '172.68.6.93', '1490584989', '__ci_last_regenerate|i:1490584989;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('3bb23ac9aa7ad771c1ca7c877860030c72302bf7', '172.68.6.21', '1490584989', '__ci_last_regenerate|i:1490584989;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('e99a36ff15a4ce211bc085ee5e5f670a3117923b', '172.68.6.93', '1490584992', '__ci_last_regenerate|i:1490584992;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('85baf05c450aebccab0bb94f44df9387dd91dca2', '172.68.6.21', '1490584992', '__ci_last_regenerate|i:1490584992;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('8ab82edfda7187cb5832c76971640d03cea32587', '172.68.6.93', '1490584993', '__ci_last_regenerate|i:1490584993;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('c8d110ec0fc0c79eb3e78add0f6c8a382b0cad43', '172.68.6.21', '1490584993', '__ci_last_regenerate|i:1490584993;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('6d04efaf952988144633b7343b95b117d01367ef', '172.68.6.93', '1490584995', '__ci_last_regenerate|i:1490584995;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('58758eb291bcb61155465864916e26883d6fc207', '172.68.6.21', '1490584995', '__ci_last_regenerate|i:1490584995;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('cc466e52f271a24c0089246c076f71e646ef529f', '172.68.6.93', '1490584997', '__ci_last_regenerate|i:1490584997;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ab91cc44cdb635dbecbccd38c3d65f68f9edccd0', '172.68.6.21', '1490584997', '__ci_last_regenerate|i:1490584997;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('b85c5858a19a73952157b46572432be9a9cb6353', '172.68.6.93', '1490585000', '__ci_last_regenerate|i:1490585000;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('8b1fc765dff0869f805db410922f4b31479f6ea6', '172.68.6.21', '1490585000', '__ci_last_regenerate|i:1490585000;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('770db0cb511a8b0985104311a57208339bbc45e1', '172.68.6.93', '1490585070', '__ci_last_regenerate|i:1490585070;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('858850d3a450112e0c546dfcb521992da9167a9d', '172.68.6.21', '1490585070', '__ci_last_regenerate|i:1490585070;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('814144acfb32c28c596f262701467aca526066dc', '172.68.6.93', '1490585073', '__ci_last_regenerate|i:1490585073;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('a5bed093df09f5f9323d0c6591670d47df91b48a', '172.68.6.21', '1490585073', '__ci_last_regenerate|i:1490585073;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('e3e45455e548301f08b2708c3e0f5b544f7b613f', '172.68.6.93', '1490585075', '__ci_last_regenerate|i:1490585075;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ba9ff6fbdd7d45dae8a4486be1ec7e041301ffea', '172.68.6.21', '1490585075', '__ci_last_regenerate|i:1490585075;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('b8953bf44bd808f9c3f14e48b395708552017fbb', '172.68.6.93', '1490585076', '__ci_last_regenerate|i:1490585076;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('351a0b27a4b8ef7a7964ba366942704974f45d0c', '172.68.6.21', '1490585076', '__ci_last_regenerate|i:1490585076;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('8321947d9c8092a77e83f031b2abe1b4818440af', '172.68.6.93', '1490585079', '__ci_last_regenerate|i:1490585079;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('16e35273968dc342b82f7f849148394059a4be08', '172.68.6.21', '1490585079', '__ci_last_regenerate|i:1490585079;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('39a53e9d3d7ce06f2c0f7cf01734368f6796c4da', '172.68.6.57', '1490585087', '__ci_last_regenerate|i:1490585087;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('87bea7ddd8f60b8414fdae84f912a56f27fe2a5c', '172.68.6.57', '1490585087', '__ci_last_regenerate|i:1490585087;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('c520bf16cd14a9557c42229c1e31d727673e57f1', '172.68.6.57', '1490585087', '__ci_last_regenerate|i:1490585087;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('d29816268213b431bc3444bd78c601d506816d40', '172.68.6.57', '1490585087', '__ci_last_regenerate|i:1490585087;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('0631c14ac659cfc3542f99b948c605145d6480e9', '172.68.6.57', '1490585087', '__ci_last_regenerate|i:1490585087;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('f43e99f73c2ce47abf18363c57d6eee1ebf78e05', '172.68.6.57', '1490585388', '__ci_last_regenerate|i:1490585388;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('560c4bd3f290d5d067e50f9f8209549c84f11547', '172.68.6.57', '1490585708', '__ci_last_regenerate|i:1490585708;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1490322663\";img|s:17:\"sales-icon-32.png\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:17:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";i:16;s:2:\"17\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('a76b779f14c7232471e14babf36f305319c344cc', '172.68.6.57', '1490585709', '__ci_last_regenerate|i:1490585708;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('326db12f62baf548e4fd1404b27eaa6a4d38d274', '172.68.6.57', '1490586013', '__ci_last_regenerate|i:1490586013;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1490322663\";img|s:17:\"sales-icon-32.png\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:17:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";i:16;s:2:\"17\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('1541c74252026df9cf6f68c7ac67dbe0e4c9d058', '172.68.6.57', '1490586014', '__ci_last_regenerate|i:1490586014;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('1b8f88ab14bff514f562f4840e67ef7cf848ca54', '172.68.6.57', '1490586350', '__ci_last_regenerate|i:1490586350;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1490322663\";img|s:17:\"sales-icon-32.png\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:17:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";i:16;s:2:\"17\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('0716a2346d95c303d4c64c921971552b641476a8', '172.68.6.57', '1490586351', '__ci_last_regenerate|i:1490586350;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('2b3151bde469ee8cf8914954ddbd388bb43098ac', '172.68.6.57', '1490586558', '__ci_last_regenerate|i:1490586350;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1490322663\";img|s:17:\"sales-icon-32.png\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:17:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";i:16;s:2:\"17\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('7f2e98b726e1f70aec05175a6c2196952a953f6d', '172.68.6.57', '1490586559', '__ci_last_regenerate|i:1490586350;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('81d8f145b3311141176fc4e8ff7bd721f535c761', '172.68.6.93', '1490587033', '__ci_last_regenerate|i:1490587033;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1490583862\";img|s:17:\"sales-icon-32.png\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:17:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";i:16;s:2:\"17\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('739c6f6d6bf5c1ce49c36143c07b164d00db1310', '172.68.6.93', '1490586595', '__ci_last_regenerate|i:1490586595;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('8445b6b4616f7d53cd3960423a4b4e219354bc6b', '172.68.6.93', '1490586595', '__ci_last_regenerate|i:1490586595;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('0fcaaca053a906f89b2881b21b1f469b3d71e98f', '172.68.6.93', '1490586595', '__ci_last_regenerate|i:1490586595;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('cb6514ef90a395d4fc08ee5730951deae34d3844', '172.68.6.93', '1490586595', '__ci_last_regenerate|i:1490586595;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('056585ce9cfce353ac1f8d8298dd3ceae6d7b800', '172.68.6.93', '1490586595', '__ci_last_regenerate|i:1490586595;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('bde0c38e30eb38f32939855152a3a4f676b7302a', '172.68.6.93', '1490586595', '__ci_last_regenerate|i:1490586595;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('604e87e86b8605ce87230aef4cdc65ec889fdc11', '172.68.6.93', '1490589349', '__ci_last_regenerate|i:1490589301;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('e583d7017db955c2dc153b74d7392a01962ae462', '172.68.6.93', '1490588804', '__ci_last_regenerate|i:1490588804;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('509dbc528de2a2161d760fbc1fbf68ae97aaee97', '172.68.6.93', '1490589226', '__ci_last_regenerate|i:1490589226;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('cb6bf55226fa1ffdc203f16ba3457ed235208f87', '172.68.6.93', '1490589354', '__ci_last_regenerate|i:1490589226;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1490588494\";img|s:17:\"sales-icon-32.png\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:17:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";i:16;s:2:\"17\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ff6530c94238bc7b1502394215294a2b7b922c60', '172.68.6.63', '1490589302', '__ci_last_regenerate|i:1490589301;');


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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

INSERT INTO `tc_commentorder` (`comment_id`, `order_id`, `admin_id`, `detail`, `comment_date`) VALUES ('24', '4', '1', 'งานเลยกำหนดเวลามา 1 วันแล้ว', '2017-03-15 08:33:20');
INSERT INTO `tc_commentorder` (`comment_id`, `order_id`, `admin_id`, `detail`, `comment_date`) VALUES ('25', '1', '1', 'test', '2017-03-15 15:21:39');
INSERT INTO `tc_commentorder` (`comment_id`, `order_id`, `admin_id`, `detail`, `comment_date`) VALUES ('26', '7', '1', 'ลูกค้ายังไม่ชำระเงิน', '2017-03-22 13:53:03');
INSERT INTO `tc_commentorder` (`comment_id`, `order_id`, `admin_id`, `detail`, `comment_date`) VALUES ('27', '8', '1', 'ฝ่ายผลิตงานเสร็จแล้ว โอนย้ายให้ฝ่ายรรจุ', '2017-03-22 14:08:41');


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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO `tc_order` (`order_id`, `code_id`, `name_order`, `name_customer`, `status`, `type_order`, `admin_id`, `order_date`, `order_datelate`, `order_workcount`, `order_date_end`) VALUES ('4', 'KG-4510', 'ครีมทาตัว', 'คุณธิติยา', '1', '1', '1', '2017-03-09', '2017-03-14', '5', '0000-00-00');
INSERT INTO `tc_order` (`order_id`, `code_id`, `name_order`, `name_customer`, `status`, `type_order`, `admin_id`, `order_date`, `order_datelate`, `order_workcount`, `order_date_end`) VALUES ('7', 'TR-5010', 'อโลเวล่าเจล', 'คุณ ธิติยา', '2', '0', '1', '2017-03-15', '2017-03-30', '15', '0000-00-00');
INSERT INTO `tc_order` (`order_id`, `code_id`, `name_order`, `name_customer`, `status`, `type_order`, `admin_id`, `order_date`, `order_datelate`, `order_workcount`, `order_date_end`) VALUES ('8', 'TC-5000', 'เซรั่ม', 'BIO', '1', '0', '1', '2017-03-22', '2017-04-06', '15', '0000-00-00');


#
# TABLE STRUCTURE FOR: tc_order_success
#

DROP TABLE IF EXISTS `tc_order_success`;

CREATE TABLE `tc_order_success` (
  `order_id` int(11) NOT NULL,
  `code_id` varchar(255) NOT NULL,
  `name_order` varchar(255) NOT NULL,
  `name_customer` varchar(255) NOT NULL,
  `status` int(2) NOT NULL,
  `type_order` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `order_datelate` date NOT NULL,
  `order_workcount` int(11) NOT NULL,
  `order_date_end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tc_order_success` (`order_id`, `code_id`, `name_order`, `name_customer`, `status`, `type_order`, `admin_id`, `order_date`, `order_datelate`, `order_workcount`, `order_date_end`) VALUES ('1', 'TC-1501', 'ครีมทาตัว', 'คุณธิติยา', '3', '0', '1', '2017-03-09', '2017-03-24', '15', '2017-03-22');


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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

INSERT INTO `tc_work_comment` (`work_comment_id`, `work_now_id`, `admin_id`, `work_comment_detail`, `comment_date`) VALUES ('26', '82', '1', 'test', '2017-03-13 09:30:56');
INSERT INTO `tc_work_comment` (`work_comment_id`, `work_now_id`, `admin_id`, `work_comment_detail`, `comment_date`) VALUES ('27', '82', '1', 'test', '2017-03-13 09:31:00');
INSERT INTO `tc_work_comment` (`work_comment_id`, `work_now_id`, `admin_id`, `work_comment_detail`, `comment_date`) VALUES ('28', '1', '7', 'ทดสอบ', '2017-03-16 11:09:59');
INSERT INTO `tc_work_comment` (`work_comment_id`, `work_now_id`, `admin_id`, `work_comment_detail`, `comment_date`) VALUES ('29', '584', '1', 'ติดต่อลูกค้าไม่ได้', '2017-03-22 14:00:19');
INSERT INTO `tc_work_comment` (`work_comment_id`, `work_now_id`, `admin_id`, `work_comment_detail`, `comment_date`) VALUES ('30', '585', '1', 'วัตถุดิบยังไม่มา', '2017-03-22 14:01:18');


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
) ENGINE=InnoDB AUTO_INCREMENT=694 DEFAULT CHARSET=utf8;

INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('174', '4', '1', 'ตรวจสอบบิล', '1', '0', '1', '2017-03-27');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('175', '4', '1', 'ส่งใบสั่งผลิตลงทุกแผนก', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('176', '4', '1', 'เอกสารขอไอดีให้ลูกค้าใหม่มาครบแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('177', '4', '1', 'ส่งเอกสารขอไอดีไปแผนกขอไอดีแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('178', '4', '1', 'ไอดีลูกค้ามาแล้ว เลขที่ .......', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('179', '4', '1', 'เป็นลุกค้าเก่า/ใช้ไอดีเก่า', '1', '0', '1', '0000-00-00');
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
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('190', '4', '14', 'รับสินค้าสำเร็จ', '1', '0', '1', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('191', '4', '14', 'ตรวจสอบกับใบสั่งผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('192', '4', '14', 'มีคืนแพกแกตและอุปกรณ์ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('193', '4', '14', 'ไม่มีคืนแพกแกตและอุปกรณ์', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('194', '4', '14', 'ทำการ PACKING  ลงลัง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('195', '4', '14', 'แจ้งเซลพร้อมส่งวันที่...............', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('196', '4', '14', 'จัดส่งทางมือ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('197', '4', '14', 'จัดส่งโดยขนส่ง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('198', '4', '14', 'จัดส่งโดย ปณ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('447', '7', '1', 'ตรวจสอบบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('448', '7', '1', 'ส่งใบสั่งผลิตลงทุกแผนก', '3', '0', '0', '2017-03-15');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('449', '7', '1', 'เอกสารขอไอดีให้ลูกค้าใหม่มาครบแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('450', '7', '1', 'ส่งเอกสารขอไอดีไปแผนกขอไอดีแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('451', '7', '1', 'ไอดีลูกค้ามาแล้ว เลขที่ .......', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('452', '7', '1', 'เป็นลุกค้าเก่า/ใช้ไอดีเก่า', '1', '0', '1', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('453', '7', '2', 'รับแจ้งไอดีแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('454', '7', '2', 'รับเมล์ใบสั่งผลิตจากซัพพอตแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('455', '7', '2', 'รับรูปเพื่อ ขอ อย แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('456', '7', '2', 'รับสูตรจากฝ่ายผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('457', '7', '2', 'จดแจ้งแล้วได้เลข อย .....', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('458', '7', '2', 'ส่งใบ อย และสรรพคุณให้เซลแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('459', '7', '2', 'ส่ง BOOKLET เพื่อทำฉลากแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('460', '7', '2', 'PIF ดำเนินการแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('461', '7', '3', 'วางแผนผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('462', '7', '3', 'เบิกวัตถุดิบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('463', '7', '3', 'ผลิตแบต RD', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('464', '7', '3', 'ส่ง QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('465', '7', '3', 'ส่ง QA', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('466', '7', '3', 'ส่งลูกค้า ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('467', '7', '3', 'ส่ง BOSS ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('468', '7', '3', 'ลูกค้าตอบกลับ /ครั้งที่', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('469', '7', '3', 'ส่งสูตรการผลิตไป แผนก อย ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('470', '7', '3', 'ผลิตจริง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('471', '7', '3', 'ผลิตเสร็จแล้วส่งต่องานไปแผนกแบ่งบรรจุ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('472', '7', '4', 'วางแผนผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('473', '7', '4', 'เบิกวัตถุดิบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('474', '7', '4', 'ผลิตจริง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('475', '7', '4', 'ส่งสูตรการผลิตไป แผนก อย ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('476', '7', '4', 'ส่ง QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('477', '7', '4', 'ส่ง QA', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('478', '7', '4', 'ผลิตเสร็จแล้วส่งต่องานไปแผนกแบ่งบรรจุ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('479', '7', '5', 'เก็บเข้าสต๊อก', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('480', '7', '5', 'ทำป้ายชี้บ่งแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('481', '7', '5', 'คีย์เข้าระบบรับแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('482', '7', '6', 'รับมอบสินค้าสำเร็จรุปรอบรรจุแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('483', '7', '6', 'เบิกแพ็กเกตแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('484', '7', '6', 'ล้างทำความสะอาดแพกเกตแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('485', '7', '6', 'บรรจุลงในภาชนะแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('486', '7', '6', 'ทำโอนย้ายไปแผนกสติกเกอร์แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('487', '7', '6', 'ส่งคืนแพกเก็ตที่เหลือให้ QC แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('488', '7', '7', 'จัดซื้อแพกแกตแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('489', '7', '7', 'ส่งไปแผนกแบ่งบรรจุแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('490', '7', '8', 'ได้รับแพกเกตจากลูกค้าแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('491', '7', '8', 'แพกเกตครบตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('492', '7', '8', 'แพกเกตไม่ครบตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('493', '7', '8', 'รายงานแพ็กแกตให้เซลแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('494', '7', '8', 'ส่งไปแผนกแบ่งบรรจุแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('495', '7', '9', 'รับสินค้าที่แบ่งบรรจุถุกต้องครบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('496', '7', '9', 'รับสติ๊กเกอร์จากแผนกสติ๊กเกอร์แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('497', '7', '9', 'รับกล่องจากโรงพิมพ์แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('498', '7', '9', 'ติดฉลาก+ซีลลงในแพกแกตแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('499', '7', '9', 'โอนย้ายไปแผนก QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('500', '7', '10', 'ได้รับสติกเกอร์จากลูกค้าแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('501', '7', '10', 'สติกเกอร์  ครบ ตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('502', '7', '10', 'สติกเกอร์ ไม่ครบ ตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('503', '7', '10', 'กล่อง ครบ ตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('504', '7', '10', 'กล่องไม่ครบ ตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('505', '7', '10', 'รายงานสติกเกอร์ ให้เซลแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('506', '7', '10', 'รายงานกล่องให้เซลแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('507', '7', '10', 'ติดฉลาก+ซีลลงในแพกแกตแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('508', '7', '10', 'พับกล่อง+ซีลลงในแพกแกตแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('509', '7', '10', 'โอนย้ายสินค้าที่ติดฉลากไปแผนก QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('510', '7', '10', 'คืน สติกเกอร์ ไปแผนก QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('511', '7', '10', 'คืน กล่อง ไปแผนก QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('512', '7', '11', 'ได้รับ DIS จากลูกค้าแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('513', '7', '11', 'กำลังออกแบบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('514', '7', '11', 'ส่งแบบให้ลูกค้าอนุมัติ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('515', '7', '11', 'รอการอนุมัติ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('516', '7', '11', 'ลุกค้าอนุมัติ คอนเฟริ์มแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('517', '7', '11', 'ตรวจแบบ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('518', '7', '11', 'สั่งพิมพ์ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('519', '7', '12', 'ส่งแบบเดิมที่เปลี่ยนเลข LOT / วันที่ให้ลุกค้าอนุมัติ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('520', '7', '12', 'ส่งแบบให้ลูกค้าอนุมัติ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('521', '7', '12', 'รอการอนุมัติ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('522', '7', '12', 'ลุกค้าอนุมัติ คอนเฟริ์มให้พิมพ์ได้ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('523', '7', '12', 'สั่งพิมพ์ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('524', '7', '13', 'ลูกค้าส่งแบบมาให้บริษัทตรวจ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('525', '7', '13', 'กำลังตรวจสอบแบบที่ลุกค้าส่งมา ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('526', '7', '13', 'แบบถูกต้อง / แจ้งเซลให้แจ้งลุกค้าพิมพ์ได้เลย ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('527', '7', '13', 'แบบไม่ถูกต้อง / แจ้งเซลให้แจ้งลุกค้าแก้', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('528', '7', '14', 'รับสินค้าสำเร็จ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('529', '7', '14', 'ตรวจสอบกับใบสั่งผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('530', '7', '14', 'มีคืนแพกแกตและอุปกรณ์ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('531', '7', '14', 'ไม่มีคืนแพกแกตและอุปกรณ์', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('532', '7', '14', 'ทำการ PACKING  ลงลัง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('533', '7', '14', 'แจ้งเซลพร้อมส่งวันที่...............', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('534', '7', '14', 'จัดส่งทางมือ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('535', '7', '14', 'จัดส่งโดยขนส่ง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('536', '7', '14', 'จัดส่งโดย ปณ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('537', '7', '15', 'ตรวจเชื้อ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('538', '7', '15', 'ตรวจ สารปรอท', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('539', '7', '15', 'ตรวจสาร ไฮโดรควินโนน', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('540', '7', '15', 'ตรวจสาร PH', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('541', '7', '15', 'ส่งรายงานแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('542', '7', '15', 'ทำการวัดบ่ม STAYBILITY  ครั้งที่ 1', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('543', '7', '15', 'ทำการวัดบ่ม STAYBILITY  ครั้งที่ 2', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('544', '7', '16', 'เทสสินค้าก่อนส่งไปแผนกบรรจุ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('545', '7', '16', 'ส่งรายงานประจำวันครั้งที่  1', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('546', '7', '16', 'วัดค่า PH  / ที่เป็นบ่ม ครั้งที่ 1', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('547', '7', '16', 'ส่งรายงานประจำวันครั้งที่ 2', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('548', '7', '16', 'วัดค่า PH  / ที่เป็นบ่ม ครั้งที่ 2', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('549', '7', '16', 'บันทึกรายงานสรุปผล ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('550', '7', '16', 'เก็บ RETENSION SAMPLING แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('551', '7', '17', 'ทำใบเสนอราคาให้ลูกค้า', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('552', '7', '17', 'เช็ค แพกเกจ กับ ซัพพอต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('553', '7', '17', 'เช็คราคาเรทขั้นต่ำ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('554', '7', '17', 'เมื่อใบเสนอราคาถูกต้องแจ้งข้อมูลส่งเอกสาร', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('555', '7', '17', 'เช็คชื่อแบรนด์', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('556', '7', '17', 'ส่งข้อมูลเอกสารที่ต้องใช้', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('557', '7', '17', 'รอไอดีสั่งผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('558', '7', '17', 'ทำใบสั่งผลิตให้ตรวจ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('559', '7', '17', 'รอส่งต้นแบบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('560', '7', '17', 'ต้นแบบโอเคค่อยออกแบบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('561', '7', '17', 'รอกราฟฟิกออกแบบโลโก้', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('562', '7', '17', 'เมื่อ อย. ออก รอแบบฉลากหลังเพื่อยืนยันส่งพิมพ์', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('563', '7', '17', 'หากมีกล่อง รอยืนยันแบบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('564', '7', '17', 'รอบรู๊ทดิจิตอล และราคา', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('565', '7', '17', 'ยืนยันสั่งกล่อง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('566', '7', '17', 'รอพร้อมส่ง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('567', '7', '17', 'ตามยอดคงเหลือ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('568', '7', '17', 'ส่งใบ อย. ให้ลูกค้า', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('569', '7', '17', 'ส่งรูปถ่ายสินค้าให้ลูกค้า', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('570', '8', '1', 'ตรวจสอบบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('571', '8', '1', 'ส่งใบสั่งผลิตลงทุกแผนก', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('572', '8', '1', 'เอกสารขอไอดีให้ลูกค้าใหม่มาครบแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('573', '8', '1', 'ส่งเอกสารขอไอดีไปแผนกขอไอดีแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('574', '8', '1', 'ไอดีลูกค้ามาแล้ว เลขที่ .......', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('575', '8', '1', 'เป็นลุกค้าเก่า/ใช้ไอดีเก่า', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('576', '8', '2', 'รับแจ้งไอดีแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('577', '8', '2', 'รับเมล์ใบสั่งผลิตจากซัพพอตแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('578', '8', '2', 'รับรูปเพื่อ ขอ อย แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('579', '8', '2', 'รับสูตรจากฝ่ายผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('580', '8', '2', 'จดแจ้งแล้วได้เลข อย .....', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('581', '8', '2', 'ส่งใบ อย และสรรพคุณให้เซลแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('582', '8', '2', 'ส่ง BOOKLET เพื่อทำฉลากแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('583', '8', '2', 'PIF ดำเนินการแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('584', '8', '3', 'วางแผนผลิต เซรั่ม', '2', '0', '1', '2017-03-22');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('585', '8', '3', 'เบิกวัตถุดิบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('586', '8', '3', 'ผลิตแบต RD', '3', '0', '0', '2017-03-22');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('587', '8', '3', 'ส่ง QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('588', '8', '3', 'ส่ง QA', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('589', '8', '3', 'ส่งลูกค้า ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('590', '8', '3', 'ส่ง BOSS ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('591', '8', '3', 'ลูกค้าตอบกลับ /ครั้งที่', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('592', '8', '3', 'ส่งสูตรการผลิตไป แผนก อย ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('593', '8', '3', 'ผลิตจริง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('594', '8', '3', 'ผลิตเสร็จแล้วส่งต่องานไปแผนกแบ่งบรรจุ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('595', '8', '4', 'วางแผนผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('596', '8', '4', 'เบิกวัตถุดิบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('597', '8', '4', 'ผลิตจริง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('598', '8', '4', 'ส่งสูตรการผลิตไป แผนก อย ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('599', '8', '4', 'ส่ง QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('600', '8', '4', 'ส่ง QA', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('601', '8', '4', 'ผลิตเสร็จแล้วส่งต่องานไปแผนกแบ่งบรรจุ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('602', '8', '5', 'เก็บเข้าสต๊อก', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('603', '8', '5', 'ทำป้ายชี้บ่งแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('604', '8', '5', 'คีย์เข้าระบบรับแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('605', '8', '6', 'รับมอบสินค้าสำเร็จรุปรอบรรจุแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('606', '8', '6', 'เบิกแพ็กเกตแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('607', '8', '6', 'ล้างทำความสะอาดแพกเกตแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('608', '8', '6', 'บรรจุลงในภาชนะแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('609', '8', '6', 'ทำโอนย้ายไปแผนกสติกเกอร์แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('610', '8', '6', 'ส่งคืนแพกเก็ตที่เหลือให้ QC แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('611', '8', '7', 'จัดซื้อแพกแกตแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('612', '8', '7', 'ส่งไปแผนกแบ่งบรรจุแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('613', '8', '8', 'ได้รับแพกเกตจากลูกค้าแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('614', '8', '8', 'แพกเกตครบตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('615', '8', '8', 'แพกเกตไม่ครบตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('616', '8', '8', 'รายงานแพ็กแกตให้เซลแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('617', '8', '8', 'ส่งไปแผนกแบ่งบรรจุแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('618', '8', '9', 'รับสินค้าที่แบ่งบรรจุถุกต้องครบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('619', '8', '9', 'รับสติ๊กเกอร์จากแผนกสติ๊กเกอร์แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('620', '8', '9', 'รับกล่องจากโรงพิมพ์แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('621', '8', '9', 'ติดฉลาก+ซีลลงในแพกแกตแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('622', '8', '9', 'โอนย้ายไปแผนก QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('623', '8', '10', 'ได้รับสติกเกอร์จากลูกค้าแล้ว', '3', '0', '0', '2017-03-22');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('624', '8', '10', 'สติกเกอร์  ครบ ตามหน้าบิล', '3', '0', '0', '2017-03-22');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('625', '8', '10', 'สติกเกอร์ ไม่ครบ ตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('626', '8', '10', 'กล่อง ครบ ตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('627', '8', '10', 'กล่องไม่ครบ ตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('628', '8', '10', 'รายงานสติกเกอร์ ให้เซลแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('629', '8', '10', 'รายงานกล่องให้เซลแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('630', '8', '10', 'ติดฉลาก+ซีลลงในแพกแกตแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('631', '8', '10', 'พับกล่อง+ซีลลงในแพกแกตแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('632', '8', '10', 'โอนย้ายสินค้าที่ติดฉลากไปแผนก QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('633', '8', '10', 'คืน สติกเกอร์ ไปแผนก QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('634', '8', '10', 'คืน กล่อง ไปแผนก QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('635', '8', '11', 'ได้รับ DIS จากลูกค้าแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('636', '8', '11', 'กำลังออกแบบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('637', '8', '11', 'ส่งแบบให้ลูกค้าอนุมัติ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('638', '8', '11', 'รอการอนุมัติ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('639', '8', '11', 'ลุกค้าอนุมัติ คอนเฟริ์มแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('640', '8', '11', 'ตรวจแบบ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('641', '8', '11', 'สั่งพิมพ์ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('642', '8', '12', 'ส่งแบบเดิมที่เปลี่ยนเลข LOT / วันที่ให้ลุกค้าอนุมัติ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('643', '8', '12', 'ส่งแบบให้ลูกค้าอนุมัติ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('644', '8', '12', 'รอการอนุมัติ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('645', '8', '12', 'ลุกค้าอนุมัติ คอนเฟริ์มให้พิมพ์ได้ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('646', '8', '12', 'สั่งพิมพ์ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('647', '8', '13', 'ลูกค้าส่งแบบมาให้บริษัทตรวจ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('648', '8', '13', 'กำลังตรวจสอบแบบที่ลุกค้าส่งมา ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('649', '8', '13', 'แบบถูกต้อง / แจ้งเซลให้แจ้งลุกค้าพิมพ์ได้เลย ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('650', '8', '13', 'แบบไม่ถูกต้อง / แจ้งเซลให้แจ้งลุกค้าแก้', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('651', '8', '14', 'รับสินค้าสำเร็จ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('652', '8', '14', 'ตรวจสอบกับใบสั่งผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('653', '8', '14', 'มีคืนแพกแกตและอุปกรณ์ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('654', '8', '14', 'ไม่มีคืนแพกแกตและอุปกรณ์', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('655', '8', '14', 'ทำการ PACKING  ลงลัง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('656', '8', '14', 'แจ้งเซลพร้อมส่งวันที่...............', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('657', '8', '14', 'จัดส่งทางมือ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('658', '8', '14', 'จัดส่งโดยขนส่ง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('659', '8', '14', 'จัดส่งโดย ปณ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('660', '8', '15', 'ตรวจเชื้อ ', '1', '0', '1', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('661', '8', '15', 'ตรวจ สารปรอท', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('662', '8', '15', 'ตรวจสาร ไฮโดรควินโนน', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('663', '8', '15', 'ตรวจสาร PH', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('664', '8', '15', 'ส่งรายงานแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('665', '8', '15', 'ทำการวัดบ่ม STAYBILITY  ครั้งที่ 1', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('666', '8', '15', 'ทำการวัดบ่ม STAYBILITY  ครั้งที่ 2', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('667', '8', '16', 'เทสสินค้าก่อนส่งไปแผนกบรรจุ', '1', '0', '1', '2017-03-27');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('668', '8', '16', 'ส่งรายงานประจำวันครั้งที่  1', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('669', '8', '16', 'วัดค่า PH  / ที่เป็นบ่ม ครั้งที่ 1', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('670', '8', '16', 'ส่งรายงานประจำวันครั้งที่ 2', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('671', '8', '16', 'วัดค่า PH  / ที่เป็นบ่ม ครั้งที่ 2', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('672', '8', '16', 'บันทึกรายงานสรุปผล ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('673', '8', '16', 'เก็บ RETENSION SAMPLING แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('674', '8', '17', 'ทำใบเสนอราคาให้ลูกค้า', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('675', '8', '17', 'เช็ค แพกเกจ กับ ซัพพอต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('676', '8', '17', 'เช็คราคาเรทขั้นต่ำ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('677', '8', '17', 'เมื่อใบเสนอราคาถูกต้องแจ้งข้อมูลส่งเอกสาร', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('678', '8', '17', 'เช็คชื่อแบรนด์', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('679', '8', '17', 'ส่งข้อมูลเอกสารที่ต้องใช้', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('680', '8', '17', 'รอไอดีสั่งผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('681', '8', '17', 'ทำใบสั่งผลิตให้ตรวจ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('682', '8', '17', 'รอส่งต้นแบบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('683', '8', '17', 'ต้นแบบโอเคค่อยออกแบบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('684', '8', '17', 'รอกราฟฟิกออกแบบโลโก้', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('685', '8', '17', 'เมื่อ อย. ออก รอแบบฉลากหลังเพื่อยืนยันส่งพิมพ์', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('686', '8', '17', 'หากมีกล่อง รอยืนยันแบบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('687', '8', '17', 'รอบรู๊ทดิจิตอล และราคา', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('688', '8', '17', 'ยืนยันสั่งกล่อง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('689', '8', '17', 'รอพร้อมส่ง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('690', '8', '17', 'ตามยอดคงเหลือ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('691', '8', '17', 'ส่งใบ อย. ให้ลูกค้า', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('692', '8', '17', 'ส่งรูปถ่ายสินค้าให้ลูกค้า', '1', '0', '0', '0000-00-00');


#
# TABLE STRUCTURE FOR: tc_work_now_success
#

DROP TABLE IF EXISTS `tc_work_now_success`;

CREATE TABLE `tc_work_now_success` (
  `work_now_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `group_module_id` int(11) NOT NULL,
  `work_now_detail` varchar(255) NOT NULL,
  `work_now_status` int(2) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `work_now_dateend` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('1', '1', '1', 'ตรวจสอบบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('2', '1', '1', 'ส่งใบสั่งผลิตลงทุกแผนก', '3', '0', '0', '2017-03-09');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('3', '1', '1', 'เอกสารขอไอดีให้ลูกค้าใหม่มาครบแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('4', '1', '1', 'ส่งเอกสารขอไอดีไปแผนกขอไอดีแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('5', '1', '1', 'ไอดีลูกค้ามาแล้ว เลขที่ .......', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('6', '1', '1', 'เป็นลุกค้าเก่า/ใช้ไอดีเก่า', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('7', '1', '2', 'รับแจ้งไอดีแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('8', '1', '2', 'รับเมล์ใบสั่งผลิตจากซัพพอตแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('9', '1', '2', 'รับรูปเพื่อ ขอ อย แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('10', '1', '2', 'รับสูตรจากฝ่ายผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('11', '1', '2', 'จดแจ้งแล้วได้เลข อย .....', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('12', '1', '2', 'ส่งใบ อย และสรรพคุณให้เซลแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('13', '1', '2', 'ส่ง BOOKLET เพื่อทำฉลากแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('14', '1', '2', 'PIF ดำเนินการแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('15', '1', '3', 'วางแผนผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('16', '1', '3', 'เบิกวัตถุดิบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('17', '1', '3', 'ผลิตแบต RD', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('18', '1', '3', 'ส่ง QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('19', '1', '3', 'ส่ง QA', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('20', '1', '3', 'ส่งลูกค้า ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('21', '1', '3', 'ส่ง BOSS ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('22', '1', '3', 'ลูกค้าตอบกลับ /ครั้งที่', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('23', '1', '3', 'ส่งสูตรการผลิตไป แผนก อย ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('24', '1', '3', 'ผลิตจริง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('25', '1', '3', 'ผลิตเสร็จแล้วส่งต่องานไปแผนกแบ่งบรรจุ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('26', '1', '4', 'วางแผนผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('27', '1', '4', 'เบิกวัตถุดิบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('28', '1', '4', 'ผลิตจริง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('29', '1', '4', 'ส่งสูตรการผลิตไป แผนก อย ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('30', '1', '4', 'ส่ง QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('31', '1', '4', 'ส่ง QA', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('32', '1', '4', 'ผลิตเสร็จแล้วส่งต่องานไปแผนกแบ่งบรรจุ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('33', '1', '5', 'เก็บเข้าสต๊อก', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('34', '1', '5', 'ทำป้ายชี้บ่งแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('35', '1', '5', 'คีย์เข้าระบบรับแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('36', '1', '6', 'รับมอบสินค้าสำเร็จรุปรอบรรจุแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('37', '1', '6', 'เบิกแพ็กเกตแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('38', '1', '6', 'ล้างทำความสะอาดแพกเกตแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('39', '1', '6', 'บรรจุลงในภาชนะแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('40', '1', '6', 'ทำโอนย้ายไปแผนกสติกเกอร์แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('41', '1', '6', 'ส่งคืนแพกเก็ตที่เหลือให้ QC แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('42', '1', '7', 'จัดซื้อแพกแกตแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('43', '1', '7', 'ส่งไปแผนกแบ่งบรรจุแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('44', '1', '8', 'ได้รับแพกเกตจากลูกค้าแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('45', '1', '8', 'แพกเกตครบตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('46', '1', '8', 'แพกเกตไม่ครบตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('47', '1', '8', 'รายงานแพ็กแกตให้เซลแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('48', '1', '8', 'ส่งไปแผนกแบ่งบรรจุแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('49', '1', '9', 'รับสินค้าที่แบ่งบรรจุถุกต้องครบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('50', '1', '9', 'รับสติ๊กเกอร์จากแผนกสติ๊กเกอร์แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('51', '1', '9', 'รับกล่องจากโรงพิมพ์แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('52', '1', '9', 'ติดฉลาก+ซีลลงในแพกแกตแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('53', '1', '9', 'โอนย้ายไปแผนก QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('54', '1', '10', 'ได้รับสติกเกอร์จากลูกค้าแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('55', '1', '10', 'สติกเกอร์  ครบ ตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('56', '1', '10', 'สติกเกอร์ ไม่ครบ ตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('57', '1', '10', 'กล่อง ครบ ตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('58', '1', '10', 'กล่องไม่ครบ ตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('59', '1', '10', 'รายงานสติกเกอร์ ให้เซลแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('60', '1', '10', 'รายงานกล่องให้เซลแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('61', '1', '10', 'ติดฉลาก+ซีลลงในแพกแกตแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('62', '1', '10', 'พับกล่อง+ซีลลงในแพกแกตแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('63', '1', '10', 'โอนย้ายสินค้าที่ติดฉลากไปแผนก QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('64', '1', '10', 'คืน สติกเกอร์ ไปแผนก QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('65', '1', '10', 'คืน กล่อง ไปแผนก QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('66', '1', '11', 'ได้รับ DIS จากลูกค้าแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('67', '1', '11', 'กำลังออกแบบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('68', '1', '11', 'ส่งแบบให้ลูกค้าอนุมัติ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('69', '1', '11', 'รอการอนุมัติ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('70', '1', '11', 'ลุกค้าอนุมัติ คอนเฟริ์มแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('71', '1', '11', 'ตรวจแบบ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('72', '1', '11', 'สั่งพิมพ์ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('73', '1', '12', 'ส่งแบบเดิมที่เปลี่ยนเลข LOT / วันที่ให้ลุกค้าอนุมัติ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('74', '1', '12', 'ส่งแบบให้ลูกค้าอนุมัติ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('75', '1', '12', 'รอการอนุมัติ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('76', '1', '12', 'ลุกค้าอนุมัติ คอนเฟริ์มให้พิมพ์ได้ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('77', '1', '12', 'สั่งพิมพ์ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('78', '1', '13', 'ลูกค้าส่งแบบมาให้บริษัทตรวจ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('79', '1', '13', 'กำลังตรวจสอบแบบที่ลุกค้าส่งมา ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('80', '1', '13', 'แบบถูกต้อง / แจ้งเซลให้แจ้งลุกค้าพิมพ์ได้เลย ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('81', '1', '13', 'แบบไม่ถูกต้อง / แจ้งเซลให้แจ้งลุกค้าแก้', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('82', '1', '14', 'รับสินค้าสำเร็จ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('83', '1', '14', 'ตรวจสอบกับใบสั่งผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('84', '1', '14', 'มีคืนแพกแกตและอุปกรณ์ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('85', '1', '14', 'ไม่มีคืนแพกแกตและอุปกรณ์', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('86', '1', '14', 'ทำการ PACKING  ลงลัง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('87', '1', '14', 'แจ้งเซลพร้อมส่งวันที่...............', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('88', '1', '14', 'จัดส่งทางมือ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('89', '1', '14', 'จัดส่งโดยขนส่ง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('90', '1', '14', 'จัดส่งโดย ปณ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('91', '1', '15', 'ตรวจเชื้อ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('92', '1', '15', 'ตรวจ สารปรอท', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('93', '1', '15', 'ตรวจสาร ไฮโดรควินโนน', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('94', '1', '15', 'ตรวจสาร PH', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('95', '1', '15', 'ส่งรายงานแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('96', '1', '15', 'ทำการวัดบ่ม STAYBILITY  ครั้งที่ 1', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('97', '1', '15', 'ทำการวัดบ่ม STAYBILITY  ครั้งที่ 2', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('98', '1', '16', 'เทสสินค้าก่อนส่งไปแผนกบรรจุ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('99', '1', '16', 'ส่งรายงานประจำวันครั้งที่  1', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('100', '1', '16', 'วัดค่า PH  / ที่เป็นบ่ม ครั้งที่ 1', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('101', '1', '16', 'ส่งรายงานประจำวันครั้งที่ 2', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('102', '1', '16', 'วัดค่า PH  / ที่เป็นบ่ม ครั้งที่ 2', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('103', '1', '16', 'บันทึกรายงานสรุปผล ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('104', '1', '16', 'เก็บ RETENSION SAMPLING แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('105', '1', '17', 'ทำใบเสนอราคาให้ลูกค้า', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('106', '1', '17', 'เช็ค แพกเกจ กับ ซัพพอต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('107', '1', '17', 'เช็คราคาเรทขั้นต่ำ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('108', '1', '17', 'เมื่อใบเสนอราคาถูกต้องแจ้งข้อมูลส่งเอกสาร', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('109', '1', '17', 'เช็คชื่อแบรนด์', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('110', '1', '17', 'ส่งข้อมูลเอกสารที่ต้องใช้', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('111', '1', '17', 'รอไอดีสั่งผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('112', '1', '17', 'ทำใบสั่งผลิตให้ตรวจ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('113', '1', '17', 'รอส่งต้นแบบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('114', '1', '17', 'ต้นแบบโอเคค่อยออกแบบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('115', '1', '17', 'รอกราฟฟิกออกแบบโลโก้', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('116', '1', '17', 'เมื่อ อย. ออก รอแบบฉลากหลังเพื่อยืนยันส่งพิมพ์', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('117', '1', '17', 'หากมีกล่อง รอยืนยันแบบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('118', '1', '17', 'รอบรู๊ทดิจิตอล และราคา', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('119', '1', '17', 'ยืนยันสั่งกล่อง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('120', '1', '17', 'รอพร้อมส่ง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('121', '1', '17', 'ตามยอดคงเหลือ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('122', '1', '17', 'ส่งใบ อย. ให้ลูกค้า', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now_success` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('123', '1', '17', 'ส่งรูปถ่ายสินค้าให้ลูกค้า', '1', '0', '0', '0000-00-00');


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


