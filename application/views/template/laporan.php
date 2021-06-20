
<div class="content-wrapper">  
  <section class="content">
    <div class="container-fluid">
        <form action="<?php echo base_url('laporan/cetakRangking') ?>" method="POST" target="_blank">
            <div class="row">
                <div class="col-12">
                <div class="card" style="margin-top: 1rem">
                    <div class="card-header">
                    <h3 class="card-title">Welcome</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div class="row">
                            <div class="col-2" style="margin-bottom: 10px;">
                                <select style="height: 32px;" name="id_lowongan_kerja"  class="form-control select2"></select>
                            </div>
                            <div class="col-3" style="margin-bottom: 10px;">
                                <button class="btn btn-sm btn-default" id="proses"><i class="fas fa-print"></i> Cetak</button>
                            </div>
                        </div>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
                </div>
                <!-- /.col -->
            </div>
        </form>
    </div>
  </section>
</div>

<script src="<?php echo base_url('/assets/adminlte/plugins/jquery/jquery.min.js'); ?>"></script>
<script>
  $(function () {
    
    $.ajax({
      url: "<?php echo site_url('loker/getAllData') ?>",
      type: "GET",
      dataType: "JSON",
      success: function(data){
        var row="";
        $.each(data.data, (index, item) => {
            row += "<option value='"+item.id_lowongan_kerja+"'>"+item.nm_lowongan_kerja+"</option>"
        });
        
        $("[name='id_lowongan_kerja']").html(row)
      }
    })

  });
</script>