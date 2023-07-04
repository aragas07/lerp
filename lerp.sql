-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2023 at 09:31 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lerp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `position` varchar(100) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `profile` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `position`, `birth`, `users_id`, `profile`) VALUES
(1, NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `examinee`
--

CREATE TABLE `examinee` (
  `id` int(11) NOT NULL,
  `birth` date DEFAULT NULL,
  `idnumber` varchar(45) DEFAULT NULL,
  `birthplace` longtext DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `gender` varchar(7) DEFAULT NULL,
  `civil_status` varchar(45) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  `home_address` varchar(45) DEFAULT NULL,
  `school_last_attended` varchar(45) DEFAULT NULL,
  `school_address` longtext DEFAULT NULL,
  `first_option` varchar(255) DEFAULT NULL,
  `second_option` varchar(255) DEFAULT NULL,
  `third_option` varchar(255) DEFAULT NULL,
  `register_date` timestamp NULL DEFAULT NULL,
  `profile` longtext DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `examinee`
--

INSERT INTO `examinee` (`id`, `birth`, `idnumber`, `birthplace`, `religion`, `nationality`, `gender`, `civil_status`, `contact`, `home_address`, `school_last_attended`, `school_address`, `first_option`, `second_option`, `third_option`, `register_date`, `profile`, `users_id`, `year`) VALUES
(1, NULL, '2015-1506', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-09 05:09:49', NULL, 1, NULL),
(2, NULL, '2015-1507', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-09 06:42:11', NULL, 2, NULL),
(3, NULL, '2015-1508', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-22 08:42:41', NULL, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` int(11) NOT NULL,
  `examinee_id` varchar(45) NOT NULL,
  `gwa` double DEFAULT NULL,
  `entrance_exam` int(11) DEFAULT NULL,
  `mock_exam` double DEFAULT NULL,
  `locking` tinyint(1) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `files_id` varchar(45) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `examinee_id`, `gwa`, `entrance_exam`, `mock_exam`, `locking`, `year`, `files_id`, `name`) VALUES
(1, '2015-1580', 1.59167, NULL, 55.47, NULL, 2023, '1', NULL),
(2, '2015-1507', 1.99, NULL, 49.33, NULL, 2023, '1', NULL),
(3, '2015-1508', 2.26603, NULL, 38.93, NULL, 2023, '1', NULL),
(4, '2015-1509', 1.85667, NULL, 56.67, NULL, 2023, '1', NULL),
(5, '2015-1510', 1.975, NULL, 54.67, NULL, 2023, '1', NULL),
(6, '2015-1511', 1.9, NULL, 48.8, NULL, 2023, '1', NULL),
(7, '2015-1512', 1.91167, NULL, 50.53, NULL, 2023, '1', NULL),
(8, '2015-1513', 2.02667, NULL, 51.33, NULL, 2023, '1', NULL),
(9, '2015-1514', 1.88333, NULL, 51.6, NULL, 2023, '1', NULL),
(10, '2015-1515', 2.01, NULL, 53.73, NULL, 2023, '1', NULL),
(11, '2015-1516', 2.09667, NULL, 44.8, NULL, 2023, '1', NULL),
(12, '2015-1517', 1.925, NULL, 52, NULL, 2023, '1', NULL),
(13, '2015-1518', 2.06, NULL, 49.73, NULL, 2023, '1', NULL),
(14, '2015-1519', 1.88667, NULL, 56.8, NULL, 2023, '1', NULL),
(15, '2015-1520', 1.985, NULL, 45.87, NULL, 2023, '1', NULL),
(16, '2015-1521', 2.06333, NULL, 54.4, NULL, 2023, '1', NULL),
(17, '2015-1522', 1.975, NULL, 47.47, NULL, 2023, '1', NULL),
(18, '2015-1523', 1.97167, NULL, 52.93, NULL, 2023, '1', NULL),
(19, '2015-1524', 2.06, NULL, 45.47, NULL, 2023, '1', NULL),
(20, '2015-1525', 2.125, NULL, 37.87, NULL, 2023, '1', NULL),
(21, '2015-1526', 1.96, NULL, 53.47, NULL, 2023, '1', NULL),
(22, '2015-1527', 2.045, NULL, 49.07, NULL, 2023, '1', NULL),
(23, '2015-1528', 2.02, NULL, 51.07, NULL, 2023, '1', NULL),
(24, '2015-1529', 2.21, NULL, 35.6, NULL, 2023, '1', NULL),
(25, '2015-1530', 2.08833, NULL, 50.13, NULL, 2023, '1', NULL),
(26, '2015-1531', 2.25, NULL, 39.87, NULL, 2023, '1', NULL),
(27, '2015-1532', 2.12333, NULL, 45.33, NULL, 2023, '1', NULL),
(28, '2015-1533', 1.85667, NULL, 50.4, NULL, 2023, '1', NULL),
(29, '2015-1534', 2.025, NULL, 41.87, NULL, 2023, '1', NULL),
(30, '2015-1535', 2.235, NULL, 40.67, NULL, 2023, '1', NULL),
(31, '2015-1536', 2.38889, NULL, 47.73, NULL, 2023, '1', NULL),
(32, '2015-1580', 1.59167, NULL, 55.47, NULL, 2023, '2', NULL),
(33, '2015-1507', 1.99, NULL, 49.33, NULL, 2023, '2', NULL),
(34, '2015-1508', 2.26603, NULL, 38.93, NULL, 2023, '2', NULL),
(35, '2015-1509', 1.85667, NULL, 56.67, NULL, 2023, '2', NULL),
(36, '2015-1510', 1.975, NULL, 54.67, NULL, 2023, '2', NULL),
(37, '2015-1511', 1.9, NULL, 48.8, NULL, 2023, '2', NULL),
(38, '2015-1512', 1.91167, NULL, 50.53, NULL, 2023, '2', NULL),
(39, '2015-1513', 2.02667, NULL, 51.33, NULL, 2023, '2', NULL),
(40, '2015-1514', 1.88333, NULL, 51.6, NULL, 2023, '2', NULL),
(41, '2015-1515', 2.01, NULL, 53.73, NULL, 2023, '2', NULL),
(42, '2015-1516', 2.09667, NULL, 44.8, NULL, 2023, '2', NULL),
(43, '2015-1517', 1.925, NULL, 52, NULL, 2023, '2', NULL),
(44, '2015-1518', 2.06, NULL, 49.73, NULL, 2023, '2', NULL),
(45, '2015-1519', 1.88667, NULL, 56.8, NULL, 2023, '2', NULL),
(46, '2015-1520', 1.985, NULL, 45.87, NULL, 2023, '2', NULL),
(47, '2015-1521', 2.06333, NULL, 54.4, NULL, 2023, '2', NULL),
(48, '2015-1522', 1.975, NULL, 47.47, NULL, 2023, '2', NULL),
(49, '2015-1523', 1.97167, NULL, 52.93, NULL, 2023, '2', NULL),
(50, '2015-1524', 2.06, NULL, 45.47, NULL, 2023, '2', NULL),
(51, '2015-1525', 2.125, NULL, 37.87, NULL, 2023, '2', NULL),
(52, '2015-1526', 1.96, NULL, 53.47, NULL, 2023, '2', NULL),
(53, '2015-1527', 2.045, NULL, 49.07, NULL, 2023, '2', NULL),
(54, '2015-1528', 2.02, NULL, 51.07, NULL, 2023, '2', NULL),
(55, '2015-1529', 2.21, NULL, 35.6, NULL, 2023, '2', NULL),
(56, '2015-1530', 2.08833, NULL, 50.13, NULL, 2023, '2', NULL),
(57, '2015-1531', 2.25, NULL, 39.87, NULL, 2023, '2', NULL),
(58, '2015-1532', 2.12333, NULL, 45.33, NULL, 2023, '2', NULL),
(59, '2015-1533', 1.85667, NULL, 50.4, NULL, 2023, '2', NULL),
(60, '2015-1534', 2.025, NULL, 41.87, NULL, 2023, '2', NULL),
(61, '2015-1535', 2.235, NULL, 40.67, NULL, 2023, '2', NULL),
(62, '2015-1536', 2.38889, NULL, 47.73, NULL, 2023, '2', NULL),
(63, '2015-1580', 1.59167, NULL, 55.47, NULL, 2023, '3', NULL),
(64, '2015-1507', 1.99, NULL, 49.33, NULL, 2023, '3', NULL),
(65, '2015-1508', 2.26603, NULL, 38.93, NULL, 2023, '3', NULL),
(66, '2015-1509', 1.85667, NULL, 56.67, NULL, 2023, '3', NULL),
(67, '2015-1510', 1.975, NULL, 54.67, NULL, 2023, '3', NULL),
(68, '2015-1511', 1.9, NULL, 48.8, NULL, 2023, '3', NULL),
(69, '2015-1512', 1.91167, NULL, 50.53, NULL, 2023, '3', NULL),
(70, '2015-1513', 2.02667, NULL, 51.33, NULL, 2023, '3', NULL),
(71, '2015-1514', 1.88333, NULL, 51.6, NULL, 2023, '3', NULL),
(72, '2015-1515', 2.01, NULL, 53.73, NULL, 2023, '3', NULL),
(73, '2015-1516', 2.09667, NULL, 44.8, NULL, 2023, '3', NULL),
(74, '2015-1517', 1.925, NULL, 52, NULL, 2023, '3', NULL),
(75, '2015-1518', 2.06, NULL, 49.73, NULL, 2023, '3', NULL),
(76, '2015-1519', 1.88667, NULL, 56.8, NULL, 2023, '3', NULL),
(77, '2015-1520', 1.985, NULL, 45.87, NULL, 2023, '3', NULL),
(78, '2015-1521', 2.06333, NULL, 54.4, NULL, 2023, '3', NULL),
(79, '2015-1522', 1.975, NULL, 47.47, NULL, 2023, '3', NULL),
(80, '2015-1523', 1.97167, NULL, 52.93, NULL, 2023, '3', NULL),
(81, '2015-1524', 2.06, NULL, 45.47, NULL, 2023, '3', NULL),
(82, '2015-1525', 2.125, NULL, 37.87, NULL, 2023, '3', NULL),
(83, '2015-1526', 1.96, NULL, 53.47, NULL, 2023, '3', NULL),
(84, '2015-1527', 2.045, NULL, 49.07, NULL, 2023, '3', NULL),
(85, '2015-1528', 2.02, NULL, 51.07, NULL, 2023, '3', NULL),
(86, '2015-1529', 2.21, NULL, 35.6, NULL, 2023, '3', NULL),
(87, '2015-1530', 2.08833, NULL, 50.13, NULL, 2023, '3', NULL),
(88, '2015-1531', 2.25, NULL, 39.87, NULL, 2023, '3', NULL),
(89, '2015-1532', 2.12333, NULL, 45.33, NULL, 2023, '3', NULL),
(90, '2015-1533', 1.85667, NULL, 50.4, NULL, 2023, '3', NULL),
(91, '2015-1534', 2.025, NULL, 41.87, NULL, 2023, '3', NULL),
(92, '2015-1535', 2.235, NULL, 40.67, NULL, 2023, '3', NULL),
(93, '2015-1536', 2.38889, NULL, 47.73, NULL, 2023, '3', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `filename` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `filename`) VALUES
(1, 'newfile'),
(2, 'list'),
(3, 'example file');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `schedule` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `subject_name` varchar(100) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject_enroll`
--

CREATE TABLE `subject_enroll` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `examinee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `take_exam`
--

CREATE TABLE `take_exam` (
  `id` int(11) NOT NULL,
  `dateregister` date DEFAULT NULL,
  `examinee_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `usertype` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` longtext DEFAULT NULL,
  `verified` tinyint(4) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `usertype`, `username`, `password`, `verified`, `first_name`, `middle_name`, `last_name`) VALUES
(1, 'admin', 'argie.thedreamteam@gmail.com', '6cf51b9070c74b2b7b90a24428e9a99b', 1, 'Argie', 'Codog', 'Ragas'),
(2, 'examinee', 'argieragasd8d7@gmail.com', '6cf51b9070c74b2b7b90a24428e9a99b', 1, 'Argie', 'Codog', 'Ragas'),
(3, 'examinee', 'gregorio@gmail.com', 'b8eced04b9c321ecb680c62180b1d344', NULL, 'Greg', 'Justol', 'Ragas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `examinee`
--
ALTER TABLE `examinee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject_enroll`
--
ALTER TABLE `subject_enroll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `take_exam`
--
ALTER TABLE `take_exam`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `examinee`
--
ALTER TABLE `examinee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject_enroll`
--
ALTER TABLE `subject_enroll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `take_exam`
--
ALTER TABLE `take_exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
