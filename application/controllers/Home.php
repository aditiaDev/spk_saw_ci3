<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

  public function __construct(){
    parent::__construct();
    if(!$this->session->userdata('id_user'))
      redirect('login', 'refresh');
  }

  public function index(){
    
    

    $this->load->view('template/header');
    $this->load->view('template/home');
    $this->load->view('template/footer');
  }

}