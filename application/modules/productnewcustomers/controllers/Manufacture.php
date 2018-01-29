<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Production
 *
 * @author USER
 */
class Manufacture extends Admin_Controller {

    var $customer_type = 1;

    public function __construct() {
        parent::__construct();
        $this->load->model('Mo_customer', 'customer');
        $this->load->model('Mo_fda_document', 'fda');
        $this->load->model('Mo_manufacture', 'manufacture');
        $this->mViewData['mModule'] = $this->mModule;
    }

    public function index() {
        $this->mViewData['result'] = $this->manufacture->get_all_data("DESC");
        $this->render('manufacture/views');
    }

    public function views($id, $product_id) {
        $this->mViewData['manufacture'] = $this->manufacture->get_data_id($id);
        $this->load->model('mo_formula', 'formula');
        $this->load->model('mo_fda_document', 'fda_document');
//        $this->mViewData['product'] = $this->fda_document->get_by_id(htmlspecialchars($formula_id));
        $this->mViewData['formula'] = $this->fda_document->get_formula($product_id);
        $this->mViewData['formula'] = $this->fda_document->get_formula($product_id);
        $this->mViewData['formula_selected'] = $this->fda_document->get_formula_details($this->mViewData['formula']->formula_selected);
        $this->mViewData['formula_details'] = $this->formula->get_formula_details_id($this->mViewData['formula']->formula_selected);
        $this->mPageTitle = "รายละเอียดสารเคมี";
        $this->render('manufacture/report_details');
//        echo $id;
//        exit(0);
    }

    public function create() {
        if ($this->input->post()) {
            $array = array(
                'customer_id' => $this->input->post('customer_id'),
                'fda_id' => $this->input->post('fda_id'),
                'manufacture_code' => $this->input->post('create_code'),
                'manufacture_create_date' => date('Y-m-d', strtotime($this->input->post('create_date'))),
                'manufacture_lot' => $this->input->post('lot'),
                'manufacture_machine' => $this->input->post('machain'),
                'manufacture_pot' => $this->input->post('boit'),
                'manufacture_qty' => $this->input->post('qty'),
                'manufacture_status' => $this->input->post('status'),
                'manufacture_customer_type' => $this->customer_type,
                'create_by' => $this->session->userdata('username'),
                'create_date' => date('Y-m-d')
            );
            $this->manufacture->inserts($array);
            redirect(site_url($this->mModule . '/manufacture'));
        } else {
            $this->mPageTitle = "สร้างข้อมูลการผลิต";
            $this->mViewData['customer'] = $this->customer->get_all_data();
            $this->render('manufacture/create');
        }
    }

    public function edit($id) {
        if ($this->input->post()) {
            $array = array(
                'customer_id' => $this->input->post('customer_id'),
                'fda_id' => $this->input->post('fda_id'),
                'manufacture_code' => $this->input->post('create_code'),
                'manufacture_create_date' => date('Y-m-d', strtotime($this->input->post('create_date'))),
                'manufacture_lot' => $this->input->post('lot'),
                'manufacture_machine' => $this->input->post('machain'),
                'manufacture_pot' => $this->input->post('boit'),
                'manufacture_qty' => $this->input->post('qty'),
                'manufacture_status' => $this->input->post('status'),
                'manufacture_customer_type' => $this->customer_type,
                'edit_by' => $this->session->userdata('username'),
                'edit_date' => date('Y-m-d')
            );
            $this->manufacture->updates($id, $array);
            redirect(site_url($this->mModule . '/manufacture'));
        } else {
            $this->mPageTitle = "แก้ไขข้อมูลการผลิต";
            $this->mViewData['manufacture_id'] = $id;
            $this->mViewData['customer'] = $this->customer->get_all_data();
            $this->mViewData['manufacture'] = $this->manufacture->get_data_id($id);
            $this->mViewData['fda'] = $this->fda->get_fda_id($this->mViewData['manufacture']->customer_id);
            $this->render('manufacture/edit');
        }
    }

    public function trash($id) {
        $this->manufacture->deletes($id);
        redirect(site_url($this->mModule . '/manufacture'));
    }

    public function get_product() {
        header('Content-Type: application/json');
        $customer_id = 2;
        $result = $this->fda->get_fda_id($customer_id);
        $result[$this->security->get_csrf_token_name()] = $this->security->get_csrf_hash();
        echo json_encode($result);
//        dd($result);
    }

}
