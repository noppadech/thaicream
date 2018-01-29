<?php

class Da_fda_document extends MY_Model {

    public function __construct() {
        parent::__construct();
        $this->_table = "tc_fda_document";
    }

    public function inserts() {
        $data = array(
            'ref_customer_id' => $this->ref_customer_id,
            'product_id' => $this->product_id,
            'formula_master' => $this->formula_master,
            'fda_product_type' => $this->fda_product_type,
            'fda_product_appearance' => $this->fda_product_appearance,
            'fda_name_th' => $this->fda_name_th,
            'fda_name_en' => $this->fda_name_en,
            'fda_sent_date' => $this->fda_sent_date,
            'fda_get_date' => $this->fda_get_date,
            'fda_no' => $this->fda_no,
            'fda_date_expire' => $this->fda_date_expire,
            'fda_status' => $this->fda_status,
            'fda_remark' => $this->fda_remark,
            'fda_create_by' => $this->fda_create_by,
            'fda_create_date' => date('Y-m-d')
        );
        return $this->insert($data);
    }

    public function inserts_array($data = null) {
        return $this->insert($data);
    }

    public function updates_array($data = null, $key = null) {
        return $this->update($key, $data);
    }

    public function deletes($id) {
        $this->delete($id);
    }

    public function get_all_data() {
        $this->order_by('id', "ASC");
        return $this->get_all();
    }

    public function get_by_id($id) {
        return $this->get($id);
    }

}
