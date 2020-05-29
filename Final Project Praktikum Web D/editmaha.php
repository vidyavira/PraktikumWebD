<?php
  session_start();//untuk membuka sesi
  if(!isset($_SESSION['KodeUser']))
  {
    //Menegecek Apakah sesi masih ada
    header('location:index.html');
    exit(); 
  }
?>
<html>
    <head>
        <title>SIMAK</title>
        <link type="text/css" rel="stylesheet" href="css/style.css">
    </head>
    <body>            
        <div class="container">
            <h2>SIMAK</h2>
            <?php 
                include "koneksi.php";
                $User=$_SESSION['Username'];
                $kode=mysqli_query($koneksi,"select * from user where Username = '$User'");
                $data=mysqli_fetch_array($kode);
                $otoritas = $data['Otoritas'];
            ?>
            <h3 style="color: black">
              <?php echo $data['Nama']; ?> : <?php echo $data['Otoritas']; ?>
            </h3>    
            <?php 
              if ($otoritas == "Mahasiswa") {
                ?>
                  <a href='mahasiswa.php'>Mahasiswa</a> 
                  <a href='dosen.php'>Dosen</a>
                  <a href='edit.php'>Edit Profil</a>
                  <a href='pembimbing.php'>Pembimbing</a>
                  <a href='dm.php'>Daftar Matakuliah</a>
                  <a href="pm.php">Pendaftaran Matakuliah</a>
                  <a href="kelas.php">Kelas</a>
                  <a href="jadwal.php">Jadwal</a>
                  <a href="logout.php" style="float: right;">Logout</a>
                <?php
              }elseif ($otoritas == "Dosen") {
                ?>
                  <a href='mahasiswa.php'>Mahasiswa</a> 
                  <a href='dosen.php'>Dosen</a>
                  <a href='edit.php'>Edit Profil</a>
                  <a href='pembimbing.php'>Pembimbing</a>
                  <a href='dm.php'>Daftar Matakuliah</a>
                  <a href="kelas.php">Kelas</a>
                  <a href="jadwal.php">Jadwal</a>
                  <a href="logout.php" style="float: right;">Logout</a>
                <?php
              }elseif ($otoritas== "Staff") {
                ?>
                  <a href='mahasiswa.php'>Mahasiswa</a> 
                  <a href='dosen.php'>Dosen</a>
                  <a href='edit.php'>Edit Profil</a>
                  <a href="home.php">Daftar Dosen</a>
                  <a href="logout.php" style="float: right;">Logout</a>
                <?php
              }
            ?>

            <!-- Mahasiswa -->
            
            <?php 
                    include "koneksi.php";
                    $kode1 = $data['KodeUser'];
                    $otoritas = $data['Otoritas']; 
                        $kode12 = $_GET['kode'];                   
                    $query_mysqli = mysqli_query($koneksi, "SELECT * FROM mahasiswa WHERE nim = $kode12")or die(mysql_error());
                    $nomor = 1;
                    while($data1 = mysqli_fetch_array($query_mysqli)){
                ?>
            <form name="edit" action="statusmhs.php" method="POST">
            <table style="margin-top: 15px" align="center">
                <tr>
                    <th align="center" colspan="2" style="font-size: 25px">Edit Profil</th>
                </tr>
                <tr>
                    <td style="font-size: 20px; padding-right: 20px">NIM</td>
                    <td><input type="text" name="NIM" readonly style="width: 350px; height: 25px" value="<?php echo $data1['nim'] ?>"></td>
                </tr>
                <tr>
                    <td style="font-size: 20px; padding-right: 20px">Nama</td>
                    <td><input type="text" name="nama" style="width: 350px; height: 25px" value="<?php echo $data1['nama'] ?>"></td>
                </tr>
                <tr>
                    <td style="font-size: 20px; padding-right: 20px">JK</td>
                    <td>
                        <?php 
                        include "koneksi.php";
                        $kode2 = $data['KodeUser'];
                        $kode12 = $_GET['kode'];
                        $query_mysqli1 = mysqli_query($koneksi, "SELECT * FROM mahasiswa WHERE nim = $kode12")or die(mysql_error());
                        $data2 = mysqli_fetch_array($query_mysqli1);
                        if ($data2['jk'] == "L") {
                            ?>
                                <input type='radio' name='jk' value='L' checked='checked'>Laki-laki
                                <input type="radio" name="jk" value="P">Perempuan
                            <?php
                        }else if ($data2['jk'] == "P") {
                            ?>
                                <input type='radio' name='jk' value='L'>Laki-laki
                                <input type="radio" name="jk" value="P" checked='checked'>Perempuan
                            <?php
                        }
                        ?>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 20px; padding-right: 20px">Tempat Lahir</td>
                    <td><input type="text" name="tmp" style="width: 350px; height: 25px" value="<?php echo $data1['tmp_lahir'] ?>"></td>
                </tr>
                <tr>
                    <td style="font-size: 20px; padding-right: 20px">Tanggal Lahir</td>
                    <td><input type="text" name="tgl" style="width: 350px; height: 25px" value="<?php echo $data1['tgl_lahir'] ?>"></td>
                </tr> 
                <tr>
                    <td style="font-size: 20px; padding-right: 20px">Alamat</td>
                    <td><input type="text" name="alamat" style="width: 350px; height: 25px" value="<?php echo $data1['alamat'] ?>"></td>
                </tr>
                <tr>
                    <td style="font-size: 20px; padding-right: 20px">Agama</td>
                    <td><input type="text" name="agama" style="width: 350px; height: 25px" value="<?php echo $data1['agama'] ?>"></td>
                </tr>
                <tr>
                    <td style="font-size: 20px; padding-right: 20px">Telp</td>
                    <td><input type="text" name="telp" style="width: 350px; height: 25px" value="<?php echo $data1['no_telp'] ?>"></td>
                </tr>
                <tr>
                    <td style="font-size: 20px; padding-right: 20px">Fakultas</td>
                    <td><input type="text" name="fakultas" readonly style="width: 350px; height: 25px" value="<?php echo $data1['fakultas'] ?>"></td>
                </tr>
                <tr>
                    <td style="font-size: 20px; padding-right: 20px">Program Studi</td>
                    <td><input type="text" name="prodi" readonly style="width: 350px; height: 25px" value="<?php echo $data1['prodi'] ?>"></td>
                </tr>
                <tr>
                    <td style="font-size: 20px; padding-right: 20px">Status</td>
                    <td><select name="Status">
                          <option value="Verifikasi">Verifikasi</option>
                          <option value="Belum Bayar">Belum Bayar UKT</option>
                          <option value="Meninggal">Meninggal</option>
                        </select></td>
                </tr>
                <tr>
                    <td></td>
                    <td align="right"><input type="submit" name="edit" value="Edit"></td>
                </tr>

                   <?php 
                        }
                    ?>
            </table>
        </form>
        </div>
    </body>    
</html>