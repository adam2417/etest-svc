<?php
class QuestionBank_model extends CI_Model
{    
    function __construct(){
        parent::__construct();
        $ansBean = new AnswerBean();
    }
    
    function getAllQuestion(){
        $qString = 'select qid,qdesc,qanswer,qtypeid,qlevelid
                    from tb_qbanks
                    where is_active = "1"';        
        $qRes = $this->db->query($qString);
        $res = $qRes->result();
        return $res;
    }
    
    function postStudentAnswer(AnswerBean $ab) {        
        $ansArray = array(
            'studentid' => $ab->getStudentId(),
            'qid' => $ab->getQuestion(),
            'ans' => $ab->getAnswer()
        );
        $this->db->insert('tb_studentres',$ansArray);
    }
    
    function checkAnswer($qid,$stdans){
        $getPosAns = "select pans from tb_possibleanswer where qid='".$qid."' and is_active='1'";
        $qPosAns = $this->db->query($getPosAns);
        $resPosAns = $qPosAns->result();
        $differAns = strcasecmp((string)$resPosAns[0]->pans,str_replace('|',' ',$stdans));
        return $differAns;
    }
    
    function getQuestionByLevel(UserLoginBean $ulb){
        /*$qString = 'select qid,qdesc,qanswer,qtypeid,qlevelid
                    from tb_qbanks
                    where qlevelid = '''.$ulb->getLastLevel().'''
                    and is_active = ''1''';
        $qRes = $this->db->query($qString);
        $res = $qRes->result();
        return $res;*/
    }
}