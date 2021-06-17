<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Loker extends CI_Controller {

  public function __construct(){
    parent::__construct();


  }

  public function index(){
    $this->load->view('template/header');
    $this->load->view('template/loker');
    $this->load->view('template/footer');
  }

  public function getAllData(){
  	$dataList = $this->db->get('tb_lowongan_kerja')->result();
    $no = 0;
    foreach ($dataList as $list) {
      $row = array();
      $data['data'][$no]['id_lowongan_kerja'] = $list->id_lowongan_kerja;
      $data['data'][$no]['nm_lowongan_kerja'] = $list->nm_lowongan_kerja;
      $data['data'][$no]['ket_lowongan'] = $list->ket_lowongan;
      $data['data'][$no]['status_lowongan'] = $list->status_lowongan;
      $data['data'][$no]['foto_lowongan'] = $list->foto_lowongan;
      $data['data'][$no]['tgl_awal'] = date('d F Y', strtotime($list->tgl_awal));
      $data['data'][$no]['tgl_akhir'] = date('d F Y', strtotime($list->tgl_akhir));
      $no++;
    }
  	echo json_encode($data);
  }

}