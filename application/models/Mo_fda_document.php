<?php

include('Da_fda_document.php');

class Mo_fda_document extends Da_fda_document {

    //put your code here
    public function __construct() {
        parent::__construct();
    }

    public function get_fda_id($id) { 
        $this->db->where('ref_customer_id', $id);
        return $this->get_all();
    }
    public function get_formula($id){
        $this->_table = "tc_formula";
        $this->primary_key = "id";
        return $this->get($id);
    }
    public function get_formula_details($id){
        $this->_table = "tc_formula_path";
        $this->db->where('ref_formula_details_id', $id);
        return $this->get_all();
    }
    
    public function get_formula_path_details($id){ 
        $this->_table = "tc_formula_path_details";
        $this->db->where('ref_formula_path', $id);
        return $this->get_all();
    }
    public function get_material_master($id){ 
        $this->_table = "tc_material_master";
//        $this->db->where('ref_material_id', $id);
        return $this->get($id);
    }
    public function get_material_details($id){ 
        $this->_table = "tc_material_details";
        $this->db->where('ref_material_id', $id);
        return $this->get_all();
    }
}
