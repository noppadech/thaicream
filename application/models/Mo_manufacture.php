<?php

include 'Da_manufacture.php';

class Mo_manufacture extends Da_manufacture {
    
    public function get_fda($fda_id){
        $this->_table = "tc_fda_document";
        return $this->get($fda_id);
    }
}
