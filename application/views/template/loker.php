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
              <h3 class="card-title">Data Lowker <?php echo date("d-m-Y", strtotime('18-Jun-2021')) ?></h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
            <button class="btn btn-sm btn-info" style="margin-bottom: 10px;" id="add_data"><i class="fas fa-plus-circle"></i> Tambah</button>
              <table id="tb_data" class="table table-bordered table-hover" style="font-size: 12px">
                <thead>
                <tr>
                  <th style="width:25px">NO.</th>
                  <th>Lowongan</th>
                  <th>Keterangan</th>
                  <th>Image</th>
                  <th>Start</th>
                  <th>End</th>
                  <th style="width:50px">Status</th>
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

    <div class="modal fade" id="modal_add">
      <div class="modal-dialog">
        <div class="modal-content">
          <form id="FRM_DATA" method="post" enctype="multipart/form-data">
            <div class="modal-header">
              <h4 class="modal-title">Data</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <p>Lowongan Kerja</p>
                <input type="text" class="form-control" name="nm_lowongan_kerja">
              </div>
              <div class="form-group">
                <p>Keterangan</p>
                <textarea name="ket_lowongan" class="form-control" rows="5"></textarea>
              </div>
              <div class="form-group">
                <p>File Lowker</p>
                <div class="custom-file">
                  <input type="file"  name="foto_lowongan">
                  <!-- <label class="custom-file-label" for="customFile">Choose file</label> -->
                </div>
              </div>
              <div class="form-group">
                <label>Tanggal Mulai:</label>
                <input type="text" class="form-control datepicker" name="tgl_awal">
              </div>
              <div class="form-group">
                <label>Tanggal Selesai:</label>
                <input type="text" class="form-control datepicker" name="tgl_akhir">
              </div>
              <div class="form-group">
                <p>Status Lowongan</p>
                <select class="form-control" name="status_lowongan">
                  <option value="dibuka">Di Buka</option>
                  <option value="ditutup">Di Tutup</option>
                </select>
              </div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary" id="BTN_SAVE">Save changes</button>
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
    $(".datepicker").datepicker({
      autoclose: true,
      format: 'dd-M-yyyy'
    });
    
    REFRESH_DATA()

    $("#add_data").click(function(){
      $("#FRM_DATA")[0].reset()
      save_method = "save"
      $("#modal_add .modal-title").text('Add Data')
      $("#modal_add").modal('show')
    }) 


    $("#FRM_DATA").on('submit', function(event){
      event.preventDefault();
      let formData = new FormData(this);

      
      if(save_method == 'save') {
          urlPost = "<?php echo site_url('loker/saveData') ?>";
      }else{
          urlPost = "<?php echo site_url('loker/updateData/') ?>"+id_edit;
      }
      // console.log(formData)
      ACTION(urlPost, formData)
      $("#modal_add").modal('hide')
    })

  });

  function REFRESH_DATA(){
    $('#tb_data').DataTable().destroy();
    var tb_data = $("#tb_data").DataTable({
      "order": [[ 0, "asc" ]],
      "pageLength": 25,
      "autoWidth": false,
      "responsive": true,
      "ajax": {
          "url": "<?php echo site_url('loker/getAllData') ?>",
          "type": "GET"
      },
      "columns": [
          {
              "data": null,
              render: function (data, type, row, meta) {
                  return meta.row + meta.settings._iDisplayStart + 1;
              }
          },
          { "data": "nm_lowongan_kerja" },{ "data": "ket_lowongan" },
          { "data": "foto_lowongan",
            render: function (data, type, row, meta) {
                if(data){
                  return "<a target='_blank' href='<?php echo base_url() ?>assets/images/loker/"+data+"'><img  style='max-width: 120px;' class='img-fluid' src='<?php echo base_url() ?>assets/images/loker/"+data+"' ></a>";
                }else{
                  return "No File"
                }
            }
          },
          { "data": "tgl_awal" },
          { "data": "tgl_akhir" },{ "data": "status_lowongan" },
          { "data": null, 
            "render" : function(data){
              return "<button class='btn btn-sm btn-warning' onclick='editData("+JSON.stringify(data)+");'><i class='fas fa-edit'></i> Edit</button> "+
                "<button class='btn btn-sm btn-danger' onclick='deleteData(\""+data.id_lowongan_kerja+"\");'><i class='fas fa-trash'></i> Delete</button>"
            },
            className: "text-center"
          },
      ]
    })
  }

  function ACTION(urlPost, formData){
    
    $.ajax({
      url: urlPost,
      type: "POST",
      data: formData,
      beforeSend: function(){
        $("#LOADER").show();
      },
      complete: function(){
        $("#LOADER").hide();
      },
      processData : false,
      cache: false,
      contentType : false,
      success: function(data){
        data = JSON.parse(data)
        console.log(data)
        if (data.status == "success") {
          toastr.info(data.message)
          REFRESH_DATA()

        }else{
          toastr.error(data.message)
        }
      },
      error: function (err) {
        console.log(err);
      }
    })
     
  }

  function editData(data, index){
    console.log(data)
    save_method = "edit"
    id_edit = data.id_lowongan_kerja;
    console.log(id_edit)
    $("#modal_add .modal-title").text('Edit Data')
    $("[name='nm_lowongan_kerja']").val(data.nm_lowongan_kerja)
    $("[name='ket_lowongan']").val(data.ket_lowongan)
    $("[name='tgl_akhir']").val(data.tgl_akhir)
    $("[name='tgl_awal']").val(data.tgl_awal)
    $("[name='status_lowongan']").val(data.status_lowongan)
    $("#modal_add").modal('show')
  }

  function deleteData(id){
    if(!confirm('Delete this data?')) return

    urlPost = "<?php echo site_url('loker/deleteData') ?>";
    formData = "id_lowongan_kerja="+id
    
    $.ajax({
        url: urlPost,
        type: "POST",
        data: formData,
        dataType: "JSON",
        beforeSend: function () {
          $("#LOADER").show();
        },
        complete: function () {
          $("#LOADER").hide();
        },
        success: function(data){
          // console.log(data)
          if (data.status == "success") {
            toastr.info(data.message)
            

            REFRESH_DATA()

          }else{
            toastr.error(data.message)
          }
        }
    })
  }
</script>