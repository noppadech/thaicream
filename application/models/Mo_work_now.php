<?php



include('Da_work_now.php');



class Mo_work_now extends Da_work_now {

	

	public function get_by_key_groupby($group_module_id=NULL,$date=NULL,$sales_id=NULL) {

		$this->db->select('*');

		$this->db->select('count(work_now_status) as count_numstatus');

		$this->db->from('tc_work_now');

		$this->db->join('tc_order', 'tc_order.order_id = tc_work_now.order_id', 'left');

		$this->db->join('admin_users', 'admin_users.id = tc_order.sales_id', 'left');

		$this->db->where('group_module_id', $group_module_id);

		if($sales_id!=NULL)

			$this->db->where('sales_id', $sales_id);

		$this->db->where('status !=', 3);

		$this->db->where('status !=', 2);

		$this->db->group_by('tc_work_now.order_id');

		

		

		$query = $this->db->get()->result();

		return $query;

	}

	public function allposts_count($group_module_id=NULL,$sales_id=NULL){
		$this->db->select('*');
		$this->db->select('count(work_now_status) as count_numstatus');
		$this->db->from('tc_work_now');
		$this->db->join('tc_order', 'tc_order.order_id = tc_work_now.order_id', 'left');
		$this->db->join('admin_users', 'admin_users.id = tc_order.sales_id', 'left');
		$this->db->where('group_module_id', $group_module_id);
		if($sales_id!=NULL)
			$this->db->where('tc_order.sales_id', $sales_id);
		$this->db->where('status !=', 3);
		$this->db->where('status !=', 2);
		$this->db->group_by('tc_work_now.order_id');


		$query = $this->db->get();
        return $query->num_rows();
    }
    public function allposts($limit,$start,$col,$dir,$group_module_id=NULL,$sales_id=NULL){
    	$this->db->select('*');
		$this->db->select('count(work_now_status) as count_numstatus');
		$this->db->from('tc_work_now');
		$this->db->join('tc_order', 'tc_order.order_id = tc_work_now.order_id', 'left');
		$this->db->join('admin_users', 'admin_users.id = tc_order.sales_id', 'left');
		$this->db->where('group_module_id', $group_module_id);
		if($sales_id!=NULL)
			$this->db->where('tc_order.sales_id', $sales_id);
		$this->db->limit($limit,$start);
		$this->db->order_by('tc_work_now.'.$col,$dir);
		$this->db->where('tc_order.status !=', 3);
		$this->db->where('tc_order.status !=', 2);
		$this->db->group_by('tc_work_now.order_id');
		$query = $this->db->get();
        if($query->num_rows()>0) {
            return $query->result();

        }
        else {
            return null;
        }
    }

