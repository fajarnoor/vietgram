-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2020 at 04:12 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clone_vietgram`
--

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `username` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`username`, `url`, `caption`, `likes`) VALUES
('zay', 'http://dummyimage.com/156x158.jpg/5fa2dd/ffffff', 'ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra', 103),
('noor', 'http://dummyimage.com/239x237.jpg/5fa2dd/ffffff', 'suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam', 383),
('ilham', 'http://dummyimage.com/103x236.jpg/ff4444/ffffff', 'velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat', 43),
('fajarnoorilham', 'http://dummyimage.com/162x107.jpg/ff4444/ffffff', 'in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo', 221),
('fajarnoorilham', 'image/alam.jpg', 'Subhanalloh alam yang indah. ini caption fajarnoorilham. ', 500),
('fajarnoorilham', 'images/alam.jpg', 'Subhanalloh alam yang indah. ini caption fajarnoorilham. ', 500);

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `username` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `website` varchar(50) NOT NULL,
  `bio` varchar(300) NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  `gender` enum('male','female','cant') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`username`, `name`, `email`, `website`, `bio`, `phone_number`, `gender`) VALUES
('fajarnoorilham', '', 'fajar.noorilham@gmail.com', '', '', '', NULL),
('ilham', 'ilham ganteng', 'ilham@gmail.com', '', '', '', 'male'),
('noor', '', 'noor@gmail.com', '', '', '', NULL),
('zay', '', 'zay@gmail.com', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `email`) VALUES
('fajarnoorilham', 'kmku', 'fajar.noorilham@gmail.com'),
('ilham', 'ilham', 'ilham@gmail.com'),
('noor', 'noor', 'noor@gmail.com'),
('zay', 'gozay', 'zay@gmail.com');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `after_insert_users` AFTER INSERT ON `users` FOR EACH ROW BEGIN
	INSERT INTO profiles(username, email, gender) VALUES(new.username,new.email,null);
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD KEY `username_photo` (`username`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON UPDATE CASCADE,
  ADD CONSTRAINT `profiles_ibfk_2` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
