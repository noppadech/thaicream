<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of invoice_kg
 *
 * @author USER
 */
class Invoice_kg extends Admin_Controller {

//put your code here
    public function __construct() {
        parent::__construct();
        $this->load->model('Mo_customer', 'customer');
        $this->load->model('Mo_order_kg', 'order_kg');
    }

    public function index() {
        $this->mViewData['result'] = $this->order_kg->get_data();
        $this->render('invoice_kg/views');
    }

    public function create($event = null) {
        switch ($event) {
            case "process":
                $this->order_kg->emp_id = $this->input->post('emp_id', true);
                $this->order_kg->inv_id = $this->input->post('inv_id', true);
                $this->order_kg->sent_type = $this->input->post('sent_type', true);
                $this->order_kg->customer_id = $this->input->post('customer_id', true);
                $this->order_kg->customer_tax_id_number = $this->input->post('customer_tax_id_number', true);
                $this->order_kg->customer_address = $this->input->post('customer_address', true);
                $this->order_kg->customer_telephone = $this->input->post('customer_telephone', true);
                $this->order_kg->customer_order_name = $this->input->post('customer_order_name', true);
                $this->order_kg->customer_order_address = $this->input->post('customer_order_address', true);
                $this->order_kg->customer_order_telephone = $this->input->post('customer_order_telephone', true);
                $this->order_kg->payment_type = $this->input->post('payment_type', true);
                $this->order_kg->payment_tax = $this->input->post('payment_tax', true);
                $this->order_kg->payment_details = $this->input->post('payment_details', true);
                $this->order_kg->email_info = $this->input->post('email_info', true);
                $this->order_kg->facebook_info = $this->input->post('facebook_info', true);
                $this->order_kg->line_info = $this->input->post('line_info', true);
                $this->order_kg->order_info = $this->input->post('order_info', true);
                $this->order_kg->sent_qty = $this->input->post('sent_qty', true);
                $this->order_kg->sent_unit = $this->input->post('sent_unit', true);
                $this->order_kg->sent_unit_price = $this->input->post('sent_unit_price', true);
                $this->order_kg->sent_amount = $this->input->post('sent_amount', true);
                $this->order_kg->vat = $this->input->post('vat', true);
                $this->order_kg->total = $this->input->post('total', true);
                $this->order_kg->deposit = $this->input->post('deposit', true);
                $this->order_kg->balance = $this->input->post('balance', true);
                $this->order_kg->create_by = $this->session->userdata('username');
                $insert_id = $this->order_kg->insert_data();
                //Insert inv.
                $product_food_and_drug = $this->input->post('product_food_and_drug', true);
                $product_description = $this->input->post('product_description', true);
                $product_qty = $this->input->post('product_qty', true);
                $product_unit = $this->input->post('product_unit', true);
                $product_unit_price = $this->input->post('product_unit_price', true);
                $product_amount = $this->input->post('product_amount', true);
                for ($i = 0; $i < count($product_description); $i++) {
                    if ($product_description[$i] != "") {
                        $data = array(
                            'ref_order_kg_id' => $insert_id,
                            'product_food_and_drug' => $product_food_and_drug[$i],
                            'product_description' => $product_description[$i],
                            'product_qty' => $product_qty[$i],
                            'product_unit' => $product_unit[$i],
                            'product_unit_price' => $product_unit_price[$i],
                            'product_amount' => $product_amount[$i]
                        );
                        $this->order_kg->insert_details($data);
                    }
                }
                redirect(site_url($this->mModule . '/invoice_kg'));
                exit(0);
                break;
            default:
                $this->mViewData['sale_department'] = $this->order_kg->get_sale_department();
                $this->mViewData['customer'] = $this->customer->get_customer_for_sale();
                $this->render('invoice_kg/create');
                break;
        }
    }

