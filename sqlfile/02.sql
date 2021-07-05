-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2021-07-05 14:05:56
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
-- 数据库： `store`
--

-- --------------------------------------------------------

--
-- 表的结构 `buy`
--

CREATE TABLE `buy` (
  `buyday` char(10) DEFAULT NULL,
  `pno` char(10) DEFAULT NULL,
  `buysize` int(11) DEFAULT NULL,
  `buyprice` int(11) DEFAULT NULL,
  `buyfrom` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `buy`
--

INSERT INTO `buy` (`buyday`, `pno`, `buysize`, `buyprice`, `buyfrom`) VALUES
('20120417', '1', 1000, 500, '阿东'),
('20140412', '1', 100, 100, '阿东'),
('20180412', '1', 10, 10, '阿东'),
('20120412', '2', 100, 5000, '阿东'),
('20140412', '2', 30, 3000, '阿东'),
('20180412', '2', 5, 500, '阿东'),
('20120412', '3', 1000, 20, '阿东'),
('20140412', '3', 700, 15, '阿东'),
('20180412', '3', 500, 8, '阿东');

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

CREATE TABLE `product` (
  `pno` char(6) NOT NULL,
  `pname` char(25) DEFAULT NULL,
  `pfrom` char(50) DEFAULT NULL,
  `psize` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `product`
--

INSERT INTO `product` (`pno`, `pname`, `pfrom`, `psize`) VALUES
('1', '手机', '华强北', '平果'),
('2', '电脑', '深圳', '联翔'),
('3', '耳机', '深圳', '贴三家');

-- --------------------------------------------------------

--
-- 表的结构 `sale`
--

CREATE TABLE `sale` (
  `saleday` char(10) DEFAULT NULL,
  `pno` char(10) DEFAULT NULL,
  `salesize` char(10) DEFAULT NULL,
  `pay` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转储表的索引
--

--
-- 表的索引 `buy`
--
ALTER TABLE `buy`
  ADD KEY `pno` (`pno`);

--
-- 表的索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pno`),
  ADD UNIQUE KEY `pno` (`pno`);

--
-- 表的索引 `sale`
--
ALTER TABLE `sale`
  ADD KEY `pno` (`pno`);

--
-- 限制导出的表
--

--
-- 限制表 `buy`
--
ALTER TABLE `buy`
  ADD CONSTRAINT `buy_ibfk_1` FOREIGN KEY (`pno`) REFERENCES `product` (`pno`);

--
-- 限制表 `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`pno`) REFERENCES `product` (`pno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
