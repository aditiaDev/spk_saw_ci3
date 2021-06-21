<!-- DataTables -->
<link rel="stylesheet" href="<?php echo base_url('/assets/adminlte/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css'); ?>">
<link rel="stylesheet" href="<?php echo base_url('/assets/adminlte/plugins/datatables-responsive/css/responsive.bootstrap4.min.css'); ?>">
<link rel="stylesheet" href="<?php echo base_url('/assets/adminlte/plugins/datatables-buttons/css/buttons.bootstrap4.min.css'); ?>">
<style>
td.details-control {
    background: url(<?php echo base_url('/assets/adminlte/plugins/datatables/details_open.png') ?>) no-repeat center center;
    cursor: pointer;
}
tr.shown td.details-control {
    background: url(<?php echo base_url('/assets/adminlte/plugins/datatables/details_close.png') ?>) no-repeat center center;
}
</style>
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
            
              <table id="tb_data" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>No.</th>
                  <th>Pelamar</th>
                  <th>Loker</th>
                  <th>Nilai</th>
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
                    <div class="form-group" id="input_pelamar">
                      <label>Pelamar</label>
                      <select class="form-control select2" name="id_pelamar"></select>
                      <input type="text" id="txt_pelamar" class="form-control" disabled style="display:none">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-12">
                    <table class="table table-bordered" style="font-size:12px;" id="tb_nilai">
                      <thead>
                        <th style="width: 70px;">ID</th>
                        <th>Kriteria</th>
                        <th>Jenis</th>
                        <th style="width: 220px;">Nilai</th>
                      </thead>
                      <tbody></tbody>
                    </table>
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
  var tb_data
  var save_method;
  var id_edit;
  $(function () {
    
    REFRESH_DATA()
    

    $(".select2").select2()

    $("#add_data").click(function(){
      ISI_PELAMAR()
      $("#FRM_DATA")[0].reset()
      save_method = "save"

      $("#input_pelamar span").show()
      $("#txt_pelamar").hide()


      $.ajax({
        url: "<?php echo site_url('kriteria/getAllData') ?>",
        type: "GET",
        dataType: "JSON",
        success: function(data){
          var row="";
          $.each(data.data, (index, item) => {
              console.log(item)
              row += "<tr>"+
                        "<td>"+item.id_kriteria+"<input type='hidden' name='id_kriteria[]' value='"+item.id_kriteria+"' ></td>"+
                        "<td>"+item.nm_kriteria+"</td>"+
                        "<td>"+item.jenis_kiteria+"</td>"+
                        "<td><input type='text' name='nilai[]' class='form-control' required ></td>"+
                      "</tr>"
          });
          $("#tb_nilai tbody").html(row)
          
        }
      })

      $("#modal_add .modal-title").text('Add Data')
      $("#modal_add").modal('show')
    }) 

    

    function format ( data ) {
        var Row="";
        $.each( data, function( key, value ) {
          // console.log(value)
          Row += '<tr>'+
                      '<td>'+value.id_kriteria+'</td>'+
                      '<td>'+value.nm_kriteria+'</td>'+
                      '<td>'+value.nilai+'</td>'+
                    '</tr>';
        });
        return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'
                      +Row+
                  '</table>';
    }

    

    $('#tb_data tbody').on('click', 'td>button.detail_data', function () {
      
        var tr = $(this).closest('tr');
        var row = tb_data.row( tr );
 
        if ( row.child.isShown() ) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            // Open this row
            console.log(row.data())
            
            $.ajax({
              url: "<?php echo site_url('nilai/getDtlNilai') ?>",
              type: "POST",
              // dataType: "JSON",
              data: {
                id_pelamar: row.data().id_pelamar,
                id_lowongan_kerja: row.data().id_lowongan_kerja
              },
              success: function(data){
                datas = JSON.parse(data)
                data = datas['data']
                row.child( format(data) ).show();
                tr.addClass('shown');
              
              }
            })
            
        }
    } );

    $("#FRM_DATA").submit(function(event){
      event.preventDefault();
      var formData = $("#FRM_DATA").serialize();
      

      if(save_method == 'save') {
        urlPost = "<?php echo site_url('nilai/saveData') ?>";
      }else{
          urlPost = "<?php echo site_url('nilai/updateData') ?>";
          formData+="&id_pelamar="+id_edit
      }
      // console.log(formData)
      ACTION(urlPost, formData)
      $("#modal_add").modal('hide')
    })


  });

  function REFRESH_DATA(){
    $('#tb_data').DataTable().destroy();
    tb_data = $("#tb_data").DataTable({
      "order": [[ 0, "asc" ]],
      "pageLength": 25,
      "autoWidth": false,
      "responsive": true,
      "ajax": {
          "url": "<?php echo site_url('nilai/getAllDataPelamar') ?>",
          "type": "GET"
      },
      "columns": [
          {
              "data": null,
              render: function (data, type, row, meta) {
                  return meta.row + meta.settings._iDisplayStart + 1;
              }
          },
          { "data": "nm_pelamar" },{ "data": "nm_lowongan_kerja" },
          { "data": null,
            "render" : function(data){
              // return "<button class='btn btn-xs btn-default' onclick='detailData(\""+data.id_pelamar+"\",\""+data.id_lowongan_kerja+"\");'><i class='fas fa-edit'></i> Detail</button>"
              return "<button class='btn btn-xs btn-default detail_data'><i class='fas fa-edit'></i> Detail</button>"
            },
            className: "text-center"
          },
      ]
    })

  }

  function ISI_PELAMAR(){
    $.ajax({
      url: "<?php echo site_url('nilai/getPelamarBelumNilai') ?>",
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

  function ACTION(urlPost, formData){
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
            ISI_PELAMAR()

          }else{
            toastr.error(data.message)
          }
        }
    })
  }

  function editData(data, index){
    console.log(data)
    save_method = "edit"
    id_edit = data.id_pelamar;

    $("#input_pelamar span").hide()
    $("#txt_pelamar").show()

    console.log(id_edit)

    $.ajax({
      url: "<?php echo site_url('nilai/getNilaiPelamar') ?>/"+id_edit,
      type: "GET",
      dataType: "JSON",
      success: function(data){
        console.log(data)
        var row="";
          $.each(data, (index, item) => {
              console.log(item)
              row += "<tr>"+
                        "<td>"+item.id_kriteria+"<input type='hidden' name='id_kriteria[]' value='"+item.id_kriteria+"' ></td>"+
                        "<td>"+item.nm_kriteria+"</td>"+
                        "<td>"+item.jenis_kiteria+"</td>"+
                        "<td><input type='text' name='nilai[]' class='form-control' value='"+item.nilai+"' required ></td>"+
                      "</tr>"
          });
          $("#tb_nilai tbody").html(row)
      }
    })

    $("#modal_add .modal-title").text('Edit Data')
    $("#txt_pelamar").val(data.nm_pelamar)
    $("#modal_add").modal('show')
  }

  function deleteData(id){
    if(!confirm('Delete this data?')) return

    urlPost = "<?php echo site_url('nilai/deleteData') ?>";
    formData = "id_pelamar="+id
    ACTION(urlPost, formData)
  }
</script>