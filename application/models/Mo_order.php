<?php
include('Da_order.php');
class Mo_order extends Da_order {
    
    public function get_by_key_2_table($key = null) { 
        $this->db->select('*'); 
        $this->db->from('tc_order as orders');
 
        $this->db->where('order_id', $key); 
        $query = $this->db->get(); 
        if ($query->num_rows() > 0)
            return $query->result();
        else {

            $this->db->select('*');

            $this->db->from('tc_order_success as orders');

            $this->db->where('order_id', $key);

            $query = $this->db->get();

            return $query->result();
        }
    }

    public function get_all_order($key = NULL) {

        $this->db->from('tc_order');

        $this->db->join('admin_users', 'admin_users.id = tc_order.sales_id', 'left');

        $this->db->where("type_order", $key);

        $this->db->order_by('order_id', 'ASC');

        return $this->db->get()->result();
    }

    public function get_all_order_num_rows_success($key = NULL, $month = NULL) {

        $this->db->select('count(order_id) as nums');

        $this->db->from('tc_order_success');

        if ($key != NULL)
            $this->db->where("status", $key); 
        
        if ($month != null) {

            list($mm, $yy) = preg_split("[/|-]", $month);

            $this->db->where("MONTH(order_date)", $mm);

            $this->db->where("YEAR(order_date)", $yy);
        }

        $this->db->order_by('order_id', 'ASC');

        return $this->db->get()->result()[0]->nums;
    }

    public function get_all_order_num_rows_problem($key = NULL, $month = NULL) {

        $this->db->select('tc_order.order_id');

        $this->db->from('tc_order');

        $this->db->join('tc_work_now', 'tc_work_now.order_id = tc_order.order_id', 'left');

        if ($key != NULL)
            $this->db->where("status", $key);

        if ($month != null) {

            list($mm, $yy) = preg_split("[/|-]", $month);

            $this->db->where("MONTH(order_date)", $mm);

            $this->db->where("YEAR(order_date)", $yy);
        }

        $this->db->or_where("tc_work_now.work_now_status", $key);

        $this->db->group_by('tc_work_now.order_id');

        $this->db->order_by('order_id', 'ASC');

        return $this->db->get()->num_rows();
    }

    public function get_all_order_re_problem($key = NULL, $month = NULL, $iDisplayLength = NULL, $iDisplayStart = NULL) {

        $this->db->select('tc_order.*');

        $this->db->select('admin_users.*');

        $this->db->from('tc_order');

        $this->db->join('admin_users', 'admin_users.id = tc_order.sales_id', 'left');

        $this->db->join('tc_work_now', 'tc_work_now.order_id = tc_order.order_id', 'left');

        if ($key != NULL)
            $this->db->where("status", $key);

        if ($month != null) {

            list($mm, $yy) = preg_split("[/|-]", $month);

            $this->db->where("MONTH(order_date)", $mm);

            $this->db->where("YEAR(order_date)", $yy);
        }

        $this->db->or_where("tc_work_now.work_now_status", $key);

        $this->db->group_by('tc_work_now.order_id');

        $this->db->order_by('order_id', 'ASC');

        if ($iDisplayLength != NULL)
            $this->db->limit($iDisplayLength, $iDisplayStart);

        return $this->db->get()->result();
    }

