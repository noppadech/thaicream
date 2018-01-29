<?php
			class Da_commentorder extends MY_Model { 
			public $comment_id;
			public $order_id;
			public $admin_id;
			public $detail;
			
			public function inserts() {
				$this->db->set('comment_id', $this->comment_id);
				$this->db->set('order_id', $this->order_id);
				$this->db->set('admin_id', $this->admin_id);
				$this->db->set('detail', $this->detail);
				
				$this->db->from('tc_commentorder');
				$this->db->insert();
				$insert_id = $this->db->insert_id();
				return  $insert_id;
			}
			
			public function inserts_array($data=null) {
				$this->db->set($data);
				$this->db->from('tc_commentorder');
				return $this->db->insert();
			}
			public function updates_array($data=null,$key=null) {
				return $this->db->update('tc_commentorder', $data, $key);
			}
			public function updates() {
				
				$this->db->set('comment_id', $this->comment_id);
				$this->db->set('order_id', $this->order_id);
				$this->db->set('admin_id', $this->admin_id);
				$this->db->set('detail', $this->detail);
				
				$this->db->from('tc_commentorder');
				$this->db->where('comment_id', $this->comment_id);
				return $this->db->update();
			}

			public function deletes() {
				$this->db->from('tc_commentorder');
				$this->db->where('comment_id', $this->comment_id);
				$this->db->delete();
			}

			public function get_all() {
				$this->db->from('tc_commentorder');
				$this->db->order_by('comment_id', 'ASC');
				return $this->db->get()->result();
			}

			public function get_by_key($key) {
				$this->db->select('*');
				$this->db->from('tc_commentorder');
				$this->db->where('comment_id', $key);
				$query = $this->db->get()->result();
				return $query;
			}
			
			public function get_by_key_order($key) {
				$this->db->select('*');
				$this->db->from('tc_commentorder');
				$this->db->join('admin_users', 'admin_users.id = tc_commentorder.admin_id', 'left');
				$this->db->where('tc_commentorder.order_id', $key);
				$query = $this->db->get()->result();
				return $query;
			}

		}