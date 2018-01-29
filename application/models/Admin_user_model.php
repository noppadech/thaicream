<?php 

class Admin_user_model extends MY_Model {
	
	public $id;
	public $name;
	public $description;
	
	public function inserts() {
		$this->db->set('category_id', $this->category_id);
		$this->db->set('category_name', $this->category_name);
		$this->db->set('category_title', $this->category_title);
		$this->db->from('admin_group_module');
		return $this->db->insert();
	}
	
	public function inserts_usergroup_module_array($data=null) {
		$this->db->set($data);
		$this->db->from('admin_users_groups_module');
		return $this->db->insert();
	}
	
	public function inserts_usergroup_array($data=null) {
		$this->db->set($data);
		$this->db->from('admin_users_groups');
		return $this->db->insert();
	}
	
	
	public function deletes_usergroup($user_id) {
		$this->db->from('admin_users_groups');
		$this->db->where('user_id', $user_id);
		$this->db->delete();
	}
	
	public function deletes_usergroup_module($user_id) {
		$this->db->from('admin_users_groups_module');
		$this->db->where('user_id', $user_id);
		$this->db->delete();
	}
	
	
	public function updates_user_array($data=null,$key=null) {
		return $this->db->update('admin_users', $data, $key);
	}

	public function deletes() {
		$this->db->from('admin_group_module');
		$this->db->where('category_id', $this->category_id);
		$this->db->delete();
	}
	
	public function get_all_admin() {
		$this->db->select('*');
		$this->db->from('admin_users');
		$query = $this->db->get()->result();
		return $query;
	}
	
	public function get_all_cotton() {
		$this->db->select('*');
		$this->db->from('admin_group_module');
		$query = $this->db->get()->result();
		return $query;
	}

	public function get_by_key($key) {
		$this->db->select('*');
		$this->db->from('admin_users');
		$this->db->where('id', $key);
		$query = $this->db->get()->result();
		return $query;
	}
	
	public function get_group_by_key($key) {
		$this->db->select('*');
		$this->db->from('admin_users_groups');
		$this->db->where('user_id', $key);
		$query = $this->db->get()->result();
		return $query;
	}
	
	public function get_cotton_by_key($key) {
		$this->db->select('*');
		$this->db->from('admin_users_groups_module');
		$this->db->where('user_id', $key);
		$query = $this->db->get()->result();
		return $query;
	}
	
	public function get_sales_name() {
		$this->db->select('admin_users.id');
		$this->db->select('admin_users.first_name');
		$this->db->select('admin_users.last_name');
		$this->db->from('admin_users_groups_module');
		$this->db->join('admin_users', 'admin_users.id = admin_users_groups_module.user_id', 'left');
		$this->db->where('admin_users_groups_module.group_id', 17);
		$query = $this->db->get()->result();
		return $query;
	}
	
}