    public function get_all_order_re($key = NULL, $month = NULL, $iDisplayLength = NULL, $iDisplayStart = NULL,$limit,$offset,$order=array(null,null),$search=null) {

        $this->db->from('tc_order');

        $this->db->join('admin_users', 'admin_users.id = tc_order.sales_id', 'left');

        if ($key != NULL)
            $this->db->where("status", $key);

        if ($month != null) {

            list($mm, $yy) = preg_split("[/|-]", $month);

            $this->db->where("MONTH(order_date)", $mm);

            $this->db->where("YEAR(order_date)", $yy);
        }
		
		$this->limit($limit, $offset);
        if($search != null and $search != ""){
            $this->db->or_like('tc_order.code_id', $search);
            $this->db->or_like('tc_order.name_order', $search);
            $this->db->or_like('tc_order.name_customer', $search);
            $this->db->or_like('admin_users.first_name', $search);
            $this->db->or_like('admin_users.last_name', $search);
        }
        if($order[0] != null and $order[0] != ""){
            switch ($order[0]) {
                case 0:
                    $this->db->order_by('id',$order[1]);
                    break;
                case 1:
                    $this->db->order_by('tc_order.code_id',$order[1]);
                    break;
                case 2:
                    $this->db->order_by('tc_order.name_order',$order[1]);
                    break;
                case 3:
                    $this->db->order_by('tc_order.name_customer',$order[1]);
                    break;
                case 4:
                    $this->db->order_by('admin_users.first_name',$order[1]);
                    break;
                case 5:
                    $this->db->order_by('admin_users.last_name',$order[1]);
                    break;
            }
        }

        $this->db->order_by('order_id', 'ASC');

        // if ($iDisplayLength != NULL)
            // $this->db->limit($iDisplayLength, $iDisplayStart);

        return $this->db->get()->result();
    }

    public function get_all_order_re_success($key = NULL, $month = NULL, $iDisplayLength = NULL, $iDisplayStart = NULL) {

        $this->db->from('tc_order_success');

        $this->db->join('admin_users', 'admin_users.id = tc_order_success.sales_id', 'left');

        if ($key != NULL)
            $this->db->where("status", $key);

        if ($month != null) {

            list($mm, $yy) = preg_split("[/|-]", $month);

            $this->db->where("MONTH(order_date)", $mm);

            $this->db->where("YEAR(order_date)", $yy);
        }

        $this->db->order_by('order_id', 'ASC');

        if ($iDisplayLength != NULL)
            $this->db->limit($iDisplayLength, $iDisplayStart);

        return $this->db->get()->result();
    }

    public function get_all_order_num_rows($key = NULL, $month = NULL) {

        $this->db->from('tc_order');

        $this->db->join('admin_users', 'admin_users.id = tc_order.sales_id', 'left');

        if ($key != NULL)
            $this->db->where("status", $key);

        if ($month != null) {

            list($mm, $yy) = preg_split("[/|-]", $month);

            $this->db->where("MONTH(order_date)", $mm);

            $this->db->where("YEAR(order_date)", $yy);
        }

        $this->db->order_by('order_id', 'ASC');

        return $this->db->get()->num_rows();
    }

    public function get_all_order_late_num_rows($month = NULL) {

        $this->db->from('tc_order');

        $this->db->join('admin_users', 'admin_users.id = tc_order.sales_id', 'left');

        $this->db->where("(status = 1 or status = 2)");

        $date = date("Y-m-d");

        $date1 = str_replace('-', '/', $date);

        $date1 = date('Y-m-d', strtotime($date1 . "+3 days"));

        $this->db->where("tc_order.order_datelate <= ", $date1);



        if ($month != null) {

            list($mm, $yy) = preg_split("[/|-]", $month);

            $this->db->where("MONTH(order_date)", $mm);

            $this->db->where("YEAR(order_date)", $yy);
        }

        $this->db->order_by('order_id', 'ASC');

        return $this->db->get()->num_rows();
    }

    public function get_all_order_late($month = NULL, $iDisplayLength = NULL, $iDisplayStart = NULL) {

        $this->db->from('tc_order');

        $this->db->join('admin_users', 'admin_users.id = tc_order.sales_id', 'left');

        $this->db->where("(status = 1 or status = 2)");

        $date = date("Y-m-d");

        $date1 = str_replace('-', '/', $date);

        $date1 = date('Y-m-d', strtotime($date1 . "+3 days"));

        $this->db->where("tc_order.order_datelate <= ", $date1);



        if ($month != null) {

            list($mm, $yy) = preg_split("[/|-]", $month);

            $this->db->where("MONTH(order_date)", $mm);

            $this->db->where("YEAR(order_date)", $yy);
        }

        $this->db->order_by('order_id', 'ASC');

        if ($iDisplayLength != NULL)
            $this->db->limit($iDisplayLength, $iDisplayStart);



        return $this->db->get()->result();
    }

