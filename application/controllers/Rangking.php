<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Rangking extends CI_Controller {

  public function __construct(){
    parent::__construct();
    if(!$this->session->userdata('id_user'))
      redirect('login', 'refresh');
    $this->load->model('RangkingModel');

  }

  public function index(){
    // $data['model'] = $this->UserModel->getData();

    // $this->load->view('home', $data);
    $this->load->view('template/header');
    $this->load->view('template/sidebar');
    $this->load->view('template/rangking');
    $this->load->view('template/footer');
  }

  public function getAllData(){
  	$data['data'] = $this->db->get('tb_kriteria')->result();
  	echo json_encode($data);
  }

  public function ulangRangking(){
    $this->db->query("DELETE FROM tb_rangking WHERE id_pelamar IN(
      SELECT id_pelamar FROM tb_pelamar WHERE id_lowongan_kerja='".$this->input->post('id_lowongan_kerja')."'
      )");

    $this->db->query("DELETE FROM tb_normalisasi WHERE id_pelamar IN(
      SELECT id_pelamar FROM tb_pelamar WHERE id_lowongan_kerja='".$this->input->post('id_lowongan_kerja')."'
      )");
    
    // $output = array("status" => "success");
    // echo json_encode($output);
  }

  public function getRangking(){
    $this->ulangRangking();
    $id_loker = $this->input->post('id_lowongan_kerja');

    $tr_pelamar="";
    $pelamar = $this->db->query("SELECT id_pelamar, nm_pelamar FROM tb_pelamar WHERE id_lowongan_kerja='".$id_loker."' 
                                AND id_pelamar IN(
                                SELECT id_pelamar FROM tb_nilai
                                ) ORDER BY id_pelamar")->result_array();
    
    foreach($pelamar as $listPelamar){
        $th_kriteria="<th></th>";
        $th_bobot="<th>Bobot</th>";
        $td = "";
        $total_normalisasi=0;
        $kriteria = $this->db->query("SELECT id_kriteria, bobot, jenis_kiteria FROM tb_kriteria ORDER BY id_kriteria")->result_array();
        foreach($kriteria as $list){
            $th_kriteria .= "<th>".$list['id_kriteria']."</th>";
            $th_bobot .= "<th>".$list['bobot']."</th>";
            
            $sql = "SELECT a.nilai FROM tb_nilai a, tb_pelamar b
            WHERE a.id_pelamar=b.id_pelamar
            AND a.id_kriteria='".$list['id_kriteria']."'
            AND b.id_pelamar='".$listPelamar['id_pelamar']."'
            AND b.id_lowongan_kerja='".$id_loker."'";
            $nilai = $this->db->query($sql)->result_array();
            foreach($nilai as $listNilai){
                $nilai_pelamar = $listNilai['nilai'];
                
                if(strtoupper($list['jenis_kiteria']) == "BENEFIT"){
                    $nilai_MAX = $this->db->query("SELECT MAX(a.nilai) MAX_NILAI FROM tb_nilai a, tb_pelamar b
                    WHERE a.id_pelamar=b.id_pelamar
                    AND a.id_kriteria='".$list['id_kriteria']."'
                    AND b.id_lowongan_kerja='".$id_loker."'")->row()->MAX_NILAI;

                    
                    $nilai_r = $listNilai['nilai']/$nilai_MAX;
                }else{
                    $nilai_MIN = $this->db->query("SELECT MIN(a.nilai) MIN_NILAI FROM tb_nilai a, tb_pelamar b
                    WHERE a.id_pelamar=b.id_pelamar
                    AND a.id_kriteria='".$list['id_kriteria']."'
                    AND b.id_lowongan_kerja='".$id_loker."'")->row()->MIN_NILAI;

                    $nilai_r = $nilai_MIN/$listNilai['nilai'];
                }

                $td .= "<td>".$nilai_r."</td>";

                $data = array(
                  "id_pelamar" => $listPelamar['id_pelamar'],
                  "id_kriteria" => $list['id_kriteria'],
                  "nilai_normalisasi" => $nilai_r,
                );
                $this->db->insert('tb_normalisasi', $data);
                $total_normalisasi = $total_normalisasi+($nilai_r*$list['bobot']);
            }
            
            

        }
        $data_rangking = array(
                  "id_pelamar" => $listPelamar['id_pelamar'],
                  "total_nilai" => $total_normalisasi,
                );
            $this->db->insert('tb_rangking', $data_rangking);

        $tr_pelamar .= "<tr>
                            <td>".$listPelamar['nm_pelamar']."</td>
                            ".$td."
                            <td>".$total_normalisasi."</td>
                        </tr>";
    }

    /*$table = "<table  border='1' style='border: 1px solid #dee2e6;border-collapse: collapse;width:100%;'>
                <thead>";*/
    $table = "<table class='tabel'>
                <thead>";
    $table .= "<tr>".$th_kriteria."<th rowspan='2' style='vertical-align: middle;text-align: center;'>Total</th></tr>";
    $table .= "<tr>".$th_bobot."</tr>";
    $table .= "</thead>
                <tbody>";
    $table .= $tr_pelamar;
    $table .= "</tbody></table>";
    echo $table;

    // $kriteria = $this->db->query("")->result_array();
    $this->db->select('a.*, b.nm_pelamar');
    $this->db->from('tb_rangking a'); 
    $this->db->join('tb_pelamar b', 'a.id_pelamar=b.id_pelamar', 'left');
    $this->db->order_by('a.total_nilai','desc');         
    $data_ranks = $this->db->get()->result();

    $row_rank="";
    $no=1;
    foreach($data_ranks as $data_rank){
        $row_rank.="<tr>
                        <td>".$no++."</td>
                        <td>".$data_rank->nm_pelamar."</td>
                        <td>".$data_rank->total_nilai."</td>
                    </tr>";
    }


    $tb_rank ="<table class='tabel' style='width: 50%;margin-top:15px;'>
                    <thead>
                        <th style='width: 65px;'>Rank</th>
                        <th>Pelamar</th>
                        <th>Nilai</th>
                    </thead>
                    <tbody>
                        ".$row_rank."
                    </tbody>
                </table>";
    echo $tb_rank;
  }

  

}