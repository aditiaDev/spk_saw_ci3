-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Jun 2021 pada 03.40
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
(5, 10, 'Surat Lamaran Kerja', '1624409725587.jpg'),
(6, 10, 'CV', '1624409731201.jpg'),
(7, 11, 'Surat Lamaran Kerja', '1624409820675.jpg'),
(8, 11, 'CV', '1624409828382.jpg'),
(9, 11, 'Sertifikat', '1624409936849.jpg'),
(10, 12, 'Surat Lamaran Kerja', '1624410993177.jpg'),
(11, 12, 'CV', '1624410998072.jpg'),
(12, 12, 'Sertifikat', '1624411005739.jpg'),
(13, 13, 'Surat Lamaran Kerja', '1624411187788.jpg'),
(14, 13, 'CV', '1624411192909.jpg'),
(15, 13, 'Sertifikat', '1624411197686.jpg');

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
('C4', 'Pendidikan', 'benefit', 5),
('C5', 'Sertifikat', 'benefit', 3);

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
(19, 'English Call Centre Representatives PT Quantum Media Communications Indonesia', '<div class=\"FYwKg fB92N_0\" style=\"margin: 0px; padding: 24px 0px 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: medium; line-height: inherit; font-family: &quot;Times New Roman&quot;; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(0, 0, 0);\"><h4 class=\"FYwKg C6ZIU_0 _3nVJR_0 _2VCbC_0 _2DNlq_0 _1VMf3_0\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 18px; line-height: 28px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(30, 34, 43);\">Deskripsi Pekerjaan</h4></div><div class=\"FYwKg fB92N_0\" style=\"margin: 0px; padding: 24px 0px 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: medium; line-height: inherit; font-family: &quot;Times New Roman&quot;; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(0, 0, 0);\"><div data-automation=\"jobDescription\" class=\"vDEj0_0\" style=\"font-family: inherit;\"><span class=\"FYwKg _2Bz3E C6ZIU_0 _6ufcS_0 _2DNlq_0 _29m7__0\" style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: block; color: rgb(30, 34, 43);\"><div class=\"FYwKg\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><ul style=\"padding-bottom: 12px;\"><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc; text-align: justify;\">Handle international inbound &amp; outbound calls</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc; text-align: justify;\">Receive incoming calls and provide better information services to customers</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc; text-align: justify;\">Handling customer complaints properly</li></ul><div style=\"padding-top: 12px; padding-bottom: 12px; margin: 0px;\"><span style=\"font-weight: 700;\">Requirements :</span></div><ul style=\"padding-bottom: 12px;\"><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc; text-align: justify;\">Mandatory language :&nbsp;<span style=\"font-weight: 700;\">English</span></li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc; text-align: justify;\"><span style=\"font-weight: 700;\">Must be fluent in speaking English</span></li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc; text-align: justify;\"><span style=\"font-weight: 700;\">Must be able to comprehend English at a high level</span></li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc; text-align: justify;\">Candidate must possess at least SMU degree</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc; text-align: justify;\">Must be available for shift work on a rotating roster basis</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc; text-align: justify;\">Good typing skill</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc; text-align: justify;\">Reliable and discipline</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc; text-align: justify;\">Have a can do and positive attitude</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc; text-align: justify;\">Fresh graduates are welcome</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc; text-align: justify;\"><span style=\"font-weight: 700;\">TOEFL</span>&nbsp;/&nbsp;<span style=\"font-weight: 700;\">IELTS</span>&nbsp;score result highly desired</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc; text-align: justify;\"><span style=\"font-weight: 700;\">Jobstreet English Languange Assessment</span>&nbsp;(<span style=\"font-weight: 700;\">JELA</span>) result mandatory</li></ul></div></span></div></div>', '1624409518873.jpg', '2021-06-17', '2021-06-23', 'dibuka'),
(20, 'Customer Service PT Citra Data Purna Kharisma', '<div class=\"FYwKg _3gJU3_0 _1yPon_0\" style=\"margin: 0px; padding: 48px 0px 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: medium; line-height: inherit; font-family: &quot;Times New Roman&quot;; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(0, 0, 0);\"><div class=\"FYwKg\" data-automation=\"job-details-job-highlights\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg d7v3r _3aoZS_0\" style=\"margin: 0px; padding: 1px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg fB92N_0\" style=\"margin: 0px; padding: 24px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><h4 class=\"FYwKg C6ZIU_0 _3nVJR_0 _2VCbC_0 _2DNlq_0 _1VMf3_0\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 18px; line-height: 28px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(30, 34, 43);\">Keuntungan</h4></div><div class=\"FYwKg fB92N_0\" style=\"margin: 0px; padding: 24px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><ul class=\"FYwKg _302h6 d7v3r UJoTY_0\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 1px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; list-style: none;\"><li class=\"FYwKg _6Gmbl_0\" style=\"margin: 0px; padding: 20px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg _3ftyQ\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: flex;\"><div class=\"FYwKg _2Bz3E C6ZIU_0 _6ufcS_0 _2DNlq_0 _29m7__0 _2WTa0_0\" style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(30, 34, 43);\"><div class=\"FYwKg _3ftyQ _3O7rA mY9oq _26CPL_0\" aria-hidden=\"true\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: flex; align-items: center; user-select: none; height: 24px;\"><div class=\"FYwKg _1A6vC _25blN _2FgpS\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; border-radius: 50%; background: currentcolor; width: 4px; height: 4px;\"></div></div></div><div class=\"FYwKg _3VCZm _1uk_1 _3RqUb_0\" style=\"margin: 0px; padding: 0px 0px 0px 12px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; width: 732px; min-width: 0px;\"><span class=\"FYwKg _2Bz3E C6ZIU_0 _6ufcS_0 _2DNlq_0 _29m7__0 _2WTa0_0\" style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: block; color: rgb(30, 34, 43);\">Lokasi kerja strategis</span></div></div></li><li class=\"FYwKg _6Gmbl_0\" style=\"margin: 0px; padding: 20px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg _3ftyQ\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: flex;\"><div class=\"FYwKg _2Bz3E C6ZIU_0 _6ufcS_0 _2DNlq_0 _29m7__0 _2WTa0_0\" style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(30, 34, 43);\"><div class=\"FYwKg _3ftyQ _3O7rA mY9oq _26CPL_0\" aria-hidden=\"true\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: flex; align-items: center; user-select: none; height: 24px;\"><div class=\"FYwKg _1A6vC _25blN _2FgpS\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; border-radius: 50%; background: currentcolor; width: 4px; height: 4px;\"></div></div></div><div class=\"FYwKg _3VCZm _1uk_1 _3RqUb_0\" style=\"margin: 0px; padding: 0px 0px 0px 12px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; width: 732px; min-width: 0px;\"><span class=\"FYwKg _2Bz3E C6ZIU_0 _6ufcS_0 _2DNlq_0 _29m7__0 _2WTa0_0\" style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: block; color: rgb(30, 34, 43);\">Transportasi mudah dijangkau</span></div></div></li><li class=\"FYwKg _6Gmbl_0\" style=\"margin: 0px; padding: 20px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg _3ftyQ\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: flex;\"><div class=\"FYwKg _2Bz3E C6ZIU_0 _6ufcS_0 _2DNlq_0 _29m7__0 _2WTa0_0\" style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(30, 34, 43);\"><div class=\"FYwKg _3ftyQ _3O7rA mY9oq _26CPL_0\" aria-hidden=\"true\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: flex; align-items: center; user-select: none; height: 24px;\"><div class=\"FYwKg _1A6vC _25blN _2FgpS\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; border-radius: 50%; background: currentcolor; width: 4px; height: 4px;\"></div></div></div><div class=\"FYwKg _3VCZm _1uk_1 _3RqUb_0\" style=\"margin: 0px; padding: 0px 0px 0px 12px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; width: 732px; min-width: 0px;\"><span class=\"FYwKg _2Bz3E C6ZIU_0 _6ufcS_0 _2DNlq_0 _29m7__0 _2WTa0_0\" style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: block; color: rgb(30, 34, 43);\">Lingkungan kerja menyenangkan</span></div></div></li></ul></div></div></div></div><div class=\"FYwKg _3gJU3_0 _1yPon_0\" style=\"margin: 0px; padding: 48px 0px 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: medium; line-height: inherit; font-family: &quot;Times New Roman&quot;; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(0, 0, 0);\"><div class=\"FYwKg d7v3r _3aoZS_0\" style=\"margin: 0px; padding: 1px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg fB92N_0\" style=\"margin: 0px; padding: 24px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><h4 class=\"FYwKg C6ZIU_0 _3nVJR_0 _2VCbC_0 _2DNlq_0 _1VMf3_0\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 18px; line-height: 28px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(30, 34, 43);\">Deskripsi Pekerjaan</h4></div><div class=\"FYwKg fB92N_0\" style=\"margin: 0px; padding: 24px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div data-automation=\"jobDescription\" class=\"vDEj0_0\" style=\"font-family: inherit;\"><span class=\"FYwKg _2Bz3E C6ZIU_0 _6ufcS_0 _2DNlq_0 _29m7__0\" style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: block; color: rgb(30, 34, 43);\"><div class=\"FYwKg\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"font-weight: 700;\">Kualifikasi :</span></p><ul style=\"padding-bottom: 12px;\"><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc;\">Usia maksimal 35 tahun</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc;\">Pendidikan minimal SMA</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc;\">Memiliki kemampuan komunikasi yang baik</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc;\">Diprioritaskan untuk yang berpengalaman minimal 2 tahun (lebih disukai yang berpengalaman sebagai customer service pada bidang elektronik)</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc;\">Menguasai komputer minimal Ms. Word, Ms. Excel dan Ms. Power Point</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc;\">Memguasai bahasa Inggris lisan dan tulisan</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc;\">Sabar, supel dan dapat berkomunikasi dengan baik</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc;\">Jujur, bertanggungjawab, teliti, cekatan dan disiplin</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc;\">Mampu bekerja secara profesional baik team maupun individu</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc; text-align: justify;\">Sehat jasmani dan rohani</li></ul><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-align: justify;\"><span style=\"font-weight: 700;\">Deskripsi pekerjaan</span></p><ul style=\"padding-bottom: 12px;\"><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc; text-align: justify;\">Mengurus administrasi service</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc; text-align: justify;\">Membuat laporan harian</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc; text-align: justify;\">Memberikan layanan yang balk dan tepat untuk semua kebutuhan pelanggan berdasarkan business process and policy.</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc; text-align: justify;\">Memberikan respon dan solusi yang cepat terhadap semua keluhan pelanggan</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: disc; text-align: justify;\">Menjadi komunikator dan memberi informasi kemudahan kepada konsumen</li></ul></div></span></div></div></div></div>', '1624409552609.jpg', '2021-06-16', '2021-07-01', 'dibuka'),
(21, 'Admin Staff & Packing Sabibowls', '<div class=\"FYwKg _3gJU3_0 _1yPon_0\" style=\"margin: 0px; padding: 48px 0px 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: medium; line-height: inherit; font-family: &quot;Times New Roman&quot;; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(0, 0, 0);\"><div class=\"FYwKg\" data-automation=\"job-details-job-highlights\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg d7v3r _3aoZS_0\" style=\"margin: 0px; padding: 1px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg fB92N_0\" style=\"margin: 0px; padding: 24px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><h4 class=\"FYwKg C6ZIU_0 _3nVJR_0 _2VCbC_0 _2DNlq_0 _1VMf3_0\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 18px; line-height: 28px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(30, 34, 43);\">Keuntungan</h4></div><div class=\"FYwKg fB92N_0\" style=\"margin: 0px; padding: 24px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><ul class=\"FYwKg _302h6 d7v3r UJoTY_0\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 1px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; list-style: none;\"><li class=\"FYwKg _6Gmbl_0\" style=\"margin: 0px; padding: 20px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg _3ftyQ\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: flex;\"><div class=\"FYwKg _2Bz3E C6ZIU_0 _6ufcS_0 _2DNlq_0 _29m7__0 _2WTa0_0\" style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(30, 34, 43);\"><div class=\"FYwKg _3ftyQ _3O7rA mY9oq _26CPL_0\" aria-hidden=\"true\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: flex; align-items: center; user-select: none; height: 24px;\"><div class=\"FYwKg _1A6vC _25blN _2FgpS\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; border-radius: 50%; background: currentcolor; width: 4px; height: 4px;\"></div></div></div><div class=\"FYwKg _3VCZm _1uk_1 _3RqUb_0\" style=\"margin: 0px; padding: 0px 0px 0px 12px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; width: 732px; min-width: 0px;\"><span class=\"FYwKg _2Bz3E C6ZIU_0 _6ufcS_0 _2DNlq_0 _29m7__0 _2WTa0_0\" style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: block; color: rgb(30, 34, 43);\">free parkir</span></div></div></li><li class=\"FYwKg _6Gmbl_0\" style=\"margin: 0px; padding: 20px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg _3ftyQ\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: flex;\"><div class=\"FYwKg _2Bz3E C6ZIU_0 _6ufcS_0 _2DNlq_0 _29m7__0 _2WTa0_0\" style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(30, 34, 43);\"><div class=\"FYwKg _3ftyQ _3O7rA mY9oq _26CPL_0\" aria-hidden=\"true\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: flex; align-items: center; user-select: none; height: 24px;\"><div class=\"FYwKg _1A6vC _25blN _2FgpS\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; border-radius: 50%; background: currentcolor; width: 4px; height: 4px;\"></div></div></div><div class=\"FYwKg _3VCZm _1uk_1 _3RqUb_0\" style=\"margin: 0px; padding: 0px 0px 0px 12px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; width: 732px; min-width: 0px;\"><span class=\"FYwKg _2Bz3E C6ZIU_0 _6ufcS_0 _2DNlq_0 _29m7__0 _2WTa0_0\" style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: block; color: rgb(30, 34, 43);\">belajar mengenai hal-hal baru di bidang online food</span></div></div></li></ul></div></div></div></div><div class=\"FYwKg _3gJU3_0 _1yPon_0\" style=\"margin: 0px; padding: 48px 0px 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: medium; line-height: inherit; font-family: &quot;Times New Roman&quot;; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(0, 0, 0);\"><div class=\"FYwKg d7v3r _3aoZS_0\" style=\"margin: 0px; padding: 1px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg fB92N_0\" style=\"margin: 0px; padding: 24px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><h4 class=\"FYwKg C6ZIU_0 _3nVJR_0 _2VCbC_0 _2DNlq_0 _1VMf3_0\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 18px; line-height: 28px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(30, 34, 43);\">Deskripsi Pekerjaan</h4></div><div class=\"FYwKg fB92N_0\" style=\"margin: 0px; padding: 24px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div data-automation=\"jobDescription\" class=\"vDEj0_0\" style=\"font-family: inherit;\"><span class=\"FYwKg _2Bz3E C6ZIU_0 _6ufcS_0 _2DNlq_0 _29m7__0\" style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: block; color: rgb(30, 34, 43);\"><div class=\"FYwKg\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"font-weight: 700;\"><u>ADMIN</u></span></p><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-weight: 700;\">Usia 19-25 tahun.</span></p><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-weight: 700;\">Mempunyai skill google docs, Microsoft Excel &amp; Words.</span></p><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-weight: 700;\">Lancar berbahasa Indonesia &amp; Inggris.</span></p><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-weight: 700;\">Skill komunikasi yang sangat baik, rajin, teliti, rapih, kreatif, . Mempunyai keinginan untuk belajar hal-hal baru.</span></p><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-weight: 700;\">Tinggal di daerah Kapuk, Cengkareng, Jakarta Barat dan sekitarnya.</span></p><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-weight: 700;\">Mempunyai pengalaman kerja sebagai admin.</span></p><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-weight: 700;\">&nbsp;Memiliki transportasi &amp; laptop pribadi</span></p><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-weight: 700;\">Lancar menggunakan social media seperti Instagram, tiktok, e-commerce, grabfood, gofood.</span></p><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-weight: 700;\">Dapat bekerja sama baik dalam team.</span></p><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"font-weight: 700;\"><u>TANGGUNG JAWAB KERJA</u></span></p><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-weight: 700;\">Handle dan manage order customer.</span></p><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-weight: 700;\">Membuat laporan rekap penjualan harian dan mingguan.</span></p><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-weight: 700;\">Input setiap order ke dalam system.</span></p><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-weight: 700;\">Membantu pengemasan makanan sesuai order sebelum diberikan ke kurir sesuai dengan tujuan dan nama pesanan customer.</span></p><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-weight: 700;\">Planning caption untuk di posting social media &amp; Instagram story.</span></p><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-weight: 700;\">Membuat stock laporan harian untuk packaging.</span></p><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-weight: 700;\">Membuat schedule catatan untuk list pekerjaan harian/schedule bulanan</span></p><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"font-weight: 700;\">(to-do list) Sabibowls. Dan mengingatkan team akan jadwal deadline tersebut.</span></p><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-weight: 700;\">Menjaga hubungan baik dengan customers.</span></p><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-weight: 700;\">Mengumpulkan feedback customers dengan hal-hal tertentu.</span></p><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-weight: 700;\">Jam kerja:&nbsp;</span></p><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"font-weight: 700;\">Senin-Jumat (08.00-17.00) &amp; Sabtu (09.00-15.00)</span></p></div></span></div></div></div></div>', NULL, '2021-06-09', '2021-07-02', 'dibuka'),
(22, 'Admin Staff PT. Pintar Inovasi Digital', '<div class=\"FYwKg fB92N_0\" style=\"margin: 0px; padding: 24px 0px 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: medium; line-height: inherit; font-family: &quot;Times New Roman&quot;; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(0, 0, 0);\"><h4 class=\"FYwKg C6ZIU_0 _3nVJR_0 _2VCbC_0 _2DNlq_0 _1VMf3_0\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 18px; line-height: 28px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(30, 34, 43);\">Deskripsi Pekerjaan</h4></div><div class=\"FYwKg fB92N_0\" style=\"margin: 0px; padding: 24px 0px 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: medium; line-height: inherit; font-family: &quot;Times New Roman&quot;; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(0, 0, 0);\"><div data-automation=\"jobDescription\" class=\"vDEj0_0\" style=\"font-family: inherit;\"><span class=\"FYwKg _2Bz3E C6ZIU_0 _6ufcS_0 _2DNlq_0 _29m7__0\" style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: block; color: rgb(30, 34, 43);\"><div class=\"FYwKg\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"font-weight: 700;\">Job Description:</span></p><ol style=\"padding-bottom: 12px;\"><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\">Compile, collect, and document documents</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\">Ensure all administration and operations are running according to schedule</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\">Answer the phone and connect the phone to the party concerned, or record a message</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\">Conduct research, collect data, and prepare documents for consideration and presentation by executives, committees, and the board of directors</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\">Carry out general tasks in the office, such as ordering office supplies, maintaining a management database system, and performing basic recording tasks</li></ol><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"font-weight: 700;\">Qualifications:</span></p><ol style=\"padding-bottom: 12px;\"><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\">Experience in the same field at least 2 years</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\">Minimum education S1 Business Administration from a reputable University</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\">Having English language skills is preferred</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\">Have the ability to run Microsoft Excel (Vlookup and other formulas), Word, PPT</li></ol></div></span></div></div>', '1624409635096.jpg', '2021-06-16', '2021-07-30', 'dibuka');

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
(30, 10, 'C1', 80),
(31, 10, 'C2', 21),
(32, 10, 'C3', 5),
(33, 10, 'C4', 80),
(34, 10, 'C5', 70),
(35, 11, 'C1', 90),
(36, 11, 'C2', 20),
(37, 11, 'C3', 2),
(38, 11, 'C4', 80),
(39, 11, 'C5', 80),
(40, 12, 'C1', 75),
(41, 12, 'C2', 25),
(42, 12, 'C3', 6),
(43, 12, 'C4', 80),
(44, 12, 'C5', 80),
(45, 13, 'C1', 85),
(46, 13, 'C2', 26),
(47, 13, 'C3', 7),
(48, 13, 'C4', 75),
(49, 13, 'C5', 60),
(50, 14, 'C1', 80),
(51, 14, 'C2', 21),
(52, 14, 'C3', 2),
(53, 14, 'C4', 75),
(54, 14, 'C5', 75);

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

