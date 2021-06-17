<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Controller {

  public function __construct(){
    parent::__construct();

    $this->load->model('UserModel'); // Load Model
  }

  public function index(){
    // $data['model'] = $this->UserModel->getData();

    // $this->load->view('home', $data);
    $this->load->view('template/header');
    $this->load->view('template/user');
    $this->load->view('template/footer');
  }

  public function getAllUser(){
  	$data['data'] = $this->db->get('tb_user')->result();
  	echo json_encode($data);
  }

//   public function simpan(){
//     if($this->SiswaModel->validation("save")){ // Jika validasi sukses atau hasil validasi adalah true
//       $this->SiswaModel->save(); // Panggil fungsi save() yang ada di SiswaModel.php

//       // Load ulang view.php agar data yang baru bisa muncul di tabel pada view.php
//       $html = $this->load->view('siswa/view', array('model'=>$this->SiswaModel->view()), true);
//       $callback = array(
//         'status'=>'sukses',
//         'pesan'=>'Data berhasil disimpan',
//         'html'=>$html
//       );
//     }else{
//       $callback = array(
//         'status'=>'gagal',
//         'pesan'=>validation_errors()
//       );
//     }

//     echo json_encode($callback);
//   }

//   public function ubah($id){
//     if($this->SiswaModel->validation("update")){ // Jika validasi sukses atau hasil validasi adalah true
//       $this->SiswaModel->edit($id); // Panggil fungsi edit() yang ada di SiswaModel.php

//       // Load ulang view.php agar data yang baru bisa muncul di tabel pada view.php
//       $html = $this->load->view('siswa/view', array('model'=>$this->SiswaModel->view()), true);
//       $callback = array(
//         'status'=>'sukses',
//         'pesan'=>'Data berhasil diubah',
//         'html'=>$html
//       );
//     }else{
//       $callback = array(
//         'status'=>'gagal',
//         'pesan'=>validation_errors()
//       );
//     }

//     echo json_encode($callback);
//   }

//   public function hapus($id){
//     $this->SiswaModel->delete($id); // Panggil fungsi delete() yang ada di SiswaModel.php

//     // Load ulang view.php agar data yang baru bisa muncul di tabel pada view.php
//     $html = $this->load->view('siswa/view', array('model'=>$this->SiswaModel->view()), true);
//     $callback = array(
//       'status'=>'sukses',
//       'pesan'=>'Data berhasil dihapus',
//       'html'=>$html
//     );

//     echo json_encode($callback);
//   }
}