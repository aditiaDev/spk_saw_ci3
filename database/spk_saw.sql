-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Jun 2021 pada 01.09
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
(2, 'IT Support', 'IT Support Lapangan', NULL, '2021-05-01', '2021-05-31', 'dibuka'),
(5, 'EdTech Technical Support', 'test', '1624058011521.jpg', '2021-06-02', '2021-06-10', 'ditutup'),
(6, 'dsfdsf', 'dsfdsf', '1624187864887.jpg', '2021-06-15', '2021-06-24', 'dibuka'),
(7, 'test', 'test ket', '1624057972635.jpg', '2021-06-01', '2021-06-05', 'ditutup'),
(9, 'klsajdkjasjdlksajdl', '<p>qhfkdjhvncjvbhkdjfhgksfdsfsrweqweqweqw</p>', '1624187810858.jpg', '2021-06-01', '2021-06-30', 'dibuka'),
(10, 'WFH - Data Application Support', '<div class=\"FYwKg _2MJ7O_0 _36UVG_0\" data-automation=\"jobDetailsHeader\" style=\"margin: 0px 0px 20px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: medium; line-height: inherit; font-family: &quot;Times New Roman&quot;; vertical-align: baseline; -webkit-tap-highlight-color: transparent; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(0, 0, 0);\"><div class=\"FYwKg _2Bz3E _1aq_D_0 _1lyEa BDgXc_0 _3ucB1_0 _28vkp_0\" style=\"margin: 0px 0px 0px -12px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: flex; flex-direction: row;\"><div class=\"FYwKg _3VCZm _1uk_1 _3Ve9Z _2li9R\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; width: 530.662px; min-width: 0px; flex: 0 0 66.6667%;\"><div class=\"FYwKg _1GAuD zoxBO_0 JNERa_0 hLznC_0 _34Q9p_0 _2Bz3E rNAgI _1tfFt\" style=\"margin: 0px; padding: 0px 0px 0px 12px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; height: 186.337px; justify-content: flex-start;\"><div class=\"FYwKg d7v3r _2uGS9_0\" style=\"margin: 0px; padding: 1px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg zoxBO_0\" style=\"margin: 0px; padding: 12px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg _2Cp5K _3ftyQ _1lyEa\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; position: relative; display: flex; flex-direction: column;\"><div class=\"FYwKg d7v3r _2uGS9_0\" style=\"margin: 0px; padding: 1px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg zoxBO_0\" style=\"margin: 0px; padding: 12px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg zoxBO_0 _2sA6r_0 sDUog_0 _1yTEl_0\" style=\"margin: 0px; padding: 32px 20px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg\" data-automation=\"detailsTitle\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg d7v3r UJoTY_0\" style=\"margin: 0px; padding: 1px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg _6Gmbl_0\" style=\"margin: 0px; padding: 20px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><h1 class=\"FYwKg C6ZIU_0 _3nVJR_0 _642YY_0 _2DNlq_0 _2k6I7_0\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 21px; line-height: 28px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(30, 34, 43);\">WFH - Data Application Support</h1></div><div class=\"FYwKg _6Gmbl_0\" style=\"margin: 0px; padding: 20px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><span class=\"FYwKg _2Bz3E C6ZIU_0 _6ufcS_0 _2DNlq_0 _2CELK_0 _2WTa0_0\" style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: block; color: rgb(30, 34, 43);\">PT Amber Solusi Internasional</span></div></div></div></div></div></div></div></div><div class=\"FYwKg zoxBO_0\" style=\"margin: 0px; padding: 12px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg _2Cp5K _3ftyQ _1lyEa _1xsO__0\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; position: relative; display: flex; flex-direction: row; align-items: center;\"><div class=\"FYwKg _3VCZm _3qNSL_0 bMBHP_0 sDUog_0 _2Bz3E\" style=\"margin: 0px; padding: 0px 0px 32px 20px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; width: 518.662px;\"><div class=\"FYwKg d7v3r _3122U_0\" style=\"margin: 0px; padding: 1px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg _11hx2_0\" style=\"margin: 0px; padding: 4px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg _3ftyQ\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: flex;\"><span class=\"FYwKg _2Bz3E C6ZIU_0 _6ufcS_0 _2DNlq_0 _29m7__0\" style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: block; color: rgb(30, 34, 43);\">Jakarta Raya</span></div></div><div class=\"FYwKg _11hx2_0\" style=\"margin: 0px; padding: 4px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><span class=\"FYwKg _2Bz3E C6ZIU_0 _6ufcS_0 _2DNlq_0 _29m7__0\" style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: block; color: rgb(30, 34, 43);\">Ditayangkan pada 21 jam yang lalu</span></div></div></div></div></div></div></div></div><div class=\"FYwKg _3VCZm _1uk_1 _3Ve9Z f3ti9\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; width: 265.325px; min-width: 0px; flex: 0 0 33.3333%;\"><div class=\"FYwKg _1GAuD zoxBO_0 JNERa_0 hLznC_0 _34Q9p_0 _2Bz3E rNAgI _1tfFt\" style=\"margin: 0px; padding: 0px 0px 0px 12px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; height: 186.337px; justify-content: flex-start;\"></div></div></div></div><div class=\"FYwKg _2MJ7O_0 _3gJU3_0 _1yPon_0 _36Yi4_0 _1WtCj_0 FLByR_0 _2QIfI_0\" style=\"margin: 0px; padding: 48px 24px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: medium; line-height: inherit; font-family: &quot;Times New Roman&quot;; vertical-align: baseline; -webkit-tap-highlight-color: transparent; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(0, 0, 0);\"><div class=\"FYwKg d7v3r _3BZ6E_0 _2FwxQ_0\" style=\"margin: 0px; padding: 1px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg _3gJU3_0 _1yPon_0\" style=\"margin: 0px; padding: 48px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg d7v3r _3BZ6E_0 _2FwxQ_0\" style=\"margin: 0px; padding: 1px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg _3gJU3_0 _1yPon_0\" style=\"margin: 0px; padding: 48px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg\" data-automation=\"job-details-job-highlights\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg d7v3r _3aoZS_0\" style=\"margin: 0px; padding: 1px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg fB92N_0\" style=\"margin: 0px; padding: 24px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><h4 class=\"FYwKg C6ZIU_0 _3nVJR_0 _2VCbC_0 _2DNlq_0 _1VMf3_0\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 18px; line-height: 28px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(30, 34, 43);\">Keuntungan</h4></div><div class=\"FYwKg fB92N_0\" style=\"margin: 0px; padding: 24px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><ul class=\"FYwKg _302h6 d7v3r UJoTY_0\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 1px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; list-style: none;\"><li class=\"FYwKg _6Gmbl_0\" style=\"margin: 0px; padding: 20px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg _3ftyQ\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: flex;\"><div class=\"FYwKg _2Bz3E C6ZIU_0 _6ufcS_0 _2DNlq_0 _29m7__0 _2WTa0_0\" style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(30, 34, 43);\"><div class=\"FYwKg _3ftyQ _3O7rA mY9oq _26CPL_0\" aria-hidden=\"true\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: flex; align-items: center; user-select: none; height: 24px;\"><div class=\"FYwKg _1A6vC _25blN _2FgpS\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; border-radius: 50%; background: currentcolor; width: 4px; height: 4px;\"></div></div></div><div class=\"FYwKg _3VCZm _1uk_1 _3RqUb_0\" style=\"margin: 0px; padding: 0px 0px 0px 12px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; width: 732px; min-width: 0px;\"><span class=\"FYwKg _2Bz3E C6ZIU_0 _6ufcS_0 _2DNlq_0 _29m7__0 _2WTa0_0\" style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: block; color: rgb(30, 34, 43);\">Working from home (full)</span></div></div></li><li class=\"FYwKg _6Gmbl_0\" style=\"margin: 0px; padding: 20px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg _3ftyQ\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: flex;\"><div class=\"FYwKg _2Bz3E C6ZIU_0 _6ufcS_0 _2DNlq_0 _29m7__0 _2WTa0_0\" style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(30, 34, 43);\"><div class=\"FYwKg _3ftyQ _3O7rA mY9oq _26CPL_0\" aria-hidden=\"true\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: flex; align-items: center; user-select: none; height: 24px;\"><div class=\"FYwKg _1A6vC _25blN _2FgpS\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; border-radius: 50%; background: currentcolor; width: 4px; height: 4px;\"></div></div></div><div class=\"FYwKg _3VCZm _1uk_1 _3RqUb_0\" style=\"margin: 0px; padding: 0px 0px 0px 12px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; width: 732px; min-width: 0px;\"><span class=\"FYwKg _2Bz3E C6ZIU_0 _6ufcS_0 _2DNlq_0 _29m7__0 _2WTa0_0\" style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: block; color: rgb(30, 34, 43);\">Opportunity to work with global customers</span></div></div></li><li class=\"FYwKg _6Gmbl_0\" style=\"margin: 0px; padding: 20px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg _3ftyQ\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: flex;\"><div class=\"FYwKg _2Bz3E C6ZIU_0 _6ufcS_0 _2DNlq_0 _29m7__0 _2WTa0_0\" style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(30, 34, 43);\"><div class=\"FYwKg _3ftyQ _3O7rA mY9oq _26CPL_0\" aria-hidden=\"true\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: flex; align-items: center; user-select: none; height: 24px;\"><div class=\"FYwKg _1A6vC _25blN _2FgpS\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; border-radius: 50%; background: currentcolor; width: 4px; height: 4px;\"></div></div></div><div class=\"FYwKg _3VCZm _1uk_1 _3RqUb_0\" style=\"margin: 0px; padding: 0px 0px 0px 12px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent; width: 732px; min-width: 0px;\"><span class=\"FYwKg _2Bz3E C6ZIU_0 _6ufcS_0 _2DNlq_0 _29m7__0 _2WTa0_0\" style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: block; color: rgb(30, 34, 43);\">Attractive compensation package</span></div></div></li></ul></div></div></div></div><div class=\"FYwKg _3gJU3_0 _1yPon_0\" style=\"margin: 0px; padding: 48px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg d7v3r _3aoZS_0\" style=\"margin: 0px; padding: 1px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div class=\"FYwKg fB92N_0\" style=\"margin: 0px; padding: 24px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><h4 class=\"FYwKg C6ZIU_0 _3nVJR_0 _2VCbC_0 _2DNlq_0 _1VMf3_0\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 18px; line-height: 28px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(30, 34, 43);\">Deskripsi Pekerjaan</h4></div><div class=\"FYwKg fB92N_0\" style=\"margin: 0px; padding: 24px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><div data-automation=\"jobDescription\" class=\"vDEj0_0\" style=\"font-family: inherit;\"><span class=\"FYwKg _2Bz3E C6ZIU_0 _6ufcS_0 _2DNlq_0 _29m7__0\" style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Roboto, &quot;Helvetica Neue&quot;, HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: block; color: rgb(30, 34, 43);\"><div class=\"FYwKg\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;\"><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-align: justify;\"><span style=\"font-weight: 700;\">WFH - APPLICATION SUPPORT</span></p><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">We are seeking a full-time Application Support</p><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-align: justify;\">If you have exceptional organizational skills and draw energy from being part of a team, we would love to meet you.</p><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-align: justify;\"><span style=\"font-weight: 700;\">Duties and Responsibilities:</span></p><ol style=\"padding-bottom: 12px;\"><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\">Update pricing list (check UOM, Price level) to HighJump and Netsuite</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\">Update product data details</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\">Create script using Phyton to get bulk data from vendor website</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\">Using Netsuite to handle tasks</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\">Analyse and process raw data given from other party</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\">Do data mapping, data processing required to fit into the format required</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\">Handle other task as assigned</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\">Supporting other team when it is required</li></ol><p style=\"padding-top: 12px; padding-bottom: 12px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><span style=\"font-weight: 700;\">Qualifications:</span></p><ol style=\"padding-bottom: 12px;\"><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\">Love dealing with data, details and numbers</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\">Have sharp eyes for accuracy</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\">Have persistency to do routine tasks</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\">Excellent in Microsoft Excel using formula</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\"><span style=\"color: black;\">Diploma Degree,&nbsp;GPA&nbsp;&gt; 3.00</span></li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\"><span style=\"font-weight: 700;\">Good English is a must (write, hear, and speak)</span></li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\"><span style=\"font-weight: 700;\">Stable internet connection at home</span></li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\"><span style=\"font-weight: 700;\">Have decent workspace at home, full Working from Home</span></li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\"><span style=\"font-weight: 700;\">Working hour starting 8 PM – 5 AM WIB (kalong hour)</span></li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\"><span style=\"font-weight: 700;\">Will be supporting for USA based company</span></li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\"><span style=\"font-weight: 700;\">Working days and national holidays following USA working days</span></li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\"><span style=\"color: black;\">Have experience in same role min.&nbsp;1&nbsp;years</span></li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\"><span style=\"color: black;\">Familiar with Netsuite, HighJump is a plus&nbsp;</span></li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\">Please do not apply if you are not the detail type</li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\">Please do not apply if you<span style=\"color: black;\">&nbsp;expect&nbsp;can do&nbsp;double job, workload require full attention</span></li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\">Please do not apply<span style=\"color: black;\">&nbsp;if you are Fresh Graduate</span></li><li style=\"padding-bottom: 4px; margin-left: 20px; list-style: decimal;\">Please do not apply if you are still studying to get any degree</li></ol></div></span></div></div></div></div></div></div></div></div>', '1624188338858.jpg', '2021-06-02', '2021-06-26', 'dibuka');

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
(6, 1, 'C1', 3),
(7, 1, 'C2', 4),
(8, 1, 'C3', 2),
(9, 1, 'C4', 3),
(10, 3, 'C1', 4),
(11, 3, 'C2', 2),
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