    public function delete_db_worknows($key = NULL) {

        $this->db->from('tc_work_now');

        $this->db->where('order_id', $key);

        $this->db->delete();
    }

    public function delete_db_success($key = NULL) {

        $this->db->from('tc_order_success');

        $this->db->where('order_id', $key);

        $this->db->delete();





        $this->db->from('tc_work_now_success');

        $this->db->where('order_id', $key);

        $this->db->delete();
    }

    public function change_db_success($key = NULL) {

        $this->db->select('*');

        $this->db->from('tc_order');

        $this->db->where('order_id', $key);

        $query = $this->db->get()->result();



        foreach ($query as $row) {

            $data_ = array(
                "order_id" => $row->order_id,
                "code_id" => $row->code_id,
                "name_order" => $row->name_order,
                "name_customer" => $row->name_customer,
                "status" => $row->status,
                "type_order" => $row->type_order,
                "admin_id" => $row->admin_id,
                "sales_id" => $row->sales_id,
                "qc_lab" => $row->qc_lab,
                "qa_lab" => $row->qa_lab,
                "order_date" => $row->order_date,
                "order_datelate" => $row->order_datelate,
                "order_workcount" => $row->order_workcount,
                "order_date_end" => $row->order_date_end,
            );



            $this->db->set($data_);

            $this->db->from('tc_order_success');

            $this->db->insert();
        }



        $this->db->select('*');

        $this->db->from('tc_work_now');

        $this->db->where('order_id', $key);

        $query = $this->db->get()->result();



        foreach ($query as $row) {

            $data_ = array(
                "work_now_id" => $row->work_now_id,
                "order_id" => $row->order_id,
                "group_module_id" => $row->group_module_id,
                "work_now_detail" => $row->work_now_detail,
                "work_now_status" => $row->work_now_status,
                "admin_id" => $row->admin_id,
                "sales_id" => $row->sales_id,
                "manager_id" => $row->manager_id,
                "work_now_dateend" => $row->work_now_dateend,
            );



            $this->db->set($data_);

            $this->db->from('tc_work_now_success');

            $this->db->insert();
        }





        //return $query;
    }

    public function get_by_key_commentorder($key = NULL) {

        $this->db->select('*');

        $this->db->from('tc_commentorder');

        $this->db->where('comment_id', $key);

        $query = $this->db->get()->result();

        return $query;
    }

    public function get_by_key_order_id($order_id = null, $group_id = null, $link = null) {

        $this->db->select('*');



        if ($link != "success")
            $this->db->from('tc_order as orders');
        else
            $this->db->from('tc_order_success as orders');



        if ($link != "success")
            $this->db->join('tc_work_now as work_nows', 'work_nows.order_id = orders.order_id', 'left');
        else
            $this->db->join('tc_work_now_success as work_nows', 'work_nows.order_id = orders.order_id', 'left');



        if ($order_id != NULL)
            $this->db->where('orders.order_id', $order_id);

        if ($group_id != NULL)
            $this->db->where('work_nows.group_module_id', $group_id);

        $query = $this->db->get()->result();



        return $query;
    }

    public function get_by_key_orderone($order_id = null, $link = NULL) {

        if ($link != "success")
            $this->db->from('tc_order as orders');
        else
            $this->db->from('tc_order_success as orders');

        $this->db->join('admin_users', 'admin_users.id = orders.sales_id', 'left');

        $this->db->where("order_id", $order_id);

        $this->db->order_by('orders.order_id', 'ASC');

        return $this->db->get()->result();
    }

    public function get_by_key_order_id_array($key) {

        $this->db->select('*');

        $this->db->from('tc_order');

        $this->db->where('order_id', $key);

        $query = $this->db->get()->result_array();

        return $query;
    }

