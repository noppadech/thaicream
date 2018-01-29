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
include 'Da_order_brand.php';
class Mo_order_brand extends Da_order_brand{
    //put your code here
    public function __construct() {
        parent::__construct();
    }
    public function insert_details($data){
        $this->_table = "tc_order_brand_details";
        $this->insert($data, true);
    }
    public function update_details($primary_value,$data){
        $this->_table = "tc_order_brand_details";
        $this->primary_key = "order_brand_detail_id";
        $this->update($primary_value,$data, true);
    }
    public function get_details($id){
        $this->_table = "tc_order_brand_details";
        $this->order_by('order_brand_detail_id', "ASC");
        $this->db->where('ref_order_brand_id',$id);
        return $this->get_all();
    }
    public function insert_img($data){
        $this->_table = "tc_order_brand_img";
        $this->insert($data, true);
    }
    public function get_img($id){
        $this->_table = "tc_order_brand_img";
        $this->order_by('order_brand_img_id', "ASC");
        $this->db->where('ref_order_brand_id',$id);
        return $this->get_all();
    }
    public function remove_img($id){
        $this->_table = "tc_order_brand_img";
        $this->primary_key = "order_brand_img_id";
//        echo $id;
        $this->delete($id);
    }
    
    public function insert_comment($data){
        $this->_table = "tc_order_brand_comment";
        $this->insert($data, true);
    }
    public function get_comment($id){
        $this->_table = "tc_order_brand_comment";
        $this->order_by("order_brand_comment_id","DESC");
        $this->db->where('ref_order_brand_id',$id);
        return $this->get_all();
    }
    public function insert_revise($data){
        $this->_table = "tc_order_brand_revise";
        $this->insert($data, true);
    }
    public function get_revise($id){
        $this->_table = "tc_order_brand_revise";
        $this->order_by("order_brand_revise_id","DESC");
        $this->db->where('ref_order_brand_id',$id);
        return $this->get_all();
    }
}
