<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pelamar extends CI_Controller {

  public function __construct(){
    parent::__construct();

    // $this->load->model('KriteriaModel'); // Load Model
  }

  public function index(){
    // $data['model'] = $this->UserModel->getData();

    // $this->load->view('home', $data);
    $this->load->view('template/header');
    $this->load->view('template/pelamar');
    $this->load->view('template/footer');
  }

  public function getAllData(){
  	// $data['data'] = $this->db->get('tb_pelamar')->result();

    $this->db->select('a.*, b.nm_lowongan_kerja');
    $this->db->from('tb_pelamar a'); 
    $this->db->join('tb_lowongan_kerja b', 'a.id_lowongan_kerja=b.id_lowongan_kerja', 'left');
    $this->db->order_by('b.tgl_awal','desc');         
    $data['data'] = $this->db->get()->result(); 

  	echo json_encode($data);
  }

}