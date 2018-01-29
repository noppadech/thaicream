<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Equipment_model
 *
 * @author USER
 */
class Equipment_model extends MY_Model {

    //put your code here
    var $equipment_id;
    var $equipment_code;
    var $equipment_title;
    var $equipment_detail;

    public function __construct() {
        parent::__construct();
        $this->primary_key = "equipment_id";
        $this->_table = "tc_equipment";
    }

    public function inserts() {
        $data = array(
            'equipment_code' => $this->equipment_code,
            'equipment_title' => $this->equipment_title,
            'equipment_detail' => $this->equipment_detail
        );
        $this->insert($data);
    }

    public function updates() {
        $data = array(
            'equipment_code' => $this->equipment_code,
            'equipment_title' => $this->equipment_title,
            'equipment_detail' => $this->equipment_detail
        );
        $this->update($this->equipment_id, $data);
    }
    
    public function get_by_key(){
        return $this->get($this->equipment_id);
               
    }
    
    public function get_all_data() {
        $this->order_by($this->primary_key,'DESC');
        return $this->get_all();
    }

}
