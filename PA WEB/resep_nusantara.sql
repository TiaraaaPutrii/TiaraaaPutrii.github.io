-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2024 at 10:18 AM
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
-- Database: `resep_nusantara`
--

-- --------------------------------------------------------

--
-- Table structure for table `resep`
--

CREATE TABLE `resep` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `bahan` text NOT NULL,
  `instruksi` text NOT NULL,
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resep`
--

INSERT INTO `resep` (`id`, `nama`, `kategori`, `deskripsi`, `bahan`, `instruksi`, `gambar`) VALUES
(16, 'Rendang', 'makanan berat', 'Masakan daging sapi bercita rasa gurih pedas dengan rempah khas, dimasak lama hingga bumbu meresap dan menghitam.', '500 gram daging sapi\r\n200 ml santan\r\n5 siung bawang putih\r\n8 butir bawang merah\r\n2 batang serai, memarkan\r\n2 lembar daun salam\r\n2 lembar daun jeruk\r\n1 ruas lengkuas, memarkan\r\nCabai merah sesuai selera\r\nGaram dan gula secukupnya', 'Haluskan bawang putih, bawang merah, cabai, dan garam.\r\nTumis bumbu halus bersama serai, daun salam, daun jeruk, dan lengkuas hingga harum.\r\nMasukkan daging sapi, aduk hingga daging berubah warna.\r\nTambahkan santan, masak dengan api kecil hingga daging empuk dan bumbu meresap sempurna.\r\nMasak terus hingga kuah mengering dan daging menjadi cokelat kehitaman.', 'uploads/Resep1.jpg'),
(17, 'Pindang', 'makanan berat', 'Sup ikan bercita rasa asam dan segar, populer di Sumatra Selatan, dengan bumbu kunyit, cabai, dan rempah-rempah.', '1 kg ikan (kakap atau patin)\r\n5 siung bawang merah\r\n3 siung bawang putih\r\n1 ruas kunyit\r\n1 ruas jahe\r\n1 batang serai\r\nDaun salam dan daun jeruk\r\nCabai merah dan cabai hijau\r\nGaram, gula, dan air asam jawa secukupnya', 'Tumis bumbu halus hingga harum.\r\nMasukkan air dan bumbu lainnya, didihkan.\r\nMasukkan ikan, masak hingga matang.\r\nTambahkan cabai dan garam secukupnya.\r\nPindang siap disajikan.', 'uploads/Resep4.jpg'),
(18, 'Nasi Bali', 'makanan berat', 'Nasi putih dengan lauk khas Bali seperti ayam suwir pedas, sate lilit, lawar, dan sambal matah.', '500 gram nasi putih\r\n100 gram ayam suwir pedas\r\n4 tusuk sate lilit\r\nLawar sayur secukupnya\r\nSambal matah secukupnya', 'Sajikan nasi di atas piring.\r\nTata ayam suwir pedas, sate lilit, lawar, dan sambal matah di sekitar nasi.\r\nNasi Bali siap disajikan.', 'uploads/Resep7.jpg'),
(19, 'Bingka Barandam', 'makanan ringan', 'Kue tradisional Banjar berbahan dasar tepung dan telur yang disiram air gula, memiliki tekstur lembut.', '200 gram tepung terigu\r\n5 butir telur\r\n200 ml santan\r\n100 gram gula merah, larutkan', 'Kocok telur dan campurkan dengan tepung terigu.\r\nTambahkan santan dan aduk hingga rata.\r\nTuang adonan ke dalam cetakan dan kukus hingga matang.\r\nSiram bingka dengan larutan gula merah.\r\nBingka Barandam siap disajikan.', 'uploads/Resep8.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `resep_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `komentar` text NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$MiO0wis3bRktOHWmTV8BTuMP40Nqm6tS2pST.U6PZgBjiIrJXk1Jq'),
(3, 'kawan', 'kawan@yahoo.com', '$2y$10$246KiWYzI7xBvsV0.j2t/OLkAKnEo4uw0PsgIiGnoGUWKd8pgLGbS'),
(6, 'm', 'm@yahoo.com', '$2y$10$lbVrVP8B3sSisy84v67FMuQ7i/7hcm9SAIN5B1jR5lm/C30eAcZR6'),
(7, 'klp', 'klp@yahoo.com', '$2y$10$7gRgBSGvYx12JXJemOH0k.LkGUvrS4RLtzxw9YLGvfQp5PRjxaM3S');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `resep`
--
ALTER TABLE `resep`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resep_id` (`resep_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `resep`
--
ALTER TABLE `resep`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`resep_id`) REFERENCES `resep` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
