-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2025 at 11:42 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_latihan`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `kode_dr` char(5) NOT NULL,
  `nama_dr` char(25) NOT NULL,
  `spesialis` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`kode_dr`, `nama_dr`, `spesialis`) VALUES
('dr01', 'dr. Buddy', 'Umum'),
('dr02', 'drg. Emilia', 'Gigi'),
('dr03', 'dr. Endang', 'THT'),
('dr04', 'dr. Maliq', 'Kandungan');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `no_pasien` char(5) NOT NULL,
  `nama_pasien` char(25) NOT NULL,
  `alamat_pasien` char(25) DEFAULT NULL,
  `umur` int(11) DEFAULT NULL,
  `kode_dr` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`no_pasien`, `nama_pasien`, `alamat_pasien`, `umur`, `kode_dr`) VALUES
('p001', 'Abdul', 'Cihaji 16 Bandung', 23, 'dr01'),
('p002', 'Amin', 'Cikaso 67 Bandung', 28, 'dr02'),
('p003', 'Neneng', 'Cikadut 74 Bandung', 25, NULL),
('p004', 'Nenden', 'Gatot Subroto 7 Bandung', 35, 'dr02'),
('p005', 'Azwar', 'Cijalu 5 Subang', 30, 'dr03'),
('p006', 'Hanif', 'Cibaduyut 556 Bandung', 39, 'dr01'),
('p007', 'Yusuf', 'A. Yani 889 Bandung', 36, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `produk` char(100) DEFAULT NULL,
  `kategori` char(100) DEFAULT NULL,
  `harga_per_kg` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `produk`, `kategori`, `harga_per_kg`) VALUES
(1, 'Apel', 'Buah', 30000),
(2, 'Pisang', 'Buah', 15000),
(3, 'Wortel', 'Sayur', 12000),
(4, 'Brokoli', 'Sayur', 20000),
(5, 'Semangka', 'Buah', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `pelanggan` char(100) DEFAULT NULL,
  `total_harga` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `metode_bayar` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `pelanggan`, `total_harga`, `tanggal`, `metode_bayar`) VALUES
(1, 'Andi', 100000, '2025-04-01', 'Tunai'),
(2, 'Budi', 250000, '2025-04-01', 'Kartu Kredit'),
(3, 'Andi', 150000, '2025-04-02', 'Tunai'),
(4, 'Citra', 300000, '2025-04-02', 'Kartu Kredit'),
(5, 'Dinda', 50000, '2025-04-03', 'QRIS');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`kode_dr`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`no_pasien`),
  ADD KEY `kode_dr` (`kode_dr`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pasien`
--
ALTER TABLE `pasien`
  ADD CONSTRAINT `pasien_ibfk_1` FOREIGN KEY (`kode_dr`) REFERENCES `dokter` (`kode_dr`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
