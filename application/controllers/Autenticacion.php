<?php  


class Autenticacion extends CI_Controller
{
	
	public function logout(){
		$this->session->sess_destroy();
		session_destroy();
		redirect(base_url());
	}
}

?>