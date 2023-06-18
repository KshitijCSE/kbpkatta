-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2023 at 01:09 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `facebook`
--

-- --------------------------------------------------------

--
-- Table structure for table `block`
--

CREATE TABLE `block` (
  `blockID` int(11) NOT NULL,
  `blockerID` int(11) NOT NULL,
  `blockedID` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `blockOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `commentID` int(11) NOT NULL,
  `comment_parent_id` int(11) NOT NULL,
  `commentReplyID` decimal(20,0) NOT NULL,
  `replyID` decimal(20,0) NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `commentOn` int(11) NOT NULL,
  `commentBy` decimal(20,0) NOT NULL,
  `commentAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`commentID`, `comment_parent_id`, `commentReplyID`, `replyID`, `comment`, `commentOn`, `commentBy`, `commentAt`) VALUES
(2, 10, '0', '0', 'thank you', 10, '1', '2023-06-02 16:14:04'),
(3, 10, '0', '0', 'thank you', 10, '1', '2023-06-02 16:14:04'),
(4, 10, '0', '0', 'hi', 10, '1', '2023-06-09 08:23:19'),
(5, 12, '0', '0', 'nice', 12, '1', '2023-06-12 13:34:05');

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `id` int(11) NOT NULL,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `followOn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`id`, `sender`, `receiver`, `followOn`) VALUES
(1, 2, 1, '2023-03-22 11:30:19'),
(2, 2, 3, '2023-03-25 04:32:27'),
(3, 1, 1, '2023-06-11 20:11:48'),
(4, 4, 1, '2023-06-11 20:12:56');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `messageID` int(11) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `messageTo` int(11) NOT NULL,
  `messageFrom` int(11) NOT NULL,
  `messageOn` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`messageID`, `message`, `messageTo`, `messageFrom`, `messageOn`, `status`) VALUES
(1, 'hiii there !!', 2, 1, '2023-03-22 11:37:29', 0),
(2, 'PKMKB', 1, 2, '2023-03-24 09:53:18', 0),
(3, 'hii', 3, 2, '2023-03-25 04:34:19', 0),
(4, 'hii', 2, 1, '2023-03-25 07:28:21', 0),
(5, 'hi', 2, 1, '2023-06-02 15:01:34', 0),
(6, 'hello', 2, 1, '2023-06-02 15:01:41', 0),
(7, 'all done&nbsp;<img alt=\"😇\" class=\"emojioneemoji\" src=\"https://cdn.jsdelivr.net/emojione/assets/3.1/png/32/1f607.png\">', 2, 1, '2023-06-02 16:07:02', 0),
(8, 'hi', 2, 1, '2023-06-09 08:23:02', 0),
(9, 'hi', 2, 1, '2023-06-11 16:56:02', 0),
(10, 'hi', 2, 1, '2023-06-12 13:34:22', 0);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `ID` int(11) NOT NULL,
  `notificationFor` int(11) NOT NULL,
  `notificationFrom` int(11) NOT NULL,
  `postid` int(11) NOT NULL,
  `type` enum('postReact','commentReact','comment','share','message','request','mention') NOT NULL,
  `notificationOn` datetime NOT NULL,
  `notificationCount` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `friendStatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`ID`, `notificationFor`, `notificationFrom`, `postid`, `type`, `notificationOn`, `notificationCount`, `status`, `friendStatus`) VALUES