--
-- Dumping data untuk tabel `tb_normalisasi`
--

INSERT INTO `tb_normalisasi` (`id_normalisasi`, `id_pelamar`, `id_kriteria`, `nilai_normalisasi`) VALUES
(17, 10, 'C1', 0.888889),
(18, 10, 'C2', 0.807692),
(19, 10, 'C3', 0.714286),
(20, 10, 'C4', 1),
(21, 10, 'C5', 0.875),
(22, 11, 'C1', 1),
(23, 11, 'C2', 0.769231),
(24, 11, 'C3', 0.285714),
(25, 11, 'C4', 1),
(26, 11, 'C5', 1),
(27, 12, 'C1', 0.833333),
(28, 12, 'C2', 0.961538),
(29, 12, 'C3', 0.857143),
(30, 12, 'C4', 1),
(31, 12, 'C5', 1),
(32, 13, 'C1', 0.944444),
(33, 13, 'C2', 1),
(34, 13, 'C3', 1),
(35, 13, 'C4', 0.9375),
(36, 13, 'C5', 0.75),
(37, 14, 'C1', 0.888889),
(38, 14, 'C2', 0.807692),
(39, 14, 'C3', 0.285714),
(40, 14, 'C4', 0.9375),
(41, 14, 'C5', 0.9375);

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
(10, 19, 9, 'Ariel Tantum', 'wanita', 'Jakarta Selatan', '08513245698', 'S1', 'Teknik Industri', 'Programing Logic Control (PLC)'),
(11, 19, 10, 'Supriyadi', 'pria', 'Jl. Cempaka no 03, Semarang barat', '08955632142', 'S1', 'Telekomunikasi', 'Telekomunikasi'),
(12, 19, 11, 'Chandra', 'pria', 'Kendal', '08513245697', 'DIII', 'Telekomunikasi', 'Telekomunikasi'),
(13, 19, 12, 'Bayu', 'pria', 'Kendal', '08513245696', 'S1', 'Teknik Informatika', 'Fullstack Developer'),
(14, 19, 13, 'Budi', 'pria', 'Semarang', '08955632141', 'S1', 'Pendidikan Bahasa Inggris', 'Bahasa Inggris');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_rangking`
--

CREATE TABLE `tb_rangking` (
  `id_rangking` int(11) NOT NULL,
  `id_pelamar` int(11) DEFAULT NULL,
  `total_nilai` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_rangking`
