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
	/*
				$config['ci_bootstrap_menu']['menu']['order'] = array(
					'name' => 'เอกสาร',
					'url' => 'order',
					'icon' => 'fa fa-users',
					'children' => array(
						'รายการ' => 'order',
						'เพิ่ม' => 'order/create'
					)
				);*/
				$config['ci_bootstrap_menu']['menu']['work_now'] = array(
					'name' => 'งานปัจจุบัน',
					'url' => 'work_now',
					'icon' => 'fa fa-users',
					//'children' => array(
						//'รายการ' => 'work_now',
						//'เพิ่ม' => 'work_now/create'
					//)
				);
				
				$config['ci_bootstrap_menu']['menu']['logout'] = array(
					'name' => 'ออกจากระบบ',
					'url' => 'panel/logout',
					'icon' => 'fa fa-sign-out',
				);