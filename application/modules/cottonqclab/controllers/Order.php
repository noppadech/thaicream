<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Order extends Admin_Controller {
	
	public $keyadd=NULL;
	public $keyedit=NULL;
	public $keydelete=NULL;
	
	public function __construct() {
		parent::__construct();
		$this->load->library('form_builder');
		$this->load->library('form_validation');
		$this->load->model('mo_order');
		$this->load->model('mo_commentorder');
		$this->load->model('mo_work_now', 'work_now');
		$this->load->model('mo_work_list', 'work_list');
		$this->load->model('admin_user_model', 'admin');
		$this->load->helper('url');
		//$this->config->load('ci_bootstrap', TRUE);
		
		if(!empty($this->config->item('ci_bootstrap')['progect_id'])){
			$key = array_search($this->config->item('ci_bootstrap')['progect_id'],$this->session->userdata('cotton_us'));
			if ($this->keyadd !== false){
				
			}else{
				redirect('admin', 'refresh');
			}
		}
		
		$this->keyadd = array_search(4,$this->session->userdata('group_us'));
		if($this->keyadd===false)
			$this->keyadd = array_search(3,$this->session->userdata('group_us'));
		if($this->keyadd===false)
			$this->keyadd = array_search(2,$this->session->userdata('group_us'));
		if($this->keyadd===false)
			$this->keyadd = array_search(1,$this->session->userdata('group_us'));
		
		
		$this->keyedit = array_search(3,$this->session->userdata('group_us'));
		if($this->keyedit===false)
			$this->keyedit = array_search(2,$this->session->userdata('group_us'));
		if($this->keyedit===false)
			$this->keyedit = array_search(1,$this->session->userdata('group_us'));
		
		$this->keydelete = array_search(3,$this->session->userdata('group_us'));
		if($this->keydelete===false)
			$this->keydelete = array_search(2,$this->session->userdata('group_us'));
		if($this->keydelete===false)
			$this->keydelete = array_search(1,$this->session->userdata('group_us'));
	}
	
	public function index() {
		
		$this->load->library('form_validation');
		$this->mPageTitle = 'งานแบรนด์';
		$this->mViewData['data_cat'] = $this->mo_order->get_all_order(0);
		
		$this->mViewData['type_order'] = 0;
		$this->mViewData['adddata'] = "create";
		$this->mViewData['data_url'] = "";
		
		$form = $this->form_builder->create_form();
		$this->mViewData['form'] = $form;
		$this->render('order/v_order');
	}
	
	public function orderkg() {
		
		$this->load->library('form_validation');
		$this->mPageTitle = 'งานกิโลกรัม';
		$this->mViewData['data_cat'] = $this->mo_order->get_all_order(1);
		
		$this->mViewData['type_order'] = 1;
		$this->mViewData['adddata'] = "createkg";
		$this->mViewData['data_url'] = "orderkg";
		
		$form = $this->form_builder->create_form();
		$this->mViewData['form'] = $form;
		$this->render('order/v_order');
	}
	
	public function get_comment($key=null){
		return $this->mo_commentorder->get_by_key_order($key);
	}

	public function create($id=NULL) {
		
		//echo $this->config['progect_id'];;
		
		$this->load->library('form_validation');
		$this->form_validation->set_rules('code_id','เลขที่เอกสาร', 'required');
		$this->form_validation->set_rules('name_order','ชื่อสินค้า', 'required');
		$this->form_validation->set_rules('name_customer','ชื่อลุกค้า', 'required');
		//$this->form_validation->set_rules('status','สถานะ', 'required');
						
		$this->mViewData['order'] = '';
		$this->mViewData['type_order'] = 0;
		$this->mViewData['cotton_array'] = array();
		

		if($id!=NULL || !empty($this->input->post('order_id',true))){
			if($this->form_validation->run() == FALSE){
				$this->mViewData['order'] = $this->mo_order->get_by_key($id);
			}
			else{
				$this->mo_order->order_id = $this->input->post('order_id',true);
				$this->mo_order->code_id = $this->input->post('code_id',true);
				$this->mo_order->name_order = $this->input->post('name_order',true);
				$this->mo_order->name_customer = $this->input->post('name_customer',true);
				$this->mo_order->order_workcount = $this->input->post('order_workcount',true);
				$this->mo_order->status = $this->input->post('status',true);
				$this->mo_order->order_date = $this->input->post('order_date',true);
				$date1 = str_replace('-', '/', $this->input->post('order_date',true));
				$order_datelate = date('Y-m-d',strtotime($date1 . "+".$this->input->post('order_workcount',true)." days"));
				$this->mo_order->order_datelate = $order_datelate;
				$this->mo_order->admin_id = $this->session->userdata('user_id');
				
				if ($this->keyedit !== false){
					$this->mo_order->updates();
				}
				redirect('supportsales/order/', 'refresh');
			}
		}
		else{
			
			$this->mViewData['cotton'] = $this->admin->get_all_cotton();
			
			if($this->form_validation->run() == FALSE){
				
			}
			else{
				$this->mo_order->order_id = $this->input->post('order_id',true);
				$this->mo_order->code_id = $this->input->post('code_id',true);
				$this->mo_order->name_order = $this->input->post('name_order',true);
				$this->mo_order->name_customer = $this->input->post('name_customer',true);
				$this->mo_order->order_workcount = $this->input->post('order_workcount',true);
				//$this->mo_order->status = $this->input->post('status',true);
				$this->mo_order->type_order = $this->input->post('type_order',true);
				$this->mo_order->status = 1;
				$this->mo_order->admin_id = $this->session->userdata('user_id');
				$this->mo_order->order_date = date('Y-m-d');
				$date1 = str_replace('-', '/', date('Y-m-d'));
				$order_datelate = date('Y-m-d',strtotime($date1 . "+".$this->input->post('order_workcount',true)." days"));
				$this->mo_order->order_datelate = $order_datelate;
				
				
				if ($this->keyadd !== false){
					$order_id = $this->mo_order->inserts();
					
					$work_data = $this->work_list->get_all_use();
					$data_ = array();
					
					foreach($work_data as $row){
						if(!empty($this->input->post($row->group_module_id))){
							$data_[] = array(
										"order_id" 			=> $order_id,
										"group_module_id" 	=> $row->group_module_id,
										"work_now_detail" 	=> $row->work_detail,
										"work_now_status" 	=> 1,
									);
								//$this->work_now->inserts_array($data_);
						}
					}
					$this->work_now->inserts_array_sup($data_);
				}
				
				//die();
				redirect('supportsales/order/', 'refresh');
			}
		}
		
		

		$this->mPageTitle = 'เพิ่มเอกสาร';
		
		$form = $this->form_builder->create_form();
		$this->mViewData['form'] = $form;
		$this->render('order/v_order_create');
	}
	
	public function createkg($id=NULL) {
		
		//echo $this->config['progect_id'];;
		
		$this->load->library('form_validation');
		$this->form_validation->set_rules('code_id','เลขที่เอกสาร', 'required');
		$this->form_validation->set_rules('name_order','ชื่อสินค้า', 'required');
		$this->form_validation->set_rules('name_customer','ชื่อลุกค้า', 'required');
		//$this->form_validation->set_rules('status','สถานะ', 'required');
						
		$this->mViewData['order'] = '';
		$this->mViewData['type_order'] = 1;
		
		$this->mViewData['cotton_array'] = array("1","4","5","14");

		if($id!=NULL || !empty($this->input->post('order_id',true))){
			if($this->form_validation->run() == FALSE){
				$this->mViewData['order'] = $this->mo_order->get_by_key($id);
			}
			else{
				$this->mo_order->order_id = $this->input->post('order_id',true);
				$this->mo_order->code_id = $this->input->post('code_id',true);
				$this->mo_order->name_order = $this->input->post('name_order',true);
				$this->mo_order->name_customer = $this->input->post('name_customer',true);
				$this->mo_order->order_workcount = $this->input->post('order_workcount',true);
				$this->mo_order->status = $this->input->post('status',true);
				$this->mo_order->order_date = $this->input->post('order_date',true);
				$date1 = str_replace('-', '/', $this->input->post('order_date',true));
				$order_datelate = date('Y-m-d',strtotime($date1 . "+".$this->input->post('order_workcount',true)." days"));
				$this->mo_order->order_datelate = $order_datelate;
				$this->mo_order->admin_id = $this->session->userdata('user_id');
				
				if ($this->keyedit !== false){
					$this->mo_order->updates();
				}
				redirect('supportsales/order/orderkg', 'refresh');
			}
		}
		else{
			
			$this->mViewData['cotton'] = $this->admin->get_all_cotton();
			
			if($this->form_validation->run() == FALSE){
				
			}
			else{
				$this->mo_order->order_id = $this->input->post('order_id',true);
				$this->mo_order->code_id = $this->input->post('code_id',true);
				$this->mo_order->name_order = $this->input->post('name_order',true);
				$this->mo_order->name_customer = $this->input->post('name_customer',true);
				$this->mo_order->order_workcount = $this->input->post('order_workcount',true);
				//$this->mo_order->status = $this->input->post('status',true);
				$this->mo_order->type_order = $this->input->post('type_order',true);
				$this->mo_order->status = 1;
				$this->mo_order->admin_id = $this->session->userdata('user_id');
				$this->mo_order->order_date = date('Y-m-d');
				$date1 = str_replace('-', '/', date('Y-m-d'));
				$order_datelate = date('Y-m-d',strtotime($date1 . "+".$this->input->post('order_workcount',true)." days"));
				$this->mo_order->order_datelate = $order_datelate;
				
				$set_data = array(
								"code_id" => $this->input->post('code_id',true),
								"name_order" => $this->input->post('name_order',true),
								"name_customer" => $this->input->post('name_customer',true),
								"status" => 1,
								"type_order" => 1,
								"order_workcount" => $this->input->post('order_workcount',true),
								"admin_id" => $this->session->userdata('user_id'),
								"order_date" => date('Y-m-d'),
								"order_datelate" => $order_datelate,
								);
				
				
				if ($this->keyadd !== false){
					$order_id = $this->mo_order->inserts_array($set_data);
					
					$work_data = $this->work_list->get_all_use();
					
					foreach($work_data as $row){
						if(!empty($this->input->post($row->group_module_id))){
							$data_ = null;
							$data_ = array(
										"order_id" 			=> $order_id,
										"group_module_id" 	=> $row->group_module_id,
										"work_now_detail" 	=> $row->work_detail,
										"work_now_status" 	=> 1,
									);
							$this->work_now->inserts_array($data_);
							
						//	echo $row->group_module_id." => ".$this->input->post($row->group_module_id)."</br>";
						}
					}
					
				}
				redirect('supportsales/order/orderkg', 'refresh');
			}
		}
		
		
		
		

		$this->mPageTitle = 'เพิ่มเอกสาร';
		
		$form = $this->form_builder->create_form();
		$this->mViewData['form'] = $form;
		$this->render('order/v_order_create');
	}
	
	public function comment() {
		
		$this->form_validation->set_rules('order_id','Order', 'required');
		$this->form_validation->set_rules('detail','Detail', 'required');
		$ins_com_id = false;
		if($this->form_validation->run() == FALSE){
				
		}else{

			$this->mo_commentorder->order_id = $this->input->post('order_id',true);
			$this->mo_commentorder->admin_id = $this->session->userdata('user_id');
			$this->mo_commentorder->detail = $this->input->post('detail',true);
			$this->mo_commentorder->comment_date = date('Y-m-d h:i:s');
			
			$ins_com_id = $this->mo_commentorder->inserts();

		}
		
		$data_to = array(
			'token' => $this->security->get_csrf_hash(),
			'cks'	=> $ins_com_id
			);

		echo json_encode($data_to);
		
		
		//redirect('supportsales/order/', 'refresh');
	}
	
	public function deletes($id=NULL,$url=NULL) {
		if($id!=NULL && $this->keydelete !== false){
			$this->mo_order->order_id = $id;
			$this->mo_order->deletes();
			
			$this->work_now->deletes_by_order_id($id);
			
		}
		//redirect('supportsales/order/', 'refresh');
		redirect('supportsales/order/'.$url, 'refresh');
	}
	/*
	public function delete_comment($order_id=null) {
		
		if($order_id!=NULL && $this->keydelete !== false){
			$this->mo_commentorder->comment_id = $order_id;
			$this->mo_commentorder->deletes();
		}
		redirect('supportsales/order/', 'refresh');
	}*/
	
	public function delete_comment() {
		$order_id = $this->input->post('order_id',true);
		$cks = false;
		if($order_id!=NULL && ($this->keymanager !== false || $this->keyadmin !== false || $this->keywebmaster !== false)){
			$this->mo_commentorder->comment_id = $order_id;
			$this->mo_commentorder->deletes();
			$cks = true;
		}
		
		$data_to = array(
			'token' => $this->security->get_csrf_hash(),
			'cks'	=> $cks
			);

		echo json_encode($data_to);
		
		//redirect('supportsales/work_now/', 'refresh');
	}
	

}
						