-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Värd: 127.0.0.1
-- Tid vid skapande: 26 aug 2014 kl 15:15
-- Serverversion: 5.6.20
-- PHP-version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databas: `slutprojekt`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
`id` int(11) NOT NULL,
  `summary_id` int(11) NOT NULL,
  `author_name` varchar(64) NOT NULL,
  `date` datetime NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellstruktur `subjects`
--

CREATE TABLE IF NOT EXISTS `subjects` (
`id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=3 ;

--
-- Dumpning av Data i tabell `subjects`
--

INSERT INTO `subjects` (`id`, `name`) VALUES
(1, 'Mattematik'),
(2, 'Engelska');

-- --------------------------------------------------------

--
-- Tabellstruktur `summaries`
--

CREATE TABLE IF NOT EXISTS `summaries` (
`id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `author_name` varchar(64) NOT NULL,
  `date` datetime NOT NULL,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`id`), ADD KEY `summary_id` (`summary_id`);

--
-- Index för tabell `subjects`
--
ALTER TABLE `subjects`
 ADD PRIMARY KEY (`id`);

--
-- Index för tabell `summaries`
--
ALTER TABLE `summaries`
 ADD PRIMARY KEY (`id`), ADD KEY `subject_id` (`subject_id`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `comments`
--
ALTER TABLE `comments`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `subjects`
--
ALTER TABLE `subjects`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT för tabell `summaries`
--
ALTER TABLE `summaries`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restriktioner för dumpade tabeller
--

--
-- Restriktioner för tabell `comments`
--
ALTER TABLE `comments`
ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`summary_id`) REFERENCES `summaries` (`id`);

--
-- Restriktioner för tabell `summaries`
--
ALTER TABLE `summaries`
ADD CONSTRAINT `summaries_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
