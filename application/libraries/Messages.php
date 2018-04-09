<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');
class Messages {
    private $error_codes = array(
        '0' =>'Data Successfully Load',
        '10'=>'No Data Found',
        '11'=>'Sudah Pernah Ikut Tes'
    );
    function getMessages($error_code){
        if(array_key_exists($error_code,$this->error_codes)){
            return $this->error_codes[$error_code];
        }
        return false;
    }    
}