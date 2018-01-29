<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class customer extends Admin_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->library('form_validation');
        $this->load->model('Da_customer', 'data');
        $this->mViewData['mModule'] = $this->mModule;
    }

    public function index() {
        $this->mPageTitle = "รายชื่อลูกค้า";
        $this->mViewData['result'] = $this->data->get_all_data('DESC');
        $this->render('customer/views');
    }

    public function create() {
        $this->form_validation->set_rules('customer_name', 'name', 'required');
        $this->form_validation->set_rules('customer_address', 'address', 'required');
        $this->form_validation->set_rules('customer_telephone', 'telephone', 'required');
        $this->form_validation->set_rules('customer_status', 'status', 'required');
        $this->form_validation->set_rules('customer_tax_id_number', 'Tag Number', 'required');
        $this->form_validation->set_rules('customer_type', 'Type', 'required');
        if ($this->form_validation->run() == FALSE) {
            $this->mPageTitle = "เพิ่มรายชื่อลูกค้า";
            $this->render('customer/add');
        } else {
            foreach ($this->input->post() as $key => $value) {
                $this->data->$key = $value;
            }
            $this->data->customer_create_by = $this->session->userdata('username');
            $this->data->inserts();
            redirect($this->mModule . '/customer');
        }
    }

    public function edit($id) {
        $this->form_validation->set_rules('customer_name', 'name', 'required');
        $this->form_validation->set_rules('customer_address', 'address', 'required');
        $this->form_validation->set_rules('customer_telephone', 'telephone', 'required');
        $this->form_validation->set_rules('customer_status', 'status', 'required');
        $this->form_validation->set_rules('customer_tax_id_number', 'Tag Number', 'required');
        $this->form_validation->set_rules('customer_type', 'Type', 'required');
        if ($this->form_validation->run() == FALSE) {
            $this->mPageTitle = "แก้ไขรายชื่อลูกค้า";
            $this->mViewData['result'] = $this->data->get_by_id(htmlspecialchars($id));
            $this->render('customer/edit');
        } else {
            $data = array(
                'customer_name' => $this->input->post('customer_name'),
                'customer_tax_id_number' => $this->input->post('customer_tax_id_number'),
                'customer_address' => $this->input->post('customer_address'),
                'customer_telephone' => $this->input->post('customer_telephone'),
                'customer_type' => $this->input->post('customer_type'),
                'customer_status' => $this->input->post('customer_status'),
                'customer_edit_by' => $this->session->userdata('username'),
                'customer_edit_date' => date('Y-m-d'),
            );
            $this->data->updates_array($data, htmlspecialchars($id));
            redirect($this->mModule . '/customer');
        }
    }

}
