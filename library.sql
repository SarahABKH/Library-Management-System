-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2023 at 05:45 AM
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
-- Database: `library`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAuthor` ()   BEGIN
	SELECT id ,author_name 
    FROM book_authors;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `authentication_system`
--

CREATE TABLE `authentication_system` (
  `PASSWORDS` varchar(10) DEFAULT NULL,
  `U_ID` int(11) DEFAULT NULL,
  `LIB_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authentication_system`
--

INSERT INTO `authentication_system` (`PASSWORDS`, `U_ID`, `LIB_ID`) VALUES
('12345678', NULL, 1),
('anime4', 3, NULL),
('12345678', 4, NULL),
('12345678', 5, NULL),
('12345678', 10, NULL),
('12345678', 11, NULL),
('12345678', 12, NULL),
('12345678', 13, NULL),
('zaynmalik', 14, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `EDITION` varchar(20) DEFAULT NULL,
  `B_ISBN` int(11) NOT NULL,
  `CATEGORY` varchar(20) DEFAULT NULL,
  `PUB_YEAR` varchar(20) DEFAULT NULL,
  `TITLE` varchar(50) DEFAULT NULL,
  `PUB_NAME` varchar(20) DEFAULT NULL,
  `AVAILABLE` int(11) DEFAULT 1,
  `AUTHOR_NAME` varchar(20) DEFAULT NULL,
  `Issuedcopies` int(3) NOT NULL,
  `Copies` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`EDITION`, `B_ISBN`, `CATEGORY`, `PUB_YEAR`, `TITLE`, `PUB_NAME`, `AVAILABLE`, `AUTHOR_NAME`, `Issuedcopies`, `Copies`) VALUES
('1', 1001, 'Biology', '2017-01-05', 'Photosynthesis', 'Pearson', 1, 'Julie Pec', 1, 8),
('1', 1002, 'Chemistry', '2011-01-01', 'Molecular Structures', 'Pearson', 1, 'Theodore E. Brown', 1, 7),
('2', 1003, 'Chemistry', '2016-03-09', 'Chemistry For Dummies', 'WestLand', 1, 'John T. Moore', 1, 8),
('1', 1004, 'Chemistry', '2011-01-01', 'Molecular Structures', 'Pearson', 1, 'Theodore E. Brown', 1, 7),
('3', 1006, 'Biology', '2011-01-01', 'Molecular Biology of the Cell', 'HarperCollins', 1, 'Bruce Alberts', 1, 6),
('3', 1007, 'Biology', '2016-03-09', 'The Double Helix', 'Hachette', 1, 'James D. Watson', 1, 5),
('1', 1008, 'Computer Science', '2017-01-05', 'Programming in Ansi ', 'Balagur Swamy', 1, 'Julie Pec', 2, 9),
('1', 1009, 'Computer Networking', '2017-01-05', 'Introduction to Comp', 'Pearson', 1, 'Jay Z', 3, 7),
('1', 1010, 'Automata', '2017-01-05', 'Turing Machines and ', 'Pearson', 1, 'Alan Turing', 1, 5),
('1', 1011, 'Chemistry', '2011', 'Organic Reactions', 'Pearson', 1, 'Ramakrishnan', 1, 9),
('3', 1012, 'BIOLOGY', '2019-01-01', 'Time and Matter', 'Pearson', 1, 'Jake Gyllenhal', 0, 4),
('2', 1051, 'Economics', '2017-01-01', 'Microeconomics', 'Pearson', 1, 'Monet De Haan', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `book_authors`
--

CREATE TABLE `book_authors` (
  `ID` int(2) NOT NULL,
  `AUTHOR_NAME` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_authors`
--

INSERT INTO `book_authors` (`ID`, `AUTHOR_NAME`) VALUES
(1, 'Alan Turing'),
(2, 'Jake Gyllenhal'),
(3, 'Jay Z'),
(4, 'Ramakrishnan'),
(5, 'Tom Hiddleston'),
(7, 'Theodore E. Brown'),
(8, 'John T. Moore'),
(9, 'Primo Levi'),
(10, 'James D. Watson'),
(11, 'Bruce Alberts '),
(12, 'Monet De Haan');

