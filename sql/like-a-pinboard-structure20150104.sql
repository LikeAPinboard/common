-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: 2015 年 1 月 04 日 23:00
-- サーバのバージョン： 5.5.34
-- PHP Version: 5.5.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pinboard`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `pb_facebook_account`
--

CREATE TABLE `pb_facebook_account` (
  `user_id` int(11) unsigned NOT NULL,
  `facebook_id` int(11) unsigned NOT NULL,
  `facebook_name` varchar(64) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  UNIQUE KEY `facebook_id` (`facebook_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `pb_github_account`
--

CREATE TABLE `pb_github_account` (
  `user_id` int(11) unsigned NOT NULL,
  `github_id` int(11) unsigned NOT NULL,
  `github_name` varchar(64) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  UNIQUE KEY `github_id` (`github_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `pb_rss_categories`
--

CREATE TABLE `pb_rss_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `pb_rss_entries`
--

CREATE TABLE `pb_rss_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rss_id` int(11) NOT NULL,
  `entiry_url` varchar(255) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `pb_rss_urls`
--

CREATE TABLE `pb_rss_urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `pb_tags`
--

CREATE TABLE `pb_tags` (
  `url_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  KEY `url_id` (`url_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `pb_twitter_account`
--

CREATE TABLE `pb_twitter_account` (
  `user_id` int(11) unsigned NOT NULL,
  `twitter_id` int(10) unsigned NOT NULL,
  `twitter_name` varchar(64) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  UNIQUE KEY `twttier_id` (`twitter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `pb_urls`
--

CREATE TABLE `pb_urls` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `url` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `pb_users`
--

CREATE TABLE `pb_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `token` varchar(64) DEFAULT NULL,
  `twitter_access_token` varchar(255) DEFAULT NULL,
  `facebook_access_token` varchar(255) DEFAULT NULL,
  `github_access_token` varchar(255) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `salt` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `pb_user_emails`
--

CREATE TABLE `pb_user_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL,
  `activation_code` varchar(64) DEFAULT NULL,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `expired_at` datetime NOT NULL,
  `primary_use` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `activation_code` (`activation_code`),
  KEY `primary_use` (`primary_use`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
