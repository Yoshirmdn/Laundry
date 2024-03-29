-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Feb 2023 pada 11.49
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `laundry`
--

CREATE TABLE `laundry` (
  `laun_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `laun_priority` int(11) NOT NULL,
  `laun_weight` int(11) NOT NULL,
  `laun_date_received` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `laun_claimed` tinyint(4) NOT NULL DEFAULT 0,
  `laun_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `laundry`
--

INSERT INTO `laundry` (`laun_id`, `customer_name`, `laun_priority`, `laun_weight`, `laun_date_received`, `laun_claimed`, `laun_type_id`) VALUES
(14, 'Cek 1', 2, 2, '2022-01-05 03:40:38', 1, 1),
(15, 'Risma', 1, 2, '2022-01-05 04:04:42', 1, 2),
(17, 'Ramdani', 3, 2, '2022-04-05 03:44:39', 1, 1),
(18, 'Ramdani', 1, 2, '2022-06-16 01:48:49', 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `laundry_type`
--

CREATE TABLE `laundry_type` (
  `laun_type_id` int(11) NOT NULL,
  `laun_type_desc` varchar(50) NOT NULL,
  `laun_type_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `laundry_type`
--

INSERT INTO `laundry_type` (`laun_type_id`, `laun_type_desc`, `laun_type_price`) VALUES
(1, 'Blanket', 20000),
(2, 'Clothes', 30000),
(3, 'Sepatu', 20000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `sale_customer_name` varchar(100) NOT NULL,
  `sale_type_desc` varchar(50) NOT NULL,
  `sale_date_paid` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sale_laundry_received` datetime NOT NULL,
  `sale_amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sales`
--

INSERT INTO `sales` (`sale_id`, `sale_customer_name`, `sale_type_desc`, `sale_date_paid`, `sale_laundry_received`, `sale_amount`) VALUES
(7, 'Cek 1', 'Blanket', '2022-01-05 03:40:38', '2022-01-05 10:39:59', 40),
(8, 'Risma', 'Clothes', '2022-01-05 04:04:42', '2022-01-05 10:52:56', 60),
(9, 'Ramdani', 'Blanket', '2022-04-05 03:44:39', '2022-01-07 16:52:39', 40000),
(10, 'Ramdani', 'Blanket', '2022-06-16 01:48:49', '2022-06-16 08:48:38', 40000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_account` varchar(50) NOT NULL,
  `user_password` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `user_account`, `user_password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `laundry`
--
ALTER TABLE `laundry`
  ADD PRIMARY KEY (`laun_id`),
  ADD KEY `laun_type_id` (`laun_type_id`);

--
-- Indeks untuk tabel `laundry_type`
--
ALTER TABLE `laundry_type`
  ADD PRIMARY KEY (`laun_type_id`);

--
-- Indeks untuk tabel `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `laundry`
--
ALTER TABLE `laundry`
  MODIFY `laun_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `laundry_type`
--
ALTER TABLE `laundry_type`
  MODIFY `laun_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `laundry`
--
ALTER TABLE `laundry`
  ADD CONSTRAINT `laundry_ibfk_1` FOREIGN KEY (`laun_type_id`) REFERENCES `laundry_type` (`laun_type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
