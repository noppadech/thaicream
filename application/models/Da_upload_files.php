<?php
class Da_upload_files extends MY_Model {

    public function __construct() {
        parent::__construct();
        $this->_table = "tc_upload_files";
    }
    public function inserts_array($data = null) {
        return $this->insert($data);
    }
    public function updates_array($data = null, $key = null) {
        $this->primary_key = "id";
        return $this->update($key, $data);
    }

    public function deletes($id) {
        $this->delete($id);
    }

    public function get_all_data() {
        $this->order_by('id', "ASC");
        return $this->get_all();
    }
    public function get_all_data_by_href($href){
        $this->order_by('id', "ASC");
        $this->db->where('http_refer',$href);
        return $this->get_all();
    }

}
