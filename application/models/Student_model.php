<?php
class Student_model extends CI_Model {
    function __construct() {
        parent::__construct();
    }
    
    function getStudentInfo($studentid) {
        $qString = 'select studentid,student_name,is_active
                    from tb_student
                    where is_active = "1"';        
        $qRes = $this->db->query($qString);
        $res = $qRes->result();
        return $res;
    }
}