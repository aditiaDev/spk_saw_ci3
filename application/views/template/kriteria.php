<!-- DataTables -->
<link rel="stylesheet" href="<?php echo base_url('/assets/adminlte/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css'); ?>">
<link rel="stylesheet" href="<?php echo base_url('/assets/adminlte/plugins/datatables-responsive/css/responsive.bootstrap4.min.css'); ?>">
<link rel="stylesheet" href="<?php echo base_url('/assets/adminlte/plugins/datatables-buttons/css/buttons.bootstrap4.min.css'); ?>">
<div class="content-wrapper">  
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-12">
          <div class="card" style="margin-top: 1rem">
            <div class="card-header">
              <h3 class="card-title">Data Kriteria</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <button class="btn btn-sm btn-info" style="margin-bottom: 10px;"><i class="fas fa-plus-circle"></i> Tambah</button>
              <table id="tb_data" class="table table-bordered table-hover">
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
              </table>
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
    


    $("#tb_data").DataTable({
      "order": [[ 0, "asc" ]],
      "pageLength": 25,
      "autoWidth": false,
      "responsive": true,
      "ajax": {
          "url": "<?php echo site_url('kriteria/getAllData') ?>",
          "type": "GET"
      },
      "columns": [
          { "data": "id_kriteria" },
          { "data": "nm_kriteria" },{ "data": "jenis_kiteria" },{ "data": "bobot" },
          { "data": "id_kriteria", 
            "render" : function(data){
              return "<button class='btn btn-sm btn-warning' onclick='editUser(\""+data+"\");'><i class='fas fa-edit'></i> Edit</button> "+
                "<button class='btn btn-sm btn-danger' onclick='deleteUser(\""+data+"\");'><i class='fas fa-trash'></i> Edit</button>"
            },
            className: "text-center"
          },
      ]
    })


  });
</script>