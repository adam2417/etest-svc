<?php
class QuestionBankBean {
    private $qid,$qdesc,$qans,$qtypeid,$qlvlid,$isactive;
    function setQId($id){
        $this->qid = $id;
    }
    
    function setQDesc($desc){
        $this->qdesc = $desc;
    }
    
    function setQAns($ans){
        $this->qans = $ans;
    }
    
    function setQTypeId($qtype){
        $this->qtypeid = $qtype;
    }
    
    function setQLevel($qlvl){
        $this->qlvlid = $qlvl;
    }
    
    function setIsActive($active){
        $this->isactive = $active;
    }
}