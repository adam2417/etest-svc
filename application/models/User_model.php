<?php
/**
 * This class is created to handling a model
 * from table t_user in database.
 * On this class will handling some function like:
 * - Selecting table,likes getting username,getting password,etc
 * - Inserting data into table
 * - Deleting data from table
 * - Updating data to table
 **/
class User_model extends CI_Model{

	// Call the module constructor
	function __construct(){
		parent::__construct();
	}

	function insertNewUser(){
		$data = array(
			'id' => $this->getId(),
			'uname' => $this->getUname(),
			'password' => $this->getPassword(),
			'active' => $this->getActive(),
			'role' => $this->getRole()			
		);
		$this->db->insert('t_user',$data);
	}
	
	function modifyUserName(){
		$data = array(
			'uname' => $this->getUname()
		);
		$this->db->where('id',$this->getId());
		$this->db->update('t_user',$data);
	}

	function modifyLastLogin(){
		$data = array(
			'last_login' => $this->getLastLogin()
		);
		$this->db->where('uname',$this->getUname());
		$this->db->update('t_user',$data);
	}

	function modifyPassword(){
		$data = array(
			'password' => md5($this->getPassword())
		);
		$this->db->where('uname',$this->getUname());
		$this->db->update('t_user',$data);
	}

	function deleteUser(){
		$data = array(
			'active' => $this->getActive()
		);
		$this->db->where('uname',$this->getUname());
		$this->db->update('t_user',$data);
	}

	function modifyFullname(){
		$data = array(
			'name' => $this->getFullName()
		);
		$this->db->where('uname',$this->getUname());
		$this->db->update('t_user',$data);
	}

	function modifyRole(){
		$data = array(
			'role' => $this->getRole()
		);
		$this->db->where('uname',$this->getUname());
		$this->db->update('t_user',$data);
	}
	
	function getListdata(){
		$this->db->select('t_user.id,t_user.name,t_user.uname,t_user.last_login,t_role.role')->from('t_user')->
		join('t_role','t_user.role=t_role.id and t_role.active=1')->where(array('t_user.active'=>'1'));
		$query = $this->db->get();
		return $query->result();
	}
	
	function userLogin(){		
		$query = $this->db->query("select id,name,uname,role,last_login from t_user where uname='".$this->getUname()."' and password='".$this->getPassword()."' limit 1");		
		if($query->num_rows() > 0){
			foreach($query->result() as $rows){
				$this->setId($rows->id);
				$this->setFullName($rows->name);
				$this->setUname($rows->uname);
				$this->setRole($rows->role);
				$this->setLastLogin($rows->last_login);
			}
			return true;
		}else{
			return false;
		}
	}
	
	function getProfileByUname(){
		$query = $this->db->query("select a.uname,a.name,b.role roles,a.role role_id,date_format(a.last_login,'%d %M %Y') last_login,".
		"a.active from t_user a join t_role b on a.role = b.id where uname='".$this->getUname()."' limit 1");
		if($query->num_rows() > 0){			
			return $query->result();
		}
	}
	
	function getProfileById(){
		$query = $this->db->query("select a.id,a.password,a.uname,a.name,b.role roles,a.role role_id,date_format(a.last_login,'%d %M %Y') last_login,".
		"a.active from t_user a join t_role b on a.role = b.id where a.id='".$this->getid()."' limit 1");
		if($query->num_rows() > 0){			
			return $query->result();
		}
	}
	
	function tambahUser(){
		$query = $this->db->query("select max(id) id from t_user");
		$res = $query->result();
		$this->setId(($res[0]->id) + 1);
		$data = array(		
			'id' => $this->getId(),
			'uname' => $this->getUname(),
			'password' => $this->getPassword(),
			'name' => $this->getFullName(),
			'role' => $this->getRole(),
			'active' => '1'
		);
		$this->db->insert('t_user',$data);
	}
	
	function deleteProfile(){
		$data = array(			
			'active' => '0'
		);
		$this->db->where(array('id'=>$this->getId()));
		$this->db->update('t_user',$data);
	}
}