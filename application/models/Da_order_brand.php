<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Da_order_kg
 *
 * @author USER
 */
class Da_order_brand extends MY_Model {

    var $customer_id;
    var $customer_tax_id_number;
    var $customer_address;
    var $customer_telephone;
    var $brand_th;
    var $brand_en;
    var $brand_details;

    //put your code here
    public function __construct() {
        parent::__construct();
        $this->_table = "tc_order_brand";
    }

    public function get_data() {
        $criteria = "order_brand_id";
        $order = "DESC";
        $this->order_by($criteria, $order);
        return $this->get_all();
    }

    public function get_data_id($id) {
        $this->primary_key = "order_brand_id";
        return $this->get($id);
    }

    public function insert_data() {
        $data = array(
            "order_brand_customer_id" => $this->customer_id,
            "order_brand_customer_tax_id_number" => $this->customer_tax_id_number,
            "order_brand_customer_address" => $this->customer_address,
            "order_brand_customer_telephone" => $this->customer_telephone,
            "order_brand_brand_th" => $this->brand_th,
            "order_brand_brand_en" => $this->brand_en,
            "order_brand_brand_details" => $this->brand_details,
            "create_by" => $this->create_by,
            "create_date" => date('Y-m-d H:i:s'),
        );
        return $this->insert($data, TRUE);
    }

    public function update_data($id) {
        $this->_table = "tc_order_brand";
        $this->primary_key = "order_brand_id";
        $data = array(
            "order_brand_customer_id" => $this->customer_id,
            "order_brand_customer_tax_id_number" => $this->customer_tax_id_number,
            "order_brand_customer_address" => $this->customer_address,
            "order_brand_customer_telephone" => $this->customer_telephone,
            "order_brand_brand_th" => $this->brand_th,
            "order_brand_brand_en" => $this->brand_en,
            "order_brand_brand_details" => $this->brand_details,
            "modified_by" => $this->modified_by,
            "modified_date" => date('Y-m-d H:i:s'),
        );
        $this->update($id, $data);
    }

    public function remove($id) {
        $this->_table = "tc_order_brand";
        $this->primary_key = "order_brand_id";
        $this->delete($id);
    }

}
