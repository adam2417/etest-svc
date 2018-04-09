<?php
class StudentBean {
    private $sid,$sname,$isactive = '1';
    function setStudentId($id) {
        $this->sid = $id;
    }
    function setStudentName($name) {
        $this->sname = $name;
    }
    function setIsActive($active) {
        $this->isactive = $active;   
    }
    function getStudentId(){
        return $this->sid;
    }
    function getStudentName(){
        return $this->sname;
    }
    function getIsActive() {
        return $this->isactive;
    }
}