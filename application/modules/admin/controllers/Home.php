<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends Admin_Controller {
	
	public function __construct() {
        parent::__construct();
        $this->load->library('form_builder');
		$this->load->model('user_model', 'users');
		$this->load->model('admin_user_model', 'admin');
		$this->load->model('mo_order', 'order');
		$this->load->library('form_validation');
		$this->load->helper('url');
    }
	
    public function index($month=NULL) {
		
		$this->mViewData['data_cat'] = $this->admin->get_all_cotton();
		
		$this->mViewData['date'] = $month;
		//dd($this->session->userdata());
		
		$this->mViewData['work_late'] =  $this->order->get_all_order_late_num_rows($month);
		
		$this->mViewData['work_nows'] =  $this->order->get_all_order_num_rows(1,$month);
		
		// $this->mViewData['work_prom'] =  $this->order->get_all_order_num_rows_problem(2,$month);
		
		$this->mViewData['work_ss'] =  $this->order->get_all_order_num_rows_success(3,$month);
		$this->mViewData['work_prom']=null;
        $this->mViewData['count'] = array(
            'users' => $this->users->count_all(),
        );
        $this->render('home');
    }

}
