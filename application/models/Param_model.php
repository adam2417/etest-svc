<?php
class Param_model extends CI_Model {
    function __construct(){
        parent::__construct();
    }
    
    function getMaxTestTime() {
        $qString = "select prm_val from tb_param where prm_nm='MAX_TEST_TIME' and is_active = '1'";
        $q = $this->db->query($qString);
        $res = $q->result();
        return $res[0]->prm_val;
    }
}