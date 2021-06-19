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
              <h3 class="card-title">Data Pelamar</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <button class="btn btn-sm btn-info" style="margin-bottom: 10px;" id="add_data"><i class="fas fa-plus-circle"></i> Tambah</button>
              <table id="tb_data" class="table table-bordered table-hover" style="font-size: 12px">
                <thead>
                <tr>
                  <th style="width: 25px;">No.</th>
                  <th>Loker</th>
                  <th>Nama</th>
                  <th>Jekel</th>
                  <th>Alamat</th>
                  <th>Telp.</th>
                  <th style="width: 45px;">Lulusan</th>
                  <th>Jurusan</th>
                  <th style="width: 118px;">Action</th>
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

    <div class="modal fade" id="modal_add">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <form id="FRM_DATA">
            <div class="modal-header">
              <h4 class="modal-title">Data</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              
                <div class="row">
                  <div class="col-sm-6">
                    <div class="form-group">
                      <label>Lowongan Kerja</label>
                      <select class="form-control" name="id_lowongan_kerja"></select>
                    </div>
                  </div>
                  <div class="col-sm-6">
                    <div class="form-group">
                      <label>Nama Pelamar</label>
                      <input type="text" class="form-control" name="nm_pelamar">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-6">
                    <div class="form-group">
                      <label>Jenis Kelamin</label>
                      <select class="form-control" name="jenis_kelamin">
                        <option value="pria">Pria</option>
                        <option value="wanita">Wanita</option>
                      </select>
                    </div>
                  </div>
                  <div class="col-sm-6">
                    <div class="form-group">
                      <label>No. Telp</label>
                      <input type="text" class="form-control" name="no_tlp">
                    </div>
                  </div>
                </div>

                <!-- input states -->
                <div class="form-group">
                  <label class="col-form-label" for="inputSuccess"><i class="fas fa-check"></i> Input with
                    success</label>
                  <input type="text" class="form-control is-valid" id="inputSuccess" placeholder="Enter ...">
                </div>
              </div>
              
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary" id="BTN_SAVE">Save changes</button>
            </div>
          </form>
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
  </section>
</div>

<!-- jQuery -->
<script src="<?php echo base_url('/assets/adminlte/plugins/jquery/jquery.min.js'); ?>"></script>
<script>
  var save_method;
  var id_edit;
  $(function () {
    

    REFRESH_DATA()
    
    $("#add_data").click(function(){
      $("#FRM_DATA")[0].reset()
      save_method = "save"
      $("#modal_add .modal-title").text('Add Data')
      $("#modal_add").modal('show')
    }) 

  });

  function REFRESH_DATA(){
    $('#tb_data').DataTable().destroy();
    var tb_data = $("#tb_data").DataTable({
      "order": [[ 0, "asc" ]],
      "autoWidth": false,
      "responsive": true,
      "pageLength": 25,
      "ajax": {
          "url": "<?php echo site_url('pelamar/getAllData') ?>",
          "type": "GET"
      },
      "columns": [
          {
              "data": null,
              render: function (data, type, row, meta) {
                  return meta.row + meta.settings._iDisplayStart + 1;
              }
          },
          { "data": "nm_lowongan_kerja" },
          { "data": "nm_pelamar" },{ "data": "jenis_kelamin" },{ "data": "alamat_pelamar" },
          { "data": "no_tlp" },{ "data": "lulusan" },{ "data": "jurusan" },
          { "data": null, 
            "render" : function(data){
              return "<button class='btn btn-sm btn-warning' onclick='editData("+JSON.stringify(data)+");'><i class='fas fa-edit'></i> Edit</button> "+
                "<button class='btn btn-sm btn-danger' onclick='deleteData(\""+data.id_kriteria+"\");'><i class='fas fa-trash'></i> Delete</button>"
            },
            className: "text-center"
          },
      ]
    })
  }
</script>