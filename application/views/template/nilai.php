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
              <button class="btn btn-sm btn-info" style="margin-bottom: 10px;"><i class="fas fa-plus-circle"></i> Tambah</button>
              <table id="tb_data" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>No.</th>
                  <th>Pelamar</th>
                  <th>Loker</th>
                  <th>Nilai</th>
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

    var tb_data = $("#tb_data").DataTable({
      "order": [[ 0, "asc" ]],
      "pageLength": 25,
      "autoWidth": false,
      "responsive": true,
      "ajax": {
          "url": "<?php echo site_url('nilai/getAllData') ?>",
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
          { "data": null, 
            "render" : function(data){
              return "<button class='btn btn-sm btn-warning' onclick='editUser(\""+data.id_pelamar+"\",\""+data.id_lowongan_kerja+"\");'><i class='fas fa-edit'></i> Edit</button> "+
                "<button class='btn btn-sm btn-danger' onclick='deleteUser(\""+data.id_pelamar+"\",\""+data.id_lowongan_kerja+"\");'><i class='fas fa-trash'></i> Edit</button>"
            },
            className: "text-center"
          },
      ]
    })

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


  });
</script>