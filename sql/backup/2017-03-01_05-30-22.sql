#
# TABLE STRUCTURE FOR: admin_group_module
#

DROP TABLE IF EXISTS `admin_group_module`;

CREATE TABLE `admin_group_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

INSERT INTO `admin_group_module` (`id`, `name`, `description`) VALUES ('1', 'ฝ่ายซัพพอตเซล', 'ฝ่ายซัพพอตเซล');
INSERT INTO `admin_group_module` (`id`, `name`, `description`) VALUES ('2', 'ฝ่ายเอกสาร อย', 'ฝ่ายเอกสาร อย');
INSERT INTO `admin_group_module` (`id`, `name`, `description`) VALUES ('3', 'ฝ่ายผลิต / สำหรับลูกค้าใหม่', 'ฝ่ายผลิต / สำหรับลูกค้าใหม่');
INSERT INTO `admin_group_module` (`id`, `name`, `description`) VALUES ('4', 'ฝ่ายผลิต / สำหรับลูกค้าเก่า', 'ฝ่ายผลิต / สำหรับลูกค้าเก่า');
INSERT INTO `admin_group_module` (`id`, `name`, `description`) VALUES ('5', 'ฝ่ายบรรจุ / งานสต๊อกกิโลไม่แบ่งบรรจุ', 'ฝ่ายบรรจุ / งานสต๊อกกิโลไม่แบ่งบรรจุ');
INSERT INTO `admin_group_module` (`id`, `name`, `description`) VALUES ('6', 'ฝ่ายบรรจุ / งานแบ่งบรรจุ', 'ฝ่ายบรรจุ / งานแบ่งบรรจุ');
INSERT INTO `admin_group_module` (`id`, `name`, `description`) VALUES ('7', 'แผนกแพกเกต / ลูกค้าใช้แพกแกตบริษัท', 'แผนกแพกเกต / ลูกค้าใช้แพกแกตบริษัท');
INSERT INTO `admin_group_module` (`id`, `name`, `description`) VALUES ('8', 'แผนกแพกเกต / ลูกค้านำแพกแกตมาเอง', 'แผนกแพกเกต / ลูกค้านำแพกแกตมาเอง');
INSERT INTO `admin_group_module` (`id`, `name`, `description`) VALUES ('9', 'แผนกติดสติ๊กเกอร์ / ใช้ของบริษัท', 'แผนกติดสติ๊กเกอร์ / ใช้ของบริษัท');
INSERT INTO `admin_group_module` (`id`, `name`, `description`) VALUES ('10', 'แผนกติดสติ๊กเกอร์ /ลูกค้านำมาเอง', 'แผนกติดสติ๊กเกอร์ /ลูกค้านำมาเอง');
INSERT INTO `admin_group_module` (`id`, `name`, `description`) VALUES ('11', 'แผนกกราฟฟิก/ ออกแบบใหม่', 'แผนกกราฟฟิก/ ออกแบบใหม่');
INSERT INTO `admin_group_module` (`id`, `name`, `description`) VALUES ('12', 'แผนกกราฟฟิก/ แบบเก่า REODER', 'แผนกกราฟฟิก/ แบบเก่า REODER');
INSERT INTO `admin_group_module` (`id`, `name`, `description`) VALUES ('13', 'แผนกกราฟฟิก/ ลุกค้าพิมพ์ฉลากมาเอง', 'แผนกกราฟฟิก/ ลุกค้าพิมพ์ฉลากมาเอง');
INSERT INTO `admin_group_module` (`id`, `name`, `description`) VALUES ('14', 'QC', 'QC');
INSERT INTO `admin_group_module` (`id`, `name`, `description`) VALUES ('15', 'QC / LAB', 'QC / LAB');
INSERT INTO `admin_group_module` (`id`, `name`, `description`) VALUES ('16', 'QA', 'QA');


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

INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('1', '127.0.0.1', 'webmaster', '$2y$08$/X5gzWjesYi78GqeAv5tA.dVGBVP7C1e1PzqnYCVe5s1qhlDIPPES', NULL, 'test@mail.com', NULL, NULL, NULL, NULL, '1451900190', '1488342398', '1', 'Webmaster', '', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('2', '127.0.0.1', 'admin', '$2y$08$7Bkco6JXtC3Hu6g9ngLZDuHsFLvT7cyAxiz1FzxlX5vwccvRT7nKW', NULL, NULL, NULL, NULL, NULL, NULL, '1451900228', '1451903990', '0', 'Admin', '', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('3', '127.0.0.1', 'manager', '$2y$08$snzIJdFXvg/rSHe0SndIAuvZyjktkjUxBXkrrGdkPy1K6r5r/dMLa', NULL, NULL, NULL, NULL, NULL, NULL, '1451900430', NULL, '1', 'Manager', '', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('4', '127.0.0.1', 'staff', '$2y$08$NigAXjN23CRKllqe3KmjYuWXD5iSRPY812SijlhGeKfkrMKde9da6', NULL, NULL, NULL, NULL, NULL, NULL, '1451900439', NULL, '1', 'Staff', '', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('5', '::1', 'mans1800', '$2y$08$sYJQBACqMLH983PqyiAPXe0I2pKANNP8n5z5AQCGFLdxWSiB06zE2', NULL, NULL, NULL, NULL, NULL, NULL, '1483603801', '1488342372', '1', 'Apirat', 'Pakakaew', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('6', '::1', 'mans1900', '$2y$08$3bzbmRVk1jcVzFl8GXvAw.GxtYU4YJtn5nEHdrItkhMrom53JXoKC', NULL, NULL, NULL, NULL, NULL, NULL, '1483603891', '1488342390', '1', 'Apirat', 'Pakakaew', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `img`) VALUES ('7', '::1', 'mans1700', '$2y$08$YuSc2EaRrmMNlGx2drwZ7ubRBDnHxZuBLay0i3PW97pS0VegNONiK', NULL, NULL, NULL, NULL, NULL, NULL, '1483603909', '1488342354', '1', 'Apirat', 'Pakakaew', '');
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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('1', '1', '1');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('2', '2', '2');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('3', '3', '3');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('4', '4', '4');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('5', '5', '2');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('6', '6', '3');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('7', '7', '4');
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


#
# TABLE STRUCTURE FOR: admin_users_groups_module
#

DROP TABLE IF EXISTS `admin_users_groups_module`;

CREATE TABLE `admin_users_groups_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

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

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('2rf4j3r1vsgl91t45a9l4gu3d1v94ghl', '192.168.1.25', '1488188253', '__ci_last_regenerate|i:1488188038;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488159987\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('l46uf3ihfntphjm52roqiafs7dcidif6', '192.168.1.25', '1488188051', '__ci_last_regenerate|i:1488188051;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('5nd6498fa9chu61b0cdn55117lugu6vm', '192.168.1.25', '1488188340', '__ci_last_regenerate|i:1488188051;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('28busfmtn9o469n3idf3vlchov7k7572', '192.168.1.25', '1488188571', '__ci_last_regenerate|i:1488188340;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488159987\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('7eq7cdpn21jul7n5mimtt69gdjpoos46', '192.168.1.25', '1488188364', '__ci_last_regenerate|i:1488188364;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('9m8a3ppg76nhkkdjvvk9jq9siv9u3l10', '192.168.1.25', '1488188659', '__ci_last_regenerate|i:1488188364;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('nu6a95pd8nr4p6do6j46assf7l6vmnl0', '192.168.1.25', '1488188933', '__ci_last_regenerate|i:1488188658;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488159987\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('r20gsv6516hlqrkikkj20eu6350r3sr6', '192.168.1.25', '1488188754', '__ci_last_regenerate|i:1488188754;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('b6m4fphpsg5bi97ciork253dr04pvagm', '192.168.1.25', '1488189053', '__ci_last_regenerate|i:1488188754;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('o4gpcm56r2kddmhitfbt9hepqbni4evc', '192.168.1.25', '1488189127', '__ci_last_regenerate|i:1488188996;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488159987\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('fp0gfin78orhbv8ihl84t2250suteugm', '192.168.1.25', '1488189126', '__ci_last_regenerate|i:1488189126;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('bajsqc4qbbt5ulfenipikt3voqrjjaoj', '192.168.1.25', '1488189345', '__ci_last_regenerate|i:1488189127;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('2e3j2ut2onkataj388ms0qm3m6bns49u', '192.168.1.25', '1488189499', '__ci_last_regenerate|i:1488189345;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488159987\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('f5eka1vps7q0s36p2b41j3vvf31f9oih', '192.168.1.25', '1488189463', '__ci_last_regenerate|i:1488189463;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('t0uv2clvmpbqpa14rtmdnpfg1l5r4rgc', '192.168.1.25', '1488189666', '__ci_last_regenerate|i:1488189463;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('44c1f5uhjk8p01ib69aqt0sj1omvoosh', '192.168.1.25', '1488189943', '__ci_last_regenerate|i:1488189646;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488159987\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('l57sd23chli8vpo19uvgk41c6lc0n8l0', '192.168.1.25', '1488189850', '__ci_last_regenerate|i:1488189850;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('dv22u52sd1d3ghnm2r62e9i4kud6j0dj', '192.168.1.25', '1488190132', '__ci_last_regenerate|i:1488189850;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('buamvmo9l5bsrl9be8uo7ljfcd5nj98n', '192.168.1.25', '1488190202', '__ci_last_regenerate|i:1488189969;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488159987\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('v5eqn2gp5kcvbtgmf6mnqjo7o7356nsh', '192.168.1.25', '1488190156', '__ci_last_regenerate|i:1488190156;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('rob1ld1a4eemau3g3ms472inv9cin6s6', '192.168.1.25', '1488190386', '__ci_last_regenerate|i:1488190156;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('1a6jrd7uuso1ivuncdar6f2n9rtrbhod', '192.168.1.25', '1488190622', '__ci_last_regenerate|i:1488190384;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488159987\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('l4b7o2rejln2e26genlkjb92p6sqkcr4', '192.168.1.25', '1488190524', '__ci_last_regenerate|i:1488190524;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('05ij0mg0g2c9om0bk8k0s7fo7kbad84r', '192.168.1.25', '1488190797', '__ci_last_regenerate|i:1488190524;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('e4gmulpp3sa4lt6daotm50cvibpic4r0', '192.168.1.25', '1488190983', '__ci_last_regenerate|i:1488190697;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488159987\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('os5ifumkkji5njorni2rvjv1pgsgeh1u', '192.168.1.25', '1488190826', '__ci_last_regenerate|i:1488190826;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('nvuv3vb3ptqhr11c0gcadj84g17jpfk7', '192.168.1.25', '1488191097', '__ci_last_regenerate|i:1488190826;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('hkoek21aellj0fm0keu3ikcdmgsg7eu4', '192.168.1.25', '1488191280', '__ci_last_regenerate|i:1488191004;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488159987\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('q8gj6rk1b0ibgee7maiom7h4u8197hbr', '192.168.1.25', '1488191139', '__ci_last_regenerate|i:1488191139;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('oclh9c63lqubh2h2u52i9b5hbim8one9', '192.168.1.25', '1488191387', '__ci_last_regenerate|i:1488191139;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('pnefm977ebbt6d49tbg531271hvaqbf5', '192.168.1.25', '1488191642', '__ci_last_regenerate|i:1488191347;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488159987\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('gj38qg3nbm9fh3kea6ou1aocbjree17f', '192.168.1.25', '1488191473', '__ci_last_regenerate|i:1488191473;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('h9jdv4hpncrp9kj8m14nbiajk8go1ooq', '192.168.1.25', '1488191760', '__ci_last_regenerate|i:1488191473;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('f6iehl9bbh7ckvaqmc3smqj53nlnjnf8', '192.168.1.25', '1488191958', '__ci_last_regenerate|i:1488191671;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488159987\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('pvbcfvo11m0i9fb67rqecthuhgv3ibuo', '192.168.1.25', '1488191827', '__ci_last_regenerate|i:1488191827;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('p6jbvvul4qr4o6pohguqds3ml2ar93nd', '192.168.1.25', '1488192126', '__ci_last_regenerate|i:1488191827;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('pno7fqetbkpepb90pfbt4qc8v490jpcm', '192.168.1.25', '1488192311', '__ci_last_regenerate|i:1488192055;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488159987\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('g01svqp6aj2lj131qb5c9g9pvovi8ank', '192.168.1.25', '1488192129', '__ci_last_regenerate|i:1488192129;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('l084ir0m95tdno4jjqlupf4v0o28nsop', '192.168.1.25', '1488192424', '__ci_last_regenerate|i:1488192129;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('nro24mvchv7p77u51eg0grunbs9502s6', '192.168.1.25', '1488192694', '__ci_last_regenerate|i:1488192397;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488159987\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('e7jhjs7u7har4hmbdrpe24ivnj4a2bes', '192.168.1.25', '1488192431', '__ci_last_regenerate|i:1488192431;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('qi48i4185s9471841fbpptv8o69c6ghi', '192.168.1.25', '1488192713', '__ci_last_regenerate|i:1488192431;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('les24b516r385uhf2taaj0tir308e1kf', '192.168.1.25', '1488192931', '__ci_last_regenerate|i:1488192704;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488159987\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('hgvdi07mhtcq9h0lck761l6q6cc66iic', '192.168.1.25', '1488192816', '__ci_last_regenerate|i:1488192816;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('jese0uhqqcrbucp2kfvt156g1sva8l69', '192.168.1.25', '1488193095', '__ci_last_regenerate|i:1488192816;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('n3kkqbp6jpjdsajduii6oolakteo688d', '192.168.1.25', '1488193094', '__ci_last_regenerate|i:1488193009;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488159987\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('qs1v89gugjiskb7ula9sk4reok8s9b6j', '192.168.1.25', '1488245321', '__ci_last_regenerate|i:1488245288;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488188044\";system_messages|a:2:{s:7:\"success\";a:1:{i:0;s:29:\"<p>Logged In Successfully</p>\";}s:5:\"error\";a:0:{}}__ci_vars|a:1:{s:15:\"system_messages\";s:3:\"old\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ruhlhpq2s4dougrsckg8i9h223d5hdol', '192.168.1.25', '1488246355', '__ci_last_regenerate|i:1488246189;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('67dfark2s6eu9srpeibb7221ve9s16og', '192.168.1.25', '1488246614', '__ci_last_regenerate|i:1488246358;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488188044\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('uh78ji4v9c7b21mfa85al4u17l4dh2e9', '192.168.1.25', '1488246361', '__ci_last_regenerate|i:1488246361;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('r4fsrk61cpu7okl05hl5ufiiddcuhusb', '192.168.1.25', '1488246642', '__ci_last_regenerate|i:1488246361;LAST_ACTIVITY|i:1488246642;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('8uo122maa2aempmma647gkkt5e03eceq', '192.168.1.25', '1488247282', '__ci_last_regenerate|i:1488246998;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488188044\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('qbfumr4obiqv4hgmtcp1ugluip7dvmoi', '192.168.1.25', '1488247499', '__ci_last_regenerate|i:1488247385;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488188044\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('kse7pv4t8vq43ci70nq59ifds5oi28cj', '192.168.1.25', '1488247958', '__ci_last_regenerate|i:1488247718;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488188044\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ug2mmg46e73kdbnpva32sgg22quqhg5j', '192.168.1.25', '1488247941', '__ci_last_regenerate|i:1488247941;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('a7dpoh31v3c22to6cbl8jvehlvj3fuk8', '192.168.1.25', '1488248288', '__ci_last_regenerate|i:1488248043;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488245321\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('mppi9rfuo7ck7opc3lvtpr1aare3bnue', '192.168.1.25', '1488248093', '__ci_last_regenerate|i:1488248081;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488248044\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('jcj40nrbeuod6q6no43ti57ditp14sgb', '192.168.1.25', '1488248093', '__ci_last_regenerate|i:1488248084;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('6id96pg6athntmtlpskheb0nfmpqjies', '192.168.1.25', '1488248120', '__ci_last_regenerate|i:1488248112;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488248082\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ev1079u54uqjsefsso18pkuag2qp3a8d', '192.168.1.25', '1488248120', '__ci_last_regenerate|i:1488248115;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('pe56tecl389r2sbf9cv3vemr35774buk', '192.168.1.25', '1488248245', '__ci_last_regenerate|i:1488248214;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488248113\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('fh508ckos2560tgrh1pl53m0gqmsbrqv', '192.168.1.25', '1488248245', '__ci_last_regenerate|i:1488248219;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('hicirqnkcue6k9r8ih18k2e1598kt6v0', '192.168.1.25', '1488248269', '__ci_last_regenerate|i:1488248266;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488248216\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('5oj46f7vo4gdfenjeq3tssrsmc4voh2u', '192.168.1.25', '1488248343', '__ci_last_regenerate|i:1488248303;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488248267\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('hcrdvbpd66bgt3n7bt1ai287v3ic887q', '192.168.1.25', '1488248588', '__ci_last_regenerate|i:1488248349;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488245321\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('47q6ndpisvjqfqgjhg7tlgdcaiqvj2sq', '192.168.1.25', '1488248371', '__ci_last_regenerate|i:1488248367;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488248305\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('2hjv68hqql4mib8r8bmeuc6o7s5pn808', '192.168.1.25', '1488248588', '__ci_last_regenerate|i:1488248588;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('fvunrnjqqh9j9jn7ou6sd0v45m87sroi', '192.168.1.25', '1488248869', '__ci_last_regenerate|i:1488248588;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('her4vnpt59dlm453c1gj0oc9nlfjpk67', '192.168.1.25', '1488248930', '__ci_last_regenerate|i:1488248696;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488245321\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('0da7gd9pf2c6jb5dphvblb9uigj46ajt', '192.168.1.25', '1488248897', '__ci_last_regenerate|i:1488248897;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('0pu2hcltddrubj0ikt4657pdtrqdhh2u', '192.168.1.25', '1488248930', '__ci_last_regenerate|i:1488248897;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('hjggjeqrb7vgak4aj3uf0rglvfjg3jpi', '192.168.1.25', '1488250985', '__ci_last_regenerate|i:1488250749;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488245321\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('1m5foslnd8287vs4lou2bb1v953kv8q9', '192.168.1.25', '1488250749', '__ci_last_regenerate|i:1488250749;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('n3kposjc34g21b5r33olk7k5c1s9eqqs', '192.168.1.25', '1488250774', '__ci_last_regenerate|i:1488250749;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('invse6bk0pr0jbtnn5mcfrh31duu9r3t', '192.168.1.25', '1488251562', '__ci_last_regenerate|i:1488251290;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488245321\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('2flbuq1t1srctbq5vlrpk8htn0ual4tg', '192.168.1.25', '1488251466', '__ci_last_regenerate|i:1488251466;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('bk9qtm4g0t2j7bjab3v5ur59pceoob82', '192.168.1.25', '1488251466', '__ci_last_regenerate|i:1488251466;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('8jh5qbgq8ug2bbp5ijnotf2rg5hu5pq8', '192.168.1.25', '1488251466', '__ci_last_regenerate|i:1488251466;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('snan805c06aaie4rc2d5qotunfaof3bv', '192.168.1.25', '1488251466', '__ci_last_regenerate|i:1488251466;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('8o6eifp1iq3tivvhti4uvdlh81enq05t', '192.168.1.25', '1488251466', '__ci_last_regenerate|i:1488251466;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('g2ktcp348g4715a75mfjo9bof4gb8cd1', '192.168.1.25', '1488251763', '__ci_last_regenerate|i:1488251466;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('p0dk75k02lqgneja3j5qgnu30b5aql72', '192.168.1.25', '1488251905', '__ci_last_regenerate|i:1488251606;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488245321\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('rpm3gm3vau7pibjcp08akfnngt4esgb7', '192.168.1.25', '1488251820', '__ci_last_regenerate|i:1488251820;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('tqan3i26oo6oip6bsa75ch2fk9ovogge', '192.168.1.25', '1488251820', '__ci_last_regenerate|i:1488251820;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('lo54clk7bo82cb45i94kcrcjq5fd4mga', '192.168.1.25', '1488251820', '__ci_last_regenerate|i:1488251820;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('4ftbpu7retbcgu1rsac9hl5ljn84k9vd', '192.168.1.25', '1488251820', '__ci_last_regenerate|i:1488251820;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('4rr2k28aijl9tvv20rjqglv9q7camq8r', '192.168.1.25', '1488251820', '__ci_last_regenerate|i:1488251820;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('34i8fiabb8omtujocomlncvisp9mhmhv', '192.168.1.25', '1488251820', '__ci_last_regenerate|i:1488251820;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('e9mrhrdgddsc27lg43d1kvek4sh35083', '192.168.1.25', '1488252093', '__ci_last_regenerate|i:1488251820;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('s1fkadkpitlco6kadgp8sn0okopqbfep', '192.168.1.25', '1488252169', '__ci_last_regenerate|i:1488251916;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488245321\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('roeph62u0607nruglmhu14b4vs8ahase', '192.168.1.25', '1488252122', '__ci_last_regenerate|i:1488252122;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('4lk9crtverdo2eeod1ag92b99timiv6m', '192.168.1.25', '1488252122', '__ci_last_regenerate|i:1488252122;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('k9824qp73hirirq3dqqajgidkehv40se', '192.168.1.25', '1488252122', '__ci_last_regenerate|i:1488252122;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('o056a21tu87if3orrqaejrsg7od3b4cp', '192.168.1.25', '1488252122', '__ci_last_regenerate|i:1488252122;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('mj404c4k57du44hrahs38ggovq2p1iah', '192.168.1.25', '1488252122', '__ci_last_regenerate|i:1488252122;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('2aii5k1rtv7tv4lvg28f3h78s2ircp9g', '192.168.1.25', '1488252122', '__ci_last_regenerate|i:1488252122;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('bic20j45t187ebhk239vhbjb5r8t3l68', '192.168.1.25', '1488252422', '__ci_last_regenerate|i:1488252122;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('goc12ab4rg66u3dv56533m8d9ub9fenq', '192.168.1.25', '1488252463', '__ci_last_regenerate|i:1488252231;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488245321\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('l1k5914sv2j4c75r2p1k2qghkgb147r6', '192.168.1.25', '1488252432', '__ci_last_regenerate|i:1488252432;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('mv4dsod9fs4bnbrpvgeu6ktlrme9g0v6', '192.168.1.25', '1488252432', '__ci_last_regenerate|i:1488252432;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('o9u8vlev8kaktg8m0i33r07rjkvj05nl', '192.168.1.25', '1488252432', '__ci_last_regenerate|i:1488252432;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ivhodfjegmugmn6jf3lbamr3vi47m6ef', '192.168.1.25', '1488252432', '__ci_last_regenerate|i:1488252432;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('k9hdf6u6skns3264qtdkgrboshfe1b2j', '192.168.1.25', '1488252432', '__ci_last_regenerate|i:1488252432;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('9cr0a00rnphedo3c87ba2qvk45bvua14', '192.168.1.25', '1488252432', '__ci_last_regenerate|i:1488252432;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('94bthp9cq0968an4urffcnc5ac5j46mj', '192.168.1.25', '1488252463', '__ci_last_regenerate|i:1488252432;LAST_ACTIVITY|i:1488247941;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('a1kf8kv4v0d4ct3bv6lm6ae4cbr29jbd', '192.168.1.25', '1488255323', '__ci_last_regenerate|i:1488255038;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488255006\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('fnmoi5eb4ju7ljcvkqlcufhc92ucacdh', '192.168.1.25', '1488255520', '__ci_last_regenerate|i:1488255515;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488255371\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('3k2sa7djanvnkstr3m7kje5k06g3p3bb', '171.7.93.206', '1488262877', '__ci_last_regenerate|i:1488262868;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488262824\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('emtuak3n7gcg9jgphckde5r8gli627fi', '171.7.93.206', '1488263532', '__ci_last_regenerate|i:1488263253;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488262824\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('e168lvvikalv6bj7gs5kgn1vlf2j6gkf', '171.7.93.206', '1488263784', '__ci_last_regenerate|i:1488263563;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488262824\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('a5pa5tpkfc0j0g9pssh46h98j5v9cfoh', '171.7.93.206', '1488263968', '__ci_last_regenerate|i:1488263919;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488262824\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('lg9b4r44pk2foo0chc4rqpvg8egpo1q5', '192.168.1.25', '1488264205', '__ci_last_regenerate|i:1488263975;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488262869\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('u290dkvofv83s07905pqbspmmgi4ateg', '192.168.1.25', '1488264013', '__ci_last_regenerate|i:1488264013;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ovhbhq08qev3jsoqoaijm1j5e919jmdf', '192.168.1.25', '1488264013', '__ci_last_regenerate|i:1488264013;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('guot8iqlv8d0vdtno9id1msnlqdqp3d8', '192.168.1.25', '1488264013', '__ci_last_regenerate|i:1488264013;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('rsa6fb1khd04on7ifn152q11ebnghm1g', '192.168.1.25', '1488264013', '__ci_last_regenerate|i:1488264013;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('m02l8inrdabm9ggneuhnsv6hlamfchio', '171.7.93.206', '1488267681', '__ci_last_regenerate|i:1488267469;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488263977\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('mdalu38n4a7bog4q6rvb6mumb44v8gkg', '171.7.93.206', '1488267622', '__ci_last_regenerate|i:1488267622;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('7actme4j2k3ovubej3vd16lbci72q0p8', '171.7.93.206', '1488267681', '__ci_last_regenerate|i:1488267622;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('aeovgcmeist4lfvg4htdtf5obp6edu23', '171.7.93.206', '1488269236', '__ci_last_regenerate|i:1488268977;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488263977\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('iittp64eugmpal0dbbo9s2nr9o6o4nsf', '171.7.93.206', '1488269524', '__ci_last_regenerate|i:1488269381;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488263977\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('gm3juiauiutc4k0312oj9dv1nrmqgvsf', '171.7.93.206', '1488270065', '__ci_last_regenerate|i:1488270059;identity|s:8:\"mans1900\";username|s:8:\"mans1900\";email|N;user_id|s:1:\"6\";old_last_login|s:10:\"1485232325\";system_messages|a:2:{s:7:\"success\";a:1:{i:0;s:29:\"<p>Logged In Successfully</p>\";}s:5:\"error\";a:0:{}}__ci_vars|a:1:{s:15:\"system_messages\";s:3:\"old\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('88r7ev7b2dto57e3n4slcikoa72ga3ji', '171.7.93.206', '1488271134', '__ci_last_regenerate|i:1488271134;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('cs54u3qt97ple0qqh48fkp76pg5f2qgj', '192.168.1.25', '1488273478', '__ci_last_regenerate|i:1488273476;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488271079\";system_messages|a:2:{s:7:\"success\";a:1:{i:0;s:29:\"<p>Logged In Successfully</p>\";}s:5:\"error\";a:0:{}}__ci_vars|a:1:{s:15:\"system_messages\";s:3:\"old\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('hr7c84dqcmumv9npe89opuch88qndhfe', '192.168.1.25', '1488274131', '__ci_last_regenerate|i:1488274005;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488271079\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('66qrtc5sqc4p6mm8j4mnlqv8hktefg0b', '192.168.1.25', '1488274573', '__ci_last_regenerate|i:1488274377;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488271079\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('3b8g47kfhhseicptbm2eh8ue2j4snajk', '192.168.1.25', '1488275097', '__ci_last_regenerate|i:1488274800;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488271079\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('7pf7k48qmb6ri705u9a0ulr50i3kl4kr', '192.168.1.25', '1488275371', '__ci_last_regenerate|i:1488275101;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488271079\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('6g6b6kfh9qrl0bt94qjpi9jb3ukkt162', '192.168.1.25', '1488275289', '__ci_last_regenerate|i:1488275289;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('8e93e1klpmn35js2huunr0jsi14ia8nl', '192.168.1.25', '1488275559', '__ci_last_regenerate|i:1488275289;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('brs2dcae6vifqdo8abvlhibqbe1j1m3v', '192.168.1.25', '1488275678', '__ci_last_regenerate|i:1488275503;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488271079\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('3hpeg55q4v4jgv46cv06h5dsv2dbs9gb', '192.168.1.25', '1488275604', '__ci_last_regenerate|i:1488275604;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('nnjopl1oesqi1tk2vtl27oq25pfd671o', '192.168.1.25', '1488275903', '__ci_last_regenerate|i:1488275604;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('02hrr15l1li95ogqo8dvjbhhfk9g1lkk', '192.168.1.25', '1488276055', '__ci_last_regenerate|i:1488275817;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488271079\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ie5e3tgtdtgb8h7p7ehgg388cl1jrr7l', '192.168.1.25', '1488275931', '__ci_last_regenerate|i:1488275931;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('qd7tl0fbfuo8omf27sagrh3oludre922', '192.168.1.25', '1488276166', '__ci_last_regenerate|i:1488275931;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('0jlfp1he6kbqab777d1ahfhl0c8l8r5n', '192.168.1.25', '1488276391', '__ci_last_regenerate|i:1488276161;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488271079\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('r9bpl7vnblsha7kmshjubs18c7832h8u', '192.168.1.25', '1488276392', '__ci_last_regenerate|i:1488276392;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('d2ik7d8i6ggpprdf6a15l9f1ja37o8u9', '192.168.1.25', '1488276392', '__ci_last_regenerate|i:1488276392;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('s1lmdnr3ub8fansprec5f0boq3kcct0d', '192.168.1.25', '1488276392', '__ci_last_regenerate|i:1488276392;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('c544hdt3jl9664b4p2r1vf5uoqph63pp', '192.168.1.25', '1488276392', '__ci_last_regenerate|i:1488276392;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('p2qf3omkk37u0g5hs9rqbg2t6jegeg25', '192.168.1.25', '1488276392', '__ci_last_regenerate|i:1488276392;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('k7gqmf2k85ofb3nb3kbqr24tgramrloi', '192.168.1.25', '1488276392', '__ci_last_regenerate|i:1488276392;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('71k649pamluv2jnud7e4nr2gnh5rtj5p', '192.168.1.25', '1488276666', '__ci_last_regenerate|i:1488276392;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('7v8mvqabalio5t2bbglhj6jkgl8p31jl', '192.168.1.25', '1488276724', '__ci_last_regenerate|i:1488276665;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488271079\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('a66hem2rejc2e2hp42ao7fgvkgu7nbus', '192.168.1.25', '1488276724', '__ci_last_regenerate|i:1488276724;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('joh76htl0t2i6a13630ndto5js2aninj', '192.168.1.25', '1488276724', '__ci_last_regenerate|i:1488276724;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('b7p05mhb6hnv0issjajhd0pel1152hl9', '192.168.1.25', '1488276724', '__ci_last_regenerate|i:1488276724;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('8lgnqtdci4rj7bcg9rskf7tvtag99e8p', '192.168.1.25', '1488276724', '__ci_last_regenerate|i:1488276724;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('9pnqf3j1t6e8n88r2307r91lj0gcd93d', '192.168.1.25', '1488276724', '__ci_last_regenerate|i:1488276724;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('cbqegpkje5thrn9c66ev8e8264q2r8sp', '192.168.1.25', '1488276724', '__ci_last_regenerate|i:1488276724;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('7apurd5m74nm7na1dbogkoih6b5aqt09', '192.168.1.25', '1488277021', '__ci_last_regenerate|i:1488276724;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ipmu3d0rt2lbgeha7s5f5lolggokh2rc', '192.168.1.25', '1488277317', '__ci_last_regenerate|i:1488277021;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488271079\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('hv35tm79e7rvcslh0r2pf8t56ciq33so', '192.168.1.25', '1488277153', '__ci_last_regenerate|i:1488277153;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('1ac91r6vr554sosjo1fb0uri67qod14p', '192.168.1.25', '1488277153', '__ci_last_regenerate|i:1488277153;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('6u3p1b2h189d8fvcac0jij8431etteq3', '192.168.1.25', '1488277153', '__ci_last_regenerate|i:1488277153;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('p4iqv67jgd835je1e3qj8qecmtp38l4i', '192.168.1.25', '1488277153', '__ci_last_regenerate|i:1488277153;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('0jrtbtvgp9sceteoas41hid92u5al1bl', '192.168.1.25', '1488277153', '__ci_last_regenerate|i:1488277153;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('eilik6a502u0fibiige99qk904n1me47', '192.168.1.25', '1488277153', '__ci_last_regenerate|i:1488277153;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('3q4aq8hn9n45an1vj48jbk22v7mgo4fh', '192.168.1.25', '1488277408', '__ci_last_regenerate|i:1488277153;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ki2p25bpnvmg5vkocj29kga3k33shmoe', '192.168.1.25', '1488277620', '__ci_last_regenerate|i:1488277324;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488271079\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('1erebrpm3ot868rv99ehkg4faugcg1fj', '192.168.1.25', '1488277545', '__ci_last_regenerate|i:1488277545;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('gdsdegctfcd773v8d8sevpei99pl0vsg', '192.168.1.25', '1488277545', '__ci_last_regenerate|i:1488277545;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('tjgkapdvscpit4l9m045a5gm5lc8nhg7', '192.168.1.25', '1488277545', '__ci_last_regenerate|i:1488277545;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ing8b6n0v97q0gthg2iphh1q2c1nruc4', '192.168.1.25', '1488277545', '__ci_last_regenerate|i:1488277545;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('pvf1eteidf1l01dsg09akruqevn2qgq0', '192.168.1.25', '1488277545', '__ci_last_regenerate|i:1488277545;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('tirl9842o74me8gbl8arbq5coeebthhl', '192.168.1.25', '1488277545', '__ci_last_regenerate|i:1488277545;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('3hmu6vju2i27rr8j5tbbfolggulb7pc1', '192.168.1.25', '1488277703', '__ci_last_regenerate|i:1488277545;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('4uu06mqf70de91n7m1o2nds8neko85be', '192.168.1.25', '1488277880', '__ci_last_regenerate|i:1488277685;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488271079\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('2qfo5fsfmedjeccrerfh498nuo17nevh', '192.168.1.25', '1488277880', '__ci_last_regenerate|i:1488277880;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('9i2eecfkfm935t2thd6n314de26bh61d', '192.168.1.25', '1488277880', '__ci_last_regenerate|i:1488277880;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('uuivsadscgue5lntvr0egjsc9ojnu7qq', '192.168.1.25', '1488277880', '__ci_last_regenerate|i:1488277880;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('d79b73q0uol6oi1jrtc17o336cqduj5c', '192.168.1.25', '1488277880', '__ci_last_regenerate|i:1488277880;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('pbsrj8arsca0k0d3mpd77epsua7859vq', '192.168.1.25', '1488277880', '__ci_last_regenerate|i:1488277880;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('03np6sqf08j3gad53134tunsd463o1lg', '192.168.1.25', '1488277880', '__ci_last_regenerate|i:1488277880;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('bef0v0snmjr1o4lu7gr96kc01ug92co8', '192.168.1.25', '1488278078', '__ci_last_regenerate|i:1488277880;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('k3kj02olbm96bnd61aftgv53qau7bkrv', '192.168.1.25', '1488278227', '__ci_last_regenerate|i:1488277992;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488271079\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('pik7k0l6p3f65lk9pubal8mju9178s8h', '192.168.1.25', '1488278225', '__ci_last_regenerate|i:1488278225;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('tvnq19nis8jf9c5jphfossu50ikv0ver', '192.168.1.25', '1488278225', '__ci_last_regenerate|i:1488278225;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('e4dvinqina8veeaanf3g3flh0ou4q6ql', '192.168.1.25', '1488278225', '__ci_last_regenerate|i:1488278225;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('5ma5i7vsi8ulm02slc2e9pidufjq9jgs', '192.168.1.25', '1488278225', '__ci_last_regenerate|i:1488278225;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('knpfqn4q4nl5jfu9hpl2u78vs2pll9fr', '192.168.1.25', '1488278225', '__ci_last_regenerate|i:1488278225;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('rps3qakm94tn7332kprqmkj636mh87ec', '192.168.1.25', '1488278225', '__ci_last_regenerate|i:1488278225;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('3riaam996q038so4q3703acnfrsl0ls9', '192.168.1.25', '1488278470', '__ci_last_regenerate|i:1488278225;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('3qaspuokh0m5hn0sic7t9g8jkuogu4jr', '192.168.1.25', '1488278621', '__ci_last_regenerate|i:1488278324;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488271079\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('qvm3qqcd3nrrq2n3mvo7bdebpj96qq1b', '192.168.1.25', '1488278567', '__ci_last_regenerate|i:1488278567;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('6k6qd532em00g1he4qpsve4kmo8dostn', '192.168.1.25', '1488278567', '__ci_last_regenerate|i:1488278567;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('dsmpd2fjlcaufdlct2ejn367blu49clb', '192.168.1.25', '1488278567', '__ci_last_regenerate|i:1488278567;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('eh5p5vnt3ofgspu9i9cc11h0f93t2onp', '192.168.1.25', '1488278567', '__ci_last_regenerate|i:1488278567;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('bj26hr760u8g3d5dn8u4i6homfg6akst', '192.168.1.25', '1488278567', '__ci_last_regenerate|i:1488278567;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('r2f43umesaiv4md7q43vhuil90i4eer2', '192.168.1.25', '1488278567', '__ci_last_regenerate|i:1488278567;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('adcge8bvo69tbo0399aq7jepbccfr44h', '192.168.1.25', '1488278710', '__ci_last_regenerate|i:1488278567;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('8d3jnpl6v7d7ho0hg0tvdi9daihr6c3u', '192.168.1.25', '1488278709', '__ci_last_regenerate|i:1488278668;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488271079\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ai6bnn08b5qi833ogkkbd3lo6pmjvkgu', '192.168.1.25', '1488279796', '__ci_last_regenerate|i:1488279520;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488271079\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ttuob2mqligrhjv40fi2enmh23os8cn0', '192.168.1.25', '1488279844', '__ci_last_regenerate|i:1488279837;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488271079\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('tv81sggr7itst9m1kg36dstalg9cg5lv', '192.168.1.25', '1488331774', '__ci_last_regenerate|i:1488331492;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488273478\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('463q1fb89f2na3i4a28msn3vl0bs2vi8', '192.168.1.25', '1488332099', '__ci_last_regenerate|i:1488332048;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488273478\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('a2vmp3q7osj999i0m0becrl6e1k50ivq', '192.168.1.25', '1488332057', '__ci_last_regenerate|i:1488332057;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('8ab6hm60f0fdkb820bdouo5qdbjkgm2t', '192.168.1.25', '1488332057', '__ci_last_regenerate|i:1488332057;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('2kuug5j5kcv6p91pjia0i0t6b6ous2om', '192.168.1.25', '1488332057', '__ci_last_regenerate|i:1488332057;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('l1egb50pakpjjakt7ilqphfphr05kld7', '192.168.1.25', '1488332100', '__ci_last_regenerate|i:1488332057;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('p3mv5udq7ch0idbsece9sksoi0ud8gvi', '192.168.1.25', '1488333340', '__ci_last_regenerate|i:1488333041;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488273478\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('3s6bgrh8tf9lv3sb666s9f5tnr7l6u2u', '192.168.1.25', '1488333615', '__ci_last_regenerate|i:1488333350;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488273478\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('8gsiu9ip8mct9ee5tq9ictn3bsqudl8i', '192.168.1.25', '1488333834', '__ci_last_regenerate|i:1488333665;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488273478\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('vohcdhfengofcra1jsfbu4poa8s8pfan', '192.168.1.25', '1488334189', '__ci_last_regenerate|i:1488334042;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488273478\";system_messages|a:2:{s:7:\"success\";a:1:{i:0;s:35:\"<p>Account Successfully Created</p>\";}s:5:\"error\";a:0:{}}__ci_vars|a:1:{s:15:\"system_messages\";s:3:\"new\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('4kihi11t94ff6ac40m0g63tu4l8hj36v', '192.168.1.25', '1488334667', '__ci_last_regenerate|i:1488334381;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488273478\";system_messages|a:2:{s:7:\"success\";a:0:{}s:5:\"error\";a:1:{i:0;s:70:\"<p>Identity Already Used or Invalid</p><p>Unable to Create Account</p>\";}}__ci_vars|a:1:{s:15:\"system_messages\";s:3:\"new\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('fhnj9gb2cb98vls3iuacsp3n1lkq82ns', '192.168.1.25', '1488334447', '__ci_last_regenerate|i:1488334447;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('hrdlfu98upa314ksa4spc5g8bks86ivn', '192.168.1.25', '1488334649', '__ci_last_regenerate|i:1488334447;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('1qn7l2guukbadgb84b4u06vr5t1sf51i', '192.168.1.25', '1488334963', '__ci_last_regenerate|i:1488334689;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488273478\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('m660nu8ofrcnl144o1trj42tkq3urr2h', '192.168.1.25', '1488334897', '__ci_last_regenerate|i:1488334897;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('egdkf47ht8fgnif52vlb10o801bolefi', '192.168.1.25', '1488335190', '__ci_last_regenerate|i:1488334897;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('5oqnf4et9siivj5k8073vc4stdglgsga', '192.168.1.25', '1488335192', '__ci_last_regenerate|i:1488334995;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488273478\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('thn5ums6dtlmbsr2070386252u8sb1kp', '192.168.1.25', '1488335794', '__ci_last_regenerate|i:1488335742;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488273478\";system_messages|a:2:{s:7:\"success\";a:1:{i:0;s:35:\"<p>Account Successfully Created</p>\";}s:5:\"error\";a:0:{}}__ci_vars|a:1:{s:15:\"system_messages\";s:3:\"old\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('a8g08mtp19d6ie6jlp50erhl6p8b5q57', '192.168.1.25', '1488335794', '__ci_last_regenerate|i:1488335794;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('sacqkfs64e0u90vdpt11vqglac757jhs', '192.168.1.25', '1488335794', '__ci_last_regenerate|i:1488335794;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('s04c1tk2rl4n24sr5v64ohhrclu7f0rn', '192.168.1.25', '1488336297', '__ci_last_regenerate|i:1488336275;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488273478\";system_messages|a:2:{s:7:\"success\";a:1:{i:0;s:35:\"<p>Account Successfully Created</p>\";}s:5:\"error\";a:0:{}}__ci_vars|a:1:{s:15:\"system_messages\";s:3:\"old\";}');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('vs8t58pbfntpbv5l896l8c3i5r0q1jvd', '192.168.1.25', '1488336297', '__ci_last_regenerate|i:1488336297;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('f3njcdhgiddhs26lvd0k98gofpqff6s0', '192.168.1.25', '1488336297', '__ci_last_regenerate|i:1488336297;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('i3ubvdssl48bajsoe7vms9sjf8tsevou', '192.168.1.25', '1488337456', '__ci_last_regenerate|i:1488337456;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488273478\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('pd0fs8cnjd2pou8bs15bor8b2bsfpsa0', '192.168.1.25', '1488338252', '__ci_last_regenerate|i:1488337964;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488273478\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ftd442kct58cou33mprqedk3t9o8hhq6', '192.168.1.25', '1488338253', '__ci_last_regenerate|i:1488338184;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('tk5n86erohqhuniacdp6h6ett7soq769', '192.168.1.25', '1488338682', '__ci_last_regenerate|i:1488338527;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488273478\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('frklvdul3o4svgug61jk8ibgim7jphcp', '192.168.1.25', '1488338528', '__ci_last_regenerate|i:1488338528;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('o80hairaioptra02ueejuqf81vglilv0', '192.168.1.25', '1488338528', '__ci_last_regenerate|i:1488338528;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('kmn4af07tmkclv98d2qmjuj1iu0rb419', '192.168.1.25', '1488338528', '__ci_last_regenerate|i:1488338528;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('6ctddinnqm1nifabk9cbi4kk5jq7gg67', '192.168.1.25', '1488338528', '__ci_last_regenerate|i:1488338528;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('t12p5lqshdf4n997l87hgmn5dlh341cv', '192.168.1.25', '1488338528', '__ci_last_regenerate|i:1488338528;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('d8ts107ac6a20fofrivkn68q8f6vd0um', '192.168.1.25', '1488338528', '__ci_last_regenerate|i:1488338528;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ar7tok3b4ugn3bg9lg26d4bvbvm2q3vl', '192.168.1.25', '1488338683', '__ci_last_regenerate|i:1488338528;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('is1vpvdp1quk1mddaj15mid7vph1vb5k', '192.168.1.25', '1488339097', '__ci_last_regenerate|i:1488338846;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488273478\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('f98mlc9bd4u2u19ts6jspmu0hu8i7lct', '192.168.1.25', '1488338846', '__ci_last_regenerate|i:1488338846;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('1doj56b6jbsolr4r9vviust37j5ula7a', '192.168.1.25', '1488338846', '__ci_last_regenerate|i:1488338846;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('e09i40bu82020vimpc1ibuoa27feqoeg', '192.168.1.25', '1488338846', '__ci_last_regenerate|i:1488338846;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('1r2eoui0pua2hl0in83ql8thfjsdio6t', '192.168.1.25', '1488338846', '__ci_last_regenerate|i:1488338846;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('daq87nd4jctbuo8gf6g5elg2ajmmfh2r', '192.168.1.25', '1488338846', '__ci_last_regenerate|i:1488338846;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('cc5a3vrsc552i6egs7qt6c3mk38km8t5', '192.168.1.25', '1488338846', '__ci_last_regenerate|i:1488338846;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('1k5tja9gluhrpv04jlgh7g4nn0vu4122', '192.168.1.25', '1488339098', '__ci_last_regenerate|i:1488338846;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('i76shhvqmad21pv00s7n13iljs3p8r7r', '192.168.1.25', '1488339456', '__ci_last_regenerate|i:1488339164;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488273478\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('j161p5lkq1a2u4b76m0k8muvcs83308h', '192.168.1.25', '1488339164', '__ci_last_regenerate|i:1488339164;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('p0to0aeahklni2jro144r0j4vkuj22e7', '192.168.1.25', '1488339164', '__ci_last_regenerate|i:1488339164;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('15im074jkv49q1ql5c2h61ec86p54vbm', '192.168.1.25', '1488339164', '__ci_last_regenerate|i:1488339164;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('2ce1i6g3vjtu9ao67bpajh6utjp7mlma', '192.168.1.25', '1488339164', '__ci_last_regenerate|i:1488339164;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('4is2bd79cp1s37o4p836rmdo8svjuq8a', '192.168.1.25', '1488339164', '__ci_last_regenerate|i:1488339164;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('jvmbir1kodhbqscilmenndqub3936g9j', '192.168.1.25', '1488339164', '__ci_last_regenerate|i:1488339164;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('gvtcv0k8v74ir394tqn9ivmn3ous6s92', '192.168.1.25', '1488339457', '__ci_last_regenerate|i:1488339164;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('i56ghh146rkh03dhi87cpcv1glp83v2h', '192.168.1.25', '1488339756', '__ci_last_regenerate|i:1488339538;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488273478\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ukl2vicd1p65m6vps246bopvhdomhdsp', '192.168.1.25', '1488339538', '__ci_last_regenerate|i:1488339538;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('cuqkcud49u8rhbtcisler7u27tbk3498', '192.168.1.25', '1488339538', '__ci_last_regenerate|i:1488339538;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('gbce52td1msj9q7b57411su49rigf8p4', '192.168.1.25', '1488339538', '__ci_last_regenerate|i:1488339538;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('7gq34utqih0lf7qtchiq870m65hsjm5g', '192.168.1.25', '1488339538', '__ci_last_regenerate|i:1488339538;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('askbj588gr0kn6p7lh8k97t9fc0c4ufu', '192.168.1.25', '1488339757', '__ci_last_regenerate|i:1488339538;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('3ipsh28t6i2tgs61vpvf2sdr7aarh7m2', '192.168.1.25', '1488340118', '__ci_last_regenerate|i:1488339902;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488273478\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('m7ka1uj4i23bcqkoma12cu2s6tka7vq2', '192.168.1.25', '1488339902', '__ci_last_regenerate|i:1488339902;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('1hjmiigmk5tta8avtcbqu9sa2nhlqpsv', '192.168.1.25', '1488339902', '__ci_last_regenerate|i:1488339902;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('9idh276asicnmmouv2sqir3mr691p6nt', '192.168.1.25', '1488339902', '__ci_last_regenerate|i:1488339902;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('tpk3hpcr7rj1lmpb6bvig02foa48mhoq', '192.168.1.25', '1488339902', '__ci_last_regenerate|i:1488339902;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('s1vk6nhe1l9von541he6nj96t7ebpupk', '192.168.1.25', '1488339902', '__ci_last_regenerate|i:1488339902;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('tou93k3mud4kbautm1fsmimu88jhmol1', '192.168.1.25', '1488339902', '__ci_last_regenerate|i:1488339902;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('29emk6442eelqpr6h6l8vq3h70ahlj30', '192.168.1.25', '1488340119', '__ci_last_regenerate|i:1488339902;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('okmob05pegsd4aam505oga3n8nlv86vs', '192.168.1.25', '1488340730', '__ci_last_regenerate|i:1488340445;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488273478\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('3v192o55tqsm6rv9kamau9gbqakno7d9', '192.168.1.25', '1488340445', '__ci_last_regenerate|i:1488340445;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('2ssfn9hmato25qgbquk3pibdi668k09s', '192.168.1.25', '1488340445', '__ci_last_regenerate|i:1488340445;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('eh0nmk1jei3jotbjcgdjbtkrdud48mn9', '192.168.1.25', '1488340445', '__ci_last_regenerate|i:1488340445;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('9qigvh8desvt54ijm4se803ia80r12a4', '192.168.1.25', '1488340445', '__ci_last_regenerate|i:1488340445;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('vi8qdnr8vagurnfqh59vbevul5304rl3', '192.168.1.25', '1488340445', '__ci_last_regenerate|i:1488340445;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('20a51qult00l6hpo6k9goncifon00imh', '192.168.1.25', '1488340445', '__ci_last_regenerate|i:1488340445;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('k7464bq39p2i55udbu9tpfghnn5uj5o8', '192.168.1.25', '1488340731', '__ci_last_regenerate|i:1488340445;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('mg53aa1etgnullctpscqk69dd5m3v7ca', '192.168.1.25', '1488341003', '__ci_last_regenerate|i:1488340775;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488273478\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('h6gv6gctj5kcavcmb4s8evnb89on2uvt', '192.168.1.25', '1488340775', '__ci_last_regenerate|i:1488340775;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('jl1nmuchptsu6falrdqda1qf8jksr94m', '192.168.1.25', '1488340775', '__ci_last_regenerate|i:1488340775;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('gh6cq04tsde5alt9u6kl1jqqliqr3eso', '192.168.1.25', '1488340775', '__ci_last_regenerate|i:1488340775;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('no89vn2ms49845utbk173q511a3u3emc', '192.168.1.25', '1488340775', '__ci_last_regenerate|i:1488340775;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('m0vm8vmfmoks24efeo4ldieqbcgr8ibu', '192.168.1.25', '1488340775', '__ci_last_regenerate|i:1488340775;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('2unusaia8upgtfkpkbdlltci848ij7p2', '192.168.1.25', '1488340775', '__ci_last_regenerate|i:1488340775;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('qvrv8ctso99m7n5thiiap4hn1eg9a9ij', '192.168.1.25', '1488341004', '__ci_last_regenerate|i:1488340775;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('a25h6ep3upi7fegp5ni8fl72le6ks3in', '192.168.1.25', '1488341383', '__ci_last_regenerate|i:1488341196;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|N;user_id|s:1:\"1\";old_last_login|s:10:\"1488273478\";');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('r8jbo4j9u9vu1461gbi1e1ubk5bnvp5a', '192.168.1.25', '1488341196', '__ci_last_regenerate|i:1488341196;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('f90s7qj1nqqe1p7jfa2dh3sk3lkkdppl', '192.168.1.25', '1488341196', '__ci_last_regenerate|i:1488341196;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('v89709rttfjhoa8jolsue353qshifi15', '192.168.1.25', '1488341196', '__ci_last_regenerate|i:1488341196;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('pbnufunp2ni9u31a2raptobms96f0n52', '192.168.1.25', '1488341196', '__ci_last_regenerate|i:1488341196;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('tc7iumt2vha5kv81c6us65cv4cpnmr0j', '192.168.1.25', '1488341196', '__ci_last_regenerate|i:1488341196;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('1omuqt1i9t3agslqh6smssp1abjis3dd', '192.168.1.25', '1488341196', '__ci_last_regenerate|i:1488341196;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('9drue5u9rrpr0bqltn9s7pvdcun77djj', '192.168.1.25', '1488341384', '__ci_last_regenerate|i:1488341196;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('n5hhmupvdpflnh326vidcqivha2s82qe', '192.168.1.25', '1488341586', '__ci_last_regenerate|i:1488341586;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('58fupepov8p80lapm1c61ln94q4gtjl2', '192.168.1.25', '1488341586', '__ci_last_regenerate|i:1488341586;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('0eu9l65vmbs37b7skogltgu1otdplrpj', '192.168.1.25', '1488341586', '__ci_last_regenerate|i:1488341586;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('gsb0t4m93nqo41b8vklr3tnc5vr46sck', '192.168.1.25', '1488341586', '__ci_last_regenerate|i:1488341586;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('uf9rmf5kmo6iaoeubjolr2h1bqhjtir7', '192.168.1.25', '1488341586', '__ci_last_regenerate|i:1488341586;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('akprs5f19a6lis3ali2nrmlgk30guvt7', '192.168.1.25', '1488341586', '__ci_last_regenerate|i:1488341586;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('6bb5brlkcsod8r503mm3kccd1pe40a7j', '192.168.1.25', '1488341798', '__ci_last_regenerate|i:1488341586;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('j4da6u2s3u1iiivei2del9mnl9qpi7lv', '192.168.1.25', '1488342019', '__ci_last_regenerate|i:1488342019;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('pi98qcco3cvblrs38140uu403hkdsorn', '192.168.1.25', '1488342019', '__ci_last_regenerate|i:1488342019;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('nqgpp7elbvrtgl73q535ariefilq5qgm', '192.168.1.25', '1488342019', '__ci_last_regenerate|i:1488342019;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('2cl7sgs57jm4668hiih490aol7g4600a', '192.168.1.25', '1488342019', '__ci_last_regenerate|i:1488342019;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('i8uphepn94pb5p2ma2lnoonlk4ojtrgg', '192.168.1.25', '1488342019', '__ci_last_regenerate|i:1488342019;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('172675msrf417dqb4efg83i1eiqu33ia', '192.168.1.25', '1488342019', '__ci_last_regenerate|i:1488342019;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('pong3daf4v2n92roo9avjlm883251cs6', '192.168.1.25', '1488342279', '__ci_last_regenerate|i:1488342019;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('gkk3r9vk7kh43cuod5eukp39ovd1sv2v', '192.168.1.25', '1488342329', '__ci_last_regenerate|i:1488342329;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('t2ce230ct5qjm1jml3l4iqs115j0e67n', '192.168.1.25', '1488342329', '__ci_last_regenerate|i:1488342329;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('b7e63r12tgdllu3b4kspg4dhst257np3', '192.168.1.25', '1488342329', '__ci_last_regenerate|i:1488342329;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('pagcm961aoojg83ruif94kolu4r24c1t', '192.168.1.25', '1488342329', '__ci_last_regenerate|i:1488342329;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('9jedd56s6pdv5ustqgg88q6ped96qoh6', '192.168.1.25', '1488342329', '__ci_last_regenerate|i:1488342329;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('33fin4u60mfmvtuj9laboc5j24vln985', '192.168.1.25', '1488342329', '__ci_last_regenerate|i:1488342329;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('26hh6sg0shbvvq7l44f0ruc1ipntt6u0', '192.168.1.25', '1488342611', '__ci_last_regenerate|i:1488342329;');
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('f136h1p2e54606lqnpelph2oucnboekk', '192.168.1.25', '1488342611', '__ci_last_regenerate|i:1488342396;identity|s:9:\"webmaster\";username|s:9:\"webmaster\";email|s:13:\"test@mail.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1488342276\";group_us|a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";}cotton_us|a:16:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";i:10;s:2:\"11\";i:11;s:2:\"12\";i:12;s:2:\"13\";i:13;s:2:\"14\";i:14;s:2:\"15\";i:15;s:2:\"16\";}');


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


