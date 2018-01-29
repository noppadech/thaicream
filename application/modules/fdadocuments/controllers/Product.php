<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Product extends Admin_Controller {

    //put your code here
    public function __construct() {
        parent::__construct();
        $this->load->model('mo_formula', 'formula');
        $this->load->model('mo_fda_document', 'data');
        $this->load->library('form_validation');
        $this->mViewData['mModule'] = $this->mModule;
    }

    public function index($id) {
        $this->mPageTitle = "จัดการ อย.";
        $this->mViewData['main_id'] = htmlspecialchars($id);
        $this->mViewData['result'] = $this->data->get_fda_id($id);
        //dd($this->mViewData['result']);
        $this->render('product/views');
    }

    public function create($id) {
        $this->form_validation->set_rules('formula_master', 'ชื่อการค้า', 'required', array('required' => 'กรุณาใส่ข้อมูล %s.'));
        $this->form_validation->set_rules('fda_product_type', 'ประเภทผลิตภัณฑ์', 'required', array('required' => 'กรุณาใส่ข้อมูล %s.'));
        $this->form_validation->set_rules('fda_product_appearance', 'ลักษณประเภทผลิตภัณฑ์', 'required', array('required' => 'กรุณาใส่ข้อมูล %s.'));
        $this->form_validation->set_rules('fda_name_th', 'ชื่อสินค้าจดแจ้ง อย. ภาษาไทย', 'required', array('required' => 'กรุณาใส่ข้อมูล %s.'));
        $this->form_validation->set_rules('fda_name_en', 'ชื่อสินค้าจดแจ้ง อย. อังกฤษ ', 'required', array('required' => 'กรุณาใส่ข้อมูล %s.'));
        if ($this->form_validation->run() == FALSE) {
            $this->mViewData['product'] = $this->formula->get_fda_all();
            $this->mPageTitle = "เพิ่มสินค้าทำเรื่อง อย.";
            $this->render('product/add');
        } else {
            $this->data->ref_customer_id = htmlspecialchars($id);
            foreach ($this->input->post() as $key => $value) {
                $this->data->$key = $value;
                if ($key == "fda_sent_date") {
                    $this->data->$key = date('Y-m-d', strtotime($value));
                } elseif ($key == "fda_get_date") {
                    $this->data->$key = date('Y-m-d', strtotime($value));
                } elseif ($key == "fda_date_expire") {
                    $this->data->$key = date('Y-m-d', strtotime($value));
                } else {
                    $this->data->$key = $value;
                }
            }
            $this->data->fda_create_by = $this->session->userdata('username');
            $this->data->inserts();
            redirect($this->mModule . '/product/index/' . htmlspecialchars($id));
        }
    }

    public function edit($id, $formula_id) {
        $this->form_validation->set_rules('formula_master', 'ชื่อการค้า', 'required', array('required' => 'กรุณาใส่ข้อมูล %s.'));
        $this->form_validation->set_rules('fda_product_type', 'ประเภทผลิตภัณฑ์', 'required', array('required' => 'กรุณาใส่ข้อมูล %s.'));
        $this->form_validation->set_rules('fda_product_appearance', 'ลักษณประเภทผลิตภัณฑ์', 'required', array('required' => 'กรุณาใส่ข้อมูล %s.'));
        $this->form_validation->set_rules('fda_name_th', 'ชื่อสินค้าจดแจ้ง อย. ภาษาไทย', 'required', array('required' => 'กรุณาใส่ข้อมูล %s.'));
        $this->form_validation->set_rules('fda_name_en', 'ชื่อสินค้าจดแจ้ง อย. อังกฤษ ', 'required', array('required' => 'กรุณาใส่ข้อมูล %s.'));
        if ($this->form_validation->run() == FALSE) {
            $this->mViewData['product'] = $this->formula->get_fda_all();
            $this->mViewData['customer_id'] = htmlspecialchars($id);
            $this->mViewData['formula'] = $this->data->get_by_id($formula_id);
            $href = site_url("fdadocuments/formula/tester/edit/$id/$formula_id");

            $this->load->model('Da_upload_files', 'upload_files');
            $href = site_url("fdadocuments/product/edit/$id/$formula_id");
            $this->mViewData['result_files'] = $this->upload_files->get_all_data_by_href($href);
            $this->mPageTitle = "แก้ไขสินค้าทำเรื่อง อย.";
            $this->render('product/edit');
        } else {
            $data = array();
            foreach ($this->input->post() as $key => $value) {
                if ($key == "fda_sent_date") {
                    $data[$key] = date('Y-m-d', strtotime($value));
                } elseif ($key == "fda_get_date") {
                    $data[$key] = date('Y-m-d', strtotime($value));
                } elseif ($key == "fda_date_expire") {
                    $data[$key] = date('Y-m-d', strtotime($value));
                } else {
                    $data[$key] = $value;
                }
            }
            $data['fda_edit_by'] = $this->session->userdata('username');
            $data['fda_edit_date'] = date('Y-m-d');    //dd($data);			//exit(0);
            $this->data->updates_array($data, $formula_id);
            redirect($this->mModule . '/product/index/' . htmlspecialchars($id));
        }
    }

    public function report($id, $formula_id) {
        $this->mViewData['fda'] = htmlspecialchars($id);
        $this->mViewData['product'] = $this->data->get_by_id(htmlspecialchars($formula_id));
        //dd($this->mViewData['product']);
        $this->mViewData['formula'] = $this->data->get_formula($this->mViewData['product']->product_id);
        //dd($this->mViewData['formula']);
        $this->mViewData['formula_selected'] = $this->data->get_formula_details($this->mViewData['formula']->formula_selected);
        //dd($this->mViewData['formula_selected']);
        $this->mPageTitle = $this->mViewData['product']->formula_master;
        $this->render('product/report_details');
    }

}
