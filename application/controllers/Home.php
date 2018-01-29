<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Home page
 */
class Home extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('mo_demo_blog_categories','categories');
        $this->load->helper('function');

    }
    public function index() {
//        print_r($this->fontend->get_demo_blog_categories());

//        echo getNowDateFwFive(); 
//        $this->mViewData['result_categories'] = $this->categories->get_by_key(1);
//        $this->categories->pos = 4;
//        $this->categories->title = 'title';
//        $this->categories->inserts();
//        $this->mViewData['result_categories_all'] = $this->categories->get_all();

//        print_r($this->mViewData['result_categories']);

//        print_r($this->categories->get_demo_blog_categories());

        $this->render('v_home', 'full_width');
    }

}
