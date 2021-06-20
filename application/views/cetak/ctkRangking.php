<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Report Hasil Seleksi</title>
</head>
<body>
 
<div id="container">
    <table border="1" style="width:100%;font-size:12px;border: 1px solid #ddd;border-collapse: collapse;">
	  	<thead>
	  		<tr>
	  			<th class="short">#</th>
	  			<th class="normal">Posisi</th>
	  			<th class="normal">Nama Pelamar</th>
	  			<th class="normal">Jekel</th>
                <th class="normal">Pendidikan</th>
                <th class="normal">Jurusan</th>
                <th class="normal">Alamat</th>
                <th class="normal">Kemampuan</th>
                <th class="normal">Nilai Akhir</th>
	  		</tr>
	  	</thead>
	  	<tbody>
	  		<?php $no=1; ?>
	  		<?php foreach($data as $row): ?>
	  		  <tr>
	  			<td><?php echo $no; ?></td>
	  			<td><?php echo $row['nm_lowongan_kerja']; ?></td>
	  			<td><?php echo $row['nm_pelamar']; ?></td>
	  			<td><?php echo $row['jenis_kelamin']; ?></td>
                <td><?php echo $row['lulusan']; ?></td>
                <td><?php echo $row['jurusan']; ?></td>
                <td><?php echo $row['alamat_pelamar']; ?></td>
                <td><?php echo $row['kemampuan']; ?></td>
                <td><?php echo $row['total_nilai']; ?></td>
	  		  </tr>
	  		<?php $no++; ?>
	  		<?php endforeach; ?>
	  	</tbody>
	  </table>
 
</div>
 
</body>
</html>
