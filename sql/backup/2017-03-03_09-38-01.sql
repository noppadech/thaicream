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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

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

INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('1', '127.0.0.1', 'webmaster', '$2y$08$/X5gzWjesYi78GqeAv5tA.dVGBVP7C1e1PzqnYCVe5s1qhlDIPPES', NULL, 'test@mail.com', NULL, NULL, NULL, NULL, '1451900190', '1488504163', '1', 'Webmaster', 'test', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('2', '127.0.0.1', 'admin', '$2y$08$7Bkco6JXtC3Hu6g9ngLZDuHsFLvT7cyAxiz1FzxlX5vwccvRT7nKW', NULL, NULL, NULL, NULL, NULL, NULL, '1451900228', '1451903990', '0', 'Admin', '', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('3', '127.0.0.1', 'manager', '$2y$08$snzIJdFXvg/rSHe0SndIAuvZyjktkjUxBXkrrGdkPy1K6r5r/dMLa', NULL, NULL, NULL, NULL, NULL, NULL, '1451900430', NULL, '1', 'Manager', '', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('4', '127.0.0.1', 'staff', '$2y$08$NigAXjN23CRKllqe3KmjYuWXD5iSRPY812SijlhGeKfkrMKde9da6', NULL, NULL, NULL, NULL, NULL, NULL, '1451900439', NULL, '1', 'Staff', '', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('5', '::1', 'mans1800', '$2y$08$sYJQBACqMLH983PqyiAPXe0I2pKANNP8n5z5AQCGFLdxWSiB06zE2', NULL, 'test@mail.com', NULL, NULL, NULL, NULL, '1483603801', '1488355008', '1', 'Apirat', 'Pakakaew', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('6', '::1', 'mans1900', '$2y$08$3bzbmRVk1jcVzFl8GXvAw.GxtYU4YJtn5nEHdrItkhMrom53JXoKC', NULL, 'test@mail.com', NULL, NULL, NULL, NULL, '1483603891', '1488355063', '1', 'Apirat', 'Pakakaew', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('7', '::1', 'mans1700', '$2y$08$YuSc2EaRrmMNlGx2drwZ7ubRBDnHxZuBLay0i3PW97pS0VegNONiK', NULL, 'test@mail.com', NULL, NULL, NULL, NULL, '1483603909', '1488354833', '1', 'Apirat', 'Pakakaew', '');
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

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
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('57', '1', '2');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('58', '1', '3');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('59', '1', '4');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('61', '7', '4');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('62', '5', '2');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('63', '6', '3');


#
# TABLE STRUCTURE FOR: admin_users_groups_module
#

DROP TABLE IF EXISTS `admin_users_groups_module`;

CREATE TABLE `admin_users_groups_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('28', '14', '4');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('29', '14', '6');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('30', '14', '7');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('31', '14', '10');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('102', '13', '1');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('103', '13', '2');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('104', '13', '8');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('105', '13', '11');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('106', '13', '15');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('107', '1', '1');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('108', '1', '2');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('109', '1', '3');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('110', '1', '4');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('111', '1', '5');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('112', '1', '6');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('113', '1', '7');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('114', '1', '8');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('115', '1', '9');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('116', '1', '10');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('117', '1', '11');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('118', '1', '12');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('119', '1', '13');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('120', '1', '14');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('121', '1', '15');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('122', '1', '16');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('123', '7', '1');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('124', '5', '1');
INSERT INTO `admin_users_groups_module` (`id`, `user_id`, `group_id`) VALUES ('125', '6', '1');


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

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('kjg651nt9mqdlj83sqdjdalk3cfboe7v', '192.168.1.10', '1488523482', '__ci_last_regenerate|i:1488523182;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1488450493\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:16:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('iprncflfsqcpvgr6k15o5g9l37q74r9h', '192.168.1.10', '1488523183', '__ci_last_regenerate|i:1488523183;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('schrepek5o7f17sjl92dao7rj9h23b2v', '192.168.1.10', '1488523183', '__ci_last_regenerate|i:1488523183;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('54o773mnpes8vhhod6cecj986b89ops1', '192.168.1.10', '1488523183', '__ci_last_regenerate|i:1488523183;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('r0avesfv74fg7nvo8voq3jds3pok2mv8', '192.168.1.10', '1488523183', '__ci_last_regenerate|i:1488523183;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('uifc6f0lao7b63br4reio17pr6homar3', '192.168.1.10', '1488523183', '__ci_last_regenerate|i:1488523183;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('dqh8o0dd85h2471467ss34q9mne7dt3t', '192.168.1.10', '1488523183', '__ci_last_regenerate|i:1488523183;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('7nods1nmabjcfefjr88neqp9c1q61nur', '192.168.1.10', '1488523483', '__ci_last_regenerate|i:1488523183;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('l1v6u5a72afa55v3i9s08dn28qgb19mi', '192.168.1.10', '1488523657', '__ci_last_regenerate|i:1488523486;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1488450493\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:16:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('9cm1voevqbu0plrd9163r68bo5gcjdej', '192.168.1.10', '1488523486', '__ci_last_regenerate|i:1488523486;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('jm2goh7c0qg3kr0tu2j4tjknhaujbvig', '192.168.1.10', '1488523486', '__ci_last_regenerate|i:1488523486;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('lr8jmjqnrischkfsfvphrc4t34q8o8uh', '192.168.1.10', '1488523486', '__ci_last_regenerate|i:1488523486;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('16ijbv91rvtk8r9kl9sapdv93pd4hhu5', '192.168.1.10', '1488523486', '__ci_last_regenerate|i:1488523486;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('dkbqe8oe8llfp733jabshigb7eb4u035', '192.168.1.10', '1488523486', '__ci_last_regenerate|i:1488523486;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('bin450at1f3r2li6jljsjgkk5de34rqs', '192.168.1.10', '1488523486', '__ci_last_regenerate|i:1488523486;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('643l818ksqafrhbq5bnjr27dpqbh65et', '192.168.1.10', '1488523658', '__ci_last_regenerate|i:1488523486;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('bpvg8ij5hp2kg86a0ta9f5g6hk62a2fi', '192.168.1.10', '1488524532', '__ci_last_regenerate|i:1488524237;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1488450493\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:16:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('o3u8aaigdkaehji1335fn8iu8hi3lmic', '192.168.1.10', '1488524237', '__ci_last_regenerate|i:1488524237;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('8qiflbu8aclgkro499q02120itlqehn5', '192.168.1.10', '1488524237', '__ci_last_regenerate|i:1488524237;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('931767lcmqbcsfdv3r5ve4t64r9vpihf', '192.168.1.10', '1488524238', '__ci_last_regenerate|i:1488524237;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('glr7nm36ojdjoersncgu74v8u0q1fajb', '192.168.1.10', '1488524238', '__ci_last_regenerate|i:1488524238;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('n392ph020rd85qodevr4budo70g7u0op', '192.168.1.10', '1488524238', '__ci_last_regenerate|i:1488524238;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('csrgnns4c4fqmfbho4qbf4firjqb43d6', '192.168.1.10', '1488524238', '__ci_last_regenerate|i:1488524238;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ailfnldg7hhvhveoa9tiddkjshsusn8p', '192.168.1.10', '1488524532', '__ci_last_regenerate|i:1488524238;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('bl25sprsohvc2pd49cnnmntafs78b7u3', '192.168.1.10', '1488524901', '__ci_last_regenerate|i:1488524613;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1488450493\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:16:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('r1lln7hetaoichc64qe2oe5t1li294pe', '192.168.1.10', '1488524616', '__ci_last_regenerate|i:1488524616;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('5hb6706e7uchpu8igfis8egc7bhmlm8n', '192.168.1.10', '1488524901', '__ci_last_regenerate|i:1488524616;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('sp8pehp2k5ipl0jl7ok3iinuh94k2le0', '192.168.1.10', '1488525049', '__ci_last_regenerate|i:1488524925;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1488450493\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:16:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('dfgr4mml76hrc44mbgejmjavdmk0abh1', '192.168.1.10', '1488524925', '__ci_last_regenerate|i:1488524925;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('br6q6587od83tsghc8ei7v86qf2o9cs7', '192.168.1.10', '1488524925', '__ci_last_regenerate|i:1488524925;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('1sk023t0238vep2444gj0u45sdq3g8hf', '192.168.1.10', '1488524925', '__ci_last_regenerate|i:1488524925;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('satt6o4d2d9h334ddockt94hbp7dqd8h', '192.168.1.10', '1488524925', '__ci_last_regenerate|i:1488524925;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('e3m4r8jiuq003fi2a63qghb3ttofhpn7', '192.168.1.10', '1488524925', '__ci_last_regenerate|i:1488524925;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('opruioldgvt9camipqocml8d9lmn7pfe', '192.168.1.10', '1488524925', '__ci_last_regenerate|i:1488524925;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('v5srumq8ma4itv8nfl1911flfra5lb0g', '192.168.1.10', '1488525049', '__ci_last_regenerate|i:1488524925;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('1foat5lifuvjb3k98cdd002ua9a5hd3a', '192.168.1.10', '1488526964', '__ci_last_regenerate|i:1488526747;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1488450493\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:16:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('jodvj8c7dvmj9dqki8s2hhc82nau6dcp', '192.168.1.10', '1488526747', '__ci_last_regenerate|i:1488526747;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('1u005nlh91v19bagvo2jvqbd3ph39kuo', '192.168.1.10', '1488526747', '__ci_last_regenerate|i:1488526747;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('fqhuijfasvbr34kg0i5g652rmb28fui2', '192.168.1.10', '1488526747', '__ci_last_regenerate|i:1488526747;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('seaol6fj312auijtgbr32k8br2orunto', '192.168.1.10', '1488526747', '__ci_last_regenerate|i:1488526747;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('elueag1n76v53rhnd3v137h4cas6a0sa', '192.168.1.10', '1488526747', '__ci_last_regenerate|i:1488526747;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('fvq30o1a477ms7k7jrglcak4u00n4afu', '192.168.1.10', '1488526747', '__ci_last_regenerate|i:1488526747;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('6t47fe1pigdshm9kh79b6kqce6g995i5', '192.168.1.10', '1488526964', '__ci_last_regenerate|i:1488526747;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('djgl0qmlm8i5ut985e14hb2ul6s3l055', '192.168.1.10', '1488527340', '__ci_last_regenerate|i:1488527180;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1488450493\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:16:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('9t7mtp3m4nde8bf21t8c7vdt0h19btg5', '192.168.1.10', '1488527180', '__ci_last_regenerate|i:1488527180;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ee16dgmm77p93kdh65k4a5v40vssvth3', '192.168.1.10', '1488527180', '__ci_last_regenerate|i:1488527180;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('7g8eep91i74ks6j258p903ddooceq3b6', '192.168.1.10', '1488527180', '__ci_last_regenerate|i:1488527180;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('12v1f0nnbs1e2dcfk55oa3sp2u3b215v', '192.168.1.10', '1488527180', '__ci_last_regenerate|i:1488527180;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('oqf0oc4fhgpvndfi0mktdv7igfca454n', '192.168.1.10', '1488527180', '__ci_last_regenerate|i:1488527180;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('oki7pfg4g9d32r2e559higvqe889kvr8', '192.168.1.10', '1488527180', '__ci_last_regenerate|i:1488527180;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('dreja4gkh02gut6uf2na5r32o0b40acp', '192.168.1.10', '1488527340', '__ci_last_regenerate|i:1488527180;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('13q3ehh3un6uj4vp7a4g71c857hj0mrb', '192.168.1.10', '1488527754', '__ci_last_regenerate|i:1488527524;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1488450493\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:16:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('s64uauvukru665f5t4nonr4i3g3auk2j', '192.168.1.10', '1488527524', '__ci_last_regenerate|i:1488527524;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('lt89uqjsbr8rnrutsgqfucbb1i8qrbue', '192.168.1.10', '1488527524', '__ci_last_regenerate|i:1488527524;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('2oisuc26fb6alnie7ifntr6fj00rt40j', '192.168.1.10', '1488527524', '__ci_last_regenerate|i:1488527524;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('jegk4bhjhhkq1ea9tlqq7uftc1c4do9k', '192.168.1.10', '1488527524', '__ci_last_regenerate|i:1488527524;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('pjcbk56jngp80jj5hr440e131l70fsp6', '192.168.1.10', '1488527524', '__ci_last_regenerate|i:1488527524;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('cdluu1t0ujim28l232ssb8jj9nhl6q6f', '192.168.1.10', '1488527524', '__ci_last_regenerate|i:1488527524;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('87lfjevrv57nd6b05bp2hpeevth94mr4', '192.168.1.10', '1488527754', '__ci_last_regenerate|i:1488527524;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('gn7mnk0ujgs5uil847eu9qgtpgdss4ia', '192.168.1.10', '1488528110', '__ci_last_regenerate|i:1488527848;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1488450493\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:16:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('o0foervpoapqri0lh91plptm07cqsnni', '192.168.1.10', '1488527863', '__ci_last_regenerate|i:1488527863;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('5rfe5jvbl3jmlhdonlhgtvhk85p96ukj', '192.168.1.10', '1488527863', '__ci_last_regenerate|i:1488527863;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('9iptnscl4jg7ebhhfdh3f83ofrmdkrbh', '192.168.1.10', '1488527863', '__ci_last_regenerate|i:1488527863;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('lembk3ellf4s9fiim8tj8so6tqalgr1j', '192.168.1.10', '1488527863', '__ci_last_regenerate|i:1488527863;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('mq41famoib1ugooq8hfivbglot9r8hb6', '192.168.1.10', '1488527863', '__ci_last_regenerate|i:1488527863;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('4e80vde8pdb808b9as98h6fe68o6okkv', '192.168.1.10', '1488527863', '__ci_last_regenerate|i:1488527863;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('av72qrcs1lfthl6ff365nl3t933fn2t3', '192.168.1.10', '1488528110', '__ci_last_regenerate|i:1488527863;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('lvhb3po3g2edmltl9br2e7eerkim973e', '192.168.1.10', '1488528414', '__ci_last_regenerate|i:1488528169;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1488450493\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:16:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('2v0u4a9ij4g15hblo14ur7n0ik0te8h0', '192.168.1.10', '1488528169', '__ci_last_regenerate|i:1488528169;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('km1c3qomv0h9gviitjki9bmn4m9gfqfb', '192.168.1.10', '1488528169', '__ci_last_regenerate|i:1488528169;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('54nfuddvuv8fn5eqjk3g4ego43o04oal', '192.168.1.10', '1488528169', '__ci_last_regenerate|i:1488528169;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('o79ffata17n1eioch193rls1tnthp48p', '192.168.1.10', '1488528169', '__ci_last_regenerate|i:1488528169;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('9c8ou5iim0s5n2k0tpuusrjvnmknmf3u', '192.168.1.10', '1488528169', '__ci_last_regenerate|i:1488528169;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('a3hphvu6ck45roac319mm1skho0v3tkd', '192.168.1.10', '1488528169', '__ci_last_regenerate|i:1488528169;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('1tam9nupvr6sopejcnv9nu2qg8o026bq', '192.168.1.10', '1488528415', '__ci_last_regenerate|i:1488528169;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('3u056j3e4qakoploqigae484acuh2ctj', '192.168.1.10', '1488528690', '__ci_last_regenerate|i:1488528482;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1488450493\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:16:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('atb3l4dcvb8npccneas4d8l5m7503tpq', '192.168.1.10', '1488528482', '__ci_last_regenerate|i:1488528482;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('tsn20bf50mfb3l8g4v61oljksi79jp29', '192.168.1.10', '1488528482', '__ci_last_regenerate|i:1488528482;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('qlt909rd509lbc31251jgkf8ve3l36h2', '192.168.1.10', '1488528482', '__ci_last_regenerate|i:1488528482;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('rt122601ap5i78pdpirvugv1m6neoi1i', '192.168.1.10', '1488528482', '__ci_last_regenerate|i:1488528482;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('qu6vvg0ds09fqhgqifvu082koch4qtqc', '192.168.1.10', '1488528482', '__ci_last_regenerate|i:1488528482;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('fam3fgfu8fbu41ggov7vrvumf693obkc', '192.168.1.10', '1488528482', '__ci_last_regenerate|i:1488528482;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('4psaoa0pvqhtb5mqbooioi1p9m67bhnn', '192.168.1.10', '1488528690', '__ci_last_regenerate|i:1488528482;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('pp2qg5idtfvm3vgotrkdf0g7eg890ka3', '192.168.1.10', '1488529208', '__ci_last_regenerate|i:1488528924;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1488450493\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:16:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('i5a02qn5riva6a2japl18hv8igq8p3s7', '192.168.1.10', '1488528924', '__ci_last_regenerate|i:1488528924;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('uumctss86pjdq41c0ans6lb4re8uui9d', '192.168.1.10', '1488528924', '__ci_last_regenerate|i:1488528924;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('nam4ml1ov7oe3754ofcc7bgtp7q57ri5', '192.168.1.10', '1488528925', '__ci_last_regenerate|i:1488528924;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('7a9k2jr7c8am41pdpl12ofc6tm1p71tc', '192.168.1.10', '1488528925', '__ci_last_regenerate|i:1488528925;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('3jk9snh5oq3b5c7ht6q7k6rif2gf9l3b', '192.168.1.10', '1488528925', '__ci_last_regenerate|i:1488528925;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('i7m7iuq8u6spec4fab9rqdcbn1u0sqf8', '192.168.1.10', '1488528925', '__ci_last_regenerate|i:1488528925;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('0dk515tulfus17m75as43l60fd4l36a2', '192.168.1.10', '1488529208', '__ci_last_regenerate|i:1488528925;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('24dod2isk0srbsp93lu4q3bvhuvlu65d', '192.168.1.10', '1488529674', '__ci_last_regenerate|i:1488529310;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1488450493\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:16:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('8om70pud60kmvnspo2l67vom227i93fc', '192.168.1.10', '1488529311', '__ci_last_regenerate|i:1488529311;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('543o9qhqafn4v7481s9s74pak6jtj7jl', '192.168.1.10', '1488529311', '__ci_last_regenerate|i:1488529311;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('5bcf8hf31vkjf0c7qlrt9uur3cn8kuqu', '192.168.1.10', '1488529311', '__ci_last_regenerate|i:1488529311;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('cnh2e58pc4fsqqf5hmbq8t5ls40ckjci', '192.168.1.10', '1488529311', '__ci_last_regenerate|i:1488529311;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('0sn20fuq77g6g2j9m08qlsefg2k9jidq', '192.168.1.10', '1488529311', '__ci_last_regenerate|i:1488529311;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('2ftj7vc1rkkbpqcg1u8ghnav4k563fr5', '192.168.1.10', '1488529311', '__ci_last_regenerate|i:1488529311;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('81o2cn82oqn3h39srrdf18teskusvhbf', '192.168.1.10', '1488529607', '__ci_last_regenerate|i:1488529311;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('7c7kptl88mfiegu92k9f26qsjg776pdr', '192.168.1.10', '1488529982', '__ci_last_regenerate|i:1488529693;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1488450493\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:16:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('id4ksmn9ipnpea7mrs1g6n76ad4afbfu', '192.168.1.10', '1488529693', '__ci_last_regenerate|i:1488529693;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('f8phquaotp3b4008e22tr5hloi2saosj', '192.168.1.10', '1488529693', '__ci_last_regenerate|i:1488529693;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('j64cps95kcp610h4j2apug12vcm1ood1', '192.168.1.10', '1488529693', '__ci_last_regenerate|i:1488529693;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('o1ilqobvb3flhslnpt85lkd1o2oj8g92', '192.168.1.10', '1488529693', '__ci_last_regenerate|i:1488529693;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ccunq0q0ti7qbjcfdnplhs715ftvv9fj', '192.168.1.10', '1488529694', '__ci_last_regenerate|i:1488529693;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('00kqtuitk2r9ia1hb61if8ph86rn6f2t', '192.168.1.10', '1488529694', '__ci_last_regenerate|i:1488529694;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('lg6go5algub9v3qtfemqtgccv5m7lo8v', '192.168.1.10', '1488529983', '__ci_last_regenerate|i:1488529694;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('to516tse5utqc1e8n53mlpsr1vvdbstp', '192.168.1.10', '1488530273', '__ci_last_regenerate|i:1488530179;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1488450493\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:16:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('fojjmnivtfhek8l69vivhk9s04mhjk2l', '192.168.1.10', '1488530179', '__ci_last_regenerate|i:1488530179;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('moe0v60s7j1ik4p9u8ss6oph813kenuo', '192.168.1.10', '1488530273', '__ci_last_regenerate|i:1488530179;');


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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO `tc_commentorder` (`comment_id`, `order_id`, `admin_id`, `detail`, `comment_date`) VALUES ('4', '8', '1', 'comment\n', '2017-03-02 16:41:27');
INSERT INTO `tc_commentorder` (`comment_id`, `order_id`, `admin_id`, `detail`, `comment_date`) VALUES ('5', '8', '1', 'comment บิลนี้รอ อย.', '2017-03-02 16:45:23');


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
  `admin_id` int(11) NOT NULL,
  `order_date` date NOT NULL DEFAULT '0000-00-00',
  `order_date_end` date NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO `tc_order` (`order_id`, `code_id`, `name_order`, `name_customer`, `status`, `admin_id`, `order_date`, `order_date_end`) VALUES ('8', 'TC-1501', 'ครีมผงทองคำ', 'คุณธิติยา', '1', '1', '2017-03-02', '0000-00-00');


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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

INSERT INTO `tc_work_comment` (`work_comment_id`, `work_now_id`, `admin_id`, `work_comment_detail`, `comment_date`) VALUES ('12', '1', '1', 'test', '2017-03-02 07:50:57');
INSERT INTO `tc_work_comment` (`work_comment_id`, `work_now_id`, `admin_id`, `work_comment_detail`, `comment_date`) VALUES ('18', '2', '1', 'test', '2017-03-02 07:54:50');


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
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('1', '8', '1', 'ตรวจสอบบิล', '3', '0', '0', '2017-03-03');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('2', '8', '1', 'ส่งใบสั่งผลิตลงทุกแผนก', '3', '0', '0', '2017-03-03');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('3', '8', '1', 'เอกสารขอไอดีให้ลูกค้าใหม่มาครบแล้ว', '3', '0', '0', '2017-03-03');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('4', '8', '1', 'ส่งเอกสารขอไอดีไปแผนกขอไอดีแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('5', '8', '1', 'ไอดีลูกค้ามาแล้ว เลขที่ .......', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('6', '8', '1', 'เป็นลุกค้าเก่า/ใช้ไอดีเก่า', '1', '0', '1', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('7', '8', '2', 'รับแจ้งไอดีแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('8', '8', '2', 'รับเมล์ใบสั่งผลิตจากซัพพอตแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('9', '8', '2', 'รับรูปเพื่อ ขอ อย แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('10', '8', '2', 'รับสูตรจากฝ่ายผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('11', '8', '2', 'จดแจ้งแล้วได้เลข อย .....', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('12', '8', '2', 'ส่งใบ อย และสรรพคุณให้เซลแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('13', '8', '2', 'ส่ง BOOKLET เพื่อทำฉลากแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('14', '8', '2', 'PIF ดำเนินการแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('15', '8', '3', 'วางแผนผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('16', '8', '3', 'เบิกวัตถุดิบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('17', '8', '3', 'ผลิตแบต RD', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('18', '8', '3', 'ส่ง QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('19', '8', '3', 'ส่ง QA', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('20', '8', '3', 'ส่งลูกค้า ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('21', '8', '3', 'ส่ง BOSS ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('22', '8', '3', 'ลูกค้าตอบกลับ /ครั้งที่', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('23', '8', '3', 'ส่งสูตรการผลิตไป แผนก อย ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('24', '8', '3', 'ผลิตจริง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('25', '8', '3', 'ผลิตเสร็จแล้วส่งต่องานไปแผนกแบ่งบรรจุ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('26', '8', '4', 'วางแผนผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('27', '8', '4', 'เบิกวัตถุดิบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('28', '8', '4', 'ผลิตจริง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('29', '8', '4', 'ส่งสูตรการผลิตไป แผนก อย ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('30', '8', '4', 'ส่ง QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('31', '8', '4', 'ส่ง QA', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('32', '8', '4', 'ผลิตเสร็จแล้วส่งต่องานไปแผนกแบ่งบรรจุ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('33', '8', '5', 'เก็บเข้าสต๊อก', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('34', '8', '5', 'ทำป้ายชี้บ่งแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('35', '8', '5', 'คีย์เข้าระบบรับแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('36', '8', '6', 'รับมอบสินค้าสำเร็จรุปรอบรรจุแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('37', '8', '6', 'เบิกแพ็กเกตแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('38', '8', '6', 'ล้างทำความสะอาดแพกเกตแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('39', '8', '6', 'บรรจุลงในภาชนะแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('40', '8', '6', 'ทำโอนย้ายไปแผนกสติกเกอร์แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('41', '8', '6', 'ส่งคืนแพกเก็ตที่เหลือให้ QC แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('42', '8', '7', 'จัดซื้อแพกแกตแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('43', '8', '7', 'ส่งไปแผนกแบ่งบรรจุแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('44', '8', '8', 'ได้รับแพกเกตจากลูกค้าแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('45', '8', '8', 'แพกเกตครบตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('46', '8', '8', 'แพกเกตไม่ครบตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('47', '8', '8', 'รายงานแพ็กแกตให้เซลแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('48', '8', '8', 'ส่งไปแผนกแบ่งบรรจุแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('49', '8', '9', 'รับสินค้าที่แบ่งบรรจุถุกต้องครบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('50', '8', '9', 'รับสติ๊กเกอร์จากแผนกสติ๊กเกอร์แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('51', '8', '9', 'รับกล่องจากโรงพิมพ์แล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('52', '8', '9', 'ติดฉลาก+ซีลลงในแพกแกตแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('53', '8', '9', 'โอนย้ายไปแผนก QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('54', '8', '10', 'ได้รับสติกเกอร์จากลูกค้าแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('55', '8', '10', 'สติกเกอร์  ครบ ตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('56', '8', '10', 'สติกเกอร์ ไม่ครบ ตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('57', '8', '10', 'กล่อง ครบ ตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('58', '8', '10', 'กล่องไม่ครบ ตามหน้าบิล', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('59', '8', '10', 'รายงานสติกเกอร์ ให้เซลแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('60', '8', '10', 'รายงานกล่องให้เซลแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('61', '8', '10', 'ติดฉลาก+ซีลลงในแพกแกตแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('62', '8', '10', 'พับกล่อง+ซีลลงในแพกแกตแล้ว', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('63', '8', '10', 'โอนย้ายสินค้าที่ติดฉลากไปแผนก QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('64', '8', '10', 'คืน สติกเกอร์ ไปแผนก QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('65', '8', '10', 'คืน กล่อง ไปแผนก QC', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('66', '8', '11', 'ได้รับ DIS จากลูกค้าแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('67', '8', '11', 'กำลังออกแบบ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('68', '8', '11', 'ส่งแบบให้ลูกค้าอนุมัติ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('69', '8', '11', 'รอการอนุมัติ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('70', '8', '11', 'ลุกค้าอนุมัติ คอนเฟริ์มแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('71', '8', '11', 'ตรวจแบบ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('72', '8', '11', 'สั่งพิมพ์ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('73', '8', '12', 'ส่งแบบเดิมที่เปลี่ยนเลข LOT / วันที่ให้ลุกค้าอนุมัติ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('74', '8', '12', 'ส่งแบบให้ลูกค้าอนุมัติ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('75', '8', '12', 'รอการอนุมัติ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('76', '8', '12', 'ลุกค้าอนุมัติ คอนเฟริ์มให้พิมพ์ได้ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('77', '8', '12', 'สั่งพิมพ์ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('78', '8', '13', 'ลูกค้าส่งแบบมาให้บริษัทตรวจ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('79', '8', '13', 'กำลังตรวจสอบแบบที่ลุกค้าส่งมา ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('80', '8', '13', 'แบบถูกต้อง / แจ้งเซลให้แจ้งลุกค้าพิมพ์ได้เลย ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('81', '8', '13', 'แบบไม่ถูกต้อง / แจ้งเซลให้แจ้งลุกค้าแก้', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('82', '8', '14', 'รับสินค้าสำเร็จ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('83', '8', '14', 'ตรวจสอบกับใบสั่งผลิต', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('84', '8', '14', 'มีคืนแพกแกตและอุปกรณ์ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('85', '8', '14', 'ไม่มีคืนแพกแกตและอุปกรณ์', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('86', '8', '14', 'ทำการ PACKING  ลงลัง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('87', '8', '14', 'แจ้งเซลพร้อมส่งวันที่...............', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('88', '8', '14', 'จัดส่งทางมือ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('89', '8', '14', 'จัดส่งโดยขนส่ง', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('90', '8', '14', 'จัดส่งโดย ปณ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('91', '8', '15', 'ตรวจเชื้อ ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('92', '8', '15', 'ตรวจ สารปรอท', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('93', '8', '15', 'ตรวจสาร ไฮโดรควินโนน', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('94', '8', '15', 'ตรวจสาร PH', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('95', '8', '15', 'ส่งรายงานแล้ว ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('96', '8', '15', 'ทำการวัดบ่ม STAYBILITY  ครั้งที่ 1', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('97', '8', '15', 'ทำการวัดบ่ม STAYBILITY  ครั้งที่ 2', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('98', '8', '16', 'เทสสินค้าก่อนส่งไปแผนกบรรจุ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('99', '8', '16', 'ส่งรายงานประจำวันครั้งที่  1', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('100', '8', '16', 'วัดค่า PH  / ที่เป็นบ่ม ครั้งที่ 1', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('101', '8', '16', 'ส่งรายงานประจำวันครั้งที่ 2', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('102', '8', '16', 'วัดค่า PH  / ที่เป็นบ่ม ครั้งที่ 2', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('103', '8', '16', 'บันทึกรายงานสรุปผล ', '1', '0', '0', '0000-00-00');
INSERT INTO `tc_work_now` (`work_now_id`, `order_id`, `group_module_id`, `work_now_detail`, `work_now_status`, `admin_id`, `manager_id`, `work_now_dateend`) VALUES ('104', '8', '16', 'เก็บ RETENSION SAMPLING แล้ว ', '1', '0', '0', '0000-00-00');


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


