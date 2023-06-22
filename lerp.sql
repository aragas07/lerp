-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2023 at 08:45 AM
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
(2, NULL, '2015-1507', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-09 06:42:11', NULL, 2, NULL);

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
  `locking` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `examinee_id`, `gwa`, `entrance_exam`, `mock_exam`, `locking`) VALUES
(1, '2015-1506', 2.3333, NULL, 46.9, NULL),
(2, '2015-1507', 1.99, NULL, 49.33, NULL),
(3, '2015-1503', 2.26603, NULL, 38.93, NULL),
(4, '2015-1504', 1.85667, NULL, 56.67, NULL),
(5, '2015-1505', 1.975, NULL, 54.67, NULL),
(6, '2015-1546', 1.9, NULL, 48.8, NULL),
(7, '2015-1547', 1.91167, NULL, 50.53, NULL),
(8, '2015-1508', 2.02667, NULL, 51.33, NULL),
(9, '2015-1509', 1.88333, NULL, 51.6, NULL),
(10, '2015-1510', 2.01, NULL, 53.73, NULL),
(11, '2015-1511', 2.09667, NULL, 44.8, NULL),
(12, '2015-1512', 1.925, NULL, 52, NULL),
(13, '2015-1513', 2.06, NULL, 49.73, NULL),
(14, '2015-1514', 1.88667, NULL, 56.8, NULL),
(15, '2015-1515', 1.985, NULL, 45.87, NULL),
(16, '2015-1516', 2.06333, NULL, 54.4, NULL),
(17, '2015-1517', 1.975, NULL, 47.47, NULL),
(18, '2015-1518', 1.97167, NULL, 52.93, NULL),
(19, '2015-1519', 2.06, NULL, 45.47, NULL),
(20, '2015-1520', 2.125, NULL, 37.87, NULL),
(21, '2015-1521', 1.96, NULL, 53.47, NULL),
(22, '2015-1522', 2.045, NULL, 49.07, NULL),
(23, '2015-1523', 2.02, NULL, 51.07, NULL),
(24, '2015-1524', 2.21, NULL, 35.6, NULL),
(25, '2015-1525', 2.08833, NULL, 50.13, NULL),
(26, '2015-1526', 2.25, NULL, 39.87, NULL),
(27, '2015-1527', 2.12333, NULL, 45.33, NULL),
(28, '2015-1528', 1.85667, NULL, 50.4, NULL),
(29, '2015-1529', 2.025, NULL, 41.87, NULL),
(30, '2015-1530', 2.235, NULL, 40.67, NULL),
(31, '2015-1531', 2.38889, NULL, 47.73, NULL),
(32, '2014-1515', 2, NULL, 50, NULL),
(33, '2014-1514', 1.415, NULL, 90, NULL);

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
(2, 'examinee', 'argieragasd8d7@gmail.com', '6cf51b9070c74b2b7b90a24428e9a99b', 1, 'Argie', 'Codog', 'Ragas');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
