-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2022 at 03:39 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `2`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `Dr_name` varchar(20) NOT NULL,
  `degree` varchar(20) NOT NULL,
  `Doc_id` int(11) NOT NULL,
  `designation` varchar(20) NOT NULL,
  `Dr_schedule` int(11) NOT NULL,
  `doc_info` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `laboratory`
--

CREATE TABLE `laboratory` (
  `test_sample` varchar(20) NOT NULL,
  `report_info_p` varchar(20) NOT NULL,
  `doc_info` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `schedule` int(11) NOT NULL,
  `nur_id` int(11) NOT NULL,
  `N_name` varchar(20) NOT NULL,
  `Doc_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `P_name` varchar(20) NOT NULL,
  `Age` int(11) NOT NULL,
  `Phone_no` int(11) NOT NULL,
  `Patient_id` int(11) NOT NULL,
  `disease` varchar(20) NOT NULL,
  `History` varchar(20) NOT NULL,
  `Doc_id` int(11) DEFAULT NULL,
  `report_info_p` varchar(20) NOT NULL,
  `doc_info` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reception`
--

CREATE TABLE `reception` (
  `doc_info` varchar(20) NOT NULL,
  `schedule` varchar(20) NOT NULL,
  `bill` decimal(5,2) NOT NULL,
  `holidays` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`Doc_id`),
  ADD KEY `doc_info` (`doc_info`);

--
-- Indexes for table `laboratory`
--
ALTER TABLE `laboratory`
  ADD PRIMARY KEY (`report_info_p`,`doc_info`),
  ADD KEY `doc_info` (`doc_info`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD KEY `Doc_id` (`Doc_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`Patient_id`),
  ADD KEY `Doc_id` (`Doc_id`),
  ADD KEY `report_info_p` (`report_info_p`,`doc_info`),
  ADD KEY `doc_info` (`doc_info`);

--
-- Indexes for table `reception`
--
ALTER TABLE `reception`
  ADD PRIMARY KEY (`doc_info`),
  ADD UNIQUE KEY `schedule` (`schedule`),
  ADD UNIQUE KEY `bill` (`bill`),
  ADD UNIQUE KEY `holidays` (`holidays`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`doc_info`) REFERENCES `reception` (`doc_info`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laboratory`
--
ALTER TABLE `laboratory`
  ADD CONSTRAINT `laboratory_ibfk_1` FOREIGN KEY (`doc_info`) REFERENCES `reception` (`doc_info`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nurse`
--
ALTER TABLE `nurse`
  ADD CONSTRAINT `nurse_ibfk_1` FOREIGN KEY (`Doc_id`) REFERENCES `doctor` (`Doc_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`Doc_id`) REFERENCES `doctor` (`Doc_id`),
  ADD CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`report_info_p`,`doc_info`) REFERENCES `laboratory` (`report_info_p`, `doc_info`),
  ADD CONSTRAINT `patient_ibfk_3` FOREIGN KEY (`doc_info`) REFERENCES `reception` (`doc_info`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
