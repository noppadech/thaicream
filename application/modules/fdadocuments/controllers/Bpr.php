<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Bpr
 *
 * @author USER
 */
class Bpr extends Admin_Controller {

    //put your code here
    public function __construct() {
        parent::__construct();
        $this->load->model('mo_formula', 'formula');
        $this->load->model('mo_materials', 'materials');
        $this->load->model('Equipment_model', 'equipment');
        $this->load->model('Bpr_model', 'bpr');
    }

    public function index() {
        $this->mPageTitle = "Batch Processing Record (บันทึกการผลิต)";
        $this->mViewData['result'] = $this->bpr->get_data_list($order = "DESC");
        $this->render('bpr/list');
    }

    public function edit($primary_value) {
        if ($this->input->post()) {
//            dd($this->input->post());
            $this->bpr->trading_name = $this->input->post('trading_name', true); //ชื่อการค้า
            $this->bpr->fda_name_th = $this->input->post('fda_name_th', true); // ชื่อสินค้าจด อย.แจ้งภาษาไทย
            $this->bpr->fda_name_en = $this->input->post('fda_name_en', true); // ชื่อสินค้าจด อย.แจ้งภาษาอังกฤษ
            $this->bpr->registered_number = $this->input->post('registered_number', true); // เลขที่จดแจ้ง
            $this->bpr->product_category = $this->input->post('product_category', true); // ประเภทผลิตภัณฑ์
            $this->bpr->product_type = $this->input->post('product_type', true); // ลักษณะประเภทผลิตภัณฑ์
            $this->bpr->mix_room = $this->input->post('mix_room', true); // ห้องผสม
            $this->bpr->customer_name = $this->input->post('customer_name', true); // Sorasak Apicharonchope
            $this->bpr->production_date = $this->input->post('production_date', true); // วันที่ผลิต
            $this->bpr->lot = $this->input->post('lot', true); // Lot
            $this->bpr->machine = $this->input->post('machine', true); // เครื่อง
            $this->bpr->pot = $this->input->post('pot', true); // หม้อที่
            $this->bpr->quantity_kg = $this->input->post('quantity_kg', true); // จำนวน/kg
            $this->bpr->total_weight = $this->input->post('total_weight', true);
            $this->bpr->tank_weight = $this->input->post('tank_weight', true);
            $this->bpr->net_weight = $this->input->post('net_weight', true);
            $this->bpr->percentage = $this->input->post('percentage', true);
            $this->bpr->mix_process = $this->input->post('mix_process');
            $this->bpr->guideline = $this->input->post('guideline');
            $this->bpr->modified_by = $this->session->userdata('username');
            $this->bpr->modified_date = date('Y-m-d H:i:s');
            $this->bpr->updates($primary_value);
            //check equipment;
            $equipment_new = $this->input->post('equipment_new', true);
            $equipment_id = $this->input->post('equipment_id', true);
            $equipment_remove = $this->input->post('equipment_remove', true);
            for ($i = 0; $i < count($equipment_new); $i++) {
                if ($equipment_new[$i] == "1") {
                    $data = array(
                        "ref_bpr_id" => $primary_value,
                        "ref_equipment_id" => $equipment_id[$i]
                    );
                    $this->bpr->insert_equipment($data);
                }
            }
            for ($i = 0; $i < count($equipment_remove); $i++) {
                $this->bpr->remove_equipment($equipment_remove[$i]);
            }
            redirect($this->mModule . '/bpr');
        } else {
            $this->mViewData['result'] = $this->bpr->get($primary_value);
            $this->mViewData['result_equipment'] = $this->bpr->get_equipment($primary_value);
            $this->mViewData['equipment'] = $this->equipment->get_all_data();
            $this->mViewData['formula'] = $this->formula->get_fda_all();
            $this->render('bpr/edit');
        }
    }

    public function delete($primary_value) {
        $this->bpr->delete($primary_value);
        redirect($this->mModule . '/bpr');
    }

