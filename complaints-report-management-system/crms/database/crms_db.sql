-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2025 at 10:25 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `complainants`
--

CREATE TABLE `complainants` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `contact` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=unverified,1=verified',
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complainants`
--

INSERT INTO `complainants` (`id`, `name`, `address`, `contact`, `status`, `email`, `password`) VALUES
(1, 'admin', 'Sample', '+254 700 043235', 1, 'admin@admin.com', '07811dc6c422334ce36a09ff5cd6fe71'),
(2, 'Anthony Mugendi', 'Mama Ngina', '1234', 0, 'tonyzem1664@gmail.com', '07811dc6c422334ce36a09ff5cd6fe71'),
(3, 'Timo Baraka', 'Mama Ngina\r\n60100-183', '0909796868', 0, 'tim@gmail.com', 'b15d47e99831ee63e3f47cf3d4478e9a');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `complainant_id` int(30) NOT NULL,
  `message` text NOT NULL,
  `address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Pending,2=Received,3=Action Made'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `complainant_id`, `message`, `address`, `date_created`, `status`) VALUES
(3, 1, 'My Neighbor Murdered my dog', 'Sample 3 report', '2024-12-04 06:11:23', 2),
(4, 3, 'zss', 'www', '2025-01-09 21:57:32', 3);

-- --------------------------------------------------------

--
-- Table structure for table `complaints_action`
--

CREATE TABLE `complaints_action` (
  `id` int(30) NOT NULL,
  `complaint_id` int(30) NOT NULL,
  `responder_id` int(30) NOT NULL,
  `dispatched_by` int(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending,1= confirmed',
  `remarks` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complaints_action`
--

INSERT INTO `complaints_action` (`id`, `complaint_id`, `responder_id`, `dispatched_by`, `status`, `remarks`, `date_created`) VALUES
(3, 1, 1, 1, 1, 'sample', '2020-10-30 16:59:00'),
(4, 3, 2, 1, 0, '', '2024-12-04 06:12:20'),
(5, 4, 1, 3, 1, 'Crime respond team has been dispersed', '2025-01-09 21:58:15');

-- --------------------------------------------------------

--
-- Table structure for table `responders_team`
--

CREATE TABLE `responders_team` (
  `id` int(30) NOT NULL,
  `station_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `availability` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `responders_team`
--

INSERT INTO `responders_team` (`id`, `station_id`, `name`, `availability`) VALUES
(1, 1, 'R-101', 1),
(2, 1, 'R-102', 0);

-- --------------------------------------------------------

--
-- Table structure for table `stations`
--

CREATE TABLE `stations` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stations`
--

INSERT INTO `stations` (`id`, `name`, `address`, `date_created`) VALUES
(1, 'Station 1', 'Station 1 Address', '2020-10-30 10:56:25'),
(2, 'Station 2', 'Station 2 Address', '2020-10-30 10:56:43');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'CRMS', 'timmo123@gmail.com', 'SCT221-0830/2021', '1604029380_police cars.jpg', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;strong&gt;ABOUT THE SYSTEM&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;This crime reporting and management system is a comprehensive framework designed to facilitate the effective recording, tracking, and analysis of criminal activities and incidents. This system often integrates various technologies, such as databases and software applications to enable law enforcement agencies and the public to report crimes efficiently. It streamlines the process of gathering information, allowing officers to input data in real-time, monitor ongoing investigations, and generate reports for analysis and resource allocation. Additionally, such systems often feature analytics tools that help identify crime trends, assess public safety concerns, and inform strategic planning and community engagement efforts. By enhancing communication and collaboration among different law enforcement agencies and community members, a crime reporting and management system plays a crucial role in improving overall public safety and crime prevention.&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;fr-img-space-wrap&quot; style=&quot;text-align: center;&quot;&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p class=&quot;fr-img-space-wrap2&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;/div&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 3 COMMENT '1=Admin,2=Staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'admin', 'admin', '0192023a7bbd73250516f069df18b500', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `complainants`
--
ALTER TABLE `complainants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints_action`
--
ALTER TABLE `complaints_action`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `responders_team`
--
ALTER TABLE `responders_team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stations`
--
ALTER TABLE `stations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
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
-- AUTO_INCREMENT for table `complainants`
--
ALTER TABLE `complainants`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `complaints_action`
--
ALTER TABLE `complaints_action`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `responders_team`
--
ALTER TABLE `responders_team`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stations`
--
ALTER TABLE `stations`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
