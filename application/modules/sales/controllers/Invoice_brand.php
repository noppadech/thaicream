<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Invoice_brand
 *
 * @author USER
 */
class Invoice_brand extends Admin_Controller {

    //put your code here
    public function __construct() {
        parent::__construct();
        $this->load->model('Mo_order_brand', 'order_brand');
        $this->load->model('Mo_customer', 'customer');
    }

    public function index() {
        $this->mViewData['result'] = $this->order_brand->get_data();
        $this->render('invoice_brand/views');
    }

    public function create($event = null) {
        switch ($event) {
            case 'process':
                $this->order_brand->customer_id = $this->input->post('customer_id', true);
                $this->order_brand->customer_tax_id_number = $this->input->post('customer_tax_id_number', true);
                $this->order_brand->customer_address = $this->input->post('customer_address', true);
                $this->order_brand->customer_telephone = $this->input->post('customer_telephone', true);
                $this->order_brand->brand_th = $this->input->post('brand_th', true);
                $this->order_brand->brand_en = $this->input->post('brand_en', true);
                $this->order_brand->brand_details = $this->input->post('brand_details', true);
                $ref_insert_id = $this->order_brand->insert_data();
                $master = $this->input->post('master', true);
                $master_details = $this->input->post('master_details', true);
                $qty = $this->input->post('qty', true);
                $package = $this->input->post('package', true);
                $real_qty = $this->input->post('real_qty', true);
                $type_of_package = $this->input->post('type_of_package', true);
                $type_of_sticker = $this->input->post('type_of_sticker', true);
                for ($i = 0; $i < count($master); $i++) {
                    if ($master[$i] != "") {
                        $data = array(
                            'ref_order_brand_id' => $ref_insert_id,
                            'order_brand_detail_master' => $master[$i],
                            'order_brand_detail_master_details' => $master_details[$i],
                            'order_brand_detail_qty' => $qty[$i],
                            'order_brand_detail_package' => $package[$i],
                            'order_brand_detail_real_qty' => $real_qty[$i],
                            'order_brand_detail_type_of_package' => $type_of_package[$i],
                            'order_brand_detail_type_of_sticker' => $type_of_sticker[$i]
                        );
                        $this->order_brand->insert_details($data);
                    }
                }
                for ($i = 0; $i < count($_FILES['do_upload']['name']); $i++) {
                    $_FILES['img_upload']['name'] = $_FILES['do_upload']['name'][$i];
                    $_FILES['img_upload']['type'] = $_FILES['do_upload']['type'][$i];
                    $_FILES['img_upload']['tmp_name'] = $_FILES['do_upload']['tmp_name'][$i];
                    $_FILES['img_upload']['error'] = $_FILES['do_upload']['error'][$i];
                    $_FILES['img_upload']['size'] = $_FILES['do_upload']['size'][$i];
                    $field_name = "img_upload";
                    $path = "uploads";
                    $allowed_types = 'png|jpg|jpeg';
                    $img_name = $this->upload_file($field_name, $path, $allowed_types);
                    $data_img = array(
                        'ref_order_brand_id' => $ref_insert_id,
                        'order_brand_img_name' => $img_name
                    );
                    $this->order_brand->insert_img($data_img);
                }
                redirect(site_url($this->mModule . '/invoice_brand'));
                break;
            default:
                $this->mViewData['customer'] = $this->customer->get_customer_for_sale();
                $this->render('invoice_brand/create');
                break;
        }
    }

