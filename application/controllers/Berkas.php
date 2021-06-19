<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Berkas extends CI_Controller {

  public function __construct(){
    parent::__construct();

    if(!$this->session->userdata('id_user'))
      redirect('login', 'refresh');
  }

  public function index(){
    // $data['model'] = $this->UserModel->getData();

    // $this->load->view('home', $data);
    $this->load->view('template/header');
    $this->load->view('template/berkas');
    $this->load->view('template/footer');
  }

  public function getAllData(){
  	$this->db->select("a.*, b.nm_pelamar, CONCAT(b.lulusan, ' - ', b.jurusan) pendidikan, c.nm_lowongan_kerja");
    $this->db->from('tb_berkas a'); 
    $this->db->join('tb_pelamar b', 'a.id_pelamar=b.id_pelamar', 'left');
    $this->db->join('tb_lowongan_kerja c', 'b.id_lowongan_kerja=c.id_lowongan_kerja', 'left');
    $this->db->order_by('a.id_berkas','desc');         
    $data['data'] = $this->db->get()->result();

  	echo json_encode($data);
  }

}