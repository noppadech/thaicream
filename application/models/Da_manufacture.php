<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Da_manufacture
 *
 * @author USER
 */
class Da_manufacture extends MY_Model{
    //put your code here
    public function __construct() {
        parent::__construct();
        $this->_table = "tc_manufacture";
    }
    public function get_data_id($id){
        return $this->get($id);
    }
    public function get_all_data($ORDER_BY = "ASC"){
        $this->order_by('id', $ORDER_BY);
        return $this->get_all();
    }
    
    public function inserts($data){
        return $this->insert($data);
    }
    public function updates($primary_value, $data){
        $this->update($primary_value, $data);
    }
    public function deletes($id){
        $this->delete($id);
    }
    
}