--

INSERT INTO `tb_rangking` (`id_rangking`, `id_pelamar`, `total_nilai`) VALUES
(7, 10, 16.5542),
(8, 11, 15.9341),
(9, 12, 17.7509),
(10, 13, 17.7153),
(11, 14, 15.1435);

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
(5, 'manager', 'manager', 'manager'),
(9, 'ariel', '123456', 'calon_pelamar'),
(10, 'supri', '123456', 'calon_pelamar'),
(11, 'chandra', '123456', 'calon_pelamar'),
(12, 'bayu', '123456', 'calon_pelamar'),
(13, 'budi', '123456', 'calon_pelamar');

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
-- Indeks untuk tabel `tb_rangking`
--
ALTER TABLE `tb_rangking`
  ADD PRIMARY KEY (`id_rangking`),
  ADD KEY `FOREIGN_RANGKING_1` (`id_pelamar`);

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
  MODIFY `id_berkas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `tb_lowongan_kerja`
--
ALTER TABLE `tb_lowongan_kerja`
  MODIFY `id_lowongan_kerja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `tb_nilai`
--
ALTER TABLE `tb_nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT untuk tabel `tb_normalisasi`
--
ALTER TABLE `tb_normalisasi`
  MODIFY `id_normalisasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `tb_pelamar`
--
ALTER TABLE `tb_pelamar`
  MODIFY `id_pelamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `tb_rangking`
--
ALTER TABLE `tb_rangking`
  MODIFY `id_rangking` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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

--
-- Ketidakleluasaan untuk tabel `tb_rangking`
--
ALTER TABLE `tb_rangking`
  ADD CONSTRAINT `FOREIGN_RANGKING_1` FOREIGN KEY (`id_pelamar`) REFERENCES `tb_pelamar` (`id_pelamar`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
