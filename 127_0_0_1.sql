-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2024 at 07:52 PM
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
-- Database: `employeems`
--
CREATE DATABASE IF NOT EXISTS `employeems` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `employeems`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(140) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`) VALUES
(36, 'Samarth', 'a3@g.com', '$2b$10$QvxXo1PONUcXcCl2Of2LE.R/zUwpS6DCbJvUSf4aIAHD1gUOMk.oe'),
(52, 'Pavithra N', 'pavithra123@gmail.com', '$2b$10$c4m2FlYc.SnrlZOInT/.LeutYGINPjEt09lSaxtEDOsW58vOun4JO');

--
-- Triggers `admin`
--
DELIMITER $$
CREATE TRIGGER `after_admin_insert` AFTER INSERT ON `admin` FOR EACH ROW INSERT INTO users (name, email, user_type) 
VALUES (NEW.name, NEW.email, 'admin')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(25, 'Software Engineer'),
(26, 'Full Stack Developer');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(150) NOT NULL,
  `bio` varchar(500) DEFAULT NULL,
  `batch` int(11) NOT NULL,
  `company` varchar(50) NOT NULL,
  `linkedin` varchar(100) NOT NULL,
  `image` varchar(60) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `email`, `password`, `bio`, `batch`, `company`, `linkedin`, `image`, `category_id`) VALUES
(1014, 'SHREYAS P', 'shreyasshet723@gmail.com', '$2b$10$3dVJmo7MtIWZONS/EHul5.hBP1JHkFNxEanBdmPFiUr7Cg5nvphau', 'trfytruytr', 2021, 'Wipro', 'https://www.linkedin.com/in/shreyas-p-67165222a/', 'image_1709533147886.jpg', 26),
(1018, 'rag', 'sergsg@g.com', '$2b$10$2DaXrAAicxAGVEJ647a9fO0xFVqLvHNjFy9QpDanlVfD8uYWnpSqm', NULL, 2312, 'efer', 'erger', 'image_1710885181569.png', 26);

--
-- Triggers `employee`
--
DELIMITER $$
CREATE TRIGGER `after_employee_insert` AFTER INSERT ON `employee` FOR EACH ROW INSERT INTO users (name, email, user_type) 
VALUES (NEW.name, NEW.email, 'employee')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `description` text DEFAULT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `date`, `description`, `admin_id`) VALUES
(26, 'Google', '2024-02-21', 'New', 36);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `content`, `timestamp`) VALUES
(116, 52, 'join now', '2024-03-20 03:06:47'),
(117, 52, 'okay 1 min', '2024-03-20 03:09:00'),
(118, 52, 'when will the meeting start?', '2024-03-20 03:15:14'),
(119, 52, 'fine', '2024-03-20 03:38:53'),
(123, 1014, 'n', '2024-03-20 22:22:27'),
(124, 1014, 'hii', '2024-03-20 22:39:33'),
(125, 1014, 'dgsgrt', '2024-03-20 22:40:09'),
(126, 1014, 'rtgrdtgrdth', '2024-03-20 22:40:11'),
(128, 1014, 'yaa', '2024-03-20 22:51:27'),
(129, 1014, 'ssf', '2024-03-20 22:52:14'),
(130, 1014, 'aeiiiiiii', '2024-03-20 22:52:52'),
(131, 1014, 'ok', '2024-03-20 22:54:01'),
(133, 1014, 'ergerg', '2024-03-20 23:08:47'),
(134, 1014, 'yhytyh', '2024-03-20 23:09:30'),
(135, 1014, 'rhytyh', '2024-03-20 23:09:33'),
(145, 36, 'okay sam', '2024-03-20 23:39:02'),
(146, 36, 'will join u tom', '2024-03-20 23:39:08'),
(147, 1014, 'yaa sure', '2024-03-20 23:40:04'),
(148, 36, 'kfyukfykfykfkkk', '2024-03-20 23:41:21'),
(149, 36, 'yaa', '2024-03-20 23:44:04'),
(150, 1014, 'then sir?', '2024-03-20 23:46:09'),
(151, 1014, 'when will the event start ?', '2024-03-20 23:46:25'),
(152, 1014, 'ok', '2024-03-20 23:46:46'),
(153, 36, 'no no', '2024-03-20 23:52:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `user_type` enum('admin','employee') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `user_type`) VALUES
(25, 'rag', 'sergsg@g.com', 'employee'),
(26, 'Sam', 'a1@g.com', 'admin'),
(27, 'Sam', 'a5@g.com', 'admin'),
(28, 'Sam', 'a5@g.com', 'admin'),
(29, 'Sam', 'a5@g.com', 'admin'),
(30, 'Sam', 'a5@g.com', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_admin_id` (`admin_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1019;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
