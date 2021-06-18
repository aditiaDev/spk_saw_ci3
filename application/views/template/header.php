<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>SPK Metode SAW</title>

  <!-- Google Font: Source Sans Pro -->
  <!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback"> -->
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?php echo base_url('/assets/adminlte/plugins/fontawesome-free/css/all.min.css'); ?>">
  <!-- Ionicons -->
  <link rel="stylesheet" href="<?php echo base_url('/assets/ionicons/ionicons.min.css'); ?>">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="<?php echo base_url('/assets/adminlte/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css'); ?>">
  <!-- iCheck -->
  <link rel="stylesheet" href="<?php echo base_url('/assets/adminlte/plugins/icheck-bootstrap/icheck-bootstrap.min.css'); ?>">
  <!-- JQVMap -->
  <link rel="stylesheet" href="<?php echo base_url('/assets/adminlte/plugins/jqvmap/jqvmap.min.css'); ?>">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?php echo base_url('/assets/adminlte/dist/css/adminlte.min.css'); ?>">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="<?php echo base_url('/assets/adminlte/plugins/overlayScrollbars/css/OverlayScrollbars.min.css'); ?>">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="<?php echo base_url('/assets/adminlte/plugins/daterangepicker/daterangepicker.css'); ?>">
  <link rel="stylesheet" href="<?php echo base_url('/assets/adminlte/plugins/toastr/toastr.min.css'); ?>">
  <!-- summernote -->
  <link rel="stylesheet" href="<?php echo base_url('/assets/adminlte/plugins/summernote/summernote-bs4.min.css'); ?>">
  <link rel="stylesheet" href="<?php echo base_url('/assets/css/loader.css'); ?>">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="before-loader" id="LOADER" style="display: none;">
  <div class="loader5" ></div>
</div>
<div class="wrapper">

  <!-- Preloader -->
  <!-- <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="<?php echo base_url('/assets/adminlte/dist/img/AdminLTELogo.png'); ?>" alt="AdminLTELogo" height="60" width="60">
  </div> -->

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="index3.html" class="nav-link">Home</a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="<?php echo base_url('/assets/adminlte/dist/img/AdminLTELogo.png'); ?>" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span style="font-size: 14px;" class="brand-text font-weight-light">SPK PENERIMAAN KARYAWAN</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="<?php echo base_url('/assets/adminlte/dist/img/user2-160x160.jpg'); ?>" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Administrator</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          
          <li class="nav-item">
            <a href="<?php echo base_url("home")?>" class="nav-link <?php if(strtoupper($this->uri->segment(1))=="HOME" OR $this->uri->segment(1)==""){echo 'active';}?>">
              <i class="nav-icon fas fa-home"></i>
              <p>
                Home
              </p>
            </a>
          </li>
          <?php
          $data_master = array("USER", "KRITERIA", "LOKER");
          ?>
          <li class="nav-item <?php if(in_array(strtoupper($this->uri->segment(1)), $data_master )){echo 'menu-is-opening menu-open';}?>">
            <a href="#" class="nav-link <?php if(in_array(strtoupper($this->uri->segment(1)), $data_master )){echo 'active';}?>">
              <i class="nav-icon fas fa-table"></i>
              <p>
                Data Master
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<?php echo base_url("user/")?>" class="nav-link <?php if(strtoupper($this->uri->segment(1))=="USER"){echo 'active';}?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Data Users</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<?php echo base_url("kriteria/")?>" class="nav-link <?php if(strtoupper($this->uri->segment(1))=="KRITERIA"){echo 'active';}?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Data Kriteria</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<?php echo base_url("loker/")?>" class="nav-link <?php if(strtoupper($this->uri->segment(1))=="LOKER"){echo 'active';}?>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Data Lowker</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="<?php echo base_url("pelamar")?>" class="nav-link <?php if(strtoupper($this->uri->segment(1))=="PELAMAR"){echo 'active';}?>">
              <i class="nav-icon fas fa-users"></i>
              <p>
                Data Pelamar
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="<?php echo base_url("berkas")?>" class="nav-link <?php if(strtoupper($this->uri->segment(1))=="BERKAS"){echo 'active';}?>">
              <i class="nav-icon fas fa-folder-open"></i>
              <p>
                Data Berkas
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="<?php echo base_url("nilai")?>" class="nav-link <?php if(strtoupper($this->uri->segment(1))=="NILAI"){echo 'active';}?>">
              <i class="nav-icon fas fa-list-ul"></i>
              <p>
                Penilaian
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="<?php echo base_url("rangking")?>" class="nav-link <?php if(strtoupper($this->uri->segment(1))=="RANGKING"){echo 'active';}?>">
              <i class="nav-icon fas fa-chart-bar"></i>
              <p>
                Perangkingan
              </p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>