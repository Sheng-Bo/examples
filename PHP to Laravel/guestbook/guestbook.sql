-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2020 年 05 月 17 日 21:54
-- 伺服器版本： 10.4.11-MariaDB
-- PHP 版本： 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `guestbook`
--

-- --------------------------------------------------------

--
-- 資料表結構 `guestbook`
--

CREATE TABLE `guestbook` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `guestbook`
--

INSERT INTO `guestbook` (`id`, `name`, `message`, `created_at`) VALUES
(1, '聖博', '大家好，我叫陳聖博。', '2020-05-03 03:07:36'),
(2, '王小明', '嗨，你好，我是王小明。', '2020-05-03 03:26:38'),
(11, '大米', '老鼠在哪裡?', '2020-05-09 18:17:17'),
(14, '大米', 'd', '2020-05-09 18:20:25'),
(15, '大米', '老鼠在哪裡?', '2020-05-09 18:20:29'),
(16, '大米', '老鼠在哪裡?', '2020-05-09 18:20:34'),
(17, '大米', '老鼠在哪裡?', '2020-05-09 18:21:34'),
(18, '大米', '老鼠在哪裡?', '2020-05-09 18:21:38'),
(19, '大米', '老鼠在哪裡?', '2020-05-09 18:21:45'),
(20, '12', 'd', '2020-05-09 18:21:52'),
(21, '阿寶', '你好我是阿寶', '2020-05-10 08:26:19'),
(22, '我是小明', '大家好', '2020-05-10 09:03:43');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `guestbook`
--
ALTER TABLE `guestbook`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `guestbook`
--
ALTER TABLE `guestbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
