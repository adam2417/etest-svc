<?php
class Login_model extends CI_Model
{
    private $ulb;
    function __construct() {
        parent::__construct();
        $ulbs = new UserLoginBean();
    }
    
    function checkLogin(UserLoginBean $ulb){        
        $query = $this->db->query("select a.userid,a.passwd,a.last_level,a.user_group,a.tgl_join,a.user_type, b.type_desc, c.student_name from tb_userlogin a join tb_usertype b on a.user_type = b.typeid join tb_student c on a.userid = c.studentuser where userid='".$ulb->getUserId()."' and passwd='".$ulb->getPassword()."' limit 1");
		if($query->num_rows() > 0){
			foreach($query->result() as $rows){
				return $rows;
			}
		}
        return null;
    }
    
    function checkIsUserDidTest($username){
        $query = $this->db->query("select ifnull(count(*)) is_exists from tb_studentres where studentid = '".$username."'");
        if($query->num_rows() > 0){
            foreach($query->result() as $rows){
                return $rows[0]->is_exists;
            }
        }
        return null;
    }
}