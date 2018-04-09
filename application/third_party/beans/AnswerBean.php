<?php
class AnswerBean
{
    private $studentid,$qid,$qans;
    function setStudentId($sid){
        $this->studentid = $sid;
    }
    function setQuestion($qqid){
        $this->qid = $qqid;
    }
    function setAnswer($ans){
        $this->qans = $ans;
    }
    function getStudentId() {
        return $this->studentid;
    }
    function getQuestion(){
        return $this->qid;
    }
    function getAnswer() {
        return $this->qans;
    }
}