<?php

include('Da_materials.php');

class Mo_materials extends Da_materials {

    //put your code here
    public function __construct() {
        parent::__construct();
    }

    public function materials_details_insert($data) {
        $this->_table = "tc_material_details";
        $this->insert($data);
    }

    public function get_materials_details($master_id) {
        $this->_table = "tc_material_details";
        $this->primary_key = "ref_material_id";
        $this->order_by('id', 'ASC');
        return $this->get_many($master_id);
    }

    public function update_materials_details($key, $data) {
        $this->_table = "tc_material_details";
        $this->primary_key = "id";
        $this->update($key, $data);
    }

    public function check_material_code($master_code) {
        $this->db->select('*');
        $this->db->from('tc_material_master');
        $this->db->where('material_code', $master_code);
        $query = $this->db->get()->result();
        return $query;
    }

}