-- --------------------------------------------------------

--
-- Table structure for table `book_copies`
--

CREATE TABLE `book_copies` (
  `NO_OF_COPIES` int(11) DEFAULT NULL,
  `B_ISBN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_copies`
--

INSERT INTO `book_copies` (`NO_OF_COPIES`, `B_ISBN`) VALUES
(5, 978345632),
(3, 989495),
(6, 989496),
(6, 989497),
(6, 989498),
(6, 989499);

-- --------------------------------------------------------

--
-- Table structure for table `book_lending`
--

CREATE TABLE `book_lending` (
  `ID` int(11) NOT NULL,
  `U_ID` int(11) NOT NULL,
  `B_ISBN` int(11) DEFAULT NULL,
  `DATE_ISSUE` timestamp NULL DEFAULT current_timestamp(),
  `DATE_RETURN` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `RETURN_STATUS` int(1) NOT NULL,
  `FINE` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_lending`
--

INSERT INTO `book_lending` (`ID`, `U_ID`, `B_ISBN`, `DATE_ISSUE`, `DATE_RETURN`, `RETURN_STATUS`, `FINE`) VALUES
(1, 4, 1001, '2018-06-12 15:22:10', '2018-06-13 15:14:28', 1, 20),
(2, 5, 1002, '2018-06-12 15:25:24', '2023-01-10 00:41:47', 1, 200),
(3, 3, 1003, '2018-06-12 17:57:23', NULL, 0, 0),
(4, 5, 1004, '2018-06-13 15:54:38', NULL, 0, 0),
(5, 5, 1005, '2018-06-13 16:14:50', NULL, 0, 0),
(6, 10, 1006, '2018-07-11 13:00:00', '2023-01-10 00:41:48', 1, 10),
(7, 10, 1007, '2018-07-18 02:29:30', '2023-01-10 00:41:48', 1, 0),
(8, 5, 1008, '2018-07-18 02:30:25', '2023-01-10 00:41:48', 1, 0),
(9, 5, 1009, '2018-07-20 04:07:03', NULL, 0, 0),
(10, 5, 1010, '2018-07-20 04:10:40', NULL, 0, 0),
(16, 6, 1011, '2023-01-06 17:23:44', '2023-01-10 00:53:01', 1, NULL),
(17, 5, 1009, '2023-01-10 00:53:37', '2023-01-10 03:43:32', 1, NULL),
(18, 11, 1008, '2023-01-10 08:49:21', '2023-01-10 08:51:01', 1, NULL),
(19, 5, 1009, '2023-01-10 09:33:17', '2023-01-10 09:33:26', 1, NULL),
(20, 5, 1001, '2023-01-14 10:03:58', '2023-01-14 10:04:08', 1, NULL),
(21, 14, 1051, '2023-01-17 14:29:28', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryname` varchar(50) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryname`, `status`) VALUES
(1, 'BIOLOGY', 1),
(2, 'Computer Science', 1),
(3, 'Physics', 1),
(4, 'Computer Networking', 1),
(5, 'Automata', 1),
(8, 'Chemistry', 1),
(9, 'Economics', 1);

-- --------------------------------------------------------

--
-- Table structure for table `librarian`
--

CREATE TABLE `librarian` (
  `LIB_ID` int(11) NOT NULL,
  `LIB_NAME` varchar(20) DEFAULT NULL,
  `LIB_PHONE` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `librarian`
--

INSERT INTO `librarian` (`LIB_ID`, `LIB_NAME`, `LIB_PHONE`) VALUES
(1, 'Sarah', '6361147087');

-- --------------------------------------------------------

--
-- Table structure for table `tblfine`
--

CREATE TABLE `tblfine` (
  `fine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Dumping data for table `tblfine`
--

INSERT INTO `tblfine` (`fine`) VALUES
(50);

-- --------------------------------------------------------

--
-- Table structure for table `user_`
--

CREATE TABLE `user_` (
  `U_ID` int(11) NOT NULL,
  `U_NAME` varchar(20) DEFAULT NULL,
  `ADDRESS` varchar(20) DEFAULT NULL,
  `U_PHONE` varchar(10) DEFAULT NULL,
  `FINES` int(11) DEFAULT 0,
  `CREATION_DATE` date DEFAULT current_timestamp(),
  `EXPIRY_DATE` timestamp NULL DEFAULT NULL,
  `STATUS` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_`
--

INSERT INTO `user_` (`U_ID`, `U_NAME`, `ADDRESS`, `U_PHONE`, `FINES`, `CREATION_DATE`, `EXPIRY_DATE`, `STATUS`) VALUES
(1, 'Sanmi', 'KPT', '6361147087', 0, '2023-02-09', '2024-02-08 18:30:00', 0),
(3, 'Aditya S', 'Karkala', '5190353', 0, '2023-01-04', '2024-01-03 18:30:00', 0),
(4, 'Tina A', 'Kadri Mangalore', '54673873', 0, '2023-01-10', '2024-01-09 18:30:00', 0),
(5, 'Rahul Kumar', 'Ghandi Nagar Mumbai', '34876389', 0, '2023-01-10', '2024-01-09 18:30:00', 1),
(10, 'Katy L', 'Kadri Mangalore', '734987654', 0, '2023-01-10', '2024-01-09 18:30:00', 1),
(11, 'Vijay Deva', 'Kola lane Chennai', '876548974', 0, '2023-01-10', '2024-01-09 18:30:00', 1),
(12, 'sanmitha21', 'kpt koolo', '636114708', 0, '2023-01-10', '2024-01-09 18:30:00', 1),
(13, 'Priya', 'ABC', '12345678', 0, '2023-01-10', '2024-01-09 18:30:00', 1),
(14, 'Rose Bastian', 'Deepa Palace Kadri', '812046574', 0, '2023-01-17', '2024-01-16 18:30:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_ids`
--

CREATE TABLE `user_ids` (
  `U_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_ids`
--

INSERT INTO `user_ids` (`U_ID`) VALUES
(1),
(10),
(11),
(12),
(13),
(14);

--
-- Triggers `user_ids`
--
DELIMITER $$
CREATE TRIGGER `update_expiry_date` AFTER INSERT ON `user_ids` FOR EACH ROW UPDATE user_ SET  user_.EXPIRY_DATE = INTERVAL 1 YEAR + user_.CREATION_DATE
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authentication_system`
--
ALTER TABLE `authentication_system`
  ADD KEY `LIB_ID` (`LIB_ID`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`B_ISBN`),
  ADD UNIQUE KEY `B_ISBN` (`B_ISBN`);

--
-- Indexes for table `book_authors`
--
ALTER TABLE `book_authors`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `book_lending`
--
ALTER TABLE `book_lending`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `librarian`
--
ALTER TABLE `librarian`
  ADD PRIMARY KEY (`LIB_ID`);

--
-- Indexes for table `tblfine`
--
ALTER TABLE `tblfine`
  ADD PRIMARY KEY (`fine`);

--
-- Indexes for table `user_`
--
ALTER TABLE `user_`
  ADD PRIMARY KEY (`U_ID`);

--
-- Indexes for table `user_ids`
--
ALTER TABLE `user_ids`
  ADD PRIMARY KEY (`U_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book_authors`
--
ALTER TABLE `book_authors`
  MODIFY `ID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `book_lending`
--
ALTER TABLE `book_lending`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblfine`
--
ALTER TABLE `tblfine`
  MODIFY `fine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `user_`
--
ALTER TABLE `user_`
  MODIFY `U_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1002;

--
-- AUTO_INCREMENT for table `user_ids`
--
ALTER TABLE `user_ids`
  MODIFY `U_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authentication_system`
--
ALTER TABLE `authentication_system`
  ADD CONSTRAINT `authentication_system_ibfk_1` FOREIGN KEY (`LIB_ID`) REFERENCES `librarian` (`LIB_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
