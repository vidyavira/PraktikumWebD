<?php
  session_start();//untuk membuka sesi
  if(!isset($_SESSION['Username']))
  {
    //Menegecek Apakah sesi masih ada
    header('location:index.html');
    exit(); 
  }
?>
<html>
    <head>
        <title>Sorting dan Filter SIMAK</title>
        <link type="text/css" rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="container">
            <h2>Sorting dan Filter SIMAK</h2>    
            <?php 
                include "koneksi.php";
                $User=$_SESSION['Username'];
                $kode=mysqli_query($koneksi,"select * from user where Username = '$User'");
                $data=mysqli_fetch_array($kode);
            ?>
            <h3 style="color: black"><?php echo $data['Nama']; ?> : <?php echo $data['Otoritas']; ?>
              <a href="logout.php" style="float: right;">Logout</a>
            </h3>
            <table width="100%" style="color:#fff; margin-top:5px;">
                <tr>
                    <td>
                        <b>NIM</b>
                        <select id="nim" class="input-form">
                            <option value="asc">--- sorting by nim</option>
                            <option value="asc">Urutkan ascending</option>
                            <option value="desc">Urutkan descending</option>
                        </select>
                    </td>
                    <td>
                        <b>Nama</b>
                        <select id="nama" class="input-form">
                            <option value="asc">--- sorting by nama</option>
                            <option value="asc">Urutkan dari a-z</option>
                            <option value="desc">Urutkan dari z-a</option>
                        </select>
                    </td>
                    <td>
                        <b>Jenis Kelamin</b>
                        <select id="jk" class="input-form">
                            <option value="all">--- filter by jk</option>
                            <option value="p">Perempuan</option>
                            <option value="l">Laki-laki</option>
                        </select>
                    </td>
                    <td>
                        <b>Agama</b>
                        <select id="agama" class="input-form">
                            <option value="all">--- filter by agama</option>
                            <option value="Islam">Islam</option>
                            <option value="Protestan">Protestan</option>
                            <option value="Katolik">Katolik</option>
                            <option value="Hindu">Hindu</option>
                            <option value="Buddha">Buddha</option>
                            <option value="Kong Hu Cu">Kong Hu Cu</option>   
                        </select>
                    </td>
                    <td>
                        <b>Pencarian</b>
                        <input type="text" class="input-form" id="cari" style="width:225px;" placeholder="Cari nama/nim">
                    </td>
                </tr>
            </table>
            <table border="1" width="100%" class="tabel" style="margin-top:5px">
                <thead>
                <tr>
                    <th>No</th>
                    <th>NIM</th>
                    <th>Nama</th>
                    <th>JK</th>
                    <th>TTL</th>
                    <th>Alamat</th>
                    <th>Agama</th>
                    <th>No Telp</th>
                    <th>Fakultas</th>
                    <th>Prodi</th>
                </tr>
                </thead>
                <tbody id="tabel">
                <?php 
                    include "koneksi.php";
                    $query_mysqli = mysqli_query($koneksi, "SELECT * FROM mahasiswa")or die(mysql_error());
                    $nomor = 1;
                    while($data = mysqli_fetch_array($query_mysqli)){
                ?>
                <tr>
                    <td align="center"><?php echo $nomor++; ?></td>
                    <td><?php echo $data['nim']; ?></td>
                    <td><?php echo $data['nama']; ?></td>
                    <td align="center"><?php echo $data['jk']; ?></td>
                    <td><?php echo $data['tmp_lahir'].", ".$data['tgl_lahir'];; ?></td>
                    <td><?php echo $data['alamat']; ?></td>
                    <td><?php echo $data['agama']; ?></td>
                    <td><?php echo $data['no_telp']; ?></td>
                    <td><?php echo $data['fakultas']; ?></td>
                    <td><?php echo $data['prodi']; ?></td>
                </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>
    </body>
    <script src="js/jquery.js"></script>
    <!-- Pencarian -->
    <script type="text/javascript">
      $(document).ready(function() {
        $("#cari").keyup(function() {
          var cari  = $("#cari").val(); 
          var nim   = $("#nim").val(); 
          var jk    = $("#jk").val();
          var agama = $("#agama").val();
          var nama  = $("#nama").val();
          if (cari != ""){
            $("#tabel").html("<tr><td colspan=10><img src='img/loading.gif'/></td></tr>") 
            $.ajax({
              type:"get",
              url:"mhsKeyup.php",
              data:"cari="+cari+"&nim="+nim+"&jk="+jk+"&agama="+agama+"&nama="+nama,
              success: function(data){
                $("#tabel").html(data);
              }
            });
          }
          else
          {
            $.ajax({
              url:"mhsKeyup.php",
              data:"cari="+cari+"&nim="+nim+"&jk="+jk+"&agama="+agama+"&nama="+nama,
              cache: false,
              success: function(msg){
                $("#tabel").html(msg);
              }
            });
          }
        });
      });
    </script>
    <!-- Filter -->
    <script type="text/javascript">
      $(document).ready(function() {
        $("#agama, #jk").change(function() {
          var cari  = $("#cari").val(); 
          var nim   = $("#nim").val(); 
          var jk    = $("#jk").val();
          var agama = $("#agama").val();
          var nama  = $("#nama").val();
          $("#tabel").html("<tr><td colspan=10><img src='img/loading.gif'/></td></tr>")  
          $.ajax({
              type:"get",
              url:"mhsChangeFilter.php",
              data:"cari="+cari+"&nim="+nim+"&jk="+jk+"&agama="+agama+"&nama="+nama,
              success: function(data){
                $("#tabel").html(data);
              }
            });
          });
      });
    </script>
    <!-- Sorting Nama -->
    <script type="text/javascript">
      $(document).ready(function() {
        $("#nama").change(function() {
          var cari  = $("#cari").val(); 
          var nim   = $("#nim").val(); 
          var jk    = $("#jk").val();
          var agama = $("#agama").val();
          var nama  = $("#nama").val();
          $("#tabel").html("<tr><td colspan=10><img src='img/loading.gif'/></td></tr>")  
          $.ajax({
              type:"get",
              url:"mhsOrderNama.php",
              data:"cari="+cari+"&nim="+nim+"&jk="+jk+"&agama="+agama+"&nama="+nama,
              success: function(data){
                $("#tabel").html(data);
              }
            });
          });
      });
    </script>
    <!-- Sorting Nim -->
    <script type="text/javascript">
      $(document).ready(function() {
        $("#nim").change(function() {
          var cari  = $("#cari").val(); 
          var nim   = $("#nim").val(); 
          var jk    = $("#jk").val();
          var agama = $("#agama").val();
          var nama  = $("#nama").val();
          $("#tabel").html("<tr><td colspan=10><img src='img/loading.gif'/></td></tr>")  
          $.ajax({
              type:"get",
              url:"mhsOrderNim.php",
              data:"cari="+cari+"&nim="+nim+"&jk="+jk+"&agama="+agama+"&nama="+nama,
              success: function(data){
                $("#tabel").html(data);
              }
            });
          });
      });
    </script>
</html>