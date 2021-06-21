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
              <h3 class="card-title">Data Berkas</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
            <button class="btn btn-sm btn-info" style="margin-bottom: 10px;" id="add_data"><i class="fas fa-plus-circle"></i> Tambah</button>
              <table id="tb_data" class="table table-bordered table-hover" style="font-size: 12px">
                <thead>
                <tr>
                  <th style="width: 35px;">No.</th>
                  <th>Pelamar</th>
                  <th>Pendidikan</th>
                  <th>Loker</th>
                  <th>Nama Berkas</th>
                  <th>Berkas</th>
                  <th style="min-width: 125px;">Action</th>
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
                <!-- <select name="id_pelamar"  class="form-control select2"></select> -->
                <input type="hidden" class="form-control" name="id_pelamar">
              </div>
              <div class="form-group">
                <p>Nama Berkas</p>
                <input type="text" class="form-control" name="nm_berkas">
              </div>
              <div class="form-group">
                <p>File Berkas</p>
                <div class="custom-file">
                  <input type="file"  name="file_berkas">
                </div>
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

    $(".select2").select2()
    
    REFRESH_DATA()
    ISI_PELAMAR()

    $("#add_data").click(function(){
      $("#FRM_DATA")[0].reset()
      save_method = "save"
      ISI_PELAMAR()
      $("#modal_add .modal-title").text('Add Data')
      $("#modal_add").modal('show')
    }) 


    $("#FRM_DATA").on('submit', function(event){
      event.preventDefault();
      let formData = new FormData(this);

      
      if(save_method == 'save') {
          urlPost = "<?php echo site_url('berkas/saveDataPelamar') ?>";
      }else{
          urlPost = "<?php echo site_url('berkas/updateData/') ?>"+id_edit;
      }
      // console.log(formData)
      ACTION(urlPost, formData)
      $("#modal_add").modal('hide')
    })


  });

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
    id_edit = data.id_berkas;
    console.log(id_edit)
    $("#modal_add .modal-title").text('Edit Data')
    $("[name='id_pelamar']").val(data.id_pelamar).change()
    $("[name='nm_berkas']").val(data.nm_berkas)
    $("#modal_add").modal('show')
  }

  function REFRESH_DATA(){
    $('#tb_data').DataTable().destroy();
    var tb_data = $("#tb_data").DataTable({
      "order": [[ 0, "asc" ]],
      "pageLength": 25,
      "autoWidth": false,
      "responsive": true,
      "ajax": {
          "url": "<?php echo site_url('berkas/getAllDataUser') ?>",
          "type": "GET"
      },
      "columns": [
          {
              "data": null,
              render: function (data, type, row, meta) {
                  return meta.row + meta.settings._iDisplayStart + 1;
              }
          },
          { "data": "nm_pelamar" },
          { "data": "pendidikan" },{ "data": "nm_lowongan_kerja" },{ "data": "nm_berkas" },
          { "data": "file_berkas",
            render: function (data, type, row, meta) {
                if(data){
                  return "<a target='_blank' class='btn btn-xs btn-info' href='<?php echo base_url() ?>assets/images/berkas/"+data+"'>Download</a>";
                }else{
                  return "No File"
                }
            }
          },
          { "data": null, 
            "render" : function(data){
              return "<!--<button class='btn btn-sm btn-warning' onclick='editData("+JSON.stringify(data)+");'><i class='fas fa-edit'></i> Edit</button> -->"+
                "<button class='btn btn-sm btn-danger' onclick='deleteData(\""+data.id_berkas+"\");'><i class='fas fa-trash'></i> Delete</button>"
            },
            className: "text-center"
          },
      ]
    })

  }

  function ISI_PELAMAR(){
    $.ajax({
      url: "<?php echo site_url('berkas/getPelamarBerkas') ?>",
      type: "GET",
      dataType: "JSON",
      success: function(data){
        var row="";
        $.each(data, (index, item) => {
            // console.log(item)
            row += "<option value='"+item.id_pelamar+"'>"+item.nm_pelamar+"</option>"
        });
        
        $("[name='id_pelamar']").html(row)
      }
    })
  }

  function deleteData(id){
    if(!confirm('Delete this data?')) return

    urlPost = "<?php echo site_url('berkas/deleteData') ?>";
    formData = "id_berkas="+id
    
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