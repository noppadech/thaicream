<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Equipment
 *
 * @author USER
 */
class Equipment extends Admin_Controller{
    //put your code here
    public function __construct() {
        parent::__construct();
        $this->load->model('Equipment_model','equipment');
    }
    public function index(){
        $this->mViewData['result'] = $this->equipment->get_all_data();
        $this->render('equipment/view');
    }
    public function create(){
        if($this->input->post()){
            $this->equipment->equipment_code = $this->input->post('equipment_code',true);
            $this->equipment->equipment_title = $this->input->post('equipment_title',true);
            $this->equipment->equipment_details = $this->input->post('equipment_details',true);
            $this->equipment->inserts();
            redirect(site_url($this->mModule.'/equipment'));
        }
        $this->render('equipment/create');
    }
}
