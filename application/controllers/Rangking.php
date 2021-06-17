<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Rangking extends CI_Controller {

  public function __construct(){
    parent::__construct();
    $this->load->model('RangkingModel');
  }

  public function index(){
    // $data['model'] = $this->UserModel->getData();

    // $this->load->view('home', $data);
    $this->load->view('template/header');
    $this->load->view('template/rangking');
    $this->load->view('template/footer');
  }

  public function getAllData(){
  	$data['data'] = $this->db->get('tb_kriteria')->result();
  	echo json_encode($data);
  }

  public function getRangking(){
    $id_loker = 1;
    
    


    $tr_pelamar="";
    $pelamar = $this->db->query("SELECT id_pelamar, nm_pelamar FROM tb_pelamar WHERE id_lowongan_kerja='".$id_loker."' ORDER BY id_pelamar")->result_array();
    
    foreach($pelamar as $listPelamar){
        $th_kriteria="<th></th>";
        $th_bobot="<th>Bobot</th>";
        $td = "";
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
            }
            
        }
        $tr_pelamar .= "<tr>
                            <td>".$listPelamar['nm_pelamar']."</td>
                            ".$td."
                        </tr>";
    }

    $table = "<table  border='1' style='border: 1px solid #dee2e6;border-collapse: collapse;width:100%;'>
                <thead>";
    $table .= "<tr>".$th_kriteria."<th rowspan='2'>Total</th><th rowspan='2'>Rangking</th></tr>";
    $table .= "<tr>".$th_bobot."</tr>";
    $table .= "</thead>
                <tbody>";
    $table .= $tr_pelamar;
    $table .= "</tbody></table>";
    echo $table;
  }

}