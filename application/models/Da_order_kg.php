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
class Da_order_kg extends MY_Model {

    var $emp_id;
    var $inv_id;
    var $sent_type;
    var $customer_id;
    var $customer_tax_id_number;
    var $customer_address;
    var $customer_telephone;
    var $customer_order_name;
    var $customer_order_address;
    var $customer_order_telephone;
    var $payment_type;
    var $payment_tax;
    var $payment_details;
    var $email_info;
    var $facebook_info;
    var $line_info;
    var $order_info;
    var $sent_qty;
    var $sent_unit;
    var $sent_unit_price;
    var $sent_amount;
    var $vat;
    var $total;
    var $deposit;
    var $balance;
    var $create_by;
    var $create_date;
    var $modified_by;
    var $modified_date;

    //put your code here
    public function __construct() {
        parent::__construct();
        $this->_table = "tc_order_kg";
    }

    public function get_data() {
        $criteria = "order_kg_id";
        $order = "DESC";
        $this->order_by($criteria, $order);
        return $this->get_all();
    }

    public function get_data_id($id) {
        $this->primary_key = "order_kg_id";
        return $this->get($id);
    }

    public function insert_data() {
        $data = array(
            "order_kg_emp_id" => $this->emp_id,
            "order_kg_inv_id" => $this->inv_id,
            "order_kg_sent_type" => $this->sent_type,
            "order_kg_customer_id" => $this->customer_id,
            "order_kg_customer_tax_id_number" => $this->customer_tax_id_number,
            "order_kg_customer_address" => $this->customer_address,
            "order_kg_customer_telephone" => $this->customer_telephone,
            "order_kg_customer_order_name" => $this->customer_order_name,
            "order_kg_customer_order_address" => $this->customer_order_address,
            "order_kg_customer_order_telephone" => $this->customer_order_telephone,
            "order_kg_payment_type" => $this->payment_type,
            "order_kg_payment_tax" => $this->payment_tax,
            "order_kg_payment_details" => $this->payment_details,
            "order_kg_email_info" => $this->email_info,
            "order_kg_facebook_info" => $this->facebook_info,
            "order_kg_line_info" => $this->line_info,
            "order_kg_order_info" => $this->order_info,
            "order_kg_sent_qty" => $this->sent_qty,
            "order_kg_sent_unit" => $this->sent_unit,
            "order_kg_sent_unit_price" => $this->sent_unit_price,
            "order_kg_sent_amount" => $this->sent_amount,
            "order_kg_vat" => $this->vat,
            "order_kg_total" => $this->total,
            "order_kg_deposit" => $this->deposit,
            "order_kg_balance" => $this->balance,
            "create_by" => $this->create_by,
            "create_date" => date('Y-m-d H:i:s'),
        );
        return $this->insert($data, TRUE);
    }

    public function update_data($id) {
        $this->_table = "tc_order_kg";
        $this->primary_key = "order_kg_id";
        $data = array(
            "order_kg_emp_id" => $this->emp_id,
            "order_kg_inv_id" => $this->inv_id,
            "order_kg_sent_type" => $this->sent_type,
            "order_kg_customer_id" => $this->customer_id,
            "order_kg_customer_tax_id_number" => $this->customer_tax_id_number,
            "order_kg_customer_address" => $this->customer_address,
            "order_kg_customer_telephone" => $this->customer_telephone,
            "order_kg_customer_order_name" => $this->customer_order_name,
            "order_kg_customer_order_address" => $this->customer_order_address,
            "order_kg_customer_order_telephone" => $this->customer_order_telephone,
            "order_kg_payment_type" => $this->payment_type,
            "order_kg_payment_tax" => $this->payment_tax,
            "order_kg_payment_details" => $this->payment_details,
            "order_kg_email_info" => $this->email_info,
            "order_kg_facebook_info" => $this->facebook_info,
            "order_kg_line_info" => $this->line_info,
            "order_kg_order_info" => $this->order_info,
            "order_kg_sent_qty" => $this->sent_qty,
            "order_kg_sent_unit" => $this->sent_unit,
            "order_kg_sent_unit_price" => $this->sent_unit_price,
            "order_kg_sent_amount" => $this->sent_amount,
            "order_kg_vat" => $this->vat,
            "order_kg_total" => $this->total,
            "order_kg_deposit" => $this->deposit,
            "order_kg_balance" => $this->balance,
            "modified_by" => $this->modified_by,
            "modified_date" => date('Y-m-d H:i:s'),
        );
        $this->update($id, $data);
    }

    public function remove($id) {
        $this->_table = "tc_order_kg";
        $this->primary_key = "order_kg_id";
        $this->delete($id);
    }

}
