-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 13, 2022 at 03:15 AM
-- Server version: 5.7.38
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `retrocub_stream_mii2`
--

-- --------------------------------------------------------

--
-- Table structure for table `application_setting`
--

CREATE TABLE `application_setting` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_file` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `application_setting`
--

INSERT INTO `application_setting` (`id`, `identifier`, `meta_key`, `value`, `is_file`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'application_setting', 'favicon', 'images/favicon.png', 1, '2022-01-11 05:44:02', NULL, NULL),
(2, 'application_setting', 'logo', 'images/favicon.png', 1, '2022-01-11 05:44:02', NULL, NULL),
(3, 'application_setting', 'application_name', 'Stream Mii', 0, '2022-01-11 05:44:02', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `artist_types`
--

CREATE TABLE `artist_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `artist_types`
--

INSERT INTO `artist_types` (`id`, `slug`, `title`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'musician-band', 'Musician/Band', 'imgMusician.png', '2022-01-11 10:44:03', NULL, NULL),
(2, 'music-producer', 'Music Producer', 'imgMusicProducer.png', '2022-01-11 10:44:03', NULL, NULL),
(3, 'song-writer', 'Song Writer', 'imgSongWirter.png', '2022-01-11 10:44:03', NULL, NULL),
(4, 'video-editor', 'Video Editor', 'imgVideoEditor.png', '2022-01-11 10:44:03', NULL, NULL),
(5, 'video-director', 'Video Director', 'imgVideoDirector.png', '2022-01-11 10:44:03', NULL, NULL),
(6, 'booking-hiring-agent', 'Booking/Hiring Agent', 'imgBookingHiringAgent.png', '2022-01-11 10:44:03', NULL, NULL),
(7, 'music-artist', 'Music Artist', '', '2022-01-11 10:44:03', NULL, NULL),
(8, 'music-composer', 'Music Composer', '', '2022-01-11 10:44:03', NULL, NULL),
(9, 'music-label', 'Music Label', '', '2022-01-11 10:44:03', NULL, NULL),
(10, 'dj', 'DJ', '', '2022-01-11 10:44:03', NULL, NULL),
(11, 'tour-manager', 'Tour Manager', '', '2022-01-11 10:44:03', NULL, NULL),
(12, 'artist-manager', 'Artist Manager', '', '2022-01-11 10:44:03', NULL, NULL),
(13, 'composer', 'Composer', '', '2022-01-11 10:44:03', NULL, NULL),
(14, 'singer', 'Singer', '', '2022-01-11 10:44:03', NULL, NULL),
(15, 'lyricist', 'Lyricist', '', '2022-01-11 10:44:03', NULL, NULL),
(16, 'background-singer', 'Background Singer', '', '2022-01-11 10:44:03', NULL, NULL),
(17, 'dancer', 'Dancer', '', '2022-01-11 10:44:03', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `block_users`
--

CREATE TABLE `block_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `actor_id` bigint(20) UNSIGNED NOT NULL,
  `target_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `chat_room_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_url` text COLLATE utf8mb4_unicode_ci,
  `file_data` text COLLATE utf8mb4_unicode_ci,
  `message_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `ip_address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_anonymous` tinyint(2) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `user_id`, `chat_room_id`, `message`, `file_url`, `file_data`, `message_type`, `ip_address`, `is_anonymous`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 26, 1, 'Sasa', NULL, NULL, 'text', NULL, 0, '2022-01-18 11:55:32', NULL, NULL),
(2, 26, 1, '', '/uploads/file-1642488943858', NULL, 'image', NULL, 0, '2022-01-18 11:55:51', NULL, NULL),
(3, 24, 1, 'Hello', NULL, NULL, 'text', NULL, 0, '2022-01-18 11:57:22', NULL, NULL),
(4, 24, 1, 'Hi again ', NULL, NULL, 'text', NULL, 0, '2022-01-24 14:05:40', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat_message_delete`
--

CREATE TABLE `chat_message_delete` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `chat_room_id` int(11) DEFAULT '0',
  `chat_message_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chat_message_status`
--

CREATE TABLE `chat_message_status` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `chat_room_id` int(11) DEFAULT '0',
  `chat_message_id` int(11) NOT NULL,
  `is_read` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chat_message_status`
--

INSERT INTO `chat_message_status` (`id`, `user_id`, `chat_room_id`, `chat_message_id`, `is_read`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 24, 1, 1, 1, '2022-01-18 06:55:32', NULL, NULL),
(2, 26, 1, 1, 1, '2022-01-18 06:55:32', NULL, NULL),
(3, 24, 1, 2, 1, '2022-01-18 06:55:51', NULL, NULL),
(4, 26, 1, 2, 1, '2022-01-18 06:55:51', NULL, NULL),
(5, 24, 1, 3, 1, '2022-01-18 06:57:22', NULL, NULL),
(6, 26, 1, 3, 1, '2022-01-18 06:57:22', NULL, NULL),
(7, 24, 1, 4, 1, '2022-01-24 09:05:40', NULL, NULL),
(8, 26, 1, 4, 0, '2022-01-24 09:05:40', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat_rooms`
--

CREATE TABLE `chat_rooms` (
  `id` int(11) NOT NULL,
  `identifier` varchar(200) NOT NULL,
  `created_by` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `image_url` text,
  `description` text,
  `status` int(11) NOT NULL DEFAULT '1',
  `type` enum('single','group') NOT NULL,
  `member_limit` int(11) NOT NULL DEFAULT '0',
  `is_anonymous` tinyint(2) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chat_rooms`
--

INSERT INTO `chat_rooms` (`id`, `identifier`, `created_by`, `title`, `slug`, `image_url`, `description`, `status`, `type`, `member_limit`, `is_anonymous`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'single-1642488933-1642488933', 26, 'single-1642488933', 'single-1642488933', 'https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg', NULL, 1, 'single', 0, 0, '2022-01-18 06:55:31', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat_room_users`
--

CREATE TABLE `chat_room_users` (
  `id` int(11) NOT NULL,
  `chat_room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_owner` int(11) NOT NULL DEFAULT '0',
  `last_chat_message_id` int(11) DEFAULT '0',
  `last_message_timestamp` datetime DEFAULT NULL,
  `unread_message_counts` int(11) DEFAULT '0',
  `is_anonymous` tinyint(2) DEFAULT '0',
  `is_leave` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chat_room_users`
--

INSERT INTO `chat_room_users` (`id`, `chat_room_id`, `user_id`, `is_owner`, `last_chat_message_id`, `last_message_timestamp`, `unread_message_counts`, `is_anonymous`, `is_leave`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 24, 0, 4, '2022-01-24 09:05:43', 0, 0, 0, '2022-01-18 06:55:32', NULL, NULL),
(2, 1, 26, 1, 4, '2022-01-24 09:05:43', 1, 0, 0, '2022-01-18 06:55:32', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_modules`
--

CREATE TABLE `cms_modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fa fa-list',
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `sort_order` decimal(5,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_modules`
--

INSERT INTO `cms_modules` (`id`, `parent_id`, `name`, `route_name`, `icon`, `status`, `sort_order`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'Cms Roles Management', 'cms-roles-management.index', 'fa fa-key', '1', '1.00', '2022-01-11 05:44:02', NULL, NULL),
(2, 0, 'Cms Users Management', 'cms-users-management.index', 'fa fa-users', '1', '2.00', '2022-01-11 05:44:02', NULL, NULL),
(3, 0, 'Post Management', 'post-management.index', 'fa fa-cog', '1', '3.00', '2022-01-11 05:44:02', NULL, NULL),
(4, 0, 'Reports Management', 'report-management.index', 'fa fa-cog', '1', '4.00', '2022-01-11 05:44:02', NULL, NULL),
(5, 0, 'Users Management', 'app-users.index', 'fa fa-users', '1', '5.00', '2022-01-11 05:44:02', NULL, NULL),
(6, 0, 'Artists Management', 'artist-management.index', 'fa fa-users', '1', '6.00', '2022-01-11 05:44:02', NULL, NULL),
(7, 0, 'Fans Management', 'fan-management.index', 'fa fa-users', '1', '7.00', '2022-01-11 05:44:02', NULL, NULL),
(8, 0, 'Application Setting', 'admin.application-setting', 'fa fa-cog', '1', '8.00', '2022-01-11 05:44:02', NULL, NULL),
(9, 0, 'Content Management', 'content-management.index', 'fa fa-tasks', '1', '9.00', '2022-01-11 05:44:02', NULL, NULL),
(10, 0, 'FAQ`s', 'faq.index', 'fa fa-question-circle-o', '1', '10.00', '2022-01-11 05:44:02', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_module_permissions`
--

CREATE TABLE `cms_module_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cms_role_id` bigint(20) UNSIGNED NOT NULL,
  `cms_module_id` bigint(20) UNSIGNED NOT NULL,
  `is_add` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_view` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_update` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_delete` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_module_permissions`
--

INSERT INTO `cms_module_permissions` (`id`, `cms_role_id`, `cms_module_id`, `is_add`, `is_view`, `is_update`, `is_delete`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, '0', '0', '0', '0', '2022-01-14 06:50:31', NULL, NULL),
(2, 2, 2, '0', '0', '0', '0', '2022-01-14 06:50:31', NULL, NULL),
(3, 2, 3, '1', '1', '1', '1', '2022-01-14 06:50:31', NULL, NULL),
(4, 2, 4, '1', '1', '1', '1', '2022-01-14 06:50:31', NULL, NULL),
(5, 2, 5, '1', '1', '1', '1', '2022-01-14 06:50:31', NULL, NULL),
(6, 2, 6, '1', '1', '1', '1', '2022-01-14 06:50:31', NULL, NULL),
(7, 2, 7, '1', '1', '1', '1', '2022-01-14 06:50:31', NULL, NULL),
(8, 2, 8, '0', '0', '0', '0', '2022-01-14 06:50:31', NULL, NULL),
(9, 2, 9, '1', '1', '1', '1', '2022-01-14 06:50:31', NULL, NULL),
(10, 2, 10, '1', '1', '1', '1', '2022-01-14 06:50:31', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_roles`
--

CREATE TABLE `cms_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_super_admin` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_roles`
--

INSERT INTO `cms_roles` (`id`, `name`, `slug`, `is_super_admin`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Super Admin', 'super-admin', '1', '2022-01-11 05:44:01', NULL, NULL),
(2, 'Admin', 'admin', '0', '2022-01-14 06:50:31', '2022-01-14 06:50:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_users`
--

CREATE TABLE `cms_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cms_role_id` bigint(20) UNSIGNED NOT NULL,
  `user_ref_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_users`
--

INSERT INTO `cms_users` (`id`, `cms_role_id`, `user_ref_id`, `name`, `username`, `slug`, `email`, `mobile_no`, `password`, `image_url`, `status`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 0, 'RetroCube', 'retrocube', 'retrocube', 'admin@retrocube.com', '1-8882051816', '$2y$10$n6ofUziKIN9lHsWaiFVO6uxjCtFgn5V/gbNIglcGQdzeXlaMF25cC', NULL, '1', NULL, '2022-01-11 05:44:02', NULL, NULL),
(2, 2, 0, 'Streammii', 'sub-admin', 'sub-admin', 'Streammiiapp@gmail.com', '903-908-4658', '$2y$10$Z3Biy6FFBORYHUfoq.gsIuXfIH8QRaqm36Ot8XqzeYVm6qSGfWfEy', '/storage//storage/cms_users/jR2ZD1bntGgU51rKquWGaRa0RhhTOAmp5yzXew9i.png', '1', NULL, '2022-01-14 06:52:15', '2022-03-26 03:44:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_widgets`
--

CREATE TABLE `cms_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `div_column_class` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `widget_type` enum('small_box','line_chart','bar_chat','pie_chart','map_chart') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sql` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_widgets`
--

INSERT INTO `cms_widgets` (`id`, `title`, `description`, `icon`, `color`, `div_column_class`, `link`, `widget_type`, `sql`, `config`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Total Artists', NULL, 'fa fa-users', '#4b71fa', 'col-md-3', '/admin/app-users', 'small_box', 'Select count(*) from users WHERE  `users`.`user_type`= \"artist\"', '', '1', NULL, NULL, NULL),
(2, 'Total Fans', NULL, 'icon-people', '#7bcb4d', 'col-md-3', '/admin/app-users', 'small_box', 'Select count(*) from users WHERE  `users`.`user_type`= \"fan\"', '', '1', NULL, NULL, NULL),
(3, 'User Reports', NULL, 'fa fa-list', '#4b71fa', 'col-md-3', '/admin/app-users', 'small_box', 'SELECT count(*) FROM `user_reports` WHERE module=\"users\"', '', '1', NULL, NULL, NULL),
(4, 'Post Reports', NULL, 'fa fa-list', '#7bcb4d ', 'col-md-3', '/admin/app-users', 'small_box', 'SELECT count(*) FROM `user_reports` WHERE module=\"posts\"', '', '1', NULL, NULL, NULL),
(5, 'Artists', NULL, 'icon-user', '#fff', 'col-md-12', '/admin/app-users', 'line_chart', 'SELECT count(id) AS value, MONTHNAME(created_at) as label FROM users where YEAR(created_at) = YEAR(now()) AND users.user_type = \"artist\" group by MONTH(created_at) order by MONTH(created_at) asc;', '', '1', NULL, NULL, NULL),
(6, 'Fans', NULL, 'icon-user', '#fff', 'col-md-12', '/admin/app-users', 'line_chart', 'SELECT count(id) AS value, MONTHNAME(created_at) as label FROM users where YEAR(created_at) = YEAR(now()) AND users.user_type = \"fan\" group by MONTH(created_at) order by MONTH(created_at) asc;', '', '1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_widget_role`
--

CREATE TABLE `cms_widget_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cms_widget_id` bigint(20) UNSIGNED NOT NULL,
  `cms_role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_widget_role`
--

INSERT INTO `cms_widget_role` (`id`, `cms_widget_id`, `cms_role_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 5, 2, NULL, NULL, NULL),
(2, 6, 2, NULL, NULL, NULL),
(3, 4, 2, NULL, NULL, NULL),
(4, 1, 2, NULL, NULL, NULL),
(5, 2, 2, NULL, NULL, NULL),
(6, 3, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `content_management`
--

CREATE TABLE `content_management` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_management`
--

INSERT INTO `content_management` (`id`, `title`, `slug`, `content`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Terms Condition', 'terms-condition', '<div><h4 style=\"text-align: center; \"><b><u><font face=\"Arial Black\">Terms and Conditions&nbsp;&nbsp;</font></u></b></h4><h6 style=\"text-align: center;\"><b><font face=\"Arial Black\" style=\"\">Last updated:&nbsp;</font></b><b><font face=\"Arial Black\" style=\"\">March 23, 2022</font></b></h6><div><br></div><div><br></div><div><br></div><div><b>Please read these terms and conditions carefully before using Our Service.</b></div><div><b><br></b></div><div><b><u>Interpretation and Definitions&nbsp;</u></b></div><div><br></div><div><b>Interpretation&nbsp;&nbsp;</b></div><div>The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.</div><div><br></div><h6><b>Definitions&nbsp;&nbsp;</b></h6><div>For the purposes of these Terms and Conditions:<br></div><div><br></div><div>&nbsp; * Application means the software program provided by the Company downloaded by You on any electronic device, named Streammii</div><div>&nbsp; * Application Store means the digital distribution service operated and developed by Apple Inc. (Apple App Store) or Google Inc. (Google PlayStore)&nbsp; &nbsp; &nbsp; &nbsp; which the Application has been downloaded.Affiliate means an entity that controls, is controlled by or is under common control with a party, where \"control\" means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.</div><div>&nbsp; * Country refers to: Texas, United States</div><div>&nbsp; * Company (referred to as either \"the Company\", \"We\", \"Us\" or \"Our\" in this Agreement) refers to Streammii.</div><div>&nbsp; * Device means any device that can access the Service such as a computer, a</div><div>&nbsp; &nbsp; cellphone or a digital tablet.</div><div>&nbsp; * Service refers to the Application.</div><div>&nbsp; * Third-party Social Media Service means any services or content (including data, information, products or services) provided by a third-party that may be displayed, included or made available by the Service.</div><div>&nbsp; * You means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.</div><div><br></div><div><br></div><div><b><u>Acknowledgment&nbsp;&nbsp;</u></b></div><div>These are the Terms and Conditions governing the use of this Service and the agreement that operates between You and the Company. These Terms and Conditions set out the rights and obligations of all users regarding the use of the Service. Your access to and use of the Service is conditioned on Your acceptance of and compliance with these Terms and Conditions. These Terms and Conditions apply to all visitors, users and others who access or use the Service. By accessing or using the Service You agree to be bound by these Terms and Conditions. If You disagree with any part of these Terms and Conditions then You may not access the Service. You represent that you are over the age of 18. The Company does not permit those under 18 to use the Service. Your access to and use of the Service is also conditioned on Your acceptance of and compliance with the Privacy Policy of the Company. Our Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your personal information when You use the Application or the Website and tells You about Your privacy rights and how the law protects You. Please read Our Privacy Policy carefully before using Our Service.</div><div><br></div><div><b>Links to Other Websites&nbsp;&nbsp;</b></div><div>Our Service may contain links to third-party web sites or services that are<br></div><div>not owned or controlled by the Company.</div><div><br></div><div>The Company has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or</div><div>services. You further acknowledge and agree that the Company shall not be responsible or liable, directly or indirectly, for any damage or loss caused</div><div>or alleged to be caused by or in connection with the use of or reliance on any such content, goods or services available on or through any such web sites or services.</div><div><br></div><div>We strongly advise You to read the terms and conditions and privacy policies of any third-party web sites or services that You visit.</div><div><br></div><div><b>Termination&nbsp;&nbsp;</b></div><div>We may terminate or suspend Your access immediately, without prior notice or liability, for any reason whatsoever, including without limitation if You</div><div>breach these Terms and Conditions. Upon termination, Your right to use the Service will cease immediately.</div><div><br></div><div><b><br></b></div><div><b>Limitation of Liability&nbsp;&nbsp;</b></div><div>Notwithstanding any damages that You might incur, the entire liability of the Company and any of its suppliers under any provision of this Terms and Your exclusive remedy for all of the foregoing shall be limited to the amount actually paid by You through the Service or 100 USD if You haven\'t purchased anything through the Service.</div><div><br></div><div>To the maximum extent permitted by applicable law, in no event shall the Company or its suppliers be liable for any special, incidental, indirect, or</div><div>consequential damages whatsoever (including, but not limited to, damages for loss of profits, loss of data or other information, for business interruption, for personal injury, loss of privacy arising out of or in any way related to the use of or inability to use the Service, third-party software and/or third- party hardware used with the Service, or otherwise in connection with any provision of this Terms), even if the Company or any supplier has been advised of the possibility of such damages and even if the remedy fails of its essential purpose.</div><div><br></div><div>Some states do not allow the exclusion of implied warranties or limitation of liability for incidental or consequential damages, which means that some of the above limitations may not apply. In these states, each party\'s liability will be limited to the greatest extent permitted by law.</div><div><br></div><div><br></div><div>\"AS IS\" and \"AS AVAILABLE\" Disclaimer&nbsp;&nbsp;</div><div>The Service is provided to You \"AS IS\" and \"AS AVAILABLE\" and with all faults and defects without warranty of any kind. To the maximum extent permitted under applicable law, the Company, on its own behalf and on behalf of its Affiliates and its and their respective licensors and service providers, expressly disclaims all warranties, whether express, implied, statutory or otherwise, with respect to the Service, including all implied warranties of merchantability, fitness for a particular purpose, title and non-infringement, and warranties that may arise out of course of dealing, course of performance, usage or trade practice. Without limitation to the foregoing, the Company provides no warranty or undertaking, and makes no representation of any kind that the Service will meet Your requirements, achieve any intended results, be compatible or work with any other software, applications, systems or services, operate without interruption, meet any performance or reliability standards or be error free or that any errors or defects can or will be corrected.</div><div><br></div><div>Without limiting the foregoing, neither the Company nor any of the company\'s provider makes any representation or warranty of any kind, express or implied: (i) as to the operation or availability of the Service, or the information, content, and materials or products included thereon; (ii) that the Service will be uninterrupted or error-free; (iii) as to the accuracy, reliability, or currency of any information or content provided through the Service; or (iv) that the Service, its servers, the content, or e-mails sent from or on behalf of the Company are free of viruses, scripts, trojan horses, worms, malware,&nbsp; timebombs or other harmful components.</div><div><br></div><div>Some jurisdictions do not allow the exclusion of certain types of warranties or limitations on applicable statutory rights of a consumer, so some or all of the above exclusions and limitations may not apply to You. But in such a case the exclusions and limitations set forth in this section shall be applied to the greatest extent enforceable under applicable law.</div><div><br></div><div><b>Governing Law&nbsp;&nbsp;</b></div><div>The laws of the Country, excluding its conflicts of law rules, shall govern this Terms and Your use of the Service. Your use of the Application may also</div><div>be subject to other local, state, national, or international laws.</div><div><br></div><div><b>Disputes Resolution&nbsp;&nbsp;</b></div><div>If You have any concern or dispute about the Service, You agree to first try to resolve the dispute informally by contacting the Company.</div><div><br></div><div><b>For European Union (EU) Users&nbsp;&nbsp;</b></div><div>If You are a European Union consumer, you will benefit from any mandatory provisions of the law of the country in which you are resident in.</div><div><br></div><div><b>United States Legal Compliance&nbsp;&nbsp;</b></div><div>You represent and warrant that (i) You are not located in a country that is subject to the United States government embargo, or that has been designated by the United States government as a \"terrorist supporting\" country, and (ii) You are not listed on any United States government list of prohibited or restricted parties.</div><div><br></div><div><b><u><font face=\"Arial Black\">Severability and Waiver&nbsp;&nbsp;</font></u></b></div><div><b><br></b></div><div><b>Severability</b>&nbsp;&nbsp;<br></div><div>If any provision of these Terms is held to be unenforceable or invalid, such provision will be changed and interpreted to accomplish the objectives of such provision to the greatest extent possible under applicable law and the remaining provisions will continue in full force and effect.</div><div><br></div><div><b><u>Waiver</u>&nbsp;&nbsp;</b></div><div>-Except as provided herein, the failure to exercise a right or to require performance of an obligation under these Terms shall not effect a party\'s ability to exercise such right or require such performance at any time thereafter nor shall the waiver of a breach constitute a waiver of any subsequent breach.</div><div><u><br></u></div><div><u><b>Translation Interpretation</b>&nbsp;&nbsp;</u></div><div>These Terms and Conditions may have been translated if We have made them available to You on our Service. You agree that the original English text</div><div>shall prevail in the case of a dispute.</div><div><br></div><div><b><u>Changes to These Terms and Conditions&nbsp;&nbsp;</u></b></div><div>We reserve the right, at Our sole discretion, to modify or replace these Terms at any time. If a revision is material We will make reasonable efforts to</div><div>provide at least 30 days\' notice prior to any new terms taking effect. What constitutes a material change will be determined at Our sole discretion.</div><div><br></div><div>By continuing to access or use Our Service after those revisions become effective, You agree to be bound by the revised terms. If You do not agree to</div><div>the new terms, in whole or in part, please stop using the website and the Service.</div><div><br></div><div><b><u>Contact Us&nbsp;&nbsp;</u></b></div><div>If you have any questions about these Terms and Conditions, You can contact us:</div><div><br></div><div>&nbsp; * By email: streammiiapp@gmail.com</div></div>', 1, '2020-02-11 15:01:25', '2022-03-25 23:43:13', NULL),
(2, 'Privacy Policy', 'privacy-policy', '<h4 style=\"text-align: center;\"></h4><h6 style=\"text-align: center;\"><h4><b><u>Privacy Policy&nbsp;&nbsp;</u></b></h4>Last updated: March 23, 2022</h6><p>This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You. We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the</p><p><b><u>Interpretation and Definitions&nbsp;&nbsp;</u></b><br></p><p><b>Interpretation&nbsp;&nbsp;</b></p><p>The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.</p><h5><b>Definitions&nbsp;&nbsp;</b></h5><p>For the purposes of this Privacy Policy:</p><p>&nbsp; * Account means a unique account created for You to access our Service or parts of our Service.</p><p>&nbsp; * Affiliate means an entity that controls, is controlled by or is under common control with a party, where \"control\" means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.</p><p>&nbsp; * Application means the software program provided by the Company downloaded by You on any electronic device, named Streammii</p><p>&nbsp; * Company (referred to as either \"the Company\", \"We\", \"Us\" or \"Our\" in this Agreement) refers to Streammii.</p><p>&nbsp; * Country refers to: Texas, United States</p><p>&nbsp; * Device means any device that can access the Service such as a computer, a cellphone or a digital tablet.</p><p>&nbsp; * Personal Data is any information that relates to an identified or&nbsp; identifiable individual.</p><p>&nbsp; * Service refers to the Application.</p><p>&nbsp; * Service Provider means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.</p><p>&nbsp; * Third-party Social Media Service refers to any website or any social network website through which a User can log in or create an account to use the Service.</p><p>&nbsp; * Usage Data refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).</p><p>&nbsp; * You means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.</p><h5><u><b>Collecting and Using Your Personal Data</b>&nbsp;&nbsp;<b>Types of Data Collected&nbsp;</b><b>Personal Data&nbsp;&nbsp;</b></u></h5><p>While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:</p><p><b>Usage Data&nbsp;&nbsp;</b><br></p><p>Usage Data is collected automatically when using the Service. Usage Data may include information such as Your Device\'s Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data. When You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data. We may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device.</p><h5><b><u>Information from Third-Party Social Media Services&nbsp;&nbsp;</u></b></h5><p>The Company allows You to create an account and log in to use the Service through the following Third-party Social Media Services:</p><p>&nbsp; * Google</p><p>&nbsp; * Facebook</p><p>&nbsp; * Twitter</p><p>If You decide to register through or otherwise grant us access to a Third- Party Social Media Service, We may collect Personal data that is already associated with Your Third-Party Social Media Service\'s account, such as Your name, Your email address, Your activities or Your contact list associated with that account. You may also have the option of sharing additional information with the Company through Your Third-Party Social Media Service\'s account. If You choose to provide such information and Personal Data, during registration or otherwise, You are giving the Company permission to use, share, and store it in a manner consistent with this Privacy Policy.</p><p><br></p><p><b>Information Collected while Using the Application&nbsp;&nbsp;</b></p><p>While using Our Application, in order to provide features of Our Application, We may collect, with Your prior permission:</p><p>&nbsp; * Pictures and other information from your Device\'s camera and photo library We use this information to provide features of Our Service, to improve and customize Our Service. The information may be uploaded to the Company\'s servers and/or a Service Provider\'s server or it may be simply stored on Your device. You can enable or disable access to this information at any time, through Your Device settings.</p><p><b>Use of Your Personal Data&nbsp;&nbsp;</b></p><p>The Company may use Personal Data for the following purposes:</p><p>&nbsp; * To provide and maintain our Service , including to monitor the usage of&nbsp; our Service.</p><p>&nbsp; * To manage Your Account: to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user.</p><p>&nbsp; * For the performance of a contract: the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service.</p><p>&nbsp; * To contact You: To contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile&nbsp; application\'s push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for&nbsp; their implementation.</p><p>&nbsp; * To provide You with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or inquired about unless You have opted not to receive such information.</p><p>&nbsp; * To manage Your requests: To attend and manage Your requests to Us.</p><p>&nbsp; * For business transfers: We may use Your information to evaluate or conduct&nbsp; a merger, divestiture, restructuring, reorganization, dissolution, or other sale or transfer of some or all of Our assets, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which Personal Data held by Us about our Service users is among the assets transferred.</p><p>&nbsp; * For other purposes : We may use Your information for other purposes, such as data analysis, identifying usage trends, determining the effectiveness of our promotional campaigns and to evaluate and improve our Service, products, services, marketing and your experience. We may share Your personal information in the following situations:</p><p>&nbsp; * With Service Providers: We may share Your personal information with Service Providers to monitor and analyze the use of our Service, to contact You.</p><p>&nbsp; * For business transfers: We may share or transfer Your personal information in connection with, or during negotiations of, any merger, sale of Company assets, financing, or acquisition of all or a portion of Our business to another company.</p><p>&nbsp; * With Affiliates: We may share Your information with Our affiliates, in which case we will require those affiliates to honor this Privacy Policy. Affiliates include Our parent company and any other subsidiaries, joint venture partners or other companies that We control or that are under common control with Us.</p><p>&nbsp; * With business partners: We may share Your information with Our business partners to offer You certain products, services or promotions.</p><p>&nbsp; * With other users: when You share personal information or otherwise interact in the public areas with other users, such information may be viewed by all users and may be publicly distributed outside. If You interact with other users or register through a Third-Party Social Media Service, Your contacts on the Third-Party Social Media Service may see Your name, profile, pictures and description of Your activity. Similarly, other users will be able to view descriptions of Your activity, communicate with You and view Your profile.</p><p>&nbsp; * With Your consent : We may disclose Your personal information for any other purpose with Your consent.</p><h5><b><u>Retention of Your Personal Data&nbsp;&nbsp;</u></b></h5><p>The Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.</p><p>The Company will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of Our Service, or We are legally obligated to retain this data for longer time periods.</p><h5><b><u>Transfer of Your Personal Data</u>&nbsp;&nbsp;</b>\r\n<br class=\"Apple-interchange-newline\"></h5><p>Your information, including Personal Data, is processed at the Company\'s operating offices and in any other places where the parties involved in the processing are located. It means that this information may be transferred to — and maintained on — computers located outside of Your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from Your jurisdiction. Your consent to this Privacy Policy followed by Your submission of such information represents Your agreement to that transfer.</p><p>The Company will take all steps reasonably necessary to ensure that Your data is treated securely and in accordance with this Privacy Policy and no transfer of Your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of Your data and other personal information.</p><h5><b><u>Disclosure of Your Personal Data&nbsp;&nbsp;</u></b></h5><p><b>Business Transactions&nbsp;</b>&nbsp;</p><p>If the Company is involved in a merger, acquisition or asset sale, Your Personal Data may be transferred. We will provide notice before Your Personal Data is transferred and becomes subject to a different Privacy Policy.</p><p><b>Law enforcement&nbsp;&nbsp;</b><br></p><p>Under certain circumstances, the Company may be required to disclose Your Personal Data if required to do so by law or in response to valid requests by public authorities (e.g. a court or a government agency).</p><p><b>Other legal requirements&nbsp;&nbsp;</b><br></p><p>The Company may disclose Your Personal Data in the good faith belief that such action is necessary to:</p><p>&nbsp; * Comply with a legal obligation</p><p>&nbsp; * Protect and defend the rights or property of the Company</p><p>&nbsp; * Prevent or investigate possible wrongdoing in connection with the Service</p><p>&nbsp; * Protect the personal safety of Users of the Service or the public</p><p>&nbsp; * Protect against legal liability</p><p><b><u>Security of Your Personal Data&nbsp;&nbsp;</u></b></p><p>The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.</p><p><b><u>Children\'s Privacy&nbsp;&nbsp;</u></b><br></p><p>Our Service does not address anyone under the age of 13. We do not knowingly collect personally identifiable information from anyone under the age of 13. If You are a parent or guardian and You are aware that Your child has provided Us with Personal Data, please contact Us. If We become aware that We have collected Personal Data from anyone under the age of 13 without verification of parental consent, We take steps to remove that information from Our servers.</p><p>If We need to rely on consent as a legal basis for processing Your information and Your country requires consent from a parent, We may require Your parent\'s consent before We collect and use that information.</p><p><b><u>Links to Other Websites</u>&nbsp;&nbsp;</b><br></p><p>Our Service may contain links to other websites that are not operated by Us. If You click on a third party link, You will be directed to that third party\'s site. We strongly advise You to review the Privacy Policy of every site You visit. We have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.</p><p><b><u>Changes to this Privacy Policy&nbsp;&nbsp;</u></b><br></p><p>We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page. We will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the \"Last updated\" date at the top of this Privacy Policy.</p><p>You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.</p><p><u><b>Contact Us</b>&nbsp;&nbsp;</u></p><p>If you have any questions about this Privacy Policy, You can contact us:<br></p><p>&nbsp; * By email: streammiiapp@gmail.com<br></p><p>\r\n                                        </p>', 1, '2020-02-11 15:01:25', '2022-03-25 23:43:53', NULL);
INSERT INTO `content_management` (`id`, `title`, `slug`, `content`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'About Us', 'about-us', '<p><img src=\"data:image/jpeg;base64,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+0fFj7R8WPtHxQ+1fFD7V8V6faPix9o+LH2j4ofavih9q+KH2r4ofavih9q+LH2j5j6cAAAAAAESSMgjIHh6AAAAABm04CyEqC2OfUeS8rLrMvhZGNRq9xazZ7WMu3jbC7z3w8p9ie6s0TVfREurqkc6ro5SfmuZis0UGHQtM0OnQU0785X5daRu0XHzu+qZl86vPIy0+lFGsVafdxx/dNpzYztIU9LOVaqNo8o9LLIVE9nH6pUq8Pehh1mPXyOge5bKzRCmZOqF5dnrpOxZXYAAAAf/2gAMAwEAAgADAAAAIfffffffffdfffffffffffffffffffffffffefffffffffffffffUlMvZgNvfffffffffffffffffffffffb+ddfefcfffffffeQUc56wUPfffffffffffffffffffffffcTVVTczFdffffffbXzjjjvf/fffffffffffffffffffffffbbfXfXLzffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffedfffffffffffffeefffffdffdfffffffffffffffffffffTfffffffffffffaYVUbcSdbeaeZXffffffffffffffffffffXffffffffffffbXffTTcfffffbffffffffffffffffffcccccccccccccccccccccccccccccccccccccccccccccccfOPOPJNNOONOFPNFEMPOPHJDDHOHNNPJGMIGNNNEMPPPPPPPLLPHHLDPGLDHLDPHLLLPLDPHLPHPPLLLLDPPDDHLPPPPPPPPPONPMNMOMNOMPOPMMNMNPNMPMMNPPMONONPPPPPPPPPPPPLFJEGCFKLGLHNNOLOOCCDBMIDBPLPLEMFINNPPPPPPPPPPPPONPMPMNPONOOPPMOPMMPOOPPONPPMNPMPPNOPOONONPPPPLGOOCDNNDKFMHCJMBDPGEMMCEJBCHMAGDNMKHNCPLHLPPPPPPPPPOPPPPPPPPPPONPPPPOPPNPOPPPPPPPPPPPPONPPPPPLFNJOBIIEPFFCEAMPOJKIJEPKANIMMDOBBKMPLIKKJFPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPOMIPIFAMLPFMOGMKGGLBKEBLOGPBMLPCMLGKFPJGELPPPPPPHDDPHHDPLLPLDHDDLHLPLDDLDLPLDPHHLDPPPPPLLPPPPPOMGKOMBPMOLHMKDOOCAFFFKCODCCIDJIDPDJMKKCPPPPPPPLHHLDHDPPHDLPLDDPHHLLPDPDPPLDPLHHPDHLLLHPPPPPPPPNPMLMPMBNNNPPNPMOFPONPDFPNOOKHPKAPNPPPPPPPPPPPOPPPHPHLLLCDPLHPLPLDHPHLLPHPGLHDDHPDPPPPPPPPPPPPONNKNONOPMNMNMMOPMPMOMJOONMNPNMNOPIPPPPPPPPPPPPFHEPBDBDDPPNFOJPODCKKBFHNFMEDGADAKNPPPPPPPPPPPOPPMOOOMONPPOMMONPONPNMPNPPOMONNNMPOOOPPNNPPPPPLCLFCCJCJPIPDFGHLKCDDCHGLFBNLFLFAFGINAFLKDPPPPPPPPOOMPPPNNPPPPPPPPPPPPOPPPMPNPPPPPPLPPPPHPPPPPKODKHDACLFKFFCFNCOECINKICLLJMMFEIFFLJGKBAEMPPPPPPMPONNPHPPPKPOMPPOPPPPPPPPPPPPPPPPPPPPPPPPPPPPPOCNOBNFPGFOELJJGJHELPPPPPPPPPPPPPPPPPPPPPPPPPPPLHHPHLLHPHDDPPHHLHDLHPPPPPPPPPPPPPPPPPPPPPPPPPPALFDJCKJKACPFPJNPNEEOBNKHGJNLCPKELENNNCPPPPPPPLLLLLPHLLHLDDCHHDHLLDLLPHPHHDPPJPPDGPPPPHPPPPPPPOGPONOPHMPMICNMNJMMIMNPHHOMJOPNINOPCOMMMNOPPPPPPHHLLDBHLKPHHHDHDPDHLPPHHLDLHPPPDFLPHLHHPHPPPPKOJMNFOPOPOOPOONPNLOMPPPPPPPPPPPPPPPPPPPPPPPPPPPBIAFBAOCELJFCDMHBMCNPPPPPPPPPPPPPPPPPPPPPPPPPPPOMNPPPPPPPPPPPPPPPPPPPPPPPPPPPPONMPPPPNOPNPPPPPGDNPNFNMOKOOBNFNNMKOOCFFNNMMCKPKBGFPDMNJDBPPPPPPPPPPOPONNPPPNNPPNPPPOPMPPPPNPPPNPPPPPPPPPPPPPOKNPKDEJIKMCEAGFGHLKOPLBAFGGPEHJEEGFPPPHHPPPPPPPPPPPPPPPPPLPPPNPPMPOFPPPPLHPPPOPPPPPNPNPPPPPPPONAGBLNALNBGGADBIEBJHMMGBHHALBGFOLBIIPEGHPPPPPPPPHHPPLPPPLPPHHPPPPPPPPPPPDPLPPPLPLLHPLDPPPPPPPOLFICFJKGLKBJDIPPNKEODGKOKOKDCIAEMNOLCNJJPPPPPPLDPDPPDDDDPDDLDDHDHPDHHHHDLDLHPLHHLDHLHPPPPPPPPPGODLPPMNPMNIMGOMKJPOJOOPMPILGOMNMPGMHGOMNPNPPPPPDDHLPDOLDHHHLLPPLLLHDPLDHDHHHDDPPDLDDDPLHHPPPOPNMNKFPPPKPOMOOHONMPOKGNMMPNHJGMLHMPPOOMPFNPPPPLDDDHPPLPLHHHDPHAPHFPHHHPHLPPDPDPHOJGGPDPPPPPPPMPMNMMPOMNNMNNMNOOMOPOPPOMPMPPPPPPPPPPPPPPPPPPLCDIBINFJCFAGPGHCMKEAHKDKKDOJPPPPPPPPPPPPPPPPPPPPNPONNPPPPPPPPPMPNPPPPOPPPNPPPPPPPPPOPPPPPPPPPPPMHNCDHMFCFFFIPHDCEGPFKPFDOMHLPPPHCKKLDPPPPPPPPPPPPPPPONPPPPPHNPPJPPPPPPPPOMPPMNPPPOPONPPPPPPKOLNHAAKNCLEHCMBEKDGHHPBGIJLFLMKPELEKNOLHBPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPLPPPPHPPPPPOMPDPCHDNFHOIDDJMPMOPKMFLPDGCDNNFCHGEPMMEKOPPPPPHPLHPPPHLPHPPDLLDLHDLHDDPHPPDPLPPPPDLLPPDPPPPPPDKGJDJICDFJCIAAPHFGBCKFLPAPFBLHJPKANNPPPPPPPPPLPPPHDHDLPPLDDPDLHPDHPDDDHPPLPLPPDHDHLPPPPPPPPPOODNMNHOPOHIOPPMNNNLNOMLPMFPPIJPMMEPPIOMPPPPPPPLPPPLLDLPBLPLDEJPHLLHDHLLPPPLHHLPPHHLDHLPPPPPPPPOMNPPNNPPOOPONOOMNPOMMNPPMPNPPNPPPNNOPMPPPPPPPLAKENCNMHNAJLHKDFHOGEEGIFPIPINLPNHLJMNBJCFPPPPPONNPPONMONOPPMOOOPPMNPPONMONPNPPOPPONNNPPNPPPPPKIBBMKADNOPPGKIJJJBMOAJPIGFKIOAPIBFPNHLKAHPPPPPPPPNPNPOLPPPOPPOPPPPPPNOOPPPLPPPPLPNPPOPPMNPPPPLKJHLONPFKIBFDPFGNFDPKOIPPBCNJMJEJMNLEMDDPHPPPPPPPNPPPPPPPPLHPPPPPPPPPPPPPPPPPPPPPPLPPPPPPPPPPOLBBIFKGPOONOEPNGLCBKFCMNDAPLFAJHOBFAJOHGFDNPPPPHPPDPPHLHHHLHLHHDPLPPHLLPHLPLPPPPPLDDLDLPLHPPPOGIIDOPDBMNKBGKKNAPMJJOMJHAMFLLKDCFKJNGDJCMNPPPLPLDHPHHHHPPDLLPPPLLPLPDDPLHPPLDHHONLLPDNHPPPPPPONNHNNENMNMNONNNNOPMMPOMMNPOBPONMPOPMMMNPPPPPPLLPLHDHPDPPLHLHLPPHPDPDHODGLLHHDBPDHLHDLLHPPPPPPKOPMKEMPIHMGKPONEJNOOPLNMNONMPKPNMMNOMNPPPPPPPPPOPKPMDLNMLFKLHHPBKCBEHIGIJLAJIEHMACOENPPPPPPPOOPMNMONNPPNNMPNNMPPMNNPONOMOPMMNPPNPPPPPPPPPPPPCOJBCMIHOCDPJFGMJOHEJFIDHGALLBJBABJNHPPPPPPPPPPPNPPPNPPPPPPPHNONPPPPPLPOPPPPPPNPPPPPPPPNPPPPPPLJNJIGACIGBCNPBPLFPCHMLPNIGPIKIBGMEFIJLPFPPPPPPPPPPPPPGOPPPHHPPPPPNPPPOPPPPPPPNMPPHPPPPPPPPPPPNNKOIIEPFMNMOHLMLPGJBCMGCMJJAMHPFENIGNJPPPPPPPLPLPLDDHHLDPPLLPDLPLHHHLPDHDHPHHPPPDHDDHPPPPPPPLAHOIEOEKDMGODPMBJJDOCADBLCJBHKGECMLNCACLPPPPPPPDLPPHHHLDPLPDPPLHPDHDHHHHPPLLPDLPPPDLPPPPPPPPPKOOMNLMNMGMNPMPNNOONNLFONNPNJNNNOPFIJOPMMIPPPPPPLHPDPLHLLLLLPLDPLHPDLCPPLPDHDPLDHHLPLHLDDPPPPPONNMOMLOPNPNNNHPPNNPKPONNCLPMOPMOKPMPPCPOPPPPPPLCIPLHOPPGDDDPBDHDDPGCPOJPKLMLAPDDDDKDLMGDLPPPPONMMMPPOPOMMPPOPNNPMNONOOPNPOMNNONNOONNOPPPPPPPKLIFJLEGGFMMHBHOBPHHADGKHGGGEHENPAPJICKMPPPPPPPPPPPPPPPPNPPPNPPPPPPPPPPONPMPPPPPPOPPPPPPPPPPPPKGPLJGKGELBEILMOGFFECNDLAOHEKNIKMPJPMNOPPPPPPPPPPPPPOPDPPMNPPMMMMMPPOMMPPPPPMOPPPPPPONMONPPPPPLKAGHLAOELJOPPPKEBPGOCNPHDLKCKMJCIJLHCCGCPPPPPP/aAAwDAQACAAMAAAAQ88888wwww88888888888888888888888888/888888888888887eqKHaO2888888888888888888888888940084448888888v8ALoMGPLvPPPPPPPPPPPPPPPPPPPPPPPKZVIZYyVHPPPPPPLHUssslXfPPPPPPPPPPPPPPPPPPPPPPPPbHPPDPbPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPNPPPPPPPPPPPPPNePPPPPPdNNPPPPPPPPPPPPPPPPPPPPPPfPPPPPPPPPPPPOfWeWecfdUcZSVfPPPPPPPPPPPPPPPPPPPHPPPPPPPPPPPPPHDLPLLXHDDDDXPPPPPPPPPPPPPPPPPPfffffffffffffffffffffffffffffffffffffffffffffffONCPJOKEOPFMMFMNOIPPHJFANNLFMPLEPJNPODLMPPPPPPPLHLHHDDHCHDLDDPLLHHHDLPLPHPDPDPHHHHPHHPDPPPPPPPPMNONNMMNMMPNNPNOOPOMNPPPPOPNNPPPMOPPPPPPPPPPPPPMFCDKELPNBEFHJAIOMNHFPPJKHOGEALLNGHPPPPPPPPPPPOOMOMMPNPPPMMPPOONONPNOMPONNOONPNPPPMPMNPOOPPPPOHNCFCOMKPCCPGKNJHEAJLJBFJFJPCKNBBENLOMDLMOPPPPOPPPPOPPPNPPPPPPNPPPPPMPPPPOPPPPPNPPNPPPPPPPPPPLJADLAEMBJNNALLDPMPBMBBFEMDLPLAHFJPFNICGPPFPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPHICNCKPDOGFOLLPNOLGAKLBMAOPFKLNFCFFDBMEEGPPPPPPDLLLPHDPPHHLDLDDLPDPHLHDHHHHHLHHHDPHPDPHHPPPPPOFDLGJNPOKNPLODONHHGFKLEELGAIGCFIFCDHAMMPPPPPPPLLDLHHLHPLLDHPDLPDHDLPLDPLPLHHDPDPDHPDPLPPPPPPPPNOIMMOPBGNPNMOFPLHNJNNJENNEPKNMLGFMPPPPPPPPPPPKLPDPDLHLLCDPHHHLDLHDLPPIPDLAJLHDDHPPPPPPPPPPPPPMDMNENJNNFHMMMMOONIONMPMMFOOPOEMPONPPPPPPPPPPPLNLKDNJPOMKOFMBAAPAGHOHHBJJIEBPDGPHIPPPPPPPPPPPOPMNONPNMMMMNNNMNNPOPPOPPPPPMPOPOOOMPMNOMOPPPPPONNIAPFGOIIGJGMGOAMOIAGKOFEMCINBNOKBODIIFBNPPPPONNOONPPPONNPPPPOPPPPPPPPPPMNPPOPPPPMPPPPNPPPPPLBNPOJCEGBNEJNKNKEDHCAOMLOAOFCLAPKFGBPIEAEHFPPPPPMPPMPPHPNPLPPNPPOPPNPPPPPPPPPPPLPPPPPPPPPPPPPOBHFFBAPOCBKGJBIDJACEFPPPPPPPPPPPPPPPPPPPPPPPPPPPLHLDDLLPPPLHPPLDDPPHPPPPPPPPPPPPPPPPPPPPPPPPPLFHLMGHHGNHPNLOCIIDDOIKKLKJDJPHEOKFLONOMONPPPPPOLCDHHLHDOLDPDKHDHDHDLPHPKDBHPHJKPLGPHLHPPPPPPPONCNOPNNFPIELCFMPIGNIOMOMFMOKGOEDPPPNPFPPPMPPPPLHLPHHDLPHOLPPLLLHHHDLLPLPDLLHLPDDHLHLPLHLHPPPPPEPFGNNOELPMPGHNPOJANNPPPPPPPPPPPPPPPPPPPPPPPPPKKIGJMMBHJMNHOBIENHEEHPPPPPPPPPPPPPPPPPPPPPPPPPPPONPPPPPPPPPPPPPPPPPPPPPPPPPPPPOONNPMOPPNNPPPPLKHBHFFBICKKKFFFFBAKKKONFFFEEGOKGJGEEOLFDNNPPPPPPMNPPOPOPPPPPPOPOPOPPPNOPPPPOPPPNPPPPPPPPPPPPPPHPBOKJAMDLGKFOCFKNIDANOPAMHDBDDLEGFDDDPDDHPPPPPPOPPPPNPPPLPOONPPPPPEPPPPPPPPPONPNPONPPPPPPPPPPAGECHBJJCKAEPCEPBIDAFMPILCJNIBGEAKGMGCFNPPPPPPPPDDHPLDHPDHPLDLPPLHPDHLHLPPDHDDDDPHLDHLHPPPPPPLMJCOHMGEPBLFOAPMKNLKPNKBOFMOIDPHOPNCICCFFPPPPPPDHPPPDPPPDHHHPLHLLDHHHPLHPPHLPPHHLLHLDDPPPPPPPLEPOJMOGMMONIFGPNPDMOOPPJNMLMMCEMNMGNBHNOOONPPPLHHHPLHDJNHDLHPLPLLHPHLPPHJPDPLLLLHHLLDHDLDHPPPPONMMJONMMNPPONPGNPNPNIEPPPHPGLFMIFNPONOPPEPPPPLODGPFNLHCDPHPAHPCLCMFBGLJHPPPFHNPDALLJEKPPPPPPOMPPNMOOOONNMPMNOOONONONOPMPOPPPPPPPPPPPPPPPPPPOJCNLMDDFKJPMDNLBLKAMHLMELJMDPPPPPPPPPPPPPPPPPPPPOPPNNPNPPOPMPPPPPPPPPOPPPNPPPPPPPPOPNPPPPPPPPOCLHGNEHFLNDHBNIMCKLHJIELCJGPLDLLPPLPBEIPPPPPPPPPMPPNPPOMNPPMPGPPPJLPPPPPPPOOPNPMPPPOPONPPPPPPOEONIMALJJNDDJFAHDHHFMCCGLNMICDKJHCLIOALAAFPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPLPPPPHPPPPPPPGNGPDDNMGMCNCKOGNKFIAOHLMCHEEBFNPCKJEEJJOPPPPPDHHHPHDHDLHPPLPLLHHLDHPDPLDHPLDDDLLDHPDHHHPPPPLBKJECJHFKGNKHCMAAFFGJBHAAOBBNCFKCPBIPPPPPPPPPPLHLDDDDDDPDPDPLLLLPDDHHPHPLDDHDHHHLDHPPPPPPPPPPPNCNJMFMNNMEMNONMPNJMNOCPMHMOKNEPMHOOJPNPPPPPPPLPDPDPHOHBPHDJEFHLHLHHHHLDPHPHDDLLHPPLLLPPPPPPPPNEPNOOOOPMMPPNPOOPNMOOMONMOPPMOMOONMNNPOPPPPPPPMAIJKNMLDBAKPKJKIPEEIOKOGIDMFOKGDDOIOADMFPPPPPOONOONPNMNMPNMONOOPMNPNONMNOMPPNONNPMNNMNNPPPPPPMOHOCBHGCKDHGJNNMJECCOEEBNBLKKKCPLKNJPCMHPPPPPPPPNPPPPLPPPOPPPPPPPPPNONPPPPPPPPPPPNPPONMPPPPPOGNKCAELHAOEIKKFBJHCEDNKNMHGIOKCLIJGDJFJMFNPPPPPPPNNPPONPPPJDPOPNPPPPPPPOOPPPPPPPPPGPOPPPPPPPPPAGKCCOLNAKIGMGCOKAMLKGBAFOEANLDFPGAJFCMAGOFPPPPHPHDHLHLHDDDDPLHHLHPLLLLHHPHLPHHHDLHLLHLLHHPPPOELLFMMCFCHHMICKOPFFJCBEHKGPPCEMJMHFABDFKIIMPPPLLDDDDHPPDDLDLHPDHLPLHHDLDDPHPDHDHDDDHLDNDLHPPPPNPOPNOCOHMKMPONMGOOPOOMIONMMENLEMMHNMMJNPPPPPPPLPHPHHHPLHPPLLLLPHHPLHOEDPHPLPHEDDHDDDPHHPPPPPPJMNOFFMOJENEKOPPPCPLFPKMNOPNOPJPMNHNMPPPPPPPPPLCFPOFEPDDKHOIAMPPCOGDHBEIHCFPNDLHNKGAMFPPPPPPPOPNPNOONNPMNPMPNNPNNOPPNOMPPOOOMPPPPPPPPPPPPPPPPIFLFKABBGDPLPHHAMCAEMAIHHPGKGHEODPGFNPPPPPPPPPLPMHPNLPPPNMPPHNONPPPHPLPPPPPPNPPPNPPPPPPPPPPPPOEKNEKBCICIKCPPJPJENPGDLOLMCDOLBNNELPMFDEMPPPPPPNPPPPONKPPPPMPLOPPPMNPLPPPNOPPPNMPPPPPPPPPPPPPKNAPPFOBLFANPDFMJBFKGJHLBKLAHCPHDHAAOFGPPPPPPPPPPPLLDHHHHHPLLPPPLPPDHPPLDPPDPHHPDLDLLDPPPPPPPPLIMHEGBMOPNMKAMBKMKADHJIELAFBHNLMPJMEHCLKPPPPPPLPPHPHLPPLLLDHPHLDDDLHPOHPPLDPLDDPLPHPHLDPPPPPPKFHPPMOOPNNCNEONLEHMOOFNPPMPKEMFOOPLLMOMPIPPPPPPLHDHHDLPDDDHLHLLLLDPLOFDPHPPNDLHHHHDPHPPPPPPPPOINOPNGONNMPPFFPONPNEOMPNEIGNPGNMENMGNPMMNNPPPPLMBENOPMHHCJLHCFLFIFHJNCPPGLGECNFMKGHGKGEHNPPPPPNPNPPOOMPOOPPONONONPOOOOPNOOOMNOPMOPPPNPPPPPPPPGAEEKFOMJEDHEHPPFOPPKJGKCLDMGFCABLDGIAEPPPPPPPPPPPPPPPPNOPPOPPPPPPPPPPMNOPPPNPPPOPPPPPPPPPPPPOODHMKHOLJIJIGAHIKI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', 1, '2020-02-11 15:01:25', '2022-03-23 19:54:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dislikes`
--

CREATE TABLE `dislikes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `is_liked` int(11) NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dislikes`
--

INSERT INTO `dislikes` (`id`, `is_liked`, `user_id`, `module`, `module_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 0, 5, 'posts', 6, '2021-11-30 13:14:56', '2021-11-30 13:14:56', '2022-06-10 17:43:01'),
(8, 0, 5, 'user_comments', 75, '2021-12-03 11:46:33', '2021-12-03 11:46:33', NULL),
(12, 0, 7, 'user_comments', 96, '2021-12-06 08:09:32', '2021-12-06 08:09:32', NULL),
(13, 0, 8, 'posts', 5, '2021-12-07 07:26:25', '2021-12-07 07:26:25', '2022-06-10 17:43:01'),
(21, 0, 10, 'posts', 10, '2022-01-07 20:18:32', '2022-01-07 20:18:32', '2022-06-10 17:43:01'),
(40, 0, 8, 'user_comments', 5, '2022-01-14 07:39:15', '2022-01-14 07:39:15', NULL),
(44, 0, 14, 'posts', 11, '2022-01-14 14:29:54', '2022-01-14 14:29:54', '2022-06-10 17:43:01'),
(45, 0, 12, 'posts', 11, '2022-01-14 14:29:55', '2022-01-14 14:29:55', '2022-06-10 17:43:01'),
(46, 0, 16, 'posts', 13, '2022-01-14 15:19:36', '2022-01-14 15:19:36', '2022-06-10 17:43:01'),
(54, 0, 18, 'posts', 21, '2022-01-15 00:53:37', '2022-01-15 00:53:37', '2022-06-10 17:43:01'),
(55, 0, 17, 'user_comments', 30, '2022-01-15 01:23:42', '2022-01-15 01:23:42', NULL),
(56, 0, 17, 'user_comments', 32, '2022-01-15 01:23:54', '2022-01-15 01:23:54', NULL),
(57, 0, 17, 'posts', 20, '2022-01-15 01:23:58', '2022-01-15 01:23:58', '2022-06-10 17:43:01'),
(58, 0, 17, 'posts', 19, '2022-01-15 01:24:01', '2022-01-15 01:24:01', '2022-06-10 17:43:01'),
(62, 0, 25, 'posts', 31, '2022-02-03 12:39:40', '2022-02-03 12:39:40', '2022-06-10 17:43:01'),
(65, 0, 25, 'posts', 29, '2022-02-03 12:40:03', '2022-02-03 12:40:03', '2022-06-10 17:43:01'),
(66, 0, 36, 'posts', 42, '2022-06-10 13:39:24', '2022-06-10 13:39:24', '2022-06-10 17:43:01'),
(67, 0, 36, 'posts', 43, '2022-06-10 13:42:41', '2022-06-10 13:42:41', '2022-06-10 17:43:01');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `slug`, `question`, `answer`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '61dd5f735d96161dd5f735d963', 'How to change the language', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', 1, '2020-02-17 15:45:47', '2022-03-25 19:53:58', '2022-03-25 23:53:58'),
(2, '61dd5f735d96561dd5f735d966', 'What is Streammii?', 'StreamMii gives individuals access to Music Producers, Video Directors, Song Writers, Recording Engineers and more, located all across the world. This platform will relieve the stress of the common question, “what should I do next?”.  StreamMii offers artists the ability to turn their hobby of making music into their career. The key to being successful in the rapidly expanding music industry is to gain support from fans and generate profitable content. StreamMii introduces an easily accessible mobile app platform for individuals in the music industry to promote their music and network with one another.', 1, '2020-02-17 15:51:16', '2022-03-25 21:28:33', NULL),
(3, '623e334bc04fd1648243531', 'What are tokens used for?', '- Fans can purchase tokens and give them to their favorite artists to show support. \r\n- Treat tokens like money. In the near future, artists will be able exchange their tokens for money and deposit it into their bank account. \r\n- This is a unique feature that allows fans to publicly display their support, while allowing artists to gain profit.', 1, '2022-03-25 21:25:31', '2022-03-25 21:25:31', NULL),
(4, '623e337e6d3091648243582', 'Fans: How can I buy tokens?', '- Fans can purchase tokens by going to the bottom of the app and pressing the $ picture labeled “tokens”\r\n- There, choose the number of tokens you would like to purchase, and press “pay now” --> “purchase” \r\n- Your current balance will be displayed at the top of the page on your Streammii card.', 1, '2022-03-25 21:26:22', '2022-03-25 21:26:22', NULL),
(5, '623e339347a321648243603', 'Artist: Where can I locate my tokens?', '- Your total accumulated tokens will be located on “My Profile” in your bio.', 1, '2022-03-25 21:26:43', '2022-03-25 21:26:43', NULL),
(6, '623e33acdbd481648243628', 'Artist: How can I post new content?', '- Press the “+” symbol located at the bottom of the app\r\n- You will be able to post audio and videos.', 1, '2022-03-25 21:27:08', '2022-03-25 21:27:08', NULL),
(7, '623e33c0324b41648243648', 'What is a private account?', '- Only your approved followers will be able to see your posts.', 1, '2022-03-25 21:27:28', '2022-03-25 21:27:28', NULL),
(8, '623e33d9e66c41648243673', 'How can I change my password?', 'My profile --> settings --> change password', 1, '2022-03-25 21:27:53', '2022-03-25 21:27:53', NULL),
(9, '623e36439f4e11648244291', 'How can I report or block another user?', '- If another user posts something offensively or inappropriate, you can block their account or report their post for review.\r\n     - Block: press the 3 dots above the post --> block. That user’s content will no longer appear in your feed. \r\n     - Report: press the 3 dots above the post --> report. The user’s post will be flagged and placed under review', 1, '2022-03-25 21:38:11', '2022-03-25 21:39:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `actor_id` bigint(20) UNSIGNED NOT NULL,
  `target_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`id`, `actor_id`, `target_id`, `status`, `created_at`, `updated_at`, `deleted_at`, `slug`) VALUES
(29, 8, 5, '1', '2022-01-14 06:15:08', '2022-01-14 06:16:18', NULL, '81642140908'),
(31, 10, 6, '0', '2022-01-14 06:43:05', '2022-01-14 06:43:05', NULL, '101642142585'),
(33, 10, 9, '1', '2022-01-14 06:45:16', '2022-01-14 06:45:16', NULL, '101642142716'),
(38, 11, 5, '1', '2022-01-14 10:20:17', '2022-01-14 10:20:17', NULL, '111642155616'),
(39, 13, 8, '1', '2022-01-14 11:40:38', '2022-01-14 11:40:38', NULL, '131642160438'),
(40, 12, 14, '1', '2022-01-14 12:34:46', '2022-01-14 12:34:46', NULL, '121642163686'),
(42, 16, 15, '1', '2022-01-14 15:16:17', '2022-01-14 15:16:38', NULL, '161642173377'),
(43, 15, 13, '1', '2022-01-14 15:22:20', '2022-01-14 15:22:20', NULL, '151642173740'),
(54, 20, 19, '1', '2022-01-15 01:34:33', '2022-01-15 01:45:20', NULL, '201642210473'),
(55, 20, 18, '0', '2022-01-15 01:34:33', '2022-01-15 01:34:33', NULL, '201642210473'),
(56, 19, 18, '0', '2022-01-15 02:51:36', '2022-01-15 02:51:36', NULL, '191642215096'),
(57, 24, 19, '0', '2022-01-17 11:45:56', '2022-01-17 11:45:56', NULL, '241642419956'),
(58, 24, 18, '0', '2022-01-17 11:45:57', '2022-01-17 11:45:57', NULL, '241642419957'),
(59, 23, 24, '1', '2022-01-17 11:50:09', '2022-01-17 11:50:09', NULL, '231642420209'),
(60, 25, 24, '1', '2022-01-17 12:06:48', '2022-01-17 12:07:32', NULL, '251642421208'),
(62, 23, 26, '1', '2022-01-18 10:01:08', '2022-01-19 07:18:41', NULL, '231642500068'),
(63, 23, 27, '1', '2022-01-18 10:01:08', '2022-01-18 13:20:30', NULL, '231642500068'),
(65, 29, 26, '0', '2022-01-21 07:56:28', '2022-01-21 07:56:28', NULL, '291642751788'),
(66, 29, 24, '0', '2022-01-21 07:56:28', '2022-01-21 07:56:28', NULL, '291642751788'),
(67, 31, 26, '0', '2022-01-21 10:13:45', '2022-01-21 10:13:45', NULL, '311642760025'),
(68, 31, 24, '0', '2022-01-21 10:13:45', '2022-01-21 10:13:45', NULL, '311642760025'),
(69, 26, 23, '1', '2022-01-26 05:48:19', '2022-01-26 05:48:19', NULL, '261643176099'),
(70, 17, 18, '0', '2022-01-31 19:32:15', '2022-01-31 19:32:15', NULL, '171643657535'),
(71, 36, 19, '0', '2022-06-10 13:05:49', '2022-06-10 13:05:49', NULL, '361654866349'),
(72, 35, 36, '1', '2022-06-10 13:07:03', '2022-06-10 13:07:03', NULL, '351654866423');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mail_templates`
--

CREATE TABLE `mail_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `identifier` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wildcard` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mail_templates`
--

INSERT INTO `mail_templates` (`id`, `identifier`, `subject`, `body`, `wildcard`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'forgot-password', 'Forgot Password Confirmation', '<table class=\"main\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\">\r\n    <tr>\r\n        <td class=\"wrapper\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\">\r\n            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\">\r\n                <tr>\r\n                    <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Hi [USERNAME],</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :</p>\r\n                        <p><a href=\"[LINK]\">Reset Password</a></p>\r\n                        <br>\r\n                        <br>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Regards,</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">© [YEAR] [APP_NAME] All Rights reserved.</p>\r\n                    </td>\r\n                </tr>\r\n            </table>\r\n        </td>\r\n    </tr>\r\n</table>\r\n', '[USERNAME],[LINK],[YEAR],[APP_NAME]', '2022-01-11 05:44:02', NULL, NULL),
(2, 'user_registration', 'Welcome to [APP_NAME]', '<table class=\"main\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\">\r\n    <tr>\r\n        <td class=\"wrapper\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\">\r\n            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\">\r\n                <tr>\r\n                    <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Hi [USERNAME],</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Your account has been created successfully. First, you need to confirm your account. Just click the below link</p>\r\n                        <p><a href=\"[LINK]\">Verify Now</a></p>\r\n                        <br>\r\n                        <br>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Regards,</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">© [YEAR] [APP_NAME] All Rights reserved.</p>\r\n                    </td>\r\n                </tr>\r\n            </table>\r\n        </td>\r\n    </tr>\r\n</table>\r\n', '[USERNAME],[LINK],[YEAR],[APP_NAME]', '2022-01-11 05:44:02', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_id` int(11) NOT NULL,
  `filename` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail_url` text COLLATE utf8mb4_unicode_ci,
  `mime_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_08_19_000000_create_failed_jobs_table', 1),
(2, '2021_03_05_000000_create_cms_roles_table', 1),
(3, '2021_03_05_172240_create_cms_users_table', 1),
(4, '2021_03_05_174918_create_cms_modules_table', 1),
(5, '2021_03_05_175415_create_cms_module_permissions_table', 1),
(6, '2021_03_06_185651_create_mail_templates_table', 1),
(7, '2021_03_08_191839_create_reset_password_table', 1),
(8, '2021_03_13_121206_create_application_setting_table', 1),
(9, '2021_04_20_200223_create_user_groups_table', 1),
(10, '2021_04_20_200451_create_users_table', 1),
(11, '2021_04_20_202053_create_user_api_token_table', 1),
(12, '2021_06_04_181436_create_notification_table', 1),
(13, '2021_06_06_130550_create_notification_setting_table', 1),
(14, '2021_08_29_105840_create_jobs_table', 1),
(15, '2021_09_07_154417_create_cms_widgets_table', 1),
(16, '2021_09_07_161059_create_cms_widget_role_table', 1),
(17, '2021_09_08_081135_create_content_management_table', 1),
(18, '2021_09_08_082346_create_faqs_table', 1),
(19, '2021_09_20_180624_create_media_table', 1),
(20, '2021_10_01_055531_create_artist_types', 1),
(21, '2021_10_01_063031_create_music_genres', 1),
(22, '2021_10_03_142601_add_columns_to_users_table', 1),
(23, '2021_10_03_172423_add_new_to_users_table', 1),
(24, '2021_10_04_064118_create_followers_table', 1),
(25, '2021_10_05_091611_create_posts_table', 1),
(26, '2021_10_05_112832_add_is_first_login_field_to_user_table', 1),
(27, '2021_10_11_071405_create_report_types_table', 1),
(28, '2021_10_11_071406_create_user_reports_table', 1),
(29, '2021_10_11_071810_create_block_users_table', 1),
(30, '2021_10_11_073937_create_user_comments_table', 1),
(31, '2021_10_11_105846_add_address_to_posts', 1),
(32, '2021_10_11_110351_create_post_tags_users', 1),
(33, '2021_10_12_065545_add_slug_to_followers', 1),
(34, '2021_10_13_081142_add_new_fields_to_users', 1),
(35, '2021_10_14_094350_create_user_block', 1),
(36, '2021_10_14_114253_add_post_meta_data_to_posts', 1),
(37, '2021_10_15_122518_change_post_change_enum_column_value', 1),
(38, '2021_10_15_123204_change_post_post_meta_data_null', 1),
(39, '2021_10_19_065521_add_post_total_dislike_to_posts', 1),
(40, '2021_10_19_065839_add_post_total_token_to_posts', 1),
(41, '2021_10_19_071655_create_user_like', 1),
(42, '2021_10_19_100350_change_column_user_comments', 1),
(43, '2021_10_19_101936_add_slug_user_comments', 1),
(44, '2021_11_12_062530_add_slug_to_user_block', 1),
(45, '2021_11_22_132347_create_dislikes_table', 1),
(46, '2022_01_06_101130_create_user_coins_table', 1),
(47, '2022_01_06_102221_create_subscription_packages_table', 1),
(48, '2022_01_06_110825_create_user_subscription_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `music_genres`
--

CREATE TABLE `music_genres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `music_genres`
--

INSERT INTO `music_genres` (`id`, `slug`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'blues', 'Blues', '2022-01-11 10:44:03', NULL, NULL),
(2, 'classical-music', 'Classical Music', '2022-01-11 10:44:03', NULL, NULL),
(3, 'hip-hop', 'Hip-hop', '2022-01-11 10:44:03', NULL, NULL),
(4, 'jazz', 'Jazz', '2022-01-11 10:44:03', NULL, NULL),
(5, 'pop', 'Pop', '2022-01-11 10:44:03', NULL, NULL),
(6, 'r-b', 'R & B', '2022-01-11 10:44:03', NULL, NULL),
(7, 'electronic', 'Electronic', '2022-01-11 10:44:03', NULL, NULL),
(8, 'alternative-music', 'Alternative Music', '2022-01-11 10:44:03', NULL, NULL),
(9, 'country-music', 'Country Music', '2022-01-11 10:44:03', NULL, NULL),
(10, 'heavy-metal', 'Heavy Metal', '2022-01-11 10:44:03', NULL, NULL),
(11, 'instrumental', 'Instrumental', '2022-01-11 10:44:03', NULL, NULL),
(12, 'reggae', 'Reggae', '2022-01-11 10:44:03', NULL, NULL),
(13, 'punk-rock', 'Punk Rock', '2022-01-11 10:44:03', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actor_id` int(11) NOT NULL,
  `actor_slug` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actor_type` enum('users','cms_users') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'users',
  `target_id` int(11) NOT NULL,
  `target_type` enum('users','cms_users') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'users',
  `reference_id` int(11) NOT NULL,
  `reference_module` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `web_redirect_link` text COLLATE utf8mb4_unicode_ci,
  `is_read` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_view` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `unique_id`, `identifier`, `actor_id`, `actor_slug`, `actor_type`, `target_id`, `target_type`, `reference_id`, `reference_module`, `title`, `description`, `web_redirect_link`, `is_read`, `is_view`, `created_at`, `updated_at`) VALUES
(1, '61dd74000d874', 'post_like', 1, NULL, 'users', 2, 'users', 2, 'post_like', 'Laravel', 'bit navi liked your video', NULL, '0', '0', '2022-01-11 12:11:44', '2022-01-13 14:43:05'),
(2, '61dd74db48110', 'post_like', 1, NULL, 'users', 2, 'users', 3, 'post_like', 'Laravel', 'bit navi liked your video', NULL, '0', '0', '2022-01-11 12:15:23', '2022-01-13 14:43:05'),
(3, '61dd75731be4a', 'post_like', 1, NULL, 'users', 2, 'users', 4, 'post_like', 'Streammii', 'bit navi liked your video', NULL, '0', '0', '2022-01-11 12:17:55', '2022-01-13 14:43:05'),
(4, '61de864a25d00', 'followers', 1, NULL, 'users', 2, 'users', 1, 'followers', 'Streammii', 'simple navi started following you', NULL, '0', '0', '2022-01-12 07:42:02', '2022-01-13 14:43:05'),
(5, '61deb74820816', 'followers', 1, NULL, 'users', 2, 'users', 2, 'followers', 'Streammii', 'simple navi started following you', NULL, '0', '0', '2022-01-12 11:11:04', '2022-01-13 14:43:05'),
(6, '61debe106c70e', 'followers', 1, NULL, 'users', 2, 'users', 3, 'followers', 'Streammii', 'simple navi started following you', NULL, '0', '0', '2022-01-12 11:40:00', '2022-01-13 14:43:05'),
(7, '61debf304cfdd', 'followers', 1, NULL, 'users', 2, 'users', 4, 'followers', 'Streammii', 'simple navi started following you', NULL, '0', '0', '2022-01-12 11:44:48', '2022-01-13 14:43:05'),
(8, '61dec73f28198', 'post_tag', 1, NULL, 'users', 2, 'users', 5, 'post_tag', 'Streammii', 'bit navi tag you on his post.', NULL, '0', '0', '2022-01-12 12:19:11', '2022-01-13 14:43:05'),
(9, '61dfd8ed62543', 'followers', 1, NULL, 'users', 2, 'users', 5, 'followers', 'Streammii', 'simple navi started following you', NULL, '0', '0', '2022-01-13 07:46:53', '2022-01-13 14:43:05'),
(10, '61dfdd669f35f', 'followers', 1, NULL, 'users', 2, 'users', 6, 'followers', 'Streammii', 'simple navi started following you', NULL, '0', '0', '2022-01-13 08:05:58', '2022-01-13 14:43:05'),
(11, '61dff4796eaa5', 'followers', 1, NULL, 'users', 2, 'users', 7, 'followers', 'Streammii', 'simple navi started following you', NULL, '0', '0', '2022-01-13 09:44:25', '2022-01-13 14:43:05'),
(12, '61dff7940cb39', 'post_like', 1, NULL, 'users', 2, 'users', 14, 'post_like', 'Streammii', 'bit navi liked your video', NULL, '0', '0', '2022-01-13 09:57:40', '2022-01-13 14:43:05'),
(13, '61dff7eb7e086', 'post_comment', 1, NULL, 'users', 2, 'users', 2, 'post_comment', 'Streammii', 'bit navi comment on your post', NULL, '0', '0', '2022-01-13 09:59:07', '2022-01-13 14:43:05'),
(14, '61e019cdb5121', 'followers', 1, NULL, 'users', 2, 'users', 11, 'followers', 'Streammii', 'simple navi started following you', NULL, '0', '0', '2022-01-13 12:23:42', '2022-01-13 14:43:05'),
(15, '61e029d3bac10', 'followers', 1, NULL, 'users', 1, 'users', 14, 'followers', 'Streammii', 'bit navi started following you', NULL, '0', '0', '2022-01-13 13:32:03', '2022-01-13 14:43:05'),
(16, '61e02b087d61d', 'accepted_follow_request', 2, NULL, 'users', 1, 'users', 2, 'user_follow', 'Streammii', 'simple navi has accepted your request', NULL, '0', '0', '2022-01-13 13:37:12', '2022-01-13 14:43:05'),
(17, '61e02bee82713', 'accepted_follow_request', 2, NULL, 'users', 1, 'users', 2, 'user_follow', 'Streammii', 'simple navi has accepted your request', NULL, '0', '0', '2022-01-13 13:41:02', '2022-01-13 14:43:05'),
(18, '61e02c67e8a5e', 'accepted_follow_request', 2, NULL, 'users', 1, 'users', 2, 'user_follow', 'Streammii', 'simple navi has accepted your request', NULL, '0', '0', '2022-01-13 13:43:04', '2022-01-13 14:43:05'),
(19, '61e02e14460cc', 'accepted_follow_request', 2, NULL, 'users', 1, 'users', 2, 'user_follow', 'Streammii', 'simple navi has accepted your request', NULL, '0', '0', '2022-01-13 13:50:12', '2022-01-13 14:43:05'),
(20, '61e0304f2587b', 'accepted_follow_request', 2, NULL, 'users', 1, 'users', 2, 'user_follow', 'Streammii', 'simple navi has accepted your request', NULL, '0', '0', '2022-01-13 13:59:43', '2022-01-13 14:43:05'),
(21, '61e03233d1947', 'accepted_follow_request', 2, NULL, 'users', 1, 'users', 2, 'user_follow', 'Streammii', 'simple navi has accepted your request', NULL, '0', '0', '2022-01-13 14:07:47', '2022-01-13 14:43:05'),
(22, '61e03460cb36d', 'accepted_follow_request', 2, NULL, 'users', 1, 'users', 2, 'user_follow', 'Streammii', 'simple navi has accepted your request', NULL, '0', '0', '2022-01-13 14:17:05', '2022-01-13 14:43:05'),
(23, '61e034d23a00f', 'accepted_follow_request', 2, NULL, 'users', 1, 'users', 2, 'user_follow', 'Streammii', 'simple navi has accepted your request', NULL, '0', '0', '2022-01-13 14:18:58', '2022-01-13 14:43:05'),
(24, '61e035a3a7dcd', 'post_dislike', 1, NULL, 'users', 2, 'users', 5, 'post_dislike', 'Streammii', 'bit navi disliked your video', NULL, '0', '0', '2022-01-13 14:22:28', '2022-01-13 14:43:05'),
(25, '61e035d251bf7', 'post_like', 1, NULL, 'users', 2, 'users', 15, 'post_like', 'Streammii', 'bit navi liked your video', NULL, '0', '0', '2022-01-13 14:23:14', '2022-01-13 14:43:05'),
(26, '61e035e9893ee', 'post_comment', 1, NULL, 'users', 2, 'users', 3, 'post_comment', 'Streammii', 'bit navi comment on your post', NULL, '0', '0', '2022-01-13 14:23:37', '2022-01-13 14:43:05'),
(27, '61e0363ec8758', 'post_tag', 2, NULL, 'users', 1, 'users', 6, 'post_tag', 'Streammii', 'simple navi tag you on his post.', NULL, '0', '0', '2022-01-13 14:25:03', '2022-01-13 14:43:05'),
(28, '61e036d3497b0', 'post_dislike', 1, NULL, 'users', 2, 'users', 6, 'post_dislike', 'Streammii', 'bit navi disliked your video', NULL, '0', '0', '2022-01-13 14:27:31', '2022-01-13 14:43:05'),
(29, '61e0379967797', 'post_like', 1, NULL, 'users', 2, 'users', 16, 'post_like', 'Streammii', 'bit navi liked your video', NULL, '0', '0', '2022-01-13 14:30:49', '2022-01-13 14:43:05'),
(30, '61e037c164cba', 'post_dislike', 1, NULL, 'users', 2, 'users', 6, 'post_dislike', 'Streammii', 'bit navi disliked your video', NULL, '0', '0', '2022-01-13 14:31:29', '2022-01-13 14:43:05'),
(31, '61e1133c231d0', 'followers', 8, NULL, 'users', 5, 'users', 28, 'followers', 'Streammii', 'Jack smith started following you', NULL, '1', '0', '2022-01-14 06:07:56', '2022-01-14 11:08:16'),
(32, '61e11534bfee5', 'accepted_follow_request', 5, NULL, 'users', 8, 'users', 5, 'user_follow', 'Streammii', 'Jack smith has accepted your request', NULL, '0', '0', '2022-01-14 06:16:21', '2022-01-14 07:36:06'),
(33, '61e11652f185e', 'post_tag', 5, NULL, 'users', 8, 'users', 7, 'post_tag', 'Streammii', 'Jack smith tag you on his post.', NULL, '0', '0', '2022-01-14 06:21:07', '2022-01-14 07:36:06'),
(34, '61e1168f1ec78', 'post_comment', 8, NULL, 'users', 5, 'users', 7, 'post_comment', 'Streammii', 'jason roy comment on your post', NULL, '1', '0', '2022-01-14 06:22:07', '2022-01-14 11:08:16'),
(35, '61e116972a3ba', 'post_comment', 8, NULL, 'users', 5, 'users', 7, 'post_comment', 'Streammii', 'jason roy comment on your post', NULL, '1', '0', '2022-01-14 06:22:15', '2022-01-14 11:08:16'),
(36, '61e1170643302', 'post_comment', 8, NULL, 'users', 5, 'users', 7, 'post_comment', 'Streammii', 'jason roy comment on your post', NULL, '1', '0', '2022-01-14 06:24:06', '2022-01-14 11:08:16'),
(37, '61e1172d628c5', 'post_like', 8, NULL, 'users', 5, 'users', 7, 'post_like', 'Streammii', 'jason roy liked your video', NULL, '1', '0', '2022-01-14 06:24:45', '2022-01-14 11:08:16'),
(38, '61e11802eb591', 'post_dislike', 8, NULL, 'users', 5, 'users', 7, 'post_dislike', 'Streammii', 'jason roy disliked your video', NULL, '1', '0', '2022-01-14 06:28:19', '2022-01-14 11:08:16'),
(39, '61e11817c7cc4', 'post_like', 8, NULL, 'users', 5, 'users', 7, 'post_like', 'Streammii', 'jason roy liked your video', NULL, '1', '0', '2022-01-14 06:28:39', '2022-01-14 11:08:16'),
(40, '61e11ceb77735', 'post_like', 8, NULL, 'users', 5, 'users', 7, 'post_like', 'Streammii', 'jason roy liked your video', NULL, '1', '0', '2022-01-14 06:49:15', '2022-01-14 11:08:16'),
(41, '61e11dd20c69e', 'post_dislike', 8, NULL, 'users', 5, 'users', 7, 'post_dislike', 'Streammii', 'jason roy disliked your video', NULL, '1', '0', '2022-01-14 06:53:06', '2022-01-14 11:08:16'),
(42, '61e11e60352c5', 'post_like', 8, NULL, 'users', 5, 'users', 7, 'post_like', 'Streammii', 'jason roy liked your video', NULL, '1', '0', '2022-01-14 06:55:28', '2022-01-14 11:08:16'),
(43, '61e12420833e8', 'post_dislike', 8, NULL, 'users', 5, 'users', 7, 'post_dislike', 'Streammii', 'jason roy disliked your video', NULL, '1', '0', '2022-01-14 07:20:00', '2022-01-14 11:08:16'),
(44, '61e1276260e6c', 'post_comment', 8, NULL, 'users', 5, 'users', 7, 'post_comment', 'Streammii', 'jason roy comment on your post', NULL, '1', '1', '2022-01-14 07:33:54', '2022-01-14 11:08:16'),
(45, '61e12764edac7', 'post_comment', 8, NULL, 'users', 5, 'users', 7, 'post_comment', 'Streammii', 'jason roy comment on your post', NULL, '1', '1', '2022-01-14 07:33:57', '2022-01-14 11:08:16'),
(46, '61e128710485a', 'comment_dislike', 5, NULL, 'users', 8, 'users', 8, 'comment_dislike', 'Streammii', 'Jack smith liked your comment', NULL, '0', '0', '2022-01-14 07:38:25', NULL),
(47, '61e12882b053c', 'comment_like', 5, NULL, 'users', 8, 'users', 35, 'comment_like', 'Streammii', 'Jack smith liked your comment', NULL, '0', '0', '2022-01-14 07:38:42', NULL),
(48, '61e12cc77b051', 'post_tag', 5, NULL, 'users', 8, 'users', 9, 'post_tag', 'Streammii', 'Jack smith tag you on his post.', NULL, '0', '0', '2022-01-14 07:56:55', NULL),
(49, '61e14e6119303', 'followers', 11, NULL, 'users', 5, 'users', 38, 'followers', 'Streammii', 'Jack smith started following you', NULL, '1', '1', '2022-01-14 10:20:17', '2022-01-14 11:08:16'),
(50, '61e16136a488f', 'followers', 13, NULL, 'users', 8, 'users', 39, 'followers', 'Streammii', 'jason roy started following you', NULL, '0', '0', '2022-01-14 11:40:39', NULL),
(51, '61e16de66e3ef', 'followers', 12, NULL, 'users', 14, 'users', 40, 'followers', 'Streammii', 'Cameron started following you', NULL, '1', '1', '2022-01-14 12:34:46', '2022-01-14 14:39:37'),
(52, '61e1760861f15', 'post_like', 12, NULL, 'users', 14, 'users', 11, 'post_like', 'Streammii', 'Symonds liked your video', NULL, '1', '1', '2022-01-14 13:09:28', '2022-01-14 14:39:37'),
(53, '61e177634309c', 'post_dislike', 12, NULL, 'users', 14, 'users', 11, 'post_dislike', 'Streammii', 'Symonds disliked your video', NULL, '1', '0', '2022-01-14 13:15:15', '2022-01-14 14:39:37'),
(54, '61e1787e1cf7c', 'post_like', 12, NULL, 'users', 14, 'users', 11, 'post_like', 'Streammii', 'Symonds liked your video', NULL, '1', '0', '2022-01-14 13:19:58', '2022-01-14 14:39:37'),
(55, '61e179672ed11', 'post_dislike', 12, NULL, 'users', 14, 'users', 11, 'post_dislike', 'Streammii', 'Symonds disliked your video', NULL, '1', '0', '2022-01-14 13:23:51', '2022-01-14 14:39:37'),
(56, '61e1799c0b21b', 'post_like', 12, NULL, 'users', 14, 'users', 11, 'post_like', 'Streammii', 'Symonds liked your video', NULL, '1', '0', '2022-01-14 13:24:44', '2022-01-14 14:39:37'),
(57, '61e1799d9252e', 'post_like', 12, NULL, 'users', 14, 'users', 11, 'post_like', 'Streammii', 'Symonds liked your video', NULL, '1', '0', '2022-01-14 13:24:45', '2022-01-14 14:39:37'),
(58, '61e1827690df6', 'post_dislike', 12, NULL, 'users', 14, 'users', 11, 'post_dislike', 'Streammii', 'Symonds disliked your video', NULL, '1', '0', '2022-01-14 14:02:30', '2022-01-14 14:39:37'),
(59, '61e18285a6d2f', 'post_comment', 12, NULL, 'users', 14, 'users', 11, 'post_comment', 'Streammii', 'Symonds comment on your post', NULL, '1', '0', '2022-01-14 14:02:45', '2022-01-14 14:39:37'),
(60, '61e18301594a9', 'post_like', 12, NULL, 'users', 14, 'users', 11, 'post_like', 'Streammii', 'Symonds liked your video', NULL, '1', '0', '2022-01-14 14:04:49', '2022-01-14 14:39:37'),
(61, '61e18316c12f0', 'post_comment', 12, NULL, 'users', 14, 'users', 11, 'post_comment', 'Streammii', 'Symonds comment on your post', NULL, '1', '0', '2022-01-14 14:05:10', '2022-01-14 14:39:37'),
(62, '61e186becf569', 'post_comment', 12, NULL, 'users', 14, 'users', 11, 'post_comment', 'Streammii', 'Symonds comment on your post', NULL, '1', '0', '2022-01-14 14:20:47', '2022-01-14 14:39:37'),
(63, '61e1873563c10', 'post_comment', 12, NULL, 'users', 14, 'users', 11, 'post_comment', 'Streammii', 'Symonds comment on your post', NULL, '1', '0', '2022-01-14 14:22:45', '2022-01-14 14:39:37'),
(64, '61e187839365b', 'post_comment', 12, NULL, 'users', 14, 'users', 11, 'post_comment', 'Streammii', 'Symonds comment on your post', NULL, '1', '0', '2022-01-14 14:24:03', '2022-01-14 14:39:37'),
(65, '61e187f68053c', 'post_comment', 12, NULL, 'users', 14, 'users', 11, 'post_comment', 'Streammii', 'Symonds comment on your post', NULL, '1', '0', '2022-01-14 14:25:58', '2022-01-14 14:39:37'),
(66, '61e1888a0e4ce', 'post_comment', 12, NULL, 'users', 14, 'users', 11, 'post_comment', 'Streammii', 'Symonds comment on your post', NULL, '1', '0', '2022-01-14 14:28:26', '2022-01-14 14:39:37'),
(67, '61e188b1712a4', 'post_comment', 12, NULL, 'users', 14, 'users', 11, 'post_comment', 'Streammii', 'Symonds comment on your post', NULL, '1', '0', '2022-01-14 14:29:05', '2022-01-14 14:39:37'),
(68, '61e188c1bf2fe', 'post_comment', 12, NULL, 'users', 14, 'users', 11, 'post_comment', 'Streammii', 'Symonds comment on your post', NULL, '1', '0', '2022-01-14 14:29:22', '2022-01-14 14:39:37'),
(69, '61e188e3b60af', 'post_dislike', 12, NULL, 'users', 14, 'users', 11, 'post_dislike', 'Streammii', 'Symonds disliked your video', NULL, '1', '1', '2022-01-14 14:29:56', '2022-01-14 14:39:37'),
(70, '61e192543e0e8', 'followers', 16, NULL, 'users', 15, 'users', 41, 'followers', 'Streammii', 'Ricky started following you', NULL, '1', '1', '2022-01-14 15:10:12', '2022-01-14 15:25:47'),
(71, '61e1930ec9d2d', 'post_like', 16, NULL, 'users', 15, 'users', 13, 'post_like', 'Streammii', 'Marcus liked your video', NULL, '1', '1', '2022-01-14 15:13:19', '2022-01-14 15:25:47'),
(72, '61e19342d0f71', 'post_comment', 16, NULL, 'users', 15, 'users', 13, 'post_comment', 'Streammii', 'Marcus comment on your post', NULL, '1', '1', '2022-01-14 15:14:11', '2022-01-14 15:25:47'),
(73, '61e193d6b9184', 'accepted_follow_request', 15, NULL, 'users', 16, 'users', 15, 'user_follow', 'Streammii', 'Ricky has accepted your request', NULL, '0', '0', '2022-01-14 15:16:38', NULL),
(74, '61e1948851a3b', 'post_dislike', 16, NULL, 'users', 15, 'users', 13, 'post_dislike', 'Streammii', 'Marcus disliked your video', NULL, '1', '1', '2022-01-14 15:19:36', '2022-01-14 15:25:47'),
(75, '61e1d42380d89', 'post_like', 17, NULL, 'users', 18, 'users', 14, 'post_like', 'Streammii', 'Jamal liked your audio', NULL, '1', '0', '2022-01-14 19:50:59', '2022-01-15 03:21:10'),
(76, '61e1d429eab17', 'post_comment', 17, NULL, 'users', 18, 'users', 14, 'post_comment', 'Streammii', 'Jamal comment on your post', NULL, '1', '0', '2022-01-14 19:51:06', '2022-01-15 03:21:10'),
(77, '61e1d44217a61', 'followers', 17, NULL, 'users', 18, 'users', 44, 'followers', 'Streammii', 'Jamal May started following you', NULL, '1', '0', '2022-01-14 19:51:30', '2022-01-15 03:21:10'),
(78, '61e1d45380401', 'followers', 17, NULL, 'users', 18, 'users', 45, 'followers', 'Streammii', 'Jamal May started following you', NULL, '1', '0', '2022-01-14 19:51:47', '2022-01-15 03:21:10'),
(79, '61e20cfd2375d', 'followers', 19, NULL, 'users', 18, 'users', 46, 'followers', 'Streammii', 'Jamal May started following you', NULL, '1', '1', '2022-01-14 23:53:33', '2022-01-15 03:21:10'),
(80, '61e20ed614e88', 'followers', 19, NULL, 'users', 18, 'users', 47, 'followers', 'Streammii', 'Jamal May started following you', NULL, '1', '0', '2022-01-15 00:01:26', '2022-01-15 03:21:10'),
(81, '61e20ef101d8c', 'followers', 19, NULL, 'users', 18, 'users', 48, 'followers', 'Streammii', 'Jamal May started following you', NULL, '1', '0', '2022-01-15 00:01:53', '2022-01-15 03:21:10'),
(82, '61e20f06d4542', 'followers', 19, NULL, 'users', 18, 'users', 49, 'followers', 'Streammii', 'Jamal May started following you', NULL, '1', '0', '2022-01-15 00:02:15', '2022-01-15 03:21:10'),
(83, '61e20fccaefff', 'post_dislike', 19, NULL, 'users', 18, 'users', 20, 'post_dislike', 'Streammii', 'Chloe disliked your video', NULL, '1', '1', '2022-01-15 00:05:32', '2022-01-15 03:21:10'),
(84, '61e2105248803', 'followers', 19, NULL, 'users', 18, 'users', 50, 'followers', 'Streammii', 'Jamal May started following you', NULL, '1', '0', '2022-01-15 00:07:46', '2022-01-15 03:21:10'),
(85, '61e2105d38e4a', 'post_like', 19, NULL, 'users', 18, 'users', 20, 'post_like', 'Streammii', 'Chloe liked your video', NULL, '1', '0', '2022-01-15 00:07:57', '2022-01-15 03:21:10'),
(86, '61e210609fb7b', 'post_like', 19, NULL, 'users', 18, 'users', 19, 'post_like', 'Streammii', 'Chloe liked your video', NULL, '1', '0', '2022-01-15 00:08:00', '2022-01-15 03:21:10'),
(87, '61e210620af1d', 'post_like', 19, NULL, 'users', 18, 'users', 18, 'post_like', 'Streammii', 'Chloe liked your video', NULL, '1', '0', '2022-01-15 00:08:02', '2022-01-15 03:21:10'),
(88, '61e2106464737', 'post_comment', 19, NULL, 'users', 18, 'users', 18, 'post_comment', 'Streammii', 'Chloe comment on your post', NULL, '1', '0', '2022-01-15 00:08:04', '2022-01-15 03:21:10'),
(89, '61e21b1002be4', 'post_like', 18, NULL, 'users', 19, 'users', 21, 'post_like', 'Streammii', 'Jamal May liked your video', NULL, '1', '0', '2022-01-15 00:53:36', '2022-01-15 02:54:41'),
(90, '61e21b111b2c8', 'post_dislike', 18, NULL, 'users', 19, 'users', 21, 'post_dislike', 'Streammii', 'Jamal May disliked your video', NULL, '1', '0', '2022-01-15 00:53:37', '2022-01-15 02:54:41'),
(91, '61e21c9e4493d', 'accepted_follow_request', 18, NULL, 'users', 19, 'users', 18, 'user_follow', 'Streammii', 'Jamal May has accepted your request', NULL, '1', '0', '2022-01-15 01:00:14', '2022-01-15 02:54:41'),
(92, '61e21d0ed6ed0', 'followers', 18, NULL, 'users', 19, 'users', 52, 'followers', 'Streammii', 'Chloe started following you', NULL, '1', '1', '2022-01-15 01:02:07', '2022-01-15 02:54:41'),
(93, '61e2221deabca', 'comment_like', 17, NULL, 'users', 18, 'users', 63, 'comment_like', 'Streammii', 'Jamal liked your comment', NULL, '1', '0', '2022-01-15 01:23:42', '2022-01-15 03:21:10'),
(94, '61e2221f22c84', 'comment_dislike', 17, NULL, 'users', 18, 'users', 30, 'comment_dislike', 'Streammii', 'Jamal liked your comment', NULL, '1', '0', '2022-01-15 01:23:43', '2022-01-15 03:21:10'),
(95, '61e22221a2b29', 'post_comment', 17, NULL, 'users', 18, 'users', 20, 'post_comment', 'Streammii', 'Jamal comment on your post', NULL, '1', '0', '2022-01-15 01:23:45', '2022-01-15 03:21:10'),
(96, '61e22224a3cdd', 'post_comment', 17, NULL, 'users', 18, 'users', 20, 'post_comment', 'Streammii', 'Jamal comment on your post', NULL, '1', '0', '2022-01-15 01:23:48', '2022-01-15 03:21:10'),
(97, '61e2222d7cb36', 'post_like', 17, NULL, 'users', 18, 'users', 20, 'post_like', 'Streammii', 'Jamal liked your video', NULL, '1', '0', '2022-01-15 01:23:57', '2022-01-15 03:21:10'),
(98, '61e2222e8ef20', 'post_dislike', 17, NULL, 'users', 18, 'users', 20, 'post_dislike', 'Streammii', 'Jamal disliked your video', NULL, '1', '0', '2022-01-15 01:23:58', '2022-01-15 03:21:10'),
(99, '61e222300b2ba', 'post_like', 17, NULL, 'users', 18, 'users', 19, 'post_like', 'Streammii', 'Jamal liked your video', NULL, '1', '0', '2022-01-15 01:24:00', '2022-01-15 03:21:10'),
(100, '61e222313a3dc', 'post_dislike', 17, NULL, 'users', 18, 'users', 19, 'post_dislike', 'Streammii', 'Jamal disliked your video', NULL, '1', '0', '2022-01-15 01:24:01', '2022-01-15 03:21:10'),
(101, '61e225953870d', 'post_like', 20, NULL, 'users', 19, 'users', 21, 'post_like', 'Streammii', 'Luka liked your video', NULL, '1', '0', '2022-01-15 01:38:29', '2022-01-15 02:54:41'),
(102, '61e225961c4c5', 'post_dislike', 20, NULL, 'users', 19, 'users', 21, 'post_dislike', 'Streammii', 'Luka disliked your video', NULL, '1', '0', '2022-01-15 01:38:30', '2022-01-15 02:54:41'),
(103, '61e22730a4e8d', 'accepted_follow_request', 19, NULL, 'users', 20, 'users', 19, 'user_follow', 'Streammii', 'Chloe has accepted your request', NULL, '1', '0', '2022-01-15 01:45:20', '2022-01-15 01:46:35'),
(104, '61e2274fbf382', 'post_like', 20, NULL, 'users', 19, 'users', 21, 'post_like', 'Streammii', 'Luka liked your video', NULL, '1', '0', '2022-01-15 01:45:52', '2022-01-15 02:54:41'),
(105, '61e557f1d2ae5', 'followers', 23, NULL, 'users', 24, 'users', 59, 'followers', 'Streammii', 'Simple navi started following you', NULL, '1', '1', '2022-01-17 11:50:10', '2022-07-07 12:44:09'),
(106, '61e55c04ce572', 'accepted_follow_request', 24, NULL, 'users', 25, 'users', 24, 'user_follow', 'Streammii', 'Simple navi has accepted your request', NULL, '1', '1', '2022-01-17 12:07:33', '2022-02-04 09:25:37'),
(107, '61e574e7afd51', 'post_comment', 25, NULL, 'users', 24, 'users', 24, 'post_comment', 'Streammii', 'Taco sk comment on your post', NULL, '1', '0', '2022-01-17 13:53:43', '2022-07-07 12:44:09'),
(108, '61e574f98c090', 'post_comment', 25, NULL, 'users', 24, 'users', 24, 'post_comment', 'Streammii', 'Taco sk comment on your post', NULL, '1', '0', '2022-01-17 13:54:01', '2022-07-07 12:44:09'),
(109, '61e57505618a6', 'post_comment', 25, NULL, 'users', 24, 'users', 24, 'post_comment', 'Streammii', 'Taco sk comment on your post', NULL, '1', '0', '2022-01-17 13:54:13', '2022-07-07 12:44:09'),
(110, '61e659dd2474b', 'accepted_follow_request', 24, NULL, 'users', 26, 'users', 24, 'user_follow', 'Streammii', 'Simple navi has accepted your request', NULL, '1', '1', '2022-01-18 06:10:37', '2022-01-19 07:19:52'),
(111, '61e6b02dc6579', 'post_comment', 26, NULL, 'users', 24, 'users', 24, 'post_comment', 'Streammii', 'Monesy navi comment on your post', NULL, '1', '0', '2022-01-18 12:18:54', '2022-07-07 12:44:09'),
(112, '61e6be9ef1940', 'accepted_follow_request', 27, NULL, 'users', 23, 'users', 27, 'user_follow', 'Streammii', 'fan new has accepted your request', NULL, '1', '0', '2022-01-18 13:20:31', '2022-01-26 10:44:39'),
(113, '61e7bb51c5534', 'accepted_follow_request', 26, NULL, 'users', 23, 'users', 26, 'user_follow', 'Streammii', 'Monesy navi has accepted your request', NULL, '1', '0', '2022-01-19 07:18:42', '2022-01-26 10:44:39'),
(114, '61e7bc35ed4f8', 'accepted_follow_request', 24, NULL, 'users', 27, 'users', 24, 'user_follow', 'Streammii', 'Simple navi has accepted your request', NULL, '1', '0', '2022-01-19 07:22:30', '2022-01-19 08:49:00'),
(115, '61f0e0a362b99', 'followers', 26, NULL, 'users', 23, 'users', 69, 'followers', 'Streammii', 'Bit navi started following you', NULL, '1', '0', '2022-01-26 05:48:19', '2022-01-26 10:44:39'),
(116, '62a341f7d93cb', 'followers', 35, 'John', 'users', 36, 'users', 72, 'followers', 'Streammii', 'Mia started following you', NULL, '1', '0', '2022-06-10 17:07:04', '2022-06-10 17:41:17'),
(117, '62a3443baa4e3', 'support_artist', 35, 'John', 'users', 36, 'users', 40, 'support_artist', 'Streammii', 'Mia user supported with 20 tokens.', NULL, '1', '0', '2022-06-10 17:16:43', '2022-06-10 17:41:17'),
(118, '62a3444d12d07', 'post_like', 35, 'John', 'users', 36, 'users', 40, 'post_like', 'Streammii', 'Mia liked your video', NULL, '1', '0', '2022-06-10 17:17:01', '2022-06-10 17:41:17'),
(119, '62a344546cd3a', 'post_comment', 35, 'John', 'users', 36, 'users', 40, 'post_comment', 'Streammii', 'Mia commented on your post', NULL, '1', '0', '2022-06-10 17:17:08', '2022-06-10 17:41:17'),
(125, '62c69ff714f35', 'post_like', 25, 'Taco', 'users', 24, 'users', 24, 'post_like', 'Streammii', 'Taco sk liked your video', NULL, '0', '0', '2022-07-07 12:57:27', NULL),
(126, '62c6a00cb6ace', 'post_like', 25, 'Taco', 'users', 24, 'users', 24, 'post_like', 'Streammii', 'Taco sk liked your video', NULL, '0', '0', '2022-07-07 12:57:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notification_setting`
--

CREATE TABLE `notification_setting` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_setting`
--

INSERT INTO `notification_setting` (`id`, `user_id`, `meta_key`, `meta_value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(25, 5, 'Message', 1, '2022-01-13 15:20:07', NULL, NULL),
(26, 5, 'Reactions', 1, '2022-01-13 15:20:07', NULL, NULL),
(27, 5, 'Comments', 1, '2022-01-13 15:20:07', NULL, NULL),
(28, 5, 'Tags', 1, '2022-01-13 15:20:07', NULL, NULL),
(29, 5, 'Follow_Requests', 1, '2022-01-13 15:20:07', NULL, NULL),
(30, 5, 'Received_Tokens', 1, '2022-01-13 15:20:07', NULL, NULL),
(31, 6, 'Message', 1, '2022-01-13 15:25:27', NULL, NULL),
(32, 6, 'Reactions', 1, '2022-01-13 15:25:27', NULL, NULL),
(33, 6, 'Comments', 1, '2022-01-13 15:25:27', NULL, NULL),
(34, 6, 'Tags', 1, '2022-01-13 15:25:27', NULL, NULL),
(35, 6, 'Follow_Requests', 1, '2022-01-13 15:25:27', NULL, NULL),
(36, 6, 'Received_Tokens', 1, '2022-01-13 15:25:27', NULL, NULL),
(37, 7, 'Message', 1, '2022-01-13 15:45:09', NULL, NULL),
(38, 7, 'Reactions', 1, '2022-01-13 15:45:09', NULL, NULL),
(39, 7, 'Comments', 1, '2022-01-13 15:45:09', NULL, NULL),
(40, 7, 'Tags', 1, '2022-01-13 15:45:09', NULL, NULL),
(41, 7, 'Follow_Requests', 1, '2022-01-13 15:45:09', NULL, NULL),
(42, 7, 'Received_Tokens', 1, '2022-01-13 15:45:09', NULL, NULL),
(43, 8, 'Message', 1, '2022-01-14 06:02:09', NULL, NULL),
(44, 8, 'Reactions', 1, '2022-01-14 06:02:09', NULL, NULL),
(45, 8, 'Comments', 1, '2022-01-14 06:02:09', NULL, NULL),
(46, 8, 'Tags', 1, '2022-01-14 06:02:09', NULL, NULL),
(47, 8, 'Follow_Requests', 1, '2022-01-14 06:02:09', NULL, NULL),
(48, 8, 'Received_Tokens', 1, '2022-01-14 06:02:09', NULL, NULL),
(49, 9, 'Message', 1, '2022-01-14 06:12:43', NULL, NULL),
(50, 9, 'Reactions', 1, '2022-01-14 06:12:43', NULL, NULL),
(51, 9, 'Comments', 1, '2022-01-14 06:12:43', NULL, NULL),
(52, 9, 'Tags', 1, '2022-01-14 06:12:43', NULL, NULL),
(53, 9, 'Follow_Requests', 1, '2022-01-14 06:12:43', NULL, NULL),
(54, 9, 'Received_Tokens', 1, '2022-01-14 06:12:43', NULL, NULL),
(55, 10, 'Message', 1, '2022-01-14 06:22:17', NULL, NULL),
(56, 10, 'Reactions', 1, '2022-01-14 06:22:17', NULL, NULL),
(57, 10, 'Comments', 1, '2022-01-14 06:22:17', NULL, NULL),
(58, 10, 'Tags', 1, '2022-01-14 06:22:17', NULL, NULL),
(59, 10, 'Follow_Requests', 1, '2022-01-14 06:22:17', NULL, NULL),
(60, 10, 'Received_Tokens', 1, '2022-01-14 06:22:17', NULL, NULL),
(61, 11, 'Message', 1, '2022-01-14 10:02:18', NULL, NULL),
(62, 11, 'Reactions', 1, '2022-01-14 10:02:18', NULL, NULL),
(63, 11, 'Comments', 1, '2022-01-14 10:02:18', NULL, NULL),
(64, 11, 'Tags', 1, '2022-01-14 10:02:18', NULL, NULL),
(65, 11, 'Follow_Requests', 1, '2022-01-14 10:02:18', NULL, NULL),
(66, 11, 'Received_Tokens', 1, '2022-01-14 10:02:18', NULL, NULL),
(67, 12, 'Message', 1, '2022-01-14 11:17:25', NULL, NULL),
(68, 12, 'Reactions', 1, '2022-01-14 11:17:25', NULL, NULL),
(69, 12, 'Comments', 1, '2022-01-14 11:17:25', NULL, NULL),
(70, 12, 'Tags', 1, '2022-01-14 11:17:25', NULL, NULL),
(71, 12, 'Follow_Requests', 1, '2022-01-14 11:17:25', NULL, NULL),
(72, 12, 'Received_Tokens', 1, '2022-01-14 11:17:25', NULL, NULL),
(73, 13, 'Message', 1, '2022-01-14 11:21:02', NULL, NULL),
(74, 13, 'Reactions', 1, '2022-01-14 11:21:02', NULL, NULL),
(75, 13, 'Comments', 1, '2022-01-14 11:21:02', NULL, NULL),
(76, 13, 'Tags', 1, '2022-01-14 11:21:02', NULL, NULL),
(77, 13, 'Follow_Requests', 1, '2022-01-14 11:21:02', NULL, NULL),
(78, 13, 'Received_Tokens', 1, '2022-01-14 11:21:02', NULL, NULL),
(79, 14, 'Message', 1, '2022-01-14 11:50:55', NULL, NULL),
(80, 14, 'Reactions', 1, '2022-01-14 11:50:55', NULL, NULL),
(81, 14, 'Comments', 1, '2022-01-14 11:50:55', NULL, NULL),
(82, 14, 'Tags', 1, '2022-01-14 11:50:55', NULL, NULL),
(83, 14, 'Follow_Requests', 1, '2022-01-14 11:50:55', NULL, NULL),
(84, 14, 'Received_Tokens', 1, '2022-01-14 11:50:55', NULL, NULL),
(85, 15, 'Message', 1, '2022-01-14 14:53:50', NULL, NULL),
(86, 15, 'Reactions', 1, '2022-01-14 14:53:50', NULL, NULL),
(87, 15, 'Comments', 1, '2022-01-14 14:53:50', NULL, NULL),
(88, 15, 'Tags', 1, '2022-01-14 14:53:50', NULL, NULL),
(89, 15, 'Follow_Requests', 1, '2022-01-14 14:53:50', NULL, NULL),
(90, 15, 'Received_Tokens', 1, '2022-01-14 14:53:50', NULL, NULL),
(91, 16, 'Message', 1, '2022-01-14 15:05:52', NULL, NULL),
(92, 16, 'Reactions', 1, '2022-01-14 15:05:52', NULL, NULL),
(93, 16, 'Comments', 1, '2022-01-14 15:05:52', NULL, NULL),
(94, 16, 'Tags', 1, '2022-01-14 15:05:52', NULL, NULL),
(95, 16, 'Follow_Requests', 1, '2022-01-14 15:05:52', NULL, NULL),
(96, 16, 'Received_Tokens', 1, '2022-01-14 15:05:52', NULL, NULL),
(97, 17, 'Message', 1, '2022-01-14 19:39:45', NULL, NULL),
(98, 17, 'Reactions', 1, '2022-01-14 19:39:45', NULL, NULL),
(99, 17, 'Comments', 1, '2022-01-14 19:39:45', NULL, NULL),
(100, 17, 'Tags', 1, '2022-01-14 19:39:45', NULL, NULL),
(101, 17, 'Follow_Requests', 1, '2022-01-14 19:39:45', NULL, NULL),
(102, 17, 'Received_Tokens', 1, '2022-01-14 19:39:45', NULL, NULL),
(103, 18, 'Message', 1, '2022-01-14 19:48:07', NULL, NULL),
(104, 18, 'Reactions', 1, '2022-01-14 19:48:07', NULL, NULL),
(105, 18, 'Comments', 1, '2022-01-14 19:48:07', NULL, NULL),
(106, 18, 'Tags', 1, '2022-01-14 19:48:07', NULL, NULL),
(107, 18, 'Follow_Requests', 1, '2022-01-14 19:48:07', NULL, NULL),
(108, 18, 'Received_Tokens', 1, '2022-01-14 19:48:07', NULL, NULL),
(109, 19, 'Message', 1, '2022-01-14 23:51:56', NULL, NULL),
(110, 19, 'Reactions', 1, '2022-01-14 23:51:56', NULL, NULL),
(111, 19, 'Comments', 1, '2022-01-14 23:51:56', NULL, NULL),
(112, 19, 'Tags', 1, '2022-01-14 23:51:56', NULL, NULL),
(113, 19, 'Follow_Requests', 1, '2022-01-14 23:51:56', NULL, NULL),
(114, 19, 'Received_Tokens', 1, '2022-01-14 23:51:56', NULL, NULL),
(115, 20, 'Message', 1, '2022-01-15 01:30:42', NULL, NULL),
(116, 20, 'Reactions', 1, '2022-01-15 01:30:42', NULL, NULL),
(117, 20, 'Comments', 1, '2022-01-15 01:30:42', NULL, NULL),
(118, 20, 'Tags', 1, '2022-01-15 01:30:42', NULL, NULL),
(119, 20, 'Follow_Requests', 1, '2022-01-15 01:30:42', NULL, NULL),
(120, 20, 'Received_Tokens', 1, '2022-01-15 01:30:42', NULL, NULL),
(121, 21, 'Message', 1, '2022-01-15 03:45:05', NULL, NULL),
(122, 21, 'Reactions', 1, '2022-01-15 03:45:05', NULL, NULL),
(123, 21, 'Comments', 1, '2022-01-15 03:45:05', NULL, NULL),
(124, 21, 'Tags', 1, '2022-01-15 03:45:05', NULL, NULL),
(125, 21, 'Follow_Requests', 1, '2022-01-15 03:45:05', NULL, NULL),
(126, 21, 'Received_Tokens', 1, '2022-01-15 03:45:05', NULL, NULL),
(127, 22, 'Message', 1, '2022-01-17 11:09:23', NULL, NULL),
(128, 22, 'Reactions', 1, '2022-01-17 11:09:23', NULL, NULL),
(129, 22, 'Comments', 1, '2022-01-17 11:09:23', NULL, NULL),
(130, 22, 'Tags', 1, '2022-01-17 11:09:23', NULL, NULL),
(131, 22, 'Follow_Requests', 1, '2022-01-17 11:09:23', NULL, NULL),
(132, 22, 'Received_Tokens', 1, '2022-01-17 11:09:23', NULL, NULL),
(133, 23, 'Message', 1, '2022-01-17 11:41:40', NULL, NULL),
(134, 23, 'Reactions', 1, '2022-01-17 11:41:40', NULL, NULL),
(135, 23, 'Comments', 1, '2022-01-17 11:41:40', NULL, NULL),
(136, 23, 'Tags', 1, '2022-01-17 11:41:40', NULL, NULL),
(137, 23, 'Follow_Requests', 1, '2022-01-17 11:41:40', NULL, NULL),
(138, 23, 'Received_Tokens', 1, '2022-01-17 11:41:40', NULL, NULL),
(145, 25, 'Message', 1, '2022-01-17 12:05:17', NULL, NULL),
(146, 25, 'Reactions', 1, '2022-01-17 12:05:17', NULL, NULL),
(147, 25, 'Comments', 1, '2022-01-17 12:05:17', NULL, NULL),
(148, 25, 'Tags', 1, '2022-01-17 12:05:17', NULL, NULL),
(149, 25, 'Follow_Requests', 1, '2022-01-17 12:05:17', NULL, NULL),
(150, 25, 'Received_Tokens', 1, '2022-01-17 12:05:17', NULL, NULL),
(151, 26, 'Message', 1, '2022-01-18 05:12:35', NULL, NULL),
(152, 26, 'Reactions', 1, '2022-01-18 05:12:35', NULL, NULL),
(153, 26, 'Comments', 1, '2022-01-18 05:12:35', NULL, NULL),
(154, 26, 'Tags', 1, '2022-01-18 05:12:35', NULL, NULL),
(155, 26, 'Follow_Requests', 1, '2022-01-18 05:12:35', NULL, NULL),
(156, 26, 'Received_Tokens', 1, '2022-01-18 05:12:35', NULL, NULL),
(163, 28, 'Message', 1, '2022-01-19 05:26:05', NULL, NULL),
(164, 28, 'Reactions', 1, '2022-01-19 05:26:05', NULL, NULL),
(165, 28, 'Comments', 1, '2022-01-19 05:26:05', NULL, NULL),
(166, 28, 'Tags', 1, '2022-01-19 05:26:05', NULL, NULL),
(167, 28, 'Follow_Requests', 1, '2022-01-19 05:26:05', NULL, NULL),
(168, 28, 'Received_Tokens', 1, '2022-01-19 05:26:05', NULL, NULL),
(273, 31, 'Reactions', 1, '2022-01-21 10:18:19', NULL, NULL),
(274, 31, 'Comments', 1, '2022-01-21 10:18:19', NULL, NULL),
(275, 31, 'Tags', 1, '2022-01-21 10:18:19', NULL, NULL),
(276, 31, 'Follow_Requests', 1, '2022-01-21 10:18:19', NULL, NULL),
(283, 29, 'Reactions', 1, '2022-01-21 10:19:35', NULL, NULL),
(284, 29, 'Comments', 1, '2022-01-21 10:19:35', NULL, NULL),
(285, 29, 'Tags', 1, '2022-01-21 10:19:35', NULL, NULL),
(286, 29, 'Follow_Requests', 1, '2022-01-21 10:19:35', NULL, NULL),
(287, 29, 'Received_Tokens', 0, '2022-01-21 10:19:35', NULL, NULL),
(288, 29, 'Message', 0, '2022-01-21 10:19:35', NULL, NULL),
(289, 32, 'Reactions', 1, '2022-01-25 11:50:11', NULL, NULL),
(290, 32, 'Comments', 1, '2022-01-25 11:50:11', NULL, NULL),
(291, 32, 'Tags', 1, '2022-01-25 11:50:11', NULL, NULL),
(292, 32, 'Follow_Requests', 1, '2022-01-25 11:50:11', NULL, NULL),
(293, 24, 'Message', 1, '2022-02-10 11:20:38', NULL, NULL),
(294, 24, 'Reactions', 1, '2022-02-10 11:20:38', NULL, NULL),
(295, 24, 'Comments', 1, '2022-02-10 11:20:38', NULL, NULL),
(296, 24, 'Tags', 1, '2022-02-10 11:20:38', NULL, NULL),
(297, 24, 'Follow_Requests', 1, '2022-02-10 11:20:38', NULL, NULL),
(298, 24, 'Received_Tokens', 1, '2022-02-10 11:20:38', NULL, NULL),
(299, 33, 'Reactions', 1, '2022-06-10 16:58:04', NULL, NULL),
(300, 33, 'Comments', 1, '2022-06-10 16:58:04', NULL, NULL),
(301, 33, 'Tags', 1, '2022-06-10 16:58:04', NULL, NULL),
(302, 33, 'Follow_Requests', 1, '2022-06-10 16:58:04', NULL, NULL),
(303, 34, 'Reactions', 1, '2022-06-10 17:00:11', NULL, NULL),
(304, 34, 'Comments', 1, '2022-06-10 17:00:11', NULL, NULL),
(305, 34, 'Tags', 1, '2022-06-10 17:00:11', NULL, NULL),
(306, 34, 'Follow_Requests', 1, '2022-06-10 17:00:11', NULL, NULL),
(307, 35, 'Reactions', 1, '2022-06-10 17:02:28', NULL, NULL),
(308, 35, 'Comments', 1, '2022-06-10 17:02:28', NULL, NULL),
(309, 35, 'Tags', 1, '2022-06-10 17:02:28', NULL, NULL),
(310, 35, 'Follow_Requests', 1, '2022-06-10 17:02:28', NULL, NULL),
(311, 36, 'Reactions', 1, '2022-06-10 17:04:46', NULL, NULL),
(312, 36, 'Comments', 1, '2022-06-10 17:04:46', NULL, NULL),
(313, 36, 'Tags', 1, '2022-06-10 17:04:46', NULL, NULL),
(314, 36, 'Follow_Requests', 1, '2022-06-10 17:04:46', NULL, NULL),
(315, 36, 'Received_Tokens', 1, '2022-06-10 17:04:46', NULL, NULL),
(316, 36, 'Messages', 1, '2022-06-10 17:04:46', NULL, NULL),
(317, 37, 'Reactions', 1, '2022-06-30 13:58:52', NULL, NULL),
(318, 37, 'Comments', 1, '2022-06-30 13:58:52', NULL, NULL),
(319, 37, 'Tags', 1, '2022-06-30 13:58:52', NULL, NULL),
(320, 37, 'Follow_Requests', 1, '2022-06-30 13:58:52', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `driver` enum('local','s3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `latitude` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_file` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_thumbnail_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_type` enum('audio','video') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'audio',
  `post_status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `total_comment` int(11) NOT NULL DEFAULT '0',
  `total_like` int(11) NOT NULL DEFAULT '0',
  `total_votes` int(11) NOT NULL DEFAULT '0',
  `post_identify` enum('normal_post','auto_generated_post') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal_post',
  `support_coin` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `post_meta_data` text COLLATE utf8mb4_unicode_ci,
  `total_dislike` int(11) NOT NULL DEFAULT '0',
  `total_token` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `description`, `slug`, `post_type`, `driver`, `latitude`, `longitude`, `address`, `media_file`, `media_thumbnail_url`, `media_type`, `post_status`, `status`, `total_comment`, `total_like`, `total_votes`, `post_identify`, `support_coin`, `created_at`, `updated_at`, `deleted_at`, `post_meta_data`, `total_dislike`, `total_token`) VALUES
(7, 5, NULL, NULL, '51642141264', 'video', 'local', NULL, NULL, 'Dallas', '/storage/media-files/DX82sO0s0YeeSIhG8cz1MrRIc3BVRjVQhHmNaBxS.mp4', '/storage/media-files/DX82sO0s0YeeSIhG8cz1MrRIc3BVRjVQhHmNaBxS.jpg', 'video', NULL, '1', 10, 0, 0, 'normal_post', 0, '2022-01-14 06:21:06', '2022-01-14 14:49:19', '2022-01-14 14:49:19', '{\"height\":1920,\"width\":1080,\"size\":14970574}', 0, 0),
(8, 5, NULL, NULL, '51642146883', 'video', 'local', NULL, NULL, 'Sydney Opera House', '/storage/media-files/W9RvpiTDzhCiCnlNSNUGTVb79FYgclairjUzYk6y.mp4', '/storage/media-files/W9RvpiTDzhCiCnlNSNUGTVb79FYgclairjUzYk6y.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-01-14 07:54:47', '2022-01-14 14:49:14', '2022-01-14 14:49:14', '{\"height\":1920,\"width\":1080,\"size\":14970574}', 0, 0),
(9, 5, NULL, NULL, '51642147014', 'video', 'local', NULL, NULL, 'Melbourne', '/storage/media-files/uA9B7cR2bBxM16GgG1ZkoHyYLWrENhoLiKds6F9c.mp4', '/storage/media-files/uA9B7cR2bBxM16GgG1ZkoHyYLWrENhoLiKds6F9c.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-01-14 07:56:55', '2022-01-14 07:57:51', '2022-01-14 07:57:51', '{\"height\":480,\"width\":640,\"size\":10530208}', 0, 0),
(10, 5, NULL, NULL, '51642147260', 'video', 'local', NULL, NULL, 'null', '/storage/media-files/TgwtuAAzJ38OnTVHXXOBLIsRfaIiSQENFo7djBqD.mp4', '/storage/media-files/TgwtuAAzJ38OnTVHXXOBLIsRfaIiSQENFo7djBqD.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-01-14 08:01:02', '2022-01-14 14:49:10', '2022-01-14 14:49:10', '{\"height\":480,\"width\":640,\"size\":10530208}', 0, 0),
(11, 14, 'Test post', NULL, '141642161335', 'video', 'local', NULL, NULL, 'Dallas/Fort Worth International Airport', '/storage/media-files/54zeYhLcembzJqft86kFRXjiFndxFcUvWnagQTes.mp4', '/storage/media-files/54zeYhLcembzJqft86kFRXjiFndxFcUvWnagQTes.jpg', 'video', NULL, '1', 10, 0, 0, 'normal_post', 0, '2022-01-14 11:55:38', '2022-01-14 14:39:30', '2022-01-14 14:39:30', '{\"height\":568,\"width\":320,\"size\":339548}', 2, 0),
(13, 15, NULL, NULL, '151642172132', 'video', 'local', NULL, NULL, 'New York', '/storage/media-files/KMUjOMQkk0jTjMCOTLd9617r4vLSESHOn0AQ9zqh.mp4', '/storage/media-files/KMUjOMQkk0jTjMCOTLd9617r4vLSESHOn0AQ9zqh.jpg', 'video', NULL, '1', 3, 0, 0, 'normal_post', 0, '2022-01-14 14:55:33', '2022-01-14 15:31:16', '2022-01-14 15:31:16', '{\"height\":1920,\"width\":1080,\"size\":14970574}', 1, 0),
(14, 18, 'Lets see', NULL, '181642189791', 'audio', 'local', NULL, NULL, 'null', '/storage/media-files/2Lb7tDgExo9fyaGhBrV6VZJgEG6LEoNf7lsogBeN.mp3', NULL, 'audio', NULL, '1', 1, 2, 0, 'normal_post', 0, '2022-01-14 19:49:51', '2022-01-14 19:49:51', NULL, '{\"size\":135426}', 0, 0),
(15, 18, 'Litttttrrrr', NULL, '181642203733', 'video', 'local', NULL, NULL, 'Dallas', '/storage/media-files/bzIfAxD7AuNX300lhHYcIrA92z9qjefHIK11wvGG.mp4', '/storage/media-files/bzIfAxD7AuNX300lhHYcIrA92z9qjefHIK11wvGG.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-01-14 23:42:14', '2022-01-14 23:42:14', NULL, '{\"height\":480,\"width\":260,\"size\":1399029}', 0, 0),
(16, 18, 'Kevin durant', NULL, '181642203767', 'audio', 'local', NULL, NULL, 'New York', '/storage/media-files/bTInigbDrpda5ei0fdjCTqcdw7YHZlGJPPOEbdrR.mp3', NULL, 'audio', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-01-14 23:42:47', '2022-01-15 00:54:27', NULL, '{\"size\":3315900}', 0, 0),
(17, 18, 'Chl', NULL, '181642203805', 'video', 'local', NULL, NULL, 'null', '/storage/media-files/nqZ4RIieD55w5YZU1Menmli4qzCTYadNJAN7ieKd.mp4', '/storage/media-files/nqZ4RIieD55w5YZU1Menmli4qzCTYadNJAN7ieKd.jpg', 'video', NULL, '1', 0, 1, 0, 'normal_post', 0, '2022-01-14 23:43:25', '2022-01-14 23:43:25', NULL, '{\"height\":480,\"width\":256,\"size\":611383}', 0, 0),
(18, 18, NULL, NULL, '181642203819', 'video', 'local', NULL, NULL, 'null', '/storage/media-files/hbeygRv7uqE2Q9ahlGCW5LEaWlZI2uSII97VGLlB.mp4', '/storage/media-files/hbeygRv7uqE2Q9ahlGCW5LEaWlZI2uSII97VGLlB.jpg', 'video', NULL, '1', 1, 1, 0, 'normal_post', 0, '2022-01-14 23:43:39', '2022-01-14 23:43:39', NULL, '{\"height\":480,\"width\":480,\"size\":466016}', 0, 0),
(19, 18, NULL, NULL, '181642203842', 'video', 'local', NULL, NULL, 'null', '/storage/media-files/8tg7gUjnfznVZVjyTnbebnOY3ZPRs9EUFJEHYCdP.mp4', '/storage/media-files/8tg7gUjnfznVZVjyTnbebnOY3ZPRs9EUFJEHYCdP.jpg', 'video', NULL, '1', 0, 1, 0, 'normal_post', 0, '2022-01-14 23:44:02', '2022-01-14 23:44:02', NULL, '{\"height\":568,\"width\":320,\"size\":1241609}', 1, 0),
(20, 18, 'Kyrie irving', NULL, '181642203862', 'video', 'local', NULL, NULL, 'Dallas', '/storage/media-files/Xetu9C6lgvZXpYCY1mfZHD0WuSjQrJzu7aZK6d8p.mp4', '/storage/media-files/Xetu9C6lgvZXpYCY1mfZHD0WuSjQrJzu7aZK6d8p.jpg', 'video', NULL, '1', 5, 2, 0, 'normal_post', 0, '2022-01-14 23:44:22', '2022-01-15 00:54:13', NULL, '{\"height\":568,\"width\":320,\"size\":1524908}', 1, 0),
(21, 19, 'Hey', NULL, '191642205319', 'video', 'local', NULL, NULL, 'null', '/storage/media-files/zYSlLdGrfioqcc9CGdqwnepQh6qiqbevQOl8rQfA.mp4', '/storage/media-files/zYSlLdGrfioqcc9CGdqwnepQh6qiqbevQOl8rQfA.jpg', 'video', NULL, '1', 0, 1, 0, 'normal_post', 0, '2022-01-15 00:08:39', '2022-01-15 00:08:48', NULL, '{\"height\":568,\"width\":320,\"size\":608647}', 1, 0),
(22, 24, 'My first post', NULL, '241642420024', 'video', 'local', NULL, NULL, 'Della Resorts', '/storage/media-files/J3LHpRv7U1tGJTqj9hYtPkcjT8jyS0qV03dGjl3Y.mp4', '/storage/media-files/J3LHpRv7U1tGJTqj9hYtPkcjT8jyS0qV03dGjl3Y.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 600, '2022-01-17 11:47:06', '2022-02-03 07:41:45', NULL, '{\"height\":320,\"width\":568,\"size\":2788571}', 0, 0),
(23, 24, NULL, NULL, '241642422037', 'video', 'local', NULL, NULL, 'Della Resorts', '/storage/media-files/4J1pk4DkEyCg2ZhozZdgWPdiY1iZuBCL5gstir8m.mp4', '/storage/media-files/4J1pk4DkEyCg2ZhozZdgWPdiY1iZuBCL5gstir8m.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-01-17 12:20:38', '2022-01-17 12:24:10', '2022-01-17 12:24:10', '{\"height\":240,\"width\":320,\"size\":5479246}', 0, 0),
(24, 24, 'Asxaxsasx', NULL, '241642422375', 'video', 'local', NULL, NULL, 'San Francisco', '/storage/media-files/2rdzzwjMlRo0p6SCktEVCZhrhyNQLlpypqswkylY.mp4', '/storage/media-files/2rdzzwjMlRo0p6SCktEVCZhrhyNQLlpypqswkylY.jpg', 'video', NULL, '1', 6, 2, 0, 'normal_post', 750, '2022-01-17 12:26:15', '2022-01-26 06:45:13', NULL, '{\"height\":240,\"width\":320,\"size\":5479287}', 0, 0),
(25, 25, 'Taco sk support Simple navi with 100 token ', NULL, NULL, 'support', 'local', NULL, NULL, NULL, NULL, NULL, 'audio', NULL, '1', 0, 0, 0, 'auto_generated_post', 0, '2022-01-25 11:42:32', '2022-01-25 11:42:32', NULL, NULL, 0, 0),
(26, 25, 'Taco sk support Simple navi with 20 token ', NULL, NULL, 'support', 'local', NULL, NULL, NULL, NULL, NULL, 'audio', NULL, '1', 0, 0, 0, 'auto_generated_post', 0, '2022-01-25 11:47:12', '2022-01-25 11:47:12', NULL, NULL, 0, 0),
(27, 32, 'fan support Simple navi with 400 token ', NULL, NULL, 'support', 'local', NULL, NULL, NULL, NULL, NULL, 'audio', NULL, '1', 0, 0, 0, 'auto_generated_post', 0, '2022-01-25 11:51:46', '2022-01-25 11:51:46', NULL, NULL, 0, 0),
(28, 25, 'Taco sk support Simple navi with 100 token ', NULL, NULL, 'support', 'local', NULL, NULL, NULL, NULL, NULL, 'audio', NULL, '1', 0, 0, 0, 'auto_generated_post', 0, '2022-01-25 12:03:47', '2022-01-25 12:03:47', NULL, NULL, 0, 0),
(29, 25, 'Taco sk support Simple navi with 100 token ', NULL, NULL, 'support', 'local', NULL, NULL, NULL, NULL, NULL, 'audio', NULL, '1', 5, 0, 0, 'auto_generated_post', 0, '2022-01-25 12:10:18', '2022-01-25 12:10:18', NULL, NULL, 1, 0),
(30, 25, 'Taco sk support Simple navi with 100 token ', NULL, NULL, 'support', 'local', NULL, NULL, NULL, NULL, NULL, 'audio', NULL, '1', 0, 0, 0, 'auto_generated_post', 0, '2022-01-25 12:11:45', '2022-01-25 12:11:45', NULL, NULL, 0, 0),
(31, 25, 'Taco sk support Simple navi with 10 token ', NULL, NULL, 'support', 'local', NULL, NULL, NULL, NULL, NULL, 'audio', NULL, '1', 0, 0, 0, 'auto_generated_post', 0, '2022-01-25 12:17:57', '2022-01-25 12:17:57', NULL, NULL, 1, 0),
(32, 23, 'Bit navi support Simple navi with 100 token ', NULL, NULL, 'support', 'local', NULL, NULL, NULL, NULL, NULL, 'audio', NULL, '1', 0, 0, 0, 'auto_generated_post', 0, '2022-01-25 12:59:39', '2022-01-25 12:59:39', NULL, NULL, 0, 0),
(33, 23, 'Bit navi support Simple navi with 100 token ', NULL, NULL, 'support', 'local', NULL, NULL, NULL, NULL, NULL, 'audio', NULL, '1', 0, 0, 0, 'auto_generated_post', 0, '2022-01-26 06:33:51', '2022-01-26 06:33:51', NULL, NULL, 0, 0),
(34, 23, 'Bit navi support Simple navi with 10 token ', NULL, NULL, 'support', 'local', NULL, NULL, NULL, NULL, NULL, 'audio', NULL, '1', 0, 0, 0, 'auto_generated_post', 0, '2022-01-26 06:42:30', '2022-01-26 06:42:30', NULL, NULL, 0, 0),
(35, 23, 'Bit navi support Simple navi with 10 token ', NULL, NULL, 'support', 'local', NULL, NULL, NULL, NULL, NULL, 'audio', NULL, '1', 0, 0, 0, 'auto_generated_post', 0, '2022-01-26 06:43:07', '2022-01-26 06:43:07', NULL, NULL, 0, 0),
(36, 23, 'Bit navi support Simple navi with 100 token ', NULL, NULL, 'support', 'local', NULL, NULL, NULL, NULL, NULL, 'audio', NULL, '1', 0, 0, 0, 'auto_generated_post', 0, '2022-01-26 06:44:30', '2022-01-26 06:44:30', NULL, NULL, 0, 0),
(37, 23, 'Bit navi support Simple navi with 100 token ', NULL, NULL, 'support', 'local', NULL, NULL, NULL, NULL, NULL, 'audio', NULL, '1', 0, 0, 0, 'auto_generated_post', 0, '2022-01-26 06:45:13', '2022-01-26 06:45:13', NULL, NULL, 0, 0),
(38, 25, 'Taco sk support Simple navi with 100 token ', NULL, NULL, 'support', 'local', NULL, NULL, NULL, NULL, NULL, 'audio', NULL, '1', 0, 0, 0, 'auto_generated_post', 0, '2022-02-03 07:41:45', '2022-02-03 07:41:45', NULL, NULL, 0, 0),
(39, 24, 'Hello', NULL, '241644491838', 'video', 'local', NULL, NULL, 'Asheville', '/tmp/phpGlYtmM', NULL, 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-02-10 11:17:18', '2022-07-08 08:46:13', '2022-07-08 12:46:13', '{\"height\":320,\"width\":568,\"size\":2788571}', 0, 0),
(40, 36, 'My first post', NULL, '361654866390', 'video', 'local', NULL, NULL, 'null', '/storage/media-files/Xw5oUmDGVvFBU1MCJSLKXkZIahupHbe1fJarpj2I.mp4', '/storage/media-files/Xw5oUmDGVvFBU1MCJSLKXkZIahupHbe1fJarpj2I.jpg', 'video', NULL, '1', 1, 1, 0, 'normal_post', 20, '2022-06-10 13:06:30', '2022-06-10 13:16:43', NULL, '{\"height\":320,\"width\":568,\"size\":2788571}', 0, 0),
(41, 35, 'Mia support Simple with 20 token ', NULL, NULL, 'support', 'local', NULL, NULL, NULL, NULL, NULL, 'audio', NULL, '1', 0, 0, 0, 'auto_generated_post', 0, '2022-06-10 13:16:43', '2022-06-10 13:16:43', NULL, NULL, 0, 0),
(42, 36, 'Second post', NULL, '361654868235', 'video', 'local', NULL, NULL, 'null', '/storage/media-files/CA1nubl298nNmvoipbLX9vgkzmeMkiikfWm49mH3.mp4', '/storage/media-files/CA1nubl298nNmvoipbLX9vgkzmeMkiikfWm49mH3.jpg', 'video', NULL, '1', 2, 1, 0, 'normal_post', 0, '2022-06-10 13:37:16', '2022-06-10 13:41:11', '2022-06-10 17:41:11', '{\"height\":268,\"width\":480,\"size\":2873131}', 1, 0),
(43, 36, 'New post', NULL, '361654868554', 'video', 'local', NULL, NULL, 'null', '/storage/media-files/Ha4jdICybKCliuennyKo0NxZ52Y2QVFQeSjzQafu.mp4', '/storage/media-files/Ha4jdICybKCliuennyKo0NxZ52Y2QVFQeSjzQafu.jpg', 'video', NULL, '1', 1, 0, 0, 'normal_post', 0, '2022-06-10 13:42:35', '2022-06-10 13:43:01', '2022-06-10 23:30:43', '{\"height\":268,\"width\":480,\"size\":2873131}', 1, 0),
(47, 37, 'latest', NULL, '371657006498', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/6XRWb5q8BddoIA8cxvoFl1DLXFFXafx0mtMA3MQF.mp4', 'post/165700649962c3e9a3cd94e.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 07:35:00', '2022-07-05 07:35:00', NULL, 'post_meta_data', 0, 0),
(48, 37, 'latest', NULL, '371657006531', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/OBDPOQfadNNodb0HPjuzXGE1XpezFJdTtS6FogjY.mp4', 'post/165700653362c3e9c51ebf3.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 07:35:33', '2022-07-05 07:35:33', NULL, 'post_meta_data', 0, 0),
(49, 37, 'latest', NULL, '371657006552', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/svh8eli6auBSgtj3k9eidpvGFhdOafAEqUzpkePl.mp4', 'post/165700655362c3e9d9e0604.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 07:35:54', '2022-07-05 07:35:54', NULL, 'post_meta_data', 0, 0),
(50, 37, 'latest', NULL, '371657007018', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/grqwaWWiYMNS1ySYb02pcMceOfpTG5iwYIkTJ5kT.mp4', 'post/165700702062c3ebac9dd23.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 07:43:41', '2022-07-05 07:43:41', NULL, 'post_meta_data', 0, 0),
(51, 37, 'latest', NULL, '371657007047', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/ury0PH9BIpBG6Hr0svG8ooSnA8ewoQIC9dnQnSdI.mp4', 'post/165700704962c3ebc950136.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 07:44:09', '2022-07-05 07:44:09', NULL, 'post_meta_data', 0, 0),
(52, 37, 'latest', NULL, '371657007097', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/Vr5RShFcfpTUtDMVxusxrMb6ojNzSs75M0VDEvK5.mp4', 'post/165700709962c3ebfb79d3f.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 07:44:59', '2022-07-05 07:44:59', NULL, 'post_meta_data', 0, 0),
(53, 37, 'latest', NULL, '371657007107', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/OOSfH0qu2oucGpXMWZY9d4ySO99kDWWMW0DgGGaQ.mp4', 'post/165700710962c3ec057c454.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 07:45:09', '2022-07-05 07:45:09', NULL, 'post_meta_data', 0, 0),
(54, 37, 'latest', NULL, '371657007192', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/x0K16r812RytrERzmq8fyVHSosehC7PDOPsMX0xG.mp4', 'post/165700719462c3ec5a44269.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 07:46:34', '2022-07-05 07:46:34', NULL, 'post_meta_data', 0, 0),
(55, 37, 'latest', NULL, '371657007233', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/Zrr3fFaYcIoG9RmksC6i7lSjst71tiGthGDk4HBO.mp4', 'post/165700723562c3ec836642a.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 07:47:15', '2022-07-05 07:47:15', NULL, 'post_meta_data', 0, 0),
(56, 37, 'latest', NULL, '371657007517', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/sBcpWFcefJU7JVuwa1xy29GXaGAymIOBeEemcDtC.mp4', 'post/165700751862c3ed9eccfdd.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 07:51:59', '2022-07-05 07:51:59', NULL, 'post_meta_data', 0, 0),
(57, 37, 'latest', NULL, '371657007536', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/wc2HRVz4i6axXZoktJvebsJ9BVUjF8MZt6ylhTgv.mp4', 'post/165700753762c3edb1e5311.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 07:52:18', '2022-07-05 07:52:18', NULL, 'post_meta_data', 0, 0),
(58, 37, 'latest', NULL, '371657007609', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/xMFZih8XrUoNQG77c6XRBPHq3pPeV5Kl8nnlewlX.mp4', 'post/165700761062c3edfac8b17.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 07:53:31', '2022-07-05 07:53:31', NULL, 'post_meta_data', 0, 0),
(59, 37, 'latest', NULL, '371657007649', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/edCAwE3kB849zteWTO9GNgytUhc9S12rPhtTwCjR.mp4', 'post/165700765062c3ee229e398.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 07:54:11', '2022-07-05 07:54:11', NULL, 'post_meta_data', 0, 0),
(60, 37, 'latest', NULL, '371657007660', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/w9bVSMj7PUVWB3pD4smINhlLQ3R4G4kWPTIadtjr.mp4', 'post/165700766262c3ee2e1a95a.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 07:54:22', '2022-07-05 07:54:22', NULL, 'post_meta_data', 0, 0),
(61, 37, 'latest', NULL, '371657007672', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/sL3OcvUyHPmemZVvzZZHTifLKNOPhqiMxhQqyox5.mp4', 'post/165700767362c3ee39daae0.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 07:54:34', '2022-07-05 07:54:34', NULL, 'post_meta_data', 0, 0),
(62, 37, 'latest', NULL, '371657008126', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/SU4IkRZQSOk9uiKm91b0XxdC8YMpC4KD0Fs7Bpyf.mp4', 'post/165700812862c3f00066588.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 08:02:08', '2022-07-05 08:02:08', NULL, 'post_meta_data', 0, 0),
(63, 37, 'latest', NULL, '371657018762', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/iTKKYSITd3rSF3j4rUfi58hZMHo3TiQ88bypA5xL.mp4', 'post/165701876462c4198c47b90.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 10:59:24', '2022-07-05 10:59:24', NULL, 'post_meta_data', 0, 0),
(64, 37, 'latest', NULL, '371657018874', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/bKjT6HAknm66orZop8LPasGa401AjICN0xVgOVNC.mp4', 'post/165701887562c419fbb81c6.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 11:01:16', '2022-07-05 11:01:16', NULL, 'post_meta_data', 0, 0),
(65, 37, 'latest', NULL, '371657019121', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/C5mod4BIKJkjXf96ma5ooLbWFnsS1kmYj7YkKNEr.mp4', 'post/165701912362c41af3a99d7.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 11:05:24', '2022-07-05 11:05:24', NULL, 'post_meta_data', 0, 0),
(66, 37, 'latest', NULL, '371657019410', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/O2iE2QDrLjjjVVUXD2ohtgbvvHog7EwkNhX1qks4.mp4', 'post/165701941162c41c13b494e.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 11:10:12', '2022-07-05 11:10:12', NULL, 'post_meta_data', 0, 0),
(67, 37, 'latest', NULL, '371657019608', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/Q4b36sJMi3Um9YRh1QYh7Sk6f9v8lRH19g7vcTeJ.mp4', 'post/165701960962c41cd9ef34b.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 11:13:30', '2022-07-05 11:13:30', NULL, 'post_meta_data', 0, 0),
(68, 37, 'latest', NULL, '371657019658', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/hel482U4DA0f5aWQf47hdmH4UMmODzHCeIKAsqPy.mp4', 'post/165701966062c41d0c754c5.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 11:14:20', '2022-07-05 11:14:20', NULL, 'post_meta_data', 0, 0),
(69, 37, 'latest', NULL, '371657019687', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/YF6bG9klJTmPPYLQ1L5BVM8emCzrI1u5SBT3xtf9.mp4', 'post/165701968962c41d291ddb2.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 11:14:49', '2022-07-05 11:14:49', NULL, 'post_meta_data', 0, 0),
(70, 37, 'latest', NULL, '371657019787', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/86U6r4VY1nbyOF7KfsEKIxf34UkJB4D187WeuouU.mp4', 'post/165701978962c41d8d20981.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 11:16:29', '2022-07-05 11:16:29', NULL, 'post_meta_data', 0, 0),
(71, 37, 'latest', NULL, '371657019859', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/MKW0MBl7TxOVsTtIziLUAgSIIryOroKF809UVchS.mp4', 'post/165701986062c41dd4ce982.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 11:17:41', '2022-07-05 11:17:41', NULL, 'post_meta_data', 0, 0),
(72, 37, 'latest', NULL, '371657019891', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/hjndqnAtKIRjScCIYTiSj7dBiMrXkHvXpOCvOlqD.mp4', 'post/165701989362c41df543e00.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 11:18:13', '2022-07-05 11:18:13', NULL, 'post_meta_data', 0, 0),
(73, 37, 'latest', NULL, '371657019951', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/pHIbQ66sDM2QDAYDo5riFaTkVxBAJOUIRiYDBrMs.mp4', 'post/165701995362c41e310003d.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 11:19:13', '2022-07-05 11:19:13', NULL, 'post_meta_data', 0, 0),
(74, 37, 'latest', NULL, '371657021044', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/hBCIHy4yKW3pUuKH42qVeSrB83KMsK1QZXWPbSiM.mp4', 'post/165702104662c42276180b6.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 11:37:26', '2022-07-05 11:37:26', NULL, 'post_meta_data', 0, 0),
(75, 37, 'latest', NULL, '371657021348', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/bhUQoewJTASQJhY3voqtwJm7ace00KwRUyx6zzll.mp4', NULL, 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 11:42:29', '2022-07-05 11:42:29', NULL, 'post_meta_data', 0, 0),
(76, 37, 'latest', NULL, '371657021557', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/Q2FgcoFAcmGy9dNYO9hWuBm92dpWueSKccQr9IWK.mp4', NULL, 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 11:45:58', '2022-07-05 11:45:58', NULL, 'post_meta_data', 0, 0),
(77, 37, 'latest', NULL, '371657021648', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/CyTxdd7yJDgfdKZZsmVT2ULuk6cMB23VD2iuJ34x.mp4', 'post/165702164962c424d1905b9.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 11:47:29', '2022-07-05 11:47:29', NULL, 'post_meta_data', 0, 0),
(78, 37, 'latest', NULL, '371657021756', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/GtyHUVDgSFpD81YfaTCY4wX7hgVjRmeEEm82nrrF.mp4', 'post/165702175862c4253e19079.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 11:49:18', '2022-07-05 11:49:18', NULL, 'post_meta_data', 0, 0),
(79, 37, 'latest', NULL, '371657021800', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/OaLX2OBwaKMqde6hmVvlITZcB80qocrR5Bx4pAD6.mp4', 'post/165702180162c42569c6ce0.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 11:50:02', '2022-07-05 11:50:02', NULL, 'post_meta_data', 0, 0),
(80, 37, 'latest', NULL, '371657021818', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/A9Az7watnvCGAEek0hnbxdQ7VoagkX6wAz2oOuAt.mp4', 'post/165702182062c4257c4dde5.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 11:50:20', '2022-07-05 11:50:20', NULL, 'post_meta_data', 0, 0),
(81, 37, 'latest', NULL, '371657021831', 'adsfasdfasdf', 's3', '12456', '123456', 'address address address', 'media-files/IQijp1W2UoNFd2yaK2jTDwD1Zo3Vj5Fr8yq5VGYt.mp4', 'post/165702183362c4258976d66.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-05 11:50:33', '2022-07-05 11:50:33', NULL, 'post_meta_data', 0, 0),
(82, 24, 'Anime', NULL, '241657624871', 'video', 's3', NULL, NULL, 'null', 'media-files/3QPiwWCp2UPPr7sNHqWyLablOzd7EmEiyBJqdmlX.mp4', 'post/165762487362cd5929bd63b.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-12 11:21:14', '2022-07-12 11:21:14', NULL, '{\"height\":268,\"width\":480,\"size\":2873131}', 0, 0),
(83, 24, 'World', NULL, '241657689306', 'video', 's3', NULL, NULL, 'null', 'media-files/Po5TRflK8n7hZEEcBpLOBUnCltkAJ3TWgag17MQw.mp4', 'post/165768930862ce54dc37002.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-13 05:15:08', '2022-07-13 05:15:08', NULL, '{\"height\":320,\"width\":568,\"size\":2788571}', 0, 0),
(84, 24, 'Hiii', NULL, '241657689408', 'video', 's3', NULL, NULL, 'null', 'media-files/Dfxyqe4rhkMT0fAEUMe5jED4WkWKXinnAPfSSsI5.mp4', 'post/165768941062ce554270078.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-13 05:16:50', '2022-07-13 05:22:00', '2022-07-13 09:22:00', '{\"height\":240,\"width\":320,\"size\":5479366}', 0, 0),
(85, 24, 'asd', NULL, '241657689575', 'video', 's3', NULL, NULL, 'null', 'media-files/F4PY9j5qWMmlbLriyUuXb6XPxIzVr0Cql2PkFTpx.mp4', 'post/165768957762ce55e955d76.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-13 05:19:37', '2022-07-13 05:21:53', '2022-07-13 09:21:53', '{\"height\":268,\"width\":480,\"size\":2873131}', 0, 0),
(86, 24, 'Sdcsdc', NULL, '241657689739', 'video', 's3', NULL, NULL, 'null', 'media-files/wCxe4Gf4OYbWbWffM8ZDLcLQ47X153ZKsMlt5fc5.mp4', 'post/165768974062ce568c879a7.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-13 05:22:20', '2022-07-13 05:22:20', NULL, '{\"height\":268,\"width\":480,\"size\":2873131}', 0, 0),
(87, 24, 'Ssxsx', NULL, '241657690273', 'video', 's3', NULL, NULL, 'null', 'media-files/eIG1U8DQco51ViUwjlp7EDX4ppHYO2ueTSiZyiRr.mp4', 'post/165769027662ce58a402900.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-13 05:31:16', '2022-07-13 05:31:16', NULL, '{\"height\":320,\"width\":568,\"size\":2788571}', 0, 0),
(88, 24, 'Dcscsd', NULL, '241657690822', 'video', 's3', NULL, NULL, 'null', 'media-files/dZQLb6lLwjFMJJVqtQ8DKhqLZisiHztAzS6XzM38.mp4', 'post/165769082462ce5ac882222.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-13 05:40:24', '2022-07-13 05:40:24', NULL, '{\"height\":240,\"width\":320,\"size\":5479186}', 0, 0),
(89, 24, 'Qwqwqwwq', NULL, '241657691011', 'video', 's3', NULL, NULL, 'null', 'media-files/HriVpygw2T6Y1m4x4qTGCBdJ0AIYnbaWj96oEiCD.mp4', 'post/165769101362ce5b8549ab2.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-13 05:43:33', '2022-07-13 05:43:33', NULL, '{\"height\":320,\"width\":568,\"size\":2788571}', 0, 0),
(90, 24, 'Refref', NULL, '241657691411', 'video', 's3', NULL, NULL, 'null', 'media-files/S7wWRusoOpegtFv6At7ndT1Ye0tvf6jc7w9h1UXU.mp4', 'post/165769141262ce5d14a596c.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-13 05:50:13', '2022-07-13 05:50:13', NULL, '{\"height\":320,\"width\":568,\"size\":2788571}', 0, 0),
(91, 24, 'Rrrrr', NULL, '241657692072', 'video', 's3', NULL, NULL, 'null', 'media-files/HzLBpLRGuF0gwY2C44TG6ZscIhnAb2AKRK7rWZq8.mp4', 'post/165769207362ce5fa9ddcf6.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-13 06:01:14', '2022-07-13 06:01:14', NULL, '{\"height\":268,\"width\":480,\"size\":2873131}', 0, 0),
(92, 24, 'Cccccc', NULL, '241657692230', 'video', 's3', NULL, NULL, 'null', 'media-files/wnZL4IKCHtmlrxKLQ607ZlsnBbyMpWNgWM2kdGGx.mp4', 'post/165769223162ce6047dff3f.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-13 06:03:52', '2022-07-13 06:03:52', NULL, '{\"height\":320,\"width\":568,\"size\":2788571}', 0, 0),
(93, 24, 'Fefefefef', NULL, '241657692693', 'video', 's3', NULL, NULL, 'null', 'media-files/eCpkTdiPXcLjWm2J93Mkf0fu2ymBIw7uBDH6LW47.mp4', 'post/165769269462ce6216ee4e2.jpg', 'video', NULL, '1', 0, 1, 0, 'normal_post', 0, '2022-07-13 06:11:35', '2022-07-13 06:11:35', NULL, '{\"height\":268,\"width\":480,\"size\":2873131}', 0, 0),
(94, 24, 'Cvbnm', NULL, '241657692788', 'video', 's3', NULL, NULL, 'null', 'media-files/fEc1L3cCMyk1BmWql2K73xj0xjaS93xz1SAqZUpJ.mp4', 'post/165769279062ce627686c0c.jpg', 'video', NULL, '1', 0, 0, 0, 'normal_post', 0, '2022-07-13 06:13:10', '2022-07-13 06:13:10', NULL, '{\"height\":320,\"width\":568,\"size\":2788571}', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `post_tag_users`
--

CREATE TABLE `post_tag_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tag_users`
--

INSERT INTO `post_tag_users` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 7, 8, '2022-01-14 06:21:06', '2022-01-14 06:21:06', NULL),
(4, 9, 8, '2022-01-14 07:56:55', '2022-01-14 07:56:55', NULL),
(8, 21, 18, '2022-01-15 00:08:48', '2022-01-15 00:08:48', NULL),
(9, 20, 17, '2022-01-15 00:54:13', '2022-01-15 00:54:13', NULL),
(10, 42, 35, '2022-06-10 13:37:16', '2022-06-10 13:37:16', '2022-06-10 17:41:11'),
(11, 43, 35, '2022-06-10 13:42:35', '2022-06-10 13:42:35', '2022-06-10 17:43:01');

-- --------------------------------------------------------

--
-- Table structure for table `report_types`
--

CREATE TABLE `report_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `report_types`
--

INSERT INTO `report_types` (`id`, `module`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'User And Post Report', 'Offensive Content', '2022-01-11 10:44:03', NULL, NULL),
(2, 'User And Post Report', 'Nudity', '2022-01-11 10:44:03', NULL, NULL),
(3, 'User And Post Report', 'Inappropriate Content', '2022-01-11 10:44:03', NULL, NULL),
(4, 'User And Post Report', 'Pirated Content', '2022-01-11 10:44:03', NULL, NULL),
(5, 'User And Post Report', 'Other', '2022-01-11 10:44:03', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reset_password`
--

CREATE TABLE `reset_password` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_packages`
--

CREATE TABLE `subscription_packages` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `Identifier` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `description` text,
  `coins` int(11) NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscription_packages`
--

INSERT INTO `subscription_packages` (`id`, `title`, `Identifier`, `slug`, `description`, `coins`, `amount`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '10 Tokens', 'ios', 'com.streammii.tentokens', '10 Tokens', 10, '1.99', '1', '2022-02-04 01:38:53', NULL, NULL),
(2, '50 Tokens', 'ios', 'com.streammii.50Tokens', '50 Tokens', 50, '5.99', '1', '2022-02-04 01:38:53', NULL, NULL),
(3, '125 Tokens', 'ios', 'com.streammii.125Tokens', '125 Tokens', 125, '9.99', '1', '2022-02-04 01:38:53', NULL, NULL),
(4, '250 Tokens', 'ios', 'com.streammii.250Tokens', '250 Tokens', 250, '19.99', '1', '2022-02-04 01:38:53', NULL, NULL),
(5, '625 Tokens', 'ios', 'com.streammii.625Tokens', '625 Tokens', 625, '49.99', '1', '2022-02-04 01:38:53', NULL, NULL),
(6, '10 Tokens', 'android', 'com.streammii.tentokens', '10 Tokens', 10, '1.99', '1', '2022-02-04 01:38:53', NULL, NULL),
(7, '50 Tokens', 'android', 'com.streammii.50Tokens', '50 Tokens', 50, '5.99', '1', '2022-02-04 01:38:53', NULL, NULL),
(8, '125 Tokens', 'android', 'com.streammii.125Tokens', '125 Tokens', 125, '9.99', '1', '2022-02-04 01:38:53', NULL, NULL),
(9, '250 Tokens', 'android', 'com.streammii.250Tokens', '250 Tokens', 250, '19.99', '1', '2022-02-04 01:38:53', NULL, NULL),
(10, '625 Tokens', 'android', 'com.streammii.625Tokens', '625 Tokens', 625, '49.99', '1', '2022-02-04 01:38:53', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `driver` enum('local','s3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `user_group_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `is_public` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `is_email_verify` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `email_verify_at` datetime DEFAULT NULL,
  `is_mobile_verify` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `mobile_verify_at` datetime DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_post` int(11) NOT NULL DEFAULT '0',
  `online_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `mobile_otp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_otp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `artist_type_id` int(10) UNSIGNED DEFAULT NULL,
  `music_genre_id` int(10) UNSIGNED DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `facebook_url` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram_url` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_url` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snapchat_url` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube_url` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weblink_url` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_first_login` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `no_of_posts` int(11) NOT NULL,
  `no_of_followers` int(11) NOT NULL,
  `no_of_following` int(11) NOT NULL,
  `total_coins` int(11) NOT NULL,
  `total_coins` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `driver`, `user_group_id`, `name`, `username`, `slug`, `email`, `mobile_no`, `password`, `image_url`, `status`, `is_public`, `is_email_verify`, `email_verify_at`, `is_mobile_verify`, `mobile_verify_at`, `country`, `city`, `state`, `zipcode`, `address`, `latitude`, `longitude`, `total_post`, `online_status`, `mobile_otp`, `email_otp`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `artist_type_id`, `music_genre_id`, `user_type`, `bio`, `gender`, `date_of_birth`, `facebook_url`, `instagram_url`, `twitter_url`, `snapchat_url`, `youtube_url`, `weblink_url`, `is_first_login`, `no_of_posts`, `no_of_followers`, `no_of_following`, `total_coins`, `total_coins`) VALUES
(5, 'local', 1, 'Jack smith', 'Jack99', 'Jack99', 'Jack@mailinator.com', '+1-5412345678', '$2y$10$XaK1eNCBiAt2/gN7vYK6ouJICeHBlD2sqCW919zhQ08Y5foq/VA8u', NULL, '1', '1', '1', '2022-01-13 15:26:06', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, '1', NULL, NULL, NULL, '2022-01-13 15:20:07', '2022-01-14 15:34:59', '2022-01-14 15:34:59', 1, 4, 'artist', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 0, 2, 0, 0, 0),
(6, 'local', 1, 'Alex hales', 'Alex99', 'Alex99', 'Alex@mailinator.com', '+1-2345678900', '$2y$10$lYSaKcJtUdghkchIx/EGvuxBsgMLGNjXC/1V/I6RPIzuswvbV0G7q', NULL, '1', '0', '1', '2022-01-13 15:31:51', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1', NULL, NULL, NULL, '2022-01-13 15:25:27', '2022-01-14 15:34:56', '2022-01-14 15:34:56', 5, 2, 'artist', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 0, 0, 0, 0, 0),
(7, 'local', 1, 'Foster', 'Foster99', 'Foster99', 'Foster@yopmail.com', '+1-5412356478', '$2y$10$29nAA3xH6giaPR80TrJB3OE0YUwSH6aLkk3653nvy/y9KmgAlv40O', NULL, '1', '1', '0', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, NULL, '2022-01-13 15:45:09', '2022-01-14 15:37:31', '2022-01-14 15:37:31', NULL, NULL, 'fan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 0, 0, 0, 0, 0),
(8, 'local', 1, 'jason roy', 'jason99', 'jason99', 'jason@yopmail.com', '+1-5412345670', '$2y$10$UH.xF6P4hw.KdaTGvBATOOTtVkKnYcSOL2N4U4MDE0nox5FcVETqe', NULL, '1', '1', '1', '2022-01-14 06:02:19', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1', NULL, NULL, NULL, '2022-01-14 06:02:09', '2022-01-14 15:37:28', '2022-01-14 15:37:28', 0, 0, 'fan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 0, 1, 1, 0, 0),
(9, 'local', 1, 'artist1', 'artist1', 'artist1', 'artist1@yopmail.com', '+92-242151638', '$2y$10$u2hjFwIbG8Ua6dOwmv2oMebpolbph5nRUOmv6EgHXRpFjmgF/heIm', NULL, '1', '1', '0', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, NULL, '2022-01-14 06:12:43', '2022-01-14 15:35:07', '2022-01-14 15:35:07', 1, 1, 'artist', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 0, 1, 0, 0, 0),
(10, 'local', 1, 'Ccc', 'Cc', 'Cc', 'Cc@yopmail.com', '+1-8004444444', '$2y$10$6ghc4svZXaBhHFcijo5EK.MQuzIvvvaoKvuwl7RuEbjzHmlxmEOUa', NULL, '1', '1', '1', '2022-01-14 06:22:46', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1', NULL, NULL, NULL, '2022-01-14 06:22:17', '2022-01-14 15:37:24', '2022-01-14 15:37:24', NULL, NULL, 'fan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 0, 0, 1, 0, 0),
(11, 'local', 1, 'Fancis', 'Francis99', 'Francis99', 'Francis@yopmail.com', '+1-5412356472', '$2y$10$KtU2vV9OZhyJPIIHIeQ7HuRCwpBZ76GAypXxxpM761JwwmooJVYvS', NULL, '1', '1', '1', '2022-01-14 10:02:47', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1', NULL, NULL, NULL, '2022-01-14 10:02:18', '2022-01-14 15:37:20', '2022-01-14 15:37:20', NULL, NULL, 'fan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 0, 0, 1, 0, 0),
(12, 'local', 1, 'Symonds', 'Symo99', 'Symo99', 'Symonds@yopmail.com', '+1-5412525368', '$2y$10$pd6dm5qV3WHpUk66Nu.caubN2Bvg1KmEzgQgGwnNR8Kdwr5WzYcOO', NULL, '1', '1', '1', '2022-01-14 11:18:02', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1', NULL, NULL, NULL, '2022-01-14 11:17:25', '2022-01-14 15:37:17', '2022-01-14 15:37:17', NULL, NULL, 'fan', 'Testing fan bio…. Testing fan bio…. Testing fan bio…. Testing fan bio…. Testing fan bio…. Testing fan bio…. Testing fan bio…. Testing fan bio…. Testing fan bio…. Testing fan bio…. Testing fan bio…. Testing fan bio…. Testing fan bio…. Testing fan bio…. Testing fan bio…. Testing fan bio…. Testing fan bio…. Testing fan bio…. Testing fan bio…. Testing fan bio….', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 0, 0, 1, 0, 0),
(13, 'local', 1, 'Donald', 'Donald99', 'Donald99', 'Donald@yopmail.com', '+1-5412364578', '$2y$10$cE8apntQBXW5uT.NxqqYweAlVXSc0aHnH2oqw5vHFx5bhUkmLjwYW', '/storage/users/6L1Zy3EInjk2CDSoyU3pKnpeIbgzcMPsSuaXLzM6.jpg', '1', '1', '1', '2022-01-14 11:22:19', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1', NULL, NULL, NULL, '2022-01-14 11:21:02', '2022-01-14 15:34:44', '2022-01-14 15:34:44', 10, 2, 'artist', 'Artist bio…. Artist bio…. Artist bio…. Artist bio…. Artist bio…. Artist bio…. Artist bio…. Artist bio…. Artist bio…. Artist bio…. Artist bio…. Artist bio…. Artist bio…. Artist bio…. Artist bio…. Artist bio…. Artist bio…. Artist bio….', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 0, 1, 1, 0, 0),
(14, 'local', 1, 'Cameron', 'Cameron99', 'Cameron99', 'Cameron@yopmail.com', '+1-5414523678', '$2y$10$.PD68GzSjdFkuJhv9gynCOD1GKy8ksT5huCartx0gH.nkY9TNlaVe', NULL, '1', '1', '1', '2022-01-14 11:51:12', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '1', NULL, NULL, NULL, '2022-01-14 11:50:55', '2022-01-14 15:34:52', '2022-01-14 15:34:52', 8, 3, 'artist', 'Testing artist bio…. Testing artist bio…. Testing artist bio…. Testing artist bio…. Testing artist bio…. Testing artist bio….', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 0, 1, 0, 0, 0),
(15, 'local', 1, 'Ricky', 'Rick99', 'Rick99', 'Rick@yopmail.com', '+1-5412514368', '$2y$10$NuCFnwkkennCYP1kAitsAeW8HDAs1RWXApqXXcxEq8GgDeefBlEFu', NULL, '1', '0', '1', '2022-01-14 14:54:09', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '1', NULL, NULL, NULL, '2022-01-14 14:53:50', '2022-01-14 15:34:47', '2022-01-14 15:34:47', 14, 11, 'artist', 'Test bio', 'Male', '2009-01-01', NULL, NULL, NULL, NULL, NULL, NULL, '1', 0, 1, 1, 0, 0),
(16, 'local', 1, 'Marcus', 'Marcus99', 'Marcus99', 'Marcus@yopmail.com', '+1-2025512345', '$2y$10$BK0D4.p1BkBOsugJ0S40BesAclOcgcR9wafvy7vXiFMcOBbQl6H.6', NULL, '1', '0', '1', '2022-01-14 15:06:31', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1', NULL, NULL, NULL, '2022-01-14 15:05:52', '2022-01-14 15:36:34', '2022-01-14 15:36:34', NULL, NULL, 'fan', NULL, NULL, NULL, 'Google.com', NULL, NULL, NULL, NULL, NULL, '1', 0, 0, 1, 0, 0),
(17, 'local', 1, 'Jamal', 'Jm_dreamville', 'Jm_dreamville', 'Jamal.mayfields@gmail.com', '+1-9039084658', '$2y$10$yvEUzJ2docBSMjMIFxDr.OSesIWIRv3LIIs57TOJqVhjuVWZFNDaK', '/storage/users/yNbI9Es5rbbjb7rOmafm7ugaWh3GnddftKHdCC8T.jpg', '1', '1', '1', '2022-01-14 19:42:20', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1', NULL, NULL, NULL, '2022-01-14 19:39:45', '2022-01-31 19:32:54', NULL, 0, 0, 'fan', 'I love music', 'Male', '1994-01-13', NULL, NULL, NULL, NULL, NULL, NULL, '1', 0, 0, 0, 0, 0),
(18, 'local', 1, 'Jamal May', 'Jamal_legacy', 'Jamal_legacy', 'Jamal.mayfield@yahoo.com', '+1-9039084650', '$2y$10$Pr6zXBRuywvWVZxYxkD05O3Ol0l/nePXI66T/fDNtWPnRv.CQ61qO', '/storage/users/WgtgvvpyrlCH0q0dENYTuLHE6LlVCLMzeEnoLFRV.jpg', '1', '0', '1', '2022-01-14 19:48:27', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, '1', NULL, NULL, NULL, '2022-01-14 19:48:07', '2022-01-31 19:32:01', NULL, 10, 6, 'artist', 'Lets do it', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 0, 0, 0, 0, 0),
(19, 'local', 1, 'Chloe', 'Trusty', 'Trusty', 'Cmgt24@yahoo.com', '+1-9404533999', '$2y$10$Teejraoix7TD6sV3kNdrx.w5qXQzmznItcjKYghQuCrAJDrvZQohe', '/storage/users/O2zjMyyC4DdFVCslOwt2MtvWzqp7U8hfCWBGGRHp.jpg', '1', '0', '1', '2022-01-14 23:52:17', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '1', NULL, NULL, NULL, '2022-01-14 23:51:56', '2022-01-15 02:52:59', NULL, 3, 6, 'artist', 'Heyyyy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 0, 1, 0, 0, 0),
(20, 'local', 1, 'Luka', 'May', 'May', 'cmgt24@utexas.edu', '+1-9404353336', '$2y$10$n4DN0SxXl6J6odPnYe/KL.hPwJYGu.6p5ZtqREsXAkgTeSJ.IyG.i', '/storage/users/zCKzZjX3RXIK7cW0Es2iR7ON6Qudo7Ta23iYGDx4.jpg', '1', '0', '1', '2022-01-15 01:31:26', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1', NULL, NULL, NULL, '2022-01-15 01:30:42', '2022-01-15 01:46:20', NULL, NULL, NULL, 'fan', 'Luka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 0, 0, 1, 0, 0),
(21, 'local', 1, 'Jamal', 'Kyrie_mal', 'Kyrie_mal', 'Mymusikjmt@gmail.com', '+1-9039083528', '$2y$10$OgzrEyssdEFBKfGHiLF9z.dOmJCYfNFSXEs3UV1hhMbiSCLYNmkRe', NULL, '1', '1', '0', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, NULL, '2022-01-15 03:45:05', '2022-01-15 03:45:05', NULL, NULL, NULL, 'fan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 0, 0, 0, 0, 0),
(22, 'local', 1, 'fan1', 'fan1', 'fan1', 'fan1@yopmail.com', '+92-242151635', '$2y$10$542PaxZPDnWmUdXd94AmaexefidhFz/h5/obhu82C9iE3UJ2nm1M2', NULL, '1', '1', '1', '2022-01-17 11:10:41', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, NULL, '2022-01-17 11:09:23', '2022-01-17 11:10:41', NULL, 1, 1, 'fan1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 0, 0, 0, 0, 0),
(23, 'local', 1, 'Bit navi', 'Bit', 'Bit', 'Bit@yopmail.com', '+1-8563368371', '$2y$10$gTG6n0kLHF7c2.3SI6pDJejOZ3MioQK8ISaZxmc2jVjKbDMZm8Kpu', '/storage/users/G9vhObWyRBB9q8UHMvqnjYGkrIn5dTqoiQLqy7L6.jpg', '1', '1', '1', '2022-01-17 11:42:04', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1', NULL, NULL, NULL, '2022-01-17 11:41:40', '2022-01-26 06:45:13', NULL, NULL, NULL, 'fan', 'Im a first fan ….', NULL, NULL, 'https://www.facebook.com/zuck', 'https://www.instagram.com/zuck/?hl=en', NULL, NULL, NULL, NULL, '1', 0, 1, 3, 4580, 0),
(24, 'local', 1, 'Simple navi', 'Simple', 'Simple', 'Simple@yopmail.com', '+1-4848970346', '$2y$10$xwS9zNYIWu.xYByOM1xjH.0r0OEUSXF1BYCWViz3FZFXHqhWhnuB2', '/storage/users/YVHmctQq3OrODjRNC1sv5gGmysoTBNME4OvzhDpj.jpg', '1', '0', '1', '2022-01-17 11:43:49', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, '1', NULL, NULL, NULL, '2022-01-17 11:43:21', '2022-07-13 10:13:10', NULL, 2, 3, 'artist', 'I m simple…..', NULL, NULL, 'https://www.facebook.com/zuck', 'https://www.instagram.com/zuck/?hl=en', NULL, NULL, NULL, NULL, '1', 0, 2, 0, 0, 1350),
(25, 'local', 1, 'Taco sk', 'Taco', 'Taco', 'Taco@yopmail.com', '+1-9162346994', '$2y$10$nWWLo3E0WF7vizoMWa3bKuzuDhr4FRFSFcMRs0w0LbZzlWOCMpx0m', '/storage/users/NEmePJFAphbFdoLovnFGxATlvGWHIhVTXVkD9ev3.jpg', '1', '1', '1', '2022-01-17 12:05:31', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1', NULL, NULL, NULL, '2022-01-17 12:05:17', '2022-02-04 09:09:36', NULL, NULL, NULL, 'fan', 'This taco from sk …', NULL, NULL, 'https://www.facebook.com/login/?next=https%3A%2F%2Fwww.facebook.com%2Fzuck', NULL, NULL, NULL, NULL, NULL, '1', 0, 0, 1, 5550, 0),
(26, 'local', 1, 'Monesy navi', 'Monesy', 'Monesy', 'Monesy@yopmail.com', '+1-6095318214', '$2y$10$i9oj6/Iy1mTs6cjQ0fPbuO66t8OAxTS2Mna2BAntf1T3pHnlz06Ge', '/storage/users/6EFodqeTIL7lrqcjIlOB5PBpVsOlfunQ609e46aQ.jpg', '1', '0', '1', '2022-01-18 05:13:06', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1', NULL, NULL, NULL, '2022-01-18 05:12:35', '2022-02-10 11:15:47', NULL, 10, 7, 'artist', 'I m the world 2nd artist.', 'Other', NULL, NULL, 'https://www.instagram.com/zuck/?hl=en', NULL, NULL, NULL, NULL, '1', 0, 1, 1, 0, 0),
(27, 'local', 1, 'fan new', 'fannew', 'fannew', 'fannew@yopmail.com', '+92-242151633', '$2y$10$ZrNQxqcDDigudc1HHW2gj.moQ0woH5MkDia1DbOTPieqScfVqRCyS', NULL, '1', '0', '1', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1', NULL, NULL, NULL, '2022-01-18 12:19:13', '2022-02-10 11:15:06', NULL, 1, 1, 'artist', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 0, 1, 0, 0, 0),
(28, 'local', 1, 'artist jhone', 'artistjhone', 'artistjhone', 'artist@yopmail.com', '+92-242151631', '$2y$10$eRF6mW/Y.BxXKWICPfWkku/fhhqGhacsbVaQDCb/5PcSFHMm66kFK', NULL, '1', '1', '0', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, NULL, '2022-01-19 05:26:05', '2022-03-26 03:53:44', NULL, 1, 1, 'artist', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 0, 0, 0, 0, 0),
(29, 'local', 1, 'Glave astralis', 'Glave', 'Glave', 'Glave@yopmail.com', '+1-6098508156', '$2y$10$ZYbmVoMM1qbJx5oLJnpvSeE1PRmS0IyAgIPeNGI2Z2Ns1xo3nbwU6', '/storage/users/4SIMOXM6nKvxJlfTOZtm5j9GGYmtB7CgEySZOLKx.jpg', '1', '1', '1', '2022-01-21 07:55:32', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1', NULL, NULL, NULL, '2022-01-21 07:55:05', '2022-01-21 07:56:43', NULL, 7, 5, 'artist', 'In the in team leader…', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 0, 0, 0, 0, 0),
(31, 'local', 1, 'Hello world', 'Hello', 'Hello', 'Hello@yopmail.com', '+1-9374531754', '$2y$10$Ohi5GEs6M435kci00XGHhuxsidPUvK4HsNxjFoucbnvlUIqY4HRyG', '/storage/users/rzJtZNmcVSxqPehqNz6oO5jTIUp2sDfCUHv3Pp7p.jpg', '1', '1', '1', '2022-01-21 10:11:58', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1', NULL, NULL, NULL, '2022-01-21 10:11:39', '2022-01-21 10:13:40', NULL, NULL, NULL, 'fan', 'Hello hello', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 0, 0, 0, 0, 0),
(32, 'local', 1, 'fan', 'fan', 'fan', 'fan@yopmail.com', '+92-242151632', '$2y$10$30RCCL/9Jz70jS0XIVtllOIaTjVvvwA7YwQQzKeFxArTYbqE0kW6C', NULL, '1', '1', '1', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, NULL, '2022-01-25 11:50:11', '2022-02-04 07:34:10', NULL, 1, 1, 'fan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 0, 0, 0, 1020, 0),
(33, 'local', 1, 'Mia khalifa', 'Agent', 'Agent', 'Mia@yopmail.com', '+1-1234567890', '$2y$10$O8AHGj1nv7MO6pqarOW6WeKxZhWdQN6nuaq01P5mPDFfaeLVQ5pQG', NULL, '1', '1', '0', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, NULL, '2022-06-10 16:58:04', '2022-06-10 16:58:04', NULL, NULL, NULL, 'fan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 0, 0, 0, 0, 0),
(34, 'local', 1, 'Mia', 'Khalifa', 'Khalifa', 'Khalifa@yopmail.com', '+1-1234567891', '$2y$10$2CmvtLP18bYdeQryS1Fpsu6TBwHMirtR.oAo90phOFJSf/h2nTbBC', NULL, '1', '1', '0', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, NULL, '2022-06-10 17:00:11', '2022-06-10 17:00:11', NULL, NULL, NULL, 'fan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 0, 0, 0, 0, 0),
(35, 'local', 1, 'Mia', 'John', 'John', 'John@yopmail.com', '+1-1234567892', '$2y$10$uZVwBYiJehg3j1a5wW.nGeecVfwwzBR3X3pwYwnXvG6.7o.FizV2K', NULL, '1', '1', '1', '2022-06-10 13:02:45', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, NULL, '2022-06-10 17:02:28', '2022-06-10 17:16:43', NULL, NULL, NULL, 'fan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 0, 0, 1, 490, 600),
(36, 'local', 1, 'Simple', 'Navi', 'Navi', 'Simple2@yopmail.com', '+1-1234567893', '$2y$10$b1wbkOJLYs9sPM/6tqSC.OxAIHwIY2CU1QDx5AROz6QhhkHYU/nga', NULL, '1', '1', '1', '2022-06-10 13:05:17', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, NULL, '2022-06-10 17:04:46', '2022-06-10 17:43:01', NULL, 5, 6, 'artist', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 0, 1, 0, 0, 20),
(37, 's3', 1, 'james', 'Jack9', 'westreamii', 'westreamii@yopmail.com', '+1-1234567888', '$2y$10$PHR33sOAu85Vn4FgX694lO4AF0qKigbXFkfMHglpARYBJ65zwdeZe', 'users/nrZskxswtOxFFSrKFraWZCRP2j8M4Y7HKdGz90Tp.jpg', '1', '1', '1', NULL, '0', NULL, 'canada', 'montreal', 'Quebec', '742001', 'montreal canada', '123456', '123456', 38, '0', NULL, NULL, NULL, '2022-06-30 13:58:52', '2022-07-05 15:52:25', NULL, 1, 1, 'fan', NULL, 'Male', '2021-01-15', 'www.facebook.com1', 'www.instagram.com1', 'www.twitter.com1', 'www.snapchat.com', 'www.youtube.com', 'www.weblink.com', '1', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_api_token`
--

CREATE TABLE `user_api_token` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refresh_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `udid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` text COLLATE utf8mb4_unicode_ci,
  `platform_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'custom',
  `platform_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_api_token`
--

INSERT INTO `user_api_token` (`id`, `user_id`, `api_token`, `refresh_token`, `udid`, `device_type`, `device_token`, `platform_type`, `platform_id`, `ip_address`, `user_agent`, `created_at`, `updated_at`, `deleted_at`) VALUES
(11, 5, '82f939cd44ccb5a0f90eb719092293af7c67f9f7e3a6b724557a9229057f333c', '729c475726cd95327b34eb931eaa5fbdf6b05b5dc7feb3bd7e5e9b95d4735b77', 'efe0517d80d8bdfa', 'android', '217df3fe-7484-11ec-aed3-ae49cba215fd', 'custom', NULL, '192.140.145.242', 'okhttp/3.12.12', '2022-01-13 15:22:04', '2022-01-13 15:22:04', NULL),
(12, 6, '1181d96fc8ed500cb70f78452231ba143f02317d72eb6f959be5c98577221918', '2627a3890f5588d2f39c7986a05fe85f692a76dec0225a3debc90a61ec4be132', '650F4E36-224B-4D03-AD47-800586C17DEC', 'ios', 'b68de6e8-7484-11ec-9982-862baef293f7', 'custom', NULL, '192.140.145.242', 'StreamMii/1 CFNetwork/1240.0.4 Darwin/20.6.0', '2022-01-13 15:27:32', '2022-01-13 15:27:32', NULL),
(13, 7, '6a99a72c79865158723d495c765e626fbabae9ef48840ef76b139fff71aecfdd', 'dc59848c217397d332254831624a307d0a574735204c2021613222e4274e1403', 'E28FE39C-64FA-4972-B3F1-F4AA69D9C2D6', 'ios', 'E28FE39C-64FA-4972-B3F1-F4AA69D9C2D6', 'custom', NULL, '192.140.145.242', 'StreamMii/1 CFNetwork/1240.0.4 Darwin/20.6.0', '2022-01-13 15:45:09', NULL, NULL),
(15, 8, 'cb2218abeef37cf967bae1c28c44e1d8e851e4fb497d635c4060fdbc733f84ee', '83c31ce324d695ad4f5cc1c9673c5ac6351da375a977946e2c37668e8c48e09a', 'F4CC6A5D-D5E8-4C76-AC5D-10456BCFCC05', 'ios', '398c0cda-74ff-11ec-8702-1ea221047a0a', 'custom', NULL, '124.29.238.131', 'StreamMii/1 CFNetwork/1240.0.4 Darwin/20.6.0', '2022-01-14 06:02:38', '2022-01-14 06:02:38', NULL),
(17, 10, '080725fec5c18d1fc62e8048fb7e5388977b7607d3f0e777d891a69b0d5fc45a', '7b097098e28227649457b635e140a933088bf2a43091c155e0d8a030963e07b7', '3ACFDCD7-5D6D-42E7-B517-9E35DD797C38', 'ios', '7028eec0-7379-11ec-9dea-2e3abdb03d23', 'custom', NULL, '192.140.145.242', 'StreamMii/1 CFNetwork/1325.0.1 Darwin/21.1.0', '2022-01-14 06:22:50', '2022-01-14 06:22:50', NULL),
(18, 5, '28c70dfe0ce3d703e9f351235e494aa57ee8e639243dac91e6eeb6d3b4778830', 'db1c29f3793cad105ca13b83ac92986c1a62b9eeed9e9e9fe1826cacbc4b236b', 'F4CC6A5D-D5E8-4C76-AC5D-10456BCFCC05', 'ios', '398c0cda-74ff-11ec-8702-1ea221047a0a', 'custom', NULL, '192.140.145.242', 'StreamMii/1 CFNetwork/1240.0.4 Darwin/20.6.0', '2022-01-14 08:05:07', '2022-01-14 08:05:07', NULL),
(19, 8, 'b81d0bc307050f00a87699cfb6facf2e5031d9816d62da692cf4288ab02032f3', '579bb834e1128e1f2226e3fd1fe81adb021a40afe8cce52b60ee42eda0c2535e', 'efe0517d80d8bdfa', 'android', '217df3fe-7484-11ec-aed3-ae49cba215fd', 'custom', NULL, '192.140.145.242', 'okhttp/3.12.12', '2022-01-14 08:05:10', '2022-01-14 08:05:10', NULL),
(20, 8, '9e2df0a6409d9d699180a3b638571db4cdba6675262fe1b127d9d8d2d4559252', '594dff5f41433140d6362ec76883fbea4530d74f73b8a09a8e9c5c5a9e61a5ea', '3ACFDCD7-5D6D-42E7-B517-9E35DD797C38', 'ios', '7028eec0-7379-11ec-9dea-2e3abdb03d23', 'custom', NULL, '124.29.238.131', 'StreamMii/1 CFNetwork/1325.0.1 Darwin/21.1.0', '2022-01-14 09:53:44', '2022-01-14 09:53:44', NULL),
(22, 11, 'cb2cfcaff18fa245d4b83f634378224fda7227f6b0be51a3417e49e84a47699b', 'f1f43eea47add3c9c2c5ce22e8f3285e6301dc593c048f0229c46ccc45f22527', '3ACFDCD7-5D6D-42E7-B517-9E35DD797C38', 'ios', '7028eec0-7379-11ec-9dea-2e3abdb03d23', 'custom', NULL, '124.29.238.131', 'StreamMii/1 CFNetwork/1325.0.1 Darwin/21.1.0', '2022-01-14 10:02:49', '2022-01-14 10:02:49', NULL),
(23, 5, '6935f4971d001fd242a748349a7a0d20aa40073b4d950c97b90a69f898fc8616', '24c287644f31860060a0ac3c4d83bfe4e696b62352b70ff3e9eb1ea7c341c333', '3ACFDCD7-5D6D-42E7-B517-9E35DD797C38', 'ios', '7028eec0-7379-11ec-9dea-2e3abdb03d23', 'custom', NULL, '124.29.238.131', 'StreamMii/1 CFNetwork/1325.0.1 Darwin/21.1.0', '2022-01-14 11:15:47', '2022-01-14 11:15:47', NULL),
(28, 12, '5a70029da9ce46bf32a9c724e748cd36fa09ed31ef8734010fbcd337889de390', '23ffc76e78b956c645dcbb4e061ccdd0ef4a90974a12e5ee53493f0bb4d6837b', '3ACFDCD7-5D6D-42E7-B517-9E35DD797C38', 'ios', '7028eec0-7379-11ec-9dea-2e3abdb03d23', 'custom', NULL, '192.140.145.242', 'StreamMii/1 CFNetwork/1325.0.1 Darwin/21.1.0', '2022-01-14 13:59:36', '2022-01-14 13:59:36', NULL),
(29, 14, 'af717b30d1b35ced8d568e1369baeda5a2afdeb74095e59e28af637efd7c0432', '71124b576b060e41cbb0f9a81afbef13a533195850b761404bdb531da0681b83', 'E28FE39C-64FA-4972-B3F1-F4AA69D9C2D6', 'ios', '44c003fe-7487-11ec-acb8-66b7ad27e2f5', 'custom', NULL, '192.140.145.242', 'StreamMii/1 CFNetwork/1240.0.4 Darwin/20.6.0', '2022-01-14 14:01:54', '2022-01-14 14:01:54', NULL),
(30, 12, 'c73ac6d9843dc89a40a9c9996d69fa87a16b51a846fc382aa6629b641c9b5316', '71d9e25a5a12c9144773caa7c9d25a307f07195799b54568bde7874b1a43648c', 'E28FE39C-64FA-4972-B3F1-F4AA69D9C2D6', 'ios', '44c003fe-7487-11ec-acb8-66b7ad27e2f5', 'custom', NULL, '124.29.238.131', 'StreamMii/1 CFNetwork/1240.0.4 Darwin/20.6.0', '2022-01-14 14:25:16', '2022-01-14 14:25:16', NULL),
(31, 14, '1c86e5ecaf8c67966fd249525a23736b7cbaf9560309d2a1eec8d2f617a8cf3c', '4f741127e2f1e5a2315d31f7232965b8cb78301e67b61727753f3c794fe0310b', '3ACFDCD7-5D6D-42E7-B517-9E35DD797C38', 'ios', '7028eec0-7379-11ec-9dea-2e3abdb03d23', 'custom', NULL, '124.29.238.131', 'StreamMii/1 CFNetwork/1325.0.1 Darwin/21.1.0', '2022-01-14 14:25:40', '2022-01-14 14:25:40', NULL),
(32, 14, '46fd95e888ec99e06523278dbd2d3c5e466d22dfcb53b34a9f2571c8693d9cb4', 'b2e9a3cb6b4539583c8ccc3275ab44465c77d5f7160bab59c8dad251c64268ff', 'efe0517d80d8bdfa', 'android', '67c2bd02-7549-11ec-9aa0-aaf541231394', 'custom', NULL, '124.29.238.131', 'okhttp/3.12.12', '2022-01-14 14:52:07', '2022-01-14 14:52:07', NULL),
(33, 15, '8c869d103eb9ce4159aeb28144cd894663abcebbb61a7940e14be067901ef6ae', '7f354fbda3c6f65ad4c8a6195d2817264f0e9c6b884aa44d6ef3cb4b8df90727', 'efe0517d80d8bdfa', 'android', '67c2bd02-7549-11ec-9aa0-aaf541231394', 'custom', NULL, '124.29.238.131', 'okhttp/3.12.12', '2022-01-14 14:54:33', '2022-01-14 14:54:33', NULL),
(34, 16, '7d000ecf72ba73425c24d090249ceb7cbaddf7840bb97568b41d386f1d3a3d4a', '1262ad9ded77eff45c5b41a43d2b0dd08f205788bddb598310ce3d69d6c49865', '3ACFDCD7-5D6D-42E7-B517-9E35DD797C38', 'ios', '56a8ca5a-754b-11ec-979f-c65e239eeab8', 'custom', NULL, '124.29.238.131', 'StreamMii/1 CFNetwork/1325.0.1 Darwin/21.1.0', '2022-01-14 15:09:22', '2022-01-14 15:09:22', NULL),
(35, 16, '545b6052b1c5fbdc768a55ac1ca280aad67544c781fdecce62ad4005dff3cb8d', '27f115beb2b8500d790270dcdec655218f09b3b71cc5f794dc99d09fc27547bc', 'efe0517d80d8bdfa', 'android', '67c2bd02-7549-11ec-9aa0-aaf541231394', 'custom', NULL, '124.29.238.131', 'okhttp/3.12.12', '2022-01-14 15:18:17', '2022-01-14 15:18:17', NULL),
(36, 15, 'ffc151b70b2c1d7cd5a9b647e41043a44b06b12165a71183cb24b2e3378dd471', '56f4f60fef579df0046171709b3aab41ce8ab6af81054cdc8ec2b5eeadfa459d', '3ACFDCD7-5D6D-42E7-B517-9E35DD797C38', 'ios', '56a8ca5a-754b-11ec-979f-c65e239eeab8', 'custom', NULL, '124.29.238.131', 'StreamMii/1 CFNetwork/1325.0.1 Darwin/21.1.0', '2022-01-14 15:19:19', '2022-01-14 15:19:19', NULL),
(37, 13, '4e62c8dd0f3b92f2d9243869135f72714155034351091a3ba47a16fb4e7e3660', 'bd1c6620b1e41bd6dc58574e8118006f3ee33d59a12c135848a9970e499eacb8', 'E28FE39C-64FA-4972-B3F1-F4AA69D9C2D6', 'ios', '07284c28-754e-11ec-84f9-421bcdfefbbb', 'custom', NULL, '124.29.238.131', 'StreamMii/1 CFNetwork/1240.0.4 Darwin/20.6.0', '2022-01-14 15:24:29', '2022-01-14 15:24:29', NULL),
(38, 17, '8ce1409a5db63e334e9076ed01ff2ba54ca935c5c2d1ac95c1074c7d38a68163', '4b5d10146cf2f162bc5460bbc157959f99f1309175b772957d3d28ea24430194', 'FF1C1216-61E4-41D8-834B-3635177A848C', 'ios', '68d3e536-7571-11ec-8122-567e0addaa27', 'custom', NULL, '72.190.59.38', 'StreamMii/1 CFNetwork/1240.0.4 Darwin/20.6.0', '2022-01-31 19:28:58', '2022-01-31 19:28:58', NULL),
(39, 18, '8a6e9bfad97543dad7fe5cfd678611d6e47cbf8b10ac40b57d831ed1e05aa898', '875887536a36c984a9333537f6a774f078f45f678528da4b05dd026f945e6e69', 'FF1C1216-61E4-41D8-834B-3635177A848C', 'ios', '68d3e536-7571-11ec-8122-567e0addaa27', 'custom', NULL, '72.190.59.38', 'StreamMii/1 CFNetwork/1240.0.4 Darwin/20.6.0', '2022-01-15 03:19:28', '2022-01-15 03:19:28', NULL),
(40, 19, '81b0f18881ea9c5eeb5741a753cd13667799f53c92a04737145851459ec29358', '1fefe99b1da2d6a231c43dcd1ff8a983b5bbc477a85521bc368f301ccee71b97', 'FF1C1216-61E4-41D8-834B-3635177A848C', 'ios', '68d3e536-7571-11ec-8122-567e0addaa27', 'custom', NULL, '72.190.59.38', 'StreamMii/1 CFNetwork/1240.0.4 Darwin/20.6.0', '2022-01-15 03:10:57', '2022-01-15 03:10:57', NULL),
(41, 20, 'b221b632cd8c06ea7698de1d8a7c6883f44997c3d8df79e27bfc948e06763e00', 'fccb45835fa82e59aa1528c64abd054fd6c3da6815b2fbff15d86abbabaacd39', 'FF1C1216-61E4-41D8-834B-3635177A848C', 'ios', '68d3e536-7571-11ec-8122-567e0addaa27', 'custom', NULL, '72.190.59.38', 'StreamMii/1 CFNetwork/1240.0.4 Darwin/20.6.0', '2022-01-15 03:33:54', '2022-01-15 03:33:54', NULL),
(42, 21, '3c44208e3e10ba5b148ce2de741e210a43cdd715e01fcbbd95d101c0daee2469', '3b8f7d251d6b8dde6067e25b487d18aa4899c90f9e680859ca2ca2adb0b5af69', 'FF1C1216-61E4-41D8-834B-3635177A848C', 'ios', 'FF1C1216-61E4-41D8-834B-3635177A848C', 'custom', NULL, '72.190.59.38', 'StreamMii/1 CFNetwork/1240.0.4 Darwin/20.6.0', '2022-01-15 03:45:05', NULL, NULL),
(44, 23, 'e39449aad0646ff0ca710256ec30c7043972d1186f4ac17960bf1bc665e7a7d4', 'b9907f68712d56cfe8d10227a9db0dbe0a7ffd2c4a852452ae5e88d567711423', '44C24C84-5F95-4E4B-94C3-BC5541AC12F8', 'ios', '163b91a0-72d5-11ec-8bf7-420c16364524', 'custom', NULL, '124.29.238.131', 'StreamMii/1 CFNetwork/1312 Darwin/20.6.0', '2022-01-27 08:42:54', '2022-01-27 08:42:54', NULL),
(45, 24, 'c6c3e6f8992917f3675b318b95b0c4a82a207124067c83a089912f50800d2b9d', '55d7fa76ed58187de646ba83e7ffd1d523a374361075cdb3cabacccb8844cc56', '44C24C84-5F95-4E4B-94C3-BC5541AC12F8', 'ios', '163b91a0-72d5-11ec-8bf7-420c16364524', 'custom', NULL, '124.29.238.131', 'StreamMii/1 CFNetwork/1312 Darwin/20.6.0', '2022-02-10 11:13:27', '2022-02-10 11:13:27', NULL),
(46, 25, '071fa1dcc685c764caabb4ee16fe21bc46b4ba401b884a9b8ce9da8972361eef', '2e447b2909b5feb104a0583fe822c98a99e3bf963a51369f3cb1fd8dcec182de', '44C24C84-5F95-4E4B-94C3-BC5541AC12F8', 'ios', '163b91a0-72d5-11ec-8bf7-420c16364524', 'custom', NULL, '124.29.238.131', 'StreamMii/1 CFNetwork/1312 Darwin/20.6.0', '2022-01-26 06:34:23', '2022-01-26 06:34:23', NULL),
(47, 26, 'a7ea9e051bff3a44ea69b53d4acd60d60c15fb82e5cac2f037ff1162b16b0e8f', 'c371a83f89b261b481444f05e2919e979d44ffcd937b514f61c1982ae371c0fa', '44C24C84-5F95-4E4B-94C3-BC5541AC12F8', 'ios', '163b91a0-72d5-11ec-8bf7-420c16364524', 'custom', NULL, '124.29.238.131', 'StreamMii/1 CFNetwork/1312 Darwin/20.6.0', '2022-02-10 11:33:02', '2022-02-10 11:33:02', NULL),
(49, 27, '59b90a1e565573b25f08c44898f65299e6e0f25ea94c8b6f72a1f0331cd94538', '43029a16bae5e304cad22e4f9ab84a5b59a238675552530a136af3fb1c40c6f8', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '255215-5514-99', 'custom', NULL, '192.140.145.242', 'PostmanRuntime/7.28.4', '2022-01-19 07:43:52', '2022-01-19 07:43:52', NULL),
(50, 27, '85851fd8f7b7106a5ea13155f3742e66ab279c39d0d1d5c4beab08fb18db4b2a', '75f5804a809f01d00f4821b39bd12cbf3526ded65f74a839e45ab2b161110c0f', '44C24C84-5F95-4E4B-94C3-BC5541AC12F8', 'ios', '163b91a0-72d5-11ec-8bf7-420c16364524', 'custom', NULL, '192.140.145.242', 'StreamMii/1 CFNetwork/1312 Darwin/20.6.0', '2022-01-21 07:51:13', '2022-01-21 07:51:13', NULL),
(51, 28, 'b6467e42a6f353d56d24fefe62e0845d092dd55cb5a7df7e06e8d25c33853174', 'ad16b76699d1a8c8dee1123d658bff666037a725b0f1fe990707a90db27dd89e', 'e772afbf-65a2-4263-9ef9-65a3763d55b5', 'android', '1234567890', 'custom', NULL, '110.93.250.194', 'PostmanRuntime/7.29.0', '2022-01-19 05:26:05', NULL, NULL),
(52, 29, '8cccf4de7489de2f94f26cd3b127770f4b94ae855d76ce9d0ef1c8c22afdc971', 'a3db41a39bde8bb4a9631614cd9177f97e0f5ebaa50837470ffa7ec8b4ad5f3e', '44C24C84-5F95-4E4B-94C3-BC5541AC12F8', 'ios', '163b91a0-72d5-11ec-8bf7-420c16364524', 'custom', NULL, '124.29.238.131', 'StreamMii/1 CFNetwork/1312 Darwin/20.6.0', '2022-01-21 10:19:19', '2022-01-21 10:19:19', NULL),
(53, 29, 'c1c9843cf376804e8039edad81732f3d5a9e65c811103cb281d595c0ff60eef8', 'e36ed1e9726f30a6b3efe43242993c708dca7730340ba042f534b5a11bea029e', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '255215-5514-99', 'custom', NULL, '110.93.250.194', 'PostmanRuntime/7.29.0', '2022-01-21 08:00:42', '2022-01-21 08:00:42', NULL),
(54, 31, '7942c8e914aa43f3e0319a5911ab7aeb41f32b5bc4de8340cc7b532128428f50', '81544d735e2f4047ee7980a3a60ef8e0644da8314f5d3c8084ee2f0cdbc1e3f4', '44C24C84-5F95-4E4B-94C3-BC5541AC12F8', 'ios', '163b91a0-72d5-11ec-8bf7-420c16364524', 'custom', NULL, '124.29.238.131', 'StreamMii/1 CFNetwork/1312 Darwin/20.6.0', '2022-01-21 10:13:04', '2022-01-21 10:13:04', NULL),
(55, 25, 'd77eab510c5ba9fae374f8249d58d40a3e5d024799be159678876449edb09a79', 'b8f8dba75aa8fcbb389b7d7227cf1c2b98c9c6151903e3b15db53c3317069179', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '255215-5514-99', 'custom', NULL, '110.93.250.194', 'PostmanRuntime/7.29.0', '2022-02-03 08:24:14', '2022-02-03 08:24:14', NULL),
(56, 24, 'e7ff48712a531a228516ad52a0614cb45a36a256eb9821a60745f306d8a22a3d', '2c80ec605179688d9657a85f24f30ec0ba4f2d723f74b2f0722ba03a8d5fdd5b', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '255215-5514-99', 'custom', NULL, '124.29.238.131', 'PostmanRuntime/7.28.4', '2022-02-22 06:16:13', '2022-02-22 06:16:13', NULL),
(57, 32, '2c3229b2c79b6d9606287cb19de19b3092fd108271b7fb98e723e72eafcb8141', 'dc60151eb5d11a1561fa73288207161ac703966d3b4baf9abe909074bdad96fc', 'e772afbf-65a2-4263-9ef9-65a3763d55b5', 'android', '1234567890', 'custom', NULL, '110.93.250.194', 'PostmanRuntime/7.29.0', '2022-01-25 11:50:11', NULL, NULL),
(58, 32, '27bbf5a239a081f8cfc48b40f6c8cc434e33c4e655ec9f8d3e257905b27bddec', '8f93a35342201abce8aa590326cc1ea4295e6c0919b15338b85d89400b48d8de', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '255215-5514-99', 'custom', NULL, '110.93.250.194', 'PostmanRuntime/7.29.0', '2022-02-04 07:19:08', '2022-02-04 07:19:08', NULL),
(59, 23, 'e99951041312822cfb21d9c50e012ba9b5a6c5544de4c8c8adc1ea0924fb9790', '2a4b916fc18295decda14ee03e97ce2ad8365f93399a08672dfd45adecbe6da0', '3ACFDCD7-5D6D-42E7-B517-9E35DD797C38', 'ios', '8babbc22-7ff9-11ec-9f30-7edfc9759f1e', 'custom', NULL, '192.140.145.242', 'StreamMii/1 CFNetwork/1325.0.1 Darwin/21.1.0', '2022-01-28 05:18:00', '2022-01-28 05:18:00', NULL),
(60, 25, 'a5968872403632e3b8fc0188cd9b09c3589d7c741bf4e418c478227f8f86bc7d', '6a54779ba975e472532e45465ffc16d2ae6657bfe99218fc6e908615e18f98a0', '3ACFDCD7-5D6D-42E7-B517-9E35DD797C38', 'ios', 'edc08102-84b5-11ec-b453-6ee9e2b2bdd6', 'custom', NULL, '124.29.238.131', 'StreamMii/1 CFNetwork/1325.0.1 Darwin/21.1.0', '2022-02-03 08:55:25', '2022-02-03 08:55:25', NULL),
(61, 25, 'a4fecbddcab5372b856903b3108da3d021ad475a826cb9c1781aa433d6f0fed5', '5c503140c6f0dfbd3c9b337680da927402a477c2b4ee9181325a13b354139bd3', 'd921a56ef40319b5', 'android', 'f3a33512-857b-11ec-bbdd-2eed0800254c', 'custom', NULL, '192.140.145.242', 'okhttp/3.12.12', '2022-02-04 05:33:31', '2022-02-04 05:33:31', NULL),
(62, 33, '5bd97cd076c5181783c5b089448ddc1132af36ae0919f680c82081da11db328f', '9bc23093312f326210c0ad25684666f92aec1580912067d2e6ca21c02e15d6ab', '44C24C84-5F95-4E4B-94C3-BC5541AC12F8', 'ios', '44C24C84-5F95-4E4B-94C3-BC5541AC12F8', 'custom', NULL, '110.93.250.194', 'StreamMii/1 CFNetwork/1312 Darwin/20.6.0', '2022-06-10 16:58:04', NULL, NULL),
(63, 34, 'e90a702ca3822e9cfd8cf905b5b83b656b759869148074b540c2883184fb9373', '60d7e4a90e7c61374bc482e47f127a1e89bfbc7abbc762e9a91b0336e8ee4698', '44C24C84-5F95-4E4B-94C3-BC5541AC12F8', 'ios', '44C24C84-5F95-4E4B-94C3-BC5541AC12F8', 'custom', NULL, '110.93.250.194', 'StreamMii/1 CFNetwork/1312 Darwin/20.6.0', '2022-06-10 17:00:11', NULL, NULL),
(64, 35, 'a00d2e758c9ef0d59e0c39279e63f1532c513a33fad92c87934f0bddbc886835', 'cddc7bd32e3cc4a691eb4c1bc3c8b34120218f4aacf60ee940890cd32f215677', '44C24C84-5F95-4E4B-94C3-BC5541AC12F8', 'ios', 'dbf1c2f7-8728-4596-97e2-fabf721c9aad', 'custom', NULL, '110.93.250.194', 'StreamMii/1 CFNetwork/1312 Darwin/20.6.0', '2022-06-10 17:38:10', '2022-06-10 17:38:10', NULL),
(65, 36, 'eccb81359d3ead7cf65b39ffe8606e9d50556f731da963a5a5c051e78465e05a', '4f84e1e918f3dede0d4501eb6edd2095b4f726ebf243ea250b8a00ff529a5f9f', '44C24C84-5F95-4E4B-94C3-BC5541AC12F8', 'ios', 'dbf1c2f7-8728-4596-97e2-fabf721c9aad', 'custom', NULL, '110.93.250.194', 'StreamMii/1 CFNetwork/1312 Darwin/20.6.0', '2022-06-10 17:38:51', '2022-06-10 17:38:51', NULL),
(66, 35, '18cbcdab5a5b0baa1a418c76efb4d33bb11c7495cd7d012c58cb1fa28b068af4', '5a0258b73d0027f0c6b319c7f87e30ce7e2f42e1744cc3e43825dcc299fc224e', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '255215-5514-99', 'custom', NULL, '110.93.250.194', 'PostmanRuntime/7.29.0', '2022-06-10 17:15:37', '2022-06-10 17:15:37', NULL),
(67, 37, 'e057891218c1b1c58dbdaa51c4c633eca58c6d697b73b1cc80462b624fd34ce4', '6545dde86f7b2060a0aa4822f84fa9e1e432c3fe2204ee6b146a14863a6061f6', 'e772afbf-65a2-4263-9ef9-65a3763d55b5', 'android', '1234567890', 'custom', NULL, '110.93.250.194', 'PostmanRuntime/7.29.0', '2022-06-30 13:58:52', NULL, NULL),
(68, 37, '0a2443dc4ee88a03844bd992925b0a165b8e481121765eb7aba96e3159a59880', '851ea4518db82a3bf5e5398667aa3ebd9fd50b8175f067f4143b915da1df638c', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '255215-5514-99', 'custom', NULL, '110.93.250.194', 'PostmanRuntime/7.29.0', '2022-07-06 15:05:38', '2022-07-06 15:05:38', NULL),
(69, 24, 'd1344b53fa641c7cb88c04519bed29f0d701fd09ca3120febb6663696599c07f', 'b44607cf836375ee8f9619b292812865483ebb3e974519ca0f20f63f4f13a3eb', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '255215-5514-99', 'custom', NULL, '110.93.250.194', 'PostmanRuntime/7.29.0', '2022-07-12 13:39:38', '2022-07-12 13:39:38', NULL),
(70, 24, 'eaad24f3e16e5c665027858058a944dd517fde18a5cc3a3e2fcaa8e69194382f', '25739939c3cbc277df47a673fe38184ad58737c038fd025e4757505239a1d2c1', '44C24C84-5F95-4E4B-94C3-BC5541AC12F8', 'ios', 'a36005fe-0f98-4ae6-96ec-218a56f00563', 'custom', NULL, '110.93.250.194', 'StreamMii/1 CFNetwork/1312 Darwin/20.6.0', '2022-07-12 11:04:43', '2022-07-12 11:04:43', NULL),
(71, 25, '256f8829a4cb0e80ef3e99cde5a4d1da8878f2ebc744b0e7efd741c37bbb55ed', '333b196bed978e17b84b35951cab1dde1992e1230214db2d74cd0054a68b3d68', '44C24C84-5F95-4E4B-94C3-BC5541AC12F8', 'ios', '8b3236e8-a93f-4cc8-8dea-5bf7f8c8e4f8', 'custom', NULL, '110.93.250.194', 'StreamMii/1 CFNetwork/1312 Darwin/20.6.0', '2022-07-07 12:55:34', '2022-07-07 12:55:34', NULL),
(72, 24, '867357caa1108d39946d5087846ca72298c5d71ed5817eb250fb9d8e9b317880', '64cb61b461f323961026f711f6bde7f12fa69f4a2c6f3b658f9cdd0e3aab667e', 'BEE8819A-0483-43A9-903E-2D74E39B5FC4', 'ios', '45cf6a2c-00df-4229-971b-c6fa13e43f83', 'custom', NULL, '110.93.250.194', 'StreamMii/1 CFNetwork/1240.0.4 Darwin/20.6.0', '2022-07-08 14:24:23', '2022-07-08 14:24:23', NULL),
(73, 24, 'cd7d1a644a31d7213bcdb7ae14140bb004c33e494271f9d6e4caf00650ab51c7', '26e48a63073e02b3fa84d4969debf6ebf285837770a58fa033e779253feccd51', 'F4CC6A5D-D5E8-4C76-AC5D-10456BCFCC05', 'ios', 'ae448095-8314-412d-a4de-d31def176088', 'custom', NULL, '110.93.250.194', 'StreamMii/1 CFNetwork/1329 Darwin/21.3.0', '2022-07-12 13:40:07', '2022-07-12 13:40:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_block`
--

CREATE TABLE `user_block` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `actor_id` bigint(20) UNSIGNED NOT NULL,
  `target_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_coins`
--

CREATE TABLE `user_coins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscription_package_id` int(11) NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `gateway_transaction_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `gateway_original_transaction_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `gateway_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gateway_response` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `coin` int(11) NOT NULL DEFAULT '0',
  `amount` double(10,2) NOT NULL DEFAULT '0.00',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_coins`
--

INSERT INTO `user_coins` (`id`, `slug`, `subscription_package_id`, `user_id`, `gateway_transaction_id`, `gateway_original_transaction_id`, `gateway_type`, `gateway_response`, `coin`, `amount`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '61fcd6ded4c14', 6, 32, 'GPA.3370-1606-6050-64758', '0', 'android', '{\n  \"developerPayloadAndroid\": \"\",\n  \"purchaseStateAndroid\": 1,\n  \"obfuscatedProfileIdAndroid\": \"\",\n  \"autoRenewingAndroid\": false,\n  \"isAcknowledgedAndroid\": false,\n  \"signatureAndroid\": \"mKdLx457r/mrwsVCpwM6KTUmx2NbE9TNZ473ZbYtFopqOIGqX4OSluczoJqdsNFz/XO6b9UO1G3Ual4wptmtncvmyOuRoRCM7R5UgcjZZFw/5ib6YOo3rxTEh6IJhncdae7iXgJ5RU+qW1c00PUAxgLeHWfnakvLst+hPtWRn/jwKzHIgDDtvQgCqOQdZQZFIcm/x6VBO55SZrg1oHuvrWvT4IfZD1MWqfMisOEjXwMRW1c2FfW4OE+umNwwCBbM0dwOvPBjTzjMWe2V61Sb67PPglJrijWYnEkfKaZBag5xzo/UxIjtPMmpk0HcZvsQBbuATdd2wq0PQVHNJdsLzA==\",\n  \"dataAndroid\": \"{\\\"orderId\\\":\\\"GPA.3370-1606-6050-64758\\\",\\\"packageName\\\":\\\"com.streammii\\\",\\\"productId\\\":\\\"com.streammii.tentokens\\\",\\\"purchaseTime\\\":1643953503561,\\\"purchaseState\\\":0,\\\"purchaseToken\\\":\\\"bekkgjapamnkefiohpalhbbe.AO-J1Oyck_hsWswFg3pIJ9GmeoSyIsXwmIt23gGRGVuCOoF7p4hrAyualZnVGAfIKiaOnu0VACZOoszrvZ9UhzjAJqfmMLgG6g\\\",\\\"quantity\\\":1,\\\"acknowledged\\\":false}\",\n  \"transactionDate\": 1643953503561,\n  \"transactionId\": \"GPA.3370-1606-6050-64758\",\n  \"purchaseToken\": \"bekkgjapamnkefiohpalhbbe.AO-J1Oyck_hsWswFg3pIJ9GmeoSyIsXwmIt23gGRGVuCOoF7p4hrAyualZnVGAfIKiaOnu0VACZOoszrvZ9UhzjAJqfmMLgG6g\",\n  \"obfuscatedAccountIdAndroid\": \"\",\n  \"productId\": \"com.streammii.tentokens\",\n  \"transactionReceipt\": \"{\\\"orderId\\\":\\\"GPA.3370-1606-6050-64758\\\",\\\"packageName\\\":\\\"com.streammii\\\",\\\"productId\\\":\\\"com.streammii.tentokens\\\",\\\"purchaseTime\\\":1643953503561,\\\"purchaseState\\\":0,\\\"purchaseToken\\\":\\\"bekkgjapamnkefiohpalhbbe.AO-J1Oyck_hsWswFg3pIJ9GmeoSyIsXwmIt23gGRGVuCOoF7p4hrAyualZnVGAfIKiaOnu0VACZOoszrvZ9UhzjAJqfmMLgG6g\\\",\\\"quantity\\\":1,\\\"acknowledged\\\":false}\",\n  \"packageNameAndroid\": \"com.streammii\"\n}', 10, 1.99, '2022-02-04 07:33:50', '2022-02-04 07:33:50', NULL),
(2, '61fcd6f221538', 1, 32, '1000000961642888', '1000000961642888', 'ios', '{\n  \"quantity\": \"1\",\n  \"product_id\": \"com.streammii.tentokens\",\n  \"transaction_id\": \"1000000961642888\",\n  \"original_transaction_id\": \"1000000961642888\",\n  \"purchase_date\": \"2022-02-03 05:26:52 Etc/GMT\",\n  \"purchase_date_ms\": \"1643866012000\",\n  \"purchase_date_pst\": \"2022-02-02 21:26:52 America/Los_Angeles\",\n  \"original_purchase_date\": \"2022-02-03 05:26:52 Etc/GMT\",\n  \"original_purchase_date_ms\": \"1643866012000\",\n  \"original_purchase_date_pst\": \"2022-02-02 21:26:52 America/Los_Angeles\",\n  \"is_trial_period\": \"false\",\n  \"in_app_ownership_type\": \"PURCHASED\"\n}', 10, 1.99, '2022-02-04 07:34:10', '2022-02-04 07:34:10', NULL),
(3, '61fcd75143162', 6, 25, 'GPA.3300-4135-7582-13054', '0', 'android', '{\"developerPayloadAndroid\":\"\",\"purchaseStateAndroid\":1,\"obfuscatedProfileIdAndroid\":\"\",\"autoRenewingAndroid\":false,\"isAcknowledgedAndroid\":false,\"signatureAndroid\":\"WrP0dWSiQJh94AyUnCxDwFH5+i/muVu/srLAOZrxlJJWmKtzBj6ZJ4bdVklQtbUawEOD8zUviVfSO10SEFkPRssII+0hIciiIM+QPVAvBKi4Aetq3CK62CRK3f7T3CnO6nlPq5KeXwS+9HVXftlpxIHGpTQR2eyKKw+EhbLF+r+LMPthFHq/mIRCQOD8ckiLIZlAGE9EkuTWljsJ8YQ4pUfKnTAzHtd9pVTP3SZ/8QO1VhAwAmRsM4QcLO8t/2vB8ETQhar3SklZ1PlzA0DwnQApCQnu0IQMqZ6MZ5hSPGTVTAaYQHr0BdHtwqJLWOPH+S1dXTAciom0N8QOhLOMkg==\",\"dataAndroid\":\"{\\\"orderId\\\":\\\"GPA.3300-4135-7582-13054\\\",\\\"packageName\\\":\\\"com.streammii\\\",\\\"productId\\\":\\\"com.streammii.tentokens\\\",\\\"purchaseTime\\\":1643960142395,\\\"purchaseState\\\":0,\\\"purchaseToken\\\":\\\"chnbgfalhimlfhiondnolgcp.AO-J1Ow6NgcG6BFWyTd0MMwvM0ldbmfzibCD1ATvRpM1yq-4_PK5orI01gJV5G-WvHomPqZmuxWBuwuXVDwo3x6ZLGVMzGqaRg\\\",\\\"quantity\\\":1,\\\"acknowledged\\\":false}\",\"transactionDate\":1643960142395,\"transactionId\":\"GPA.3300-4135-7582-13054\",\"purchaseToken\":\"chnbgfalhimlfhiondnolgcp.AO-J1Ow6NgcG6BFWyTd0MMwvM0ldbmfzibCD1ATvRpM1yq-4_PK5orI01gJV5G-WvHomPqZmuxWBuwuXVDwo3x6ZLGVMzGqaRg\",\"obfuscatedAccountIdAndroid\":\"\",\"productId\":\"com.streammii.tentokens\",\"transactionReceipt\":\"{\\\"orderId\\\":\\\"GPA.3300-4135-7582-13054\\\",\\\"packageName\\\":\\\"com.streammii\\\",\\\"productId\\\":\\\"com.streammii.tentokens\\\",\\\"purchaseTime\\\":1643960142395,\\\"purchaseState\\\":0,\\\"purchaseToken\\\":\\\"chnbgfalhimlfhiondnolgcp.AO-J1Ow6NgcG6BFWyTd0MMwvM0ldbmfzibCD1ATvRpM1yq-4_PK5orI01gJV5G-WvHomPqZmuxWBuwuXVDwo3x6ZLGVMzGqaRg\\\",\\\"quantity\\\":1,\\\"acknowledged\\\":false}\",\"packageNameAndroid\":\"com.streammii\"}', 10, 1.99, '2022-02-04 07:35:45', '2022-02-04 07:35:45', NULL),
(4, '61fcdbd1b285a', 6, 25, 'GPA.3337-0303-7394-36302', '0', 'android', '{\"developerPayloadAndroid\":\"\",\"purchaseStateAndroid\":1,\"obfuscatedProfileIdAndroid\":\"\",\"autoRenewingAndroid\":false,\"isAcknowledgedAndroid\":false,\"signatureAndroid\":\"Yqb1G4B0hMkvxSqRbJ+NOJ1RABjLZO46WoKeknOsbTUV7cQhwRHRl06JTnwpi00XAcb8LD1W6x7a1CFMPbFdrECDSnVrQdtF/nS76hg9J7Bp7re3kfO4SNw8zOTJAlD2XvWIcSJS/ts8DlVmXc1riAodfeqHtbCXpvkb4gUjLMGWqj4UMC2gvIoiwykIFkCOTfoamPv3/wjiQrvKbjFSpirljUzb9PQiZ2WFMHkiwvssEngLZ8P+ui8yEWEFfnkAgujomMHLx38Z7STjtnzpCy38bPF4eUm9vPHeOVM2zR1IY6EFUxYVjopHIkPDOyCSJ3FOXWbzuL5OoLZATANwyg==\",\"dataAndroid\":\"{\\\"orderId\\\":\\\"GPA.3337-0303-7394-36302\\\",\\\"packageName\\\":\\\"com.streammii\\\",\\\"productId\\\":\\\"com.streammii.tentokens\\\",\\\"purchaseTime\\\":1643961294830,\\\"purchaseState\\\":0,\\\"purchaseToken\\\":\\\"oieapjamnfibdofmlpmhbdfk.AO-J1OzrUBjf59bJScMd0-Iq9466pvX0DuFaa1Ha7j4qHXs3q-SXg_3S0z9qP1uArLVYyySgSAzVmghDCX5xPPC0nH4zpxyd8A\\\",\\\"quantity\\\":1,\\\"acknowledged\\\":false}\",\"transactionDate\":1643961294830,\"transactionId\":\"GPA.3337-0303-7394-36302\",\"purchaseToken\":\"oieapjamnfibdofmlpmhbdfk.AO-J1OzrUBjf59bJScMd0-Iq9466pvX0DuFaa1Ha7j4qHXs3q-SXg_3S0z9qP1uArLVYyySgSAzVmghDCX5xPPC0nH4zpxyd8A\",\"obfuscatedAccountIdAndroid\":\"\",\"productId\":\"com.streammii.tentokens\",\"transactionReceipt\":\"{\\\"orderId\\\":\\\"GPA.3337-0303-7394-36302\\\",\\\"packageName\\\":\\\"com.streammii\\\",\\\"productId\\\":\\\"com.streammii.tentokens\\\",\\\"purchaseTime\\\":1643961294830,\\\"purchaseState\\\":0,\\\"purchaseToken\\\":\\\"oieapjamnfibdofmlpmhbdfk.AO-J1OzrUBjf59bJScMd0-Iq9466pvX0DuFaa1Ha7j4qHXs3q-SXg_3S0z9qP1uArLVYyySgSAzVmghDCX5xPPC0nH4zpxyd8A\\\",\\\"quantity\\\":1,\\\"acknowledged\\\":false}\",\"packageNameAndroid\":\"com.streammii\"}', 10, 1.99, '2022-02-04 07:54:57', '2022-02-04 07:54:57', NULL),
(5, '61fced50707bd', 9, 25, 'GPA.3399-3959-5019-43429', '0', 'android', '{\"developerPayloadAndroid\":\"\",\"purchaseStateAndroid\":1,\"obfuscatedProfileIdAndroid\":\"\",\"autoRenewingAndroid\":false,\"isAcknowledgedAndroid\":false,\"signatureAndroid\":\"ftuRKpaxdPWo2N+z1/qNlcDxaqJ3Uc0HhtOSSVPZqjqbassy0O1vcWoouLVgnJRa6NVH00CaegrBze3H9FvA1qCxWoffCWePRHBlK/Sj9aGkbV8eF9hjz3XfNZ+nHK7LJjw4R0FPWmB8nP1bmbIezm9VV4zCTxNKQwFMBUejg9aidEQpWNcmjghcTDzt23Dy/+f/U3Cm5gY3/nera1DqYM+5o92YBaZU07EnTmX75e/NZfNc7zH1ktaRRXv2SXmcBR0waokk2CHFdxs+QHcdmaA2RZjsjP2Pt35s8Vt2gUPa4G5BlNd1a2gdK+99gS4SjDSf45PLgNfnfIJil0ONgA==\",\"dataAndroid\":\"{\\\"orderId\\\":\\\"GPA.3399-3959-5019-43429\\\",\\\"packageName\\\":\\\"com.streammii\\\",\\\"productId\\\":\\\"com.streammii.250tokens\\\",\\\"purchaseTime\\\":1643965765841,\\\"purchaseState\\\":0,\\\"purchaseToken\\\":\\\"kbpanjkgadbanaepogjggdlm.AO-J1OzAqF5h-vIw6E1-2F01zLjWqjLrxBNnpuMZnCnUMnhCUYMUyaz-IQyrLcKSC0S2vBvw7aWCV1vVmOIhT9QmldsYsQGGZg\\\",\\\"quantity\\\":1,\\\"acknowledged\\\":false}\",\"transactionDate\":1643965765841,\"transactionId\":\"GPA.3399-3959-5019-43429\",\"purchaseToken\":\"kbpanjkgadbanaepogjggdlm.AO-J1OzAqF5h-vIw6E1-2F01zLjWqjLrxBNnpuMZnCnUMnhCUYMUyaz-IQyrLcKSC0S2vBvw7aWCV1vVmOIhT9QmldsYsQGGZg\",\"obfuscatedAccountIdAndroid\":\"\",\"productId\":\"com.streammii.250tokens\",\"transactionReceipt\":\"{\\\"orderId\\\":\\\"GPA.3399-3959-5019-43429\\\",\\\"packageName\\\":\\\"com.streammii\\\",\\\"productId\\\":\\\"com.streammii.250tokens\\\",\\\"purchaseTime\\\":1643965765841,\\\"purchaseState\\\":0,\\\"purchaseToken\\\":\\\"kbpanjkgadbanaepogjggdlm.AO-J1OzAqF5h-vIw6E1-2F01zLjWqjLrxBNnpuMZnCnUMnhCUYMUyaz-IQyrLcKSC0S2vBvw7aWCV1vVmOIhT9QmldsYsQGGZg\\\",\\\"quantity\\\":1,\\\"acknowledged\\\":false}\",\"packageNameAndroid\":\"com.streammii\"}', 250, 19.99, '2022-02-04 09:09:36', '2022-02-04 09:09:36', NULL),
(6, '62a343eff25a7', 1, 35, '1000000961642888', '1000000961642888', 'ios', '{\n  \"quantity\": \"1\",\n  \"product_id\": \"com.streammii.tentokens\",\n  \"transaction_id\": \"1000000961642888\",\n  \"original_transaction_id\": \"1000000961642888\",\n  \"purchase_date\": \"2022-02-03 05:26:52 Etc/GMT\",\n  \"purchase_date_ms\": \"1643866012000\",\n  \"purchase_date_pst\": \"2022-02-02 21:26:52 America/Los_Angeles\",\n  \"original_purchase_date\": \"2022-02-03 05:26:52 Etc/GMT\",\n  \"original_purchase_date_ms\": \"1643866012000\",\n  \"original_purchase_date_pst\": \"2022-02-02 21:26:52 America/Los_Angeles\",\n  \"is_trial_period\": \"false\",\n  \"in_app_ownership_type\": \"PURCHASED\"\n}', 10, 1.99, '2022-06-10 13:15:27', '2022-06-10 13:15:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_coin_support`
--

CREATE TABLE `user_coin_support` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `receiver_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `generated_post_id` int(11) NOT NULL DEFAULT '0',
  `coins` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_coin_support`
--

INSERT INTO `user_coin_support` (`id`, `slug`, `sender_id`, `receiver_id`, `post_id`, `generated_post_id`, `coins`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '361654867003', 35, 36, 40, 41, 20, '2022-06-10 13:16:43', '2022-06-10 13:16:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_comments`
--

CREATE TABLE `user_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_id` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `total_like` int(11) NOT NULL DEFAULT '0',
  `total_dislike` int(11) NOT NULL DEFAULT '0',
  `reply_count` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_comments`
--

INSERT INTO `user_comments` (`id`, `parent_id`, `user_id`, `module`, `module_id`, `comment`, `status`, `total_like`, `total_dislike`, `reply_count`, `created_at`, `updated_at`, `deleted_at`, `slug`) VALUES
(4, 0, 8, 'posts', 7, 'test', '1', 0, 0, 0, '2022-01-14 06:22:07', '2022-01-14 06:22:07', NULL, '61e1168f026c4861e1168f026c6'),
(5, 4, 8, 'posts', 7, 'test', '1', 0, 1, 0, '2022-01-14 06:22:14', '2022-01-14 06:22:14', NULL, '61e11696d1b01861e11696d1b04'),
(6, 4, 5, 'posts', 7, 'Yes', '1', 0, 0, 0, '2022-01-14 06:23:16', '2022-01-14 06:23:16', NULL, '61e116d46e040561e116d46e043'),
(7, 0, 5, 'posts', 7, 'Test 1', '1', 0, 0, 0, '2022-01-14 06:23:43', '2022-01-14 06:23:43', NULL, '61e116efedb88561e116efedb8a'),
(8, 4, 8, 'posts', 7, '???', '1', 0, 0, 0, '2022-01-14 06:24:06', '2022-01-14 06:24:06', NULL, '61e1170613b6e861e1170613b71'),
(9, 4, 5, 'posts', 7, '?', '1', 0, 0, 0, '2022-01-14 06:24:23', '2022-01-14 06:24:23', NULL, '61e11717d0b04561e11717d0b07'),
(10, 4, 5, 'posts', 7, 'Hi', '1', 0, 0, 0, '2022-01-14 07:32:53', '2022-01-14 07:32:53', NULL, '61e12725714ee561e12725714f1'),
(11, 4, 8, 'posts', 7, 'hi', '1', 0, 0, 0, '2022-01-14 07:33:49', '2022-01-14 07:33:49', NULL, '61e1275d45e03861e1275d45e06'),
(12, 0, 8, 'posts', 7, 'hi', '1', 0, 0, 0, '2022-01-14 07:33:56', '2022-01-14 07:33:56', NULL, '61e12764c09b3861e12764c09b5'),
(13, 12, 5, 'posts', 7, 'Test', '1', 0, 0, 0, '2022-01-14 07:35:37', '2022-01-14 07:35:37', NULL, '61e127c9d767f561e127c9d7683'),
(14, 0, 12, 'posts', 11, 'Good', '1', 0, 0, 0, '2022-01-14 14:02:45', '2022-01-14 14:02:45', NULL, '61e182858e2a71261e182858e2a9'),
(15, 0, 12, 'posts', 11, 'Hi', '1', 0, 0, 0, '2022-01-14 14:05:10', '2022-01-14 14:05:10', NULL, '61e18316a952d1261e18316a952f'),
(16, 0, 12, 'posts', 11, 'Ji', '1', 0, 0, 0, '2022-01-14 14:20:46', '2022-01-14 14:20:46', NULL, '61e186bea1f651261e186bea1f67'),
(17, 0, 12, 'posts', 11, 'Hi', '1', 0, 0, 0, '2022-01-14 14:22:45', '2022-01-14 14:22:45', NULL, '61e187354f42a1261e187354f42c'),
(18, 0, 12, 'posts', 11, 'Hi', '1', 0, 0, 0, '2022-01-14 14:24:03', '2022-01-14 14:24:03', NULL, '61e187837b8501261e187837b852'),
(19, 0, 12, 'posts', 11, 'Hipp', '1', 0, 0, 0, '2022-01-14 14:25:58', '2022-01-14 14:25:58', NULL, '61e187f659d741261e187f659d76'),
(20, 0, 12, 'posts', 11, 'Pp', '1', 0, 0, 0, '2022-01-14 14:28:25', '2022-01-14 14:28:25', NULL, '61e18889e8d3d1261e18889e8d3f'),
(21, 0, 14, 'posts', 11, 'Ponka', '1', 0, 0, 0, '2022-01-14 14:28:43', '2022-01-14 14:28:43', NULL, '61e1889bf3a2e1461e1889bf3a30'),
(22, 0, 12, 'posts', 11, 'Ll', '1', 0, 0, 0, '2022-01-14 14:29:05', '2022-01-14 14:29:05', NULL, '61e188b1583211261e188b158323'),
(23, 0, 12, 'posts', 11, 'Lop', '1', 0, 0, 0, '2022-01-14 14:29:21', '2022-01-14 14:29:21', NULL, '61e188c195db41261e188c195db6'),
(24, 0, 15, 'posts', 13, 'Test', '1', 0, 0, 0, '2022-01-14 15:13:51', '2022-01-14 15:13:51', NULL, '61e1932fd2acd1561e1932fd2ad0'),
(25, 0, 16, 'posts', 13, 'Hi', '1', 0, 0, 0, '2022-01-14 15:14:10', '2022-01-14 15:14:10', NULL, '61e19342b661b1661e19342b661e'),
(26, 25, 15, 'posts', 13, 'Hi', '1', 0, 0, 0, '2022-01-14 15:14:26', '2022-01-14 15:14:26', NULL, '61e1935200b6b1561e1935200b6e'),
(27, 0, 17, 'posts', 14, '❤️❤️', '1', 0, 0, 0, '2022-01-14 19:51:05', '2022-01-14 19:51:05', NULL, '61e1d429bd8d41761e1d429bd8d7'),
(28, 0, 18, 'posts', 20, 'Hdhd', '1', 2, 0, 0, '2022-01-14 23:44:47', '2022-01-14 23:44:47', NULL, '61e20aef50a481861e20aef50a4a'),
(29, 0, 18, 'posts', 20, 'Shdbx', '1', 0, 0, 0, '2022-01-14 23:44:50', '2022-01-14 23:44:50', NULL, '61e20af21fa981861e20af21fa9a'),
(30, 28, 18, 'posts', 20, 'Hey', '1', 1, 1, 0, '2022-01-14 23:44:55', '2022-01-14 23:44:55', NULL, '61e20af7f193c1861e20af7f193e'),
(31, 0, 19, 'posts', 18, 'Hey', '1', 1, 0, 0, '2022-01-15 00:08:04', '2022-01-15 00:08:04', NULL, '61e210644d6851961e210644d687'),
(32, 29, 17, 'posts', 20, 'Hey', '1', 0, 1, 0, '2022-01-15 01:23:45', '2022-01-15 01:23:45', NULL, '61e222213f1221761e222213f125'),
(33, 0, 17, 'posts', 20, 'Hey', '1', 1, 0, 0, '2022-01-15 01:23:48', '2022-01-15 01:23:48', NULL, '61e222248bf961761e222248bf99'),
(34, 0, 25, 'posts', 24, 'Hello', '1', 0, 0, 0, '2022-01-17 13:53:43', '2022-01-17 13:53:43', NULL, '61e574e79661f2561e574e796621'),
(35, 34, 25, 'posts', 24, 'Hello', '1', 0, 0, 0, '2022-01-17 13:54:01', '2022-01-17 13:54:01', NULL, '61e574f9729512561e574f972954'),
(36, 34, 25, 'posts', 24, 'Hello', '1', 0, 0, 0, '2022-01-17 13:54:13', '2022-01-17 13:54:13', NULL, '61e575054b9ac2561e575054b9ae'),
(37, 0, 24, 'posts', 24, 'Jnskjvdv', '1', 0, 0, 0, '2022-01-18 07:00:47', '2022-01-18 07:00:47', NULL, '61e6659fd565f2461e6659fd5662'),
(38, 34, 24, 'posts', 24, 'Sdbsjdbv', '1', 0, 0, 0, '2022-01-18 07:00:57', '2022-01-18 07:00:57', NULL, '61e665a908ee82461e665a908eeb'),
(39, 34, 26, 'posts', 24, 'Skcnsncksncknsc', '1', 0, 0, 0, '2022-01-18 12:18:53', '2022-01-18 12:18:53', NULL, '61e6b02da4ce92661e6b02da4ceb'),
(40, 0, 25, 'posts', 29, 'Ccxx', '1', 0, 0, 0, '2022-02-03 12:40:12', '2022-02-03 12:40:12', NULL, '61fbcd2c9bef32561fbcd2c9bef6'),
(41, 0, 25, 'posts', 29, 'Hhhh', '1', 0, 0, 0, '2022-02-03 12:40:17', '2022-02-03 12:40:17', NULL, '61fbcd317cb8e2561fbcd317cb91'),
(42, 0, 25, 'posts', 29, 'Bjj', '1', 0, 0, 0, '2022-02-03 12:40:24', '2022-02-03 12:40:24', NULL, '61fbcd38496c52561fbcd38496c8'),
(43, 42, 25, 'posts', 29, 'Ddc', '1', 0, 0, 0, '2022-02-03 12:40:40', '2022-02-03 12:40:40', NULL, '61fbcd48981c02561fbcd48981c3'),
(44, 42, 25, 'posts', 29, 'Ddc', '1', 0, 0, 0, '2022-02-03 12:41:39', '2022-02-03 12:41:39', NULL, '61fbcd83085ef2561fbcd83085f3'),
(45, 0, 35, 'posts', 40, 'Hello', '1', 0, 0, 0, '2022-06-10 13:17:08', '2022-06-10 13:17:08', NULL, '62a344546aba33562a344546aba5'),
(46, 0, 35, 'posts', 42, 'Hello world', '1', 0, 0, 0, '2022-06-10 13:38:23', '2022-06-10 13:38:23', '2022-06-10 17:41:11', '62a3494fc4c4b3562a3494fc4c4d'),
(47, 46, 36, 'posts', 42, '@Mia hello', '1', 0, 0, 0, '2022-06-10 13:39:09', '2022-06-10 13:39:09', '2022-06-10 17:41:11', '62a3497d3c5e43662a3497d3c5e6'),
(48, 0, 36, 'posts', 43, 'Hello', '1', 0, 0, 0, '2022-06-10 13:42:46', '2022-06-10 13:42:46', '2022-06-10 17:43:01', '62a34a56cda093662a34a56cda0b');

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'App User', 'app-user', '1', '2022-01-11 05:44:02', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_like`
--

CREATE TABLE `user_like` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `is_liked` int(11) NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_like`
--

INSERT INTO `user_like` (`id`, `is_liked`, `user_id`, `module`, `module_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(45, 0, 18, 'posts', 14, '2022-01-14 19:50:01', '2022-01-14 19:50:01', '2022-06-10 17:43:01'),
(46, 0, 17, 'posts', 14, '2022-01-14 19:50:59', '2022-01-14 19:50:59', '2022-06-10 17:43:01'),
(54, 0, 18, 'user_comments', 30, '2022-01-14 23:45:23', '2022-01-14 23:45:23', NULL),
(55, 0, 18, 'user_comments', 28, '2022-01-14 23:45:24', '2022-01-14 23:45:24', NULL),
(56, 0, 18, 'posts', 20, '2022-01-14 23:45:27', '2022-01-14 23:45:27', '2022-06-10 17:43:01'),
(57, 0, 18, 'posts', 17, '2022-01-14 23:45:54', '2022-01-14 23:45:54', '2022-06-10 17:43:01'),
(58, 0, 19, 'posts', 20, '2022-01-15 00:07:57', '2022-01-15 00:07:57', '2022-06-10 17:43:01'),
(59, 0, 19, 'posts', 19, '2022-01-15 00:08:00', '2022-01-15 00:08:00', '2022-06-10 17:43:01'),
(60, 0, 19, 'posts', 18, '2022-01-15 00:08:01', '2022-01-15 00:08:01', '2022-06-10 17:43:01'),
(61, 0, 19, 'user_comments', 31, '2022-01-15 00:08:06', '2022-01-15 00:08:06', NULL),
(63, 0, 17, 'user_comments', 28, '2022-01-15 01:23:41', '2022-01-15 01:23:41', NULL),
(64, 0, 17, 'user_comments', 33, '2022-01-15 01:23:53', '2022-01-15 01:23:53', NULL),
(68, 0, 20, 'posts', 21, '2022-01-15 01:45:51', '2022-01-15 01:45:51', '2022-06-10 17:43:01'),
(69, 0, 35, 'posts', 40, '2022-06-10 13:17:01', '2022-06-10 13:17:01', '2022-06-10 17:43:01'),
(73, 0, 35, 'posts', 42, '2022-06-10 13:38:14', '2022-06-10 13:38:14', '2022-06-10 17:43:01'),
(76, 0, 24, 'posts', 24, '2022-07-07 07:12:58', '2022-07-07 07:12:58', NULL),
(80, 0, 25, 'posts', 24, '2022-07-07 08:57:48', '2022-07-07 08:57:48', NULL),
(81, 0, 24, 'posts', 93, '2022-07-13 06:18:12', '2022-07-13 06:18:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_reports`
--

CREATE TABLE `user_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_type_id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_id` int(11) NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_reports`
--

INSERT INTO `user_reports` (`id`, `user_id`, `slug`, `report_type_id`, `module`, `module_id`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 18, '561e215063e82218', 5, 'user', 19, 'Bad', '2022-01-15 00:27:50', '2022-01-15 00:27:50', NULL),
(2, 18, '261e2157a16ddd18', 2, 'user', 21, NULL, '2022-01-15 00:29:46', '2022-01-15 00:29:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_subscription`
--

CREATE TABLE `user_subscription` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subscription_package_id` bigint(20) UNSIGNED NOT NULL,
  `gateway_transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gateway_original_transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','expired','cancel') COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `application_setting`
--
ALTER TABLE `application_setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`),
  ADD KEY `meta_key` (`meta_key`);

--
-- Indexes for table `artist_types`
--
ALTER TABLE `artist_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artist_types_slug_index` (`slug`);

--
-- Indexes for table `block_users`
--
ALTER TABLE `block_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `block_users_actor_id_foreign` (`actor_id`),
  ADD KEY `block_users_target_id_foreign` (`target_id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_message_delete`
--
ALTER TABLE `chat_message_delete`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_message_status`
--
ALTER TABLE `chat_message_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_room_users`
--
ALTER TABLE `chat_room_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_modules`
--
ALTER TABLE `cms_modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cms_modules_name_unique` (`name`),
  ADD UNIQUE KEY `cms_modules_route_name_unique` (`route_name`);

--
-- Indexes for table `cms_module_permissions`
--
ALTER TABLE `cms_module_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_module_permissions_cms_role_id_foreign` (`cms_role_id`),
  ADD KEY `cms_module_permissions_cms_module_id_foreign` (`cms_module_id`);

--
-- Indexes for table `cms_roles`
--
ALTER TABLE `cms_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_users`
--
ALTER TABLE `cms_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cms_users_username_unique` (`username`),
  ADD UNIQUE KEY `cms_users_slug_unique` (`slug`),
  ADD UNIQUE KEY `cms_users_email_unique` (`email`),
  ADD UNIQUE KEY `cms_users_mobile_no_unique` (`mobile_no`),
  ADD KEY `cms_users_cms_role_id_foreign` (`cms_role_id`);

--
-- Indexes for table `cms_widgets`
--
ALTER TABLE `cms_widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_widgets_widget_type_index` (`widget_type`);

--
-- Indexes for table `cms_widget_role`
--
ALTER TABLE `cms_widget_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_widget_role_cms_widget_id_foreign` (`cms_widget_id`),
  ADD KEY `cms_widget_role_cms_role_id_foreign` (`cms_role_id`);

--
-- Indexes for table `content_management`
--
ALTER TABLE `content_management`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_management_slug_index` (`slug`);

--
-- Indexes for table `dislikes`
--
ALTER TABLE `dislikes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dislikes_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_slug_index` (`slug`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `followers_actor_id_foreign` (`actor_id`),
  ADD KEY `followers_target_id_foreign` (`target_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `mail_templates`
--
ALTER TABLE `mail_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mail_templates_identifier_unique` (`identifier`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_module_module_id_index` (`module`,`module_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `music_genres`
--
ALTER TABLE `music_genres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `music_genres_slug_index` (`slug`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_unique_id_identifier_target_id_index` (`unique_id`,`identifier`,`target_id`);

--
-- Indexes for table `notification_setting`
--
ALTER TABLE `notification_setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_setting_user_id_index` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `post_tag_users`
--
ALTER TABLE `post_tag_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_tag_users_post_id_foreign` (`post_id`),
  ADD KEY `post_tag_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `report_types`
--
ALTER TABLE `report_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reset_password`
--
ALTER TABLE `reset_password`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_packages`
--
ALTER TABLE `subscription_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_slug_unique` (`slug`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `index1` (`user_group_id`,`slug`,`email`,`mobile_no`,`is_email_verify`,`status`);

--
-- Indexes for table `user_api_token`
--
ALTER TABLE `user_api_token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_api_token_api_token_unique` (`api_token`),
  ADD UNIQUE KEY `user_api_token_refresh_token_unique` (`refresh_token`),
  ADD KEY `user_api_token_user_id_foreign` (`user_id`),
  ADD KEY `user_api_token_api_token_index` (`api_token`);

--
-- Indexes for table `user_block`
--
ALTER TABLE `user_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_block_actor_id_foreign` (`actor_id`),
  ADD KEY `user_block_target_id_foreign` (`target_id`);

--
-- Indexes for table `user_coins`
--
ALTER TABLE `user_coins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_coins_slug_unique` (`slug`),
  ADD KEY `user_coins_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_coin_support`
--
ALTER TABLE `user_coin_support`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_coin_support_slug_unique` (`slug`),
  ADD KEY `user_coin_support_sender_id_foreign` (`sender_id`),
  ADD KEY `user_coin_support_receiver_id_foreign` (`receiver_id`),
  ADD KEY `user_coin_support_post_id_foreign` (`post_id`);

--
-- Indexes for table `user_comments`
--
ALTER TABLE `user_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_comments_actor_id_foreign` (`user_id`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_like`
--
ALTER TABLE `user_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_like_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_reports`
--
ALTER TABLE `user_reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_reports_slug_unique` (`slug`),
  ADD KEY `user_reports_user_id_foreign` (`user_id`),
  ADD KEY `user_reports_report_type_id_foreign` (`report_type_id`);

--
-- Indexes for table `user_subscription`
--
ALTER TABLE `user_subscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_subscription_user_id_foreign` (`user_id`),
  ADD KEY `user_subscription_subscription_package_id_foreign` (`subscription_package_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `application_setting`
--
ALTER TABLE `application_setting`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `artist_types`
--
ALTER TABLE `artist_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `block_users`
--
ALTER TABLE `block_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chat_message_delete`
--
ALTER TABLE `chat_message_delete`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_message_status`
--
ALTER TABLE `chat_message_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chat_room_users`
--
ALTER TABLE `chat_room_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cms_modules`
--
ALTER TABLE `cms_modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cms_module_permissions`
--
ALTER TABLE `cms_module_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cms_roles`
--
ALTER TABLE `cms_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cms_users`
--
ALTER TABLE `cms_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cms_widgets`
--
ALTER TABLE `cms_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cms_widget_role`
--
ALTER TABLE `cms_widget_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `content_management`
--
ALTER TABLE `content_management`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dislikes`
--
ALTER TABLE `dislikes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mail_templates`
--
ALTER TABLE `mail_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `music_genres`
--
ALTER TABLE `music_genres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `notification_setting`
--
ALTER TABLE `notification_setting`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=321;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `post_tag_users`
--
ALTER TABLE `post_tag_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `report_types`
--
ALTER TABLE `report_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reset_password`
--
ALTER TABLE `reset_password`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_packages`
--
ALTER TABLE `subscription_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `user_api_token`
--
ALTER TABLE `user_api_token`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `user_block`
--
ALTER TABLE `user_block`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_coins`
--
ALTER TABLE `user_coins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_coin_support`
--
ALTER TABLE `user_coin_support`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_comments`
--
ALTER TABLE `user_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_like`
--
ALTER TABLE `user_like`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `user_reports`
--
ALTER TABLE `user_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_subscription`
--
ALTER TABLE `user_subscription`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `block_users`
--
ALTER TABLE `block_users`
  ADD CONSTRAINT `block_users_actor_id_foreign` FOREIGN KEY (`actor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `block_users_target_id_foreign` FOREIGN KEY (`target_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_module_permissions`
--
ALTER TABLE `cms_module_permissions`
  ADD CONSTRAINT `cms_module_permissions_cms_module_id_foreign` FOREIGN KEY (`cms_module_id`) REFERENCES `cms_modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_module_permissions_cms_role_id_foreign` FOREIGN KEY (`cms_role_id`) REFERENCES `cms_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_users`
--
ALTER TABLE `cms_users`
  ADD CONSTRAINT `cms_users_cms_role_id_foreign` FOREIGN KEY (`cms_role_id`) REFERENCES `cms_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_widget_role`
--
ALTER TABLE `cms_widget_role`
  ADD CONSTRAINT `cms_widget_role_cms_role_id_foreign` FOREIGN KEY (`cms_role_id`) REFERENCES `cms_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_widget_role_cms_widget_id_foreign` FOREIGN KEY (`cms_widget_id`) REFERENCES `cms_widgets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dislikes`
--
ALTER TABLE `dislikes`
  ADD CONSTRAINT `dislikes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `followers_actor_id_foreign` FOREIGN KEY (`actor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `followers_target_id_foreign` FOREIGN KEY (`target_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notification_setting`
--
ALTER TABLE `notification_setting`
  ADD CONSTRAINT `notification_setting_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_tag_users`
--
ALTER TABLE `post_tag_users`
  ADD CONSTRAINT `post_tag_users_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_tag_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_api_token`
--
ALTER TABLE `user_api_token`
  ADD CONSTRAINT `user_api_token_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_block`
--
ALTER TABLE `user_block`
  ADD CONSTRAINT `user_block_actor_id_foreign` FOREIGN KEY (`actor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_block_target_id_foreign` FOREIGN KEY (`target_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_coins`
--
ALTER TABLE `user_coins`
  ADD CONSTRAINT `user_coins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_comments`
--
ALTER TABLE `user_comments`
  ADD CONSTRAINT `user_comments_actor_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_like`
--
ALTER TABLE `user_like`
  ADD CONSTRAINT `user_like_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_reports`
--
ALTER TABLE `user_reports`
  ADD CONSTRAINT `user_reports_report_type_id_foreign` FOREIGN KEY (`report_type_id`) REFERENCES `report_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_reports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_subscription`
--
ALTER TABLE `user_subscription`
  ADD CONSTRAINT `user_subscription_subscription_package_id_foreign` FOREIGN KEY (`subscription_package_id`) REFERENCES `subscription_packages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_subscription_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