    public function edit($id) {

        if ($this->input->post()) {
//            dd($this->input->post());
            //Set DB
            $this->order_kg->emp_id = $this->input->post('emp_id', true);
            $this->order_kg->inv_id = $this->input->post('inv_id', true);
            $this->order_kg->sent_type = $this->input->post('sent_type', true);
            $this->order_kg->customer_id = $this->input->post('customer_id', true);
            $this->order_kg->customer_tax_id_number = $this->input->post('customer_tax_id_number', true);
            $this->order_kg->customer_address = $this->input->post('customer_address', true);
            $this->order_kg->customer_telephone = $this->input->post('customer_telephone', true);
            $this->order_kg->customer_order_name = $this->input->post('customer_order_name', true);
            $this->order_kg->customer_order_address = $this->input->post('customer_order_address', true);
            $this->order_kg->customer_order_telephone = $this->input->post('customer_order_telephone', true);
            $this->order_kg->payment_type = $this->input->post('payment_type', true);
            $this->order_kg->payment_tax = $this->input->post('payment_tax', true);
            $this->order_kg->payment_details = $this->input->post('payment_details', true);
            $this->order_kg->email_info = $this->input->post('email_info', true);
            $this->order_kg->facebook_info = $this->input->post('facebook_info', true);
            $this->order_kg->line_info = $this->input->post('line_info', true);
            $this->order_kg->order_info = $this->input->post('order_info', true);
            $this->order_kg->sent_qty = $this->input->post('sent_qty', true);
            $this->order_kg->sent_unit = $this->input->post('sent_unit', true);
            $this->order_kg->sent_unit_price = $this->input->post('sent_unit_price', true);
            $this->order_kg->sent_amount = $this->input->post('sent_amount', true);
            $this->order_kg->vat = $this->input->post('vat', true);
            $this->order_kg->total = $this->input->post('total', true);
            $this->order_kg->deposit = $this->input->post('deposit', true);
            $this->order_kg->balance = $this->input->post('balance', true);
            $this->order_kg->modified_by = $this->session->userdata('username');
            $this->order_kg->update_data($id);
//            dd($this->order_kg);
//            exit(0);
            //End Update INV.
            $product_id = $this->input->post('product_id', true);
            $product_description = $this->input->post('product_description', true);
            $product_qty = $this->input->post('product_qty', true);
            $product_unit = $this->input->post('product_unit', true);
            $product_unit_price = $this->input->post('product_unit_price', true);
            $product_amount = $this->input->post('product_amount', true);
            for ($i = 0; $i < count($product_description); $i++) {
                if ($product_description[$i] != "") {
                    $data = array(
                        'ref_order_kg_id' => $id,
                        'product_description' => $product_description[$i],
                        'product_qty' => $product_qty[$i],
                        'product_unit' => $product_unit[$i],
                        'product_unit_price' => $product_unit_price[$i],
                        'product_amount' => $product_amount[$i]
                    );
                    if ($product_id[$i] == "new") {
                        $this->order_kg->insert_details($data);
                    } else {
                        $this->order_kg->update_details($product_id[$i], $data);
                    }
                }
            }
            redirect(site_url($this->mModule . '/invoice_kg'));
        } else {
            $this->mPageTitle = "แก้ไขใบสั่งซื้องานกิโล";
            $this->mViewData['customer'] = $this->customer->get_customer_for_sale();
            $this->mViewData['result'] = $this->order_kg->get_data_id($id);
            $this->mViewData['result_details'] = $this->order_kg->get_details($id);
            $this->render('invoice_kg/edit');
        }
    }

    public function printer($id) {
        $this->mViewData['result'] = $this->order_kg->get_data_id($id);
        $this->mViewData['result_details'] = $this->order_kg->get_details($id);
        $this->render('invoice_kg/printer');
    }

    public function get_customer_details() {
        $customer_id = $this->input->post('customer_id', true);
        $result = $this->customer->get($customer_id);
        echo json_encode($result);
    }

    public function get_customer_id($id) {
        $result = $this->customer->get($id);
        echo $result->customer_name;
    }

    public function trash($id) {
        $this->order_kg->remove($id);
        redirect(site_url('sales/invoice_kg'));
    }

    public function get_inv_code() {
        $user_id = $this->input->post('user_id', true);
        $user = $this->input->post('user', true);
        $pattern = mb_substr($user, 0, 3).mb_substr((date('Y')+543), 2, 2);
        $result = $this->order_kg->get_inv_code($user_id, $pattern);
//        echo count($result);
        echo mb_substr((date('Y')+543), 2, 2);
        echo "\n";
        echo mb_substr($user, 0, 3);
        $data = array(
            'inv_format'=>count($result)+1,
            'inv_format_pattern'=>count($result)+1,
            'inv_count'=>count($result)+1,
//            'result'=>$result,
            
        );
        echo json_encode($data);
    }

}
