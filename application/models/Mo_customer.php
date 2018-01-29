<?php
include 'Da_customer.php';
class Mo_customer extends Da_customer{
    //put your code here
    public function __construct() {
        parent::__construct();
    }
    public function get_customer_for_sale(){
        $this->db->where('customer_status','1');
        $this->db->order_by('id','DESC');
        return $this->get_all();
    }
}
