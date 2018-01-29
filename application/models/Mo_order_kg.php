<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 *
 * Description of Mo_order_kg
 *
 * @author USER
 */
include 'Da_order_kg.php';

class Mo_order_kg extends Da_order_kg {

    //put your code here
    public function __construct() {
        parent::__construct();
    }

    public function insert_details($data) {
        $this->_table = "tc_order_kg_details";
        $this->insert($data, true);
    }

    public function update_details($primary_value, $data) {
        $this->_table = "tc_order_kg_details";
        $this->primary_key = "id";
        $this->update($primary_value, $data, true);
    }

    public function get_details($id) {
        $this->_table = "tc_order_kg_details";
        $this->order_by('id', "ASC");
        $this->db->where('ref_order_kg_id', $id);
        return $this->get_all();
    }

    public function get_sale_department() {
//        SELECT *
//        FROM
//        admin_users
//        INNER JOIN admin_users_groups_module ON admin_users_groups_module.user_id = admin_users.id
//        WHERE admin_users_groups_module.group_id = 17 AND admin_users.active = 1
//        ORDER BY admin_users.id ASC
        $this->select('*,admin_users.id as admin_id');
        $this->_table = "admin_users";
        $this->db->join("admin_users_groups_module", "admin_users_groups_module.user_id = admin_users.id", "left");
        $this->db->where("admin_users_groups_module.group_id", "17");
        $this->db->where("admin_users.active", "1");
        return $this->get_all();
    }

    public function get_inv_code($emp_code, $emp_user) {
//        SELECT *
//        FROM
//        tc_order_kg
//        WHERE
//        tc_order_kg.order_kg_emp_id = 1 = 1 AND
//        tc_order_kg.order_kg_code_id LIKE "web60%"
        $this->select('*');
        $this->_table = "tc_order_kg";
        $this->db->where("tc_order_kg.order_kg_emp_id", $emp_code);
        $this->db->like("tc_order_kg.order_kg_code_id", $emp_user);
        return $this->get_all();
//        $this->db->join("admin_users_groups_module","admin_users_groups_module.user_id = admin_users.id","left");
//        $this->db->where("admin_users.active","1");
//        $this->db->where("admin_id",$emp_code);
//        $this->db->like("admin_users.username",$emp_user);
//        return $this->get_all();
    }

}
