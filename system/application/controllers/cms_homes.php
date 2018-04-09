<?php

class Cms_homes extends Controller{
	
	function __construct(){
		parent::Controller();
		$this->load->model('user');
		$this->user->check_is_login();
	}
	
	function index(){
		$this->template->set_template('cms');
		$this->template->write_view('content','cms/home/list');
		$this->template->render();
	}
}
?>