--
-- Dumping data untuk tabel `tb_normalisasi`
--

INSERT INTO `tb_normalisasi` (`id_normalisasi`, `id_pelamar`, `id_kriteria`, `nilai_normalisasi`) VALUES
(5, 1, 'C1', 1),
(6, 1, 'C2', 1),
(7, 1, 'C3', 1),
(8, 1, 'C4', 1),
(9, 1, 'C1', 0.75),
(10, 1, 'C2', 1),
(11, 1, 'C3', 0.5),
(12, 1, 'C4', 1),
(13, 3, 'C1', 1),
(14, 3, 'C2', 0.5),
(15, 3, 'C3', 1),
(16, 3, 'C4', 0.666667);

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
(3, 1, 16),
(4, 2, 14),
(5, 1, 13.5),
(6, 3, 12.3333);

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
(2, 'aditia', 'aditia', 'admin'),
(3, 'test', 'test123', 'admin');

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
  ADD PRIMARY KEY (`id_rangking`);

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
  MODIFY `id_berkas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_lowongan_kerja`
--
ALTER TABLE `tb_lowongan_kerja`
  MODIFY `id_lowongan_kerja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tb_nilai`
--
ALTER TABLE `tb_nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `tb_normalisasi`
--
ALTER TABLE `tb_normalisasi`
  MODIFY `id_normalisasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `tb_pelamar`
--
ALTER TABLE `tb_pelamar`
  MODIFY `id_pelamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_rangking`
--
ALTER TABLE `tb_rangking`
  MODIFY `id_rangking` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
