<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of tb_bpr_material_model
 *
 * @author USER
 */
class tb_bpr_material_model extends MY_Model{
    //put your code here
    protected $_table = "tb_bpr_material";
    public $primary_key ="bpr_material_id";
    
    public function __construct() {
        parent::__construct();
        
    }
}
