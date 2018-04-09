<?php
class MenuMapBean {
    private $menuid,$menudesc,$menuparent,$grup_user,$is_active;
    function setMenuId($mid){
        $this->menuid = $mid;
    }
    
    function getMenuId(){
        return $this->menuid;
    }
    
    function setMenuDesc($mdesc){
        $this->menudesc = $mdesc;
    }
    
    function getMenuDesc(){
        return $this->menudesc;
    }
    
    function setMenuParent($mpar){
        $this->menuparent = $mpar;
    }
    
    function getMenuParent(){
        return $this->menuparent;
    }
    
    function setGrupUser($guser){
        $this->grup_user = $guser;
    }
    
    function getGrupUser(){
        return $this->grup_user;
    }
    
    function setIsActive($active){
        $this->is_active = $active;
    }
    
    function getIsActive(){
        return $this->is_active;
    }
}