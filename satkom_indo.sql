-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 07 Jun 2023 pada 13.22
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `satkom_indo`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `actors`
--

CREATE TABLE `actors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(10) UNSIGNED DEFAULT 2,
  `verified` enum('true','false') DEFAULT 'false',
  `active` enum('true','false') DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `actors`
--

INSERT INTO `actors` (`id`, `username`, `password`, `role_id`, `verified`, `active`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', '$2a$12$26EAzIyDQ5YZKE6pAeHKoeugjQ98lkXNPOEFjJikPmQReEMK4snoW', 1, 'true', 'true', '2023-06-01 21:41:18', '2023-06-03 22:18:58'),
(3, 'be', '$2a$12$LLGqut.2ghWEIq7KbqmBgexbC6tys1S52GE7dqghRx/Bn8cvaen2u', 2, 'true', 'true', '2023-06-02 00:33:07', '2023-06-03 02:39:09'),
(4, 'se', '$2a$12$3Cmx2UK/HVCp1kg0z2yLL.V3DcMN/BoBN4jYhjf1I4J3gOHlARDe6', 2, 'true', 'true', '2023-06-02 04:07:55', '2023-06-07 03:20:30'),
(6, 's', '$2a$12$jHCAyoN6vT9yyDSzagl6BOl0MbgdICn1fz1GqW3dRlNuhZvegjDvO', 2, 'false', 'false', '2023-06-02 04:12:35', '2023-06-02 04:12:35'),
(9, 'd', '$2a$12$o5HvC9FBOTQ7Yc/Eyac2HOR36JGnWUMIwipK2YfV6pG25UVK2/v.e', 2, 'true', 'true', '2023-06-04 00:16:11', '2023-06-07 02:53:45'),
(11, 'sr', '$2a$12$wkffuTIwkd4HFK9p8Yftt.YIsXHjJxzHBurF/7xHzescmmyjxopDi', 2, 'true', 'true', '2023-06-07 09:59:31', '2023-06-07 03:00:46'),
(13, 'blablabla', '$2a$12$TqkZeGKrFYhsGC9ANxF9..jkSPOmZvHM0HxhJ4Yf6CoYzZXTS2gpG', 2, 'true', 'true', '2023-06-07 10:19:40', '2023-06-07 03:21:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `actor_role`
--

CREATE TABLE `actor_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `actor_role`
--

