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
          if($this->session->userdata('level') == "admin"){
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
          <?php 
          } 
          if(in_array($this->session->userdata('level'), array("admin", "calon_pelamar"))){
          ?>
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
          <?php
          }
            if($this->session->userdata('level') == "admin"){
          ?>
          <li class="nav-item">
            <a href="<?php echo base_url("rangking")?>" class="nav-link <?php if(strtoupper($this->uri->segment(1))=="RANGKING"){echo 'active';}?>">
              <i class="nav-icon fas fa-chart-bar"></i>
              <p>
                Perangkingan
              </p>
            </a>
          </li>
          <?php
          }
          if(in_array($this->session->userdata('level'), array("admin", "manager"))){
          ?>
          <li class="nav-item">
            <a href="<?php echo base_url("laporan")?>" class="nav-link <?php if(strtoupper($this->uri->segment(1))=="LAPORAN"){echo 'active';}?>">
              <i class="nav-icon fas fa-print"></i>
              <p>
                Laporan
              </p>
            </a>
          </li>
          <?php
          }
          ?>
          <li class="nav-item">
            <a href="<?php echo base_url("login/logout")?>" class="nav-link">
              <i class="nav-icon fas fa-sign-out-alt"></i>
              <p>
                Sign Out
              </p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>