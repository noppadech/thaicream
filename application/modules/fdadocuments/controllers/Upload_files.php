<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Upload_files
 *
 * @author USER
 */
class Upload_files extends Admin_Controller {

    //put your code here
    public function __construct() {
        parent::__construct();
        $this->load->model('Da_upload_files', 'upload_files');
    }

    public function process() {
        $field_name = "file_upload";
        $path = FCPATH . "uploads/";
        $allowed_types = "*";
        $file_name = $this->upload_file_fda($field_name, $path, $allowed_types);
        if ($file_name) {
            $data_to_db = array(
                'http_refer' => $_SERVER['HTTP_REFERER'],
                'file_name' => $file_name,
                'flie_name_original' => $_FILES['file_upload']['name'],
                'file_create_by' => $this->session->userdata('username'),
                'file_create_date' => date('Y-m-d'),
            );
            $this->upload_files->inserts_array($data_to_db);
            $data_return = array(
                'crsf' => $this->security->get_csrf_hash(),
                'file_name' => $file_name,
                'http_refer' => $_SERVER['HTTP_REFERER'],
                'file_name' => $file_name,
                'flie_name_original' => $_FILES['file_upload']['name'],
                'file_create_by' => $this->session->userdata('username'),
                'file_create_date' => date('Y-m-d'),
                'status' => true
            );
        } else {
            $data_return = array(
                'status' => false
            );
        }
        echo json_encode($data_return);
    }

}