INSERT INTO `actor_role` (`id`, `role_name`) VALUES
(2, 'admin'),
(1, 'superadmin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id`, `first_name`, `last_name`, `email`, `avatar`, `created_at`, `updated_at`) VALUES
(5, 'Michael', 'Lawson', 'michael.lawson@reqres.in', 'https://reqres.in/img/faces/7-image.jpg', '2023-06-03 20:55:19', '2023-06-03 20:55:19'),
(6, 'Lindsay', 'Ferguson', 'lindsay.ferguson@reqres.in', 'https://reqres.in/img/faces/8-image.jpg', '2023-06-03 20:55:19', '2023-06-03 20:55:19'),
(7, 'Tobias', 'Funke', 'tobias.funke@reqres.in', 'https://reqres.in/img/faces/9-image.jpg', '2023-06-03 20:55:19', '2023-06-03 20:55:19'),
(8, 'Byron', 'Fields', 'byron.fields@reqres.in', 'https://reqres.in/img/faces/10-image.jpg', '2023-06-03 20:55:19', '2023-06-03 20:55:19'),
(9, 'George', 'Edwards', 'george.edwards@reqres.in', 'https://reqres.in/img/faces/11-image.jpg', '2023-06-03 20:55:19', '2023-06-03 20:55:19'),
(13, 'Rachel', 'Howell', 'rachel.howell@reqres.in', 'https://reqres.in/img/faces/12-image.jpg', '2023-06-07 10:15:22', '2023-06-07 10:15:22'),
(16, 'Andy', 'Eynon', 'aeynonf@ucla.edu', 'http://dummyimage.com/126x100.png/5fa2dd/ffffff', '2022-08-10 17:00:00', '2023-05-09 17:00:00'),
(17, 'Isador', 'Tabart', 'itabartg@uol.com.br', 'http://dummyimage.com/144x100.png/5fa2dd/ffffff', '2022-07-21 17:00:00', '2023-01-28 17:00:00'),
(18, 'Clio', 'Thirsk', 'cthirskh@skyrock.com', 'http://dummyimage.com/166x100.png/ff4444/ffffff', '2022-12-14 17:00:00', '2023-02-01 17:00:00'),
(19, 'Laureen', 'Gwinnett', 'lgwinnetti@aboutads.info', 'http://dummyimage.com/240x100.png/cc0000/ffffff', '2023-04-05 17:00:00', '2023-03-20 17:00:00'),
(20, 'Jacky', 'Copperwaite', 'jcopperwaitej@sfgate.com', 'http://dummyimage.com/100x100.png/cc0000/ffffff', '2023-02-19 17:00:00', '2022-11-23 17:00:00'),
(21, 'Francis', 'Myall', 'fmyallk@ow.ly', 'http://dummyimage.com/131x100.png/ff4444/ffffff', '2023-03-15 17:00:00', '2022-07-19 17:00:00'),
(22, 'Xerxes', 'Duffer', 'xdufferl@mozilla.org', 'http://dummyimage.com/115x100.png/ff4444/ffffff', '2022-08-14 17:00:00', '2022-07-12 17:00:00'),
(23, 'Ezri', 'Zanardii', 'ezanardiim@typepad.com', 'http://dummyimage.com/111x100.png/cc0000/ffffff', '2022-09-24 17:00:00', '2023-01-30 17:00:00'),
(24, 'Shani', 'Dayne', 'sdaynen@comsenz.com', 'http://dummyimage.com/193x100.png/dddddd/000000', '2022-12-05 17:00:00', '2022-10-10 17:00:00'),
(25, 'Stacy', 'Asling', 'saslingo@soundcloud.com', 'http://dummyimage.com/112x100.png/dddddd/000000', '2023-03-29 17:00:00', '2023-02-10 17:00:00'),
(26, 'Corine', 'Cowles', 'ccowlesp@360.cn', 'http://dummyimage.com/205x100.png/dddddd/000000', '2022-08-09 17:00:00', '2022-07-17 17:00:00'),
(27, 'Orazio', 'Josilevich', 'ojosilevichq@redcross.org', 'http://dummyimage.com/195x100.png/ff4444/ffffff', '2023-03-24 17:00:00', '2022-08-20 17:00:00'),
(28, 'Joshuah', 'MacDunlevy', 'jmacdunlevyr@engadget.com', 'http://dummyimage.com/199x100.png/dddddd/000000', '2022-10-02 17:00:00', '2023-01-23 17:00:00'),
(29, 'Glen', 'Strickland', 'gstricklands@ucla.edu', 'http://dummyimage.com/250x100.png/ff4444/ffffff', '2023-02-18 17:00:00', '2022-11-21 17:00:00'),
(30, 'Tristam', 'Meiklem', 'tmeiklemt@elegantthemes.com', 'http://dummyimage.com/140x100.png/dddddd/000000', '2022-08-22 17:00:00', '2022-08-19 17:00:00'),
(31, 'Errick', 'Maryott', 'emaryottu@chron.com', 'http://dummyimage.com/124x100.png/cc0000/ffffff', '2023-05-23 17:00:00', '2022-11-26 17:00:00'),
(32, 'Barny', 'Benneyworth', 'bbenneyworthv@bizjournals.com', 'http://dummyimage.com/220x100.png/ff4444/ffffff', '2023-02-15 17:00:00', '2022-07-11 17:00:00'),
(33, 'Fabe', 'Smitherman', 'fsmithermanw@rakuten.co.jp', 'http://dummyimage.com/167x100.png/ff4444/ffffff', '2022-10-10 17:00:00', '2023-03-29 17:00:00'),
(34, 'Hirsch', 'Surguine', 'hsurguinex@ebay.co.uk', 'http://dummyimage.com/211x100.png/ff4444/ffffff', '2022-07-26 17:00:00', '2022-08-24 17:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `register_approval`
--

CREATE TABLE `register_approval` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `super_admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `register_approval`
--

INSERT INTO `register_approval` (`id`, `admin_id`, `super_admin_id`, `status`) VALUES
(3, 3, 1, 'activate'),
(4, 4, 1, 'activate'),
(5, 6, 1, 'deactivate'),
(8, 9, 1, 'deactivate'),
(10, 11, 1, 'deactivate'),
(12, 13, 1, 'deactivate');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `actor_role` (`role_id`),
  ADD KEY `idx_username_actor` (`username`);

--
-- Indeks untuk tabel `actor_role`
--
ALTER TABLE `actor_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_first_name` (`first_name`),
  ADD KEY `idx_last_name` (`last_name`),
  ADD KEY `customer_index_email` (`email`);

--
-- Indeks untuk tabel `register_approval`
--
ALTER TABLE `register_approval`
  ADD PRIMARY KEY (`id`),
  ADD KEY `register_admin_actor_role` (`admin_id`),
  ADD KEY `register_superadmin_actor_role` (`super_admin_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `actors`
--
ALTER TABLE `actors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `actor_role`
--
ALTER TABLE `actor_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `register_approval`
--
ALTER TABLE `register_approval`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `actors`
--
ALTER TABLE `actors`
  ADD CONSTRAINT `actor_role` FOREIGN KEY (`role_id`) REFERENCES `actor_role` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `register_approval`
--
ALTER TABLE `register_approval`
  ADD CONSTRAINT `register_admin_actor_role` FOREIGN KEY (`admin_id`) REFERENCES `actors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `register_superadmin_actor_role` FOREIGN KEY (`super_admin_id`) REFERENCES `actors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
