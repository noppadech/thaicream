<?php
class Da_work_now extends MY_Model { 
public $work_now_id;
public $order_id;
public $group_module_id;
public $work_now_detail;
public $work_now_status;
public $admin_id;
public $manager_id;

public function inserts() {
	$this->db->set('work_now_id', $this->work_now_id);
	$this->db->set('order_id', $this->order_id);
	$this->db->set('group_module_id', $this->group_module_id);
	$this->db->set('work_now_detail', $this->work_now_detail);
	$this->db->set('work_now_status', $this->work_now_status);
	$this->db->set('admin_id', $this->admin_id);
	$this->db->set('manager_id', $this->manager_id);
	
	$this->db->from('tc_work_now');
	return $this->db->insert();
}

public function inserts_array($data=null) {
	$this->db->set($data);
	$this->db->from('tc_work_now');
	return $this->db->insert();
}
public function updates_array($data=null,$key=null) {
	return $this->db->update('tc_work_now', $data, $key);
}
public function updates() {
	
$this->db->set('work_now_id', $this->work_now_id);
	$this->db->set('order_id', $this->order_id);
	$this->db->set('group_module_id', $this->group_module_id);
	$this->db->set('work_now_detail', $this->work_now_detail);
	$this->db->set('work_now_status', $this->work_now_status);
	$this->db->set('admin_id', $this->admin_id);
	$this->db->set('manager_id', $this->manager_id);
	
	$this->db->from('tc_work_now');
	$this->db->where('work_now_id', $this->work_now_id);
	return $this->db->update();
}

public function deletes() {
	$this->db->from('tc_work_now');
	$this->db->where('work_now_id', $this->work_now_id);
	$this->db->delete();
}

public function get_all() {
	$this->db->from('tc_work_now');
	$this->db->order_by('work_now_id', 'ASC');
	return $this->db->get()->result();
}

public function get_by_key($key) {
	$this->db->select('*');
	$this->db->from('tc_work_now');
	$this->db->where('work_now_id', $key);
	$query = $this->db->get()->result();
	return $query;
}

}