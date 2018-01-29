<?php

defined('BASEPATH') OR exit('No direct script access allowed');
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
//Batch Processing Record (บันทึกการผลิต)
$config['ci_bootstrap_menu']['menu']['equipment'] = array(
    'name' => 'อุปกรณ์การผลิต',
    'url' => 'equipment',
    'icon' => 'fa fa-cubes',
    'children' => array(
        'เพิ่มอุปกรณ์การผลิต' => 'equipment/create',
        'จัดการอุปกรณ์การผลิต' => 'equipment'
    )
);
//Batch Processing Record (บันทึกการผลิต)
$config['ci_bootstrap_menu']['menu']['bpr'] = array(
    'name' => 'บันทึกการผลิต',
    'url' => 'bpr',
    'icon' => 'fa fa-cubes',
    'children' => array(
        'สร้างบันทึกการผลิต' => 'bpr/create',
        'จัดการบันทึกการผลิต' => 'bpr'
    )
);
$config['ci_bootstrap_menu']['menu']['formula'] = array(
    'name' => 'สูตรสินค้า',
    'url' => 'formula',
    'icon' => 'fa fa-cubes',
    'children' => array(
        'เพิ่มสูตรสินค้า' => 'formula/create',
        'จัดการสูตรสินค้า' => 'formula'
    )
);
$config['ci_bootstrap_menu']['menu']['materials'] = array(
    'name' => 'วัตถุดิบ',
    'url' => 'materials',
    'icon' => 'fa fa-cubes',
    'children' => array(
        'เพิ่มวัตถุดิบ' => 'materials/create',
        'จัดการวัตถุดิบ' => 'materials'
    )
);
$config['ci_bootstrap_menu']['menu']['customer'] = array(
    'name' => 'งานเอกสาร',
    'url' => 'customer',
    'icon' => 'fa fa-users',
);
$config['ci_bootstrap_menu']['menu']['logout'] = array(
    'name' => 'ออกจากระบบ',
    'url' => 'panel/logout',
    'icon' => 'fa fa-sign-out',
);
