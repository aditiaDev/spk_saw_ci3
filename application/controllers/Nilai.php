<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Nilai extends CI_Controller {

  public function __construct(){
    parent::__construct();

    // $this->load->model('KriteriaModel'); // Load Model
  }

  public function index(){
    // $data['model'] = $this->UserModel->getData();

    // $this->load->view('home', $data);
    $this->load->view('template/header');
    $this->load->view('template/nilai');
    $this->load->view('template/footer');
  }

  public function getAllData(){
  	       
    $data['data'] = $this->db->query("SELECT 
                    a.id_nilai, a.id_pelamar, b.nm_pelamar, c.nm_lowongan_kerja, c.id_lowongan_kerja 
                    FROM tb_nilai a, tb_pelamar b, tb_lowongan_kerja c
                    WHERE a.id_pelamar=b.id_pelamar
                    AND b.id_lowongan_kerja=c.id_lowongan_kerja
                    GROUP BY a.id_pelamar
                    ORDER BY c.nm_lowongan_kerja, b.nm_pelamar")->result();

  	echo json_encode($data);
  }

  public function getDtlNilai(){
    $sql = "SELECT 
                    a.id_kriteria, a.nilai, d.nm_kriteria
                    FROM tb_nilai a, tb_pelamar b, tb_lowongan_kerja c, tb_kriteria d
                    WHERE a.id_pelamar=b.id_pelamar
                    AND b.id_lowongan_kerja=c.id_lowongan_kerja
                    AND a.id_kriteria=d.id_kriteria
                    AND c.id_lowongan_kerja='".$this->input->post('id_lowongan_kerja')."'
                    AND a.id_pelamar='".$this->input->post('id_pelamar')."'
                    ORDER BY a.id_kriteria";
    $data['data'] = $this->db->query($sql)->result();

  	echo json_encode($data);
  }

}