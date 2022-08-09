# Any SQL files included in the database/backups directory will be
# imported as Vagrant boots up. To best manage expectations, these
# databases should be created in advance with proper user permissions
# so that any code bases configured to work with them will start
# without trouble.
#
# Create a copy of this file as "init-custom.sql" in the database directory
# and add any additional SQL commands that should run on startup. Most likely
# these will be similar to the following - with CREATE DATABASE and GRANT ALL,
# but it can be any command.
#


/*!40101 SET character_set_client = 'utf8' */;

-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 09, 2022 at 11:15 AM
-- Server version: 10.5.16-MariaDB-1:10.5.16+maria~focal
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


-- Database: `inkuahubdev`
--
CREATE DATABASE IF NOT EXISTS `inkuahubdev` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `inkuahubdev`;

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE IF NOT EXISTS `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `object_model` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `object_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`id`, `class`, `module`, `object_model`, `object_id`) VALUES
(1, 'humhub\\modules\\space\\activities\\Created', 'space', 'humhub\\modules\\space\\models\\Space', 1),
(2, 'humhub\\modules\\content\\activities\\ContentCreated', 'content', 'humhub\\modules\\post\\models\\Post', 1),
(3, 'humhub\\modules\\space\\activities\\MemberAdded', 'space', 'humhub\\modules\\space\\models\\Space', 1),
(4, 'humhub\\modules\\space\\activities\\MemberAdded', 'space', 'humhub\\modules\\space\\models\\Space', 1),
(5, 'humhub\\modules\\content\\activities\\ContentCreated', 'content', 'humhub\\modules\\post\\models\\Post', 2),
(6, 'humhub\\modules\\comment\\activities\\NewComment', 'comment', 'humhub\\modules\\comment\\models\\Comment', 1),
(7, 'humhub\\modules\\comment\\activities\\NewComment', 'comment', 'humhub\\modules\\comment\\models\\Comment', 2),
(8, 'humhub\\modules\\like\\activities\\Liked', 'like', 'humhub\\modules\\like\\models\\Like', 1),
(9, 'humhub\\modules\\like\\activities\\Liked', 'like', 'humhub\\modules\\like\\models\\Like', 2),
(10, 'humhub\\modules\\content\\activities\\ContentCreated', 'content', 'humhub\\modules\\polls\\models\\Poll', 1),
(11, 'humhub\\modules\\polls\\activities\\NewVote', 'polls', 'humhub\\modules\\polls\\models\\Poll', 1),
(12, 'humhub\\modules\\comment\\activities\\NewComment', 'comment', 'humhub\\modules\\comment\\models\\Comment', 3),
(13, 'humhub\\modules\\polls\\activities\\NewVote', 'polls', 'humhub\\modules\\polls\\models\\Poll', 1),
(14, 'humhub\\modules\\comment\\activities\\NewComment', 'comment', 'humhub\\modules\\comment\\models\\Comment', 4),
(15, 'humhub\\modules\\space\\activities\\MemberAdded', 'space', 'humhub\\modules\\space\\models\\Space', 1),
(16, 'humhub\\modules\\space\\activities\\Created', 'space', 'humhub\\modules\\space\\models\\Space', 2),
(17, 'humhub\\modules\\space\\activities\\Created', 'space', 'humhub\\modules\\space\\models\\Space', 3),
(18, 'humhub\\modules\\space\\activities\\MemberAdded', 'space', 'humhub\\modules\\space\\models\\Space', 2),
(19, 'humhub\\modules\\space\\activities\\Created', 'space', 'humhub\\modules\\space\\models\\Space', 4),
(20, 'humhub\\modules\\space\\activities\\Created', 'space', 'humhub\\modules\\space\\models\\Space', 5),
(21, 'humhub\\modules\\content\\activities\\ContentCreated', 'content', 'humhub\\modules\\post\\models\\Post', 3),
(22, 'humhub\\modules\\content\\activities\\ContentCreated', 'content', 'humhub\\modules\\wiki\\models\\WikiPage', 1),
(23, 'humhub\\modules\\content\\activities\\ContentCreated', 'content', 'humhub\\modules\\post\\models\\Post', 4),
(24, 'humhub\\modules\\content\\activities\\ContentCreated', 'content', 'humhub\\modules\\post\\models\\Post', 5),
(25, 'humhub\\modules\\polls\\activities\\NewVote', 'polls', 'humhub\\modules\\polls\\models\\Poll', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cfiles_file`
--

CREATE TABLE IF NOT EXISTS `cfiles_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_folder_id` int(11) DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `download_count` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_cfiles_file_parent_folder` (`parent_folder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cfiles_folder`
--

CREATE TABLE IF NOT EXISTS `cfiles_folder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_folder_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cfiles_folder_parent_folder` (`parent_folder_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cfiles_folder`
--

INSERT INTO `cfiles_folder` (`id`, `parent_folder_id`, `title`, `description`, `type`) VALUES
(1, NULL, 'Root', 'The root folder is the entry point that contains all available files.', 'root'),
(2, 1, 'Files from the stream', 'You can find all files that have been posted to this stream here.', 'posted'),
(3, NULL, 'Root', 'The root folder is the entry point that contains all available files.', 'root'),
(4, 3, 'Files from the stream', 'You can find all files that have been posted to this stream here.', 'posted'),
(5, NULL, 'Root', 'The root folder is the entry point that contains all available files.', 'root'),
(6, 5, 'Files from the stream', 'You can find all files that have been posted to this stream here.', 'posted');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment-created_by` (`created_by`),
  KEY `idx_comment_target` (`object_id`,`object_model`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `message`, `object_model`, `object_id`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'Nike – Just buy it. :wink:', 'humhub\\modules\\post\\models\\Post', 2, '2022-08-08 11:00:53', 2, '2022-08-08 11:00:53', 2),
(2, 'Calvin Klein – Between love and madness lies obsession.', 'humhub\\modules\\post\\models\\Post', 2, '2022-08-08 11:00:53', 3, '2022-08-08 11:00:53', 3),
(3, 'Why don\'t we go to Bemelmans Bar?', 'humhub\\modules\\polls\\models\\Poll', 1, '2022-08-08 11:00:53', 2, '2022-08-08 11:00:53', 2),
(4, 'Again? ;Weary;', 'humhub\\modules\\polls\\models\\Poll', 1, '2022-08-08 11:00:53', 3, '2022-08-08 11:00:53', 3);

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE IF NOT EXISTS `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` int(11) NOT NULL,
  `visibility` tinyint(4) DEFAULT NULL,
  `pinned` tinyint(4) DEFAULT NULL,
  `archived` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locked_comments` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `stream_sort_date` datetime DEFAULT NULL,
  `stream_channel` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_object_model` (`object_model`,`object_id`),
  UNIQUE KEY `index_guid` (`guid`),
  KEY `fk-contentcontainer` (`contentcontainer_id`),
  KEY `fk-create-user` (`created_by`),
  KEY `fk-update-user` (`updated_by`),
  KEY `stream_channe` (`stream_channel`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `guid`, `object_model`, `object_id`, `visibility`, `pinned`, `archived`, `locked_comments`, `created_at`, `created_by`, `updated_at`, `updated_by`, `contentcontainer_id`, `stream_sort_date`, `stream_channel`) VALUES
(1, '28a23022-361b-4b64-9f19-bde080131f70', 'humhub\\modules\\activity\\models\\Activity', 1, 1, 0, '0', 0, '2022-08-08 11:00:49', 1, '2022-08-08 11:00:49', 1, 2, '2022-08-08 11:00:49', 'activity'),
(2, '0f395478-e553-4a4a-970d-c54631134dc8', 'humhub\\modules\\cfiles\\models\\Folder', 1, 1, 0, '0', 0, '2022-08-08 11:00:49', 1, '2022-08-08 11:00:49', 1, 2, '2022-08-08 11:00:49', NULL),
(3, 'ced387ac-984f-4a4d-af97-86b6716b9525', 'humhub\\modules\\cfiles\\models\\Folder', 2, 1, 0, '0', 0, '2022-08-08 11:00:49', 1, '2022-08-08 11:00:49', 1, 2, '2022-08-08 11:00:49', NULL),
(4, 'af6125ea-adfd-42ea-b048-3a4dd110bd6d', 'humhub\\modules\\post\\models\\Post', 1, 1, 0, '0', 0, '2022-08-08 11:00:49', 1, '2022-08-08 11:00:49', 1, 2, '2022-08-08 11:00:49', 'default'),
(5, 'c45bd57f-0749-44e7-9dbf-2e10524707c9', 'humhub\\modules\\activity\\models\\Activity', 2, 1, 0, '0', 0, '2022-08-08 11:00:49', 1, '2022-08-08 11:00:49', 1, 2, '2022-08-08 11:00:49', 'activity'),
(6, '40429363-d86b-455d-a547-15e51df15779', 'humhub\\modules\\activity\\models\\Activity', 3, 0, 0, '0', 0, '2022-08-08 11:00:52', 2, '2022-08-08 11:00:52', 1, 2, '2022-08-08 11:00:52', 'activity'),
(7, 'cccf279d-71a8-4821-80cb-3a870fa927fa', 'humhub\\modules\\activity\\models\\Activity', 4, 0, 0, '0', 0, '2022-08-08 11:00:52', 3, '2022-08-08 11:00:52', 1, 2, '2022-08-08 11:00:52', 'activity'),
(8, '29880c02-7ae7-434f-846c-93f83937996d', 'humhub\\modules\\post\\models\\Post', 2, 0, 0, '0', 0, '2022-08-08 11:00:53', 1, '2022-08-08 11:00:53', 1, 2, '2022-08-08 11:00:53', 'default'),
(9, 'db80d69f-73e6-455d-b247-f542c968259e', 'humhub\\modules\\activity\\models\\Activity', 5, 0, 0, '0', 0, '2022-08-08 11:00:53', 1, '2022-08-08 11:00:53', 1, 2, '2022-08-08 11:00:53', 'activity'),
(10, 'a044463e-c8a2-4303-aef1-ab243c57b6e6', 'humhub\\modules\\activity\\models\\Activity', 6, 0, 0, '0', 0, '2022-08-08 11:00:53', 2, '2022-08-08 11:00:53', 2, 2, '2022-08-08 11:00:53', 'activity'),
(11, '42a8c8a2-23e6-409e-bbfb-df7458eb269e', 'humhub\\modules\\activity\\models\\Activity', 7, 0, 0, '0', 0, '2022-08-08 11:00:53', 3, '2022-08-08 11:00:53', 3, 2, '2022-08-08 11:00:53', 'activity'),
(12, '60bd45b9-e482-43f6-81df-e57c2e3bbeda', 'humhub\\modules\\activity\\models\\Activity', 8, 0, 0, '0', 0, '2022-08-08 11:00:53', 3, '2022-08-08 11:00:53', 3, 2, '2022-08-08 11:00:53', 'activity'),
(13, '056f3338-5f65-470b-b800-1a47dbdc47b4', 'humhub\\modules\\activity\\models\\Activity', 9, 0, 0, '0', 0, '2022-08-08 11:00:53', 3, '2022-08-08 11:00:53', 3, 2, '2022-08-08 11:00:53', 'activity'),
(14, '02c4e91b-c338-4285-b8ae-137bc968bc99', 'humhub\\modules\\polls\\models\\Poll', 1, 0, 0, '0', 0, '2022-08-08 11:00:53', 1, '2022-08-08 11:00:53', 1, 2, '2022-08-08 11:00:53', 'default'),
(15, '32c5b176-e549-4e51-a2ce-d7f4bca97074', 'humhub\\modules\\activity\\models\\Activity', 10, 0, 0, '0', 0, '2022-08-08 11:00:53', 1, '2022-08-08 11:00:53', 1, 2, '2022-08-08 11:00:53', 'activity'),
(16, '06648599-70e6-41f7-bb0c-570b82b5764a', 'humhub\\modules\\activity\\models\\Activity', 11, 0, 0, '0', 0, '2022-08-08 11:00:53', 2, '2022-08-08 11:00:53', 2, 2, '2022-08-08 11:00:53', 'activity'),
(17, '46c9f8ba-99dc-45b8-ba3c-82cef0b6301b', 'humhub\\modules\\activity\\models\\Activity', 12, 0, 0, '0', 0, '2022-08-08 11:00:53', 2, '2022-08-08 11:00:53', 2, 2, '2022-08-08 11:00:53', 'activity'),
(18, 'ff76f9a0-2619-48c4-ab38-cef7afe40e91', 'humhub\\modules\\activity\\models\\Activity', 13, 0, 0, '0', 0, '2022-08-08 11:00:53', 3, '2022-08-08 11:00:53', 3, 2, '2022-08-08 11:00:53', 'activity'),
(19, 'bce623aa-0e3c-44af-91a0-0b29f60065e7', 'humhub\\modules\\activity\\models\\Activity', 14, 0, 0, '0', 0, '2022-08-08 11:00:53', 3, '2022-08-08 11:00:53', 3, 2, '2022-08-08 11:00:53', 'activity'),
(20, 'c5468a66-cc0b-45e3-89f4-54c4a8e1ae32', 'humhub\\modules\\activity\\models\\Activity', 15, 0, 0, '0', 0, '2022-08-08 13:16:50', 4, '2022-08-08 13:16:50', NULL, 2, '2022-08-08 13:16:50', 'activity'),
(21, 'd107137a-25f4-4dcf-8b34-2005cc1b3167', 'humhub\\modules\\activity\\models\\Activity', 16, 1, 0, '0', 0, '2022-08-08 15:51:07', 1, '2022-08-08 15:51:07', 1, 6, '2022-08-08 15:51:07', 'activity'),
(22, '6b49f74e-4d75-4c56-9aa9-ea032df4a67c', 'humhub\\modules\\cfiles\\models\\Folder', 3, 1, 0, '0', 0, '2022-08-08 15:51:16', 1, '2022-08-08 15:51:16', 1, 6, '2022-08-08 15:51:16', NULL),
(23, '8d199815-e81c-48dd-a34d-5e0e603dab99', 'humhub\\modules\\cfiles\\models\\Folder', 4, 1, 0, '0', 0, '2022-08-08 15:51:16', 1, '2022-08-08 15:51:16', 1, 6, '2022-08-08 15:51:16', NULL),
(24, '843e797e-25cf-4990-906b-98ad23a04c81', 'humhub\\modules\\activity\\models\\Activity', 17, 1, 0, '0', 0, '2022-08-08 15:53:57', 1, '2022-08-08 15:53:57', 1, 7, '2022-08-08 15:53:57', 'activity'),
(25, '070dfb17-a5ee-4b97-baa3-9b9ad86a7811', 'humhub\\modules\\activity\\models\\Activity', 18, 0, 0, '0', 0, '2022-08-08 16:00:13', 4, '2022-08-08 16:00:13', 4, 6, '2022-08-08 16:00:13', 'activity'),
(26, 'c5ea7577-780a-46cd-8127-d7ae1bd166eb', 'humhub\\modules\\activity\\models\\Activity', 19, 1, 0, '0', 0, '2022-08-08 16:02:01', 1, '2022-08-08 16:02:01', 1, 8, '2022-08-08 16:02:01', 'activity'),
(27, '4bcc5d7c-6c46-4f0c-a589-a0c5c8090ddd', 'humhub\\modules\\activity\\models\\Activity', 20, 1, 0, '0', 0, '2022-08-08 16:02:21', 1, '2022-08-08 16:02:21', 1, 9, '2022-08-08 16:02:21', 'activity'),
(28, '53ee2841-a007-4b21-ad01-247073a27d85', 'humhub\\modules\\cfiles\\models\\Folder', 5, 1, 0, '0', 0, '2022-08-08 16:02:26', 1, '2022-08-08 16:02:26', 1, 9, '2022-08-08 16:02:26', NULL),
(29, '253b78bb-f252-48d5-bc67-887e0830b0c4', 'humhub\\modules\\cfiles\\models\\Folder', 6, 1, 0, '0', 0, '2022-08-08 16:02:26', 1, '2022-08-08 16:02:26', 1, 9, '2022-08-08 16:02:26', NULL),
(30, 'ab228a5a-6b6a-4d9d-b850-05a293625c05', 'humhub\\modules\\post\\models\\Post', 3, 0, 0, '0', 0, '2022-08-08 16:03:20', 1, '2022-08-08 16:03:20', 1, 9, '2022-08-08 16:03:20', 'default'),
(31, '68323157-396e-4fed-a2c5-d0a91ba989d5', 'humhub\\modules\\activity\\models\\Activity', 21, 0, 0, '0', 0, '2022-08-08 16:03:20', 1, '2022-08-08 16:03:20', 1, 9, '2022-08-08 16:03:20', 'activity'),
(32, '4e55e6ce-6e83-4635-a44b-d26d22178ea3', 'humhub\\modules\\wiki\\models\\WikiPage', 1, 0, 0, '0', 0, '2022-08-08 16:04:47', 1, '2022-08-08 16:04:47', 1, 9, '2022-08-08 16:04:47', 'default'),
(33, '9fab0a84-52be-47fd-b584-eff5e69d7878', 'humhub\\modules\\activity\\models\\Activity', 22, 0, 0, '0', 0, '2022-08-08 16:04:47', 1, '2022-08-08 16:04:47', 1, 9, '2022-08-08 16:04:47', 'activity'),
(34, '406ab9a2-a484-46ae-8ecc-089f8cb22aac', 'humhub\\modules\\post\\models\\Post', 4, 0, 0, '0', 0, '2022-08-08 17:00:51', 1, '2022-08-08 17:00:51', 1, 6, '2022-08-08 17:00:51', 'default'),
(35, '5dcf38e6-2b1b-45f8-9983-c6bfc5e05896', 'humhub\\modules\\activity\\models\\Activity', 23, 0, 0, '0', 0, '2022-08-08 17:00:51', 1, '2022-08-08 17:00:51', 1, 6, '2022-08-08 17:00:51', 'activity'),
(36, 'a3cabd18-416f-4420-8245-8c7b4720c266', 'humhub\\modules\\post\\models\\Post', 5, 0, 0, '0', 0, '2022-08-08 17:01:47', 1, '2022-08-08 18:06:51', 1, 6, '2022-08-08 18:06:51', 'default'),
(37, 'f830e01f-9f09-4a5b-8926-26aeccb5e743', 'humhub\\modules\\activity\\models\\Activity', 24, 0, 0, '0', 0, '2022-08-08 17:01:47', 1, '2022-08-08 17:01:47', 1, 6, '2022-08-08 17:01:47', 'activity'),
(38, '34158b56-07f8-4c06-8144-7b743c86b3de', 'humhub\\modules\\activity\\models\\Activity', 25, 0, 0, '0', 0, '2022-08-08 17:05:22', 4, '2022-08-08 17:05:22', 4, 2, '2022-08-08 17:05:22', 'activity');

-- --------------------------------------------------------

--
-- Table structure for table `contentcontainer`
--

CREATE TABLE IF NOT EXISTS `contentcontainer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` char(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pk` int(11) DEFAULT NULL,
  `owner_user_id` int(11) DEFAULT NULL,
  `tags_cached` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_guid` (`guid`),
  UNIQUE KEY `unique_target` (`class`,`pk`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contentcontainer`
--

INSERT INTO `contentcontainer` (`id`, `guid`, `class`, `pk`, `owner_user_id`, `tags_cached`) VALUES
(1, '00178815-0b84-48df-82c3-2c6638b1dc62', 'humhub\\modules\\user\\models\\User', 1, 1, 'Administration, Support, HumHub'),
(2, 'd9efa8b0-43c9-414c-aae6-9cda660fe142', 'humhub\\modules\\space\\models\\Space', 1, 1, NULL),
(3, '3bc871df-f385-4407-9b20-49bd4d8f40dd', 'humhub\\modules\\user\\models\\User', 2, 2, 'Microsoft Office, Marketing, SEM, Digital Native'),
(4, '8431fd69-1ec3-4274-b6f7-fc398146ba11', 'humhub\\modules\\user\\models\\User', 3, 3, 'Yoga, Travel, English, German, French'),
(5, '6fee48bb-5dd2-416f-8834-eb33a7e5abbb', 'humhub\\modules\\user\\models\\User', 4, 4, NULL),
(6, '696c7770-88e3-4394-978b-e6b11592e83c', 'humhub\\modules\\space\\models\\Space', 2, 1, NULL),
(7, '048f7203-f574-4f1a-9d52-9db720233a72', 'humhub\\modules\\space\\models\\Space', 3, 1, NULL),
(8, 'b8fd071c-1c31-44ef-9d83-9d9391be197d', 'humhub\\modules\\space\\models\\Space', 4, 1, NULL),
(9, '6c53deac-e1d0-4558-87b6-ce8862528266', 'humhub\\modules\\space\\models\\Space', 5, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contentcontainer_blocked_users`
--

CREATE TABLE IF NOT EXISTS `contentcontainer_blocked_users` (
  `contentcontainer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`contentcontainer_id`,`user_id`),
  KEY `fk-contentcontainer-blocked-users-rel-user-id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contentcontainer_default_permission`
--

CREATE TABLE IF NOT EXISTS `contentcontainer_default_permission` (
  `permission_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contentcontainer_class` char(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`permission_id`,`group_id`,`module_id`,`contentcontainer_class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contentcontainer_module`
--

CREATE TABLE IF NOT EXISTS `contentcontainer_module` (
  `contentcontainer_id` int(11) NOT NULL,
  `module_id` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_state` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`contentcontainer_id`,`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contentcontainer_module`
--

INSERT INTO `contentcontainer_module` (`contentcontainer_id`, `module_id`, `module_state`) VALUES
(2, 'cfiles', 1),
(2, 'custom_pages', 1),
(2, 'polls', 1),
(2, 'tasks', 1),
(2, 'wiki', 1),
(6, 'cfiles', 1),
(6, 'custom_pages', 1),
(6, 'tasks', 1),
(6, 'wiki', 1),
(7, 'custom_pages', 1),
(7, 'wiki', 1),
(9, 'cfiles', 1),
(9, 'custom_pages', 1),
(9, 'tasks', 1),
(9, 'wiki', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contentcontainer_permission`
--

CREATE TABLE IF NOT EXISTS `contentcontainer_permission` (
  `permission_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contentcontainer_id` int(11) NOT NULL,
  `group_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`permission_id`,`group_id`,`module_id`,`contentcontainer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contentcontainer_setting`
--

CREATE TABLE IF NOT EXISTS `contentcontainer_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contentcontainer_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings-unique` (`module_id`,`contentcontainer_id`,`name`),
  KEY `fk-contentcontainerx` (`contentcontainer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contentcontainer_setting`
--

INSERT INTO `contentcontainer_setting` (`id`, `module_id`, `contentcontainer_id`, `name`, `value`) VALUES
(1, 'mail', 1, 'conversationCountTime', '1659958510'),
(2, 'mail', 1, 'conversationCount', '1'),
(6, 'activity', 1, 'mailSummaryLast', '1659974465'),
(7, 'activity', 3, 'mailSummaryLast', '1659974466'),
(8, 'activity', 4, 'mailSummaryLast', '1659974466'),
(9, 'activity', 5, 'mailSummaryLast', '1659974467');

-- --------------------------------------------------------

--
-- Table structure for table `contentcontainer_tag`
--

CREATE TABLE IF NOT EXISTS `contentcontainer_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contentcontainer_class` char(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique-contentcontainer-tag` (`contentcontainer_class`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contentcontainer_tag`
--

INSERT INTO `contentcontainer_tag` (`id`, `name`, `contentcontainer_class`) VALUES
(1, 'Administration', 'humhub\\modules\\user\\models\\User'),
(7, 'Digital Native', 'humhub\\modules\\user\\models\\User'),
(10, 'English', 'humhub\\modules\\user\\models\\User'),
(12, 'French', 'humhub\\modules\\user\\models\\User'),
(11, 'German', 'humhub\\modules\\user\\models\\User'),
(3, 'HumHub', 'humhub\\modules\\user\\models\\User'),
(5, 'Marketing', 'humhub\\modules\\user\\models\\User'),
(4, 'Microsoft Office', 'humhub\\modules\\user\\models\\User'),
(6, 'SEM', 'humhub\\modules\\user\\models\\User'),
(2, 'Support', 'humhub\\modules\\user\\models\\User'),
(9, 'Travel', 'humhub\\modules\\user\\models\\User'),
(8, 'Yoga', 'humhub\\modules\\user\\models\\User');

-- --------------------------------------------------------

--
-- Table structure for table `contentcontainer_tag_relation`
--

CREATE TABLE IF NOT EXISTS `contentcontainer_tag_relation` (
  `contentcontainer_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`contentcontainer_id`,`tag_id`),
  KEY `fk-contentcontainer-tag-rel-tag-id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contentcontainer_tag_relation`
--

INSERT INTO `contentcontainer_tag_relation` (`contentcontainer_id`, `tag_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 12);

-- --------------------------------------------------------

--
-- Table structure for table `content_tag`
--

CREATE TABLE IF NOT EXISTS `content_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx-content-tag` (`module_id`,`contentcontainer_id`,`name`),
  KEY `fk-content-tag-container-id` (`contentcontainer_id`),
  KEY `fk-content-tag-parent-id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_tag`
--

INSERT INTO `content_tag` (`id`, `name`, `module_id`, `contentcontainer_id`, `type`, `parent_id`, `color`, `sort_order`) VALUES
(1, 'Topic', 'topic', 6, 'humhub\\modules\\topic\\models\\Topic', NULL, NULL, 0),
(2, 'Important', 'topic', 6, 'humhub\\modules\\topic\\models\\Topic', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `content_tag_relation`
--

CREATE TABLE IF NOT EXISTS `content_tag_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-content-tag-rel-content-id` (`content_id`),
  KEY `fk-content-tag-rel-tag-id` (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_tag_relation`
--

INSERT INTO `content_tag_relation` (`id`, `content_id`, `tag_id`) VALUES
(2, 36, 1),
(3, 36, 2);

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages_container_page`
--

CREATE TABLE IF NOT EXISTS `custom_pages_container_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` smallint(6) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `in_new_window` tinyint(1) DEFAULT 0,
  `admin_only` tinyint(1) DEFAULT 0,
  `cssClass` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SpaceMenu',
  `abstract` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages_container_snippet`
--

CREATE TABLE IF NOT EXISTS `custom_pages_container_snippet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` smallint(6) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `admin_only` tinyint(1) DEFAULT 0,
  `cssClass` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SpaceStreamSidebar',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages_page`
--

CREATE TABLE IF NOT EXISTS `custom_pages_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_content` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_only` tinyint(1) DEFAULT 0,
  `in_new_window` tinyint(1) DEFAULT 0,
  `cssClass` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abstract` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `custom-page-url-unique` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages_snippet`
--

CREATE TABLE IF NOT EXISTS `custom_pages_snippet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` smallint(6) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_only` tinyint(1) DEFAULT 0,
  `cssClass` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages_template`
--

CREATE TABLE IF NOT EXISTS `custom_pages_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `engine` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allow_for_spaces` tinyint(1) DEFAULT 0,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `allow_inline_activation` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_tmpl_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_pages_template`
--

INSERT INTO `custom_pages_template` (`id`, `name`, `engine`, `description`, `source`, `allow_for_spaces`, `type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `allow_inline_activation`) VALUES
(1, 'system_two_column_layout', 'twig', 'Simple two column layout.', '<div class=\"row\">\n <div class=\"col-md-8\">\n    <div class=\"panel panel-default\">\n     <div class=\"panel-body\">\n        {{ content }}\n     </div>\n    </div>\n  </div>\n  <div class=\"col-md-4\">\n    <div class=\"panel panel-default\">\n     <div class=\"panel-body\">\n        {{ sidebar_container }}\n     </div>\n    </div>\n  </div>\n</div>', 0, 'layout', '2022-08-08 10:59:48', NULL, NULL, NULL, 0),
(2, 'system_one_column_layout', 'twig', 'Simple one column layout.', '<div class=\"row\">\n <div class=\"col-md-12\">\n            <div class=\"panel panel-default\">\n      <div class=\"panel-body\">\n                            {{ content }}\n                        </div>\n            </div>\n </div>\n</div>', 0, 'layout', '2022-08-08 10:59:48', NULL, NULL, NULL, 0),
(3, 'system_headline_container', 'twig', 'Simple headline row with background image.', '{% if background.empty %}\n    {% set bg = assets[\'bgImage2.jpg\']  %}\n{% else %}\n    {% set bg =  background %}\n{% endif %}\n\n<div style=\"height:218px;overflow:hidden;color:#fff;background-image: url(\'{{ bg }}\');background-position:50% 50%;text-align:center;\">\n  <div style=\"padding-top:40px;\">\n   <h1 style=\"color:#fff;font-size:36px;margin:20px 0 10px;\">{{ heading }}</h1>\n    <hr style=\"max-width:100px;border-width:3px;\">\n     <span>{{ subheading }}</span>\n     </div>\n</div>', 0, 'container', '2022-08-08 10:59:48', NULL, NULL, NULL, 0),
(4, 'system_article_container', 'twig', 'Simple richtext article.', '<div style=\"margin-top:15px;\">\n <div style=\"padding:0 15px;\">\n   {{ content }}\n </div>\n</div>', 0, 'container', '2022-08-08 10:59:48', NULL, NULL, NULL, 0),
(5, 'system_simple_snippet_layout', 'twig', 'Simple snippet layout with head container and richtext.', '<div>\n        {{ heading }}\n</div>\n<div style=\"margin-top:15px;\">\n  {{ content }}\n</div>', 0, 'snipped-layout', '2022-08-08 10:59:48', NULL, NULL, NULL, 0),
(6, 'system_download_item', 'twig', 'Single download item.', '<div class=\"download-item\">\n    {{ file_download }}\n</div>', 0, 'container', '2022-08-08 10:59:49', NULL, NULL, NULL, 0),
(7, 'system_download_list', 'twig', 'File download list.', '<div class=\"download-list\">\n    {{ download_list }}\n</div>', 0, 'container', '2022-08-08 10:59:49', NULL, NULL, NULL, 0),
(8, 'system_plain_layout', 'twig', 'Simple container layout.', '{{ content }}', 0, 'layout', '2022-08-08 10:59:49', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages_template_container`
--

CREATE TABLE IF NOT EXISTS `custom_pages_template_container` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-tmpl-template` (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages_template_container_content`
--

CREATE TABLE IF NOT EXISTS `custom_pages_template_container_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `definition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-tmpl-container-definition` (`definition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_pages_template_container_content`
--

INSERT INTO `custom_pages_template_container_content` (`id`, `definition_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages_template_container_content_definition`
--

CREATE TABLE IF NOT EXISTS `custom_pages_template_container_content_definition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `allow_multiple` tinyint(1) DEFAULT 0,
  `is_inline` tinyint(1) DEFAULT 0,
  `is_default` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_pages_template_container_content_definition`
--

INSERT INTO `custom_pages_template_container_content_definition` (`id`, `allow_multiple`, `is_inline`, `is_default`) VALUES
(1, 1, 0, 1),
(2, 1, 0, 1),
(3, 1, 0, 1),
(4, 0, 0, 1),
(5, 1, 0, 1),
(6, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages_template_container_content_item`
--

CREATE TABLE IF NOT EXISTS `custom_pages_template_container_content_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `container_content_id` int(11) NOT NULL,
  `sort_order` int(11) DEFAULT 100,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-tmpl-container-item-tmpl` (`template_id`),
  KEY `fk-tmpl-container-item-content` (`container_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages_template_container_content_template`
--

CREATE TABLE IF NOT EXISTS `custom_pages_template_container_content_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `definition_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-tmpl-container-tmpl` (`template_id`),
  KEY `fk-tmpl-container-tmpl-definition` (`definition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_pages_template_container_content_template`
--

INSERT INTO `custom_pages_template_container_content_template` (`id`, `template_id`, `definition_id`) VALUES
(1, 3, 4),
(2, 6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages_template_element`
--

CREATE TABLE IF NOT EXISTS `custom_pages_template_element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-tmpl-element-tmpl` (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_pages_template_element`
--

INSERT INTO `custom_pages_template_element` (`id`, `template_id`, `name`, `content_type`, `title`) VALUES
(1, 1, 'content', 'humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent', NULL),
(2, 1, 'sidebar_container', 'humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent', NULL),
(3, 2, 'content', 'humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent', NULL),
(4, 3, 'heading', 'humhub\\modules\\custom_pages\\modules\\template\\models\\TextContent', NULL),
(5, 3, 'subheading', 'humhub\\modules\\custom_pages\\modules\\template\\models\\TextContent', NULL),
(6, 3, 'background', 'humhub\\modules\\custom_pages\\modules\\template\\models\\FileContent', NULL),
(7, 4, 'content', 'humhub\\modules\\custom_pages\\modules\\template\\models\\RichtextContent', NULL),
(8, 5, 'heading', 'humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent', NULL),
(9, 5, 'content', 'humhub\\modules\\custom_pages\\modules\\template\\models\\RichtextContent', NULL),
(10, 6, 'file_download', 'humhub\\modules\\custom_pages\\modules\\template\\models\\FileDownloadContent', 'File'),
(11, 7, 'download_list', 'humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent', 'File List'),
(12, 8, 'content', 'humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages_template_file_content`
--

CREATE TABLE IF NOT EXISTS `custom_pages_template_file_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_guid` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages_template_file_download_content`
--

CREATE TABLE IF NOT EXISTS `custom_pages_template_file_download_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_guid` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `style` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cssClass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `showFileinfo` tinyint(1) DEFAULT 1,
  `showIcon` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages_template_hh_richtext_content`
--

CREATE TABLE IF NOT EXISTS `custom_pages_template_hh_richtext_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages_template_image_content`
--

CREATE TABLE IF NOT EXISTS `custom_pages_template_image_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_guid` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `definition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-tmpl-image-definition` (`definition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages_template_image_content_definition`
--

CREATE TABLE IF NOT EXISTS `custom_pages_template_image_content_definition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `height` int(10) DEFAULT NULL,
  `width` int(10) DEFAULT NULL,
  `style` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages_template_owner_content`
--

CREATE TABLE IF NOT EXISTS `custom_pages_template_owner_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `element_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) NOT NULL,
  `content_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_id` int(11) NOT NULL,
  `use_default` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_pages_template_owner_content`
--

INSERT INTO `custom_pages_template_owner_content` (`id`, `element_name`, `owner_model`, `owner_id`, `content_type`, `content_id`, `use_default`) VALUES
(1, 'content', 'humhub\\modules\\custom_pages\\modules\\template\\models\\Template', 1, 'humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent', 1, 0),
(2, 'sidebar_container', 'humhub\\modules\\custom_pages\\modules\\template\\models\\Template', 1, 'humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent', 2, 0),
(3, 'content', 'humhub\\modules\\custom_pages\\modules\\template\\models\\Template', 2, 'humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent', 3, 0),
(4, 'heading', 'humhub\\modules\\custom_pages\\modules\\template\\models\\Template', 3, 'humhub\\modules\\custom_pages\\modules\\template\\models\\TextContent', 1, 0),
(5, 'subheading', 'humhub\\modules\\custom_pages\\modules\\template\\models\\Template', 3, 'humhub\\modules\\custom_pages\\modules\\template\\models\\TextContent', 2, 0),
(6, 'content', 'humhub\\modules\\custom_pages\\modules\\template\\models\\Template', 4, 'humhub\\modules\\custom_pages\\modules\\template\\models\\RichtextContent', 1, 0),
(7, 'heading', 'humhub\\modules\\custom_pages\\modules\\template\\models\\Template', 5, 'humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent', 4, 0),
(8, 'content', 'humhub\\modules\\custom_pages\\modules\\template\\models\\Template', 5, 'humhub\\modules\\custom_pages\\modules\\template\\models\\RichtextContent', 2, 0),
(9, 'download_list', 'humhub\\modules\\custom_pages\\modules\\template\\models\\Template', 7, 'humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent', 5, 0),
(10, 'content', 'humhub\\modules\\custom_pages\\modules\\template\\models\\Template', 8, 'humhub\\modules\\custom_pages\\modules\\template\\models\\ContainerContent', 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages_template_richtext_content`
--

CREATE TABLE IF NOT EXISTS `custom_pages_template_richtext_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_pages_template_richtext_content`
--

INSERT INTO `custom_pages_template_richtext_content` (`id`, `content`) VALUES
(1, '<h1>This is a&nbsp;simple article!</h1>\n\n<hr />\n<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>\n'),
(2, '<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages_template_text_content`
--

CREATE TABLE IF NOT EXISTS `custom_pages_template_text_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `inline_text` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_pages_template_text_content`
--

INSERT INTO `custom_pages_template_text_content` (`id`, `content`, `inline_text`) VALUES
(1, 'My Headline', 1),
(2, 'My Subheadline', 1);

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE IF NOT EXISTS `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_model` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `object_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `content_id` int(11) UNSIGNED DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mime_type` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `show_in_stream` tinyint(1) DEFAULT 1,
  `hash_sha1` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_object` (`object_model`,`object_id`),
  KEY `fk_file-created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_history`
--

CREATE TABLE IF NOT EXISTS `file_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL,
  `size` bigint(20) NOT NULL,
  `hash_sha1` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_file_history` (`file_id`),
  KEY `fk_file_history_user` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_dn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin_group` tinyint(1) NOT NULL DEFAULT 0,
  `is_default_group` tinyint(1) NOT NULL DEFAULT 0,
  `is_protected` tinyint(1) NOT NULL DEFAULT 0,
  `show_at_registration` tinyint(1) NOT NULL DEFAULT 1,
  `show_at_directory` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 100,
  `notify_users` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`id`, `name`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `ldap_dn`, `is_admin_group`, `is_default_group`, `is_protected`, `show_at_registration`, `show_at_directory`, `sort_order`, `notify_users`) VALUES
(1, 'Administrators', 'Default group for administrators of this HumHub Installation', '2022-08-08 10:58:52', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 100, 0),
(2, 'Users', 'Default group for all newly registered users of the network', '2022-08-08 10:58:56', NULL, '2022-08-08 10:58:56', NULL, NULL, 0, 1, 0, 1, 0, 100, 0);

-- --------------------------------------------------------

--
-- Table structure for table `group_permission`
--

CREATE TABLE IF NOT EXISTS `group_permission` (
  `permission_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_id` int(11) NOT NULL,
  `module_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`permission_id`,`group_id`,`module_id`),
  KEY `fk_group_permission-group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_space`
--

CREATE TABLE IF NOT EXISTS `group_space` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `space_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx-group_space` (`space_id`,`group_id`),
  KEY `fk-group_space-group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_user`
--

CREATE TABLE IF NOT EXISTS `group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `is_group_manager` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx-group_user` (`user_id`,`group_id`),
  KEY `fk-group-group` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_user`
--

INSERT INTO `group_user` (`id`, `user_id`, `group_id`, `is_group_manager`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, 2, 0, '2022-08-08 11:00:49', NULL, '2022-08-08 11:00:49', NULL),
(2, 1, 1, 0, '2022-08-08 11:00:49', NULL, '2022-08-08 11:00:49', NULL),
(3, 2, 2, 0, '2022-08-08 11:00:52', 1, '2022-08-08 11:00:52', 1),
(4, 3, 2, 0, '2022-08-08 11:00:52', 1, '2022-08-08 11:00:52', 1),
(5, 4, 2, 0, '2022-08-08 13:16:50', NULL, '2022-08-08 13:16:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `like`
--

CREATE TABLE IF NOT EXISTS `like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_user_id` int(11) DEFAULT NULL,
  `object_model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_object` (`object_model`,`object_id`),
  KEY `fk_like-created_by` (`created_by`),
  KEY `fk_like-target_user_id` (`target_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `like`
--

INSERT INTO `like` (`id`, `target_user_id`, `object_model`, `object_id`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, NULL, 'humhub\\modules\\comment\\models\\Comment', 1, '2022-08-08 11:00:53', 3, '2022-08-08 11:00:53', 3),
(2, NULL, 'humhub\\modules\\post\\models\\Post', 2, '2022-08-08 11:00:53', 3, '2022-08-08 11:00:53', 3);

-- --------------------------------------------------------

--
-- Table structure for table `live`
--

CREATE TABLE IF NOT EXISTS `live` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `visibility` int(1) DEFAULT NULL,
  `serialized_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contentcontainer` (`contentcontainer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_time` double DEFAULT NULL,
  `prefix` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_log_level` (`level`),
  KEY `idx_log_category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `level`, `category`, `log_time`, `prefix`, `message`) VALUES
(1, 1, 'InvalidArgumentException', 1659956494.214, '[192.168.56.1][-][93jpc7ng0oc65jo7k8328h0knb]', 'InvalidArgumentException: Unsupported sendmail command flags \"/usr/local/bin/mhsendmail\"; must be one of \"-bs\" or \"-t\" but can include additional flags. in /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport/SendmailTransport.php:58\nStack trace:\n#0 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport/NativeTransportFactory.php(33): Symfony\\Component\\Mailer\\Transport\\SendmailTransport->__construct()\n#1 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(172): Symfony\\Component\\Mailer\\Transport\\NativeTransportFactory->create()\n#2 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(161): Symfony\\Component\\Mailer\\Transport->fromDsnObject()\n#3 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(113): Symfony\\Component\\Mailer\\Transport->parseDsn()\n#4 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2-symfonymailer/src/Mailer.php(114): Symfony\\Component\\Mailer\\Transport->fromString()\n#5 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2-symfonymailer/src/Mailer.php(81): yii\\symfonymailer\\Mailer->createTransport()\n#6 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Component.php(180): yii\\symfonymailer\\Mailer->setTransport()\n#7 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/BaseYii.php(558): yii\\base\\Component->__set()\n#8 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/BaseObject.php(107): yii\\BaseYii::configure()\n#9 [internal function]: yii\\base\\BaseObject->__construct()\n#10 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/Container.php(419): ReflectionClass->newInstanceArgs()\n#11 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/Container.php(170): yii\\di\\Container->build()\n#12 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/BaseYii.php(365): yii\\di\\Container->get()\n#13 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/ServiceLocator.php(137): yii\\BaseYii::createObject()\n#14 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Module.php(766): yii\\di\\ServiceLocator->get()\n#15 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/ServiceLocator.php(74): yii\\base\\Module->get()\n#16 /srv/www/foobar/public_html/protected/humhub/modules/user/models/Invite.php(150): yii\\di\\ServiceLocator->__get()\n#17 /srv/www/foobar/public_html/protected/humhub/modules/user/models/Invite.php(132): humhub\\modules\\user\\models\\Invite->sendInviteMail()\n#18 /srv/www/foobar/public_html/protected/humhub/modules/user/controllers/AuthController.php(109): humhub\\modules\\user\\models\\Invite->selfInvite()\n#19 [internal function]: humhub\\modules\\user\\controllers\\AuthController->actionLogin()\n#20 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/InlineAction.php(57): call_user_func_array()\n#21 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Controller.php(178): yii\\base\\InlineAction->runWithParams()\n#22 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Module.php(552): yii\\base\\Controller->runAction()\n#23 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction()\n#24 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Application.php(384): yii\\web\\Application->handleRequest()\n#25 /srv/www/foobar/public_html/index.php(25): yii\\base\\Application->run()\n#26 {main}'),
(2, 4, 'application', 1659956494.0535, '[192.168.56.1][-][93jpc7ng0oc65jo7k8328h0knb]', '$_GET = [\n    \'r\' => \'user/auth/login\'\n]\n\n$_SERVER = [\n    \'PATH\' => \'/srv/www/phpcs/scripts/:/usr/local/bin:/usr/bin:/bin\'\n    \'USER\' => \'www-data\'\n    \'HOME\' => \'/var/www\'\n    \'HTTP_COOKIE\' => \'PHPSESSID=93jpc7ng0oc65jo7k8328h0knb; _csrf=b5e594d07ae0e894f98f02862ad6d4ab0a8990716901ef08ed68e45ab3111501a%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22C3GMrV3_2z5VcI4VEtRZSJUzVH0omSaH%22%3B%7D\'\n    \'HTTP_ACCEPT_LANGUAGE\' => \'en\'\n    \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate, br\'\n    \'HTTP_REFERER\' => \'https://dev.inkua.de/index.php?r=user%2Fauth%2Flogin\'\n    \'HTTP_SEC_FETCH_DEST\' => \'document\'\n    \'HTTP_SEC_FETCH_USER\' => \'?1\'\n    \'HTTP_SEC_FETCH_MODE\' => \'navigate\'\n    \'HTTP_SEC_FETCH_SITE\' => \'same-origin\'\n    \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9\'\n    \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36\'\n    \'HTTP_CONTENT_TYPE\' => \'application/x-www-form-urlencoded\'\n    \'HTTP_ORIGIN\' => \'https://dev.inkua.de\'\n    \'HTTP_UPGRADE_INSECURE_REQUESTS\' => \'1\'\n    \'HTTP_SEC_CH_UA_PLATFORM\' => \'\\\"Linux\\\"\'\n    \'HTTP_SEC_CH_UA_MOBILE\' => \'?0\'\n    \'HTTP_SEC_CH_UA\' => \'\\\"Chromium\\\";v=\\\"104\\\", \\\" Not A;Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"104\\\"\'\n    \'HTTP_CACHE_CONTROL\' => \'max-age=0\'\n    \'HTTP_CONTENT_LENGTH\' => \'161\'\n    \'HTTP_HOST\' => \'dev.inkua.de\'\n    \'SCRIPT_FILENAME\' => \'/srv/www/foobar/public_html/index.php\'\n    \'REDIRECT_STATUS\' => \'200\'\n    \'SERVER_NAME\' => \'dev.inkua.de\'\n    \'SERVER_PORT\' => \'443\'\n    \'SERVER_ADDR\' => \'192.168.56.4\'\n    \'REMOTE_PORT\' => \'50608\'\n    \'REMOTE_ADDR\' => \'192.168.56.1\'\n    \'SERVER_SOFTWARE\' => \'nginx/1.23.1\'\n    \'GATEWAY_INTERFACE\' => \'CGI/1.1\'\n    \'HTTPS\' => \'on\'\n    \'REQUEST_SCHEME\' => \'https\'\n    \'SERVER_PROTOCOL\' => \'HTTP/2.0\'\n    \'DOCUMENT_ROOT\' => \'/srv/www/foobar/public_html\'\n    \'DOCUMENT_URI\' => \'/index.php\'\n    \'REQUEST_URI\' => \'/index.php?r=user%2Fauth%2Flogin\'\n    \'SCRIPT_NAME\' => \'/index.php\'\n    \'CONTENT_LENGTH\' => \'161\'\n    \'CONTENT_TYPE\' => \'application/x-www-form-urlencoded\'\n    \'REQUEST_METHOD\' => \'POST\'\n    \'QUERY_STRING\' => \'r=user%2Fauth%2Flogin\'\n    \'FCGI_ROLE\' => \'RESPONDER\'\n    \'PHP_SELF\' => \'/index.php\'\n    \'REQUEST_TIME_FLOAT\' => 1659956494.0444\n    \'REQUEST_TIME\' => 1659956494\n]'),
(3, 1, 'InvalidArgumentException', 1659956584.4302, '[192.168.56.1][1][hq7onj49rcisolem9uusglpoh4]', 'InvalidArgumentException: Unsupported sendmail command flags \"/usr/local/bin/mhsendmail\"; must be one of \"-bs\" or \"-t\" but can include additional flags. in /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport/SendmailTransport.php:58\nStack trace:\n#0 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport/NativeTransportFactory.php(33): Symfony\\Component\\Mailer\\Transport\\SendmailTransport->__construct()\n#1 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(172): Symfony\\Component\\Mailer\\Transport\\NativeTransportFactory->create()\n#2 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(161): Symfony\\Component\\Mailer\\Transport->fromDsnObject()\n#3 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(113): Symfony\\Component\\Mailer\\Transport->parseDsn()\n#4 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2-symfonymailer/src/Mailer.php(114): Symfony\\Component\\Mailer\\Transport->fromString()\n#5 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2-symfonymailer/src/Mailer.php(81): yii\\symfonymailer\\Mailer->createTransport()\n#6 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Component.php(180): yii\\symfonymailer\\Mailer->setTransport()\n#7 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/BaseYii.php(558): yii\\base\\Component->__set()\n#8 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/BaseObject.php(107): yii\\BaseYii::configure()\n#9 [internal function]: yii\\base\\BaseObject->__construct()\n#10 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/Container.php(419): ReflectionClass->newInstanceArgs()\n#11 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/Container.php(170): yii\\di\\Container->build()\n#12 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/BaseYii.php(365): yii\\di\\Container->get()\n#13 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/ServiceLocator.php(137): yii\\BaseYii::createObject()\n#14 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Module.php(766): yii\\di\\ServiceLocator->get()\n#15 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/ServiceLocator.php(74): yii\\base\\Module->get()\n#16 /srv/www/foobar/public_html/protected/humhub/modules/ui/view/bootstrap/ThemeLoader.php(46): yii\\di\\ServiceLocator->__get()\n#17 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Application.php(325): humhub\\modules\\ui\\view\\bootstrap\\ThemeLoader->bootstrap()\n#18 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/web/Application.php(69): yii\\base\\Application->bootstrap()\n#19 /srv/www/foobar/public_html/protected/humhub/components/Application.php(67): yii\\web\\Application->bootstrap()\n#20 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Application.php(271): humhub\\components\\Application->bootstrap()\n#21 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/BaseObject.php(109): yii\\base\\Application->init()\n#22 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Application.php(204): yii\\base\\BaseObject->__construct()\n#23 /srv/www/foobar/public_html/protected/humhub/components/Application.php(49): yii\\base\\Application->__construct()\n#24 /srv/www/foobar/public_html/index.php(25): humhub\\components\\Application->__construct()\n#25 {main}'),
(4, 4, 'application', 1659956584.3742, '[192.168.56.1][1][hq7onj49rcisolem9uusglpoh4]', '$_GET = [\n    \'r\' => \'admin/setting/design\'\n]\n\n$_SERVER = [\n    \'PATH\' => \'/srv/www/phpcs/scripts/:/usr/local/bin:/usr/bin:/bin\'\n    \'USER\' => \'www-data\'\n    \'HOME\' => \'/var/www\'\n    \'HTTP_COOKIE\' => \'_ga=GA1.1.1012070144.1657021274; _ga_ZJ65V8HV37=GS1.1.1659446125.13.1.1659446423.0; PHPSESSID=hq7onj49rcisolem9uusglpoh4; _identity=c92fca1657f03898233c7b8d8a439be42760a3610d49351eae09649ef73c5f5ea%3A2%3A%7Bi%3A0%3Bs%3A9%3A%22_identity%22%3Bi%3A1%3Bs%3A50%3A%22%5B1%2C%2200178815-0b84-48df-82c3-2c6638b1dc62%22%2C2592000%5D%22%3B%7D; _csrf=dac24aa22da8f0eddbb76854d54e62d99cdf799fc9a457cb93398f683914bf26a%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22NOUphlDVanRNMKPFoBL9G0NiPOWY8PFz%22%3B%7D; uecUI=eyJ1YUluZm8iOnsidXNlcmFnZW50IjoiTW96aWxsYS81LjAgKFgxMTsgTGludXggaTY4NikgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgVWJ1bnR1IENocm9taXVtLzEwMy4wLjUwMDMuMTYxIENocm9tZS8xMDMuMC41MDAzLjE2MSBTYWZhcmkvNTM3LjM2IiwiZW5naW5lIjoiYmxpbmsiLCJvc1R5cGUiOiJsaW51eCJ9fQ--\'\n    \'HTTP_ACCEPT_LANGUAGE\' => \'en,es-AR;q=0.9,es;q=0.8,en-US;q=0.7\'\n    \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate, br\'\n    \'HTTP_REFERER\' => \'https://dev.inkua.de/index.php?r=admin%2Fsetting%2Fdesign\'\n    \'HTTP_SEC_CH_UA_PLATFORM\' => \'\\\"Linux\\\"\'\n    \'HTTP_SEC_CH_UA_MOBILE\' => \'?0\'\n    \'HTTP_SEC_CH_UA\' => \'\\\"Chromium\\\";v=\\\"104\\\", \\\" Not A;Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"104\\\"\'\n    \'HTTP_SEC_FETCH_DEST\' => \'document\'\n    \'HTTP_SEC_FETCH_USER\' => \'?1\'\n    \'HTTP_SEC_FETCH_MODE\' => \'navigate\'\n    \'HTTP_SEC_FETCH_SITE\' => \'same-origin\'\n    \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9\'\n    \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/103.0.5003.161 Chrome/103.0.5003.161 Safari/537.36\'\n    \'HTTP_UPGRADE_INSECURE_REQUESTS\' => \'1\'\n    \'HTTP_CACHE_CONTROL\' => \'max-age=0\'\n    \'HTTP_HOST\' => \'dev.inkua.de\'\n    \'SCRIPT_FILENAME\' => \'/srv/www/foobar/public_html/index.php\'\n    \'REDIRECT_STATUS\' => \'200\'\n    \'SERVER_NAME\' => \'dev.inkua.de\'\n    \'SERVER_PORT\' => \'443\'\n    \'SERVER_ADDR\' => \'192.168.56.4\'\n    \'REMOTE_PORT\' => \'59752\'\n    \'REMOTE_ADDR\' => \'192.168.56.1\'\n    \'SERVER_SOFTWARE\' => \'nginx/1.23.1\'\n    \'GATEWAY_INTERFACE\' => \'CGI/1.1\'\n    \'HTTPS\' => \'on\'\n    \'REQUEST_SCHEME\' => \'https\'\n    \'SERVER_PROTOCOL\' => \'HTTP/2.0\'\n    \'DOCUMENT_ROOT\' => \'/srv/www/foobar/public_html\'\n    \'DOCUMENT_URI\' => \'/index.php\'\n    \'REQUEST_URI\' => \'/index.php?r=admin%2Fsetting%2Fdesign\'\n    \'SCRIPT_NAME\' => \'/index.php\'\n    \'CONTENT_LENGTH\' => \'\'\n    \'CONTENT_TYPE\' => \'\'\n    \'REQUEST_METHOD\' => \'GET\'\n    \'QUERY_STRING\' => \'r=admin%2Fsetting%2Fdesign\'\n    \'FCGI_ROLE\' => \'RESPONDER\'\n    \'PHP_SELF\' => \'/index.php\'\n    \'REQUEST_TIME_FLOAT\' => 1659956584.3714\n    \'REQUEST_TIME\' => 1659956584\n]'),
(5, 1, 'InvalidArgumentException', 1659956591.8205, '[192.168.56.1][1][hq7onj49rcisolem9uusglpoh4]', 'InvalidArgumentException: Unsupported sendmail command flags \"/usr/local/bin/mhsendmail\"; must be one of \"-bs\" or \"-t\" but can include additional flags. in /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport/SendmailTransport.php:58\nStack trace:\n#0 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport/NativeTransportFactory.php(33): Symfony\\Component\\Mailer\\Transport\\SendmailTransport->__construct()\n#1 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(172): Symfony\\Component\\Mailer\\Transport\\NativeTransportFactory->create()\n#2 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(161): Symfony\\Component\\Mailer\\Transport->fromDsnObject()\n#3 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(113): Symfony\\Component\\Mailer\\Transport->parseDsn()\n#4 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2-symfonymailer/src/Mailer.php(114): Symfony\\Component\\Mailer\\Transport->fromString()\n#5 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2-symfonymailer/src/Mailer.php(81): yii\\symfonymailer\\Mailer->createTransport()\n#6 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Component.php(180): yii\\symfonymailer\\Mailer->setTransport()\n#7 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/BaseYii.php(558): yii\\base\\Component->__set()\n#8 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/BaseObject.php(107): yii\\BaseYii::configure()\n#9 [internal function]: yii\\base\\BaseObject->__construct()\n#10 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/Container.php(419): ReflectionClass->newInstanceArgs()\n#11 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/Container.php(170): yii\\di\\Container->build()\n#12 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/BaseYii.php(365): yii\\di\\Container->get()\n#13 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/ServiceLocator.php(137): yii\\BaseYii::createObject()\n#14 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Module.php(766): yii\\di\\ServiceLocator->get()\n#15 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/ServiceLocator.php(74): yii\\base\\Module->get()\n#16 /srv/www/foobar/public_html/protected/humhub/modules/ui/view/bootstrap/ThemeLoader.php(46): yii\\di\\ServiceLocator->__get()\n#17 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Application.php(325): humhub\\modules\\ui\\view\\bootstrap\\ThemeLoader->bootstrap()\n#18 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/web/Application.php(69): yii\\base\\Application->bootstrap()\n#19 /srv/www/foobar/public_html/protected/humhub/components/Application.php(67): yii\\web\\Application->bootstrap()\n#20 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Application.php(271): humhub\\components\\Application->bootstrap()\n#21 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/BaseObject.php(109): yii\\base\\Application->init()\n#22 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Application.php(204): yii\\base\\BaseObject->__construct()\n#23 /srv/www/foobar/public_html/protected/humhub/components/Application.php(49): yii\\base\\Application->__construct()\n#24 /srv/www/foobar/public_html/index.php(25): humhub\\components\\Application->__construct()\n#25 {main}'),
(6, 4, 'application', 1659956591.75, '[192.168.56.1][1][hq7onj49rcisolem9uusglpoh4]', '$_GET = [\n    \'r\' => \'admin/setting/design\'\n]\n\n$_SERVER = [\n    \'PATH\' => \'/srv/www/phpcs/scripts/:/usr/local/bin:/usr/bin:/bin\'\n    \'USER\' => \'www-data\'\n    \'HOME\' => \'/var/www\'\n    \'HTTP_COOKIE\' => \'_ga=GA1.1.1012070144.1657021274; _ga_ZJ65V8HV37=GS1.1.1659446125.13.1.1659446423.0; PHPSESSID=hq7onj49rcisolem9uusglpoh4; _identity=c92fca1657f03898233c7b8d8a439be42760a3610d49351eae09649ef73c5f5ea%3A2%3A%7Bi%3A0%3Bs%3A9%3A%22_identity%22%3Bi%3A1%3Bs%3A50%3A%22%5B1%2C%2200178815-0b84-48df-82c3-2c6638b1dc62%22%2C2592000%5D%22%3B%7D; _csrf=dac24aa22da8f0eddbb76854d54e62d99cdf799fc9a457cb93398f683914bf26a%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22NOUphlDVanRNMKPFoBL9G0NiPOWY8PFz%22%3B%7D\'\n    \'HTTP_ACCEPT_LANGUAGE\' => \'en,es-AR;q=0.9,es;q=0.8,en-US;q=0.7\'\n    \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate, br\'\n    \'HTTP_REFERER\' => \'https://dev.inkua.de/index.php?r=admin%2Fsetting%2Fbasic\'\n    \'HTTP_SEC_FETCH_DEST\' => \'document\'\n    \'HTTP_SEC_FETCH_MODE\' => \'navigate\'\n    \'HTTP_SEC_FETCH_SITE\' => \'same-origin\'\n    \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9\'\n    \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/103.0.5003.161 Chrome/103.0.5003.161 Safari/537.36\'\n    \'HTTP_UPGRADE_INSECURE_REQUESTS\' => \'1\'\n    \'HTTP_SEC_CH_UA_PLATFORM\' => \'\\\"Linux\\\"\'\n    \'HTTP_SEC_CH_UA_MOBILE\' => \'?0\'\n    \'HTTP_SEC_CH_UA\' => \'\\\"Chromium\\\";v=\\\"104\\\", \\\" Not A;Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"104\\\"\'\n    \'HTTP_HOST\' => \'dev.inkua.de\'\n    \'SCRIPT_FILENAME\' => \'/srv/www/foobar/public_html/index.php\'\n    \'REDIRECT_STATUS\' => \'200\'\n    \'SERVER_NAME\' => \'dev.inkua.de\'\n    \'SERVER_PORT\' => \'443\'\n    \'SERVER_ADDR\' => \'192.168.56.4\'\n    \'REMOTE_PORT\' => \'44698\'\n    \'REMOTE_ADDR\' => \'192.168.56.1\'\n    \'SERVER_SOFTWARE\' => \'nginx/1.23.1\'\n    \'GATEWAY_INTERFACE\' => \'CGI/1.1\'\n    \'HTTPS\' => \'on\'\n    \'REQUEST_SCHEME\' => \'https\'\n    \'SERVER_PROTOCOL\' => \'HTTP/2.0\'\n    \'DOCUMENT_ROOT\' => \'/srv/www/foobar/public_html\'\n    \'DOCUMENT_URI\' => \'/index.php\'\n    \'REQUEST_URI\' => \'/index.php?r=admin%2Fsetting%2Fdesign\'\n    \'SCRIPT_NAME\' => \'/index.php\'\n    \'CONTENT_LENGTH\' => \'\'\n    \'CONTENT_TYPE\' => \'\'\n    \'REQUEST_METHOD\' => \'GET\'\n    \'QUERY_STRING\' => \'r=admin%2Fsetting%2Fdesign\'\n    \'FCGI_ROLE\' => \'RESPONDER\'\n    \'PHP_SELF\' => \'/index.php\'\n    \'REQUEST_TIME_FLOAT\' => 1659956591.738\n    \'REQUEST_TIME\' => 1659956591\n]'),
(7, 1, 'InvalidArgumentException', 1659956599.1402, '[192.168.56.1][1][hq7onj49rcisolem9uusglpoh4]', 'InvalidArgumentException: Unsupported sendmail command flags \"/usr/local/bin/mhsendmail\"; must be one of \"-bs\" or \"-t\" but can include additional flags. in /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport/SendmailTransport.php:58\nStack trace:\n#0 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport/NativeTransportFactory.php(33): Symfony\\Component\\Mailer\\Transport\\SendmailTransport->__construct()\n#1 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(172): Symfony\\Component\\Mailer\\Transport\\NativeTransportFactory->create()\n#2 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(161): Symfony\\Component\\Mailer\\Transport->fromDsnObject()\n#3 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(113): Symfony\\Component\\Mailer\\Transport->parseDsn()\n#4 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2-symfonymailer/src/Mailer.php(114): Symfony\\Component\\Mailer\\Transport->fromString()\n#5 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2-symfonymailer/src/Mailer.php(81): yii\\symfonymailer\\Mailer->createTransport()\n#6 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Component.php(180): yii\\symfonymailer\\Mailer->setTransport()\n#7 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/BaseYii.php(558): yii\\base\\Component->__set()\n#8 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/BaseObject.php(107): yii\\BaseYii::configure()\n#9 [internal function]: yii\\base\\BaseObject->__construct()\n#10 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/Container.php(419): ReflectionClass->newInstanceArgs()\n#11 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/Container.php(170): yii\\di\\Container->build()\n#12 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/BaseYii.php(365): yii\\di\\Container->get()\n#13 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/ServiceLocator.php(137): yii\\BaseYii::createObject()\n#14 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Module.php(766): yii\\di\\ServiceLocator->get()\n#15 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/ServiceLocator.php(74): yii\\base\\Module->get()\n#16 /srv/www/foobar/public_html/protected/humhub/modules/ui/view/bootstrap/ThemeLoader.php(46): yii\\di\\ServiceLocator->__get()\n#17 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Application.php(325): humhub\\modules\\ui\\view\\bootstrap\\ThemeLoader->bootstrap()\n#18 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/web/Application.php(69): yii\\base\\Application->bootstrap()\n#19 /srv/www/foobar/public_html/protected/humhub/components/Application.php(67): yii\\web\\Application->bootstrap()\n#20 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Application.php(271): humhub\\components\\Application->bootstrap()\n#21 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/BaseObject.php(109): yii\\base\\Application->init()\n#22 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Application.php(204): yii\\base\\BaseObject->__construct()\n#23 /srv/www/foobar/public_html/protected/humhub/components/Application.php(49): yii\\base\\Application->__construct()\n#24 /srv/www/foobar/public_html/index.php(25): humhub\\components\\Application->__construct()\n#25 {main}'),
(8, 4, 'application', 1659956599.0904, '[192.168.56.1][1][hq7onj49rcisolem9uusglpoh4]', '$_GET = []\n\n$_SERVER = [\n    \'PATH\' => \'/srv/www/phpcs/scripts/:/usr/local/bin:/usr/bin:/bin\'\n    \'USER\' => \'www-data\'\n    \'HOME\' => \'/var/www\'\n    \'HTTP_COOKIE\' => \'_ga=GA1.1.1012070144.1657021274; _ga_ZJ65V8HV37=GS1.1.1659446125.13.1.1659446423.0; PHPSESSID=hq7onj49rcisolem9uusglpoh4; _identity=c92fca1657f03898233c7b8d8a439be42760a3610d49351eae09649ef73c5f5ea%3A2%3A%7Bi%3A0%3Bs%3A9%3A%22_identity%22%3Bi%3A1%3Bs%3A50%3A%22%5B1%2C%2200178815-0b84-48df-82c3-2c6638b1dc62%22%2C2592000%5D%22%3B%7D; _csrf=dac24aa22da8f0eddbb76854d54e62d99cdf799fc9a457cb93398f683914bf26a%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22NOUphlDVanRNMKPFoBL9G0NiPOWY8PFz%22%3B%7D\'\n    \'HTTP_ACCEPT_LANGUAGE\' => \'en,es-AR;q=0.9,es;q=0.8,en-US;q=0.7\'\n    \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate, br\'\n    \'HTTP_SEC_FETCH_DEST\' => \'document\'\n    \'HTTP_SEC_FETCH_USER\' => \'?1\'\n    \'HTTP_SEC_FETCH_MODE\' => \'navigate\'\n    \'HTTP_SEC_FETCH_SITE\' => \'none\'\n    \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9\'\n    \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/103.0.5003.161 Chrome/103.0.5003.161 Safari/537.36\'\n    \'HTTP_UPGRADE_INSECURE_REQUESTS\' => \'1\'\n    \'HTTP_SEC_CH_UA_PLATFORM\' => \'\\\"Linux\\\"\'\n    \'HTTP_SEC_CH_UA_MOBILE\' => \'?0\'\n    \'HTTP_SEC_CH_UA\' => \'\\\"Chromium\\\";v=\\\"104\\\", \\\" Not A;Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"104\\\"\'\n    \'HTTP_HOST\' => \'dev.inkua.de\'\n    \'SCRIPT_FILENAME\' => \'/srv/www/foobar/public_html/index.php\'\n    \'REDIRECT_STATUS\' => \'200\'\n    \'SERVER_NAME\' => \'dev.inkua.de\'\n    \'SERVER_PORT\' => \'443\'\n    \'SERVER_ADDR\' => \'192.168.56.4\'\n    \'REMOTE_PORT\' => \'44052\'\n    \'REMOTE_ADDR\' => \'192.168.56.1\'\n    \'SERVER_SOFTWARE\' => \'nginx/1.23.1\'\n    \'GATEWAY_INTERFACE\' => \'CGI/1.1\'\n    \'HTTPS\' => \'on\'\n    \'REQUEST_SCHEME\' => \'https\'\n    \'SERVER_PROTOCOL\' => \'HTTP/2.0\'\n    \'DOCUMENT_ROOT\' => \'/srv/www/foobar/public_html\'\n    \'DOCUMENT_URI\' => \'/index.php\'\n    \'REQUEST_URI\' => \'/index.php?\'\n    \'SCRIPT_NAME\' => \'/index.php\'\n    \'CONTENT_LENGTH\' => \'\'\n    \'CONTENT_TYPE\' => \'\'\n    \'REQUEST_METHOD\' => \'GET\'\n    \'QUERY_STRING\' => \'\'\n    \'FCGI_ROLE\' => \'RESPONDER\'\n    \'PHP_SELF\' => \'/index.php\'\n    \'REQUEST_TIME_FLOAT\' => 1659956599.0815\n    \'REQUEST_TIME\' => 1659956599\n]'),
(9, 1, 'InvalidArgumentException', 1659956602.2137, '[192.168.56.1][1][hq7onj49rcisolem9uusglpoh4]', 'InvalidArgumentException: Unsupported sendmail command flags \"/usr/local/bin/mhsendmail\"; must be one of \"-bs\" or \"-t\" but can include additional flags. in /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport/SendmailTransport.php:58\nStack trace:\n#0 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport/NativeTransportFactory.php(33): Symfony\\Component\\Mailer\\Transport\\SendmailTransport->__construct()\n#1 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(172): Symfony\\Component\\Mailer\\Transport\\NativeTransportFactory->create()\n#2 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(161): Symfony\\Component\\Mailer\\Transport->fromDsnObject()\n#3 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(113): Symfony\\Component\\Mailer\\Transport->parseDsn()\n#4 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2-symfonymailer/src/Mailer.php(114): Symfony\\Component\\Mailer\\Transport->fromString()\n#5 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2-symfonymailer/src/Mailer.php(81): yii\\symfonymailer\\Mailer->createTransport()\n#6 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Component.php(180): yii\\symfonymailer\\Mailer->setTransport()\n#7 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/BaseYii.php(558): yii\\base\\Component->__set()\n#8 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/BaseObject.php(107): yii\\BaseYii::configure()\n#9 [internal function]: yii\\base\\BaseObject->__construct()\n#10 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/Container.php(419): ReflectionClass->newInstanceArgs()\n#11 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/Container.php(170): yii\\di\\Container->build()\n#12 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/BaseYii.php(365): yii\\di\\Container->get()\n#13 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/ServiceLocator.php(137): yii\\BaseYii::createObject()\n#14 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Module.php(766): yii\\di\\ServiceLocator->get()\n#15 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/ServiceLocator.php(74): yii\\base\\Module->get()\n#16 /srv/www/foobar/public_html/protected/humhub/modules/ui/view/bootstrap/ThemeLoader.php(46): yii\\di\\ServiceLocator->__get()\n#17 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Application.php(325): humhub\\modules\\ui\\view\\bootstrap\\ThemeLoader->bootstrap()\n#18 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/web/Application.php(69): yii\\base\\Application->bootstrap()\n#19 /srv/www/foobar/public_html/protected/humhub/components/Application.php(67): yii\\web\\Application->bootstrap()\n#20 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Application.php(271): humhub\\components\\Application->bootstrap()\n#21 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/BaseObject.php(109): yii\\base\\Application->init()\n#22 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Application.php(204): yii\\base\\BaseObject->__construct()\n#23 /srv/www/foobar/public_html/protected/humhub/components/Application.php(49): yii\\base\\Application->__construct()\n#24 /srv/www/foobar/public_html/index.php(25): humhub\\components\\Application->__construct()\n#25 {main}'),
(10, 4, 'application', 1659956602.1135, '[192.168.56.1][1][hq7onj49rcisolem9uusglpoh4]', '$_GET = []\n\n$_SERVER = [\n    \'PATH\' => \'/srv/www/phpcs/scripts/:/usr/local/bin:/usr/bin:/bin\'\n    \'USER\' => \'www-data\'\n    \'HOME\' => \'/var/www\'\n    \'HTTP_COOKIE\' => \'_ga=GA1.1.1012070144.1657021274; _ga_ZJ65V8HV37=GS1.1.1659446125.13.1.1659446423.0; PHPSESSID=hq7onj49rcisolem9uusglpoh4; _identity=c92fca1657f03898233c7b8d8a439be42760a3610d49351eae09649ef73c5f5ea%3A2%3A%7Bi%3A0%3Bs%3A9%3A%22_identity%22%3Bi%3A1%3Bs%3A50%3A%22%5B1%2C%2200178815-0b84-48df-82c3-2c6638b1dc62%22%2C2592000%5D%22%3B%7D; _csrf=dac24aa22da8f0eddbb76854d54e62d99cdf799fc9a457cb93398f683914bf26a%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22NOUphlDVanRNMKPFoBL9G0NiPOWY8PFz%22%3B%7D\'\n    \'HTTP_ACCEPT_LANGUAGE\' => \'en,es-AR;q=0.9,es;q=0.8,en-US;q=0.7\'\n    \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate, br\'\n    \'HTTP_SEC_FETCH_DEST\' => \'document\'\n    \'HTTP_SEC_FETCH_USER\' => \'?1\'\n    \'HTTP_SEC_FETCH_MODE\' => \'navigate\'\n    \'HTTP_SEC_FETCH_SITE\' => \'none\'\n    \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9\'\n    \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/103.0.5003.161 Chrome/103.0.5003.161 Safari/537.36\'\n    \'HTTP_UPGRADE_INSECURE_REQUESTS\' => \'1\'\n    \'HTTP_SEC_CH_UA_PLATFORM\' => \'\\\"Linux\\\"\'\n    \'HTTP_SEC_CH_UA_MOBILE\' => \'?0\'\n    \'HTTP_SEC_CH_UA\' => \'\\\"Chromium\\\";v=\\\"104\\\", \\\" Not A;Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"104\\\"\'\n    \'HTTP_HOST\' => \'dev.inkua.de\'\n    \'SCRIPT_FILENAME\' => \'/srv/www/foobar/public_html/index.php\'\n    \'REDIRECT_STATUS\' => \'200\'\n    \'SERVER_NAME\' => \'dev.inkua.de\'\n    \'SERVER_PORT\' => \'443\'\n    \'SERVER_ADDR\' => \'192.168.56.4\'\n    \'REMOTE_PORT\' => \'44052\'\n    \'REMOTE_ADDR\' => \'192.168.56.1\'\n    \'SERVER_SOFTWARE\' => \'nginx/1.23.1\'\n    \'GATEWAY_INTERFACE\' => \'CGI/1.1\'\n    \'HTTPS\' => \'on\'\n    \'REQUEST_SCHEME\' => \'https\'\n    \'SERVER_PROTOCOL\' => \'HTTP/2.0\'\n    \'DOCUMENT_ROOT\' => \'/srv/www/foobar/public_html\'\n    \'DOCUMENT_URI\' => \'/index.php\'\n    \'REQUEST_URI\' => \'/index.php\'\n    \'SCRIPT_NAME\' => \'/index.php\'\n    \'CONTENT_LENGTH\' => \'\'\n    \'CONTENT_TYPE\' => \'\'\n    \'REQUEST_METHOD\' => \'GET\'\n    \'QUERY_STRING\' => \'\'\n    \'FCGI_ROLE\' => \'RESPONDER\'\n    \'PHP_SELF\' => \'/index.php\'\n    \'REQUEST_TIME_FLOAT\' => 1659956602.0982\n    \'REQUEST_TIME\' => 1659956602\n]'),
(11, 1, 'InvalidArgumentException', 1659956609.3465, '[192.168.56.1][1][hq7onj49rcisolem9uusglpoh4]', 'InvalidArgumentException: Unsupported sendmail command flags \"/usr/local/bin/mhsendmail\"; must be one of \"-bs\" or \"-t\" but can include additional flags. in /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport/SendmailTransport.php:58\nStack trace:\n#0 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport/NativeTransportFactory.php(33): Symfony\\Component\\Mailer\\Transport\\SendmailTransport->__construct()\n#1 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(172): Symfony\\Component\\Mailer\\Transport\\NativeTransportFactory->create()\n#2 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(161): Symfony\\Component\\Mailer\\Transport->fromDsnObject()\n#3 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(113): Symfony\\Component\\Mailer\\Transport->parseDsn()\n#4 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2-symfonymailer/src/Mailer.php(114): Symfony\\Component\\Mailer\\Transport->fromString()\n#5 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2-symfonymailer/src/Mailer.php(81): yii\\symfonymailer\\Mailer->createTransport()\n#6 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Component.php(180): yii\\symfonymailer\\Mailer->setTransport()\n#7 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/BaseYii.php(558): yii\\base\\Component->__set()\n#8 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/BaseObject.php(107): yii\\BaseYii::configure()\n#9 [internal function]: yii\\base\\BaseObject->__construct()\n#10 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/Container.php(419): ReflectionClass->newInstanceArgs()\n#11 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/Container.php(170): yii\\di\\Container->build()\n#12 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/BaseYii.php(365): yii\\di\\Container->get()\n#13 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/ServiceLocator.php(137): yii\\BaseYii::createObject()\n#14 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Module.php(766): yii\\di\\ServiceLocator->get()\n#15 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/ServiceLocator.php(74): yii\\base\\Module->get()\n#16 /srv/www/foobar/public_html/protected/humhub/modules/ui/view/bootstrap/ThemeLoader.php(46): yii\\di\\ServiceLocator->__get()\n#17 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Application.php(325): humhub\\modules\\ui\\view\\bootstrap\\ThemeLoader->bootstrap()\n#18 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/web/Application.php(69): yii\\base\\Application->bootstrap()\n#19 /srv/www/foobar/public_html/protected/humhub/components/Application.php(67): yii\\web\\Application->bootstrap()\n#20 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Application.php(271): humhub\\components\\Application->bootstrap()\n#21 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/BaseObject.php(109): yii\\base\\Application->init()\n#22 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Application.php(204): yii\\base\\BaseObject->__construct()\n#23 /srv/www/foobar/public_html/protected/humhub/components/Application.php(49): yii\\base\\Application->__construct()\n#24 /srv/www/foobar/public_html/index.php(25): humhub\\components\\Application->__construct()\n#25 {main}'),
(12, 4, 'application', 1659956609.2869, '[192.168.56.1][1][hq7onj49rcisolem9uusglpoh4]', '$_GET = []\n\n$_SERVER = [\n    \'PATH\' => \'/srv/www/phpcs/scripts/:/usr/local/bin:/usr/bin:/bin\'\n    \'USER\' => \'www-data\'\n    \'HOME\' => \'/var/www\'\n    \'HTTP_COOKIE\' => \'_ga=GA1.1.1012070144.1657021274; _ga_ZJ65V8HV37=GS1.1.1659446125.13.1.1659446423.0; PHPSESSID=hq7onj49rcisolem9uusglpoh4; _identity=c92fca1657f03898233c7b8d8a439be42760a3610d49351eae09649ef73c5f5ea%3A2%3A%7Bi%3A0%3Bs%3A9%3A%22_identity%22%3Bi%3A1%3Bs%3A50%3A%22%5B1%2C%2200178815-0b84-48df-82c3-2c6638b1dc62%22%2C2592000%5D%22%3B%7D; _csrf=dac24aa22da8f0eddbb76854d54e62d99cdf799fc9a457cb93398f683914bf26a%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22NOUphlDVanRNMKPFoBL9G0NiPOWY8PFz%22%3B%7D\'\n    \'HTTP_ACCEPT_LANGUAGE\' => \'en,es-AR;q=0.9,es;q=0.8,en-US;q=0.7\'\n    \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate, br\'\n    \'HTTP_SEC_FETCH_DEST\' => \'document\'\n    \'HTTP_SEC_FETCH_USER\' => \'?1\'\n    \'HTTP_SEC_FETCH_MODE\' => \'navigate\'\n    \'HTTP_SEC_FETCH_SITE\' => \'none\'\n    \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9\'\n    \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/103.0.5003.161 Chrome/103.0.5003.161 Safari/537.36\'\n    \'HTTP_UPGRADE_INSECURE_REQUESTS\' => \'1\'\n    \'HTTP_SEC_CH_UA_PLATFORM\' => \'\\\"Linux\\\"\'\n    \'HTTP_SEC_CH_UA_MOBILE\' => \'?0\'\n    \'HTTP_SEC_CH_UA\' => \'\\\"Chromium\\\";v=\\\"104\\\", \\\" Not A;Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"104\\\"\'\n    \'HTTP_HOST\' => \'dev.inkua.de\'\n    \'SCRIPT_FILENAME\' => \'/srv/www/foobar/public_html/index.php\'\n    \'REDIRECT_STATUS\' => \'200\'\n    \'SERVER_NAME\' => \'dev.inkua.de\'\n    \'SERVER_PORT\' => \'443\'\n    \'SERVER_ADDR\' => \'192.168.56.4\'\n    \'REMOTE_PORT\' => \'53072\'\n    \'REMOTE_ADDR\' => \'192.168.56.1\'\n    \'SERVER_SOFTWARE\' => \'nginx/1.23.1\'\n    \'GATEWAY_INTERFACE\' => \'CGI/1.1\'\n    \'HTTPS\' => \'on\'\n    \'REQUEST_SCHEME\' => \'https\'\n    \'SERVER_PROTOCOL\' => \'HTTP/2.0\'\n    \'DOCUMENT_ROOT\' => \'/srv/www/foobar/public_html\'\n    \'DOCUMENT_URI\' => \'/index.php\'\n    \'REQUEST_URI\' => \'/\'\n    \'SCRIPT_NAME\' => \'/index.php\'\n    \'CONTENT_LENGTH\' => \'\'\n    \'CONTENT_TYPE\' => \'\'\n    \'REQUEST_METHOD\' => \'GET\'\n    \'QUERY_STRING\' => \'\'\n    \'FCGI_ROLE\' => \'RESPONDER\'\n    \'PHP_SELF\' => \'/index.php\'\n    \'REQUEST_TIME_FLOAT\' => 1659956609.2762\n    \'REQUEST_TIME\' => 1659956609\n]'),
(13, 1, 'InvalidArgumentException', 1659956622.509, '[192.168.56.1][-][93jpc7ng0oc65jo7k8328h0knb]', 'InvalidArgumentException: Unsupported sendmail command flags \"/usr/local/bin/mhsendmail\"; must be one of \"-bs\" or \"-t\" but can include additional flags. in /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport/SendmailTransport.php:58\nStack trace:\n#0 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport/NativeTransportFactory.php(33): Symfony\\Component\\Mailer\\Transport\\SendmailTransport->__construct()\n#1 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(172): Symfony\\Component\\Mailer\\Transport\\NativeTransportFactory->create()\n#2 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(161): Symfony\\Component\\Mailer\\Transport->fromDsnObject()\n#3 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(113): Symfony\\Component\\Mailer\\Transport->parseDsn()\n#4 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2-symfonymailer/src/Mailer.php(114): Symfony\\Component\\Mailer\\Transport->fromString()\n#5 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2-symfonymailer/src/Mailer.php(81): yii\\symfonymailer\\Mailer->createTransport()\n#6 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Component.php(180): yii\\symfonymailer\\Mailer->setTransport()\n#7 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/BaseYii.php(558): yii\\base\\Component->__set()\n#8 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/BaseObject.php(107): yii\\BaseYii::configure()\n#9 [internal function]: yii\\base\\BaseObject->__construct()\n#10 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/Container.php(419): ReflectionClass->newInstanceArgs()\n#11 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/Container.php(170): yii\\di\\Container->build()\n#12 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/BaseYii.php(365): yii\\di\\Container->get()\n#13 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/ServiceLocator.php(137): yii\\BaseYii::createObject()\n#14 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Module.php(766): yii\\di\\ServiceLocator->get()\n#15 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/ServiceLocator.php(74): yii\\base\\Module->get()\n#16 /srv/www/foobar/public_html/protected/humhub/modules/ui/view/bootstrap/ThemeLoader.php(46): yii\\di\\ServiceLocator->__get()\n#17 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Application.php(325): humhub\\modules\\ui\\view\\bootstrap\\ThemeLoader->bootstrap()\n#18 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/web/Application.php(69): yii\\base\\Application->bootstrap()\n#19 /srv/www/foobar/public_html/protected/humhub/components/Application.php(67): yii\\web\\Application->bootstrap()\n#20 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Application.php(271): humhub\\components\\Application->bootstrap()\n#21 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/BaseObject.php(109): yii\\base\\Application->init()\n#22 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Application.php(204): yii\\base\\BaseObject->__construct()\n#23 /srv/www/foobar/public_html/protected/humhub/components/Application.php(49): yii\\base\\Application->__construct()\n#24 /srv/www/foobar/public_html/index.php(25): humhub\\components\\Application->__construct()\n#25 {main}'),
(14, 4, 'application', 1659956622.456, '[192.168.56.1][-][93jpc7ng0oc65jo7k8328h0knb]', '$_GET = []\n\n$_SERVER = [\n    \'PATH\' => \'/srv/www/phpcs/scripts/:/usr/local/bin:/usr/bin:/bin\'\n    \'USER\' => \'www-data\'\n    \'HOME\' => \'/var/www\'\n    \'HTTP_COOKIE\' => \'PHPSESSID=93jpc7ng0oc65jo7k8328h0knb; _csrf=b5e594d07ae0e894f98f02862ad6d4ab0a8990716901ef08ed68e45ab3111501a%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22C3GMrV3_2z5VcI4VEtRZSJUzVH0omSaH%22%3B%7D\'\n    \'HTTP_ACCEPT_LANGUAGE\' => \'en\'\n    \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate, br\'\n    \'HTTP_SEC_FETCH_DEST\' => \'document\'\n    \'HTTP_SEC_FETCH_USER\' => \'?1\'\n    \'HTTP_SEC_FETCH_MODE\' => \'navigate\'\n    \'HTTP_SEC_FETCH_SITE\' => \'none\'\n    \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9\'\n    \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36\'\n    \'HTTP_UPGRADE_INSECURE_REQUESTS\' => \'1\'\n    \'HTTP_SEC_CH_UA_PLATFORM\' => \'\\\"Linux\\\"\'\n    \'HTTP_SEC_CH_UA_MOBILE\' => \'?0\'\n    \'HTTP_SEC_CH_UA\' => \'\\\"Chromium\\\";v=\\\"104\\\", \\\" Not A;Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"104\\\"\'\n    \'HTTP_HOST\' => \'dev.inkua.de\'\n    \'SCRIPT_FILENAME\' => \'/srv/www/foobar/public_html/index.php\'\n    \'REDIRECT_STATUS\' => \'200\'\n    \'SERVER_NAME\' => \'dev.inkua.de\'\n    \'SERVER_PORT\' => \'443\'\n    \'SERVER_ADDR\' => \'192.168.56.4\'\n    \'REMOTE_PORT\' => \'41322\'\n    \'REMOTE_ADDR\' => \'192.168.56.1\'\n    \'SERVER_SOFTWARE\' => \'nginx/1.23.1\'\n    \'GATEWAY_INTERFACE\' => \'CGI/1.1\'\n    \'HTTPS\' => \'on\'\n    \'REQUEST_SCHEME\' => \'https\'\n    \'SERVER_PROTOCOL\' => \'HTTP/2.0\'\n    \'DOCUMENT_ROOT\' => \'/srv/www/foobar/public_html\'\n    \'DOCUMENT_URI\' => \'/index.php\'\n    \'REQUEST_URI\' => \'/\'\n    \'SCRIPT_NAME\' => \'/index.php\'\n    \'CONTENT_LENGTH\' => \'\'\n    \'CONTENT_TYPE\' => \'\'\n    \'REQUEST_METHOD\' => \'GET\'\n    \'QUERY_STRING\' => \'\'\n    \'FCGI_ROLE\' => \'RESPONDER\'\n    \'PHP_SELF\' => \'/index.php\'\n    \'REQUEST_TIME_FLOAT\' => 1659956622.4472\n    \'REQUEST_TIME\' => 1659956622\n]'),
(15, 1, 'InvalidArgumentException', 1659956651.3328, '[192.168.56.1][1][hq7onj49rcisolem9uusglpoh4]', 'InvalidArgumentException: Unsupported sendmail command flags \"/usr/local/bin/mhsendmail\"; must be one of \"-bs\" or \"-t\" but can include additional flags. in /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport/SendmailTransport.php:58\nStack trace:\n#0 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport/NativeTransportFactory.php(33): Symfony\\Component\\Mailer\\Transport\\SendmailTransport->__construct()\n#1 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(172): Symfony\\Component\\Mailer\\Transport\\NativeTransportFactory->create()\n#2 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(161): Symfony\\Component\\Mailer\\Transport->fromDsnObject()\n#3 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(113): Symfony\\Component\\Mailer\\Transport->parseDsn()\n#4 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2-symfonymailer/src/Mailer.php(114): Symfony\\Component\\Mailer\\Transport->fromString()\n#5 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2-symfonymailer/src/Mailer.php(81): yii\\symfonymailer\\Mailer->createTransport()\n#6 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Component.php(180): yii\\symfonymailer\\Mailer->setTransport()\n#7 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/BaseYii.php(558): yii\\base\\Component->__set()\n#8 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/BaseObject.php(107): yii\\BaseYii::configure()\n#9 [internal function]: yii\\base\\BaseObject->__construct()\n#10 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/Container.php(419): ReflectionClass->newInstanceArgs()\n#11 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/Container.php(170): yii\\di\\Container->build()\n#12 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/BaseYii.php(365): yii\\di\\Container->get()\n#13 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/ServiceLocator.php(137): yii\\BaseYii::createObject()\n#14 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Module.php(766): yii\\di\\ServiceLocator->get()\n#15 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/ServiceLocator.php(74): yii\\base\\Module->get()\n#16 /srv/www/foobar/public_html/protected/humhub/modules/ui/view/bootstrap/ThemeLoader.php(46): yii\\di\\ServiceLocator->__get()\n#17 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Application.php(325): humhub\\modules\\ui\\view\\bootstrap\\ThemeLoader->bootstrap()\n#18 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/web/Application.php(69): yii\\base\\Application->bootstrap()\n#19 /srv/www/foobar/public_html/protected/humhub/components/Application.php(67): yii\\web\\Application->bootstrap()\n#20 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Application.php(271): humhub\\components\\Application->bootstrap()\n#21 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/BaseObject.php(109): yii\\base\\Application->init()\n#22 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Application.php(204): yii\\base\\BaseObject->__construct()\n#23 /srv/www/foobar/public_html/protected/humhub/components/Application.php(49): yii\\base\\Application->__construct()\n#24 /srv/www/foobar/public_html/index.php(25): humhub\\components\\Application->__construct()\n#25 {main}');
INSERT INTO `log` (`id`, `level`, `category`, `log_time`, `prefix`, `message`) VALUES
(16, 4, 'application', 1659956651.2788, '[192.168.56.1][1][hq7onj49rcisolem9uusglpoh4]', '$_GET = []\n\n$_SERVER = [\n    \'PATH\' => \'/srv/www/phpcs/scripts/:/usr/local/bin:/usr/bin:/bin\'\n    \'USER\' => \'www-data\'\n    \'HOME\' => \'/var/www\'\n    \'HTTP_COOKIE\' => \'_ga=GA1.1.1012070144.1657021274; _ga_ZJ65V8HV37=GS1.1.1659446125.13.1.1659446423.0; PHPSESSID=hq7onj49rcisolem9uusglpoh4; _identity=c92fca1657f03898233c7b8d8a439be42760a3610d49351eae09649ef73c5f5ea%3A2%3A%7Bi%3A0%3Bs%3A9%3A%22_identity%22%3Bi%3A1%3Bs%3A50%3A%22%5B1%2C%2200178815-0b84-48df-82c3-2c6638b1dc62%22%2C2592000%5D%22%3B%7D; _csrf=dac24aa22da8f0eddbb76854d54e62d99cdf799fc9a457cb93398f683914bf26a%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22NOUphlDVanRNMKPFoBL9G0NiPOWY8PFz%22%3B%7D\'\n    \'HTTP_ACCEPT_LANGUAGE\' => \'en,es-AR;q=0.9,es;q=0.8,en-US;q=0.7\'\n    \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate, br\'\n    \'HTTP_SEC_FETCH_DEST\' => \'document\'\n    \'HTTP_SEC_FETCH_USER\' => \'?1\'\n    \'HTTP_SEC_FETCH_MODE\' => \'navigate\'\n    \'HTTP_SEC_FETCH_SITE\' => \'none\'\n    \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9\'\n    \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/103.0.5003.161 Chrome/103.0.5003.161 Safari/537.36\'\n    \'HTTP_UPGRADE_INSECURE_REQUESTS\' => \'1\'\n    \'HTTP_SEC_CH_UA_PLATFORM\' => \'\\\"Linux\\\"\'\n    \'HTTP_SEC_CH_UA_MOBILE\' => \'?0\'\n    \'HTTP_SEC_CH_UA\' => \'\\\"Chromium\\\";v=\\\"104\\\", \\\" Not A;Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"104\\\"\'\n    \'HTTP_CACHE_CONTROL\' => \'max-age=0\'\n    \'HTTP_HOST\' => \'dev.inkua.de\'\n    \'SCRIPT_FILENAME\' => \'/srv/www/foobar/public_html/index.php\'\n    \'REDIRECT_STATUS\' => \'200\'\n    \'SERVER_NAME\' => \'dev.inkua.de\'\n    \'SERVER_PORT\' => \'443\'\n    \'SERVER_ADDR\' => \'192.168.56.4\'\n    \'REMOTE_PORT\' => \'57522\'\n    \'REMOTE_ADDR\' => \'192.168.56.1\'\n    \'SERVER_SOFTWARE\' => \'nginx/1.23.1\'\n    \'GATEWAY_INTERFACE\' => \'CGI/1.1\'\n    \'HTTPS\' => \'on\'\n    \'REQUEST_SCHEME\' => \'https\'\n    \'SERVER_PROTOCOL\' => \'HTTP/2.0\'\n    \'DOCUMENT_ROOT\' => \'/srv/www/foobar/public_html\'\n    \'DOCUMENT_URI\' => \'/index.php\'\n    \'REQUEST_URI\' => \'/\'\n    \'SCRIPT_NAME\' => \'/index.php\'\n    \'CONTENT_LENGTH\' => \'\'\n    \'CONTENT_TYPE\' => \'\'\n    \'REQUEST_METHOD\' => \'GET\'\n    \'QUERY_STRING\' => \'\'\n    \'FCGI_ROLE\' => \'RESPONDER\'\n    \'PHP_SELF\' => \'/index.php\'\n    \'REQUEST_TIME_FLOAT\' => 1659956651.266\n    \'REQUEST_TIME\' => 1659956651\n]'),
(17, 1, 'InvalidArgumentException', 1659956955.1504, '[192.168.56.1][1][hq7onj49rcisolem9uusglpoh4]', 'InvalidArgumentException: Unsupported sendmail command flags \"/usr/local/bin/mhsendmail\"; must be one of \"-bs\" or \"-t\" but can include additional flags. in /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport/SendmailTransport.php:58\nStack trace:\n#0 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport/NativeTransportFactory.php(33): Symfony\\Component\\Mailer\\Transport\\SendmailTransport->__construct()\n#1 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(172): Symfony\\Component\\Mailer\\Transport\\NativeTransportFactory->create()\n#2 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(161): Symfony\\Component\\Mailer\\Transport->fromDsnObject()\n#3 /srv/www/foobar/public_html/protected/vendor/symfony/mailer/Transport.php(113): Symfony\\Component\\Mailer\\Transport->parseDsn()\n#4 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2-symfonymailer/src/Mailer.php(114): Symfony\\Component\\Mailer\\Transport->fromString()\n#5 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2-symfonymailer/src/Mailer.php(81): yii\\symfonymailer\\Mailer->createTransport()\n#6 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Component.php(180): yii\\symfonymailer\\Mailer->setTransport()\n#7 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/BaseYii.php(558): yii\\base\\Component->__set()\n#8 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/BaseObject.php(107): yii\\BaseYii::configure()\n#9 [internal function]: yii\\base\\BaseObject->__construct()\n#10 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/Container.php(419): ReflectionClass->newInstanceArgs()\n#11 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/Container.php(170): yii\\di\\Container->build()\n#12 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/BaseYii.php(365): yii\\di\\Container->get()\n#13 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/ServiceLocator.php(137): yii\\BaseYii::createObject()\n#14 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Module.php(766): yii\\di\\ServiceLocator->get()\n#15 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/di/ServiceLocator.php(74): yii\\base\\Module->get()\n#16 /srv/www/foobar/public_html/protected/humhub/modules/ui/view/bootstrap/ThemeLoader.php(46): yii\\di\\ServiceLocator->__get()\n#17 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Application.php(325): humhub\\modules\\ui\\view\\bootstrap\\ThemeLoader->bootstrap()\n#18 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/web/Application.php(69): yii\\base\\Application->bootstrap()\n#19 /srv/www/foobar/public_html/protected/humhub/components/Application.php(67): yii\\web\\Application->bootstrap()\n#20 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Application.php(271): humhub\\components\\Application->bootstrap()\n#21 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/BaseObject.php(109): yii\\base\\Application->init()\n#22 /srv/www/foobar/public_html/protected/vendor/yiisoft/yii2/base/Application.php(204): yii\\base\\BaseObject->__construct()\n#23 /srv/www/foobar/public_html/protected/humhub/components/Application.php(49): yii\\base\\Application->__construct()\n#24 /srv/www/foobar/public_html/index.php(25): humhub\\components\\Application->__construct()\n#25 {main}'),
(18, 4, 'application', 1659956955.0534, '[192.168.56.1][1][hq7onj49rcisolem9uusglpoh4]', '$_GET = []\n\n$_SERVER = [\n    \'PATH\' => \'/srv/www/phpcs/scripts/:/usr/local/bin:/usr/bin:/bin\'\n    \'USER\' => \'www-data\'\n    \'HOME\' => \'/var/www\'\n    \'HTTP_COOKIE\' => \'_ga=GA1.1.1012070144.1657021274; _ga_ZJ65V8HV37=GS1.1.1659446125.13.1.1659446423.0; PHPSESSID=hq7onj49rcisolem9uusglpoh4; _identity=c92fca1657f03898233c7b8d8a439be42760a3610d49351eae09649ef73c5f5ea%3A2%3A%7Bi%3A0%3Bs%3A9%3A%22_identity%22%3Bi%3A1%3Bs%3A50%3A%22%5B1%2C%2200178815-0b84-48df-82c3-2c6638b1dc62%22%2C2592000%5D%22%3B%7D; _csrf=dac24aa22da8f0eddbb76854d54e62d99cdf799fc9a457cb93398f683914bf26a%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22NOUphlDVanRNMKPFoBL9G0NiPOWY8PFz%22%3B%7D\'\n    \'HTTP_ACCEPT_LANGUAGE\' => \'en,es-AR;q=0.9,es;q=0.8,en-US;q=0.7\'\n    \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate, br\'\n    \'HTTP_SEC_FETCH_DEST\' => \'document\'\n    \'HTTP_SEC_FETCH_USER\' => \'?1\'\n    \'HTTP_SEC_FETCH_MODE\' => \'navigate\'\n    \'HTTP_SEC_FETCH_SITE\' => \'none\'\n    \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9\'\n    \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/103.0.5003.161 Chrome/103.0.5003.161 Safari/537.36\'\n    \'HTTP_UPGRADE_INSECURE_REQUESTS\' => \'1\'\n    \'HTTP_SEC_CH_UA_PLATFORM\' => \'\\\"Linux\\\"\'\n    \'HTTP_SEC_CH_UA_MOBILE\' => \'?0\'\n    \'HTTP_SEC_CH_UA\' => \'\\\"Chromium\\\";v=\\\"104\\\", \\\" Not A;Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"104\\\"\'\n    \'HTTP_HOST\' => \'dev.inkua.de\'\n    \'SCRIPT_FILENAME\' => \'/srv/www/foobar/public_html/index.php\'\n    \'REDIRECT_STATUS\' => \'200\'\n    \'SERVER_NAME\' => \'dev.inkua.de\'\n    \'SERVER_PORT\' => \'443\'\n    \'SERVER_ADDR\' => \'192.168.56.4\'\n    \'REMOTE_PORT\' => \'39850\'\n    \'REMOTE_ADDR\' => \'192.168.56.1\'\n    \'SERVER_SOFTWARE\' => \'nginx/1.23.1\'\n    \'GATEWAY_INTERFACE\' => \'CGI/1.1\'\n    \'HTTPS\' => \'on\'\n    \'REQUEST_SCHEME\' => \'https\'\n    \'SERVER_PROTOCOL\' => \'HTTP/2.0\'\n    \'DOCUMENT_ROOT\' => \'/srv/www/foobar/public_html\'\n    \'DOCUMENT_URI\' => \'/index.php\'\n    \'REQUEST_URI\' => \'/\'\n    \'SCRIPT_NAME\' => \'/index.php\'\n    \'CONTENT_LENGTH\' => \'\'\n    \'CONTENT_TYPE\' => \'\'\n    \'REQUEST_METHOD\' => \'GET\'\n    \'QUERY_STRING\' => \'\'\n    \'FCGI_ROLE\' => \'RESPONDER\'\n    \'PHP_SELF\' => \'/index.php\'\n    \'REQUEST_TIME_FLOAT\' => 1659956955.0366\n    \'REQUEST_TIME\' => 1659956955\n]'),
(19, 1, 'yii\\symfonymailer\\Mailer::sendMessage', 1659957069.8699, '[192.168.56.1][1][-]', 'Unable to connect with STARTTLS: stream_socket_enable_crypto(): Peer certificate CN=`vvv\' did not match expected CN=`localhost\''),
(20, 4, 'application', 1659957069.6211, '[192.168.56.1][1][-]', '$_GET = [\n    \'r\' => \'admin/setting/mailing-server-test\'\n]\n\n$_SERVER = [\n    \'PATH\' => \'/srv/www/phpcs/scripts/:/usr/local/bin:/usr/bin:/bin\'\n    \'USER\' => \'www-data\'\n    \'HOME\' => \'/var/www\'\n    \'HTTP_COOKIE\' => \'_ga=GA1.1.1012070144.1657021274; _ga_ZJ65V8HV37=GS1.1.1659446125.13.1.1659446423.0; PHPSESSID=hq7onj49rcisolem9uusglpoh4; _identity=c92fca1657f03898233c7b8d8a439be42760a3610d49351eae09649ef73c5f5ea%3A2%3A%7Bi%3A0%3Bs%3A9%3A%22_identity%22%3Bi%3A1%3Bs%3A50%3A%22%5B1%2C%2200178815-0b84-48df-82c3-2c6638b1dc62%22%2C2592000%5D%22%3B%7D; _csrf=dac24aa22da8f0eddbb76854d54e62d99cdf799fc9a457cb93398f683914bf26a%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22NOUphlDVanRNMKPFoBL9G0NiPOWY8PFz%22%3B%7D; uecUI=eyJ1YUluZm8iOnsidXNlcmFnZW50IjoiTW96aWxsYS81LjAgKFgxMTsgTGludXggaTY4NikgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgVWJ1bnR1IENocm9taXVtLzEwMy4wLjUwMDMuMTYxIENocm9tZS8xMDMuMC41MDAzLjE2MSBTYWZhcmkvNTM3LjM2IiwiZW5naW5lIjoiYmxpbmsiLCJvc1R5cGUiOiJsaW51eCJ9fQ--\'\n    \'HTTP_ACCEPT_LANGUAGE\' => \'en,es-AR;q=0.9,es;q=0.8,en-US;q=0.7\'\n    \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate, br\'\n    \'HTTP_REFERER\' => \'https://dev.inkua.de/index.php?r=admin%2Fsetting%2Fmailing-server\'\n    \'HTTP_SEC_CH_UA_PLATFORM\' => \'\\\"Linux\\\"\'\n    \'HTTP_SEC_CH_UA_MOBILE\' => \'?0\'\n    \'HTTP_SEC_CH_UA\' => \'\\\"Chromium\\\";v=\\\"104\\\", \\\" Not A;Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"104\\\"\'\n    \'HTTP_SEC_FETCH_DEST\' => \'document\'\n    \'HTTP_SEC_FETCH_USER\' => \'?1\'\n    \'HTTP_SEC_FETCH_MODE\' => \'navigate\'\n    \'HTTP_SEC_FETCH_SITE\' => \'same-origin\'\n    \'HTTP_ACCEPT\' => \'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9\'\n    \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/103.0.5003.161 Chrome/103.0.5003.161 Safari/537.36\'\n    \'HTTP_UPGRADE_INSECURE_REQUESTS\' => \'1\'\n    \'HTTP_CACHE_CONTROL\' => \'max-age=0\'\n    \'HTTP_HOST\' => \'dev.inkua.de\'\n    \'SCRIPT_FILENAME\' => \'/srv/www/foobar/public_html/index.php\'\n    \'REDIRECT_STATUS\' => \'200\'\n    \'SERVER_NAME\' => \'dev.inkua.de\'\n    \'SERVER_PORT\' => \'443\'\n    \'SERVER_ADDR\' => \'192.168.56.4\'\n    \'REMOTE_PORT\' => \'53518\'\n    \'REMOTE_ADDR\' => \'192.168.56.1\'\n    \'SERVER_SOFTWARE\' => \'nginx/1.23.1\'\n    \'GATEWAY_INTERFACE\' => \'CGI/1.1\'\n    \'HTTPS\' => \'on\'\n    \'REQUEST_SCHEME\' => \'https\'\n    \'SERVER_PROTOCOL\' => \'HTTP/2.0\'\n    \'DOCUMENT_ROOT\' => \'/srv/www/foobar/public_html\'\n    \'DOCUMENT_URI\' => \'/index.php\'\n    \'REQUEST_URI\' => \'/index.php?r=admin%2Fsetting%2Fmailing-server-test\'\n    \'SCRIPT_NAME\' => \'/index.php\'\n    \'CONTENT_LENGTH\' => \'\'\n    \'CONTENT_TYPE\' => \'\'\n    \'REQUEST_METHOD\' => \'GET\'\n    \'QUERY_STRING\' => \'r=admin%2Fsetting%2Fmailing-server-test\'\n    \'FCGI_ROLE\' => \'RESPONDER\'\n    \'PHP_SELF\' => \'/index.php\'\n    \'REQUEST_TIME_FLOAT\' => 1659957069.6206\n    \'REQUEST_TIME\' => 1659957069\n]');

-- --------------------------------------------------------

--
-- Table structure for table `logging`
--

CREATE TABLE IF NOT EXISTS `logging` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logtime` int(11) DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_updated` (`updated_at`),
  KEY `index_updated_by` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `title`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'test', '2022-08-08 13:35:09', 1, '2022-08-08 13:35:10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `message_entry`
--

CREATE TABLE IF NOT EXISTS `message_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_id` int(11) DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_id` (`user_id`),
  KEY `index_message_id` (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `message_entry`
--

INSERT INTO `message_entry` (`id`, `message_id`, `user_id`, `file_id`, `content`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, 1, NULL, 'test', '2022-08-08 13:35:10', 1, '2022-08-08 13:35:10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `message_tag`
--

CREATE TABLE IF NOT EXISTS `message_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int(11) DEFAULT 0,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-message-tag-user-id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1659956328),
('m131023_164513_initial', 1659956328),
('m131023_165214_initial', 1659956396),
('m131023_165411_initial', 1659956329),
('m131023_165507_initial', 1659956391),
('m131023_165625_initial', 1659956329),
('m131023_165755_initial', 1659956329),
('m131023_165835_initial', 1659956329),
('m131023_165921_initial', 1659956390),
('m131023_170033_initial', 1659956329),
('m131023_170135_initial', 1659956329),
('m131023_170159_initial', 1659956329),
('m131023_170253_initial', 1659956329),
('m131023_170339_initial', 1659956329),
('m131030_122743_longer_questions', 1659956390),
('m131203_110444_oembed', 1659956329),
('m131213_165552_user_optimize', 1659956329),
('m140226_111945_ldap', 1659956329),
('m140303_125031_password', 1659956329),
('m140304_142711_memberautoadd', 1659956329),
('m140321_000917_content', 1659956329),
('m140324_170617_membership', 1659956329),
('m140507_150421_create_settings_table', 1659956329),
('m140507_171527_create_settings_table', 1659956329),
('m140512_141414_i18n_profilefields', 1659956329),
('m140513_180317_createlogging', 1659956329),
('m140701_000611_profile_genderfield', 1659956329),
('m140701_074404_protect_default_profilefields', 1659956329),
('m140702_143912_notify_notification_unify', 1659956329),
('m140703_104527_profile_birthdayfield', 1659956329),
('m140704_080659_installationid', 1659956329),
('m140705_065525_emailing_settings', 1659956329),
('m140706_135210_lastlogin', 1659956329),
('m140812_093445_rename_deadline_column', 1659956396),
('m140829_122906_delete', 1659956329),
('m140830_145504_following', 1659956329),
('m140901_080147_indizies', 1659956329),
('m140901_080432_indices', 1659956329),
('m140901_112246_addState', 1659956329),
('m140901_153403_addState', 1659956329),
('m140901_170329_group_create_space', 1659956329),
('m140902_091234_session_key_length', 1659956329),
('m140907_140822_zip_field_to_text', 1659956329),
('m140930_045035_initial', 1659956388),
('m140930_205511_fix_default', 1659956329),
('m140930_205859_fix_default', 1659956330),
('m140930_210142_fix_default', 1659956330),
('m140930_210635_fix_default', 1659956330),
('m140930_212528_fix_default', 1659956330),
('m141002_084750_fix_default', 1659956396),
('m141002_092800_fix_deadline', 1659956396),
('m141002_093710_fix_default', 1659956390),
('m141004_022835_initial', 1659956383),
('m141015_173305_follow_notifications', 1659956330),
('m141019_093319_mentioning', 1659956330),
('m141020_162639_fix_default', 1659956330),
('m141020_193920_rm_alsocreated', 1659956330),
('m141020_193931_rm_alsoliked', 1659956330),
('m141021_162639_oembed_setting', 1659956330),
('m141022_094635_addDefaults', 1659956330),
('m141026_135537_adminOnly', 1659956388),
('m141106_185632_log_init', 1659956330),
('m150204_103433_html5_notified', 1659956330),
('m150210_190006_user_invite_lang', 1659956330),
('m150302_114347_add_visibility', 1659956330),
('m150322_194403_remove_type_field', 1659956330),
('m150322_195619_allowedExt2Text', 1659956330),
('m150429_190600_indexes', 1659956391),
('m150429_223856_optimize', 1659956330),
('m150629_220311_change', 1659956330),
('m150703_012735_typelength', 1659956330),
('m150703_024635_activityTypes', 1659956330),
('m150703_033650_namespace', 1659956330),
('m150703_130157_migrate', 1659956330),
('m150704_005338_namespace', 1659956330),
('m150704_005418_namespace', 1659956330),
('m150704_005434_namespace', 1659956330),
('m150704_005452_namespace', 1659956330),
('m150704_005504_namespace', 1659956330),
('m150705_081309_namespace', 1659956383),
('m150709_050451_namespace', 1659956392),
('m150709_050452_message_tags', 1659956392),
('m150709_050453_conversation_tags', 1659956392),
('m150709_151858_namespace', 1659956390),
('m150710_055123_namespace', 1659956396),
('m150713_054441_timezone', 1659956330),
('m150714_093525_activity', 1659956330),
('m150714_100355_cleanup', 1659956331),
('m150720_174011_initial', 1659956393),
('m150831_061628_notifications', 1659956331),
('m150910_223305_fix_user_follow', 1659956331),
('m150916_131805_container', 1659956388),
('m150917_104409_add_new_windows', 1659956388),
('m150924_133344_update_notification_fix', 1659956331),
('m150924_154635_user_invite_add_first_lastname', 1659956331),
('m150927_190830_create_contentcontainer', 1659956331),
('m150928_103711_permissions', 1659956331),
('m150928_134934_groups', 1659956331),
('m150928_140718_setColorVariables', 1659956331),
('m151010_124437_group_permissions', 1659956331),
('m151010_175000_default_visibility', 1659956331),
('m151013_223814_include_dashboard', 1659956331),
('m151022_131128_module_fix', 1659956331),
('m151106_090948_addColor', 1659956331),
('m151223_171310_fix_notifications', 1659956331),
('m151224_162440_fix_module_id_notifications', 1659956396),
('m151226_164234_authclient', 1659956331),
('m160125_053702_stored_filename', 1659956331),
('m160205_203840_foreign_keys', 1659956331),
('m160205_203913_foreign_keys', 1659956331),
('m160205_203939_foreign_keys', 1659956332),
('m160205_203955_foreign_keys', 1659956332),
('m160205_204000_foreign_keys', 1659956332),
('m160205_204010_foreign_keys', 1659956332),
('m160205_205540_foreign_keys', 1659956332),
('m160216_160119_initial', 1659956332),
('m160217_161220_addCanLeaveFlag', 1659956332),
('m160218_132531_close_and_anonymous_poll', 1659956390),
('m160220_013525_contentcontainer_id', 1659956332),
('m160221_222312_public_permission_change', 1659956332),
('m160225_180229_remove_website', 1659956332),
('m160227_073020_birthday_date', 1659956332),
('m160229_162959_multiusergroups', 1659956332),
('m160309_141222_longerUserName', 1659956332),
('m160408_100725_rename_groupadmin_to_manager', 1659956332),
('m160415_180332_wall_remove', 1659956332),
('m160501_220850_activity_pk_int', 1659956332),
('m160507_202611_settings', 1659956332),
('m160508_005740_settings_cleanup', 1659956332),
('m160509_214811_spaceurl', 1659956332),
('m160517_132535_group', 1659956332),
('m160523_105732_profile_searchable', 1659956332),
('m160714_142827_remove_space_id', 1659956332),
('m160719_131212_init_templates', 1659956388),
('m160808_124800_text_content', 1659956388),
('m160810_174011_add_description', 1659956393),
('m160817_130334_page_content_medium_text', 1659956388),
('m160817_180831_add_type', 1659956393),
('m160824_120822_add_has_wall_entry', 1659956393),
('m160831_133950_snippets', 1659956388),
('m160907_122454_file_content', 1659956388),
('m160907_175706_default_templates', 1659956388),
('m160908_084038_admin_only_other_pagetypes', 1659956388),
('m160922_092100_page_class', 1659956388),
('m160922_115053_page_url', 1659956388),
('m160922_143514_page_url_index', 1659956388),
('m161031_161947_file_directories', 1659956332),
('m170110_151419_membership_notifications', 1659956332),
('m170110_152425_space_follow_reset_send_notification', 1659956332),
('m170111_190400_disable_web_notifications', 1659956332),
('m170112_115052_settings', 1659956333),
('m170118_162332_streamchannel', 1659956333),
('m170119_160740_initial', 1659956333),
('m170122_091531_missingdefault', 1659956396),
('m170123_125622_pinned', 1659956333),
('m170210_154141_folderNoStream', 1659956393),
('m170211_105743_show_in_stream', 1659956333),
('m170211_110702_show_in_stream', 1659956393),
('m170224_100937_fix_default_modules', 1659956333),
('m170322_102446_removeContainerPagesFromStream', 1659956388),
('m170411_124612_fileDownloadContent', 1659956389),
('m170412_152540_template_element_label', 1659956389),
('m170412_163156_allow_inline_activation', 1659956389),
('m170413_085114_download_link_template', 1659956389),
('m170723_133337_content_tag', 1659956333),
('m170723_133338_content_tag_sort_order', 1659956333),
('m170805_211208_authclient_id', 1659956333),
('m170810_220543_group_sort', 1659956333),
('m170830_122433_set_root_partent_null', 1659956393),
('m170830_122439_foreignkeys', 1659956393),
('m171015_155102_contentcontainer_module', 1659956333),
('m171025_142030_queue_update', 1659956333),
('m171025_200312_utf8mb4_fixes', 1659956333),
('m171027_220519_exclusive_jobs', 1659956333),
('m180305_084435_membership_pk', 1659956333),
('m180315_112748_fix_email_length', 1659956333),
('m180327_125017_show_result_after_close', 1659956390),
('m180411_093623_checklist_and_revision', 1659956396),
('m180413_145745_categories', 1659956383),
('m180502_142535_renameclasses', 1659956396),
('m180504_092302_permission_name_and_list_updated_at', 1659956396),
('m180515_120940_list_settings_updated_at', 1659956396),
('m180515_120941_added_uid', 1659956396),
('m180907_224038_page_sort_order', 1659956383),
('m181029_160453_collation', 1659956334),
('m190211_133045_channel_length', 1659956334),
('m190213_135902_align_page_types', 1659956389),
('m190213_135903_humhub_richtext_content', 1659956389),
('m190213_135904_page_abstract', 1659956389),
('m190213_135905_blank_template', 1659956389),
('m190213_135906_text_edit_mode', 1659956389),
('m190309_201944_rename_settings', 1659956334),
('m190920_142605_fix_language_codes', 1659956334),
('m200217_122108_profile_translation_fix', 1659956334),
('m200218_122109_profile_translation_fix2', 1659956334),
('m200323_162006_fix_visibility', 1659956334),
('m200604_204445_remove_post_field', 1659956334),
('m200715_171721_defaultOption', 1659956334),
('m200715_184207_commentIndex', 1659956334),
('m200729_080349_commentIndex_fix_order', 1659956334),
('m200930_151639_add_about', 1659956334),
('m201020_125649_question_description', 1659956390),
('m201020_130431_fix_default_file_setting_value', 1659956334),
('m201025_095247_spaces_of_users_group', 1659956334),
('m201030_071320_add_download_counter', 1659956393),
('m201115_083832_add_notify_users_to_group', 1659956334),
('m201125_034854_alter_content_type_in_wiki_page_review', 1659956383),
('m201130_073907_default_permissions', 1659956334),
('m201130_073908_disable_legacy_richtextparser', 1659956334),
('m201208_045103_fix_account_menu_visibility', 1659956389),
('m201217_081828_fix_oembed_setting', 1659956334),
('m201228_064513_default_group', 1659956334),
('m210111_105355_hash', 1659956334),
('m210203_122333_profilePermissions', 1659956334),
('m210204_054203_fix_settings_unique_index', 1659956334),
('m210211_051243_container_tag', 1659956334),
('m210217_055359_protected_group', 1659956334),
('m210310_103412_fix_hash', 1659956334),
('m210331_115144_default_timezone', 1659956334),
('m210506_060737_profile_field_directory_filter', 1659956334),
('m210618_131400_is_container_menu', 1659956383),
('m210721_055137_content_locked_comments', 1659956334),
('m210727_102150_follow_friend', 1659956334),
('m210802_132539_remove_directory_option', 1659956389),
('m210924_114847_container_blocked_users', 1659956335),
('m211022_152413_file_history', 1659956335),
('m211124_180441_admin_group_label', 1659956335),
('m220121_193617_oembed_setting_update', 1659956335),
('m220207_183901_add_payload_column_to_notification_table', 1659956335),
('m220302_135158_add_content_id', 1659956335),
('m220606_205507_mailer_settings', 1659956335),
('m220608_125539_displaysubformat', 1659956335);

-- --------------------------------------------------------

--
-- Table structure for table `module_enabled`
--

CREATE TABLE IF NOT EXISTS `module_enabled` (
  `module_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `module_enabled`
--

INSERT INTO `module_enabled` (`module_id`) VALUES
('cfiles'),
('custom_pages'),
('mail'),
('polls'),
('tasks'),
('updater'),
('wiki');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `seen` tinyint(4) DEFAULT NULL,
  `source_class` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_pk` int(11) DEFAULT NULL,
  `space_id` int(11) DEFAULT NULL,
  `emailed` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `desktop_notified` tinyint(1) DEFAULT 0,
  `originator_user_id` int(11) DEFAULT NULL,
  `module` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `group_key` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `send_web_notifications` tinyint(1) DEFAULT 1,
  `payload` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_id` (`user_id`),
  KEY `index_seen` (`seen`),
  KEY `index_desktop_notified` (`desktop_notified`),
  KEY `index_desktop_emailed` (`emailed`),
  KEY `index_groupuser` (`user_id`,`class`,`group_key`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `class`, `user_id`, `seen`, `source_class`, `source_pk`, `space_id`, `emailed`, `created_at`, `desktop_notified`, `originator_user_id`, `module`, `group_key`, `send_web_notifications`, `payload`) VALUES
(1, 'humhub\\modules\\comment\\notifications\\NewComment', 1, 0, 'humhub\\modules\\comment\\models\\Comment', 1, 1, 0, '2022-08-08 11:00:54', 1, 2, 'comment', 'humhub\\modules\\post\\models\\Post-2', 1, NULL),
(2, 'humhub\\modules\\comment\\notifications\\NewComment', 3, 0, 'humhub\\modules\\comment\\models\\Comment', 1, 1, 0, '2022-08-08 11:00:54', 0, 2, 'comment', 'humhub\\modules\\post\\models\\Post-2', 1, NULL),
(3, 'humhub\\modules\\comment\\notifications\\NewComment', 1, 0, 'humhub\\modules\\comment\\models\\Comment', 2, 1, 0, '2022-08-08 11:00:54', 1, 3, 'comment', 'humhub\\modules\\post\\models\\Post-2', 1, NULL),
(4, 'humhub\\modules\\comment\\notifications\\NewComment', 2, 0, 'humhub\\modules\\comment\\models\\Comment', 2, 1, 0, '2022-08-08 11:00:54', 0, 3, 'comment', 'humhub\\modules\\post\\models\\Post-2', 1, NULL),
(5, 'humhub\\modules\\like\\notifications\\NewLike', 2, 0, 'humhub\\modules\\like\\models\\Like', 1, 1, 0, '2022-08-08 11:00:54', 0, 3, 'like', 'humhub\\modules\\comment\\models\\Comment-1', 1, NULL),
(6, 'humhub\\modules\\like\\notifications\\NewLike', 1, 0, 'humhub\\modules\\like\\models\\Like', 2, 1, 0, '2022-08-08 11:00:54', 1, 3, 'like', 'humhub\\modules\\post\\models\\Post-2', 1, NULL),
(7, 'humhub\\modules\\comment\\notifications\\NewComment', 1, 0, 'humhub\\modules\\comment\\models\\Comment', 3, 1, 0, '2022-08-08 11:00:54', 1, 2, 'comment', 'humhub\\modules\\polls\\models\\Poll-1', 1, NULL),
(8, 'humhub\\modules\\comment\\notifications\\NewComment', 3, 0, 'humhub\\modules\\comment\\models\\Comment', 3, 1, 0, '2022-08-08 11:00:54', 0, 2, 'comment', 'humhub\\modules\\polls\\models\\Poll-1', 1, NULL),
(9, 'humhub\\modules\\comment\\notifications\\NewComment', 1, 0, 'humhub\\modules\\comment\\models\\Comment', 4, 1, 0, '2022-08-08 11:00:55', 1, 3, 'comment', 'humhub\\modules\\polls\\models\\Poll-1', 1, NULL),
(10, 'humhub\\modules\\comment\\notifications\\NewComment', 2, 0, 'humhub\\modules\\comment\\models\\Comment', 4, 1, 0, '2022-08-08 11:00:55', 0, 3, 'comment', 'humhub\\modules\\polls\\models\\Poll-1', 1, NULL),
(13, 'humhub\\modules\\friendship\\notifications\\RequestApproved', 1, 1, 'humhub\\modules\\friendship\\models\\Friendship', 2, NULL, 0, '2022-08-08 16:01:02', 1, 4, 'friendship', NULL, 1, NULL),
(14, 'humhub\\modules\\space\\notifications\\InviteAccepted', 1, 0, 'humhub\\modules\\space\\models\\Space', 2, 2, 0, '2022-08-08 16:01:03', 1, 4, 'space', NULL, 1, NULL),
(15, 'humhub\\modules\\space\\notifications\\ApprovalRequest', 1, 0, 'humhub\\modules\\space\\models\\Space', 5, 5, 0, '2022-08-08 16:05:02', 1, 4, 'space', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `poll`
--

CREATE TABLE IF NOT EXISTS `poll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_multiple` smallint(6) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `is_random` tinyint(1) DEFAULT 0,
  `closed` tinyint(1) DEFAULT 0,
  `anonymous` tinyint(1) DEFAULT 0,
  `show_result_after_close` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `poll`
--

INSERT INTO `poll` (`id`, `question`, `description`, `allow_multiple`, `created_at`, `created_by`, `updated_at`, `updated_by`, `is_random`, `closed`, `anonymous`, `show_result_after_close`) VALUES
(1, 'Location of the next meeting', 'Right now, we are in the planning stages for our next meetup and we would like to know from you, where you would like to go?', 0, '2022-08-08 11:00:53', 1, '2022-08-08 11:00:53', 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `poll_answer`
--

CREATE TABLE IF NOT EXISTS `poll_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `poll_answer`
--

INSERT INTO `poll_answer` (`id`, `poll_id`, `answer`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, 'To Daniel', '2022-08-08 11:00:53', 1, '2022-08-08 11:00:53', 1),
(2, 1, 'Club A Steakhouse', '2022-08-08 11:00:53', 1, '2022-08-08 11:00:53', 1),
(3, 1, 'Pisillo Italian Panini', '2022-08-08 11:00:53', 1, '2022-08-08 11:00:53', 1);

-- --------------------------------------------------------

--
-- Table structure for table `poll_answer_user`
--

CREATE TABLE IF NOT EXISTS `poll_answer_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL,
  `poll_answer_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `poll_answer_user`
--

INSERT INTO `poll_answer_user` (`id`, `poll_id`, `poll_answer_id`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, 2, '2022-08-08 11:00:53', 2, '2022-08-08 11:00:53', 2),
(2, 1, 3, '2022-08-08 11:00:53', 3, '2022-08-08 11:00:53', 3),
(3, 1, 2, '2022-08-08 17:05:22', 4, '2022-08-08 17:05:22', 4);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `message`, `url`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'Yay! I\'ve just installed HumHub :sunglasses:', NULL, '2022-08-08 11:00:49', 1, '2022-08-08 11:00:49', 1),
(2, 'We\'re looking for great slogans of famous brands. Maybe you can come up with some samples?', NULL, '2022-08-08 11:00:53', 1, '2022-08-08 11:00:53', 1),
(3, 'Testing this space', NULL, '2022-08-08 16:03:20', 1, '2022-08-08 16:03:20', 1),
(4, 'This is the first post!', NULL, '2022-08-08 17:00:51', 1, '2022-08-08 17:00:51', 1),
(5, 'This is  a post with a TOPICS', NULL, '2022-08-08 17:01:47', 1, '2022-08-08 18:06:51', 1);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `user_id` int(11) NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday_hide_year` int(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `about` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_private` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_work` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `im_skype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `im_xmpp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_xing` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_vimeo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_flickr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_myspace` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`user_id`, `firstname`, `lastname`, `title`, `gender`, `street`, `zip`, `city`, `country`, `state`, `birthday_hide_year`, `birthday`, `about`, `phone_private`, `phone_work`, `mobile`, `fax`, `im_skype`, `im_xmpp`, `url`, `url_facebook`, `url_linkedin`, `url_xing`, `url_youtube`, `url_vimeo`, `url_flickr`, `url_myspace`, `url_twitter`) VALUES
(1, 'Admin', 'Istrator', 'System Administration', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'David', 'Roberts', 'Late riser', NULL, '2443 Queens Lane', '24574', 'Allwood', 'Virginia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Sara', 'Schuster', 'Do-gooder', NULL, 'Schmarjestrasse 51', '17095', 'Friedland', 'Niedersachsen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Bill', 'Gates', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profile_field`
--

CREATE TABLE IF NOT EXISTS `profile_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_field_category_id` int(11) NOT NULL,
  `module_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_type_class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_type_config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `internal_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 100,
  `required` tinyint(4) DEFAULT NULL,
  `show_at_registration` tinyint(4) DEFAULT NULL,
  `editable` tinyint(4) NOT NULL DEFAULT 1,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_attribute` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `translation_category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_system` int(1) DEFAULT NULL,
  `searchable` tinyint(1) DEFAULT 1,
  `directory_filter` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `index_profile_field_category` (`profile_field_category_id`),
  KEY `index_directory_filter` (`directory_filter`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profile_field`
--

INSERT INTO `profile_field` (`id`, `profile_field_category_id`, `module_id`, `field_type_class`, `field_type_config`, `internal_name`, `title`, `description`, `sort_order`, `required`, `show_at_registration`, `editable`, `visible`, `created_at`, `created_by`, `updated_at`, `updated_by`, `ldap_attribute`, `translation_category`, `is_system`, `searchable`, `directory_filter`) VALUES
(1, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":20,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'firstname', 'First name', NULL, 100, 1, 1, 1, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, 'givenName', NULL, 1, 1, 0),
(2, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":30,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'lastname', 'Last name', NULL, 200, 1, 1, 1, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, 'sn', NULL, 1, 1, 0),
(3, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":50,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'title', 'Title', NULL, 300, NULL, NULL, 1, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, 'title', NULL, 1, 1, 0),
(4, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Select', '{\"options\":\"male=>Male\\nfemale=>Female\\ncustom=>Custom\",\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}', 'gender', 'Gender', NULL, 300, NULL, NULL, 1, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, NULL, NULL, 1, 1, 0),
(5, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":150,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'street', 'Street', NULL, 400, NULL, NULL, 1, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, NULL, NULL, 1, 1, 0),
(6, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":10,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'zip', 'Zip', NULL, 500, NULL, NULL, 1, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, NULL, NULL, 1, 1, 0),
(7, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'city', 'City', NULL, 600, NULL, NULL, 1, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, NULL, NULL, 1, 1, 0),
(8, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\CountrySelect', '{\"options\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}', 'country', 'Country', NULL, 700, NULL, NULL, 1, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, NULL, NULL, 1, 1, 0),
(9, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'state', 'State', NULL, 800, NULL, NULL, 1, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, NULL, NULL, 1, 1, 0),
(10, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Birthday', '{\"defaultHideAge\":\"0\",\"fieldTypes\":[],\"isVirtual\":false,\"canBeDirectoryFilter\":false}', 'birthday', 'Birthday', NULL, 900, NULL, NULL, 1, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, NULL, NULL, 1, 1, 0),
(11, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\TextArea', '{\"fieldTypes\":[],\"isVirtual\":false,\"canBeDirectoryFilter\":false}', 'about', 'About', NULL, 900, NULL, NULL, 1, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, NULL, NULL, 1, 1, 0),
(12, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'phone_private', 'Phone Private', NULL, 100, NULL, NULL, 1, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, NULL, NULL, 1, 1, 0),
(13, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'phone_work', 'Phone Work', NULL, 200, NULL, NULL, 1, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, NULL, NULL, 1, 1, 0),
(14, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'mobile', 'Mobile', NULL, 300, NULL, NULL, 1, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, NULL, NULL, 1, 1, 0),
(15, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\UserEmail', '{\"isVirtual\":true,\"fieldTypes\":[],\"canBeDirectoryFilter\":false}', 'email_virtual', 'E-Mail', NULL, 350, 0, 0, 0, 0, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, NULL, NULL, NULL, 0, 0),
(16, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'fax', 'Fax', NULL, 400, NULL, NULL, 1, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, NULL, NULL, 1, 1, 0),
(17, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'im_skype', 'Skype Nickname', NULL, 500, NULL, NULL, 1, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, NULL, NULL, 1, 1, 0),
(18, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":255,\"validator\":\"email\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'im_xmpp', 'XMPP Jabber Address', NULL, 800, NULL, NULL, 1, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, NULL, NULL, 1, 1, 0),
(19, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'url', 'Url', NULL, 100, NULL, NULL, 1, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, NULL, NULL, 1, 1, 0),
(20, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'url_facebook', 'Facebook URL', NULL, 200, NULL, NULL, 1, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, NULL, NULL, 1, 1, 0),
(21, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'url_linkedin', 'LinkedIn URL', NULL, 300, NULL, NULL, 1, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, NULL, NULL, 1, 1, 0),
(22, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'url_xing', 'Xing URL', NULL, 400, NULL, NULL, 1, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, NULL, NULL, 1, 1, 0),
(23, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'url_youtube', 'Youtube URL', NULL, 500, NULL, NULL, 1, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, NULL, NULL, 1, 1, 0),
(24, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'url_vimeo', 'Vimeo URL', NULL, 600, NULL, NULL, 1, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:56', NULL, NULL, NULL, 1, 1, 0),
(25, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'url_flickr', 'Flickr URL', NULL, 700, NULL, NULL, 1, 1, '2022-08-08 10:58:56', NULL, '2022-08-08 10:58:56', NULL, NULL, NULL, 1, 1, 0),
(26, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'url_myspace', 'MySpace URL', NULL, 800, NULL, NULL, 1, 1, '2022-08-08 10:58:56', NULL, '2022-08-08 10:58:56', NULL, NULL, NULL, 1, 1, 0),
(27, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'url_twitter', 'Twitter URL', NULL, 1000, NULL, NULL, 1, 1, '2022-08-08 10:58:56', NULL, '2022-08-08 10:58:56', NULL, NULL, NULL, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `profile_field_category`
--

CREATE TABLE IF NOT EXISTS `profile_field_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 100,
  `module_id` int(11) DEFAULT NULL,
  `visibility` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `translation_category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_system` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profile_field_category`
--

INSERT INTO `profile_field_category` (`id`, `title`, `description`, `sort_order`, `module_id`, `visibility`, `created_at`, `created_by`, `updated_at`, `updated_by`, `translation_category`, `is_system`) VALUES
(1, 'General', '', 100, NULL, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, NULL, 1),
(2, 'Communication', '', 200, NULL, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, NULL, 1),
(3, 'Social bookmarks', '', 300, NULL, 1, '2022-08-08 10:58:55', NULL, '2022-08-08 10:58:55', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE IF NOT EXISTS `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job` blob NOT NULL,
  `pushed_at` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL,
  `priority` int(11) UNSIGNED NOT NULL DEFAULT 1024,
  `reserved_at` int(11) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `done_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channel` (`channel`),
  KEY `reserved_at` (`reserved_at`),
  KEY `priority` (`priority`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `queue_exclusive`
--

CREATE TABLE IF NOT EXISTS `queue_exclusive` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_message_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_status` smallint(6) DEFAULT 2,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `queue_exclusive`
--

INSERT INTO `queue_exclusive` (`id`, `job_message_id`, `job_status`, `last_update`) VALUES
('humhub\\modules\\activity\\jobs\\SendMailSummary1', '66', 2, '2022-08-09 11:07:02'),
('humhub\\modules\\activity\\jobs\\SendMailSummary2', '57', 2, '2022-08-08 16:00:02'),
('search.update.03cf50d034d7415616f9084317313c45', '43', 2, '2022-08-08 15:00:51'),
('search.update.1dad9ed37f07f9399478eab024d98832', '22', 2, '2022-08-08 13:55:14'),
('search.update.34adc3f8ba09ff3ef48513a09d9518f3', '7', 2, '2022-08-08 11:00:53'),
('search.update.35b00d81c1c9c19138d948da20a13253', '16', 2, '2022-08-08 11:00:53'),
('search.update.3d7b2424b991a0e9e3f987185369465f', '2', 2, '2022-08-08 11:00:49'),
('search.update.40672985df2ffc10697640fbf94e30e9', '59', 2, '2022-08-08 16:07:05'),
('search.update.49e5bf1ceddaea2bdb047f46cb3866ff', '9', 2, '2022-08-08 11:16:50'),
('search.update.4df6ca6c1dbf501c96513447f9750fe1', '28', 2, '2022-08-08 14:02:26'),
('search.update.5a1f359fd1047743f8abb8379d515399', '8', 2, '2022-08-08 11:00:52'),
('search.update.5d3442d55a23104e96f057bf0e15ea1f', '4', 2, '2022-08-08 11:00:49'),
('search.update.61d253a60716d05373682bdf38636356', '3', 2, '2022-08-08 11:00:49'),
('search.update.85a19f443c20eca221cb2a2b6034bec8', '17', 2, '2022-08-08 13:51:07'),
('search.update.8f2af32e6f1174bab327dd86a36931f8', '29', 2, '2022-08-08 14:02:26'),
('search.update.a4cb70bb5efe4d31fd8302088ec03b1d', '1', 2, '2022-08-08 11:00:49'),
('search.update.a4db9c949910e81dbfb2212882f002ca', '18', 2, '2022-08-08 13:51:16'),
('search.update.b9593d625fde18702cc768fa5c44c33b', '27', 2, '2022-08-08 14:02:20'),
('search.update.bf655d283ff597c58a52647d65148919', '7', 2, '2022-08-08 11:00:52'),
('search.update.c08d7e0c26acdf4de640eb3562a073b6', '19', 2, '2022-08-08 13:51:16'),
('search.update.c10f5066d89e2ecdaa3c2978fe87b276', '31', 2, '2022-08-08 14:03:20'),
('search.update.d44770b89ae8b7a54ccc3fb8b952c372', '6', 2, '2022-08-08 11:00:49'),
('search.update.da0441b5e815a7743573d38784544d01', '26', 2, '2022-08-08 14:02:01'),
('search.update.e028b190d8cfee3b78289aef5d0bc3ba', '34', 2, '2022-08-08 14:04:47');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE IF NOT EXISTS `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique-setting` (`name`,`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `name`, `value`, `module_id`) VALUES
(1, 'oembedProviders', '{\"Facebook Video\":{\"pattern\":\"/facebook\\\\.com\\\\/(.*)(video)/\",\"endpoint\":\"https://graph.facebook.com/v12.0/oembed_video?url=%url%&access_token=\"},\"Facebook Post\":{\"pattern\":\"/facebook\\\\.com\\\\/(.*)(post|activity|photo|permalink|media|question|note)/\",\"endpoint\":\"https://graph.facebook.com/v12.0/oembed_post?url=%url%&access_token=\"},\"Facebook Page\":{\"pattern\":\"/^(https\\\\:\\\\/\\\\/)*(www\\\\.)*facebook\\\\.com\\\\/((?!video|post|activity|photo|permalink|media|question|note).)*$/\",\"endpoint\":\"https://graph.facebook.com/v12.0/oembed_post?url=%url%&access_token=\"},\"Instagram\":{\"pattern\":\"/instagram\\\\.com/\",\"endpoint\":\"https://graph.facebook.com/v12.0/instagram_oembed?url=%url%&access_token=\"},\"Twitter\":{\"pattern\":\"/twitter\\\\.com/\",\"endpoint\":\"https://publish.twitter.com/oembed?url=%url%&maxwidth=450\"},\"YouTube\":{\"pattern\":\"/youtube\\\\.com|youtu.be/\",\"endpoint\":\"https://www.youtube.com/oembed?scheme=https&url=%url%&format=json&maxwidth=450\"},\"Soundcloud\":{\"pattern\":\"/soundcloud\\\\.com/\",\"endpoint\":\"https://soundcloud.com/oembed?url=%url%&format=json&maxwidth=450\"},\"Vimeo\":{\"pattern\":\"/vimeo\\\\.com/\",\"endpoint\":\"https://vimeo.com/api/oembed.json?scheme=https&url=%url%&format=json&maxwidth=450\"},\"SlideShare\":{\"pattern\":\"/slideshare\\\\.net/\",\"endpoint\":\"https://www.slideshare.net/api/oembed/2?url=%url%&format=json&maxwidth=450\"}}', 'base'),
(2, 'defaultVisibility', '1', 'space'),
(3, 'defaultJoinPolicy', '1', 'space'),
(4, 'includeCommunityModules', '1', 'marketplace'),
(5, 'richtextCompatMode', '0', 'content'),
(6, 'auth.showRegistrationUserGroup', '1', 'user'),
(7, 'displayNameSubFormat', 'title', 'base'),
(9, 'name', 'InkuA', 'base'),
(10, 'baseUrl', 'https://dev.inkua.de', 'base'),
(11, 'paginationSize', '10', 'base'),
(12, 'displayNameFormat', '{profile.firstname} {profile.lastname}', 'base'),
(13, 'horImageScrollOnMobile', '1', 'base'),
(14, 'cronLastDailyRun', '1659974402', 'base'),
(15, 'auth.needApproval', '0', 'user'),
(16, 'auth.anonymousRegistration', '1', 'user'),
(17, 'auth.internalUsersCanInvite', '0', 'user'),
(18, 'auth.showCaptureInRegisterForm', '1', 'user'),
(19, 'mailer.transportType', 'smtp', 'base'),
(20, 'mailer.systemEmailAddress', 'hub@inkua.de', 'base'),
(21, 'mailer.systemEmailName', 'InkuA', 'base'),
(22, 'mailSummaryInterval', '2', 'activity'),
(23, 'maxFileSize', '5242880', 'file'),
(24, 'excludeMediaFilesPreview', '1', 'file'),
(25, 'cache.class', 'yii\\caching\\FileCache', 'base'),
(26, 'cache.expireTime', '3600', 'base'),
(27, 'installationId', '184cd8b1b3cd877ef0ba47aef134ace4', 'admin'),
(28, 'spaceOrder', '1', 'space'),
(29, 'enable', '1', 'tour'),
(30, 'defaultLanguage', 'en-US', 'base'),
(31, 'enable_html5_desktop_notifications', '0', 'notification'),
(32, 'cronLastRun', '1660043701', 'base'),
(65, 'useCase', 'intranet', 'base'),
(66, 'auth.allowGuestAccess', '1', 'user'),
(67, 'enable', '1', 'friendship'),
(68, 'sampleData', '1', 'installer'),
(69, 'secret', 'ea6f4ee6-807b-45bf-8849-297d831d9030', 'base'),
(70, 'defaultTimeZone', 'Europe/Berlin', 'base'),
(71, 'timeZone', 'UTC', 'base'),
(72, 'group.adminGroupId', '1', 'user'),
(73, 'global_pages_migrated_visibility', '1', 'custom_pages'),
(74, 'maintenanceMode', '0', 'base'),
(75, 'showProfilePostForm', '1', 'dashboard'),
(76, 'theme', '/srv/www/foobar/public_html/themes/HumHub', 'base'),
(77, 'defaultDateInputFormat', '', 'admin'),
(78, 'useDefaultSwipeOnMobile', '1', 'base'),
(79, 'defaultSort', 'c', 'stream'),
(80, 'themeParents', '[]', 'base'),
(81, 'theme.var.HumHub.default', '#f3f3f3', 'base'),
(82, 'theme.var.HumHub.primary', '#435f6f', 'base'),
(83, 'theme.var.HumHub.info', '#21A1B3', 'base'),
(84, 'theme.var.HumHub.success', '#97d271', 'base'),
(85, 'theme.var.HumHub.warning', '#FFC107', 'base'),
(86, 'theme.var.HumHub.danger', '#FC4A64', 'base'),
(87, 'theme.var.HumHub.link', '#21A1B3', 'base'),
(88, 'theme.var.HumHub.isFluid', 'false', 'base'),
(89, 'theme.var.HumHub.text-color-main', '#555', 'base'),
(90, 'theme.var.HumHub.text-color-secondary', '#7a7a7a', 'base'),
(91, 'theme.var.HumHub.text-color-highlight', '#000', 'base'),
(92, 'theme.var.HumHub.text-color-soft', '#555555', 'base'),
(93, 'theme.var.HumHub.text-color-soft2', '#aeaeae', 'base'),
(94, 'theme.var.HumHub.text-color-soft3', '#bac2c7', 'base'),
(95, 'theme.var.HumHub.text-color-contrast', '#fff', 'base'),
(96, 'theme.var.HumHub.background-color-main', '#fff', 'base'),
(97, 'theme.var.HumHub.background-color-secondary', '#f7f7f7', 'base'),
(98, 'theme.var.HumHub.background-color-page', '#ededed', 'base'),
(99, 'theme.var.HumHub.background-color-highlight', '#fff8e0', 'base'),
(100, 'theme.var.HumHub.background3', '#d7d7d7', 'base'),
(101, 'theme.var.HumHub.background4', '#b2b2b2', 'base'),
(102, 'theme.var.HumHub.background-color-success', '#f7fbf4', 'base'),
(103, 'theme.var.HumHub.text-color-success', '#84be5e', 'base'),
(104, 'theme.var.HumHub.border-color-success', '#97d271', 'base'),
(105, 'theme.var.HumHub.background-color-warning', '#fffbf7', 'base'),
(106, 'theme.var.HumHub.text-color-warning', '#e9b168', 'base'),
(107, 'theme.var.HumHub.border-color-warning', '#fdd198', 'base'),
(108, 'theme.var.HumHub.background-color-danger', '#fff6f6', 'base'),
(109, 'theme.var.HumHub.text-color-danger', '#ff8989', 'base'),
(110, 'theme.var.HumHub.border-color-danger', '#ff8989', 'base'),
(111, 'theme.var.HumHub.mail-font-url', '\'http://fonts.googleapis.com/css?family=Open+Sans:300,100,400,600\'', 'base'),
(112, 'theme.var.HumHub.mail-font-family', '\'Open Sans\', Arial, Tahoma, Helvetica, sans-serif', 'base'),
(113, 'mailer.hostname', 'localhost', 'base'),
(114, 'mailer.username', 'admin', 'base'),
(115, 'mailer.password', 'admin', 'base'),
(116, 'mailer.port', '1025', 'base'),
(117, 'mailer.useSmtps', '0', 'base'),
(118, 'mailer.allowSelfSignedCerts', '0', 'base'),
(119, 'mailer.systemEmailReplyTo', '', 'base'),
(120, 'cronLastHourlyRun', '1660043222', 'base'),
(121, 'showInTopNav', '1', 'mail'),
(122, 'newUserRestrictionEnabled', '1', 'mail'),
(123, 'newUserSinceDays', '14', 'mail'),
(124, 'newUserConversationRestriction', '5', 'mail'),
(125, 'newUserMessageRestriction', '5', 'mail'),
(126, 'userConversationRestriction', '15', 'mail'),
(127, 'userMessageRestriction', '0', 'mail'),
(128, 'channel', 'beta', 'updater');

-- --------------------------------------------------------

--
-- Table structure for table `space`
--

CREATE TABLE IF NOT EXISTS `space` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `join_policy` tinyint(4) DEFAULT NULL,
  `visibility` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_dn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_add_new_members` int(4) DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `default_content_visibility` tinyint(1) DEFAULT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `members_can_leave` int(11) DEFAULT 1,
  `url` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url-unique` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `space`
--

INSERT INTO `space` (`id`, `guid`, `name`, `description`, `about`, `join_policy`, `visibility`, `status`, `created_at`, `created_by`, `updated_at`, `updated_by`, `ldap_dn`, `auto_add_new_members`, `contentcontainer_id`, `default_content_visibility`, `color`, `members_can_leave`, `url`) VALUES
(1, 'd9efa8b0-43c9-414c-aae6-9cda660fe142', 'Welcome Space', 'Your first sample space to discover the platform.', NULL, 2, 2, 1, '2022-08-08 11:00:49', 1, '2022-08-08 11:00:49', 1, NULL, 1, 2, NULL, '#6fdbe8', 1, 'welcome-space'),
(2, '696c7770-88e3-4394-978b-e6b11592e83c', 'Software Development', '', NULL, 1, 1, 1, '2022-08-08 15:51:07', 1, '2022-08-08 15:51:07', 1, NULL, NULL, 6, NULL, '#5c0584', 1, 'software-development'),
(3, '048f7203-f574-4f1a-9d52-9db720233a72', 'Onboarding Space', 'Espacio para presentarse y coordinar una entrevista con RRHH', NULL, 0, 1, 1, '2022-08-08 15:53:56', 1, '2022-08-08 15:55:14', 1, NULL, NULL, 7, 0, '#7e8706', 1, 'onboarding-space'),
(4, 'b8fd071c-1c31-44ef-9d83-9d9391be197d', 'Admin\'s Invisible Space', '', NULL, 0, 0, 1, '2022-08-08 16:02:01', 1, '2022-08-08 16:02:01', 1, NULL, NULL, 8, 0, '#e514a3', 1, 'admins-invisible-space'),
(5, '6c53deac-e1d0-4558-87b6-ce8862528266', 'Graphic Design Space', '', NULL, 1, 1, 1, '2022-08-08 16:02:20', 1, '2022-08-08 16:02:20', 1, NULL, NULL, 9, NULL, '#016b4e', 1, 'graphic-design-space');

-- --------------------------------------------------------

--
-- Table structure for table `space_membership`
--

CREATE TABLE IF NOT EXISTS `space_membership` (
  `space_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `originator_user_id` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `request_message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_visit` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `group_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'member',
  `show_at_dashboard` tinyint(1) DEFAULT 1,
  `can_cancel_membership` int(11) DEFAULT 1,
  `send_notifications` tinyint(1) DEFAULT 0,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `index_status` (`status`),
  KEY `fk_space_membership-space_id` (`space_id`),
  KEY `fk_space_membership-user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `space_membership`
--

INSERT INTO `space_membership` (`space_id`, `user_id`, `originator_user_id`, `status`, `request_message`, `last_visit`, `created_at`, `created_by`, `updated_at`, `updated_by`, `group_id`, `show_at_dashboard`, `can_cancel_membership`, `send_notifications`, `id`) VALUES
(1, 1, NULL, 3, NULL, '2022-08-08 16:09:38', '2022-08-08 11:00:49', 1, '2022-08-08 11:00:49', 1, 'admin', 1, 1, 0, 1),
(1, 2, NULL, 3, NULL, NULL, '2022-08-08 11:00:52', 1, '2022-08-08 11:00:52', 1, 'member', 1, 1, 0, 2),
(1, 3, NULL, 3, NULL, NULL, '2022-08-08 11:00:52', 1, '2022-08-08 11:00:52', 1, 'member', 1, 1, 0, 3),
(1, 4, NULL, 3, NULL, '2022-08-08 17:05:22', '2022-08-08 13:16:50', NULL, '2022-08-08 13:16:50', NULL, 'member', 1, 1, 0, 4),
(2, 1, NULL, 3, NULL, '2022-08-08 18:07:26', '2022-08-08 15:51:07', 1, '2022-08-08 15:51:07', 1, 'admin', 1, 1, 0, 5),
(2, 4, '1', 3, NULL, '2022-08-08 17:38:21', '2022-08-08 15:51:31', 1, '2022-08-08 16:00:13', 4, 'member', 1, 1, 0, 6),
(3, 1, NULL, 3, NULL, '2022-08-08 16:09:35', '2022-08-08 15:53:57', 1, '2022-08-08 15:53:57', 1, 'admin', 1, 1, 0, 7),
(4, 1, NULL, 3, NULL, '2022-08-08 16:02:08', '2022-08-08 16:02:01', 1, '2022-08-08 16:02:01', 1, 'admin', 1, 1, 0, 8),
(5, 1, NULL, 3, NULL, '2022-08-08 16:04:52', '2022-08-08 16:02:21', 1, '2022-08-08 16:02:21', 1, 'admin', 1, 1, 0, 9),
(5, 4, NULL, 2, 'Hey, I\'m your friend, let me in!', NULL, '2022-08-08 16:04:03', 4, '2022-08-08 16:04:03', 4, 'member', 1, 1, 0, 10);

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE IF NOT EXISTS `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `max_users` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `review` tinyint(4) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scheduling` tinyint(4) NOT NULL,
  `all_day` tinyint(4) NOT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `cal_mode` tinyint(4) NOT NULL DEFAULT 0,
  `time_zone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_sent` tinyint(4) DEFAULT 0,
  `task_list_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-task-list-task-id` (`task_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_item`
--

CREATE TABLE IF NOT EXISTS `task_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `completed` tinyint(4) DEFAULT 0,
  `sort_order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk-task-item-task-id` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_list_setting`
--

CREATE TABLE IF NOT EXISTS `task_list_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `hide_if_completed` tinyint(4) DEFAULT 1,
  `sort_order` int(11) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-task-list-setting-task-id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_reminder`
--

CREATE TABLE IF NOT EXISTS `task_reminder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `remind_mode` tinyint(4) DEFAULT 0,
  `start_reminder_sent` tinyint(4) NOT NULL DEFAULT 0,
  `end_reminder_sent` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk-task-reminder-task-id` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_user`
--

CREATE TABLE IF NOT EXISTS `task_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `user_type` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `url_oembed`
--

CREATE TABLE IF NOT EXISTS `url_oembed` (
  `url` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preview` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` char(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_mode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `visibility` int(1) DEFAULT 1,
  `time_zone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `authclient_id` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`),
  UNIQUE KEY `unique_username` (`username`),
  UNIQUE KEY `unique_guid` (`guid`),
  UNIQUE KEY `unique_authclient_id` (`authclient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `guid`, `status`, `username`, `email`, `auth_mode`, `language`, `created_at`, `created_by`, `updated_at`, `updated_by`, `last_login`, `visibility`, `time_zone`, `contentcontainer_id`, `authclient_id`) VALUES
(1, '00178815-0b84-48df-82c3-2c6638b1dc62', 1, 'admin', 'admin@gmail.com', 'local', '', '2022-08-08 11:00:49', NULL, '2022-08-08 11:00:49', NULL, '2022-08-09 13:13:31', 1, NULL, 1, NULL),
(2, '3bc871df-f385-4407-9b20-49bd4d8f40dd', 1, 'david1986', 'david.roberts@example.com', 'local', '', '2022-08-08 11:00:52', 1, '2022-08-08 11:00:52', 1, NULL, 1, NULL, 3, NULL),
(3, '8431fd69-1ec3-4274-b6f7-fc398146ba11', 1, 'sara1989', 'sara.schuster@example.com', 'local', '', '2022-08-08 11:00:52', 1, '2022-08-08 11:00:52', 1, NULL, 1, NULL, 4, NULL),
(4, '6fee48bb-5dd2-416f-8834-eb33a7e5abbb', 1, 'billgates', 'bill.gates@microsoft.com', 'local', 'en-US', '2022-08-08 13:16:50', NULL, '2022-08-08 13:16:50', NULL, '2022-08-08 15:59:48', 1, 'Europe/Berlin', 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_auth`
--

CREATE TABLE IF NOT EXISTS `user_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `source` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_follow`
--

CREATE TABLE IF NOT EXISTS `user_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `send_notifications` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `index_user` (`user_id`),
  KEY `index_object` (`object_model`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_follow`
--

INSERT INTO `user_follow` (`id`, `object_model`, `object_id`, `user_id`, `send_notifications`) VALUES
(1, 'humhub\\modules\\cfiles\\models\\Folder', 1, 1, 1),
(2, 'humhub\\modules\\cfiles\\models\\Folder', 2, 1, 1),
(3, 'humhub\\modules\\post\\models\\Post', 1, 1, 1),
(4, 'humhub\\modules\\post\\models\\Post', 2, 1, 1),
(5, 'humhub\\modules\\post\\models\\Post', 2, 2, 1),
(6, 'humhub\\modules\\post\\models\\Post', 2, 3, 1),
(7, 'humhub\\modules\\polls\\models\\Poll', 1, 1, 1),
(8, 'humhub\\modules\\polls\\models\\Poll', 1, 2, 1),
(9, 'humhub\\modules\\polls\\models\\Poll', 1, 3, 1),
(10, 'humhub\\modules\\cfiles\\models\\Folder', 3, 1, 1),
(11, 'humhub\\modules\\cfiles\\models\\Folder', 4, 1, 1),
(12, 'humhub\\modules\\user\\models\\User', 4, 1, 0),
(13, 'humhub\\modules\\user\\models\\User', 1, 4, 0),
(14, 'humhub\\modules\\cfiles\\models\\Folder', 5, 1, 1),
(15, 'humhub\\modules\\cfiles\\models\\Folder', 6, 1, 1),
(16, 'humhub\\modules\\post\\models\\Post', 3, 1, 1),
(17, 'humhub\\modules\\wiki\\models\\WikiPage', 1, 1, 1),
(18, 'humhub\\modules\\post\\models\\Post', 4, 1, 1),
(19, 'humhub\\modules\\post\\models\\Post', 5, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_friendship`
--

CREATE TABLE IF NOT EXISTS `user_friendship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `friend_user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx-friends` (`user_id`,`friend_user_id`),
  KEY `fk-friend` (`friend_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_friendship`
--

INSERT INTO `user_friendship` (`id`, `user_id`, `friend_user_id`, `created_at`) VALUES
(1, 1, 4, '2022-08-08 15:58:14'),
(2, 4, 1, '2022-08-08 16:00:05');

-- --------------------------------------------------------

--
-- Table structure for table `user_http_session`
--

CREATE TABLE IF NOT EXISTS `user_http_session` (
  `id` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `data` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_http_session-user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_http_session`
--

INSERT INTO `user_http_session` (`id`, `expire`, `user_id`, `data`) VALUES
('ukqnghjr4sico3rjgvtbm2goht', 1660045148, 1, 0x5f5f666c6173687c613a303a7b7d5f5f69647c693a313b5f5f617574684b65797c733a33363a2230303137383831352d306238342d343864662d383263332d326336363338623164633632223b5f5f6578706972657c693a313636303034353130383b757365722e63616e53656541646d696e53656374696f6e7c623a313b6c6976652e706f6c6c2e6c617374517565727954696d657c693a313636303034333730383b);

-- --------------------------------------------------------

--
-- Table structure for table `user_invite`
--

CREATE TABLE IF NOT EXISTS `user_invite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_originator_id` int(11) DEFAULT NULL,
  `space_invite_id` int(11) DEFAULT NULL,
  `email` char(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `language` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`),
  UNIQUE KEY `unique_token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_invite`
--

INSERT INTO `user_invite` (`id`, `user_originator_id`, `space_invite_id`, `email`, `source`, `token`, `created_at`, `created_by`, `updated_at`, `updated_by`, `language`, `firstname`, `lastname`) VALUES
(1, NULL, NULL, 'test@gmail.com', 'self', 'JtcHk7M8HsjY', '2022-08-08 11:01:34', NULL, '2022-08-08 11:01:34', NULL, 'en-US', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_mentioning`
--

CREATE TABLE IF NOT EXISTS `user_mentioning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `i_user` (`user_id`),
  KEY `i_object` (`object_model`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_message`
--

CREATE TABLE IF NOT EXISTS `user_message` (
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_originator` tinyint(4) DEFAULT NULL,
  `last_viewed` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`message_id`,`user_id`),
  KEY `index_last_viewed` (`last_viewed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_message`
--

INSERT INTO `user_message` (`message_id`, `user_id`, `is_originator`, `last_viewed`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, 1, '2022-08-08 13:35:14', '2022-08-08 13:35:10', 1, '2022-08-08 13:35:14', 1),
(1, 4, NULL, '2022-08-08 16:05:40', '2022-08-08 13:35:09', 1, '2022-08-08 16:05:40', 4);

-- --------------------------------------------------------

--
-- Table structure for table `user_message_tag`
--

CREATE TABLE IF NOT EXISTS `user_message_tag` (
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`message_id`,`tag_id`),
  KEY `fk-user-message-id` (`message_id`,`user_id`),
  KEY `fk-conversation-tag-tag-id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_password`
--

CREATE TABLE IF NOT EXISTS `user_password` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `algorithm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_password`
--

INSERT INTO `user_password` (`id`, `user_id`, `algorithm`, `password`, `salt`, `created_at`) VALUES
(1, 1, 'sha512whirlpool', '9281ab301282dff77f72a797830d999d402413f71eed469334f9db375b6f283c3fe3de6190b07c859aa6f2dd431e96fb318b128755955bc3fb238c0ea7e8c2fb', '82e588e0-7f09-4153-b289-02f0ad34e47c', '2022-08-08 11:00:49'),
(2, 4, 'sha512whirlpool', '54323505b67b8aa089f6b64b55d2ac5a86aaf09c4b7b15072208ecb59b3ed1b5e7bfb2b4fac22b31751b87d24fcb8b79b0aa3cbbf4e807882ac43ea8a4b7d0c7', 'dbdd8850-d2ab-415a-9e26-c8316db78f7f', '2022-08-08 13:16:50'),
(3, 4, 'sha512whirlpool', '51840c26cbdc605d90f84962cfd44ab3b004585157b04e8e390edf6f107b7f589456e217bbd3f0abfd1a144154d3fb6ffd26c45c313d936fdcf4797ad5c62660', '7077cb55-0c13-4c13-b21d-d9328972c0a6', '2022-08-08 15:59:33');

-- --------------------------------------------------------

--
-- Table structure for table `wiki_page`
--

CREATE TABLE IF NOT EXISTS `wiki_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_home` tinyint(4) NOT NULL DEFAULT 0,
  `admin_only` tinyint(4) NOT NULL DEFAULT 0,
  `is_category` tinyint(1) DEFAULT 0,
  `parent_page_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `is_container_menu` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `container_menu_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_page_parent` (`parent_page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wiki_page`
--

INSERT INTO `wiki_page` (`id`, `title`, `is_home`, `admin_only`, `is_category`, `parent_page_id`, `sort_order`, `is_container_menu`, `container_menu_order`) VALUES
(1, 'Wiki Module', 0, 0, 0, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wiki_page_revision`
--

CREATE TABLE IF NOT EXISTS `wiki_page_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision` int(11) NOT NULL,
  `is_latest` tinyint(1) NOT NULL DEFAULT 0,
  `wiki_page_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wiki_page_revision`
--

INSERT INTO `wiki_page_revision` (`id`, `revision`, `is_latest`, `wiki_page_id`, `user_id`, `content`) VALUES
(1, 1659967487, 1, 1, 1, 'This is a Wiki-yay!');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cfiles_file`
--
ALTER TABLE `cfiles_file`
  ADD CONSTRAINT `fk_cfiles_file_parent_folder` FOREIGN KEY (`parent_folder_id`) REFERENCES `cfiles_folder` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `cfiles_folder`
--
ALTER TABLE `cfiles_folder`
  ADD CONSTRAINT `fk_cfiles_folder_parent_folder` FOREIGN KEY (`parent_folder_id`) REFERENCES `cfiles_folder` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment-created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `fk-contentcontainer` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk-create-user` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk-update-user` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `contentcontainer_blocked_users`
--
ALTER TABLE `contentcontainer_blocked_users`
  ADD CONSTRAINT `fk-contentcontainer-blocked-users-rel-contentcontainer-id` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-contentcontainer-blocked-users-rel-user-id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contentcontainer_module`
--
ALTER TABLE `contentcontainer_module`
  ADD CONSTRAINT `fk_contentcontainer` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contentcontainer_setting`
--
ALTER TABLE `contentcontainer_setting`
  ADD CONSTRAINT `fk-contentcontainerx` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contentcontainer_tag_relation`
--
ALTER TABLE `contentcontainer_tag_relation`
  ADD CONSTRAINT `fk-contentcontainer-tag-rel-contentcontainer-id` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-contentcontainer-tag-rel-tag-id` FOREIGN KEY (`tag_id`) REFERENCES `contentcontainer_tag` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `content_tag`
--
ALTER TABLE `content_tag`
  ADD CONSTRAINT `fk-content-tag-container-id` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-content-tag-parent-id` FOREIGN KEY (`parent_id`) REFERENCES `content_tag` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `content_tag_relation`
--
ALTER TABLE `content_tag_relation`
  ADD CONSTRAINT `fk-content-tag-rel-content-id` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-content-tag-rel-tag-id` FOREIGN KEY (`tag_id`) REFERENCES `content_tag` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `custom_pages_template_container`
--
ALTER TABLE `custom_pages_template_container`
  ADD CONSTRAINT `fk-tmpl-template` FOREIGN KEY (`template_id`) REFERENCES `custom_pages_template` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `custom_pages_template_container_content`
--
ALTER TABLE `custom_pages_template_container_content`
  ADD CONSTRAINT `fk-tmpl-container-definition` FOREIGN KEY (`definition_id`) REFERENCES `custom_pages_template_container_content_definition` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `custom_pages_template_container_content_item`
--
ALTER TABLE `custom_pages_template_container_content_item`
  ADD CONSTRAINT `fk-tmpl-container-item-content` FOREIGN KEY (`container_content_id`) REFERENCES `custom_pages_template_container_content` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-tmpl-container-item-tmpl` FOREIGN KEY (`template_id`) REFERENCES `custom_pages_template` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `custom_pages_template_container_content_template`
--
ALTER TABLE `custom_pages_template_container_content_template`
  ADD CONSTRAINT `fk-tmpl-container-tmpl` FOREIGN KEY (`template_id`) REFERENCES `custom_pages_template` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-tmpl-container-tmpl-definition` FOREIGN KEY (`definition_id`) REFERENCES `custom_pages_template_container_content_definition` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `custom_pages_template_element`
--
ALTER TABLE `custom_pages_template_element`
  ADD CONSTRAINT `fk-tmpl-element-tmpl` FOREIGN KEY (`template_id`) REFERENCES `custom_pages_template` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `custom_pages_template_image_content`
--
ALTER TABLE `custom_pages_template_image_content`
  ADD CONSTRAINT `fk-tmpl-image-definition` FOREIGN KEY (`definition_id`) REFERENCES `custom_pages_template_image_content_definition` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `file`
--
ALTER TABLE `file`
  ADD CONSTRAINT `fk_file-created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `file_history`
--
ALTER TABLE `file_history`
  ADD CONSTRAINT `fk_file_history` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_file_history_user` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `group_permission`
--
ALTER TABLE `group_permission`
  ADD CONSTRAINT `fk_group_permission-group_id` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `group_space`
--
ALTER TABLE `group_space`
  ADD CONSTRAINT `fk-group_space-group` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-group_space-space` FOREIGN KEY (`space_id`) REFERENCES `space` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_user`
--
ALTER TABLE `group_user`
  ADD CONSTRAINT `fk-group-group` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-user-group` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `like`
--
ALTER TABLE `like`
  ADD CONSTRAINT `fk_like-created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_like-target_user_id` FOREIGN KEY (`target_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `live`
--
ALTER TABLE `live`
  ADD CONSTRAINT `contentcontainer` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message_tag`
--
ALTER TABLE `message_tag`
  ADD CONSTRAINT `fk-message-tag-user-id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `fk_notification-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `fk_profile-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profile_field`
--
ALTER TABLE `profile_field`
  ADD CONSTRAINT `fk_profile_field-profile_field_category_id` FOREIGN KEY (`profile_field_category_id`) REFERENCES `profile_field_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `space_membership`
--
ALTER TABLE `space_membership`
  ADD CONSTRAINT `fk_space_membership-space_id` FOREIGN KEY (`space_id`) REFERENCES `space` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_space_membership-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `fk-task-list-task-id` FOREIGN KEY (`task_list_id`) REFERENCES `content_tag` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `task_item`
--
ALTER TABLE `task_item`
  ADD CONSTRAINT `fk-task-item-task-id` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_list_setting`
--
ALTER TABLE `task_list_setting`
  ADD CONSTRAINT `fk-task-list-setting-task-id` FOREIGN KEY (`tag_id`) REFERENCES `content_tag` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_reminder`
--
ALTER TABLE `task_reminder`
  ADD CONSTRAINT `fk-task-reminder-task-id` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_auth`
--
ALTER TABLE `user_auth`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_follow`
--
ALTER TABLE `user_follow`
  ADD CONSTRAINT `fk_user_follow-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_friendship`
--
ALTER TABLE `user_friendship`
  ADD CONSTRAINT `fk-friend` FOREIGN KEY (`friend_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_http_session`
--
ALTER TABLE `user_http_session`
  ADD CONSTRAINT `fk_user_http_session-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_mentioning`
--
ALTER TABLE `user_mentioning`
  ADD CONSTRAINT `fk_user_mentioning-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_message_tag`
--
ALTER TABLE `user_message_tag`
  ADD CONSTRAINT `fk-conversation-tag-tag-id` FOREIGN KEY (`tag_id`) REFERENCES `message_tag` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-user-message-id` FOREIGN KEY (`message_id`,`user_id`) REFERENCES `user_message` (`message_id`, `user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_password`
--
ALTER TABLE `user_password`
  ADD CONSTRAINT `fk_user_password-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wiki_page`
--
ALTER TABLE `wiki_page`
  ADD CONSTRAINT `wiki_page_parent` FOREIGN KEY (`parent_page_id`) REFERENCES `wiki_page` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
