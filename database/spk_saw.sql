-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Jun 2021 pada 01.23
-- Versi server: 10.4.10-MariaDB
-- Versi PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spk_saw`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_berkas`
--

CREATE TABLE `tb_berkas` (
  `id_berkas` int(11) NOT NULL,
  `id_pelamar` int(11) DEFAULT NULL,
  `nm_berkas` varchar(50) DEFAULT NULL,
  `file_berkas` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_berkas`
--

INSERT INTO `tb_berkas` (`id_berkas`, `id_pelamar`, `nm_berkas`, `file_berkas`) VALUES
(1, 1, 'Lamaran Kerja', 'berkas_17062021.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kriteria`
--

CREATE TABLE `tb_kriteria` (
  `id_kriteria` varchar(15) NOT NULL,
  `nm_kriteria` varchar(100) DEFAULT NULL,
  `jenis_kiteria` enum('cost','benefit') DEFAULT NULL,
  `bobot` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_kriteria`
--

INSERT INTO `tb_kriteria` (`id_kriteria`, `nm_kriteria`, `jenis_kiteria`, `bobot`) VALUES
('C1', 'Hasil Tes', 'benefit', 4),
('C2', 'Usia', 'benefit', 4),
('C3', 'Pengelaman Kerja', 'benefit', 3),
('C4', 'Pendidikan', 'benefit', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_lowongan_kerja`
--

CREATE TABLE `tb_lowongan_kerja` (
  `id_lowongan_kerja` int(11) NOT NULL,
  `nm_lowongan_kerja` varchar(255) DEFAULT NULL,
  `ket_lowongan` text DEFAULT NULL,
  `foto_lowongan` varchar(255) DEFAULT NULL,
  `tgl_awal` date DEFAULT NULL,
  `tgl_akhir` date DEFAULT NULL,
  `status_lowongan` enum('ditutup','dibuka') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_lowongan_kerja`
--

INSERT INTO `tb_lowongan_kerja` (`id_lowongan_kerja`, `nm_lowongan_kerja`, `ket_lowongan`, `foto_lowongan`, `tgl_awal`, `tgl_akhir`, `status_lowongan`) VALUES
(1, 'Database Administrator', 'Database Administrator, Sarjana Teknik Informatika', 'loker_17062021.jpg', '2021-06-01', '2021-06-30', 'dibuka'),
(2, 'IT Support', 'IT Support Lapangan', 'loker_17062021.jpg', '2021-05-01', '2021-05-31', 'dibuka');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_nilai`
--

CREATE TABLE `tb_nilai` (
  `id_nilai` int(11) NOT NULL,
  `id_pelamar` int(11) DEFAULT NULL,
  `id_kriteria` varchar(15) DEFAULT '',
  `nilai` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_nilai`
--

INSERT INTO `tb_nilai` (`id_nilai`, `id_pelamar`, `id_kriteria`, `nilai`) VALUES
(1, 2, 'C1', 4),
(2, 2, 'C2', 3),
(3, 2, 'C3', 3),
(4, 2, 'C4', 3),
(6, 1, 'C1', 5),
(7, 1, 'C2', 4),
(8, 1, 'C3', 5),
(9, 1, 'C4', 4),
(10, 3, 'C1', 4),
(11, 3, 'C2', 5),
(12, 3, 'C3', 4),
(13, 3, 'C4', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_normalisasi`
--

CREATE TABLE `tb_normalisasi` (
  `id_normalisasi` int(11) NOT NULL,
  `id_pelamar` int(11) DEFAULT NULL,
  `id_kriteria` varchar(15) DEFAULT '',
  `nilai_normalisasi` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pelamar`
--

CREATE TABLE `tb_pelamar` (
  `id_pelamar` int(11) NOT NULL,
  `id_lowongan_kerja` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `nm_pelamar` varchar(30) DEFAULT NULL,
  `jenis_kelamin` enum('wanita','pria') DEFAULT NULL,
  `alamat_pelamar` text DEFAULT NULL,
  `no_tlp` varchar(13) DEFAULT NULL,
  `lulusan` enum('SMA','DI','DII','DIII','S1','S2') DEFAULT NULL,
  `jurusan` varchar(50) DEFAULT NULL,
  `kemampuan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_pelamar`
--

INSERT INTO `tb_pelamar` (`id_pelamar`, `id_lowongan_kerja`, `id_user`, `nm_pelamar`, `jenis_kelamin`, `alamat_pelamar`, `no_tlp`, `lulusan`, `jurusan`, `kemampuan`) VALUES
(1, 1, 1, 'Yoga Pratama', 'pria', 'Jl. Kampung A, Jepara', '085123456321', 'S1', 'Teknik Informatika', 'Web Developer'),
(2, 1, 2, 'Ifan Seventeen', 'pria', 'Jl. Kampung B, Jepara', '085123456310', 'S1', 'Sistem Informasi', 'Full Stack Developer'),
(3, 1, 2, 'Isyana', 'wanita', 'Jl. Kampung C, Jepara', '085123456312', 'S1', 'Sistem Informasi', 'Full Stack Developer');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `level` enum('calon_pelamar','manager','admin') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`, `level`) VALUES
(1, 'admin', 'admin', 'admin'),
(2, 'aditia', 'aditia', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_berkas`
--
ALTER TABLE `tb_berkas`
  ADD PRIMARY KEY (`id_berkas`),
  ADD KEY `BERKAS_FOREIGN_1` (`id_pelamar`);

--
-- Indeks untuk tabel `tb_kriteria`
--
ALTER TABLE `tb_kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indeks untuk tabel `tb_lowongan_kerja`
--
ALTER TABLE `tb_lowongan_kerja`
  ADD PRIMARY KEY (`id_lowongan_kerja`);

--
-- Indeks untuk tabel `tb_nilai`
--
ALTER TABLE `tb_nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `NILAI_FOREIGN_1` (`id_pelamar`),
  ADD KEY `NILAI_FOREIGN_2` (`id_kriteria`);

--
-- Indeks untuk tabel `tb_normalisasi`
--
ALTER TABLE `tb_normalisasi`
  ADD PRIMARY KEY (`id_normalisasi`),
  ADD KEY `NORMALISASI_FOREIGN_1` (`id_pelamar`),
  ADD KEY `NORMALISASI_FOREIGN_2` (`id_kriteria`);

--
-- Indeks untuk tabel `tb_pelamar`
--
ALTER TABLE `tb_pelamar`
  ADD PRIMARY KEY (`id_pelamar`),
  ADD KEY `PELAMAR_FOREIGN_1` (`id_lowongan_kerja`),
  ADD KEY `PELAMAR_FOREIGN_2` (`id_user`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_berkas`
--
ALTER TABLE `tb_berkas`
  MODIFY `id_berkas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_lowongan_kerja`
--
ALTER TABLE `tb_lowongan_kerja`
  MODIFY `id_lowongan_kerja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_nilai`
--
ALTER TABLE `tb_nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `tb_normalisasi`
--
ALTER TABLE `tb_normalisasi`
  MODIFY `id_normalisasi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_pelamar`
--
ALTER TABLE `tb_pelamar`
  MODIFY `id_pelamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_berkas`
--
ALTER TABLE `tb_berkas`
  ADD CONSTRAINT `BERKAS_FOREIGN_1` FOREIGN KEY (`id_pelamar`) REFERENCES `tb_pelamar` (`id_pelamar`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_nilai`
--
ALTER TABLE `tb_nilai`
  ADD CONSTRAINT `NILAI_FOREIGN_1` FOREIGN KEY (`id_pelamar`) REFERENCES `tb_pelamar` (`id_pelamar`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `NILAI_FOREIGN_2` FOREIGN KEY (`id_kriteria`) REFERENCES `tb_kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_normalisasi`
--
ALTER TABLE `tb_normalisasi`
  ADD CONSTRAINT `NORMALISASI_FOREIGN_1` FOREIGN KEY (`id_pelamar`) REFERENCES `tb_pelamar` (`id_pelamar`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `NORMALISASI_FOREIGN_2` FOREIGN KEY (`id_kriteria`) REFERENCES `tb_kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_pelamar`
--
ALTER TABLE `tb_pelamar`
  ADD CONSTRAINT `PELAMAR_FOREIGN_1` FOREIGN KEY (`id_lowongan_kerja`) REFERENCES `tb_lowongan_kerja` (`id_lowongan_kerja`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PELAMAR_FOREIGN_2` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
