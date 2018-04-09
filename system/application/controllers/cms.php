<?php

class Cms extends CI_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->model('user');
		//$this->user->check_is_login();
		//redirect('cms_homes');
	}
}
?>