    public function report($id) {
        $this->mPageTitle = "Batch Processing Record (บันทึกการผลิต)";
        $this->mViewData['result'] = $this->bpr->get($id);
        $this->render('bpr/report');
    }

    public function create() {
        if ($this->input->post()) {
//            dd($this->input->post());
            $this->bpr->trading_name = $this->input->post('trading_name', true); //ชื่อการค้า
            $this->bpr->fda_name_th = $this->input->post('fda_name_th', true); // ชื่อสินค้าจด อย.แจ้งภาษาไทย
            $this->bpr->fda_name_en = $this->input->post('fda_name_en', true); // ชื่อสินค้าจด อย.แจ้งภาษาอังกฤษ
            $this->bpr->registered_number = $this->input->post('registered_number', true); // เลขที่จดแจ้ง
            $this->bpr->product_category = $this->input->post('product_category', true); // ประเภทผลิตภัณฑ์
            $this->bpr->product_type = $this->input->post('product_type', true); // ลักษณะประเภทผลิตภัณฑ์
            $this->bpr->mix_room = $this->input->post('mix_room', true); // ห้องผสม
            $this->bpr->customer_name = $this->input->post('customer_name', true); // Sorasak Apicharonchope
            $this->bpr->production_date = $this->input->post('production_date', true); // วันที่ผลิต
            $this->bpr->lot = $this->input->post('lot', true); // Lot
            $this->bpr->machine = $this->input->post('machine', true); // เครื่อง
            $this->bpr->pot = $this->input->post('pot', true); // หม้อที่
            $this->bpr->quantity_kg = $this->input->post('quantity_kg', true); // จำนวน/kg
            $this->bpr->product_form = $this->input->post('product_form', true); // 415
            $this->bpr->formula_name = $this->input->post('formula_name', true); // บอดี้สครับ ชาเขียว สูตรปกติบริษัท
            $this->bpr->master_weight_value = $this->input->post('master_weight_value', true); // 1000
            $this->bpr->custom_weight_value = $this->input->post('custom_weight_value', true); // 2500
            $this->bpr->mix_process = $this->input->post('mix_process');
            $this->bpr->total_weight = $this->input->post('total_weight');
            $this->bpr->tank_weight = $this->input->post('tank_weight');
            $this->bpr->net_weight = $this->input->post('net_weight');
            $this->bpr->percentage = $this->input->post('percentage');
            $this->bpr->guideline = $this->input->post('guideline');
            $this->bpr->create_by = $this->session->userdata('username');
            $this->bpr->create_date = date('Y-m-d H:i:s');
            $ref_bpr_id = $this->bpr->inserts();
            // path
            $path_id = $this->input->post('path_id', true);
            $path_name = $this->input->post('path_name', true);
            $material_path_id = $this->input->post('material_path_id', true);
            // material
            $material_id = $this->input->post('material_id', true);
            $material_code = $this->input->post('material_code', true);
            $material_name = $this->input->post('material_name', true);
            $path_materials_quantity = $this->input->post('path_materials_quantity', true);
            $standard_weight = $this->input->post('standard_weight', true);
            $custom_weight = $this->input->post('custom_weight', true);
            for ($i = 0; $i < count($path_id); $i++) {
                $data_path = array(
                    "ref_bpr_id" => $ref_bpr_id,
                    "ref_path_id" => $path_id[$i],
                    "path_name" => $path_name[$i]
                );
                $ref_path_id = $this->bpr->insert_path($data_path);
                for ($j = 0; $j < count($material_id); $j++) {
                    if ($material_path_id[$j] == $path_id[$i]) {
                        $data2 = array(
                            'ref_bpr_id' => $ref_bpr_id,
                            'ref_bpr_path_id' => $ref_path_id,
                            'material_id' => $material_id[$j],
                            'material_code' => $material_code[$j],
                            'material_name' => $material_name[$j],
                            'path_materials_quantity' => $path_materials_quantity[$j],
                            'standard_weight' => $standard_weight[$j],
                            'custom_weight' => $custom_weight[$j]
                        );
                        $this->bpr->insert_material($data2);
                    }
                }
            }
            $equipment_id = $this->input->post('equipment_id', true);
            for ($i = 0; $i < count($equipment_id); $i++) {
                $data3 = array(
                    'ref_bpr_id' => $ref_bpr_id,
                    'ref_equipment_id' => $equipment_id[$i]
                );
                $this->bpr->insert_equipment($data3);
            }
            redirect($this->mModule . '/bpr');
        } else {
            $this->mPageTitle = "Batch Processing Record (บันทึกการผลิต)";
            $this->mViewData['equipment'] = $this->equipment->get_all_data();
            $this->mViewData['formula'] = $this->formula->get_fda_all();
            $this->render('bpr/create');
        }
    }

