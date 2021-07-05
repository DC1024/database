-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2021-07-05 09:35:21
-- 服务器版本： 5.6.38
-- PHP 版本： 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `(2018.4互联网数据库)四.1酒店数据库`
--

-- --------------------------------------------------------

--
-- 表的结构 `checkin`
--

CREATE TABLE `checkin` (
  `rno` char(6) DEFAULT NULL,
  `gno` char(6) DEFAULT NULL,
  `day` char(10) DEFAULT NULL,
  `days` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `checkin`
--

INSERT INTO `checkin` (`rno`, `gno`, `day`, `days`) VALUES
('5555', '00001', '2005.5.5', 6),
('0001', '201803', '2018.3.5', 2),
('5555', '00001', '2020.05.05', 6),
('5555', '00001', '2018.05.05', 6),
('5555', '00001', '20180517', 6),
('5555', '00001', '20190517', 6);

-- --------------------------------------------------------

--
-- 表的结构 `guest`
--

CREATE TABLE `guest` (
  `gno` char(6) NOT NULL,
  `gname` char(6) DEFAULT NULL,
  `gage` decimal(3,0) DEFAULT NULL,
  `gphone` decimal(11,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `guest`
--

INSERT INTO `guest` (`gno`, `gname`, `gage`, `gphone`) VALUES
('00001', 'Mr.5', '55', '55555555555'),
('201803', '刘平', '0', '15598745631');

-- --------------------------------------------------------

--
-- 表的结构 `guestroom`
--

CREATE TABLE `guestroom` (
  `rno` char(6) NOT NULL,
  `rtype` char(20) DEFAULT NULL,
  `rprice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `guestroom`
--

INSERT INTO `guestroom` (`rno`, `rtype`, `rprice`) VALUES
('0001', 'normal', 120),
('0002', 'normal', 120),
('0003', 'normal', 120),
('0004', 'normal', 120),
('0005', 'normal', 120),
('5555', 'toplevel', 5555);

--
-- 转储表的索引
--

--
-- 表的索引 `checkin`
--
ALTER TABLE `checkin`
  ADD KEY `rno` (`rno`),
  ADD KEY `gno` (`gno`);

--
-- 表的索引 `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`gno`),
  ADD UNIQUE KEY `gno` (`gno`);

--
-- 表的索引 `guestroom`
--
ALTER TABLE `guestroom`
  ADD PRIMARY KEY (`rno`),
  ADD UNIQUE KEY `rno` (`rno`);

--
-- 限制导出的表
--

--
-- 限制表 `checkin`
--
ALTER TABLE `checkin`
  ADD CONSTRAINT `checkin_ibfk_1` FOREIGN KEY (`rno`) REFERENCES `guestroom` (`rno`),
  ADD CONSTRAINT `checkin_ibfk_2` FOREIGN KEY (`gno`) REFERENCES `guest` (`gno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