    public function get_by_key_order_id_array_success($key) {

        $this->db->select('*');

        $this->db->from('tc_order_success');

        $this->db->where('order_id', $key);

        $query = $this->db->get()->result_array();

        return $query;
    }

    public function inserts_array_success($data = null) {

        return $this->db->insert_batch("tc_order_success", $data);
    }

    public function inserts_array_success_back($data = null) {

        return $this->db->insert_batch("tc_order", $data);
    }

    public function deletes_success($order_id = NULL) {

        $this->db->from('tc_order_success');

        $this->db->where('order_id', $order_id);

        $this->db->delete();
    }

    public function deletes_array($order_id = NULL) {

        $this->db->from('tc_order');

        $this->db->where('order_id', $order_id);

        $this->db->delete();
    }

    public function ajax_check_code_id($key = NULL) {

        $this->db->select('code_id');

        $this->db->from('tc_order');

        $this->db->where("code_id", $key);

        if ($this->db->get()->num_rows() > 0)
            return true;
        else
            return false;
    }

    ///// Supportsales /////

    public function allposts_count2($type){
        // $query = $this->db->get('tc_order');
        $query = $this->db->join('admin_users', 'admin_users.id = tc_order.sales_id', 'left')
                ->where('type_order',$type)
                ->get('tc_order');
        return $query->num_rows();
    }
    public function allposts2($limit,$start,$col,$dir,$type){
       $query = $this->db->join('admin_users', 'admin_users.id = tc_order.sales_id', 'left')
                // ->join('tc_work_now', 'tc_work_now.order_id = tc_order.order_id', 'left')
                ->limit($limit,$start)
                ->order_by($col,$dir)
                ->where('type_order',$type)
                ->get('tc_order');
        if($query->num_rows()>0) {
            return $query->result();
        }
        else {
            return null;
        }
    }