    public function get_formula_details() {
        $id = $this->input->post('id');
        $result = $this->formula->get_by_id($id);
        $result2 = $this->formula->get_formula_details_id($result->formula_selected);
        $result_formula_path = $this->formula->get_formula_path_id($result2->id);
        $html = "";
        foreach ($result_formula_path as $key => $value) {
            if ($key == 0) {
                $th = "<!--th--><input name='master_weight_value' class='form-control text-right' value='1000' /><!--/th-->
                <th><input name='custom_weight_value' class='form-control text-right' onkeyup='calculate_custom()' value='' /></th>";
            } else {
                $th = "<th></th><th></th>";
            }
            $html .= "<tr>
                <th>PATH NAME</th>
                <th colspan='2'>
                    {$value->path_name}
                    <input type='hidden' name='path_id[]' value='{$value->id}' />
                    <input type='hidden' name='path_name[]' value='{$value->path_name}' />
                </th>
                {$th}
            </tr>
            <tr>
                <th style='width: 150px;'>รหัส/ชื่อวัตถุดิบ</th>
                <th></th>
                <th style='width: 100px;'>%</th>
                <!--th style='width: 100px;'>ปริมาณ/กรัม</th-->>
                <th style='width: 100px;'>ปริมาณ/กรัม</th>
            </tr>";
            $result_formula_path_details = $this->formula->get_formula_path_details_id($value->id);
//            dd($result_formula_path_details);
            foreach ($result_formula_path_details as $key2 => $value2) {
                $html .= "  <tr>
                                <td>
                                    {$value2->material_code}
                                    <input type='hidden' name='material_id[]' value='{$value2->id}' />
                                    <input type='hidden' name='material_path_id[]' value='{$value->id}' />
                                    <input type='hidden' name='material_code[]' value='{$value2->material_code}' />
                                </td>
                                <td>
                                    {$value2->material_trade_name} | {$value2->material_trade_name_2} | {$value2->material_supplier}</th>
                                    <input type='hidden' name='material_name[]' value='{$value2->material_trade_name} | {$value2->material_trade_name_2} | {$value2->material_supplier}' />
                                <td>
                                    {$value2->path_materials_quantity}
                                    <input type='hidden' name='path_materials_quantity[]' value='{$value2->path_materials_quantity}' />
                                </td>
                                <!--td-->
                                <input type='hidden' name='standard_weight[]' class='form-control text-right' />
                                <!--/td-->
                                <td><input type='text' name='custom_weight[]' class='form-control text-right' /></td>
                            </tr>";
            }
        }
        $csrf = array(
            'formula_name' => $result2->formula_name,
            'html' => $html,
            'name' => $this->security->get_csrf_token_name(),
            'hash' => $this->security->get_csrf_hash()
        );
        echo json_encode($csrf);
    }

    public function get_equipment() {
        $this->equipment->equipment_id = $this->input->post('id', true);
        $result = $this->equipment->get_by_key();
        $csrf = array(
            'result' => $result,
            'name' => $this->security->get_csrf_token_name(),
            'hash' => $this->security->get_csrf_hash()
        );
        echo json_encode($csrf);
    }

}