    public function posts_search($limit,$start,$search,$col,$dir ,$group_module_id,$sales_id=NULL){
    	$this->db->select('*');
    	$this->db->select('CONCAT(DATE_FORMAT( tc_order.order_date , "%d" ) , "/", DATE_FORMAT( tc_order.order_date , "%m" ) , "/", DATE_FORMAT( tc_order.order_date , "%Y" ) +543 ) as "date"  ');
		$this->db->select('count(work_now_status) as count_numstatus');
		$this->db->from('tc_work_now');
		$this->db->join('tc_order', 'tc_order.order_id = tc_work_now.order_id', 'left');
		$this->db->join('admin_users', 'admin_users.id = tc_order.sales_id', 'left');
		$this->db->like('tc_order.order_id', $search);
		$this->db->or_like('tc_order.code_id', $search);
		$this->db->or_like('tc_order.name_order', $search);
		$this->db->or_like('tc_order.name_customer', $search);
		$this->db->or_like('admin_users.first_name' , $search);
		$this->db->or_like('admin_users.last_name' , $search);
		$this->db->where('group_module_id', $group_module_id);
		if($sales_id!=NULL)
			$this->db->where('tc_order.sales_id', $sales_id);
		$this->db->limit($limit,$start);
		$this->db->order_by('tc_work_now.'.$col,$dir);
		$this->db->where('tc_order.status !=', 3);
		$this->db->where('tc_order.status !=', 2);
		$this->db->group_by('tc_work_now.order_id');

		if($search == "งานแบรนด์"){
			$this->db->or_like('tc_order.type_order', 0);
		}
		if($search == "งานกิโลกรัม") {
			$this->db->or_like('tc_order.type_order', 1);
		}
			$date = splitDateForm3($search);
			$this->db->or_like('tc_order.order_date', $date);
			$this->db->or_like('tc_order.order_datelate', $date);
		$query = $this->db->get();
        if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return null;
        }
    }

    public function posts_search_count($search,$group_module_id,$sales_id=NULL){
    	$this->db->select('*');
		$this->db->select('count(work_now_status) as count_numstatus');
		$this->db->from('tc_work_now');
		$this->db->join('tc_order', 'tc_order.order_id = tc_work_now.order_id', 'left');
		$this->db->join('admin_users', 'admin_users.id = tc_order.sales_id', 'left');
		$this->db->or_like('tc_order.code_id', $search);
		$this->db->or_like('tc_order.name_order', $search);
		$this->db->or_like('tc_order.name_customer', $search);
		$this->db->or_like('admin_users.first_name' , $search);
		$this->db->or_like('admin_users.last_name' , $search);
		$this->db->where('group_module_id', $group_module_id);
		if($sales_id!=NULL)
			$this->db->where('tc_order.sales_id', $sales_id);
		$this->db->where('tc_order.status !=', 3);
		$this->db->where('tc_order.status !=', 2);
		$this->db->group_by('tc_work_now.order_id');
		$this->db->like('tc_order.order_id', $search);

		if($search == "งานแบรนด์"){
			$this->db->or_like('tc_order.type_order', 0);
		}
		if($search == "งานกิโลกรัม") {
			$this->db->or_like('tc_order.type_order', 1);
		}
		$date = splitDateForm3($search);
		$this->db->or_like('tc_order.order_date', $date);
		$this->db->or_like('tc_order.order_datelate', $date);

		$query = $this->db->get();
        return $query->num_rows();
    }

	

	public function get_by_key_groupby_num_row($group_module_id=NULL,$date=NULL,$sales_id=NULL) {

		$this->db->select('*');

		$this->db->from('tc_work_now');

		$this->db->join('tc_order', 'tc_order.order_id = tc_work_now.order_id', 'left');

		$this->db->join('admin_users', 'admin_users.id = tc_order.sales_id', 'left');

		$this->db->where('group_module_id', $group_module_id);

		if($sales_id!=NULL)

			$this->db->where('sales_id', $sales_id);

		$this->db->where('status !=', 3);

		$this->db->where('status !=', 2);

		$this->db->group_by('tc_work_now.order_id');

		

		

		$query = $this->db->get()->num_rows();

		return $query;

	}

	

	public function get_by_key_group($group_module_id=NULL,$order_id=NULL) {

		$this->db->select('*');

		$this->db->from('tc_work_now');

		$this->db->join('tc_order', 'tc_order.order_id = tc_work_now.order_id', 'left');

		$this->db->join('admin_users', 'admin_users.id = tc_order.sales_id', 'left');

		$this->db->where('group_module_id', $group_module_id);

		$this->db->where('tc_work_now.order_id', $order_id);

		

		

		$query = $this->db->get()->result();

		return $query;

	}

	

	public function inserts_array_comment($data){

		$this->db->set($data);

		$this->db->from('tc_work_comment');

		return $this->db->insert();

	}

	

	public function get_by_key_order($key=NULL){

		$this->db->select('*');

		$this->db->from('tc_work_comment');

		$this->db->join('admin_users', 'admin_users.id = tc_work_comment.admin_id', 'left');

		$this->db->where('work_now_id', $key);

		$query = $this->db->get()->result();

		return $query;

	}

	

	public function get_by_persec($group_module_id=NULL,$order_id=NULL,$link=NULL){

		

		if($link!= "success")

			$fo_da = "tc_work_now as work_nows";

		else

			$fo_da = 'tc_work_now_success as work_nows';

		

		

		$this->db->select('count(work_now_id) as num_id');

			$this->db->from($fo_da);

		if($group_module_id!=NULL)

			$this->db->where('group_module_id', $group_module_id);

		$this->db->where('order_id', $order_id);

		$query = $this->db->get()->result()[0]->num_id;

		

		$this->db->select('count(work_now_id) as num_id');

		$this->db->from($fo_da);

		if($group_module_id!=NULL)

			$this->db->where('group_module_id', $group_module_id);

		$this->db->where('order_id', $order_id);

		$this->db->where('work_now_status ', 3);

		$query2 = $this->db->get()->result()[0]->num_id;



		return (($query2 * 100 )/$query);

		

	}

	

	public function get_by_persec_work_now($group_module_id=NULL,$order_id=NULL,$link=NULL){

		

		if($link!= "success")

			$fo_da = "tc_work_now as work_nows";

		else

			$fo_da = 'tc_work_now_success as work_nows';



		$this->db->select('count(work_now_id) as num_id');

		$this->db->from($fo_da);

		if($group_module_id!=NULL)

			$this->db->where('group_module_id', $group_module_id);

		$this->db->where('order_id', $order_id);

		$this->db->where('work_now_status ', 3);

		$query2 = $this->db->get()->result()[0]->num_id;



		return ($query2 * 100 );

		

	}

	

	

	public function check_groupby_num_row($group_module_id=NULL,$order_id=NULL,$link=NULL) {

		$this->db->select('*');

		if($link!= "success")

			$this->db->from('tc_work_now as work_nows');

		else

			$this->db->from('tc_work_now_success as work_nows');

		//$this->db->from('tc_work_now');

		$this->db->where('group_module_id', $group_module_id);

		$this->db->where('order_id', $order_id);

		$this->db->where('work_now_status', 2);



		$query = $this->db->get()->num_rows();

		return $query;

	}

	

	public function get_by_persec_all_group($order_id=NULL,$link=NULL){

		

		$group_s = $this->get_by_key_groupby_group_module_id($order_id,$link);

		$data_ = array();

		foreach($group_s as $row){

		

			$this->db->select('*');

			if($link!= "success")

				$this->db->from('tc_work_now as work_nows');

			else

				$this->db->from('tc_work_now_success as work_nows');

			if($row->group_module_id!=NULL)

				$this->db->where('group_module_id', $row->group_module_id);

			$this->db->where('order_id', $order_id);

			//$this->db->where('work_now_status ', 1);

			$query = $this->db->get()->num_rows();

			/*

			$this->db->select('*');

			if($link!= "success")

				$this->db->from('tc_work_now as work_nows');

			else

				$this->db->from('tc_work_now_success as work_nows');

			if($row->group_module_id!=NULL)

				$this->db->where('group_module_id', $row->group_module_id);

			$this->db->where('order_id', $order_id);

			$this->db->where('work_now_status ', 2);

			$query = $query+$this->db->get()->num_rows();*/

			

			$this->db->select('*');

			if($link!= "success")

				$this->db->from('tc_work_now as work_nows');

			else

				$this->db->from('tc_work_now_success as work_nows');

			if($row->group_module_id!=NULL)

				$this->db->where('group_module_id', $row->group_module_id);

			$this->db->where('order_id', $order_id);

			$this->db->where('work_now_status ', 3);

			$query2 = $this->db->get()->num_rows();

		

			$ck_pro = $this->check_groupby_num_row($row->group_module_id,$order_id,$link);

			if($ck_pro>0){

				$status = "งานมีปัญหา";

			}else{

				$status = "";

			}

			$data_[] = array("persec"=>(($query2 * 100 )/$query),"names"=>$row->name,"status"=>$status); 

		

		}

		return $data_;

	}

	

	

	public function deletes_comment($work_comment_id=NULL){

		$this->db->from('tc_work_comment');

		$this->db->where('work_comment_id', $work_comment_id);

		$this->db->delete();

	}

	

	public function deletes_by_order_id($id=null) {

		$this->db->from('tc_work_now');

		$this->db->where('order_id', $id);

		$this->db->delete();

	}

	

	public function deletes_by_order_id_success($id=null) {

		$this->db->from('tc_work_now_success');

		$this->db->where('order_id', $id);

		$this->db->delete();

	}

	

	

	public function get_by_key_groupby_group_module_id($order_id=NULL,$link=NULL) {

		$this->db->select('*');

		if($link!= "success")

			$this->db->from('tc_work_now as work_nows');

		else

			$this->db->from('tc_work_now_success as work_nows');

		$this->db->join('admin_group_module', 'admin_group_module.id = work_nows.group_module_id', 'left');

		$this->db->where('order_id', $order_id);

		$this->db->group_by('work_nows.group_module_id');

		

		

		$query = $this->db->get()->result();

		return $query;

	}

	

	public function get_by_key_order_id_array($key) {

		$this->db->select('*');

		$this->db->from('tc_work_now');

		$this->db->where('order_id', $key);

		$query = $this->db->get()->result_array();

		return $query;

	}

	

	public function get_by_key_order_id_array_success($key) {

		$this->db->select('*');

		$this->db->from('tc_work_now_success');

		$this->db->where('order_id', $key);

		$query = $this->db->get()->result_array();

		return $query;

	}

	

	public function inserts_array_sup($data=null) {

		return $this->db->insert_batch('tc_work_now',$data);

	}

	

	public function inserts_array_success_back($data=null) {

		//$this->db->set($data);

		//$this->db->from('tc_work_now_success');

		return $this->db->insert_batch('tc_work_now',$data);

	}

	

	public function inserts_array_success($data=null) {

		//$this->db->set($data);

		//$this->db->from('tc_work_now_success');

		return $this->db->insert_batch('tc_work_now_success',$data);

	}

	

	

	public function ch_data_by(){

		//group_module_id

		

		$this->db->from('tc_work_now');

		$this->db->where('group_module_id', 17);

		$this->db->delete();

		

		

		

	}

	

	

	

}