<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends Admin_Controller {
	
	public function __construct() {
        parent::__construct();
        $this->load->library('form_builder');
		$this->load->model('user_model', 'users');
		$this->load->model('admin_user_model', 'admin');
		$this->load->model('mo_work_now');
		$this->load->model('mo_order', 'order');
		$this->load->library('form_validation');
		$this->load->helper('url');
    }
	
    public function index($month=NULL) {
		
		$this->mViewData['data_cat'] = $this->admin->get_all_cotton();
		
		$this->mViewData['date'] = $month;

		$this->mViewData['work_nows'] =  $this->mo_work_now->get_by_key_groupby_num_row($this->config->item('ci_bootstrap')['progect_id']);

        $this->mViewData['count'] = array(
            'users' => $this->users->count_all(),
        );
        $this->render('v_home');
    }

}
