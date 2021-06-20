<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Nilai extends CI_Controller {

  public function __construct(){
    parent::__construct();

    if(!$this->session->userdata('id_user'))
      redirect('login', 'refresh');
  }

  public function index(){
    // $data['model'] = $this->UserModel->getData();

    // $this->load->view('home', $data);
    $this->load->view('template/header');
    $this->load->view('template/sidebar');
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

  public function getPelamarBelumNilai(){
    $data = $this->db->query("SELECT id_pelamar, nm_pelamar FROM tb_pelamar
                      WHERE id_pelamar not in(
                      SELECT id_pelamar FROM tb_nilai
                      )")->result();

    echo json_encode($data);
  }

  public function saveData(){
    
    
    $this->load->library('form_validation');
      $this->form_validation->set_rules('id_pelamar', 'Nama Pelamar', 'required');
      $this->form_validation->set_rules('id_kriteria[]', 'Kriteria', 'required');
      $this->form_validation->set_rules('nilai[]', 'Nilai', 'required|numeric');

      if($this->form_validation->run() == FALSE){
        $output = array("status" => "error", "message" => validation_errors());
        echo json_encode($output);
        return false;
      }
    
    
    
    foreach($this->input->post('id_kriteria') as $key => $each){
      

      $data[] = array(
        'id_pelamar'  => $this->input->post('id_pelamar'),
        'id_kriteria'  => $this->input->post('id_kriteria')[$key],
        'nilai'  => $this->input->post('nilai')[$key],
      );
    }

    $this->db->insert_batch('tb_nilai', $data);
    $output = array("status" => "success", "message" => "Data Berhasil Disimpan");
    echo json_encode($output);

  }

  public function getNilaiPelamar($id){
    $data = $this->db->query("SELECT a.*, b.nm_kriteria, b.jenis_kiteria FROM tb_nilai a, tb_kriteria b
                      WHERE a.id_kriteria=b.id_kriteria
                      AND a.id_pelamar='".$id."'
                      ORDER BY a.id_kriteria")->result();
    echo json_encode($data);
  }

  public function updateData(){
    
    
    $this->load->library('form_validation');
      $this->form_validation->set_rules('id_pelamar', 'Nama Pelamar', 'required');
      $this->form_validation->set_rules('id_kriteria[]', 'Kriteria', 'required');
      $this->form_validation->set_rules('nilai[]', 'Nilai', 'required|numeric');

      if($this->form_validation->run() == FALSE){
        $output = array("status" => "error", "message" => validation_errors());
        echo json_encode($output);
        return false;
      }
    
    
    
    foreach($this->input->post('id_kriteria') as $key => $each){
      

      $data = array(
        'nilai'  => $this->input->post('nilai')[$key],
      );

      $where = array(
        'id_pelamar' => $this->input->post('id_pelamar'), 
        'id_kriteria'  => $this->input->post('id_kriteria')[$key],
      );
      $this->db->update('tb_nilai', $data, $where);
    }


    $output = array("status" => "success", "message" => "Data Berhasil Disimpan");
    echo json_encode($output);

  }

  public function deleteData(){
    $this->db->where('id_pelamar', $this->input->post('id_pelamar'));
    $this->db->delete('tb_nilai');

    $output = array("status" => "success", "message" => "Data Berhasil di Hapus");
    echo json_encode($output);
  }

}