<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/*
  | -------------------------------------------------------------------------
  | CI Bootstrap 3 Configuration
  | -------------------------------------------------------------------------
  | This file lets you define default values to be passed into views
  | when calling MY_Controller's render() function.
  |
  | See example and detailed explanation from:
  | 	/application/config/ci_bootstrap_example.php
 */

$config['ci_bootstrap_menu'] = array(
 'menu' => array(
        'main' => array(
            'name' => 'Main page',
            'url' => '../admin/home',
            'icon' => 'fa fa-home',
        ),
		'home' => array(
            'name' => 'หน้าหลัก',
            'url' => 'home',
            'icon' => 'fa fa-home',
        ),
    )
);
	
$config['ci_bootstrap_menu']['menu']['work_now'] = array(
	'name' => 'งานปัจจุบัน',
	'url' => 'work_now',
	'icon' => 'fa fa-users',
	//'children' => array(
		//'รายการ' => 'work_now',
		//'เพิ่ม' => 'work_now/create'
	//)
);	
$config['ci_bootstrap_menu']['menu']['invoice_kg'] = array(
	'name' => 'ใบเสนอราคา/สั่งผลิต (KG)',
	'url' => 'invoice_kg',
	'icon' => 'fa fa-users',
	'children' => array(
		'รายการ' => 'invoice_kg',
		'เพิ่ม' => 'invoice_kg/create'
	)
);	
$config['ci_bootstrap_menu']['menu']['invoice_brand'] = array(
	'name' => 'ใบเสนอราคา/สั่งผลิต (Brand)',
	'url' => 'invoice_brand',
	'icon' => 'fa fa-users',
	'children' => array(
		'รายการ' => 'invoice_brand',
		'เพิ่ม' => 'invoice_brand/create'
	)
);

$config['ci_bootstrap_menu']['menu']['logout'] = array(
	'name' => 'ออกจากระบบ',
	'url' => 'panel/logout',
	'icon' => 'fa fa-sign-out',
);