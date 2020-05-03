-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Bulan Mei 2020 pada 16.47
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
-- Database: `simak`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `namalengkap` varchar(50) NOT NULL,
  `namauser` varchar(30) NOT NULL,
  `nim` int(10) NOT NULL,
  `kelamin` varchar(30) NOT NULL,
  `tempat` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `asal` varchar(30) NOT NULL,
  `jurusan` varchar(30) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `jam` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `namalengkap`, `namauser`, `nim`, `kelamin`, `tempat`, `tanggal`, `asal`, `jurusan`, `pass`, `jam`) VALUES
(1588517028, 'Ni Putu Vidya Vira Prashanti', 'vidyavira', 1708561077, 'Perempuan', 'Klungkung', '1999-05-12', 'SMAN 1 Semarapura', 'Teknik Informatika', 'sairambaba', '04:43:48'),
(1588517086, 'Vidya', 'vira', 1808282828, 'Perempuan', 'Denpasar', '2000-02-04', 'SMAN 1 Semarapura', 'Matematika', 'sairam', '04:44:46'),
(1588517132, 'Vira', 'vidya', 1820102030, 'Perempuan', 'Klungkung', '2000-03-31', 'SMAN 1 Semarapura', 'Fisika', 'baba', '04:45:32'),
(1588517173, 'Vira Prashanti', 'viraprash', 1820282010, 'Perempuan', 'Klungkung', '2000-02-06', 'SMAN 1 Semarapura', 'Biologi', 'sairamb', '04:46:13'),
(1588517216, 'Vidya Vira', 'viraaa', 1802030124, 'Perempuan', 'Klungkung', '2000-10-20', 'SMAN 1 Semarapura', 'Kimia', 'srisairam', '04:46:56'),
(1588517248, 'Vidya Vira', 'viraaa', 1802030124, 'Perempuan', 'Klungkung', '2000-10-20', 'SMAN 1 Semarapura', 'Kimia', 'srisairam', '04:47:28');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1588517249;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
