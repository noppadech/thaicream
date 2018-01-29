
<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	class Commentorder extends Admin_Controller {
		public function __construct() {
			parent::__construct();
			$this->load->library('form_builder');
			$this->load->library('form_validation');
			$this->load->model('mo_commentorder');
			$this->load->helper('url');
		}
		
		public function index() {
			
			$this->load->library('form_validation');
			$this->mPageTitle = 'Commentorder';
			$this->mViewData['data_cat'] = $this->mo_commentorder->get_all();
			$form = $this->form_builder->create_form();
			$this->mViewData['form'] = $form;
			$this->render('commentorder/v_commentorder');
		}

		public function create($id=NULL) {

			$this->load->library('form_validation');
				$this->form_validation->set_rules('order_id','Order_id', 'required');
				$this->form_validation->set_rules('admin_id','Admin_id', 'required');
				$this->form_validation->set_rules('detail','Detail', 'required');
						
		$this->mViewData['commentorder'] = '';

		if($id!=NULL || !empty($this->input->post('comment_id'))){
			if($this->form_validation->run() == FALSE){
				$this->mViewData['commentorder'] = $this->mo_commentorder->get_by_key($id);
			}
			else{
			$this->mo_commentorder->comment_id = $this->input->post('comment_id');
				$this->mo_commentorder->order_id = $this->input->post('order_id');
				$this->mo_commentorder->admin_id = $this->input->post('admin_id');
				$this->mo_commentorder->detail = $this->input->post('detail');
				
				$this->mo_commentorder->updates();
				redirect('admin/commentorder/', 'refresh');
			}
		}
		else{
			if($this->form_validation->run() == FALSE){
				
			}
			else{
			$this->mo_commentorder->comment_id = $this->input->post('comment_id');
				$this->mo_commentorder->order_id = $this->input->post('order_id');
				$this->mo_commentorder->admin_id = $this->input->post('admin_id');
				$this->mo_commentorder->detail = $this->input->post('detail');
				
				$this->mo_commentorder->inserts();
				redirect('admin/commentorder/', 'refresh');
			}
		}

		$this->mPageTitle = 'Create commentorder';
		
		$form = $this->form_builder->create_form();
		$this->mViewData['form'] = $form;
		$this->render('commentorder/v_commentorder_create');
	}
	
	public function deletes($id=NULL) {
		if($id!=NULL){
			$this->mo_commentorder->comment_id = $id;
			$this->mo_commentorder->deletes();
		}
		redirect('admin/commentorder/', 'refresh');
	}

}
						