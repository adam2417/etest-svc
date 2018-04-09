<?php
//$data = array('menu'=>array('id'=>'file','value'=>'file','popup'=>array('menuitem'=>array(array("value"=>"New", "onclick"=> "CreateNewDoc()"),array("value"=>"Open", "onclick"=>"OpenDoc()")))));
class Login extends CI_Controller{
	function __construct(){
		parent::__construct();
		$this->load->model('login_model');
	}
	
	function index(){
        $data = '';
        $uid = $_GET['uid'];
        $pass = $_GET['pwd'];
        
        $ulb = new UserLoginBean();
        $ulb->setUserId($uid);
        $ulb->setPassword($pass);
        
        $logm = new Login_model();
        $retval = $logm->checkLogin($ulb);
        $retval2 = $logm->checkIsUserDidTest($uid);
        
        if(!is_null($retval)){
            $data = array('res'=>array('val'=>$retval,'msg'=>$this->messages->getMessages('0'),'eror'=>'false'));    
        }else {
            if($retval2 > 0){
                $data = array('res'=>array('val'=>$retval2,'msg'=>$this->messages->getMessages('11'),'eror'=>'true'));
            } else{
                $data = array('res'=>array('val'=>$retval,'msg'=>$this->messages->getMessages('10'),'eror'=>'true'));    
            }            
        }
                
        $res = array('content'=>$data);
        $this->load->view('def', $res);
	}
}