(1, 1, 2, 0, 'request', '2023-03-22 11:30:19', 1, 1, 1),
(2, 2, 1, 4, 'postReact', '2023-03-22 11:36:41', 1, 1, 0),
(3, 2, 1, 4, 'postReact', '2023-03-22 11:36:50', 1, 0, 0),
(5, 1, 2, 0, 'message', '2023-03-24 09:53:18', 1, 0, 0),
(6, 3, 2, 0, 'request', '2023-03-25 04:32:27', 0, 0, 0),
(7, 3, 2, 0, 'message', '2023-03-25 04:34:20', 0, 0, 0),
(14, 1, 4, 0, 'request', '2023-06-11 20:12:56', 0, 1, 1),
(15, 2, 1, 0, 'message', '2023-06-12 13:34:23', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `post` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `postBy` int(11) DEFAULT NULL,
  `sharedFrom` int(11) DEFAULT NULL,
  `shareId` int(11) DEFAULT NULL,
  `sharedBy` int(11) DEFAULT NULL,
  `postImage` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `imageId` text DEFAULT NULL,
  `likesCount` int(11) DEFAULT NULL,
  `shareCount` int(11) DEFAULT NULL,
  `postedOn` datetime DEFAULT NULL,
  `shareText` text DEFAULT NULL,
  `profilePhoto` text DEFAULT NULL,
  `coverPhoto` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `userId`, `post`, `postBy`, `sharedFrom`, `shareId`, `sharedBy`, `postImage`, `imageId`, `likesCount`, `shareCount`, `postedOn`, `shareText`, `profilePhoto`, `coverPhoto`) VALUES
(4, 2, 'HI my new&nbsp;&nbsp;account and new post!!!', 2, NULL, NULL, NULL, '', NULL, NULL, NULL, '2023-03-22 11:30:57', NULL, NULL, NULL),
(5, 2, '', 2, NULL, NULL, NULL, '', NULL, NULL, NULL, '2023-03-25 07:37:23', NULL, NULL, NULL),
(6, 2, '', 2, NULL, NULL, NULL, '', NULL, NULL, NULL, '2023-03-25 07:37:44', NULL, NULL, NULL),
(7, 2, '', 2, NULL, NULL, NULL, '[{\"imageName\":\"user/2/postImage/emailwarning.png\"}]', NULL, NULL, NULL, '2023-03-25 07:39:03', NULL, NULL, NULL),
(8, 1, 'hi', 1, NULL, NULL, NULL, '', NULL, NULL, NULL, '2023-06-02 15:40:11', NULL, NULL, NULL),
(10, 1, 'hg #havefun', 1, NULL, NULL, NULL, '', NULL, NULL, NULL, '2023-06-02 16:12:45', NULL, NULL, NULL),
(11, 1, NULL, 1, NULL, NULL, NULL, '[{\"imageName\":\"user/1/postImage/Holi.jpg\"}]', NULL, NULL, NULL, '2023-06-12 13:29:34', NULL, NULL, NULL),
(12, 1, NULL, 1, NULL, NULL, NULL, '[{\"imageName\":\"user/1/postImage/SampleGIFImage_40kbmb.gif\"}]', NULL, NULL, NULL, '2023-06-12 13:33:42', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `currentCity` varchar(255) DEFAULT NULL,
  `shortBio` text DEFAULT NULL,
  `aboutYou` text DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `profilePic` text DEFAULT NULL,
  `coverPic` text DEFAULT NULL,
  `politicalViews` varchar(255) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `highSchool` text DEFAULT NULL,
  `college` text DEFAULT NULL,
  `university` text DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `hometown` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `workplace` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `professional` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `otherPlace` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `socialLink` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `relationship` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `quotes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `otherName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `lifeEvent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `userId`, `currentCity`, `shortBio`, `aboutYou`, `birthday`, `firstName`, `lastName`, `profilePic`, `coverPic`, `politicalViews`, `religion`, `highSchool`, `college`, `university`, `country`, `website`, `language`, `hometown`, `gender`, `workplace`, `professional`, `otherPlace`, `address`, `socialLink`, `relationship`, `quotes`, `otherName`, `lifeEvent`) VALUES
(1, 1, NULL, NULL, NULL, '2001-01-01', 'Tushar', 'Kudave', 'user/1/profilePhoto/Holi.jpg', 'user/1/coverphoto/Holi.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2019', '', '', '', '', '', '', '', ''),
(2, 2, NULL, NULL, NULL, '2001-01-01', 'Shruti', 'Goliwadekar', 'assets/image/defaultProfile.png', 'assets/image/defaultCover.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'female', '', '', '', '', '', '', '', '', ''),
(3, 3, NULL, NULL, NULL, '2001-01-01', 'Robert', 'Downey', 'assets/image/defaultProfile.png', 'assets/image/defaultCover.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '', '', '', '', '', '', '', '', ''),
(4, 4, NULL, NULL, NULL, '2002-01-01', 'kshitij', 'More', 'assets/image/defaultProfile.png', 'assets/image/defaultCover.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `react`
--

CREATE TABLE `react` (
  `reactID` int(11) NOT NULL,
  `reactBy` int(11) NOT NULL,
  `reactOn` int(11) NOT NULL,
  `reactCommentOn` int(11) NOT NULL,
  `reactReplyOn` int(11) NOT NULL,
  `reactType` enum('like','love','haha','wow','sad','angry') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reactTimeOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `react`
--

INSERT INTO `react` (`reactID`, `reactBy`, `reactOn`, `reactCommentOn`, `reactReplyOn`, `reactType`, `reactTimeOn`) VALUES
(2, 1, 4, 0, 0, 'like', '2023-03-22 11:36:50'),
(3, 2, 6, 0, 0, 'wow', '2023-03-25 07:37:55'),
(4, 1, 12, 0, 0, 'like', '2023-06-12 13:33:58');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `requestid` int(11) NOT NULL,
  `reqtReceiver` int(11) NOT NULL,
  `reqtSender` int(11) NOT NULL,
  `reqStatus` int(11) NOT NULL,
  `requestOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`requestid`, `reqtReceiver`, `reqtSender`, `reqStatus`, `requestOn`) VALUES
