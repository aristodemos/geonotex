-- phpMyAdmin SQL Dump
-- version 3.4.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 22, 2011 at 10:37 AM
-- Server version: 5.1.52
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `k35270_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `hasread`
--

CREATE TABLE IF NOT EXISTS `hasread` (
  `note_id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  PRIMARY KEY (`note_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lastupdate`
--

CREATE TABLE IF NOT EXISTS `lastupdate` (
  `user_name` varchar(10) NOT NULL,
  `date` datetime NOT NULL,
  `lon` double NOT NULL,
  `lat` double NOT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lastupdate`
--

INSERT INTO `lastupdate` (`user_name`, `date`, `lon`, `lat`) VALUES
('aris', '2011-12-22 10:28:20', 33.9697266666667, 34.777715),
('demos', '2011-12-21 15:24:05', 32.82822, 34.9690733333333),
('dwros', '2011-12-22 09:54:03', 22.084095, 37.422005),
('loukia', '2011-12-18 12:39:10', 35.333, 33.333),
('marios', '2011-12-21 13:09:18', 33.3814416666667, 35.156125),
('portoriko', '2011-12-18 10:46:31', 32.0840933333333, 38.422005),
('user', '2011-12-18 11:54:27', 32.9893469810486, 34.6163363416866);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
  `note_id` int(5) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(10) NOT NULL,
  `date` datetime NOT NULL,
  `text` varchar(120) NOT NULL,
  `longitude` double NOT NULL,
  `lat` double NOT NULL,
  PRIMARY KEY (`note_id`),
  KEY `note_id` (`note_id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=111 ;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`note_id`, `user_name`, `date`, `text`, `longitude`, `lat`) VALUES
(4, 'aris', '2011-12-01 12:00:00', 'gymansio, aris 1st', 32.8267461061478, 34.9708981062632),
(5, 'loukia', '2011-12-01 19:00:00', 'loukias 1st, stavros', 32.8241121768951, 34.9704892924708),
(6, 'aris', '2011-12-09 11:30:16', 'atssss', 45.7593116666667, 8.55804833333333),
(7, 'aris', '2011-12-09 11:30:55', 'atssss', 45.7593116666667, 8.55804833333333),
(9, 'aris', '2011-12-09 11:31:19', 'atssss', 45.7593116666667, 8.55804833333333),
(13, 'user', '2011-12-09 11:41:54', 'spiti pappou Neokli', 32.8257322311401, 34.971447583953),
(24, 'loukia', '2011-12-09 12:17:13', 'etairia kerasoparagogon pedoula', 32.8295463323593, 34.9672362928165),
(27, 'user', '2011-12-09 12:25:34', 'eklisia timiou stavrou pedoulas', 32.8301578760147, 34.9667175593089),
(28, 'aris', '2011-12-09 12:27:08', 'spiti katerinas kai aristodimou', 32.8308123350143, 34.9667175593089),
(29, 'portoriko', '2011-12-09 14:00:00', 'this is a msg from the future FANTASTICO', 32.8292083740234, 34.9656295270881),
(37, 'portoriko', '2011-12-09 14:23:26', 'home sweet home tea for two two for tea', 33.3313179016113, 35.1324041381603),
(39, 'user', '2011-12-09 15:10:05', 'metro yperagora', 33.3242154121399, 35.1253668424644),
(40, 'aris', '2011-12-09 15:11:20', 'spiti mariou kai aretis me kipo', 33.3372509479523, 35.116143730126),
(41, 'user', '2011-12-09 18:01:02', 'atssss', 25.7400763034821, 35.0076873853284),
(44, 'portoriko', '2011-12-09 18:02:09', 'ierapetra limanaki ', 25.7400763034821, 35.0076873853284),
(47, 'aris', '2011-12-09 18:14:08', 'geia sas apo tin plateia gardenias ', 23.770809173584, 37.9774665566891),
(48, 'portoriko', '2011-12-09 18:16:32', 'ta 2 aderfia ', 23.7697792053223, 37.9780500898049),
(49, 'aris', '2011-12-17 13:02:13', 'newXXmsg', 33.301035, 35.1494716666667),
(51, 'user', '2011-12-17 13:00:22', 'this a msg from the web', 33.2102966308594, 34.7337127966568),
(52, 'aris', '2011-12-17 13:06:39', 'newXfudsakasufXmsg', 33.33119266, 35.13210321),
(55, 'aris', '2011-12-17 14:42:06', 'this is a msg from the geonotex webpage @ santa barbara', 33.2549285888672, 34.9771267694146),
(56, 'loukia', '2011-12-17 14:43:32', 'this is a msg from the geonotex webpage @ fontana amoroza', 32.3012208938599, 35.0894864902184),
(57, 'user', '2011-12-17 14:46:13', 'this msg is from ASKAS!!', 33.0781173706055, 34.9297119610468),
(59, 'portoriko', '2011-12-17 14:53:00', 'testttt', 32.6911926269531, 34.8431127891754),
(68, 'dwros', '2011-12-17 15:23:44', 'web msg from kampos', 32.7317690849304, 35.0415921753901),
(69, 'dwros', '2011-12-17 15:29:48', 'neo minima apo tin kalamata', 22.112774848938, 37.0258887075743),
(70, 'aris', '2011-12-17 15:30:19', 'newXXmsg', 37.422005, -122.084095),
(71, 'aris', '2011-12-17 15:32:43', 'newXXmsg', 37.422005, -122.084095),
(72, 'aris', '2011-12-17 15:35:14', 'newXXmsg', 37.422005, -122.084095),
(73, 'aris', '2011-12-17 15:37:43', 'newXXmsg', 37.422005, -122.084095),
(74, 'aris', '2011-12-17 15:43:42', 'afto einai ena minima apo tous monaxous!!!', 24.2444550991058, 40.2572669294718),
(76, 'user', '2011-12-17 16:12:11', 'from egypt', 29.9789428710938, 31.2174993619381),
(77, 'aris', '2011-12-17 16:14:57', 'newXXmsg', 39.422005, 33.0840933333333),
(78, 'portoriko', '2011-12-17 16:15:54', 'oikopedo dwdeka!', 33.167724609375, 33.1110985917183),
(79, 'aris', '2011-12-17 16:18:53', 'newXXmsg', 39.455005, 34.0840933333333),
(80, 'aris', '2011-12-17 16:19:52', 'newXXmsg', 39.455005, 34.0840933333333),
(81, 'aris', '2011-12-17 16:27:01', 'newXXmsg', 45.455005, 5.08409333333333),
(82, 'aris', '2011-12-17 16:32:43', 'newXXmsg', 45.455005, 5.08409333333333),
(83, 'aris', '2011-12-17 16:33:42', 'newXXmsg', 45.455005, 5.08409333333333),
(84, 'aris', '2011-12-17 16:34:42', 'newXXmsg', 45.455005, 7.08409333333333),
(85, 'aris', '2011-12-17 16:35:43', 'newXXmsg', 45.455005, 7.08409333333333),
(86, 'aris', '2011-12-17 16:39:09', 'newXXmsg', 45.455005, 7.08409333333333),
(87, 'aris', '2011-12-17 16:40:09', 'newXXmsg', 45.455005, 7.08409333333333),
(88, 'aris', '2011-12-17 16:41:09', 'newXXmsg', 45.455005, 7.08409333333333),
(89, 'aris', '2011-12-17 16:42:09', 'newXXmsg', 45.455005, 7.08409333333333),
(90, 'aris', '2011-12-17 16:43:09', 'newXXmsg', 7.08409333333333, 45.455005),
(91, 'aris', '2011-12-17 16:47:45', 'newXXmsg', 13.455005, 45.0840933333333),
(92, 'dwros', '2011-12-18 02:41:27', 'Minima me spaces', 12.0840933333333, 45.422005),
(93, 'dwros', '2011-12-18 09:48:27', 'Minima me spaces', 62.0840933333333, 57.422005),
(94, 'dwros', '2011-12-18 09:49:25', 'Minima me spaces', 62.0840933333333, 57.422005),
(95, 'dwros', '2011-12-18 09:53:18', 'Minima me spaces', 62.0840933333333, 57.422005),
(96, 'dwros', '2011-12-18 10:32:22', 'qwer', 33.46435546875, 36.2088230928371),
(97, 'user', '2011-12-18 10:34:35', 'this a msg from the web', 33.24462890625, 36.2885631983624),
(98, 'user', '2011-12-18 10:48:15', 'this a msg from the web', 33.2102966308594, 34.7337127966568),
(99, 'user', '2011-12-18 10:48:21', 'this a msg from the web', 33.2102966308594, 34.7337127966568),
(100, 'aris', '2011-12-18 11:38:31', 'limassol salt lake', 32.9472255706787, 34.6172457811515),
(101, 'dwros', '2011-12-18 12:57:31', 'kakak', 33.0840933333333, 38.422005),
(102, 'demos', '2011-12-21 03:52:26', 'Login works', -74.1796875, 52.052490476001),
(103, 'marios', '2011-12-21 12:52:06', 'kombotis', 32.83248, 34.9715083333333),
(104, 'demos', '2011-12-21 12:55:50', 'gipedo panepistimioupolis', 33.4137260913849, 35.1443275438317),
(105, 'dwros', '2011-12-21 12:56:49', 'alsos akadimias', 33.3814752101898, 35.1589859378292),
(106, 'pavel', '2011-12-22 03:45:11', '', 0, 0),
(107, 'pavel', '2011-12-22 03:46:32', 'this is a test message', 0, 0),
(108, 'pavel', '2011-12-22 03:49:13', 'test', 33, 35),
(109, 'pavel', '2011-12-22 03:50:09', 'test', 33.2185363769531, 35.0760887488326),
(110, 'riri', '2011-12-22 09:21:45', 'gia sou', 43.450927734375, 40.5137991550441);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(5) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(10) NOT NULL,
  `user_pass` varchar(10) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_pass`) VALUES
(1, 'aris', 'aris'),
(2, 'portoriko', 'portoriko'),
(7, 'user', 'user'),
(8, 'loukia', 'loukia'),
(9, 'dwros', 'dwros'),
(10, 'demos', 'demos'),
(15, 'marios', 'marios'),
(16, 'pavelc@cyt', '1234'),
(17, 'pavel', '1234'),
(18, 'riri', 'riri');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lastupdate`
--
ALTER TABLE `lastupdate`
  ADD CONSTRAINT `lastupdate_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `users` (`user_name`);

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `users` (`user_name`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