    public function posts_search2($limit,$start,$search,$col,$dir){
        $date = splitDateForm3($search);
        $query = $this->db->like('order_id',$search)
                ->or_like('code_id',$search)
                ->or_like('name_order',$search)
                ->or_like('name_customer',$search)
                ->or_like('order_date',$date)
                ->or_like('order_datelate',$date)
                ->limit($limit,$start)
                ->order_by($col,$dir)
                ->get('tc_order');


        if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return null;
        }
    }

    public function posts_search_count2($search){
        $date = splitDateForm3($search);
        $query = $this->db->like('order_id',$search)
                ->or_like('code_id',$search)
                ->or_like('name_order',$search)
                ->or_like('name_customer',$search)
                ->or_like('order_date',$date)
                ->or_like('order_datelate',$date)
                ->get('tc_order');
        return $query->num_rows();
    }

    /////// Report ///////
    public function get_all_order_late2($limit,$start,$col,$dir,$month = NULL) {
        $this->db->from('tc_order');
        $this->db->join('admin_users', 'admin_users.id = tc_order.sales_id', 'left');
        $this->db->where("(status = 1 or status = 2)");
        $date = date("Y-m-d");
        $date1 = str_replace('-', '/', $date);
        $date1 = date('Y-m-d', strtotime($date1 . "+3 days"));
        $this->db->where("tc_order.order_datelate <= ", $date1);
        if ($month != null) {
            list($mm, $yy) = preg_split("[/|-]", $month);
            $this->db->where("MONTH(order_date)", $mm);
            $this->db->where("YEAR(order_date)", $yy);
        }
        $this->db->order_by($col,$dir);
        $this->db->limit($limit, $start);
        // return $this->db->get()->result();
        $query = $this->db->get();
        if($query->num_rows()>0) {
            return $query->result();
        }
        else {
            return null;
        }
    }

    public function get_all_order_late1($limit,$start,$col,$dir,$month = NULL) {
        $this->db->from('tc_order');
        $this->db->join('admin_users', 'admin_users.id = tc_order.sales_id', 'left');
        $this->db->where("(status = 1 or status = 2)");
        $date = date("Y-m-d");
        $date1 = str_replace('-', '/', $date);
        $date1 = date('Y-m-d', strtotime($date1 . "+3 days"));
        $this->db->where("tc_order.order_datelate <= ", $date1);
        if ($month != null) {
            list($mm, $yy) = preg_split("[/|-]", $month);
            $this->db->where("MONTH(order_date)", $mm);
            $this->db->where("YEAR(order_date)", $yy);
        }
        $this->db->order_by($col,$dir);
        $this->db->limit($limit, $start);
        $query = $this->db->get();
        if($query->num_rows()>0) {
            return $query->result();
        }
        else {
            return null;
        }
    }
    public function get_all_order_late3($limit,$start,$col,$dir,$status=null,$month=null) {
        // $this->db->select('tc_order.*');
        // $this->db->select('admin_users.*');
        // $this->db->from('tc_order');
        // $this->db->join('admin_users', 'admin_users.id = tc_order.sales_id', 'left');
        // $this->db->join('tc_work_now', 'tc_work_now.order_id = tc_order.order_id', 'left');
        //     $this->db->where("tc_order.status", 2);
        // // $this->db->or_where("tc_work_now.work_now_status", $status);
        // // $this->db->group_by('tc_work_now.order_id');
        // $this->db->order_by($col,$dir);
        // $this->db->limit($limit, $start);

        $this->db->select('tc_order.*');
        $this->db->select('admin_users.*');
        $this->db->from('tc_order');
        $this->db->join('admin_users', 'admin_users.id = tc_order.sales_id', 'left');
        $this->db->join('tc_work_now', 'tc_work_now.order_id = tc_order.order_id', 'left');
        // $this->db->where("tc_order.status", $status);
        if ($month != null) {
            list($mm, $yy) = preg_split("[/|-]", $month);
            $this->db->where("MONTH(order_date)", $mm);
            $this->db->where("YEAR(order_date)", $yy);
        }
        $this->db->where("tc_work_now.work_now_status", $status);
        $this->db->group_by('tc_work_now.order_id');
        $this->db->order_by($col,$dir);
        $this->db->limit($limit, $start);

        $query = $this->db->get();
        if($query->num_rows()>0) {
            return $query->result();
        }
        else {
            return null;
        }
    }
    public function get_all_order_late4($limit,$start,$col,$dir,$status=null,$month = NULL) {
        $this->db->from('tc_order_success');
        $this->db->join('admin_users', 'admin_users.id = tc_order_success.sales_id', 'left');
        $this->db->where("status" ,$status);
        if ($month != null) {
            list($mm, $yy) = preg_split("[/|-]", $month);
            $this->db->where("MONTH(order_date)", $mm);
            $this->db->where("YEAR(order_date)", $yy);
        }
        $this->db->order_by($col,$dir);
        $this->db->limit($limit, $start);
        // return $this->db->get()->result();
        $query = $this->db->get();
        if($query->num_rows()>0) {
            return $query->result();
        }
        else {
            return null;
        }
    }

    public function allposts_count1($month=null) {
        $this->db->from('tc_order');
        $this->db->join('admin_users', 'admin_users.id = tc_order.sales_id', 'left');
        $this->db->where("(status = 1 or status = 2)");
        $date = date("Y-m-d");
        $date1 = str_replace('-', '/', $date);
        $date1 = date('Y-m-d', strtotime($date1 . "+3 days"));
        $this->db->where("tc_order.order_datelate <= ", $date1);
        if ($month != null) {
            list($mm, $yy) = preg_split("[/|-]", $month);
            $this->db->where("MONTH(order_date)", $mm);
            $this->db->where("YEAR(order_date)", $yy);
        }
        $query = $this->db->get();
        return $query->num_rows();
    }

    public function allposts_count3($month=null) {
        $this->db->select('tc_order.*');
        $this->db->select('admin_users.*');
        $this->db->from('tc_order');
        $this->db->join('admin_users', 'admin_users.id = tc_order.sales_id', 'left');
        $this->db->join('tc_work_now', 'tc_work_now.order_id = tc_order.order_id', 'left');
        // $this->db->where("tc_order.status", $status);
        if ($month != null) {
            list($mm, $yy) = preg_split("[/|-]", $month);
            $this->db->where("MONTH(order_date)", $mm);
            $this->db->where("YEAR(order_date)", $yy);
        }
        $this->db->where("tc_work_now.work_now_status", 2);
        $this->db->group_by('tc_work_now.order_id');
        $query = $this->db->get();
        return $query->num_rows();
    }

    public function allposts_count4($month=null) {
        $this->db->from('tc_order_success');
        $this->db->join('admin_users', 'admin_users.id = tc_order_success.sales_id', 'left');
        $this->db->where("status" ,3);
        if ($month != null) {
            list($mm, $yy) = preg_split("[/|-]", $month);
            $this->db->where("MONTH(order_date)", $mm);
            $this->db->where("YEAR(order_date)", $yy);
        }
        $query = $this->db->get();
        return $query->num_rows();
    }

    public function allposts_count($month=null){
        $this->db->from('tc_order');
        $this->db->join('admin_users', 'admin_users.id = tc_order.sales_id', 'left');
        $this->db->where("(status = 1 or status = 2)");
        $date = date("Y-m-d");
        $date1 = str_replace('-', '/', $date);
        $date1 = date('Y-m-d', strtotime($date1 . "+3 days"));
        $this->db->where("tc_order.order_datelate <= ", $date1);
        if ($month != null) {
            list($mm, $yy) = preg_split("[/|-]", $month);
            $this->db->where("MONTH(order_date)", $mm);
            $this->db->where("YEAR(order_date)", $yy);
        }
        $this->db->order_by('order_id', 'ASC');
        $query = $this->db->get();
        return $query->num_rows();
    }
    public function allposts($limit,$start,$col,$dir,$status){
       $query = $this->db->join('admin_users', 'admin_users.id = tc_order.sales_id', 'left')
                // ->join('tc_work_now', 'tc_work_now.order_id = tc_order.order_id', 'left')
                ->limit($limit,$start)
                ->order_by($col,$dir)
                ->where('status',$status)
                ->get('tc_order');
        if($query->num_rows()>0) {
            return $query->result();
        }
        else {
            return null;
        }
    }

    public function posts_search($limit,$start,$search,$col,$dir){
        if($search == "งานแบรนด์"){
            $band = 0;
        }
        if($search == "งานกิโลกรัม") {
            $band = 1;
        }
        $date = splitDateForm3($search);
        $query = $this->db->join('admin_users', 'admin_users.id = tc_order.sales_id', 'left')
                ->like('tc_order.order_id',$search)
                ->or_like('tc_order.code_id',$search)
                ->or_like('tc_order.name_order',$search)
                ->or_like('tc_order.name_customer',$search)
                ->or_like('tc_order.order_date',$date)
                ->or_like('tc_order.order_datelate',$date)
                ->or_like('tc_order.type_order',$band)
                ->limit($limit,$start)
                ->order_by($col,$dir)
                ->get('tc_order');


        if($query->num_rows()>0){
            return $query->result();
        }
        else{
            return null;
        }
    }

    public function posts_search_count($search){
        if($search == "งานแบรนด์"){
            $band = 0;
        }
        if($search == "งานกิโลกรัม") {
            $band = 1;
        }
        $date = splitDateForm3($search);
        $query = $this->db->like('order_id',$search)
                ->or_like('code_id',$search)
                ->or_like('name_order',$search)
                ->or_like('name_customer',$search)
                ->or_like('order_date',$date)
                ->or_like('order_datelate',$date)
                ->or_like('type_order',$band)
                ->get('tc_order');
        return $query->num_rows();
    }

}
