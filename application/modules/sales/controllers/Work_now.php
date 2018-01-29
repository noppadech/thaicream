<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Work_now extends Admin_Controller {
	public function __construct() {
		parent::__construct();
		$this->load->library('form_builder');
		$this->load->library('form_validation');
		$this->load->model('mo_work_now');
		$this->load->model('mo_commentorder');
		$this->load->helper('url');
		
		if(!empty($this->config->item('ci_bootstrap')['progect_id'])){
			$key = array_search($this->config->item('ci_bootstrap')['progect_id'],$this->session->userdata('cotton_us'));
		}
		
		//echo $this->config->item('ci_bootstrap')['progect_id'];
	}
	
	public function index($id=null) {
		
		$this->load->library('form_validation');
		$this->mPageTitle = 'งานปัจจุบัน';
		
		if($this->keymanager!=null || $this->keyadmin!=NULL || $this->keywebmaster!= NULL){
			// $this->mViewData['data_cat'] = $this->mo_work_now->get_by_key_groupby($this->config->item('ci_bootstrap')['progect_id'],$id);
		}
		else{
			// $this->mViewData['data_cat'] = $this->mo_work_now->get_by_key_groupby($this->config->item('ci_bootstrap')['progect_id'],$id,$this->session->userdata('user_id'));
		}
		
		//dd($this->mViewData['data_cat']);
		
		$form = $this->form_builder->create_form();
		$this->mViewData['form'] = $form;
		$this->render('work_now/v_work_now');
	}
	
	public function persen_all_group($order_id=NULL,$group_id=NULL,$link=NULL) {
		
		return $this->mo_work_now->get_by_persec_all_group($order_id,$link);
		
	}
	
	public function persen_all_group_ajax($order_id=NULL,$group_id=NULL,$link=NULL) {
		
		$persens_ = $this->mo_work_now->get_by_persec_all_group($order_id,$link);

		foreach($persens_ as $rows){

			//echo '<div class="modal-body">';
			echo '	<p style="text-align: left;'; 
			
			if($rows['status']!="") 
				echo "color:red;";
			echo '">'.$rows['names']; 
			if($rows['status']!="") 
				echo " (".$rows['status'].")"; 
			
			echo '</p>';
			echo '	<div class="progress progress-sm active">';
			echo '		<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: '.$rows['persec'].'%;color: #000;">';
			echo '		  '.$rows['persec'].'%';
			echo '		</div>';
			echo '	</div>';
			//echo '</div>';
		}
		
	}
	
	public function showall($id=null) {
		
		$this->load->library('form_validation');
		$this->mPageTitle = 'งานปัจจุบัน';
		
		$this->mViewData['data_cat'] = $this->mo_work_now->get_by_key_group($this->config->item('ci_bootstrap')['progect_id'],$id);
		
		//dd($this->mViewData['data_cat']);
		
		$form = $this->form_builder->create_form();
		$this->mViewData['form'] = $form;
		$this->render('work_now/v_work_now_in');
	}

	public function create($id=NULL,$order_id=NULL) {

		$this->load->library('form_validation');
		$this->form_validation->set_rules('order_id','เลขที่เอกสาร', 'required');
		$this->form_validation->set_rules('work_now_detail','รายการ', 'required');
				
		$this->mViewData['work_now'] = '';
		$this->mViewData['order_id'] = $order_id;

		if(($id!=NULL && $id!=0) || !empty($this->input->post('work_now_id',true))){
			if($this->form_validation->run() == FALSE ){
				//if($order_id==NULL){
					$this->mViewData['work_now'] = $this->mo_work_now->get_by_key($id);
				//}else{
					
				//}
			}
			else{
				$this->mo_work_now->work_now_id = $this->input->post('work_now_id',true);
				$this->mo_work_now->order_id = $this->input->post('order_id',true);
				$this->mo_work_now->group_module_id = $this->config->item('ci_bootstrap')['progect_id'];
				$this->mo_work_now->work_now_detail = $this->input->post('work_now_detail',true);
				$this->mo_work_now->work_now_status = $this->input->post('work_now_status',true);
			//	$this->mo_work_now->admin_id = $this->input->post('admin_id',true);
				$this->mo_work_now->manager_id = $this->session->userdata('user_id');
				
				if ($this->keymanager !== false || $this->keyadmin !== false || $this->keywebmaster !== false){
					$this->mo_work_now->updates();
				}
				
				redirect($this->config->item('ci_bootstrap')['link_module'].'/work_now/showall/'.$order_id, 'refresh');
			}
		}
		else{
			if($this->form_validation->run() == FALSE){
				
			}
			else{
			$this->mo_work_now->work_now_id = $this->input->post('work_now_id',true);
				$this->mo_work_now->order_id = $this->input->post('order_id',true);
				$this->mo_work_now->group_module_id = $this->config->item('ci_bootstrap')['progect_id'];
				$this->mo_work_now->work_now_detail = $this->input->post('work_now_detail',true);
				$this->mo_work_now->work_now_status = $this->input->post('work_now_status',true);
				$this->mo_work_now->admin_id = 0;
				$this->mo_work_now->manager_id = $this->session->userdata('user_id');
				
				if ($this->keymanager !== false || $this->keyadmin !== false || $this->keywebmaster !== false){
					$this->mo_work_now->inserts();
				}
				redirect($this->config->item('ci_bootstrap')['link_module'].'/work_now/showall/'.$order_id, 'refresh');
			}
		}

		$this->mPageTitle = 'เพิ่มงาน';
		
		$form = $this->form_builder->create_form();
		$this->mViewData['form'] = $form;
		$this->render('work_now/v_work_now_create');
	}
	
	public function get_comment($key=null){
		return $this->mo_work_now->get_by_key_order($key);
	}
	
	public function get_comment_com($key=null){
		return $this->mo_commentorder->get_by_key_order($key);
	}
	
	public function comment() {

		$this->form_validation->set_rules('order_id','Order', 'required');
		$this->form_validation->set_rules('detail','Detail', 'required');
		$ins_com_id = null;
		if($this->form_validation->run() == FALSE){
				
		}else{
			$date = new DateTime("now", new DateTimeZone('Asia/Bangkok') );
			$data_ = array(
						"work_now_id" => $this->input->post('order_id',true),
						"admin_id" => $this->session->userdata('user_id'),
						"work_comment_detail" => $this->input->post('detail',true),
						"comment_date" => $date->format('Y-m-d H:i:s'),
					);
			
			
			$ins_com_id = $this->mo_work_now->inserts_array_comment($data_);
		}
		
		$data_to = array(
			'token' => $this->security->get_csrf_hash(),
			'cks'	=> $ins_com_id
			);

		echo json_encode($data_to);
		
	//	redirect('supportsales/work_now/', 'refresh');
	}
	
	public function comment_com() {

		$this->form_validation->set_rules('order_id','Order', 'required');
		$this->form_validation->set_rules('detail','Detail', 'required');
		$ins_com_id = null;
		if($this->form_validation->run() == FALSE){
				
		}else{
			$date = new DateTime("now", new DateTimeZone('Asia/Bangkok') );
			$data_ = array(
						"work_now_id" => $this->input->post('order_id',true),
						"admin_id" => $this->session->userdata('user_id'),
						"work_comment_detail" => $this->input->post('detail',true),
						"comment_date" => $date->format('Y-m-d H:i:s'),
					);
			
			
			$ins_com_id = $this->mo_work_now->inserts_array_comment($data_);
		}
		
		$data_to = array(
			'token' => $this->security->get_csrf_hash(),
			'cks'	=> $ins_com_id
			);

		echo json_encode($data_to);
		
	//	redirect('supportsales/work_now/', 'refresh');
	}
	
	public function change_status() {

		$this->form_validation->set_rules('order_id','ID No.', 'required');
		$this->form_validation->set_rules('value','Value', 'required');
		
		if($this->form_validation->run() == FALSE){
				
		}else{
			
			$check_st = $this->mo_work_now->get_by_key($this->input->post('order_id',true));
			if(!empty($check_st)){
				if($check_st[0]->work_now_status == 3){
					if($this->keymanager !== false || $this->keyadmin !== false || $this->keywebmaster !== false){
						$data_ = array(
							"work_now_status" => $this->input->post('value',true),
							"work_now_dateend" => date('Y-m-d'),
						);
						
						$data_key = array("work_now_id" => $this->input->post('order_id',true));
						
						
						$this->mo_work_now->updates_array($data_,$data_key);
					}
				}else{
					$data_ = array(
							"work_now_status" => $this->input->post('value',true),
							"work_now_dateend" => date('Y-m-d'),
					);
					
					$data_key = array("work_now_id" => $this->input->post('order_id',true));
					
					
					$this->mo_work_now->updates_array($data_,$data_key);
				}
			}
			
			
		}
		
		$data_to = array(
			'token' => $this->security->get_csrf_hash(),
			);

		echo json_encode($data_to);
		
	//	redirect('supportsales/work_now/', 'refresh');
	}
	
	public function persen($order_id=NULL) {
		
		return $this->mo_work_now->get_by_persec($this->config->item('ci_bootstrap')['progect_id'],$order_id);
		
	}
	
	public function deletes($id=NULL,$order_id=NULL) {
		if($id!=NULL && ($this->keymanager !== false || $this->keyadmin !== false || $this->keywebmaster !== false)){
			$this->mo_work_now->work_now_id = $id;
			$this->mo_work_now->deletes();
		}
		redirect($this->config->item('ci_bootstrap')['link_module'].'/work_now/showall/'.$order_id, 'refresh');
	}
	
	public function delete_comment() {
		$work_comment_id = $this->input->post('order_id',true);
		$cks = false;
		if($work_comment_id!=NULL && ($this->keymanager !== false || $this->keyadmin !== false || $this->keywebmaster !== false)){
			$this->mo_work_now->deletes_comment($work_comment_id);
			$cks = true;
		}
		
		$data_to = array(
			'token' => $this->security->get_csrf_hash(),
			'cks'	=> $cks
			);

		echo json_encode($data_to);
		
		//redirect('supportsales/work_now/', 'refresh');
	}
	
	public function delete_comment_com() {
		$work_comment_id = $this->input->post('order_id',true);
		$cks = false;
		if($work_comment_id!=NULL && ($this->keymanager !== false || $this->keyadmin !== false || $this->keywebmaster !== false)){
			$this->mo_work_now->deletes_comment($work_comment_id);
			$cks = true;
		}
		
		$data_to = array(
			'token' => $this->security->get_csrf_hash(),
			'cks'	=> $cks
			);

		echo json_encode($data_to);
		
		//redirect('supportsales/work_now/', 'refresh');
	}
	
	public function change_status_all($order_id=NULL) {
		
		$data_ = array(
				"work_now_status" => 3,
				"work_now_dateend" => date('Y-m-d'),
		);
		$data_key = array("order_id" => $order_id,"group_module_id" => $this->config->item('ci_bootstrap')['progect_id']);
		$this->mo_work_now->updates_array($data_,$data_key);
		echo true;
	}

	public function datatable_now($id=null){
		$columns = array(
                            0 => 'order_id',
                            1 => 'order_id',
                            // 2 => 'btn',
                            // 3 => 'note',
                            // 4 => 'view',
                            // 5 => 'tr',
                        );

		$limit = $this->input->post('length');
        $start = $this->input->post('start');
        $order = $columns[$this->input->post('order')[0]['column']];
        $dir = $this->input->post('order')[0]['dir'];

        $totalData = $this->mo_work_now->allposts_count($this->config->item('ci_bootstrap')['progect_id'],$id);

        $totalFiltered = $totalData;

        if(empty($this->input->post('search')['value']))
        {
        	if($this->keymanager!=null || $this->keyadmin!=NULL || $this->keywebmaster!= NULL) {
        		$posts = $this->mo_work_now->allposts($limit,$start,$order,$dir,$this->config->item('ci_bootstrap')['progect_id']);
        	} else {
        		$posts = $this->mo_work_now->allposts($limit,$start,$order,$dir,$this->config->item('ci_bootstrap')['progect_id'],$this->session->userdata('user_id'));
        	}
        }
        else {
            $search = $this->input->post('search')['value'];

            $posts =  $this->mo_work_now->posts_search($limit,$start,$search,$order,$dir,$this->config->item('ci_bootstrap')['progect_id']);

            $totalFiltered = $this->mo_work_now->posts_search_count($search,$this->config->item('ci_bootstrap')['progect_id']);
        }

        $data = array();

        if(!empty($posts))
        {
            foreach ($posts as $post)
            {
            	$date = date('Y-m-d',strtotime("+3 days"));



            	if($post->status != 2 && $post->status != 3){
            		if($date>=$post->order_datelate && $post->status==1){
            		// echo "<tr style='background-color: rgba(231, 243, 58, 0.45)'>";
            			$tr =  $post->order_datelate." && ".date('Y-m-d',strtotime("+3 days"));
            	}

            	if($post->type_order == 0){
            		$type = "งานแบรนด์";
            	} else {
            		$type = "งานกิโลกรัม";
            	}

				$order_date = splitDateDb3($post->order_date,'/');
				$order_datelate = splitDateDb3($post->order_datelate,'/');

				if(!empty($post->status)){
					if($post->status == 1){
						$v_status = "กำลังดำเนินงาน";
					} elseif($post->status == 2){
						$v_status = "งานมีปัญหา";
					} elseif($post->status == 3){
						$v_status = "เสร็จสิ้น";
					}
				}

            	$no   = '
                เลขที่ : '.$post->code_id.'</br>
   				สินค้า : '.$post->name_order.'</br>
                ลูกค้า : '.$post->name_customer.'</br>
				เซล : '.$post->first_name.' '.$post->last_name.'</br>
				ประเภท : '.$type.'</br>
				เริ่ม : '.$order_date.'</br>
				กำหนด : '.$order_datelate.'</br>
				';

				$status = ''. $v_status .'';

				$btn = '
					<button type="button" class="btn btn-success btn-md" onclick="change_status_all('.$post->order_id.')">เสร็จทั้งหมด</button>
					<button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#exampleModal" data-whatever="'.$post->order_id.'">ดูรายละเอียด</button>
				';

				if(!empty($post->img)){
					$img = base_url("assets\uploads\users\'".$post->img."'");
				} else {
					$img = base_url("assets\uploads\users\sales-icon-32.png");
				}
				$xxx = modules::run($this->config->item('ci_bootstrap')['link_module'].'/work_now/get_comment_com',$post->order_id);
				$comment_all = '';
				//dd($comment_all);
				foreach($xxx as $row){
					$comment_all .= '
					<td style="max-width: 150px; text-align:left;" id="comment-'.$row->order_id.'">
						<div class="direct-chat-msg right" id="show_com-'.$row->comment_id.'">
							<img class="direct-chat-img" src="'.$img.'" alt="message user image">
							<div class="direct-chat-text">
								<span class="direct-chat-timestamp pull-right">'.$row->first_name.'</span>
								<span class="direct-chat-timestamp pull-left">'.splitDateTime($row->comment_date).'</span></br>
									'.$row->detail.'
							</div>
						</div>
					<td>
					';
				}

				$view = '
					<a href="javascript:void(0)" onclick="change_status_all('.$post->order_id.')">
						<i class="fa fa-check-square-o" aria-hidden="true"></i>
					</a>
					|
					<a href="work_now/showall/'.$post->order_id.'">
						<i class="fa fa-list-alt" aria-hidden="true"></i>
					</a>
				';

                $nestedData['order_id'] = $no;
                $nestedData['status'] = $status;
                $nestedData['btn'] = $btn;
                $nestedData['note'] = $comment_all;
                $nestedData['view'] = $view;
                // $nestedData['tr'] = $tr;

                $data[] = $nestedData;

            }
            }
        }

        $json_data = array(
                    "draw"            => intval($this->input->post('draw')),
                    "recordsTotal"    => intval($totalData),
                    "recordsFiltered" => intval($totalFiltered),
                    "data"            => $data
                    );

        echo json_encode($json_data);
}

}
						