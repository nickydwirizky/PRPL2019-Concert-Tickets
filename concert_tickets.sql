-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2019 at 02:00 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `concert_tickets`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategoritiket`
--

CREATE TABLE `kategoritiket` (
  `namakategori` varchar(30) NOT NULL,
  `namakonser` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategoritiket`
--

INSERT INTO `kategoritiket` (`namakategori`, `namakonser`) VALUES
('SEATING', 'EXO PLANET 5'),
('STANDING', 'EXO PLANET 5');

-- --------------------------------------------------------

--
-- Table structure for table `konser`
--

CREATE TABLE `konser` (
  `namakonser` varchar(30) NOT NULL,
  `tempat` text NOT NULL,
  `tanggalkonser` date NOT NULL,
  `namaband` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konser`
--

INSERT INTO `konser` (`namakonser`, `tempat`, `tanggalkonser`, `namaband`) VALUES
('EXO PLANET 5', 'JAKARTA', '2019-05-18', 'EXO');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `kodebayar` varchar(20) NOT NULL,
  `id` varchar(20) NOT NULL,
  `kodetiket` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `id` varchar(20) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `nohp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tiket`
--

CREATE TABLE `tiket` (
  `kodetiket` varchar(20) NOT NULL,
  `harga` int(10) NOT NULL,
  `namakategori` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tiket`
--

INSERT INTO `tiket` (`kodetiket`, `harga`, `namakategori`) VALUES
('DIAMOND', 2500000, 'STANDING'),
('GOLD', 1950000, 'SEATING'),
('JADE', 1450000, 'SEATING'),
('PLATINUM', 2350000, 'STANDING'),
('RUBY', 2250000, 'STANDING'),
('SILVER', 1650000, 'SEATING');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategoritiket`
--
ALTER TABLE `kategoritiket`
  ADD PRIMARY KEY (`namakategori`),
  ADD KEY `namakonser` (`namakonser`);

--
-- Indexes for table `konser`
--
ALTER TABLE `konser`
  ADD PRIMARY KEY (`namakonser`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`kodebayar`),
  ADD KEY `id` (`id`,`kodetiket`),
  ADD KEY `kodetiket` (`kodetiket`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`kodetiket`),
  ADD KEY `namakategori` (`namakategori`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kategoritiket`
--
ALTER TABLE `kategoritiket`
  ADD CONSTRAINT `kategoritiket_ibfk_1` FOREIGN KEY (`namakonser`) REFERENCES `konser` (`namakonser`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`kodetiket`) REFERENCES `tiket` (`kodetiket`),
  ADD CONSTRAINT `pembayaran_ibfk_2` FOREIGN KEY (`id`) REFERENCES `pembeli` (`id`);

--
-- Constraints for table `tiket`
--
ALTER TABLE `tiket`
  ADD CONSTRAINT `tiket_ibfk_1` FOREIGN KEY (`namakategori`) REFERENCES `kategoritiket` (`namakategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
