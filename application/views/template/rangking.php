<!-- DataTables -->
<link rel="stylesheet" href="<?php echo base_url('/assets/adminlte/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css'); ?>">
<link rel="stylesheet" href="<?php echo base_url('/assets/adminlte/plugins/datatables-responsive/css/responsive.bootstrap4.min.css'); ?>">
<link rel="stylesheet" href="<?php echo base_url('/assets/adminlte/plugins/datatables-buttons/css/buttons.bootstrap4.min.css'); ?>">
<style type="text/css">
  .tabel {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
  }

  /*.tabel td{
    resize: horizontal;
    overflow: auto;
  }*/

  .tabel td, .tabel th {
    border: 1px solid #ddd;
    padding: 8px;
    
  }

  .tabel tr:nth-child(even){background-color: #f2f2f2;}

  .tabel tr:hover {background-color: #ddd;}

  .tabel th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
  }
  .tabel thead th { 
    position: sticky; 
    top: 0; 
    z-index: 1;
    resize: horizontal;
    overflow: auto;
  }
</style>
<div class="content-wrapper">  
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-12">
          <div class="card" style="margin-top: 1rem">
            <div class="card-header">
              <h3 class="card-title">Perangkingan</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <div class="row">
                <div class="col-2" style="margin-bottom: 10px;">
                  <select style="height: 32px;" name="" id="" class="form-control"></select>
                </div>
                <div class="col-3" style="margin-bottom: 10px;">
                  <button class="btn btn-sm btn-default" id="proses"><i class="fas fa-check"></i> Proses</button>
                  <button class="btn btn-sm btn-warning" id="ulang_ranking" style="display: none;"><i class="fas fa-redo"></i> Ranking ulang</button>
                </div>
              </div>
              <!-- <table id="tb_data" border="1" style="border: 1px solid #dee2e6;border-collapse: collapse;width:100%;">
                <thead>
                <tr>
                  <th>ID Kriteria</th>
                  <th>Kriteria</th>
                  <th>Jenis Kriteria</th>
                  <th>Bobot</th>
                  <th>Action</th>
                </tr>
                </thead>
                <tbody>
                
                </tbody>
              </table> -->
              <span id="tb_normalisasi"></span>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
      </div>
    </div>
  </section>
</div>

<!-- jQuery -->
<script src="<?php echo base_url('/assets/adminlte/plugins/jquery/jquery.min.js'); ?>"></script>
<script>
  $(function () {
    

    $("#proses").click(function(){
      $.ajax({
        url: "<?php echo site_url('rangking/getRangking') ?>",
        type: "POST",
        data: {
          id_lowongan_kerja: 1
        },
        success: function(data){
          console.log(data)
          $("#tb_normalisasi").html(data)
          $("#proses").hide()
          $("#ulang_ranking").show()
        }
      })
    })
    


  });
</script>