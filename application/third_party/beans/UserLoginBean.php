<?php
class UserLoginBean
{
    private $userid,$passwd,$tgl_join,$last_level,$user_group,$is_active;
    
    function setUserId($uid){
        $this->userid = $uid;
    }
    
    function getUserId(){
        return $this->userid;
    }
    
    function setPassword($pwd){
        //$oe = new OwnEncryption();
        $this->passwd = $pwd;//$oe->decrypt($pwd);
    }
    
    function getPassword(){
        return $this->passwd;
    }
    
    function setTglJoin($tjoin){
        $this->tgl_join = $tjoin;
    }
    
    function getTglJoin(){
        return $this->tgl_join;
    }
    
    function setLastLevel($last_lvl){
        $this->last_level = $last_lvl;
    }
    
    function getLastLevel(){
        return $this->last_level;
    }
    
    function setUserGroup($ug){
        $this->user_group = $ug;
    }
    
    function getUserGroup(){
        return $this->user_group;
    }
    
    function setIsActive($stat) {
        $this->is_active = $stat;
    }
    
    function getActive(){
        return $this->is_active;
    }
}