-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2022 at 11:44 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `todo_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id`, `title`, `description`, `date`) VALUES
(1, 'shop task', 'this is a simple', '2022-03-23 09:53:41'),
(2, 'Another tesk', 'this is some text', '2022-03-23 09:56:20'),
(3, 'travel', 'summer time', '2022-03-23 10:06:28'),
(4, 'asdasdas', 'asdasdasd', '2022-03-23 10:18:01'),
(5, 'rrrrr', 'rrrrr', '2022-03-23 10:20:23'),
(6, 'qqwqw', 'qwqwqw', '2022-03-23 10:22:09'),
(7, 'erwerwe', '33dssa', '2022-03-23 10:24:45');

-- --------------------------------------------------------

--
-- Table structure for table `todo`
--

CREATE TABLE `todo` (
  `id` int(11) NOT NULL,
  `taskId` int(11) NOT NULL,
  `todoInfo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `todo`
--

INSERT INTO `todo` (`id`, `taskId`, `todoInfo`) VALUES
(1, 1, 'buy yam'),
(2, 1, 'buy cola'),
(3, 2, '1'),
(4, 2, '2'),
(5, 2, '3'),
(6, 3, 'beach'),
(7, 3, 'waterwall'),
(8, 4, 'hello'),
(9, 5, 'rrrrrr'),
(10, 5, 'eeeeeee'),
(11, 6, 'qqqqwww'),
(12, 7, 'ewrewrwer'),
(13, 7, 'werewrwe');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `todo`
--
ALTER TABLE `todo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
