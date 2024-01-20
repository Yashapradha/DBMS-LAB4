-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2024 at 08:36 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbmslab4`
--

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `usn` varchar(30) NOT NULL,
  `ssid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`usn`, `ssid`) VALUES
('4mh21cs001', 102),
('4mh21cs002', 103),
('4mh21cs003', 104),
('4mh21cs004', 105),
('4mh21cs119', 101);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `subcode` varchar(30) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `sem` int(11) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`subcode`, `title`, `sem`, `credits`) VALUES
('21cs31', 'maths', 3, 3),
('21cs32', 'dsa', 3, 4),
('21cs42', 'daa', 4, 4),
('21cs52', 'cn', 5, 4),
('21cs53', 'dbms', 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `iamarks`
--

CREATE TABLE `iamarks` (
  `usn` varchar(30) NOT NULL,
  `subcode` varchar(30) NOT NULL,
  `ssid` int(11) NOT NULL,
  `test1` int(11) DEFAULT NULL,
  `test2` int(11) DEFAULT NULL,
  `test3` int(11) DEFAULT NULL,
  `finalia` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `iamarks`
--

INSERT INTO `iamarks` (`usn`, `subcode`, `ssid`, `test1`, `test2`, `test3`, `finalia`) VALUES
('4mh21cs001', '21cs32', 102, 24, 23, 28, 26),
('4mh21cs002', '21cs42', 103, 24, 25, 27, 26),
('4mh21cs003', '21cs52', 104, 20, 26, 27, 26.5),
('4mh21cs004', '21cs53', 105, 22, 21, 20, 21.5),
('4mh21cs119', '21cs31', 101, 28, 29, 30, 29.5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `mark`
-- (See below for the actual view)
--
CREATE TABLE `mark` (
`subcode` varchar(30)
,`test1` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `semsec`
--

CREATE TABLE `semsec` (
  `ssid` int(11) NOT NULL,
  `sem` int(11) DEFAULT NULL,
  `sec` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `semsec`
--

INSERT INTO `semsec` (`ssid`, `sem`, `sec`) VALUES
(101, 3, 'b'),
(102, 5, 'a'),
(103, 5, 'a'),
(104, 7, 'a'),
(105, 3, 'c');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `usn` varchar(30) NOT NULL,
  `sname` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`usn`, `sname`, `address`, `phone`, `gender`) VALUES
('4mh21cs001', 'madhu', 'mysore', 2147483647, 'm'),
('4mh21cs002', 'manju', 'mysore', 2147483647, 'm'),
('4mh21cs003', 'varsha', 'bangalore', 2147483647, 'f'),
('4mh21cs004', 'raksha', 'bangalore', 2147483647, 'f'),
('4mh21cs119', 'yashu', 'mandya', 1212121212, 'f');

-- --------------------------------------------------------

--
-- Structure for view `mark`
--
DROP TABLE IF EXISTS `mark`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mark`  AS SELECT `iamarks`.`subcode` AS `subcode`, `iamarks`.`test1` AS `test1` FROM `iamarks` WHERE `iamarks`.`usn` = '4mh21cs119' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`usn`,`ssid`),
  ADD KEY `ssid` (`ssid`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`subcode`);

--
-- Indexes for table `iamarks`
--
ALTER TABLE `iamarks`
  ADD PRIMARY KEY (`usn`,`subcode`,`ssid`),
  ADD KEY `subcode` (`subcode`),
  ADD KEY `ssid` (`ssid`);

--
-- Indexes for table `semsec`
--
ALTER TABLE `semsec`
  ADD PRIMARY KEY (`ssid`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`usn`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`usn`) REFERENCES `student` (`usn`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_ibfk_2` FOREIGN KEY (`ssid`) REFERENCES `semsec` (`ssid`) ON DELETE CASCADE;

--
-- Constraints for table `iamarks`
--
ALTER TABLE `iamarks`
  ADD CONSTRAINT `iamarks_ibfk_1` FOREIGN KEY (`usn`) REFERENCES `student` (`usn`) ON DELETE CASCADE,
  ADD CONSTRAINT `iamarks_ibfk_2` FOREIGN KEY (`subcode`) REFERENCES `course` (`subcode`) ON DELETE CASCADE,
  ADD CONSTRAINT `iamarks_ibfk_3` FOREIGN KEY (`ssid`) REFERENCES `semsec` (`ssid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
