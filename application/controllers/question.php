<?php
class Question extends CI_Controller {
    function __construct() {
        parent::__construct();
        $this->load->model('questionbank_model');
        $this->load->model('param_model');
    }
    
    function index(){
        $qbm = new QuestionBank_model();
        $retval = $qbm->getAllQuestion();
        
        $param = new Param_model();
        $timemax = $param->getMaxTestTime();
        
        if(!is_null($retval)){
            $data = array('res'=>array('val'=>$retval,'msg'=>$this->messages->getMessages('0'),'max_test_time'=>$timemax));    
        }else {
            $data = array('res'=>array('val'=>$retval,'msg'=>$this->messages->getMessages('10'),'error'=>true));
        }
                
        $res = array('content'=>$data);
        $this->load->view('def', $res);
    }
    
    function postanswer() {
        $ansList = $_GET['ans'];
        $sid = $_GET['studentid'];
        $rightans = 0;
        $missans = 0;
        $tmparr = array();
        
        /* Step By Step :
         * 1.Explode string by # separator to separate each question and answer.
         * 2.Explode string by - separator to separate which question and answer.
         * 3.Checking if string exist on array.
         * 4.If exist then update the content to the new one,others add it to array.
         * 5.Insert the array.
         */
        
        /* Posting answer to table and checking posted answer, 
        then differ it to a right answer and return how many 
        answer true and false */
        $ans = explode('~',$ansList);
        foreach($ans as $qans){
            if($qans != 'null'){
                $qqans = explode('.',$qans);
                $ansBean = new AnswerBean();
                $ansBean->setStudentId($sid);
                $ansBean->setQuestion($qqans[0]);
                $ansBean->setAnswer($qqans[1]);

                $qbm = new QuestionBank_model();
                $qbm->postStudentAnswer($ansBean);
            }            
        }
        
        foreach($ans as $qanss){
            if($qanss != 'null'){
                $qqanss = explode('.',$qanss);
                if(count($tmparr) > 0){                    
                    if(array_key_exists($qqanss[0],$tmparr)){
                        $tmparr[$qqanss[0]] = $qqanss[1];
                    } else {
                        $tmparr[$qqanss[0]] = $qqanss[1];
                    }
                } else{
                    $tmparr[$qqanss[0]] = $qqanss[1];                    
                }
            }            
        }
        
        $x = 0;
        foreach($tmparr as $key=>$val) {
        	$qbm = new QuestionBank_model();
                $posans = $qbm->checkAnswer($key,$val);
                if($posans == 0){
                	$rightans++;
                }else {
                	$missans++;
                }
        	$x++;
        }
        
        $retval = array('right_ans'=>$rightans,'miss_ans'=>$missans);
        $data = array('res'=>array('val'=>$retval,'msg'=>'sudah')); 
        $res = array('content'=>$data);
        $this->load->view('def', $res);
    }
}