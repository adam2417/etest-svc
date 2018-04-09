<?php

class Users extends CI_Controller{

	function __construct(){
		parent::__construct();
		$this->load->model('user');
	}
	
	
	function index(){
		if(($this->session->userdata('id')) && ($this->session->userdata('uname'))){
			redirect('profiles');
		}
		else{
			$this->load->view('cms/login');
		}
	}
	
	/*function list_data(){
		$this->user->check_is_login();
		$this->template->set_template('cms');		
		$this->template->add_js('inc/jquery.js');
		$this->template->add_js('inc/jquery.js');
		$this->template->add_js('
				$(document).ready(function(){
        $(\'.delete\').click(function(){
            var answer = confirm(\'Anda yakin akan menghapus data pengguna ini?\');      
            return answer; 
            });
    });
			','embed');
		/*$data['result'] = $this->user->list_data();
		$this->template->write_view('content','cms/user/list',$data,FALSE);
		$this->template->render();*/
		/*$result = $this->user->list_data();
		
		if($result > 0){
				$quantity = $this->config->item('page_num');
				$start = $this->uri->segment(3);
				if(!$start) $start = 0;

				$data['result'] = array_slice($result, $start, $quantity);
				$config['base_url'] = base_url() . 'index.php/users/list_data/';
				$config['uri_segment'] = 3;
				$config['total_rows'] = count($result);
				$config['per_page'] = $quantity;
				$config['first_link'] = 'First';
				$config['last_link'] = 'Last';
				$config['full_tag_open'] = '<div id="paging">';
				$config['full_tag_close'] = '</div>';
				$this->pagination->initialize($config);
				$data['pagination'] = $this->pagination->create_links();
		}
		else{
			$data['result'] = null;
		}
		$this->template->write_view('content','cms/user/list',$data,FALSE);
		$this->template->render();
	}
	
	function process_form_login(){
		if(isset($_POST['login']))
		{
			$this->form_validation->set_rules('usr','User Name','trim|required|xss_clean|encode_php_tags|prep_for_form');
			$this->form_validation->set_rules('pwd','Password','trim|required|xss_clean|encode_php_tags|prep_for_form');
			$this->form_validation->set_error_delimiters('<div class="error">', '</div>');
			$this->template->add_js('inc/jquery.js');
			if($this->form_validation->run() == FALSE)
			{
				$this->load->view('cms/user/login');
			}
			else
			{
				$this->user->setUserName($_POST['usr']);
				$this->user->setPassword(md5($_POST['pwd']));
				if($this->user->login())
				{
					$arr_sess = array(
								'username' => $_POST['usr'],
								'userid' => $this->user->getId(),
								'last' => $this->user->getLastlogin(),
								'name' => $this->user->getName(),
								'role' => $this->user->getRole()
					);
					$this->session->set_userdata($arr_sess);
					$a = $this->user->getId();
					$this->user->setId($a);
					$this->user->save_last_login();
					if($this->session->userdata('role') == 'staff'){
						redirect('cms_siswa');
					}
					else{
						redirect('cms_homes');
					}
				}
				else
				{
					$data['pesan'] = 'Usename dan Password anda salah.';
					$this->load->view('cms/user/login',$data);
				}
			}

		}
	}
	
	function log_out(){
		$this->session->sess_destroy();
		//$this->session->set_flashdata('pesan_sukses','Anda sukses keluar');
		$data['pesan_sukses'] = 'Anda telah logout dari sistem.';
		$this->load->view('cms/user/login',$data);
	}
	
	function display_form_ubah_password(){
		$this->template->set_template('cms');
		if(($this->session->userdata('id')) && ($this->session->userdata('username')))
		{
			redirect('users');
		}
		else
		{
			$this->template->write_view('content','cms/user/ubahpassword', TRUE);
			$this->template->render();
		}
	}

	function process_form_ubah_password(){
		$this->user->check_is_login();
		$this->template->set_template('cms');
		$this->form_validation->set_message('matches', 'Isi Passsword baru tidak sama dengan isi field konfirmasi');
		$this->form_validation->set_rules('txt_lama','Password Lama','trim|required|xss_clean|callback_password_check');
		$this->form_validation->set_rules('txt_baru','Password Baru','trim|required|xss_clean|matches[txt_konf]|min_length[5]');
		$this->form_validation->set_rules('txt_konf','Konfirmasi Password','trim|required|xss_clean');
		$this->form_validation->set_error_delimiters('<span class="error">', '</span>');
		if($this->form_validation->run() == FALSE){
			$this->template->write_view('content','cms/user/ubahpassword', TRUE);
			$this->template->render();
		}
		else{
			$this->user->setId($this->session->userdata('userid'));
			$this->user->setPassword(md5($_POST['txt_baru']));
			$this->user->simpan_ubah_password();
			$this->session->set_flashdata('pesan','Password Telah Berhasil dirubah');
			redirect('cms_homes');
		}
	}

	function password_check(){
		$this->user->setID($this->session->userdata('userid'));
		$this->user->setPassword(md5($_POST['txt_lama']));
		if(!$this->user->check_password()){
			$this->form_validation->set_message('password_check', 'Password yang Anda masukkan Salah');
			return FALSE;
		}
		else{
			return TRUE;
		}
	}
	
	function delete_user(){
		$this->template->set_template('cms');
		if($this->uri->segment(3) === FALSE || $this->uri->segment(4) === FALSE)
		{
			redirect('users');
		}
		else if($this->uri->segment(3) != 'id')
		{
			redirect('users');
		}
		else
		{
			$arrID = $this->uri->uri_to_assoc(3);
			$data['id_uri'] = $arrID['id'];
			$this->user->setID($arrID['id']);
			$this->user->delete_data();
			$this->session->set_flashdata('pesan','Data pengguna telah dihapus <br />');
			redirect('users/list_data');
		}
	}
	
	function add_new(){
		$this->user->check_is_login();
		if($this->session->userdata('role') == 'admin'){
			$this->template->set_template('cms');
			$data['role'] = array(
			'admin' => 'Admin',
			'staff' => 'Staff'
			);
			$this->template->write_view('content','cms/user/addnew',$data, TRUE);
			$this->template->render();
		}
		else{
			$this->session->set_flashdata('pesan','Anda tidak punya hak mengakses halaman ini <br />');
			redirect('users');
		}
	}
	
	function process_addnew(){
		$this->user->check_is_login();
		if($this->session->userdata('role') == 'admin'){
			$this->template->set_template('cms');
			$data['role'] = array(
			'admin' => 'Admin',
			'staff' => 'Staff'
			);
			$this->form_validation->set_message('matches', 'Isi Password tidak sama dengan isi password konfirmasi!');
			$this->form_validation->set_rules('txt_name','Name','trim|required|xss_clean');
			$this->form_validation->set_rules('txt_username','Nama Akun','trim|required|xss_clean|callback_username_check');
			$this->form_validation->set_rules('txt_password','Kata Sandi','trim|required|xss_clean|min_length[5]|matches[txt_password_conf]');
			$this->form_validation->set_rules('txt_password_conf','Konfirmasi kata sandi','trim|required|xss_clean|min_length[5]');
			$this->form_validation->set_rules('opt_role','Role','trim|callback_hak_check');
			$this->form_validation->set_error_delimiters('<span class="error">', '</span>');
			if($this->form_validation->run() == FALSE){
				$this->template->write_view('content','cms/user/addnew',$data, TRUE);
				$this->template->render();
			}
			else{
				$this->user->setName($_POST['txt_name']);
				$this->user->setUsername($_POST['txt_username']);
				$this->user->setPassword(md5($_POST['txt_password']));
				$this->user->setRole($_POST['opt_role']);
				$this->user->insert_data();
				$this->session->set_flashdata('pesan','Data pengguna telah dibuat <br />');
				redirect('users/list_data');
			}
		}
		else{
			$this->session->set_flashdata('pesan','Anda tidak punya hak mengakses halaman ini <br />');
			redirect('users');
		}
	}
	
	function hak_check()
	{
		if($_POST['opt_role'] == "0")
		{
			$this->form_validation->set_message('hak_check', 'Pilih peran dari combo box');
			return FALSE;
		}
		else
		{
			return TRUE;
		}
	}

	function process_modify(){
		$this->user->check_is_login();
		if($this->session->userdata('role') == 'admin'){
			if($this->uri->segment(3) === FALSE || $this->uri->segment(4) === FALSE)
			{
				redirect('users');
			}
			else if($this->uri->segment(3) != 'id')
			{
				redirect('users');
			}
			else
			{
				$this->user->setId($this->uri->segment(4));
				$data['id_uri'] = $this->uri->segment(4);
				$data['detail'] = $this->user->detail_data();
				$this->template->set_template('cms');
				$data['role'] = array(
					'admin' => 'Admin',
					'staff' => 'Staff'
					);
					$this->form_validation->set_rules('txt_name','Name','trim|required|xss_clean');
					$this->form_validation->set_rules('txt_username','Username','trim|required|xss_clean|callback_username_check_edit');
					$this->form_validation->set_rules('opt_role','Role','trim|callback_hak_check');
					$this->form_validation->set_error_delimiters('<span class="error">', '</span>');
					if($this->form_validation->run() == FALSE){
						$this->template->write_view('content','cms/user/modify',$data, TRUE);
						$this->template->render();
					}
					else{
						$this->user->setName($_POST['txt_name']);
						$this->user->setUsername($_POST['txt_username']);
						$this->user->setRole($_POST['opt_role']);
						$this->user->save_edit();
						$this->session->set_flashdata('pesan','Data telah diedit <br />');
						redirect('users/list_data');
					}
						
			}
		}
		else{
			$this->session->set_flashdata('pesan','Anda tidak punya hak mengakses halaman ini <br />');
			redirect('users');
		}
	}

	function modify(){
		$this->user->check_is_login();
		if($this->session->userdata('role') == 'admin'){
			if($this->uri->segment(3) === FALSE || $this->uri->segment(4) === FALSE)
			{
				redirect('users');
			}
			else if($this->uri->segment(3) != 'id')
			{
				redirect('users');
			}
			else
			{
				$this->user->setId($this->uri->segment(4));
				$data['id_uri'] = $this->uri->segment(4);
				$data['detail'] = $this->user->detail_data();
				$this->template->set_template('cms');
				$data['role'] = array(
					'admin' => 'Admin',
					'staff' => 'Staff'
					);
					$this->template->write_view('content','cms/user/modify',$data, TRUE);
					$this->template->render();
			}
		}
		else{
			$this->session->set_flashdata('pesan','Anda tidak punya hak mengakses halaman ini <br />');
			redirect('users');
		}
	}*/
}
?>