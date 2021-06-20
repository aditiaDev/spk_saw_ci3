<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Loker extends CI_Controller {

  public function __construct(){
    parent::__construct();
    if(!$this->session->userdata('id_user'))
      redirect('login', 'refresh');

  }

  public function index(){
    $this->load->view('template/header');
    $this->load->view('template/sidebar');
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
      // $data['data'][$no]['ket_lowongan'] = $list->ket_lowongan;
      $data['data'][$no]['ket_lowongan'] = preg_replace('/<\/?[^>]+(>|$)/i', "", $list->ket_lowongan);
      $data['data'][$no]['status_lowongan'] = $list->status_lowongan;
      $data['data'][$no]['foto_lowongan'] = $list->foto_lowongan;
      $data['data'][$no]['tgl_awal'] = date('d F Y', strtotime($list->tgl_awal));
      $data['data'][$no]['tgl_akhir'] = date('d F Y', strtotime($list->tgl_akhir));
      $no++;
    }
  	echo json_encode($data);
  }

  public function saveData(){
    
    
    $this->load->library('form_validation');
    $this->form_validation->set_rules('nm_lowongan_kerja', 'Nama Lowker', 'required');
    $this->form_validation->set_rules('ket_lowongan', 'Ket Lowongan', 'required');
    $this->form_validation->set_rules('tgl_awal', 'Tgl Mulai', 'required');
    $this->form_validation->set_rules('tgl_akhir', 'Tgl Selesai', 'required');
    $this->form_validation->set_rules('status_lowongan', 'Status Lowker', 'required');

    if($this->form_validation->run() == FALSE){
      // echo validation_errors();
      $output = array("status" => "error", "message" => validation_errors());
      echo json_encode($output);
      return false;
    }

    $data = array(
      "nm_lowongan_kerja" => $this->input->post('nm_lowongan_kerja'),
      "ket_lowongan" => $this->input->post('ket_lowongan'),
      "tgl_awal" => date("Y-m-d", strtotime($this->input->post('tgl_awal'))),
      "tgl_akhir" => date("Y-m-d", strtotime($this->input->post('tgl_akhir'))),
      "status_lowongan" => $this->input->post('status_lowongan'),
    );

    if(!empty($_FILES['foto_lowongan']['name']))
		{
			$upload = $this->_do_upload();
			$data['foto_lowongan'] = $upload;
		}
    
    
    $this->db->insert('tb_lowongan_kerja', $data);
    $output = array("status" => "success", "message" => "Data Berhasil Disimpan");
    echo json_encode($output);

  }

  private function _do_upload(){
		$config['upload_path']          = 'assets/images/loker/';
    $config['allowed_types']        = 'gif|jpg|jpeg|png|pdf';
    $config['max_size']             = 5000; //set max size allowed in Kilobyte
    $config['max_width']            = 4000; // set max width image allowed
    $config['max_height']           = 4000; // set max height allowed
    $config['file_name']            = round(microtime(true) * 1000); //just milisecond timestamp fot unique name

    $this->load->library('upload', $config);

    if(!$this->upload->do_upload('foto_lowongan')) //upload and validate
    {
      $data['inputerror'][] = 'foto_lowongan';
			$data['error_string'][] = 'Upload error: '.$this->upload->display_errors('',''); //show ajax error
			$data['status'] = FALSE;
			echo json_encode($data);
			exit();
		}
		return $this->upload->data('file_name');
	}

  public function deleteData(){

    $this->db->select('foto_lowongan');
    $this->db->from('tb_lowongan_kerja');
		$this->db->where('id_lowongan_kerja', $this->input->post('id_lowongan_kerja'));
		$files = $this->db->get()->row();

		// print_r($files->foto_lowongan);
		if(file_exists('assets/images/loker/'.$files->foto_lowongan) && $files->foto_lowongan)
			unlink('assets/images/loker/'.$files->foto_lowongan);

    $this->db->where('id_lowongan_kerja', $this->input->post('id_lowongan_kerja'));
    $this->db->delete('tb_lowongan_kerja');

    $output = array("status" => "success", "message" => "Data Berhasil di Hapus");
    echo json_encode($output);
  }

  public function updateData($id_lowongan_kerja){
    
    
    $this->load->library('form_validation');
    $this->form_validation->set_rules('nm_lowongan_kerja', 'Nama Lowker', 'required');
    $this->form_validation->set_rules('ket_lowongan', 'Ket Lowongan', 'required');
    $this->form_validation->set_rules('tgl_awal', 'Tgl Mulai', 'required');
    $this->form_validation->set_rules('tgl_akhir', 'Tgl Selesai', 'required');
    $this->form_validation->set_rules('status_lowongan', 'Status Lowker', 'required');

    if($this->form_validation->run() == FALSE){
      // echo validation_errors();
      $output = array("status" => "error", "message" => validation_errors());
      echo json_encode($output);
      return false;
    }

    $data = array(
      "nm_lowongan_kerja" => $this->input->post('nm_lowongan_kerja'),
      "ket_lowongan" => $this->input->post('ket_lowongan'),
      "tgl_awal" => date("Y-m-d", strtotime($this->input->post('tgl_awal'))),
      "tgl_akhir" => date("Y-m-d", strtotime($this->input->post('tgl_akhir'))),
      "status_lowongan" => $this->input->post('status_lowongan'),
    );

    if(!empty($_FILES['foto_lowongan']['name']))
		{
      $this->db->select('foto_lowongan');
      $this->db->from('tb_lowongan_kerja');
      $this->db->where('id_lowongan_kerja', $id_lowongan_kerja);
      $files = $this->db->get()->row();

      // print_r($files->foto_lowongan);
      if($files->foto_lowongan){
        if(file_exists('assets/images/loker/'.$files->foto_lowongan) && $files->foto_lowongan)
          unlink('assets/images/loker/'.$files->foto_lowongan);
      }
			$upload = $this->_do_upload();
			$data['foto_lowongan'] = $upload;
		}
    
    

    $this->db->where('id_lowongan_kerja', $id_lowongan_kerja);
    $this->db->update('tb_lowongan_kerja', $data);
    if($this->db->error()['message'] != ""){
      $output = array("status" => "error", "message" => $this->db->error()['message']);
      echo json_encode($output);
      return false;
    }
    $output = array("status" => "success", "message" => "Data Berhasil di Update");
    echo json_encode($output);

  }

  public function getLokerBuka(){
    $this->db->select('*');
    $this->db->from('tb_lowongan_kerja');
    $this->db->where('status_lowongan', 'dibuka');
    $this->db->order_by('nm_lowongan_kerja', 'asc');
    $data = $this->db->get()->result();

    echo json_encode($data);
  }

  public function getById(){
    $this->db->from('tb_lowongan_kerja');
    $this->db->where('id_lowongan_kerja', $this->input->post('id_lowongan_kerja'));
    $data = $this->db->get()->row();

    echo json_encode($data);
  }

}