(1, 1, 2, 1, '2023-03-22 11:30:19'),
(2, 3, 2, 0, '2023-03-25 04:32:27'),
(3, 1, 1, 0, '2023-06-11 20:11:48');

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`id`, `token`, `user_id`) VALUES
(8, 'c3134cfc36e24901c021499d465d406a5cd160f0', 3),
(38, '037128d809d252fa3c6e3b483e415f53f8caeaf8', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `screenName` varchar(255) NOT NULL,
  `userLink` text NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `screenName`, `userLink`, `email`, `mobile`, `password`, `birthday`, `gender`) VALUES
(1, 'Tushar', 'Kudave', 'Tushar_Kudave', 'Tushar_Kudave', 'tushar.kudave@kbpcoes.edu.in', NULL, '$2y$10$7E5a1agDYW0Kb6ynBKyIuOtABJ1.NBdk3fmpxLhoadXwPtM40fGO2', '2001-01-01', 'male'),
(2, 'Shruti', 'Goliwadekar', 'Shruti_Goliwadekar', 'Shruti_Goliwadekar', 'shruti.goliwadekar@kbpcoes.edu.in', NULL, '$2y$10$OQneANWoi6826eX/0Zg3P..hzPbTQYFnz23/QUV5aI5CqqheeeoM2', '2001-01-01', 'female'),
(3, 'Robert', 'Downey', 'Robert_Downey', 'Robert_Downey', 'Downey@gmail.com', NULL, '$2y$10$5BHSRP3ZY1urkh3l/7cNF.JFx4IuBuLITBJFTEATlgWwQjY5PUjl2', '2001-01-01', 'male'),
(4, 'kshitij', 'More', 'kshitij_More', 'kshitij_More', 'kshitij.more@kbpcoes.edu.in', NULL, '$2y$10$48w9BO8RtfTEwNWksnH8TO0MdkJ0lsjyYzF6uqpWBIq5QS/CvC47W', '2002-01-01', 'male');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `block`
--
ALTER TABLE `block`
  ADD PRIMARY KEY (`blockID`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentID`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`messageID`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `postForien` (`userId`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profileForein` (`userId`);

--
-- Indexes for table `react`
--
ALTER TABLE `react`
  ADD PRIMARY KEY (`reactID`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`requestid`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_fk` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `block`
--
ALTER TABLE `block`
  MODIFY `blockID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `messageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `react`
--
ALTER TABLE `react`
  MODIFY `reactID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `requestid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `postForien` FOREIGN KEY (`userId`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profileForein` FOREIGN KEY (`userId`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
