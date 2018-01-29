<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Work_list extends Admin_Controller {
	
	public $keyadd=NULL;
	public $keyedit=NULL;
	public $keydelete=NULL;
	
	public function __construct() {
		parent::__construct();
		$this->load->library('form_builder');
		$this->load->library('form_validation');
		$this->load->model('mo_work_list');
		$this->load->model('admin_user_model', 'admin');
		$this->load->helper('url');
		
		if(!empty($this->config->item('ci_bootstrap')['progect_id'])){
			$key = array_search($this->config->item('ci_bootstrap')['progect_id'],$this->session->userdata('cotton_us'));
		}
		

		$this->keyadd = array_search(2,$this->session->userdata('group_us'));
		if($this->keyadd===false)
			$this->keyadd = array_search(1,$this->session->userdata('group_us'));
		

		$this->keyedit = array_search(2,$this->session->userdata('group_us'));
		if($this->keyedit===false)
			$this->keyedit = array_search(1,$this->session->userdata('group_us'));
		

		$this->keydelete = array_search(2,$this->session->userdata('group_us'));
		if($this->keydelete===false)
			$this->keydelete = array_search(1,$this->session->userdata('group_us'));
		
	}
	
	public function index($key=NULL) {
		
		$this->load->library('form_validation');
		$this->mPageTitle = 'รายละเอียดงาน';
		$this->mViewData['data_cat'] = $this->mo_work_list->get_all_full($key);
		
		$this->mViewData['cotton'] = $this->admin->get_all_cotton();
		$this->mViewData['key_id'] = $key;
		//dd($this->mViewData['data_cat']);
		$form = $this->form_builder->create_form();
		$this->mViewData['form'] = $form;
		$this->render('work_list/v_work_list');
	}

	public function create($id=NULL) {

		$this->load->library('form_validation');
		$this->form_validation->set_rules('work_detail','Work_detail', 'required');
		//$this->form_validation->set_rules('work_status','Work_status', 'required');
		//$this->form_validation->set_rules('group_module_id','Group_module_id', 'required');
		//$this->form_validation->set_rules('admin_id','Admin_id', 'required');
					
		$this->mViewData['work_list'] = '';
		
		$this->mViewData['cotton'] = $this->admin->get_all_cotton();

		if($id!=NULL || !empty($this->input->post('work_id',true))){
			if($this->form_validation->run() == FALSE){
				$this->mViewData['work_list'] = $this->mo_work_list->get_by_key($id);
			}
			else{
				$this->mo_work_list->work_id = $this->input->post('work_id',true);
				$this->mo_work_list->work_detail = $this->input->post('work_detail',true);
				$this->mo_work_list->work_status = $this->input->post('work_status',true);
				$this->mo_work_list->group_module_id = $this->input->post('group_module_id',true);
				$this->mo_work_list->admin_id = $this->session->userdata('user_id');
				
				if ($this->keyedit !== false){
					$this->mo_work_list->updates();
				}
				redirect('admin/work_list/', 'refresh');
			}
		}
		else{
			if($this->form_validation->run() == FALSE){
				
			}
			else{
				$this->mo_work_list->work_id = $this->input->post('work_id',true);
				$this->mo_work_list->work_detail = $this->input->post('work_detail',true);
				$this->mo_work_list->work_status = $this->input->post('work_status',true);
				$this->mo_work_list->group_module_id = $this->input->post('group_module_id',true);
				$this->mo_work_list->admin_id = $this->session->userdata('user_id');
				if ($this->keyadd !== false){
					$this->mo_work_list->inserts();
				}
				redirect('admin/work_list/', 'refresh');
			}
		}

		$this->mPageTitle = 'Create Work List';
		
		$form = $this->form_builder->create_form();
		$this->mViewData['form'] = $form;
		$this->render('work_list/v_work_list_create');
	}
	
	public function deletes($id=NULL) {
		if($id!=NULL && $this->keydelete !== false){
			$this->mo_work_list->work_id = $id;
			$this->mo_work_list->deletes();
		}
		redirect('admin/work_list/', 'refresh');
	}

}
						