-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 23, 2017 at 11:37 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cyberarm`
--

-- --------------------------------------------------------

--
-- Table structure for table `cyber_defense_matrix`
--

CREATE TABLE `cyber_defense_matrix` (
  `id` int(11) NOT NULL,
  `security_control_name` varchar(200) NOT NULL,
  `sc_version` varchar(20) NOT NULL,
  `kill_chain_phase` varchar(50) DEFAULT NULL,
  `enforcement_level` varchar(50) DEFAULT NULL,
  `sc_function` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cyber_defense_matrix`
--

INSERT INTO `cyber_defense_matrix` (`id`, `security_control_name`, `sc_version`, `kill_chain_phase`, `enforcement_level`, `sc_function`) VALUES
(1, 'Automaed Asset Inventory', '1.1', 'Explot', 'Device', 'Identify'),
(2, 'DHCP Server Logging', '1.2', 'Exploit', 'Device', 'Identify'),
(3, 'Update Inventory System', '1.3', 'Exploit', 'Device', 'Identify'),
(4, 'Asset Inventory ', '1.4', 'Exploit', 'Device', 'Identify'),
(5, 'Network Level Authentication', '1.5', 'Deliver', 'Device', 'Identify'),
(6, 'Client Certificate', '1.6', 'Deliver', 'Device', 'Identify'),
(7, 'Authorized Software Inventory', '2.1', 'Exploit', 'Application', 'Identify'),
(8, 'Application Whitelisting', '2.2', 'Exploit', 'Application', 'Protect'),
(9, 'Virtual Machine', '2.4', 'Deliver', 'Application', 'Protect'),
(10, 'Standardized Image of Secure Configuration', '3.1', 'Recon', 'Application', 'Identify'),
(11, 'Strict Configurations for Systems', '3.2', 'Recon', 'Device', 'Identify'),
(12, 'Secure Channel for Devices\' Remote Administration ', '3.4', 'Recon', 'Network', 'Protect'),
(13, 'File Integrity Checking Tool', '3.5', 'Exploit', 'Data', 'Detect'),
(14, 'Automated Configuration Monitoring', '3.6', 'Maintain', 'Device', 'Detect'),
(15, 'System Configuration Management Tool', '3.7', 'Maintain', 'Application', 'Protect');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `user_name` text NOT NULL,
  `user_password` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`id`, `user_name`, `user_password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `sc_to_enforcement_level`
--

CREATE TABLE `sc_to_enforcement_level` (
  `id` int(11) NOT NULL,
  `sc_version` varchar(20) NOT NULL,
  `enforcement_level` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sc_to_enforcement_level`
--

INSERT INTO `sc_to_enforcement_level` (`id`, `sc_version`, `enforcement_level`) VALUES
(16, '1.1', 'Device'),
(17, '1.2', 'Device'),
(18, '1.3', 'Device'),
(19, '1.4', 'Device'),
(20, '1.5', 'Device'),
(21, '1.6', 'Device'),
(22, '2.1', 'Application'),
(23, '2.2', 'Application'),
(24, '2.4', 'Application'),
(25, '3.1', 'Application'),
(26, '3.2', 'Device'),
(27, '3.4', 'Network'),
(28, '3.5', 'Data'),
(29, '3.6', 'Device'),
(30, '3.7', 'Application');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cyber_defense_matrix`
--
ALTER TABLE `cyber_defense_matrix`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `version` (`sc_version`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sc_to_enforcement_level`
--
ALTER TABLE `sc_to_enforcement_level`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cyber_defense_matrix`
--
ALTER TABLE `cyber_defense_matrix`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sc_to_enforcement_level`
--
ALTER TABLE `sc_to_enforcement_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
