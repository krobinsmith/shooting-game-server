-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2021 at 04:44 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shooting`
--

-- --------------------------------------------------------

--
-- Table structure for table `bl_game_bans`
--

CREATE TABLE `bl_game_bans` (
  `id` int(10) NOT NULL,
  `name` varchar(30) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `reason` varchar(125) NOT NULL,
  `ip` varchar(128) DEFAULT NULL,
  `by` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bl_game_purchases`
--

CREATE TABLE `bl_game_purchases` (
  `id` int(11) NOT NULL,
  `product_id` varchar(70) NOT NULL,
  `receipt` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bl_game_tickets`
--

CREATE TABLE `bl_game_tickets` (
  `id` int(10) NOT NULL,
  `name` varchar(30) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `title` varchar(25) DEFAULT NULL,
  `content` varchar(300) DEFAULT NULL,
  `reply` varchar(300) DEFAULT NULL,
  `close` int(9) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bl_game_users`
--

CREATE TABLE `bl_game_users` (
  `id` int(11) NOT NULL,
  `name` varchar(30) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `nick` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `password` varchar(64) NOT NULL,
  `kills` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `deaths` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `score` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `headshot` int(11) NOT NULL,
  `coins` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `purchases` varchar(200) DEFAULT NULL,
  `meta` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `clan` varchar(12) NOT NULL DEFAULT '-1',
  `clan_invitations` varchar(50) NOT NULL DEFAULT '1,',
  `playtime` int(64) UNSIGNED NOT NULL DEFAULT 0,
  `email` varchar(30) DEFAULT NULL,
  `active` int(1) NOT NULL DEFAULT 0,
  `ip` varchar(128) NOT NULL DEFAULT 'none',
  `friends` varchar(252) DEFAULT NULL,
  `status` int(3) NOT NULL DEFAULT 0,
  `verify` varchar(32) DEFAULT NULL,
  `user_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `address` varchar(256) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bl_game_users`
--

INSERT INTO `bl_game_users` (`id`, `name`, `nick`, `password`, `kills`, `deaths`, `score`, `headshot`, `coins`, `purchases`, `meta`, `clan`, `clan_invitations`, `playtime`, `email`, `active`, `ip`, `friends`, `status`, `verify`, `user_date`, `address`) VALUES
(1, 'spasic', 'killer1220', '$2y$10$F3c7VHPtukTXG8EaOxMpT.by3GAXCkM.j/04I8LqLDHARmwfrzUnm', 22, 13, 2400, 4, 1015, '', '{\"rawData\":{\"WeaponsLoadouts\":\"256&46879416&456&5498794,2&1&5&3,8&1&5&3,0&1&5&3\",\"ClassKit\":2}}', '-1', '1,', 2902, 'none', 1, '127.0.0.1', NULL, 0, '', '2021-09-22 01:13:16', '0xf48B5A9b7F76E34065be0D91DC2A9A517534817b'),
(2, 'sava', 'killer', '$2y$10$dpk1Ny1/LlkP34GA4PZiHe.BPTexnazDdK3jbtmqaCFFMt8rv54uO', 27, 57, 2900, 5, 199626, '1,2-1,3-', '{\"rawData\":{\"WeaponsLoadouts\":\"468978&423&456&467981324,2&1&5&3,8&1&5&3,0&1&5&3\",\"ClassKit\":2}}', '-1', '1,', 6416, 'none', 1, '127.0.0.1', NULL, 0, '', '2021-09-21 16:17:14', '0x09d738A9714ef9A7907EF39A1ca0E004C6EfFd68'),
(4, 'jack', 'killer0907', '$2y$10$zsLuRzwSmYuVvpcJJvKn1.GeDakL2pDxwF.v1/MEbKmowhOd/sS72', 0, 0, 0, 0, 200000, NULL, NULL, '-1', '1,', 0, 'none', 1, '127.0.0.1', NULL, 0, '', '2021-10-05 05:02:38', '0x3c62129c056Dc9daf221c50f4A5015bc9c2Be239'),
(5, 'Hello', 'killer1223', '$2y$10$RuHEphICqvsqAxDMXfCqwu7EEAQwa.eK21HuQ2Km08hDp7LIcKhCu', 0, 0, 0, 0, 200000, NULL, NULL, '-1', '1,', 9, 'none', 1, '127.0.0.1', NULL, 0, '', '2021-10-05 05:20:12', '0xA17D0240c839e5461FD897A943080E3420156D40'),
(6, 'helloworld', 'killer123456', '$2y$10$Bm9OtQ3xfvNPF7y5gNnaV.HYgcDYrID3rMq4Ge1p8NZsLRJyRBMN6', 0, 0, 0, 0, 200000, NULL, NULL, '-1', '1,', 0, 'none', 1, '127.0.0.1', NULL, 0, '', '2021-10-06 06:42:16', '0x77b215fb0eC1325Cc31C07eb6A63935F2e9aE00D');

-- --------------------------------------------------------

--
-- Table structure for table `bl_game_weapons`
--

CREATE TABLE `bl_game_weapons` (
  `address` varchar(256) NOT NULL,
  `weapon_id` varchar(256) NOT NULL,
  `weapon_name` varchar(256) NOT NULL,
  `nft_id` varchar(256) NOT NULL,
  `weapon_type` int(11) NOT NULL,
  `damage` int(11) NOT NULL,
  `fire_rate` float NOT NULL,
  `reload_time` float NOT NULL,
  `shot_range` int(11) NOT NULL,
  `accurency` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `customizer` text NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bl_game_weapons`
--

INSERT INTO `bl_game_weapons` (`address`, `weapon_id`, `weapon_name`, `nft_id`, `weapon_type`, `damage`, `fire_rate`, `reload_time`, `shot_range`, `accurency`, `weight`, `customizer`, `price`) VALUES
('0x09d738A9714ef9A7907EF39A1ca0E004C6EfFd68', '1', 'Colt M1911', '123', 3, 30, 0.092, 2.2, 550, 2, 2, '0,0,0,0,0', 500),
('0x09d738A9714ef9A7907EF39A1ca0E004C6EfFd68', '8', 'MP5K', '123456789', 1, 40, 0.086, 2.7, 200, 2, 2, '2,0,0,0,1', 800),
('0x09d738A9714ef9A7907EF39A1ca0E004C6EfFd68', '7', 'FN FNC', '13246798', 1, 30, 0.09, 2.2, 700, 2, 3, '0,0,0,0,0', 1400),
('0x09d738A9714ef9A7907EF39A1ca0E004C6EfFd68', '13', 'ARTIC', '2365', 8, 10, 0.05, 0.7, 50, 1, 1, '', 200),
('0x09d738A9714ef9A7907EF39A1ca0E004C6EfFd68', '14', 'TOXI', '236588', 8, 5, 0.025, 0.35, 25, 1, 1, '0,0,0,0,0', 100),
('0x09d738A9714ef9A7907EF39A1ca0E004C6EfFd68', '2', 'SDASS MARTIAL', '256', 0, 50, 0.45, 2.4, 100, 1, 1, '6,0,0,0,4', 1000),
('0x09d738A9714ef9A7907EF39A1ca0E004C6EfFd68', '4', 'Dragonov SVD', '423', 3, 100, 0.6, 3, 800, 5, 3, '2,2,0,0,1', 3000),
('0x09d738A9714ef9A7907EF39A1ca0E004C6EfFd68', '5', 'Knife', '456', 6, 60, 0.07, 1, 2, 1, 1, '0,0,0,0,1', 30),
('0x09d738A9714ef9A7907EF39A1ca0E004C6EfFd68', '6', 'M32 MGL', '467981324', 7, 75, 0.092, 5.2, 300, 1, 4, '0,0,0,0,0', 2500),
('0x09d738A9714ef9A7907EF39A1ca0E004C6EfFd68', '0', 'Bushmaster ACR', '468794', 3, 30, 0.092, 2.2, 550, 2, 2, '0,0,0,0,0', 1500),
('0xf48B5A9b7F76E34065be0D91DC2A9A517534817b', '0', 'Bushmaster ACR', '46879416', 3, 30, 0.092, 2.2, 550, 2, 2, '0,0,0,0,0', 1500),
('0x09d738A9714ef9A7907EF39A1ca0E004C6EfFd68', '2', 'SDASS MARTIAL', '468978', 0, 50, 0.45, 2.4, 100, 1, 1, '1,0,0,0,2', 1000),
('0x09d738A9714ef9A7907EF39A1ca0E004C6EfFd68', '9', 'Steyr TMP', '49157913', 1, 30, 0.085, 2.7, 200, 2, 2, '0,0,0,0,0', 800),
('0xf48B5A9b7F76E34065be0D91DC2A9A517534817b', '6', 'M32 MGL', '5498794', 7, 75, 0.07, 1, 2, 1, 1, '0,0,0,0,0', 2500);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bl_game_bans`
--
ALTER TABLE `bl_game_bans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_game_purchases`
--
ALTER TABLE `bl_game_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_game_tickets`
--
ALTER TABLE `bl_game_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_game_users`
--
ALTER TABLE `bl_game_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_2` (`name`),
  ADD KEY `name` (`name`),
  ADD KEY `nick` (`nick`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `bl_game_weapons`
--
ALTER TABLE `bl_game_weapons`
  ADD UNIQUE KEY `nft_id` (`nft_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bl_game_bans`
--
ALTER TABLE `bl_game_bans`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_game_purchases`
--
ALTER TABLE `bl_game_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_game_tickets`
--
ALTER TABLE `bl_game_tickets`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_game_users`
--
ALTER TABLE `bl_game_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
