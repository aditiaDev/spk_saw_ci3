<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pelamar extends CI_Controller {

  public function __construct(){
    parent::__construct();

    if(!$this->session->userdata('id_user'))
      redirect('login', 'refresh');
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

  public function saveData(){
    
    
    $this->load->library('form_validation');
    $this->form_validation->set_rules('id_lowongan_kerja', 'Lowongan Kerja', 'required');
    $this->form_validation->set_rules('nm_pelamar', 'Nama Pelamar', 'required');
    $this->form_validation->set_rules('alamat_pelamar', 'Alamat', 'required');
    $this->form_validation->set_rules('no_tlp', 'No Telphone', 'required');
    $this->form_validation->set_rules('lulusan', 'Pendidikan', 'required');
    $this->form_validation->set_rules('jurusan', 'Jurusan', 'required');
    $this->form_validation->set_rules('jenis_kelamin', 'Jenis Kelamin', 'required');
    $this->form_validation->set_rules('kemampuan', 'Kemampuan', 'required');

    if($this->form_validation->run() == FALSE){
      // echo validation_errors();
      $output = array("status" => "error", "message" => validation_errors());
      echo json_encode($output);
      return false;
    }
    
    $data = array(
              "id_lowongan_kerja" => $this->input->post('id_lowongan_kerja'),
              "nm_pelamar" => $this->input->post('nm_pelamar'),
              "jenis_kelamin" => $this->input->post('jenis_kelamin'),
              "alamat_pelamar" => $this->input->post('alamat_pelamar'),
              "no_tlp" => $this->input->post('no_tlp'),
              "lulusan" => $this->input->post('lulusan'),
              "jurusan" => $this->input->post('jurusan'),
              "kemampuan" => $this->input->post('kemampuan'),
              "id_user" => $this->session->userdata('id_user'),
            );
    $this->db->insert('tb_pelamar', $data);
    $output = array("status" => "success", "message" => "Data Berhasil Disimpan");
    echo json_encode($output);

  }

  public function updateData(){
    
    
    $this->load->library('form_validation');
    $this->form_validation->set_rules('id_lowongan_kerja', 'Lowongan Kerja', 'required');
    $this->form_validation->set_rules('nm_pelamar', 'Nama Pelamar', 'required');
    $this->form_validation->set_rules('alamat_pelamar', 'Alamat', 'required');
    $this->form_validation->set_rules('no_tlp', 'No Telphone', 'required');
    $this->form_validation->set_rules('lulusan', 'Pendidikan', 'required');
    $this->form_validation->set_rules('jurusan', 'Jurusan', 'required');
    $this->form_validation->set_rules('jenis_kelamin', 'Jenis Kelamin', 'required');
    $this->form_validation->set_rules('kemampuan', 'Kemampuan', 'required');

    if($this->form_validation->run() == FALSE){
      // echo validation_errors();
      $output = array("status" => "error", "message" => validation_errors());
      echo json_encode($output);
      return false;
    }
    
    $data = array(
      "id_lowongan_kerja" => $this->input->post('id_lowongan_kerja'),
      "nm_pelamar" => $this->input->post('nm_pelamar'),
      "jenis_kelamin" => $this->input->post('jenis_kelamin'),
      "alamat_pelamar" => $this->input->post('alamat_pelamar'),
      "no_tlp" => $this->input->post('no_tlp'),
      "lulusan" => $this->input->post('lulusan'),
      "jurusan" => $this->input->post('jurusan'),
      "kemampuan" => $this->input->post('kemampuan'),
      "id_user" => $this->session->userdata('id_user'),
    );
    $this->db->where('id_pelamar', $this->input->post('id_pelamar'));
    $this->db->update('tb_pelamar', $data);
    if($this->db->error()['message'] != ""){
      $output = array("status" => "error", "message" => $this->db->error()['message']);
      echo json_encode($output);
      return false;
    }
    $output = array("status" => "success", "message" => "Data Berhasil di Update");
    echo json_encode($output);

  }

  public function deleteData(){
    $this->db->where('id_pelamar', $this->input->post('id_pelamar'));
    $this->db->delete('tb_pelamar');

    $output = array("status" => "success", "message" => "Data Berhasil di Hapus");
    echo json_encode($output);
  }

}