<?php





defined('BASEPATH') OR exit('No direct script access allowed');





class Report extends Admin_Controller {





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








    }





    public function index() {


		// $this->mViewData['data_cat'] = $this->mo_order->get_all_order_re(1);



		$this->mViewData['link'] = "now";


        $this->render('report/v_report');


    }





	public function now($month=NULL) {

		$stat = 0;

		$lim = 50;

		if($this->input->get("all")==1)

			$lim = 0;

		else

			$lim = 0;


		// $this->mViewData['data_cat'] = $this->mo_order->get_all_order_re(1,$month,$lim,$stat);

		$this->mPageTitle = "กำลังดำเนินการ";


		$this->mViewData['link'] = "now";


		$this->mViewData['date'] = $month;


        $this->render('report/v_report');


    }





	public function late($month=NULL) {





		$stat = 0;


		$lim = 50;


		if($this->input->get("all")==1)


			$lim = 0;


		else


			$lim = 0;





		// $this->mViewData['data_cat'] = $this->mo_order->get_all_order_late($month,$lim,$stat);


		$this->mPageTitle = "งานล่าช้า";


		$this->mViewData['link'] = "late";


		$this->mViewData['date'] = $month;


        $this->render('report/v_report');


    }





	public function problem($month=NULL) {





		$stat = 0;


		$lim = 50;


		if($this->input->get("all")==1)


			$lim = 0;


		else


			$lim = 0;





		// $this->mViewData['data_cat'] = $this->mo_order->get_all_order_re_problem(2,$month,$lim,$stat);


		$this->mPageTitle = "งานที่มีปัญหา";


		$this->mViewData['link'] = "problem";


		$this->mViewData['date'] = $month;


        $this->render('report/v_report');


    }





	public function success($month=NULL) {





		$stat = 0;


		$lim = 50;


		if($this->input->get("all")==1)


			$lim = 0;


		else


			$lim = 0;





		// $this->mViewData['data_cat'] = $this->mo_order->get_all_order_re_success(3,$month);


		$this->mPageTitle = "เสร็จสิ้น";


		$this->mViewData['link'] = "success";

		$link = "success";


		$this->mViewData['date'] = $month;


        $this->render('report/v_report');


    }





	public function showall($order_id=null,$link=NULL) {





		$this->load->library('form_validation');





		$order_title = $this->mo_order->get_by_key_orderone($order_id,$link);


		//dd($order_title);


		$this->mPageTitle = 'เลขที่ : '.$order_title[0]->code_id."</br>".


							'สินค้า : '.$order_title[0]->name_order."</br>".


							'ลูกค้า : '.$order_title[0]->name_customer."</br>"


							;








		//dd($this->mViewData['data_cat']);


		$this->mViewData['order_id'] = $order_id;





		$this->mViewData['group_work'] = $this->work_now->get_by_key_groupby_group_module_id($order_id,$link);





	//	dd($this->mViewData['group_work']);


		$this->mViewData['link'] = $link;


		$form = $this->form_builder->create_form();


		$this->mViewData['form'] = $form;


		$this->render('report/v_report_show');


	}





	public function work_now_data($order_id=null,$group_id=null,$link=NULL){


		return $this->mo_order->get_by_key_order_id($order_id,$group_id,$link);


	}








	public function change_status() {





		$this->form_validation->set_rules('order_id','ID No.', 'required');


		$this->form_validation->set_rules('value','Value', 'required');





		if($this->form_validation->run() == FALSE){





		}else{





			$check_st = $this->mo_order->get_by_key_2_table($this->input->post('order_id',true));


			if(!empty($check_st)){


				if($this->input->post('value',true)==3){


					$date_end = date('Y-m-d');


				}else{


					$date_end = "0000-00-00";


				}


				if($check_st[0]->status == 3){


					if($this->keymanager !== false || $this->keyadmin !== false || $this->keywebmaster !== false){








						$array_work_now = $this->work_now->get_by_key_order_id_array_success($this->input->post('order_id',true));





						$this->work_now->inserts_array_success_back($array_work_now);





						$this->work_now->deletes_by_order_id_success($this->input->post('order_id',true));





						$array_order = $this->mo_order->get_by_key_order_id_array_success($this->input->post('order_id',true));





						$this->mo_order->inserts_array_success_back($array_order);





						$this->mo_order->deletes_success($this->input->post('order_id',true));











						$data_ = array(


							"status" => $this->input->post('value',true),


							"order_date_end" => $date_end,


						);





						$data_key = array("order_id" => $this->input->post('order_id',true));








						$this->mo_order->updates_array($data_,$data_key);








						//$this->mo_order->delete_db_success($this->input->post('order_id',true));


					}


				}else if($this->input->post('value',true)==3){





					$data_ = array(


							"status" => $this->input->post('value',true),


							"order_date_end" => $date_end,


					);





					$data_key = array("order_id" => $this->input->post('order_id',true));








					$this->mo_order->updates_array($data_,$data_key);





					$array_work_now = $this->work_now->get_by_key_order_id_array($this->input->post('order_id',true));





					$this->work_now->inserts_array_success($array_work_now);





					$this->work_now->deletes_by_order_id($this->input->post('order_id',true));





					$array_order = $this->mo_order->get_by_key_order_id_array($this->input->post('order_id',true));





					$this->mo_order->inserts_array_success($array_order);





					$this->mo_order->deletes_array($this->input->post('order_id',true));


					//$this->mo_order->change_db_success($this->input->post('order_id',true));





				}else{


					$data_ = array(


							"status" => $this->input->post('value',true),


							"order_date_end" => $date_end,


					);





					$data_key = array("order_id" => $this->input->post('order_id',true));








					$this->mo_order->updates_array($data_,$data_key);


				}


			}








		}





		$data_to = array(


			'token' => $this->security->get_csrf_hash(),


			);





		echo json_encode($data_to);





	}





	public function comment() {





		$this->form_validation->set_rules('order_id','Order', 'required');


		$this->form_validation->set_rules('detail','Detail', 'required');


		$ins_com_id = null;


		if($this->form_validation->run() == FALSE){





		}else{


			$date = new DateTime("now", new DateTimeZone('Asia/Bangkok') );





			$data_ = array(


						"order_id" => $this->input->post('order_id',true),


						"admin_id" => $this->session->userdata('user_id'),


						"detail" => $this->input->post('detail',true),


						"comment_date" => $date->format('Y-m-d H:i:s'),


					);








			$ins_com_id = $this->mo_commentorder->inserts_array($data_);


		}





		$data_to = array(


			'token' => $this->security->get_csrf_hash(),


			'cks'	=> $ins_com_id


			);





		echo json_encode($data_to);





	//	redirect('supportsales/work_now/', 'refresh');


	}





	public function comment_work() {


		$date = new DateTime("now", new DateTimeZone('Asia/Bangkok') );


		$this->form_validation->set_rules('order_id','Order', 'required');


		$this->form_validation->set_rules('detail','Detail', 'required');


		$ins_com_id = null;


		if($this->form_validation->run() == FALSE){





		}else{





			$data_ = array(


						"work_now_id" => $this->input->post('order_id',true),


						"admin_id" => $this->session->userdata('user_id'),


						"work_comment_detail" => $this->input->post('detail',true),


						"comment_date" => $date->format('Y-m-d H:i:s'),


					);








			$ins_com_id = $this->work_now->inserts_array_comment($data_);


		}





		$data_to = array(


			'token' => $this->security->get_csrf_hash(),


			'cks'	=> $ins_com_id


			);





		echo json_encode($data_to);





	//	redirect('supportsales/work_now/', 'refresh');


	}





	public function get_comment_work($key=null){


		return $this->work_now->get_by_key_order($key);


	}





	public function get_comment($key=null){


		return $this->mo_commentorder->get_by_key_order($key);


	}





	public function persen($order_id=NULL,$group_id=NULL,$link=NULL) {





		return $this->work_now->get_by_persec($group_id,$order_id,$link);





	}





	public function persen_all_group($order_id=NULL,$group_id=NULL,$link=NULL) {





		return $this->work_now->get_by_persec_all_group($order_id,$link);





	}





	public function persen_all_group_ajax($order_id=NULL,$group_id=NULL,$link=NULL) {





		//return $this->work_now->get_by_persec_all_group($order_id,$link);





		$persens_ = $this->work_now->get_by_persec_all_group($order_id,$link);





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





	public function get_comment_ajax($key=null){


		$com = $this->mo_commentorder->get_by_key_order($key);


		foreach($com as $coms){





			echo '<div class="direct-chat-msg right" id="show_com-'.$coms->comment_id.'">';


			echo '<img class="direct-chat-img" src="'.base_url().'assets/uploads/users/';


			if(!empty($coms->img))


				echo $coms->img;


			else


				echo "sales-icon-32.png";


			echo '" alt="message user image">';


			echo '<div class="direct-chat-text">';


			echo '<span class="direct-chat-timestamp pull-right">'.$coms->first_name.'</span>';


			echo '<span class="direct-chat-timestamp pull-left">'.splitDateTime($coms->comment_date).'</span></br>';


			echo $coms->detail;


			echo '<a role="button" onclick="comment_delete(\''.$coms->comment_id.'\',\''.base_url("admin/report/delete_comment").'\')">';


			echo '		<i class="fa fa-times-circle" aria-hidden="true"></i>';


			echo '</a>';


			echo ' </div>';





			echo '</div>';


		}


	}











	public function get_qc_comment($id=null) {





		$this->mViewData['data_qc'] = $this->mo_order->get_by_key($id);


		echo $this->mViewData['data_qc'][0]->qc_lab;





	}





	public function get_qa_comment($id=null) {





		$this->mViewData['data_qc'] = $this->mo_order->get_by_key($id);


		echo $this->mViewData['data_qc'][0]->qa_lab;





	}








	public function deletes($id=NULL,$order_id=NULL) {


		if($id!=NULL && ($this->keymanager !== false || $this->keyadmin !== false || $this->keywebmaster !== false)){


			$this->work_now->work_now_id = $id;


			$this->work_now->deletes();


		}


		redirect('supportsales/work_now/showall/'.$order_id, 'refresh');


	}





	public function delete_comment() {


		$comment_id = $this->input->post('order_id',true);


		$cks = false;


		if($comment_id!=NULL && ($this->keyadmin !== false || $this->keywebmaster !== false)){


			$this->mo_commentorder->comment_id = $comment_id;


			$this->mo_commentorder->deletes($comment_id);


			$cks = true;


		}





		$data_to = array(


			'token' => $this->security->get_csrf_hash(),


			'cks'	=> $cks


			);





		echo json_encode($data_to);





		//redirect('supportsales/work_now/', 'refresh');


	}





	public function delete_comment_work() {


		$comment_id = $this->input->post('order_id',true);


		$cks = false;


		if($comment_id!=NULL && ($this->keyadmin !== false || $this->keywebmaster !== false)){


			$this->work_now->deletes_comment($comment_id);


			$cks = true;


		}





		$data_to = array(


			'token' => $this->security->get_csrf_hash(),


			'cks'	=> $cks


			);





		echo json_encode($data_to);





		//redirect('supportsales/work_now/', 'refresh');


	}



	public function datatable_now($url=null) {

		// if($this->input->get("all")==1){
		// 	$all = 0;
		// }

		if($url == "now"){
			$condition = "1";
		} elseif($url == "late"){
			$condition = "1";
		} elseif($url == "problem"){
			$condition = "2";
		} elseif($url == "success"){
			$condition = "3";
		} else{
			$condition = "1";
		}

		$columns = array(
                            0 => 'order_id',
                            1 => 'order_id',
                            // 2 => 'btn',
                            // 3 => 'note',
                            // 4 => 'detail',
                            // 5 => 'view',
                        );

		$limit = $this->input->post('length');
        $start = $this->input->post('start');
        $order = $columns[$this->input->post('order')[0]['column']];
        $dir = $this->input->post('order')[0]['dir'];

        if($url == "now"){
    		$totalData = $this->mo_order->allposts_count($this->input->post('month'));
        } elseif($url == "late"){
        	$totalData = $this->mo_order->allposts_count1($this->input->post('month'));
        } elseif($url == "problem"){
    		$totalData = $this->mo_order->allposts_count3($this->input->post('month'));
        } elseif($url == "success"){
    		$totalData = $this->mo_order->allposts_count4($this->input->post('month'));
        }

        $totalFiltered = $totalData;

        if(empty($this->input->post('search')['value']))
        {
        	if($url == "now"){
        		if($limit != "-1"){
            		$posts = $this->mo_order->get_all_order_late2($limit,$start,$order,$dir,$this->input->post('month'));
            	} else {
            		$posts = $this->mo_order->get_all_order_late2(0,$start,$order,$dir);
            	}
        	} elseif($url == "late"){
        		if($limit != "-1"){
            		$posts = $this->mo_order->get_all_order_late1($limit,$start,$order,$dir,$this->input->post('month'));
            	} else {
            		$posts = $this->mo_order->get_all_order_late1(0,$start,$order,$dir);
            	}
        	} elseif($url == "problem"){
        		if($limit != "-1"){
        			$posts = $this->mo_order->get_all_order_late3($limit,$start,$order,$dir,$condition,$this->input->post('month'));
        		} else {
        			$posts = $this->mo_order->get_all_order_late3(0,$start,$order,$dir,$condition);
        		}
        	} elseif($url == "success"){
        		if($limit != "-1"){
        			$posts = $this->mo_order->get_all_order_late4($limit,$start,$order,$dir,$condition,$this->input->post('month'));
        		} else {
        			$posts = $this->mo_order->get_all_order_late4(0,$start,$order,$dir,$condition);
        		}
        	}
        }
        else {
            $search = $this->input->post('search')['value'];

            $posts =  $this->mo_order->posts_search($limit,$start,$search,$order,$dir);

            $totalFiltered = $this->mo_order->posts_search_count($search);
        }

        $data = array();

        if(!empty($posts))
        {
            foreach ($posts as $post)
            {
            	if($post->type_order == 0){
            		$type = "งานแบรนด์";
            	} else {
            		$type = "งานกิโลกรัม";
            	}
            	if($post->order_workcount!=0){
					$order_workcount = splitDateDb3($post->order_datelate,'/');
            	}
				if($post->status==3){
					$status = splitDateDb3($post->order_datelate,'/');
				}
				if(!empty($post->status)){
					if($post->status == 1){
						$v_status = "selected";
						$v_status2 = "";
						$v_status3 = "";
					} elseif($post->status == 2){
						$v_status2 = "selected";
						$v_status = "";
						$v_status3 = "";
					} elseif($post->status == 3){
						$v_status3 = "selected";
						$v_status2 = "";
						$v_status = "";
					}
				}

            	$no   = '
                เลขที่ : '.$post->code_id.'</br>
                สินค้า : '.$post->name_order.'</br>
                ลูกค้า : '.$post->name_customer.'</br>
				เซล : '.$post->first_name.' '.$post->last_name.'</br>
				ประเภท : '.$type.'</br>
				เริ่ม : '.$order_workcount.'</br>
				กำหนด : '.$status.'</br>
				';

				$url2 = 'report\change_status';

				$ch_status = '
					<select name="status" class="form-control sel" data-s_id="'.$post->order_id.'" data-s_url="'.$url2.'">
					    <option value="1" '.$v_status.'>กำลังดำเนินงาน</option>
					    <option value="2" '.$v_status2.'>งานมีปัญหา</option>
					    <option value="3" '.$v_status3.'>เสร็จสิ้น</option>
					</select>
				';

				$btn = '
					<button type="button" class="btn btn-success btn-md" data-toggle="modal" data-target="#exampleModal_qa" data-whatever="'.$post->order_id.'">QA</button>
					<button type="button" class="btn btn-success btn-md" data-toggle="modal" data-target="#exampleModal_qc" data-whatever="'.$post->order_id.'">QC Lab</button>
					<button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#exampleModal" data-whatever="'.$post->order_id.'">ความคืบหน้า</button>
				';

				$note = '
					<td style="max-width: 150px;" id="comment-'.$post->order_id.'">
						<button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#exampleModal_comment" data-whatever="'.$post->order_id.'">ดูหมายเหตุ</button>
					</td>
				';

				if(!empty($post->img)){
					$o_img = $post->img;
				} else {
					$o_img = 'sales-icon-32.png';
				}
				$comment = 'report\comment';
				$user = $this->session->userdata("username");

				$delete_comment = 'report\delete_comment';
				$img = '"assets\uploads\users\"';

				$detail = '
					<textarea rows="2" cols="15" name="detail" id="text_ar-'.$post->order_id.'" ></textarea></br>
					<input type="hidden" name="order_id" value="'.$post->order_id.'">
					<button type="button" data-order-id="'.$post->order_id.'" data-user="'.$user.'" data-comment="'.$comment.'" data-d-comment="'.$delete_comment.'" data-img="'.$img.'/'.$o_img.'" class="btn btn-success btn-action">Submit</button>
				';

				$view = '
					<a href="report/showall/'.$post->order_id.'/'.$url.'">
						<i class="fa fa-list-alt" aria-hidden="true"></i>
					</a>
				';

                $nestedData['order_id'] = $no;
                $nestedData['title'] = $ch_status;
                $nestedData['btn'] = $btn;
                $nestedData['note'] = $note;
                $nestedData['detail'] = $detail;
                $nestedData['view'] = $view;

                $data[] = $nestedData;

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