    public function edit($id) {
        if ($this->input->post()) {
            dd($this->input->post());
            //Update Main 
            $this->order_brand->customer_id = $this->input->post('customer_id', true);
            $this->order_brand->customer_tax_id_number = $this->input->post('customer_tax_id_number', true);
            $this->order_brand->customer_address = $this->input->post('customer_address', true);
            $this->order_brand->customer_telephone = $this->input->post('customer_telephone', true);
            $this->order_brand->brand_th = $this->input->post('brand_th', true);
            $this->order_brand->brand_en = $this->input->post('brand_en', true);
            $this->order_brand->brand_details = $this->input->post('brand_details', true);
//            $this->order_brand->update_data($id);
            //Update Details
            $master_id = $this->input->post('master_id', true);
            $master = $this->input->post('master', true);
            $master_details = $this->input->post('master_details', true);
            $qty = $this->input->post('qty', true);
            $package = $this->input->post('package', true);
            $real_qty = $this->input->post('real_qty', true);
            $type_of_package = $this->input->post('type_of_package', true);
            $type_of_sticker = $this->input->post('type_of_sticker', true);
            for ($i = 0; $i < count($master); $i++) {
                if ($master[$i] != "") {
                    $data = array(
                        'ref_order_brand_id' => $id,
                        'order_brand_detail_master' => $master[$i],
                        'order_brand_detail_master_details' => $master_details[$i],
                        'order_brand_detail_qty' => $qty[$i],
                        'order_brand_detail_package' => $package[$i],
                        'order_brand_detail_real_qty' => $real_qty[$i],
                        'order_brand_detail_type_of_package' => $type_of_package[$i],
                        'order_brand_detail_type_of_sticker' => $type_of_sticker[$i]
                    );
                    if ($master_id[$i] == "new") {
                        $this->order_brand->insert_details($data);
                    } else {
                        $this->order_brand->update_details($master_id[$i], $data);
                    }
                }
            }
            //Remove Images
            $remove_img = $this->input->post('remove_img');
            for ($i = 0; $i < count($remove_img); $i++) {
                $this->order_brand->remove_img($remove_img[$i]);
            }
            //Update Images
            for ($i = 0; $i < count($_FILES['do_upload']['name']); $i++) {
                $_FILES['img_upload']['name'] = $_FILES['do_upload']['name'][$i];
                $_FILES['img_upload']['type'] = $_FILES['do_upload']['type'][$i];
                $_FILES['img_upload']['tmp_name'] = $_FILES['do_upload']['tmp_name'][$i];
                $_FILES['img_upload']['error'] = $_FILES['do_upload']['error'][$i];
                $_FILES['img_upload']['size'] = $_FILES['do_upload']['size'][$i];
                $field_name = "img_upload";
                $path = "uploads";
                $allowed_types = 'png|jpg|jpeg';
                $img_name = $this->upload_file($field_name, $path, $allowed_types);
                $data_img = array(
                    'ref_order_brand_id' => $id,
                    'order_brand_img_name' => $img_name
                );
                $this->order_brand->insert_img($data_img);
            }
            //Update Comment
            $comment = $this->input->post('comment', true);
            $data_comment = array(
                'ref_order_brand_id' => $id,
                'order_brand_comment' => $comment,
                'order_brand_comment_date' => date('Y-m-d')
            );
            $this->order_brand->insert_comment($data_comment);
            //Update Revise
            $revise = $this->input->post('revise', true);
            $data_revise = array(
                'ref_order_brand_id' => $id,
                'order_brand_revise' => $revise,
                'order_brand_revise_date' => date('Y-m-d')
            );
            $this->order_brand->insert_revise($data_revise);
//            exit(0);
            redirect(site_url($this->mModule . '/invoice_brand'));
        } else {
            $this->mViewData['customer'] = $this->customer->get_customer_for_sale();
            $this->mViewData['result'] = $this->order_brand->get_data_id($id);
            $this->mViewData['result_details'] = $this->order_brand->get_details($id);
            $this->mViewData['result_img'] = $this->order_brand->get_img($id);
            $this->mViewData['result_comment'] = $this->order_brand->get_comment($id);
            $this->mViewData['result_revise'] = $this->order_brand->get_revise($id);
            $this->render('invoice_brand/edit');
        }
    }

    public function printer($id) {
        $this->mViewData['customer'] = $this->customer->get_customer_for_sale();
        $this->mViewData['result'] = $this->order_brand->get_data_id($id);
        $this->mViewData['result_details'] = $this->order_brand->get_details($id);
        $this->mViewData['result_img'] = $this->order_brand->get_img($id);
        $this->mViewData['result_comment'] = $this->order_brand->get_comment($id);
        $this->mViewData['result_revise'] = $this->order_brand->get_revise($id);
        $this->render('invoice_brand/printer');
    }

    public function trash($id) {
        $this->order_brand->remove($id);
        redirect(site_url($this->mModule . '/invoice_brand'));
    }

    public function get_customer_id($id) {
        $result = $this->customer->get($id);
        echo $result->customer_name;
    }

}
