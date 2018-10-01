-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- 主機: 127.0.0.1
-- 產生時間： 
-- 伺服器版本: 10.1.16-MariaDB
-- PHP 版本： 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `mumo`
--

-- --------------------------------------------------------

--
-- 資料表結構 `coupon`
--

CREATE TABLE `coupon` (
  `cid` int(11) NOT NULL,
  `vid` int(11) NOT NULL,
  `info` text NOT NULL,
  `ammount` int(5) NOT NULL,
  `ava_time` datetime NOT NULL,
  `exp_time` datetime NOT NULL,
  `update_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `gift`
--

CREATE TABLE `gift` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  `recid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `goods`
--

CREATE TABLE `goods` (
  `gdid` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `info` text NOT NULL,
  `popval` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `grop`
--

CREATE TABLE `grop` (
  `gid` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `message`
--

CREATE TABLE `message` (
  `mid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  `content` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `movie`
--

CREATE TABLE `movie` (
  `moid` int(11) NOT NULL,
  `name` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `music`
--

CREATE TABLE `music` (
  `muid` int(11) NOT NULL,
  `name` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `news`
--

CREATE TABLE `news` (
  `nid` int(11) NOT NULL,
  `vid` int(11) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `targid` int(11) NOT NULL,
  `info` text NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `account` varchar(14) NOT NULL,
  `password` varchar(14) NOT NULL,
  `repassword` varchar(14) NOT NULL,
  `gender` varchar(4) NOT NULL,
  `info` text NOT NULL,
  `popval` int(5) NOT NULL,
  `money` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `user`
--

INSERT INTO `user` (`uid`, `account`, `password`, `repassword`, `gender`, `info`, `popval`, `money`) VALUES
(1, 'duke5566', '123456', '', 'Male', 'test test', 0, 5000),
(2, '456', '45646546@54664', '465', '0', '0', 0, 0),
(3, 'tino', 'tino@454646', 'asdasd', '0', '0', 0, 0),
(4, 'gogopower', '45646546@fjfjf', 'adfadf', '0', '0', 0, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `user_group`
--

CREATE TABLE `user_group` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `gid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `user_movie`
--

CREATE TABLE `user_movie` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `moid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `user_music`
--

CREATE TABLE `user_music` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `muid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `vender`
--

CREATE TABLE `vender` (
  `vid` int(11) NOT NULL,
  `account` varchar(14) NOT NULL,
  `password` varchar(14) NOT NULL,
  `address` text NOT NULL,
  `phone` int(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`cid`);

--
-- 資料表索引 `gift`
--
ALTER TABLE `gift`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`gdid`);

--
-- 資料表索引 `grop`
--
ALTER TABLE `grop`
  ADD PRIMARY KEY (`gid`);

--
-- 資料表索引 `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`mid`);

--
-- 資料表索引 `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`moid`);

--
-- 資料表索引 `music`
--
ALTER TABLE `music`
  ADD PRIMARY KEY (`muid`);

--
-- 資料表索引 `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- 資料表索引 `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user_movie`
--
ALTER TABLE `user_movie`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user_music`
--
ALTER TABLE `user_music`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `vender`
--
ALTER TABLE `vender`
  ADD PRIMARY KEY (`vid`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `coupon`
--
ALTER TABLE `coupon`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `gift`
--
ALTER TABLE `gift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `goods`
--
ALTER TABLE `goods`
  MODIFY `gdid` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `grop`
--
ALTER TABLE `grop`
  MODIFY `gid` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `message`
--
ALTER TABLE `message`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `music`
--
ALTER TABLE `music`
  MODIFY `muid` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用資料表 AUTO_INCREMENT `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `user_movie`
--
ALTER TABLE `user_movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `user_music`
--
ALTER TABLE `user_music`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `vender`
--
ALTER TABLE `vender`
  MODIFY `vid` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
