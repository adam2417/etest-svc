<?php
class User extends CI_Model {
	
	private $id;
	private $uname;
	private $password;	
	private $lastlogin;
	private $active;
	
	function __construct() {
		parent::__construct();
	}
		
	public function setId($val){
		$this->id = $val;
	}
	
	public function getId(){
		return $this->id;
	}
	
	public function setUname($val){
		$this->uname = $val;
	}
	
	public function getUname(){
		return $this->uname;
	}
	
	public function setPassword($val){
		$this->password = $val;
	}
	
	public function getPassword(){
		return $this->password;
	}
	
	public function setLastlogin($val) { 
		$this->lastlogin =  $val; 
	}
	
	public function getLastlogin() { 
		return $this->lastlogin; 
	}
	
	public function setActive($val){
		$this->active = $val;
	}
	
	public function getActive(){
		return $this->active;
	}
	
	function insert_data(){
		$data = array(
					'uname' => $this->getUname(),
					'password' => $this->getPassword(),
					'lastlogin' => $this->getLastlogin(),					
					'active' => $this->getActive()
					);
		$this->db->insert('t_login',$data);
	}
	
	function login(){
		$data = array(
					'uname' => $this->getUname(),
					'password' => $this->getPassword()
		);

		$result = $this->db->get_where('t_login',$data,1);
		if($result->num_rows() > 0)
		{
			foreach($result->result() as $rows)
			{
				$this->setId($rows->id);
				$this->setUname($rows->uname);
				$this->setLastLogin($rows->lastlogin);
				$this->setActive($rows->active);
				//$this->setRole($rows->role);
			}
			return TRUE;
		}
		else
		{
			return FALSE;
		}
	}
	
	function check_is_login(){
		if(($this->session->userdata('userid')) && ($this->session->userdata('uname')))
		{
			return TRUE;
		}
		else
		{
			return redirect('users');
			return FALSE;
		}
	}
}