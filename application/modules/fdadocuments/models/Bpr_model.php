<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Equipment_model
 *
 * @author USER
 */
class Bpr_model extends MY_Model {

    var $trading_name;
    var $fda_name_th; // ชื่อสินค้าจด อย.แจ้งภาษาไทย
    var $fda_name_en; // ชื่อสินค้าจด อย.แจ้งภาษาอังกฤษ
    var $registered_number; // เลขที่จดแจ้ง
    var $product_category; // ประเภทผลิตภัณฑ์
    var $product_type; // ลักษณะประเภทผลิตภัณฑ์
    var $mix_room; // ห้องผสม
    var $customer_name; // Sorasak Apicharonchope
    var $production_date; // วันที่ผลิต
    var $lot; // Lot
    var $machine; // เครื่อง
    var $pot; // หม้อที่
    var $quantity_kg; // จำนวน/kg
    var $product_form; // 415
    var $formula_name; // บอดี้สครับ ชาเขียว สูตรปกติบริษัท
    var $master_weight_value; // 1000
    var $custom_weight_value; // 2500
    var $material_id; // Array 
    var $material_code; // Array 
    var $material_name; // Array 
    var $path_materials_quantity; // Array 
    var $standard_weight; // Array 
    var $custom_weight; // Array 
    var $mix_process; // ขั้นตอนการผสม 
    var $equipment_id; // Array 
    var $guideline; // 
    var $create_by;
    var $create_date;
    var $modified_by;
    var $modified_date;
    
    public function __construct() {
        parent::__construct();
        $this->_table = "tc_bpr";
        $this->primary_key = "bpr_id";
    }

    public function inserts() {
        $data = array(
            "trading_name" => $this->trading_name, //ชื่อการค้า
            "fda_name_th" => $this->fda_name_th, // ชื่อสินค้าจด อย.แจ้งภาษาไทย
            "fda_name_en" => $this->fda_name_en, // ชื่อสินค้าจด อย.แจ้งภาษาอังกฤษ
            "registered_number" => $this->registered_number, // เลขที่จดแจ้ง
            "product_category" => $this->product_category, // ประเภทผลิตภัณฑ์
            "product_type" => $this->product_type, // ลักษณะประเภทผลิตภัณฑ์
            "mix_room" => $this->mix_room, // ห้องผสม
            "customer_name" => $this->customer_name, // Sorasak Apicharonchope
            "production_date" => $this->production_date, // วันที่ผลิต
            "lot" => $this->lot, // Lot
            "machine" => $this->machine, // เครื่อง
            "pot" => $this->pot, // หม้อที่
            "quantity_kg" => $this->quantity_kg, // จำนวน/kg
            "product_form" => $this->product_form, // 415
            "formula_name" => $this->formula_name, // บอดี้สครับ ชาเขียว สูตรปกติบริษัท
            "master_weight_value" => $this->master_weight_value, // 1000
            "custom_weight_value" => $this->custom_weight_value, // 2500
            "mix_process" => $this->mix_process,
            "guideline" => $this->guideline
        );
    }

}
