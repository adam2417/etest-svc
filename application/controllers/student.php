<?php
class Student extends CI_Controller {
    function __construct() {
        parent::__construct();
        $this->load->model('Student_model');
    }
    
    function getStudentInfo() {
        $sId = $_GET['sid'];
        $model = new Student_model();
        $retval = $model->getStudentInfo($sId);
        
        if(!is_null($retval)){
            $data = array('res'=>array('val'=>$retval,'msg'=>$this->messages->getMessages('0')));    
        }else {
            $data = array('res'=>array('val'=>$retval,'msg'=>$this->messages->getMessages('10'),'error'=>true));
        }
                
        $res = array('content'=>$data);
        $this->load->view('def', $res);
    }
}