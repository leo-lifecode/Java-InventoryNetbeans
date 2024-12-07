-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Jun 2024 pada 14.59
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_barang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventory_barang_keluar`
--

CREATE TABLE `inventory_barang_keluar` (
  `Kd_Barang` int(10) NOT NULL,
  `Nama_Barang` varchar(25) NOT NULL,
  `Tanggal_Masuk` date NOT NULL,
  `Tanggal_Keluar` date NOT NULL,
  `Jumlah` int(11) NOT NULL,
  `Kondisi` text CHARACTER SET latin2 COLLATE latin2_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `inventory_barang_keluar`
--

INSERT INTO `inventory_barang_keluar` (`Kd_Barang`, `Nama_Barang`, `Tanggal_Masuk`, `Tanggal_Keluar`, `Jumlah`, `Kondisi`) VALUES
(100001, 'Asus', '2012-12-12', '2012-12-12', 1, 'Rusak Ringan'),
(100003, 'Lenovo', '2012-10-10', '2012-12-12', 1, 'Rusak Ringan'),
(100002, 'Acer', '2012-11-11', '2012-10-11', 1, 'Rusak Ringan');

--
-- Trigger `inventory_barang_keluar`
--
DELIMITER $$
CREATE TRIGGER `keluar` AFTER INSERT ON `inventory_barang_keluar` FOR EACH ROW BEGIN
UPDATE inventory_barang_masuk SET Jumlah=Jumlah-NEW.Jumlah
WHERE Kd_Barang=NEW.Kd_Barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventory_barang_masuk`
--

CREATE TABLE `inventory_barang_masuk` (
  `Kd_Barang` int(10) NOT NULL,
  `Nama_Barang` varchar(25) NOT NULL,
  `Tanggal_Masuk` date NOT NULL,
  `Jumlah` int(10) NOT NULL,
  `Kondisi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `inventory_barang_masuk`
--

INSERT INTO `inventory_barang_masuk` (`Kd_Barang`, `Nama_Barang`, `Tanggal_Masuk`, `Jumlah`, `Kondisi`) VALUES
(100001, 'Asus', '2012-12-12', 5, 'Baik'),
(100002, 'Acer', '2012-11-11', 5, 'Baik'),
(100003, 'Lenovo', '2012-12-12', 6, 'Baik');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id`, `username`, `password`) VALUES
(4, 'naufal', 'a7ef174d3ed272acd2b72913a7ef9d40'),
(8, 'agil', '0a68be9c12632278b4fa8f8d497ad2c1');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `inventory_barang_masuk`
--
ALTER TABLE `inventory_barang_masuk`
  ADD PRIMARY KEY (`Kd_Barang`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
