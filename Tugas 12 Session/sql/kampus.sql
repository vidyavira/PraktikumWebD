-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Bulan Mei 2020 pada 16.21
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kampus`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `nip` varchar(30) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `jk` enum('P','L') DEFAULT NULL,
  `jabatan_terakhir` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`nip`, `nama`, `email`, `jk`, `jabatan_terakhir`) VALUES
('196401141994022001', 'Dra. Luh Gede Astuti,M.Kom.', 'lg.astuti[@]cs.unud.ac.id', 'P', 'LEKTOR'),
('196704141992031002', 'Drs. I Wayan Santiyasa,M.Si.', 'santiyasa67[@]gmail.com', 'L', 'LEKTOR KEPALA'),
('197201102008121001', 'Dr. Ir. I Ketut Gede Suhartana, S.Kom., M.Kom', 'ikg.suhartana[@]unud.ac.id', 'L', 'LEKTOR'),
('197404071998022001', 'Dr. Anak Agung Istri Ngurah Eka Karyawati, S.Si.,M.Eng.', 'eka.karyawati[@]unud.ac.id', 'P', 'LEKTOR'),
('197511052005011004', 'I Made Widhi Wirawan, S.Si., M.Si., M.Cs.', 'made_widhi[@]yahoo.com', 'L', 'ASISTEN AHLI'),
('197803212005011001', 'Dr. Ngurah Agus Sanjaya ER, S.Kom., M.Kom.', 'agus_sanjaya[@]unud.ac.id', 'L', 'LEKTOR'),
('197806212006041002', 'Cokorda Rai Adi Pramartha,ST., MM., PhD.', 'cokorda[@]cs.unud.ac.id', 'L', 'LEKTOR'),
('198006162005011001', 'Agus Muliantara, S.Kom, M.Kom', 'muliantara[@]gmail.com', 'L', 'LEKTOR'),
('198006212008121002', 'Ida Bagus Made Mahendra, S.Kom., M.Kom.', 'ibm.mahendra[@]unud.ac.id', 'L', 'ASISTEN AHLI'),
('198012062006041003', 'I Gede Santi Astawa, S.T., M.Cs.', 'santi.astawa[@]cs.unud.ac.id', 'L', 'LEKTOR'),
('198201242005021002', 'I MADE AGUS SETIAWAN, S.Kom., M.Kom', 'madeagus[@]unud.ac.id', 'L', 'LEKTOR'),
('198209182008122002', 'Luh Arida Ayu Rahning Putri, S.Kom., M.Cs.', 'luh.arida[@]cs.unud.ac.id', 'P', 'ASISTEN AHLI'),
('198212202008011008', 'I Made Widiartha, S.Si., M.Kom.', 'madewidiartha[@]unud.ac.id', 'L', 'LEKTOR'),
('198310222008121001', 'I Gede Arta Wibawa, S.T., M.KOM.', 'gede.arta[@]unud.ac.id', 'L', 'ASISTEN AHLI'),
('198403172019031005', 'I Gusti Ngurah Anom Cahyadi Putra, ST., M.Cs', 'anom.cp[@]unud.ac.id', 'L', 'TENAGA PENGAJAR'),
('198409242008011007', 'I Komang Ari Mogi, S.Kom., M.Kom.', 'arimogi[@]unud.ac.id', 'L', 'ASISTEN AHLI'),
('198501302015041003', 'I Gusti Agung Gede Arya Kadyanan, S.Kom, M.Kom', 'gungde[@]unud.ac.id', 'L', 'LEKTOR'),
('198503152010121007', 'Ida Bagus Gede Dwidasmara, S.Kom., M.Cs.', 'dwidasmara[@]unud.ac.id', 'L', 'LEKTOR'),
('198812282014041001', 'I PUTU GEDE HENDRA SUPUTRA, S.Kom.,M.Kom.', 'hendra.suputra[@]unud.ac.id', 'L', 'ASISTEN AHLI'),
('198901272012121001', 'I Dewa Made Bayu Atmaja Darmawan,S.Kom.,M.Cs.', 'dwbayu[@]gmail.com', 'L', 'LEKTOR');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(10) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jk` enum('P','L') DEFAULT NULL,
  `tmp_lahir` varchar(30) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `agama` enum('Islam','Protestan','Katolik','Hindu','Buddha','Kong Hu Cu') DEFAULT NULL,
  `no_telp` varchar(15) DEFAULT NULL,
  `fakultas` enum('FIB','FK','FH','FT','FP','FEB','FAPET','FMIPA','FKH','FTP','FPAR','FISIP','FKP') DEFAULT NULL,
  `prodi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `jk`, `tmp_lahir`, `tgl_lahir`, `alamat`, `agama`, `no_telp`, `fakultas`, `prodi`) VALUES
('1708561069', 'I Gede Teguh Mahardika', 'L', 'Denpasar', '1999-05-28', 'Jln Sahadewa Gg. I No.1', 'Hindu', '085847900908', 'FMIPA', 'Informatika'),
('1708561071', 'Pingkan Anggriani Pitoy', 'P', 'Denpasar', '1999-12-31', 'Bukit Jimbaran', 'Protestan', '086545323444', 'FMIPA', 'Informatika'),
('1708561072', 'Gede Bakti Pernata', 'L', 'Denpasar', '1999-12-31', 'Bukit Jimbaran', 'Hindu', '081888928398', 'FMIPA', 'Informatika'),
('1708561073', 'Ni Putu Mira Novita Dewi', 'P', 'Denpasar', '1998-04-28', 'Jalan Paku Sari III No. 38', 'Hindu', '082146452927', 'FMIPA', 'Informatika'),
('1708561074', 'Zhaqy Hikkammi Gullam Ramadhan', 'L', 'Denpasar', '1999-12-31', 'Bukit Jimbaran', 'Islam', '089765345265', 'FMIPA', 'Informatika'),
('1708561075', 'Putu Pasek Wahyu Chandra Putra', 'L', 'Denpasar', '1999-12-31', 'Bukit Jimbaran', 'Hindu', '081453278666', 'FMIPA', 'Informatika'),
('1708561077', 'Ni Putu Vidya Vira Prashanti', 'P', 'Klungkung', '1999-05-12', 'Jln. Warapsari, Br. Tangkas, Ds. Gelgel', 'Hindu', '085203511423', 'FMIPA', 'Informatika'),
('1708561078', 'I Kadek Agus Andika Putra', 'L', 'Denpasar', '1999-12-31', 'Bukit Jimbaran', 'Hindu', '081777656434', 'FMIPA', 'Informatika'),
('1708561079', 'Agus Prayogo', 'L', 'Denpasar', '1999-12-31', 'Denpasar', 'Islam', '089767564545', 'FMIPA', 'Informatika'),
('1708561081', 'Gregorius Ericco Jansen', 'L', 'Denpasar', '1999-12-31', 'Bukit Jimbaran', 'Islam', '082324324333', 'FMIPA', 'Informatika'),
('1708561082', 'Ni Made Sinta Wahyuni', 'P', 'Denpasar', '1999-03-22', 'Bukit Jimbaran Badung', 'Hindu', '087675453265', 'FMIPA', 'Informatika'),
('1708561085', 'Winda Rianty', 'P', 'Denpasar', '1999-04-29', 'Bukit Jimbaran', 'Islam', '086756453454', 'FMIPA', 'Informatika');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `Username` varchar(50) NOT NULL,
  `Pwd` varchar(20) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Otoritas` enum('Dosen','Mahasiswa') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`Username`, `Pwd`, `Nama`, `Otoritas`) VALUES
('gusmul', 'gusmul123', 'Agus Muliantara', 'Dosen'),
('vidya', 'vira123', 'Ni Putu Vidya Vira Prashanti', 'Mahasiswa');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nip`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
