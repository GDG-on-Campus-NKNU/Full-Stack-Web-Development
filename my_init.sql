-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2025 年 05 月 05 日 12:16
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `full_stack_web_development`
--

-- --------------------------------------------------------

--
-- 資料表結構 `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `accounts`
--

INSERT INTO `accounts` (`id`, `email`, `name`, `password`, `role`, `created_at`) VALUES
(1, 'ptyc4076@gmail.com', 'Bernie', '$2a$12$E1VJuINsCP8jjlqQXOnSq.exWWfRD4mEl6BtalXTSpNpZpj/HyuU6', 'admin', '2025-04-07 08:04:37'),
(2, 'test@gmail.com', 'Test', '$2b$10$rFMBV.8tBCiCa/IAsRyefOssgqk1ZvyjSKIWrFxW5PWjThnf/cCg2', 'user', '2025-04-08 09:12:16');

-- --------------------------------------------------------

--
-- 資料表結構 `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `log_type` enum('INFO','WARNING','ERROR') NOT NULL,
  `module` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `logs`
--

INSERT INTO `logs` (`id`, `log_type`, `module`, `message`, `created_at`) VALUES
(8, 'INFO', 'users', 'Fetched all users', '2025-03-03 19:36:46'),
(9, 'INFO', 'orders', 'Fetched all orders', '2025-03-03 19:39:42'),
(10, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-03-23 12:26:34'),
(11, 'INFO', 'services', 'Fetched all services', '2025-03-23 12:26:43'),
(12, 'INFO', 'services', 'Fetched all services', '2025-03-23 12:26:43'),
(13, 'INFO', 'users', 'Fetched all users', '2025-03-23 12:51:02'),
(14, 'INFO', 'services', 'Fetched all services', '2025-03-23 12:51:02'),
(15, 'INFO', 'orders', 'Fetched all orders', '2025-03-23 12:51:02'),
(16, 'INFO', 'users', 'Fetched all users', '2025-03-23 12:51:02'),
(17, 'INFO', 'services', 'Fetched all services', '2025-03-23 12:51:02'),
(18, 'INFO', 'orders', 'Fetched all orders', '2025-03-23 12:51:02'),
(19, 'INFO', 'orders', 'Fetched all orders', '2025-03-23 12:52:19'),
(20, 'INFO', 'users', 'Fetched all users', '2025-03-23 13:30:57'),
(21, 'INFO', 'services', 'Fetched all services', '2025-03-23 13:30:57'),
(22, 'INFO', 'orders', 'Fetched all orders', '2025-03-23 13:30:57'),
(23, 'INFO', 'users', 'Fetched all users', '2025-03-23 13:30:57'),
(24, 'INFO', 'orders', 'Fetched all orders', '2025-03-23 13:30:57'),
(25, 'INFO', 'services', 'Fetched all services', '2025-03-23 13:30:57'),
(26, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-03-23 14:02:08'),
(27, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-03-23 14:02:09'),
(28, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-03-23 14:02:39'),
(29, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-03-23 14:04:21'),
(30, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-03-23 14:14:17'),
(31, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-03-24 02:51:30'),
(32, 'INFO', 'users', 'Fetched all users', '2025-03-24 02:51:42'),
(33, 'INFO', 'users', 'Fetched all users', '2025-03-24 02:51:42'),
(34, 'INFO', 'services', 'Fetched all services', '2025-03-24 02:51:47'),
(35, 'INFO', 'services', 'Fetched all services', '2025-03-24 02:51:47'),
(36, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 02:51:51'),
(37, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 02:51:51'),
(38, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-03-24 03:00:01'),
(39, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-03-24 03:00:42'),
(40, 'INFO', 'users', 'Fetched all users', '2025-03-24 03:01:25'),
(41, 'INFO', 'users', 'Fetched all users', '2025-03-24 03:01:25'),
(42, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:01:28'),
(43, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:01:28'),
(44, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 03:01:30'),
(45, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 03:01:30'),
(46, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:01:36'),
(47, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:01:36'),
(48, 'INFO', 'users', 'Fetched all users', '2025-03-24 03:01:37'),
(49, 'INFO', 'users', 'Fetched all users', '2025-03-24 03:01:37'),
(50, 'INFO', 'users', 'Fetched all users', '2025-03-24 03:02:09'),
(51, 'INFO', 'users', 'Fetched all users', '2025-03-24 03:02:09'),
(52, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:02:12'),
(53, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:02:12'),
(54, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 03:02:14'),
(55, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 03:02:14'),
(56, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:02:16'),
(57, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:02:16'),
(58, 'INFO', 'users', 'Fetched all users', '2025-03-24 03:02:19'),
(59, 'INFO', 'users', 'Fetched all users', '2025-03-24 03:02:19'),
(60, 'INFO', 'users', 'Fetched all users', '2025-03-24 03:02:22'),
(61, 'INFO', 'users', 'Fetched all users', '2025-03-24 03:02:22'),
(62, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:02:24'),
(63, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:02:24'),
(64, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 03:02:25'),
(65, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 03:02:25'),
(66, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:02:26'),
(67, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:02:26'),
(68, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 03:02:27'),
(69, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 03:02:27'),
(70, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:02:28'),
(71, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:02:29'),
(72, 'INFO', 'users', 'Fetched all users', '2025-03-24 03:02:29'),
(73, 'INFO', 'users', 'Fetched all users', '2025-03-24 03:02:29'),
(74, 'INFO', 'users', 'Fetched all users', '2025-03-24 03:02:49'),
(75, 'INFO', 'users', 'Fetched all users', '2025-03-24 03:02:49'),
(76, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:02:57'),
(77, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:02:57'),
(78, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 03:03:08'),
(79, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 03:03:08'),
(80, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 03:03:16'),
(81, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 03:03:16'),
(82, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-03-24 03:38:35'),
(83, 'INFO', 'users', 'Fetched all users', '2025-03-24 03:39:01'),
(84, 'INFO', 'users', 'Fetched all users', '2025-03-24 03:39:01'),
(85, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:39:09'),
(86, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:39:09'),
(87, 'INFO', 'users', 'Fetched all users', '2025-03-24 03:39:12'),
(88, 'INFO', 'users', 'Fetched all users', '2025-03-24 03:39:12'),
(89, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:39:14'),
(90, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:39:14'),
(91, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 03:39:33'),
(92, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 03:39:33'),
(93, 'INFO', 'users', 'Fetched all users', '2025-03-24 03:39:50'),
(94, 'INFO', 'users', 'Fetched all users', '2025-03-24 03:39:50'),
(95, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:39:53'),
(96, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:39:53'),
(97, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:39:57'),
(98, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:39:57'),
(99, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 03:39:59'),
(100, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 03:39:59'),
(101, 'INFO', 'users', 'Fetched all users', '2025-03-24 03:40:04'),
(102, 'INFO', 'users', 'Fetched all users', '2025-03-24 03:40:04'),
(103, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:40:09'),
(104, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:40:09'),
(105, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 03:40:12'),
(106, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 03:40:12'),
(107, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:40:19'),
(108, 'INFO', 'services', 'Fetched all services', '2025-03-24 03:40:19'),
(109, 'INFO', 'users', 'Fetched all users', '2025-03-24 03:40:23'),
(110, 'INFO', 'users', 'Fetched all users', '2025-03-24 03:40:23'),
(111, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 03:40:30'),
(112, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 03:40:30'),
(113, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:21:59'),
(114, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:21:59'),
(115, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:22:03'),
(116, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:22:03'),
(117, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:22:07'),
(118, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:22:07'),
(119, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:22:12'),
(120, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:22:12'),
(121, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:23:02'),
(122, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:23:02'),
(123, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:23:05'),
(124, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:23:05'),
(125, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:23:07'),
(126, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:23:07'),
(127, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:25:46'),
(128, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:25:46'),
(129, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:26:59'),
(130, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:26:59'),
(131, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:28:48'),
(132, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:28:48'),
(133, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:28:49'),
(134, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:28:49'),
(135, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:28:50'),
(136, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:28:50'),
(137, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:28:50'),
(138, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:28:50'),
(139, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:28:51'),
(140, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:28:51'),
(141, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:29:15'),
(142, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:29:15'),
(143, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:29:16'),
(144, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:29:16'),
(145, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:29:17'),
(146, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:29:17'),
(147, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:29:18'),
(148, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:29:18'),
(149, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:29:19'),
(150, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:29:19'),
(151, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:29:20'),
(152, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:29:20'),
(153, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:29:21'),
(154, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:29:21'),
(155, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:29:21'),
(156, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:29:21'),
(157, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:29:22'),
(158, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:29:22'),
(159, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:29:23'),
(160, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:29:23'),
(161, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:29:24'),
(162, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:29:24'),
(163, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:29:25'),
(164, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:29:25'),
(165, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:29:25'),
(166, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:29:25'),
(167, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:30:10'),
(168, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:30:10'),
(169, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:30:16'),
(170, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:30:16'),
(171, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:30:17'),
(172, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:30:17'),
(173, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:30:19'),
(174, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:30:19'),
(175, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:38:26'),
(176, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:38:26'),
(177, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:38:27'),
(178, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:38:28'),
(179, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:41:52'),
(180, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:41:52'),
(181, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:41:54'),
(182, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:41:54'),
(183, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:42:11'),
(184, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:42:11'),
(185, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:42:11'),
(186, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:42:20'),
(187, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:42:20'),
(188, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:42:24'),
(189, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:42:24'),
(190, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:42:26'),
(191, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:42:26'),
(192, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:42:27'),
(193, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:42:27'),
(194, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:42:29'),
(195, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:42:29'),
(196, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:51:28'),
(197, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:51:28'),
(198, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:51:31'),
(199, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:51:31'),
(200, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:51:32'),
(201, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:51:32'),
(202, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:58:30'),
(203, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:58:30'),
(204, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-03-24 11:59:02'),
(205, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:59:03'),
(206, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:59:03'),
(207, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:59:05'),
(208, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:59:05'),
(209, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:59:08'),
(210, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:59:08'),
(211, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:59:09'),
(212, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:59:09'),
(213, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:59:12'),
(214, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:59:12'),
(215, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:59:23'),
(216, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:59:23'),
(217, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:59:26'),
(218, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:59:26'),
(219, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:59:27'),
(220, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:59:27'),
(221, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:59:28'),
(222, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 11:59:28'),
(223, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:59:33'),
(224, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:59:33'),
(225, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:59:35'),
(226, 'INFO', 'users', 'Fetched all users', '2025-03-24 11:59:35'),
(227, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:59:38'),
(228, 'INFO', 'services', 'Fetched all services', '2025-03-24 11:59:38'),
(229, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-03-24 12:50:15'),
(230, 'INFO', 'users', 'Fetched all users', '2025-03-24 12:50:16'),
(231, 'INFO', 'users', 'Fetched all users', '2025-03-24 12:50:16'),
(232, 'INFO', 'services', 'Fetched all services', '2025-03-24 12:50:26'),
(233, 'INFO', 'services', 'Fetched all services', '2025-03-24 12:50:26'),
(234, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 12:50:27'),
(235, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 12:50:27'),
(236, 'INFO', 'users', 'Fetched all users', '2025-03-24 12:50:29'),
(237, 'INFO', 'users', 'Fetched all users', '2025-03-24 12:50:29'),
(238, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 12:50:30'),
(239, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 12:50:30'),
(240, 'INFO', 'services', 'Fetched all services', '2025-03-24 12:50:31'),
(241, 'INFO', 'services', 'Fetched all services', '2025-03-24 12:50:31'),
(242, 'INFO', 'users', 'Fetched all users', '2025-03-24 13:48:51'),
(243, 'INFO', 'users', 'Fetched all users', '2025-03-24 13:48:51'),
(244, 'INFO', 'services', 'Fetched all services', '2025-03-24 13:48:55'),
(245, 'INFO', 'services', 'Fetched all services', '2025-03-24 13:48:55'),
(246, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 13:48:57'),
(247, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 13:48:57'),
(248, 'INFO', 'users', 'Fetched all users', '2025-03-24 13:49:00'),
(249, 'INFO', 'users', 'Fetched all users', '2025-03-24 13:49:00'),
(250, 'INFO', 'users', 'User Bernie created', '2025-03-24 13:49:10'),
(251, 'INFO', 'users', 'Fetched all users', '2025-03-24 13:49:10'),
(252, 'INFO', 'users', 'Fetched all users', '2025-03-24 13:49:15'),
(253, 'INFO', 'users', 'Fetched all users', '2025-03-24 13:49:15'),
(254, 'INFO', 'users', 'Fetched all users', '2025-03-24 13:50:39'),
(255, 'INFO', 'users', 'Fetched all users', '2025-03-24 13:50:39'),
(256, 'INFO', 'services', 'Fetched all services', '2025-03-24 13:50:43'),
(257, 'INFO', 'services', 'Fetched all services', '2025-03-24 13:50:43'),
(258, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 13:50:46'),
(259, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 13:50:46'),
(260, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 13:50:48'),
(261, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 13:50:48'),
(262, 'INFO', 'users', 'Fetched all users', '2025-03-24 13:50:51'),
(263, 'INFO', 'users', 'Fetched all users', '2025-03-24 13:50:51'),
(264, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 13:50:54'),
(265, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 13:50:54'),
(266, 'INFO', 'services', 'Fetched all services', '2025-03-24 13:50:55'),
(267, 'INFO', 'services', 'Fetched all services', '2025-03-24 13:50:55'),
(268, 'INFO', 'services', 'Fetched all services', '2025-03-24 13:50:56'),
(269, 'INFO', 'services', 'Fetched all services', '2025-03-24 13:50:56'),
(270, 'INFO', 'users', 'Fetched all users', '2025-03-24 13:50:59'),
(271, 'INFO', 'users', 'Fetched all users', '2025-03-24 13:50:59'),
(272, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 13:51:02'),
(273, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 13:51:02'),
(274, 'INFO', 'users', 'Fetched all users', '2025-03-24 13:51:26'),
(275, 'INFO', 'users', 'Fetched all users', '2025-03-24 13:51:26'),
(276, 'INFO', 'services', 'Fetched all services', '2025-03-24 13:51:27'),
(277, 'INFO', 'services', 'Fetched all services', '2025-03-24 13:51:27'),
(278, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 13:51:30'),
(279, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 13:51:30'),
(280, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 13:51:31'),
(281, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 13:51:31'),
(282, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-03-24 13:51:55'),
(283, 'INFO', 'users', 'Fetched all users', '2025-03-24 14:05:33'),
(284, 'INFO', 'users', 'Fetched all users', '2025-03-24 14:05:33'),
(285, 'INFO', 'services', 'Fetched all services', '2025-03-24 14:05:35'),
(286, 'INFO', 'services', 'Fetched all services', '2025-03-24 14:05:35'),
(287, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 14:05:36'),
(288, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 14:05:36'),
(289, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 14:06:31'),
(290, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 14:06:31'),
(291, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 14:06:34'),
(292, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 14:06:34'),
(293, 'INFO', 'services', 'Fetched all services', '2025-03-24 14:06:34'),
(294, 'INFO', 'services', 'Fetched all services', '2025-03-24 14:06:35'),
(295, 'INFO', 'users', 'Fetched all users', '2025-03-24 14:06:36'),
(296, 'INFO', 'users', 'Fetched all users', '2025-03-24 14:06:36'),
(297, 'INFO', 'users', 'Fetched all users', '2025-03-24 14:06:37'),
(298, 'INFO', 'users', 'Fetched all users', '2025-03-24 14:06:37'),
(299, 'INFO', 'users', 'Fetched all users', '2025-03-24 15:06:33'),
(300, 'INFO', 'users', 'Fetched all users', '2025-03-24 15:06:33'),
(301, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-03-24 16:25:36'),
(302, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 16:25:38'),
(303, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 16:25:38'),
(304, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:28:09'),
(305, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:28:09'),
(306, 'INFO', 'users', 'Fetched all users', '2025-03-24 16:28:11'),
(307, 'INFO', 'users', 'Fetched all users', '2025-03-24 16:28:11'),
(308, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:28:12'),
(309, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:28:12'),
(310, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 16:28:13'),
(311, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 16:28:13'),
(312, 'INFO', 'users', 'Fetched all users', '2025-03-24 16:28:15'),
(313, 'INFO', 'users', 'Fetched all users', '2025-03-24 16:28:15'),
(314, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 16:28:58'),
(315, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 16:28:58'),
(316, 'INFO', 'users', 'Fetched all users', '2025-03-24 16:51:51'),
(317, 'INFO', 'users', 'Fetched all users', '2025-03-24 16:51:51'),
(318, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:51:55'),
(319, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:51:55'),
(320, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 16:51:57'),
(321, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 16:51:57'),
(322, 'INFO', 'users', 'Fetched all users', '2025-03-24 16:51:59'),
(323, 'INFO', 'users', 'Fetched all users', '2025-03-24 16:51:59'),
(324, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 16:52:29'),
(325, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 16:52:29'),
(326, 'INFO', 'users', 'Fetched all users', '2025-03-24 16:52:31'),
(327, 'INFO', 'users', 'Fetched all users', '2025-03-24 16:52:31'),
(328, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:52:32'),
(329, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:52:32'),
(330, 'INFO', 'users', 'Fetched all users', '2025-03-24 16:53:25'),
(331, 'INFO', 'users', 'Fetched all users', '2025-03-24 16:53:25'),
(332, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:53:32'),
(333, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:53:32'),
(334, 'INFO', 'users', 'Fetched all users', '2025-03-24 16:53:39'),
(335, 'INFO', 'users', 'Fetched all users', '2025-03-24 16:53:39'),
(336, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:53:42'),
(337, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:53:42'),
(338, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:53:43'),
(339, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:53:43'),
(340, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:53:44'),
(341, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:53:44'),
(342, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 16:53:45'),
(343, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 16:53:45'),
(344, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:53:47'),
(345, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:53:47'),
(346, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:53:48'),
(347, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:53:48'),
(348, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 16:53:48'),
(349, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 16:53:48'),
(350, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:53:52'),
(351, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:53:52'),
(352, 'INFO', 'users', 'Fetched all users', '2025-03-24 16:53:53'),
(353, 'INFO', 'users', 'Fetched all users', '2025-03-24 16:53:53'),
(354, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:53:53'),
(355, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:53:53'),
(356, 'INFO', 'users', 'Fetched all users', '2025-03-24 16:53:54'),
(357, 'INFO', 'users', 'Fetched all users', '2025-03-24 16:53:54'),
(358, 'INFO', 'users', 'Fetched all users', '2025-03-24 16:54:11'),
(359, 'INFO', 'users', 'Fetched all users', '2025-03-24 16:54:11'),
(360, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:54:13'),
(361, 'INFO', 'services', 'Fetched all services', '2025-03-24 16:54:13'),
(362, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 16:54:14'),
(363, 'INFO', 'orders', 'Fetched all orders', '2025-03-24 16:54:14'),
(364, 'INFO', 'services', 'Fetched all services', '2025-03-24 18:59:02'),
(365, 'INFO', 'services', 'Fetched all services', '2025-03-24 18:59:02'),
(366, 'INFO', 'users', 'Fetched all users', '2025-03-25 07:58:41'),
(367, 'INFO', 'users', 'Fetched all users', '2025-03-25 07:58:41'),
(368, 'INFO', 'services', 'Fetched all services', '2025-03-25 07:58:43'),
(369, 'INFO', 'services', 'Fetched all services', '2025-03-25 07:58:43'),
(370, 'INFO', 'services', 'Fetched all services', '2025-03-25 10:54:27'),
(371, 'INFO', 'services', 'Fetched all services', '2025-03-25 10:54:27'),
(372, 'INFO', 'users', 'Fetched all users', '2025-03-25 11:36:32'),
(373, 'INFO', 'users', 'Fetched all users', '2025-03-25 11:36:32'),
(374, 'INFO', 'services', 'Fetched all services', '2025-03-25 11:36:35'),
(375, 'INFO', 'services', 'Fetched all services', '2025-03-25 11:36:35'),
(376, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-03-25 11:47:33'),
(377, 'INFO', 'users', 'Fetched all users', '2025-03-25 11:47:38'),
(378, 'INFO', 'users', 'Fetched all users', '2025-03-25 11:47:38'),
(379, 'INFO', 'users', 'Fetched all users', '2025-03-25 12:48:09'),
(380, 'INFO', 'users', 'Fetched all users', '2025-03-25 12:48:09'),
(381, 'WARNING', 'users', 'Attempted to create a user with missing fields', '2025-03-25 12:48:23'),
(382, 'INFO', 'orders', 'Fetched all orders', '2025-03-25 12:48:28'),
(383, 'INFO', 'orders', 'Fetched all orders', '2025-03-25 12:48:28'),
(384, 'ERROR', 'orders', 'Failed to create order: Cannot add or update a child row: a foreign key constraint fails (`full_stack_web_development`.`orders`, CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`))', '2025-03-25 12:48:34'),
(385, 'INFO', 'orders', 'Order created', '2025-03-25 12:48:38'),
(386, 'INFO', 'orders', 'Fetched all orders', '2025-03-25 12:48:38'),
(387, 'INFO', 'services', 'Fetched all services', '2025-03-25 12:48:48'),
(388, 'INFO', 'services', 'Fetched all services', '2025-03-25 12:48:48'),
(389, 'INFO', 'users', 'Fetched all users', '2025-03-25 12:48:53'),
(390, 'INFO', 'users', 'Fetched all users', '2025-03-25 12:48:53'),
(391, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-04-07 08:01:23'),
(392, 'INFO', 'users', 'Fetched all users', '2025-04-07 08:01:41'),
(393, 'INFO', 'users', 'Fetched all users', '2025-04-07 08:01:41'),
(394, 'INFO', 'services', 'Fetched all services', '2025-04-07 08:01:44'),
(395, 'INFO', 'services', 'Fetched all services', '2025-04-07 08:01:44'),
(396, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-04-07 08:53:35'),
(397, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-04-07 09:00:02'),
(398, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-04-07 09:05:54'),
(399, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-04-07 09:11:18'),
(400, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-04-07 09:31:34'),
(401, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-04-07 09:40:19'),
(402, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-04-07 09:42:11'),
(403, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-04-07 09:43:44'),
(404, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-04-07 09:45:15'),
(405, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-04-07 09:48:28'),
(406, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-04-07 09:50:26'),
(407, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-04-07 09:51:54'),
(408, 'INFO', 'users', 'Fetched all users', '2025-04-07 09:51:56'),
(409, 'INFO', 'users', 'Fetched all users', '2025-04-07 09:51:56'),
(410, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-04-07 09:53:39'),
(411, 'INFO', 'users', 'Fetched all users', '2025-04-07 09:53:44'),
(412, 'INFO', 'users', 'Fetched all users', '2025-04-07 09:53:44'),
(413, 'INFO', 'services', 'Fetched all services', '2025-04-07 09:53:46'),
(414, 'INFO', 'services', 'Fetched all services', '2025-04-07 09:53:46'),
(415, 'INFO', 'orders', 'Fetched all orders', '2025-04-07 09:53:48'),
(416, 'INFO', 'orders', 'Fetched all orders', '2025-04-07 09:53:48'),
(417, 'INFO', 'users', 'Fetched all users', '2025-04-07 09:54:08'),
(418, 'INFO', 'users', 'Fetched all users', '2025-04-07 09:54:08'),
(419, 'INFO', 'services', 'Fetched all services', '2025-04-07 09:54:11'),
(420, 'INFO', 'services', 'Fetched all services', '2025-04-07 09:54:11'),
(421, 'INFO', 'users', 'Fetched all users', '2025-04-07 09:59:43'),
(422, 'INFO', 'users', 'Fetched all users', '2025-04-07 09:59:43'),
(423, 'INFO', 'users', 'Fetched all users', '2025-04-07 10:06:09'),
(424, 'INFO', 'users', 'Fetched all users', '2025-04-07 10:06:09'),
(425, 'INFO', 'users', 'Fetched all users', '2025-04-07 10:22:54'),
(426, 'INFO', 'users', 'Fetched all users', '2025-04-07 10:22:54'),
(427, 'INFO', 'services', 'Fetched all services', '2025-04-07 10:22:57'),
(428, 'INFO', 'services', 'Fetched all services', '2025-04-07 10:22:57'),
(429, 'INFO', 'orders', 'Fetched all orders', '2025-04-07 10:23:00'),
(430, 'INFO', 'orders', 'Fetched all orders', '2025-04-07 10:23:00'),
(431, 'INFO', 'users', 'Fetched all users', '2025-04-07 10:23:02'),
(432, 'INFO', 'users', 'Fetched all users', '2025-04-07 10:23:02'),
(433, 'INFO', 'users', 'Fetched all users', '2025-04-07 10:23:50'),
(434, 'INFO', 'users', 'Fetched all users', '2025-04-07 10:23:50'),
(435, 'INFO', 'services', 'Fetched all services', '2025-04-07 10:23:57'),
(436, 'INFO', 'services', 'Fetched all services', '2025-04-07 10:23:57'),
(437, 'INFO', 'orders', 'Fetched all orders', '2025-04-07 10:23:59'),
(438, 'INFO', 'orders', 'Fetched all orders', '2025-04-07 10:23:59'),
(439, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-04-07 14:57:57'),
(440, 'INFO', 'users', 'Fetched all users', '2025-04-07 14:58:15'),
(441, 'INFO', 'users', 'Fetched all users', '2025-04-07 14:58:15'),
(442, 'INFO', 'services', 'Fetched all services', '2025-04-07 14:58:16'),
(443, 'INFO', 'services', 'Fetched all services', '2025-04-07 14:58:16'),
(444, 'INFO', 'orders', 'Fetched all orders', '2025-04-07 14:58:18'),
(445, 'INFO', 'orders', 'Fetched all orders', '2025-04-07 14:58:18'),
(446, 'INFO', 'users', 'Fetched all users', '2025-04-07 15:14:23'),
(447, 'INFO', 'users', 'Fetched all users', '2025-04-07 15:14:23'),
(448, 'INFO', 'orders', 'Fetched all orders', '2025-04-07 15:24:43'),
(449, 'INFO', 'users', 'Fetched all users', '2025-04-07 15:27:19'),
(450, 'INFO', 'users', 'Fetched all users', '2025-04-07 15:27:19'),
(451, 'INFO', 'users', 'Fetched all users', '2025-04-07 15:28:56'),
(452, 'INFO', 'users', 'Fetched all users', '2025-04-07 15:28:56'),
(453, 'INFO', 'services', 'Fetched all services', '2025-04-07 15:29:02'),
(454, 'INFO', 'services', 'Fetched all services', '2025-04-07 15:29:02'),
(455, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-04-07 16:19:11'),
(456, 'INFO', 'users', 'Fetched all users', '2025-04-07 16:19:39'),
(457, 'INFO', 'users', 'Fetched all users', '2025-04-07 16:19:39'),
(458, 'INFO', 'services', 'Fetched all services', '2025-04-07 16:19:57'),
(459, 'INFO', 'services', 'Fetched all services', '2025-04-07 16:19:57'),
(460, 'INFO', 'services', 'Fetched all services', '2025-04-07 16:20:02'),
(461, 'INFO', 'services', 'Fetched all services', '2025-04-07 16:20:02'),
(462, 'INFO', 'orders', 'Fetched all orders', '2025-04-07 16:20:10'),
(463, 'INFO', 'orders', 'Fetched all orders', '2025-04-07 16:20:10'),
(464, 'INFO', 'users', 'Fetched all users', '2025-04-08 05:34:31'),
(465, 'INFO', 'users', 'Fetched all users', '2025-04-08 05:34:31'),
(466, 'INFO', 'services', 'Fetched all services', '2025-04-08 05:34:46'),
(467, 'INFO', 'services', 'Fetched all services', '2025-04-08 05:34:46'),
(468, 'INFO', 'users', 'Fetched all users', '2025-04-08 06:53:52'),
(469, 'INFO', 'users', 'Fetched all users', '2025-04-08 06:53:52'),
(470, 'INFO', 'services', 'Fetched all services', '2025-04-08 06:53:55'),
(471, 'INFO', 'services', 'Fetched all services', '2025-04-08 06:53:55'),
(472, 'INFO', 'users', 'Fetched all users', '2025-04-08 06:53:58'),
(473, 'INFO', 'users', 'Fetched all users', '2025-04-08 06:53:58'),
(474, 'INFO', 'orders', 'Fetched all orders', '2025-04-08 06:54:02'),
(475, 'INFO', 'orders', 'Fetched all orders', '2025-04-08 06:54:02'),
(476, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-04-08 07:20:25'),
(477, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-04-08 09:08:41'),
(478, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-04-08 09:12:14'),
(479, 'INFO', 'users', 'Fetched all users', '2025-04-08 09:15:18'),
(480, 'INFO', 'users', 'Fetched all users', '2025-04-08 09:15:18'),
(481, 'INFO', 'users', 'Fetched all users', '2025-04-08 09:15:30'),
(482, 'INFO', 'users', 'Fetched all users', '2025-04-08 09:15:30'),
(483, 'INFO', 'server', 'Server started at http://localhost:3000', '2025-04-08 10:28:40'),
(484, 'INFO', 'users', 'Fetched all users', '2025-04-08 11:09:30'),
(485, 'INFO', 'users', 'Fetched all users', '2025-04-08 11:09:30'),
(486, 'INFO', 'users', 'Fetched all users', '2025-04-08 11:09:48'),
(487, 'INFO', 'users', 'Fetched all users', '2025-04-08 11:09:48'),
(488, 'INFO', 'server', 'Server started at http://localhost:4000', '2025-05-03 15:55:57'),
(489, 'INFO', 'server', 'Server started at http://localhost:4000', '2025-05-05 02:00:17'),
(490, 'INFO', 'server', 'Server started at http://localhost:4000', '2025-05-05 02:02:12'),
(491, 'INFO', 'server', 'Server started at http://localhost:4000', '2025-05-05 02:03:28'),
(492, 'INFO', 'server', 'Server started at http://localhost:4000', '2025-05-05 08:00:48'),
(493, 'INFO', 'server', 'Server started at http://localhost:4000', '2025-05-05 08:32:17'),
(494, 'INFO', 'server', 'Server started at http://localhost:4000', '2025-05-05 08:41:19'),
(495, 'INFO', 'server', 'Server started at http://localhost:4000', '2025-05-05 08:41:49'),
(496, 'INFO', 'users', 'Fetched all users', '2025-05-05 08:46:59'),
(497, 'INFO', 'users', 'Fetched all users', '2025-05-05 08:46:59'),
(498, 'INFO', 'users', 'Fetched all users', '2025-05-05 08:50:27'),
(499, 'INFO', 'users', 'Fetched all users', '2025-05-05 08:50:27'),
(500, 'INFO', 'services', 'Fetched all services', '2025-05-05 08:50:29'),
(501, 'INFO', 'services', 'Fetched all services', '2025-05-05 08:50:29'),
(502, 'INFO', 'orders', 'Fetched all orders', '2025-05-05 08:50:31'),
(503, 'INFO', 'orders', 'Fetched all orders', '2025-05-05 08:50:31'),
(504, 'INFO', 'users', 'Fetched all users', '2025-05-05 08:50:33'),
(505, 'INFO', 'users', 'Fetched all users', '2025-05-05 08:50:33'),
(506, 'INFO', 'users', 'Fetched all users', '2025-05-05 08:57:24'),
(507, 'INFO', 'users', 'Fetched all users', '2025-05-05 08:57:24'),
(508, 'INFO', 'orders', 'Fetched all orders', '2025-05-05 09:00:56'),
(509, 'INFO', 'orders', 'Fetched all orders', '2025-05-05 09:00:56'),
(510, 'INFO', 'server', 'Server started at http://localhost:4000', '2025-05-05 09:04:42'),
(511, 'INFO', 'server', 'Server started at http://localhost:4000', '2025-05-05 09:10:36'),
(512, 'INFO', 'server', 'Server started at http://localhost:4000', '2025-05-05 09:12:14'),
(513, 'INFO', 'users', 'Fetched all users', '2025-05-05 09:12:35'),
(514, 'INFO', 'users', 'Fetched all users', '2025-05-05 09:12:35'),
(515, 'INFO', 'services', 'Fetched all services', '2025-05-05 09:12:37'),
(516, 'INFO', 'services', 'Fetched all services', '2025-05-05 09:12:37'),
(517, 'INFO', 'users', 'Fetched all users', '2025-05-05 09:15:42'),
(518, 'INFO', 'users', 'Fetched all users', '2025-05-05 09:15:42'),
(519, 'INFO', 'users', 'Fetched all users', '2025-05-05 09:17:27'),
(520, 'INFO', 'users', 'Fetched all users', '2025-05-05 09:17:27'),
(521, 'INFO', 'server', 'Server started at http://localhost:4000', '2025-05-05 09:18:53'),
(522, 'INFO', 'server', 'Server started at http://localhost:4000', '2025-05-05 09:22:46'),
(523, 'INFO', 'server', 'Server started at http://localhost:4000', '2025-05-05 09:24:27'),
(524, 'INFO', 'server', 'Server started at http://localhost:4000', '2025-05-05 09:29:01'),
(525, 'INFO', 'server', 'Server started at http://localhost:4000', '2025-05-05 09:29:50'),
(526, 'INFO', 'server', 'Server started at http://localhost:4000', '2025-05-05 09:29:52'),
(527, 'INFO', 'server', 'Server started at http://localhost:4000', '2025-05-05 09:30:10'),
(528, 'INFO', 'server', 'Server started at http://localhost:4000', '2025-05-05 09:30:24'),
(529, 'INFO', 'users', 'Fetched all users', '2025-05-05 09:30:47'),
(530, 'INFO', 'server', 'Server started at http://localhost:4000', '2025-05-05 09:31:12'),
(531, 'INFO', 'server', 'Server started at http://localhost:4000', '2025-05-05 09:33:34'),
(532, 'INFO', 'server', 'Server started at http://localhost:4000', '2025-05-05 09:35:03');

-- --------------------------------------------------------

--
-- 資料表結構 `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `service_id`, `order_date`) VALUES
(1, 1, 1, '2024-03-01 02:30:00'),
(2, 1, 3, '2024-03-02 06:15:00'),
(3, 2, 2, '2024-03-03 01:00:00'),
(4, 2, 5, '2024-03-05 08:45:00'),
(5, 3, 4, '2024-03-06 03:20:00'),
(6, 3, 5, '2025-03-02 19:09:55'),
(8, 3, 3, '2025-03-25 12:48:38');

-- --------------------------------------------------------

--
-- 資料表結構 `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `price`, `created_at`) VALUES
(1, '網頁開發', '提供網站設計服務', 5000.00, '2025-03-02 13:15:43'),
(2, '伺服器架設', '協助架設雲端與本地伺服器', 8000.00, '2025-03-02 13:16:20'),
(3, 'SEO 優化', '提升網站搜尋排名，優化網站流量', 3000.00, '2025-03-02 15:09:36'),
(4, 'APP 開發', 'iOS & Android 應用程式開發', 12000.00, '2025-03-02 15:09:36'),
(5, '數據分析', '提供商業數據分析與報告', 7000.00, '2025-03-02 15:09:36');

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `created_at`) VALUES
(1, 'Alice', 'alice@example.com', '2025-03-02 13:14:29'),
(2, 'Bob', 'boberoson@gmail.com', '2025-03-02 13:15:02'),
(3, 'Charlie', 'charlie@example.com', '2025-03-02 15:09:10'),
(9, 'Stella', 'ptyc0224@gmail.com', '2025-03-04 11:38:58'),
(10, 'Bernie', 'ptyc4076@gmail.com', '2025-03-24 13:49:10');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- 資料表索引 `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `service_id` (`service_id`);

--
-- 資料表索引 `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=533;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
