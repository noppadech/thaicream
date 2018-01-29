<?php
class Da_work_list extends MY_Model { 
	public $work_id;
	public $work_detail;
	public $work_status;
	public $group_module_id;
	public $admin_id;
	
	public function inserts() {
		$this->db->set('work_id', $this->work_id);
		$this->db->set('work_detail', $this->work_detail);
		$this->db->set('work_status', $this->work_status);
		$this->db->set('group_module_id', $this->group_module_id);
		$this->db->set('admin_id', $this->admin_id);
		
		$this->db->from('tc_work_list');
		return $this->db->insert();
	}
	
	public function inserts_array($data=null) {
		$this->db->set($data);
		$this->db->from('tc_work_list');
		return $this->db->insert();
	}
	public function updates_array($data=null,$key=null) {
		return $this->db->update('tc_work_list', $data, $key);
	}
	public function updates() {
		
	$this->db->set('work_id', $this->work_id);
		$this->db->set('work_detail', $this->work_detail);
		$this->db->set('work_status', $this->work_status);
		$this->db->set('group_module_id', $this->group_module_id);
		$this->db->set('admin_id', $this->admin_id);
		
		$this->db->from('tc_work_list');
		$this->db->where('work_id', $this->work_id);
		return $this->db->update();
	}

	public function deletes() {
		$this->db->from('tc_work_list');
		$this->db->where('work_id', $this->work_id);
		$this->db->delete();
	}

	public function get_all() {
		$this->db->from('tc_work_list');
		$this->db->order_by('work_id', 'ASC');
		return $this->db->get()->result();
	}

	public function get_by_key($key) {
		$this->db->select('*');
		$this->db->from('tc_work_list');
		$this->db->where('work_id', $key);
		$query = $this->db->get()->result();
		return $query;
	}
	
	public function get_all_use() {
		$this->db->from('tc_work_list');
		$this->db->where('work_status', 1);
		$this->db->order_by('work_id', 'ASC');
		return $this->db->get()->result();
	}

}