-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 25, 2025 at 09:37 PM
-- Server version: 10.11.13-MariaDB
-- PHP Version: 8.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app_concrete`
--

-- --------------------------------------------------------

--
-- Table structure for table `Announcements`
--

CREATE TABLE `Announcements` (
  `id` int(10) UNSIGNED NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Announcements`
--

INSERT INTO `Announcements` (`id`, `handle`, `dateCreated`) VALUES
(1, 'collect_site_information', 1750864310),
(2, 'welcome', 1750864310);

-- --------------------------------------------------------

--
-- Table structure for table `AnnouncementUserViews`
--

CREATE TABLE `AnnouncementUserViews` (
  `announcement_id` int(10) UNSIGNED NOT NULL,
  `dateViewed` int(11) DEFAULT NULL,
  `uID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `AnnouncementUserViews`
--

INSERT INTO `AnnouncementUserViews` (`announcement_id`, `dateViewed`, `uID`) VALUES
(1, 1750864386, 1),
(2, 1750864388, 1);

-- --------------------------------------------------------

--
-- Table structure for table `AreaLayoutColumns`
--

CREATE TABLE `AreaLayoutColumns` (
  `arLayoutColumnID` int(10) UNSIGNED NOT NULL,
  `arLayoutID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `arLayoutColumnIndex` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `arID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `arLayoutColumnDisplayID` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `AreaLayoutColumns`
--

INSERT INTO `AreaLayoutColumns` (`arLayoutColumnID`, `arLayoutID`, `arLayoutColumnIndex`, `arID`, `arLayoutColumnDisplayID`) VALUES
(1, 1, 0, 2, 1),
(2, 1, 1, 3, 2),
(3, 1, 2, 4, 3),
(4, 2, 0, 5, 4),
(5, 2, 1, 6, 5),
(6, 3, 0, 7, 6),
(7, 3, 1, 8, 7),
(8, 3, 2, 9, 8),
(9, 4, 0, 11, 9),
(10, 5, 0, 12, 10),
(11, 6, 0, 14, 11),
(12, 7, 0, 15, 12),
(13, 8, 0, 37, 13),
(14, 8, 1, 38, 14),
(15, 8, 2, 39, 15),
(16, 9, 0, 71, 16),
(17, 9, 1, 72, 17),
(18, 10, 0, 87, 18),
(19, 10, 1, 88, 19);

-- --------------------------------------------------------

--
-- Table structure for table `AreaLayoutCustomColumns`
--

CREATE TABLE `AreaLayoutCustomColumns` (
  `arLayoutColumnID` int(10) UNSIGNED NOT NULL,
  `arLayoutColumnWidth` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `AreaLayoutPresets`
--

CREATE TABLE `AreaLayoutPresets` (
  `arLayoutPresetID` int(10) UNSIGNED NOT NULL,
  `arLayoutID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `arLayoutPresetName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `AreaLayouts`
--

CREATE TABLE `AreaLayouts` (
  `arLayoutID` int(10) UNSIGNED NOT NULL,
  `arLayoutSpacing` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `arLayoutIsCustom` tinyint(1) NOT NULL DEFAULT 0,
  `arLayoutIsPreset` tinyint(1) NOT NULL DEFAULT 0,
  `arLayoutMaxColumns` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `arLayoutUsesThemeGridFramework` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `AreaLayouts`
--

INSERT INTO `AreaLayouts` (`arLayoutID`, `arLayoutSpacing`, `arLayoutIsCustom`, `arLayoutIsPreset`, `arLayoutMaxColumns`, `arLayoutUsesThemeGridFramework`) VALUES
(1, 0, 0, 0, 12, 1),
(2, 0, 0, 0, 12, 1),
(3, 0, 0, 0, 12, 1),
(4, 0, 0, 0, 12, 1),
(5, 0, 0, 0, 12, 1),
(6, 0, 0, 0, 12, 1),
(7, 0, 0, 0, 12, 1),
(8, 0, 0, 0, 12, 1),
(9, 0, 0, 0, 12, 1),
(10, 0, 0, 0, 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `AreaLayoutsUsingPresets`
--

CREATE TABLE `AreaLayoutsUsingPresets` (
  `arLayoutID` int(10) UNSIGNED NOT NULL,
  `preset` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `AreaLayoutThemeGridColumns`
--

CREATE TABLE `AreaLayoutThemeGridColumns` (
  `arLayoutColumnID` int(10) UNSIGNED NOT NULL,
  `arLayoutColumnSpan` int(10) UNSIGNED DEFAULT 0,
  `arLayoutColumnOffset` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `AreaLayoutThemeGridColumns`
--

INSERT INTO `AreaLayoutThemeGridColumns` (`arLayoutColumnID`, `arLayoutColumnSpan`, `arLayoutColumnOffset`) VALUES
(1, 4, 0),
(2, 4, 0),
(3, 4, 0),
(4, 4, 0),
(5, 8, 0),
(6, 4, 0),
(7, 4, 0),
(8, 4, 0),
(9, 12, 0),
(10, 12, 0),
(11, 12, 0),
(12, 12, 0),
(13, 4, 0),
(14, 4, 0),
(15, 4, 0),
(16, 6, 0),
(17, 6, 0),
(18, 7, 0),
(19, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `AreaPermissionAssignments`
--

CREATE TABLE `AreaPermissionAssignments` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `arHandle` varchar(255) NOT NULL,
  `pkID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `AreaPermissionBlockTypeAccessList`
--

CREATE TABLE `AreaPermissionBlockTypeAccessList` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `peID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `permission` varchar(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `AreaPermissionBlockTypeAccessListCustom`
--

CREATE TABLE `AreaPermissionBlockTypeAccessListCustom` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `peID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `btID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Areas`
--

CREATE TABLE `Areas` (
  `arID` int(10) UNSIGNED NOT NULL,
  `cID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `arHandle` varchar(255) NOT NULL,
  `arOverrideCollectionPermissions` tinyint(1) NOT NULL DEFAULT 0,
  `arInheritPermissionsFromAreaOnCID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `arIsGlobal` tinyint(1) NOT NULL DEFAULT 0,
  `arParentID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Areas`
--

INSERT INTO `Areas` (`arID`, `cID`, `arHandle`, `arOverrideCollectionPermissions`, `arInheritPermissionsFromAreaOnCID`, `arIsGlobal`, `arParentID`) VALUES
(1, 214, 'Main', 0, 0, 0, 0),
(2, 214, 'Main : 1', 0, 0, 0, 1),
(3, 214, 'Main : 2', 0, 0, 0, 1),
(4, 214, 'Main : 3', 0, 0, 0, 1),
(5, 214, 'Main : 4', 0, 0, 0, 1),
(6, 214, 'Main : 5', 0, 0, 0, 1),
(7, 214, 'Main : 6', 0, 0, 0, 1),
(8, 214, 'Main : 7', 0, 0, 0, 1),
(9, 214, 'Main : 8', 0, 0, 0, 1),
(10, 216, 'Main', 0, 0, 0, 0),
(11, 216, 'Main : 9', 0, 0, 0, 10),
(12, 216, 'Main : 10', 0, 0, 0, 10),
(13, 230, 'Main', 0, 0, 0, 0),
(14, 230, 'Main : 11', 0, 0, 0, 13),
(15, 230, 'Main : 12', 0, 0, 0, 13),
(16, 231, 'Main', 0, 0, 0, 0),
(17, 232, 'Main', 0, 0, 0, 0),
(18, 233, 'Main', 0, 0, 0, 0),
(19, 234, 'Main', 0, 0, 0, 0),
(20, 235, 'Main', 0, 0, 0, 0),
(21, 237, 'Main', 0, 0, 0, 0),
(22, 238, 'Main', 0, 0, 0, 0),
(23, 259, 'Page Header', 0, 0, 0, 0),
(24, 259, 'Main', 0, 0, 0, 0),
(25, 259, 'Sidebar', 0, 0, 0, 0),
(26, 259, 'Page Footer', 0, 0, 0, 0),
(27, 259, 'Page Footer : 1 : Title', 0, 0, 0, 26),
(28, 259, 'Page Footer : 1 : Body', 0, 0, 0, 26),
(29, 252, 'Page Header', 0, 0, 0, 0),
(30, 252, 'Resource Thumbnail', 0, 0, 0, 0),
(31, 252, 'Resource Title', 0, 0, 0, 0),
(32, 252, 'Resource Content', 0, 0, 0, 0),
(33, 1, 'Page Header', 0, 0, 0, 0),
(34, 1, 'Main', 0, 0, 0, 0),
(35, 1, 'Main : 2 : Column 1', 0, 0, 0, 34),
(36, 1, 'Main : 2 : Column 2', 0, 0, 0, 34),
(37, 1, 'Main : 13', 0, 0, 0, 34),
(38, 1, 'Main : 14', 0, 0, 0, 34),
(39, 1, 'Main : 15', 0, 0, 0, 34),
(40, 1, 'Main : 3 : Column 1', 0, 0, 0, 34),
(41, 1, 'Main : 3 : Column 2', 0, 0, 0, 34),
(42, 1, 'Main : 4 : Title', 0, 0, 0, 34),
(43, 1, 'Main : 4 : Body', 0, 0, 0, 34),
(44, 239, 'Main', 0, 0, 0, 0),
(45, 239, 'Main : 5 : Column 1', 0, 0, 0, 44),
(46, 239, 'Main : 5 : Column 2', 0, 0, 0, 44),
(47, 239, 'Main : 6 : Item 1', 0, 0, 0, 44),
(48, 239, 'Main : 6 : Item 2', 0, 0, 0, 44),
(49, 239, 'Main : 6 : Item 3', 0, 0, 0, 44),
(50, 239, 'Main : 6 : Item 4', 0, 0, 0, 44),
(51, 239, 'Main : 6 : Item 5', 0, 0, 0, 44),
(52, 239, 'Main : 6 : Item 6', 0, 0, 0, 44),
(53, 239, 'Main : 7 : Column 1', 0, 0, 0, 44),
(54, 239, 'Main : 7 : Column 2', 0, 0, 0, 44),
(55, 239, 'Main : 8 : Column 1', 0, 0, 0, 44),
(56, 239, 'Main : 8 : Column 2', 0, 0, 0, 44),
(57, 239, 'Main : 9 : Item 1', 0, 0, 0, 44),
(58, 239, 'Main : 9 : Item 2', 0, 0, 0, 44),
(59, 239, 'Main : 9 : Item 3', 0, 0, 0, 44),
(60, 239, 'Main : 9 : Item 4', 0, 0, 0, 44),
(61, 239, 'Main : 9 : Item 5', 0, 0, 0, 44),
(62, 239, 'Main : 9 : Item 6', 0, 0, 0, 44),
(63, 247, 'Page Header', 0, 0, 0, 0),
(64, 247, 'Main', 0, 0, 0, 0),
(65, 247, 'Main : 10 : Title', 0, 0, 0, 64),
(66, 247, 'Main : 10 : Body', 0, 0, 0, 64),
(67, 247, 'Main : 10 : Body : 11 : Item 1', 0, 0, 0, 66),
(68, 247, 'Main : 10 : Body : 11 : Item 2', 0, 0, 0, 66),
(69, 247, 'Main : 10 : Body : 11 : Item 3', 0, 0, 0, 66),
(70, 247, 'Main : 10 : Body : 11 : Item 4', 0, 0, 0, 66),
(71, 247, 'Main : 16', 0, 0, 0, 64),
(72, 247, 'Main : 17', 0, 0, 0, 64),
(73, 247, 'Main : 12 : Item 1', 0, 0, 0, 64),
(74, 247, 'Main : 12 : Item 2', 0, 0, 0, 64),
(75, 247, 'Main : 12 : Item 3', 0, 0, 0, 64),
(76, 247, 'Main : 12 : Item 4', 0, 0, 0, 64),
(77, 247, 'Main : 12 : Item 5', 0, 0, 0, 64),
(78, 247, 'Main : 12 : Item 6', 0, 0, 0, 64),
(79, 249, 'Main', 0, 0, 0, 0),
(80, 249, 'Page Header', 0, 0, 0, 0),
(81, 249, 'Page Footer', 0, 0, 0, 0),
(82, 249, 'Page Footer : 13 : Title', 0, 0, 0, 81),
(83, 249, 'Page Footer : 13 : Body', 0, 0, 0, 81),
(84, 250, 'Main', 0, 0, 0, 0),
(85, 251, 'Page Header', 0, 0, 0, 0),
(86, 251, 'Main', 0, 0, 0, 0),
(87, 251, 'Main : 18', 0, 0, 0, 86),
(88, 251, 'Main : 19', 0, 0, 0, 86),
(89, 240, 'Main', 0, 0, 0, 0),
(90, 240, 'Page Header', 0, 0, 0, 0),
(91, 260, 'Main', 0, 0, 0, 0),
(92, 260, 'Page Header', 0, 0, 0, 0),
(93, 260, 'Sidebar', 0, 0, 0, 0),
(94, 260, 'Page Footer', 0, 0, 0, 0),
(95, 260, 'Page Footer : 1 : Title', 0, 0, 0, 0),
(96, 260, 'Page Footer : 1 : Body', 0, 0, 0, 0),
(97, 261, 'Main', 0, 0, 0, 0),
(98, 261, 'Page Header', 0, 0, 0, 0),
(99, 261, 'Sidebar', 0, 0, 0, 0),
(100, 261, 'Page Footer', 0, 0, 0, 0),
(101, 261, 'Page Footer : 1 : Title', 0, 0, 0, 0),
(102, 261, 'Page Footer : 1 : Body', 0, 0, 0, 0),
(103, 262, 'Main', 0, 0, 0, 0),
(104, 262, 'Page Header', 0, 0, 0, 0),
(105, 262, 'Sidebar', 0, 0, 0, 0),
(106, 262, 'Page Footer', 0, 0, 0, 0),
(107, 262, 'Page Footer : 1 : Title', 0, 0, 0, 0),
(108, 262, 'Page Footer : 1 : Body', 0, 0, 0, 0),
(109, 263, 'Main', 0, 0, 0, 0),
(110, 263, 'Page Header', 0, 0, 0, 0),
(111, 263, 'Sidebar', 0, 0, 0, 0),
(112, 263, 'Page Footer', 0, 0, 0, 0),
(113, 263, 'Page Footer : 1 : Title', 0, 0, 0, 0),
(114, 263, 'Page Footer : 1 : Body', 0, 0, 0, 0),
(115, 264, 'Main', 0, 0, 0, 0),
(116, 264, 'Page Header', 0, 0, 0, 0),
(117, 264, 'Sidebar', 0, 0, 0, 0),
(118, 264, 'Page Footer', 0, 0, 0, 0),
(119, 264, 'Page Footer : 1 : Title', 0, 0, 0, 0),
(120, 264, 'Page Footer : 1 : Body', 0, 0, 0, 0),
(121, 265, 'Main', 0, 0, 0, 0),
(122, 265, 'Page Header', 0, 0, 0, 0),
(123, 265, 'Sidebar', 0, 0, 0, 0),
(124, 265, 'Page Footer', 0, 0, 0, 0),
(125, 265, 'Page Footer : 1 : Title', 0, 0, 0, 0),
(126, 265, 'Page Footer : 1 : Body', 0, 0, 0, 0),
(127, 241, 'Page Header', 0, 0, 0, 0),
(128, 241, 'Main', 0, 0, 0, 0),
(129, 242, 'Main', 0, 0, 0, 0),
(130, 243, 'Page Header', 0, 0, 0, 0),
(131, 243, 'Main', 0, 0, 0, 0),
(132, 244, 'Main', 0, 0, 0, 0),
(133, 244, 'Page Header', 0, 0, 0, 0),
(134, 253, 'Resource Content', 0, 0, 0, 0),
(135, 253, 'Resource Data', 0, 0, 0, 0),
(136, 253, 'Page Header', 0, 0, 0, 0),
(137, 253, 'Resource Thumbnail', 0, 0, 0, 0),
(138, 253, 'Resource Title', 0, 0, 0, 0),
(139, 254, 'Resource Content', 0, 0, 0, 0),
(140, 254, 'Page Header', 0, 0, 0, 0),
(141, 254, 'Resource Thumbnail', 0, 0, 0, 0),
(142, 254, 'Resource Title', 0, 0, 0, 0),
(143, 255, 'Resource Content', 0, 0, 0, 0),
(144, 255, 'Page Header', 0, 0, 0, 0),
(145, 255, 'Resource Thumbnail', 0, 0, 0, 0),
(146, 255, 'Resource Title', 0, 0, 0, 0),
(147, 256, 'Resource Content', 0, 0, 0, 0),
(148, 256, 'Page Header', 0, 0, 0, 0),
(149, 256, 'Resource Thumbnail', 0, 0, 0, 0),
(150, 256, 'Resource Title', 0, 0, 0, 0),
(151, 257, 'Resource Content', 0, 0, 0, 0),
(152, 257, 'Page Header', 0, 0, 0, 0),
(153, 257, 'Resource Thumbnail', 0, 0, 0, 0),
(154, 257, 'Resource Title', 0, 0, 0, 0),
(155, 258, 'Resource Content', 0, 0, 0, 0),
(156, 258, 'Page Header', 0, 0, 0, 0),
(157, 258, 'Resource Thumbnail', 0, 0, 0, 0),
(158, 258, 'Resource Title', 0, 0, 0, 0),
(159, 246, 'Page Header', 0, 0, 0, 0),
(160, 246, 'Main', 0, 0, 0, 0),
(161, 246, 'Sidebar', 0, 0, 0, 0),
(162, 1, 'Navigation', 0, 0, 1, 0),
(163, 1, 'Page Footer', 0, 0, 0, 0),
(164, 1, 'Footer Column 1', 0, 0, 1, 0),
(165, 1, 'Footer Column 2', 0, 0, 1, 0),
(166, 1, 'Footer Column 3', 0, 0, 1, 0),
(167, 1, 'Footer Column 4', 0, 0, 1, 0),
(168, 224, 'Navigation', 0, 0, 1, 0),
(169, 224, 'Footer Column 1', 0, 0, 1, 0),
(170, 224, 'Footer Column 2', 0, 0, 1, 0),
(171, 224, 'Footer Column 3', 0, 0, 1, 0),
(172, 224, 'Footer Column 4', 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `atAddress`
--

CREATE TABLE `atAddress` (
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `address3` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state_province` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `avID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atAddressSettings`
--

CREATE TABLE `atAddressSettings` (
  `akDefaultCountry` varchar(255) DEFAULT NULL,
  `akHasCustomCountries` tinyint(1) NOT NULL,
  `customCountries` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `akGeolocateCountry` tinyint(1) NOT NULL,
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atBoolean`
--

CREATE TABLE `atBoolean` (
  `value` tinyint(1) NOT NULL,
  `avID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atBoolean`
--

INSERT INTO `atBoolean` (`value`, `avID`) VALUES
(1, 7),
(1, 10),
(1, 19),
(1, 21),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 47),
(1, 48),
(1, 51),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 69),
(1, 70),
(1, 71),
(1, 72),
(1, 75),
(1, 76),
(1, 89),
(1, 94),
(1, 97),
(1, 98),
(1, 102),
(1, 103),
(1, 104),
(1, 105),
(1, 106),
(1, 107),
(1, 108),
(1, 109),
(1, 110),
(1, 111),
(1, 123),
(1, 143),
(1, 144),
(1, 171),
(1, 183),
(0, 184),
(1, 188),
(1, 192),
(1, 193),
(1, 264),
(1, 265),
(1, 278),
(1, 279),
(1, 280),
(1, 281),
(1, 282),
(1, 283),
(1, 284),
(1, 285),
(1, 286),
(1, 299);

-- --------------------------------------------------------

--
-- Table structure for table `atBooleanSettings`
--

CREATE TABLE `atBooleanSettings` (
  `akCheckedByDefault` tinyint(1) NOT NULL,
  `checkboxLabel` varchar(255) DEFAULT NULL,
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atBooleanSettings`
--

INSERT INTO `atBooleanSettings` (`akCheckedByDefault`, `checkboxLabel`, `akID`) VALUES
(0, NULL, 5),
(0, 'Exclude Page from Navigation', 7),
(0, 'Exclude Page from Page List Blocks', 8),
(0, 'Feature this Page', 11),
(0, NULL, 12),
(0, NULL, 13),
(0, NULL, 14),
(1, NULL, 15),
(1, NULL, 16);

-- --------------------------------------------------------

--
-- Table structure for table `atDateTime`
--

CREATE TABLE `atDateTime` (
  `value` datetime DEFAULT NULL,
  `avID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atDateTimeSettings`
--

CREATE TABLE `atDateTimeSettings` (
  `akUseNowIfEmpty` tinyint(1) NOT NULL DEFAULT 0,
  `akDateDisplayMode` varchar(255) NOT NULL,
  `akTextCustomFormat` longtext NOT NULL COMMENT 'Custom format for text inputs',
  `akTimeResolution` int(10) UNSIGNED NOT NULL DEFAULT 60 COMMENT 'Time resolution (in seconds)',
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atDefault`
--

CREATE TABLE `atDefault` (
  `value` longtext DEFAULT NULL,
  `avID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atDefault`
--

INSERT INTO `atDefault` (`value`, `avID`) VALUES
('fas fa-th-large', 1),
('pages, add page, delete page, copy, move, alias', 2),
('pages, add page, delete page, copy, move, alias', 3),
('pages, add page, delete page, copy, move, alias, bulk', 4),
('find page, search page, search, find, pages, sitemap', 5),
('add file, delete file, copy, move, alias, resize, crop, rename, images, title, attribute', 6),
('file, file attributes, title, attribute, description, rename', 8),
('files, category, categories', 9),
('new file set', 11),
('users, groups, people, find, delete user, remove user, change password, password', 12),
('find, search, people, delete user, remove user, change password, password', 13),
('user, group, people, permissions, expire', 14),
('group types, group type', 15),
('user, group, people, messages', 16),
('user attributes, user data, gather data, registration data', 17),
('new user, create', 18),
('new user group, new group, group, create', 20),
('group set', 22),
('forms, log, error, email, mysql, exception, survey', 45),
('forms, questions, response, data', 46),
('health, check, site check, optimization', 49),
('page types', 50),
('questions, quiz, response', 52),
('forms, log, error, email, mysql, exception, survey, history', 53),
('changes, csv, report', 54),
('new theme, theme, active theme, change theme, template, css', 55),
('page types', 56),
('page attributes, custom', 66),
('single, page, custom, application', 67),
('atom, rss, feed, syndication', 68),
('icon-bullhorn', 73),
('stacks, global areas, reusable content, scrapbook, copy, paste, paste block, copy block, site name, logo', 74),
('edit stacks, view stacks, all stacks', 77),
('block, refresh, custom', 78),
('add-on, addon, add on, package, app, ecommerce, discussions, forums, themes, templates, blocks', 79),
('add-on, addon, ecommerce, install, discussions, forums, themes, templates, blocks', 80),
('update, upgrade', 81),
('buy theme, new theme, marketplace, template', 82),
('buy addon, buy add on, buy add-on, purchase addon, purchase add on, purchase add-on, find addon, new addon, marketplace', 83),
('dashboard, configuration', 84),
('website name, title', 85),
('concretecms.com, my account, purchase, extensions, marketplace', 86),
('production, staging, site copy, development copy, local', 87),
('accessibility, appearance, dark mode, tooltips', 88),
('logo, favicon, iphone, icon, bookmark', 90),
('tinymce, content block, fonts, editor, content, overlay', 91),
('translate, translation, internationalization, multilingual', 92),
('languages, update, gettext, translation, translate', 93),
('timezone, profile, locale', 95),
('site attributes', 96),
('checkin, check-in, check, force', 99),
('sharing, facebook, twitter', 100),
('sharing, opengraph, schema', 101),
('multilingual, localization, internationalization, i18n', 112),
('vanity, pretty url, redirection, hostname, canonical, seo, pageview, view', 113),
('bulk, seo, change keywords, engine, optimization, search', 114),
('traffic, statistics, google analytics, quant, pageviews, hits', 115),
('pretty, slug', 116),
('configure search, site search, search option', 117),
('url, slug', 118),
('security, files, media, extension, manager, upload', 119),
('file, chooser', 120),
('file options, file manager, upload, modify', 121),
('images, picture, responsive, retina', 122),
('thumbnail, format, png, jpg, jpeg, quality, compression, gd, imagick, imagemagick, transparency', 124),
('uploading, upload, images, image, resizing, manager, exif, rotation, rotate, quality, compression, png, jpg, jpeg', 125),
('image, editor, active, default, edit, png, jpg, jpeg', 126),
('security, alternate storage, hide files', 127),
('external, file, providers', 128),
('files, export, csv, bom, encoding', 129),
('files, upload, parallel, upload_max_filesize, post_max_size, limit, resize, chunk', 130),
('automated jobs, commands, tasks, console, cli', 131),
('processes, queues, jobs, running', 132),
('failed messages, retry', 133),
('cron, scheduling, jobs', 134),
('websocket, socket, socket.io, push, push notifications, mercure', 135),
('waiting for me, inbox, notifications', 136),
('cache option, change cache, override, turn on cache, turn off cache, no cache, page cache, caching', 137),
('cache option, turn off cache, no cache, page cache, caching', 138),
('index search, reindex search, build sitemap, sitemap.xml, clear old versions, page versions, remove old', 139),
('editors, hide site, offline, private, public, access', 140),
('security, actions, administrator, admin, package, marketplace, search', 141),
('security, lock ip, lock out, block ip, address, restrict, access', 142),
('security, registration', 145),
('antispam, block spam, security', 146),
('lock site, under construction, hide, hidden', 147),
('trusted, proxy, proxies, ip, header, cloudflare', 148),
('signup, new user, community, public registration, public, registration', 149),
('profile, login, redirect, specific, dashboard, administrators', 150),
('member profile, member page, community, forums, social, avatar', 151),
('auth, authentication, types, oauth, facebook, login, registration', 152),
('global, password, reset, change password, force, sign out', 153),
('login, logout, user, agent, ip, change, security, session, invalidation, invalid', 154),
('password, requirements, code, key, login, registration, security, nist', 155),
('session, options', 156),
('smtp, mail settings', 157),
('email server, mail settings, mail configuration, external, internal', 158),
('test smtp, test mail', 159),
('email server, mail settings, mail configuration, private message, message system, import, email, message', 160),
('mail settings, mail configuration, email, sender', 161),
('email logging, mail logging, log mails, log emails', 162),
('conversations', 163),
('conversations', 164),
('conversations ratings, ratings, community, community points', 165),
('conversations bad words, banned words, banned, bad words, bad, words, list', 166),
('attribute configuration', 167),
('attributes, types', 168),
('attributes, sets', 169),
('topics, tags, taxonomy', 170),
('overrides, system info, debug, support, help', 172),
('error, exception, debug', 173),
('email, logging, logs, smtp, pop, errors, mysql, log', 174),
('network, proxy server', 175),
('database, entities, doctrine, orm', 176),
('database, character set, charset, collation, utf8', 177),
('geolocation, ip, address, country, nation, place, locate', 178),
('security, content security policy, csp, strict transport security, hsts, x-frame-options', 179),
('upgrade, new version, update', 180),
('API, programming, public, app', 181),
('fas fa-palette', 185),
('fas fa-th', 186),
('fas fa-trash', 187),
('fas fa-briefcase', 189),
('fas fa-edit', 190);

-- --------------------------------------------------------

--
-- Table structure for table `atDuration`
--

CREATE TABLE `atDuration` (
  `value` int(11) DEFAULT NULL,
  `avID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atDurationSettings`
--

CREATE TABLE `atDurationSettings` (
  `akUnitType` varchar(255) DEFAULT NULL,
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atEmptySettings`
--

CREATE TABLE `atEmptySettings` (
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atEmptySettings`
--

INSERT INTO `atEmptySettings` (`akID`) VALUES
(4),
(17),
(18),
(19),
(20);

-- --------------------------------------------------------

--
-- Table structure for table `atExpress`
--

CREATE TABLE `atExpress` (
  `avID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atExpressSelectedEntries`
--

CREATE TABLE `atExpressSelectedEntries` (
  `avID` int(10) UNSIGNED NOT NULL,
  `exEntryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atExpressSettings`
--

CREATE TABLE `atExpressSettings` (
  `exEntityID` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atFile`
--

CREATE TABLE `atFile` (
  `fID` int(10) UNSIGNED DEFAULT NULL,
  `avID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atFile`
--

INSERT INTO `atFile` (`fID`, `avID`) VALUES
(6, 266),
(7, 274),
(7, 296),
(8, 292),
(13, 290),
(17, 276),
(17, 298),
(18, 272),
(26, 270),
(29, 294),
(32, 268),
(36, 288);

-- --------------------------------------------------------

--
-- Table structure for table `atFileSettings`
--

CREATE TABLE `atFileSettings` (
  `akFileManagerMode` int(11) NOT NULL,
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atFileSettings`
--

INSERT INTO `atFileSettings` (`akFileManagerMode`, `akID`) VALUES
(0, 21);

-- --------------------------------------------------------

--
-- Table structure for table `atNumber`
--

CREATE TABLE `atNumber` (
  `value` decimal(14,4) DEFAULT NULL,
  `avID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atNumber`
--

INSERT INTO `atNumber` (`value`, `avID`) VALUES
(2.0000, 182),
(1.0000, 191),
(2600.0000, 194),
(1214.0000, 195),
(272.0000, 196),
(40.0000, 197),
(2600.0000, 198),
(1367.0000, 199),
(164.0000, 200),
(84.0000, 201),
(660.0000, 202),
(842.0000, 203),
(660.0000, 204),
(432.0000, 205),
(660.0000, 206),
(432.0000, 207),
(892.0000, 208),
(590.0000, 209),
(662.0000, 210),
(840.0000, 211),
(2600.0000, 212),
(1367.0000, 213),
(84.0000, 214),
(76.0000, 215),
(660.0000, 216),
(842.0000, 217),
(892.0000, 218),
(590.0000, 219),
(866.0000, 220),
(616.0000, 221),
(2220.0000, 222),
(1004.0000, 223),
(2600.0000, 224),
(1367.0000, 225),
(660.0000, 226),
(432.0000, 227),
(662.0000, 228),
(432.0000, 229),
(2600.0000, 230),
(1214.0000, 231),
(332.0000, 232),
(56.0000, 233),
(662.0000, 234),
(842.0000, 235),
(84.0000, 236),
(76.0000, 237),
(660.0000, 238),
(840.0000, 239),
(866.0000, 240),
(616.0000, 241),
(662.0000, 242),
(432.0000, 243),
(866.0000, 244),
(618.0000, 245),
(866.0000, 246),
(618.0000, 247),
(660.0000, 248),
(840.0000, 249),
(2598.0000, 250),
(960.0000, 251),
(252.0000, 252),
(84.0000, 253),
(660.0000, 254),
(432.0000, 255),
(230.0000, 256),
(228.0000, 257),
(864.0000, 258),
(616.0000, 259),
(868.0000, 260),
(618.0000, 261),
(1080.0000, 262),
(832.0000, 263);

-- --------------------------------------------------------

--
-- Table structure for table `atSelect`
--

CREATE TABLE `atSelect` (
  `avID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atSelect`
--

INSERT INTO `atSelect` (`avID`) VALUES
(287),
(289),
(291),
(293),
(295),
(297);

-- --------------------------------------------------------

--
-- Table structure for table `atSelectedSocialLinks`
--

CREATE TABLE `atSelectedSocialLinks` (
  `avsID` int(10) UNSIGNED NOT NULL,
  `service` varchar(255) NOT NULL,
  `serviceInfo` varchar(255) DEFAULT NULL,
  `avID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atSelectedTopics`
--

CREATE TABLE `atSelectedTopics` (
  `avTreeTopicNodeID` int(10) UNSIGNED NOT NULL,
  `treeNodeID` int(10) UNSIGNED NOT NULL,
  `avID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atSelectedTopics`
--

INSERT INTO `atSelectedTopics` (`avTreeTopicNodeID`, `treeNodeID`, `avID`) VALUES
(1, 54, 267),
(2, 57, 269),
(3, 55, 271),
(4, 56, 273),
(5, 54, 275),
(6, 58, 277);

-- --------------------------------------------------------

--
-- Table structure for table `atSelectOptionLists`
--

CREATE TABLE `atSelectOptionLists` (
  `avSelectOptionListID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atSelectOptionLists`
--

INSERT INTO `atSelectOptionLists` (`avSelectOptionListID`) VALUES
(1),
(2);

-- --------------------------------------------------------

--
-- Table structure for table `atSelectOptions`
--

CREATE TABLE `atSelectOptions` (
  `avSelectOptionID` int(10) UNSIGNED NOT NULL,
  `isEndUserAdded` tinyint(1) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `displayOrder` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `avSelectOptionListID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atSelectOptions`
--

INSERT INTO `atSelectOptions` (`avSelectOptionID`, `isEndUserAdded`, `isDeleted`, `displayOrder`, `value`, `avSelectOptionListID`) VALUES
(1, 1, 0, 0, 'I love your work', 2),
(2, 1, 0, 1, 'Great website', 2),
(3, 1, 0, 2, 'Check out this cool thing I found', 2),
(4, 1, 0, 3, 'Other', 2),
(5, 1, 0, 0, 'resource', NULL),
(6, 1, 0, 0, 'resource', NULL),
(7, 1, 0, 0, 'resource', NULL),
(8, 1, 0, 0, 'resource', NULL),
(9, 1, 0, 0, 'resource', NULL),
(10, 1, 0, 0, 'resource', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `atSelectOptionsSelected`
--

CREATE TABLE `atSelectOptionsSelected` (
  `avID` int(10) UNSIGNED NOT NULL,
  `avSelectOptionID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atSelectOptionsSelected`
--

INSERT INTO `atSelectOptionsSelected` (`avID`, `avSelectOptionID`) VALUES
(287, 5),
(289, 6),
(291, 7),
(293, 8),
(295, 9),
(297, 10);

-- --------------------------------------------------------

--
-- Table structure for table `atSelectSettings`
--

CREATE TABLE `atSelectSettings` (
  `akSelectAllowMultipleValues` tinyint(1) NOT NULL,
  `akSelectAllowOtherValues` tinyint(1) NOT NULL,
  `akHideNoneOption` tinyint(1) NOT NULL,
  `akSelectOptionDisplayOrder` varchar(255) NOT NULL,
  `akDisplayMultipleValuesOnSelect` tinyint(1) NOT NULL,
  `avSelectOptionListID` int(10) UNSIGNED DEFAULT NULL,
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atSelectSettings`
--

INSERT INTO `atSelectSettings` (`akSelectAllowMultipleValues`, `akSelectAllowOtherValues`, `akHideNoneOption`, `akSelectOptionDisplayOrder`, `akDisplayMultipleValuesOnSelect`, `avSelectOptionListID`, `akID`) VALUES
(1, 1, 0, 'display_asc', 0, 1, 10),
(0, 0, 0, 'display_asc', 1, 2, 26);

-- --------------------------------------------------------

--
-- Table structure for table `atSite`
--

CREATE TABLE `atSite` (
  `siteID` int(10) UNSIGNED DEFAULT NULL,
  `avID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atSocialLinks`
--

CREATE TABLE `atSocialLinks` (
  `avID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atTextareaSettings`
--

CREATE TABLE `atTextareaSettings` (
  `akTextareaDisplayMode` varchar(255) DEFAULT NULL,
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atTextareaSettings`
--

INSERT INTO `atTextareaSettings` (`akTextareaDisplayMode`, `akID`) VALUES
('', 2),
('', 3),
('', 6),
('', 9),
('text', 27);

-- --------------------------------------------------------

--
-- Table structure for table `atTextSettings`
--

CREATE TABLE `atTextSettings` (
  `akTextPlaceholder` varchar(255) DEFAULT NULL,
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atTextSettings`
--

INSERT INTO `atTextSettings` (`akTextPlaceholder`, `akID`) VALUES
('', 1),
('', 22),
('', 23),
('', 24),
('', 25);

-- --------------------------------------------------------

--
-- Table structure for table `atTopic`
--

CREATE TABLE `atTopic` (
  `avID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atTopic`
--

INSERT INTO `atTopic` (`avID`) VALUES
(267),
(269),
(271),
(273),
(275),
(277);

-- --------------------------------------------------------

--
-- Table structure for table `atTopicSettings`
--

CREATE TABLE `atTopicSettings` (
  `akTopicParentNodeID` int(11) NOT NULL,
  `akTopicTreeID` int(11) NOT NULL,
  `akTopicAllowMultipleValues` tinyint(1) NOT NULL DEFAULT 1,
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atTopicSettings`
--

INSERT INTO `atTopicSettings` (`akTopicParentNodeID`, `akTopicTreeID`, `akTopicAllowMultipleValues`, `akID`) VALUES
(53, 4, 0, 28);

-- --------------------------------------------------------

--
-- Table structure for table `AttributeKeyCategories`
--

CREATE TABLE `AttributeKeyCategories` (
  `akCategoryID` int(10) UNSIGNED NOT NULL,
  `akCategoryHandle` varchar(255) NOT NULL,
  `akCategoryAllowSets` int(11) NOT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `AttributeKeyCategories`
--

INSERT INTO `AttributeKeyCategories` (`akCategoryID`, `akCategoryHandle`, `akCategoryAllowSets`, `pkgID`) VALUES
(1, 'collection', 1, NULL),
(2, 'user', 1, NULL),
(3, 'file', 1, NULL),
(4, 'site', 1, NULL),
(5, 'event', 1, NULL),
(6, 'site_type', 1, NULL),
(7, 'express', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `AttributeKeys`
--

CREATE TABLE `AttributeKeys` (
  `akID` int(10) UNSIGNED NOT NULL,
  `akHandle` varchar(255) NOT NULL,
  `akName` varchar(255) NOT NULL,
  `akIsSearchable` tinyint(1) NOT NULL,
  `akIsInternal` tinyint(1) NOT NULL,
  `akIsSearchableIndexed` tinyint(1) NOT NULL,
  `atID` int(10) UNSIGNED DEFAULT NULL,
  `akCategoryID` int(10) UNSIGNED DEFAULT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL,
  `akCategory` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `AttributeKeys`
--

INSERT INTO `AttributeKeys` (`akID`, `akHandle`, `akName`, `akIsSearchable`, `akIsInternal`, `akIsSearchableIndexed`, `atID`, `akCategoryID`, `pkgID`, `akCategory`) VALUES
(1, 'meta_title', 'Meta Title', 1, 0, 0, 1, 1, NULL, 'pagekey'),
(2, 'meta_description', 'Meta Description', 1, 0, 0, 3, 1, NULL, 'pagekey'),
(3, 'meta_keywords', 'Meta Keywords', 1, 0, 0, 3, 1, NULL, 'pagekey'),
(4, 'desktop_priority', 'Desktop Priority', 1, 1, 0, 7, 1, NULL, 'pagekey'),
(5, 'is_desktop', 'Is Desktop', 1, 1, 0, 4, 1, NULL, 'pagekey'),
(6, 'icon_dashboard', 'Dashboard Icon', 1, 1, 0, 3, 1, NULL, 'pagekey'),
(7, 'exclude_nav', 'Exclude From Nav', 1, 0, 0, 4, 1, NULL, 'pagekey'),
(8, 'exclude_page_list', 'Exclude From Page List', 1, 0, 0, 4, 1, NULL, 'pagekey'),
(9, 'header_extra_content', 'Header Extra Content', 1, 0, 0, 3, 1, NULL, 'pagekey'),
(10, 'tags', 'Tags', 1, 0, 1, 8, 1, NULL, 'pagekey'),
(11, 'is_featured', 'Is Featured', 1, 0, 0, 4, 1, NULL, 'pagekey'),
(12, 'exclude_search_index', 'Exclude From Search Index', 1, 0, 0, 4, 1, NULL, 'pagekey'),
(13, 'exclude_sitemapxml', 'Exclude From sitemap.xml', 1, 0, 0, 4, 1, NULL, 'pagekey'),
(14, 'exclude_subpages_from_nav', 'Exclude Sub-Pages From Nav', 1, 0, 1, 4, 1, NULL, 'pagekey'),
(15, 'profile_private_messages_enabled', 'I would like to receive private messages.', 1, 0, 0, 4, 2, NULL, 'userkey'),
(16, 'profile_private_messages_notification_enabled', 'Send me email notifications when I receive a private message.', 1, 0, 0, 4, 2, NULL, 'userkey'),
(17, 'width', 'Width', 1, 0, 0, 7, 3, NULL, 'filekey'),
(18, 'height', 'Height', 1, 0, 0, 7, 3, NULL, 'filekey'),
(19, 'account_profile_links', 'Personal Links', 0, 0, 0, 15, 2, NULL, 'userkey'),
(20, 'duration', 'Duration', 1, 0, 0, 7, 3, NULL, 'filekey'),
(21, 'thumbnail', 'Thumbnail', 1, 0, 1, 6, 1, NULL, 'pagekey'),
(22, 'email_address', 'Email Address', 1, 0, 1, 12, 7, NULL, 'expresskey'),
(23, 'contact_question_first_name', 'First Name', 1, 0, 1, 1, 7, NULL, 'expresskey'),
(24, 'contact_question_last_name', 'Last Name', 1, 0, 1, 1, 7, NULL, 'expresskey'),
(25, 'contact_question_email_address', 'Email Address', 1, 0, 1, 12, 7, NULL, 'expresskey'),
(26, 'contact_question_subject', 'Subject', 1, 0, 1, 8, 7, NULL, 'expresskey'),
(27, 'contact_question_message', 'Message', 1, 0, 1, 3, 7, NULL, 'expresskey'),
(28, 'blog_entry_topics', 'Blog Entry Topics', 1, 0, 1, 14, 1, NULL, 'pagekey');

-- --------------------------------------------------------

--
-- Table structure for table `AttributeSetKeys`
--

CREATE TABLE `AttributeSetKeys` (
  `asDisplayOrder` int(10) UNSIGNED NOT NULL,
  `akID` int(10) UNSIGNED NOT NULL,
  `asID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `AttributeSetKeys`
--

INSERT INTO `AttributeSetKeys` (`asDisplayOrder`, `akID`, `asID`) VALUES
(0, 1, 1),
(1, 2, 1),
(1, 7, 2),
(2, 8, 2),
(2, 9, 1),
(4, 10, 2),
(0, 11, 2),
(3, 12, 2),
(3, 13, 1),
(0, 28, 3);

-- --------------------------------------------------------

--
-- Table structure for table `AttributeSets`
--

CREATE TABLE `AttributeSets` (
  `asID` int(10) UNSIGNED NOT NULL,
  `asHandle` varchar(255) NOT NULL,
  `asName` varchar(255) NOT NULL,
  `asDisplayOrder` int(10) UNSIGNED NOT NULL,
  `asIsLocked` tinyint(1) NOT NULL,
  `akCategoryID` int(10) UNSIGNED DEFAULT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `AttributeSets`
--

INSERT INTO `AttributeSets` (`asID`, `asHandle`, `asName`, `asDisplayOrder`, `asIsLocked`, `akCategoryID`, `pkgID`) VALUES
(1, 'seo', 'SEO', 0, 0, 1, NULL),
(2, 'navigation', 'Navigation and Indexing', 0, 0, 1, NULL),
(3, 'blog', 'Blog', 0, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `AttributeTypeCategories`
--

CREATE TABLE `AttributeTypeCategories` (
  `akCategoryID` int(10) UNSIGNED NOT NULL,
  `atID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `AttributeTypeCategories`
--

INSERT INTO `AttributeTypeCategories` (`akCategoryID`, `atID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 14),
(2, 15),
(2, 18),
(2, 20),
(2, 21),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 7),
(3, 8),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 18),
(3, 20),
(3, 21),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(4, 14),
(4, 16),
(4, 18),
(4, 19),
(4, 20),
(4, 22),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(5, 10),
(5, 11),
(5, 12),
(5, 14),
(5, 20),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 10),
(6, 11),
(6, 12),
(6, 14),
(6, 16),
(6, 18),
(6, 19),
(6, 20),
(6, 22),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 6),
(7, 7),
(7, 8),
(7, 9),
(7, 10),
(7, 11),
(7, 12),
(7, 13),
(7, 14),
(7, 16),
(7, 17),
(7, 19),
(7, 20),
(7, 21),
(7, 22);

-- --------------------------------------------------------

--
-- Table structure for table `AttributeTypes`
--

CREATE TABLE `AttributeTypes` (
  `atID` int(10) UNSIGNED NOT NULL,
  `atHandle` varchar(255) NOT NULL,
  `atName` varchar(255) NOT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `AttributeTypes`
--

INSERT INTO `AttributeTypes` (`atID`, `atHandle`, `atName`, `pkgID`) VALUES
(1, 'text', 'Text', NULL),
(2, 'duration', 'Duration', NULL),
(3, 'textarea', 'Text Area', NULL),
(4, 'boolean', 'Checkbox', NULL),
(5, 'date_time', 'Date/Time', NULL),
(6, 'image_file', 'Image/File', NULL),
(7, 'number', 'Number', NULL),
(8, 'select', 'Option List', NULL),
(9, 'address', 'Address', NULL),
(10, 'telephone', 'Phone Number', NULL),
(11, 'url', 'URL', NULL),
(12, 'email', 'Email', NULL),
(13, 'rating', 'Rating', NULL),
(14, 'topics', 'Topics', NULL),
(15, 'social_links', 'Social Links', NULL),
(16, 'calendar', 'Calendar', NULL),
(17, 'calendar_event', 'Calendar Event', NULL),
(18, 'express', 'Express Entity', NULL),
(19, 'page_selector', 'Page Selector', NULL),
(20, 'user_selector', 'User Selector', NULL),
(21, 'site', 'Site', NULL),
(22, 'user_group', 'User Group', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `AttributeValues`
--

CREATE TABLE `AttributeValues` (
  `avID` int(10) UNSIGNED NOT NULL,
  `akID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `AttributeValues`
--

INSERT INTO `AttributeValues` (`avID`, `akID`) VALUES
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(8, 3),
(9, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 3),
(20, 3),
(22, 3),
(45, 3),
(46, 3),
(49, 3),
(50, 3),
(52, 3),
(53, 3),
(54, 3),
(55, 3),
(56, 3),
(66, 3),
(67, 3),
(68, 3),
(74, 3),
(77, 3),
(78, 3),
(79, 3),
(80, 3),
(81, 3),
(82, 3),
(83, 3),
(84, 3),
(85, 3),
(86, 3),
(87, 3),
(88, 3),
(90, 3),
(91, 3),
(92, 3),
(93, 3),
(95, 3),
(96, 3),
(99, 3),
(100, 3),
(101, 3),
(112, 3),
(113, 3),
(114, 3),
(115, 3),
(116, 3),
(117, 3),
(118, 3),
(119, 3),
(120, 3),
(121, 3),
(122, 3),
(124, 3),
(125, 3),
(126, 3),
(127, 3),
(128, 3),
(129, 3),
(130, 3),
(131, 3),
(132, 3),
(133, 3),
(134, 3),
(135, 3),
(136, 3),
(137, 3),
(138, 3),
(139, 3),
(140, 3),
(141, 3),
(142, 3),
(145, 3),
(146, 3),
(147, 3),
(148, 3),
(149, 3),
(150, 3),
(151, 3),
(152, 3),
(153, 3),
(154, 3),
(155, 3),
(156, 3),
(157, 3),
(158, 3),
(159, 3),
(160, 3),
(161, 3),
(162, 3),
(163, 3),
(164, 3),
(165, 3),
(166, 3),
(167, 3),
(168, 3),
(169, 3),
(170, 3),
(172, 3),
(173, 3),
(174, 3),
(175, 3),
(176, 3),
(177, 3),
(178, 3),
(179, 3),
(180, 3),
(181, 3),
(182, 4),
(191, 4),
(183, 5),
(192, 5),
(1, 6),
(73, 6),
(185, 6),
(186, 6),
(187, 6),
(189, 6),
(190, 6),
(7, 7),
(10, 7),
(19, 7),
(21, 7),
(23, 7),
(25, 7),
(27, 7),
(29, 7),
(31, 7),
(33, 7),
(35, 7),
(37, 7),
(39, 7),
(41, 7),
(43, 7),
(47, 7),
(51, 7),
(57, 7),
(58, 7),
(59, 7),
(60, 7),
(61, 7),
(62, 7),
(63, 7),
(64, 7),
(65, 7),
(69, 7),
(71, 7),
(75, 7),
(94, 7),
(97, 7),
(102, 7),
(104, 7),
(106, 7),
(108, 7),
(110, 7),
(123, 7),
(143, 7),
(144, 7),
(184, 7),
(193, 7),
(278, 7),
(281, 7),
(284, 7),
(299, 7),
(279, 8),
(282, 8),
(285, 8),
(287, 10),
(289, 10),
(291, 10),
(293, 10),
(295, 10),
(297, 10),
(24, 12),
(26, 12),
(28, 12),
(30, 12),
(32, 12),
(34, 12),
(36, 12),
(38, 12),
(40, 12),
(42, 12),
(44, 12),
(48, 12),
(70, 12),
(72, 12),
(76, 12),
(89, 12),
(98, 12),
(103, 12),
(105, 12),
(107, 12),
(109, 12),
(111, 12),
(171, 12),
(188, 12),
(280, 12),
(283, 12),
(286, 12),
(264, 14),
(265, 14),
(194, 17),
(196, 17),
(198, 17),
(200, 17),
(202, 17),
(204, 17),
(206, 17),
(208, 17),
(210, 17),
(212, 17),
(214, 17),
(216, 17),
(218, 17),
(220, 17),
(222, 17),
(224, 17),
(226, 17),
(228, 17),
(230, 17),
(232, 17),
(234, 17),
(236, 17),
(238, 17),
(240, 17),
(242, 17),
(244, 17),
(246, 17),
(248, 17),
(250, 17),
(252, 17),
(254, 17),
(256, 17),
(258, 17),
(260, 17),
(262, 17),
(195, 18),
(197, 18),
(199, 18),
(201, 18),
(203, 18),
(205, 18),
(207, 18),
(209, 18),
(211, 18),
(213, 18),
(215, 18),
(217, 18),
(219, 18),
(221, 18),
(223, 18),
(225, 18),
(227, 18),
(229, 18),
(231, 18),
(233, 18),
(235, 18),
(237, 18),
(239, 18),
(241, 18),
(243, 18),
(245, 18),
(247, 18),
(249, 18),
(251, 18),
(253, 18),
(255, 18),
(257, 18),
(259, 18),
(261, 18),
(263, 18),
(266, 21),
(268, 21),
(270, 21),
(272, 21),
(274, 21),
(276, 21),
(288, 21),
(290, 21),
(292, 21),
(294, 21),
(296, 21),
(298, 21),
(267, 28),
(269, 28),
(271, 28),
(273, 28),
(275, 28),
(277, 28);

-- --------------------------------------------------------

--
-- Table structure for table `atUserGroupSettings`
--

CREATE TABLE `atUserGroupSettings` (
  `akDisplayGroupsBeneathSpecificParent` tinyint(1) NOT NULL,
  `akDisplayGroupsBeneathParentID` int(11) NOT NULL,
  `akGroupSelectionMethod` varchar(255) NOT NULL,
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `AuthenticationTypes`
--

CREATE TABLE `AuthenticationTypes` (
  `authTypeID` int(10) UNSIGNED NOT NULL,
  `authTypeHandle` varchar(255) NOT NULL,
  `authTypeName` varchar(255) NOT NULL,
  `authTypeIsEnabled` tinyint(1) NOT NULL,
  `authTypeDisplayOrder` int(10) UNSIGNED DEFAULT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `AuthenticationTypes`
--

INSERT INTO `AuthenticationTypes` (`authTypeID`, `authTypeHandle`, `authTypeName`, `authTypeIsEnabled`, `authTypeDisplayOrder`, `pkgID`) VALUES
(1, 'concrete', 'Standard', 1, 0, 0),
(2, 'community', 'community.concretecms.com', 0, 0, 0),
(3, 'facebook', 'Facebook', 0, 0, 0),
(4, 'google', 'Google', 0, 0, 0),
(5, 'external_concrete', 'External Concrete Site', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `authTypeConcreteCookieMap`
--

CREATE TABLE `authTypeConcreteCookieMap` (
  `ID` int(10) UNSIGNED NOT NULL,
  `token` varchar(64) DEFAULT NULL,
  `uID` int(11) DEFAULT NULL,
  `validThrough` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `BannedWords`
--

CREATE TABLE `BannedWords` (
  `bwID` int(10) UNSIGNED NOT NULL,
  `bannedWord` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `BannedWords`
--

INSERT INTO `BannedWords` (`bwID`, `bannedWord`) VALUES
(1, 'fuck'),
(2, 'shit'),
(3, 'bitch'),
(4, 'ass');

-- --------------------------------------------------------

--
-- Table structure for table `BasicWorkflowPermissionAssignments`
--

CREATE TABLE `BasicWorkflowPermissionAssignments` (
  `wfID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pkID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `BasicWorkflowProgressData`
--

CREATE TABLE `BasicWorkflowProgressData` (
  `wpID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uIDStarted` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uIDCompleted` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `wpDateCompleted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `BlockPermissionAssignments`
--

CREATE TABLE `BlockPermissionAssignments` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cvID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `bID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pkID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Blocks`
--

CREATE TABLE `Blocks` (
  `bID` int(10) UNSIGNED NOT NULL,
  `bName` varchar(60) DEFAULT NULL,
  `bDateAdded` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `bDateModified` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `bFilename` varchar(255) DEFAULT NULL,
  `bIsActive` varchar(1) NOT NULL DEFAULT '1',
  `btID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uID` int(10) UNSIGNED DEFAULT NULL,
  `btCachedBlockRecord` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Blocks`
--

INSERT INTO `Blocks` (`bID`, `bName`, `bDateAdded`, `bDateModified`, `bFilename`, `bIsActive`, `btID`, `uID`, `btCachedBlockRecord`) VALUES
(1, '', '2025-06-25 21:11:26', '2025-06-25 21:11:26', NULL, '0', 43, 1, NULL),
(2, '', '2025-06-25 21:11:26', '2025-06-25 21:11:26', NULL, '0', 52, 1, NULL),
(3, '', '2025-06-25 21:11:27', '2025-06-25 21:11:27', NULL, '0', 47, 1, NULL),
(4, '', '2025-06-25 21:11:27', '2025-06-25 21:11:27', NULL, '0', 44, 1, NULL),
(5, '', '2025-06-25 21:11:27', '2025-06-25 21:11:27', NULL, '0', 51, 1, NULL),
(6, '', '2025-06-25 21:11:27', '2025-06-25 21:11:27', NULL, '0', 52, 1, NULL),
(7, '', '2025-06-25 21:11:27', '2025-06-25 21:11:27', NULL, '0', 19, 1, NULL),
(8, '', '2025-06-25 21:11:27', '2025-06-25 21:11:27', NULL, '0', 19, 1, NULL),
(9, '', '2025-06-25 21:11:27', '2025-06-25 21:11:27', NULL, '0', 52, 1, NULL),
(10, '', '2025-06-25 21:11:27', '2025-06-25 21:11:27', NULL, '0', 50, 1, NULL),
(11, '', '2025-06-25 21:11:27', '2025-06-25 21:11:27', NULL, '0', 50, 1, NULL),
(12, '', '2025-06-25 21:11:27', '2025-06-25 21:11:27', NULL, '0', 50, 1, NULL),
(13, '', '2025-06-25 21:11:27', '2025-06-25 21:11:27', NULL, '0', 52, 1, NULL),
(14, '', '2025-06-25 21:11:27', '2025-06-25 21:11:27', NULL, '0', 48, 1, NULL),
(15, '', '2025-06-25 21:11:27', '2025-06-25 21:11:27', NULL, '0', 52, 1, NULL),
(16, '', '2025-06-25 21:11:27', '2025-06-25 21:11:27', NULL, '0', 49, 1, NULL),
(17, '', '2025-06-25 21:11:28', '2025-06-25 21:11:28', NULL, '0', 52, 1, NULL),
(18, '', '2025-06-25 21:11:28', '2025-06-25 21:11:28', NULL, '0', 48, 1, NULL),
(19, '', '2025-06-25 21:11:28', '2025-06-25 21:11:28', NULL, '0', 52, 1, NULL),
(20, '', '2025-06-25 21:11:28', '2025-06-25 21:11:28', NULL, '0', 49, 1, NULL),
(21, '', '2025-06-25 21:11:37', '2025-06-25 21:11:37', NULL, '0', 55, 1, NULL),
(22, '', '2025-06-25 21:11:37', '2025-06-25 21:11:37', NULL, '0', 21, 1, NULL),
(23, '', '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'byline.php', '0', 10, 1, NULL),
(24, '', '2025-06-25 21:11:37', '2025-06-25 21:11:37', NULL, '0', 55, 1, NULL),
(25, '', '2025-06-25 21:11:37', '2025-06-25 21:11:37', NULL, '0', 31, 1, NULL),
(26, '', '2025-06-25 21:11:37', '2025-06-25 21:11:37', NULL, '0', 15, 1, NULL),
(27, '', '2025-06-25 21:11:37', '2025-06-25 21:11:37', NULL, '0', 18, 1, NULL),
(28, '', '2025-06-25 21:11:37', '2025-06-25 21:11:37', NULL, '0', 54, 1, NULL),
(29, '', '2025-06-25 21:11:37', '2025-06-25 21:11:37', NULL, '0', 1, 1, NULL),
(30, '', '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'blog_entry_grid.php', '0', 14, 1, NULL),
(31, '', '2025-06-25 21:11:37', '2025-06-25 21:11:37', NULL, '0', 21, 1, NULL),
(32, '', '2025-06-25 21:11:37', '2025-06-25 21:11:37', NULL, '0', 35, 1, NULL),
(33, '', '2025-06-25 21:11:37', '2025-06-25 21:11:37', NULL, '0', 10, 1, NULL),
(34, '', '2025-06-25 21:11:37', '2025-06-25 21:11:37', NULL, '0', 55, 1, NULL),
(35, '', '2025-06-25 21:11:38', '2025-06-25 21:11:38', NULL, '0', 11, 1, NULL),
(36, '', '2025-06-25 21:11:38', '2025-06-25 21:11:38', NULL, '0', 1, 1, NULL),
(37, '', '2025-06-25 21:11:38', '2025-06-25 21:11:38', NULL, '0', 29, 1, NULL),
(38, '', '2025-06-25 21:11:38', '2025-06-25 21:11:38', NULL, '0', 1, 1, NULL),
(39, '', '2025-06-25 21:11:38', '2025-06-25 21:11:38', NULL, '0', 1, 1, NULL),
(40, '', '2025-06-25 21:11:38', '2025-06-25 21:11:38', NULL, '0', 1, 1, NULL),
(41, '', '2025-06-25 21:11:38', '2025-06-25 21:11:38', NULL, '0', 22, 1, NULL),
(42, '', '2025-06-25 21:11:38', '2025-06-25 21:11:38', NULL, '0', 18, 1, NULL),
(43, '', '2025-06-25 21:11:38', '2025-06-25 21:11:38', NULL, '0', 16, 1, NULL),
(44, '', '2025-06-25 21:11:38', '2025-06-25 21:11:38', NULL, '0', 3, 1, NULL),
(45, '', '2025-06-25 21:11:38', '2025-06-25 21:11:38', NULL, '0', 54, 1, NULL),
(46, '', '2025-06-25 21:11:38', '2025-06-25 21:11:38', NULL, '0', 8, 1, NULL),
(47, '', '2025-06-25 21:11:38', '2025-06-25 21:11:38', NULL, '0', 4, 1, NULL),
(48, '', '2025-06-25 21:11:38', '2025-06-25 21:11:38', NULL, '0', 1, 1, NULL),
(49, '', '2025-06-25 21:11:38', '2025-06-25 21:11:38', 'wide_gutters.php', '0', 52, 1, NULL),
(50, '', '2025-06-25 21:11:38', '2025-06-25 21:11:38', 'stacked_primary.php', '0', 7, 1, NULL),
(51, '', '2025-06-25 21:11:38', '2025-06-25 21:11:38', 'stacked_primary.php', '0', 7, 1, NULL),
(52, '', '2025-06-25 21:11:38', '2025-06-25 21:11:38', 'stacked_primary.php', '0', 7, 1, NULL),
(53, '', '2025-06-25 21:11:38', '2025-06-25 21:11:38', NULL, '0', 42, 1, NULL),
(54, '', '2025-06-25 21:11:38', '2025-06-25 21:11:38', 'offset_title.php', '0', 3, 1, NULL),
(55, '', '2025-06-25 21:11:38', '2025-06-25 21:11:38', NULL, '0', 54, 1, NULL),
(56, '', '2025-06-25 21:11:38', '2025-06-25 21:11:38', NULL, '0', 4, 1, NULL),
(57, '', '2025-06-25 21:11:38', '2025-06-25 21:11:38', NULL, '0', 8, 1, NULL),
(58, '', '2025-06-25 21:11:38', '2025-06-25 21:11:38', NULL, '0', 36, 1, NULL),
(59, '', '2025-06-25 21:11:38', '2025-06-25 21:11:38', NULL, '0', 54, 1, NULL),
(60, '', '2025-06-25 21:11:39', '2025-06-25 21:11:39', NULL, '0', 1, 1, NULL),
(61, '', '2025-06-25 21:11:39', '2025-06-25 21:11:39', 'blog_entry_grid.php', '0', 14, 1, NULL),
(62, '', '2025-06-25 21:11:39', '2025-06-25 21:11:39', 'logos.php', '0', 42, 1, NULL),
(63, '', '2025-06-25 21:11:39', '2025-06-25 21:11:39', 'hero_testimonial.php', '0', 30, 1, NULL),
(64, '', '2025-06-25 21:11:39', '2025-06-25 21:11:39', 'hero_slider.php', '0', 36, 1, NULL),
(65, '', '2025-06-25 21:11:39', '2025-06-25 21:11:39', NULL, '0', 54, 1, NULL),
(66, '', '2025-06-25 21:11:39', '2025-06-25 21:11:39', NULL, '0', 8, 1, NULL),
(67, '', '2025-06-25 21:11:39', '2025-06-25 21:11:39', NULL, '0', 4, 1, NULL),
(68, '', '2025-06-25 21:11:39', '2025-06-25 21:11:39', NULL, '0', 1, 1, NULL),
(69, '', '2025-06-25 21:11:39', '2025-06-25 21:11:39', NULL, '0', 54, 1, NULL),
(70, '', '2025-06-25 21:11:39', '2025-06-25 21:11:39', 'stacked.php', '0', 7, 1, NULL),
(71, '', '2025-06-25 21:11:39', '2025-06-25 21:11:39', 'stacked.php', '0', 7, 1, NULL),
(72, '', '2025-06-25 21:11:39', '2025-06-25 21:11:39', 'stacked.php', '0', 7, 1, NULL),
(73, '', '2025-06-25 21:11:39', '2025-06-25 21:11:39', 'stacked.php', '0', 7, 1, NULL),
(74, '', '2025-06-25 21:11:39', '2025-06-25 21:11:39', 'stacked.php', '0', 7, 1, NULL),
(75, '', '2025-06-25 21:11:39', '2025-06-25 21:11:39', 'stacked.php', '0', 7, 1, NULL),
(76, '', '2025-06-25 21:11:39', '2025-06-25 21:11:39', NULL, '0', 54, 1, NULL),
(77, '', '2025-06-25 21:11:39', '2025-06-25 21:11:39', NULL, '0', 4, 1, NULL),
(78, '', '2025-06-25 21:11:39', '2025-06-25 21:11:39', NULL, '0', 8, 1, NULL),
(79, '', '2025-06-25 21:11:39', '2025-06-25 21:11:39', NULL, '0', 54, 1, NULL),
(80, '', '2025-06-25 21:11:39', '2025-06-25 21:11:39', NULL, '0', 4, 1, NULL),
(81, '', '2025-06-25 21:11:39', '2025-06-25 21:11:39', NULL, '0', 8, 1, NULL),
(82, '', '2025-06-25 21:11:40', '2025-06-25 21:11:40', NULL, '0', 4, 1, NULL),
(83, '', '2025-06-25 21:11:40', '2025-06-25 21:11:40', NULL, '0', 8, 1, NULL),
(84, '', '2025-06-25 21:11:40', '2025-06-25 21:11:40', NULL, '0', 1, 1, NULL),
(85, '', '2025-06-25 21:11:40', '2025-06-25 21:11:40', NULL, '0', 54, 1, NULL),
(86, '', '2025-06-25 21:11:40', '2025-06-25 21:11:40', NULL, '0', 30, 1, NULL),
(87, '', '2025-06-25 21:11:40', '2025-06-25 21:11:40', NULL, '0', 30, 1, NULL),
(88, '', '2025-06-25 21:11:40', '2025-06-25 21:11:40', NULL, '0', 30, 1, NULL),
(89, '', '2025-06-25 21:11:40', '2025-06-25 21:11:40', NULL, '0', 30, 1, NULL),
(90, '', '2025-06-25 21:11:40', '2025-06-25 21:11:40', NULL, '0', 30, 1, NULL),
(91, '', '2025-06-25 21:11:40', '2025-06-25 21:11:40', NULL, '0', 30, 1, NULL),
(92, '', '2025-06-25 21:11:40', '2025-06-25 21:11:40', NULL, '0', 3, 1, NULL),
(93, '', '2025-06-25 21:11:40', '2025-06-25 21:11:40', NULL, '0', 54, 1, NULL),
(94, '', '2025-06-25 21:11:40', '2025-06-25 21:11:40', NULL, '0', 1, 1, NULL),
(95, '', '2025-06-25 21:11:40', '2025-06-25 21:11:40', NULL, '0', 54, 1, NULL),
(96, '', '2025-06-25 21:11:40', '2025-06-25 21:11:40', 'stacked.php', '0', 7, 1, NULL),
(97, '', '2025-06-25 21:11:40', '2025-06-25 21:11:40', 'stacked.php', '0', 7, 1, NULL),
(98, '', '2025-06-25 21:11:40', '2025-06-25 21:11:40', 'stacked.php', '0', 7, 1, NULL),
(99, '', '2025-06-25 21:11:40', '2025-06-25 21:11:40', 'stacked.php', '0', 7, 1, NULL),
(100, '', '2025-06-25 21:11:40', '2025-06-25 21:11:40', NULL, '0', 52, 1, NULL),
(101, '', '2025-06-25 21:11:40', '2025-06-25 21:11:40', NULL, '0', 1, 1, NULL),
(102, '', '2025-06-25 21:11:40', '2025-06-25 21:11:40', NULL, '0', 1, 1, NULL),
(103, '', '2025-06-25 21:11:40', '2025-06-25 21:11:40', NULL, '0', 1, 1, NULL),
(104, '', '2025-06-25 21:11:40', '2025-06-25 21:11:40', NULL, '0', 54, 1, NULL),
(105, '', '2025-06-25 21:11:40', '2025-06-25 21:11:40', 'testimonial_circle.php', '0', 30, 1, NULL),
(106, '', '2025-06-25 21:11:41', '2025-06-25 21:11:41', 'testimonial_circle.php', '0', 30, 1, NULL),
(107, '', '2025-06-25 21:11:41', '2025-06-25 21:11:41', 'testimonial_circle.php', '0', 30, 1, NULL),
(108, '', '2025-06-25 21:11:41', '2025-06-25 21:11:41', 'testimonial_circle.php', '0', 30, 1, NULL),
(109, '', '2025-06-25 21:11:41', '2025-06-25 21:11:41', 'testimonial_circle.php', '0', 30, 1, NULL),
(110, '', '2025-06-25 21:11:41', '2025-06-25 21:11:41', 'testimonial_circle.php', '0', 30, 1, NULL),
(111, '', '2025-06-25 21:11:41', '2025-06-25 21:11:41', NULL, '0', 41, 1, NULL),
(112, '', '2025-06-25 21:11:41', '2025-06-25 21:11:41', NULL, '0', 10, 1, NULL),
(113, '', '2025-06-25 21:11:41', '2025-06-25 21:11:41', NULL, '0', 54, 1, NULL),
(114, '', '2025-06-25 21:11:41', '2025-06-25 21:11:41', NULL, '0', 1, 1, NULL),
(115, '', '2025-06-25 21:11:41', '2025-06-25 21:11:41', 'blog_entry_grid.php', '0', 14, 1, NULL),
(116, '', '2025-06-25 21:11:41', '2025-06-25 21:11:41', NULL, '0', 10, 1, NULL),
(117, '', '2025-06-25 21:11:41', '2025-06-25 21:11:41', NULL, '0', 12, 1, NULL),
(118, '', '2025-06-25 21:11:41', '2025-06-25 21:11:41', NULL, '0', 3, 1, NULL),
(119, '', '2025-06-25 21:11:41', '2025-06-25 21:11:41', NULL, '0', 52, 1, NULL),
(120, '', '2025-06-25 21:11:41', '2025-06-25 21:11:41', NULL, '0', 40, 1, NULL),
(121, '', '2025-06-25 21:11:41', '2025-06-25 21:11:41', 'primary_border_top.php', '0', 1, 1, NULL),
(122, '', '2025-06-25 21:11:41', '2025-06-25 21:11:41', NULL, '0', 1, 1, NULL),
(123, '', '2025-06-25 21:11:41', '2025-06-25 21:11:41', 'padded_form.php', '0', 22, 1, NULL),
(124, '', '2025-06-25 21:11:41', '2025-06-25 21:11:41', 'resource_list.php', '0', 14, 1, NULL),
(125, '', '2025-06-25 21:11:41', '2025-06-25 21:11:41', NULL, '0', 3, 1, NULL),
(126, '', '2025-06-25 21:11:41', '2025-06-25 21:11:41', NULL, '0', 1, 1, NULL),
(127, '', '2025-06-25 21:11:42', '2025-06-25 21:11:42', NULL, '0', 1, 1, NULL),
(128, '', '2025-06-25 21:11:42', '2025-06-25 21:11:42', NULL, '0', 1, 1, NULL),
(129, '', '2025-06-25 21:11:42', '2025-06-25 21:11:42', NULL, '0', 1, 1, NULL),
(130, '', '2025-06-25 21:11:43', '2025-06-25 21:11:43', NULL, '0', 1, 1, NULL),
(131, '', '2025-06-25 21:11:43', '2025-06-25 21:11:43', NULL, '0', 1, 1, NULL),
(132, '', '2025-06-25 21:11:43', '2025-06-25 21:11:43', NULL, '0', 3, 1, NULL),
(133, '', '2025-06-25 21:11:43', '2025-06-25 21:11:43', 'icon_grid.php', '0', 38, 1, NULL),
(134, '', '2025-06-25 21:11:43', '2025-06-25 21:11:43', NULL, '0', 1, 1, NULL),
(135, '', '2025-06-25 21:11:43', '2025-06-25 21:11:43', NULL, '0', 10, 1, NULL),
(136, '', '2025-06-25 21:11:43', '2025-06-25 21:11:43', NULL, '0', 23, 1, NULL),
(137, '', '2025-06-25 21:11:44', '2025-06-25 21:11:44', 'blog_entry_grid.php', '0', 14, 1, NULL),
(138, '', '2025-06-25 21:11:44', '2025-06-25 21:11:44', NULL, '0', 10, 1, NULL),
(139, '', '2025-06-25 21:11:44', '2025-06-25 21:11:44', NULL, '0', 1, 1, NULL),
(140, '', '2025-06-25 21:11:44', '2025-06-25 21:11:44', NULL, '0', 13, 1, NULL),
(141, '', '2025-06-25 21:11:44', '2025-06-25 21:11:44', NULL, '0', 1, 1, NULL),
(142, '', '2025-06-25 21:11:44', '2025-06-25 21:11:44', NULL, '0', 1, 1, NULL),
(143, '', '2025-06-25 21:11:44', '2025-06-25 21:11:44', NULL, '0', 1, 1, NULL),
(144, '', '2025-06-25 21:11:45', '2025-06-25 21:11:45', NULL, '0', 1, 1, NULL),
(145, '', '2025-06-25 21:11:45', '2025-06-25 21:11:45', NULL, '0', 1, 1, NULL),
(146, '', '2025-06-25 21:11:45', '2025-06-25 21:11:45', NULL, '0', 10, 1, NULL),
(147, '', '2025-06-25 21:11:45', '2025-06-25 21:11:45', NULL, '0', 1, 1, NULL),
(148, '', '2025-06-25 21:11:45', '2025-06-25 21:11:45', NULL, '0', 9, 1, NULL),
(149, '', '2025-06-25 21:11:46', '2025-06-25 21:11:46', NULL, '0', 53, 1, NULL),
(150, '', '2025-06-25 21:11:46', '2025-06-25 21:11:46', NULL, '0', 53, 1, NULL),
(151, '', '2025-06-25 21:11:46', '2025-06-25 21:11:46', NULL, '0', 53, 1, NULL),
(152, '', '2025-06-25 21:11:46', '2025-06-25 21:11:46', NULL, '0', 53, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `BlockTypePermissionBlockTypeAccessList`
--

CREATE TABLE `BlockTypePermissionBlockTypeAccessList` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `peID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `permission` varchar(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `BlockTypePermissionBlockTypeAccessListCustom`
--

CREATE TABLE `BlockTypePermissionBlockTypeAccessListCustom` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `peID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `btID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `BlockTypes`
--

CREATE TABLE `BlockTypes` (
  `btIgnorePageThemeGridFrameworkContainer` tinyint(1) NOT NULL,
  `btID` int(11) NOT NULL,
  `btHandle` varchar(128) NOT NULL,
  `btName` varchar(128) NOT NULL,
  `btDescription` longtext NOT NULL,
  `btCopyWhenPropagate` tinyint(1) NOT NULL,
  `btIncludeAll` tinyint(1) NOT NULL,
  `btIsInternal` tinyint(1) NOT NULL,
  `btSupportsInlineEdit` tinyint(1) NOT NULL,
  `btSupportsInlineAdd` tinyint(1) NOT NULL,
  `btDisplayOrder` int(11) NOT NULL,
  `btInterfaceHeight` int(11) NOT NULL,
  `btInterfaceWidth` int(11) NOT NULL,
  `pkgID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `BlockTypes`
--

INSERT INTO `BlockTypes` (`btIgnorePageThemeGridFrameworkContainer`, `btID`, `btHandle`, `btName`, `btDescription`, `btCopyWhenPropagate`, `btIncludeAll`, `btIsInternal`, `btSupportsInlineEdit`, `btSupportsInlineAdd`, `btDisplayOrder`, `btInterfaceHeight`, `btInterfaceWidth`, `pkgID`) VALUES
(0, 1, 'content', 'Content', 'HTML/WYSIWYG Editor Content.', 0, 0, 0, 1, 1, 0, 465, 600, 0),
(1, 2, 'html', 'HTML', 'For adding HTML by hand.', 0, 0, 0, 0, 0, 0, 500, 600, 0),
(1, 3, 'hero_image', 'Hero Image', 'Places a large image on top of a page, with an optional title, description and call to action button.', 0, 0, 0, 0, 0, 0, 500, 640, 0),
(0, 4, 'image', 'Image', 'Adds images and onstates from the library to pages.', 0, 0, 0, 0, 0, 0, 550, 400, 0),
(0, 5, 'file', 'File', 'Link to files stored in the asset library.', 0, 0, 0, 0, 0, 0, 320, 300, 0),
(1, 6, 'horizontal_rule', 'Horizontal Rule', 'Adds a thin hairline horizontal divider to the page.', 0, 0, 0, 0, 0, 0, 400, 400, 0),
(0, 7, 'feature', 'Feature', 'Displays an icon, a title, and a short paragraph description.', 0, 0, 0, 0, 0, 0, 520, 400, 0),
(0, 8, 'feature_link', 'Feature Link', 'Add a title, body and a button/link to a page. Useful for calling out important links.', 0, 0, 0, 0, 0, 0, 500, 640, 0),
(0, 9, 'autonav', 'Auto-Nav', 'Creates navigation trees and sitemaps.', 0, 0, 0, 0, 0, 0, 525, 700, 0),
(0, 10, 'page_title', 'Page Title', 'Displays a Page\'s Title', 0, 0, 0, 0, 0, 0, 500, 470, 0),
(0, 11, 'top_navigation_bar', 'Top Navigation Bar', 'Adds a responsive navigation bar with a logo, menu and search.', 0, 0, 0, 0, 0, 0, 500, 640, 0),
(0, 12, 'faq', 'FAQ', 'Frequently Asked Questions Block', 0, 0, 0, 0, 0, 0, 465, 600, 0),
(0, 13, 'accordion', 'Accordion', 'Collapsible content block.', 0, 0, 0, 0, 0, 0, 580, 720, 0),
(0, 14, 'page_list', 'Page List', 'List pages based on type, area.', 0, 0, 0, 0, 0, 0, 525, 700, 0),
(0, 15, 'next_previous', 'Next & Previous Nav', 'Navigate through sibling pages.', 0, 0, 0, 0, 0, 0, 400, 430, 0),
(0, 16, 'date_navigation', 'Date Navigation', 'Displays a list of months to filter a page list by.', 0, 0, 0, 0, 0, 0, 450, 400, 0),
(0, 17, 'tags', 'Tags', 'List pages based on type, area.', 0, 0, 0, 0, 0, 0, 439, 450, 0),
(0, 18, 'topic_list', 'Topic List', 'Displays a list of your site\'s topics, allowing you to click on them to filter a page list.', 0, 0, 0, 0, 0, 0, 400, 400, 0),
(0, 19, 'rss_displayer', 'RSS Displayer', 'Fetch, parse and display the contents of an RSS or Atom feed.', 0, 0, 0, 0, 0, 0, 550, 400, 0),
(0, 20, 'switch_language', 'Switch Language', 'Adds a front-end language switcher to your website.', 0, 0, 0, 0, 0, 0, 150, 500, 0),
(0, 21, 'breadcrumbs', 'Breadcrumbs', 'Add a breadcrumbs navigation.', 0, 0, 0, 0, 0, 0, 300, 500, 0),
(0, 22, 'express_form', 'Form', 'Build simple forms and surveys.', 1, 0, 0, 0, 0, 0, 700, 640, 0),
(0, 23, 'search', 'Search', 'Add a search box to your site.', 0, 0, 0, 0, 0, 0, 420, 400, 0),
(0, 24, 'external_form', 'External Form', 'Include external forms in the filesystem and place them on pages.', 0, 0, 0, 0, 0, 0, 175, 420, 0),
(0, 25, 'express_entry_list', 'Express Entry List', 'Add a searchable Express entry list to a page.', 0, 0, 0, 0, 0, 0, 400, 640, 0),
(0, 26, 'express_entry_detail', 'Express Entry Detail', 'Add an Express entry detail display to a page.', 0, 0, 0, 0, 0, 0, 400, 640, 0),
(0, 27, 'survey', 'Survey', 'Provide a simple survey, along with results in a pie chart format.', 0, 0, 0, 0, 0, 0, 500, 500, 0),
(0, 28, 'core_conversation', 'Conversation', 'Displays conversations on a page.', 1, 0, 0, 0, 0, 0, 400, 450, 0),
(0, 29, 'social_links', 'Social Links', 'Allows users to add social icons to their website', 0, 0, 0, 0, 0, 0, 400, 400, 0),
(0, 30, 'testimonial', 'Testimonial', 'Displays a quote or paragraph next to biographical information and a person\'s picture.', 0, 0, 0, 0, 0, 0, 560, 450, 0),
(0, 31, 'share_this_page', 'Share This Page', 'Allows users to share this page with social networks.', 0, 0, 0, 0, 0, 0, 400, 400, 0),
(0, 32, 'calendar', 'Calendar', 'Displays a month view calendar on a page.', 0, 0, 0, 0, 0, 0, 475, 500, 0),
(0, 33, 'event_list', 'Event List', 'Displays a list of events from a calendar.', 0, 0, 0, 0, 0, 0, 340, 500, 0),
(0, 34, 'calendar_event', 'Calendar Event', 'Displays a calendar event on a page.', 0, 0, 0, 0, 0, 0, 400, 550, 0),
(0, 35, 'page_attribute_display', 'Page Attribute Display', 'Displays the value of a page attribute for the current page.', 0, 0, 0, 0, 0, 0, 365, 500, 0),
(1, 36, 'image_slider', 'Image Slider', 'Display your images and captions in an attractive slideshow format.', 0, 0, 0, 0, 0, 0, 550, 600, 0),
(0, 37, 'video', 'Video Player', 'Embeds uploaded video into a web page. Supports WebM, Ogg, and Quicktime/MPEG4 formats.', 0, 0, 0, 0, 0, 0, 440, 450, 0),
(0, 38, 'document_library', 'Document Library', 'Add a searchable document library to a page.', 0, 0, 0, 0, 0, 0, 400, 640, 0),
(0, 39, 'youtube', 'YouTube Video', 'Embeds a YouTube Video in your web page.', 0, 0, 0, 0, 0, 0, 490, 400, 0),
(0, 40, 'google_map', 'Google Map', 'Enter an address and a Google Map of that location will be placed in your page.', 0, 0, 0, 0, 0, 0, 550, 525, 0),
(1, 41, 'board', 'Board', 'Adds a Board to your website.', 0, 0, 0, 1, 0, 0, 500, 500, 0),
(0, 42, 'gallery', 'Gallery', 'Creates an Image Gallery in your web page.', 0, 0, 0, 0, 0, 0, 820, 750, 0),
(0, 43, 'desktop_app_status', 'Concrete Status Messages', 'Displays alerts about your Concrete site and package updates.', 0, 0, 0, 0, 0, 0, 400, 400, 0),
(0, 44, 'desktop_site_activity', 'Site Activity', 'Displays a graph of recent activity on your site.', 0, 0, 0, 0, 0, 0, 560, 450, 0),
(0, 45, 'desktop_featured_addon', 'Dashboard Featured Add-On', 'Features an add-on from marketplace.concretecms.com.', 0, 0, 0, 0, 0, 0, 100, 300, 0),
(0, 46, 'desktop_featured_theme', 'Dashboard Featured Theme', 'Features a theme from marketplace.concretecms.com.', 0, 0, 0, 0, 0, 0, 100, 300, 0),
(0, 47, 'desktop_latest_form', 'Latest Form', 'Shows the latest form submission.', 0, 0, 0, 0, 0, 0, 400, 400, 0),
(0, 48, 'desktop_waiting_for_me', 'Waiting for Me', 'Displays workflow actions waiting for you.', 0, 0, 0, 0, 0, 0, 560, 450, 0),
(0, 49, 'desktop_draft_list', 'Draft List', 'Displays a list of all drafts.', 0, 0, 0, 0, 0, 0, 400, 400, 0),
(0, 50, 'desktop_concrete_latest', 'Desktop Latest News', 'Grabs the latest information about Concrete from concretecms.com.', 0, 0, 0, 0, 0, 0, 400, 400, 0),
(0, 51, 'desktop_latest_health_result', 'Desktop Latest Health Result', 'Displays the latest Health Report result on your Dashboard desktop.', 0, 0, 0, 0, 0, 0, 400, 400, 0),
(0, 52, 'core_area_layout', 'Area Layout', 'Proxy block for area layouts.', 0, 0, 1, 1, 1, 0, 400, 400, 0),
(1, 53, 'core_board_slot', 'Board Slot', 'Proxy block for board slots.', 0, 0, 1, 0, 0, 0, 400, 400, 0),
(1, 54, 'core_container', 'Container', 'Proxy block for theme containers added through the UI.', 0, 0, 1, 0, 0, 0, 400, 400, 0),
(0, 55, 'core_page_type_composer_control_output', 'Composer Control', 'Proxy block for blocks that need to be output through composer.', 0, 0, 1, 0, 0, 0, 400, 400, 0),
(0, 56, 'core_scrapbook_display', 'Scrapbook Display', 'Proxy block for blocks pasted through the scrapbook.', 0, 0, 1, 0, 0, 0, 400, 400, 0),
(0, 57, 'core_stack_display', 'Stack Display', 'Proxy block for stacks added through the UI.', 0, 0, 1, 0, 0, 0, 400, 400, 0),
(0, 58, 'core_theme_documentation_breadcrumb', 'Theme Documentation Breadcrumb', 'Adds breadcrumb navigation for use with internal theme documentation.', 0, 0, 1, 0, 0, 0, 400, 400, 0),
(0, 59, 'core_theme_documentation_toc', 'Theme Documentation TOC', 'Displays a table of contents list for theme documentation.', 0, 0, 1, 0, 0, 0, 400, 400, 0),
(0, 60, 'form', 'Legacy Form', 'Build simple forms and surveys.', 1, 0, 0, 0, 0, 0, 550, 525, 0);

-- --------------------------------------------------------

--
-- Table structure for table `BlockTypeSetBlockTypes`
--

CREATE TABLE `BlockTypeSetBlockTypes` (
  `btID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `btsID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `displayOrder` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `BlockTypeSetBlockTypes`
--

INSERT INTO `BlockTypeSetBlockTypes` (`btID`, `btsID`, `displayOrder`) VALUES
(1, 1, 0),
(2, 1, 1),
(3, 1, 2),
(4, 1, 3),
(5, 1, 4),
(6, 1, 5),
(7, 1, 6),
(8, 1, 7),
(9, 2, 0),
(10, 2, 1),
(11, 2, 2),
(13, 2, 3),
(12, 2, 4),
(14, 2, 5),
(15, 2, 6),
(16, 2, 7),
(17, 2, 8),
(18, 2, 9),
(19, 2, 10),
(20, 2, 11),
(21, 2, 12),
(22, 3, 0),
(23, 3, 1),
(24, 3, 2),
(25, 4, 0),
(26, 4, 1),
(27, 5, 0),
(28, 5, 1),
(29, 5, 2),
(30, 5, 3),
(31, 5, 4),
(32, 6, 0),
(33, 6, 1),
(34, 6, 2),
(41, 7, 0),
(35, 7, 1),
(36, 7, 2),
(37, 7, 3),
(38, 7, 4),
(39, 7, 5),
(40, 7, 6),
(42, 7, 7),
(43, 8, 0),
(44, 8, 1),
(45, 8, 2),
(46, 8, 3),
(47, 8, 4),
(48, 8, 5),
(49, 8, 6),
(50, 8, 7),
(51, 8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `BlockTypeSets`
--

CREATE TABLE `BlockTypeSets` (
  `btsID` int(10) UNSIGNED NOT NULL,
  `btsName` varchar(255) DEFAULT NULL,
  `btsHandle` varchar(255) NOT NULL,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `btsDisplayOrder` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `BlockTypeSets`
--

INSERT INTO `BlockTypeSets` (`btsID`, `btsName`, `btsHandle`, `pkgID`, `btsDisplayOrder`) VALUES
(1, 'Basic', 'basic', 0, 0),
(2, 'Navigation', 'navigation', 0, 0),
(3, 'Forms', 'form', 0, 0),
(4, 'Express', 'express', 0, 0),
(5, 'Social Networking', 'social', 0, 0),
(6, 'Calendar & Events', 'calendar', 0, 0),
(7, 'Multimedia', 'multimedia', 0, 0),
(8, 'Desktop', 'core_desktop', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `BoardConfiguredDataSourceConfiguration`
--

CREATE TABLE `BoardConfiguredDataSourceConfiguration` (
  `configurationID` int(10) UNSIGNED NOT NULL,
  `configuredDataSourceID` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `BoardConfiguredDataSourceConfiguration`
--

INSERT INTO `BoardConfiguredDataSourceConfiguration` (`configurationID`, `configuredDataSourceID`, `type`) VALUES
(1, 1, 'pageconfiguration');

-- --------------------------------------------------------

--
-- Table structure for table `BoardConfiguredDataSourceConfigurationCalendarEvent`
--

CREATE TABLE `BoardConfiguredDataSourceConfigurationCalendarEvent` (
  `maxOccurrencesOfSameEvent` int(10) UNSIGNED NOT NULL,
  `query_fields` longtext NOT NULL COMMENT '(DC2Type:object)',
  `query_columns` longtext NOT NULL COMMENT '(DC2Type:object)',
  `query_itemsPerPage` smallint(6) NOT NULL,
  `caID` int(10) UNSIGNED DEFAULT NULL,
  `configurationID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `BoardConfiguredDataSourceConfigurationPage`
--

CREATE TABLE `BoardConfiguredDataSourceConfigurationPage` (
  `query_fields` longtext NOT NULL COMMENT '(DC2Type:object)',
  `query_columns` longtext NOT NULL COMMENT '(DC2Type:object)',
  `query_itemsPerPage` smallint(6) NOT NULL,
  `configurationID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `BoardConfiguredDataSourceConfigurationPage`
--

INSERT INTO `BoardConfiguredDataSourceConfigurationPage` (`query_fields`, `query_columns`, `query_itemsPerPage`, `configurationID`) VALUES
('a:1:{i:0;O:51:\"Concrete\\Core\\Page\\Search\\Field\\Field\\PageTypeField\":3:{s:7:\"\0*\0data\";a:1:{s:4:\"ptID\";i:7;}s:19:\"\0*\0requestVariables\";a:1:{i:0;s:4:\"ptID\";}s:11:\"\0*\0isLoaded\";b:1;}}', 'N;', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `BoardConfiguredDataSources`
--

CREATE TABLE `BoardConfiguredDataSources` (
  `configuredDataSourceID` int(10) UNSIGNED NOT NULL,
  `populationDayIntervalFuture` int(11) NOT NULL,
  `populationDayIntervalPast` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `customWeight` int(11) NOT NULL,
  `boardID` int(10) UNSIGNED DEFAULT NULL,
  `dataSourceID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `BoardConfiguredDataSources`
--

INSERT INTO `BoardConfiguredDataSources` (`configuredDataSourceID`, `populationDayIntervalFuture`, `populationDayIntervalPast`, `name`, `customWeight`, `boardID`, `dataSourceID`) VALUES
(1, 60, 356, 'Blog', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `BoardCustomSlotTemplates`
--

CREATE TABLE `BoardCustomSlotTemplates` (
  `boardID` int(10) UNSIGNED NOT NULL,
  `slotTemplateID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `BoardCustomSlotTemplates`
--

INSERT INTO `BoardCustomSlotTemplates` (`boardID`, `slotTemplateID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `BoardDataSources`
--

CREATE TABLE `BoardDataSources` (
  `dataSourceID` int(11) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `BoardDataSources`
--

INSERT INTO `BoardDataSources` (`dataSourceID`, `handle`, `name`, `pkgID`) VALUES
(1, 'page', 'Page', NULL),
(2, 'calendar_event', 'Calendar Event', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `BoardDesignerCustomElementItems`
--

CREATE TABLE `BoardDesignerCustomElementItems` (
  `itemId` int(10) UNSIGNED NOT NULL,
  `boardItemID` int(10) UNSIGNED DEFAULT NULL,
  `customElementID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `BoardDesignerCustomElements`
--

CREATE TABLE `BoardDesignerCustomElements` (
  `id` int(10) UNSIGNED NOT NULL,
  `elementName` varchar(255) DEFAULT NULL,
  `dateCreated` int(10) UNSIGNED NOT NULL,
  `batchIdentifier` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `status` varchar(1) NOT NULL,
  `uID` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `contentObjectCollection` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `slotTemplate_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `BoardInstanceItemBatches`
--

CREATE TABLE `BoardInstanceItemBatches` (
  `boardInstanceItemBatchID` int(10) UNSIGNED NOT NULL,
  `dateCreated` int(10) UNSIGNED NOT NULL,
  `boardInstanceID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `BoardInstanceItemBatches`
--

INSERT INTO `BoardInstanceItemBatches` (`boardInstanceItemBatchID`, `dateCreated`, `boardInstanceID`) VALUES
(1, 1750864305, 1);

-- --------------------------------------------------------

--
-- Table structure for table `BoardInstanceItems`
--

CREATE TABLE `BoardInstanceItems` (
  `boardInstanceItemID` int(10) UNSIGNED NOT NULL,
  `dateAddedToBoard` int(10) UNSIGNED NOT NULL,
  `boardItemID` int(10) UNSIGNED DEFAULT NULL,
  `configuredDataSourceID` int(10) UNSIGNED DEFAULT NULL,
  `boardInstanceID` int(10) UNSIGNED DEFAULT NULL,
  `boardInstanceItemBatchID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `BoardInstanceItems`
--

INSERT INTO `BoardInstanceItems` (`boardInstanceItemID`, `dateAddedToBoard`, `boardItemID`, `configuredDataSourceID`, `boardInstanceID`, `boardInstanceItemBatchID`) VALUES
(1, 0, 1, 1, 1, 1),
(2, 0, 2, 1, 1, 1),
(3, 0, 3, 1, 1, 1),
(4, 0, 4, 1, 1, 1),
(5, 0, 5, 1, 1, 1),
(6, 0, 6, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `BoardInstanceLogEntries`
--

CREATE TABLE `BoardInstanceLogEntries` (
  `id` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `log_id` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  `timestamp` int(10) UNSIGNED NOT NULL,
  `message` longtext NOT NULL,
  `data` longtext DEFAULT NULL COMMENT '(DC2Type:json)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `BoardInstanceLogEntries`
--

INSERT INTO `BoardInstanceLogEntries` (`id`, `log_id`, `timestamp`, `message`, `data`) VALUES
('ba06571e-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864305, 'Removing all items from instance data pool.', NULL),
('ba082d54-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864305, 'Removing all instance item batches from instance.', NULL),
('ba0ed18a-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864305, 'Retrieved 6 objects from Page data source', NULL),
('ba1685b1-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864305, '6 items returned from item segmenter', NULL),
('ba1819a8-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864305, '6 items returned from data source filterer.', NULL),
('ba197d7f-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864305, 'Item ID 1 was transformed into content', '{\"cID\":260}'),
('ba1bb389-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864305, 'Does not have custom summary templates, checking base array.', NULL),
('ba1d2eaf-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864305, '6 summary templates retrieved for object page - 260', NULL),
('ba1e4b4b-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864305, 'Creating summary content object for page - 260 with template Default Summary Template', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Tips to Build a Beautiful Blog\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/tips-build-beautiful-blog\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"6\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba1f3257-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864305, 'Creating summary content object for page - 260 with template Blog Image Left', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Tips to Build a Beautiful Blog\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/tips-build-beautiful-blog\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"6\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba201c16-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864305, 'Creating summary content object for page - 260 with template Blog Image Right', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Tips to Build a Beautiful Blog\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/tips-build-beautiful-blog\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"6\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba2118e7-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864305, 'Creating summary content object for page - 260 with template Blog Image Top', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Tips to Build a Beautiful Blog\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/tips-build-beautiful-blog\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"6\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba232504-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864305, 'Creating summary content object for page - 260 with template Blog Entry Card', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Tips to Build a Beautiful Blog\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/tips-build-beautiful-blog\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"6\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba242686-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864305, 'Creating summary content object for page - 260 with template Resource Page Entry', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Tips to Build a Beautiful Blog\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/tips-build-beautiful-blog\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"6\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba2544d7-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864305, 'Item ID 2 was transformed into content', '{\"cID\":261}'),
('ba2707b7-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864305, 'Does not have custom summary templates, checking base array.', NULL),
('ba28255a-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864305, '6 summary templates retrieved for object page - 261', NULL),
('ba291e16-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864305, 'Creating summary content object for page - 261 with template Default Summary Template', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"New Product Launch\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/new-product-launch\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"32\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba2a235e-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864305, 'Creating summary content object for page - 261 with template Blog Image Left', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"New Product Launch\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/new-product-launch\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"32\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba2b13d4-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864305, 'Creating summary content object for page - 261 with template Blog Image Right', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"New Product Launch\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/new-product-launch\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"32\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba2c09de-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864305, 'Creating summary content object for page - 261 with template Blog Image Top', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"New Product Launch\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/new-product-launch\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"32\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba2cf33a-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864305, 'Creating summary content object for page - 261 with template Blog Entry Card', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"New Product Launch\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/new-product-launch\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"32\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba2de093-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864305, 'Creating summary content object for page - 261 with template Resource Page Entry', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"New Product Launch\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/new-product-launch\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"32\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba2ef685-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864305, 'Item ID 3 was transformed into content', '{\"cID\":262}'),
('ba3036bf-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Does not have custom summary templates, checking base array.', NULL),
('ba3250bc-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, '6 summary templates retrieved for object page - 262', NULL),
('ba33af41-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Creating summary content object for page - 262 with template Default Summary Template', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"More Fine Posts Here\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/more-fine-posts-here\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"26\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba34eae8-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Creating summary content object for page - 262 with template Blog Image Left', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"More Fine Posts Here\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/more-fine-posts-here\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"26\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba363276-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Creating summary content object for page - 262 with template Blog Image Right', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"More Fine Posts Here\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/more-fine-posts-here\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"26\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba373569-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Creating summary content object for page - 262 with template Blog Image Top', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"More Fine Posts Here\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/more-fine-posts-here\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"26\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba382385-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Creating summary content object for page - 262 with template Blog Entry Card', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"More Fine Posts Here\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/more-fine-posts-here\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"26\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba3914a0-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Creating summary content object for page - 262 with template Resource Page Entry', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"More Fine Posts Here\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/more-fine-posts-here\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"26\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba3a23f5-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Item ID 4 was transformed into content', '{\"cID\":263}'),
('ba3b7e68-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Does not have custom summary templates, checking base array.', NULL),
('ba3c9530-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, '6 summary templates retrieved for object page - 263', NULL),
('ba3d8fae-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Creating summary content object for page - 263 with template Default Summary Template', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Here\'s a Tip You Might Not Know\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/heres-tip-you-might-not-know\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"18\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba3e8a48-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Creating summary content object for page - 263 with template Blog Image Left', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Here\'s a Tip You Might Not Know\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/heres-tip-you-might-not-know\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"18\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba400def-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Creating summary content object for page - 263 with template Blog Image Right', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Here\'s a Tip You Might Not Know\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/heres-tip-you-might-not-know\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"18\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba4128ac-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Creating summary content object for page - 263 with template Blog Image Top', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Here\'s a Tip You Might Not Know\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/heres-tip-you-might-not-know\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"18\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba422a39-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Creating summary content object for page - 263 with template Blog Entry Card', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Here\'s a Tip You Might Not Know\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/heres-tip-you-might-not-know\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"18\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba432b4f-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Creating summary content object for page - 263 with template Resource Page Entry', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Here\'s a Tip You Might Not Know\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/heres-tip-you-might-not-know\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"18\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba4445aa-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Item ID 5 was transformed into content', '{\"cID\":264}'),
('ba45bdc1-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Does not have custom summary templates, checking base array.', NULL),
('ba47d8db-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, '6 summary templates retrieved for object page - 264', NULL),
('ba496049-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Creating summary content object for page - 264 with template Default Summary Template', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Time to Freshen Up Your Website\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/freshen-up-your-website\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"7\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba4af9f4-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Creating summary content object for page - 264 with template Blog Image Left', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Time to Freshen Up Your Website\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/freshen-up-your-website\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"7\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba4c95ec-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Creating summary content object for page - 264 with template Blog Image Right', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Time to Freshen Up Your Website\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/freshen-up-your-website\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"7\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba4e07ae-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Creating summary content object for page - 264 with template Blog Image Top', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Time to Freshen Up Your Website\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/freshen-up-your-website\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"7\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba4f6f02-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Creating summary content object for page - 264 with template Blog Entry Card', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Time to Freshen Up Your Website\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/freshen-up-your-website\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"7\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba51232d-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Creating summary content object for page - 264 with template Resource Page Entry', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Time to Freshen Up Your Website\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/freshen-up-your-website\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"7\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba52c8a8-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Item ID 6 was transformed into content', '{\"cID\":265}'),
('ba545cbb-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Does not have custom summary templates, checking base array.', NULL),
('ba5576bf-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, '6 summary templates retrieved for object page - 265', NULL),
('ba56a48f-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Creating summary content object for page - 265 with template Default Summary Template', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Meet Our New Hires!\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/meet-our-new-hires\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"17\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba585090-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Creating summary content object for page - 265 with template Blog Image Left', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Meet Our New Hires!\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/meet-our-new-hires\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"17\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba593625-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Creating summary content object for page - 265 with template Blog Image Right', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Meet Our New Hires!\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/meet-our-new-hires\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"17\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba5a1348-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Creating summary content object for page - 265 with template Blog Image Top', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Meet Our New Hires!\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/meet-our-new-hires\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"17\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba5b2923-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Creating summary content object for page - 265 with template Blog Entry Card', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Meet Our New Hires!\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/meet-our-new-hires\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"17\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba5c09f8-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'Creating summary content object for page - 265 with template Resource Page Entry', '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Meet Our New Hires!\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/meet-our-new-hires\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"17\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
('ba5d8967-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'While planning slot 5 on board instance 1 no valid template choices were returned.', NULL),
('ba5e63d3-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'While planning slot 6 on board instance 1 no valid template choices were returned.', NULL),
('ba5f422c-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'While planning slot 7 on board instance 1 no valid template choices were returned.', NULL),
('ba602c6c-51d6-11f0-b02f-08a8d011c82b', 'ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864306, 'While planning slot 8 on board instance 1 no valid template choices were returned.', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `BoardInstanceLogs`
--

CREATE TABLE `BoardInstanceLogs` (
  `id` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `dateCreated` int(10) UNSIGNED NOT NULL,
  `boardInstanceID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `BoardInstanceLogs`
--

INSERT INTO `BoardInstanceLogs` (`id`, `dateCreated`, `boardInstanceID`) VALUES
('ba04669c-51d6-11f0-b02f-08a8d011c82b', 1750864305, 1);

-- --------------------------------------------------------

--
-- Table structure for table `BoardInstances`
--

CREATE TABLE `BoardInstances` (
  `boardInstanceID` int(10) UNSIGNED NOT NULL,
  `boardInstanceName` varchar(255) DEFAULT NULL,
  `dateCreated` int(10) UNSIGNED NOT NULL,
  `isGenerating` tinyint(1) NOT NULL,
  `dateDataPoolLastUpdated` int(10) UNSIGNED DEFAULT NULL,
  `dateLastGenerated` int(10) UNSIGNED DEFAULT NULL,
  `boardID` int(10) UNSIGNED DEFAULT NULL,
  `siteID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `BoardInstances`
--

INSERT INTO `BoardInstances` (`boardInstanceID`, `boardInstanceName`, `dateCreated`, `isGenerating`, `dateDataPoolLastUpdated`, `dateLastGenerated`, `boardID`, `siteID`) VALUES
(1, NULL, 1750864301, 0, 1750864305, 1750864306, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `BoardInstanceSlotRules`
--

CREATE TABLE `BoardInstanceSlotRules` (
  `boardInstanceSlotRuleID` int(10) UNSIGNED NOT NULL,
  `slot` int(10) UNSIGNED NOT NULL,
  `batchIdentifier` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `bID` int(10) UNSIGNED NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `timezone` varchar(255) NOT NULL,
  `isLocked` tinyint(1) NOT NULL,
  `dateCreated` int(10) UNSIGNED NOT NULL,
  `startDate` int(10) UNSIGNED NOT NULL,
  `endDate` int(10) UNSIGNED NOT NULL,
  `ruleType` varchar(255) DEFAULT NULL,
  `boardInstanceID` int(10) UNSIGNED DEFAULT NULL,
  `uID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `BoardInstanceSlots`
--

CREATE TABLE `BoardInstanceSlots` (
  `template_id` int(11) DEFAULT NULL,
  `boardInstanceSlotID` int(11) NOT NULL,
  `slot` int(11) NOT NULL,
  `bID` int(11) NOT NULL,
  `boardInstanceID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `BoardInstanceSlots`
--

INSERT INTO `BoardInstanceSlots` (`template_id`, `boardInstanceSlotID`, `slot`, `bID`, `boardInstanceID`) VALUES
(1, 1, 1, 149, 1),
(3, 2, 2, 150, 1),
(3, 3, 3, 151, 1),
(2, 4, 4, 152, 1);

-- --------------------------------------------------------

--
-- Table structure for table `BoardItemCategories`
--

CREATE TABLE `BoardItemCategories` (
  `boardItemCategoryID` int(10) UNSIGNED NOT NULL,
  `treeNodeID` int(10) UNSIGNED NOT NULL,
  `boardItemID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `BoardItemCategories`
--

INSERT INTO `BoardItemCategories` (`boardItemCategoryID`, `treeNodeID`, `boardItemID`) VALUES
(1, 54, 1),
(2, 57, 2),
(3, 55, 3),
(4, 56, 4),
(5, 54, 5),
(6, 58, 6);

-- --------------------------------------------------------

--
-- Table structure for table `BoardItems`
--

CREATE TABLE `BoardItems` (
  `boardItemID` int(10) UNSIGNED NOT NULL,
  `dateCreated` int(10) UNSIGNED NOT NULL,
  `relevantDate` int(10) UNSIGNED NOT NULL,
  `uniqueItemId` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `data` longtext NOT NULL COMMENT '(DC2Type:json)',
  `fID` int(10) UNSIGNED DEFAULT NULL,
  `dataSourceID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `BoardItems`
--

INSERT INTO `BoardItems` (`boardItemID`, `dateCreated`, `relevantDate`, `uniqueItemId`, `name`, `data`, `fID`, `dataSourceID`) VALUES
(1, 1750864305, 1750864297, '260', 'Tips to Build a Beautiful Blog', '{\"cID\":260}', 6, 1),
(2, 1750864305, 1750864297, '261', 'New Product Launch', '{\"cID\":261}', 32, 1),
(3, 1750864305, 1750864297, '262', 'More Fine Posts Here', '{\"cID\":262}', 26, 1),
(4, 1750864305, 1750864297, '263', 'Here\'s a Tip You Might Not Know', '{\"cID\":263}', 18, 1),
(5, 1750864305, 1750864297, '264', 'Time to Freshen Up Your Website', '{\"cID\":264}', 7, 1),
(6, 1750864305, 1750864297, '265', 'Meet Our New Hires!', '{\"cID\":265}', 17, 1);

-- --------------------------------------------------------

--
-- Table structure for table `BoardItemTags`
--

CREATE TABLE `BoardItemTags` (
  `boardItemTagID` int(10) UNSIGNED NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `boardItemID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `BoardPermissionAssignments`
--

CREATE TABLE `BoardPermissionAssignments` (
  `pkID` int(10) UNSIGNED NOT NULL,
  `paID` int(10) UNSIGNED NOT NULL,
  `boardID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Boards`
--

CREATE TABLE `Boards` (
  `template_id` int(11) DEFAULT NULL,
  `boardID` int(10) UNSIGNED NOT NULL,
  `boardName` varchar(255) DEFAULT NULL,
  `sortBy` varchar(255) DEFAULT NULL,
  `hasCustomSlotTemplates` tinyint(1) NOT NULL,
  `hasCustomWeightingRules` tinyint(1) NOT NULL,
  `overridePermissions` tinyint(1) NOT NULL DEFAULT 0,
  `siteID` int(10) UNSIGNED DEFAULT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Boards`
--

INSERT INTO `Boards` (`template_id`, `boardID`, `boardName`, `sortBy`, `hasCustomSlotTemplates`, `hasCustomWeightingRules`, `overridePermissions`, `siteID`, `pkgID`) VALUES
(1, 1, 'Blog', 'relevant_date_desc', 1, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `BoardSlotTemplates`
--

CREATE TABLE `BoardSlotTemplates` (
  `id` int(11) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `BoardSlotTemplates`
--

INSERT INTO `BoardSlotTemplates` (`id`, `icon`, `name`, `handle`, `pkgID`) VALUES
(1, 'blank.png', 'Blog Image Left', 'blog_image_left', NULL),
(2, 'blank.png', 'Blog Image Right', 'blog_image_right', NULL),
(3, 'blank.png', 'Blog Two Up', 'blog_two_up', NULL),
(4, 'blank.png', 'Blog Three Up', 'blog_three_up', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `BoardSlotTemplateTags`
--

CREATE TABLE `BoardSlotTemplateTags` (
  `slottemplate_id` int(11) NOT NULL,
  `designtag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `BoardTemplates`
--

CREATE TABLE `BoardTemplates` (
  `id` int(11) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `BoardTemplates`
--

INSERT INTO `BoardTemplates` (`id`, `icon`, `name`, `handle`, `pkgID`) VALUES
(1, 'blank.png', 'Blog', 'blog', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `btAccordion`
--

CREATE TABLE `btAccordion` (
  `bID` int(10) UNSIGNED NOT NULL,
  `initialState` varchar(20) NOT NULL DEFAULT 'openfirst',
  `itemHeadingFormat` varchar(20) NOT NULL DEFAULT 'h2',
  `alwaysOpen` int(11) DEFAULT NULL,
  `flush` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btAccordion`
--

INSERT INTO `btAccordion` (`bID`, `initialState`, `itemHeadingFormat`, `alwaysOpen`, `flush`) VALUES
(140, 'openfirst', 'h2', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `btAccordionEntries`
--

CREATE TABLE `btAccordionEntries` (
  `id` int(10) UNSIGNED NOT NULL,
  `bID` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btAccordionEntries`
--

INSERT INTO `btAccordionEntries` (`id`, `bID`, `title`, `sortOrder`, `description`) VALUES
(1, 140, 'Accordion Item 1', 0, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consequat lectus eget arcu faucibus consectetur. Sed vel ligula nec dui tempor vestibulum rutrum efficitur magna. Praesent ut diam ut erat vehicula suscipit. Donec quis consequat erat. Etiam lacinia dapibus elit, vel eleifend nisl tempor ac</p>\n'),
(2, 140, 'Accordion Item 2', 1, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consequat lectus eget arcu faucibus consectetur. Sed vel ligula nec dui tempor vestibulum rutrum efficitur magna. Praesent ut diam ut erat vehicula suscipit. Donec quis consequat erat. Etiam lacinia dapibus elit, vel eleifend nisl tempor ac</p>\n'),
(3, 140, 'Accordion Item 3', 2, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consequat lectus eget arcu faucibus consectetur. Sed vel ligula nec dui tempor vestibulum rutrum efficitur magna. Praesent ut diam ut erat vehicula suscipit. Donec quis consequat erat. Etiam lacinia dapibus elit, vel eleifend nisl tempor ac</p>\n');

-- --------------------------------------------------------

--
-- Table structure for table `btBoard`
--

CREATE TABLE `btBoard` (
  `bID` int(10) UNSIGNED NOT NULL,
  `boardInstanceID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btBoard`
--

INSERT INTO `btBoard` (`bID`, `boardInstanceID`) VALUES
(111, 1);

-- --------------------------------------------------------

--
-- Table structure for table `btBreadcrumbs`
--

CREATE TABLE `btBreadcrumbs` (
  `bID` int(10) UNSIGNED NOT NULL,
  `includeCurrent` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `ignoreExcludeNav` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `ignorePermission` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btBreadcrumbs`
--

INSERT INTO `btBreadcrumbs` (`bID`, `includeCurrent`, `ignoreExcludeNav`, `ignorePermission`) VALUES
(22, 0, 1, 0),
(31, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `btCalendar`
--

CREATE TABLE `btCalendar` (
  `bID` int(10) UNSIGNED NOT NULL,
  `caID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `calendarAttributeKeyHandle` varchar(255) DEFAULT NULL,
  `filterByTopicAttributeKeyID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `filterByTopicID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `viewTypes` longtext DEFAULT NULL,
  `viewTypesOrder` longtext DEFAULT NULL,
  `defaultView` longtext DEFAULT NULL,
  `navLinks` int(11) DEFAULT NULL,
  `eventLimit` int(11) DEFAULT NULL,
  `lightboxProperties` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btCalendarEvent`
--

CREATE TABLE `btCalendarEvent` (
  `bID` int(10) UNSIGNED NOT NULL,
  `mode` varchar(1) NOT NULL DEFAULT 'S' COMMENT 'S = Specify, P = Page, R = Request',
  `calendarEventAttributeKeyHandle` varchar(255) NOT NULL DEFAULT '',
  `calendarID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `eventID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `displayEventAttributes` longtext DEFAULT NULL,
  `allowExport` tinyint(1) DEFAULT 0,
  `enableLinkToPage` tinyint(1) DEFAULT 0,
  `displayEventName` tinyint(1) DEFAULT 0,
  `displayEventDate` tinyint(1) DEFAULT 0,
  `displayEventDescription` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btContentFile`
--

CREATE TABLE `btContentFile` (
  `bID` int(10) UNSIGNED NOT NULL,
  `fID` int(10) UNSIGNED DEFAULT NULL,
  `fileLinkText` varchar(255) DEFAULT NULL,
  `filePassword` varchar(255) DEFAULT NULL,
  `forceDownload` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btContentImage`
--

CREATE TABLE `btContentImage` (
  `bID` int(10) UNSIGNED NOT NULL,
  `fID` int(10) UNSIGNED DEFAULT 0,
  `fOnstateID` int(10) UNSIGNED DEFAULT 0,
  `cropImage` int(10) UNSIGNED DEFAULT 0,
  `maxWidth` int(10) UNSIGNED DEFAULT 0,
  `maxHeight` int(10) UNSIGNED DEFAULT 0,
  `externalLink` varchar(255) DEFAULT NULL,
  `internalLinkCID` int(10) UNSIGNED DEFAULT 0,
  `fileLinkID` int(10) UNSIGNED DEFAULT 0,
  `openLinkInNewWindow` tinyint(1) NOT NULL DEFAULT 0,
  `altText` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `lazyLoad` int(10) UNSIGNED DEFAULT 0,
  `sizingOption` varchar(255) DEFAULT 'thumbnails_default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btContentImage`
--

INSERT INTO `btContentImage` (`bID`, `fID`, `fOnstateID`, `cropImage`, `maxWidth`, `maxHeight`, `externalLink`, `internalLinkCID`, `fileLinkID`, `openLinkInNewWindow`, `altText`, `title`, `lazyLoad`, `sizingOption`) VALUES
(47, 15, 0, 0, 0, 0, '', 0, 0, 0, '', '', 0, 'thumbnails_configurable'),
(56, 36, 0, 0, 0, 0, '', 0, 0, 0, '', '', 0, 'thumbnails_configurable'),
(67, 15, 0, 0, 0, 0, '', 0, 0, 0, '', '', 0, 'thumbnails_configurable'),
(77, 36, 0, 0, 0, 0, '', 0, 0, 0, '', '', 0, 'thumbnails_configurable'),
(80, 13, 0, 0, 0, 0, '', 0, 0, 0, '', '', 0, 'thumbnails_configurable'),
(82, 8, 0, 0, 0, 0, '', 0, 0, 0, '', '', 0, 'thumbnails_configurable');

-- --------------------------------------------------------

--
-- Table structure for table `btContentImageBreakpoints`
--

CREATE TABLE `btContentImageBreakpoints` (
  `id` int(10) UNSIGNED NOT NULL,
  `bID` int(10) UNSIGNED DEFAULT NULL,
  `breakpointHandle` varchar(255) DEFAULT NULL,
  `ftTypeID` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btContentImageBreakpoints`
--

INSERT INTO `btContentImageBreakpoints` (`id`, `bID`, `breakpointHandle`, `ftTypeID`) VALUES
(1, 47, 'xs', 3),
(2, 47, 'xl', 3),
(3, 47, 'sm', 3),
(4, 47, 'md', 3),
(5, 47, 'lg', 3),
(6, 56, 'xs', 3),
(7, 56, 'xl', 3),
(8, 56, 'sm', 3),
(9, 56, 'md', 3),
(10, 56, 'lg', 3),
(11, 67, 'xs', 3),
(12, 67, 'xl', 3),
(13, 67, 'sm', 3),
(14, 67, 'md', 3),
(15, 67, 'lg', 3),
(16, 77, 'xs', 3),
(17, 77, 'xl', 3),
(18, 77, 'sm', 3),
(19, 77, 'md', 3),
(20, 77, 'lg', 3),
(21, 80, 'xs', 3),
(22, 80, 'xl', 3),
(23, 80, 'sm', 3),
(24, 80, 'md', 3),
(25, 80, 'lg', 3),
(26, 82, 'xs', 3),
(27, 82, 'xl', 3),
(28, 82, 'sm', 3),
(29, 82, 'md', 3),
(30, 82, 'lg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `btContentLocal`
--

CREATE TABLE `btContentLocal` (
  `bID` int(10) UNSIGNED NOT NULL,
  `content` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btContentLocal`
--

INSERT INTO `btContentLocal` (`bID`, `content`) VALUES
(29, '<h4 class=\"text-center display-4\">From Our Blog</h4>\n'),
(36, '\n                                     <div class=\"atomik-logo\"><concrete-picture fid=\"23\" /><span>Atomik</span></div> \n                                '),
(38, '\n                                     <p><a href=\"{CCM:CID_239}\">About</a></p> <p><a href=\"{CCM:CID_241}\">Documents</a></p> <p><a href=\"{CCM:CID_247}\">Services</a></p> <p><a href=\"{CCM:CID_240}\">Resources</a></p> \n                                '),
(39, '\n                                     <p><a href=\"{CCM:CID_249}\">Blog</a></p> <p><a href=\"{CCM:CID_251}\">Contact Us</a></p> <p><a href=\"{CCM:CID_246}\">Privacy Policy</a></p> <p><a href=\"\">Careers</a></p> \n                                '),
(40, '\n                                     <p>Subscribe to our newsletter to learn more about how we can help your company!</p> \n                                '),
(48, '<h2 class=\"display-2\" style=\"text-align: center;\">What We Do</h2>\n\n<p class=\"lead\" style=\"text-align: center;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.<br />\nAenean eu enim justo. Vestibulum aliquam hendrerit molestie.</p>\n'),
(60, '<h4 class=\"display-4\" style=\"text-align: center;\">From Our Blog</h4>\n'),
(68, '<h2 class=\"display-2\" style=\"text-align: center;\">What We Do</h2>\n\n<p class=\"lead text-secondary\" style=\"text-align: center;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.<br />\nAenean eu enim justo. Vestibulum aliquam hendrerit molestie.</p>\n'),
(84, '<h4 class=\"display-4\" style=\"text-align: center;\">Meet the Team</h2>\n\n<p class=\"lead text-secondary\" style=\"text-align: center;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tincidunt turpis at odio fermentum posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices.</p>\n'),
(94, '<h2 class=\"display-2\" style=\"text-align: center;\">Our Services</h2>\n'),
(101, '<h5 class=\"text-primary\">Testing Heading 1</h5>\n<p>\nMaecenas consequat lectus a euismod pellentesque. Pellentesque commodo quam nec consequat eleifend. Aenean accumsan vehicula ornare. Proin tempus lorem et sapien pretium efficitur. Nunc lectus ante, maximus sed euismod sed, finibus quis dui. Proin mollis risus massa, non aliquet est feugiat eget. Mauris facilisis vitae arcu eu lacinia. Mauris ut lacus tristique, dapibus odio ac, congue nunc. Nam eget mauris tincidunt, bibendum lacus ac, facilisis ipsum.\n</p>\n<h5 class=\"text-primary\">Testing Heading 2</h5>\n<p>\nMaecenas consequat lectus a euismod pellentesque. Pellentesque commodo quam nec consequat eleifend. Aenean accumsan vehicula ornare. Proin tempus lorem et sapien pretium efficitur. Nunc lectus ante, maximus sed euismod sed, finibus quis dui. Proin mollis risus massa, non aliquet est feugiat eget. Mauris facilisis vitae arcu eu lacinia. Mauris ut lacus tristique, dapibus odio ac, congue nunc. Nam eget mauris tincidunt, bibendum lacus ac, facilisis ipsum.\n</p>\n<h5 class=\"text-primary\">Testing Heading 3</h5>\n<p>\nMaecenas consequat lectus a euismod pellentesque. Pellentesque commodo quam nec consequat eleifend. Aenean accumsan vehicula ornare. Proin tempus lorem et sapien pretium efficitur. Nunc lectus ante, maximus sed euismod sed, finibus quis dui. Proin mollis risus massa, non aliquet est feugiat eget. Mauris facilisis vitae arcu eu lacinia. Mauris ut lacus tristique, dapibus odio ac, congue nunc. Nam eget mauris tincidunt, bibendum lacus ac, facilisis ipsum.\n</p>'),
(102, '<h5 class=\"text-primary\">Testing Heading 1</h5>\n<p>\nMaecenas consequat lectus a euismod pellentesque. Pellentesque commodo quam nec consequat eleifend. Aenean accumsan vehicula ornare. Proin tempus lorem et sapien pretium efficitur. Nunc lectus ante, maximus sed euismod sed, finibus quis dui. Proin mollis risus massa, non aliquet est feugiat eget. Mauris facilisis vitae arcu eu lacinia. Mauris ut lacus tristique, dapibus odio ac, congue nunc. Nam eget mauris tincidunt, bibendum lacus ac, facilisis ipsum.\n</p>\n<h5 class=\"text-primary\">Testing Heading 2</h5>\n<p>\nMaecenas consequat lectus a euismod pellentesque. Pellentesque commodo quam nec consequat eleifend. Aenean accumsan vehicula ornare. Proin tempus lorem et sapien pretium efficitur. Nunc lectus ante, maximus sed euismod sed, finibus quis dui. Proin mollis risus massa, non aliquet est feugiat eget. Mauris facilisis vitae arcu eu lacinia. Mauris ut lacus tristique, dapibus odio ac, congue nunc. Nam eget mauris tincidunt, bibendum lacus ac, facilisis ipsum.\n</p>\n<h5 class=\"text-primary\">Testing Heading 3</h5>\n<p>\nMaecenas consequat lectus a euismod pellentesque. Pellentesque commodo quam nec consequat eleifend. Aenean accumsan vehicula ornare. Proin tempus lorem et sapien pretium efficitur. Nunc lectus ante, maximus sed euismod sed, finibus quis dui. Proin mollis risus massa, non aliquet est feugiat eget. Mauris facilisis vitae arcu eu lacinia. Mauris ut lacus tristique, dapibus odio ac, congue nunc. Nam eget mauris tincidunt, bibendum lacus ac, facilisis ipsum.\n</p>'),
(103, '<h3 class=\"display-3\" style=\"text-align: center;\">What Our Clients are Saying</h3>\n\n<p class=\"lead text-secondary\" style=\"text-align: center;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tincidunt turpis at odio fermentum posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae.</p>\n'),
(114, '<h4 class=\"text-center display-4\">Latest Resources</h4>\n'),
(121, '<h5>Headquarters</h5>\n\n<p>123 SW Concrete Pl.<br />\nPortland, OR 97210</p>\n\n<h5>Hours</h5>\n\n<p><b>M-F:</b> 10am - 7pm<br />\n<b>Sat:</b> 12pm - 7pm<br />\n<b>Sunday:</b> Closed</p>\n'),
(122, '<h3 class=\"display-3\" style=\"text-align: center;\">Choosing Us</h3>\n\n<p class=\"lead\" style=\"text-align: center;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.<br />\nAenean eu enim justo. Vestibulum aliquam hendrerit molestie.</p>\n'),
(126, '\n                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi non justo ultricies, facilisis erat quis, vehicula leo. Duis massa ipsum, hendrerit et eleifend ut, eleifend ut metus. Sed venenatis dui sem, sit amet feugiat tortor porttitor interdum. Nulla feugiat risus ac tristique porta. Nulla facilisi. Nam ullamcorper dignissim velit at vestibulum. Suspendisse in libero nec augue aliquet hendrerit. Curabitur tincidunt nisi in tortor efficitur, quis commodo ex tincidunt. Nunc risus enim, dictum sit amet commodo tincidunt, tincidunt sit amet eros. Vivamus dapibus ac nibh eu congue. In rhoncus urna arcu, mattis vehicula augue convallis a. Integer a dui urna. Fusce sit amet neque id metus faucibus convallis. Duis lobortis orci at mollis iaculis. Aliquam lobortis semper turpis, non porttitor metus bibendum sit amet.\n</p>\n<p>\nPraesent efficitur iaculis mauris, vitae maximus lectus lacinia vitae. Aenean in mi augue. Donec eu consectetur purus. Quisque non laoreet lectus. Vestibulum nulla ex, sagittis a lacinia non, accumsan gravida ligula. Sed non euismod enim. Aliquam placerat felis sed turpis tempus sodales. Curabitur fringilla eros arcu, at porta nunc sagittis finibus.\n</p>\n<p>\nDuis non placerat justo. Proin eu neque luctus, lacinia turpis sed, feugiat enim. Etiam turpis erat, convallis sit amet magna et, maximus feugiat lorem. Cras accumsan condimentum sollicitudin. Maecenas pharetra faucibus tempor. Phasellus nec metus id odio dictum efficitur id ut diam. Phasellus quis arcu tincidunt, molestie nisl ut, vehicula lacus. Vivamus non accumsan magna. Proin blandit euismod dui, eget sodales mauris varius bibendum. Nam facilisis fermentum elit, in fringilla elit. Mauris erat arcu, malesuada at dolor quis, condimentum blandit felis. Mauris nec porta sapien, vitae pulvinar nibh. Curabitur id arcu ac magna posuere tempor. Integer id posuere lacus. Donec fringilla dictum turpis molestie rhoncus. Mauris fermentum odio ante, vitae lacinia arcu dapibus id.\n</p>\n<p>\nNunc id velit quam. Ut viverra nec ex sed maximus. Proin vel magna ut quam luctus fringilla at nec tortor. Aliquam pharetra eget metus a elementum. Aenean rhoncus lectus tempor, tempus elit sed, efficitur risus. Sed commodo eget turpis et vehicula. Proin dignissim mi eget risus convallis faucibus. Sed ut nisi eget nunc tincidunt tempus nec eu leo.\n</p>\n<p>\nNam massa mauris, euismod vel tortor vel, finibus accumsan sem. Sed varius vulputate mi, at aliquam dolor rhoncus at. Nunc at luctus massa. Morbi interdum lectus elit, eu auctor ante facilisis ac. Sed a congue libero. In hac habitasse platea dictumst. Suspendisse aliquam ullamcorper odio, non faucibus neque semper quis. Nullam rhoncus varius nunc ut ullamcorper. Pellentesque mattis orci sed enim condimentum semper. Sed nec eros nec odio tristique malesuada. Quisque neque ligula, vehicula vel felis pulvinar, porta gravida sapien. Aenean sit amet efficitur est. Vivamus vel libero malesuada sapien maximus vestibulum. Curabitur feugiat laoreet tempor.\n</p>\n'),
(127, '\n                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi non justo ultricies, facilisis erat quis, vehicula leo. Duis massa ipsum, hendrerit et eleifend ut, eleifend ut metus. Sed venenatis dui sem, sit amet feugiat tortor porttitor interdum. Nulla feugiat risus ac tristique porta. Nulla facilisi. Nam ullamcorper dignissim velit at vestibulum. Suspendisse in libero nec augue aliquet hendrerit. Curabitur tincidunt nisi in tortor efficitur, quis commodo ex tincidunt. Nunc risus enim, dictum sit amet commodo tincidunt, tincidunt sit amet eros. Vivamus dapibus ac nibh eu congue. In rhoncus urna arcu, mattis vehicula augue convallis a. Integer a dui urna. Fusce sit amet neque id metus faucibus convallis. Duis lobortis orci at mollis iaculis. Aliquam lobortis semper turpis, non porttitor metus bibendum sit amet.\n</p>\n<p>\nPraesent efficitur iaculis mauris, vitae maximus lectus lacinia vitae. Aenean in mi augue. Donec eu consectetur purus. Quisque non laoreet lectus. Vestibulum nulla ex, sagittis a lacinia non, accumsan gravida ligula. Sed non euismod enim. Aliquam placerat felis sed turpis tempus sodales. Curabitur fringilla eros arcu, at porta nunc sagittis finibus.\n</p>\n<p>\nDuis non placerat justo. Proin eu neque luctus, lacinia turpis sed, feugiat enim. Etiam turpis erat, convallis sit amet magna et, maximus feugiat lorem. Cras accumsan condimentum sollicitudin. Maecenas pharetra faucibus tempor. Phasellus nec metus id odio dictum efficitur id ut diam. Phasellus quis arcu tincidunt, molestie nisl ut, vehicula lacus. Vivamus non accumsan magna. Proin blandit euismod dui, eget sodales mauris varius bibendum. Nam facilisis fermentum elit, in fringilla elit. Mauris erat arcu, malesuada at dolor quis, condimentum blandit felis. Mauris nec porta sapien, vitae pulvinar nibh. Curabitur id arcu ac magna posuere tempor. Integer id posuere lacus. Donec fringilla dictum turpis molestie rhoncus. Mauris fermentum odio ante, vitae lacinia arcu dapibus id.\n</p>\n<p>\nNunc id velit quam. Ut viverra nec ex sed maximus. Proin vel magna ut quam luctus fringilla at nec tortor. Aliquam pharetra eget metus a elementum. Aenean rhoncus lectus tempor, tempus elit sed, efficitur risus. Sed commodo eget turpis et vehicula. Proin dignissim mi eget risus convallis faucibus. Sed ut nisi eget nunc tincidunt tempus nec eu leo.\n</p>\n<p>\nNam massa mauris, euismod vel tortor vel, finibus accumsan sem. Sed varius vulputate mi, at aliquam dolor rhoncus at. Nunc at luctus massa. Morbi interdum lectus elit, eu auctor ante facilisis ac. Sed a congue libero. In hac habitasse platea dictumst. Suspendisse aliquam ullamcorper odio, non faucibus neque semper quis. Nullam rhoncus varius nunc ut ullamcorper. Pellentesque mattis orci sed enim condimentum semper. Sed nec eros nec odio tristique malesuada. Quisque neque ligula, vehicula vel felis pulvinar, porta gravida sapien. Aenean sit amet efficitur est. Vivamus vel libero malesuada sapien maximus vestibulum. Curabitur feugiat laoreet tempor.\n</p>\n'),
(128, '\n                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi non justo ultricies, facilisis erat quis, vehicula leo. Duis massa ipsum, hendrerit et eleifend ut, eleifend ut metus. Sed venenatis dui sem, sit amet feugiat tortor porttitor interdum. Nulla feugiat risus ac tristique porta. Nulla facilisi. Nam ullamcorper dignissim velit at vestibulum. Suspendisse in libero nec augue aliquet hendrerit. Curabitur tincidunt nisi in tortor efficitur, quis commodo ex tincidunt. Nunc risus enim, dictum sit amet commodo tincidunt, tincidunt sit amet eros. Vivamus dapibus ac nibh eu congue. In rhoncus urna arcu, mattis vehicula augue convallis a. Integer a dui urna. Fusce sit amet neque id metus faucibus convallis. Duis lobortis orci at mollis iaculis. Aliquam lobortis semper turpis, non porttitor metus bibendum sit amet.\n</p>\n<p>\nPraesent efficitur iaculis mauris, vitae maximus lectus lacinia vitae. Aenean in mi augue. Donec eu consectetur purus. Quisque non laoreet lectus. Vestibulum nulla ex, sagittis a lacinia non, accumsan gravida ligula. Sed non euismod enim. Aliquam placerat felis sed turpis tempus sodales. Curabitur fringilla eros arcu, at porta nunc sagittis finibus.\n</p>\n<p>\nDuis non placerat justo. Proin eu neque luctus, lacinia turpis sed, feugiat enim. Etiam turpis erat, convallis sit amet magna et, maximus feugiat lorem. Cras accumsan condimentum sollicitudin. Maecenas pharetra faucibus tempor. Phasellus nec metus id odio dictum efficitur id ut diam. Phasellus quis arcu tincidunt, molestie nisl ut, vehicula lacus. Vivamus non accumsan magna. Proin blandit euismod dui, eget sodales mauris varius bibendum. Nam facilisis fermentum elit, in fringilla elit. Mauris erat arcu, malesuada at dolor quis, condimentum blandit felis. Mauris nec porta sapien, vitae pulvinar nibh. Curabitur id arcu ac magna posuere tempor. Integer id posuere lacus. Donec fringilla dictum turpis molestie rhoncus. Mauris fermentum odio ante, vitae lacinia arcu dapibus id.\n</p>\n<p>\nNunc id velit quam. Ut viverra nec ex sed maximus. Proin vel magna ut quam luctus fringilla at nec tortor. Aliquam pharetra eget metus a elementum. Aenean rhoncus lectus tempor, tempus elit sed, efficitur risus. Sed commodo eget turpis et vehicula. Proin dignissim mi eget risus convallis faucibus. Sed ut nisi eget nunc tincidunt tempus nec eu leo.\n</p>\n<p>\nNam massa mauris, euismod vel tortor vel, finibus accumsan sem. Sed varius vulputate mi, at aliquam dolor rhoncus at. Nunc at luctus massa. Morbi interdum lectus elit, eu auctor ante facilisis ac. Sed a congue libero. In hac habitasse platea dictumst. Suspendisse aliquam ullamcorper odio, non faucibus neque semper quis. Nullam rhoncus varius nunc ut ullamcorper. Pellentesque mattis orci sed enim condimentum semper. Sed nec eros nec odio tristique malesuada. Quisque neque ligula, vehicula vel felis pulvinar, porta gravida sapien. Aenean sit amet efficitur est. Vivamus vel libero malesuada sapien maximus vestibulum. Curabitur feugiat laoreet tempor.\n</p>\n'),
(129, '\n                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi non justo ultricies, facilisis erat quis, vehicula leo. Duis massa ipsum, hendrerit et eleifend ut, eleifend ut metus. Sed venenatis dui sem, sit amet feugiat tortor porttitor interdum. Nulla feugiat risus ac tristique porta. Nulla facilisi. Nam ullamcorper dignissim velit at vestibulum. Suspendisse in libero nec augue aliquet hendrerit. Curabitur tincidunt nisi in tortor efficitur, quis commodo ex tincidunt. Nunc risus enim, dictum sit amet commodo tincidunt, tincidunt sit amet eros. Vivamus dapibus ac nibh eu congue. In rhoncus urna arcu, mattis vehicula augue convallis a. Integer a dui urna. Fusce sit amet neque id metus faucibus convallis. Duis lobortis orci at mollis iaculis. Aliquam lobortis semper turpis, non porttitor metus bibendum sit amet.\n</p>\n<p>\nPraesent efficitur iaculis mauris, vitae maximus lectus lacinia vitae. Aenean in mi augue. Donec eu consectetur purus. Quisque non laoreet lectus. Vestibulum nulla ex, sagittis a lacinia non, accumsan gravida ligula. Sed non euismod enim. Aliquam placerat felis sed turpis tempus sodales. Curabitur fringilla eros arcu, at porta nunc sagittis finibus.\n</p>\n<p>\nDuis non placerat justo. Proin eu neque luctus, lacinia turpis sed, feugiat enim. Etiam turpis erat, convallis sit amet magna et, maximus feugiat lorem. Cras accumsan condimentum sollicitudin. Maecenas pharetra faucibus tempor. Phasellus nec metus id odio dictum efficitur id ut diam. Phasellus quis arcu tincidunt, molestie nisl ut, vehicula lacus. Vivamus non accumsan magna. Proin blandit euismod dui, eget sodales mauris varius bibendum. Nam facilisis fermentum elit, in fringilla elit. Mauris erat arcu, malesuada at dolor quis, condimentum blandit felis. Mauris nec porta sapien, vitae pulvinar nibh. Curabitur id arcu ac magna posuere tempor. Integer id posuere lacus. Donec fringilla dictum turpis molestie rhoncus. Mauris fermentum odio ante, vitae lacinia arcu dapibus id.\n</p>\n<p>\nNunc id velit quam. Ut viverra nec ex sed maximus. Proin vel magna ut quam luctus fringilla at nec tortor. Aliquam pharetra eget metus a elementum. Aenean rhoncus lectus tempor, tempus elit sed, efficitur risus. Sed commodo eget turpis et vehicula. Proin dignissim mi eget risus convallis faucibus. Sed ut nisi eget nunc tincidunt tempus nec eu leo.\n</p>\n<p>\nNam massa mauris, euismod vel tortor vel, finibus accumsan sem. Sed varius vulputate mi, at aliquam dolor rhoncus at. Nunc at luctus massa. Morbi interdum lectus elit, eu auctor ante facilisis ac. Sed a congue libero. In hac habitasse platea dictumst. Suspendisse aliquam ullamcorper odio, non faucibus neque semper quis. Nullam rhoncus varius nunc ut ullamcorper. Pellentesque mattis orci sed enim condimentum semper. Sed nec eros nec odio tristique malesuada. Quisque neque ligula, vehicula vel felis pulvinar, porta gravida sapien. Aenean sit amet efficitur est. Vivamus vel libero malesuada sapien maximus vestibulum. Curabitur feugiat laoreet tempor.\n</p>\n'),
(130, '\n                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi non justo ultricies, facilisis erat quis, vehicula leo. Duis massa ipsum, hendrerit et eleifend ut, eleifend ut metus. Sed venenatis dui sem, sit amet feugiat tortor porttitor interdum. Nulla feugiat risus ac tristique porta. Nulla facilisi. Nam ullamcorper dignissim velit at vestibulum. Suspendisse in libero nec augue aliquet hendrerit. Curabitur tincidunt nisi in tortor efficitur, quis commodo ex tincidunt. Nunc risus enim, dictum sit amet commodo tincidunt, tincidunt sit amet eros. Vivamus dapibus ac nibh eu congue. In rhoncus urna arcu, mattis vehicula augue convallis a. Integer a dui urna. Fusce sit amet neque id metus faucibus convallis. Duis lobortis orci at mollis iaculis. Aliquam lobortis semper turpis, non porttitor metus bibendum sit amet.\n</p>\n<p>\nPraesent efficitur iaculis mauris, vitae maximus lectus lacinia vitae. Aenean in mi augue. Donec eu consectetur purus. Quisque non laoreet lectus. Vestibulum nulla ex, sagittis a lacinia non, accumsan gravida ligula. Sed non euismod enim. Aliquam placerat felis sed turpis tempus sodales. Curabitur fringilla eros arcu, at porta nunc sagittis finibus.\n</p>\n<p>\nDuis non placerat justo. Proin eu neque luctus, lacinia turpis sed, feugiat enim. Etiam turpis erat, convallis sit amet magna et, maximus feugiat lorem. Cras accumsan condimentum sollicitudin. Maecenas pharetra faucibus tempor. Phasellus nec metus id odio dictum efficitur id ut diam. Phasellus quis arcu tincidunt, molestie nisl ut, vehicula lacus. Vivamus non accumsan magna. Proin blandit euismod dui, eget sodales mauris varius bibendum. Nam facilisis fermentum elit, in fringilla elit. Mauris erat arcu, malesuada at dolor quis, condimentum blandit felis. Mauris nec porta sapien, vitae pulvinar nibh. Curabitur id arcu ac magna posuere tempor. Integer id posuere lacus. Donec fringilla dictum turpis molestie rhoncus. Mauris fermentum odio ante, vitae lacinia arcu dapibus id.\n</p>\n<p>\nNunc id velit quam. Ut viverra nec ex sed maximus. Proin vel magna ut quam luctus fringilla at nec tortor. Aliquam pharetra eget metus a elementum. Aenean rhoncus lectus tempor, tempus elit sed, efficitur risus. Sed commodo eget turpis et vehicula. Proin dignissim mi eget risus convallis faucibus. Sed ut nisi eget nunc tincidunt tempus nec eu leo.\n</p>\n<p>\nNam massa mauris, euismod vel tortor vel, finibus accumsan sem. Sed varius vulputate mi, at aliquam dolor rhoncus at. Nunc at luctus massa. Morbi interdum lectus elit, eu auctor ante facilisis ac. Sed a congue libero. In hac habitasse platea dictumst. Suspendisse aliquam ullamcorper odio, non faucibus neque semper quis. Nullam rhoncus varius nunc ut ullamcorper. Pellentesque mattis orci sed enim condimentum semper. Sed nec eros nec odio tristique malesuada. Quisque neque ligula, vehicula vel felis pulvinar, porta gravida sapien. Aenean sit amet efficitur est. Vivamus vel libero malesuada sapien maximus vestibulum. Curabitur feugiat laoreet tempor.\n</p>\n'),
(131, '\n                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi non justo ultricies, facilisis erat quis, vehicula leo. Duis massa ipsum, hendrerit et eleifend ut, eleifend ut metus. Sed venenatis dui sem, sit amet feugiat tortor porttitor interdum. Nulla feugiat risus ac tristique porta. Nulla facilisi. Nam ullamcorper dignissim velit at vestibulum. Suspendisse in libero nec augue aliquet hendrerit. Curabitur tincidunt nisi in tortor efficitur, quis commodo ex tincidunt. Nunc risus enim, dictum sit amet commodo tincidunt, tincidunt sit amet eros. Vivamus dapibus ac nibh eu congue. In rhoncus urna arcu, mattis vehicula augue convallis a. Integer a dui urna. Fusce sit amet neque id metus faucibus convallis. Duis lobortis orci at mollis iaculis. Aliquam lobortis semper turpis, non porttitor metus bibendum sit amet.\n</p>\n<p>\nPraesent efficitur iaculis mauris, vitae maximus lectus lacinia vitae. Aenean in mi augue. Donec eu consectetur purus. Quisque non laoreet lectus. Vestibulum nulla ex, sagittis a lacinia non, accumsan gravida ligula. Sed non euismod enim. Aliquam placerat felis sed turpis tempus sodales. Curabitur fringilla eros arcu, at porta nunc sagittis finibus.\n</p>\n<p>\nDuis non placerat justo. Proin eu neque luctus, lacinia turpis sed, feugiat enim. Etiam turpis erat, convallis sit amet magna et, maximus feugiat lorem. Cras accumsan condimentum sollicitudin. Maecenas pharetra faucibus tempor. Phasellus nec metus id odio dictum efficitur id ut diam. Phasellus quis arcu tincidunt, molestie nisl ut, vehicula lacus. Vivamus non accumsan magna. Proin blandit euismod dui, eget sodales mauris varius bibendum. Nam facilisis fermentum elit, in fringilla elit. Mauris erat arcu, malesuada at dolor quis, condimentum blandit felis. Mauris nec porta sapien, vitae pulvinar nibh. Curabitur id arcu ac magna posuere tempor. Integer id posuere lacus. Donec fringilla dictum turpis molestie rhoncus. Mauris fermentum odio ante, vitae lacinia arcu dapibus id.\n</p>\n<p>\nNunc id velit quam. Ut viverra nec ex sed maximus. Proin vel magna ut quam luctus fringilla at nec tortor. Aliquam pharetra eget metus a elementum. Aenean rhoncus lectus tempor, tempus elit sed, efficitur risus. Sed commodo eget turpis et vehicula. Proin dignissim mi eget risus convallis faucibus. Sed ut nisi eget nunc tincidunt tempus nec eu leo.\n</p>\n<p>\nNam massa mauris, euismod vel tortor vel, finibus accumsan sem. Sed varius vulputate mi, at aliquam dolor rhoncus at. Nunc at luctus massa. Morbi interdum lectus elit, eu auctor ante facilisis ac. Sed a congue libero. In hac habitasse platea dictumst. Suspendisse aliquam ullamcorper odio, non faucibus neque semper quis. Nullam rhoncus varius nunc ut ullamcorper. Pellentesque mattis orci sed enim condimentum semper. Sed nec eros nec odio tristique malesuada. Quisque neque ligula, vehicula vel felis pulvinar, porta gravida sapien. Aenean sit amet efficitur est. Vivamus vel libero malesuada sapien maximus vestibulum. Curabitur feugiat laoreet tempor.\n</p>\n'),
(134, '\n                                     <h1 class=\"display-1\" style=\"text-align: center;\">&nbsp;</h1> <h1 class=\"display-1\" style=\"text-align: center;\">Signup Successful</h1> <p style=\"text-align: center;\">Thank you for signing up to receive our newsletter!</p> <p style=\"text-align: center;\">&nbsp;</p> <p style=\"text-align: center;\">&nbsp;</p> \n                                '),
(139, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dictum luctus nulla ut volutpat. Curabitur id aliquet sem. Vivamus scelerisque congue quam eu sollicitudin. Quisque ut urna luctus, luctus orci ac, mattis diam. Duis eget cursus nulla. Nam commodo nunc tortor, ut elementum eros bibendum eu. Quisque elementum sagittis tortor vitae porta. Integer sed lectus blandit, scelerisque diam non, dictum est. Pellentesque pretium risus a odio blandit vehicula.</p>\n\n<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque sit amet turpis ut justo congue pharetra quis ut elit. Sed commodo in nunc faucibus ullamcorper. Aenean efficitur ex ut neque vulputate fermentum. Nunc commodo enim id enim tincidunt commodo. Nullam vel eleifend leo. Mauris vel aliquam felis. Pellentesque accumsan tellus nisl, ultrices viverra lectus rutrum tempor. Mauris at consectetur turpis.</p>\n\n<p><a href=\"https://portlandlabs.com\">Read More</a></p>\n'),
(141, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dictum luctus nulla ut volutpat. Curabitur id aliquet sem. Vivamus scelerisque congue quam eu sollicitudin. Quisque ut urna luctus, luctus orci ac, mattis diam. Duis eget cursus nulla. Nam commodo nunc tortor, ut elementum eros bibendum eu. Quisque elementum sagittis tortor vitae porta. Integer sed lectus blandit, scelerisque diam non, dictum est. Pellentesque pretium risus a odio blandit vehicula.</p>\n\n<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque sit amet turpis ut justo congue pharetra quis ut elit. Sed commodo in nunc faucibus ullamcorper. Aenean efficitur ex ut neque vulputate fermentum. Nunc commodo enim id enim tincidunt commodo. Nullam vel eleifend leo. Mauris vel aliquam felis. Pellentesque accumsan tellus nisl, ultrices viverra lectus rutrum tempor. Mauris at consectetur turpis.</p>\n\n<p><a href=\"https://portlandlabs.com\">Read More</a></p>\n'),
(142, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dictum luctus nulla ut volutpat. Curabitur id aliquet sem. Vivamus scelerisque congue quam eu sollicitudin. Quisque ut urna luctus, luctus orci ac, mattis diam. Duis eget cursus nulla. Nam commodo nunc tortor, ut elementum eros bibendum eu. Quisque elementum sagittis tortor vitae porta. Integer sed lectus blandit, scelerisque diam non, dictum est. Pellentesque pretium risus a odio blandit vehicula.</p>\n\n<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque sit amet turpis ut justo congue pharetra quis ut elit. Sed commodo in nunc faucibus ullamcorper. Aenean efficitur ex ut neque vulputate fermentum. Nunc commodo enim id enim tincidunt commodo. Nullam vel eleifend leo. Mauris vel aliquam felis. Pellentesque accumsan tellus nisl, ultrices viverra lectus rutrum tempor. Mauris at consectetur turpis.</p>\n\n<p><a href=\"https://portlandlabs.com\">Read More</a></p>\n'),
(143, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dictum luctus nulla ut volutpat. Curabitur id aliquet sem. Vivamus scelerisque congue quam eu sollicitudin. Quisque ut urna luctus, luctus orci ac, mattis diam. Duis eget cursus nulla. Nam commodo nunc tortor, ut elementum eros bibendum eu. Quisque elementum sagittis tortor vitae porta. Integer sed lectus blandit, scelerisque diam non, dictum est. Pellentesque pretium risus a odio blandit vehicula.</p>\n\n<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque sit amet turpis ut justo congue pharetra quis ut elit. Sed commodo in nunc faucibus ullamcorper. Aenean efficitur ex ut neque vulputate fermentum. Nunc commodo enim id enim tincidunt commodo. Nullam vel eleifend leo. Mauris vel aliquam felis. Pellentesque accumsan tellus nisl, ultrices viverra lectus rutrum tempor. Mauris at consectetur turpis.</p>\n\n<p><a href=\"https://portlandlabs.com\">Read More</a></p>\n'),
(144, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dictum luctus nulla ut volutpat. Curabitur id aliquet sem. Vivamus scelerisque congue quam eu sollicitudin. Quisque ut urna luctus, luctus orci ac, mattis diam. Duis eget cursus nulla. Nam commodo nunc tortor, ut elementum eros bibendum eu. Quisque elementum sagittis tortor vitae porta. Integer sed lectus blandit, scelerisque diam non, dictum est. Pellentesque pretium risus a odio blandit vehicula.</p>\n\n<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque sit amet turpis ut justo congue pharetra quis ut elit. Sed commodo in nunc faucibus ullamcorper. Aenean efficitur ex ut neque vulputate fermentum. Nunc commodo enim id enim tincidunt commodo. Nullam vel eleifend leo. Mauris vel aliquam felis. Pellentesque accumsan tellus nisl, ultrices viverra lectus rutrum tempor. Mauris at consectetur turpis.</p>\n\n<p><a href=\"https://portlandlabs.com\">Read More</a></p>\n'),
(145, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dictum luctus nulla ut volutpat. Curabitur id aliquet sem. Vivamus scelerisque congue quam eu sollicitudin. Quisque ut urna luctus, luctus orci ac, mattis diam. Duis eget cursus nulla. Nam commodo nunc tortor, ut elementum eros bibendum eu. Quisque elementum sagittis tortor vitae porta. Integer sed lectus blandit, scelerisque diam non, dictum est. Pellentesque pretium risus a odio blandit vehicula.</p>\n\n<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque sit amet turpis ut justo congue pharetra quis ut elit. Sed commodo in nunc faucibus ullamcorper. Aenean efficitur ex ut neque vulputate fermentum. Nunc commodo enim id enim tincidunt commodo. Nullam vel eleifend leo. Mauris vel aliquam felis. Pellentesque accumsan tellus nisl, ultrices viverra lectus rutrum tempor. Mauris at consectetur turpis.</p>\n\n<p><a href=\"https://portlandlabs.com\">Read More</a></p>\n'),
(147, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus auctor convallis ipsum, sed dapibus ante fermentum at. Praesent tempor sagittis hendrerit. Morbi ac lacus vitae ex rhoncus faucibus. Nunc pretium luctus aliquam. Nunc pellentesque bibendum diam, eget tristique ipsum mollis vitae. Mauris ac sem eu lacus hendrerit blandit at in leo. Vestibulum mi turpis, sollicitudin vel aliquet sed, euismod in tellus. Fusce nisi risus, facilisis eu fermentum vitae, iaculis at lectus. Aliquam id eleifend felis.</p>\n\n<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi sollicitudin, turpis eu cursus molestie, nisi ante convallis mauris, vitae finibus ligula urna id dolor. Duis laoreet iaculis libero, eu bibendum augue dapibus sed. Nullam tellus lorem, tincidunt quis tristique vulputate, pretium ut ex. Mauris euismod tortor id consectetur feugiat. Nulla suscipit ex tellus, placerat scelerisque dolor sodales eu. Integer quis euismod urna, id mollis ante. Etiam in viverra est. Nam pulvinar at urna in rhoncus.</p>\n\n<p>Sed suscipit tempus luctus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent ut placerat elit, sit amet scelerisque nisi. Suspendisse est nisi, viverra et orci sed, varius mattis lorem. Sed ultricies nunc ac ante interdum, quis commodo metus condimentum. Phasellus cursus vel tellus ut volutpat. Nullam urna urna, efficitur in ipsum ac, facilisis viverra nulla. Cras tellus quam, fermentum et sagittis eu, aliquet a ligula. Aliquam erat volutpat. Cras tincidunt odio eu sem pharetra elementum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p>\n\n<p>Vivamus et ornare lorem. Sed ut augue nibh. Nulla convallis tempus diam, quis varius nulla pulvinar id. Nullam maximus finibus urna, at molestie magna dapibus a. Etiam lobortis augue ac metus faucibus tincidunt. Proin ac ante odio. Donec aliquam ornare finibus.</p>\n\n<p>Nullam pulvinar varius sodales. Nunc et fermentum massa, vel tempor metus. Aliquam erat volutpat. Donec pellentesque sem eget varius hendrerit. Nam nunc sem, posuere vitae hendrerit nec, congue non felis. Etiam sed ipsum eget ante rutrum placerat. Sed id elementum neque. Maecenas malesuada nunc ipsum, non posuere erat aliquam eget. Aenean suscipit ipsum tellus, at venenatis turpis semper eu. Sed sem lorem, bibendum vel dapibus a, euismod in tellus. Nunc in sem at quam tempor condimentum. Quisque aliquam eu diam vel volutpat.</p>\n');

-- --------------------------------------------------------

--
-- Table structure for table `btCoreAreaLayout`
--

CREATE TABLE `btCoreAreaLayout` (
  `bID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `arLayoutID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btCoreAreaLayout`
--

INSERT INTO `btCoreAreaLayout` (`bID`, `arLayoutID`) VALUES
(2, 1),
(6, 2),
(9, 3),
(13, 4),
(15, 5),
(17, 6),
(19, 7),
(49, 8),
(100, 9),
(119, 10);

-- --------------------------------------------------------

--
-- Table structure for table `btCoreBoardSlot`
--

CREATE TABLE `btCoreBoardSlot` (
  `bID` int(10) UNSIGNED NOT NULL,
  `slotTemplateID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `contentObjectCollection` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btCoreBoardSlot`
--

INSERT INTO `btCoreBoardSlot` (`bID`, `slotTemplateID`, `contentObjectCollection`) VALUES
(149, 1, '{\"objects\":{\"1\":{\"class\":\"Concrete\\\\Core\\\\Board\\\\Instance\\\\Slot\\\\Content\\\\SummaryObject\",\"templateID\":2,\"dataSourceCategoryHandle\":\"page\",\"title\":\"Blog Image Left\",\"identifier\":260,\"data\":{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Tips to Build a Beautiful Blog\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/tips-build-beautiful-blog\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"6\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}}}}'),
(150, 3, '{\"objects\":{\"1\":{\"class\":\"Concrete\\\\Core\\\\Board\\\\Instance\\\\Slot\\\\Content\\\\SummaryObject\",\"templateID\":4,\"dataSourceCategoryHandle\":\"page\",\"title\":\"Blog Image Top\",\"identifier\":261,\"data\":{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"New Product Launch\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/new-product-launch\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"32\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}},\"2\":{\"class\":\"Concrete\\\\Core\\\\Board\\\\Instance\\\\Slot\\\\Content\\\\SummaryObject\",\"templateID\":4,\"dataSourceCategoryHandle\":\"page\",\"title\":\"Blog Image Top\",\"identifier\":262,\"data\":{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"More Fine Posts Here\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/more-fine-posts-here\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"26\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}}}}'),
(151, 3, '{\"objects\":{\"1\":{\"class\":\"Concrete\\\\Core\\\\Board\\\\Instance\\\\Slot\\\\Content\\\\SummaryObject\",\"templateID\":4,\"dataSourceCategoryHandle\":\"page\",\"title\":\"Blog Image Top\",\"identifier\":263,\"data\":{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Here\'s a Tip You Might Not Know\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/heres-tip-you-might-not-know\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"18\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}},\"2\":{\"class\":\"Concrete\\\\Core\\\\Board\\\\Instance\\\\Slot\\\\Content\\\\SummaryObject\",\"templateID\":4,\"dataSourceCategoryHandle\":\"page\",\"title\":\"Blog Image Top\",\"identifier\":264,\"data\":{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Time to Freshen Up Your Website\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/freshen-up-your-website\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"7\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}}}}'),
(152, 2, '{\"objects\":{\"1\":{\"class\":\"Concrete\\\\Core\\\\Board\\\\Instance\\\\Slot\\\\Content\\\\SummaryObject\",\"templateID\":3,\"dataSourceCategoryHandle\":\"page\",\"title\":\"Blog Image Right\",\"identifier\":265,\"data\":{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Meet Our New Hires!\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/meet-our-new-hires\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"17\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}}}}');

-- --------------------------------------------------------

--
-- Table structure for table `btCoreContainer`
--

CREATE TABLE `btCoreContainer` (
  `bID` int(10) UNSIGNED NOT NULL,
  `containerInstanceID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btCoreContainer`
--

INSERT INTO `btCoreContainer` (`bID`, `containerInstanceID`) VALUES
(28, 1),
(45, 2),
(55, 3),
(59, 4),
(65, 5),
(69, 6),
(76, 7),
(79, 8),
(85, 9),
(93, 10),
(95, 11),
(104, 12),
(113, 13);

-- --------------------------------------------------------

--
-- Table structure for table `btCoreConversation`
--

CREATE TABLE `btCoreConversation` (
  `bID` int(10) UNSIGNED NOT NULL,
  `cnvID` int(11) DEFAULT NULL,
  `enablePosting` int(11) DEFAULT 1,
  `paginate` tinyint(1) NOT NULL DEFAULT 1,
  `itemsPerPage` smallint(5) UNSIGNED NOT NULL DEFAULT 50,
  `displayMode` varchar(255) NOT NULL DEFAULT 'threaded',
  `orderBy` varchar(255) NOT NULL DEFAULT 'date_desc',
  `enableOrdering` tinyint(1) NOT NULL DEFAULT 1,
  `enableCommentRating` tinyint(1) NOT NULL DEFAULT 1,
  `enableTopCommentReviews` tinyint(1) NOT NULL DEFAULT 0,
  `displaySocialLinks` tinyint(1) NOT NULL DEFAULT 1,
  `reviewAggregateAttributeKey` int(11) DEFAULT NULL,
  `displayPostingForm` varchar(255) NOT NULL DEFAULT 'top',
  `addMessageLabel` varchar(255) NOT NULL DEFAULT '',
  `dateFormat` varchar(255) DEFAULT 'default',
  `customDateFormat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btCorePageTypeComposerControlOutput`
--

CREATE TABLE `btCorePageTypeComposerControlOutput` (
  `bID` int(10) UNSIGNED NOT NULL,
  `ptComposerOutputControlID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btCorePageTypeComposerControlOutput`
--

INSERT INTO `btCorePageTypeComposerControlOutput` (`bID`, `ptComposerOutputControlID`) VALUES
(21, 1),
(24, 5),
(34, 6);

-- --------------------------------------------------------

--
-- Table structure for table `btCoreScrapbookDisplay`
--

CREATE TABLE `btCoreScrapbookDisplay` (
  `bID` int(10) UNSIGNED NOT NULL,
  `bOriginalID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btCoreStackDisplay`
--

CREATE TABLE `btCoreStackDisplay` (
  `bID` int(10) UNSIGNED NOT NULL,
  `stID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btDateNavigation`
--

CREATE TABLE `btDateNavigation` (
  `bID` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `filterByParent` tinyint(1) DEFAULT 0,
  `redirectToResults` tinyint(1) DEFAULT 0,
  `cParentID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cTargetID` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'this field is where the links will direct you',
  `ptID` smallint(5) UNSIGNED DEFAULT NULL,
  `titleFormat` varchar(20) NOT NULL DEFAULT 'h5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btDateNavigation`
--

INSERT INTO `btDateNavigation` (`bID`, `title`, `filterByParent`, `redirectToResults`, `cParentID`, `cTargetID`, `ptID`, `titleFormat`) VALUES
(43, 'Archives', 0, 1, 0, 244, 7, 'h4');

-- --------------------------------------------------------

--
-- Table structure for table `btDesktopConcreteLatest`
--

CREATE TABLE `btDesktopConcreteLatest` (
  `bID` int(10) UNSIGNED NOT NULL,
  `slot` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btDesktopConcreteLatest`
--

INSERT INTO `btDesktopConcreteLatest` (`bID`, `slot`) VALUES
(10, 'A'),
(11, 'B'),
(12, 'C');

-- --------------------------------------------------------

--
-- Table structure for table `btDesktopDraftList`
--

CREATE TABLE `btDesktopDraftList` (
  `bID` int(10) UNSIGNED NOT NULL,
  `draftsPerPage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btDesktopDraftList`
--

INSERT INTO `btDesktopDraftList` (`bID`, `draftsPerPage`) VALUES
(16, 10),
(20, 10);

-- --------------------------------------------------------

--
-- Table structure for table `btDesktopSiteActivity`
--

CREATE TABLE `btDesktopSiteActivity` (
  `bID` int(10) UNSIGNED NOT NULL,
  `types` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btDesktopSiteActivity`
--

INSERT INTO `btDesktopSiteActivity` (`bID`, `types`) VALUES
(4, '[\"form_submissions\",\"survey_results\",\"signups\",\"conversation_messages\",\"workflow\"]');

-- --------------------------------------------------------

--
-- Table structure for table `btDocumentLibrary`
--

CREATE TABLE `btDocumentLibrary` (
  `bID` int(10) UNSIGNED NOT NULL,
  `setIds` varchar(255) NOT NULL,
  `folderID` int(11) NOT NULL DEFAULT 0,
  `setMode` varchar(32) DEFAULT NULL,
  `onlyCurrentUser` int(11) DEFAULT 0,
  `tags` varchar(128) DEFAULT NULL,
  `viewProperties` longtext DEFAULT NULL,
  `expandableProperties` varchar(255) DEFAULT NULL,
  `searchProperties` varchar(255) DEFAULT NULL,
  `orderBy` varchar(64) DEFAULT 'title',
  `displayLimit` int(11) DEFAULT 20,
  `displayOrderDesc` tinyint(1) NOT NULL DEFAULT 0,
  `addFilesToSetID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maxThumbWidth` int(11) DEFAULT 100,
  `maxThumbHeight` int(11) DEFAULT 150,
  `enableSearch` int(11) DEFAULT 0,
  `heightMode` varchar(32) DEFAULT 'auto',
  `downloadFileMethod` varchar(32) DEFAULT 'force',
  `fixedHeightSize` int(11) DEFAULT 0,
  `headerBackgroundColor` varchar(32) DEFAULT '',
  `headerBackgroundColorActiveSort` varchar(32) DEFAULT '',
  `headerTextColor` varchar(32) DEFAULT '',
  `allowFileUploading` int(11) DEFAULT 0,
  `allowInPageFileManagement` int(11) DEFAULT 0,
  `tableName` varchar(255) DEFAULT '',
  `tableDescription` varchar(255) DEFAULT '',
  `tableStriped` tinyint(1) DEFAULT 0,
  `rowBackgroundColorAlternate` varchar(32) DEFAULT '',
  `hideFolders` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btDocumentLibrary`
--

INSERT INTO `btDocumentLibrary` (`bID`, `setIds`, `folderID`, `setMode`, `onlyCurrentUser`, `tags`, `viewProperties`, `expandableProperties`, `searchProperties`, `orderBy`, `displayLimit`, `displayOrderDesc`, `addFilesToSetID`, `maxThumbWidth`, `maxThumbHeight`, `enableSearch`, `heightMode`, `downloadFileMethod`, `fixedHeightSize`, `headerBackgroundColor`, `headerBackgroundColorActiveSort`, `headerTextColor`, `allowFileUploading`, `allowInPageFileManagement`, `tableName`, `tableDescription`, `tableStriped`, `rowBackgroundColorAlternate`, `hideFolders`) VALUES
(133, '[]', 8, 'any', 0, '', '[]', '[]', '[]', 'title', 20, 0, 0, 0, 0, 1, 'auto', 'browser', 0, '', '', '', 0, 0, '', '', 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `btEventList`
--

CREATE TABLE `btEventList` (
  `bID` int(10) UNSIGNED NOT NULL,
  `caID` text NOT NULL,
  `calendarAttributeKeyHandle` varchar(255) DEFAULT NULL,
  `totalToRetrieve` smallint(5) UNSIGNED NOT NULL DEFAULT 10,
  `totalPerPage` smallint(5) UNSIGNED NOT NULL DEFAULT 10,
  `filterByTopicAttributeKeyID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `filterByTopicID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `filterByPageTopicAttributeKeyHandle` varchar(255) DEFAULT NULL,
  `filterByFeatured` tinyint(1) NOT NULL DEFAULT 0,
  `eventListTitle` varchar(255) DEFAULT NULL,
  `linkToPage` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `titleFormat` varchar(20) NOT NULL DEFAULT 'h5',
  `eventPeriod` varchar(255) NOT NULL DEFAULT 'future_events',
  `eventOrder` varchar(255) NOT NULL DEFAULT 'most_recent_first'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btExpressEntryDetail`
--

CREATE TABLE `btExpressEntryDetail` (
  `bID` int(10) UNSIGNED NOT NULL,
  `exEntityID` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  `exSpecificEntryID` int(10) UNSIGNED DEFAULT NULL,
  `exEntryAttributeKeyHandle` varchar(255) DEFAULT NULL,
  `exFormID` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  `entryMode` varchar(1) DEFAULT 'S'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btExpressEntryList`
--

CREATE TABLE `btExpressEntryList` (
  `bID` int(10) UNSIGNED NOT NULL,
  `exEntityID` varchar(255) NOT NULL,
  `detailPage` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `linkedProperties` varchar(255) DEFAULT NULL,
  `searchProperties` varchar(255) DEFAULT NULL,
  `searchAssociations` longtext DEFAULT NULL,
  `columns` longtext DEFAULT NULL,
  `filterFields` longtext DEFAULT NULL,
  `displayLimit` int(11) DEFAULT 20,
  `enableItemsPerPageSelection` int(11) DEFAULT 0,
  `enablePagination` int(11) DEFAULT 0,
  `enableSearch` int(11) DEFAULT 0,
  `enableKeywordSearch` int(11) DEFAULT 0,
  `headerBackgroundColor` varchar(32) DEFAULT '',
  `headerBackgroundColorActiveSort` varchar(32) DEFAULT '',
  `headerTextColor` varchar(32) DEFAULT '',
  `tableName` varchar(255) DEFAULT '',
  `tableDescription` varchar(255) DEFAULT '',
  `tableStriped` tinyint(1) DEFAULT 0,
  `rowBackgroundColorAlternate` varchar(32) DEFAULT '',
  `titleFormat` varchar(20) NOT NULL DEFAULT 'h2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btExpressForm`
--

CREATE TABLE `btExpressForm` (
  `bID` int(10) UNSIGNED NOT NULL,
  `exFormID` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  `submitLabel` varchar(255) DEFAULT 'Submit',
  `thankyouMsg` text DEFAULT NULL,
  `notifyMeOnSubmission` tinyint(1) NOT NULL DEFAULT 0,
  `recipientEmail` varchar(255) DEFAULT NULL,
  `displayCaptcha` int(11) DEFAULT 1,
  `storeFormSubmission` tinyint(1) DEFAULT 1,
  `redirectCID` int(11) DEFAULT 0,
  `replyToEmailControlID` varchar(255) DEFAULT NULL,
  `addFilesToSet` int(11) DEFAULT 0,
  `addFilesToFolder` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btExpressForm`
--

INSERT INTO `btExpressForm` (`bID`, `exFormID`, `submitLabel`, `thankyouMsg`, `notifyMeOnSubmission`, `recipientEmail`, `displayCaptcha`, `storeFormSubmission`, `redirectCID`, `replyToEmailControlID`, `addFilesToSet`, `addFilesToFolder`) VALUES
(41, '02e860ae-0518-11ec-bb64-2d8e40952e25', 'Subscribe', 'Thanks!', 0, '', 0, 1, 242, '0', 0, 0),
(123, '881b6bde-220f-4482-b8f9-ace40b5d169b', 'Submit', 'Thanks for your feedback!', 0, '', 0, 1, 0, '02181ae2-634d-11e6-a245-62e65b165d8e\n                                ', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `btExternalForm`
--

CREATE TABLE `btExternalForm` (
  `bID` int(10) UNSIGNED NOT NULL,
  `filename` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btFaq`
--

CREATE TABLE `btFaq` (
  `bID` int(10) UNSIGNED NOT NULL,
  `blockTitle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btFaq`
--

INSERT INTO `btFaq` (`bID`, `blockTitle`) VALUES
(117, '');

-- --------------------------------------------------------

--
-- Table structure for table `btFaqEntries`
--

CREATE TABLE `btFaqEntries` (
  `id` int(10) UNSIGNED NOT NULL,
  `bID` int(10) UNSIGNED DEFAULT NULL,
  `linkTitle` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btFaqEntries`
--

INSERT INTO `btFaqEntries` (`id`, `bID`, `linkTitle`, `title`, `sortOrder`, `description`) VALUES
(1, 117, 'What are page versions?', 'What are page versions?', 0, '\n                                    Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. '),
(2, 117, 'How do I add more people as editors in my website?', 'How do I add more people as editors in my website?', 1, '\n                                    Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. ');

-- --------------------------------------------------------

--
-- Table structure for table `btFeature`
--

CREATE TABLE `btFeature` (
  `bID` int(10) UNSIGNED NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `paragraph` text DEFAULT NULL,
  `externalLink` varchar(255) DEFAULT NULL,
  `internalLinkCID` int(10) UNSIGNED DEFAULT 0,
  `titleFormat` varchar(20) NOT NULL DEFAULT 'h4',
  `fID` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btFeature`
--

INSERT INTO `btFeature` (`bID`, `icon`, `title`, `paragraph`, `externalLink`, `internalLinkCID`, `titleFormat`, `fID`) VALUES
(50, 'fas fa-brain', 'Ideate', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.</p>\n', '', 0, 'h4', 0),
(51, 'fas fa-paint-brush', 'Create', '<p>Donec libero turpis, lacinia nec leo sit amet, dignissim dignissim lacus. Nunc semper, leo vel bibendum dapibus.</p>\n', '', 0, 'h4', 0),
(52, 'fas fa-sync', 'Iterate', '<p>Aenean ullamcorper urna tortor, ut elementum felis volutpat faucibus. Interdum fames ipsum in faucibus.&nbsp;</p>\n', '', 0, 'h4', 0),
(70, 'fas fa-window-maximize', '\n                                                Show off some features with this flexible layout!', '', '', 0, 'h6', 0),
(71, 'fas fa-search-dollar', '\n                                                Show off some features with this flexible layout!', '', '', 0, 'h6', 0),
(72, 'fas fa-mobile-alt', '\n                                                Show off some features with this flexible layout!', '', '', 0, 'h6', 0),
(73, 'fas fa-user', '\n                                                Show off some features with this flexible layout!', '', '', 0, 'h6', 0),
(74, 'fas fa-download', '\n                                                Show off some features with this flexible layout!', '', '', 0, 'h6', 0),
(75, 'fas fa-image', '\n                                                Show off some features with this flexible layout!', '', '', 0, 'h6', 0),
(96, 'fas fa-award', 'Quality', '', '', 0, 'h6', 0),
(97, 'fas fa-palette', 'Design', '', '', 0, 'h6', 0),
(98, 'fas fa-code', 'Development', '', '', 0, 'h6', 0),
(99, 'fas fa-shield-alt', 'Security', '', '', 0, 'h6', 0);

-- --------------------------------------------------------

--
-- Table structure for table `btFeatureLink`
--

CREATE TABLE `btFeatureLink` (
  `bID` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `buttonText` varchar(255) DEFAULT NULL,
  `buttonExternalLink` varchar(255) DEFAULT NULL,
  `buttonInternalLinkCID` int(10) UNSIGNED DEFAULT 0,
  `buttonFileLinkID` int(10) UNSIGNED DEFAULT 0,
  `buttonColor` varchar(255) DEFAULT NULL,
  `buttonStyle` varchar(255) DEFAULT NULL,
  `buttonSize` varchar(255) DEFAULT NULL,
  `titleFormat` varchar(20) NOT NULL DEFAULT 'h2',
  `icon` varchar(255) DEFAULT NULL,
  `fID` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btFeatureLink`
--

INSERT INTO `btFeatureLink` (`bID`, `title`, `body`, `buttonText`, `buttonExternalLink`, `buttonInternalLinkCID`, `buttonFileLinkID`, `buttonColor`, `buttonStyle`, `buttonSize`, `titleFormat`, `icon`, `fID`) VALUES
(46, 'Leverage agile frameworks to provide a robust synopsis', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. Aenean eu enim justo.&nbsp;</p>\n', 'Learn More', '', 0, 0, 'accent', 'outline', 'lg', 'h2', '', 0),
(57, 'Leverage agile frameworks to provide a robust synopsis', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. Aenean eu enim justo.&nbsp;</p>\n', 'Learn More', '', 0, 0, 'primary', 'outline', 'lg', 'h2', '', 0),
(66, 'Leverage agile frameworks to provide a robust synopsis', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. Aenean eu enim justo.&nbsp;</p>\n', 'Learn More', '', 0, 0, 'primary', 'outline', 'lg', 'h2', '', 0),
(78, 'Leverage agile frameworks to provide a robust synopsis', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. Aenean eu enim justo.&nbsp;</p>\n', 'Learn More', '', 0, 0, 'primary', 'outline', 'lg', 'h2', '', 0),
(81, '\n                                                Leverage agile frameworks to provide a robust synopsis', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. Aenean eu enim justo.&nbsp;</p>\n', 'Learn More', '', 0, 0, 'primary', 'outline', 'lg', 'h4', '', 0),
(83, '\n                                                Leverage agile frameworks to provide a robust synopsis', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. Aenean eu enim justo.&nbsp;</p>\n', 'Learn More', '', 0, 0, 'primary', 'outline', 'lg', 'h4', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `btForm`
--

CREATE TABLE `btForm` (
  `bID` int(10) UNSIGNED NOT NULL,
  `questionSetId` int(10) UNSIGNED DEFAULT 0,
  `surveyName` varchar(255) DEFAULT NULL,
  `submitText` varchar(255) DEFAULT 'Submit',
  `thankyouMsg` text DEFAULT NULL,
  `notifyMeOnSubmission` tinyint(1) NOT NULL DEFAULT 0,
  `recipientEmail` varchar(255) DEFAULT NULL,
  `displayCaptcha` int(11) DEFAULT 1,
  `redirectCID` int(11) DEFAULT 0,
  `addFilesToSet` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btFormAnswers`
--

CREATE TABLE `btFormAnswers` (
  `aID` int(10) UNSIGNED NOT NULL,
  `asID` int(10) UNSIGNED DEFAULT 0,
  `msqID` int(10) UNSIGNED DEFAULT 0,
  `answer` varchar(255) DEFAULT NULL,
  `answerLong` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btFormAnswerSet`
--

CREATE TABLE `btFormAnswerSet` (
  `asID` int(10) UNSIGNED NOT NULL,
  `questionSetId` int(10) UNSIGNED DEFAULT 0,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `uID` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btFormQuestions`
--

CREATE TABLE `btFormQuestions` (
  `qID` int(10) UNSIGNED NOT NULL,
  `msqID` int(10) UNSIGNED DEFAULT 0,
  `bID` int(10) UNSIGNED DEFAULT 0,
  `questionSetId` int(10) UNSIGNED DEFAULT 0,
  `question` varchar(255) DEFAULT NULL,
  `inputType` varchar(255) DEFAULT NULL,
  `options` text DEFAULT NULL,
  `position` int(10) UNSIGNED DEFAULT 1000,
  `width` int(10) UNSIGNED DEFAULT 50,
  `height` int(10) UNSIGNED DEFAULT 3,
  `defaultDate` varchar(255) DEFAULT '',
  `required` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btGallery`
--

CREATE TABLE `btGallery` (
  `bID` int(10) UNSIGNED NOT NULL,
  `includeDownloadLink` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btGallery`
--

INSERT INTO `btGallery` (`bID`, `includeDownloadLink`) VALUES
(53, 0),
(62, 0);

-- --------------------------------------------------------

--
-- Table structure for table `btGalleryEntries`
--

CREATE TABLE `btGalleryEntries` (
  `eID` int(10) UNSIGNED NOT NULL,
  `bID` int(10) UNSIGNED DEFAULT NULL,
  `idx` int(10) UNSIGNED DEFAULT NULL,
  `fID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btGalleryEntries`
--

INSERT INTO `btGalleryEntries` (`eID`, `bID`, `idx`, `fID`) VALUES
(1, 53, 0, 34),
(2, 53, 1, 28),
(3, 53, 2, 35),
(4, 53, 3, 27),
(5, 53, 4, 14),
(6, 53, 5, 25),
(7, 62, 0, 4),
(8, 62, 1, 31),
(9, 62, 2, 21),
(10, 62, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `btGalleryEntryDisplayChoices`
--

CREATE TABLE `btGalleryEntryDisplayChoices` (
  `dcID` int(10) UNSIGNED NOT NULL,
  `entryID` int(10) UNSIGNED DEFAULT NULL,
  `bID` int(10) UNSIGNED DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `dcKey` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btGalleryEntryDisplayChoices`
--

INSERT INTO `btGalleryEntryDisplayChoices` (`dcID`, `entryID`, `bID`, `value`, `dcKey`) VALUES
(1, 1, 53, 'Gallery Caption 1', 'caption'),
(2, 1, 53, 'Hover Caption 1', 'hover_caption'),
(3, 1, 53, 'standard', 'size'),
(4, 2, 53, 'Gallery Caption 2', 'caption'),
(5, 2, 53, 'Hover Caption 2', 'hover_caption'),
(6, 2, 53, 'standard', 'size'),
(7, 3, 53, 'Gallery Caption 3', 'caption'),
(8, 3, 53, 'Hover Caption 3', 'hover_caption'),
(9, 3, 53, 'standard', 'size'),
(10, 4, 53, 'Gallery Caption 4', 'caption'),
(11, 4, 53, 'Hover Caption 4', 'hover_caption'),
(12, 4, 53, 'standard', 'size'),
(13, 5, 53, 'Gallery Caption 5', 'caption'),
(14, 5, 53, 'Hover Caption 5', 'hover_caption'),
(15, 5, 53, 'standard', 'size'),
(16, 6, 53, 'Gallery Caption 6', 'caption'),
(17, 6, 53, 'Hover Caption 6', 'hover_caption'),
(18, 6, 53, 'standard', 'size'),
(19, 7, 62, '', 'caption'),
(20, 7, 62, '', 'hover_caption'),
(21, 7, 62, 'standard', 'size'),
(22, 8, 62, '', 'caption'),
(23, 8, 62, '', 'hover_caption'),
(24, 8, 62, 'standard', 'size'),
(25, 9, 62, '', 'caption'),
(26, 9, 62, '', 'hover_caption'),
(27, 9, 62, 'standard', 'size'),
(28, 10, 62, '', 'caption'),
(29, 10, 62, '', 'hover_caption'),
(30, 10, 62, 'standard', 'size');

-- --------------------------------------------------------

--
-- Table structure for table `btGoogleMap`
--

CREATE TABLE `btGoogleMap` (
  `bID` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `zoom` smallint(6) DEFAULT NULL,
  `width` varchar(8) DEFAULT '100%',
  `height` varchar(8) DEFAULT '400px',
  `scrollwheel` tinyint(1) NOT NULL DEFAULT 1,
  `titleFormat` varchar(20) NOT NULL DEFAULT 'h3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btGoogleMap`
--

INSERT INTO `btGoogleMap` (`bID`, `title`, `location`, `latitude`, `longitude`, `zoom`, `width`, `height`, `scrollwheel`, `titleFormat`) VALUES
(120, '', '701 Southwest 6th Avenue, Portland, OR, USA', 45.5191045, -122.6795024, 14, '100%', '400px', 0, 'h3');

-- --------------------------------------------------------

--
-- Table structure for table `btHeroImage`
--

CREATE TABLE `btHeroImage` (
  `bID` int(10) UNSIGNED NOT NULL,
  `image` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `buttonText` varchar(255) DEFAULT NULL,
  `buttonExternalLink` varchar(255) DEFAULT NULL,
  `buttonInternalLinkCID` int(10) UNSIGNED DEFAULT 0,
  `buttonFileLinkID` int(10) UNSIGNED DEFAULT 0,
  `height` varchar(255) DEFAULT NULL,
  `buttonColor` varchar(255) DEFAULT NULL,
  `buttonStyle` varchar(255) DEFAULT NULL,
  `buttonSize` varchar(255) DEFAULT NULL,
  `titleFormat` varchar(20) NOT NULL DEFAULT 'h1',
  `icon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btHeroImage`
--

INSERT INTO `btHeroImage` (`bID`, `image`, `title`, `body`, `buttonText`, `buttonExternalLink`, `buttonInternalLinkCID`, `buttonFileLinkID`, `height`, `buttonColor`, `buttonStyle`, `buttonSize`, `titleFormat`, `icon`) VALUES
(44, 1, 'Atomik Agency', '<h3>A Robust New Theme Built for Your Growing Agency. &nbsp;&nbsp;</h3>\n', 'Learn More', '', 0, 0, '80', 'primary', '', 'lg', 'h1', ''),
(54, 15, '\n                                    Override the digital divide with additional clickthroughs from DevOps.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. Aenean eu enim justo. Vestibulum aliquam hendrerit molestie. Mauris malesuada nisi sit amet augue accumsan tincidunt.&nbsp;</p>\n', '', '', 0, 0, '100', 'primary', '', '', 'h1', ''),
(92, 1, 'Our Services', '<h4>Lorem ipsum dolor sit amet, consectetur adipiscing elit. </h4>\n', '', '', 0, 0, '80', 'primary', '', 'lg', 'h1', ''),
(118, 1, 'Contact Us', '<h4>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h4>\n', '', '', 0, 0, '80', 'primary', '', 'lg', 'h1', ''),
(125, 19, 'Resources', '', '', '', 0, 0, '60', 'primary', '', '', 'h1', ''),
(132, 1, 'Documents', '<h4>Lorem ipsum dolor sit amet, consectetur adipiscing elit. </h4>\n', '', '', 0, 0, '80', 'primary', '', 'lg', 'h1', '');

-- --------------------------------------------------------

--
-- Table structure for table `btImageSlider`
--

CREATE TABLE `btImageSlider` (
  `bID` int(10) UNSIGNED NOT NULL,
  `navigationType` int(10) UNSIGNED DEFAULT 0,
  `timeout` int(10) UNSIGNED DEFAULT NULL,
  `speed` int(10) UNSIGNED DEFAULT NULL,
  `noAnimate` int(10) UNSIGNED DEFAULT NULL,
  `pause` int(10) UNSIGNED DEFAULT NULL,
  `maxWidth` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btImageSlider`
--

INSERT INTO `btImageSlider` (`bID`, `navigationType`, `timeout`, `speed`, `noAnimate`, `pause`, `maxWidth`) VALUES
(58, 2, 4000, 500, 1, 1, 0),
(64, 2, 4000, 500, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `btImageSliderEntries`
--

CREATE TABLE `btImageSliderEntries` (
  `id` int(10) UNSIGNED NOT NULL,
  `bID` int(10) UNSIGNED DEFAULT NULL,
  `cID` int(10) UNSIGNED DEFAULT 0,
  `fID` int(10) UNSIGNED DEFAULT 0,
  `linkURL` varchar(255) DEFAULT NULL,
  `internalLinkCID` int(10) UNSIGNED DEFAULT 0,
  `title` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btImageSliderEntries`
--

INSERT INTO `btImageSliderEntries` (`id`, `bID`, `cID`, `fID`, `linkURL`, `internalLinkCID`, `title`, `description`, `sortOrder`) VALUES
(1, 58, 0, 3, '', 0, 'Collaboratively administrate complex websites with ease.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tincidunt turpis at odio fermentum posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae.</p>\n', 0),
(2, 58, 0, 10, '', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tincidunt turpis at odio fermentum posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae.</p>\n', 1),
(3, 58, 0, 16, '', 0, 'Vestibulum ante ipsum primis.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tincidunt turpis at odio fermentum posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae.</p>\n', 2),
(4, 64, 0, 3, '', 0, 'Collaboratively administrate complex websites with ease.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\n', 0),
(5, 64, 0, 10, '', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\n', 1),
(6, 64, 0, 16, '', 0, 'Vestibulum ante ipsum primis.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\n', 2);

-- --------------------------------------------------------

--
-- Table structure for table `btNavigation`
--

CREATE TABLE `btNavigation` (
  `bID` int(10) UNSIGNED NOT NULL,
  `orderBy` varchar(255) DEFAULT 'alpha_asc',
  `displayPages` varchar(255) DEFAULT 'top' COMMENT 'was enum(''top'',''current'',''above'',''below'',''custom'')',
  `displayPagesCID` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `displayPagesIncludeSelf` tinyint(1) NOT NULL DEFAULT 0,
  `displaySubPages` varchar(255) DEFAULT 'none' COMMENT 'was enum(''none'',''all'',''relevant'',''relevant_breadcrumb'')',
  `displaySubPageLevels` varchar(255) DEFAULT 'none' COMMENT 'was enum(''all'',''none'',''enough'',''enough_plus1'',''custom'')',
  `displaySubPageLevelsNum` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `displayUnavailablePages` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btNavigation`
--

INSERT INTO `btNavigation` (`bID`, `orderBy`, `displayPages`, `displayPagesCID`, `displayPagesIncludeSelf`, `displaySubPages`, `displaySubPageLevels`, `displaySubPageLevelsNum`, `displayUnavailablePages`) VALUES
(148, 'display_asc', 'top', 0, 0, 'none', 'enough', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `btNextPrevious`
--

CREATE TABLE `btNextPrevious` (
  `bID` int(10) UNSIGNED NOT NULL,
  `nextLabel` varchar(128) DEFAULT NULL,
  `previousLabel` varchar(128) DEFAULT NULL,
  `parentLabel` varchar(128) DEFAULT NULL,
  `loopSequence` int(11) DEFAULT 1,
  `orderBy` varchar(20) DEFAULT 'display_asc'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btNextPrevious`
--

INSERT INTO `btNextPrevious` (`bID`, `nextLabel`, `previousLabel`, `parentLabel`, `loopSequence`, `orderBy`) VALUES
(26, 'Next Article', 'Previous Article', '', 0, 'chrono_desc');

-- --------------------------------------------------------

--
-- Table structure for table `btPageAttributeDisplay`
--

CREATE TABLE `btPageAttributeDisplay` (
  `bID` int(10) UNSIGNED NOT NULL,
  `attributeHandle` varchar(255) DEFAULT NULL,
  `attributeTitleText` varchar(255) DEFAULT NULL,
  `displayTag` varchar(255) DEFAULT NULL,
  `dateFormat` varchar(100) DEFAULT 'div',
  `thumbnailHeight` int(10) UNSIGNED DEFAULT NULL,
  `thumbnailWidth` int(10) UNSIGNED DEFAULT NULL,
  `delimiter` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btPageAttributeDisplay`
--

INSERT INTO `btPageAttributeDisplay` (`bID`, `attributeHandle`, `attributeTitleText`, `displayTag`, `dateFormat`, `thumbnailHeight`, `thumbnailWidth`, `delimiter`) VALUES
(32, 'thumbnail', '', 'h1', 'n/j/y, g:i A', 1000, 1000, 'comma');

-- --------------------------------------------------------

--
-- Table structure for table `btPageList`
--

CREATE TABLE `btPageList` (
  `bID` int(10) UNSIGNED NOT NULL,
  `num` smallint(5) UNSIGNED NOT NULL,
  `orderBy` varchar(32) DEFAULT NULL COMMENT 'Was enum, display_asc'',''display_desc'',''chrono_asc'',''chrono_desc'',''alpha_asc'',''alpha_desc'',''score_asc'',''score_desc''',
  `cParentID` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `cThis` tinyint(1) NOT NULL DEFAULT 0,
  `cThisParent` tinyint(1) NOT NULL DEFAULT 0,
  `useButtonForLink` tinyint(1) NOT NULL DEFAULT 0,
  `buttonLinkText` varchar(255) DEFAULT NULL,
  `pageListTitle` varchar(255) DEFAULT NULL,
  `filterByRelated` tinyint(1) NOT NULL DEFAULT 0,
  `filterByCustomTopic` tinyint(1) NOT NULL DEFAULT 0,
  `filterDateOption` varchar(25) DEFAULT 'all' COMMENT '(''all'',''today'',''past'',''future'',''between'')',
  `filterDateDays` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `filterDateStart` varchar(20) DEFAULT NULL,
  `filterDateEnd` varchar(20) DEFAULT NULL,
  `relatedTopicAttributeKeyHandle` varchar(255) DEFAULT NULL,
  `customTopicAttributeKeyHandle` varchar(255) DEFAULT NULL,
  `customTopicTreeNodeID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `includeName` tinyint(1) NOT NULL DEFAULT 1,
  `includeDescription` tinyint(1) NOT NULL DEFAULT 1,
  `includeDate` tinyint(1) NOT NULL DEFAULT 0,
  `includeAllDescendents` tinyint(1) NOT NULL DEFAULT 0,
  `paginate` tinyint(1) NOT NULL DEFAULT 0,
  `displayAliases` tinyint(1) NOT NULL DEFAULT 1,
  `displaySystemPages` tinyint(1) NOT NULL DEFAULT 0,
  `ignorePermissions` tinyint(1) NOT NULL DEFAULT 0,
  `enableExternalFiltering` tinyint(1) NOT NULL DEFAULT 0,
  `excludeCurrentPage` tinyint(1) NOT NULL DEFAULT 0,
  `ptID` smallint(5) UNSIGNED DEFAULT NULL,
  `pfID` int(11) DEFAULT 0,
  `truncateSummaries` int(11) DEFAULT 0,
  `displayFeaturedOnly` tinyint(1) DEFAULT 0,
  `noResultsMessage` varchar(255) DEFAULT NULL,
  `displayThumbnail` tinyint(1) DEFAULT 0,
  `truncateChars` int(11) DEFAULT 128,
  `titleFormat` varchar(20) NOT NULL DEFAULT 'h5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btPageList`
--

INSERT INTO `btPageList` (`bID`, `num`, `orderBy`, `cParentID`, `cThis`, `cThisParent`, `useButtonForLink`, `buttonLinkText`, `pageListTitle`, `filterByRelated`, `filterByCustomTopic`, `filterDateOption`, `filterDateDays`, `filterDateStart`, `filterDateEnd`, `relatedTopicAttributeKeyHandle`, `customTopicAttributeKeyHandle`, `customTopicTreeNodeID`, `includeName`, `includeDescription`, `includeDate`, `includeAllDescendents`, `paginate`, `displayAliases`, `displaySystemPages`, `ignorePermissions`, `enableExternalFiltering`, `excludeCurrentPage`, `ptID`, `pfID`, `truncateSummaries`, `displayFeaturedOnly`, `noResultsMessage`, `displayThumbnail`, `truncateChars`, `titleFormat`) VALUES
(30, 6, 'chrono_desc', 0, 0, 0, 0, '', '', 0, 0, 'all', 0, NULL, NULL, '', '', 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, '', 0, 0, 'h5'),
(61, 6, 'chrono_desc', 0, 0, 0, 0, '', '', 0, 0, 'all', 0, NULL, NULL, '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, '', 1, 0, 'h5'),
(115, 3, 'chrono_desc', 0, 0, 0, 0, '', '', 0, 0, 'all', 0, NULL, NULL, '', '', 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, '', 0, 0, 'h5'),
(124, 8, 'display_asc', 0, 0, 0, 0, '', '', 0, 0, 'all', 0, NULL, NULL, '', '', 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 9, 0, 0, 0, '', 0, 0, 'h5'),
(137, 12, 'chrono_desc', 0, 0, 0, 0, '', '', 0, 0, 'all', 0, NULL, NULL, '', '', 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 7, 0, 0, 0, '', 0, 0, 'h5');

-- --------------------------------------------------------

--
-- Table structure for table `btPageTitle`
--

CREATE TABLE `btPageTitle` (
  `bID` int(10) UNSIGNED NOT NULL,
  `useCustomTitle` int(10) UNSIGNED DEFAULT 0,
  `useFilterTitle` int(10) UNSIGNED DEFAULT 0,
  `useFilterTopic` int(10) UNSIGNED DEFAULT 0,
  `useFilterTag` int(10) UNSIGNED DEFAULT 0,
  `useFilterDate` int(10) UNSIGNED DEFAULT 0,
  `topicTextFormat` varchar(255) DEFAULT NULL,
  `tagTextFormat` varchar(255) DEFAULT NULL,
  `dateTextFormat` varchar(255) DEFAULT NULL,
  `filterDateFormat` varchar(255) DEFAULT NULL,
  `titleText` varchar(255) DEFAULT NULL,
  `formatting` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btPageTitle`
--

INSERT INTO `btPageTitle` (`bID`, `useCustomTitle`, `useFilterTitle`, `useFilterTopic`, `useFilterTag`, `useFilterDate`, `topicTextFormat`, `tagTextFormat`, `dateTextFormat`, `filterDateFormat`, `titleText`, `formatting`) VALUES
(23, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '[Page Title]', NULL),
(33, 0, 0, 0, 0, 0, '0', 'upperWord', '0', 'F Y', '[Page Title]', 'h4'),
(112, 0, 0, 0, 0, 0, '0', 'upperWord', '0', 'F Y', 'Blog', 'h3'),
(116, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'Frequently Asked Questions', 'h3'),
(135, 0, 0, 0, 0, 0, '0', 'upperWord', '0', 'F Y', 'Search', 'h3'),
(138, 1, 0, 0, 0, 0, '0', 'upperWord', '0', 'F Y', 'Search Blog', 'h3'),
(146, 0, 0, 0, 0, 0, '0', 'upperWord', '0', 'F Y', 'Privacy Policy', 'h3');

-- --------------------------------------------------------

--
-- Table structure for table `btRssDisplay`
--

CREATE TABLE `btRssDisplay` (
  `bID` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `dateFormat` varchar(100) DEFAULT NULL,
  `itemsToDisplay` int(10) UNSIGNED DEFAULT 5,
  `showSummary` tinyint(1) NOT NULL DEFAULT 1,
  `launchInNewWindow` tinyint(1) NOT NULL DEFAULT 1,
  `titleFormat` varchar(20) NOT NULL DEFAULT 'h5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btRssDisplay`
--

INSERT INTO `btRssDisplay` (`bID`, `title`, `url`, `dateFormat`, `itemsToDisplay`, `showSummary`, `launchInNewWindow`, `titleFormat`) VALUES
(7, 'Tutorials', 'https://documentation.concretecms.org/rss/tutorials', ':longDate:', 1, 1, 1, ''),
(8, 'News from concretecms.com', 'https://www.concretecms.com/rss/blog', ':longDate:', 3, 1, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `btSearch`
--

CREATE TABLE `btSearch` (
  `bID` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `buttonText` varchar(128) DEFAULT NULL,
  `baseSearchPath` varchar(255) DEFAULT NULL,
  `search_all` tinyint(1) DEFAULT NULL,
  `allow_user_options` tinyint(1) DEFAULT NULL,
  `postTo_cID` int(10) UNSIGNED DEFAULT NULL,
  `resultsURL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btSearch`
--

INSERT INTO `btSearch` (`bID`, `title`, `buttonText`, `baseSearchPath`, `search_all`, `allow_user_options`, `postTo_cID`, `resultsURL`) VALUES
(136, '', 'Search', '', 0, 0, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `btShareThisPage`
--

CREATE TABLE `btShareThisPage` (
  `btShareThisPageID` int(10) UNSIGNED NOT NULL,
  `bID` int(10) UNSIGNED DEFAULT 0,
  `service` varchar(255) DEFAULT NULL,
  `displayOrder` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btShareThisPage`
--

INSERT INTO `btShareThisPage` (`btShareThisPageID`, `bID`, `service`, `displayOrder`) VALUES
(1, 25, 'facebook', 0),
(2, 25, 'twitter', 1),
(3, 25, 'linkedin', 2),
(4, 25, 'email', 3);

-- --------------------------------------------------------

--
-- Table structure for table `btSocialLinks`
--

CREATE TABLE `btSocialLinks` (
  `btSocialLinkID` int(10) UNSIGNED NOT NULL,
  `bID` int(10) UNSIGNED DEFAULT 0,
  `slID` int(10) UNSIGNED DEFAULT 0,
  `displayOrder` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btSocialLinks`
--

INSERT INTO `btSocialLinks` (`btSocialLinkID`, `bID`, `slID`, `displayOrder`) VALUES
(1, 37, 1, 0),
(2, 37, 2, 1),
(3, 37, 3, 2),
(4, 37, 4, 3),
(5, 37, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `btSurvey`
--

CREATE TABLE `btSurvey` (
  `bID` int(10) UNSIGNED NOT NULL,
  `question` varchar(255) DEFAULT '',
  `requiresRegistration` int(11) DEFAULT 0,
  `showResults` int(11) DEFAULT 0,
  `customMessage` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btSurveyOptions`
--

CREATE TABLE `btSurveyOptions` (
  `optionID` int(10) UNSIGNED NOT NULL,
  `bID` int(11) DEFAULT NULL,
  `optionName` varchar(255) DEFAULT NULL,
  `displayOrder` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btSurveyResults`
--

CREATE TABLE `btSurveyResults` (
  `resultID` int(10) UNSIGNED NOT NULL,
  `optionID` int(10) UNSIGNED DEFAULT 0,
  `uID` int(10) UNSIGNED DEFAULT 0,
  `bID` int(11) DEFAULT NULL,
  `cID` int(11) DEFAULT NULL,
  `ipAddress` varchar(128) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btSwitchLanguage`
--

CREATE TABLE `btSwitchLanguage` (
  `bID` int(10) UNSIGNED NOT NULL,
  `label` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btTags`
--

CREATE TABLE `btTags` (
  `bID` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `targetCID` int(11) DEFAULT NULL,
  `displayMode` varchar(20) DEFAULT 'page',
  `cloudCount` int(11) DEFAULT 10,
  `titleFormat` varchar(20) NOT NULL DEFAULT 'h5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btTestimonial`
--

CREATE TABLE `btTestimonial` (
  `bID` int(10) UNSIGNED NOT NULL,
  `fID` int(10) UNSIGNED DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `companyURL` varchar(255) DEFAULT NULL,
  `paragraph` text DEFAULT NULL,
  `awardImageID` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btTestimonial`
--

INSERT INTO `btTestimonial` (`bID`, `fID`, `name`, `position`, `company`, `companyURL`, `paragraph`, `awardImageID`) VALUES
(63, 33, '\n                                     Fabian Rodriguez \n                                ', '\n                                     Senior Manager \n                                ', '\n                                     Systems Inc. \n                                ', '\n                                     \n                                ', '\n                                     Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ourabitur tincidunt consectetur adipiscing elit urabitur tinciduntturpis at odio fermentum. \n                                ', 30),
(86, 24, 'Sam Heinz', 'Concrete Fan', '', '', '', 0),
(87, 9, 'Ruthie Rich', 'Concrete Fan', '', '', '', 0),
(88, 29, 'Amanda Johnson', 'Concrete Fan', '', '', '', 0),
(89, 12, 'Christina Backman', 'Concrete Fan', '', '', '', 0),
(90, 22, 'Robert Cook', 'Concrete Fan', '', '', '', 0),
(91, 5, 'David Briscoe', 'Concrete Fan', '', '', '', 0),
(105, 29, 'Amanda Johnson', 'CFO', 'Bass Designs', '', '\n                                                Donec sem massa, bibendum sodales odio et, pretium eleifend urna. Donec eu nibh mattis, congue velit imperdiet.', 0),
(106, 24, 'Sam Heinz', 'Lead Developer', 'TaftCo Enterprises', '', '\n                                                Donec sem massa, bibendum sodales odio et, pretium eleifend urna. Donec eu nibh mattis, congue velit imperdiet.', 0),
(107, 9, 'VP Engineering', 'VitalTech Incorporated', '', '', '\n                                                Donec sem massa, bibendum sodales odio et, pretium eleifend urna. Donec eu nibh mattis, congue velit imperdiet.', 0),
(108, 5, 'David Briscoe', 'CTO', 'AmuseCorp', '', '\n                                                Donec sem massa, bibendum sodales odio et, pretium eleifend urna. Donec eu nibh mattis, congue velit imperdiet.', 0),
(109, 12, 'Christina Backman', 'Co-Founder', 'Backman Design', '', '\n                                                Donec sem massa, bibendum sodales odio et, pretium eleifend urna. Donec eu nibh mattis, congue velit imperdiet.', 0),
(110, 22, 'Robert Cook', 'Founder', 'Foo Energy Bars', '', '\n                                                Donec sem massa, bibendum sodales odio et, pretium eleifend urna. Donec eu nibh mattis, congue velit imperdiet.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `btTopicList`
--

CREATE TABLE `btTopicList` (
  `bID` int(10) UNSIGNED NOT NULL,
  `mode` varchar(1) NOT NULL DEFAULT 'S' COMMENT 'S = Search, P = Page',
  `topicAttributeKeyHandle` varchar(255) NOT NULL DEFAULT '',
  `topicTreeID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cParentID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `titleFormat` varchar(20) NOT NULL DEFAULT 'h5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btTopicList`
--

INSERT INTO `btTopicList` (`bID`, `mode`, `topicAttributeKeyHandle`, `topicTreeID`, `cParentID`, `title`, `titleFormat`) VALUES
(27, 'P', 'blog_entry_topics', 4, 249, 'Topics', 'h4'),
(42, 'S', 'blog_entry_topics', 4, 244, 'Topics', 'h4');

-- --------------------------------------------------------

--
-- Table structure for table `btTopNavigationBar`
--

CREATE TABLE `btTopNavigationBar` (
  `bID` int(10) UNSIGNED NOT NULL,
  `brandingText` varchar(255) DEFAULT NULL,
  `brandingLogo` int(11) DEFAULT NULL,
  `brandingTransparentLogo` int(11) DEFAULT NULL,
  `includeBrandText` tinyint(1) DEFAULT NULL,
  `includeBrandLogo` tinyint(1) DEFAULT NULL,
  `includeTransparency` tinyint(1) DEFAULT NULL,
  `includeStickyNav` tinyint(1) DEFAULT NULL,
  `includeNavigation` tinyint(1) DEFAULT NULL,
  `includeNavigationDropdowns` tinyint(1) DEFAULT NULL,
  `includeSearchInput` tinyint(1) DEFAULT NULL,
  `searchInputFormActionPageID` int(11) DEFAULT NULL,
  `includeSwitchLanguage` tinyint(1) DEFAULT NULL,
  `ignorePermissions` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btTopNavigationBar`
--

INSERT INTO `btTopNavigationBar` (`bID`, `brandingText`, `brandingLogo`, `brandingTransparentLogo`, `includeBrandText`, `includeBrandLogo`, `includeTransparency`, `includeStickyNav`, `includeNavigation`, `includeNavigationDropdowns`, `includeSearchInput`, `searchInputFormActionPageID`, `includeSwitchLanguage`, `ignorePermissions`) VALUES
(35, '', 23, 11, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `btVideo`
--

CREATE TABLE `btVideo` (
  `bID` int(10) UNSIGNED NOT NULL,
  `webmfID` int(10) UNSIGNED DEFAULT 0,
  `oggfID` int(10) UNSIGNED DEFAULT 0,
  `posterfID` int(10) UNSIGNED DEFAULT 0,
  `mp4fID` int(10) UNSIGNED DEFAULT 0,
  `videoSize` int(10) UNSIGNED DEFAULT 0,
  `width` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btYouTube`
--

CREATE TABLE `btYouTube` (
  `bID` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `videoURL` varchar(255) DEFAULT NULL,
  `vHeight` varchar(255) DEFAULT NULL,
  `vWidth` varchar(255) DEFAULT NULL,
  `sizing` varchar(10) DEFAULT NULL,
  `startTimeEnabled` tinyint(1) DEFAULT NULL,
  `startTime` varchar(10) DEFAULT NULL,
  `noCookie` tinyint(1) DEFAULT NULL,
  `autoplay` tinyint(1) NOT NULL DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  `controls` int(10) UNSIGNED DEFAULT NULL,
  `iv_load_policy` int(10) UNSIGNED DEFAULT NULL,
  `loopEnd` tinyint(1) NOT NULL DEFAULT 0,
  `modestbranding` tinyint(1) NOT NULL DEFAULT 0,
  `lazyLoad` tinyint(1) NOT NULL DEFAULT 0,
  `rel` tinyint(1) NOT NULL DEFAULT 0,
  `showCaptions` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CalendarEventAttributeKeys`
--

CREATE TABLE `CalendarEventAttributeKeys` (
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CalendarEventCustomSummaryTemplates`
--

CREATE TABLE `CalendarEventCustomSummaryTemplates` (
  `template_id` int(11) NOT NULL,
  `eventID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CalendarEventOccurrences`
--

CREATE TABLE `CalendarEventOccurrences` (
  `occurrenceID` int(10) UNSIGNED NOT NULL,
  `startTime` int(11) NOT NULL,
  `endTime` int(11) NOT NULL,
  `cancelled` tinyint(1) NOT NULL,
  `repetitionID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CalendarEventRepetitions`
--

CREATE TABLE `CalendarEventRepetitions` (
  `repetitionID` int(10) UNSIGNED NOT NULL,
  `repetitionObject` longtext NOT NULL COMMENT '(DC2Type:object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CalendarEvents`
--

CREATE TABLE `CalendarEvents` (
  `hasCustomSummaryTemplates` tinyint(1) NOT NULL,
  `eventID` int(10) UNSIGNED NOT NULL,
  `caID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CalendarEventSearchIndexAttributes`
--

CREATE TABLE `CalendarEventSearchIndexAttributes` (
  `eventID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CalendarEventSummaryTemplates`
--

CREATE TABLE `CalendarEventSummaryTemplates` (
  `id` int(11) NOT NULL,
  `template_id` int(11) DEFAULT NULL,
  `data` longtext NOT NULL COMMENT '(DC2Type:json)',
  `eventID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CalendarEventVersionAttributeValues`
--

CREATE TABLE `CalendarEventVersionAttributeValues` (
  `eventVersionID` int(10) UNSIGNED NOT NULL,
  `akID` int(10) UNSIGNED NOT NULL,
  `avID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CalendarEventVersionOccurrences`
--

CREATE TABLE `CalendarEventVersionOccurrences` (
  `versionOccurrenceID` int(10) UNSIGNED NOT NULL,
  `eventVersionID` int(10) UNSIGNED DEFAULT NULL,
  `occurrenceID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CalendarEventVersionRepetitions`
--

CREATE TABLE `CalendarEventVersionRepetitions` (
  `versionRepetitionID` int(10) UNSIGNED NOT NULL,
  `eventVersionID` int(10) UNSIGNED DEFAULT NULL,
  `repetitionID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CalendarEventVersions`
--

CREATE TABLE `CalendarEventVersions` (
  `eventVersionID` int(10) UNSIGNED NOT NULL,
  `evDateAdded` datetime NOT NULL,
  `evActivateDateTime` datetime DEFAULT NULL,
  `evIsApproved` tinyint(1) NOT NULL,
  `evDescription` longtext DEFAULT NULL,
  `evName` longtext DEFAULT NULL,
  `evRelatedPageRelationType` varchar(1) DEFAULT NULL,
  `cID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `eventID` int(10) UNSIGNED DEFAULT NULL,
  `uID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CalendarEventWorkflowProgress`
--

CREATE TABLE `CalendarEventWorkflowProgress` (
  `wpID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `eventID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CalendarPermissionAssignments`
--

CREATE TABLE `CalendarPermissionAssignments` (
  `pkID` int(10) UNSIGNED NOT NULL,
  `paID` int(10) UNSIGNED NOT NULL,
  `caID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CalendarRelatedEvents`
--

CREATE TABLE `CalendarRelatedEvents` (
  `relatedEventID` int(10) UNSIGNED NOT NULL,
  `relationID` int(10) UNSIGNED NOT NULL,
  `relationType` varchar(1) DEFAULT NULL,
  `eventID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Calendars`
--

CREATE TABLE `Calendars` (
  `caID` int(10) UNSIGNED NOT NULL,
  `caName` varchar(255) DEFAULT NULL,
  `caOverridePermissions` tinyint(1) NOT NULL DEFAULT 0,
  `eventPageAttributeKeyHandle` varchar(255) DEFAULT NULL,
  `enableMoreDetails` varchar(1) DEFAULT NULL,
  `eventPageParentID` int(10) UNSIGNED DEFAULT 0,
  `eventPageTypeID` int(10) UNSIGNED DEFAULT 0,
  `eventPageAssociatedID` int(10) UNSIGNED DEFAULT 0,
  `siteID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CollectionAttributeKeys`
--

CREATE TABLE `CollectionAttributeKeys` (
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `CollectionAttributeKeys`
--

INSERT INTO `CollectionAttributeKeys` (`akID`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(21),
(28);

-- --------------------------------------------------------

--
-- Table structure for table `CollectionAttributeValues`
--

CREATE TABLE `CollectionAttributeValues` (
  `cID` int(10) UNSIGNED NOT NULL,
  `cvID` int(10) UNSIGNED NOT NULL,
  `akID` int(10) UNSIGNED NOT NULL,
  `avID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `CollectionAttributeValues`
--

INSERT INTO `CollectionAttributeValues` (`cID`, `cvID`, `akID`, `avID`) VALUES
(2, 1, 6, 1),
(3, 1, 3, 2),
(4, 1, 3, 3),
(5, 1, 3, 4),
(6, 1, 3, 5),
(8, 1, 3, 6),
(9, 1, 7, 7),
(10, 1, 3, 8),
(11, 1, 3, 9),
(12, 1, 7, 10),
(12, 1, 3, 11),
(13, 1, 3, 12),
(14, 1, 3, 13),
(15, 1, 3, 14),
(16, 1, 3, 15),
(17, 1, 3, 16),
(18, 1, 3, 17),
(19, 1, 3, 18),
(19, 1, 7, 19),
(20, 1, 3, 20),
(20, 1, 7, 21),
(23, 1, 3, 22),
(29, 1, 7, 23),
(29, 1, 12, 24),
(30, 1, 7, 25),
(30, 1, 12, 26),
(31, 1, 7, 27),
(31, 1, 12, 28),
(32, 1, 7, 29),
(32, 1, 12, 30),
(33, 1, 7, 31),
(33, 1, 12, 32),
(34, 1, 7, 33),
(34, 1, 12, 34),
(35, 1, 7, 35),
(35, 1, 12, 36),
(36, 1, 7, 37),
(36, 1, 12, 38),
(37, 1, 7, 39),
(37, 1, 12, 40),
(39, 1, 7, 41),
(39, 1, 12, 42),
(40, 1, 7, 43),
(40, 1, 12, 44),
(42, 1, 3, 45),
(43, 1, 3, 46),
(44, 1, 7, 47),
(44, 1, 12, 48),
(45, 1, 3, 49),
(46, 1, 3, 50),
(46, 1, 7, 51),
(47, 1, 3, 52),
(48, 1, 3, 53),
(49, 1, 3, 54),
(51, 1, 3, 55),
(52, 1, 3, 56),
(52, 1, 7, 57),
(54, 1, 7, 58),
(55, 1, 7, 59),
(56, 1, 7, 60),
(57, 1, 7, 61),
(58, 1, 7, 62),
(59, 1, 7, 63),
(61, 1, 7, 64),
(63, 1, 7, 65),
(64, 1, 3, 66),
(65, 1, 3, 67),
(66, 1, 3, 68),
(69, 1, 7, 69),
(69, 1, 12, 70),
(71, 1, 7, 71),
(71, 1, 12, 72),
(74, 1, 6, 73),
(76, 1, 3, 74),
(78, 1, 7, 75),
(78, 1, 12, 76),
(78, 1, 3, 77),
(79, 1, 3, 78),
(80, 1, 3, 79),
(81, 1, 3, 80),
(82, 1, 3, 81),
(83, 1, 3, 82),
(84, 1, 3, 83),
(85, 1, 3, 84),
(87, 1, 3, 85),
(88, 1, 3, 86),
(89, 1, 3, 87),
(90, 1, 3, 88),
(91, 1, 12, 89),
(92, 1, 3, 90),
(93, 1, 3, 91),
(94, 1, 3, 92),
(95, 1, 3, 93),
(95, 1, 7, 94),
(96, 1, 3, 95),
(97, 1, 3, 96),
(97, 1, 7, 97),
(97, 1, 12, 98),
(98, 1, 3, 99),
(100, 1, 3, 100),
(101, 1, 3, 101),
(104, 1, 7, 102),
(104, 1, 12, 103),
(105, 1, 7, 104),
(105, 1, 12, 105),
(106, 1, 7, 106),
(106, 1, 12, 107),
(107, 1, 7, 108),
(107, 1, 12, 109),
(108, 1, 7, 110),
(108, 1, 12, 111),
(114, 1, 3, 112),
(120, 1, 3, 113),
(121, 1, 3, 114),
(122, 1, 3, 115),
(123, 1, 3, 116),
(124, 1, 3, 117),
(125, 1, 3, 118),
(127, 1, 3, 119),
(128, 1, 3, 120),
(129, 1, 3, 121),
(130, 1, 3, 122),
(131, 1, 7, 123),
(131, 1, 3, 124),
(132, 1, 3, 125),
(133, 1, 3, 126),
(134, 1, 3, 127),
(135, 1, 3, 128),
(136, 1, 3, 129),
(137, 1, 3, 130),
(139, 1, 3, 131),
(140, 1, 3, 132),
(141, 1, 3, 133),
(142, 1, 3, 134),
(145, 1, 3, 135),
(146, 1, 3, 136),
(148, 1, 3, 137),
(149, 1, 3, 138),
(150, 1, 3, 139),
(152, 1, 3, 140),
(153, 1, 3, 141),
(157, 1, 3, 142),
(158, 1, 7, 143),
(159, 1, 7, 144),
(160, 1, 3, 145),
(161, 1, 3, 146),
(162, 1, 3, 147),
(163, 1, 3, 148),
(165, 1, 3, 149),
(166, 1, 3, 150),
(167, 1, 3, 151),
(168, 1, 3, 152),
(169, 1, 3, 153),
(171, 1, 3, 154),
(172, 1, 3, 155),
(173, 1, 3, 156),
(174, 1, 3, 157),
(175, 1, 3, 158),
(176, 1, 3, 159),
(177, 1, 3, 160),
(178, 1, 3, 161),
(179, 1, 3, 162),
(189, 1, 3, 163),
(190, 1, 3, 164),
(191, 1, 3, 165),
(192, 1, 3, 166),
(194, 1, 3, 167),
(195, 1, 3, 168),
(196, 1, 3, 169),
(197, 1, 3, 170),
(199, 1, 12, 171),
(200, 1, 3, 172),
(201, 1, 3, 173),
(202, 1, 3, 174),
(203, 1, 3, 175),
(204, 1, 3, 176),
(205, 1, 3, 177),
(206, 1, 3, 178),
(207, 1, 3, 179),
(209, 1, 3, 180),
(213, 1, 3, 181),
(214, 1, 4, 182),
(214, 1, 5, 183),
(214, 1, 7, 184),
(217, 1, 6, 185),
(218, 1, 6, 186),
(220, 1, 6, 187),
(221, 1, 12, 188),
(223, 1, 6, 189),
(229, 1, 6, 190),
(230, 1, 4, 191),
(230, 1, 5, 192),
(230, 1, 7, 193),
(249, 1, 14, 264),
(240, 1, 14, 265),
(260, 1, 21, 266),
(260, 1, 28, 267),
(261, 1, 21, 268),
(261, 1, 28, 269),
(262, 1, 21, 270),
(262, 1, 28, 271),
(263, 1, 21, 272),
(263, 1, 28, 273),
(264, 1, 21, 274),
(264, 1, 28, 275),
(265, 1, 21, 276),
(265, 1, 28, 277),
(242, 1, 7, 278),
(242, 1, 8, 279),
(242, 1, 12, 280),
(243, 1, 7, 281),
(243, 1, 8, 282),
(243, 1, 12, 283),
(244, 1, 7, 284),
(244, 1, 8, 285),
(244, 1, 12, 286),
(253, 1, 10, 287),
(253, 1, 21, 288),
(254, 1, 10, 289),
(254, 1, 21, 290),
(255, 1, 10, 291),
(255, 1, 21, 292),
(256, 1, 10, 293),
(256, 1, 21, 294),
(257, 1, 10, 295),
(257, 1, 21, 296),
(258, 1, 10, 297),
(258, 1, 21, 298),
(246, 1, 7, 299);

-- --------------------------------------------------------

--
-- Table structure for table `Collections`
--

CREATE TABLE `Collections` (
  `cID` int(10) UNSIGNED NOT NULL,
  `cDateAdded` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `cDateModified` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `cHandle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Collections`
--

INSERT INTO `Collections` (`cID`, `cDateAdded`, `cDateModified`, `cHandle`) VALUES
(1, '2025-06-25 21:11:00', '2025-06-25 21:11:36', NULL),
(2, '2025-06-25 21:11:14', '2025-06-25 21:11:14', 'dashboard'),
(3, '2025-06-25 21:11:14', '2025-06-25 21:11:14', 'sitemap'),
(4, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'full'),
(5, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'explore'),
(6, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'search'),
(7, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'files'),
(8, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'search'),
(9, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'details'),
(10, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'attributes'),
(11, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'sets'),
(12, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'add_set'),
(13, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'users'),
(14, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'search'),
(15, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'groups'),
(16, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'group_types'),
(17, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'message'),
(18, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'attributes'),
(19, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'add'),
(20, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'add_group'),
(21, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'bulkupdate'),
(22, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'bulk_user_assignment'),
(23, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'group_sets'),
(24, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'express'),
(25, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'entries'),
(26, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'boards'),
(27, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'boards'),
(28, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'add'),
(29, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'details'),
(30, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'edit'),
(31, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'data_sources'),
(32, '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'appearance'),
(33, '2025-06-25 21:11:15', '2025-06-25 21:11:16', 'weighting'),
(34, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'permissions'),
(35, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'instances'),
(36, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'details'),
(37, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'rules'),
(38, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'designer'),
(39, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'choose_items'),
(40, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'customize_slot'),
(41, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'scheduler'),
(42, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'reports'),
(43, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'forms'),
(44, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'legacy'),
(45, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'health'),
(46, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'details'),
(47, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'surveys'),
(48, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'logs'),
(49, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'page_changes'),
(50, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'pages'),
(51, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'themes'),
(52, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'inspect'),
(53, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'types'),
(54, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'organize'),
(55, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'add'),
(56, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'form'),
(57, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'output'),
(58, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'attributes'),
(59, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'permissions'),
(60, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'templates'),
(61, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'add'),
(62, '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'containers'),
(63, '2025-06-25 21:11:16', '2025-06-25 21:11:17', 'add'),
(64, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'attributes'),
(65, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'single'),
(66, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'feeds'),
(67, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'calendar'),
(68, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'events'),
(69, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'event_list'),
(70, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'add'),
(71, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'permissions'),
(72, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'attributes'),
(73, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'conversations'),
(74, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'messages'),
(75, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'blocks'),
(76, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'stacks'),
(77, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'permissions'),
(78, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'list'),
(79, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'types'),
(80, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'extend'),
(81, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'install'),
(82, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'update'),
(83, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'themes'),
(84, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'addons'),
(85, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'system'),
(86, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'basics'),
(87, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'name'),
(88, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'marketplace'),
(89, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'production_mode'),
(90, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'appearance'),
(91, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'site_information'),
(92, '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'icons'),
(93, '2025-06-25 21:11:17', '2025-06-25 21:11:18', 'editor'),
(94, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'multilingual'),
(95, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'update'),
(96, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'timezone'),
(97, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'attributes'),
(98, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'reset_edit_mode'),
(99, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'social'),
(100, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'social_links'),
(101, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'opengraph'),
(102, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'express'),
(103, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'entities'),
(104, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'attributes'),
(105, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'associations'),
(106, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'forms'),
(107, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'customize_search'),
(108, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'order_entries'),
(109, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'entries'),
(110, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'multisite'),
(111, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'sites'),
(112, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'types'),
(113, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'settings'),
(114, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'multilingual'),
(115, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'setup'),
(116, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'copy'),
(117, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'page_report'),
(118, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'translate_interface'),
(119, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'seo'),
(120, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'urls'),
(121, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'bulk'),
(122, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'codes'),
(123, '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'excluded'),
(124, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'searchindex'),
(125, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'url_slug'),
(126, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'files'),
(127, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'filetypes'),
(128, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'file_chooser'),
(129, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'permissions'),
(130, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'thumbnails'),
(131, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'options'),
(132, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'image_uploading'),
(133, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'image_editor'),
(134, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'storage'),
(135, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'external_file_provider'),
(136, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'export_options'),
(137, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'uploads'),
(138, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'automation'),
(139, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'tasks'),
(140, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'activity'),
(141, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'failed'),
(142, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'schedule'),
(143, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'settings'),
(144, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'notification'),
(145, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'events'),
(146, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'alerts'),
(147, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'optimization'),
(148, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'cache'),
(149, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'clearcache'),
(150, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'jobs'),
(151, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'permissions'),
(152, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'site'),
(153, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'tasks'),
(154, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'users'),
(155, '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'advanced'),
(156, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'workflows'),
(157, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'denylist'),
(158, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'configure'),
(159, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'range'),
(160, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'captcha'),
(161, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'antispam'),
(162, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'maintenance'),
(163, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'trusted_proxies'),
(164, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'registration'),
(165, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'open'),
(166, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'postlogin'),
(167, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'profiles'),
(168, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'authentication'),
(169, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'global_password_reset'),
(170, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'deactivation'),
(171, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'automated_logout'),
(172, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'password_requirements'),
(173, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'session_options'),
(174, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'mail'),
(175, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'method'),
(176, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'test'),
(177, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'importers'),
(178, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'addresses'),
(179, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'logging'),
(180, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'calendar'),
(181, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'settings'),
(182, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'colors'),
(183, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'permissions'),
(184, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'import'),
(185, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'boards'),
(186, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'settings'),
(187, '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'permissions'),
(188, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'summary_templates'),
(189, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'conversations'),
(190, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'settings'),
(191, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'points'),
(192, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'bannedwords'),
(193, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'permissions'),
(194, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'attributes'),
(195, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'types'),
(196, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'sets'),
(197, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'topics'),
(198, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'add'),
(199, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'environment'),
(200, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'info'),
(201, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'errors'),
(202, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'logging'),
(203, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'proxy'),
(204, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'entities'),
(205, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'database_charset'),
(206, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'geolocation'),
(207, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'security'),
(208, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'update'),
(209, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'update'),
(210, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'api'),
(211, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'integrations'),
(212, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'scopes'),
(213, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'settings'),
(214, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'welcome'),
(215, '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'health'),
(216, '2025-06-25 21:11:22', '2025-06-25 21:11:22', 'me'),
(217, '2025-06-25 21:11:28', '2025-06-25 21:11:28', '!themes'),
(218, '2025-06-25 21:11:28', '2025-06-25 21:11:28', '!stacks'),
(219, '2025-06-25 21:11:28', '2025-06-25 21:11:28', 'page_not_found'),
(220, '2025-06-25 21:11:28', '2025-06-25 21:11:28', '!trash'),
(221, '2025-06-25 21:11:28', '2025-06-25 21:11:28', 'login'),
(222, '2025-06-25 21:11:28', '2025-06-25 21:11:28', 'register'),
(223, '2025-06-25 21:11:28', '2025-06-25 21:11:28', 'account'),
(224, '2025-06-25 21:11:28', '2025-06-25 21:11:28', 'edit_profile'),
(225, '2025-06-25 21:11:28', '2025-06-25 21:11:28', 'avatar'),
(226, '2025-06-25 21:11:28', '2025-06-25 21:11:28', 'messages'),
(227, '2025-06-25 21:11:28', '2025-06-25 21:11:28', 'page_forbidden'),
(228, '2025-06-25 21:11:28', '2025-06-25 21:11:28', 'download_file'),
(229, '2025-06-25 21:11:28', '2025-06-25 21:11:28', '!drafts'),
(230, '2025-06-25 21:11:28', '2025-06-25 21:11:28', 'desktop'),
(231, '2025-06-25 21:11:35', '2025-06-25 21:11:35', 'navigation'),
(232, '2025-06-25 21:11:35', '2025-06-25 21:11:35', 'footer-column-1'),
(233, '2025-06-25 21:11:35', '2025-06-25 21:11:35', 'footer-column-2'),
(234, '2025-06-25 21:11:35', '2025-06-25 21:11:35', 'footer-column-3'),
(235, '2025-06-25 21:11:35', '2025-06-25 21:11:35', 'footer-column-4'),
(236, '2025-06-25 21:11:35', '2025-06-25 21:11:35', 'blog-sidebar'),
(237, '2025-06-25 21:11:35', '2025-06-25 21:11:35', 'blog-sidebar'),
(238, '2025-06-25 21:11:36', '2025-06-25 21:11:36', NULL),
(239, '2025-06-25 21:11:36', '2025-06-25 21:11:36', 'about'),
(240, '2025-06-25 21:11:36', '2025-06-25 21:11:36', 'resources'),
(241, '2025-06-25 21:11:36', '2025-06-25 21:11:36', 'documents'),
(242, '2025-06-25 21:11:36', '2025-06-25 21:11:36', 'subscribe-thanks'),
(243, '2025-06-25 21:11:36', '2025-06-25 21:11:36', 'search'),
(244, '2025-06-25 21:11:36', '2025-06-25 21:11:36', 'blog-search'),
(245, '2025-06-25 21:11:37', '2025-06-25 21:11:37', NULL),
(246, '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'privacy-policy'),
(247, '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'services'),
(248, '2025-06-25 21:11:37', '2025-06-25 21:11:37', NULL),
(249, '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'blog'),
(250, '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'faq'),
(251, '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'contact'),
(252, '2025-06-25 21:11:37', '2025-06-25 21:11:37', NULL),
(253, '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'resource-one'),
(254, '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'resource-two'),
(255, '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'resource-three'),
(256, '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'resource-four'),
(257, '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'resource-five'),
(258, '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'resource-six'),
(259, '2025-06-25 21:11:37', '2025-06-25 21:11:37', NULL),
(260, '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'tips-build-beautiful-blog'),
(261, '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'new-product-launch'),
(262, '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'more-fine-posts-here'),
(263, '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'heres-tip-you-might-not-know'),
(264, '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'freshen-up-your-website'),
(265, '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'meet-our-new-hires');

-- --------------------------------------------------------

--
-- Table structure for table `CollectionSearchIndexAttributes`
--

CREATE TABLE `CollectionSearchIndexAttributes` (
  `cID` int(10) UNSIGNED NOT NULL,
  `ak_meta_title` longtext DEFAULT NULL,
  `ak_meta_description` longtext DEFAULT NULL,
  `ak_meta_keywords` longtext DEFAULT NULL,
  `ak_desktop_priority` decimal(14,4) DEFAULT 0.0000,
  `ak_is_desktop` tinyint(1) DEFAULT 0,
  `ak_icon_dashboard` longtext DEFAULT NULL,
  `ak_exclude_nav` tinyint(1) DEFAULT 0,
  `ak_exclude_page_list` tinyint(1) DEFAULT 0,
  `ak_header_extra_content` longtext DEFAULT NULL,
  `ak_tags` longtext DEFAULT NULL,
  `ak_is_featured` tinyint(1) DEFAULT 0,
  `ak_exclude_search_index` tinyint(1) DEFAULT 0,
  `ak_exclude_sitemapxml` tinyint(1) DEFAULT 0,
  `ak_exclude_subpages_from_nav` tinyint(1) DEFAULT 0,
  `ak_thumbnail` int(11) DEFAULT 0,
  `ak_blog_entry_topics` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `CollectionSearchIndexAttributes`
--

INSERT INTO `CollectionSearchIndexAttributes` (`cID`, `ak_meta_title`, `ak_meta_description`, `ak_meta_keywords`, `ak_desktop_priority`, `ak_is_desktop`, `ak_icon_dashboard`, `ak_exclude_nav`, `ak_exclude_page_list`, `ak_header_extra_content`, `ak_tags`, `ak_is_featured`, `ak_exclude_search_index`, `ak_exclude_sitemapxml`, `ak_exclude_subpages_from_nav`, `ak_thumbnail`, `ak_blog_entry_topics`) VALUES
(2, NULL, NULL, NULL, 0.0000, 0, 'fas fa-th-large', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(3, NULL, NULL, 'pages, add page, delete page, copy, move, alias', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(4, NULL, NULL, 'pages, add page, delete page, copy, move, alias', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(5, NULL, NULL, 'pages, add page, delete page, copy, move, alias, bulk', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(6, NULL, NULL, 'find page, search page, search, find, pages, sitemap', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(8, NULL, NULL, 'add file, delete file, copy, move, alias, resize, crop, rename, images, title, attribute', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(9, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(10, NULL, NULL, 'file, file attributes, title, attribute, description, rename', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(11, NULL, NULL, 'files, category, categories', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(12, NULL, NULL, 'new file set', 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(13, NULL, NULL, 'users, groups, people, find, delete user, remove user, change password, password', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(14, NULL, NULL, 'find, search, people, delete user, remove user, change password, password', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(15, NULL, NULL, 'user, group, people, permissions, expire', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(16, NULL, NULL, 'group types, group type', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(17, NULL, NULL, 'user, group, people, messages', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(18, NULL, NULL, 'user attributes, user data, gather data, registration data', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(19, NULL, NULL, 'new user, create', 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(20, NULL, NULL, 'new user group, new group, group, create', 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(23, NULL, NULL, 'group set', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(29, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(30, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(31, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(32, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(33, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(34, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(35, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(36, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(37, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(39, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(40, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(42, NULL, NULL, 'forms, log, error, email, mysql, exception, survey', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(43, NULL, NULL, 'forms, questions, response, data', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(44, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(45, NULL, NULL, 'health, check, site check, optimization', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(46, NULL, NULL, 'page types', 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(47, NULL, NULL, 'questions, quiz, response', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(48, NULL, NULL, 'forms, log, error, email, mysql, exception, survey, history', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(49, NULL, NULL, 'changes, csv, report', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(51, NULL, NULL, 'new theme, theme, active theme, change theme, template, css', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(52, NULL, NULL, 'page types', 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(54, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(55, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(56, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(57, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(58, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(59, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(61, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(63, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(64, NULL, NULL, 'page attributes, custom', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(65, NULL, NULL, 'single, page, custom, application', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(66, NULL, NULL, 'atom, rss, feed, syndication', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(69, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(71, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(74, NULL, NULL, NULL, 0.0000, 0, 'icon-bullhorn', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(76, NULL, NULL, 'stacks, global areas, reusable content, scrapbook, copy, paste, paste block, copy block, site name, logo', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(78, NULL, NULL, 'edit stacks, view stacks, all stacks', 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(79, NULL, NULL, 'block, refresh, custom', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(80, NULL, NULL, 'add-on, addon, add on, package, app, ecommerce, discussions, forums, themes, templates, blocks', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(81, NULL, NULL, 'add-on, addon, ecommerce, install, discussions, forums, themes, templates, blocks', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(82, NULL, NULL, 'update, upgrade', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(83, NULL, NULL, 'buy theme, new theme, marketplace, template', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(84, NULL, NULL, 'buy addon, buy add on, buy add-on, purchase addon, purchase add on, purchase add-on, find addon, new addon, marketplace', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(85, NULL, NULL, 'dashboard, configuration', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(87, NULL, NULL, 'website name, title', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(88, NULL, NULL, 'concretecms.com, my account, purchase, extensions, marketplace', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(89, NULL, NULL, 'production, staging, site copy, development copy, local', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(90, NULL, NULL, 'accessibility, appearance, dark mode, tooltips', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(91, NULL, NULL, NULL, 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(92, NULL, NULL, 'logo, favicon, iphone, icon, bookmark', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(93, NULL, NULL, 'tinymce, content block, fonts, editor, content, overlay', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(94, NULL, NULL, 'translate, translation, internationalization, multilingual', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(95, NULL, NULL, 'languages, update, gettext, translation, translate', 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(96, NULL, NULL, 'timezone, profile, locale', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(97, NULL, NULL, 'site attributes', 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(98, NULL, NULL, 'checkin, check-in, check, force', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(100, NULL, NULL, 'sharing, facebook, twitter', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(101, NULL, NULL, 'sharing, opengraph, schema', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(104, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(105, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(106, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(107, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(108, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(114, NULL, NULL, 'multilingual, localization, internationalization, i18n', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(120, NULL, NULL, 'vanity, pretty url, redirection, hostname, canonical, seo, pageview, view', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(121, NULL, NULL, 'bulk, seo, change keywords, engine, optimization, search', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(122, NULL, NULL, 'traffic, statistics, google analytics, quant, pageviews, hits', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(123, NULL, NULL, 'pretty, slug', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(124, NULL, NULL, 'configure search, site search, search option', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(125, NULL, NULL, 'url, slug', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(127, NULL, NULL, 'security, files, media, extension, manager, upload', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(128, NULL, NULL, 'file, chooser', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(129, NULL, NULL, 'file options, file manager, upload, modify', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(130, NULL, NULL, 'images, picture, responsive, retina', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(131, NULL, NULL, 'thumbnail, format, png, jpg, jpeg, quality, compression, gd, imagick, imagemagick, transparency', 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(132, NULL, NULL, 'uploading, upload, images, image, resizing, manager, exif, rotation, rotate, quality, compression, png, jpg, jpeg', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(133, NULL, NULL, 'image, editor, active, default, edit, png, jpg, jpeg', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(134, NULL, NULL, 'security, alternate storage, hide files', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(135, NULL, NULL, 'external, file, providers', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(136, NULL, NULL, 'files, export, csv, bom, encoding', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(137, NULL, NULL, 'files, upload, parallel, upload_max_filesize, post_max_size, limit, resize, chunk', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(139, NULL, NULL, 'automated jobs, commands, tasks, console, cli', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(140, NULL, NULL, 'processes, queues, jobs, running', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(141, NULL, NULL, 'failed messages, retry', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(142, NULL, NULL, 'cron, scheduling, jobs', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(145, NULL, NULL, 'websocket, socket, socket.io, push, push notifications, mercure', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(146, NULL, NULL, 'waiting for me, inbox, notifications', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(148, NULL, NULL, 'cache option, change cache, override, turn on cache, turn off cache, no cache, page cache, caching', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(149, NULL, NULL, 'cache option, turn off cache, no cache, page cache, caching', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(150, NULL, NULL, 'index search, reindex search, build sitemap, sitemap.xml, clear old versions, page versions, remove old', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(152, NULL, NULL, 'editors, hide site, offline, private, public, access', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(153, NULL, NULL, 'security, actions, administrator, admin, package, marketplace, search', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(157, NULL, NULL, 'security, lock ip, lock out, block ip, address, restrict, access', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(158, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(159, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(160, NULL, NULL, 'security, registration', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(161, NULL, NULL, 'antispam, block spam, security', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(162, NULL, NULL, 'lock site, under construction, hide, hidden', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(163, NULL, NULL, 'trusted, proxy, proxies, ip, header, cloudflare', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(165, NULL, NULL, 'signup, new user, community, public registration, public, registration', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(166, NULL, NULL, 'profile, login, redirect, specific, dashboard, administrators', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(167, NULL, NULL, 'member profile, member page, community, forums, social, avatar', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(168, NULL, NULL, 'auth, authentication, types, oauth, facebook, login, registration', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(169, NULL, NULL, 'global, password, reset, change password, force, sign out', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(171, NULL, NULL, 'login, logout, user, agent, ip, change, security, session, invalidation, invalid', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(172, NULL, NULL, 'password, requirements, code, key, login, registration, security, nist', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(173, NULL, NULL, 'session, options', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(174, NULL, NULL, 'smtp, mail settings', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(175, NULL, NULL, 'email server, mail settings, mail configuration, external, internal', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(176, NULL, NULL, 'test smtp, test mail', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(177, NULL, NULL, 'email server, mail settings, mail configuration, private message, message system, import, email, message', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(178, NULL, NULL, 'mail settings, mail configuration, email, sender', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(179, NULL, NULL, 'email logging, mail logging, log mails, log emails', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(189, NULL, NULL, 'conversations', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(190, NULL, NULL, 'conversations', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(191, NULL, NULL, 'conversations ratings, ratings, community, community points', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(192, NULL, NULL, 'conversations bad words, banned words, banned, bad words, bad, words, list', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(194, NULL, NULL, 'attribute configuration', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(195, NULL, NULL, 'attributes, types', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(196, NULL, NULL, 'attributes, sets', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(197, NULL, NULL, 'topics, tags, taxonomy', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(199, NULL, NULL, NULL, 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(200, NULL, NULL, 'overrides, system info, debug, support, help', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(201, NULL, NULL, 'error, exception, debug', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(202, NULL, NULL, 'email, logging, logs, smtp, pop, errors, mysql, log', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(203, NULL, NULL, 'network, proxy server', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(204, NULL, NULL, 'database, entities, doctrine, orm', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(205, NULL, NULL, 'database, character set, charset, collation, utf8', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(206, NULL, NULL, 'geolocation, ip, address, country, nation, place, locate', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(207, NULL, NULL, 'security, content security policy, csp, strict transport security, hsts, x-frame-options', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(209, NULL, NULL, 'upgrade, new version, update', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(213, NULL, NULL, 'API, programming, public, app', 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(214, NULL, NULL, NULL, 2.0000, 1, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(217, NULL, NULL, NULL, 0.0000, 0, 'fas fa-palette', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(218, NULL, NULL, NULL, 0.0000, 0, 'fas fa-th', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(220, NULL, NULL, NULL, 0.0000, 0, 'fas fa-trash', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(221, NULL, NULL, NULL, 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(223, NULL, NULL, NULL, 0.0000, 0, 'fas fa-briefcase', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(229, NULL, NULL, NULL, 0.0000, 0, 'fas fa-edit', 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(230, NULL, NULL, NULL, 1.0000, 1, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(240, NULL, NULL, NULL, 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 1, 0, NULL),
(242, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 1, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(243, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 1, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(244, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 1, NULL, NULL, 0, 1, 0, 0, 0, NULL),
(246, NULL, NULL, NULL, 0.0000, 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(249, NULL, NULL, NULL, 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 1, 0, NULL),
(253, NULL, NULL, NULL, 0.0000, 0, NULL, 0, 0, NULL, '\nresource\n', 0, 0, 0, 0, 36, NULL),
(254, NULL, NULL, NULL, 0.0000, 0, NULL, 0, 0, NULL, '\nresource\n', 0, 0, 0, 0, 13, NULL),
(255, NULL, NULL, NULL, 0.0000, 0, NULL, 0, 0, NULL, '\nresource\n', 0, 0, 0, 0, 8, NULL),
(256, NULL, NULL, NULL, 0.0000, 0, NULL, 0, 0, NULL, '\nresource\n', 0, 0, 0, 0, 29, NULL),
(257, NULL, NULL, NULL, 0.0000, 0, NULL, 0, 0, NULL, '\nresource\n', 0, 0, 0, 0, 7, NULL),
(258, NULL, NULL, NULL, 0.0000, 0, NULL, 0, 0, NULL, '\nresource\n', 0, 0, 0, 0, 17, NULL),
(260, NULL, NULL, NULL, 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 6, '||/Marketing||'),
(261, NULL, NULL, NULL, 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 32, '||/Products||'),
(262, NULL, NULL, NULL, 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 26, '||/Sales||'),
(263, NULL, NULL, NULL, 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 18, '||/Security||'),
(264, NULL, NULL, NULL, 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 7, '||/Marketing||'),
(265, NULL, NULL, NULL, 0.0000, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, 17, '||/Company News||');

-- --------------------------------------------------------

--
-- Table structure for table `CollectionVersionAreaStyles`
--

CREATE TABLE `CollectionVersionAreaStyles` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cvID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `arHandle` varchar(255) NOT NULL,
  `issID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CollectionVersionBlocks`
--

CREATE TABLE `CollectionVersionBlocks` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cvID` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `bID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `arHandle` varchar(255) NOT NULL,
  `cbRelationID` int(10) UNSIGNED DEFAULT 0,
  `cbDisplayOrder` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `isOriginal` tinyint(1) NOT NULL DEFAULT 0,
  `cbOverrideAreaPermissions` tinyint(1) NOT NULL DEFAULT 0,
  `cbIncludeAll` tinyint(1) NOT NULL DEFAULT 0,
  `cbOverrideBlockTypeCacheSettings` tinyint(1) NOT NULL DEFAULT 0,
  `cbOverrideBlockTypeContainerSettings` tinyint(1) NOT NULL DEFAULT 0,
  `cbEnableBlockContainer` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `CollectionVersionBlocks`
--

INSERT INTO `CollectionVersionBlocks` (`cID`, `cvID`, `bID`, `arHandle`, `cbRelationID`, `cbDisplayOrder`, `isOriginal`, `cbOverrideAreaPermissions`, `cbIncludeAll`, `cbOverrideBlockTypeCacheSettings`, `cbOverrideBlockTypeContainerSettings`, `cbEnableBlockContainer`) VALUES
(1, 1, 44, 'Page Header', 44, 0, 1, 0, 0, 0, 0, 0),
(1, 1, 45, 'Main', 45, 0, 1, 0, 0, 0, 0, 0),
(1, 1, 46, 'Main : 2 : Column 1', 46, 0, 1, 0, 0, 0, 0, 0),
(1, 1, 47, 'Main : 2 : Column 2', 47, 0, 1, 0, 0, 0, 0, 0),
(1, 1, 48, 'Main', 48, 1, 1, 0, 0, 0, 0, 0),
(1, 1, 49, 'Main', 49, 2, 1, 0, 0, 0, 0, 0),
(1, 1, 50, 'Main : 13', 50, 0, 1, 0, 0, 0, 0, 0),
(1, 1, 51, 'Main : 14', 51, 0, 1, 0, 0, 0, 0, 0),
(1, 1, 52, 'Main : 15', 52, 0, 1, 0, 0, 0, 0, 0),
(1, 1, 53, 'Main', 53, 3, 1, 0, 0, 0, 1, 0),
(1, 1, 54, 'Main', 54, 4, 1, 0, 0, 0, 1, 1),
(1, 1, 55, 'Main', 55, 5, 1, 0, 0, 0, 0, 0),
(1, 1, 56, 'Main : 3 : Column 1', 56, 0, 1, 0, 0, 0, 0, 0),
(1, 1, 57, 'Main : 3 : Column 2', 57, 0, 1, 0, 0, 0, 0, 0),
(1, 1, 58, 'Main', 58, 6, 1, 0, 0, 0, 0, 0),
(1, 1, 59, 'Main', 59, 7, 1, 0, 0, 0, 0, 0),
(1, 1, 60, 'Main : 4 : Title', 60, 0, 1, 0, 0, 0, 0, 0),
(1, 1, 61, 'Main : 4 : Body', 61, 0, 1, 0, 0, 0, 1, 0),
(1, 1, 62, 'Main', 62, 8, 1, 0, 0, 0, 0, 0),
(1, 1, 63, 'Main', 63, 9, 1, 0, 0, 0, 1, 0),
(214, 1, 1, 'Main', 1, 0, 1, 0, 0, 0, 0, 0),
(214, 1, 2, 'Main', 2, 1, 1, 0, 0, 0, 0, 0),
(214, 1, 3, 'Main : 1', 3, 0, 1, 0, 0, 0, 0, 0),
(214, 1, 4, 'Main : 2', 4, 0, 1, 0, 0, 0, 0, 0),
(214, 1, 5, 'Main : 3', 5, 0, 1, 0, 0, 0, 0, 0),
(214, 1, 6, 'Main', 6, 2, 1, 0, 0, 0, 0, 0),
(214, 1, 7, 'Main : 4', 7, 0, 1, 0, 0, 1, 0, 0),
(214, 1, 8, 'Main : 5', 8, 0, 1, 0, 0, 1, 0, 0),
(214, 1, 9, 'Main', 9, 3, 1, 0, 0, 0, 0, 0),
(214, 1, 10, 'Main : 6', 10, 0, 1, 0, 0, 1, 0, 0),
(214, 1, 11, 'Main : 7', 11, 0, 1, 0, 0, 1, 0, 0),
(214, 1, 12, 'Main : 8', 12, 0, 1, 0, 0, 1, 0, 0),
(216, 1, 13, 'Main', 13, 0, 1, 0, 0, 0, 0, 0),
(216, 1, 14, 'Main : 9', 14, 0, 1, 0, 0, 0, 0, 0),
(216, 1, 15, 'Main', 15, 1, 1, 0, 0, 0, 0, 0),
(216, 1, 16, 'Main : 10', 16, 0, 1, 0, 0, 0, 0, 0),
(230, 1, 17, 'Main', 17, 0, 1, 0, 0, 0, 0, 0),
(230, 1, 18, 'Main : 11', 18, 0, 1, 0, 0, 0, 0, 0),
(230, 1, 19, 'Main', 19, 1, 1, 0, 0, 0, 0, 0),
(230, 1, 20, 'Main : 12', 20, 0, 1, 0, 0, 0, 0, 0),
(231, 1, 35, 'Main', 35, 0, 1, 0, 0, 0, 0, 0),
(232, 1, 36, 'Main', 36, 0, 1, 0, 0, 0, 0, 0),
(232, 1, 37, 'Main', 37, 1, 1, 0, 0, 0, 0, 0),
(233, 1, 38, 'Main', 38, 0, 1, 0, 0, 0, 0, 0),
(234, 1, 39, 'Main', 39, 0, 1, 0, 0, 0, 0, 0),
(235, 1, 40, 'Main', 40, 0, 1, 0, 0, 0, 0, 0),
(235, 1, 41, 'Main', 41, 1, 1, 0, 0, 0, 0, 0),
(237, 1, 42, 'Main', 42, 0, 1, 0, 0, 0, 0, 0),
(237, 1, 43, 'Main', 43, 1, 1, 0, 0, 0, 0, 0),
(238, 1, 21, 'Main', 21, 0, 1, 0, 0, 0, 0, 0),
(239, 1, 64, 'Main', 64, 0, 1, 0, 0, 0, 0, 0),
(239, 1, 65, 'Main', 65, 1, 1, 0, 0, 0, 0, 0),
(239, 1, 66, 'Main : 5 : Column 1', 66, 0, 1, 0, 0, 0, 0, 0),
(239, 1, 67, 'Main : 5 : Column 2', 67, 0, 1, 0, 0, 0, 0, 0),
(239, 1, 68, 'Main', 68, 2, 1, 0, 0, 0, 0, 0),
(239, 1, 69, 'Main', 69, 3, 1, 0, 0, 0, 0, 0),
(239, 1, 70, 'Main : 6 : Item 1', 70, 0, 1, 0, 0, 0, 0, 0),
(239, 1, 71, 'Main : 6 : Item 2', 71, 0, 1, 0, 0, 0, 0, 0),
(239, 1, 72, 'Main : 6 : Item 3', 72, 0, 1, 0, 0, 0, 0, 0),
(239, 1, 73, 'Main : 6 : Item 4', 73, 0, 1, 0, 0, 0, 0, 0),
(239, 1, 74, 'Main : 6 : Item 5', 74, 0, 1, 0, 0, 0, 0, 0),
(239, 1, 75, 'Main : 6 : Item 6', 75, 0, 1, 0, 0, 0, 0, 0),
(239, 1, 76, 'Main', 76, 4, 1, 0, 0, 0, 0, 0),
(239, 1, 77, 'Main : 7 : Column 1', 77, 0, 1, 0, 0, 0, 0, 0),
(239, 1, 78, 'Main : 7 : Column 2', 78, 0, 1, 0, 0, 0, 0, 0),
(239, 1, 79, 'Main', 79, 5, 1, 0, 0, 0, 0, 0),
(239, 1, 80, 'Main : 8 : Column 1', 80, 0, 1, 0, 0, 0, 0, 0),
(239, 1, 81, 'Main : 8 : Column 1', 81, 1, 1, 0, 0, 0, 0, 0),
(239, 1, 82, 'Main : 8 : Column 2', 82, 0, 1, 0, 0, 0, 0, 0),
(239, 1, 83, 'Main : 8 : Column 2', 83, 1, 1, 0, 0, 0, 0, 0),
(239, 1, 84, 'Main', 84, 6, 1, 0, 0, 0, 0, 0),
(239, 1, 85, 'Main', 85, 7, 1, 0, 0, 0, 0, 0),
(239, 1, 86, 'Main : 9 : Item 1', 86, 0, 1, 0, 0, 0, 0, 0),
(239, 1, 87, 'Main : 9 : Item 2', 87, 0, 1, 0, 0, 0, 0, 0),
(239, 1, 88, 'Main : 9 : Item 3', 88, 0, 1, 0, 0, 0, 0, 0),
(239, 1, 89, 'Main : 9 : Item 4', 89, 0, 1, 0, 0, 0, 0, 0),
(239, 1, 90, 'Main : 9 : Item 5', 90, 0, 1, 0, 0, 0, 0, 0),
(239, 1, 91, 'Main : 9 : Item 6', 91, 0, 1, 0, 0, 0, 0, 0),
(240, 1, 124, 'Main', 124, 0, 1, 0, 0, 0, 1, 0),
(240, 1, 125, 'Page Header', 125, 0, 1, 0, 0, 0, 0, 0),
(241, 1, 132, 'Page Header', 132, 0, 1, 0, 0, 0, 0, 0),
(241, 1, 133, 'Main', 133, 0, 1, 0, 0, 0, 0, 0),
(242, 1, 134, 'Main', 134, 0, 1, 0, 0, 0, 0, 0),
(243, 1, 135, 'Page Header', 135, 0, 1, 0, 0, 0, 0, 0),
(243, 1, 136, 'Main', 136, 0, 1, 0, 0, 0, 0, 0),
(244, 1, 137, 'Main', 137, 0, 1, 0, 0, 0, 1, 0),
(244, 1, 138, 'Page Header', 138, 0, 1, 0, 0, 0, 0, 0),
(246, 1, 146, 'Page Header', 146, 0, 1, 0, 0, 0, 0, 0),
(246, 1, 147, 'Main', 147, 0, 1, 0, 0, 0, 0, 0),
(246, 1, 148, 'Sidebar', 148, 0, 1, 0, 0, 0, 0, 0),
(247, 1, 92, 'Page Header', 92, 0, 1, 0, 0, 0, 0, 0),
(247, 1, 93, 'Main', 93, 0, 1, 0, 0, 0, 0, 0),
(247, 1, 94, 'Main : 10 : Title', 94, 0, 1, 0, 0, 0, 0, 0),
(247, 1, 95, 'Main : 10 : Body', 95, 0, 1, 0, 0, 0, 0, 0),
(247, 1, 96, 'Main : 10 : Body : 11 : Item 1', 96, 0, 1, 0, 0, 0, 0, 0),
(247, 1, 97, 'Main : 10 : Body : 11 : Item 2', 97, 0, 1, 0, 0, 0, 0, 0),
(247, 1, 98, 'Main : 10 : Body : 11 : Item 3', 98, 0, 1, 0, 0, 0, 0, 0),
(247, 1, 99, 'Main : 10 : Body : 11 : Item 4', 99, 0, 1, 0, 0, 0, 0, 0),
(247, 1, 100, 'Main', 100, 1, 1, 0, 0, 0, 0, 0),
(247, 1, 101, 'Main : 16', 101, 0, 1, 0, 0, 0, 0, 0),
(247, 1, 102, 'Main : 17', 102, 0, 1, 0, 0, 0, 0, 0),
(247, 1, 103, 'Main', 103, 2, 1, 0, 0, 0, 0, 0),
(247, 1, 104, 'Main', 104, 3, 1, 0, 0, 0, 0, 0),
(247, 1, 105, 'Main : 12 : Item 1', 105, 0, 1, 0, 0, 0, 0, 0),
(247, 1, 106, 'Main : 12 : Item 2', 106, 0, 1, 0, 0, 0, 0, 0),
(247, 1, 107, 'Main : 12 : Item 3', 107, 0, 1, 0, 0, 0, 0, 0),
(247, 1, 108, 'Main : 12 : Item 4', 108, 0, 1, 0, 0, 0, 0, 0),
(247, 1, 109, 'Main : 12 : Item 5', 109, 0, 1, 0, 0, 0, 0, 0),
(247, 1, 110, 'Main : 12 : Item 6', 110, 0, 1, 0, 0, 0, 0, 0),
(249, 1, 111, 'Main', 111, 0, 1, 0, 0, 0, 0, 0),
(249, 1, 112, 'Page Header', 112, 0, 1, 0, 0, 0, 0, 0),
(249, 1, 113, 'Page Footer', 113, 0, 1, 0, 0, 0, 0, 0),
(249, 1, 114, 'Page Footer : 13 : Title', 114, 0, 1, 0, 0, 0, 0, 0),
(249, 1, 115, 'Page Footer : 13 : Body', 115, 0, 1, 0, 0, 0, 1, 0),
(250, 1, 116, 'Main', 116, 0, 1, 0, 0, 0, 0, 0),
(250, 1, 117, 'Main', 117, 1, 1, 0, 0, 0, 0, 0),
(251, 1, 118, 'Page Header', 118, 0, 1, 0, 0, 0, 0, 0),
(251, 1, 119, 'Main', 119, 0, 1, 0, 0, 0, 0, 0),
(251, 1, 120, 'Main : 18', 120, 0, 1, 0, 0, 0, 0, 0),
(251, 1, 121, 'Main : 19', 121, 0, 1, 0, 0, 0, 0, 0),
(251, 1, 122, 'Main', 122, 1, 1, 0, 0, 0, 0, 0),
(251, 1, 123, 'Main', 123, 2, 1, 0, 0, 0, 0, 0),
(252, 1, 31, 'Page Header', 31, 0, 1, 0, 0, 0, 0, 0),
(252, 1, 32, 'Resource Thumbnail', 32, 0, 1, 0, 0, 0, 0, 0),
(252, 1, 33, 'Resource Title', 33, 0, 1, 0, 0, 0, 0, 0),
(252, 1, 34, 'Resource Content', 34, 0, 1, 0, 0, 0, 0, 0),
(253, 1, 31, 'Page Header', 31, 0, 0, 0, 0, 0, 0, 0),
(253, 1, 32, 'Resource Thumbnail', 32, 0, 0, 0, 0, 0, 0, 0),
(253, 1, 33, 'Resource Title', 33, 0, 0, 0, 0, 0, 0, 0),
(253, 1, 139, 'Resource Content', 139, 0, 1, 0, 0, 0, 0, 0),
(253, 1, 140, 'Resource Data', 140, 0, 1, 0, 0, 0, 0, 0),
(254, 1, 31, 'Page Header', 31, 0, 0, 0, 0, 0, 0, 0),
(254, 1, 32, 'Resource Thumbnail', 32, 0, 0, 0, 0, 0, 0, 0),
(254, 1, 33, 'Resource Title', 33, 0, 0, 0, 0, 0, 0, 0),
(254, 1, 141, 'Resource Content', 141, 0, 1, 0, 0, 0, 0, 0),
(255, 1, 31, 'Page Header', 31, 0, 0, 0, 0, 0, 0, 0),
(255, 1, 32, 'Resource Thumbnail', 32, 0, 0, 0, 0, 0, 0, 0),
(255, 1, 33, 'Resource Title', 33, 0, 0, 0, 0, 0, 0, 0),
(255, 1, 142, 'Resource Content', 142, 0, 1, 0, 0, 0, 0, 0),
(256, 1, 31, 'Page Header', 31, 0, 0, 0, 0, 0, 0, 0),
(256, 1, 32, 'Resource Thumbnail', 32, 0, 0, 0, 0, 0, 0, 0),
(256, 1, 33, 'Resource Title', 33, 0, 0, 0, 0, 0, 0, 0),
(256, 1, 143, 'Resource Content', 143, 0, 1, 0, 0, 0, 0, 0),
(257, 1, 31, 'Page Header', 31, 0, 0, 0, 0, 0, 0, 0),
(257, 1, 32, 'Resource Thumbnail', 32, 0, 0, 0, 0, 0, 0, 0),
(257, 1, 33, 'Resource Title', 33, 0, 0, 0, 0, 0, 0, 0),
(257, 1, 144, 'Resource Content', 144, 0, 1, 0, 0, 0, 0, 0),
(258, 1, 31, 'Page Header', 31, 0, 0, 0, 0, 0, 0, 0),
(258, 1, 32, 'Resource Thumbnail', 32, 0, 0, 0, 0, 0, 0, 0),
(258, 1, 33, 'Resource Title', 33, 0, 0, 0, 0, 0, 0, 0),
(258, 1, 145, 'Resource Content', 145, 0, 1, 0, 0, 0, 0, 0),
(259, 1, 22, 'Page Header', 22, 0, 1, 0, 0, 0, 0, 0),
(259, 1, 23, 'Page Header', 23, 1, 1, 0, 0, 0, 0, 0),
(259, 1, 24, 'Main', 24, 0, 1, 0, 0, 0, 0, 0),
(259, 1, 25, 'Sidebar', 25, 0, 1, 0, 0, 0, 0, 0),
(259, 1, 26, 'Sidebar', 26, 1, 1, 0, 0, 0, 0, 0),
(259, 1, 27, 'Sidebar', 27, 2, 1, 0, 0, 0, 0, 0),
(259, 1, 28, 'Page Footer', 28, 0, 1, 0, 0, 0, 0, 0),
(259, 1, 29, 'Page Footer : 1 : Title', 29, 0, 1, 0, 0, 0, 0, 0),
(259, 1, 30, 'Page Footer : 1 : Body', 30, 0, 1, 0, 0, 0, 1, 0),
(260, 1, 22, 'Page Header', 22, 0, 0, 0, 0, 0, 0, 0),
(260, 1, 23, 'Page Header', 23, 1, 0, 0, 0, 0, 0, 0),
(260, 1, 25, 'Sidebar', 25, 0, 0, 0, 0, 0, 0, 0),
(260, 1, 26, 'Sidebar', 26, 1, 0, 0, 0, 0, 0, 0),
(260, 1, 27, 'Sidebar', 27, 2, 0, 0, 0, 0, 0, 0),
(260, 1, 28, 'Page Footer', 28, 0, 0, 0, 0, 0, 0, 0),
(260, 1, 29, 'Page Footer : 1 : Title', 29, 0, 0, 0, 0, 0, 0, 0),
(260, 1, 30, 'Page Footer : 1 : Body', 30, 0, 0, 0, 0, 0, 1, 0),
(260, 1, 126, 'Main', 126, 0, 1, 0, 0, 0, 0, 0),
(261, 1, 22, 'Page Header', 22, 0, 0, 0, 0, 0, 0, 0),
(261, 1, 23, 'Page Header', 23, 1, 0, 0, 0, 0, 0, 0),
(261, 1, 25, 'Sidebar', 25, 0, 0, 0, 0, 0, 0, 0),
(261, 1, 26, 'Sidebar', 26, 1, 0, 0, 0, 0, 0, 0),
(261, 1, 27, 'Sidebar', 27, 2, 0, 0, 0, 0, 0, 0),
(261, 1, 28, 'Page Footer', 28, 0, 0, 0, 0, 0, 0, 0),
(261, 1, 29, 'Page Footer : 1 : Title', 29, 0, 0, 0, 0, 0, 0, 0),
(261, 1, 30, 'Page Footer : 1 : Body', 30, 0, 0, 0, 0, 0, 1, 0),
(261, 1, 127, 'Main', 127, 0, 1, 0, 0, 0, 0, 0),
(262, 1, 22, 'Page Header', 22, 0, 0, 0, 0, 0, 0, 0),
(262, 1, 23, 'Page Header', 23, 1, 0, 0, 0, 0, 0, 0),
(262, 1, 25, 'Sidebar', 25, 0, 0, 0, 0, 0, 0, 0),
(262, 1, 26, 'Sidebar', 26, 1, 0, 0, 0, 0, 0, 0),
(262, 1, 27, 'Sidebar', 27, 2, 0, 0, 0, 0, 0, 0),
(262, 1, 28, 'Page Footer', 28, 0, 0, 0, 0, 0, 0, 0),
(262, 1, 29, 'Page Footer : 1 : Title', 29, 0, 0, 0, 0, 0, 0, 0),
(262, 1, 30, 'Page Footer : 1 : Body', 30, 0, 0, 0, 0, 0, 1, 0),
(262, 1, 128, 'Main', 128, 0, 1, 0, 0, 0, 0, 0),
(263, 1, 22, 'Page Header', 22, 0, 0, 0, 0, 0, 0, 0),
(263, 1, 23, 'Page Header', 23, 1, 0, 0, 0, 0, 0, 0),
(263, 1, 25, 'Sidebar', 25, 0, 0, 0, 0, 0, 0, 0),
(263, 1, 26, 'Sidebar', 26, 1, 0, 0, 0, 0, 0, 0),
(263, 1, 27, 'Sidebar', 27, 2, 0, 0, 0, 0, 0, 0),
(263, 1, 28, 'Page Footer', 28, 0, 0, 0, 0, 0, 0, 0),
(263, 1, 29, 'Page Footer : 1 : Title', 29, 0, 0, 0, 0, 0, 0, 0),
(263, 1, 30, 'Page Footer : 1 : Body', 30, 0, 0, 0, 0, 0, 1, 0),
(263, 1, 129, 'Main', 129, 0, 1, 0, 0, 0, 0, 0),
(264, 1, 22, 'Page Header', 22, 0, 0, 0, 0, 0, 0, 0),
(264, 1, 23, 'Page Header', 23, 1, 0, 0, 0, 0, 0, 0),
(264, 1, 25, 'Sidebar', 25, 0, 0, 0, 0, 0, 0, 0),
(264, 1, 26, 'Sidebar', 26, 1, 0, 0, 0, 0, 0, 0),
(264, 1, 27, 'Sidebar', 27, 2, 0, 0, 0, 0, 0, 0),
(264, 1, 28, 'Page Footer', 28, 0, 0, 0, 0, 0, 0, 0),
(264, 1, 29, 'Page Footer : 1 : Title', 29, 0, 0, 0, 0, 0, 0, 0),
(264, 1, 30, 'Page Footer : 1 : Body', 30, 0, 0, 0, 0, 0, 1, 0),
(264, 1, 130, 'Main', 130, 0, 1, 0, 0, 0, 0, 0),
(265, 1, 22, 'Page Header', 22, 0, 0, 0, 0, 0, 0, 0),
(265, 1, 23, 'Page Header', 23, 1, 0, 0, 0, 0, 0, 0),
(265, 1, 25, 'Sidebar', 25, 0, 0, 0, 0, 0, 0, 0),
(265, 1, 26, 'Sidebar', 26, 1, 0, 0, 0, 0, 0, 0),
(265, 1, 27, 'Sidebar', 27, 2, 0, 0, 0, 0, 0, 0),
(265, 1, 28, 'Page Footer', 28, 0, 0, 0, 0, 0, 0, 0),
(265, 1, 29, 'Page Footer : 1 : Title', 29, 0, 0, 0, 0, 0, 0, 0),
(265, 1, 30, 'Page Footer : 1 : Body', 30, 0, 0, 0, 0, 0, 1, 0),
(265, 1, 131, 'Main', 131, 0, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `CollectionVersionBlocksCacheSettings`
--

CREATE TABLE `CollectionVersionBlocksCacheSettings` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cvID` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `bID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `arHandle` varchar(255) NOT NULL,
  `btCacheBlockOutput` tinyint(1) NOT NULL DEFAULT 0,
  `btCacheBlockOutputOnPost` tinyint(1) NOT NULL DEFAULT 0,
  `btCacheBlockOutputForRegisteredUsers` tinyint(1) NOT NULL DEFAULT 0,
  `btCacheBlockOutputLifetime` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `CollectionVersionBlocksCacheSettings`
--

INSERT INTO `CollectionVersionBlocksCacheSettings` (`cID`, `cvID`, `bID`, `arHandle`, `btCacheBlockOutput`, `btCacheBlockOutputOnPost`, `btCacheBlockOutputForRegisteredUsers`, `btCacheBlockOutputLifetime`) VALUES
(214, 1, 7, 'Main : 4', 1, 1, 1, 0),
(214, 1, 8, 'Main : 5', 1, 1, 1, 0),
(214, 1, 10, 'Main : 6', 1, 1, 1, 0),
(214, 1, 11, 'Main : 7', 1, 1, 1, 0),
(214, 1, 12, 'Main : 8', 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `CollectionVersionBlocksOutputCache`
--

CREATE TABLE `CollectionVersionBlocksOutputCache` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cvID` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `bID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `arHandle` varchar(255) NOT NULL,
  `btCachedBlockOutput` longtext DEFAULT NULL,
  `btCachedBlockOutputExpires` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CollectionVersionBlockStyles`
--

CREATE TABLE `CollectionVersionBlockStyles` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cvID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `bID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `arHandle` varchar(255) NOT NULL,
  `issID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `CollectionVersionBlockStyles`
--

INSERT INTO `CollectionVersionBlockStyles` (`cID`, `cvID`, `bID`, `arHandle`, `issID`) VALUES
(214, 1, 8, 'Main : 5', 1);

-- --------------------------------------------------------

--
-- Table structure for table `CollectionVersionRelatedEdits`
--

CREATE TABLE `CollectionVersionRelatedEdits` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cvID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cRelationID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cvRelationID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CollectionVersions`
--

CREATE TABLE `CollectionVersions` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cvID` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `cvName` text DEFAULT NULL,
  `cvHandle` varchar(255) DEFAULT NULL,
  `cvDescription` text DEFAULT NULL,
  `cvDatePublic` datetime DEFAULT NULL,
  `cvDateCreated` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `cvComments` varchar(255) DEFAULT NULL,
  `cvIsApproved` tinyint(1) NOT NULL DEFAULT 0,
  `cvIsNew` tinyint(1) NOT NULL DEFAULT 0,
  `cvAuthorUID` int(10) UNSIGNED DEFAULT NULL,
  `cvApproverUID` int(10) UNSIGNED DEFAULT NULL,
  `pThemeID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pTemplateID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pThemeSkinIdentifier` varchar(255) DEFAULT NULL,
  `cvActivateDatetime` datetime DEFAULT NULL,
  `cvPublishDate` datetime DEFAULT NULL,
  `cvPublishEndDate` datetime DEFAULT NULL,
  `cvDateApproved` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `CollectionVersions`
--

INSERT INTO `CollectionVersions` (`cID`, `cvID`, `cvName`, `cvHandle`, `cvDescription`, `cvDatePublic`, `cvDateCreated`, `cvComments`, `cvIsApproved`, `cvIsNew`, `cvAuthorUID`, `cvApproverUID`, `pThemeID`, `pTemplateID`, `pThemeSkinIdentifier`, `cvActivateDatetime`, `cvPublishDate`, `cvPublishEndDate`, `cvDateApproved`) VALUES
(1, 1, 'Home', NULL, '', '2025-06-25 21:11:00', '2025-06-25 21:11:00', 'Initial Version', 1, 0, 1, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(2, 1, 'Dashboard', 'dashboard', '', '2025-06-25 21:11:14', '2025-06-25 21:11:14', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(3, 1, 'Sitemap', 'sitemap', 'Whole world at a glance.', '2025-06-25 21:11:14', '2025-06-25 21:11:14', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(4, 1, 'Full Sitemap', 'full', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(5, 1, 'Flat View', 'explore', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(6, 1, 'Page Search', 'search', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(7, 1, 'Files', 'files', 'All documents and images.', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(8, 1, 'File Manager', 'search', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(9, 1, 'File Details', 'details', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(10, 1, 'Attributes', 'attributes', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(11, 1, 'File Sets', 'sets', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(12, 1, 'Add File Set', 'add_set', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(13, 1, 'Members', 'users', 'Add and manage the user accounts and groups on your website.', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(14, 1, 'Search Users', 'search', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(15, 1, 'User Groups', 'groups', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(16, 1, 'Group Types', 'group_types', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(17, 1, 'Send Message to Group', 'message', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(18, 1, 'Attributes', 'attributes', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(19, 1, 'Add User', 'add', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(20, 1, 'Add Group', 'add_group', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(21, 1, 'Move Multiple Groups', 'bulkupdate', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(22, 1, 'Bulk User Assignment', 'bulk_user_assignment', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(23, 1, 'Group Sets', 'group_sets', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(24, 1, 'Express', 'express', 'Express Data Objects', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(25, 1, 'View Entries', 'entries', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(26, 1, 'Boards', 'boards', 'Express Data Objects', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(27, 1, 'View Boards', 'boards', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(28, 1, 'Add Board', 'add', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(29, 1, 'Board Details', 'details', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(30, 1, 'Edit Board', 'edit', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(31, 1, 'Data Sources', 'data_sources', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(32, 1, 'Board Appearance', 'appearance', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(33, 1, 'Weighting', 'weighting', '', '2025-06-25 21:11:15', '2025-06-25 21:11:15', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(34, 1, 'Board Permissions', 'permissions', '', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(35, 1, 'Instances', 'instances', 'View instances of your board.', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(36, 1, 'Instance Details', 'details', 'View details of your board instance.', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(37, 1, 'Rules', 'rules', 'View override rules for your instance.', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(38, 1, 'Designer', 'designer', '', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(39, 1, 'Choose Items', 'choose_items', '', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(40, 1, 'Customize Slot', 'customize_slot', '', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(41, 1, 'Scheduler', 'scheduler', '', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(42, 1, 'Reports', 'reports', 'Get data from forms and logs.', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(43, 1, 'Form Results', 'forms', 'Get submission data.', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(44, 1, 'Form Results', 'legacy', 'Get submission data.', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(45, 1, 'Site Health', 'health', '', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(46, 1, 'Report Details', 'details', '', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(47, 1, 'Surveys', 'surveys', '', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(48, 1, 'Logs', 'logs', '', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(49, 1, 'Page Changes', 'page_changes', '', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(50, 1, 'Pages & Themes', 'pages', 'Reskin your site.', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(51, 1, 'Themes', 'themes', 'Reskin your site.', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(52, 1, 'Inspect', 'inspect', '', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(53, 1, 'Page Types', 'types', '', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(54, 1, 'Organize Page Type Order', 'organize', '', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(55, 1, 'Add Page Type', 'add', '', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(56, 1, 'Compose Form', 'form', '', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(57, 1, 'Defaults and Output', 'output', '', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(58, 1, 'Page Type Attributes', 'attributes', '', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(59, 1, 'Page Type Permissions', 'permissions', '', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(60, 1, 'Page Templates', 'templates', 'Form factors for pages in your site.', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(61, 1, 'Add Page Template', 'add', 'Add page templates to your site.', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(62, 1, 'Containers', 'containers', 'Container Templates for Areas.', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(63, 1, 'Add Container', 'add', 'Add page containers.', '2025-06-25 21:11:16', '2025-06-25 21:11:16', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(64, 1, 'Attributes', 'attributes', '', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(65, 1, 'Single Pages', 'single', '', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(66, 1, 'RSS Feeds', 'feeds', '', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(67, 1, 'Calendar & Events', 'calendar', '', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(68, 1, 'View Calendar', 'events', '', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(69, 1, 'Event List', 'event_list', '', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(70, 1, 'Add Calendar', 'add', '', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(71, 1, 'Calendar Permissions', 'permissions', '', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(72, 1, 'Attributes', 'attributes', '', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(73, 1, 'Conversations', 'conversations', '', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(74, 1, 'Messages', 'messages', '', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(75, 1, 'Stacks & Blocks', 'blocks', 'Manage sitewide content and administer block types.', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(76, 1, 'Stacks & Global Areas', 'stacks', 'Share content across your site.', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(77, 1, 'Block & Stack Permissions', 'permissions', 'Control who can add blocks and stacks on your site.', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(78, 1, 'Stack List', 'list', '', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(79, 1, 'Block Types', 'types', 'Manage the installed block types in your site.', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(80, 1, 'Extend Concrete', 'extend', '', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(81, 1, 'Add Functionality', 'install', 'Install add-ons & themes.', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(82, 1, 'Update Add-Ons', 'update', 'Update your installed packages.', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(83, 1, 'Get More Themes', 'themes', 'Download themes from the marketplace.', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(84, 1, 'Get More Add-Ons', 'addons', 'Download add-ons from the marketplace.', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(85, 1, 'System & Settings', 'system', 'Secure and setup your site.', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(86, 1, 'Basics', 'basics', 'Basic information about your website.', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(87, 1, 'Name & Attributes', 'name', '', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(88, 1, 'Marketplace', 'marketplace', 'Connect to the Concrete CMS marketplace.', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(89, 1, 'Production Mode', 'production_mode', '', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(90, 1, 'Appearance', 'appearance', '', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(91, 1, 'Site Information', 'site_information', '', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(92, 1, 'Bookmark Icons', 'icons', 'Bookmark icon and mobile home screen icon setup.', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(93, 1, 'Rich Text Editor', 'editor', '', '2025-06-25 21:11:17', '2025-06-25 21:11:17', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(94, 1, 'Languages', 'multilingual', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(95, 1, 'Update Languages', 'update', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(96, 1, 'Time Zone', 'timezone', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(97, 1, 'Custom Attributes', 'attributes', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(98, 1, 'Reset Clipboard and Edit Mode', 'reset_edit_mode', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(99, 1, 'Social & Sharing', 'social', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(100, 1, 'Social Links', 'social_links', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(101, 1, 'Open Graph', 'opengraph', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(102, 1, 'Express', 'express', 'Express', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(103, 1, 'Data Objects', 'entities', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(104, 1, 'Attributes', 'attributes', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(105, 1, 'Associations', 'associations', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(106, 1, 'Forms', 'forms', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(107, 1, 'Customize Search', 'customize_search', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(108, 1, 'Update Entry Display Order', 'order_entries', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(109, 1, 'Custom Entry Locations', 'entries', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(110, 1, 'Multiple Site Hosting', 'multisite', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(111, 1, 'Sites & Domains', 'sites', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(112, 1, 'Site Types', 'types', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(113, 1, 'Multisite Settings', 'settings', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(114, 1, 'Multilingual', 'multilingual', 'Run your site in multiple languages.', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(115, 1, 'Multilingual Setup', 'setup', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(116, 1, 'Copy Languages', 'copy', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(117, 1, 'Page Report', 'page_report', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(118, 1, 'Translate Site Interface', 'translate_interface', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(119, 1, 'SEO & Statistics', 'seo', 'Enable pretty URLs and tracking codes.', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(120, 1, 'URLs and Redirection', 'urls', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(121, 1, 'Bulk SEO Updater', 'bulk', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(122, 1, 'Tracking Codes', 'codes', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(123, 1, 'Excluded URL Word List', 'excluded', '', '2025-06-25 21:11:18', '2025-06-25 21:11:18', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(124, 1, 'Search Index', 'searchindex', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(125, 1, 'URL Slug', 'url_slug', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(126, 1, 'Files', 'files', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(127, 1, 'Allowed File Types', 'filetypes', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(128, 1, 'File Chooser Options', 'file_chooser', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(129, 1, 'File Manager Permissions', 'permissions', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(130, 1, 'Thumbnails', 'thumbnails', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(131, 1, 'Thumbnail Options', 'options', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(132, 1, 'Image Options', 'image_uploading', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(133, 1, 'Image Editor', 'image_editor', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(134, 1, 'File Storage Locations', 'storage', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(135, 1, 'External File Providers', 'external_file_provider', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(136, 1, 'Export Options', 'export_options', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(137, 1, 'Upload Settings', 'uploads', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(138, 1, 'Automation', 'automation', 'Run and automate commands.', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(139, 1, 'Tasks', 'tasks', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(140, 1, 'Activity', 'activity', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(141, 1, 'Failed Messages', 'failed', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(142, 1, 'Schedule', 'schedule', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(143, 1, 'Automation Settings', 'settings', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(144, 1, 'Notification', 'notification', 'Notification settings.', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(145, 1, 'Server-Sent Events', 'events', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(146, 1, 'Waiting for Me', 'alerts', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(147, 1, 'Optimization', 'optimization', 'Keep your site running well.', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(148, 1, 'Cache & Speed Settings', 'cache', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(149, 1, 'Clear Cache', 'clearcache', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(150, 1, 'Automated Jobs', 'jobs', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(151, 1, 'Permissions & Access', 'permissions', 'Control who sees and edits your site.', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(152, 1, 'Site Access', 'site', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(153, 1, 'Task Permissions', 'tasks', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(154, 1, 'User Permissions', 'users', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(155, 1, 'Advanced Permissions', 'advanced', '', '2025-06-25 21:11:19', '2025-06-25 21:11:19', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(156, 1, 'Workflows', 'workflows', '', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(157, 1, 'IP Deny List', 'denylist', '', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(158, 1, 'Configure IP Blocking', 'configure', '', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(159, 1, 'IP Range', 'range', '', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(160, 1, 'Captcha Setup', 'captcha', '', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(161, 1, 'Spam Control', 'antispam', '', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(162, 1, 'Maintenance Mode', 'maintenance', '', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(163, 1, 'Trusted Proxies', 'trusted_proxies', '', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(164, 1, 'Login & Registration', 'registration', 'Change login behaviors and setup public profiles.', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(165, 1, 'Account Options', 'open', '', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(166, 1, 'Login Destination', 'postlogin', '', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(167, 1, 'Public Profiles', 'profiles', '', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(168, 1, 'Authentication Types', 'authentication', '', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(169, 1, 'Global Password Reset', 'global_password_reset', 'Signs out all users, resets all passwords and forces users to choose a new one', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(170, 1, 'User Deactivation Settings', 'deactivation', '', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(171, 1, 'Automated Logout', 'automated_logout', 'Automate when users are logged out, or do it manually', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(172, 1, 'Password Requirements', 'password_requirements', 'Set password rule and regulations.', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(173, 1, 'Session Options', 'session_options', '', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(174, 1, 'Email', 'mail', 'Control how your site send and processes mail.', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(175, 1, 'SMTP Method', 'method', '', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(176, 1, 'Test Mail Settings', 'test', '', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(177, 1, 'Email Importers', 'importers', '', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(178, 1, 'System Email Addresses', 'addresses', '', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(179, 1, 'Email Logging', 'logging', 'Control how emails get logged.', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(180, 1, 'Calendar', 'calendar', 'Manage your calendar settings', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(181, 1, 'General Settings', 'settings', '', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(182, 1, 'Color Settings', 'colors', '', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(183, 1, 'Calendar Permissions', 'permissions', '', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(184, 1, 'Import Calendar Data', 'import', '', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(185, 1, 'Boards & Summary', 'boards', 'Manage global board settings', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(186, 1, 'Board Settings', 'settings', '', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(187, 1, 'Permissions', 'permissions', '', '2025-06-25 21:11:20', '2025-06-25 21:11:20', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(188, 1, 'Summary Templates', 'summary_templates', '', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(189, 1, 'Conversations', 'conversations', 'Manage your conversations settings', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(190, 1, 'Settings', 'settings', '', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(191, 1, 'Community Points', 'points', '', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(192, 1, 'Banned Words', 'bannedwords', '', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(193, 1, 'Conversation Permissions', 'permissions', '', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(194, 1, 'Attributes', 'attributes', 'Setup attributes for pages, users, files and more.', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(195, 1, 'Types', 'types', 'Choose which attribute types are available for different items.', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(196, 1, 'Sets', 'sets', 'Group attributes into sets for easier organization', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(197, 1, 'Topics', 'topics', '', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(198, 1, 'Add Topic Tree', 'add', '', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(199, 1, 'Environment', 'environment', 'Advanced settings for web developers.', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(200, 1, 'Environment Information', 'info', '', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(201, 1, 'Error Handling', 'errors', '', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(202, 1, 'Logging Settings', 'logging', '', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(203, 1, 'Proxy Server', 'proxy', '', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(204, 1, 'Database Entities', 'entities', '', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(205, 1, 'Database Character Set', 'database_charset', '', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(206, 1, 'Geolocation', 'geolocation', '', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(207, 1, 'Security Policy', 'security', '', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(208, 1, 'Update Concrete', 'update', '', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(209, 1, 'Apply Update', 'update', '', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(210, 1, 'API', 'api', '', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(211, 1, 'API Integrations', 'integrations', '', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(212, 1, 'Scopes', 'scopes', '', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(213, 1, 'API Settings', 'settings', '', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(214, 1, 'Welcome', 'welcome', '', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(215, 1, 'Site Health', 'health', '', '2025-06-25 21:11:21', '2025-06-25 21:11:21', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(216, 1, 'Waiting for Me', 'me', '', '2025-06-25 21:11:22', '2025-06-25 21:11:22', 'Initial Version', 1, 0, 1, NULL, 1, 3, NULL, NULL, NULL, NULL, NULL),
(217, 1, 'Theme Documentation', '!themes', '', '2025-06-25 21:11:28', '2025-06-25 21:11:28', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(218, 1, 'Stacks', '!stacks', '', '2025-06-25 21:11:28', '2025-06-25 21:11:28', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(219, 1, 'Page Not Found', 'page_not_found', '', '2025-06-25 21:11:28', '2025-06-25 21:11:28', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(220, 1, 'Trash', '!trash', '', '2025-06-25 21:11:28', '2025-06-25 21:11:28', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(221, 1, 'Login', 'login', '', '2025-06-25 21:11:28', '2025-06-25 21:11:28', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(222, 1, 'Register', 'register', '', '2025-06-25 21:11:28', '2025-06-25 21:11:28', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(223, 1, 'My Account', 'account', '', '2025-06-25 21:11:28', '2025-06-25 21:11:28', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(224, 1, 'Edit Profile', 'edit_profile', 'Edit your user profile and change password.', '2025-06-25 21:11:28', '2025-06-25 21:11:28', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(225, 1, 'Profile Picture', 'avatar', 'Specify a new image attached to posts or edits.', '2025-06-25 21:11:28', '2025-06-25 21:11:28', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(226, 1, 'Private Messages', 'messages', 'Inbox for site-specific messages.', '2025-06-25 21:11:28', '2025-06-25 21:11:28', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(227, 1, 'Page Forbidden', 'page_forbidden', '', '2025-06-25 21:11:28', '2025-06-25 21:11:28', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(228, 1, 'Download File', 'download_file', '', '2025-06-25 21:11:28', '2025-06-25 21:11:28', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(229, 1, 'Drafts', '!drafts', '', '2025-06-25 21:11:28', '2025-06-25 21:11:28', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(230, 1, 'Welcome Back', 'desktop', '', '2025-06-25 21:11:28', '2025-06-25 21:11:28', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(231, 1, 'Navigation', 'navigation', NULL, '2025-06-25 21:11:35', '2025-06-25 21:11:35', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL),
(232, 1, 'Footer Column 1', 'footer-column-1', NULL, '2025-06-25 21:11:35', '2025-06-25 21:11:35', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL),
(233, 1, 'Footer Column 2', 'footer-column-2', NULL, '2025-06-25 21:11:35', '2025-06-25 21:11:35', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL),
(234, 1, 'Footer Column 3', 'footer-column-3', NULL, '2025-06-25 21:11:35', '2025-06-25 21:11:35', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL),
(235, 1, 'Footer Column 4', 'footer-column-4', NULL, '2025-06-25 21:11:35', '2025-06-25 21:11:35', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL),
(236, 1, 'blog-sidebar', 'blog-sidebar', NULL, '2025-06-25 21:11:35', '2025-06-25 21:11:35', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL),
(237, 1, 'Blog Sidebar', 'blog-sidebar', NULL, '2025-06-25 21:11:35', '2025-06-25 21:11:35', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL),
(238, 1, '', NULL, NULL, '2025-06-25 21:11:36', '2025-06-25 21:11:36', 'Initial Version', 1, 0, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(239, 1, 'About', 'about', '', '2025-06-25 21:11:36', '2025-06-25 21:11:36', 'Initial Version', 1, 0, 1, NULL, 1, 4, NULL, NULL, NULL, NULL, NULL),
(240, 1, 'Resources', 'resources', '', '2025-06-25 21:11:36', '2025-06-25 21:11:36', 'Initial Version', 1, 0, 1, NULL, 1, 4, NULL, NULL, NULL, NULL, NULL),
(241, 1, 'Documents', 'documents', '', '2025-06-25 21:11:36', '2025-06-25 21:11:36', 'Initial Version', 1, 0, 1, NULL, 1, 4, NULL, NULL, NULL, NULL, NULL),
(242, 1, 'Thanks for Subscribing', 'subscribe-thanks', '', '2025-06-25 21:11:36', '2025-06-25 21:11:36', 'Initial Version', 1, 0, 1, NULL, 1, 4, NULL, NULL, NULL, NULL, NULL),
(243, 1, 'Search', 'search', '', '2025-06-25 21:11:36', '2025-06-25 21:11:36', 'Initial Version', 1, 0, 1, NULL, 1, 4, NULL, NULL, NULL, NULL, NULL),
(244, 1, 'Blog Search', 'blog-search', '', '2025-06-25 21:11:36', '2025-06-25 21:11:36', 'Initial Version', 1, 0, 1, NULL, 1, 4, NULL, NULL, NULL, NULL, NULL),
(245, 1, '', NULL, NULL, '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'Initial Version', 1, 0, NULL, NULL, 0, 5, NULL, NULL, NULL, NULL, NULL),
(246, 1, 'Privacy Policy', 'privacy-policy', '', '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'Initial Version', 1, 0, 1, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL),
(247, 1, 'Services', 'services', '', '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'Initial Version', 1, 0, 1, NULL, 1, 4, NULL, NULL, NULL, NULL, NULL),
(248, 1, '', NULL, NULL, '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'Initial Version', 1, 0, NULL, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL),
(249, 1, 'Blog', 'blog', '', '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'Initial Version', 1, 0, 1, NULL, 1, 4, NULL, NULL, NULL, NULL, NULL),
(250, 1, 'FAQ', 'faq', '', '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'Initial Version', 1, 0, 1, NULL, 1, 4, NULL, NULL, NULL, NULL, NULL),
(251, 1, 'Contact Us', 'contact', '', '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'Initial Version', 1, 0, 1, NULL, 1, 4, NULL, NULL, NULL, NULL, NULL),
(252, 1, '', NULL, NULL, '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'Initial Version', 1, 0, NULL, NULL, 0, 7, NULL, NULL, NULL, NULL, NULL),
(253, 1, 'Resource One', 'resource-one', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. ', '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'Initial Version', 1, 0, 1, NULL, 1, 7, NULL, NULL, NULL, NULL, NULL),
(254, 1, 'Resource Two', 'resource-two', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. ', '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'Initial Version', 1, 0, 1, NULL, 1, 7, NULL, NULL, NULL, NULL, NULL),
(255, 1, 'Resource Three', 'resource-three', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. ', '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'Initial Version', 1, 0, 1, NULL, 1, 7, NULL, NULL, NULL, NULL, NULL),
(256, 1, 'Resource Four', 'resource-four', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. ', '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'Initial Version', 1, 0, 1, NULL, 1, 7, NULL, NULL, NULL, NULL, NULL),
(257, 1, 'Resource Five', 'resource-five', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. ', '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'Initial Version', 1, 0, 1, NULL, 1, 7, NULL, NULL, NULL, NULL, NULL),
(258, 1, 'Resource Six', 'resource-six', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. ', '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'Initial Version', 1, 0, 1, NULL, 1, 7, NULL, NULL, NULL, NULL, NULL),
(259, 1, '', NULL, NULL, '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'Initial Version', 1, 0, NULL, NULL, 0, 6, NULL, NULL, NULL, NULL, NULL),
(260, 1, 'Tips to Build a Beautiful Blog', 'tips-build-beautiful-blog', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.', '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'Initial Version', 1, 0, 1, NULL, 1, 6, NULL, NULL, NULL, NULL, NULL),
(261, 1, 'New Product Launch', 'new-product-launch', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.', '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'Initial Version', 1, 0, 1, NULL, 1, 6, NULL, NULL, NULL, NULL, NULL),
(262, 1, 'More Fine Posts Here', 'more-fine-posts-here', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.', '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'Initial Version', 1, 0, 1, NULL, 1, 6, NULL, NULL, NULL, NULL, NULL),
(263, 1, 'Here\'s a Tip You Might Not Know', 'heres-tip-you-might-not-know', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.', '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'Initial Version', 1, 0, 1, NULL, 1, 6, NULL, NULL, NULL, NULL, NULL),
(264, 1, 'Time to Freshen Up Your Website', 'freshen-up-your-website', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.', '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'Initial Version', 1, 0, 1, NULL, 1, 6, NULL, NULL, NULL, NULL, NULL),
(265, 1, 'Meet Our New Hires!', 'meet-our-new-hires', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.', '2025-06-25 21:11:37', '2025-06-25 21:11:37', 'Initial Version', 1, 0, 1, NULL, 1, 6, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `CollectionVersionThemeCustomStyles`
--

CREATE TABLE `CollectionVersionThemeCustomStyles` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cvID` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `pThemeID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `scvlID` int(10) UNSIGNED DEFAULT 0,
  `preset` varchar(255) DEFAULT NULL,
  `sccRecordID` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Config`
--

CREATE TABLE `Config` (
  `configNamespace` varchar(255) NOT NULL DEFAULT '',
  `configGroup` varchar(255) NOT NULL,
  `configItem` varchar(255) NOT NULL,
  `configValue` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Config`
--

INSERT INTO `Config` (`configNamespace`, `configGroup`, `configItem`, `configValue`) VALUES
('', 'app', 'privacy_policy_accepted', '1'),
('', 'app', 'site_information.viewed', '1'),
('', 'concrete', 'marketplace.key.private', 'a7227ce16d7ab99377b68f9d97ad2efcccc3e5f922bf467ef0c01e78ab1b8ad3'),
('', 'concrete', 'marketplace.key.public', '4026575ba95fec75c333b09195d14d44'),
('', 'concrete', 'security.token.encryption', '9b0da3aa8aa6c6ffde5268f434406e582170f0ed53f11e057870d225a933b002'),
('', 'concrete', 'security.token.jobs', '4b15ea47f69a208895f518a138f6f0609bcf9fb1d71e1b64c9565a5eb7f69a64'),
('', 'concrete', 'security.token.validation', 'cbff93834e7b151685c1ee552e711d19dc0e6d6def2f1640886f39604b4cec49');

-- --------------------------------------------------------

--
-- Table structure for table `ConfigStore`
--

CREATE TABLE `ConfigStore` (
  `cfKey` varchar(64) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `cfValue` longtext DEFAULT NULL,
  `uID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ConversationEditors`
--

CREATE TABLE `ConversationEditors` (
  `cnvEditorID` int(10) UNSIGNED NOT NULL,
  `cnvEditorHandle` varchar(64) DEFAULT NULL,
  `cnvEditorName` varchar(255) DEFAULT NULL,
  `cnvEditorIsActive` tinyint(1) NOT NULL DEFAULT 0,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ConversationEditors`
--

INSERT INTO `ConversationEditors` (`cnvEditorID`, `cnvEditorHandle`, `cnvEditorName`, `cnvEditorIsActive`, `pkgID`) VALUES
(1, 'plain_text', 'Plain Text', 1, 0),
(2, 'markdown', 'Markdown', 0, 0),
(3, 'rich_text', 'Rich Text', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ConversationFlaggedMessages`
--

CREATE TABLE `ConversationFlaggedMessages` (
  `cnvMessageID` int(10) UNSIGNED NOT NULL,
  `cnvMessageFlagTypeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ConversationFlaggedMessageTypes`
--

CREATE TABLE `ConversationFlaggedMessageTypes` (
  `cnvMessageFlagTypeID` int(10) UNSIGNED NOT NULL,
  `cnvMessageFlagTypeHandle` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ConversationFlaggedMessageTypes`
--

INSERT INTO `ConversationFlaggedMessageTypes` (`cnvMessageFlagTypeID`, `cnvMessageFlagTypeHandle`) VALUES
(1, 'spam');

-- --------------------------------------------------------

--
-- Table structure for table `ConversationMessageAttachments`
--

CREATE TABLE `ConversationMessageAttachments` (
  `cnvMessageAttachmentID` int(10) UNSIGNED NOT NULL,
  `cnvMessageID` int(11) DEFAULT NULL,
  `fID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ConversationMessageNotifications`
--

CREATE TABLE `ConversationMessageNotifications` (
  `cnvMessageID` int(10) UNSIGNED NOT NULL,
  `nID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ConversationMessageRatings`
--

CREATE TABLE `ConversationMessageRatings` (
  `cnvMessageRatingID` int(10) UNSIGNED NOT NULL,
  `cnvMessageID` int(10) UNSIGNED DEFAULT NULL,
  `cnvRatingTypeID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cnvMessageRatingIP` tinyblob DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `uID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ConversationMessages`
--

CREATE TABLE `ConversationMessages` (
  `cnvMessageID` int(10) UNSIGNED NOT NULL,
  `cnvID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cnvMessageReview` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cnvEditorID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cnvMessageAuthorName` varchar(255) DEFAULT NULL,
  `cnvMessageAuthorEmail` varchar(255) DEFAULT NULL,
  `cnvMessageAuthorWebsite` varchar(255) DEFAULT NULL,
  `cnvMessageSubmitIP` tinyblob DEFAULT NULL,
  `cnvMessageSubmitUserAgent` longtext DEFAULT NULL,
  `cnvMessageLevel` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cnvMessageParentID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cnvMessageDateCreated` datetime DEFAULT NULL,
  `cnvMessageSubject` text DEFAULT NULL,
  `cnvMessageBody` text DEFAULT NULL,
  `cnvIsMessageDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `cnvIsMessageApproved` tinyint(1) NOT NULL DEFAULT 0,
  `cnvMessageTotalRatingScore` bigint(20) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ConversationPermissionAddMessageAccessList`
--

CREATE TABLE `ConversationPermissionAddMessageAccessList` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `peID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `permission` varchar(1) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ConversationPermissionAssignments`
--

CREATE TABLE `ConversationPermissionAssignments` (
  `cnvID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pkID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ConversationPermissionAssignments`
--

INSERT INTO `ConversationPermissionAssignments` (`cnvID`, `pkID`, `paID`) VALUES
(0, 67, 131),
(0, 68, 132),
(0, 69, 136),
(0, 70, 134),
(0, 71, 133),
(0, 72, 135),
(0, 73, 137),
(0, 74, 138);

-- --------------------------------------------------------

--
-- Table structure for table `ConversationRatingTypes`
--

CREATE TABLE `ConversationRatingTypes` (
  `cnvRatingTypeID` int(10) UNSIGNED NOT NULL,
  `cnvRatingTypeHandle` varchar(255) DEFAULT NULL,
  `cnvRatingTypeName` varchar(10) DEFAULT NULL,
  `cnvRatingTypeCommunityPoints` int(11) DEFAULT NULL,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ConversationRatingTypes`
--

INSERT INTO `ConversationRatingTypes` (`cnvRatingTypeID`, `cnvRatingTypeHandle`, `cnvRatingTypeName`, `cnvRatingTypeCommunityPoints`, `pkgID`) VALUES
(1, 'up_vote', 'Up Vote', 1, 0),
(2, 'down_vote', 'Down Vote', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Conversations`
--

CREATE TABLE `Conversations` (
  `cnvID` int(10) UNSIGNED NOT NULL,
  `cID` int(10) UNSIGNED DEFAULT 0,
  `cnvDateCreated` datetime NOT NULL,
  `cnvDateLastMessage` datetime DEFAULT NULL,
  `cnvParentMessageID` int(10) UNSIGNED DEFAULT 0,
  `cnvAttachmentsEnabled` tinyint(1) NOT NULL DEFAULT 1,
  `cnvMessagesTotal` int(10) UNSIGNED DEFAULT 0,
  `cnvOverrideGlobalPermissions` tinyint(1) DEFAULT 0,
  `cnvAttachmentOverridesEnabled` tinyint(1) NOT NULL DEFAULT 0,
  `cnvMaxFilesGuest` int(11) DEFAULT 0,
  `cnvMaxFilesRegistered` int(11) DEFAULT 0,
  `cnvMaxFileSizeGuest` int(11) DEFAULT 0,
  `cnvMaxFileSizeRegistered` int(11) DEFAULT 0,
  `cnvFileExtensions` text DEFAULT NULL,
  `cnvNotificationOverridesEnabled` tinyint(1) NOT NULL DEFAULT 0,
  `cnvEnableSubscription` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ConversationSubscriptions`
--

CREATE TABLE `ConversationSubscriptions` (
  `cnvID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(1) DEFAULT 'S'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ConversationSubscriptions`
--

INSERT INTO `ConversationSubscriptions` (`cnvID`, `uID`, `type`) VALUES
(0, 1, 'S');

-- --------------------------------------------------------

--
-- Table structure for table `DesignTags`
--

CREATE TABLE `DesignTags` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `DownloadStatistics`
--

CREATE TABLE `DownloadStatistics` (
  `dsID` int(10) UNSIGNED NOT NULL COMMENT 'DownloadStatistics record ID',
  `fvID` int(11) NOT NULL COMMENT 'Version of the downloaded file',
  `uID` int(10) UNSIGNED DEFAULT NULL COMMENT 'ID of the user that downloaded the file',
  `rcID` int(10) UNSIGNED DEFAULT NULL COMMENT 'ID of the page where the download originated',
  `timestamp` timestamp NULL DEFAULT current_timestamp(),
  `fID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='List of downloaded files';

-- --------------------------------------------------------

--
-- Table structure for table `Editor`
--

CREATE TABLE `Editor` (
  `handle` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ExpressAttributeKeys`
--

CREATE TABLE `ExpressAttributeKeys` (
  `entity_id` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  `eakUnique` tinyint(1) NOT NULL COMMENT 'Enables SKU-type attributes',
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ExpressAttributeKeys`
--

INSERT INTO `ExpressAttributeKeys` (`entity_id`, `eakUnique`, `akID`) VALUES
('02e83926-0518-11ec-bb64-2d8e40952e25', 0, 22),
('83ae65b1-79e8-4ded-bbca-e419bfd19bb6', 0, 23),
('83ae65b1-79e8-4ded-bbca-e419bfd19bb6', 0, 24),
('83ae65b1-79e8-4ded-bbca-e419bfd19bb6', 0, 25),
('83ae65b1-79e8-4ded-bbca-e419bfd19bb6', 0, 26),
('83ae65b1-79e8-4ded-bbca-e419bfd19bb6', 0, 27);

-- --------------------------------------------------------

--
-- Table structure for table `ExpressEntities`
--

CREATE TABLE `ExpressEntities` (
  `id` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `default_view_form_id` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  `default_edit_form_id` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `plural_handle` varchar(255) DEFAULT NULL,
  `label_mask` varchar(255) DEFAULT NULL,
  `supports_custom_display_order` tinyint(1) NOT NULL,
  `description` longtext DEFAULT NULL,
  `result_column_set` longtext DEFAULT NULL COMMENT '(DC2Type:object)',
  `include_in_public_list` tinyint(1) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `include_in_rest_api` tinyint(1) NOT NULL,
  `entity_results_node_id` int(11) NOT NULL,
  `use_separate_site_result_buckets` tinyint(1) NOT NULL,
  `items_per_page` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ExpressEntities`
--

INSERT INTO `ExpressEntities` (`id`, `default_view_form_id`, `default_edit_form_id`, `name`, `handle`, `plural_handle`, `label_mask`, `supports_custom_display_order`, `description`, `result_column_set`, `include_in_public_list`, `is_published`, `include_in_rest_api`, `entity_results_node_id`, `use_separate_site_result_buckets`, `items_per_page`, `created_date`, `pkgID`) VALUES
('02e83926-0518-11ec-bb64-2d8e40952e25', '02e860ae-0518-11ec-bb64-2d8e40952e25', '02e860ae-0518-11ec-bb64-2d8e40952e25', 'Mailing List', 'mailing_list', '', NULL, 0, '', 'N;', 0, 1, 0, 64, 0, 10, '2025-06-25 21:11:35', NULL),
('83ae65b1-79e8-4ded-bbca-e419bfd19bb6', '881b6bde-220f-4482-b8f9-ace40b5d169b', '881b6bde-220f-4482-b8f9-ace40b5d169b', 'Contact', 'express_form_170', '', NULL, 0, '', 'N;', 0, 1, 0, 65, 0, 10, '2025-06-25 21:11:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ExpressEntityAssociationEntries`
--

CREATE TABLE `ExpressEntityAssociationEntries` (
  `id` int(11) NOT NULL,
  `association_id` int(11) DEFAULT NULL,
  `displayOrder` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `exEntryID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ExpressEntityAssociations`
--

CREATE TABLE `ExpressEntityAssociations` (
  `id` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `source_entity_id` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  `target_entity_id` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  `is_owned_by_association` tinyint(1) NOT NULL,
  `is_owning_association` tinyint(1) NOT NULL,
  `target_property_name` varchar(255) DEFAULT NULL,
  `inversed_by_property_name` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `association_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ExpressEntityEntries`
--

CREATE TABLE `ExpressEntityEntries` (
  `exEntryID` int(11) NOT NULL,
  `exEntryDisplayOrder` int(11) NOT NULL,
  `exEntryDateCreated` datetime NOT NULL,
  `exEntryDateModified` datetime DEFAULT NULL,
  `publicIdentifier` varchar(255) DEFAULT NULL,
  `resultsNodeID` int(11) DEFAULT NULL,
  `uID` int(10) UNSIGNED DEFAULT NULL,
  `exEntryEntityID` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ExpressEntityEntryAssociations`
--

CREATE TABLE `ExpressEntityEntryAssociations` (
  `id` int(11) NOT NULL,
  `association_id` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  `exEntryID` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ExpressEntityEntryAttributeValues`
--

CREATE TABLE `ExpressEntityEntryAttributeValues` (
  `exEntryID` int(11) NOT NULL,
  `akID` int(10) UNSIGNED NOT NULL,
  `avID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ExpressForm170ExpressSearchIndexAttributes`
--

CREATE TABLE `ExpressForm170ExpressSearchIndexAttributes` (
  `exEntryID` int(11) NOT NULL,
  `ak_contact_question_first_name` longtext DEFAULT NULL,
  `ak_contact_question_last_name` longtext DEFAULT NULL,
  `ak_contact_question_email_address` longtext DEFAULT NULL,
  `ak_contact_question_subject` longtext DEFAULT NULL,
  `ak_contact_question_message` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ExpressFormFieldSetAssociationControls`
--

CREATE TABLE `ExpressFormFieldSetAssociationControls` (
  `id` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `association_id` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  `association_entity_label_mask` varchar(255) DEFAULT NULL,
  `entry_selector_mode` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `enable_entry_reordering` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ExpressFormFieldSetAttributeKeyControls`
--

CREATE TABLE `ExpressFormFieldSetAttributeKeyControls` (
  `id` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `akID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ExpressFormFieldSetAttributeKeyControls`
--

INSERT INTO `ExpressFormFieldSetAttributeKeyControls` (`id`, `akID`) VALUES
('f6a4c382-0517-11ec-bb64-2d8e40952e25', 22),
('f68175ca-634c-11e6-a245-62e65b165d8e', 23),
('fbc62d32-634c-11e6-a245-62e65b165d8e', 24),
('02181ae2-634d-11e6-a245-62e65b165d8e', 25),
('b3c4ee52-6350-11e6-a245-62e65b165d8e', 26),
('bf4cdc08-6350-11e6-a245-62e65b165d8e', 27);

-- --------------------------------------------------------

--
-- Table structure for table `ExpressFormFieldSetAuthorControls`
--

CREATE TABLE `ExpressFormFieldSetAuthorControls` (
  `id` char(36) NOT NULL COMMENT '(DC2Type:guid)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ExpressFormFieldSetControls`
--

CREATE TABLE `ExpressFormFieldSetControls` (
  `id` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `field_set_id` int(11) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL,
  `position` int(11) NOT NULL,
  `custom_label` longtext DEFAULT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ExpressFormFieldSetControls`
--

INSERT INTO `ExpressFormFieldSetControls` (`id`, `field_set_id`, `is_required`, `position`, `custom_label`, `type`) VALUES
('02181ae2-634d-11e6-a245-62e65b165d8e', 2, 1, 2, '', 'attributekeycontrol'),
('32a6369e-65a0-11e6-9add-e0995e0a1653', 2, 0, 3, '', 'textcontrol'),
('b3c4ee52-6350-11e6-a245-62e65b165d8e', 2, 0, 4, '', 'attributekeycontrol'),
('bf4cdc08-6350-11e6-a245-62e65b165d8e', 2, 1, 5, '', 'attributekeycontrol'),
('f68175ca-634c-11e6-a245-62e65b165d8e', 2, 1, 0, '', 'attributekeycontrol'),
('f6a4c382-0517-11ec-bb64-2d8e40952e25', 1, 1, 0, '', 'attributekeycontrol'),
('fbc62d32-634c-11e6-a245-62e65b165d8e', 2, 1, 1, '', 'attributekeycontrol');

-- --------------------------------------------------------

--
-- Table structure for table `ExpressFormFieldSetPublicIdentifierControls`
--

CREATE TABLE `ExpressFormFieldSetPublicIdentifierControls` (
  `id` char(36) NOT NULL COMMENT '(DC2Type:guid)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ExpressFormFieldSets`
--

CREATE TABLE `ExpressFormFieldSets` (
  `id` int(11) NOT NULL,
  `form_id` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  `position` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ExpressFormFieldSets`
--

INSERT INTO `ExpressFormFieldSets` (`id`, `form_id`, `position`, `title`, `description`) VALUES
(1, '02e860ae-0518-11ec-bb64-2d8e40952e25', 0, '', ''),
(2, '881b6bde-220f-4482-b8f9-ace40b5d169b', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ExpressFormFieldSetTextControls`
--

CREATE TABLE `ExpressFormFieldSetTextControls` (
  `id` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `headline` varchar(255) DEFAULT NULL,
  `body` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ExpressFormFieldSetTextControls`
--

INSERT INTO `ExpressFormFieldSetTextControls` (`id`, `headline`, `body`) VALUES
('32a6369e-65a0-11e6-9add-e0995e0a1653', '', '<div class=\"alert alert-info\">Don&#39;t worry &ndash;&nbsp;we won&#39;t add you to any email list. This is just so we can contact you in case you have questions.</div>\n');

-- --------------------------------------------------------

--
-- Table structure for table `ExpressForms`
--

CREATE TABLE `ExpressForms` (
  `id` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `entity_id` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ExpressForms`
--

INSERT INTO `ExpressForms` (`id`, `entity_id`, `name`) VALUES
('02e860ae-0518-11ec-bb64-2d8e40952e25', '02e83926-0518-11ec-bb64-2d8e40952e25', 'Form'),
('881b6bde-220f-4482-b8f9-ace40b5d169b', '83ae65b1-79e8-4ded-bbca-e419bfd19bb6', 'Form');

-- --------------------------------------------------------

--
-- Table structure for table `FileAttributeKeys`
--

CREATE TABLE `FileAttributeKeys` (
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `FileAttributeKeys`
--

INSERT INTO `FileAttributeKeys` (`akID`) VALUES
(17),
(18),
(20);

-- --------------------------------------------------------

--
-- Table structure for table `FileAttributeValues`
--

CREATE TABLE `FileAttributeValues` (
  `fID` int(10) UNSIGNED NOT NULL,
  `fvID` int(10) UNSIGNED NOT NULL,
  `akID` int(10) UNSIGNED NOT NULL,
  `avID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `FileAttributeValues`
--

INSERT INTO `FileAttributeValues` (`fID`, `fvID`, `akID`, `avID`) VALUES
(1, 1, 17, 194),
(1, 1, 18, 195),
(2, 1, 17, 196),
(2, 1, 18, 197),
(3, 1, 17, 198),
(3, 1, 18, 199),
(4, 1, 17, 200),
(4, 1, 18, 201),
(5, 1, 17, 202),
(5, 1, 18, 203),
(6, 1, 17, 204),
(6, 1, 18, 205),
(7, 1, 17, 206),
(7, 1, 18, 207),
(8, 1, 17, 208),
(8, 1, 18, 209),
(9, 1, 17, 210),
(9, 1, 18, 211),
(10, 1, 17, 212),
(10, 1, 18, 213),
(11, 1, 17, 214),
(11, 1, 18, 215),
(12, 1, 17, 216),
(12, 1, 18, 217),
(13, 1, 17, 218),
(13, 1, 18, 219),
(14, 1, 17, 220),
(14, 1, 18, 221),
(15, 1, 17, 222),
(15, 1, 18, 223),
(16, 1, 17, 224),
(16, 1, 18, 225),
(17, 1, 17, 226),
(17, 1, 18, 227),
(18, 1, 17, 228),
(18, 1, 18, 229),
(19, 1, 17, 230),
(19, 1, 18, 231),
(21, 1, 17, 232),
(21, 1, 18, 233),
(22, 1, 17, 234),
(22, 1, 18, 235),
(23, 1, 17, 236),
(23, 1, 18, 237),
(24, 1, 17, 238),
(24, 1, 18, 239),
(25, 1, 17, 240),
(25, 1, 18, 241),
(26, 1, 17, 242),
(26, 1, 18, 243),
(27, 1, 17, 244),
(27, 1, 18, 245),
(28, 1, 17, 246),
(28, 1, 18, 247),
(29, 1, 17, 248),
(29, 1, 18, 249),
(30, 1, 17, 250),
(30, 1, 18, 251),
(31, 1, 17, 252),
(31, 1, 18, 253),
(32, 1, 17, 254),
(32, 1, 18, 255),
(33, 1, 17, 256),
(33, 1, 18, 257),
(34, 1, 17, 258),
(34, 1, 18, 259),
(35, 1, 17, 260),
(35, 1, 18, 261),
(36, 1, 17, 262),
(36, 1, 18, 263);

-- --------------------------------------------------------

--
-- Table structure for table `FileExternalFileProviders`
--

CREATE TABLE `FileExternalFileProviders` (
  `efpName` varchar(255) NOT NULL,
  `efpConfiguration` longtext NOT NULL COMMENT '(DC2Type:object)',
  `efpID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FileExternalFileProviderTypes`
--

CREATE TABLE `FileExternalFileProviderTypes` (
  `efpTypeHandle` longtext NOT NULL,
  `efpTypeName` longtext NOT NULL,
  `efpTypeID` int(11) NOT NULL,
  `pkgID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FileImageThumbnailPaths`
--

CREATE TABLE `FileImageThumbnailPaths` (
  `fileID` int(10) UNSIGNED NOT NULL,
  `fileVersionID` int(10) UNSIGNED NOT NULL,
  `thumbnailTypeHandle` varchar(255) NOT NULL,
  `storageLocationID` int(10) UNSIGNED NOT NULL,
  `thumbnailFormat` varchar(5) NOT NULL,
  `path` longtext NOT NULL,
  `isBuilt` tinyint(1) NOT NULL,
  `lockID` varchar(255) DEFAULT NULL,
  `lockExpires` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FileImageThumbnailTypeFileSets`
--

CREATE TABLE `FileImageThumbnailTypeFileSets` (
  `ftfsFileSetID` int(10) UNSIGNED NOT NULL,
  `ftfsThumbnailType` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FileImageThumbnailTypes`
--

CREATE TABLE `FileImageThumbnailTypes` (
  `ftTypeID` int(11) NOT NULL,
  `ftTypeHandle` varchar(255) NOT NULL,
  `ftTypeName` varchar(255) NOT NULL,
  `ftTypeWidth` int(11) DEFAULT NULL,
  `ftTypeHeight` int(11) DEFAULT NULL,
  `ftTypeIsRequired` tinyint(1) NOT NULL,
  `ftTypeSizingMode` varchar(255) NOT NULL,
  `ftUpscalingEnabled` tinyint(1) NOT NULL,
  `ftLimitedToFileSets` tinyint(1) NOT NULL,
  `ftKeepAnimations` tinyint(1) NOT NULL,
  `ftSaveAreaBackgroundColor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `FileImageThumbnailTypes`
--

INSERT INTO `FileImageThumbnailTypes` (`ftTypeID`, `ftTypeHandle`, `ftTypeName`, `ftTypeWidth`, `ftTypeHeight`, `ftTypeIsRequired`, `ftTypeSizingMode`, `ftUpscalingEnabled`, `ftLimitedToFileSets`, `ftKeepAnimations`, `ftSaveAreaBackgroundColor`) VALUES
(1, 'resource_list_entry', 'Resource List Entry', 510, 510, 0, 'proportional', 0, 0, 0, ''),
(2, 'testimonial_circle', 'Testimonial Circle', 180, 180, 0, 'exact', 0, 0, 0, ''),
(3, 'stripe_column', 'Stripe Column Image', 850, 650, 0, 'exact', 0, 0, 0, ''),
(4, 'atomik_gallery', 'Gallery', 860, 614, 0, 'exact', 0, 0, 0, ''),
(5, 'blog_entry_thumbnail', 'Blog Entry Thumbnail', 660, 428, 0, 'exact', 0, 0, 0, ''),
(6, 'file_manager_listing', 'File Manager Thumbnails', 120, 120, 1, 'exact', 1, 0, 0, ''),
(7, 'file_manager_detail', 'File Manager Detail Thumbnails', 500, 500, 1, 'exact', 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `FilePermissionAssignments`
--

CREATE TABLE `FilePermissionAssignments` (
  `fID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pkID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FilePermissionFileTypeAccessList`
--

CREATE TABLE `FilePermissionFileTypeAccessList` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `peID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `permission` varchar(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FilePermissionFileTypeAccessListCustom`
--

CREATE TABLE `FilePermissionFileTypeAccessListCustom` (
  `extension` varchar(64) NOT NULL,
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `peID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FilePermissionFileTypes`
--

CREATE TABLE `FilePermissionFileTypes` (
  `extension` varchar(32) NOT NULL,
  `fsID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Files`
--

CREATE TABLE `Files` (
  `fID` int(10) UNSIGNED NOT NULL,
  `fUUID` char(36) DEFAULT NULL,
  `fDateAdded` datetime NOT NULL,
  `fPassword` varchar(255) DEFAULT NULL,
  `fOverrideSetPermissions` tinyint(1) NOT NULL,
  `ocID` int(10) UNSIGNED NOT NULL,
  `folderTreeNodeID` int(10) UNSIGNED NOT NULL,
  `uID` int(10) UNSIGNED DEFAULT NULL,
  `fslID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Files`
--

INSERT INTO `Files` (`fID`, `fUUID`, `fDateAdded`, `fPassword`, `fOverrideSetPermissions`, `ocID`, `folderTreeNodeID`, `uID`, `fslID`) VALUES
(1, '769694c8-39fe-4455-a39e-7536325d02d8', '2025-06-25 21:11:31', NULL, 0, 0, 13, 1, 1),
(2, 'a41ccec7-902a-47cf-b9d2-9392d99c9a27', '2025-06-25 21:11:31', NULL, 0, 0, 14, 1, 1),
(3, 'dca6f9da-83ba-48ef-ae37-d152b06e63da', '2025-06-25 21:11:31', NULL, 0, 0, 12, 1, 1),
(4, '350480f0-464a-4220-9d67-9fab3ae2ee82', '2025-06-25 21:11:31', NULL, 0, 0, 14, 1, 1),
(5, '2e7b39d2-8462-472d-b1bb-0d6ef5560971', '2025-06-25 21:11:31', NULL, 0, 0, 16, 1, 1),
(6, '2195f721-a220-414f-98cc-8a79a4b98590', '2025-06-25 21:11:31', NULL, 0, 0, 10, 1, 1),
(7, '4c07f5f3-056a-4a9d-aeba-efcac2e0cc24', '2025-06-25 21:11:32', NULL, 0, 0, 10, 1, 1),
(8, 'bebbb193-e35c-4759-b331-583f23f4b694', '2025-06-25 21:11:32', NULL, 0, 0, 15, 1, 1),
(9, 'a46cf0fb-b924-4b38-a9e3-d310bcc2be5d', '2025-06-25 21:11:32', NULL, 0, 0, 16, 1, 1),
(10, 'c80bc200-533e-4863-bce9-623176f910ae', '2025-06-25 21:11:32', NULL, 0, 0, 12, 1, 1),
(11, '5a96120b-ef91-42b9-b41c-35ce90678bd2', '2025-06-25 21:11:32', NULL, 0, 0, 9, 1, 1),
(12, '38879ff0-a4c6-4974-9417-425a0dbd1527', '2025-06-25 21:11:32', NULL, 0, 0, 16, 1, 1),
(13, '2dd2fa51-3737-4aa4-b6cc-b7cbfb0c8f94', '2025-06-25 21:11:32', NULL, 0, 0, 15, 1, 1),
(14, 'f12bb292-dde9-469a-9e86-dd50cf7f5097', '2025-06-25 21:11:32', NULL, 0, 0, 11, 1, 1),
(15, 'd72355d5-9dd2-4a73-9980-f9c0b118ded8', '2025-06-25 21:11:32', NULL, 0, 0, 15, 1, 1),
(16, 'fcedba7b-618f-4f22-a035-61ef56f721a8', '2025-06-25 21:11:32', NULL, 0, 0, 12, 1, 1),
(17, '74ec6245-aef4-4e58-81d4-6c2eff4a10ba', '2025-06-25 21:11:32', NULL, 0, 0, 10, 1, 1),
(18, '4dc84015-ebde-4a72-9252-9ef95cfddd92', '2025-06-25 21:11:32', NULL, 0, 0, 10, 1, 1),
(19, '6ccf7b11-e21b-4890-b9c1-d439d347ecf7', '2025-06-25 21:11:33', NULL, 0, 0, 13, 1, 1),
(20, '271fea35-7264-4717-bde0-a7e239dfa6fc', '2025-06-25 21:11:33', NULL, 0, 0, 8, 1, 1),
(21, 'b2adcd7e-3e75-4702-a013-0460aa344e27', '2025-06-25 21:11:33', NULL, 0, 0, 14, 1, 1),
(22, '83ecf6bd-ac29-46cf-8fd1-56e4ea7df616', '2025-06-25 21:11:33', NULL, 0, 0, 16, 1, 1),
(23, '6e487e52-6528-456f-af41-65d5384b5150', '2025-06-25 21:11:33', NULL, 0, 0, 9, 1, 1),
(24, '296c1ac4-e45a-4ea7-a565-ec90f38363a3', '2025-06-25 21:11:33', NULL, 0, 0, 16, 1, 1),
(25, 'fcbe40a1-87ec-41ba-b1dc-910b8a9ad7d3', '2025-06-25 21:11:33', NULL, 0, 0, 11, 1, 1),
(26, 'bbb15562-d936-4a6a-a2ce-a7c695449010', '2025-06-25 21:11:33', NULL, 0, 0, 10, 1, 1),
(27, '8cea4597-3dd5-4e72-9a5c-e341cee4f152', '2025-06-25 21:11:33', NULL, 0, 0, 11, 1, 1),
(28, '52234048-7bf4-4ff2-8646-94363ef40132', '2025-06-25 21:11:33', NULL, 0, 0, 11, 1, 1),
(29, 'cf77bc6f-de16-481f-86c9-337de32e40ca', '2025-06-25 21:11:33', NULL, 0, 0, 16, 1, 1),
(30, 'ae173630-fd9a-4208-a11e-864717469c4f', '2025-06-25 21:11:33', NULL, 0, 0, 15, 1, 1),
(31, 'b8563392-9736-4c34-959a-544a289612ed', '2025-06-25 21:11:34', NULL, 0, 0, 14, 1, 1),
(32, '05c896fd-ae84-40ce-b061-bd21a6f48ec4', '2025-06-25 21:11:34', NULL, 0, 0, 10, 1, 1),
(33, '94a1ddef-a614-4ce6-a4af-0ef1f64a5f5b', '2025-06-25 21:11:34', NULL, 0, 0, 15, 1, 1),
(34, '6139539d-685b-409b-aca1-4b90f0225d26', '2025-06-25 21:11:34', NULL, 0, 0, 11, 1, 1),
(35, '025af9f5-e097-4ab5-89ad-c53038224b92', '2025-06-25 21:11:34', NULL, 0, 0, 11, 1, 1),
(36, 'e77e9d89-6f36-4c48-ae31-7b0480bce9c3', '2025-06-25 21:11:34', NULL, 0, 0, 15, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `FileSearchIndexAttributes`
--

CREATE TABLE `FileSearchIndexAttributes` (
  `fID` int(10) UNSIGNED NOT NULL,
  `ak_width` decimal(14,4) DEFAULT 0.0000,
  `ak_height` decimal(14,4) DEFAULT 0.0000,
  `ak_duration` decimal(14,4) DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `FileSearchIndexAttributes`
--

INSERT INTO `FileSearchIndexAttributes` (`fID`, `ak_width`, `ak_height`, `ak_duration`) VALUES
(1, 2600.0000, 1214.0000, 0.0000),
(2, 272.0000, 40.0000, 0.0000),
(3, 2600.0000, 1367.0000, 0.0000),
(4, 164.0000, 84.0000, 0.0000),
(5, 660.0000, 842.0000, 0.0000),
(6, 660.0000, 432.0000, 0.0000),
(7, 660.0000, 432.0000, 0.0000),
(8, 892.0000, 590.0000, 0.0000),
(9, 662.0000, 840.0000, 0.0000),
(10, 2600.0000, 1367.0000, 0.0000),
(11, 84.0000, 76.0000, 0.0000),
(12, 660.0000, 842.0000, 0.0000),
(13, 892.0000, 590.0000, 0.0000),
(14, 866.0000, 616.0000, 0.0000),
(15, 2220.0000, 1004.0000, 0.0000),
(16, 2600.0000, 1367.0000, 0.0000),
(17, 660.0000, 432.0000, 0.0000),
(18, 662.0000, 432.0000, 0.0000),
(19, 2600.0000, 1214.0000, 0.0000),
(21, 332.0000, 56.0000, 0.0000),
(22, 662.0000, 842.0000, 0.0000),
(23, 84.0000, 76.0000, 0.0000),
(24, 660.0000, 840.0000, 0.0000),
(25, 866.0000, 616.0000, 0.0000),
(26, 662.0000, 432.0000, 0.0000),
(27, 866.0000, 618.0000, 0.0000),
(28, 866.0000, 618.0000, 0.0000),
(29, 660.0000, 840.0000, 0.0000),
(30, 2598.0000, 960.0000, 0.0000),
(31, 252.0000, 84.0000, 0.0000),
(32, 660.0000, 432.0000, 0.0000),
(33, 230.0000, 228.0000, 0.0000),
(34, 864.0000, 616.0000, 0.0000),
(35, 868.0000, 618.0000, 0.0000),
(36, 1080.0000, 832.0000, 0.0000);

-- --------------------------------------------------------

--
-- Table structure for table `FileSetFiles`
--

CREATE TABLE `FileSetFiles` (
  `fsfID` int(10) UNSIGNED NOT NULL,
  `fID` int(10) UNSIGNED NOT NULL,
  `fsID` int(10) UNSIGNED NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `fsDisplayOrder` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FileSets`
--

CREATE TABLE `FileSets` (
  `fsID` int(10) UNSIGNED NOT NULL,
  `fsName` varchar(64) NOT NULL,
  `uID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `fsType` smallint(6) NOT NULL,
  `fsOverrideGlobalPermissions` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FileSetSavedSearches`
--

CREATE TABLE `FileSetSavedSearches` (
  `fsID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `fsSearchRequest` text DEFAULT NULL,
  `fsResultColumns` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FileStorageLocations`
--

CREATE TABLE `FileStorageLocations` (
  `fslName` varchar(255) NOT NULL,
  `fslConfiguration` longtext NOT NULL COMMENT '(DC2Type:object)',
  `fslID` int(10) UNSIGNED NOT NULL,
  `fslIsDefault` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `FileStorageLocations`
--

INSERT INTO `FileStorageLocations` (`fslName`, `fslConfiguration`, `fslID`, `fslIsDefault`) VALUES
('Default', 'O:69:\"Concrete\\Core\\File\\StorageLocation\\Configuration\\DefaultConfiguration\":1:{s:10:\"\0*\0default\";b:1;}', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `FileStorageLocationTypes`
--

CREATE TABLE `FileStorageLocationTypes` (
  `fslTypeHandle` longtext NOT NULL,
  `fslTypeName` longtext NOT NULL,
  `fslTypeID` int(11) NOT NULL,
  `pkgID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `FileStorageLocationTypes`
--

INSERT INTO `FileStorageLocationTypes` (`fslTypeHandle`, `fslTypeName`, `fslTypeID`, `pkgID`) VALUES
('default', 'Default', 1, 0),
('local', 'Local', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `FileUsageRecord`
--

CREATE TABLE `FileUsageRecord` (
  `file_id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `collection_id` int(11) NOT NULL,
  `collection_version_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `FileUsageRecord`
--

INSERT INTO `FileUsageRecord` (`file_id`, `block_id`, `collection_id`, `collection_version_id`) VALUES
(1, 44, 1, 1),
(1, 92, 247, 1),
(1, 118, 251, 1),
(1, 132, 241, 1),
(2, 62, 1, 1),
(3, 58, 1, 1),
(3, 64, 239, 1),
(4, 62, 1, 1),
(5, 91, 239, 1),
(5, 108, 247, 1),
(6, 0, 260, 1),
(7, 0, 257, 1),
(7, 0, 264, 1),
(8, 0, 255, 1),
(8, 82, 239, 1),
(9, 87, 239, 1),
(9, 107, 247, 1),
(10, 58, 1, 1),
(10, 64, 239, 1),
(11, 35, 231, 1),
(12, 89, 239, 1),
(12, 109, 247, 1),
(13, 0, 254, 1),
(13, 80, 239, 1),
(14, 53, 1, 1),
(15, 47, 1, 1),
(15, 54, 1, 1),
(15, 67, 239, 1),
(16, 58, 1, 1),
(16, 64, 239, 1),
(17, 0, 258, 1),
(17, 0, 265, 1),
(18, 0, 263, 1),
(19, 125, 240, 1),
(21, 62, 1, 1),
(22, 90, 239, 1),
(22, 110, 247, 1),
(23, 35, 231, 1),
(23, 36, 232, 1),
(24, 86, 239, 1),
(24, 106, 247, 1),
(25, 53, 1, 1),
(26, 0, 262, 1),
(27, 53, 1, 1),
(28, 53, 1, 1),
(29, 0, 256, 1),
(29, 88, 239, 1),
(29, 105, 247, 1),
(31, 62, 1, 1),
(32, 0, 261, 1),
(33, 63, 1, 1),
(34, 53, 1, 1),
(35, 53, 1, 1),
(36, 0, 253, 1),
(36, 56, 1, 1),
(36, 77, 239, 1);

-- --------------------------------------------------------

--
-- Table structure for table `FileVersionLog`
--

CREATE TABLE `FileVersionLog` (
  `fvlID` int(10) UNSIGNED NOT NULL,
  `fID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `fvID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `fvUpdateTypeID` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `fvUpdateTypeAttributeID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FileVersions`
--

CREATE TABLE `FileVersions` (
  `fvID` int(11) NOT NULL,
  `fvFilename` varchar(255) NOT NULL,
  `fvPrefix` varchar(255) DEFAULT NULL,
  `fvDateAdded` datetime NOT NULL,
  `fvActivateDateTime` datetime NOT NULL,
  `fvIsApproved` tinyint(1) NOT NULL,
  `fvAuthorUID` int(11) NOT NULL,
  `fvApproverUID` int(11) NOT NULL,
  `fvSize` bigint(20) NOT NULL,
  `fvTitle` varchar(255) DEFAULT NULL,
  `fvDescription` longtext DEFAULT NULL,
  `fvExtension` varchar(255) DEFAULT NULL,
  `fvTags` longtext DEFAULT NULL,
  `fvType` int(11) NOT NULL,
  `fvHasListingThumbnail` int(11) NOT NULL,
  `fvHasDetailThumbnail` int(11) NOT NULL,
  `fID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `FileVersions`
--

INSERT INTO `FileVersions` (`fvID`, `fvFilename`, `fvPrefix`, `fvDateAdded`, `fvActivateDateTime`, `fvIsApproved`, `fvAuthorUID`, `fvApproverUID`, `fvSize`, `fvTitle`, `fvDescription`, `fvExtension`, `fvTags`, `fvType`, `fvHasListingThumbnail`, `fvHasDetailThumbnail`, `fID`) VALUES
(1, 'hero-01.jpg', '861750864291', '2025-06-25 21:11:31', '2025-06-25 21:11:31', 1, 1, 1, 582915, 'hero-01.jpg', '', 'jpg', '', 1, 1, 1, 1),
(1, 'logo-04.png', '281750864291', '2025-06-25 21:11:31', '2025-06-25 21:11:31', 1, 1, 1, 6695, 'logo-04.png', '', 'png', '', 1, 1, 0, 2),
(1, 'collaboration-01.jpg', '961750864291', '2025-06-25 21:11:31', '2025-06-25 21:11:31', 1, 1, 1, 555454, 'collaboration-01.jpg', '', 'jpg', '', 1, 1, 1, 3),
(1, 'logo-02.png', '971750864291', '2025-06-25 21:11:31', '2025-06-25 21:11:31', 1, 1, 1, 6817, 'logo-02.png', '', 'png', '', 1, 1, 0, 4),
(1, 'team-01.jpg', '101750864291', '2025-06-25 21:11:31', '2025-06-25 21:11:31', 1, 1, 1, 253132, 'team-01.jpg', '', 'jpg', '', 1, 1, 1, 5),
(1, 'blog-01.jpg', '241750864291', '2025-06-25 21:11:31', '2025-06-25 21:11:31', 1, 1, 1, 44585, 'blog-01.jpg', '', 'jpg', '', 1, 1, 0, 6),
(1, 'blog-05.jpg', '801750864292', '2025-06-25 21:11:32', '2025-06-25 21:11:32', 1, 1, 1, 47568, 'blog-05.jpg', '', 'jpg', '', 1, 1, 0, 7),
(1, 'laptops-02.jpg', '801750864292', '2025-06-25 21:11:32', '2025-06-25 21:11:32', 1, 1, 1, 128233, 'laptops-02.jpg', '', 'jpg', '', 1, 1, 1, 8),
(1, 'team-04.jpg', '321750864292', '2025-06-25 21:11:32', '2025-06-25 21:11:32', 1, 1, 1, 168574, 'team-04.jpg', '', 'jpg', '', 1, 1, 1, 9),
(1, 'collaboration-02.jpg', '671750864292', '2025-06-25 21:11:32', '2025-06-25 21:11:32', 1, 1, 1, 878046, 'collaboration-02.jpg', '', 'jpg', '', 1, 1, 1, 10),
(1, 'atomik-logo-transparent.png', '301750864292', '2025-06-25 21:11:32', '2025-06-25 21:11:32', 1, 1, 1, 3765, 'atomik-logo-transparent.png', '', 'png', '', 1, 1, 0, 11),
(1, 'team-05.jpg', '251750864292', '2025-06-25 21:11:32', '2025-06-25 21:11:32', 1, 1, 1, 97897, 'team-05.jpg', '', 'jpg', '', 1, 1, 1, 12),
(1, 'laptops-01.jpg', '211750864292', '2025-06-25 21:11:32', '2025-06-25 21:11:32', 1, 1, 1, 191064, 'laptops-01.jpg', '', 'jpg', '', 1, 1, 1, 13),
(1, 'gallery-watch.jpg', '291750864292', '2025-06-25 21:11:32', '2025-06-25 21:11:32', 1, 1, 1, 77251, 'gallery-watch.jpg', '', 'jpg', '', 1, 1, 1, 14),
(1, 'people-01.jpg', '161750864292', '2025-06-25 21:11:32', '2025-06-25 21:11:32', 1, 1, 1, 469577, 'people-01.jpg', '', 'jpg', '', 1, 1, 1, 15),
(1, 'collaboration-03.jpg', '911750864292', '2025-06-25 21:11:32', '2025-06-25 21:11:32', 1, 1, 1, 244814, 'collaboration-03.jpg', '', 'jpg', '', 1, 1, 1, 16),
(1, 'blog-06.jpg', '571750864292', '2025-06-25 21:11:32', '2025-06-25 21:11:32', 1, 1, 1, 88841, 'blog-06.jpg', '', 'jpg', '', 1, 1, 0, 17),
(1, 'blog-04.jpg', '511750864292', '2025-06-25 21:11:32', '2025-06-25 21:11:32', 1, 1, 1, 66141, 'blog-04.jpg', '', 'jpg', '', 1, 1, 0, 18),
(1, 'hero-resources.jpg', '491750864293', '2025-06-25 21:11:33', '2025-06-25 21:11:33', 1, 1, 1, 178530, 'hero-resources.jpg', '', 'jpg', '', 1, 1, 1, 19),
(1, 'dummy.pdf', '381750864293', '2025-06-25 21:11:33', '2025-06-25 21:11:33', 1, 1, 1, 13264, 'dummy.pdf', '', 'pdf', '', 5, 0, 0, 20),
(1, 'logo-01.png', '341750864293', '2025-06-25 21:11:33', '2025-06-25 21:11:33', 1, 1, 1, 5962, 'logo-01.png', '', 'png', '', 1, 1, 0, 21),
(1, 'team-03.jpg', '841750864293', '2025-06-25 21:11:33', '2025-06-25 21:11:33', 1, 1, 1, 195532, 'team-03.jpg', '', 'jpg', '', 1, 1, 1, 22),
(1, 'atomik-logo.png', '521750864293', '2025-06-25 21:11:33', '2025-06-25 21:11:33', 1, 1, 1, 6069, 'atomik-logo.png', '', 'png', '', 1, 1, 0, 23),
(1, 'team-06.jpg', '591750864293', '2025-06-25 21:11:33', '2025-06-25 21:11:33', 1, 1, 1, 108978, 'team-06.jpg', '', 'jpg', '', 1, 1, 1, 24),
(1, 'gallery-headphones.jpg', '121750864293', '2025-06-25 21:11:33', '2025-06-25 21:11:33', 1, 1, 1, 58455, 'gallery-headphones.jpg', '', 'jpg', '', 1, 1, 1, 25),
(1, 'blog-03.jpg', '271750864293', '2025-06-25 21:11:33', '2025-06-25 21:11:33', 1, 1, 1, 79970, 'blog-03.jpg', '', 'jpg', '', 1, 1, 0, 26),
(1, 'gallery-watch2.jpg', '271750864293', '2025-06-25 21:11:33', '2025-06-25 21:11:33', 1, 1, 1, 42870, 'gallery-watch2.jpg', '', 'jpg', '', 1, 1, 1, 27),
(1, 'gallery-skincare.jpg', '201750864293', '2025-06-25 21:11:33', '2025-06-25 21:11:33', 1, 1, 1, 56879, 'gallery-skincare.jpg', '', 'jpg', '', 1, 1, 1, 28),
(1, 'team-02.jpg', '431750864293', '2025-06-25 21:11:33', '2025-06-25 21:11:33', 1, 1, 1, 150620, 'team-02.jpg', '', 'jpg', '', 1, 1, 1, 29),
(1, 'testimonial-bg.jpg', '321750864293', '2025-06-25 21:11:33', '2025-06-25 21:11:33', 1, 1, 1, 552524, 'testimonial-bg.jpg', '', 'jpg', '', 1, 1, 1, 30),
(1, 'logo-03.png', '411750864294', '2025-06-25 21:11:34', '2025-06-25 21:11:34', 1, 1, 1, 4924, 'logo-03.png', '', 'png', '', 1, 1, 0, 31),
(1, 'blog-02.jpg', '261750864294', '2025-06-25 21:11:34', '2025-06-25 21:11:34', 1, 1, 1, 98035, 'blog-02.jpg', '', 'jpg', '', 1, 1, 0, 32),
(1, 'testimonial-01.jpg', '631750864294', '2025-06-25 21:11:34', '2025-06-25 21:11:34', 1, 1, 1, 24330, 'testimonial-01.jpg', '', 'jpg', '', 1, 1, 0, 33),
(1, 'gallery-shoes.jpg', '871750864294', '2025-06-25 21:11:34', '2025-06-25 21:11:34', 1, 1, 1, 60878, 'gallery-shoes.jpg', '', 'jpg', '', 1, 1, 1, 34),
(1, 'gallery-shoes2.jpg', '741750864294', '2025-06-25 21:11:34', '2025-06-25 21:11:34', 1, 1, 1, 44935, 'gallery-shoes2.jpg', '', 'jpg', '', 1, 1, 1, 35),
(1, 'hands-01.jpg', '811750864294', '2025-06-25 21:11:34', '2025-06-25 21:11:34', 1, 1, 1, 193201, 'hands-01.jpg', '', 'jpg', '', 1, 1, 1, 36);

-- --------------------------------------------------------

--
-- Table structure for table `FormSubmissionNotifications`
--

CREATE TABLE `FormSubmissionNotifications` (
  `exEntryID` int(11) DEFAULT NULL,
  `nID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Geolocators`
--

CREATE TABLE `Geolocators` (
  `glID` int(10) UNSIGNED NOT NULL COMMENT 'Geolocator ID',
  `glHandle` varchar(255) NOT NULL COMMENT 'Geolocator handle',
  `glName` varchar(255) NOT NULL COMMENT 'Geolocator name',
  `glDescription` longtext NOT NULL COMMENT 'Geolocator description',
  `glConfiguration` longtext NOT NULL COMMENT 'Geolocator configuration options(DC2Type:json_array)',
  `glActive` tinyint(1) NOT NULL COMMENT 'Is this Geolocator the active one?',
  `glPackage` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='List of all the installed Geolocator services';

--
-- Dumping data for table `Geolocators`
--

INSERT INTO `Geolocators` (`glID`, `glHandle`, `glName`, `glDescription`, `glConfiguration`, `glActive`, `glPackage`) VALUES
(1, 'geoplugin', 'geoPlugin', '', '{\"url\":\"http:\\/\\/www.geoplugin.net\\/json.gp?ip=[[IP]]\"}', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `GroupCreateNotifications`
--

CREATE TABLE `GroupCreateNotifications` (
  `id` int(10) UNSIGNED DEFAULT NULL,
  `nID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GroupCreates`
--

CREATE TABLE `GroupCreates` (
  `id` int(10) UNSIGNED NOT NULL,
  `gID` int(10) UNSIGNED NOT NULL,
  `requested` datetime NOT NULL,
  `uID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GroupJoinRequests`
--

CREATE TABLE `GroupJoinRequests` (
  `uID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gjrRequested` datetime NOT NULL DEFAULT '1000-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GroupRoleChangeNotifications`
--

CREATE TABLE `GroupRoleChangeNotifications` (
  `id` int(10) UNSIGNED DEFAULT NULL,
  `nID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GroupRoleChanges`
--

CREATE TABLE `GroupRoleChanges` (
  `id` int(10) UNSIGNED NOT NULL,
  `gID` int(10) UNSIGNED NOT NULL,
  `grID` int(10) UNSIGNED NOT NULL,
  `requested` datetime NOT NULL,
  `uID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GroupRoles`
--

CREATE TABLE `GroupRoles` (
  `grID` int(10) UNSIGNED NOT NULL,
  `grName` varchar(128) NOT NULL,
  `grIsManager` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `GroupRoles`
--

INSERT INTO `GroupRoles` (`grID`, `grName`, `grIsManager`) VALUES
(1, 'Member', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Groups`
--

CREATE TABLE `Groups` (
  `gID` int(10) UNSIGNED NOT NULL,
  `gName` varchar(128) NOT NULL,
  `gDescription` varchar(255) NOT NULL,
  `gUserExpirationIsEnabled` tinyint(1) NOT NULL DEFAULT 0,
  `gUserExpirationMethod` varchar(12) DEFAULT NULL,
  `gUserExpirationSetDateTime` datetime DEFAULT NULL,
  `gUserExpirationInterval` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gUserExpirationAction` varchar(20) DEFAULT NULL,
  `gThumbnailFID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gPetitionForPublicEntry` tinyint(1) NOT NULL DEFAULT 0,
  `gOverrideGroupTypeSettings` tinyint(1) NOT NULL DEFAULT 0,
  `gtID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gDefaultRoleID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gIsBadge` tinyint(1) NOT NULL DEFAULT 0,
  `gBadgeFID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gAuthorID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gBadgeDescription` varchar(255) DEFAULT NULL,
  `gBadgeCommunityPointValue` int(11) NOT NULL DEFAULT 0,
  `gIsAutomated` tinyint(1) NOT NULL DEFAULT 0,
  `gCheckAutomationOnRegister` tinyint(1) NOT NULL DEFAULT 0,
  `gCheckAutomationOnLogin` tinyint(1) NOT NULL DEFAULT 0,
  `gCheckAutomationOnJobRun` tinyint(1) NOT NULL DEFAULT 0,
  `gPath` text DEFAULT NULL,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Groups`
--

INSERT INTO `Groups` (`gID`, `gName`, `gDescription`, `gUserExpirationIsEnabled`, `gUserExpirationMethod`, `gUserExpirationSetDateTime`, `gUserExpirationInterval`, `gUserExpirationAction`, `gThumbnailFID`, `gPetitionForPublicEntry`, `gOverrideGroupTypeSettings`, `gtID`, `gDefaultRoleID`, `gIsBadge`, `gBadgeFID`, `gAuthorID`, `gBadgeDescription`, `gBadgeCommunityPointValue`, `gIsAutomated`, `gCheckAutomationOnRegister`, `gCheckAutomationOnLogin`, `gCheckAutomationOnJobRun`, `gPath`, `pkgID`) VALUES
(1, 'Guest', 'The guest group represents unregistered visitors to your site.', 0, NULL, NULL, 0, NULL, 0, 0, 0, 1, 1, 0, 0, 0, NULL, 0, 0, 0, 0, 0, '/Guest', 0),
(2, 'Registered Users', 'The registered users group represents all user accounts.', 0, NULL, NULL, 0, NULL, 0, 0, 0, 1, 1, 0, 0, 0, NULL, 0, 0, 0, 0, 0, '/Registered Users', 0),
(3, 'Administrators', '', 0, NULL, NULL, 0, NULL, 0, 0, 0, 1, 1, 0, 0, 0, NULL, 0, 0, 0, 0, 0, '/Administrators', 0);

-- --------------------------------------------------------

--
-- Table structure for table `GroupSelectedRoles`
--

CREATE TABLE `GroupSelectedRoles` (
  `gID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `grID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GroupSetGroups`
--

CREATE TABLE `GroupSetGroups` (
  `gID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gsID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GroupSets`
--

CREATE TABLE `GroupSets` (
  `gsID` int(10) UNSIGNED NOT NULL,
  `gsName` varchar(255) DEFAULT NULL,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GroupSignupNotifications`
--

CREATE TABLE `GroupSignupNotifications` (
  `id` int(10) UNSIGNED DEFAULT NULL,
  `nID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GroupSignupRequestAcceptNotifications`
--

CREATE TABLE `GroupSignupRequestAcceptNotifications` (
  `id` int(10) UNSIGNED DEFAULT NULL,
  `nID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GroupSignupRequestAccepts`
--

CREATE TABLE `GroupSignupRequestAccepts` (
  `id` int(10) UNSIGNED NOT NULL,
  `gID` int(10) UNSIGNED NOT NULL,
  `RequestAccepted` datetime NOT NULL,
  `uID` int(10) UNSIGNED DEFAULT NULL,
  `managerUID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GroupSignupRequestDeclineNotifications`
--

CREATE TABLE `GroupSignupRequestDeclineNotifications` (
  `id` int(10) UNSIGNED DEFAULT NULL,
  `nID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GroupSignupRequestDeclines`
--

CREATE TABLE `GroupSignupRequestDeclines` (
  `id` int(10) UNSIGNED NOT NULL,
  `gID` int(10) UNSIGNED NOT NULL,
  `RequestDeclineed` datetime NOT NULL,
  `uID` int(10) UNSIGNED DEFAULT NULL,
  `managerUID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GroupSignupRequestNotifications`
--

CREATE TABLE `GroupSignupRequestNotifications` (
  `id` int(10) UNSIGNED DEFAULT NULL,
  `nID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GroupSignupRequests`
--

CREATE TABLE `GroupSignupRequests` (
  `id` int(10) UNSIGNED NOT NULL,
  `gID` int(10) UNSIGNED NOT NULL,
  `requested` datetime NOT NULL,
  `uID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GroupSignups`
--

CREATE TABLE `GroupSignups` (
  `id` int(10) UNSIGNED NOT NULL,
  `gID` int(10) UNSIGNED NOT NULL,
  `requested` datetime NOT NULL,
  `uID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GroupTypes`
--

CREATE TABLE `GroupTypes` (
  `gtID` int(10) UNSIGNED NOT NULL,
  `gtName` varchar(128) NOT NULL,
  `gtDefaultRoleID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gtPetitionForPublicEntry` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `GroupTypes`
--

INSERT INTO `GroupTypes` (`gtID`, `gtName`, `gtDefaultRoleID`, `gtPetitionForPublicEntry`) VALUES
(1, 'Group', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `GroupTypeSelectedRoles`
--

CREATE TABLE `GroupTypeSelectedRoles` (
  `gtID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `grID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `GroupTypeSelectedRoles`
--

INSERT INTO `GroupTypeSelectedRoles` (`gtID`, `grID`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `HealthReportResultFindings`
--

CREATE TABLE `HealthReportResultFindings` (
  `id` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `result_id` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  `message` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `handle` varchar(255) DEFAULT NULL,
  `control` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `HealthReportResults`
--

CREATE TABLE `HealthReportResults` (
  `id` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `dateStarted` int(10) UNSIGNED NOT NULL,
  `dateCompleted` int(10) UNSIGNED DEFAULT NULL,
  `score` int(10) UNSIGNED DEFAULT NULL,
  `grade` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `name` varchar(255) NOT NULL,
  `taskID` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `HealthReportSearchResults`
--

CREATE TABLE `HealthReportSearchResults` (
  `id` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `searchString` varchar(255) NOT NULL,
  `searchType` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `IpAccessControlCategories`
--

CREATE TABLE `IpAccessControlCategories` (
  `iaccID` int(10) UNSIGNED NOT NULL COMMENT 'The IP Access Control Category identifier',
  `iaccHandle` varchar(255) NOT NULL COMMENT 'The IP Access Control handle',
  `iaccName` varchar(255) NOT NULL COMMENT 'The IP Access Control name',
  `iaccEnabled` tinyint(1) NOT NULL COMMENT 'Is this IP Access Control enabled?',
  `iaccMaxEvents` int(10) UNSIGNED NOT NULL COMMENT 'The maximum allowed events in the time window',
  `iaccTimeWindow` int(10) UNSIGNED DEFAULT NULL COMMENT 'The time window (in seconds) where the events should be counted (NULL means no limits)',
  `iaccBanDuration` int(10) UNSIGNED DEFAULT NULL COMMENT 'The duration (in seconds) of the ban when the maximum number of events occur in the time window (NULL means forever)',
  `iaccSiteSpecific` tinyint(1) NOT NULL COMMENT 'Is this IP Access Control Category site-specific?',
  `iaccLogChannel` varchar(255) NOT NULL COMMENT 'The log channel handle',
  `iaccPackage` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='List of IP Access Control Categories';

--
-- Dumping data for table `IpAccessControlCategories`
--

INSERT INTO `IpAccessControlCategories` (`iaccID`, `iaccHandle`, `iaccName`, `iaccEnabled`, `iaccMaxEvents`, `iaccTimeWindow`, `iaccBanDuration`, `iaccSiteSpecific`, `iaccLogChannel`, `iaccPackage`) VALUES
(1, 'failed_login', 'Failed Login Attempts', 1, 5, 300, 600, 0, 'security', NULL),
(2, 'forgot_password', 'Forgot Password Attempts', 1, 2, 30, 600, 0, 'security', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `IpAccessControlEvents`
--

CREATE TABLE `IpAccessControlEvents` (
  `iaceID` int(10) UNSIGNED NOT NULL COMMENT 'The IP Access Control Event identifier',
  `iaceIp` varchar(40) NOT NULL COMMENT 'The IP address associated to this event',
  `iaceDateTime` datetime NOT NULL COMMENT 'The date/time when this event occurred',
  `iaceCategory` int(10) UNSIGNED NOT NULL COMMENT 'The IP Access Control Category identifier',
  `iaceSite` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='List of IP Access Control Events';

-- --------------------------------------------------------

--
-- Table structure for table `IpAccessControlRanges`
--

CREATE TABLE `IpAccessControlRanges` (
  `iacrID` int(10) UNSIGNED NOT NULL COMMENT 'The IP Access Control Range identifier',
  `iacrIpFrom` varchar(40) NOT NULL COMMENT 'The initial IP address of the range',
  `iacrIpTo` varchar(40) NOT NULL COMMENT 'The final IP address of the range',
  `iacrType` int(10) UNSIGNED NOT NULL COMMENT 'The type of this range',
  `iacrExpiration` datetime DEFAULT NULL COMMENT 'The date/time when this range expires (NULL means no expiration)',
  `iacrCategory` int(10) UNSIGNED NOT NULL COMMENT 'The IP Access Control Category identifier',
  `iacrSite` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='List of IP Access Control Ranges';

-- --------------------------------------------------------

--
-- Table structure for table `Jobs`
--

CREATE TABLE `Jobs` (
  `jID` int(10) UNSIGNED NOT NULL,
  `jName` varchar(100) NOT NULL,
  `jDescription` varchar(255) NOT NULL,
  `jDateInstalled` datetime DEFAULT NULL,
  `jDateLastRun` datetime DEFAULT NULL,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `jLastStatusText` longtext DEFAULT NULL,
  `jLastStatusCode` smallint(6) NOT NULL DEFAULT 0,
  `jStatus` varchar(14) NOT NULL DEFAULT 'ENABLED',
  `jHandle` varchar(255) NOT NULL,
  `jNotUninstallable` smallint(6) NOT NULL DEFAULT 0,
  `isScheduled` smallint(6) NOT NULL DEFAULT 0,
  `scheduledInterval` varchar(255) NOT NULL DEFAULT 'days',
  `scheduledValue` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `JobSetJobs`
--

CREATE TABLE `JobSetJobs` (
  `jsID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `jID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `jRunOrder` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `JobSets`
--

CREATE TABLE `JobSets` (
  `jsID` int(10) UNSIGNED NOT NULL,
  `jsName` varchar(128) NOT NULL,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `jDateLastRun` datetime DEFAULT NULL,
  `isScheduled` smallint(6) NOT NULL DEFAULT 0,
  `scheduledInterval` varchar(255) NOT NULL DEFAULT 'days',
  `scheduledValue` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `JobsLog`
--

CREATE TABLE `JobsLog` (
  `jlID` int(10) UNSIGNED NOT NULL,
  `jID` int(10) UNSIGNED NOT NULL,
  `jlMessage` longtext NOT NULL,
  `jlTimestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `jlError` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `LegacyAttributeKeys`
--

CREATE TABLE `LegacyAttributeKeys` (
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Logs`
--

CREATE TABLE `Logs` (
  `logID` int(10) UNSIGNED NOT NULL,
  `channel` varchar(255) DEFAULT NULL,
  `time` int(10) UNSIGNED NOT NULL,
  `message` longtext DEFAULT NULL,
  `cID` int(10) UNSIGNED DEFAULT NULL,
  `uID` int(10) UNSIGNED DEFAULT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MailImporters`
--

CREATE TABLE `MailImporters` (
  `miID` int(10) UNSIGNED NOT NULL,
  `miHandle` varchar(64) NOT NULL,
  `miServer` varchar(255) DEFAULT NULL,
  `miUsername` varchar(255) DEFAULT NULL,
  `miPassword` varchar(255) DEFAULT NULL,
  `miEncryption` varchar(32) DEFAULT NULL,
  `miIsEnabled` tinyint(1) NOT NULL DEFAULT 0,
  `miEmail` varchar(255) DEFAULT NULL,
  `miPort` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pkgID` int(10) UNSIGNED DEFAULT NULL,
  `miConnectionMethod` varchar(8) DEFAULT 'POP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `MailImporters`
--

INSERT INTO `MailImporters` (`miID`, `miHandle`, `miServer`, `miUsername`, `miPassword`, `miEncryption`, `miIsEnabled`, `miEmail`, `miPort`, `pkgID`, `miConnectionMethod`) VALUES
(1, 'private_message', '', NULL, NULL, NULL, 0, '', 0, 0, 'POP');

-- --------------------------------------------------------

--
-- Table structure for table `MailingListExpressSearchIndexAttributes`
--

CREATE TABLE `MailingListExpressSearchIndexAttributes` (
  `exEntryID` int(11) NOT NULL,
  `ak_email_address` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MailValidationHashes`
--

CREATE TABLE `MailValidationHashes` (
  `mvhID` int(10) UNSIGNED NOT NULL,
  `miID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `email` varchar(254) NOT NULL,
  `mHash` varchar(128) NOT NULL,
  `mDateGenerated` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mDateRedeemed` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MessengerBatches`
--

CREATE TABLE `MessengerBatches` (
  `id` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `totalJobs` int(11) NOT NULL,
  `pendingJobs` int(11) NOT NULL,
  `failedJobs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MessengerMessages`
--

CREATE TABLE `MessengerMessages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MessengerProcesses`
--

CREATE TABLE `MessengerProcesses` (
  `id` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `batch_id` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) NOT NULL,
  `dateStarted` int(10) UNSIGNED NOT NULL,
  `dateCompleted` int(10) UNSIGNED DEFAULT NULL,
  `exitCode` int(10) UNSIGNED DEFAULT NULL,
  `exitMessage` longtext DEFAULT NULL,
  `uID` int(10) UNSIGNED DEFAULT NULL,
  `processType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MessengerScheduledTasks`
--

CREATE TABLE `MessengerScheduledTasks` (
  `id` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `task_id` int(10) UNSIGNED DEFAULT NULL,
  `input` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `dateScheduled` int(10) UNSIGNED DEFAULT NULL,
  `cronExpression` longtext NOT NULL,
  `uID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MessengerTaskProcesses`
--

CREATE TABLE `MessengerTaskProcesses` (
  `id` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `task_id` int(10) UNSIGNED DEFAULT NULL,
  `input` longtext DEFAULT NULL COMMENT '(DC2Type:json)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MultilingualPageRelations`
--

CREATE TABLE `MultilingualPageRelations` (
  `mpLocale` varchar(32) NOT NULL,
  `mpLanguage` varchar(32) DEFAULT NULL,
  `mpRelationID` int(10) UNSIGNED NOT NULL,
  `cID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MultilingualTranslations`
--

CREATE TABLE `MultilingualTranslations` (
  `mtID` int(10) UNSIGNED NOT NULL,
  `mtSectionID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `msgid` text NOT NULL,
  `msgidPlural` text DEFAULT NULL,
  `msgstr` text DEFAULT NULL,
  `msgstrPlurals` text DEFAULT NULL,
  `context` text DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `reference` text DEFAULT NULL,
  `flags` text DEFAULT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `NotificationAlerts`
--

CREATE TABLE `NotificationAlerts` (
  `naID` int(10) UNSIGNED NOT NULL,
  `naIsArchived` tinyint(1) NOT NULL,
  `uID` int(10) UNSIGNED DEFAULT NULL,
  `nID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `NotificationPermissionSubscriptionList`
--

CREATE TABLE `NotificationPermissionSubscriptionList` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `peID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `permission` varchar(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `NotificationPermissionSubscriptionListCustom`
--

CREATE TABLE `NotificationPermissionSubscriptionListCustom` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `peID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `nSubscriptionIdentifier` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Notifications`
--

CREATE TABLE `Notifications` (
  `nID` int(10) UNSIGNED NOT NULL,
  `nDate` datetime NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `OAuth2AccessToken`
--

CREATE TABLE `OAuth2AccessToken` (
  `identifier` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `client` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  `expiryDateTime` datetime NOT NULL,
  `userIdentifier` int(10) UNSIGNED DEFAULT NULL,
  `scopes` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `OAuth2AuthCode`
--

CREATE TABLE `OAuth2AuthCode` (
  `identifier` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `client` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  `scopes` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `expiryDateTime` datetime NOT NULL,
  `userIdentifier` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `OAuth2Client`
--

CREATE TABLE `OAuth2Client` (
  `identifier` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) NOT NULL,
  `redirectUri` longtext NOT NULL,
  `clientKey` varchar(255) NOT NULL,
  `clientSecret` varchar(255) NOT NULL,
  `documentationEnabled` tinyint(1) NOT NULL,
  `hasCustomScopes` tinyint(1) NOT NULL,
  `consentType` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `OAuth2ClientScopes`
--

CREATE TABLE `OAuth2ClientScopes` (
  `clientIdentifier` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `scopeIdentifier` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `OAuth2RefreshToken`
--

CREATE TABLE `OAuth2RefreshToken` (
  `identifier` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `expiryDateTime` datetime NOT NULL,
  `accessToken` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `OAuth2Scope`
--

CREATE TABLE `OAuth2Scope` (
  `identifier` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `OAuth2Scope`
--

INSERT INTO `OAuth2Scope` (`identifier`, `description`) VALUES
('account:read', 'Read your user object'),
('blocks:delete', 'Delete blocks'),
('blocks:read', 'View site blocks'),
('blocks:update', 'Update blocks'),
('calendar_events:read', 'Read calendar events'),
('calendars:read', 'Read calendars'),
('files:add', 'Add files'),
('files:delete', 'Delete files'),
('files:read', 'Read files as your user'),
('files:update', 'Update files'),
('groups:add', 'Add groups'),
('groups:read', 'Views groups in the site'),
('openid', 'Remotely authenticate into Concrete'),
('pages:add', 'Add pages'),
('pages:areas:add_block', 'Add blocks to a page area'),
('pages:areas:delete_block', 'Delete blocks from a page area'),
('pages:areas:update_block', 'Updates a block in a page area'),
('pages:delete', 'Delete pages'),
('pages:read', 'View site pages'),
('pages:update', 'Update pages'),
('pages:versions:delete', 'Delete page versions'),
('pages:versions:read', 'View page versions'),
('pages:versions:update', 'Update page versions'),
('sites:read', 'Read sites'),
('system:info:read', 'Read system information'),
('users:add', 'Add users'),
('users:delete', 'Delete users'),
('users:read', 'Views users in the site'),
('users:update', 'Update users');

-- --------------------------------------------------------

--
-- Table structure for table `OAuthServerAccessTokens`
--

CREATE TABLE `OAuthServerAccessTokens` (
  `access_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `expires` timestamp NOT NULL,
  `scope` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `OAuthServerAuthorizationCodes`
--

CREATE TABLE `OAuthServerAuthorizationCodes` (
  `access_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `expires` timestamp NOT NULL,
  `scope` varchar(4000) DEFAULT NULL,
  `id_token` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `OAuthServerClients`
--

CREATE TABLE `OAuthServerClients` (
  `client_id` varchar(80) NOT NULL,
  `client_secret` varchar(80) NOT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `grant_types` varchar(80) DEFAULT NULL,
  `scope` varchar(4000) DEFAULT NULL,
  `user_id` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `OAuthServerJti`
--

CREATE TABLE `OAuthServerJti` (
  `issuer` varchar(80) NOT NULL,
  `subject` varchar(80) DEFAULT NULL,
  `audiance` varchar(80) DEFAULT NULL,
  `expires` timestamp NOT NULL,
  `jti` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `OAuthServerJwt`
--

CREATE TABLE `OAuthServerJwt` (
  `client_id` varchar(80) NOT NULL,
  `subject` varchar(80) DEFAULT NULL,
  `public_key` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `OAuthServerPublicKeys`
--

CREATE TABLE `OAuthServerPublicKeys` (
  `client_id` varchar(80) NOT NULL,
  `public_key` varchar(2000) DEFAULT NULL,
  `private_key` varchar(2000) DEFAULT NULL,
  `encryption_algorithm` varchar(100) DEFAULT 'RS256'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `OAuthServerRefreshTokens`
--

CREATE TABLE `OAuthServerRefreshTokens` (
  `refresh_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `expires` timestamp NOT NULL,
  `scope` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `OAuthServerScopes`
--

CREATE TABLE `OAuthServerScopes` (
  `scope` varchar(80) NOT NULL,
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `OAuthServerUsers`
--

CREATE TABLE `OAuthServerUsers` (
  `username` varchar(80) DEFAULT NULL,
  `password` varchar(80) DEFAULT NULL,
  `first_name` varchar(80) DEFAULT NULL,
  `last_name` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `email_verified` tinyint(1) DEFAULT NULL,
  `scope` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `OauthUserMap`
--

CREATE TABLE `OauthUserMap` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `binding` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Packages`
--

CREATE TABLE `Packages` (
  `pkgID` int(10) UNSIGNED NOT NULL,
  `pkgHandle` varchar(255) NOT NULL,
  `pkgVersion` varchar(255) NOT NULL,
  `pkgIsInstalled` tinyint(1) NOT NULL,
  `pkgAvailableVersion` varchar(255) DEFAULT NULL,
  `pkgDescription` longtext NOT NULL,
  `pkgDateInstalled` datetime NOT NULL,
  `pkgName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PageContainerInstanceAreas`
--

CREATE TABLE `PageContainerInstanceAreas` (
  `containerInstanceAreaID` int(11) NOT NULL,
  `arID` int(11) NOT NULL,
  `containerAreaName` varchar(255) NOT NULL,
  `containerInstanceID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PageContainerInstanceAreas`
--

INSERT INTO `PageContainerInstanceAreas` (`containerInstanceAreaID`, `arID`, `containerAreaName`, `containerInstanceID`) VALUES
(1, 27, 'Title', 1),
(2, 28, 'Body', 1),
(3, 35, 'Column 1', 2),
(4, 36, 'Column 2', 2),
(5, 40, 'Column 1', 3),
(6, 41, 'Column 2', 3),
(7, 42, 'Title', 4),
(8, 43, 'Body', 4),
(9, 45, 'Column 1', 5),
(10, 46, 'Column 2', 5),
(11, 47, 'Item 1', 6),
(12, 48, 'Item 2', 6),
(13, 49, 'Item 3', 6),
(14, 50, 'Item 4', 6),
(15, 51, 'Item 5', 6),
(16, 52, 'Item 6', 6),
(17, 53, 'Column 1', 7),
(18, 54, 'Column 2', 7),
(19, 55, 'Column 1', 8),
(20, 56, 'Column 2', 8),
(21, 57, 'Item 1', 9),
(22, 58, 'Item 2', 9),
(23, 59, 'Item 3', 9),
(24, 60, 'Item 4', 9),
(25, 61, 'Item 5', 9),
(26, 62, 'Item 6', 9),
(27, 65, 'Title', 10),
(28, 66, 'Body', 10),
(29, 67, 'Item 1', 11),
(30, 68, 'Item 2', 11),
(31, 69, 'Item 3', 11),
(32, 70, 'Item 4', 11),
(33, 73, 'Item 1', 12),
(34, 74, 'Item 2', 12),
(35, 75, 'Item 3', 12),
(36, 76, 'Item 4', 12),
(37, 77, 'Item 5', 12),
(38, 78, 'Item 6', 12),
(39, 82, 'Title', 13),
(40, 83, 'Body', 13);

-- --------------------------------------------------------

--
-- Table structure for table `PageContainerInstances`
--

CREATE TABLE `PageContainerInstances` (
  `containerInstanceID` int(11) NOT NULL,
  `containerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PageContainerInstances`
--

INSERT INTO `PageContainerInstances` (`containerInstanceID`, `containerID`) VALUES
(1, 1),
(4, 1),
(10, 1),
(13, 1),
(2, 2),
(3, 2),
(5, 2),
(7, 2),
(8, 3),
(11, 4),
(6, 5),
(9, 5),
(12, 5);

-- --------------------------------------------------------

--
-- Table structure for table `PageContainers`
--

CREATE TABLE `PageContainers` (
  `containerID` int(11) NOT NULL,
  `containerHandle` varchar(255) NOT NULL,
  `containerIcon` varchar(255) NOT NULL,
  `containerName` varchar(255) NOT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PageContainers`
--

INSERT INTO `PageContainers` (`containerID`, `containerHandle`, `containerIcon`, `containerName`, `pkgID`) VALUES
(1, 'light_stripe', 'full.png', 'Highlight Stripe', NULL),
(2, 'two_column_light', 'two_column.png', 'Two Column Highlight', NULL),
(3, 'two_column_condensed', 'two_column.png', 'Two Column Condensed', NULL),
(4, 'grid_four', 'blank.png', 'Responsive Grid of Four', NULL),
(5, 'grid_six', 'blank.png', 'Responsive Grid of Six', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PageFeeds`
--

CREATE TABLE `PageFeeds` (
  `checkPagePermissions` tinyint(1) NOT NULL,
  `customTopicAttributeKeyHandle` varchar(255) DEFAULT NULL,
  `customTopicTreeNodeID` int(10) UNSIGNED NOT NULL,
  `iconFID` int(10) UNSIGNED NOT NULL,
  `pfDescription` varchar(255) NOT NULL,
  `pfHandle` varchar(255) NOT NULL,
  `pfTitle` varchar(255) NOT NULL,
  `pfID` int(10) UNSIGNED NOT NULL,
  `cParentID` int(10) UNSIGNED NOT NULL,
  `ptID` int(10) UNSIGNED NOT NULL,
  `pfIncludeAllDescendents` tinyint(1) NOT NULL,
  `pfDisplayAliases` tinyint(1) NOT NULL,
  `pfDisplaySystemPages` tinyint(1) NOT NULL,
  `pfContentToDisplay` varchar(255) NOT NULL,
  `pfAreaHandleToDisplay` varchar(255) DEFAULT NULL,
  `pfDisplayFeaturedOnly` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PageFeeds`
--

INSERT INTO `PageFeeds` (`checkPagePermissions`, `customTopicAttributeKeyHandle`, `customTopicTreeNodeID`, `iconFID`, `pfDescription`, `pfHandle`, `pfTitle`, `pfID`, `cParentID`, `ptID`, `pfIncludeAllDescendents`, `pfDisplayAliases`, `pfDisplaySystemPages`, `pfContentToDisplay`, `pfAreaHandleToDisplay`, `pfDisplayFeaturedOnly`) VALUES
(1, NULL, 0, 0, 'Site Blog', 'blog', 'Blog', 1, 249, 7, 0, 0, 0, 'S', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `PagePaths`
--

CREATE TABLE `PagePaths` (
  `cPath` longtext NOT NULL,
  `ppID` int(11) NOT NULL,
  `cID` int(10) UNSIGNED NOT NULL,
  `ppIsCanonical` tinyint(1) NOT NULL,
  `ppGeneratedFromURLSlugs` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PagePaths`
--

INSERT INTO `PagePaths` (`cPath`, `ppID`, `cID`, `ppIsCanonical`, `ppGeneratedFromURLSlugs`) VALUES
('/dashboard', 1, 2, 1, 1),
('/dashboard/sitemap', 2, 3, 1, 1),
('/dashboard/sitemap/full', 3, 4, 1, 1),
('/dashboard/sitemap/explore', 4, 5, 1, 1),
('/dashboard/sitemap/search', 5, 6, 1, 1),
('/dashboard/files', 6, 7, 1, 1),
('/dashboard/files/search', 7, 8, 1, 1),
('/dashboard/files/details', 8, 9, 1, 1),
('/dashboard/files/attributes', 9, 10, 1, 1),
('/dashboard/files/sets', 10, 11, 1, 1),
('/dashboard/files/add_set', 11, 12, 1, 1),
('/dashboard/users', 12, 13, 1, 1),
('/dashboard/users/search', 13, 14, 1, 1),
('/dashboard/users/groups', 14, 15, 1, 1),
('/dashboard/users/group_types', 15, 16, 1, 1),
('/dashboard/users/groups/message', 16, 17, 1, 1),
('/dashboard/users/attributes', 17, 18, 1, 1),
('/dashboard/users/add', 18, 19, 1, 1),
('/dashboard/users/add_group', 19, 20, 1, 1),
('/dashboard/users/groups/bulkupdate', 20, 21, 1, 1),
('/dashboard/users/groups/bulk_user_assignment', 21, 22, 1, 1),
('/dashboard/users/group_sets', 22, 23, 1, 1),
('/dashboard/express', 23, 24, 1, 1),
('/dashboard/express/entries', 24, 25, 1, 1),
('/dashboard/boards', 25, 26, 1, 1),
('/dashboard/boards/boards', 26, 27, 1, 1),
('/dashboard/boards/add', 27, 28, 1, 1),
('/dashboard/boards/details', 28, 29, 1, 1),
('/dashboard/boards/edit', 29, 30, 1, 1),
('/dashboard/boards/data_sources', 30, 31, 1, 1),
('/dashboard/boards/appearance', 31, 32, 1, 1),
('/dashboard/boards/weighting', 32, 33, 1, 1),
('/dashboard/boards/permissions', 33, 34, 1, 1),
('/dashboard/boards/instances', 34, 35, 1, 1),
('/dashboard/boards/instances/details', 35, 36, 1, 1),
('/dashboard/boards/instances/rules', 36, 37, 1, 1),
('/dashboard/boards/designer', 37, 38, 1, 1),
('/dashboard/boards/designer/choose_items', 38, 39, 1, 1),
('/dashboard/boards/designer/customize_slot', 39, 40, 1, 1),
('/dashboard/boards/scheduler', 40, 41, 1, 1),
('/dashboard/reports', 41, 42, 1, 1),
('/dashboard/reports/forms', 42, 43, 1, 1),
('/dashboard/reports/forms/legacy', 43, 44, 1, 1),
('/dashboard/reports/health', 44, 45, 1, 1),
('/dashboard/reports/health/details', 45, 46, 1, 1),
('/dashboard/reports/surveys', 46, 47, 1, 1),
('/dashboard/reports/logs', 47, 48, 1, 1),
('/dashboard/reports/page_changes', 48, 49, 1, 1),
('/dashboard/pages', 49, 50, 1, 1),
('/dashboard/pages/themes', 50, 51, 1, 1),
('/dashboard/pages/themes/inspect', 51, 52, 1, 1),
('/dashboard/pages/types', 52, 53, 1, 1),
('/dashboard/pages/types/organize', 53, 54, 1, 1),
('/dashboard/pages/types/add', 54, 55, 1, 1),
('/dashboard/pages/types/form', 55, 56, 1, 1),
('/dashboard/pages/types/output', 56, 57, 1, 1),
('/dashboard/pages/types/attributes', 57, 58, 1, 1),
('/dashboard/pages/types/permissions', 58, 59, 1, 1),
('/dashboard/pages/templates', 59, 60, 1, 1),
('/dashboard/pages/templates/add', 60, 61, 1, 1),
('/dashboard/pages/containers', 61, 62, 1, 1),
('/dashboard/pages/containers/add', 62, 63, 1, 1),
('/dashboard/pages/attributes', 63, 64, 1, 1),
('/dashboard/pages/single', 64, 65, 1, 1),
('/dashboard/pages/feeds', 65, 66, 1, 1),
('/dashboard/calendar', 66, 67, 1, 1),
('/dashboard/calendar/events', 67, 68, 1, 1),
('/dashboard/calendar/event_list', 68, 69, 1, 1),
('/dashboard/calendar/add', 69, 70, 1, 1),
('/dashboard/calendar/permissions', 70, 71, 1, 1),
('/dashboard/calendar/attributes', 71, 72, 1, 1),
('/dashboard/conversations', 72, 73, 1, 1),
('/dashboard/conversations/messages', 73, 74, 1, 1),
('/dashboard/blocks', 74, 75, 1, 1),
('/dashboard/blocks/stacks', 75, 76, 1, 1),
('/dashboard/blocks/permissions', 76, 77, 1, 1),
('/dashboard/blocks/stacks/list', 77, 78, 1, 1),
('/dashboard/blocks/types', 78, 79, 1, 1),
('/dashboard/extend', 79, 80, 1, 1),
('/dashboard/extend/install', 80, 81, 1, 1),
('/dashboard/extend/update', 81, 82, 1, 1),
('/dashboard/extend/themes', 82, 83, 1, 1),
('/dashboard/extend/addons', 83, 84, 1, 1),
('/dashboard/system', 84, 85, 1, 1),
('/dashboard/system/basics', 85, 86, 1, 1),
('/dashboard/system/basics/name', 86, 87, 1, 1),
('/dashboard/system/basics/marketplace', 87, 88, 1, 1),
('/dashboard/system/basics/production_mode', 88, 89, 1, 1),
('/dashboard/system/basics/appearance', 89, 90, 1, 1),
('/dashboard/system/basics/site_information', 90, 91, 1, 1),
('/dashboard/system/basics/icons', 91, 92, 1, 1),
('/dashboard/system/basics/editor', 92, 93, 1, 1),
('/dashboard/system/basics/multilingual', 93, 94, 1, 1),
('/dashboard/system/basics/multilingual/update', 94, 95, 1, 1),
('/dashboard/system/basics/timezone', 95, 96, 1, 1),
('/dashboard/system/basics/attributes', 96, 97, 1, 1),
('/dashboard/system/basics/reset_edit_mode', 97, 98, 1, 1),
('/dashboard/system/social', 98, 99, 1, 1),
('/dashboard/system/social/social_links', 99, 100, 1, 1),
('/dashboard/system/social/opengraph', 100, 101, 1, 1),
('/dashboard/system/express', 101, 102, 1, 1),
('/dashboard/system/express/entities', 102, 103, 1, 1),
('/dashboard/system/express/entities/attributes', 103, 104, 1, 1),
('/dashboard/system/express/entities/associations', 104, 105, 1, 1),
('/dashboard/system/express/entities/forms', 105, 106, 1, 1),
('/dashboard/system/express/entities/customize_search', 106, 107, 1, 1),
('/dashboard/system/express/entities/order_entries', 107, 108, 1, 1),
('/dashboard/system/express/entries', 108, 109, 1, 1),
('/dashboard/system/multisite', 109, 110, 1, 1),
('/dashboard/system/multisite/sites', 110, 111, 1, 1),
('/dashboard/system/multisite/types', 111, 112, 1, 1),
('/dashboard/system/multisite/settings', 112, 113, 1, 1),
('/dashboard/system/multilingual', 113, 114, 1, 1),
('/dashboard/system/multilingual/setup', 114, 115, 1, 1),
('/dashboard/system/multilingual/copy', 115, 116, 1, 1),
('/dashboard/system/multilingual/page_report', 116, 117, 1, 1),
('/dashboard/system/multilingual/translate_interface', 117, 118, 1, 1),
('/dashboard/system/seo', 118, 119, 1, 1),
('/dashboard/system/seo/urls', 119, 120, 1, 1),
('/dashboard/system/seo/bulk', 120, 121, 1, 1),
('/dashboard/system/seo/codes', 121, 122, 1, 1),
('/dashboard/system/seo/excluded', 122, 123, 1, 1),
('/dashboard/system/seo/searchindex', 123, 124, 1, 1),
('/dashboard/system/seo/url_slug', 124, 125, 1, 1),
('/dashboard/system/files', 125, 126, 1, 1),
('/dashboard/system/files/filetypes', 126, 127, 1, 1),
('/dashboard/system/files/file_chooser', 127, 128, 1, 1),
('/dashboard/system/files/permissions', 128, 129, 1, 1),
('/dashboard/system/files/thumbnails', 129, 130, 1, 1),
('/dashboard/system/files/thumbnails/options', 130, 131, 1, 1),
('/dashboard/system/files/image_uploading', 131, 132, 1, 1),
('/dashboard/system/files/image_editor', 132, 133, 1, 1),
('/dashboard/system/files/storage', 133, 134, 1, 1),
('/dashboard/system/files/external_file_provider', 134, 135, 1, 1),
('/dashboard/system/files/export_options', 135, 136, 1, 1),
('/dashboard/system/files/uploads', 136, 137, 1, 1),
('/dashboard/system/automation', 137, 138, 1, 1),
('/dashboard/system/automation/tasks', 138, 139, 1, 1),
('/dashboard/system/automation/activity', 139, 140, 1, 1),
('/dashboard/system/automation/failed', 140, 141, 1, 1),
('/dashboard/system/automation/schedule', 141, 142, 1, 1),
('/dashboard/system/automation/settings', 142, 143, 1, 1),
('/dashboard/system/notification', 143, 144, 1, 1),
('/dashboard/system/notification/events', 144, 145, 1, 1),
('/dashboard/system/notification/alerts', 145, 146, 1, 1),
('/dashboard/system/optimization', 146, 147, 1, 1),
('/dashboard/system/optimization/cache', 147, 148, 1, 1),
('/dashboard/system/optimization/clearcache', 148, 149, 1, 1),
('/dashboard/system/optimization/jobs', 149, 150, 1, 1),
('/dashboard/system/permissions', 150, 151, 1, 1),
('/dashboard/system/permissions/site', 151, 152, 1, 1),
('/dashboard/system/permissions/tasks', 152, 153, 1, 1),
('/dashboard/system/permissions/users', 153, 154, 1, 1),
('/dashboard/system/permissions/advanced', 154, 155, 1, 1),
('/dashboard/system/permissions/workflows', 155, 156, 1, 1),
('/dashboard/system/permissions/denylist', 156, 157, 1, 1),
('/dashboard/system/permissions/denylist/configure', 157, 158, 1, 1),
('/dashboard/system/permissions/denylist/range', 158, 159, 1, 1),
('/dashboard/system/permissions/captcha', 159, 160, 1, 1),
('/dashboard/system/permissions/antispam', 160, 161, 1, 1),
('/dashboard/system/permissions/maintenance', 161, 162, 1, 1),
('/dashboard/system/permissions/trusted_proxies', 162, 163, 1, 1),
('/dashboard/system/registration', 163, 164, 1, 1),
('/dashboard/system/registration/open', 164, 165, 1, 1),
('/dashboard/system/registration/postlogin', 165, 166, 1, 1),
('/dashboard/system/registration/profiles', 166, 167, 1, 1),
('/dashboard/system/registration/authentication', 167, 168, 1, 1),
('/dashboard/system/registration/global_password_reset', 168, 169, 1, 1),
('/dashboard/system/registration/deactivation', 169, 170, 1, 1),
('/dashboard/system/registration/automated_logout', 170, 171, 1, 1),
('/dashboard/system/registration/password_requirements', 171, 172, 1, 1),
('/dashboard/system/registration/session_options', 172, 173, 1, 1),
('/dashboard/system/mail', 173, 174, 1, 1),
('/dashboard/system/mail/method', 174, 175, 1, 1),
('/dashboard/system/mail/method/test', 175, 176, 1, 1),
('/dashboard/system/mail/importers', 176, 177, 1, 1),
('/dashboard/system/mail/addresses', 177, 178, 1, 1),
('/dashboard/system/mail/logging', 178, 179, 1, 1),
('/dashboard/system/calendar', 179, 180, 1, 1),
('/dashboard/system/calendar/settings', 180, 181, 1, 1),
('/dashboard/system/calendar/colors', 181, 182, 1, 1),
('/dashboard/system/calendar/permissions', 182, 183, 1, 1),
('/dashboard/system/calendar/import', 183, 184, 1, 1),
('/dashboard/system/boards', 184, 185, 1, 1),
('/dashboard/system/boards/settings', 185, 186, 1, 1),
('/dashboard/system/boards/permissions', 186, 187, 1, 1),
('/dashboard/system/boards/summary_templates', 187, 188, 1, 1),
('/dashboard/system/conversations', 188, 189, 1, 1),
('/dashboard/system/conversations/settings', 189, 190, 1, 1),
('/dashboard/system/conversations/points', 190, 191, 1, 1),
('/dashboard/system/conversations/bannedwords', 191, 192, 1, 1),
('/dashboard/system/conversations/permissions', 192, 193, 1, 1),
('/dashboard/system/attributes', 193, 194, 1, 1),
('/dashboard/system/attributes/types', 194, 195, 1, 1),
('/dashboard/system/attributes/sets', 195, 196, 1, 1),
('/dashboard/system/attributes/topics', 196, 197, 1, 1),
('/dashboard/system/attributes/topics/add', 197, 198, 1, 1),
('/dashboard/system/environment', 198, 199, 1, 1),
('/dashboard/system/environment/info', 199, 200, 1, 1),
('/dashboard/system/environment/errors', 200, 201, 1, 1),
('/dashboard/system/environment/logging', 201, 202, 1, 1),
('/dashboard/system/environment/proxy', 202, 203, 1, 1),
('/dashboard/system/environment/entities', 203, 204, 1, 1),
('/dashboard/system/environment/database_charset', 204, 205, 1, 1),
('/dashboard/system/environment/geolocation', 205, 206, 1, 1),
('/dashboard/system/environment/security', 206, 207, 1, 1),
('/dashboard/system/update', 207, 208, 1, 1),
('/dashboard/system/update/update', 208, 209, 1, 1),
('/dashboard/system/api', 209, 210, 1, 1),
('/dashboard/system/api/integrations', 210, 211, 1, 1),
('/dashboard/system/api/scopes', 211, 212, 1, 1),
('/dashboard/system/api/settings', 212, 213, 1, 1),
('/dashboard/welcome', 213, 214, 1, 1),
('/dashboard/welcome/health', 214, 215, 1, 1),
('/dashboard/welcome/me', 215, 216, 1, 1),
('/!themes', 216, 217, 1, 1),
('/!stacks', 217, 218, 1, 1),
('/page_not_found', 218, 219, 1, 1),
('/!trash', 219, 220, 1, 1),
('/login', 220, 221, 1, 1),
('/register', 221, 222, 1, 1),
('/account', 222, 223, 1, 1),
('/account/edit_profile', 223, 224, 1, 1),
('/account/avatar', 224, 225, 1, 1),
('/account/messages', 225, 226, 1, 1),
('/page_forbidden', 226, 227, 1, 1),
('/download_file', 227, 228, 1, 1),
('/!drafts', 228, 229, 1, 1),
('/account/welcome', 229, 230, 1, 0),
('/!stacks/navigation', 230, 231, 1, 1),
('/!stacks/footer-column-1', 231, 232, 1, 1),
('/!stacks/footer-column-2', 232, 233, 1, 1),
('/!stacks/footer-column-3', 233, 234, 1, 1),
('/!stacks/footer-column-4', 234, 235, 1, 1),
('/!stacks/blog-sidebar', 235, 236, 1, 1),
('/!stacks/blog-sidebar/blog-sidebar', 236, 237, 1, 1),
('/about', 237, 239, 1, 1),
('/resources', 238, 240, 1, 1),
('/documents', 239, 241, 1, 1),
('/subscribe-thanks', 240, 242, 1, 1),
('/search', 241, 243, 1, 1),
('/blog-search', 242, 244, 1, 1),
('/privacy-policy', 243, 246, 1, 1),
('/about/services', 244, 247, 1, 1),
('/about/blog', 245, 249, 1, 1),
('/about/faq', 246, 250, 1, 1),
('/about/contact', 247, 251, 1, 1),
('/resources/resource-one', 248, 253, 1, 1),
('/resources/resource-two', 249, 254, 1, 1),
('/resources/resource-three', 250, 255, 1, 1),
('/resources/resource-four', 251, 256, 1, 1),
('/resources/resource-five', 252, 257, 1, 1),
('/resources/resource-six', 253, 258, 1, 1),
('/about/blog/tips-build-beautiful-blog', 254, 260, 1, 1),
('/about/blog/new-product-launch', 255, 261, 1, 1),
('/about/blog/more-fine-posts-here', 256, 262, 1, 1),
('/about/blog/heres-tip-you-might-not-know', 257, 263, 1, 1),
('/about/blog/freshen-up-your-website', 258, 264, 1, 1),
('/about/blog/meet-our-new-hires', 259, 265, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `PagePermissionAssignments`
--

CREATE TABLE `PagePermissionAssignments` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pkID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PagePermissionAssignments`
--

INSERT INTO `PagePermissionAssignments` (`cID`, `pkID`, `paID`) VALUES
(1, 1, 106),
(1, 2, 107),
(1, 3, 108),
(1, 4, 109),
(1, 5, 110),
(1, 6, 111),
(1, 7, 112),
(1, 8, 114),
(1, 9, 115),
(1, 10, 116),
(1, 11, 117),
(1, 12, 118),
(1, 13, 119),
(1, 14, 120),
(1, 15, 121),
(1, 16, 122),
(1, 17, 123),
(1, 18, 113),
(2, 1, 87),
(219, 1, 86),
(221, 1, 83),
(222, 1, 84),
(227, 1, 85),
(229, 1, 88),
(229, 2, 89),
(229, 3, 90),
(229, 4, 91),
(229, 5, 92),
(229, 6, 93),
(229, 7, 94),
(229, 8, 96),
(229, 9, 97),
(229, 10, 98),
(229, 11, 99),
(229, 12, 100),
(229, 13, 101),
(229, 14, 102),
(229, 15, 103),
(229, 16, 104),
(229, 17, 105),
(229, 18, 95);

-- --------------------------------------------------------

--
-- Table structure for table `PagePermissionPageTypeAccessList`
--

CREATE TABLE `PagePermissionPageTypeAccessList` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `peID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `permission` varchar(1) NOT NULL DEFAULT '1',
  `externalLink` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PagePermissionPageTypeAccessListCustom`
--

CREATE TABLE `PagePermissionPageTypeAccessListCustom` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `peID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ptID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PagePermissionPropertyAccessList`
--

CREATE TABLE `PagePermissionPropertyAccessList` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `peID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` tinyint(1) DEFAULT 0,
  `publicDateTime` tinyint(1) DEFAULT 0,
  `uID` tinyint(1) DEFAULT 0,
  `description` tinyint(1) DEFAULT 0,
  `paths` tinyint(1) DEFAULT 0,
  `attributePermission` varchar(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PagePermissionPropertyAttributeAccessListCustom`
--

CREATE TABLE `PagePermissionPropertyAttributeAccessListCustom` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `peID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `akID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PagePermissionThemeAccessList`
--

CREATE TABLE `PagePermissionThemeAccessList` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `peID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `permission` varchar(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PagePermissionThemeAccessListCustom`
--

CREATE TABLE `PagePermissionThemeAccessListCustom` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `peID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pThemeID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Pages`
--

CREATE TABLE `Pages` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `siteTreeID` int(10) UNSIGNED DEFAULT 0,
  `ptID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cIsTemplate` tinyint(1) NOT NULL DEFAULT 0,
  `uID` int(10) UNSIGNED DEFAULT NULL,
  `cIsCheckedOut` tinyint(1) NOT NULL DEFAULT 0,
  `cCheckedOutUID` int(10) UNSIGNED DEFAULT NULL,
  `cCheckedOutDatetime` datetime DEFAULT NULL,
  `cCheckedOutDatetimeLastEdit` datetime DEFAULT NULL,
  `cOverrideTemplatePermissions` tinyint(1) NOT NULL DEFAULT 1,
  `cInheritPermissionsFromCID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cInheritPermissionsFrom` varchar(8) NOT NULL DEFAULT 'PARENT',
  `cFilename` varchar(255) DEFAULT NULL,
  `cPointerID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cPointerExternalLink` longtext DEFAULT NULL,
  `cPointerExternalLinkNewWindow` tinyint(1) NOT NULL DEFAULT 0,
  `cIsActive` tinyint(1) NOT NULL DEFAULT 1,
  `cChildren` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cDisplayOrder` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cParentID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cDraftTargetParentPageID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cIsDraft` tinyint(1) NOT NULL DEFAULT 0,
  `cCacheFullPageContent` smallint(6) NOT NULL DEFAULT -1,
  `cCacheFullPageContentOverrideLifetime` varchar(32) NOT NULL DEFAULT '0',
  `cCacheFullPageContentLifetimeCustom` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cIsSystemPage` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Pages`
--

INSERT INTO `Pages` (`cID`, `siteTreeID`, `ptID`, `cIsTemplate`, `uID`, `cIsCheckedOut`, `cCheckedOutUID`, `cCheckedOutDatetime`, `cCheckedOutDatetimeLastEdit`, `cOverrideTemplatePermissions`, `cInheritPermissionsFromCID`, `cInheritPermissionsFrom`, `cFilename`, `cPointerID`, `cPointerExternalLink`, `cPointerExternalLinkNewWindow`, `cIsActive`, `cChildren`, `cDisplayOrder`, `cParentID`, `pkgID`, `cDraftTargetParentPageID`, `cIsDraft`, `cCacheFullPageContent`, `cCacheFullPageContentOverrideLifetime`, `cCacheFullPageContentLifetimeCustom`, `cIsSystemPage`) VALUES
(1, 1, 6, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'OVERRIDE', NULL, 0, NULL, 0, 1, 19, 0, 0, 0, 0, 0, -1, '0', 0, 0),
(2, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'OVERRIDE', '/dashboard/view.php', 0, NULL, 0, 1, 13, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(3, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/sitemap/view.php', 0, NULL, 0, 1, 3, 1, 2, 0, 0, 0, -1, '0', 0, 1),
(4, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/sitemap/full.php', 0, NULL, 0, 1, 0, 0, 3, 0, 0, 0, -1, '0', 0, 1),
(5, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/sitemap/explore.php', 0, NULL, 0, 1, 0, 1, 3, 0, 0, 0, -1, '0', 0, 1),
(6, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/sitemap/search.php', 0, NULL, 0, 1, 0, 2, 3, 0, 0, 0, -1, '0', 0, 1),
(7, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/view.php', 0, NULL, 0, 1, 5, 2, 2, 0, 0, 0, -1, '0', 0, 1),
(8, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/search.php', 0, NULL, 0, 1, 0, 0, 7, 0, 0, 0, -1, '0', 0, 1),
(9, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/details.php', 0, NULL, 0, 1, 0, 1, 7, 0, 0, 0, -1, '0', 0, 1),
(10, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/attributes.php', 0, NULL, 0, 1, 0, 2, 7, 0, 0, 0, -1, '0', 0, 1),
(11, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/sets.php', 0, NULL, 0, 1, 0, 3, 7, 0, 0, 0, -1, '0', 0, 1),
(12, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/add_set.php', 0, NULL, 0, 1, 0, 4, 7, 0, 0, 0, -1, '0', 0, 1),
(13, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/view.php', 0, NULL, 0, 1, 7, 3, 2, 0, 0, 0, -1, '0', 0, 1),
(14, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/search.php', 0, NULL, 0, 1, 0, 0, 13, 0, 0, 0, -1, '0', 0, 1),
(15, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/groups.php', 0, NULL, 0, 1, 3, 1, 13, 0, 0, 0, -1, '0', 0, 1),
(16, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/group_types.php', 0, NULL, 0, 1, 0, 2, 13, 0, 0, 0, -1, '0', 0, 1),
(17, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/groups/message.php', 0, NULL, 0, 1, 0, 0, 15, 0, 0, 0, -1, '0', 0, 1),
(18, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/attributes.php', 0, NULL, 0, 1, 0, 3, 13, 0, 0, 0, -1, '0', 0, 1),
(19, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/add.php', 0, NULL, 0, 1, 0, 4, 13, 0, 0, 0, -1, '0', 0, 1),
(20, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/add_group.php', 0, NULL, 0, 1, 0, 5, 13, 0, 0, 0, -1, '0', 0, 1),
(21, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/groups/bulkupdate.php', 0, NULL, 0, 1, 0, 1, 15, 0, 0, 0, -1, '0', 0, 1),
(22, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/groups/bulk_user_assignment.php', 0, NULL, 0, 1, 0, 2, 15, 0, 0, 0, -1, '0', 0, 1),
(23, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/group_sets.php', 0, NULL, 0, 1, 0, 6, 13, 0, 0, 0, -1, '0', 0, 1),
(24, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/express/view.php', 0, NULL, 0, 1, 1, 4, 2, 0, 0, 0, -1, '0', 0, 1),
(25, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/express/entries.php', 0, NULL, 0, 1, 0, 0, 24, 0, 0, 0, -1, '0', 0, 1),
(26, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/boards.php', 0, NULL, 0, 1, 11, 5, 2, 0, 0, 0, -1, '0', 0, 1),
(27, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/boards/boards.php', 0, NULL, 0, 1, 0, 0, 26, 0, 0, 0, -1, '0', 0, 1),
(28, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/boards/add.php', 0, NULL, 0, 1, 0, 1, 26, 0, 0, 0, -1, '0', 0, 1),
(29, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/boards/details.php', 0, NULL, 0, 1, 0, 2, 26, 0, 0, 0, -1, '0', 0, 1),
(30, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/boards/edit.php', 0, NULL, 0, 1, 0, 3, 26, 0, 0, 0, -1, '0', 0, 1),
(31, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/boards/data_sources.php', 0, NULL, 0, 1, 0, 4, 26, 0, 0, 0, -1, '0', 0, 1),
(32, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/boards/appearance.php', 0, NULL, 0, 1, 0, 5, 26, 0, 0, 0, -1, '0', 0, 1),
(33, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/boards/weighting.php', 0, NULL, 0, 1, 0, 6, 26, 0, 0, 0, -1, '0', 0, 1),
(34, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/boards/permissions.php', 0, NULL, 0, 1, 0, 7, 26, 0, 0, 0, -1, '0', 0, 1),
(35, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/boards/instances.php', 0, NULL, 0, 1, 2, 8, 26, 0, 0, 0, -1, '0', 0, 1),
(36, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/boards/instances/details.php', 0, NULL, 0, 1, 0, 0, 35, 0, 0, 0, -1, '0', 0, 1),
(37, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/boards/instances/rules.php', 0, NULL, 0, 1, 0, 1, 35, 0, 0, 0, -1, '0', 0, 1),
(38, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/boards/designer.php', 0, NULL, 0, 1, 2, 9, 26, 0, 0, 0, -1, '0', 0, 1),
(39, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/boards/designer/choose_items.php', 0, NULL, 0, 1, 0, 0, 38, 0, 0, 0, -1, '0', 0, 1),
(40, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/boards/designer/customize_slot.php', 0, NULL, 0, 1, 0, 1, 38, 0, 0, 0, -1, '0', 0, 1),
(41, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/boards/scheduler.php', 0, NULL, 0, 1, 0, 10, 26, 0, 0, 0, -1, '0', 0, 1),
(42, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports.php', 0, NULL, 0, 1, 5, 6, 2, 0, 0, 0, -1, '0', 0, 1),
(43, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports/forms.php', 0, NULL, 0, 1, 1, 0, 42, 0, 0, 0, -1, '0', 0, 1),
(44, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports/forms/legacy.php', 0, NULL, 0, 1, 0, 0, 43, 0, 0, 0, -1, '0', 0, 1),
(45, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports/health.php', 0, NULL, 0, 1, 1, 1, 42, 0, 0, 0, -1, '0', 0, 1),
(46, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports/health/details.php', 0, NULL, 0, 1, 0, 0, 45, 0, 0, 0, -1, '0', 0, 1),
(47, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports/surveys.php', 0, NULL, 0, 1, 0, 2, 42, 0, 0, 0, -1, '0', 0, 1),
(48, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports/logs.php', 0, NULL, 0, 1, 0, 3, 42, 0, 0, 0, -1, '0', 0, 1),
(49, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports/page_changes.php', 0, NULL, 0, 1, 0, 4, 42, 0, 0, 0, -1, '0', 0, 1),
(50, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/view.php', 0, NULL, 0, 1, 7, 7, 2, 0, 0, 0, -1, '0', 0, 1),
(51, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/themes/view.php', 0, NULL, 0, 1, 1, 0, 50, 0, 0, 0, -1, '0', 0, 1),
(52, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/themes/inspect.php', 0, NULL, 0, 1, 0, 0, 51, 0, 0, 0, -1, '0', 0, 1),
(53, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/view.php', 0, NULL, 0, 1, 6, 1, 50, 0, 0, 0, -1, '0', 0, 1),
(54, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/organize.php', 0, NULL, 0, 1, 0, 0, 53, 0, 0, 0, -1, '0', 0, 1),
(55, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/add.php', 0, NULL, 0, 1, 0, 1, 53, 0, 0, 0, -1, '0', 0, 1),
(56, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/form.php', 0, NULL, 0, 1, 0, 2, 53, 0, 0, 0, -1, '0', 0, 1),
(57, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/output.php', 0, NULL, 0, 1, 0, 3, 53, 0, 0, 0, -1, '0', 0, 1),
(58, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/attributes.php', 0, NULL, 0, 1, 0, 4, 53, 0, 0, 0, -1, '0', 0, 1),
(59, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/permissions.php', 0, NULL, 0, 1, 0, 5, 53, 0, 0, 0, -1, '0', 0, 1),
(60, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/templates/view.php', 0, NULL, 0, 1, 1, 2, 50, 0, 0, 0, -1, '0', 0, 1),
(61, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/templates/add.php', 0, NULL, 0, 1, 0, 0, 60, 0, 0, 0, -1, '0', 0, 1),
(62, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/containers/view.php', 0, NULL, 0, 1, 1, 3, 50, 0, 0, 0, -1, '0', 0, 1),
(63, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/containers/add.php', 0, NULL, 0, 1, 0, 0, 62, 0, 0, 0, -1, '0', 0, 1),
(64, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/attributes.php', 0, NULL, 0, 1, 0, 4, 50, 0, 0, 0, -1, '0', 0, 1),
(65, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/single.php', 0, NULL, 0, 1, 0, 5, 50, 0, 0, 0, -1, '0', 0, 1),
(66, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/feeds.php', 0, NULL, 0, 1, 0, 6, 50, 0, 0, 0, -1, '0', 0, 1),
(67, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/calendar/view.php', 0, NULL, 0, 1, 5, 8, 2, 0, 0, 0, -1, '0', 0, 1),
(68, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/calendar/events.php', 0, NULL, 0, 1, 0, 0, 67, 0, 0, 0, -1, '0', 0, 1),
(69, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/calendar/event_list.php', 0, NULL, 0, 1, 0, 1, 67, 0, 0, 0, -1, '0', 0, 1),
(70, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/calendar/add.php', 0, NULL, 0, 1, 0, 2, 67, 0, 0, 0, -1, '0', 0, 1),
(71, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/calendar/permissions.php', 0, NULL, 0, 1, 0, 3, 67, 0, 0, 0, -1, '0', 0, 1),
(72, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/calendar/attributes.php', 0, NULL, 0, 1, 0, 4, 67, 0, 0, 0, -1, '0', 0, 1),
(73, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/conversations/view.php', 0, NULL, 0, 1, 1, 9, 2, 0, 0, 0, -1, '0', 0, 1),
(74, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/conversations/messages.php', 0, NULL, 0, 1, 0, 0, 73, 0, 0, 0, -1, '0', 0, 1),
(75, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/blocks/view.php', 0, NULL, 0, 1, 3, 10, 2, 0, 0, 0, -1, '0', 0, 1),
(76, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/blocks/stacks/view.php', 0, NULL, 0, 1, 1, 0, 75, 0, 0, 0, -1, '0', 0, 1),
(77, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/blocks/permissions.php', 0, NULL, 0, 1, 0, 1, 75, 0, 0, 0, -1, '0', 0, 1),
(78, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/blocks/stacks/list/view.php', 0, NULL, 0, 1, 0, 0, 76, 0, 0, 0, -1, '0', 0, 1),
(79, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/blocks/types/view.php', 0, NULL, 0, 1, 0, 2, 75, 0, 0, 0, -1, '0', 0, 1),
(80, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/view.php', 0, NULL, 0, 1, 4, 11, 2, 0, 0, 0, -1, '0', 0, 1),
(81, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/install.php', 0, NULL, 0, 1, 0, 0, 80, 0, 0, 0, -1, '0', 0, 1),
(82, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/update.php', 0, NULL, 0, 1, 0, 1, 80, 0, 0, 0, -1, '0', 0, 1),
(83, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/themes.php', 0, NULL, 0, 1, 0, 2, 80, 0, 0, 0, -1, '0', 0, 1),
(84, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/addons.php', 0, NULL, 0, 1, 0, 3, 80, 0, 0, 0, -1, '0', 0, 1),
(85, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/view.php', 0, NULL, 0, 1, 20, 12, 2, 0, 0, 0, -1, '0', 0, 1),
(86, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/view.php', 0, NULL, 0, 1, 11, 0, 85, 0, 0, 0, -1, '0', 0, 1),
(87, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/name.php', 0, NULL, 0, 1, 0, 0, 86, 0, 0, 0, -1, '0', 0, 1),
(88, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/marketplace.php', 0, NULL, 0, 1, 0, 1, 86, 0, 0, 0, -1, '0', 0, 1),
(89, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/production_mode.php', 0, NULL, 0, 1, 0, 2, 86, 0, 0, 0, -1, '0', 0, 1),
(90, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/appearance.php', 0, NULL, 0, 1, 0, 3, 86, 0, 0, 0, -1, '0', 0, 1),
(91, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/site_information.php', 0, NULL, 0, 1, 0, 4, 86, 0, 0, 0, -1, '0', 0, 1),
(92, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/icons.php', 0, NULL, 0, 1, 0, 5, 86, 0, 0, 0, -1, '0', 0, 1),
(93, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/editor.php', 0, NULL, 0, 1, 0, 6, 86, 0, 0, 0, -1, '0', 0, 1),
(94, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/multilingual/view.php', 0, NULL, 0, 1, 1, 7, 86, 0, 0, 0, -1, '0', 0, 1),
(95, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/multilingual/update.php', 0, NULL, 0, 1, 0, 0, 94, 0, 0, 0, -1, '0', 0, 1),
(96, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/timezone.php', 0, NULL, 0, 1, 0, 8, 86, 0, 0, 0, -1, '0', 0, 1),
(97, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/attributes.php', 0, NULL, 0, 1, 0, 9, 86, 0, 0, 0, -1, '0', 0, 1),
(98, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/reset_edit_mode.php', 0, NULL, 0, 1, 0, 10, 86, 0, 0, 0, -1, '0', 0, 1),
(99, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/social/view.php', 0, NULL, 0, 1, 2, 1, 85, 0, 0, 0, -1, '0', 0, 1),
(100, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/social/social_links.php', 0, NULL, 0, 1, 0, 0, 99, 0, 0, 0, -1, '0', 0, 1),
(101, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/social/opengraph.php', 0, NULL, 0, 1, 0, 1, 99, 0, 0, 0, -1, '0', 0, 1),
(102, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/express/view.php', 0, NULL, 0, 1, 2, 2, 85, 0, 0, 0, -1, '0', 0, 1),
(103, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/express/entities.php', 0, NULL, 0, 1, 5, 0, 102, 0, 0, 0, -1, '0', 0, 1),
(104, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/express/entities/attributes.php', 0, NULL, 0, 1, 0, 0, 103, 0, 0, 0, -1, '0', 0, 1),
(105, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/express/entities/associations.php', 0, NULL, 0, 1, 0, 1, 103, 0, 0, 0, -1, '0', 0, 1),
(106, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/express/entities/forms.php', 0, NULL, 0, 1, 0, 2, 103, 0, 0, 0, -1, '0', 0, 1),
(107, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/express/entities/customize_search.php', 0, NULL, 0, 1, 0, 3, 103, 0, 0, 0, -1, '0', 0, 1),
(108, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/express/entities/order_entries.php', 0, NULL, 0, 1, 0, 4, 103, 0, 0, 0, -1, '0', 0, 1),
(109, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/express/entries.php', 0, NULL, 0, 1, 0, 1, 102, 0, 0, 0, -1, '0', 0, 1),
(110, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/multisite/view.php', 0, NULL, 0, 1, 3, 3, 85, 0, 0, 0, -1, '0', 0, 1),
(111, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/multisite/sites/view.php', 0, NULL, 0, 1, 0, 0, 110, 0, 0, 0, -1, '0', 0, 1),
(112, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/multisite/types/view.php', 0, NULL, 0, 1, 0, 1, 110, 0, 0, 0, -1, '0', 0, 1),
(113, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/multisite/settings.php', 0, NULL, 0, 1, 0, 2, 110, 0, 0, 0, -1, '0', 0, 1),
(114, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/multilingual/view.php', 0, NULL, 0, 1, 4, 4, 85, 0, 0, 0, -1, '0', 0, 1),
(115, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/multilingual/setup.php', 0, NULL, 0, 1, 0, 0, 114, 0, 0, 0, -1, '0', 0, 1),
(116, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/multilingual/copy.php', 0, NULL, 0, 1, 0, 1, 114, 0, 0, 0, -1, '0', 0, 1),
(117, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/multilingual/page_report.php', 0, NULL, 0, 1, 0, 2, 114, 0, 0, 0, -1, '0', 0, 1),
(118, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/multilingual/translate_interface.php', 0, NULL, 0, 1, 0, 3, 114, 0, 0, 0, -1, '0', 0, 1),
(119, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/view.php', 0, NULL, 0, 1, 6, 5, 85, 0, 0, 0, -1, '0', 0, 1),
(120, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/urls.php', 0, NULL, 0, 1, 0, 0, 119, 0, 0, 0, -1, '0', 0, 1),
(121, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/bulk.php', 0, NULL, 0, 1, 0, 1, 119, 0, 0, 0, -1, '0', 0, 1),
(122, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/codes.php', 0, NULL, 0, 1, 0, 2, 119, 0, 0, 0, -1, '0', 0, 1),
(123, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/excluded.php', 0, NULL, 0, 1, 0, 3, 119, 0, 0, 0, -1, '0', 0, 1),
(124, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/searchindex.php', 0, NULL, 0, 1, 0, 4, 119, 0, 0, 0, -1, '0', 0, 1),
(125, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/url_slug.php', 0, NULL, 0, 1, 0, 5, 119, 0, 0, 0, -1, '0', 0, 1),
(126, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/files/view.php', 0, NULL, 0, 1, 10, 6, 85, 0, 0, 0, -1, '0', 0, 1),
(127, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/files/filetypes.php', 0, NULL, 0, 1, 0, 0, 126, 0, 0, 0, -1, '0', 0, 1),
(128, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/files/file_chooser.php', 0, NULL, 0, 1, 0, 1, 126, 0, 0, 0, -1, '0', 0, 1),
(129, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/files/permissions.php', 0, NULL, 0, 1, 0, 2, 126, 0, 0, 0, -1, '0', 0, 1),
(130, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/files/thumbnails.php', 0, NULL, 0, 1, 1, 3, 126, 0, 0, 0, -1, '0', 0, 1),
(131, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/files/thumbnails/options.php', 0, NULL, 0, 1, 0, 0, 130, 0, 0, 0, -1, '0', 0, 1),
(132, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/files/image_uploading.php', 0, NULL, 0, 1, 0, 4, 126, 0, 0, 0, -1, '0', 0, 1),
(133, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/files/image_editor.php', 0, NULL, 0, 1, 0, 5, 126, 0, 0, 0, -1, '0', 0, 1),
(134, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/files/storage.php', 0, NULL, 0, 1, 0, 6, 126, 0, 0, 0, -1, '0', 0, 1),
(135, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/files/external_file_provider.php', 0, NULL, 0, 1, 0, 7, 126, 0, 0, 0, -1, '0', 0, 1),
(136, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/files/export_options.php', 0, NULL, 0, 1, 0, 8, 126, 0, 0, 0, -1, '0', 0, 1),
(137, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/files/uploads.php', 0, NULL, 0, 1, 0, 9, 126, 0, 0, 0, -1, '0', 0, 1),
(138, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/automation/view.php', 0, NULL, 0, 1, 5, 7, 85, 0, 0, 0, -1, '0', 0, 1),
(139, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/automation/tasks.php', 0, NULL, 0, 1, 0, 0, 138, 0, 0, 0, -1, '0', 0, 1),
(140, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/automation/activity.php', 0, NULL, 0, 1, 0, 1, 138, 0, 0, 0, -1, '0', 0, 1),
(141, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/automation/failed.php', 0, NULL, 0, 1, 0, 2, 138, 0, 0, 0, -1, '0', 0, 1),
(142, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/automation/schedule.php', 0, NULL, 0, 1, 0, 3, 138, 0, 0, 0, -1, '0', 0, 1),
(143, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/automation/settings.php', 0, NULL, 0, 1, 0, 4, 138, 0, 0, 0, -1, '0', 0, 1),
(144, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/notification/view.php', 0, NULL, 0, 1, 2, 8, 85, 0, 0, 0, -1, '0', 0, 1),
(145, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/notification/events.php', 0, NULL, 0, 1, 0, 0, 144, 0, 0, 0, -1, '0', 0, 1),
(146, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/notification/alerts.php', 0, NULL, 0, 1, 0, 1, 144, 0, 0, 0, -1, '0', 0, 1),
(147, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/optimization/view.php', 0, NULL, 0, 1, 3, 9, 85, 0, 0, 0, -1, '0', 0, 1),
(148, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/optimization/cache.php', 0, NULL, 0, 1, 0, 0, 147, 0, 0, 0, -1, '0', 0, 1),
(149, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/optimization/clearcache.php', 0, NULL, 0, 1, 0, 1, 147, 0, 0, 0, -1, '0', 0, 1),
(150, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/optimization/jobs.php', 0, NULL, 0, 1, 0, 2, 147, 0, 0, 0, -1, '0', 0, 1),
(151, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/view.php', 0, NULL, 0, 1, 10, 10, 85, 0, 0, 0, -1, '0', 0, 1),
(152, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/site.php', 0, NULL, 0, 1, 0, 0, 151, 0, 0, 0, -1, '0', 0, 1),
(153, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/tasks.php', 0, NULL, 0, 1, 0, 1, 151, 0, 0, 0, -1, '0', 0, 1),
(154, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/users.php', 0, NULL, 0, 1, 0, 2, 151, 0, 0, 0, -1, '0', 0, 1),
(155, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/advanced.php', 0, NULL, 0, 1, 0, 3, 151, 0, 0, 0, -1, '0', 0, 1),
(156, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/workflows.php', 0, NULL, 0, 1, 0, 4, 151, 0, 0, 0, -1, '0', 0, 1),
(157, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/denylist.php', 0, NULL, 0, 1, 2, 5, 151, 0, 0, 0, -1, '0', 0, 1),
(158, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/denylist/configure.php', 0, NULL, 0, 1, 0, 0, 157, 0, 0, 0, -1, '0', 0, 1),
(159, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/denylist/range.php', 0, NULL, 0, 1, 0, 1, 157, 0, 0, 0, -1, '0', 0, 1),
(160, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/captcha.php', 0, NULL, 0, 1, 0, 6, 151, 0, 0, 0, -1, '0', 0, 1),
(161, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/antispam.php', 0, NULL, 0, 1, 0, 7, 151, 0, 0, 0, -1, '0', 0, 1),
(162, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/maintenance.php', 0, NULL, 0, 1, 0, 8, 151, 0, 0, 0, -1, '0', 0, 1),
(163, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/trusted_proxies.php', 0, NULL, 0, 1, 0, 9, 151, 0, 0, 0, -1, '0', 0, 1),
(164, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/view.php', 0, NULL, 0, 1, 9, 11, 85, 0, 0, 0, -1, '0', 0, 1),
(165, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/open.php', 0, NULL, 0, 1, 0, 0, 164, 0, 0, 0, -1, '0', 0, 1),
(166, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/postlogin.php', 0, NULL, 0, 1, 0, 1, 164, 0, 0, 0, -1, '0', 0, 1),
(167, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/profiles.php', 0, NULL, 0, 1, 0, 2, 164, 0, 0, 0, -1, '0', 0, 1),
(168, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/authentication.php', 0, NULL, 0, 1, 0, 3, 164, 0, 0, 0, -1, '0', 0, 1),
(169, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/global_password_reset.php', 0, NULL, 0, 1, 0, 4, 164, 0, 0, 0, -1, '0', 0, 1),
(170, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/deactivation.php', 0, NULL, 0, 1, 0, 5, 164, 0, 0, 0, -1, '0', 0, 1),
(171, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/automated_logout.php', 0, NULL, 0, 1, 0, 6, 164, 0, 0, 0, -1, '0', 0, 1),
(172, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/password_requirements.php', 0, NULL, 0, 1, 0, 7, 164, 0, 0, 0, -1, '0', 0, 1),
(173, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/session_options.php', 0, NULL, 0, 1, 0, 8, 164, 0, 0, 0, -1, '0', 0, 1),
(174, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/mail/view.php', 0, NULL, 0, 1, 4, 12, 85, 0, 0, 0, -1, '0', 0, 1),
(175, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/mail/method.php', 0, NULL, 0, 1, 1, 0, 174, 0, 0, 0, -1, '0', 0, 1),
(176, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/mail/method/test.php', 0, NULL, 0, 1, 0, 0, 175, 0, 0, 0, -1, '0', 0, 1),
(177, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/mail/importers.php', 0, NULL, 0, 1, 0, 1, 174, 0, 0, 0, -1, '0', 0, 1),
(178, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/mail/addresses.php', 0, NULL, 0, 1, 0, 2, 174, 0, 0, 0, -1, '0', 0, 1),
(179, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/mail/logging.php', 0, NULL, 0, 1, 0, 3, 174, 0, 0, 0, -1, '0', 0, 1),
(180, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/calendar/view.php', 0, NULL, 0, 1, 4, 13, 85, 0, 0, 0, -1, '0', 0, 1),
(181, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/calendar/settings.php', 0, NULL, 0, 1, 0, 0, 180, 0, 0, 0, -1, '0', 0, 1),
(182, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/calendar/colors.php', 0, NULL, 0, 1, 0, 1, 180, 0, 0, 0, -1, '0', 0, 1),
(183, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/calendar/permissions.php', 0, NULL, 0, 1, 0, 2, 180, 0, 0, 0, -1, '0', 0, 1),
(184, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/calendar/import.php', 0, NULL, 0, 1, 0, 3, 180, 0, 0, 0, -1, '0', 0, 1),
(185, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/boards/view.php', 0, NULL, 0, 1, 3, 14, 85, 0, 0, 0, -1, '0', 0, 1),
(186, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/boards/settings.php', 0, NULL, 0, 1, 0, 0, 185, 0, 0, 0, -1, '0', 0, 1),
(187, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/boards/permissions.php', 0, NULL, 0, 1, 0, 1, 185, 0, 0, 0, -1, '0', 0, 1),
(188, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/boards/summary_templates.php', 0, NULL, 0, 1, 0, 2, 185, 0, 0, 0, -1, '0', 0, 1),
(189, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/conversations/view.php', 0, NULL, 0, 1, 4, 15, 85, 0, 0, 0, -1, '0', 0, 1),
(190, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/conversations/settings.php', 0, NULL, 0, 1, 0, 0, 189, 0, 0, 0, -1, '0', 0, 1),
(191, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/conversations/points.php', 0, NULL, 0, 1, 0, 1, 189, 0, 0, 0, -1, '0', 0, 1),
(192, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/conversations/bannedwords.php', 0, NULL, 0, 1, 0, 2, 189, 0, 0, 0, -1, '0', 0, 1),
(193, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/conversations/permissions.php', 0, NULL, 0, 1, 0, 3, 189, 0, 0, 0, -1, '0', 0, 1),
(194, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/attributes/view.php', 0, NULL, 0, 1, 3, 16, 85, 0, 0, 0, -1, '0', 0, 1),
(195, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/attributes/types.php', 0, NULL, 0, 1, 0, 0, 194, 0, 0, 0, -1, '0', 0, 1),
(196, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/attributes/sets.php', 0, NULL, 0, 1, 0, 1, 194, 0, 0, 0, -1, '0', 0, 1),
(197, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/attributes/topics/view.php', 0, NULL, 0, 1, 1, 2, 194, 0, 0, 0, -1, '0', 0, 1),
(198, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/attributes/topics/add.php', 0, NULL, 0, 1, 0, 0, 197, 0, 0, 0, -1, '0', 0, 1),
(199, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/view.php', 0, NULL, 0, 1, 8, 17, 85, 0, 0, 0, -1, '0', 0, 1),
(200, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/info.php', 0, NULL, 0, 1, 0, 0, 199, 0, 0, 0, -1, '0', 0, 1),
(201, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/errors.php', 0, NULL, 0, 1, 0, 1, 199, 0, 0, 0, -1, '0', 0, 1),
(202, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/logging.php', 0, NULL, 0, 1, 0, 2, 199, 0, 0, 0, -1, '0', 0, 1),
(203, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/proxy.php', 0, NULL, 0, 1, 0, 3, 199, 0, 0, 0, -1, '0', 0, 1),
(204, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/entities.php', 0, NULL, 0, 1, 0, 4, 199, 0, 0, 0, -1, '0', 0, 1),
(205, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/database_charset.php', 0, NULL, 0, 1, 0, 5, 199, 0, 0, 0, -1, '0', 0, 1),
(206, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/geolocation.php', 0, NULL, 0, 1, 0, 6, 199, 0, 0, 0, -1, '0', 0, 1),
(207, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/security.php', 0, NULL, 0, 1, 0, 7, 199, 0, 0, 0, -1, '0', 0, 1),
(208, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/update/view.php', 0, NULL, 0, 1, 1, 18, 85, 0, 0, 0, -1, '0', 0, 1),
(209, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/update/update.php', 0, NULL, 0, 1, 0, 0, 208, 0, 0, 0, -1, '0', 0, 1),
(210, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/api/view.php', 0, NULL, 0, 1, 3, 19, 85, 0, 0, 0, -1, '0', 0, 1),
(211, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/api/integrations.php', 0, NULL, 0, 1, 0, 0, 210, 0, 0, 0, -1, '0', 0, 1),
(212, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/api/scopes.php', 0, NULL, 0, 1, 0, 1, 210, 0, 0, 0, -1, '0', 0, 1),
(213, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/api/settings.php', 0, NULL, 0, 1, 0, 2, 210, 0, 0, 0, -1, '0', 0, 1),
(214, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/welcome.php', 0, NULL, 0, 1, 2, 0, 2, 0, 0, 0, -1, '0', 0, 1),
(215, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/welcome/health.php', 0, NULL, 0, 1, 0, 0, 214, 0, 0, 0, -1, '0', 0, 1),
(216, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', NULL, 0, NULL, 0, 1, 0, 1, 214, 0, 0, 0, -1, '0', 0, 1),
(217, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/!themes/view.php', 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(218, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/!stacks/view.php', 0, NULL, 0, 1, 6, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(219, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 219, 'OVERRIDE', '/page_not_found.php', 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(220, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/!trash/view.php', 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(221, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 221, 'OVERRIDE', '/login.php', 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(222, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 222, 'OVERRIDE', '/register.php', 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(223, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/account/view.php', 0, NULL, 0, 1, 3, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(224, 0, 0, 0, 1, 1, 1, '2025-06-25 21:14:11', '2025-06-25 21:14:11', 1, 1, 'PARENT', '/account/edit_profile.php', 0, NULL, 0, 1, 0, 0, 223, 0, 0, 0, -1, '0', 0, 1),
(225, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/account/avatar.php', 0, NULL, 0, 1, 0, 1, 223, 0, 0, 0, -1, '0', 0, 1),
(226, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/account/messages.php', 0, NULL, 0, 1, 0, 2, 223, 0, 0, 0, -1, '0', 0, 1),
(227, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 227, 'OVERRIDE', '/page_forbidden.php', 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(228, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/download_file.php', 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(229, 1, 0, 0, 1, 0, NULL, NULL, NULL, 1, 229, 'OVERRIDE', '/!drafts/view.php', 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(230, 1, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/desktop.php', 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(231, 0, 1, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 0, 218, 0, 0, 0, -1, '0', 0, 1),
(232, 0, 1, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 1, 218, 0, 0, 0, -1, '0', 0, 1),
(233, 0, 1, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 2, 218, 0, 0, 0, -1, '0', 0, 1),
(234, 0, 1, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 3, 218, 0, 0, 0, -1, '0', 0, 1),
(235, 0, 1, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 4, 218, 0, 0, 0, -1, '0', 0, 1),
(236, 0, 2, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 1, 5, 218, 0, 0, 0, -1, '0', 0, 1),
(237, 0, 1, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 0, 236, 0, 0, 0, -1, '0', 0, 1),
(238, 1, 6, 1, NULL, 0, NULL, NULL, NULL, 1, 238, 'OVERRIDE', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, -1, '0', 0, 0),
(239, 1, 6, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 4, 0, 1, 0, 0, 0, -1, '0', 0, 0),
(240, 1, 6, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 6, 1, 1, 0, 0, 0, -1, '0', 0, 0),
(241, 1, 6, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 2, 1, 0, 0, 0, -1, '0', 0, 0),
(242, 1, 6, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 3, 1, 0, 0, 0, -1, '0', 0, 0),
(243, 1, 6, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 4, 1, 0, 0, 0, -1, '0', 0, 0),
(244, 1, 6, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 5, 1, 0, 0, 0, -1, '0', 0, 0),
(245, 1, 6, 1, NULL, 0, NULL, NULL, NULL, 1, 245, 'OVERRIDE', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, -1, '0', 0, 0),
(246, 1, 6, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 6, 1, 0, 0, 0, -1, '0', 0, 0),
(247, 1, 6, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 0, 239, 0, 0, 0, -1, '0', 0, 0),
(248, 1, 8, 1, NULL, 0, NULL, NULL, NULL, 1, 248, 'OVERRIDE', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, -1, '0', 0, 0),
(249, 1, 8, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 6, 1, 239, 0, 0, 0, -1, '0', 0, 0),
(250, 1, 6, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 2, 239, 0, 0, 0, -1, '0', 0, 0),
(251, 1, 6, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 3, 239, 0, 0, 0, -1, '0', 0, 0),
(252, 1, 9, 1, NULL, 0, NULL, NULL, NULL, 1, 252, 'OVERRIDE', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, -1, '0', 0, 0),
(253, 1, 9, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 0, 240, 0, 0, 0, -1, '0', 0, 0),
(254, 1, 9, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 1, 240, 0, 0, 0, -1, '0', 0, 0),
(255, 1, 9, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 2, 240, 0, 0, 0, -1, '0', 0, 0),
(256, 1, 9, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 3, 240, 0, 0, 0, -1, '0', 0, 0),
(257, 1, 9, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 4, 240, 0, 0, 0, -1, '0', 0, 0),
(258, 1, 9, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 5, 240, 0, 0, 0, -1, '0', 0, 0),
(259, 1, 7, 1, NULL, 0, NULL, NULL, NULL, 1, 259, 'OVERRIDE', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, -1, '0', 0, 0),
(260, 1, 7, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 0, 249, 0, 0, 0, -1, '0', 0, 0),
(261, 1, 7, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 1, 249, 0, 0, 0, -1, '0', 0, 0),
(262, 1, 7, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 2, 249, 0, 0, 0, -1, '0', 0, 0),
(263, 1, 7, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 3, 249, 0, 0, 0, -1, '0', 0, 0),
(264, 1, 7, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 4, 249, 0, 0, 0, -1, '0', 0, 0),
(265, 1, 7, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 5, 249, 0, 0, 0, -1, '0', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `PageSearchIndex`
--

CREATE TABLE `PageSearchIndex` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `content` longtext DEFAULT NULL,
  `cName` varchar(255) DEFAULT NULL,
  `cDescription` text DEFAULT NULL,
  `cPath` text DEFAULT NULL,
  `cDatePublic` datetime DEFAULT NULL,
  `cDateLastIndexed` datetime DEFAULT NULL,
  `cDateLastSitemapped` datetime DEFAULT NULL,
  `cRequiresReindex` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PageSearchIndex`
--

INSERT INTO `PageSearchIndex` (`cID`, `content`, `cName`, `cDescription`, `cPath`, `cDatePublic`, `cDateLastIndexed`, `cDateLastSitemapped`, `cRequiresReindex`) VALUES
(1, 'What We Do\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \nAenean eu enim justo. Vestibulum aliquam hendrerit molestie. \n Collaboratively administrate complex websites with ease.  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tincidunt turpis at odio fermentum posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae. \n Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tincidunt turpis at odio fermentum posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae. \n Vestibulum ante ipsum primis.  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tincidunt turpis at odio fermentum posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae. \n  \n                                     Fabian Rodriguez \n                                \n\n                                     Senior Manager \n                                \n\n                                     Systems Inc. \n                                \n\n                                     Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ourabitur tincidunt consectetur adipiscing elit urabitur tinciduntturpis at odio fermentum. \n                                 Ideate  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \n Create  Donec libero turpis, lacinia nec leo sit amet, dignissim dignissim lacus. Nunc semper, leo vel bibendum dapibus. \n Iterate  Aenean ullamcorper urna tortor, ut elementum felis volutpat faucibus. Interdum fames ipsum in faucibus.  \n From Our Blog\n ', 'Home', '', NULL, '2025-06-25 21:11:00', '2025-06-25 21:11:39', NULL, 0),
(216, '', 'Waiting for Me', '', '/dashboard/welcome/me', '2025-06-25 21:11:22', '2025-06-25 21:11:27', NULL, 0),
(239, 'Collaboratively administrate complex websites with ease.  Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n Vestibulum ante ipsum primis.  Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  What We Do\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \nAenean eu enim justo. Vestibulum aliquam hendrerit molestie. \n Meet the Team\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tincidunt turpis at odio fermentum posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices. \n \n                                                Show off some features with this flexible layout!  \n                                                Show off some features with this flexible layout!  \n                                                Show off some features with this flexible layout!  \n                                                Show off some features with this flexible layout!  \n                                                Show off some features with this flexible layout!  \n                                                Show off some features with this flexible layout!  Sam Heinz\nConcrete Fan\n\n Ruthie Rich\nConcrete Fan\n\n Amanda Johnson\nConcrete Fan\n\n Christina Backman\nConcrete Fan\n\n Robert Cook\nConcrete Fan\n\n David Briscoe\nConcrete Fan\n\n ', 'About', '', '/about', '2025-06-25 21:11:36', '2025-06-25 21:11:40', NULL, 0),
(240, '', 'Resources', '', '/resources', '2025-06-25 21:11:36', '2025-06-25 21:11:41', NULL, 0),
(241, '', 'Documents', '', '/documents', '2025-06-25 21:11:36', '2025-06-25 21:11:43', NULL, 0),
(246, ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus auctor convallis ipsum, sed dapibus ante fermentum at. Praesent tempor sagittis hendrerit. Morbi ac lacus vitae ex rhoncus faucibus. Nunc pretium luctus aliquam. Nunc pellentesque bibendum diam, eget tristique ipsum mollis vitae. Mauris ac sem eu lacus hendrerit blandit at in leo. Vestibulum mi turpis, sollicitudin vel aliquet sed, euismod in tellus. Fusce nisi risus, facilisis eu fermentum vitae, iaculis at lectus. Aliquam id eleifend felis. \n\n Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi sollicitudin, turpis eu cursus molestie, nisi ante convallis mauris, vitae finibus ligula urna id dolor. Duis laoreet iaculis libero, eu bibendum augue dapibus sed. Nullam tellus lorem, tincidunt quis tristique vulputate, pretium ut ex. Mauris euismod tortor id consectetur feugiat. Nulla suscipit ex tellus, placerat scelerisque dolor sodales eu. Integer quis euismod urna, id mollis ante. Etiam in viverra est. Nam pulvinar at urna in rhoncus. \n\n Sed suscipit tempus luctus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent ut placerat elit, sit amet scelerisque nisi. Suspendisse est nisi, viverra et orci sed, varius mattis lorem. Sed ultricies nunc ac ante interdum, quis commodo metus condimentum. Phasellus cursus vel tellus ut volutpat. Nullam urna urna, efficitur in ipsum ac, facilisis viverra nulla. Cras tellus quam, fermentum et sagittis eu, aliquet a ligula. Aliquam erat volutpat. Cras tincidunt odio eu sem pharetra elementum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. \n\n Vivamus et ornare lorem. Sed ut augue nibh. Nulla convallis tempus diam, quis varius nulla pulvinar id. Nullam maximus finibus urna, at molestie magna dapibus a. Etiam lobortis augue ac metus faucibus tincidunt. Proin ac ante odio. Donec aliquam ornare finibus. \n\n Nullam pulvinar varius sodales. Nunc et fermentum massa, vel tempor metus. Aliquam erat volutpat. Donec pellentesque sem eget varius hendrerit. Nam nunc sem, posuere vitae hendrerit nec, congue non felis. Etiam sed ipsum eget ante rutrum placerat. Sed id elementum neque. Maecenas malesuada nunc ipsum, non posuere erat aliquam eget. Aenean suscipit ipsum tellus, at venenatis turpis semper eu. Sed sem lorem, bibendum vel dapibus a, euismod in tellus. Nunc in sem at quam tempor condimentum. Quisque aliquam eu diam vel volutpat. \n ', 'Privacy Policy', '', '/privacy-policy', '2025-06-25 21:11:37', '2025-06-25 21:11:45', NULL, 0),
(247, 'What Our Clients are Saying\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tincidunt turpis at odio fermentum posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae. \n Quality  Design  Development  Security  Our Services\n Amanda Johnson\nCFO\nBass Designs\n\n                                                Donec sem massa, bibendum sodales odio et, pretium eleifend urna. Donec eu nibh mattis, congue velit imperdiet. Sam Heinz\nLead Developer\nTaftCo Enterprises\n\n                                                Donec sem massa, bibendum sodales odio et, pretium eleifend urna. Donec eu nibh mattis, congue velit imperdiet. VP Engineering\nVitalTech Incorporated\n\n\n                                                Donec sem massa, bibendum sodales odio et, pretium eleifend urna. Donec eu nibh mattis, congue velit imperdiet. David Briscoe\nCTO\nAmuseCorp\n\n                                                Donec sem massa, bibendum sodales odio et, pretium eleifend urna. Donec eu nibh mattis, congue velit imperdiet. Christina Backman\nCo-Founder\nBackman Design\n\n                                                Donec sem massa, bibendum sodales odio et, pretium eleifend urna. Donec eu nibh mattis, congue velit imperdiet. Robert Cook\nFounder\nFoo Energy Bars\n\n                                                Donec sem massa, bibendum sodales odio et, pretium eleifend urna. Donec eu nibh mattis, congue velit imperdiet. Testing Heading 1\n \nMaecenas consequat lectus a euismod pellentesque. Pellentesque commodo quam nec consequat eleifend. Aenean accumsan vehicula ornare. Proin tempus lorem et sapien pretium efficitur. Nunc lectus ante, maximus sed euismod sed, finibus quis dui. Proin mollis risus massa, non aliquet est feugiat eget. Mauris facilisis vitae arcu eu lacinia. Mauris ut lacus tristique, dapibus odio ac, congue nunc. Nam eget mauris tincidunt, bibendum lacus ac, facilisis ipsum.\n \nTesting Heading 2\n \nMaecenas consequat lectus a euismod pellentesque. Pellentesque commodo quam nec consequat eleifend. Aenean accumsan vehicula ornare. Proin tempus lorem et sapien pretium efficitur. Nunc lectus ante, maximus sed euismod sed, finibus quis dui. Proin mollis risus massa, non aliquet est feugiat eget. Mauris facilisis vitae arcu eu lacinia. Mauris ut lacus tristique, dapibus odio ac, congue nunc. Nam eget mauris tincidunt, bibendum lacus ac, facilisis ipsum.\n \nTesting Heading 3\n \nMaecenas consequat lectus a euismod pellentesque. Pellentesque commodo quam nec consequat eleifend. Aenean accumsan vehicula ornare. Proin tempus lorem et sapien pretium efficitur. Nunc lectus ante, maximus sed euismod sed, finibus quis dui. Proin mollis risus massa, non aliquet est feugiat eget. Mauris facilisis vitae arcu eu lacinia. Mauris ut lacus tristique, dapibus odio ac, congue nunc. Nam eget mauris tincidunt, bibendum lacus ac, facilisis ipsum.\n  Testing Heading 1\n \nMaecenas consequat lectus a euismod pellentesque. Pellentesque commodo quam nec consequat eleifend. Aenean accumsan vehicula ornare. Proin tempus lorem et sapien pretium efficitur. Nunc lectus ante, maximus sed euismod sed, finibus quis dui. Proin mollis risus massa, non aliquet est feugiat eget. Mauris facilisis vitae arcu eu lacinia. Mauris ut lacus tristique, dapibus odio ac, congue nunc. Nam eget mauris tincidunt, bibendum lacus ac, facilisis ipsum.\n \nTesting Heading 2\n \nMaecenas consequat lectus a euismod pellentesque. Pellentesque commodo quam nec consequat eleifend. Aenean accumsan vehicula ornare. Proin tempus lorem et sapien pretium efficitur. Nunc lectus ante, maximus sed euismod sed, finibus quis dui. Proin mollis risus massa, non aliquet est feugiat eget. Mauris facilisis vitae arcu eu lacinia. Mauris ut lacus tristique, dapibus odio ac, congue nunc. Nam eget mauris tincidunt, bibendum lacus ac, facilisis ipsum.\n \nTesting Heading 3\n \nMaecenas consequat lectus a euismod pellentesque. Pellentesque commodo quam nec consequat eleifend. Aenean accumsan vehicula ornare. Proin tempus lorem et sapien pretium efficitur. Nunc lectus ante, maximus sed euismod sed, finibus quis dui. Proin mollis risus massa, non aliquet est feugiat eget. Mauris facilisis vitae arcu eu lacinia. Mauris ut lacus tristique, dapibus odio ac, congue nunc. Nam eget mauris tincidunt, bibendum lacus ac, facilisis ipsum.\n  ', 'Services', '', '/about/services', '2025-06-25 21:11:37', '2025-06-25 21:11:41', NULL, 0),
(249, 'Latest Resources\n ', 'Blog', '', '/about/blog', '2025-06-25 21:11:37', '2025-06-25 21:11:41', NULL, 0),
(250, 'Frequently Asked Questions What are page versions? What are page versions? \n                                    Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. How do I add more people as editors in my website? How do I add more people as editors in my website? \n                                    Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna.  ', 'FAQ', '', '/about/faq', '2025-06-25 21:11:37', '2025-06-25 21:11:41', NULL, 0),
(251, 'Choosing Us\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \nAenean eu enim justo. Vestibulum aliquam hendrerit molestie. \n Headquarters\n\n 123 SW Concrete Pl. \nPortland, OR 97210 \n\nHours\n\n M-F: 10am - 7pm \nSat: 12pm - 7pm \nSunday: Closed \n ', 'Contact Us', '', '/about/contact', '2025-06-25 21:11:37', '2025-06-25 21:11:41', NULL, 0),
(253, ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dictum luctus nulla ut volutpat. Curabitur id aliquet sem. Vivamus scelerisque congue quam eu sollicitudin. Quisque ut urna luctus, luctus orci ac, mattis diam. Duis eget cursus nulla. Nam commodo nunc tortor, ut elementum eros bibendum eu. Quisque elementum sagittis tortor vitae porta. Integer sed lectus blandit, scelerisque diam non, dictum est. Pellentesque pretium risus a odio blandit vehicula. \n\n Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque sit amet turpis ut justo congue pharetra quis ut elit. Sed commodo in nunc faucibus ullamcorper. Aenean efficitur ex ut neque vulputate fermentum. Nunc commodo enim id enim tincidunt commodo. Nullam vel eleifend leo. Mauris vel aliquam felis. Pellentesque accumsan tellus nisl, ultrices viverra lectus rutrum tempor. Mauris at consectetur turpis. \n\n Read More \n ', 'Resource One', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. ', '/resources/resource-one', '2025-06-25 21:11:37', '2025-06-25 21:11:44', NULL, 0),
(254, ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dictum luctus nulla ut volutpat. Curabitur id aliquet sem. Vivamus scelerisque congue quam eu sollicitudin. Quisque ut urna luctus, luctus orci ac, mattis diam. Duis eget cursus nulla. Nam commodo nunc tortor, ut elementum eros bibendum eu. Quisque elementum sagittis tortor vitae porta. Integer sed lectus blandit, scelerisque diam non, dictum est. Pellentesque pretium risus a odio blandit vehicula. \n\n Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque sit amet turpis ut justo congue pharetra quis ut elit. Sed commodo in nunc faucibus ullamcorper. Aenean efficitur ex ut neque vulputate fermentum. Nunc commodo enim id enim tincidunt commodo. Nullam vel eleifend leo. Mauris vel aliquam felis. Pellentesque accumsan tellus nisl, ultrices viverra lectus rutrum tempor. Mauris at consectetur turpis. \n\n Read More \n ', 'Resource Two', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. ', '/resources/resource-two', '2025-06-25 21:11:37', '2025-06-25 21:11:44', NULL, 0),
(255, ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dictum luctus nulla ut volutpat. Curabitur id aliquet sem. Vivamus scelerisque congue quam eu sollicitudin. Quisque ut urna luctus, luctus orci ac, mattis diam. Duis eget cursus nulla. Nam commodo nunc tortor, ut elementum eros bibendum eu. Quisque elementum sagittis tortor vitae porta. Integer sed lectus blandit, scelerisque diam non, dictum est. Pellentesque pretium risus a odio blandit vehicula. \n\n Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque sit amet turpis ut justo congue pharetra quis ut elit. Sed commodo in nunc faucibus ullamcorper. Aenean efficitur ex ut neque vulputate fermentum. Nunc commodo enim id enim tincidunt commodo. Nullam vel eleifend leo. Mauris vel aliquam felis. Pellentesque accumsan tellus nisl, ultrices viverra lectus rutrum tempor. Mauris at consectetur turpis. \n\n Read More \n ', 'Resource Three', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. ', '/resources/resource-three', '2025-06-25 21:11:37', '2025-06-25 21:11:44', NULL, 0),
(256, ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dictum luctus nulla ut volutpat. Curabitur id aliquet sem. Vivamus scelerisque congue quam eu sollicitudin. Quisque ut urna luctus, luctus orci ac, mattis diam. Duis eget cursus nulla. Nam commodo nunc tortor, ut elementum eros bibendum eu. Quisque elementum sagittis tortor vitae porta. Integer sed lectus blandit, scelerisque diam non, dictum est. Pellentesque pretium risus a odio blandit vehicula. \n\n Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque sit amet turpis ut justo congue pharetra quis ut elit. Sed commodo in nunc faucibus ullamcorper. Aenean efficitur ex ut neque vulputate fermentum. Nunc commodo enim id enim tincidunt commodo. Nullam vel eleifend leo. Mauris vel aliquam felis. Pellentesque accumsan tellus nisl, ultrices viverra lectus rutrum tempor. Mauris at consectetur turpis. \n\n Read More \n ', 'Resource Four', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. ', '/resources/resource-four', '2025-06-25 21:11:37', '2025-06-25 21:11:45', NULL, 0),
(257, ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dictum luctus nulla ut volutpat. Curabitur id aliquet sem. Vivamus scelerisque congue quam eu sollicitudin. Quisque ut urna luctus, luctus orci ac, mattis diam. Duis eget cursus nulla. Nam commodo nunc tortor, ut elementum eros bibendum eu. Quisque elementum sagittis tortor vitae porta. Integer sed lectus blandit, scelerisque diam non, dictum est. Pellentesque pretium risus a odio blandit vehicula. \n\n Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque sit amet turpis ut justo congue pharetra quis ut elit. Sed commodo in nunc faucibus ullamcorper. Aenean efficitur ex ut neque vulputate fermentum. Nunc commodo enim id enim tincidunt commodo. Nullam vel eleifend leo. Mauris vel aliquam felis. Pellentesque accumsan tellus nisl, ultrices viverra lectus rutrum tempor. Mauris at consectetur turpis. \n\n Read More \n ', 'Resource Five', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. ', '/resources/resource-five', '2025-06-25 21:11:37', '2025-06-25 21:11:45', NULL, 0),
(258, ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dictum luctus nulla ut volutpat. Curabitur id aliquet sem. Vivamus scelerisque congue quam eu sollicitudin. Quisque ut urna luctus, luctus orci ac, mattis diam. Duis eget cursus nulla. Nam commodo nunc tortor, ut elementum eros bibendum eu. Quisque elementum sagittis tortor vitae porta. Integer sed lectus blandit, scelerisque diam non, dictum est. Pellentesque pretium risus a odio blandit vehicula. \n\n Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque sit amet turpis ut justo congue pharetra quis ut elit. Sed commodo in nunc faucibus ullamcorper. Aenean efficitur ex ut neque vulputate fermentum. Nunc commodo enim id enim tincidunt commodo. Nullam vel eleifend leo. Mauris vel aliquam felis. Pellentesque accumsan tellus nisl, ultrices viverra lectus rutrum tempor. Mauris at consectetur turpis. \n\n Read More \n ', 'Resource Six', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. ', '/resources/resource-six', '2025-06-25 21:11:37', '2025-06-25 21:11:45', NULL, 0),
(260, '\n                                     Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi non justo ultricies, facilisis erat quis, vehicula leo. Duis massa ipsum, hendrerit et eleifend ut, eleifend ut metus. Sed venenatis dui sem, sit amet feugiat tortor porttitor interdum. Nulla feugiat risus ac tristique porta. Nulla facilisi. Nam ullamcorper dignissim velit at vestibulum. Suspendisse in libero nec augue aliquet hendrerit. Curabitur tincidunt nisi in tortor efficitur, quis commodo ex tincidunt. Nunc risus enim, dictum sit amet commodo tincidunt, tincidunt sit amet eros. Vivamus dapibus ac nibh eu congue. In rhoncus urna arcu, mattis vehicula augue convallis a. Integer a dui urna. Fusce sit amet neque id metus faucibus convallis. Duis lobortis orci at mollis iaculis. Aliquam lobortis semper turpis, non porttitor metus bibendum sit amet.\n \n \nPraesent efficitur iaculis mauris, vitae maximus lectus lacinia vitae. Aenean in mi augue. Donec eu consectetur purus. Quisque non laoreet lectus. Vestibulum nulla ex, sagittis a lacinia non, accumsan gravida ligula. Sed non euismod enim. Aliquam placerat felis sed turpis tempus sodales. Curabitur fringilla eros arcu, at porta nunc sagittis finibus.\n \n \nDuis non placerat justo. Proin eu neque luctus, lacinia turpis sed, feugiat enim. Etiam turpis erat, convallis sit amet magna et, maximus feugiat lorem. Cras accumsan condimentum sollicitudin. Maecenas pharetra faucibus tempor. Phasellus nec metus id odio dictum efficitur id ut diam. Phasellus quis arcu tincidunt, molestie nisl ut, vehicula lacus. Vivamus non accumsan magna. Proin blandit euismod dui, eget sodales mauris varius bibendum. Nam facilisis fermentum elit, in fringilla elit. Mauris erat arcu, malesuada at dolor quis, condimentum blandit felis. Mauris nec porta sapien, vitae pulvinar nibh. Curabitur id arcu ac magna posuere tempor. Integer id posuere lacus. Donec fringilla dictum turpis molestie rhoncus. Mauris fermentum odio ante, vitae lacinia arcu dapibus id.\n \n \nNunc id velit quam. Ut viverra nec ex sed maximus. Proin vel magna ut quam luctus fringilla at nec tortor. Aliquam pharetra eget metus a elementum. Aenean rhoncus lectus tempor, tempus elit sed, efficitur risus. Sed commodo eget turpis et vehicula. Proin dignissim mi eget risus convallis faucibus. Sed ut nisi eget nunc tincidunt tempus nec eu leo.\n \n \nNam massa mauris, euismod vel tortor vel, finibus accumsan sem. Sed varius vulputate mi, at aliquam dolor rhoncus at. Nunc at luctus massa. Morbi interdum lectus elit, eu auctor ante facilisis ac. Sed a congue libero. In hac habitasse platea dictumst. Suspendisse aliquam ullamcorper odio, non faucibus neque semper quis. Nullam rhoncus varius nunc ut ullamcorper. Pellentesque mattis orci sed enim condimentum semper. Sed nec eros nec odio tristique malesuada. Quisque neque ligula, vehicula vel felis pulvinar, porta gravida sapien. Aenean sit amet efficitur est. Vivamus vel libero malesuada sapien maximus vestibulum. Curabitur feugiat laoreet tempor.\n \n From Our Blog\n ', 'Tips to Build a Beautiful Blog', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.', '/about/blog/tips-build-beautiful-blog', '2025-06-25 21:11:37', '2025-06-25 21:11:42', NULL, 0),
(261, '\n                                     Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi non justo ultricies, facilisis erat quis, vehicula leo. Duis massa ipsum, hendrerit et eleifend ut, eleifend ut metus. Sed venenatis dui sem, sit amet feugiat tortor porttitor interdum. Nulla feugiat risus ac tristique porta. Nulla facilisi. Nam ullamcorper dignissim velit at vestibulum. Suspendisse in libero nec augue aliquet hendrerit. Curabitur tincidunt nisi in tortor efficitur, quis commodo ex tincidunt. Nunc risus enim, dictum sit amet commodo tincidunt, tincidunt sit amet eros. Vivamus dapibus ac nibh eu congue. In rhoncus urna arcu, mattis vehicula augue convallis a. Integer a dui urna. Fusce sit amet neque id metus faucibus convallis. Duis lobortis orci at mollis iaculis. Aliquam lobortis semper turpis, non porttitor metus bibendum sit amet.\n \n \nPraesent efficitur iaculis mauris, vitae maximus lectus lacinia vitae. Aenean in mi augue. Donec eu consectetur purus. Quisque non laoreet lectus. Vestibulum nulla ex, sagittis a lacinia non, accumsan gravida ligula. Sed non euismod enim. Aliquam placerat felis sed turpis tempus sodales. Curabitur fringilla eros arcu, at porta nunc sagittis finibus.\n \n \nDuis non placerat justo. Proin eu neque luctus, lacinia turpis sed, feugiat enim. Etiam turpis erat, convallis sit amet magna et, maximus feugiat lorem. Cras accumsan condimentum sollicitudin. Maecenas pharetra faucibus tempor. Phasellus nec metus id odio dictum efficitur id ut diam. Phasellus quis arcu tincidunt, molestie nisl ut, vehicula lacus. Vivamus non accumsan magna. Proin blandit euismod dui, eget sodales mauris varius bibendum. Nam facilisis fermentum elit, in fringilla elit. Mauris erat arcu, malesuada at dolor quis, condimentum blandit felis. Mauris nec porta sapien, vitae pulvinar nibh. Curabitur id arcu ac magna posuere tempor. Integer id posuere lacus. Donec fringilla dictum turpis molestie rhoncus. Mauris fermentum odio ante, vitae lacinia arcu dapibus id.\n \n \nNunc id velit quam. Ut viverra nec ex sed maximus. Proin vel magna ut quam luctus fringilla at nec tortor. Aliquam pharetra eget metus a elementum. Aenean rhoncus lectus tempor, tempus elit sed, efficitur risus. Sed commodo eget turpis et vehicula. Proin dignissim mi eget risus convallis faucibus. Sed ut nisi eget nunc tincidunt tempus nec eu leo.\n \n \nNam massa mauris, euismod vel tortor vel, finibus accumsan sem. Sed varius vulputate mi, at aliquam dolor rhoncus at. Nunc at luctus massa. Morbi interdum lectus elit, eu auctor ante facilisis ac. Sed a congue libero. In hac habitasse platea dictumst. Suspendisse aliquam ullamcorper odio, non faucibus neque semper quis. Nullam rhoncus varius nunc ut ullamcorper. Pellentesque mattis orci sed enim condimentum semper. Sed nec eros nec odio tristique malesuada. Quisque neque ligula, vehicula vel felis pulvinar, porta gravida sapien. Aenean sit amet efficitur est. Vivamus vel libero malesuada sapien maximus vestibulum. Curabitur feugiat laoreet tempor.\n \n From Our Blog\n ', 'New Product Launch', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.', '/about/blog/new-product-launch', '2025-06-25 21:11:37', '2025-06-25 21:11:42', NULL, 0),
(262, '\n                                     Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi non justo ultricies, facilisis erat quis, vehicula leo. Duis massa ipsum, hendrerit et eleifend ut, eleifend ut metus. Sed venenatis dui sem, sit amet feugiat tortor porttitor interdum. Nulla feugiat risus ac tristique porta. Nulla facilisi. Nam ullamcorper dignissim velit at vestibulum. Suspendisse in libero nec augue aliquet hendrerit. Curabitur tincidunt nisi in tortor efficitur, quis commodo ex tincidunt. Nunc risus enim, dictum sit amet commodo tincidunt, tincidunt sit amet eros. Vivamus dapibus ac nibh eu congue. In rhoncus urna arcu, mattis vehicula augue convallis a. Integer a dui urna. Fusce sit amet neque id metus faucibus convallis. Duis lobortis orci at mollis iaculis. Aliquam lobortis semper turpis, non porttitor metus bibendum sit amet.\n \n \nPraesent efficitur iaculis mauris, vitae maximus lectus lacinia vitae. Aenean in mi augue. Donec eu consectetur purus. Quisque non laoreet lectus. Vestibulum nulla ex, sagittis a lacinia non, accumsan gravida ligula. Sed non euismod enim. Aliquam placerat felis sed turpis tempus sodales. Curabitur fringilla eros arcu, at porta nunc sagittis finibus.\n \n \nDuis non placerat justo. Proin eu neque luctus, lacinia turpis sed, feugiat enim. Etiam turpis erat, convallis sit amet magna et, maximus feugiat lorem. Cras accumsan condimentum sollicitudin. Maecenas pharetra faucibus tempor. Phasellus nec metus id odio dictum efficitur id ut diam. Phasellus quis arcu tincidunt, molestie nisl ut, vehicula lacus. Vivamus non accumsan magna. Proin blandit euismod dui, eget sodales mauris varius bibendum. Nam facilisis fermentum elit, in fringilla elit. Mauris erat arcu, malesuada at dolor quis, condimentum blandit felis. Mauris nec porta sapien, vitae pulvinar nibh. Curabitur id arcu ac magna posuere tempor. Integer id posuere lacus. Donec fringilla dictum turpis molestie rhoncus. Mauris fermentum odio ante, vitae lacinia arcu dapibus id.\n \n \nNunc id velit quam. Ut viverra nec ex sed maximus. Proin vel magna ut quam luctus fringilla at nec tortor. Aliquam pharetra eget metus a elementum. Aenean rhoncus lectus tempor, tempus elit sed, efficitur risus. Sed commodo eget turpis et vehicula. Proin dignissim mi eget risus convallis faucibus. Sed ut nisi eget nunc tincidunt tempus nec eu leo.\n \n \nNam massa mauris, euismod vel tortor vel, finibus accumsan sem. Sed varius vulputate mi, at aliquam dolor rhoncus at. Nunc at luctus massa. Morbi interdum lectus elit, eu auctor ante facilisis ac. Sed a congue libero. In hac habitasse platea dictumst. Suspendisse aliquam ullamcorper odio, non faucibus neque semper quis. Nullam rhoncus varius nunc ut ullamcorper. Pellentesque mattis orci sed enim condimentum semper. Sed nec eros nec odio tristique malesuada. Quisque neque ligula, vehicula vel felis pulvinar, porta gravida sapien. Aenean sit amet efficitur est. Vivamus vel libero malesuada sapien maximus vestibulum. Curabitur feugiat laoreet tempor.\n \n From Our Blog\n ', 'More Fine Posts Here', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.', '/about/blog/more-fine-posts-here', '2025-06-25 21:11:37', '2025-06-25 21:11:42', NULL, 0),
(263, '\n                                     Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi non justo ultricies, facilisis erat quis, vehicula leo. Duis massa ipsum, hendrerit et eleifend ut, eleifend ut metus. Sed venenatis dui sem, sit amet feugiat tortor porttitor interdum. Nulla feugiat risus ac tristique porta. Nulla facilisi. Nam ullamcorper dignissim velit at vestibulum. Suspendisse in libero nec augue aliquet hendrerit. Curabitur tincidunt nisi in tortor efficitur, quis commodo ex tincidunt. Nunc risus enim, dictum sit amet commodo tincidunt, tincidunt sit amet eros. Vivamus dapibus ac nibh eu congue. In rhoncus urna arcu, mattis vehicula augue convallis a. Integer a dui urna. Fusce sit amet neque id metus faucibus convallis. Duis lobortis orci at mollis iaculis. Aliquam lobortis semper turpis, non porttitor metus bibendum sit amet.\n \n \nPraesent efficitur iaculis mauris, vitae maximus lectus lacinia vitae. Aenean in mi augue. Donec eu consectetur purus. Quisque non laoreet lectus. Vestibulum nulla ex, sagittis a lacinia non, accumsan gravida ligula. Sed non euismod enim. Aliquam placerat felis sed turpis tempus sodales. Curabitur fringilla eros arcu, at porta nunc sagittis finibus.\n \n \nDuis non placerat justo. Proin eu neque luctus, lacinia turpis sed, feugiat enim. Etiam turpis erat, convallis sit amet magna et, maximus feugiat lorem. Cras accumsan condimentum sollicitudin. Maecenas pharetra faucibus tempor. Phasellus nec metus id odio dictum efficitur id ut diam. Phasellus quis arcu tincidunt, molestie nisl ut, vehicula lacus. Vivamus non accumsan magna. Proin blandit euismod dui, eget sodales mauris varius bibendum. Nam facilisis fermentum elit, in fringilla elit. Mauris erat arcu, malesuada at dolor quis, condimentum blandit felis. Mauris nec porta sapien, vitae pulvinar nibh. Curabitur id arcu ac magna posuere tempor. Integer id posuere lacus. Donec fringilla dictum turpis molestie rhoncus. Mauris fermentum odio ante, vitae lacinia arcu dapibus id.\n \n \nNunc id velit quam. Ut viverra nec ex sed maximus. Proin vel magna ut quam luctus fringilla at nec tortor. Aliquam pharetra eget metus a elementum. Aenean rhoncus lectus tempor, tempus elit sed, efficitur risus. Sed commodo eget turpis et vehicula. Proin dignissim mi eget risus convallis faucibus. Sed ut nisi eget nunc tincidunt tempus nec eu leo.\n \n \nNam massa mauris, euismod vel tortor vel, finibus accumsan sem. Sed varius vulputate mi, at aliquam dolor rhoncus at. Nunc at luctus massa. Morbi interdum lectus elit, eu auctor ante facilisis ac. Sed a congue libero. In hac habitasse platea dictumst. Suspendisse aliquam ullamcorper odio, non faucibus neque semper quis. Nullam rhoncus varius nunc ut ullamcorper. Pellentesque mattis orci sed enim condimentum semper. Sed nec eros nec odio tristique malesuada. Quisque neque ligula, vehicula vel felis pulvinar, porta gravida sapien. Aenean sit amet efficitur est. Vivamus vel libero malesuada sapien maximus vestibulum. Curabitur feugiat laoreet tempor.\n \n From Our Blog\n ', 'Here\'s a Tip You Might Not Know', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.', '/about/blog/heres-tip-you-might-not-know', '2025-06-25 21:11:37', '2025-06-25 21:11:43', NULL, 0),
(264, '\n                                     Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi non justo ultricies, facilisis erat quis, vehicula leo. Duis massa ipsum, hendrerit et eleifend ut, eleifend ut metus. Sed venenatis dui sem, sit amet feugiat tortor porttitor interdum. Nulla feugiat risus ac tristique porta. Nulla facilisi. Nam ullamcorper dignissim velit at vestibulum. Suspendisse in libero nec augue aliquet hendrerit. Curabitur tincidunt nisi in tortor efficitur, quis commodo ex tincidunt. Nunc risus enim, dictum sit amet commodo tincidunt, tincidunt sit amet eros. Vivamus dapibus ac nibh eu congue. In rhoncus urna arcu, mattis vehicula augue convallis a. Integer a dui urna. Fusce sit amet neque id metus faucibus convallis. Duis lobortis orci at mollis iaculis. Aliquam lobortis semper turpis, non porttitor metus bibendum sit amet.\n \n \nPraesent efficitur iaculis mauris, vitae maximus lectus lacinia vitae. Aenean in mi augue. Donec eu consectetur purus. Quisque non laoreet lectus. Vestibulum nulla ex, sagittis a lacinia non, accumsan gravida ligula. Sed non euismod enim. Aliquam placerat felis sed turpis tempus sodales. Curabitur fringilla eros arcu, at porta nunc sagittis finibus.\n \n \nDuis non placerat justo. Proin eu neque luctus, lacinia turpis sed, feugiat enim. Etiam turpis erat, convallis sit amet magna et, maximus feugiat lorem. Cras accumsan condimentum sollicitudin. Maecenas pharetra faucibus tempor. Phasellus nec metus id odio dictum efficitur id ut diam. Phasellus quis arcu tincidunt, molestie nisl ut, vehicula lacus. Vivamus non accumsan magna. Proin blandit euismod dui, eget sodales mauris varius bibendum. Nam facilisis fermentum elit, in fringilla elit. Mauris erat arcu, malesuada at dolor quis, condimentum blandit felis. Mauris nec porta sapien, vitae pulvinar nibh. Curabitur id arcu ac magna posuere tempor. Integer id posuere lacus. Donec fringilla dictum turpis molestie rhoncus. Mauris fermentum odio ante, vitae lacinia arcu dapibus id.\n \n \nNunc id velit quam. Ut viverra nec ex sed maximus. Proin vel magna ut quam luctus fringilla at nec tortor. Aliquam pharetra eget metus a elementum. Aenean rhoncus lectus tempor, tempus elit sed, efficitur risus. Sed commodo eget turpis et vehicula. Proin dignissim mi eget risus convallis faucibus. Sed ut nisi eget nunc tincidunt tempus nec eu leo.\n \n \nNam massa mauris, euismod vel tortor vel, finibus accumsan sem. Sed varius vulputate mi, at aliquam dolor rhoncus at. Nunc at luctus massa. Morbi interdum lectus elit, eu auctor ante facilisis ac. Sed a congue libero. In hac habitasse platea dictumst. Suspendisse aliquam ullamcorper odio, non faucibus neque semper quis. Nullam rhoncus varius nunc ut ullamcorper. Pellentesque mattis orci sed enim condimentum semper. Sed nec eros nec odio tristique malesuada. Quisque neque ligula, vehicula vel felis pulvinar, porta gravida sapien. Aenean sit amet efficitur est. Vivamus vel libero malesuada sapien maximus vestibulum. Curabitur feugiat laoreet tempor.\n \n From Our Blog\n ', 'Time to Freshen Up Your Website', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.', '/about/blog/freshen-up-your-website', '2025-06-25 21:11:37', '2025-06-25 21:11:43', NULL, 0),
(265, '\n                                     Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi non justo ultricies, facilisis erat quis, vehicula leo. Duis massa ipsum, hendrerit et eleifend ut, eleifend ut metus. Sed venenatis dui sem, sit amet feugiat tortor porttitor interdum. Nulla feugiat risus ac tristique porta. Nulla facilisi. Nam ullamcorper dignissim velit at vestibulum. Suspendisse in libero nec augue aliquet hendrerit. Curabitur tincidunt nisi in tortor efficitur, quis commodo ex tincidunt. Nunc risus enim, dictum sit amet commodo tincidunt, tincidunt sit amet eros. Vivamus dapibus ac nibh eu congue. In rhoncus urna arcu, mattis vehicula augue convallis a. Integer a dui urna. Fusce sit amet neque id metus faucibus convallis. Duis lobortis orci at mollis iaculis. Aliquam lobortis semper turpis, non porttitor metus bibendum sit amet.\n \n \nPraesent efficitur iaculis mauris, vitae maximus lectus lacinia vitae. Aenean in mi augue. Donec eu consectetur purus. Quisque non laoreet lectus. Vestibulum nulla ex, sagittis a lacinia non, accumsan gravida ligula. Sed non euismod enim. Aliquam placerat felis sed turpis tempus sodales. Curabitur fringilla eros arcu, at porta nunc sagittis finibus.\n \n \nDuis non placerat justo. Proin eu neque luctus, lacinia turpis sed, feugiat enim. Etiam turpis erat, convallis sit amet magna et, maximus feugiat lorem. Cras accumsan condimentum sollicitudin. Maecenas pharetra faucibus tempor. Phasellus nec metus id odio dictum efficitur id ut diam. Phasellus quis arcu tincidunt, molestie nisl ut, vehicula lacus. Vivamus non accumsan magna. Proin blandit euismod dui, eget sodales mauris varius bibendum. Nam facilisis fermentum elit, in fringilla elit. Mauris erat arcu, malesuada at dolor quis, condimentum blandit felis. Mauris nec porta sapien, vitae pulvinar nibh. Curabitur id arcu ac magna posuere tempor. Integer id posuere lacus. Donec fringilla dictum turpis molestie rhoncus. Mauris fermentum odio ante, vitae lacinia arcu dapibus id.\n \n \nNunc id velit quam. Ut viverra nec ex sed maximus. Proin vel magna ut quam luctus fringilla at nec tortor. Aliquam pharetra eget metus a elementum. Aenean rhoncus lectus tempor, tempus elit sed, efficitur risus. Sed commodo eget turpis et vehicula. Proin dignissim mi eget risus convallis faucibus. Sed ut nisi eget nunc tincidunt tempus nec eu leo.\n \n \nNam massa mauris, euismod vel tortor vel, finibus accumsan sem. Sed varius vulputate mi, at aliquam dolor rhoncus at. Nunc at luctus massa. Morbi interdum lectus elit, eu auctor ante facilisis ac. Sed a congue libero. In hac habitasse platea dictumst. Suspendisse aliquam ullamcorper odio, non faucibus neque semper quis. Nullam rhoncus varius nunc ut ullamcorper. Pellentesque mattis orci sed enim condimentum semper. Sed nec eros nec odio tristique malesuada. Quisque neque ligula, vehicula vel felis pulvinar, porta gravida sapien. Aenean sit amet efficitur est. Vivamus vel libero malesuada sapien maximus vestibulum. Curabitur feugiat laoreet tempor.\n \n From Our Blog\n ', 'Meet Our New Hires!', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.', '/about/blog/meet-our-new-hires', '2025-06-25 21:11:37', '2025-06-25 21:11:43', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `PageSummaryTemplateCustomCollection`
--

CREATE TABLE `PageSummaryTemplateCustomCollection` (
  `cID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PageSummaryTemplateCustomCollectionTemplates`
--

CREATE TABLE `PageSummaryTemplateCustomCollectionTemplates` (
  `template_id` int(11) NOT NULL,
  `cID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PageSummaryTemplates`
--

CREATE TABLE `PageSummaryTemplates` (
  `id` int(11) NOT NULL,
  `template_id` int(11) DEFAULT NULL,
  `cID` int(10) UNSIGNED NOT NULL,
  `data` longtext NOT NULL COMMENT '(DC2Type:json)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PageSummaryTemplates`
--

INSERT INTO `PageSummaryTemplates` (`id`, `template_id`, `cID`, `data`) VALUES
(1, 1, 1, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Home\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\LazyPageLinkDataFieldData\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864260\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(2, 2, 1, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Home\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\LazyPageLinkDataFieldData\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864260\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(3, 3, 1, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Home\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\LazyPageLinkDataFieldData\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864260\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(4, 4, 1, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Home\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\LazyPageLinkDataFieldData\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864260\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(5, 5, 1, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Home\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\LazyPageLinkDataFieldData\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864260\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(6, 6, 1, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Home\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\LazyPageLinkDataFieldData\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864260\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(7, 1, 239, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"About\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(8, 2, 239, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"About\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(9, 3, 239, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"About\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(10, 4, 239, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"About\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(11, 5, 239, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"About\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(12, 6, 239, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"About\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(13, 1, 247, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Services\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/services\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(14, 2, 247, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Services\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/services\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(15, 3, 247, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Services\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/services\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(16, 4, 247, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Services\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/services\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(17, 5, 247, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Services\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/services\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(18, 6, 247, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Services\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/services\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(19, 1, 249, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Blog\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(20, 2, 249, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Blog\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(21, 3, 249, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Blog\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(22, 4, 249, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Blog\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(23, 5, 249, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Blog\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(24, 6, 249, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Blog\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(25, 1, 250, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"FAQ\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/faq\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(26, 2, 250, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"FAQ\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/faq\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(27, 3, 250, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"FAQ\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/faq\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(28, 4, 250, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"FAQ\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/faq\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(29, 5, 250, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"FAQ\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/faq\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(30, 6, 250, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"FAQ\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/faq\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(31, 1, 251, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Contact Us\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/contact\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(32, 2, 251, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Contact Us\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/contact\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(33, 3, 251, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Contact Us\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/contact\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(34, 4, 251, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Contact Us\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/contact\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(35, 5, 251, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Contact Us\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/contact\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(36, 6, 251, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Contact Us\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/contact\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(37, 1, 240, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resources\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(38, 2, 240, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resources\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(39, 3, 240, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resources\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(40, 4, 240, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resources\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(41, 5, 240, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resources\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(42, 6, 240, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resources\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(43, 1, 260, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Tips to Build a Beautiful Blog\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/tips-build-beautiful-blog\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"6\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(44, 2, 260, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Tips to Build a Beautiful Blog\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/tips-build-beautiful-blog\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"6\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(45, 3, 260, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Tips to Build a Beautiful Blog\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/tips-build-beautiful-blog\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"6\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(46, 4, 260, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Tips to Build a Beautiful Blog\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/tips-build-beautiful-blog\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"6\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(47, 5, 260, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Tips to Build a Beautiful Blog\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/tips-build-beautiful-blog\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"6\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(48, 6, 260, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Tips to Build a Beautiful Blog\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/tips-build-beautiful-blog\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"6\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(49, 1, 261, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"New Product Launch\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/new-product-launch\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"32\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(50, 2, 261, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"New Product Launch\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/new-product-launch\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"32\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(51, 3, 261, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"New Product Launch\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/new-product-launch\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"32\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(52, 4, 261, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"New Product Launch\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/new-product-launch\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"32\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(53, 5, 261, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"New Product Launch\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/new-product-launch\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"32\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(54, 6, 261, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"New Product Launch\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/new-product-launch\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"32\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(55, 1, 262, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"More Fine Posts Here\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/more-fine-posts-here\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"26\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(56, 2, 262, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"More Fine Posts Here\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/more-fine-posts-here\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"26\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(57, 3, 262, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"More Fine Posts Here\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/more-fine-posts-here\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"26\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(58, 4, 262, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"More Fine Posts Here\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/more-fine-posts-here\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"26\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(59, 5, 262, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"More Fine Posts Here\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/more-fine-posts-here\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"26\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(60, 6, 262, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"More Fine Posts Here\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/more-fine-posts-here\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"26\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(61, 1, 263, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Here\'s a Tip You Might Not Know\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/heres-tip-you-might-not-know\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"18\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(62, 2, 263, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Here\'s a Tip You Might Not Know\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/heres-tip-you-might-not-know\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"18\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(63, 3, 263, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Here\'s a Tip You Might Not Know\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/heres-tip-you-might-not-know\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"18\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(64, 4, 263, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Here\'s a Tip You Might Not Know\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/heres-tip-you-might-not-know\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"18\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(65, 5, 263, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Here\'s a Tip You Might Not Know\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/heres-tip-you-might-not-know\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"18\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(66, 6, 263, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Here\'s a Tip You Might Not Know\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/heres-tip-you-might-not-know\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"18\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(67, 1, 264, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Time to Freshen Up Your Website\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/freshen-up-your-website\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"7\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(68, 2, 264, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Time to Freshen Up Your Website\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/freshen-up-your-website\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"7\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(69, 3, 264, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Time to Freshen Up Your Website\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/freshen-up-your-website\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"7\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(70, 4, 264, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Time to Freshen Up Your Website\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/freshen-up-your-website\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"7\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}');
INSERT INTO `PageSummaryTemplates` (`id`, `template_id`, `cID`, `data`) VALUES
(71, 5, 264, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Time to Freshen Up Your Website\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/freshen-up-your-website\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"7\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(72, 6, 264, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Time to Freshen Up Your Website\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/freshen-up-your-website\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"7\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(73, 1, 265, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Meet Our New Hires!\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/meet-our-new-hires\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"17\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(74, 2, 265, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Meet Our New Hires!\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/meet-our-new-hires\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"17\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(75, 3, 265, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Meet Our New Hires!\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/meet-our-new-hires\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"17\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(76, 4, 265, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Meet Our New Hires!\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/meet-our-new-hires\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"17\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(77, 5, 265, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Meet Our New Hires!\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/meet-our-new-hires\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"17\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(78, 6, 265, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Meet Our New Hires!\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/about\\/blog\\/meet-our-new-hires\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et.\"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"17\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(79, 1, 241, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Documents\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/documents\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(80, 2, 241, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Documents\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/documents\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(81, 3, 241, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Documents\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/documents\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(82, 4, 241, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Documents\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/documents\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(83, 5, 241, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Documents\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/documents\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(84, 6, 241, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Documents\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/documents\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(85, 1, 242, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Thanks for Subscribing\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/subscribe-thanks\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(86, 2, 242, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Thanks for Subscribing\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/subscribe-thanks\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(87, 3, 242, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Thanks for Subscribing\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/subscribe-thanks\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(88, 4, 242, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Thanks for Subscribing\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/subscribe-thanks\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(89, 5, 242, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Thanks for Subscribing\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/subscribe-thanks\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(90, 6, 242, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Thanks for Subscribing\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/subscribe-thanks\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(91, 1, 243, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Search\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/search\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(92, 2, 243, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Search\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/search\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(93, 3, 243, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Search\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/search\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(94, 4, 243, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Search\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/search\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(95, 5, 243, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Search\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/search\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(96, 6, 243, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Search\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/search\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(97, 1, 244, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Blog Search\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/blog-search\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(98, 2, 244, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Blog Search\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/blog-search\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(99, 3, 244, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Blog Search\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/blog-search\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(100, 4, 244, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Blog Search\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/blog-search\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(101, 5, 244, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Blog Search\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/blog-search\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(102, 6, 244, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Blog Search\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/blog-search\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864296\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(103, 1, 253, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource One\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-one\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"36\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(104, 2, 253, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource One\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-one\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"36\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(105, 3, 253, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource One\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-one\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"36\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(106, 4, 253, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource One\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-one\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"36\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(107, 5, 253, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource One\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-one\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"36\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(108, 6, 253, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource One\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-one\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"36\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(109, 1, 254, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Two\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-two\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"13\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(110, 2, 254, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Two\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-two\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"13\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(111, 3, 254, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Two\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-two\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"13\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(112, 4, 254, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Two\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-two\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"13\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(113, 5, 254, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Two\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-two\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"13\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(114, 6, 254, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Two\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-two\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"13\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(115, 1, 255, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Three\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-three\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"8\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(116, 2, 255, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Three\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-three\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"8\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(117, 3, 255, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Three\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-three\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"8\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(118, 4, 255, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Three\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-three\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"8\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(119, 5, 255, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Three\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-three\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"8\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(120, 6, 255, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Three\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-three\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"8\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(121, 1, 256, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Four\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-four\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"29\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(122, 2, 256, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Four\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-four\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"29\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(123, 3, 256, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Four\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-four\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"29\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(124, 4, 256, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Four\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-four\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"29\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(125, 5, 256, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Four\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-four\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"29\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(126, 6, 256, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Four\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-four\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"29\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(127, 1, 257, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Five\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-five\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"7\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(128, 2, 257, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Five\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-five\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"7\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(129, 3, 257, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Five\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-five\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"7\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(130, 4, 257, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Five\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-five\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"7\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(131, 5, 257, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Five\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-five\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"7\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(132, 6, 257, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Five\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-five\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"7\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(133, 1, 258, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Six\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-six\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"17\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}');
INSERT INTO `PageSummaryTemplates` (`id`, `template_id`, `cID`, `data`) VALUES
(134, 2, 258, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Six\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-six\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"17\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(135, 3, 258, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Six\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-six\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"17\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(136, 4, 258, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Six\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-six\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"17\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(137, 5, 258, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Six\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-six\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"17\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(138, 6, 258, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Resource Six\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/resources\\/resource-six\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"description\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas varius tortor nibh, sit amet tempor nibh finibus et. \"},\"thumbnail\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\ImageDataFieldData\",\"fID\":\"17\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(139, 1, 246, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Privacy Policy\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/privacy-policy\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(140, 2, 246, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Privacy Policy\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/privacy-policy\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(141, 3, 246, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Privacy Policy\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/privacy-policy\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(142, 4, 246, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Privacy Policy\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/privacy-policy\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(143, 5, 246, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Privacy Policy\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/privacy-policy\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}'),
(144, 6, 246, '{\"fields\":{\"title\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DataFieldData\",\"data\":\"Privacy Policy\"},\"link\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\PagePathLinkDataFieldData\",\"link\":\"\\/privacy-policy\"},\"date\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\DatetimeDataFieldData\",\"timestamp\":\"1750864297\",\"timezone\":\"Asia\\/Dhaka\"},\"author\":{\"class\":\"Concrete\\\\Core\\\\Summary\\\\Data\\\\Field\\\\AuthorDataFieldData\",\"author\":{\"name\":\"admin\",\"id\":1}}}}');

-- --------------------------------------------------------

--
-- Table structure for table `PageTemplates`
--

CREATE TABLE `PageTemplates` (
  `pTemplateID` int(11) NOT NULL,
  `pTemplateHandle` varchar(255) NOT NULL,
  `pTemplateIcon` varchar(255) NOT NULL,
  `pTemplateName` varchar(255) NOT NULL,
  `pTemplateIsInternal` tinyint(1) NOT NULL,
  `pkgID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PageTemplates`
--

INSERT INTO `PageTemplates` (`pTemplateID`, `pTemplateHandle`, `pTemplateIcon`, `pTemplateName`, `pTemplateIsInternal`, `pkgID`) VALUES
(1, 'core_stack', '', 'Stack', 1, 0),
(2, 'core_theme_documentation', '', 'Theme Documentation', 1, 0),
(3, 'desktop', '', 'Desktop', 1, 0),
(4, 'full', 'full.png', 'Full', 0, 0),
(5, 'left_sidebar', 'left_sidebar.png', 'Left Sidebar', 0, 0),
(6, 'right_sidebar', 'right_sidebar.png', 'Right Sidebar', 0, 0),
(7, 'resource_detail', 'two_column.png', 'Resource Detail', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `PageThemeCustomSkins`
--

CREATE TABLE `PageThemeCustomSkins` (
  `skinID` int(11) NOT NULL,
  `skinIdentifier` varchar(255) NOT NULL,
  `pThemeID` int(10) UNSIGNED NOT NULL,
  `skinName` varchar(255) NOT NULL,
  `presetStartingPoint` varchar(255) NOT NULL,
  `dateCreated` int(10) UNSIGNED NOT NULL,
  `dateUpdated` int(10) UNSIGNED NOT NULL,
  `variableCollection` longtext NOT NULL COMMENT '(DC2Type:json)',
  `customCss` longtext NOT NULL,
  `uID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PageThemeCustomStyles`
--

CREATE TABLE `PageThemeCustomStyles` (
  `pThemeID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `scvlID` int(10) UNSIGNED DEFAULT 0,
  `preset` varchar(255) DEFAULT NULL,
  `sccRecordID` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PageThemes`
--

CREATE TABLE `PageThemes` (
  `pThemeID` int(10) UNSIGNED NOT NULL,
  `pThemeHandle` varchar(64) NOT NULL,
  `pThemeName` varchar(255) DEFAULT NULL,
  `pThemeDescription` text DEFAULT NULL,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pThemeHasCustomClass` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PageThemes`
--

INSERT INTO `PageThemes` (`pThemeID`, `pThemeHandle`, `pThemeName`, `pThemeDescription`, `pkgID`, `pThemeHasCustomClass`) VALUES
(1, 'atomik', 'Atomik', 'A Concrete CMS theme built for version 9.', 0, 1),
(2, 'elemental', 'Elemental', 'Elegant, spacious theme with support for blogs, portfolios, layouts and more.', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `PageTypeComposerControlTypes`
--

CREATE TABLE `PageTypeComposerControlTypes` (
  `ptComposerControlTypeID` int(10) UNSIGNED NOT NULL,
  `ptComposerControlTypeHandle` varchar(255) DEFAULT NULL,
  `ptComposerControlTypeName` varchar(255) DEFAULT NULL,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PageTypeComposerControlTypes`
--

INSERT INTO `PageTypeComposerControlTypes` (`ptComposerControlTypeID`, `ptComposerControlTypeHandle`, `ptComposerControlTypeName`, `pkgID`) VALUES
(1, 'core_page_property', 'Built-In Property', 0),
(2, 'collection_attribute', 'Custom Attribute', 0),
(3, 'block', 'Block', 0);

-- --------------------------------------------------------

--
-- Table structure for table `PageTypeComposerFormLayoutSetControls`
--

CREATE TABLE `PageTypeComposerFormLayoutSetControls` (
  `ptComposerFormLayoutSetControlID` int(10) UNSIGNED NOT NULL,
  `ptComposerFormLayoutSetID` int(10) UNSIGNED DEFAULT 0,
  `ptComposerControlTypeID` int(10) UNSIGNED DEFAULT 0,
  `ptComposerControlObject` longtext DEFAULT NULL,
  `ptComposerFormLayoutSetControlDisplayOrder` int(10) UNSIGNED DEFAULT 0,
  `ptComposerFormLayoutSetControlCustomLabel` varchar(255) DEFAULT NULL,
  `ptComposerFormLayoutSetControlCustomTemplate` varchar(255) DEFAULT NULL,
  `ptComposerFormLayoutSetControlDescription` varchar(255) DEFAULT NULL,
  `ptComposerFormLayoutSetControlRequired` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PageTypeComposerFormLayoutSetControls`
--

INSERT INTO `PageTypeComposerFormLayoutSetControls` (`ptComposerFormLayoutSetControlID`, `ptComposerFormLayoutSetID`, `ptComposerControlTypeID`, `ptComposerControlObject`, `ptComposerFormLayoutSetControlDisplayOrder`, `ptComposerFormLayoutSetControlCustomLabel`, `ptComposerFormLayoutSetControlCustomTemplate`, `ptComposerFormLayoutSetControlDescription`, `ptComposerFormLayoutSetControlRequired`) VALUES
(1, 1, 1, 'O:78:\"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\NameCorePageProperty\":13:{s:5:\"error\";s:0:\"\";s:7:\"\0*\0page\";N;s:30:\"\0*\0ptComposerControlIdentifier\";s:4:\"name\";s:24:\"\0*\0ptComposerControlName\";N;s:27:\"\0*\0ptComposerControlIconSRC\";N;s:33:\"\0*\0ptComposerControlIconFormatter\";O:48:\"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter\":1:{s:7:\"\0*\0icon\";s:8:\"file-alt\";}s:20:\"\0*\0ptComposerControl\";N;s:37:\"\0*\0ptComposerControlRequiredByDefault\";b:1;s:41:\"\0*\0ptComposerControlRequiredOnThisRequest\";b:0;s:31:\"\0*\0ptComposerControlCustomLabel\";N;s:31:\"\0*\0ptComposerControlDescription\";N;s:17:\"\0*\0propertyHandle\";s:4:\"name\";s:30:\"\0*\0ptComposerControlTypeHandle\";s:18:\"core_page_property\";}', 0, 'Page Name', NULL, NULL, 1),
(2, 1, 1, 'O:85:\"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\DescriptionCorePageProperty\":13:{s:5:\"error\";s:0:\"\";s:7:\"\0*\0page\";N;s:30:\"\0*\0ptComposerControlIdentifier\";s:11:\"description\";s:24:\"\0*\0ptComposerControlName\";N;s:27:\"\0*\0ptComposerControlIconSRC\";N;s:33:\"\0*\0ptComposerControlIconFormatter\";O:48:\"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter\":1:{s:7:\"\0*\0icon\";s:4:\"font\";}s:20:\"\0*\0ptComposerControl\";N;s:37:\"\0*\0ptComposerControlRequiredByDefault\";b:0;s:41:\"\0*\0ptComposerControlRequiredOnThisRequest\";b:0;s:31:\"\0*\0ptComposerControlCustomLabel\";N;s:31:\"\0*\0ptComposerControlDescription\";N;s:17:\"\0*\0propertyHandle\";s:11:\"description\";s:30:\"\0*\0ptComposerControlTypeHandle\";s:18:\"core_page_property\";}', 1, NULL, NULL, NULL, 0),
(3, 1, 1, 'O:81:\"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\UrlSlugCorePageProperty\":13:{s:5:\"error\";s:0:\"\";s:7:\"\0*\0page\";N;s:30:\"\0*\0ptComposerControlIdentifier\";s:8:\"url_slug\";s:24:\"\0*\0ptComposerControlName\";N;s:27:\"\0*\0ptComposerControlIconSRC\";N;s:33:\"\0*\0ptComposerControlIconFormatter\";O:48:\"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter\":1:{s:7:\"\0*\0icon\";s:8:\"file-alt\";}s:20:\"\0*\0ptComposerControl\";N;s:37:\"\0*\0ptComposerControlRequiredByDefault\";b:0;s:41:\"\0*\0ptComposerControlRequiredOnThisRequest\";b:0;s:31:\"\0*\0ptComposerControlCustomLabel\";N;s:31:\"\0*\0ptComposerControlDescription\";N;s:17:\"\0*\0propertyHandle\";s:8:\"url_slug\";s:30:\"\0*\0ptComposerControlTypeHandle\";s:18:\"core_page_property\";}', 2, NULL, NULL, NULL, 0),
(4, 1, 1, 'O:86:\"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\PageTemplateCorePageProperty\":13:{s:5:\"error\";s:0:\"\";s:7:\"\0*\0page\";N;s:30:\"\0*\0ptComposerControlIdentifier\";s:13:\"page_template\";s:24:\"\0*\0ptComposerControlName\";N;s:27:\"\0*\0ptComposerControlIconSRC\";N;s:33:\"\0*\0ptComposerControlIconFormatter\";O:48:\"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter\":1:{s:7:\"\0*\0icon\";s:8:\"list-alt\";}s:20:\"\0*\0ptComposerControl\";N;s:37:\"\0*\0ptComposerControlRequiredByDefault\";b:0;s:41:\"\0*\0ptComposerControlRequiredOnThisRequest\";b:0;s:31:\"\0*\0ptComposerControlCustomLabel\";N;s:31:\"\0*\0ptComposerControlDescription\";N;s:17:\"\0*\0propertyHandle\";s:13:\"page_template\";s:30:\"\0*\0ptComposerControlTypeHandle\";s:18:\"core_page_property\";}', 3, NULL, NULL, NULL, 0),
(5, 1, 1, 'O:87:\"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\PublishTargetCorePageProperty\":13:{s:5:\"error\";s:0:\"\";s:7:\"\0*\0page\";N;s:30:\"\0*\0ptComposerControlIdentifier\";s:14:\"publish_target\";s:24:\"\0*\0ptComposerControlName\";N;s:27:\"\0*\0ptComposerControlIconSRC\";N;s:33:\"\0*\0ptComposerControlIconFormatter\";O:48:\"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter\":1:{s:7:\"\0*\0icon\";s:8:\"download\";}s:20:\"\0*\0ptComposerControl\";N;s:37:\"\0*\0ptComposerControlRequiredByDefault\";b:0;s:41:\"\0*\0ptComposerControlRequiredOnThisRequest\";b:0;s:31:\"\0*\0ptComposerControlCustomLabel\";N;s:31:\"\0*\0ptComposerControlDescription\";N;s:17:\"\0*\0propertyHandle\";s:14:\"publish_target\";s:30:\"\0*\0ptComposerControlTypeHandle\";s:18:\"core_page_property\";}', 4, NULL, NULL, NULL, 0),
(6, 2, 3, 'O:53:\"Concrete\\Core\\Page\\Type\\Composer\\Control\\BlockControl\":16:{s:5:\"error\";s:0:\"\";s:7:\"\0*\0page\";N;s:30:\"\0*\0ptComposerControlIdentifier\";i:1;s:24:\"\0*\0ptComposerControlName\";s:7:\"Content\";s:27:\"\0*\0ptComposerControlIconSRC\";s:43:\"/concrete5/concrete/blocks/content/icon.png\";s:33:\"\0*\0ptComposerControlIconFormatter\";N;s:20:\"\0*\0ptComposerControl\";N;s:37:\"\0*\0ptComposerControlRequiredByDefault\";b:0;s:41:\"\0*\0ptComposerControlRequiredOnThisRequest\";b:0;s:31:\"\0*\0ptComposerControlCustomLabel\";N;s:31:\"\0*\0ptComposerControlDescription\";N;s:7:\"\0*\0btID\";i:1;s:30:\"\0*\0ptComposerControlTypeHandle\";s:5:\"block\";s:5:\"\0*\0bt\";b:0;s:4:\"\0*\0b\";b:0;s:13:\"\0*\0controller\";N;}', 0, 'Body', NULL, NULL, 0),
(7, 3, 1, 'O:78:\"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\NameCorePageProperty\":13:{s:5:\"error\";s:0:\"\";s:7:\"\0*\0page\";N;s:30:\"\0*\0ptComposerControlIdentifier\";s:4:\"name\";s:24:\"\0*\0ptComposerControlName\";N;s:27:\"\0*\0ptComposerControlIconSRC\";N;s:33:\"\0*\0ptComposerControlIconFormatter\";O:48:\"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter\":1:{s:7:\"\0*\0icon\";s:8:\"file-alt\";}s:20:\"\0*\0ptComposerControl\";N;s:37:\"\0*\0ptComposerControlRequiredByDefault\";b:1;s:41:\"\0*\0ptComposerControlRequiredOnThisRequest\";b:0;s:31:\"\0*\0ptComposerControlCustomLabel\";N;s:31:\"\0*\0ptComposerControlDescription\";N;s:17:\"\0*\0propertyHandle\";s:4:\"name\";s:30:\"\0*\0ptComposerControlTypeHandle\";s:18:\"core_page_property\";}', 0, 'Entry Name', NULL, NULL, 0),
(8, 3, 1, 'O:81:\"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\UrlSlugCorePageProperty\":13:{s:5:\"error\";s:0:\"\";s:7:\"\0*\0page\";N;s:30:\"\0*\0ptComposerControlIdentifier\";s:8:\"url_slug\";s:24:\"\0*\0ptComposerControlName\";N;s:27:\"\0*\0ptComposerControlIconSRC\";N;s:33:\"\0*\0ptComposerControlIconFormatter\";O:48:\"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter\":1:{s:7:\"\0*\0icon\";s:8:\"file-alt\";}s:20:\"\0*\0ptComposerControl\";N;s:37:\"\0*\0ptComposerControlRequiredByDefault\";b:0;s:41:\"\0*\0ptComposerControlRequiredOnThisRequest\";b:0;s:31:\"\0*\0ptComposerControlCustomLabel\";N;s:31:\"\0*\0ptComposerControlDescription\";N;s:17:\"\0*\0propertyHandle\";s:8:\"url_slug\";s:30:\"\0*\0ptComposerControlTypeHandle\";s:18:\"core_page_property\";}', 1, NULL, NULL, NULL, 0),
(9, 3, 1, 'O:85:\"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\DescriptionCorePageProperty\":13:{s:5:\"error\";s:0:\"\";s:7:\"\0*\0page\";N;s:30:\"\0*\0ptComposerControlIdentifier\";s:11:\"description\";s:24:\"\0*\0ptComposerControlName\";N;s:27:\"\0*\0ptComposerControlIconSRC\";N;s:33:\"\0*\0ptComposerControlIconFormatter\";O:48:\"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter\":1:{s:7:\"\0*\0icon\";s:4:\"font\";}s:20:\"\0*\0ptComposerControl\";N;s:37:\"\0*\0ptComposerControlRequiredByDefault\";b:0;s:41:\"\0*\0ptComposerControlRequiredOnThisRequest\";b:0;s:31:\"\0*\0ptComposerControlCustomLabel\";N;s:31:\"\0*\0ptComposerControlDescription\";N;s:17:\"\0*\0propertyHandle\";s:11:\"description\";s:30:\"\0*\0ptComposerControlTypeHandle\";s:18:\"core_page_property\";}', 2, 'Short Description', NULL, NULL, 0),
(10, 3, 1, 'O:87:\"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\PublishTargetCorePageProperty\":13:{s:5:\"error\";s:0:\"\";s:7:\"\0*\0page\";N;s:30:\"\0*\0ptComposerControlIdentifier\";s:14:\"publish_target\";s:24:\"\0*\0ptComposerControlName\";N;s:27:\"\0*\0ptComposerControlIconSRC\";N;s:33:\"\0*\0ptComposerControlIconFormatter\";O:48:\"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter\":1:{s:7:\"\0*\0icon\";s:8:\"download\";}s:20:\"\0*\0ptComposerControl\";N;s:37:\"\0*\0ptComposerControlRequiredByDefault\";b:0;s:41:\"\0*\0ptComposerControlRequiredOnThisRequest\";b:0;s:31:\"\0*\0ptComposerControlCustomLabel\";N;s:31:\"\0*\0ptComposerControlDescription\";N;s:17:\"\0*\0propertyHandle\";s:14:\"publish_target\";s:30:\"\0*\0ptComposerControlTypeHandle\";s:18:\"core_page_property\";}', 3, NULL, NULL, NULL, 0),
(11, 3, 2, 'O:67:\"Concrete\\Core\\Page\\Type\\Composer\\Control\\CollectionAttributeControl\":1:{s:7:\"\0*\0akID\";i:28;}', 4, 'Topics', NULL, NULL, 0),
(12, 4, 2, 'O:67:\"Concrete\\Core\\Page\\Type\\Composer\\Control\\CollectionAttributeControl\":1:{s:7:\"\0*\0akID\";i:21;}', 0, NULL, NULL, NULL, 0),
(13, 4, 3, 'O:53:\"Concrete\\Core\\Page\\Type\\Composer\\Control\\BlockControl\":16:{s:5:\"error\";s:0:\"\";s:7:\"\0*\0page\";N;s:30:\"\0*\0ptComposerControlIdentifier\";i:1;s:24:\"\0*\0ptComposerControlName\";s:7:\"Content\";s:27:\"\0*\0ptComposerControlIconSRC\";s:43:\"/concrete5/concrete/blocks/content/icon.png\";s:33:\"\0*\0ptComposerControlIconFormatter\";N;s:20:\"\0*\0ptComposerControl\";N;s:37:\"\0*\0ptComposerControlRequiredByDefault\";b:0;s:41:\"\0*\0ptComposerControlRequiredOnThisRequest\";b:0;s:31:\"\0*\0ptComposerControlCustomLabel\";N;s:31:\"\0*\0ptComposerControlDescription\";N;s:7:\"\0*\0btID\";i:1;s:30:\"\0*\0ptComposerControlTypeHandle\";s:5:\"block\";s:5:\"\0*\0bt\";b:0;s:4:\"\0*\0b\";b:0;s:13:\"\0*\0controller\";N;}', 1, NULL, NULL, NULL, 0),
(14, 5, 1, 'O:78:\"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\NameCorePageProperty\":13:{s:5:\"error\";s:0:\"\";s:7:\"\0*\0page\";N;s:30:\"\0*\0ptComposerControlIdentifier\";s:4:\"name\";s:24:\"\0*\0ptComposerControlName\";N;s:27:\"\0*\0ptComposerControlIconSRC\";N;s:33:\"\0*\0ptComposerControlIconFormatter\";O:48:\"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter\":1:{s:7:\"\0*\0icon\";s:8:\"file-alt\";}s:20:\"\0*\0ptComposerControl\";N;s:37:\"\0*\0ptComposerControlRequiredByDefault\";b:1;s:41:\"\0*\0ptComposerControlRequiredOnThisRequest\";b:0;s:31:\"\0*\0ptComposerControlCustomLabel\";N;s:31:\"\0*\0ptComposerControlDescription\";N;s:17:\"\0*\0propertyHandle\";s:4:\"name\";s:30:\"\0*\0ptComposerControlTypeHandle\";s:18:\"core_page_property\";}', 0, NULL, NULL, NULL, 0),
(15, 5, 1, 'O:87:\"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\PublishTargetCorePageProperty\":13:{s:5:\"error\";s:0:\"\";s:7:\"\0*\0page\";N;s:30:\"\0*\0ptComposerControlIdentifier\";s:14:\"publish_target\";s:24:\"\0*\0ptComposerControlName\";N;s:27:\"\0*\0ptComposerControlIconSRC\";N;s:33:\"\0*\0ptComposerControlIconFormatter\";O:48:\"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter\":1:{s:7:\"\0*\0icon\";s:8:\"download\";}s:20:\"\0*\0ptComposerControl\";N;s:37:\"\0*\0ptComposerControlRequiredByDefault\";b:0;s:41:\"\0*\0ptComposerControlRequiredOnThisRequest\";b:0;s:31:\"\0*\0ptComposerControlCustomLabel\";N;s:31:\"\0*\0ptComposerControlDescription\";N;s:17:\"\0*\0propertyHandle\";s:14:\"publish_target\";s:30:\"\0*\0ptComposerControlTypeHandle\";s:18:\"core_page_property\";}', 1, NULL, NULL, NULL, 0),
(16, 6, 1, 'O:78:\"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\NameCorePageProperty\":13:{s:5:\"error\";s:0:\"\";s:7:\"\0*\0page\";N;s:30:\"\0*\0ptComposerControlIdentifier\";s:4:\"name\";s:24:\"\0*\0ptComposerControlName\";N;s:27:\"\0*\0ptComposerControlIconSRC\";N;s:33:\"\0*\0ptComposerControlIconFormatter\";O:48:\"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter\":1:{s:7:\"\0*\0icon\";s:8:\"file-alt\";}s:20:\"\0*\0ptComposerControl\";N;s:37:\"\0*\0ptComposerControlRequiredByDefault\";b:1;s:41:\"\0*\0ptComposerControlRequiredOnThisRequest\";b:0;s:31:\"\0*\0ptComposerControlCustomLabel\";N;s:31:\"\0*\0ptComposerControlDescription\";N;s:17:\"\0*\0propertyHandle\";s:4:\"name\";s:30:\"\0*\0ptComposerControlTypeHandle\";s:18:\"core_page_property\";}', 0, NULL, NULL, NULL, 1),
(17, 6, 1, 'O:82:\"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\DateTimeCorePageProperty\":13:{s:5:\"error\";s:0:\"\";s:7:\"\0*\0page\";N;s:30:\"\0*\0ptComposerControlIdentifier\";s:9:\"date_time\";s:24:\"\0*\0ptComposerControlName\";N;s:27:\"\0*\0ptComposerControlIconSRC\";N;s:33:\"\0*\0ptComposerControlIconFormatter\";O:48:\"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter\":1:{s:7:\"\0*\0icon\";s:8:\"calendar\";}s:20:\"\0*\0ptComposerControl\";N;s:37:\"\0*\0ptComposerControlRequiredByDefault\";b:0;s:41:\"\0*\0ptComposerControlRequiredOnThisRequest\";b:0;s:31:\"\0*\0ptComposerControlCustomLabel\";N;s:31:\"\0*\0ptComposerControlDescription\";N;s:17:\"\0*\0propertyHandle\";s:9:\"date_time\";s:30:\"\0*\0ptComposerControlTypeHandle\";s:18:\"core_page_property\";}', 1, 'Date Posted', NULL, NULL, 0),
(18, 6, 2, 'O:67:\"Concrete\\Core\\Page\\Type\\Composer\\Control\\CollectionAttributeControl\":1:{s:7:\"\0*\0akID\";i:10;}', 2, NULL, NULL, NULL, 0),
(19, 6, 2, 'O:67:\"Concrete\\Core\\Page\\Type\\Composer\\Control\\CollectionAttributeControl\":1:{s:7:\"\0*\0akID\";i:21;}', 3, NULL, NULL, NULL, 0),
(20, 6, 3, 'O:53:\"Concrete\\Core\\Page\\Type\\Composer\\Control\\BlockControl\":16:{s:5:\"error\";s:0:\"\";s:7:\"\0*\0page\";N;s:30:\"\0*\0ptComposerControlIdentifier\";i:1;s:24:\"\0*\0ptComposerControlName\";s:7:\"Content\";s:27:\"\0*\0ptComposerControlIconSRC\";s:43:\"/concrete5/concrete/blocks/content/icon.png\";s:33:\"\0*\0ptComposerControlIconFormatter\";N;s:20:\"\0*\0ptComposerControl\";N;s:37:\"\0*\0ptComposerControlRequiredByDefault\";b:0;s:41:\"\0*\0ptComposerControlRequiredOnThisRequest\";b:0;s:31:\"\0*\0ptComposerControlCustomLabel\";N;s:31:\"\0*\0ptComposerControlDescription\";N;s:7:\"\0*\0btID\";i:1;s:30:\"\0*\0ptComposerControlTypeHandle\";s:5:\"block\";s:5:\"\0*\0bt\";b:0;s:4:\"\0*\0b\";b:0;s:13:\"\0*\0controller\";N;}', 4, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `PageTypeComposerFormLayoutSets`
--

CREATE TABLE `PageTypeComposerFormLayoutSets` (
  `ptComposerFormLayoutSetID` int(10) UNSIGNED NOT NULL,
  `ptID` int(10) UNSIGNED DEFAULT 0,
  `ptComposerFormLayoutSetName` varchar(255) DEFAULT NULL,
  `ptComposerFormLayoutSetDescription` text DEFAULT NULL,
  `ptComposerFormLayoutSetCollapseType` varchar(12) DEFAULT NULL,
  `ptComposerFormLayoutSetDisplayOrder` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PageTypeComposerFormLayoutSets`
--

INSERT INTO `PageTypeComposerFormLayoutSets` (`ptComposerFormLayoutSetID`, `ptID`, `ptComposerFormLayoutSetName`, `ptComposerFormLayoutSetDescription`, `ptComposerFormLayoutSetCollapseType`, `ptComposerFormLayoutSetDisplayOrder`) VALUES
(1, 6, 'Basics', '', '', 0),
(2, 6, 'Content', '', '', 1),
(3, 7, 'Post Details', '', '', 0),
(4, 7, 'Content', '', '', 1),
(5, 8, 'Details', '', '', 0),
(6, 9, '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `PageTypeComposerOutputBlocks`
--

CREATE TABLE `PageTypeComposerOutputBlocks` (
  `ptComposerOutputBlockID` int(10) UNSIGNED NOT NULL,
  `cID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cvID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `arHandle` varchar(255) DEFAULT NULL,
  `cbDisplayOrder` int(10) UNSIGNED DEFAULT 0,
  `ptComposerFormLayoutSetControlID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `bID` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PageTypeComposerOutputControls`
--

CREATE TABLE `PageTypeComposerOutputControls` (
  `ptComposerOutputControlID` int(10) UNSIGNED NOT NULL,
  `pTemplateID` int(10) UNSIGNED DEFAULT 0,
  `ptID` int(10) UNSIGNED DEFAULT 0,
  `ptComposerFormLayoutSetControlID` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PageTypeComposerOutputControls`
--

INSERT INTO `PageTypeComposerOutputControls` (`ptComposerOutputControlID`, `pTemplateID`, `ptID`, `ptComposerFormLayoutSetControlID`) VALUES
(1, 4, 6, 6),
(2, 5, 6, 6),
(3, 7, 6, 6),
(4, 6, 6, 6),
(5, 6, 7, 13),
(6, 7, 9, 20);

-- --------------------------------------------------------

--
-- Table structure for table `PageTypePageTemplateDefaultPages`
--

CREATE TABLE `PageTypePageTemplateDefaultPages` (
  `pTemplateID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ptID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cID` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PageTypePageTemplateDefaultPages`
--

INSERT INTO `PageTypePageTemplateDefaultPages` (`pTemplateID`, `ptID`, `cID`) VALUES
(4, 6, 238),
(5, 6, 245),
(4, 8, 248),
(7, 9, 252),
(6, 7, 259);

-- --------------------------------------------------------

--
-- Table structure for table `PageTypePageTemplates`
--

CREATE TABLE `PageTypePageTemplates` (
  `ptID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pTemplateID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PageTypePageTemplates`
--

INSERT INTO `PageTypePageTemplates` (`ptID`, `pTemplateID`) VALUES
(7, 6),
(8, 4),
(9, 7);

-- --------------------------------------------------------

--
-- Table structure for table `PageTypePermissionAssignments`
--

CREATE TABLE `PageTypePermissionAssignments` (
  `ptID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pkID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PageTypePermissionAssignments`
--

INSERT INTO `PageTypePermissionAssignments` (`ptID`, `pkID`, `paID`) VALUES
(1, 60, 37),
(1, 61, 37),
(1, 62, 37),
(1, 63, 37),
(1, 64, 60),
(2, 60, 37),
(2, 61, 37),
(2, 62, 37),
(2, 63, 37),
(2, 64, 61),
(3, 60, 37),
(3, 61, 37),
(3, 62, 37),
(3, 63, 37),
(3, 64, 62),
(4, 60, 37),
(4, 61, 37),
(4, 62, 37),
(4, 63, 37),
(4, 64, 63),
(5, 60, 37),
(5, 61, 37),
(5, 62, 37),
(5, 63, 37),
(5, 64, 64),
(6, 60, 37),
(6, 61, 37),
(6, 62, 37),
(6, 63, 37),
(6, 64, 68),
(7, 60, 37),
(7, 61, 37),
(7, 62, 37),
(7, 63, 37),
(7, 64, 69),
(8, 60, 37),
(8, 61, 37),
(8, 62, 37),
(8, 63, 37),
(8, 64, 70),
(9, 60, 37),
(9, 61, 37),
(9, 62, 37),
(9, 63, 37),
(9, 64, 71);

-- --------------------------------------------------------

--
-- Table structure for table `PageTypePublishTargetTypes`
--

CREATE TABLE `PageTypePublishTargetTypes` (
  `ptPublishTargetTypeID` int(10) UNSIGNED NOT NULL,
  `ptPublishTargetTypeHandle` varchar(255) DEFAULT NULL,
  `ptPublishTargetTypeName` varchar(255) DEFAULT NULL,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PageTypePublishTargetTypes`
--

INSERT INTO `PageTypePublishTargetTypes` (`ptPublishTargetTypeID`, `ptPublishTargetTypeHandle`, `ptPublishTargetTypeName`, `pkgID`) VALUES
(1, 'parent_page', 'Always publish below a certain page', 0),
(2, 'page_type', 'Choose from pages of a certain type', 0),
(3, 'all', 'Choose from all pages when publishing', 0);

-- --------------------------------------------------------

--
-- Table structure for table `PageTypes`
--

CREATE TABLE `PageTypes` (
  `ptID` int(10) UNSIGNED NOT NULL,
  `ptName` varchar(255) NOT NULL,
  `ptHandle` varchar(128) NOT NULL,
  `ptPublishTargetTypeID` int(10) UNSIGNED DEFAULT NULL,
  `ptDefaultPageTemplateID` int(10) UNSIGNED DEFAULT NULL,
  `ptDefaultThemeID` int(10) UNSIGNED DEFAULT NULL,
  `ptAllowedPageTemplates` varchar(1) DEFAULT 'A',
  `ptIsInternal` tinyint(1) NOT NULL DEFAULT 0,
  `ptIsFrequentlyAdded` tinyint(1) NOT NULL DEFAULT 1,
  `ptDisplayOrder` int(10) UNSIGNED DEFAULT NULL,
  `ptLaunchInComposer` tinyint(1) NOT NULL DEFAULT 0,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ptPublishTargetObject` longtext DEFAULT NULL,
  `siteTypeID` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PageTypes`
--

INSERT INTO `PageTypes` (`ptID`, `ptName`, `ptHandle`, `ptPublishTargetTypeID`, `ptDefaultPageTemplateID`, `ptDefaultThemeID`, `ptAllowedPageTemplates`, `ptIsInternal`, `ptIsFrequentlyAdded`, `ptDisplayOrder`, `ptLaunchInComposer`, `pkgID`, `ptPublishTargetObject`, `siteTypeID`) VALUES
(1, 'Stack', 'core_stack', 3, 0, NULL, 'A', 1, 0, 0, 0, 0, 'O:68:\"Concrete\\Core\\Page\\Type\\PublishTarget\\Configuration\\AllConfiguration\":6:{s:5:\"error\";s:0:\"\";s:21:\"\0*\0selectorFormFactor\";N;s:20:\"\0*\0startingPointPage\";N;s:21:\"ptPublishTargetTypeID\";i:3;s:25:\"ptPublishTargetTypeHandle\";s:3:\"all\";s:9:\"pkgHandle\";b:0;}', 1),
(2, 'Stack Category', 'core_stack_category', 3, 0, NULL, 'A', 1, 0, 1, 0, 0, 'O:68:\"Concrete\\Core\\Page\\Type\\PublishTarget\\Configuration\\AllConfiguration\":6:{s:5:\"error\";s:0:\"\";s:21:\"\0*\0selectorFormFactor\";N;s:20:\"\0*\0startingPointPage\";N;s:21:\"ptPublishTargetTypeID\";i:3;s:25:\"ptPublishTargetTypeHandle\";s:3:\"all\";s:9:\"pkgHandle\";b:0;}', 1),
(3, 'Desktop', 'core_desktop', 3, 0, NULL, 'A', 1, 0, 2, 0, 0, 'O:68:\"Concrete\\Core\\Page\\Type\\PublishTarget\\Configuration\\AllConfiguration\":6:{s:5:\"error\";s:0:\"\";s:21:\"\0*\0selectorFormFactor\";N;s:20:\"\0*\0startingPointPage\";N;s:21:\"ptPublishTargetTypeID\";i:3;s:25:\"ptPublishTargetTypeHandle\";s:3:\"all\";s:9:\"pkgHandle\";b:0;}', 1),
(4, 'Theme Documentation Category', 'core_theme_documentation_category', 3, 0, NULL, 'A', 1, 0, 3, 0, 0, 'O:68:\"Concrete\\Core\\Page\\Type\\PublishTarget\\Configuration\\AllConfiguration\":6:{s:5:\"error\";s:0:\"\";s:21:\"\0*\0selectorFormFactor\";N;s:20:\"\0*\0startingPointPage\";N;s:21:\"ptPublishTargetTypeID\";i:3;s:25:\"ptPublishTargetTypeHandle\";s:3:\"all\";s:9:\"pkgHandle\";b:0;}', 1),
(5, 'Theme Documentation', 'core_theme_documentation', 3, 0, NULL, 'A', 1, 0, 4, 0, 0, 'O:68:\"Concrete\\Core\\Page\\Type\\PublishTarget\\Configuration\\AllConfiguration\":6:{s:5:\"error\";s:0:\"\";s:21:\"\0*\0selectorFormFactor\";N;s:20:\"\0*\0startingPointPage\";N;s:21:\"ptPublishTargetTypeID\";i:3;s:25:\"ptPublishTargetTypeHandle\";s:3:\"all\";s:9:\"pkgHandle\";b:0;}', 1),
(6, 'Page', 'page', 3, 4, NULL, 'A', 0, 1, 0, 0, 0, 'O:68:\"Concrete\\Core\\Page\\Type\\PublishTarget\\Configuration\\AllConfiguration\":6:{s:5:\"error\";s:0:\"\";s:21:\"\0*\0selectorFormFactor\";N;s:20:\"\0*\0startingPointPage\";N;s:21:\"ptPublishTargetTypeID\";i:3;s:25:\"ptPublishTargetTypeHandle\";s:3:\"all\";s:9:\"pkgHandle\";b:0;}', 1),
(7, 'Blog Entry', 'blog_entry', 2, 6, NULL, 'C', 0, 1, 1, 1, 0, 'O:73:\"Concrete\\Core\\Page\\Type\\PublishTarget\\Configuration\\PageTypeConfiguration\":7:{s:5:\"error\";s:0:\"\";s:7:\"\0*\0ptID\";i:8;s:21:\"\0*\0selectorFormFactor\";N;s:20:\"\0*\0startingPointPage\";N;s:21:\"ptPublishTargetTypeID\";i:2;s:25:\"ptPublishTargetTypeHandle\";s:9:\"page_type\";s:9:\"pkgHandle\";b:0;}', 1),
(8, 'Blog', 'blog', 3, 4, NULL, 'C', 0, 0, 2, 1, 0, 'O:68:\"Concrete\\Core\\Page\\Type\\PublishTarget\\Configuration\\AllConfiguration\":6:{s:5:\"error\";s:0:\"\";s:21:\"\0*\0selectorFormFactor\";N;s:20:\"\0*\0startingPointPage\";N;s:21:\"ptPublishTargetTypeID\";i:3;s:25:\"ptPublishTargetTypeHandle\";s:3:\"all\";s:9:\"pkgHandle\";b:0;}', 1),
(9, 'Resource', 'resource', 1, 7, NULL, 'C', 0, 1, 3, 1, 0, 'O:75:\"Concrete\\Core\\Page\\Type\\PublishTarget\\Configuration\\ParentPageConfiguration\":5:{s:5:\"error\";s:0:\"\";s:12:\"\0*\0cParentID\";i:240;s:21:\"ptPublishTargetTypeID\";i:1;s:25:\"ptPublishTargetTypeHandle\";s:11:\"parent_page\";s:9:\"pkgHandle\";b:0;}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `PageWorkflowProgress`
--

CREATE TABLE `PageWorkflowProgress` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `wpID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PermissionAccess`
--

CREATE TABLE `PermissionAccess` (
  `paID` int(10) UNSIGNED NOT NULL,
  `paIsInUse` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PermissionAccess`
--

INSERT INTO `PermissionAccess` (`paID`, `paIsInUse`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionAccessEntities`
--

CREATE TABLE `PermissionAccessEntities` (
  `peID` int(10) UNSIGNED NOT NULL,
  `petID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PermissionAccessEntities`
--

INSERT INTO `PermissionAccessEntities` (`peID`, `petID`) VALUES
(1, 1),
(2, 1),
(6, 1),
(7, 2),
(3, 5),
(4, 6),
(5, 7);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionAccessEntityGroups`
--

CREATE TABLE `PermissionAccessEntityGroups` (
  `pegID` int(10) UNSIGNED NOT NULL,
  `peID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PermissionAccessEntityGroups`
--

INSERT INTO `PermissionAccessEntityGroups` (`pegID`, `peID`, `gID`) VALUES
(1, 1, 3),
(2, 2, 1),
(3, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionAccessEntityGroupSets`
--

CREATE TABLE `PermissionAccessEntityGroupSets` (
  `peID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gsID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PermissionAccessEntitySiteGroups`
--

CREATE TABLE `PermissionAccessEntitySiteGroups` (
  `pegID` int(10) UNSIGNED NOT NULL,
  `peID` int(10) UNSIGNED NOT NULL,
  `siteGID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PermissionAccessEntityTypeCategories`
--

CREATE TABLE `PermissionAccessEntityTypeCategories` (
  `petID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pkCategoryID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PermissionAccessEntityTypeCategories`
--

INSERT INTO `PermissionAccessEntityTypeCategories` (`petID`, `pkCategoryID`) VALUES
(1, 1),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(2, 1),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(2, 27),
(2, 28),
(3, 1),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(3, 18),
(3, 19),
(3, 20),
(3, 21),
(3, 22),
(3, 24),
(3, 25),
(3, 26),
(3, 27),
(3, 28),
(4, 1),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 15),
(4, 16),
(4, 17),
(4, 18),
(4, 19),
(4, 20),
(4, 21),
(4, 22),
(4, 23),
(4, 24),
(4, 25),
(4, 26),
(4, 27),
(4, 28),
(5, 1),
(5, 15),
(6, 5),
(6, 6),
(7, 21),
(7, 22),
(8, 1),
(8, 14),
(8, 15);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionAccessEntityTypes`
--

CREATE TABLE `PermissionAccessEntityTypes` (
  `petID` int(10) UNSIGNED NOT NULL,
  `petHandle` varchar(255) NOT NULL,
  `petName` varchar(255) NOT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PermissionAccessEntityTypes`
--

INSERT INTO `PermissionAccessEntityTypes` (`petID`, `petHandle`, `petName`, `pkgID`) VALUES
(1, 'group', 'Group', 0),
(2, 'user', 'User', 0),
(3, 'group_set', 'Group Set', 0),
(4, 'group_combination', 'Group Combination', 0),
(5, 'page_owner', 'Page Owner', 0),
(6, 'file_uploader', 'File Uploader', 0),
(7, 'conversation_message_author', 'Message Author', 0),
(8, 'site_group', 'Site Group', 0);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionAccessEntityUsers`
--

CREATE TABLE `PermissionAccessEntityUsers` (
  `peID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PermissionAccessEntityUsers`
--

INSERT INTO `PermissionAccessEntityUsers` (`peID`, `uID`) VALUES
(7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionAccessList`
--

CREATE TABLE `PermissionAccessList` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `peID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pdID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `accessType` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PermissionAccessList`
--

INSERT INTO `PermissionAccessList` (`paID`, `peID`, `pdID`, `accessType`) VALUES
(1, 1, 0, 10),
(2, 1, 0, 10),
(3, 1, 0, 10),
(4, 1, 0, 10),
(5, 1, 0, 10),
(6, 1, 0, 10),
(7, 1, 0, 10),
(8, 1, 0, 10),
(9, 1, 0, 10),
(10, 1, 0, 10),
(11, 1, 0, 10),
(12, 1, 0, 10),
(13, 2, 0, 10),
(14, 1, 0, 10),
(15, 1, 0, 10),
(16, 1, 0, 10),
(17, 1, 0, 10),
(18, 1, 0, 10),
(19, 2, 0, 10),
(20, 1, 0, 10),
(21, 1, 0, 10),
(22, 1, 0, 10),
(23, 1, 0, 10),
(24, 1, 0, 10),
(25, 1, 0, 10),
(26, 1, 0, 10),
(27, 1, 0, 10),
(28, 1, 0, 10),
(29, 1, 0, 10),
(30, 1, 0, 10),
(31, 2, 0, 10),
(32, 1, 0, 10),
(33, 1, 0, 10),
(34, 1, 0, 10),
(35, 1, 0, 10),
(36, 1, 0, 10),
(37, 1, 0, 10),
(38, 1, 0, 10),
(39, 1, 0, 10),
(40, 1, 0, 10),
(41, 1, 0, 10),
(42, 1, 0, 10),
(43, 1, 0, 10),
(44, 1, 0, 10),
(45, 1, 0, 10),
(46, 1, 0, 10),
(47, 1, 0, 10),
(48, 1, 0, 10),
(49, 1, 0, 10),
(50, 1, 0, 10),
(51, 1, 0, 10),
(52, 1, 0, 10),
(53, 1, 0, 10),
(54, 1, 0, 10),
(55, 1, 0, 10),
(56, 1, 0, 10),
(57, 1, 0, 10),
(58, 1, 0, 10),
(58, 2, 0, 10),
(59, 1, 0, 10),
(59, 2, 0, 10),
(60, 3, 0, 10),
(61, 3, 0, 10),
(62, 3, 0, 10),
(63, 3, 0, 10),
(64, 3, 0, 10),
(65, 1, 0, 10),
(66, 2, 0, 10),
(67, 2, 0, 10),
(68, 3, 0, 10),
(69, 3, 0, 10),
(70, 3, 0, 10),
(71, 3, 0, 10),
(72, 2, 0, 10),
(73, 1, 0, 10),
(73, 2, 0, 10),
(74, 1, 0, 10),
(75, 1, 0, 10),
(76, 1, 0, 10),
(77, 1, 0, 10),
(78, 1, 0, 10),
(79, 1, 0, 10),
(80, 1, 0, 10),
(81, 1, 0, 10),
(82, 1, 0, 10),
(83, 2, 0, 10),
(84, 2, 0, 10),
(85, 2, 0, 10),
(86, 2, 0, 10),
(87, 1, 0, 10),
(88, 1, 0, 10),
(89, 1, 0, 10),
(90, 1, 0, 10),
(91, 1, 0, 10),
(92, 1, 0, 10),
(93, 1, 0, 10),
(94, 1, 0, 10),
(95, 1, 0, 10),
(96, 1, 0, 10),
(97, 1, 0, 10),
(98, 1, 0, 10),
(99, 1, 0, 10),
(100, 1, 0, 10),
(101, 1, 0, 10),
(102, 1, 0, 10),
(103, 1, 0, 10),
(104, 1, 0, 10),
(105, 1, 0, 10),
(106, 2, 0, 10),
(107, 1, 0, 10),
(108, 1, 0, 10),
(109, 1, 0, 10),
(110, 1, 0, 10),
(111, 1, 0, 10),
(112, 1, 0, 10),
(113, 1, 0, 10),
(114, 1, 0, 10),
(115, 1, 0, 10),
(116, 1, 0, 10),
(117, 1, 0, 10),
(118, 1, 0, 10),
(119, 1, 0, 10),
(120, 1, 0, 10),
(121, 1, 0, 10),
(122, 1, 0, 10),
(123, 1, 0, 10),
(124, 1, 0, 10),
(125, 1, 0, 10),
(126, 1, 0, 10),
(127, 1, 0, 10),
(128, 1, 0, 10),
(129, 1, 0, 10),
(130, 1, 0, 10),
(131, 2, 0, 10),
(132, 2, 0, 10),
(133, 1, 0, 10),
(133, 5, 0, 10),
(134, 1, 0, 10),
(134, 5, 0, 10),
(135, 1, 0, 10),
(135, 6, 0, 10),
(136, 1, 0, 10),
(137, 1, 0, 10),
(138, 1, 0, 10),
(139, 1, 0, 10),
(139, 7, 0, 10);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionAccessWorkflows`
--

CREATE TABLE `PermissionAccessWorkflows` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `wfID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PermissionAssignments`
--

CREATE TABLE `PermissionAssignments` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pkID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PermissionAssignments`
--

INSERT INTO `PermissionAssignments` (`paID`, `pkID`) VALUES
(1, 19),
(2, 20),
(3, 75),
(4, 76),
(5, 77),
(6, 78),
(7, 79),
(8, 80),
(9, 82),
(10, 83),
(11, 84),
(12, 86),
(13, 87),
(14, 88),
(15, 89),
(16, 90),
(17, 91),
(18, 92),
(19, 93),
(20, 94),
(21, 95),
(22, 96),
(23, 97),
(24, 98),
(25, 99),
(26, 100),
(27, 101),
(28, 102),
(29, 103),
(30, 104),
(31, 105),
(32, 106),
(33, 107),
(34, 108),
(35, 109),
(36, 110),
(37, 136),
(38, 138),
(39, 139),
(40, 140),
(41, 141),
(42, 142),
(43, 143),
(44, 144),
(45, 145),
(46, 146),
(47, 147),
(48, 148),
(49, 149),
(50, 150),
(51, 151),
(52, 152),
(53, 153),
(139, 85);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionDurationObjects`
--

CREATE TABLE `PermissionDurationObjects` (
  `pdID` int(10) UNSIGNED NOT NULL,
  `pdObject` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PermissionKeyCategories`
--

CREATE TABLE `PermissionKeyCategories` (
  `pkCategoryID` int(10) UNSIGNED NOT NULL,
  `pkCategoryHandle` varchar(255) NOT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PermissionKeyCategories`
--

INSERT INTO `PermissionKeyCategories` (`pkCategoryID`, `pkCategoryHandle`, `pkgID`) VALUES
(1, 'page', NULL),
(2, 'single_page', NULL),
(3, 'stack', NULL),
(4, 'user', NULL),
(5, 'file_folder', NULL),
(6, 'file', NULL),
(7, 'area', NULL),
(8, 'block_type', NULL),
(9, 'block', NULL),
(10, 'admin', NULL),
(11, 'notification', NULL),
(12, 'sitemap', NULL),
(13, 'marketplace', NULL),
(14, 'basic_workflow', NULL),
(15, 'page_type', NULL),
(16, 'group_tree_node', NULL),
(17, 'group_folder', NULL),
(18, 'express_tree_node', NULL),
(19, 'category_tree_node', NULL),
(20, 'topic_tree_node', NULL),
(21, 'conversation', NULL),
(22, 'conversation_message', NULL),
(23, 'multilingual_section', NULL),
(24, 'calendar_admin', NULL),
(25, 'calendar', NULL),
(26, 'express_entry', NULL),
(27, 'board_admin', NULL),
(28, 'board', NULL),
(29, 'logs', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionKeys`
--

CREATE TABLE `PermissionKeys` (
  `pkID` int(10) UNSIGNED NOT NULL,
  `pkHandle` varchar(255) NOT NULL,
  `pkName` varchar(255) NOT NULL,
  `pkCanTriggerWorkflow` tinyint(1) NOT NULL DEFAULT 0,
  `pkHasCustomClass` tinyint(1) NOT NULL DEFAULT 0,
  `pkDescription` varchar(255) DEFAULT NULL,
  `pkCategoryID` int(10) UNSIGNED DEFAULT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PermissionKeys`
--

INSERT INTO `PermissionKeys` (`pkID`, `pkHandle`, `pkName`, `pkCanTriggerWorkflow`, `pkHasCustomClass`, `pkDescription`, `pkCategoryID`, `pkgID`) VALUES
(1, 'view_page', 'View', 0, 0, 'Can see a page exists and read its content.', 1, 0),
(2, 'view_page_versions', 'View Versions', 0, 0, 'Can view the page versions dialog and read past versions of a page.', 1, 0),
(3, 'view_page_in_sitemap', 'View Page in Sitemap', 0, 0, 'Controls whether a user can see a page in the sitemap or intelligent search.', 1, 0),
(4, 'preview_page_as_user', 'Preview Page As User', 0, 0, 'Ability to see what this page will look like at a specific time in the future as a specific user.', 1, 0),
(5, 'edit_page_properties', 'Edit Properties', 0, 1, 'Ability to change anything in the Page Properties menu.', 1, 0),
(6, 'edit_page_contents', 'Edit Contents', 0, 0, 'Ability to make edits to at least some of the content in the page. You can lock down different block areas and specific blocks by clicking Permissions on them as well. ', 1, 0),
(7, 'edit_page_speed_settings', 'Edit Speed Settings', 0, 0, 'Ability to change caching settings.', 1, 0),
(8, 'edit_page_theme', 'Change Theme', 0, 1, 'Ability to change just the theme for this page.', 1, 0),
(9, 'edit_page_template', 'Change Page Template', 0, 0, 'Ability to change just the page template for this page.', 1, 0),
(10, 'edit_page_page_type', 'Edit Page Type', 0, 0, 'Change the type of an existing page.', 1, 0),
(11, 'edit_page_permissions', 'Edit Permissions', 1, 0, 'Ability to change permissions for this page. Warning: by granting this a user could give themselves more access.', 1, 0),
(12, 'delete_page', 'Delete', 1, 0, 'Ability to move this page to the site\'s Trash.', 1, 0),
(13, 'delete_page_versions', 'Delete Versions', 1, 0, 'Ability to remove old versions of this page.', 1, 0),
(14, 'approve_page_versions', 'Approve Changes', 1, 0, 'Can publish an unapproved version of the page.', 1, 0),
(15, 'add_subpage', 'Add Sub-Page', 0, 1, 'Can add a page beneath the current page.', 1, 0),
(16, 'move_or_copy_page', 'Move or Copy Page', 1, 0, 'Can move or copy this page to another location.', 1, 0),
(17, 'schedule_page_contents_guest_access', 'Schedule Guest Access', 0, 0, 'Can control scheduled guest access to this page.', 1, 0),
(18, 'edit_page_multilingual_settings', 'Edit Multilingual Settings', 0, 0, 'Controls whether a user can see the multilingual settings menu, re-map a page or set a page as ignored in multilingual settings.', 1, 0),
(19, 'add_block', 'Add Block', 0, 1, 'Can add a block to any area on the site. If someone is added here they can add blocks to any area (unless that area has permissions that override these global permissions.)', 8, 0),
(20, 'add_stack', 'Add Stack', 0, 0, 'Can add a stack or block from a stack to any area on the site. If someone is added here they can add stacks to any area (unless that area has permissions that override these global permissions.)', 8, 0),
(21, 'view_area', 'View Area', 0, 0, 'Can view the area and its contents.', 7, 0),
(22, 'edit_area_contents', 'Edit Area Contents', 0, 0, 'Can edit blocks within this area.', 7, 0),
(23, 'add_block_to_area', 'Add Block to Area', 0, 1, 'Can add blocks to this area. This setting overrides the global Add Block permission for this area.', 7, 0),
(24, 'add_stack_to_area', 'Add Stack to Area', 0, 0, 'Can add stacks to this area. This setting overrides the global Add Stack permission for this area.', 7, 0),
(25, 'add_layout_to_area', 'Add Layouts to Area', 0, 0, 'Controls whether users get the ability to add layouts to a particular area.', 7, 0),
(26, 'edit_area_design', 'Edit Area Design', 0, 0, 'Controls whether users see design controls and can modify an area\'s custom CSS.', 7, 0),
(27, 'edit_area_permissions', 'Edit Area Permissions', 0, 0, 'Controls whether users can access the permissions on an area. Custom area permissions could override those of the page.', 7, 0),
(28, 'delete_area_contents', 'Delete Area Contents', 0, 0, 'Controls whether users can delete blocks from this area.', 7, 0),
(29, 'schedule_area_contents_guest_access', 'Schedule Guest Access', 0, 0, 'Controls whether users can schedule guest access permissions on blocks in this area. Guest Access is a shortcut for granting permissions just to the Guest Group.', 7, 0),
(30, 'view_block', 'View Block', 0, 0, 'Controls whether users can view this block in the page.', 9, 0),
(31, 'edit_block', 'Edit Block', 0, 0, 'Controls whether users can edit this block. This overrides any area or page permissions.', 9, 0),
(32, 'edit_block_custom_template', 'Change Block Template', 0, 0, 'Controls whether users can change the block template on this block. This overrides any area or page permissions.', 9, 0),
(33, 'edit_block_cache_settings', 'Edit Cache Settings', 0, 0, 'Controls whether users can change the block cache settings for this block instance.', 9, 0),
(34, 'edit_block_name', 'Edit Name', 0, 0, 'Controls whether users can change the block\'s name (rarely used.)', 9, 0),
(35, 'delete_block', 'Delete Block', 0, 0, 'Controls whether users can delete this block. This overrides any area or page permissions.', 9, 0),
(36, 'edit_block_design', 'Edit Design', 0, 0, 'Controls whether users can set custom design properties or CSS on this block.', 9, 0),
(37, 'edit_block_permissions', 'Edit Permissions', 0, 0, 'Controls whether users can change permissions on this block, potentially granting themselves or others greater access.', 9, 0),
(38, 'schedule_guest_access', 'Schedule Guest Access', 0, 0, 'Controls whether users can schedule guest access permissions on this block. Guest Access is a shortcut for granting permissions just to the Guest Group.', 9, 0),
(39, 'view_file_folder_file', 'View Files', 0, 0, 'View files within folder in the site.', 5, 0),
(40, 'search_file_folder', 'Search File Folder', 0, 0, 'See this file folder in the file manager', 5, 0),
(41, 'edit_file_folder', 'Edit File Folder', 0, 0, 'Edit a file folder.', 5, 0),
(42, 'edit_file_folder_file_properties', 'Edit File Properties', 0, 0, 'Can edit a file\'s properties.', 5, 0),
(43, 'edit_file_folder_file_contents', 'Edit File Contents', 0, 0, 'Can edit or replace files in folder.', 5, 0),
(44, 'copy_file_folder_files', 'Copy File', 0, 0, 'Can copy files in file folder.', 5, 0),
(45, 'edit_file_folder_permissions', 'Edit File Access', 0, 0, 'Can edit access to file folder.', 5, 0),
(46, 'delete_file_folder', 'Delete File Folder', 0, 0, 'Can delete file folder.', 5, 0),
(47, 'delete_file_folder_files', 'Delete File', 0, 0, 'Can delete files in folder.', 5, 0),
(48, 'add_file', 'Add File', 0, 1, 'Can add files to folder.', 5, 0),
(49, 'view_file', 'View Files', 0, 0, 'Can view and download files.', 6, 0),
(50, 'view_file_in_file_manager', 'View File in File Manager', 0, 0, 'Can access the File Manager.', 6, 0),
(51, 'edit_file_properties', 'Edit File Properties', 0, 0, 'Can edit a file\'s properties.', 6, 0),
(52, 'edit_file_contents', 'Edit File Contents', 0, 0, 'Can edit or replace files.', 6, 0),
(53, 'copy_file', 'Copy File', 0, 0, 'Can copy file.', 6, 0),
(54, 'edit_file_permissions', 'Edit File Access', 0, 0, 'Can edit access to file.', 6, 0),
(55, 'delete_file', 'Delete File', 0, 0, 'Can delete file.', 6, 0),
(56, 'approve_basic_workflow_action', 'Approve or Deny', 0, 0, 'Grant ability to approve workflow.', 14, 0),
(57, 'notify_on_basic_workflow_entry', 'Notify on Entry', 0, 0, 'Notify approvers that a change has entered the workflow.', 14, 0),
(58, 'notify_on_basic_workflow_approve', 'Notify on Approve', 0, 0, 'Notify approvers that a change has been approved.', 14, 0),
(59, 'notify_on_basic_workflow_deny', 'Notify on Deny', 0, 0, 'Notify approvers that a change has been denied.', 14, 0),
(60, 'add_page_type', 'Add Pages of This Type', 0, 0, '', 15, 0),
(61, 'edit_page_type', 'Edit Page Type', 0, 0, '', 15, 0),
(62, 'delete_page_type', 'Delete Page Type', 0, 0, '', 15, 0),
(63, 'edit_page_type_permissions', 'Edit Page Type Permissions', 0, 0, '', 15, 0),
(64, 'edit_page_type_drafts', 'Edit Page Type Drafts', 0, 0, '', 15, 0),
(65, 'view_topic_tree_node', 'View Topic Tree Node', 0, 0, '', 20, 0),
(66, 'view_category_tree_node', 'View Category Tree Node', 0, 0, '', 19, 0),
(67, 'add_conversation_message', 'Add Message to Conversation', 0, 1, '', 21, 0),
(68, 'add_conversation_message_attachments', 'Add Message Attachments', 0, 0, '', 21, 0),
(69, 'edit_conversation_permissions', 'Edit Conversation Permissions', 0, 0, '', 21, 0),
(70, 'delete_conversation_message', 'Delete Message', 0, 0, '', 21, 0),
(71, 'edit_conversation_message', 'Edit Message', 0, 0, '', 21, 0),
(72, 'rate_conversation_message', 'Rate Message', 0, 0, '', 21, 0),
(73, 'flag_conversation_message', 'Flag Message', 0, 0, '', 21, 0),
(74, 'approve_conversation_message', 'Approve Message', 0, 0, '', 21, 0),
(75, 'view_log_entries', 'View Log Entries', 0, 0, '', 29, 0),
(76, 'delete_log_entries', 'Delete Log Entries', 0, 0, '', 29, 0),
(77, 'export_log_entries', 'Export Log Entries', 0, 0, '', 29, 0),
(78, 'edit_user_properties', 'Edit User Details', 0, 1, NULL, 4, 0),
(79, 'view_user_attributes', 'View User Attributes', 0, 1, NULL, 4, 0),
(80, 'activate_user', 'Activate/Deactivate User', 1, 0, NULL, 4, 0),
(81, 'sudo', 'Sign in as User', 0, 0, NULL, 4, 0),
(82, 'upgrade', 'Upgrade Concrete', 0, 0, NULL, 10, 0),
(83, 'access_group_search', 'Access Group Search', 0, 0, NULL, 4, 0),
(84, 'delete_user', 'Delete User', 1, 0, NULL, 4, 0),
(85, 'notify_in_notification_center', 'Notify in Notification Center', 0, 1, 'Controls who receives updates in the notification center.', 11, 0),
(86, 'add_calendar', 'Add Calendar', 0, 0, '', 24, 0),
(87, 'view_calendars', 'View Calendars', 0, 0, '', 24, 0),
(88, 'edit_calendars', 'Edit Calendars', 0, 0, '', 24, 0),
(89, 'edit_calendars_permissions', 'Edit Permissions', 0, 0, '', 24, 0),
(90, 'add_calendar_events', 'Add Calendar Events', 0, 0, '', 24, 0),
(91, 'approve_calendar_events', 'Approve Calendar Events', 1, 0, '', 24, 0),
(92, 'delete_calendars', 'Delete Calendars', 0, 0, '', 24, 0),
(93, 'access_calendar_rss_feeds', 'Access RSS Feeds', 0, 0, '', 24, 0),
(94, 'view_calendar', 'View Calendar', 0, 0, '', 25, 0),
(95, 'view_calendar_in_edit_interface', 'View in Edit Interface', 0, 0, '', 25, 0),
(96, 'edit_calendar_permissions', 'Edit Permissions', 0, 0, '', 25, 0),
(97, 'edit_calendar', 'Edit Calendar', 0, 0, '', 25, 0),
(98, 'add_calendar_event', 'Add Calendar Event', 0, 0, '', 25, 0),
(99, 'approve_calendar_event', 'Approve Calendar Event', 1, 0, '', 25, 0),
(100, 'edit_calendar_event_more_details_location', 'Modify More Details Location', 0, 0, '', 25, 0),
(101, 'edit_calendar_events', 'Edit Calendar Events', 0, 0, '', 25, 0),
(102, 'access_calendar_rss_feed', 'Access RSS Feed', 0, 0, '', 25, 0),
(103, 'delete_calendar', 'Delete Calendar', 0, 0, '', 25, 0),
(104, 'add_board', 'Add Board', 0, 0, '', 27, 0),
(105, 'view_boards', 'View Boards', 0, 0, '', 27, 0),
(106, 'edit_boards_settings', 'Edit Board Settings', 0, 0, '', 27, 0),
(107, 'edit_boards_contents', 'Edit Board Content', 0, 0, '', 27, 0),
(108, 'edit_boards_permissions', 'Edit Permissions', 0, 0, '', 27, 0),
(109, 'edit_boards_locked_rules', 'Edit Locked Rules', 0, 0, '', 27, 0),
(110, 'delete_boards', 'Delete Boards', 0, 0, '', 27, 0),
(111, 'view_board', 'View Board', 0, 0, '', 28, 0),
(112, 'edit_board_settings', 'Edit Settings', 0, 0, '', 28, 0),
(113, 'edit_board_permissions', 'Edit Permissions', 0, 0, '', 28, 0),
(114, 'edit_board_contents', 'Edit Contents', 0, 0, '', 28, 0),
(115, 'edit_board_locked_rules', 'Edit Locked Rules', 0, 0, '', 28, 0),
(116, 'delete_board', 'Delete Board', 0, 0, '', 28, 0),
(117, 'view_express_entries', 'View Entries', 0, 0, NULL, 18, 0),
(118, 'add_express_entries', 'Add Entry', 0, 0, NULL, 18, 0),
(119, 'edit_express_entries', 'Edit Entry', 0, 0, NULL, 18, 0),
(120, 'delete_express_entries', 'Delete Entry', 0, 0, NULL, 18, 0),
(121, 'view_express_entry', 'View Entries', 0, 0, NULL, 26, 0),
(122, 'edit_express_entry', 'Edit Entry', 0, 0, NULL, 26, 0),
(123, 'delete_express_entry', 'Delete Entry', 0, 0, NULL, 26, 0),
(124, 'search_group_folder', 'Search Group Folder', 0, 0, 'See this group folder in the group search.', 17, 0),
(125, 'edit_group_folder', 'Edit Group Folder', 0, 0, 'Edit a group folder.', 17, 0),
(126, 'edit_group_folder_permissions', 'Edit Group Access', 0, 0, 'Can edit access to group folder.', 17, 0),
(127, 'delete_group_folder', 'Delete Group Folder', 0, 0, 'Can delete group folder.', 17, 0),
(128, 'add_group_folder', 'Add Group Folder', 0, 0, 'Can add folders.', 17, 0),
(129, 'add_group', 'Add Group', 0, 0, 'Can add groups to folder.', 17, 0),
(130, 'assign_groups', 'Assign Groups', 0, 0, 'Can assign the groups within this folder.', 17, 0),
(131, 'search_users_in_group', 'Search User Group', 0, 0, NULL, 16, 0),
(132, 'edit_group', 'Edit Group', 0, 0, NULL, 16, 0),
(133, 'assign_group', 'Assign Group', 0, 0, NULL, 16, 0),
(134, 'add_sub_group', 'Add Child Group', 0, 0, NULL, 16, 0),
(135, 'edit_group_permissions', 'Edit Group Permissions', 0, 0, NULL, 16, 0),
(136, 'access_page_type_permissions', 'Access Page Type Permissions', 0, 0, NULL, 10, 0),
(137, 'access_task_permissions', 'Access Task Permissions', 0, 0, NULL, 10, 0),
(138, 'access_sitemap', 'Access Sitemap', 0, 0, NULL, 12, 0),
(139, 'access_page_defaults', 'Access Page Type Defaults', 0, 0, NULL, 10, 0),
(140, 'customize_themes', 'Customize Themes', 0, 0, NULL, 10, 0),
(141, 'view_debug_error_information', 'View Debug Error Information', 0, 0, NULL, 10, 0),
(142, 'manage_layout_presets', 'Manage Layout Presets', 0, 0, NULL, 10, 0),
(143, 'empty_trash', 'Empty Trash', 0, 0, NULL, 10, 0),
(144, 'add_topic_tree', 'Add Topic Tree', 0, 0, NULL, 10, 0),
(145, 'remove_topic_tree', 'Remove Topic Tree', 0, 0, NULL, 10, 0),
(146, 'view_in_maintenance_mode', 'View Site in Maintenance Mode', 0, 0, 'Ability to see and use the website when Concrete is in maintenance mode.', 10, 0),
(147, 'uninstall_packages', 'Uninstall Packages', 0, 0, NULL, 13, 0),
(148, 'install_packages', 'Install Packages', 0, 0, NULL, 13, 0),
(149, 'access_user_search_export', 'Export Site Users', 0, 0, 'Controls whether a user can export site users or not', 4, 0),
(150, 'access_user_search', 'Access User Search', 0, 0, 'Controls whether a user can view the search user interface.', 4, 0),
(151, 'access_api', 'Access API', 0, 0, NULL, 10, 0),
(152, 'view_announcement_content', 'View Announcement Content', 0, 0, 'Controls whether a user sees the Announcement modal interstitial, including upgrades and help, upon login.', 10, 0),
(153, 'edit_topic_tree', 'Edit Topic Tree', 0, 0, NULL, 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `PileContents`
--

CREATE TABLE `PileContents` (
  `pcID` int(10) UNSIGNED NOT NULL,
  `pID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemType` varchar(64) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `displayOrder` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Piles`
--

CREATE TABLE `Piles` (
  `pID` int(10) UNSIGNED NOT NULL,
  `uID` int(10) UNSIGNED DEFAULT NULL,
  `isDefault` tinyint(1) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `name` varchar(255) DEFAULT NULL,
  `state` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PrivateMessageNotifications`
--

CREATE TABLE `PrivateMessageNotifications` (
  `msgID` int(10) UNSIGNED NOT NULL,
  `nID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `QueuePageDuplicationRelations`
--

CREATE TABLE `QueuePageDuplicationRelations` (
  `queue_name` varchar(255) NOT NULL,
  `cID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `originalCID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SavedExpressSearchQueries`
--

CREATE TABLE `SavedExpressSearchQueries` (
  `id` int(11) NOT NULL,
  `presetName` varchar(255) NOT NULL,
  `query_fields` longtext NOT NULL COMMENT '(DC2Type:object)',
  `query_columns` longtext NOT NULL COMMENT '(DC2Type:object)',
  `query_itemsPerPage` smallint(6) NOT NULL,
  `exEntityID` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SavedFileSearchQueries`
--

CREATE TABLE `SavedFileSearchQueries` (
  `id` int(11) NOT NULL,
  `presetName` varchar(255) NOT NULL,
  `query_fields` longtext NOT NULL COMMENT '(DC2Type:object)',
  `query_columns` longtext NOT NULL COMMENT '(DC2Type:object)',
  `query_itemsPerPage` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SavedGroupSearchQueries`
--

CREATE TABLE `SavedGroupSearchQueries` (
  `id` int(11) NOT NULL,
  `presetName` varchar(255) NOT NULL,
  `query_fields` longtext NOT NULL COMMENT '(DC2Type:object)',
  `query_columns` longtext NOT NULL COMMENT '(DC2Type:object)',
  `query_itemsPerPage` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SavedLogSearchQueries`
--

CREATE TABLE `SavedLogSearchQueries` (
  `id` int(11) NOT NULL,
  `presetName` varchar(255) NOT NULL,
  `query_fields` longtext NOT NULL COMMENT '(DC2Type:object)',
  `query_columns` longtext NOT NULL COMMENT '(DC2Type:object)',
  `query_itemsPerPage` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SavedPageSearchQueries`
--

CREATE TABLE `SavedPageSearchQueries` (
  `id` int(11) NOT NULL,
  `presetName` varchar(255) NOT NULL,
  `query_fields` longtext NOT NULL COMMENT '(DC2Type:object)',
  `query_columns` longtext NOT NULL COMMENT '(DC2Type:object)',
  `query_itemsPerPage` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SavedUserSearchQueries`
--

CREATE TABLE `SavedUserSearchQueries` (
  `id` int(11) NOT NULL,
  `presetName` varchar(255) NOT NULL,
  `query_fields` longtext NOT NULL COMMENT '(DC2Type:object)',
  `query_columns` longtext NOT NULL COMMENT '(DC2Type:object)',
  `query_itemsPerPage` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Sessions`
--

CREATE TABLE `Sessions` (
  `sessionID` varchar(255) NOT NULL,
  `sessionValue` longtext DEFAULT NULL,
  `sessionTime` int(10) UNSIGNED NOT NULL,
  `sessionLifeTime` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiblingPageRelations`
--

CREATE TABLE `SiblingPageRelations` (
  `mpRelationID` int(10) UNSIGNED NOT NULL,
  `cID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteAttributeKeys`
--

CREATE TABLE `SiteAttributeKeys` (
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteAttributeValues`
--

CREATE TABLE `SiteAttributeValues` (
  `siteID` int(10) UNSIGNED NOT NULL,
  `akID` int(10) UNSIGNED NOT NULL,
  `avID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteDomains`
--

CREATE TABLE `SiteDomains` (
  `domainID` int(10) UNSIGNED NOT NULL,
  `domain` varchar(255) NOT NULL,
  `siteID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteGroupRelations`
--

CREATE TABLE `SiteGroupRelations` (
  `groupRelationID` int(10) UNSIGNED NOT NULL,
  `gID` int(10) UNSIGNED NOT NULL,
  `siteGID` int(10) UNSIGNED DEFAULT NULL,
  `siteID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteGroups`
--

CREATE TABLE `SiteGroups` (
  `siteGID` int(10) UNSIGNED NOT NULL,
  `groupName` varchar(255) NOT NULL,
  `siteTypeID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteLocales`
--

CREATE TABLE `SiteLocales` (
  `siteLocaleID` int(10) UNSIGNED NOT NULL,
  `msIsDefault` tinyint(1) NOT NULL,
  `msLanguage` varchar(32) NOT NULL,
  `msCountry` varchar(32) NOT NULL,
  `msNumPlurals` int(11) NOT NULL,
  `msPluralRule` varchar(400) NOT NULL,
  `msPluralCases` varchar(1000) NOT NULL,
  `siteID` int(10) UNSIGNED DEFAULT NULL,
  `siteTreeID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `SiteLocales`
--

INSERT INTO `SiteLocales` (`siteLocaleID`, `msIsDefault`, `msLanguage`, `msCountry`, `msNumPlurals`, `msPluralRule`, `msPluralCases`, `siteID`, `siteTreeID`) VALUES
(1, 1, 'en', 'US', 2, 'n != 1', 'one@1\nother@0, 2~16, 100, 1000, 10000, 100000, 1000000, …', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Sites`
--

CREATE TABLE `Sites` (
  `siteID` int(10) UNSIGNED NOT NULL,
  `pThemeID` int(10) UNSIGNED NOT NULL,
  `pThemeSkinIdentifier` varchar(255) DEFAULT NULL,
  `pThemeSkinIdentifierDark` varchar(255) DEFAULT NULL,
  `siteIsDefault` tinyint(1) NOT NULL,
  `siteHandle` varchar(255) NOT NULL,
  `siteTypeID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Sites`
--

INSERT INTO `Sites` (`siteID`, `pThemeID`, `pThemeSkinIdentifier`, `pThemeSkinIdentifierDark`, `siteIsDefault`, `siteHandle`, `siteTypeID`) VALUES
(1, 1, NULL, NULL, 1, 'default', 1);

-- --------------------------------------------------------

--
-- Table structure for table `SiteSearchIndexAttributes`
--

CREATE TABLE `SiteSearchIndexAttributes` (
  `siteID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteSkeletonLocales`
--

CREATE TABLE `SiteSkeletonLocales` (
  `skeletonLocaleID` int(10) UNSIGNED NOT NULL,
  `msLanguage` varchar(32) NOT NULL,
  `msCountry` varchar(32) NOT NULL,
  `msNumPlurals` int(11) NOT NULL,
  `msPluralRule` varchar(400) NOT NULL,
  `msPluralCases` varchar(1000) NOT NULL,
  `siteSkeletonID` int(10) UNSIGNED DEFAULT NULL,
  `siteTreeID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteSkeletons`
--

CREATE TABLE `SiteSkeletons` (
  `siteSkeletonID` int(10) UNSIGNED NOT NULL,
  `siteTypeID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteSkeletonTrees`
--

CREATE TABLE `SiteSkeletonTrees` (
  `skeletonLocaleID` int(10) UNSIGNED DEFAULT NULL,
  `siteTypeID` int(10) UNSIGNED DEFAULT NULL,
  `siteTreeID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTrees`
--

CREATE TABLE `SiteTrees` (
  `siteTreeID` int(10) UNSIGNED NOT NULL,
  `siteHomePageID` int(10) UNSIGNED NOT NULL,
  `treeType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `SiteTrees`
--

INSERT INTO `SiteTrees` (`siteTreeID`, `siteHomePageID`, `treeType`) VALUES
(1, 1, 'sitetree');

-- --------------------------------------------------------

--
-- Table structure for table `SiteTreeTrees`
--

CREATE TABLE `SiteTreeTrees` (
  `siteLocaleID` int(10) UNSIGNED DEFAULT NULL,
  `siteTreeID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `SiteTreeTrees`
--

INSERT INTO `SiteTreeTrees` (`siteLocaleID`, `siteTreeID`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTypeAttributeKeys`
--

CREATE TABLE `SiteTypeAttributeKeys` (
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTypeAttributeValues`
--

CREATE TABLE `SiteTypeAttributeValues` (
  `siteSkeletonID` int(10) UNSIGNED DEFAULT NULL,
  `akID` int(10) UNSIGNED NOT NULL,
  `avID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTypes`
--

CREATE TABLE `SiteTypes` (
  `siteTypeID` int(10) UNSIGNED NOT NULL,
  `siteTypeHandle` varchar(255) NOT NULL,
  `siteTypeName` varchar(255) NOT NULL,
  `siteTypeThemeID` int(11) NOT NULL,
  `siteTypeHomePageTemplateID` int(11) NOT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `SiteTypes`
--

INSERT INTO `SiteTypes` (`siteTypeID`, `siteTypeHandle`, `siteTypeName`, `siteTypeThemeID`, `siteTypeHomePageTemplateID`, `pkgID`) VALUES
(1, 'default', 'Default Site Type', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `SocialLinks`
--

CREATE TABLE `SocialLinks` (
  `ssHandle` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `slID` int(11) NOT NULL,
  `siteID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `SocialLinks`
--

INSERT INTO `SocialLinks` (`ssHandle`, `url`, `slID`, `siteID`) VALUES
('facebook', 'https://www.facebook.com/concretecms', 1, 1),
('github', 'https://github.com/concretecms/concretecms', 2, 1),
('instagram', 'https://www.instagram.com/concretecms/', 3, 1),
('twitter', 'https://twitter.com/concrete_cms', 4, 1),
('youtube', 'https://www.youtube.com/channel/UCywmkk3TWHLcYyKafNDFCUA', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Stacks`
--

CREATE TABLE `Stacks` (
  `stID` int(10) UNSIGNED NOT NULL,
  `stName` varchar(255) NOT NULL,
  `stType` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `stMultilingualSection` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Stacks`
--

INSERT INTO `Stacks` (`stID`, `stName`, `stType`, `cID`, `stMultilingualSection`) VALUES
(1, 'Navigation', 20, 231, 0),
(2, 'Footer Column 1', 20, 232, 0),
(3, 'Footer Column 2', 20, 233, 0),
(4, 'Footer Column 3', 20, 234, 0),
(5, 'Footer Column 4', 20, 235, 0),
(6, 'Blog Sidebar', 0, 237, 0);

-- --------------------------------------------------------

--
-- Table structure for table `StackUsageRecord`
--

CREATE TABLE `StackUsageRecord` (
  `stack_id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `collection_id` int(11) NOT NULL,
  `collection_version_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `StyleCustomizerCustomCssRecords`
--

CREATE TABLE `StyleCustomizerCustomCssRecords` (
  `value` longtext NOT NULL,
  `sccRecordID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `StyleCustomizerInlineStylePresets`
--

CREATE TABLE `StyleCustomizerInlineStylePresets` (
  `pssPresetID` int(10) UNSIGNED NOT NULL,
  `pssPresetName` varchar(255) NOT NULL,
  `issID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `StyleCustomizerInlineStyleSets`
--

CREATE TABLE `StyleCustomizerInlineStyleSets` (
  `issID` int(11) NOT NULL,
  `customClass` varchar(255) DEFAULT NULL,
  `customID` varchar(255) DEFAULT NULL,
  `customElementAttribute` varchar(255) DEFAULT NULL,
  `backgroundColor` varchar(255) DEFAULT NULL,
  `backgroundImageFileID` int(11) NOT NULL,
  `backgroundRepeat` varchar(255) DEFAULT NULL,
  `backgroundSize` varchar(255) DEFAULT NULL,
  `backgroundPosition` varchar(255) DEFAULT NULL,
  `borderColor` varchar(255) DEFAULT NULL,
  `borderStyle` varchar(255) DEFAULT NULL,
  `borderWidth` varchar(255) DEFAULT NULL,
  `borderRadius` varchar(255) DEFAULT NULL,
  `baseFontSize` varchar(255) DEFAULT NULL,
  `alignment` varchar(255) DEFAULT NULL,
  `textColor` varchar(255) DEFAULT NULL,
  `linkColor` varchar(255) DEFAULT NULL,
  `marginTop` varchar(255) DEFAULT NULL,
  `marginBottom` varchar(255) DEFAULT NULL,
  `marginLeft` varchar(255) DEFAULT NULL,
  `marginRight` varchar(255) DEFAULT NULL,
  `paddingTop` varchar(255) DEFAULT NULL,
  `paddingBottom` varchar(255) DEFAULT NULL,
  `paddingLeft` varchar(255) DEFAULT NULL,
  `paddingRight` varchar(255) DEFAULT NULL,
  `rotate` varchar(255) DEFAULT NULL,
  `boxShadowHorizontal` varchar(255) DEFAULT NULL,
  `boxShadowVertical` varchar(255) DEFAULT NULL,
  `boxShadowBlur` varchar(255) DEFAULT NULL,
  `boxShadowSpread` varchar(255) DEFAULT NULL,
  `boxShadowColor` varchar(255) DEFAULT NULL,
  `boxShadowInset` tinyint(1) DEFAULT NULL,
  `hideOnExtraSmallDevice` tinyint(1) DEFAULT NULL,
  `hideOnSmallDevice` tinyint(1) DEFAULT NULL,
  `hideOnMediumDevice` tinyint(1) DEFAULT NULL,
  `hideOnLargeDevice` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `StyleCustomizerInlineStyleSets`
--

INSERT INTO `StyleCustomizerInlineStyleSets` (`issID`, `customClass`, `customID`, `customElementAttribute`, `backgroundColor`, `backgroundImageFileID`, `backgroundRepeat`, `backgroundSize`, `backgroundPosition`, `borderColor`, `borderStyle`, `borderWidth`, `borderRadius`, `baseFontSize`, `alignment`, `textColor`, `linkColor`, `marginTop`, `marginBottom`, `marginLeft`, `marginRight`, `paddingTop`, `paddingBottom`, `paddingLeft`, `paddingRight`, `rotate`, `boxShadowHorizontal`, `boxShadowVertical`, `boxShadowBlur`, `boxShadowSpread`, `boxShadowColor`, `boxShadowInset`, `hideOnExtraSmallDevice`, `hideOnSmallDevice`, `hideOnMediumDevice`, `hideOnLargeDevice`) VALUES
(1, 'concrete-blog-stories', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `StyleCustomizerValueLists`
--

CREATE TABLE `StyleCustomizerValueLists` (
  `scvlID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `StyleCustomizerValues`
--

CREATE TABLE `StyleCustomizerValues` (
  `scvID` int(10) UNSIGNED NOT NULL,
  `scvlID` int(10) UNSIGNED DEFAULT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SummaryCategories`
--

CREATE TABLE `SummaryCategories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `SummaryCategories`
--

INSERT INTO `SummaryCategories` (`id`, `name`, `handle`, `pkgID`) VALUES
(1, 'Page', 'page', NULL),
(2, 'Calendar Event', 'calendar_event', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `SummaryFields`
--

CREATE TABLE `SummaryFields` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `SummaryFields`
--

INSERT INTO `SummaryFields` (`id`, `name`, `handle`, `pkgID`) VALUES
(1, 'Title', 'title', NULL),
(2, 'Date', 'date', NULL),
(3, 'Start Date', 'date_start', NULL),
(4, 'End Date', 'date_end', NULL),
(5, 'Link', 'link', NULL),
(6, 'Description', 'description', NULL),
(7, 'Thumbnail', 'thumbnail', NULL),
(8, 'Categories', 'categories', NULL),
(9, 'Author', 'author', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `SummaryTemplateCategories`
--

CREATE TABLE `SummaryTemplateCategories` (
  `template_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `SummaryTemplateCategories`
--

INSERT INTO `SummaryTemplateCategories` (`template_id`, `category_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `SummaryTemplateFields`
--

CREATE TABLE `SummaryTemplateFields` (
  `id` int(11) NOT NULL,
  `template_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `SummaryTemplateFields`
--

INSERT INTO `SummaryTemplateFields` (`id`, `template_id`, `field_id`, `is_required`) VALUES
(1, 1, 1, 1),
(2, 1, 5, 1),
(3, 1, 6, 0),
(4, 1, 2, 0),
(5, 2, 1, 1),
(6, 2, 5, 1),
(7, 2, 7, 1),
(8, 2, 2, 1),
(9, 3, 1, 1),
(10, 3, 5, 1),
(11, 3, 7, 1),
(12, 3, 9, 1),
(13, 3, 2, 1),
(14, 4, 1, 1),
(15, 4, 5, 1),
(16, 4, 7, 1),
(17, 4, 9, 1),
(18, 4, 2, 1),
(19, 5, 1, 1),
(20, 5, 5, 1),
(21, 5, 7, 1),
(22, 5, 9, 1),
(23, 5, 2, 1),
(24, 6, 1, 1),
(25, 6, 5, 1),
(26, 6, 7, 1),
(27, 6, 9, 1),
(28, 6, 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `SummaryTemplates`
--

CREATE TABLE `SummaryTemplates` (
  `id` int(11) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `SummaryTemplates`
--

INSERT INTO `SummaryTemplates` (`id`, `icon`, `name`, `handle`, `pkgID`) VALUES
(1, 'blank.png', 'Default Summary Template', 'default', NULL),
(2, 'blank.png', 'Blog Image Left', 'blog_image_left', NULL),
(3, 'blank.png', 'Blog Image Right', 'blog_image_right', NULL),
(4, 'blank.png', 'Blog Image Top', 'blog_image_top', NULL),
(5, 'blank.png', 'Blog Entry Card', 'blog_entry_card', NULL),
(6, 'blank.png', 'Resource Page Entry', 'resource_page', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `SummaryTemplateTags`
--

CREATE TABLE `SummaryTemplateTags` (
  `template_id` int(11) NOT NULL,
  `designtag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SystemAntispamLibraries`
--

CREATE TABLE `SystemAntispamLibraries` (
  `saslHandle` varchar(64) NOT NULL,
  `saslName` varchar(255) DEFAULT NULL,
  `saslIsActive` tinyint(1) NOT NULL DEFAULT 0,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SystemCaptchaLibraries`
--

CREATE TABLE `SystemCaptchaLibraries` (
  `sclHandle` varchar(64) NOT NULL,
  `sclName` varchar(255) DEFAULT NULL,
  `sclIsActive` tinyint(1) NOT NULL DEFAULT 0,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `SystemCaptchaLibraries`
--

INSERT INTO `SystemCaptchaLibraries` (`sclHandle`, `sclName`, `sclIsActive`, `pkgID`) VALUES
('recaptchaV3', 'reCAPTCHA v3', 0, 0),
('securimage', 'SecurImage (Default)', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `SystemContentEditorSnippets`
--

CREATE TABLE `SystemContentEditorSnippets` (
  `scsHandle` varchar(64) NOT NULL,
  `scsName` varchar(255) DEFAULT NULL,
  `scsIsActive` tinyint(1) NOT NULL DEFAULT 0,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `SystemContentEditorSnippets`
--

INSERT INTO `SystemContentEditorSnippets` (`scsHandle`, `scsName`, `scsIsActive`, `pkgID`) VALUES
('page_name', 'Page Name', 1, 0),
('user_name', 'User Name', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `SystemDatabaseMigrations`
--

CREATE TABLE `SystemDatabaseMigrations` (
  `version` varchar(14) NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `SystemDatabaseMigrations`
--

INSERT INTO `SystemDatabaseMigrations` (`version`, `executed_at`) VALUES
('20140919000000', '2025-06-25 15:10:55'),
('20140930000000', '2025-06-25 15:10:55'),
('20141017000000', '2025-06-25 15:10:55'),
('20141024000000', '2025-06-25 15:10:55'),
('20141113000000', '2025-06-25 15:10:55'),
('20141219000000', '2025-06-25 15:10:55'),
('20150109000000', '2025-06-25 15:10:55'),
('20150504000000', '2025-06-25 15:10:55'),
('20150515000000', '2025-06-25 15:10:55'),
('20150610000000', '2025-06-25 15:10:55'),
('20150612000000', '2025-06-25 15:10:55'),
('20150615000000', '2025-06-25 15:10:55'),
('20150616000000', '2025-06-25 15:10:55'),
('20150619000000', '2025-06-25 15:10:55'),
('20150622000000', '2025-06-25 15:10:55'),
('20150623000000', '2025-06-25 15:10:55'),
('20150713000000', '2025-06-25 15:10:55'),
('20150731000000', '2025-06-25 15:10:55'),
('20151221000000', '2025-06-25 15:10:55'),
('20160107000000', '2025-06-25 15:10:55'),
('20160213000000', '2025-06-25 15:10:55'),
('20160314000000', '2025-06-25 15:10:55'),
('20160412000000', '2025-06-25 15:10:55'),
('20160615000000', '2025-06-25 15:10:55'),
('20160725000000', '2025-06-25 15:10:55'),
('20161109000000', '2025-06-25 15:10:55'),
('20161203000000', '2025-06-25 15:10:55'),
('20161208000000', '2025-06-25 15:10:55'),
('20161216000000', '2025-06-25 15:10:55'),
('20161216100000', '2025-06-25 15:10:55'),
('20170118000000', '2025-06-25 15:10:55'),
('20170123000000', '2025-06-25 15:10:55'),
('20170201000000', '2025-06-25 15:10:55'),
('20170202000000', '2025-06-25 15:10:55'),
('20170227063249', '2025-06-25 15:10:55'),
('20170313000000', '2025-06-25 15:10:55'),
('20170316000000', '2025-06-25 15:10:55'),
('20170404000000', '2025-06-25 15:10:55'),
('20170406000000', '2025-06-25 15:10:55'),
('20170407000001', '2025-06-25 15:10:55'),
('20170412000000', '2025-06-25 15:10:55'),
('20170418000000', '2025-06-25 15:10:55'),
('20170420000000', '2025-06-25 15:10:55'),
('20170421000000', '2025-06-25 15:10:55'),
('20170424000000', '2025-06-25 15:10:55'),
('20170505000000', '2025-06-25 15:10:55'),
('20170512000000', '2025-06-25 15:10:55'),
('20170519000000', '2025-06-25 15:10:55'),
('20170608000000', '2025-06-25 15:10:55'),
('20170608100000', '2025-06-25 15:10:55'),
('20170609000000', '2025-06-25 15:10:55'),
('20170609100000', '2025-06-25 15:10:55'),
('20170610000000', '2025-06-25 15:10:55'),
('20170611000000', '2025-06-25 15:10:55'),
('20170613000000', '2025-06-25 15:10:55'),
('20170614000000', '2025-06-25 15:10:55'),
('20170626000000', '2025-06-25 15:10:55'),
('20170711151953', '2025-06-25 15:10:55'),
('20170731021618', '2025-06-25 15:10:55'),
('20170802000000', '2025-06-25 15:10:55'),
('20170804000000', '2025-06-25 15:10:55'),
('20170810000000', '2025-06-25 15:10:55'),
('20170818000000', '2025-06-25 15:10:55'),
('20170824000000', '2025-06-25 15:10:55'),
('20170905000000', '2025-06-25 15:10:55'),
('20170915000000', '2025-06-25 15:10:55'),
('20170926000000', '2025-06-25 15:10:55'),
('20171012000000', '2025-06-25 15:10:55'),
('20171025000000', '2025-06-25 15:10:55'),
('20171109000000', '2025-06-25 15:10:55'),
('20171109065758', '2025-06-25 15:10:55'),
('20171110032423', '2025-06-25 15:10:55'),
('20171121000000', '2025-06-25 15:10:55'),
('20171129190607', '2025-06-25 15:10:55'),
('20171218000000', '2025-06-25 15:10:55'),
('20171221194440', '2025-06-25 15:10:55'),
('20180119000000', '2025-06-25 15:10:55'),
('20180122213656', '2025-06-25 15:10:55'),
('20180122220813', '2025-06-25 15:10:55'),
('20180123000000', '2025-06-25 15:10:55'),
('20180126000000', '2025-06-25 15:10:55'),
('20180130000000', '2025-06-25 15:10:55'),
('20180212000000', '2025-06-25 15:10:55'),
('20180213000000', '2025-06-25 15:10:55'),
('20180227035239', '2025-06-25 15:10:55'),
('20180308043255', '2025-06-25 15:10:55'),
('20180328215345', '2025-06-25 15:10:55'),
('20180329183749', '2025-06-25 15:10:55'),
('20180330080830', '2025-06-25 15:10:55'),
('20180403143200', '2025-06-25 15:10:55'),
('20180518153531', '2025-06-25 15:10:55'),
('20180524000000', '2025-06-25 15:10:55'),
('20180531000000', '2025-06-25 15:10:55'),
('20180604000000', '2025-06-25 15:10:55'),
('20180609000000', '2025-06-25 15:10:55'),
('20180615000000', '2025-06-25 15:10:55'),
('20180617000000', '2025-06-25 15:10:55'),
('20180621222449', '2025-06-25 15:10:55'),
('20180622192332', '2025-06-25 15:10:55'),
('20180627000000', '2025-06-25 15:10:55'),
('20180709175202', '2025-06-25 15:10:55'),
('20180710203437', '2025-06-25 15:10:55'),
('20180716000000', '2025-06-25 15:10:55'),
('20180717000000', '2025-06-25 15:10:55'),
('20180813220933', '2025-06-25 15:10:55'),
('20180816210727', '2025-06-25 15:10:55'),
('20180820205800', '2025-06-25 15:10:55'),
('20180831213421', '2025-06-25 15:10:55'),
('20180904165911', '2025-06-25 15:10:55'),
('20180907091500', '2025-06-25 15:10:55'),
('20180910000000', '2025-06-25 15:10:55'),
('20180912113737', '2025-06-25 15:10:55'),
('20180920000000', '2025-06-25 15:10:55'),
('20180926000000', '2025-06-25 15:10:55'),
('20180926070200', '2025-06-25 15:10:55'),
('20180926070300', '2025-06-25 15:10:55'),
('20181006212300', '2025-06-25 15:10:55'),
('20181006212400', '2025-06-25 15:10:55'),
('20181019010145', '2025-06-25 15:10:55'),
('20181029223809', '2025-06-25 15:10:55'),
('20181105102800', '2025-06-25 15:10:55'),
('20181112211702', '2025-06-25 15:10:55'),
('20181116072400', '2025-06-25 15:10:55'),
('20181211000000', '2025-06-25 15:10:55'),
('20181211100000', '2025-06-25 15:10:55'),
('20181212000000', '2025-06-25 15:10:55'),
('20181212221911', '2025-06-25 15:10:55'),
('20181222183445', '2025-06-25 15:10:55'),
('20190106000000', '2025-06-25 15:10:55'),
('20190110194848', '2025-06-25 15:10:55'),
('20190110231015', '2025-06-25 15:10:55'),
('20190111181236', '2025-06-25 15:10:55'),
('20190112000000', '2025-06-25 15:10:55'),
('20190129000000', '2025-06-25 15:10:55'),
('20190225000000', '2025-06-25 15:10:55'),
('20190225184524', '2025-06-25 15:10:55'),
('20190301133300', '2025-06-25 15:10:55'),
('20190309000000', '2025-06-25 15:10:55'),
('20190310000000', '2025-06-25 15:10:55'),
('20190416224702', '2025-06-25 15:10:55'),
('20190417180607', '2025-06-25 15:10:55'),
('20190422235040', '2025-06-25 15:10:55'),
('20190504005632', '2025-06-25 15:10:55'),
('20190508232235', '2025-06-25 15:10:55'),
('20190509000000', '2025-06-25 15:10:55'),
('20190509205043', '2025-06-25 15:10:55'),
('20190513164028', '2025-06-25 15:10:55'),
('20190516204806', '2025-06-25 15:10:55'),
('20190520171430', '2025-06-25 15:10:55'),
('20190522202749', '2025-06-25 15:10:55'),
('20190619141521', '2025-06-25 15:10:55'),
('20190625177700', '2025-06-25 15:10:55'),
('20190625177710', '2025-06-25 15:10:55'),
('20190708000000', '2025-06-25 15:10:55'),
('20190717090600', '2025-06-25 15:10:55'),
('20190817000000', '2025-06-25 15:10:55'),
('20190822160700', '2025-06-25 15:10:55'),
('20190826000000', '2025-06-25 15:10:55'),
('20190925072210', '2025-06-25 15:10:55'),
('20191002000000', '2025-06-25 15:10:55'),
('20191029175713', '2025-06-25 15:10:55'),
('20200116115000', '2025-06-25 15:10:55'),
('20200118043285', '2025-06-25 15:10:55'),
('20200203000000', '2025-06-25 15:10:55'),
('20200501000000', '2025-06-25 15:10:55'),
('20200523051311', '2025-06-25 15:10:55'),
('20200604000000', '2025-06-25 15:10:55'),
('20200609145307', '2025-06-25 15:10:55'),
('20200610162600', '2025-06-25 15:10:55'),
('20200611161800', '2025-06-25 15:10:55'),
('20200625191946', '2025-06-25 15:10:55'),
('20200626142348', '2025-06-25 15:10:55'),
('20200810000000', '2025-06-25 15:10:55'),
('20200814143401', '2025-06-25 15:10:55'),
('20200903201537', '2025-06-25 15:10:55'),
('20200923143317', '2025-06-25 15:10:55'),
('20200928000000', '2025-06-25 15:10:55'),
('20200928000001', '2025-06-25 15:10:55'),
('20200928000003', '2025-06-25 15:10:55'),
('20201015174802', '2025-06-25 15:10:55'),
('20201018000000', '2025-06-25 15:10:55'),
('20201022000000', '2025-06-25 15:10:55'),
('20201028143317', '2025-06-25 15:10:55'),
('20201028201040', '2025-06-25 15:10:55'),
('20201031143314', '2025-06-25 15:10:55'),
('20201110150900', '2025-06-25 15:10:55'),
('20201112172200', '2025-06-25 15:10:55'),
('20201119123200', '2025-06-25 15:10:55'),
('20201130130221', '2025-06-25 15:10:55'),
('20201205023211', '2025-06-25 15:10:55'),
('20201229143500', '2025-06-25 15:10:55'),
('20201231153200', '2025-06-25 15:10:55'),
('20210128224608', '2025-06-25 15:10:55'),
('20210205193115', '2025-06-25 15:10:55'),
('20210216184000', '2025-06-25 15:10:55'),
('20210331213100', '2025-06-25 15:10:55'),
('20210428212600', '2025-06-25 15:10:55'),
('20210528170900', '2025-06-25 15:10:55'),
('20210616131513', '2025-06-25 15:10:55'),
('20210622145600', '2025-06-25 15:10:55'),
('20210712110100', '2025-06-25 15:10:55'),
('20210718190101', '2025-06-25 15:10:55'),
('20210722225853', '2025-06-25 15:10:55'),
('20210725000000', '2025-06-25 15:10:55'),
('20210729191135', '2025-06-25 15:10:55'),
('20210813173441', '2025-06-25 15:10:55'),
('20210815000000', '2025-06-25 15:10:55'),
('20210910234801', '2025-06-25 15:10:55'),
('20210926145823', '2025-06-25 15:10:55'),
('20211001145301', '2025-06-25 15:10:55'),
('20211020151701', '2025-06-25 15:10:55'),
('20211023155414', '2025-06-25 15:10:55'),
('20211028000000', '2025-06-25 15:10:55'),
('20211102171600', '2025-06-25 15:10:55'),
('20211102171700', '2025-06-25 15:10:55'),
('20211103142609', '2025-06-25 15:10:55'),
('20211104161958', '2025-06-25 15:10:55'),
('20211208145933', '2025-06-25 15:10:55'),
('20220114215506', '2025-06-25 15:10:55'),
('20220210120000', '2025-06-25 15:10:55'),
('20220301185614', '2025-06-25 15:10:55'),
('20220304163335', '2025-06-25 15:10:55'),
('20220307105409', '2025-06-25 15:10:55'),
('20220321122800', '2025-06-25 15:10:55'),
('20220331222557', '2025-06-25 15:10:55'),
('20220408000000', '2025-06-25 15:10:55'),
('20220503000000', '2025-06-25 15:10:55'),
('20220516191423', '2025-06-25 15:10:55'),
('20220614180000', '2025-06-25 15:10:55'),
('20220812035034', '2025-06-25 15:10:55'),
('20220908074900', '2025-06-25 15:10:55'),
('20220909000000', '2025-06-25 15:10:55'),
('20220909100000', '2025-06-25 15:10:55'),
('20220909200000', '2025-06-25 15:10:55'),
('20220909300000', '2025-06-25 15:10:55'),
('20220911000000', '2025-06-25 15:10:55'),
('20220919000000', '2025-06-25 15:10:55'),
('20221012183922', '2025-06-25 15:10:55'),
('20221121152044', '2025-06-25 15:10:55'),
('20221122000000', '2025-06-25 15:10:55'),
('20221219220600', '2025-06-25 15:10:55'),
('20230107185800', '2025-06-25 15:10:55'),
('20230127095217', '2025-06-25 15:10:55'),
('20230225150942', '2025-06-25 15:10:55'),
('20230308163514', '2025-06-25 15:10:55'),
('20230503095900', '2025-06-25 15:10:55'),
('20230812015937', '2025-06-25 15:10:55'),
('20230905000000', '2025-06-25 15:10:55'),
('20230924000000', '2025-06-25 15:10:55'),
('20231002142400', '2025-06-25 15:10:55'),
('20231207100748', '2025-06-25 15:10:55'),
('20240119210413', '2025-06-25 15:10:55'),
('20240122172319', '2025-06-25 15:10:55'),
('20240506191622', '2025-06-25 15:10:55'),
('20240508000000', '2025-06-25 15:10:55'),
('20240515173142', '2025-06-25 15:10:55'),
('20240618202000', '2025-06-25 15:10:55'),
('20240711000000', '2025-06-25 15:10:55'),
('20240910000000', '2025-06-25 15:10:55'),
('20241115093300', '2025-06-25 15:10:55'),
('20241126174022', '2025-06-25 15:10:55'),
('20241204161559', '2025-06-25 15:10:55'),
('20241210181033', '2025-06-25 15:10:55'),
('20241217194138', '2025-06-25 15:10:55'),
('20250227155410', '2025-06-25 15:10:55');

-- --------------------------------------------------------

--
-- Table structure for table `SystemDatabaseQueryLog`
--

CREATE TABLE `SystemDatabaseQueryLog` (
  `ID` int(10) UNSIGNED NOT NULL,
  `query` text DEFAULT NULL,
  `params` text DEFAULT NULL,
  `executionMS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Tasks`
--

CREATE TABLE `Tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateLastStarted` int(11) DEFAULT NULL,
  `dateLastCompleted` int(11) DEFAULT NULL,
  `uID` int(10) UNSIGNED DEFAULT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Tasks`
--

INSERT INTO `Tasks` (`id`, `handle`, `dateLastStarted`, `dateLastCompleted`, `uID`, `pkgID`) VALUES
(1, 'clear_cache', NULL, NULL, NULL, NULL),
(2, 'generate_sitemap', NULL, NULL, NULL, NULL),
(3, 'rescan_files', NULL, NULL, NULL, NULL),
(4, 'check_automated_groups', NULL, NULL, NULL, NULL),
(5, 'deactivate_users', NULL, NULL, NULL, NULL),
(6, 'remove_old_page_versions', NULL, NULL, NULL, NULL),
(7, 'reindex_content', NULL, NULL, NULL, NULL),
(8, 'process_email', NULL, NULL, NULL, NULL),
(9, 'update_statistics', NULL, NULL, NULL, NULL),
(10, 'generate_thumbnails', NULL, NULL, NULL, NULL),
(11, 'remove_old_file_attachments', NULL, NULL, NULL, NULL),
(12, 'remove_unvalidated_users', NULL, NULL, NULL, NULL),
(13, 'production_status', NULL, NULL, NULL, NULL),
(14, 'page_cache_report', NULL, NULL, NULL, NULL),
(15, 'custom_javascript_report', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `TaskSets`
--

CREATE TABLE `TaskSets` (
  `id` int(10) UNSIGNED NOT NULL,
  `handle` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `displayOrder` int(10) UNSIGNED NOT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `TaskSets`
--

INSERT INTO `TaskSets` (`id`, `handle`, `name`, `displayOrder`, `pkgID`) VALUES
(1, 'maintenance', 'Maintenance', 0, NULL),
(2, 'seo', 'SEO and Search', 1, NULL),
(3, 'user_groups', 'Users and Groups', 2, NULL),
(4, 'site_health', 'Site Health', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `TaskSetTasks`
--

CREATE TABLE `TaskSetTasks` (
  `task_id` int(10) UNSIGNED NOT NULL,
  `set_id` int(10) UNSIGNED NOT NULL,
  `displayOrder` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `TaskSetTasks`
--

INSERT INTO `TaskSetTasks` (`task_id`, `set_id`, `displayOrder`) VALUES
(1, 1, 0),
(2, 2, 0),
(3, 1, 1),
(4, 3, 0),
(5, 3, 1),
(6, 1, 2),
(7, 2, 1),
(8, 3, 2),
(9, 2, 2),
(10, 1, 4),
(11, 1, 3),
(12, 3, 3),
(13, 4, 0),
(14, 4, 1),
(15, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `TopicTrees`
--

CREATE TABLE `TopicTrees` (
  `treeID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `topicTreeName` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `TopicTrees`
--

INSERT INTO `TopicTrees` (`treeID`, `topicTreeName`) VALUES
(4, 'Blog Entries'),
(5, 'Event Categories');

-- --------------------------------------------------------

--
-- Table structure for table `TreeExpressEntrySiteResultNodes`
--

CREATE TABLE `TreeExpressEntrySiteResultNodes` (
  `treeNodeID` int(10) UNSIGNED NOT NULL,
  `siteID` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `TreeFileFolderNodes`
--

CREATE TABLE `TreeFileFolderNodes` (
  `treeNodeID` int(10) UNSIGNED NOT NULL,
  `fslID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `TreeFileNodes`
--

CREATE TABLE `TreeFileNodes` (
  `treeNodeID` int(10) UNSIGNED NOT NULL,
  `fID` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `TreeFileNodes`
--

INSERT INTO `TreeFileNodes` (`treeNodeID`, `fID`) VALUES
(17, 1),
(18, 2),
(19, 3),
(20, 4),
(21, 5),
(22, 6),
(23, 7),
(24, 8),
(25, 9),
(26, 10),
(27, 11),
(28, 12),
(29, 13),
(30, 14),
(31, 15),
(32, 16),
(33, 17),
(34, 18),
(35, 19),
(36, 20),
(37, 21),
(38, 22),
(39, 23),
(40, 24),
(41, 25),
(42, 26),
(43, 27),
(44, 28),
(45, 29),
(46, 30),
(47, 31),
(48, 32),
(49, 33),
(50, 34),
(51, 35),
(52, 36);

-- --------------------------------------------------------

--
-- Table structure for table `TreeGroupFolderNodes`
--

CREATE TABLE `TreeGroupFolderNodes` (
  `treeNodeID` int(10) UNSIGNED NOT NULL,
  `contains` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `TreeGroupFolderNodeSelectedGroupTypes`
--

CREATE TABLE `TreeGroupFolderNodeSelectedGroupTypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `treeNodeID` int(10) UNSIGNED DEFAULT 0,
  `gtID` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `TreeGroupNodes`
--

CREATE TABLE `TreeGroupNodes` (
  `treeNodeID` int(10) UNSIGNED NOT NULL,
  `gID` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `TreeGroupNodes`
--

INSERT INTO `TreeGroupNodes` (`treeNodeID`, `gID`) VALUES
(2, 1),
(3, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `TreeNodePermissionAssignments`
--

CREATE TABLE `TreeNodePermissionAssignments` (
  `treeNodeID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pkID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `TreeNodePermissionAssignments`
--

INSERT INTO `TreeNodePermissionAssignments` (`treeNodeID`, `pkID`, `paID`) VALUES
(1, 124, 124),
(1, 125, 125),
(1, 126, 126),
(1, 127, 127),
(1, 128, 130),
(1, 129, 128),
(1, 130, 129),
(5, 117, 59),
(5, 118, 55),
(5, 119, 56),
(5, 120, 57),
(6, 117, 54),
(6, 118, 58),
(6, 119, 56),
(6, 120, 57),
(7, 39, 73),
(7, 40, 74),
(7, 41, 75),
(7, 42, 76),
(7, 43, 77),
(7, 44, 78),
(7, 45, 79),
(7, 46, 81),
(7, 47, 80),
(7, 48, 82),
(7, 66, 65),
(53, 66, 66),
(59, 66, 67);

-- --------------------------------------------------------

--
-- Table structure for table `TreeNodes`
--

CREATE TABLE `TreeNodes` (
  `treeNodeID` int(10) UNSIGNED NOT NULL,
  `treeNodeTypeID` int(10) UNSIGNED DEFAULT 0,
  `treeID` int(10) UNSIGNED DEFAULT 0,
  `treeNodeParentID` int(10) UNSIGNED DEFAULT 0,
  `treeNodeDisplayOrder` int(10) UNSIGNED DEFAULT 0,
  `treeNodeName` varchar(255) DEFAULT '',
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `treeNodeOverridePermissions` tinyint(1) DEFAULT 0,
  `inheritPermissionsFromTreeNodeID` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `TreeNodes`
--

INSERT INTO `TreeNodes` (`treeNodeID`, `treeNodeTypeID`, `treeID`, `treeNodeParentID`, `treeNodeDisplayOrder`, `treeNodeName`, `dateModified`, `dateCreated`, `treeNodeOverridePermissions`, `inheritPermissionsFromTreeNodeID`) VALUES
(1, 2, 1, 0, 0, '', '2025-06-25 21:10:57', '2025-06-25 21:10:57', 1, 1),
(2, 1, 1, 1, 0, '', '2025-06-25 21:10:57', '2025-06-25 21:10:57', 0, 1),
(3, 1, 1, 1, 1, '', '2025-06-25 21:10:57', '2025-06-25 21:10:57', 0, 1),
(4, 1, 1, 1, 2, '', '2025-06-25 21:10:57', '2025-06-25 21:10:57', 0, 1),
(5, 4, 2, 0, 0, '', '2025-06-25 21:11:00', '2025-06-25 21:11:00', 1, 5),
(6, 4, 2, 5, 0, 'Forms', '2025-06-25 21:11:36', '2025-06-25 21:11:00', 1, 6),
(7, 9, 3, 0, 0, '', '2025-06-25 21:11:34', '2025-06-25 21:11:30', 1, 7),
(8, 9, 3, 7, 0, 'Documents', '2025-06-25 21:11:34', '2025-06-25 21:11:30', 0, 7),
(9, 9, 3, 7, 1, 'Brand', '2025-06-25 21:11:34', '2025-06-25 21:11:30', 0, 7),
(10, 9, 3, 7, 2, 'Blog', '2025-06-25 21:11:34', '2025-06-25 21:11:30', 0, 7),
(11, 9, 3, 7, 3, 'Gallery', '2025-06-25 21:11:34', '2025-06-25 21:11:30', 0, 7),
(12, 9, 3, 7, 4, 'Collaboration Slider', '2025-06-25 21:11:34', '2025-06-25 21:11:30', 0, 7),
(13, 9, 3, 7, 5, 'Hero Images', '2025-06-25 21:11:34', '2025-06-25 21:11:30', 0, 7),
(14, 9, 3, 7, 6, 'Logo Slider', '2025-06-25 21:11:34', '2025-06-25 21:11:30', 0, 7),
(15, 9, 3, 7, 7, 'Stripes', '2025-06-25 21:11:34', '2025-06-25 21:11:30', 0, 7),
(16, 9, 3, 7, 8, 'Team', '2025-06-25 21:11:34', '2025-06-25 21:11:30', 0, 7),
(17, 8, 3, 13, 0, '', '2025-06-25 21:11:31', '2025-06-25 21:11:31', 0, 7),
(18, 8, 3, 14, 3, '', '2025-06-25 21:11:31', '2025-06-25 21:11:31', 0, 7),
(19, 8, 3, 12, 0, '', '2025-06-25 21:11:31', '2025-06-25 21:11:31', 0, 7),
(20, 8, 3, 14, 1, '', '2025-06-25 21:11:31', '2025-06-25 21:11:31', 0, 7),
(21, 8, 3, 16, 0, '', '2025-06-25 21:11:31', '2025-06-25 21:11:31', 0, 7),
(22, 8, 3, 10, 0, '', '2025-06-25 21:11:31', '2025-06-25 21:11:31', 0, 7),
(23, 8, 3, 10, 4, '', '2025-06-25 21:11:32', '2025-06-25 21:11:32', 0, 7),
(24, 8, 3, 15, 2, '', '2025-06-25 21:11:32', '2025-06-25 21:11:32', 0, 7),
(25, 8, 3, 16, 3, '', '2025-06-25 21:11:32', '2025-06-25 21:11:32', 0, 7),
(26, 8, 3, 12, 1, '', '2025-06-25 21:11:32', '2025-06-25 21:11:32', 0, 7),
(27, 8, 3, 9, 0, '', '2025-06-25 21:11:32', '2025-06-25 21:11:32', 0, 7),
(28, 8, 3, 16, 4, '', '2025-06-25 21:11:32', '2025-06-25 21:11:32', 0, 7),
(29, 8, 3, 15, 1, '', '2025-06-25 21:11:32', '2025-06-25 21:11:32', 0, 7),
(30, 8, 3, 11, 4, '', '2025-06-25 21:11:32', '2025-06-25 21:11:32', 0, 7),
(31, 8, 3, 15, 3, '', '2025-06-25 21:11:32', '2025-06-25 21:11:32', 0, 7),
(32, 8, 3, 12, 2, '', '2025-06-25 21:11:32', '2025-06-25 21:11:32', 0, 7),
(33, 8, 3, 10, 5, '', '2025-06-25 21:11:32', '2025-06-25 21:11:32', 0, 7),
(34, 8, 3, 10, 3, '', '2025-06-25 21:11:32', '2025-06-25 21:11:32', 0, 7),
(35, 8, 3, 13, 1, '', '2025-06-25 21:11:33', '2025-06-25 21:11:33', 0, 7),
(36, 8, 3, 8, 0, '', '2025-06-25 21:11:33', '2025-06-25 21:11:33', 0, 7),
(37, 8, 3, 14, 0, '', '2025-06-25 21:11:33', '2025-06-25 21:11:33', 0, 7),
(38, 8, 3, 16, 2, '', '2025-06-25 21:11:33', '2025-06-25 21:11:33', 0, 7),
(39, 8, 3, 9, 1, '', '2025-06-25 21:11:33', '2025-06-25 21:11:33', 0, 7),
(40, 8, 3, 16, 5, '', '2025-06-25 21:11:33', '2025-06-25 21:11:33', 0, 7),
(41, 8, 3, 11, 0, '', '2025-06-25 21:11:33', '2025-06-25 21:11:33', 0, 7),
(42, 8, 3, 10, 2, '', '2025-06-25 21:11:33', '2025-06-25 21:11:33', 0, 7),
(43, 8, 3, 11, 5, '', '2025-06-25 21:11:33', '2025-06-25 21:11:33', 0, 7),
(44, 8, 3, 11, 3, '', '2025-06-25 21:11:33', '2025-06-25 21:11:33', 0, 7),
(45, 8, 3, 16, 1, '', '2025-06-25 21:11:33', '2025-06-25 21:11:33', 0, 7),
(46, 8, 3, 15, 5, '', '2025-06-25 21:11:33', '2025-06-25 21:11:33', 0, 7),
(47, 8, 3, 14, 2, '', '2025-06-25 21:11:34', '2025-06-25 21:11:34', 0, 7),
(48, 8, 3, 10, 1, '', '2025-06-25 21:11:34', '2025-06-25 21:11:34', 0, 7),
(49, 8, 3, 15, 4, '', '2025-06-25 21:11:34', '2025-06-25 21:11:34', 0, 7),
(50, 8, 3, 11, 1, '', '2025-06-25 21:11:34', '2025-06-25 21:11:34', 0, 7),
(51, 8, 3, 11, 2, '', '2025-06-25 21:11:34', '2025-06-25 21:11:34', 0, 7),
(52, 8, 3, 15, 0, '', '2025-06-25 21:11:34', '2025-06-25 21:11:34', 0, 7),
(53, 3, 4, 0, 0, '', '2025-06-25 21:11:35', '2025-06-25 21:11:35', 1, 53),
(54, 7, 4, 53, 0, 'Marketing', '2025-06-25 21:11:35', '2025-06-25 21:11:35', 0, 53),
(55, 7, 4, 53, 1, 'Sales', '2025-06-25 21:11:35', '2025-06-25 21:11:35', 0, 53),
(56, 7, 4, 53, 2, 'Security', '2025-06-25 21:11:35', '2025-06-25 21:11:35', 0, 53),
(57, 7, 4, 53, 3, 'Products', '2025-06-25 21:11:35', '2025-06-25 21:11:35', 0, 53),
(58, 7, 4, 53, 4, 'Company News', '2025-06-25 21:11:35', '2025-06-25 21:11:35', 0, 53),
(59, 3, 5, 0, 0, '', '2025-06-25 21:11:35', '2025-06-25 21:11:35', 1, 59),
(60, 7, 5, 59, 0, 'Meetings', '2025-06-25 21:11:35', '2025-06-25 21:11:35', 0, 59),
(61, 7, 5, 59, 1, 'Activities', '2025-06-25 21:11:35', '2025-06-25 21:11:35', 0, 59),
(62, 7, 5, 59, 2, 'Sports', '2025-06-25 21:11:35', '2025-06-25 21:11:35', 0, 59),
(63, 7, 5, 59, 3, 'Holidays', '2025-06-25 21:11:35', '2025-06-25 21:11:35', 0, 59),
(64, 5, 2, 6, 0, 'Mailing List', '2025-06-25 21:11:35', '2025-06-25 21:11:35', 0, 6),
(65, 5, 2, 6, 1, 'Contact', '2025-06-25 21:11:36', '2025-06-25 21:11:36', 0, 6);

-- --------------------------------------------------------

--
-- Table structure for table `TreeNodeTypes`
--

CREATE TABLE `TreeNodeTypes` (
  `treeNodeTypeID` int(10) UNSIGNED NOT NULL,
  `treeNodeTypeHandle` varchar(255) DEFAULT '',
  `pkgID` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `TreeNodeTypes`
--

INSERT INTO `TreeNodeTypes` (`treeNodeTypeID`, `treeNodeTypeHandle`, `pkgID`) VALUES
(1, 'group', 0),
(2, 'group_folder', 0),
(3, 'category', 0),
(4, 'express_entry_category', 0),
(5, 'express_entry_results', 0),
(6, 'express_entry_site_results', 0),
(7, 'topic', 0),
(8, 'file', 0),
(9, 'file_folder', 0),
(10, 'search_preset', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Trees`
--

CREATE TABLE `Trees` (
  `treeID` int(10) UNSIGNED NOT NULL,
  `treeTypeID` int(10) UNSIGNED DEFAULT 0,
  `treeDateAdded` datetime DEFAULT NULL,
  `rootTreeNodeID` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Trees`
--

INSERT INTO `Trees` (`treeID`, `treeTypeID`, `treeDateAdded`, `rootTreeNodeID`) VALUES
(1, 1, '2025-06-25 21:10:57', 1),
(2, 2, '2025-06-25 21:11:00', 5),
(3, 4, '2025-06-25 21:11:30', 7),
(4, 3, '2025-06-25 21:11:35', 53),
(5, 3, '2025-06-25 21:11:35', 59);

-- --------------------------------------------------------

--
-- Table structure for table `TreeSearchQueryNodes`
--

CREATE TABLE `TreeSearchQueryNodes` (
  `treeNodeID` int(10) UNSIGNED NOT NULL,
  `savedSearchID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `TreeTypes`
--

CREATE TABLE `TreeTypes` (
  `treeTypeID` int(10) UNSIGNED NOT NULL,
  `treeTypeHandle` varchar(255) DEFAULT '',
  `pkgID` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `TreeTypes`
--

INSERT INTO `TreeTypes` (`treeTypeID`, `treeTypeHandle`, `pkgID`) VALUES
(1, 'group', 0),
(2, 'express_entry_results', 0),
(3, 'topic', 0),
(4, 'file_manager', 0);

-- --------------------------------------------------------

--
-- Table structure for table `UsedStringLog`
--

CREATE TABLE `UsedStringLog` (
  `id` int(10) UNSIGNED NOT NULL,
  `usedString` varchar(255) NOT NULL,
  `subject` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserAttributeKeys`
--

CREATE TABLE `UserAttributeKeys` (
  `uakProfileDisplay` tinyint(1) NOT NULL,
  `uakProfileEdit` tinyint(1) NOT NULL,
  `uakProfileEditRequired` tinyint(1) NOT NULL,
  `uakRegisterEdit` tinyint(1) NOT NULL,
  `uakRegisterEditRequired` tinyint(1) NOT NULL,
  `uakMemberListDisplay` tinyint(1) NOT NULL,
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `UserAttributeKeys`
--

INSERT INTO `UserAttributeKeys` (`uakProfileDisplay`, `uakProfileEdit`, `uakProfileEditRequired`, `uakRegisterEdit`, `uakRegisterEditRequired`, `uakMemberListDisplay`, `akID`) VALUES
(0, 1, 0, 1, 0, 0, 15),
(0, 1, 0, 1, 0, 0, 16),
(0, 0, 0, 0, 0, 0, 19);

-- --------------------------------------------------------

--
-- Table structure for table `UserAttributeValues`
--

CREATE TABLE `UserAttributeValues` (
  `uID` int(10) UNSIGNED NOT NULL,
  `akID` int(10) UNSIGNED NOT NULL,
  `avID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserDeactivatedNotifications`
--

CREATE TABLE `UserDeactivatedNotifications` (
  `userID` int(10) UNSIGNED NOT NULL,
  `actorID` int(10) UNSIGNED DEFAULT NULL,
  `nID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserFavoriteFolders`
--

CREATE TABLE `UserFavoriteFolders` (
  `treeNodeFolderId` int(10) UNSIGNED NOT NULL,
  `uID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserGroups`
--

CREATE TABLE `UserGroups` (
  `uID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `grID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ugEntered` datetime NOT NULL DEFAULT '1000-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserLoginAttempts`
--

CREATE TABLE `UserLoginAttempts` (
  `id` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `userId` int(10) UNSIGNED NOT NULL,
  `utcDate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserPermissionEditPropertyAccessList`
--

CREATE TABLE `UserPermissionEditPropertyAccessList` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `peID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uName` tinyint(1) DEFAULT 0,
  `uEmail` tinyint(1) DEFAULT 0,
  `uPassword` tinyint(1) DEFAULT 0,
  `uAvatar` tinyint(1) DEFAULT 0,
  `uTimezone` tinyint(1) DEFAULT 0,
  `uDefaultLanguage` tinyint(1) DEFAULT 0,
  `uHomeFileManagerFolderID` tinyint(1) DEFAULT 0,
  `attributePermission` varchar(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserPermissionEditPropertyAttributeAccessListCustom`
--

CREATE TABLE `UserPermissionEditPropertyAttributeAccessListCustom` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `peID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `akID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserPermissionViewAttributeAccessList`
--

CREATE TABLE `UserPermissionViewAttributeAccessList` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `peID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `permission` varchar(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserPermissionViewAttributeAccessListCustom`
--

CREATE TABLE `UserPermissionViewAttributeAccessListCustom` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `peID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `akID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserPrivateMessages`
--

CREATE TABLE `UserPrivateMessages` (
  `msgID` int(10) UNSIGNED NOT NULL,
  `uAuthorID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `msgDateCreated` datetime NOT NULL,
  `msgSubject` varchar(255) NOT NULL,
  `msgBody` text DEFAULT NULL,
  `uToID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserPrivateMessagesAttachments`
--

CREATE TABLE `UserPrivateMessagesAttachments` (
  `msgID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `fID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserPrivateMessagesTo`
--

CREATE TABLE `UserPrivateMessagesTo` (
  `msgID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uAuthorID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `msgMailboxID` int(11) NOT NULL,
  `msgIsNew` tinyint(1) NOT NULL DEFAULT 0,
  `msgIsUnread` tinyint(1) NOT NULL DEFAULT 0,
  `msgIsReplied` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `uID` int(10) UNSIGNED NOT NULL,
  `uName` varchar(64) NOT NULL,
  `uEmail` varchar(254) NOT NULL,
  `uPassword` varchar(255) NOT NULL,
  `uIsActive` tinyint(1) NOT NULL,
  `uIsFullRecord` tinyint(1) NOT NULL,
  `uIsValidated` tinyint(1) NOT NULL DEFAULT -1,
  `uDateAdded` datetime NOT NULL,
  `uLastPasswordChange` datetime NOT NULL,
  `uDateLastUpdated` datetime DEFAULT NULL,
  `uHasAvatar` tinyint(1) NOT NULL,
  `uLastOnline` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uLastLogin` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uPreviousLogin` int(10) UNSIGNED DEFAULT 0,
  `uNumLogins` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uLastAuthTypeID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uLastIP` longtext DEFAULT NULL,
  `uTimezone` varchar(255) DEFAULT NULL,
  `uDefaultLanguage` varchar(32) DEFAULT NULL,
  `uIsPasswordReset` tinyint(1) NOT NULL,
  `uHomeFileManagerFolderID` int(10) UNSIGNED DEFAULT NULL,
  `ignoredIPMismatches` longtext DEFAULT NULL COMMENT '(DC2Type:simple_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`uID`, `uName`, `uEmail`, `uPassword`, `uIsActive`, `uIsFullRecord`, `uIsValidated`, `uDateAdded`, `uLastPasswordChange`, `uDateLastUpdated`, `uHasAvatar`, `uLastOnline`, `uLastLogin`, `uPreviousLogin`, `uNumLogins`, `uLastAuthTypeID`, `uLastIP`, `uTimezone`, `uDefaultLanguage`, `uIsPasswordReset`, `uHomeFileManagerFolderID`, `ignoredIPMismatches`) VALUES
(1, 'admin', 'hostbdfree@gmail.com', '$2y$12$nphJJm1b5VBpgfYr4JPKkuVmTZ3xFB45fec3rJDyrOzIn/UqJWvk.', 1, 1, 1, '2025-06-25 21:10:57', '2025-06-25 21:10:57', '2025-06-25 21:10:57', 0, 1750865183, 1750864257, 0, 1, 0, '6789a107', NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `UserSearchIndexAttributes`
--

CREATE TABLE `UserSearchIndexAttributes` (
  `uID` int(10) UNSIGNED NOT NULL,
  `ak_profile_private_messages_enabled` tinyint(1) DEFAULT 0,
  `ak_profile_private_messages_notification_enabled` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserSignupNotifications`
--

CREATE TABLE `UserSignupNotifications` (
  `usID` int(10) UNSIGNED DEFAULT NULL,
  `nID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserSignups`
--

CREATE TABLE `UserSignups` (
  `usID` int(10) UNSIGNED NOT NULL,
  `uID` int(10) UNSIGNED DEFAULT NULL,
  `createdBy` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserValidationHashes`
--

CREATE TABLE `UserValidationHashes` (
  `uvhID` int(10) UNSIGNED NOT NULL,
  `uID` int(10) UNSIGNED DEFAULT NULL,
  `uHash` varchar(64) NOT NULL,
  `type` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `uDateGenerated` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uDateRedeemed` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserWorkflowProgress`
--

CREATE TABLE `UserWorkflowProgress` (
  `uID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `wpID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `WorkflowProgress`
--

CREATE TABLE `WorkflowProgress` (
  `wpID` int(10) UNSIGNED NOT NULL,
  `wpCategoryID` int(10) UNSIGNED DEFAULT NULL,
  `wfID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `wpApproved` tinyint(1) NOT NULL DEFAULT 0,
  `wpDateAdded` datetime DEFAULT NULL,
  `wpDateLastAction` datetime DEFAULT NULL,
  `wpCurrentStatus` int(11) NOT NULL DEFAULT 0,
  `wrID` int(11) NOT NULL DEFAULT 0,
  `wpIsCompleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `WorkflowProgressCategories`
--

CREATE TABLE `WorkflowProgressCategories` (
  `wpCategoryID` int(10) UNSIGNED NOT NULL,
  `wpCategoryHandle` varchar(255) NOT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `WorkflowProgressCategories`
--

INSERT INTO `WorkflowProgressCategories` (`wpCategoryID`, `wpCategoryHandle`, `pkgID`) VALUES
(1, 'page', NULL),
(2, 'file', NULL),
(3, 'user', NULL),
(4, 'calendar_event', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `WorkflowProgressHistory`
--

CREATE TABLE `WorkflowProgressHistory` (
  `wphID` int(10) UNSIGNED NOT NULL,
  `wpID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `object` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `WorkflowProgressNotifications`
--

CREATE TABLE `WorkflowProgressNotifications` (
  `wpID` int(10) UNSIGNED NOT NULL,
  `nID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `WorkflowRequestObjects`
--

CREATE TABLE `WorkflowRequestObjects` (
  `wrID` int(10) UNSIGNED NOT NULL,
  `wrObject` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Workflows`
--

CREATE TABLE `Workflows` (
  `wfID` int(10) UNSIGNED NOT NULL,
  `wfName` varchar(255) DEFAULT NULL,
  `wftID` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `WorkflowTypes`
--

CREATE TABLE `WorkflowTypes` (
  `wftID` int(10) UNSIGNED NOT NULL,
  `wftHandle` varchar(64) NOT NULL,
  `wftName` varchar(128) NOT NULL,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `WorkflowTypes`
--

INSERT INTO `WorkflowTypes` (`wftID`, `wftHandle`, `wftName`, `pkgID`) VALUES
(1, 'basic', 'Basic Workflow', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Announcements`
--
ALTER TABLE `Announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `AnnouncementUserViews`
--
ALTER TABLE `AnnouncementUserViews`
  ADD PRIMARY KEY (`uID`,`announcement_id`),
  ADD KEY `IDX_B721E7B9FD71026C` (`uID`),
  ADD KEY `IDX_B721E7B9913AEA17` (`announcement_id`);

--
-- Indexes for table `AreaLayoutColumns`
--
ALTER TABLE `AreaLayoutColumns`
  ADD PRIMARY KEY (`arLayoutColumnID`),
  ADD KEY `arLayoutID` (`arLayoutID`,`arLayoutColumnIndex`),
  ADD KEY `arID` (`arID`),
  ADD KEY `arLayoutColumnDisplayID` (`arLayoutColumnDisplayID`);

--
-- Indexes for table `AreaLayoutCustomColumns`
--
ALTER TABLE `AreaLayoutCustomColumns`
  ADD PRIMARY KEY (`arLayoutColumnID`);

--
-- Indexes for table `AreaLayoutPresets`
--
ALTER TABLE `AreaLayoutPresets`
  ADD PRIMARY KEY (`arLayoutPresetID`),
  ADD KEY `arLayoutID` (`arLayoutID`),
  ADD KEY `arLayoutPresetName` (`arLayoutPresetName`);

--
-- Indexes for table `AreaLayouts`
--
ALTER TABLE `AreaLayouts`
  ADD PRIMARY KEY (`arLayoutID`);

--
-- Indexes for table `AreaLayoutsUsingPresets`
--
ALTER TABLE `AreaLayoutsUsingPresets`
  ADD PRIMARY KEY (`arLayoutID`);

--
-- Indexes for table `AreaLayoutThemeGridColumns`
--
ALTER TABLE `AreaLayoutThemeGridColumns`
  ADD PRIMARY KEY (`arLayoutColumnID`);

--
-- Indexes for table `AreaPermissionAssignments`
--
ALTER TABLE `AreaPermissionAssignments`
  ADD PRIMARY KEY (`cID`,`arHandle`,`pkID`,`paID`),
  ADD KEY `paID` (`paID`),
  ADD KEY `pkID` (`pkID`);

--
-- Indexes for table `AreaPermissionBlockTypeAccessList`
--
ALTER TABLE `AreaPermissionBlockTypeAccessList`
  ADD PRIMARY KEY (`paID`,`peID`),
  ADD KEY `peID` (`peID`);

--
-- Indexes for table `AreaPermissionBlockTypeAccessListCustom`
--
ALTER TABLE `AreaPermissionBlockTypeAccessListCustom`
  ADD PRIMARY KEY (`paID`,`peID`,`btID`),
  ADD KEY `peID` (`peID`),
  ADD KEY `btID` (`btID`);

--
-- Indexes for table `Areas`
--
ALTER TABLE `Areas`
  ADD PRIMARY KEY (`arID`),
  ADD KEY `arIsGlobal` (`arIsGlobal`),
  ADD KEY `cID` (`cID`),
  ADD KEY `arHandle` (`arHandle`),
  ADD KEY `arParentID` (`arParentID`);

--
-- Indexes for table `atAddress`
--
ALTER TABLE `atAddress`
  ADD PRIMARY KEY (`avID`),
  ADD KEY `postal_code` (`postal_code`);

--
-- Indexes for table `atAddressSettings`
--
ALTER TABLE `atAddressSettings`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `atBoolean`
--
ALTER TABLE `atBoolean`
  ADD PRIMARY KEY (`avID`);

--
-- Indexes for table `atBooleanSettings`
--
ALTER TABLE `atBooleanSettings`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `atDateTime`
--
ALTER TABLE `atDateTime`
  ADD PRIMARY KEY (`avID`);

--
-- Indexes for table `atDateTimeSettings`
--
ALTER TABLE `atDateTimeSettings`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `atDefault`
--
ALTER TABLE `atDefault`
  ADD PRIMARY KEY (`avID`);

--
-- Indexes for table `atDuration`
--
ALTER TABLE `atDuration`
  ADD PRIMARY KEY (`avID`);

--
-- Indexes for table `atDurationSettings`
--
ALTER TABLE `atDurationSettings`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `atEmptySettings`
--
ALTER TABLE `atEmptySettings`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `atExpress`
--
ALTER TABLE `atExpress`
  ADD PRIMARY KEY (`avID`);

--
-- Indexes for table `atExpressSelectedEntries`
--
ALTER TABLE `atExpressSelectedEntries`
  ADD PRIMARY KEY (`avID`,`exEntryID`),
  ADD KEY `IDX_C9D404BBA2A82A5D` (`avID`),
  ADD KEY `IDX_C9D404BB6DCB6296` (`exEntryID`);

--
-- Indexes for table `atExpressSettings`
--
ALTER TABLE `atExpressSettings`
  ADD PRIMARY KEY (`akID`),
  ADD KEY `IDX_E8F67F0FCE2D7284` (`exEntityID`);

--
-- Indexes for table `atFile`
--
ALTER TABLE `atFile`
  ADD PRIMARY KEY (`avID`),
  ADD KEY `IDX_73D17D61E3111F45` (`fID`);

--
-- Indexes for table `atFileSettings`
--
ALTER TABLE `atFileSettings`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `atNumber`
--
ALTER TABLE `atNumber`
  ADD PRIMARY KEY (`avID`);

--
-- Indexes for table `atSelect`
--
ALTER TABLE `atSelect`
  ADD PRIMARY KEY (`avID`);

--
-- Indexes for table `atSelectedSocialLinks`
--
ALTER TABLE `atSelectedSocialLinks`
  ADD PRIMARY KEY (`avsID`),
  ADD KEY `IDX_10743709A2A82A5D` (`avID`);

--
-- Indexes for table `atSelectedTopics`
--
ALTER TABLE `atSelectedTopics`
  ADD PRIMARY KEY (`avTreeTopicNodeID`),
  ADD KEY `IDX_E42A7D5BA2A82A5D` (`avID`);

--
-- Indexes for table `atSelectOptionLists`
--
ALTER TABLE `atSelectOptionLists`
  ADD PRIMARY KEY (`avSelectOptionListID`);

--
-- Indexes for table `atSelectOptions`
--
ALTER TABLE `atSelectOptions`
  ADD PRIMARY KEY (`avSelectOptionID`),
  ADD KEY `IDX_797414B0CB59257C` (`avSelectOptionListID`);

--
-- Indexes for table `atSelectOptionsSelected`
--
ALTER TABLE `atSelectOptionsSelected`
  ADD PRIMARY KEY (`avID`,`avSelectOptionID`),
  ADD KEY `IDX_40C97EC3A2A82A5D` (`avID`),
  ADD KEY `IDX_40C97EC3E584C274` (`avSelectOptionID`);

--
-- Indexes for table `atSelectSettings`
--
ALTER TABLE `atSelectSettings`
  ADD PRIMARY KEY (`akID`),
  ADD UNIQUE KEY `UNIQ_5D514424CB59257C` (`avSelectOptionListID`);

--
-- Indexes for table `atSite`
--
ALTER TABLE `atSite`
  ADD PRIMARY KEY (`avID`),
  ADD KEY `IDX_960D4295521D8435` (`siteID`);

--
-- Indexes for table `atSocialLinks`
--
ALTER TABLE `atSocialLinks`
  ADD PRIMARY KEY (`avID`);

--
-- Indexes for table `atTextareaSettings`
--
ALTER TABLE `atTextareaSettings`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `atTextSettings`
--
ALTER TABLE `atTextSettings`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `atTopic`
--
ALTER TABLE `atTopic`
  ADD PRIMARY KEY (`avID`);

--
-- Indexes for table `atTopicSettings`
--
ALTER TABLE `atTopicSettings`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `AttributeKeyCategories`
--
ALTER TABLE `AttributeKeyCategories`
  ADD PRIMARY KEY (`akCategoryID`),
  ADD UNIQUE KEY `UNIQ_A2A0CC67FA0337B` (`akCategoryHandle`),
  ADD KEY `IDX_A2A0CC67CE45CBB0` (`pkgID`),
  ADD KEY `pkgID` (`pkgID`,`akCategoryID`),
  ADD KEY `akCategoryHandle` (`akCategoryHandle`);

--
-- Indexes for table `AttributeKeys`
--
ALTER TABLE `AttributeKeys`
  ADD PRIMARY KEY (`akID`),
  ADD KEY `IDX_DCA32C62A12CFE33` (`atID`),
  ADD KEY `IDX_DCA32C62B059B76B` (`akCategoryID`),
  ADD KEY `pkgID` (`pkgID`),
  ADD KEY `akHandle` (`akHandle`),
  ADD KEY `akIsSearchable` (`akIsSearchable`),
  ADD KEY `akIsInternal` (`akIsInternal`);

--
-- Indexes for table `AttributeSetKeys`
--
ALTER TABLE `AttributeSetKeys`
  ADD PRIMARY KEY (`akID`,`asID`),
  ADD KEY `IDX_222F72D8B6561A7E` (`akID`),
  ADD KEY `IDX_222F72D8A463E8B6` (`asID`);

--
-- Indexes for table `AttributeSets`
--
ALTER TABLE `AttributeSets`
  ADD PRIMARY KEY (`asID`),
  ADD KEY `IDX_FCA02D5FB059B76B` (`akCategoryID`),
  ADD KEY `asHandle` (`asHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `AttributeTypeCategories`
--
ALTER TABLE `AttributeTypeCategories`
  ADD PRIMARY KEY (`akCategoryID`,`atID`),
  ADD KEY `IDX_49A9CABEB059B76B` (`akCategoryID`),
  ADD KEY `IDX_49A9CABEA12CFE33` (`atID`);

--
-- Indexes for table `AttributeTypes`
--
ALTER TABLE `AttributeTypes`
  ADD PRIMARY KEY (`atID`),
  ADD UNIQUE KEY `UNIQ_53580A7F46AA0F38` (`atHandle`),
  ADD KEY `IDX_53580A7FCE45CBB0` (`pkgID`),
  ADD KEY `pkgID` (`pkgID`,`atID`);

--
-- Indexes for table `AttributeValues`
--
ALTER TABLE `AttributeValues`
  ADD PRIMARY KEY (`avID`),
  ADD KEY `IDX_DCCE7864B6561A7E` (`akID`);

--
-- Indexes for table `atUserGroupSettings`
--
ALTER TABLE `atUserGroupSettings`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `AuthenticationTypes`
--
ALTER TABLE `AuthenticationTypes`
  ADD PRIMARY KEY (`authTypeID`),
  ADD UNIQUE KEY `authTypeHandle` (`authTypeHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `authTypeConcreteCookieMap`
--
ALTER TABLE `authTypeConcreteCookieMap`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `uID` (`uID`);

--
-- Indexes for table `BannedWords`
--
ALTER TABLE `BannedWords`
  ADD PRIMARY KEY (`bwID`);

--
-- Indexes for table `BasicWorkflowPermissionAssignments`
--
ALTER TABLE `BasicWorkflowPermissionAssignments`
  ADD PRIMARY KEY (`wfID`,`pkID`,`paID`),
  ADD KEY `pkID` (`pkID`),
  ADD KEY `paID` (`paID`);

--
-- Indexes for table `BasicWorkflowProgressData`
--
ALTER TABLE `BasicWorkflowProgressData`
  ADD PRIMARY KEY (`wpID`),
  ADD KEY `uIDStarted` (`uIDStarted`),
  ADD KEY `uIDCompleted` (`uIDCompleted`);

--
-- Indexes for table `BlockPermissionAssignments`
--
ALTER TABLE `BlockPermissionAssignments`
  ADD PRIMARY KEY (`cID`,`cvID`,`bID`,`pkID`,`paID`),
  ADD KEY `bID` (`bID`),
  ADD KEY `pkID` (`pkID`),
  ADD KEY `paID` (`paID`);

--
-- Indexes for table `Blocks`
--
ALTER TABLE `Blocks`
  ADD PRIMARY KEY (`bID`),
  ADD KEY `btID` (`btID`),
  ADD KEY `uID` (`uID`);

--
-- Indexes for table `BlockTypePermissionBlockTypeAccessList`
--
ALTER TABLE `BlockTypePermissionBlockTypeAccessList`
  ADD PRIMARY KEY (`paID`,`peID`),
  ADD KEY `peID` (`peID`);

--
-- Indexes for table `BlockTypePermissionBlockTypeAccessListCustom`
--
ALTER TABLE `BlockTypePermissionBlockTypeAccessListCustom`
  ADD PRIMARY KEY (`paID`,`peID`,`btID`),
  ADD KEY `peID` (`peID`),
  ADD KEY `btID` (`btID`);

--
-- Indexes for table `BlockTypes`
--
ALTER TABLE `BlockTypes`
  ADD PRIMARY KEY (`btID`);

--
-- Indexes for table `BlockTypeSetBlockTypes`
--
ALTER TABLE `BlockTypeSetBlockTypes`
  ADD PRIMARY KEY (`btID`,`btsID`),
  ADD KEY `btsID` (`btsID`,`displayOrder`);

--
-- Indexes for table `BlockTypeSets`
--
ALTER TABLE `BlockTypeSets`
  ADD PRIMARY KEY (`btsID`),
  ADD UNIQUE KEY `btsHandle` (`btsHandle`),
  ADD KEY `btsDisplayOrder` (`btsDisplayOrder`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `BoardConfiguredDataSourceConfiguration`
--
ALTER TABLE `BoardConfiguredDataSourceConfiguration`
  ADD PRIMARY KEY (`configurationID`),
  ADD UNIQUE KEY `UNIQ_80879512E2D47DD5` (`configuredDataSourceID`);

--
-- Indexes for table `BoardConfiguredDataSourceConfigurationCalendarEvent`
--
ALTER TABLE `BoardConfiguredDataSourceConfigurationCalendarEvent`
  ADD PRIMARY KEY (`configurationID`),
  ADD KEY `IDX_DE5A529911C85723` (`caID`);

--
-- Indexes for table `BoardConfiguredDataSourceConfigurationPage`
--
ALTER TABLE `BoardConfiguredDataSourceConfigurationPage`
  ADD PRIMARY KEY (`configurationID`);

--
-- Indexes for table `BoardConfiguredDataSources`
--
ALTER TABLE `BoardConfiguredDataSources`
  ADD PRIMARY KEY (`configuredDataSourceID`),
  ADD KEY `IDX_481DA3EF2571BEE` (`boardID`),
  ADD KEY `IDX_481DA3EF3C4EAFF2` (`dataSourceID`);

--
-- Indexes for table `BoardCustomSlotTemplates`
--
ALTER TABLE `BoardCustomSlotTemplates`
  ADD PRIMARY KEY (`boardID`,`slotTemplateID`),
  ADD KEY `IDX_A972DD602571BEE` (`boardID`),
  ADD KEY `IDX_A972DD60E7630775` (`slotTemplateID`);

--
-- Indexes for table `BoardDataSources`
--
ALTER TABLE `BoardDataSources`
  ADD PRIMARY KEY (`dataSourceID`),
  ADD KEY `IDX_DACB5A9ACE45CBB0` (`pkgID`);

--
-- Indexes for table `BoardDesignerCustomElementItems`
--
ALTER TABLE `BoardDesignerCustomElementItems`
  ADD PRIMARY KEY (`itemId`),
  ADD KEY `IDX_C3E81E43A1BF9938` (`boardItemID`),
  ADD KEY `IDX_C3E81E43DA67F394` (`customElementID`);

--
-- Indexes for table `BoardDesignerCustomElements`
--
ALTER TABLE `BoardDesignerCustomElements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D2D0FCBDFD71026C` (`uID`),
  ADD KEY `IDX_D2D0FCBD80D42955` (`slotTemplate_id`);

--
-- Indexes for table `BoardInstanceItemBatches`
--
ALTER TABLE `BoardInstanceItemBatches`
  ADD PRIMARY KEY (`boardInstanceItemBatchID`),
  ADD KEY `IDX_968D5F552E21467` (`boardInstanceID`);

--
-- Indexes for table `BoardInstanceItems`
--
ALTER TABLE `BoardInstanceItems`
  ADD PRIMARY KEY (`boardInstanceItemID`),
  ADD KEY `IDX_285D2C82A1BF9938` (`boardItemID`),
  ADD KEY `IDX_285D2C82E2D47DD5` (`configuredDataSourceID`),
  ADD KEY `IDX_285D2C822E21467` (`boardInstanceID`),
  ADD KEY `IDX_285D2C82E9D76F8E` (`boardInstanceItemBatchID`);

--
-- Indexes for table `BoardInstanceLogEntries`
--
ALTER TABLE `BoardInstanceLogEntries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4CBE00D8EA675D86` (`log_id`);

--
-- Indexes for table `BoardInstanceLogs`
--
ALTER TABLE `BoardInstanceLogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_BF6A8F2F2E21467` (`boardInstanceID`);

--
-- Indexes for table `BoardInstances`
--
ALTER TABLE `BoardInstances`
  ADD PRIMARY KEY (`boardInstanceID`),
  ADD KEY `IDX_8B85BCCB2571BEE` (`boardID`),
  ADD KEY `IDX_8B85BCCB521D8435` (`siteID`);

--
-- Indexes for table `BoardInstanceSlotRules`
--
ALTER TABLE `BoardInstanceSlotRules`
  ADD PRIMARY KEY (`boardInstanceSlotRuleID`),
  ADD KEY `IDX_4BF1A09D2E21467` (`boardInstanceID`),
  ADD KEY `IDX_4BF1A09DFD71026C` (`uID`);

--
-- Indexes for table `BoardInstanceSlots`
--
ALTER TABLE `BoardInstanceSlots`
  ADD PRIMARY KEY (`boardInstanceSlotID`),
  ADD KEY `IDX_137F01F2E21467` (`boardInstanceID`),
  ADD KEY `IDX_137F01F5DA0FB8` (`template_id`);

--
-- Indexes for table `BoardItemCategories`
--
ALTER TABLE `BoardItemCategories`
  ADD PRIMARY KEY (`boardItemCategoryID`),
  ADD KEY `IDX_BEF09673A1BF9938` (`boardItemID`);

--
-- Indexes for table `BoardItems`
--
ALTER TABLE `BoardItems`
  ADD PRIMARY KEY (`boardItemID`),
  ADD KEY `IDX_E831ECA1E3111F45` (`fID`),
  ADD KEY `IDX_E831ECA13C4EAFF2` (`dataSourceID`),
  ADD KEY `uniqueItemId` (`uniqueItemId`);

--
-- Indexes for table `BoardItemTags`
--
ALTER TABLE `BoardItemTags`
  ADD PRIMARY KEY (`boardItemTagID`),
  ADD KEY `IDX_13AEB901A1BF9938` (`boardItemID`);

--
-- Indexes for table `BoardPermissionAssignments`
--
ALTER TABLE `BoardPermissionAssignments`
  ADD PRIMARY KEY (`boardID`,`pkID`,`paID`),
  ADD KEY `IDX_7C073ED92571BEE` (`boardID`),
  ADD KEY `paID` (`paID`),
  ADD KEY `pkID` (`pkID`);

--
-- Indexes for table `Boards`
--
ALTER TABLE `Boards`
  ADD PRIMARY KEY (`boardID`),
  ADD KEY `IDX_F4424825521D8435` (`siteID`),
  ADD KEY `IDX_F44248255DA0FB8` (`template_id`),
  ADD KEY `IDX_F4424825CE45CBB0` (`pkgID`);

--
-- Indexes for table `BoardSlotTemplates`
--
ALTER TABLE `BoardSlotTemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6FE111C5CE45CBB0` (`pkgID`);

--
-- Indexes for table `BoardSlotTemplateTags`
--
ALTER TABLE `BoardSlotTemplateTags`
  ADD PRIMARY KEY (`slottemplate_id`,`designtag_id`),
  ADD KEY `IDX_7BB1975E648A682` (`slottemplate_id`),
  ADD KEY `IDX_7BB1975E960BFEAE` (`designtag_id`);

--
-- Indexes for table `BoardTemplates`
--
ALTER TABLE `BoardTemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9E8AC12CCE45CBB0` (`pkgID`);

--
-- Indexes for table `btAccordion`
--
ALTER TABLE `btAccordion`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btAccordionEntries`
--
ALTER TABLE `btAccordionEntries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bID` (`bID`,`sortOrder`);

--
-- Indexes for table `btBoard`
--
ALTER TABLE `btBoard`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btBreadcrumbs`
--
ALTER TABLE `btBreadcrumbs`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btCalendar`
--
ALTER TABLE `btCalendar`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btCalendarEvent`
--
ALTER TABLE `btCalendarEvent`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btContentFile`
--
ALTER TABLE `btContentFile`
  ADD PRIMARY KEY (`bID`),
  ADD KEY `fID` (`fID`);

--
-- Indexes for table `btContentImage`
--
ALTER TABLE `btContentImage`
  ADD PRIMARY KEY (`bID`),
  ADD KEY `fID` (`fID`);

--
-- Indexes for table `btContentImageBreakpoints`
--
ALTER TABLE `btContentImageBreakpoints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `btContentLocal`
--
ALTER TABLE `btContentLocal`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btCoreAreaLayout`
--
ALTER TABLE `btCoreAreaLayout`
  ADD PRIMARY KEY (`bID`),
  ADD KEY `arLayoutID` (`arLayoutID`);

--
-- Indexes for table `btCoreBoardSlot`
--
ALTER TABLE `btCoreBoardSlot`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btCoreContainer`
--
ALTER TABLE `btCoreContainer`
  ADD PRIMARY KEY (`bID`),
  ADD KEY `containerInstanceID` (`containerInstanceID`);

--
-- Indexes for table `btCoreConversation`
--
ALTER TABLE `btCoreConversation`
  ADD PRIMARY KEY (`bID`),
  ADD KEY `cnvID` (`cnvID`);

--
-- Indexes for table `btCorePageTypeComposerControlOutput`
--
ALTER TABLE `btCorePageTypeComposerControlOutput`
  ADD PRIMARY KEY (`bID`),
  ADD KEY `ptComposerOutputControlID` (`ptComposerOutputControlID`);

--
-- Indexes for table `btCoreScrapbookDisplay`
--
ALTER TABLE `btCoreScrapbookDisplay`
  ADD PRIMARY KEY (`bID`),
  ADD KEY `bOriginalID` (`bOriginalID`);

--
-- Indexes for table `btCoreStackDisplay`
--
ALTER TABLE `btCoreStackDisplay`
  ADD PRIMARY KEY (`bID`),
  ADD KEY `stID` (`stID`);

--
-- Indexes for table `btDateNavigation`
--
ALTER TABLE `btDateNavigation`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btDesktopConcreteLatest`
--
ALTER TABLE `btDesktopConcreteLatest`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btDesktopDraftList`
--
ALTER TABLE `btDesktopDraftList`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btDesktopSiteActivity`
--
ALTER TABLE `btDesktopSiteActivity`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btDocumentLibrary`
--
ALTER TABLE `btDocumentLibrary`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btEventList`
--
ALTER TABLE `btEventList`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btExpressEntryDetail`
--
ALTER TABLE `btExpressEntryDetail`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btExpressEntryList`
--
ALTER TABLE `btExpressEntryList`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btExpressForm`
--
ALTER TABLE `btExpressForm`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btExternalForm`
--
ALTER TABLE `btExternalForm`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btFaq`
--
ALTER TABLE `btFaq`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btFaqEntries`
--
ALTER TABLE `btFaqEntries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bID` (`bID`,`sortOrder`);

--
-- Indexes for table `btFeature`
--
ALTER TABLE `btFeature`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btFeatureLink`
--
ALTER TABLE `btFeatureLink`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btForm`
--
ALTER TABLE `btForm`
  ADD PRIMARY KEY (`bID`),
  ADD KEY `questionSetIdForeign` (`questionSetId`);

--
-- Indexes for table `btFormAnswers`
--
ALTER TABLE `btFormAnswers`
  ADD PRIMARY KEY (`aID`),
  ADD KEY `asID` (`asID`),
  ADD KEY `msqID` (`msqID`);

--
-- Indexes for table `btFormAnswerSet`
--
ALTER TABLE `btFormAnswerSet`
  ADD PRIMARY KEY (`asID`),
  ADD KEY `questionSetId` (`questionSetId`),
  ADD KEY `uID` (`uID`);

--
-- Indexes for table `btFormQuestions`
--
ALTER TABLE `btFormQuestions`
  ADD PRIMARY KEY (`qID`),
  ADD KEY `questionSetId` (`questionSetId`),
  ADD KEY `msqID` (`msqID`),
  ADD KEY `bID` (`bID`,`questionSetId`);

--
-- Indexes for table `btGallery`
--
ALTER TABLE `btGallery`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btGalleryEntries`
--
ALTER TABLE `btGalleryEntries`
  ADD PRIMARY KEY (`eID`);

--
-- Indexes for table `btGalleryEntryDisplayChoices`
--
ALTER TABLE `btGalleryEntryDisplayChoices`
  ADD PRIMARY KEY (`dcID`);

--
-- Indexes for table `btGoogleMap`
--
ALTER TABLE `btGoogleMap`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btHeroImage`
--
ALTER TABLE `btHeroImage`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btImageSlider`
--
ALTER TABLE `btImageSlider`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btImageSliderEntries`
--
ALTER TABLE `btImageSliderEntries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `btNavigation`
--
ALTER TABLE `btNavigation`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btNextPrevious`
--
ALTER TABLE `btNextPrevious`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btPageAttributeDisplay`
--
ALTER TABLE `btPageAttributeDisplay`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btPageList`
--
ALTER TABLE `btPageList`
  ADD PRIMARY KEY (`bID`),
  ADD KEY `ptID` (`ptID`);

--
-- Indexes for table `btPageTitle`
--
ALTER TABLE `btPageTitle`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btRssDisplay`
--
ALTER TABLE `btRssDisplay`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btSearch`
--
ALTER TABLE `btSearch`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btShareThisPage`
--
ALTER TABLE `btShareThisPage`
  ADD PRIMARY KEY (`btShareThisPageID`);

--
-- Indexes for table `btSocialLinks`
--
ALTER TABLE `btSocialLinks`
  ADD PRIMARY KEY (`btSocialLinkID`),
  ADD KEY `bID` (`bID`,`displayOrder`),
  ADD KEY `slID` (`slID`);

--
-- Indexes for table `btSurvey`
--
ALTER TABLE `btSurvey`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btSurveyOptions`
--
ALTER TABLE `btSurveyOptions`
  ADD PRIMARY KEY (`optionID`),
  ADD KEY `bID` (`bID`,`displayOrder`);

--
-- Indexes for table `btSurveyResults`
--
ALTER TABLE `btSurveyResults`
  ADD PRIMARY KEY (`resultID`),
  ADD KEY `optionID` (`optionID`),
  ADD KEY `cID` (`cID`,`optionID`,`bID`),
  ADD KEY `bID` (`bID`,`cID`,`uID`),
  ADD KEY `uID` (`uID`);

--
-- Indexes for table `btSwitchLanguage`
--
ALTER TABLE `btSwitchLanguage`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btTags`
--
ALTER TABLE `btTags`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btTestimonial`
--
ALTER TABLE `btTestimonial`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btTopicList`
--
ALTER TABLE `btTopicList`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btTopNavigationBar`
--
ALTER TABLE `btTopNavigationBar`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btVideo`
--
ALTER TABLE `btVideo`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btYouTube`
--
ALTER TABLE `btYouTube`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `CalendarEventAttributeKeys`
--
ALTER TABLE `CalendarEventAttributeKeys`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `CalendarEventCustomSummaryTemplates`
--
ALTER TABLE `CalendarEventCustomSummaryTemplates`
  ADD PRIMARY KEY (`eventID`,`template_id`),
  ADD KEY `IDX_7059BBEF10409BA4` (`eventID`),
  ADD KEY `IDX_7059BBEF5DA0FB8` (`template_id`);

--
-- Indexes for table `CalendarEventOccurrences`
--
ALTER TABLE `CalendarEventOccurrences`
  ADD PRIMARY KEY (`occurrenceID`),
  ADD KEY `IDX_7DD686EC31391E00` (`repetitionID`),
  ADD KEY `eventdates` (`occurrenceID`,`startTime`,`endTime`);

--
-- Indexes for table `CalendarEventRepetitions`
--
ALTER TABLE `CalendarEventRepetitions`
  ADD PRIMARY KEY (`repetitionID`);

--
-- Indexes for table `CalendarEvents`
--
ALTER TABLE `CalendarEvents`
  ADD PRIMARY KEY (`eventID`),
  ADD KEY `IDX_7F23C55611C85723` (`caID`);

--
-- Indexes for table `CalendarEventSearchIndexAttributes`
--
ALTER TABLE `CalendarEventSearchIndexAttributes`
  ADD PRIMARY KEY (`eventID`);

--
-- Indexes for table `CalendarEventSummaryTemplates`
--
ALTER TABLE `CalendarEventSummaryTemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_219AA86B10409BA4` (`eventID`),
  ADD KEY `IDX_219AA86B5DA0FB8` (`template_id`);

--
-- Indexes for table `CalendarEventVersionAttributeValues`
--
ALTER TABLE `CalendarEventVersionAttributeValues`
  ADD PRIMARY KEY (`eventVersionID`,`akID`),
  ADD KEY `IDX_8C835B05403F5D6` (`eventVersionID`),
  ADD KEY `IDX_8C835B05B6561A7E` (`akID`),
  ADD KEY `IDX_8C835B05A2A82A5D` (`avID`);

--
-- Indexes for table `CalendarEventVersionOccurrences`
--
ALTER TABLE `CalendarEventVersionOccurrences`
  ADD PRIMARY KEY (`versionOccurrenceID`),
  ADD KEY `IDX_60310489403F5D6` (`eventVersionID`),
  ADD KEY `IDX_60310489B4FDDC0F` (`occurrenceID`);

--
-- Indexes for table `CalendarEventVersionRepetitions`
--
ALTER TABLE `CalendarEventVersionRepetitions`
  ADD PRIMARY KEY (`versionRepetitionID`),
  ADD KEY `IDX_C1C3D3DB403F5D6` (`eventVersionID`),
  ADD KEY `IDX_C1C3D3DB31391E00` (`repetitionID`);

--
-- Indexes for table `CalendarEventVersions`
--
ALTER TABLE `CalendarEventVersions`
  ADD PRIMARY KEY (`eventVersionID`),
  ADD KEY `IDX_8E26027410409BA4` (`eventID`),
  ADD KEY `IDX_8E260274FD71026C` (`uID`);

--
-- Indexes for table `CalendarEventWorkflowProgress`
--
ALTER TABLE `CalendarEventWorkflowProgress`
  ADD PRIMARY KEY (`eventID`,`wpID`),
  ADD KEY `IDX_C5EAACF910409BA4` (`eventID`),
  ADD KEY `wpID` (`wpID`);

--
-- Indexes for table `CalendarPermissionAssignments`
--
ALTER TABLE `CalendarPermissionAssignments`
  ADD PRIMARY KEY (`caID`,`pkID`,`paID`),
  ADD KEY `IDX_5AD546AA11C85723` (`caID`),
  ADD KEY `paID` (`paID`),
  ADD KEY `pkID` (`pkID`);

--
-- Indexes for table `CalendarRelatedEvents`
--
ALTER TABLE `CalendarRelatedEvents`
  ADD PRIMARY KEY (`relatedEventID`),
  ADD KEY `IDX_310130E910409BA4` (`eventID`);

--
-- Indexes for table `Calendars`
--
ALTER TABLE `Calendars`
  ADD PRIMARY KEY (`caID`),
  ADD KEY `IDX_62E00AC521D8435` (`siteID`);

--
-- Indexes for table `CollectionAttributeKeys`
--
ALTER TABLE `CollectionAttributeKeys`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `CollectionAttributeValues`
--
ALTER TABLE `CollectionAttributeValues`
  ADD PRIMARY KEY (`cID`,`cvID`,`akID`),
  ADD KEY `IDX_BB9995FCB6561A7E` (`akID`),
  ADD KEY `IDX_BB9995FCA2A82A5D` (`avID`);

--
-- Indexes for table `Collections`
--
ALTER TABLE `Collections`
  ADD PRIMARY KEY (`cID`),
  ADD KEY `cIDDateModified` (`cID`,`cDateModified`),
  ADD KEY `cDateModified` (`cDateModified`),
  ADD KEY `cDateAdded` (`cDateAdded`);

--
-- Indexes for table `CollectionSearchIndexAttributes`
--
ALTER TABLE `CollectionSearchIndexAttributes`
  ADD PRIMARY KEY (`cID`),
  ADD KEY `ak_exclude_page_list` (`ak_exclude_page_list`,`cID`),
  ADD KEY `ak_is_featured` (`ak_is_featured`,`cID`);

--
-- Indexes for table `CollectionVersionAreaStyles`
--
ALTER TABLE `CollectionVersionAreaStyles`
  ADD PRIMARY KEY (`cID`,`cvID`,`arHandle`),
  ADD KEY `issID` (`issID`);

--
-- Indexes for table `CollectionVersionBlocks`
--
ALTER TABLE `CollectionVersionBlocks`
  ADD PRIMARY KEY (`cID`,`cvID`,`bID`,`arHandle`),
  ADD KEY `bID` (`bID`,`cID`),
  ADD KEY `cbRelationID` (`cbRelationID`);

--
-- Indexes for table `CollectionVersionBlocksCacheSettings`
--
ALTER TABLE `CollectionVersionBlocksCacheSettings`
  ADD PRIMARY KEY (`cID`,`cvID`,`bID`,`arHandle`),
  ADD KEY `bID` (`bID`,`cID`,`cvID`,`arHandle`);

--
-- Indexes for table `CollectionVersionBlocksOutputCache`
--
ALTER TABLE `CollectionVersionBlocksOutputCache`
  ADD PRIMARY KEY (`cID`,`cvID`,`bID`,`arHandle`),
  ADD KEY `bID` (`bID`,`cID`,`cvID`,`arHandle`);

--
-- Indexes for table `CollectionVersionBlockStyles`
--
ALTER TABLE `CollectionVersionBlockStyles`
  ADD PRIMARY KEY (`cID`,`cvID`,`bID`,`arHandle`),
  ADD KEY `bID` (`bID`,`issID`),
  ADD KEY `issID` (`issID`);

--
-- Indexes for table `CollectionVersionRelatedEdits`
--
ALTER TABLE `CollectionVersionRelatedEdits`
  ADD PRIMARY KEY (`cID`,`cvID`,`cRelationID`,`cvRelationID`);

--
-- Indexes for table `CollectionVersions`
--
ALTER TABLE `CollectionVersions`
  ADD PRIMARY KEY (`cID`,`cvID`),
  ADD KEY `cvIsApproved` (`cvIsApproved`),
  ADD KEY `cvAuthorUID` (`cvAuthorUID`),
  ADD KEY `cvApproverUID` (`cvApproverUID`),
  ADD KEY `pThemeID` (`pThemeID`),
  ADD KEY `pTemplateID` (`pTemplateID`),
  ADD KEY `cvDatePublic` (`cvDatePublic`),
  ADD KEY `idxPublishDate` (`cID`,`cvID`,`cvIsApproved`,`cvPublishDate`,`cvPublishEndDate`);

--
-- Indexes for table `CollectionVersionThemeCustomStyles`
--
ALTER TABLE `CollectionVersionThemeCustomStyles`
  ADD PRIMARY KEY (`cID`,`cvID`,`pThemeID`),
  ADD KEY `pThemeID` (`pThemeID`),
  ADD KEY `scvlID` (`scvlID`),
  ADD KEY `sccRecordID` (`sccRecordID`);

--
-- Indexes for table `Config`
--
ALTER TABLE `Config`
  ADD PRIMARY KEY (`configNamespace`,`configGroup`,`configItem`),
  ADD KEY `configGroup` (`configGroup`);

--
-- Indexes for table `ConfigStore`
--
ALTER TABLE `ConfigStore`
  ADD PRIMARY KEY (`cfKey`,`uID`),
  ADD KEY `uID` (`uID`,`cfKey`),
  ADD KEY `pkgID` (`pkgID`,`cfKey`);

--
-- Indexes for table `ConversationEditors`
--
ALTER TABLE `ConversationEditors`
  ADD PRIMARY KEY (`cnvEditorID`),
  ADD KEY `pkgID` (`pkgID`,`cnvEditorHandle`);

--
-- Indexes for table `ConversationFlaggedMessages`
--
ALTER TABLE `ConversationFlaggedMessages`
  ADD PRIMARY KEY (`cnvMessageID`),
  ADD KEY `cnvMessageFlagTypeID` (`cnvMessageFlagTypeID`);

--
-- Indexes for table `ConversationFlaggedMessageTypes`
--
ALTER TABLE `ConversationFlaggedMessageTypes`
  ADD PRIMARY KEY (`cnvMessageFlagTypeID`),
  ADD UNIQUE KEY `cnvMessageFlagTypeHandle` (`cnvMessageFlagTypeHandle`);

--
-- Indexes for table `ConversationMessageAttachments`
--
ALTER TABLE `ConversationMessageAttachments`
  ADD PRIMARY KEY (`cnvMessageAttachmentID`),
  ADD KEY `cnvMessageID` (`cnvMessageID`),
  ADD KEY `fID` (`fID`);

--
-- Indexes for table `ConversationMessageNotifications`
--
ALTER TABLE `ConversationMessageNotifications`
  ADD PRIMARY KEY (`nID`);

--
-- Indexes for table `ConversationMessageRatings`
--
ALTER TABLE `ConversationMessageRatings`
  ADD PRIMARY KEY (`cnvMessageRatingID`),
  ADD KEY `cnvMessageID` (`cnvMessageID`,`cnvRatingTypeID`),
  ADD KEY `cnvRatingTypeID` (`cnvRatingTypeID`),
  ADD KEY `uID` (`uID`);

--
-- Indexes for table `ConversationMessages`
--
ALTER TABLE `ConversationMessages`
  ADD PRIMARY KEY (`cnvMessageID`),
  ADD KEY `cnvID` (`cnvID`),
  ADD KEY `cnvMessageParentID` (`cnvMessageParentID`),
  ADD KEY `uID` (`uID`);

--
-- Indexes for table `ConversationPermissionAddMessageAccessList`
--
ALTER TABLE `ConversationPermissionAddMessageAccessList`
  ADD PRIMARY KEY (`paID`,`peID`),
  ADD KEY `peID` (`peID`);

--
-- Indexes for table `ConversationPermissionAssignments`
--
ALTER TABLE `ConversationPermissionAssignments`
  ADD PRIMARY KEY (`cnvID`,`pkID`,`paID`),
  ADD KEY `paID` (`paID`),
  ADD KEY `pkID` (`pkID`);

--
-- Indexes for table `ConversationRatingTypes`
--
ALTER TABLE `ConversationRatingTypes`
  ADD PRIMARY KEY (`cnvRatingTypeID`),
  ADD UNIQUE KEY `cnvRatingTypeHandle` (`cnvRatingTypeHandle`),
  ADD KEY `pkgID` (`pkgID`,`cnvRatingTypeHandle`);

--
-- Indexes for table `Conversations`
--
ALTER TABLE `Conversations`
  ADD PRIMARY KEY (`cnvID`),
  ADD KEY `cID` (`cID`),
  ADD KEY `cnvParentMessageID` (`cnvParentMessageID`);

--
-- Indexes for table `ConversationSubscriptions`
--
ALTER TABLE `ConversationSubscriptions`
  ADD PRIMARY KEY (`cnvID`,`uID`),
  ADD KEY `cnvID` (`cnvID`),
  ADD KEY `uID` (`uID`);

--
-- Indexes for table `DesignTags`
--
ALTER TABLE `DesignTags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `DownloadStatistics`
--
ALTER TABLE `DownloadStatistics`
  ADD PRIMARY KEY (`dsID`),
  ADD KEY `IDX_7CDE2E3CE3111F45` (`fID`),
  ADD KEY `fID` (`fID`,`timestamp`),
  ADD KEY `fvID` (`fID`,`fvID`),
  ADD KEY `uID` (`uID`),
  ADD KEY `rcID` (`rcID`),
  ADD KEY `timestamp` (`timestamp`);

--
-- Indexes for table `Editor`
--
ALTER TABLE `Editor`
  ADD PRIMARY KEY (`handle`),
  ADD KEY `IDX_CB5DF48CCE45CBB0` (`pkgID`);

--
-- Indexes for table `ExpressAttributeKeys`
--
ALTER TABLE `ExpressAttributeKeys`
  ADD PRIMARY KEY (`akID`),
  ADD KEY `IDX_8C881F181257D5D` (`entity_id`);

--
-- Indexes for table `ExpressEntities`
--
ALTER TABLE `ExpressEntities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_BC772AA6918020D9` (`handle`),
  ADD UNIQUE KEY `UNIQ_BC772AA6547D6B2D` (`default_view_form_id`),
  ADD UNIQUE KEY `UNIQ_BC772AA6C7DEC56D` (`default_edit_form_id`),
  ADD KEY `IDX_BC772AA6CE45CBB0` (`pkgID`);

--
-- Indexes for table `ExpressEntityAssociationEntries`
--
ALTER TABLE `ExpressEntityAssociationEntries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9C2BB76C6DCB6296` (`exEntryID`),
  ADD KEY `IDX_9C2BB76CEFB9C8A5` (`association_id`);

--
-- Indexes for table `ExpressEntityAssociations`
--
ALTER TABLE `ExpressEntityAssociations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_98A0F796E9BBEE93` (`source_entity_id`),
  ADD KEY `IDX_98A0F796B5910F71` (`target_entity_id`);

--
-- Indexes for table `ExpressEntityEntries`
--
ALTER TABLE `ExpressEntityEntries`
  ADD PRIMARY KEY (`exEntryID`),
  ADD KEY `IDX_B8AE3531FD71026C` (`uID`),
  ADD KEY `IDX_B8AE3531AFC87D03` (`exEntryEntityID`),
  ADD KEY `resultsNodeID` (`resultsNodeID`),
  ADD KEY `createdSort` (`exEntryDateCreated`),
  ADD KEY `modifiedSort` (`exEntryDateModified`);

--
-- Indexes for table `ExpressEntityEntryAssociations`
--
ALTER TABLE `ExpressEntityEntryAssociations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_25B3A0826DCB6296` (`exEntryID`),
  ADD KEY `IDX_25B3A082EFB9C8A5` (`association_id`);

--
-- Indexes for table `ExpressEntityEntryAttributeValues`
--
ALTER TABLE `ExpressEntityEntryAttributeValues`
  ADD PRIMARY KEY (`exEntryID`,`akID`),
  ADD KEY `IDX_6DB641546DCB6296` (`exEntryID`),
  ADD KEY `IDX_6DB64154B6561A7E` (`akID`),
  ADD KEY `IDX_6DB64154A2A82A5D` (`avID`);

--
-- Indexes for table `ExpressForm170ExpressSearchIndexAttributes`
--
ALTER TABLE `ExpressForm170ExpressSearchIndexAttributes`
  ADD PRIMARY KEY (`exEntryID`);

--
-- Indexes for table `ExpressFormFieldSetAssociationControls`
--
ALTER TABLE `ExpressFormFieldSetAssociationControls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E6DF21BBEFB9C8A5` (`association_id`);

--
-- Indexes for table `ExpressFormFieldSetAttributeKeyControls`
--
ALTER TABLE `ExpressFormFieldSetAttributeKeyControls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8481F9D1B6561A7E` (`akID`);

--
-- Indexes for table `ExpressFormFieldSetAuthorControls`
--
ALTER TABLE `ExpressFormFieldSetAuthorControls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ExpressFormFieldSetControls`
--
ALTER TABLE `ExpressFormFieldSetControls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E42868A43ABF811A` (`field_set_id`);

--
-- Indexes for table `ExpressFormFieldSetPublicIdentifierControls`
--
ALTER TABLE `ExpressFormFieldSetPublicIdentifierControls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ExpressFormFieldSets`
--
ALTER TABLE `ExpressFormFieldSets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A33BBBEC5FF69B7D` (`form_id`);

--
-- Indexes for table `ExpressFormFieldSetTextControls`
--
ALTER TABLE `ExpressFormFieldSetTextControls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ExpressForms`
--
ALTER TABLE `ExpressForms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8D09031A81257D5D` (`entity_id`);

--
-- Indexes for table `FileAttributeKeys`
--
ALTER TABLE `FileAttributeKeys`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `FileAttributeValues`
--
ALTER TABLE `FileAttributeValues`
  ADD PRIMARY KEY (`fID`,`fvID`,`akID`),
  ADD KEY `IDX_BBECEAA4B6561A7E` (`akID`),
  ADD KEY `IDX_BBECEAA4A2A82A5D` (`avID`);

--
-- Indexes for table `FileExternalFileProviders`
--
ALTER TABLE `FileExternalFileProviders`
  ADD PRIMARY KEY (`efpID`);

--
-- Indexes for table `FileExternalFileProviderTypes`
--
ALTER TABLE `FileExternalFileProviderTypes`
  ADD PRIMARY KEY (`efpTypeID`);

--
-- Indexes for table `FileImageThumbnailPaths`
--
ALTER TABLE `FileImageThumbnailPaths`
  ADD PRIMARY KEY (`fileID`,`fileVersionID`,`thumbnailTypeHandle`,`storageLocationID`,`thumbnailFormat`),
  ADD KEY `thumbnailPathIsBuilt` (`isBuilt`);

--
-- Indexes for table `FileImageThumbnailTypeFileSets`
--
ALTER TABLE `FileImageThumbnailTypeFileSets`
  ADD PRIMARY KEY (`ftfsThumbnailType`,`ftfsFileSetID`),
  ADD KEY `IDX_BD75F88D480660E5` (`ftfsThumbnailType`);

--
-- Indexes for table `FileImageThumbnailTypes`
--
ALTER TABLE `FileImageThumbnailTypes`
  ADD PRIMARY KEY (`ftTypeID`);

--
-- Indexes for table `FilePermissionAssignments`
--
ALTER TABLE `FilePermissionAssignments`
  ADD PRIMARY KEY (`fID`,`pkID`,`paID`),
  ADD KEY `pkID` (`pkID`),
  ADD KEY `paID` (`paID`);

--
-- Indexes for table `FilePermissionFileTypeAccessList`
--
ALTER TABLE `FilePermissionFileTypeAccessList`
  ADD PRIMARY KEY (`paID`,`peID`),
  ADD KEY `peID` (`peID`);

--
-- Indexes for table `FilePermissionFileTypeAccessListCustom`
--
ALTER TABLE `FilePermissionFileTypeAccessListCustom`
  ADD PRIMARY KEY (`paID`,`peID`,`extension`),
  ADD KEY `peID` (`peID`);

--
-- Indexes for table `FilePermissionFileTypes`
--
ALTER TABLE `FilePermissionFileTypes`
  ADD PRIMARY KEY (`fsID`,`gID`,`uID`,`extension`),
  ADD KEY `gID` (`gID`),
  ADD KEY `uID` (`uID`);

--
-- Indexes for table `Files`
--
ALTER TABLE `Files`
  ADD PRIMARY KEY (`fID`),
  ADD UNIQUE KEY `UNIQ_C7F46F5D16FE17FE` (`fUUID`),
  ADD KEY `uID` (`uID`),
  ADD KEY `fslID` (`fslID`),
  ADD KEY `ocID` (`ocID`),
  ADD KEY `fOverrideSetPermissions` (`fOverrideSetPermissions`);

--
-- Indexes for table `FileSearchIndexAttributes`
--
ALTER TABLE `FileSearchIndexAttributes`
  ADD PRIMARY KEY (`fID`);

--
-- Indexes for table `FileSetFiles`
--
ALTER TABLE `FileSetFiles`
  ADD PRIMARY KEY (`fsfID`),
  ADD KEY `fID` (`fID`),
  ADD KEY `fsID` (`fsID`);

--
-- Indexes for table `FileSets`
--
ALTER TABLE `FileSets`
  ADD PRIMARY KEY (`fsID`),
  ADD KEY `uID` (`uID`,`fsType`,`fsName`),
  ADD KEY `fsName` (`fsName`),
  ADD KEY `fsType` (`fsType`);

--
-- Indexes for table `FileSetSavedSearches`
--
ALTER TABLE `FileSetSavedSearches`
  ADD PRIMARY KEY (`fsID`);

--
-- Indexes for table `FileStorageLocations`
--
ALTER TABLE `FileStorageLocations`
  ADD PRIMARY KEY (`fslID`);

--
-- Indexes for table `FileStorageLocationTypes`
--
ALTER TABLE `FileStorageLocationTypes`
  ADD PRIMARY KEY (`fslTypeID`);

--
-- Indexes for table `FileUsageRecord`
--
ALTER TABLE `FileUsageRecord`
  ADD PRIMARY KEY (`file_id`,`block_id`,`collection_id`,`collection_version_id`),
  ADD KEY `block` (`block_id`),
  ADD KEY `collection_version` (`collection_id`,`collection_version_id`);

--
-- Indexes for table `FileVersionLog`
--
ALTER TABLE `FileVersionLog`
  ADD PRIMARY KEY (`fvlID`),
  ADD KEY `fvID` (`fID`,`fvID`,`fvlID`);

--
-- Indexes for table `FileVersions`
--
ALTER TABLE `FileVersions`
  ADD PRIMARY KEY (`fID`,`fvID`),
  ADD KEY `IDX_D7B5A13AE3111F45` (`fID`),
  ADD KEY `fvFilename` (`fvFilename`),
  ADD KEY `fvExtension` (`fvExtension`),
  ADD KEY `fvType` (`fvType`);

--
-- Indexes for table `FormSubmissionNotifications`
--
ALTER TABLE `FormSubmissionNotifications`
  ADD PRIMARY KEY (`nID`),
  ADD KEY `IDX_E7B6BE406DCB6296` (`exEntryID`);

--
-- Indexes for table `Geolocators`
--
ALTER TABLE `Geolocators`
  ADD PRIMARY KEY (`glID`),
  ADD UNIQUE KEY `UNIQ_83BB1614D4F4D416` (`glHandle`),
  ADD KEY `IDX_83BB1614D5F6CC40` (`glPackage`);

--
-- Indexes for table `GroupCreateNotifications`
--
ALTER TABLE `GroupCreateNotifications`
  ADD PRIMARY KEY (`nID`),
  ADD KEY `IDX_C17D9982BF396750` (`id`);

--
-- Indexes for table `GroupCreates`
--
ALTER TABLE `GroupCreates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_CCD7EF48FD71026C` (`uID`);

--
-- Indexes for table `GroupJoinRequests`
--
ALTER TABLE `GroupJoinRequests`
  ADD PRIMARY KEY (`uID`,`gID`),
  ADD KEY `uID` (`uID`),
  ADD KEY `gID` (`gID`);

--
-- Indexes for table `GroupRoleChangeNotifications`
--
ALTER TABLE `GroupRoleChangeNotifications`
  ADD PRIMARY KEY (`nID`),
  ADD KEY `IDX_C1402C44BF396750` (`id`);

--
-- Indexes for table `GroupRoleChanges`
--
ALTER TABLE `GroupRoleChanges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_98ADE2F3FD71026C` (`uID`);

--
-- Indexes for table `GroupRoles`
--
ALTER TABLE `GroupRoles`
  ADD PRIMARY KEY (`grID`);

--
-- Indexes for table `Groups`
--
ALTER TABLE `Groups`
  ADD PRIMARY KEY (`gID`),
  ADD KEY `gName` (`gName`),
  ADD KEY `gBadgeFID` (`gBadgeFID`),
  ADD KEY `pkgID` (`pkgID`),
  ADD KEY `gPath` (`gPath`(255));

--
-- Indexes for table `GroupSelectedRoles`
--
ALTER TABLE `GroupSelectedRoles`
  ADD PRIMARY KEY (`gID`,`grID`);

--
-- Indexes for table `GroupSetGroups`
--
ALTER TABLE `GroupSetGroups`
  ADD PRIMARY KEY (`gID`,`gsID`),
  ADD KEY `gsID` (`gsID`);

--
-- Indexes for table `GroupSets`
--
ALTER TABLE `GroupSets`
  ADD PRIMARY KEY (`gsID`),
  ADD KEY `gsName` (`gsName`),
  ADD KEY `pkgID` (`pkgID`,`gsID`);

--
-- Indexes for table `GroupSignupNotifications`
--
ALTER TABLE `GroupSignupNotifications`
  ADD PRIMARY KEY (`nID`),
  ADD KEY `IDX_77F3EABF396750` (`id`);

--
-- Indexes for table `GroupSignupRequestAcceptNotifications`
--
ALTER TABLE `GroupSignupRequestAcceptNotifications`
  ADD PRIMARY KEY (`nID`),
  ADD KEY `IDX_72E6015ABF396750` (`id`);

--
-- Indexes for table `GroupSignupRequestAccepts`
--
ALTER TABLE `GroupSignupRequestAccepts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_18BBF9FCFD71026C` (`uID`),
  ADD KEY `IDX_18BBF9FCDB43B5DF` (`managerUID`);

--
-- Indexes for table `GroupSignupRequestDeclineNotifications`
--
ALTER TABLE `GroupSignupRequestDeclineNotifications`
  ADD PRIMARY KEY (`nID`),
  ADD KEY `IDX_930C0D02BF396750` (`id`);

--
-- Indexes for table `GroupSignupRequestDeclines`
--
ALTER TABLE `GroupSignupRequestDeclines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A905188EFD71026C` (`uID`),
  ADD KEY `IDX_A905188EDB43B5DF` (`managerUID`);

--
-- Indexes for table `GroupSignupRequestNotifications`
--
ALTER TABLE `GroupSignupRequestNotifications`
  ADD PRIMARY KEY (`nID`),
  ADD KEY `IDX_56EC93C8BF396750` (`id`);

--
-- Indexes for table `GroupSignupRequests`
--
ALTER TABLE `GroupSignupRequests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8CF06191FD71026C` (`uID`);

--
-- Indexes for table `GroupSignups`
--
ALTER TABLE `GroupSignups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D6CC4ECBFD71026C` (`uID`);

--
-- Indexes for table `GroupTypes`
--
ALTER TABLE `GroupTypes`
  ADD PRIMARY KEY (`gtID`);

--
-- Indexes for table `GroupTypeSelectedRoles`
--
ALTER TABLE `GroupTypeSelectedRoles`
  ADD PRIMARY KEY (`gtID`,`grID`);

--
-- Indexes for table `HealthReportResultFindings`
--
ALTER TABLE `HealthReportResultFindings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_14794DC7A7B643` (`result_id`);

--
-- Indexes for table `HealthReportResults`
--
ALTER TABLE `HealthReportResults`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F8C09F44E821EAFF` (`taskID`);

--
-- Indexes for table `HealthReportSearchResults`
--
ALTER TABLE `HealthReportSearchResults`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `IpAccessControlCategories`
--
ALTER TABLE `IpAccessControlCategories`
  ADD PRIMARY KEY (`iaccID`),
  ADD UNIQUE KEY `UNIQ_D4A1006246B4A747` (`iaccHandle`),
  ADD KEY `IDX_D4A10062C908ED51` (`iaccPackage`);

--
-- Indexes for table `IpAccessControlEvents`
--
ALTER TABLE `IpAccessControlEvents`
  ADD PRIMARY KEY (`iaceID`),
  ADD KEY `IDX_6C004072E9480668` (`iaceCategory`),
  ADD KEY `IDX_6C004072B0C0DFA7` (`iaceSite`);

--
-- Indexes for table `IpAccessControlRanges`
--
ALTER TABLE `IpAccessControlRanges`
  ADD PRIMARY KEY (`iacrID`),
  ADD KEY `IDX_2B1AA65D21E929D0` (`iacrCategory`),
  ADD KEY `IDX_2B1AA65D62009435` (`iacrSite`),
  ADD KEY `IPIntervalExpiration` (`iacrIpFrom`,`iacrIpTo`,`iacrExpiration`);

--
-- Indexes for table `Jobs`
--
ALTER TABLE `Jobs`
  ADD PRIMARY KEY (`jID`),
  ADD UNIQUE KEY `jHandle` (`jHandle`),
  ADD KEY `pkgID` (`pkgID`),
  ADD KEY `isScheduled` (`isScheduled`,`jDateLastRun`,`jID`),
  ADD KEY `jDateLastRun` (`jDateLastRun`,`jID`);

--
-- Indexes for table `JobSetJobs`
--
ALTER TABLE `JobSetJobs`
  ADD PRIMARY KEY (`jsID`,`jID`),
  ADD KEY `jID` (`jID`);

--
-- Indexes for table `JobSets`
--
ALTER TABLE `JobSets`
  ADD PRIMARY KEY (`jsID`),
  ADD KEY `pkgID` (`pkgID`),
  ADD KEY `jsName` (`jsName`);

--
-- Indexes for table `JobsLog`
--
ALTER TABLE `JobsLog`
  ADD PRIMARY KEY (`jlID`),
  ADD KEY `jID` (`jID`);

--
-- Indexes for table `LegacyAttributeKeys`
--
ALTER TABLE `LegacyAttributeKeys`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `Logs`
--
ALTER TABLE `Logs`
  ADD PRIMARY KEY (`logID`),
  ADD KEY `channel` (`channel`),
  ADD KEY `uID` (`uID`),
  ADD KEY `cID` (`cID`);

--
-- Indexes for table `MailImporters`
--
ALTER TABLE `MailImporters`
  ADD PRIMARY KEY (`miID`),
  ADD UNIQUE KEY `miHandle` (`miHandle`),
  ADD KEY `pkgID` (`pkgID`,`miID`);

--
-- Indexes for table `MailingListExpressSearchIndexAttributes`
--
ALTER TABLE `MailingListExpressSearchIndexAttributes`
  ADD PRIMARY KEY (`exEntryID`);

--
-- Indexes for table `MailValidationHashes`
--
ALTER TABLE `MailValidationHashes`
  ADD PRIMARY KEY (`mvhID`),
  ADD UNIQUE KEY `mHash` (`mHash`),
  ADD KEY `miID` (`miID`);

--
-- Indexes for table `MessengerBatches`
--
ALTER TABLE `MessengerBatches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `MessengerMessages`
--
ALTER TABLE `MessengerMessages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_41BD93AFFB7336F0` (`queue_name`),
  ADD KEY `IDX_41BD93AFE3BD61CE` (`available_at`),
  ADD KEY `IDX_41BD93AF16BA31DB` (`delivered_at`);

--
-- Indexes for table `MessengerProcesses`
--
ALTER TABLE `MessengerProcesses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_FBB7A9C9F39EBE7A` (`batch_id`),
  ADD KEY `IDX_FBB7A9C9FD71026C` (`uID`);

--
-- Indexes for table `MessengerScheduledTasks`
--
ALTER TABLE `MessengerScheduledTasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_DCEB3C0D8DB60186` (`task_id`),
  ADD KEY `IDX_DCEB3C0DFD71026C` (`uID`);

--
-- Indexes for table `MessengerTaskProcesses`
--
ALTER TABLE `MessengerTaskProcesses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BE77DC6F8DB60186` (`task_id`);

--
-- Indexes for table `MultilingualPageRelations`
--
ALTER TABLE `MultilingualPageRelations`
  ADD PRIMARY KEY (`mpRelationID`,`cID`);

--
-- Indexes for table `MultilingualTranslations`
--
ALTER TABLE `MultilingualTranslations`
  ADD PRIMARY KEY (`mtID`);

--
-- Indexes for table `NotificationAlerts`
--
ALTER TABLE `NotificationAlerts`
  ADD PRIMARY KEY (`naID`),
  ADD KEY `IDX_E11C7408FD71026C` (`uID`),
  ADD KEY `IDX_E11C7408ED024EFD` (`nID`);

--
-- Indexes for table `NotificationPermissionSubscriptionList`
--
ALTER TABLE `NotificationPermissionSubscriptionList`
  ADD PRIMARY KEY (`paID`,`peID`),
  ADD KEY `peID` (`peID`);

--
-- Indexes for table `NotificationPermissionSubscriptionListCustom`
--
ALTER TABLE `NotificationPermissionSubscriptionListCustom`
  ADD PRIMARY KEY (`paID`,`peID`,`nSubscriptionIdentifier`),
  ADD KEY `peID` (`peID`),
  ADD KEY `nSubscriptionIdentifier` (`nSubscriptionIdentifier`);

--
-- Indexes for table `Notifications`
--
ALTER TABLE `Notifications`
  ADD PRIMARY KEY (`nID`);

--
-- Indexes for table `OAuth2AccessToken`
--
ALTER TABLE `OAuth2AccessToken`
  ADD PRIMARY KEY (`identifier`),
  ADD KEY `IDX_60D69F3FC7440455` (`client`);

--
-- Indexes for table `OAuth2AuthCode`
--
ALTER TABLE `OAuth2AuthCode`
  ADD PRIMARY KEY (`identifier`),
  ADD KEY `IDX_29D07B5C7440455` (`client`);

--
-- Indexes for table `OAuth2Client`
--
ALTER TABLE `OAuth2Client`
  ADD PRIMARY KEY (`identifier`),
  ADD UNIQUE KEY `client_idx` (`clientKey`,`clientSecret`);

--
-- Indexes for table `OAuth2ClientScopes`
--
ALTER TABLE `OAuth2ClientScopes`
  ADD PRIMARY KEY (`clientIdentifier`,`scopeIdentifier`),
  ADD KEY `IDX_497E26F39ECFF1A8` (`clientIdentifier`),
  ADD KEY `IDX_497E26F3C7FD45E9` (`scopeIdentifier`);

--
-- Indexes for table `OAuth2RefreshToken`
--
ALTER TABLE `OAuth2RefreshToken`
  ADD PRIMARY KEY (`identifier`),
  ADD UNIQUE KEY `UNIQ_A205CB8350A9822` (`accessToken`);

--
-- Indexes for table `OAuth2Scope`
--
ALTER TABLE `OAuth2Scope`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `OAuthServerAccessTokens`
--
ALTER TABLE `OAuthServerAccessTokens`
  ADD PRIMARY KEY (`access_token`);

--
-- Indexes for table `OAuthServerAuthorizationCodes`
--
ALTER TABLE `OAuthServerAuthorizationCodes`
  ADD PRIMARY KEY (`access_token`);

--
-- Indexes for table `OAuthServerClients`
--
ALTER TABLE `OAuthServerClients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `OAuthServerRefreshTokens`
--
ALTER TABLE `OAuthServerRefreshTokens`
  ADD PRIMARY KEY (`refresh_token`);

--
-- Indexes for table `OAuthServerScopes`
--
ALTER TABLE `OAuthServerScopes`
  ADD PRIMARY KEY (`scope`);

--
-- Indexes for table `OauthUserMap`
--
ALTER TABLE `OauthUserMap`
  ADD PRIMARY KEY (`user_id`,`namespace`),
  ADD UNIQUE KEY `oauth_binding` (`binding`,`namespace`);

--
-- Indexes for table `Packages`
--
ALTER TABLE `Packages`
  ADD PRIMARY KEY (`pkgID`),
  ADD UNIQUE KEY `UNIQ_62C3A2F1F2D49DB1` (`pkgHandle`);

--
-- Indexes for table `PageContainerInstanceAreas`
--
ALTER TABLE `PageContainerInstanceAreas`
  ADD PRIMARY KEY (`containerInstanceAreaID`),
  ADD KEY `IDX_484B3E0A1FCD0045` (`containerInstanceID`);

--
-- Indexes for table `PageContainerInstances`
--
ALTER TABLE `PageContainerInstances`
  ADD PRIMARY KEY (`containerInstanceID`),
  ADD KEY `IDX_489D87A71159C151` (`containerID`);

--
-- Indexes for table `PageContainers`
--
ALTER TABLE `PageContainers`
  ADD PRIMARY KEY (`containerID`),
  ADD KEY `IDX_65E7C1D1CE45CBB0` (`pkgID`);

--
-- Indexes for table `PageFeeds`
--
ALTER TABLE `PageFeeds`
  ADD PRIMARY KEY (`pfID`);

--
-- Indexes for table `PagePaths`
--
ALTER TABLE `PagePaths`
  ADD PRIMARY KEY (`ppID`),
  ADD KEY `ppIsCanonical` (`ppIsCanonical`),
  ADD KEY `cID` (`cID`),
  ADD KEY `cPath` (`cPath`(255));

--
-- Indexes for table `PagePermissionAssignments`
--
ALTER TABLE `PagePermissionAssignments`
  ADD PRIMARY KEY (`cID`,`pkID`,`paID`),
  ADD KEY `paID` (`paID`,`pkID`),
  ADD KEY `pkID` (`pkID`);

--
-- Indexes for table `PagePermissionPageTypeAccessList`
--
ALTER TABLE `PagePermissionPageTypeAccessList`
  ADD PRIMARY KEY (`paID`,`peID`),
  ADD KEY `peID` (`peID`);

--
-- Indexes for table `PagePermissionPageTypeAccessListCustom`
--
ALTER TABLE `PagePermissionPageTypeAccessListCustom`
  ADD PRIMARY KEY (`paID`,`peID`,`ptID`),
  ADD KEY `peID` (`peID`),
  ADD KEY `ptID` (`ptID`);

--
-- Indexes for table `PagePermissionPropertyAccessList`
--
ALTER TABLE `PagePermissionPropertyAccessList`
  ADD PRIMARY KEY (`paID`,`peID`),
  ADD KEY `peID` (`peID`),
  ADD KEY `uID` (`uID`);

--
-- Indexes for table `PagePermissionPropertyAttributeAccessListCustom`
--
ALTER TABLE `PagePermissionPropertyAttributeAccessListCustom`
  ADD PRIMARY KEY (`paID`,`peID`,`akID`),
  ADD KEY `peID` (`peID`),
  ADD KEY `akID` (`akID`);

--
-- Indexes for table `PagePermissionThemeAccessList`
--
ALTER TABLE `PagePermissionThemeAccessList`
  ADD PRIMARY KEY (`paID`,`peID`),
  ADD KEY `peID` (`peID`);

--
-- Indexes for table `PagePermissionThemeAccessListCustom`
--
ALTER TABLE `PagePermissionThemeAccessListCustom`
  ADD PRIMARY KEY (`paID`,`peID`,`pThemeID`),
  ADD KEY `peID` (`peID`),
  ADD KEY `pThemeID` (`pThemeID`);

--
-- Indexes for table `Pages`
--
ALTER TABLE `Pages`
  ADD PRIMARY KEY (`cID`,`ptID`),
  ADD KEY `cParentID` (`cParentID`),
  ADD KEY `siteTreeID` (`siteTreeID`),
  ADD KEY `cIsActive` (`cID`,`cIsActive`),
  ADD KEY `cCheckedOutUID` (`cCheckedOutUID`),
  ADD KEY `uID` (`uID`,`cPointerID`),
  ADD KEY `cPointerID` (`cPointerID`,`cDisplayOrder`),
  ADD KEY `cIsTemplate` (`cID`,`cIsTemplate`),
  ADD KEY `cIsSystemPage` (`cID`,`cIsSystemPage`),
  ADD KEY `pkgID` (`pkgID`),
  ADD KEY `cParentMaxDisplay` (`cParentID`,`cDisplayOrder`),
  ADD KEY `idxPageList` (`cIsTemplate`,`cIsActive`,`siteTreeID`,`cIsSystemPage`,`cPointerID`);

--
-- Indexes for table `PageSearchIndex`
--
ALTER TABLE `PageSearchIndex`
  ADD PRIMARY KEY (`cID`),
  ADD KEY `cDateLastIndexed` (`cDateLastIndexed`),
  ADD KEY `cDateLastSitemapped` (`cDateLastSitemapped`),
  ADD KEY `cRequiresReindex` (`cRequiresReindex`);
ALTER TABLE `PageSearchIndex` ADD FULLTEXT KEY `cName` (`cName`);
ALTER TABLE `PageSearchIndex` ADD FULLTEXT KEY `cDescription` (`cDescription`);
ALTER TABLE `PageSearchIndex` ADD FULLTEXT KEY `content` (`content`);
ALTER TABLE `PageSearchIndex` ADD FULLTEXT KEY `content2` (`cName`,`cDescription`,`content`);

--
-- Indexes for table `PageSummaryTemplateCustomCollection`
--
ALTER TABLE `PageSummaryTemplateCustomCollection`
  ADD PRIMARY KEY (`cID`);

--
-- Indexes for table `PageSummaryTemplateCustomCollectionTemplates`
--
ALTER TABLE `PageSummaryTemplateCustomCollectionTemplates`
  ADD PRIMARY KEY (`cID`,`template_id`),
  ADD KEY `IDX_23B91C0FE5DADDAE` (`cID`),
  ADD KEY `IDX_23B91C0F5DA0FB8` (`template_id`);

--
-- Indexes for table `PageSummaryTemplates`
--
ALTER TABLE `PageSummaryTemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_55AC200B5DA0FB8` (`template_id`);

--
-- Indexes for table `PageTemplates`
--
ALTER TABLE `PageTemplates`
  ADD PRIMARY KEY (`pTemplateID`);

--
-- Indexes for table `PageThemeCustomSkins`
--
ALTER TABLE `PageThemeCustomSkins`
  ADD PRIMARY KEY (`skinID`),
  ADD KEY `IDX_162E9C4EFD71026C` (`uID`);

--
-- Indexes for table `PageThemeCustomStyles`
--
ALTER TABLE `PageThemeCustomStyles`
  ADD PRIMARY KEY (`pThemeID`),
  ADD KEY `scvlID` (`scvlID`),
  ADD KEY `sccRecordID` (`sccRecordID`);

--
-- Indexes for table `PageThemes`
--
ALTER TABLE `PageThemes`
  ADD PRIMARY KEY (`pThemeID`),
  ADD UNIQUE KEY `ptHandle` (`pThemeHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `PageTypeComposerControlTypes`
--
ALTER TABLE `PageTypeComposerControlTypes`
  ADD PRIMARY KEY (`ptComposerControlTypeID`),
  ADD UNIQUE KEY `ptComposerControlTypeHandle` (`ptComposerControlTypeHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `PageTypeComposerFormLayoutSetControls`
--
ALTER TABLE `PageTypeComposerFormLayoutSetControls`
  ADD PRIMARY KEY (`ptComposerFormLayoutSetControlID`),
  ADD KEY `ptComposerControlTypeID` (`ptComposerControlTypeID`);

--
-- Indexes for table `PageTypeComposerFormLayoutSets`
--
ALTER TABLE `PageTypeComposerFormLayoutSets`
  ADD PRIMARY KEY (`ptComposerFormLayoutSetID`),
  ADD KEY `ptID` (`ptID`);

--
-- Indexes for table `PageTypeComposerOutputBlocks`
--
ALTER TABLE `PageTypeComposerOutputBlocks`
  ADD PRIMARY KEY (`ptComposerOutputBlockID`),
  ADD KEY `cID` (`cID`),
  ADD KEY `bID` (`bID`,`cID`),
  ADD KEY `ptComposerFormLayoutSetControlID` (`ptComposerFormLayoutSetControlID`);

--
-- Indexes for table `PageTypeComposerOutputControls`
--
ALTER TABLE `PageTypeComposerOutputControls`
  ADD PRIMARY KEY (`ptComposerOutputControlID`),
  ADD KEY `pTemplateID` (`pTemplateID`,`ptComposerFormLayoutSetControlID`),
  ADD KEY `ptID` (`ptID`),
  ADD KEY `ptComposerFormLayoutSetControlID` (`ptComposerFormLayoutSetControlID`);

--
-- Indexes for table `PageTypePageTemplateDefaultPages`
--
ALTER TABLE `PageTypePageTemplateDefaultPages`
  ADD PRIMARY KEY (`pTemplateID`,`ptID`),
  ADD KEY `ptID` (`ptID`),
  ADD KEY `cID` (`cID`);

--
-- Indexes for table `PageTypePageTemplates`
--
ALTER TABLE `PageTypePageTemplates`
  ADD PRIMARY KEY (`ptID`,`pTemplateID`),
  ADD KEY `pTemplateID` (`pTemplateID`);

--
-- Indexes for table `PageTypePermissionAssignments`
--
ALTER TABLE `PageTypePermissionAssignments`
  ADD PRIMARY KEY (`ptID`,`pkID`,`paID`),
  ADD KEY `pkID` (`pkID`),
  ADD KEY `ptID` (`ptID`);

--
-- Indexes for table `PageTypePublishTargetTypes`
--
ALTER TABLE `PageTypePublishTargetTypes`
  ADD PRIMARY KEY (`ptPublishTargetTypeID`),
  ADD KEY `ptPublishTargetTypeHandle` (`ptPublishTargetTypeHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `PageTypes`
--
ALTER TABLE `PageTypes`
  ADD PRIMARY KEY (`ptID`),
  ADD UNIQUE KEY `ptHandle` (`ptHandle`),
  ADD KEY `siteTypeID` (`siteTypeID`),
  ADD KEY `pkgID` (`pkgID`,`ptID`);

--
-- Indexes for table `PageWorkflowProgress`
--
ALTER TABLE `PageWorkflowProgress`
  ADD PRIMARY KEY (`cID`,`wpID`),
  ADD KEY `wpID` (`wpID`);

--
-- Indexes for table `PermissionAccess`
--
ALTER TABLE `PermissionAccess`
  ADD PRIMARY KEY (`paID`);

--
-- Indexes for table `PermissionAccessEntities`
--
ALTER TABLE `PermissionAccessEntities`
  ADD PRIMARY KEY (`peID`),
  ADD KEY `petID` (`petID`);

--
-- Indexes for table `PermissionAccessEntityGroups`
--
ALTER TABLE `PermissionAccessEntityGroups`
  ADD PRIMARY KEY (`pegID`),
  ADD KEY `peID` (`peID`),
  ADD KEY `gID` (`gID`);

--
-- Indexes for table `PermissionAccessEntityGroupSets`
--
ALTER TABLE `PermissionAccessEntityGroupSets`
  ADD PRIMARY KEY (`peID`,`gsID`),
  ADD KEY `gsID` (`gsID`);

--
-- Indexes for table `PermissionAccessEntitySiteGroups`
--
ALTER TABLE `PermissionAccessEntitySiteGroups`
  ADD PRIMARY KEY (`pegID`),
  ADD KEY `peID` (`peID`),
  ADD KEY `siteGID` (`siteGID`);

--
-- Indexes for table `PermissionAccessEntityTypeCategories`
--
ALTER TABLE `PermissionAccessEntityTypeCategories`
  ADD PRIMARY KEY (`petID`,`pkCategoryID`),
  ADD KEY `pkCategoryID` (`pkCategoryID`);

--
-- Indexes for table `PermissionAccessEntityTypes`
--
ALTER TABLE `PermissionAccessEntityTypes`
  ADD PRIMARY KEY (`petID`),
  ADD UNIQUE KEY `petHandle` (`petHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `PermissionAccessEntityUsers`
--
ALTER TABLE `PermissionAccessEntityUsers`
  ADD PRIMARY KEY (`peID`,`uID`),
  ADD KEY `uID` (`uID`);

--
-- Indexes for table `PermissionAccessList`
--
ALTER TABLE `PermissionAccessList`
  ADD PRIMARY KEY (`paID`,`peID`),
  ADD KEY `accessType` (`accessType`),
  ADD KEY `peID` (`peID`),
  ADD KEY `peID_accessType` (`peID`,`accessType`),
  ADD KEY `pdID` (`pdID`),
  ADD KEY `permissionAccessDuration` (`paID`,`pdID`);

--
-- Indexes for table `PermissionAccessWorkflows`
--
ALTER TABLE `PermissionAccessWorkflows`
  ADD PRIMARY KEY (`paID`,`wfID`),
  ADD KEY `wfID` (`wfID`);

--
-- Indexes for table `PermissionAssignments`
--
ALTER TABLE `PermissionAssignments`
  ADD PRIMARY KEY (`paID`,`pkID`),
  ADD KEY `pkID` (`pkID`);

--
-- Indexes for table `PermissionDurationObjects`
--
ALTER TABLE `PermissionDurationObjects`
  ADD PRIMARY KEY (`pdID`);

--
-- Indexes for table `PermissionKeyCategories`
--
ALTER TABLE `PermissionKeyCategories`
  ADD PRIMARY KEY (`pkCategoryID`),
  ADD UNIQUE KEY `pkCategoryHandle` (`pkCategoryHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `PermissionKeys`
--
ALTER TABLE `PermissionKeys`
  ADD PRIMARY KEY (`pkID`),
  ADD UNIQUE KEY `akHandle` (`pkHandle`),
  ADD KEY `pkCategoryID` (`pkCategoryID`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `PileContents`
--
ALTER TABLE `PileContents`
  ADD PRIMARY KEY (`pcID`),
  ADD KEY `pID` (`pID`,`displayOrder`),
  ADD KEY `itemID` (`itemID`),
  ADD KEY `itemType` (`itemType`,`itemID`,`pID`);

--
-- Indexes for table `Piles`
--
ALTER TABLE `Piles`
  ADD PRIMARY KEY (`pID`),
  ADD KEY `uID` (`uID`,`name`);

--
-- Indexes for table `PrivateMessageNotifications`
--
ALTER TABLE `PrivateMessageNotifications`
  ADD PRIMARY KEY (`nID`);

--
-- Indexes for table `QueuePageDuplicationRelations`
--
ALTER TABLE `QueuePageDuplicationRelations`
  ADD PRIMARY KEY (`cID`,`originalCID`),
  ADD KEY `originalCID` (`originalCID`,`queue_name`);

--
-- Indexes for table `SavedExpressSearchQueries`
--
ALTER TABLE `SavedExpressSearchQueries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F87C25F2CE2D7284` (`exEntityID`);

--
-- Indexes for table `SavedFileSearchQueries`
--
ALTER TABLE `SavedFileSearchQueries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `SavedGroupSearchQueries`
--
ALTER TABLE `SavedGroupSearchQueries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `SavedLogSearchQueries`
--
ALTER TABLE `SavedLogSearchQueries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `SavedPageSearchQueries`
--
ALTER TABLE `SavedPageSearchQueries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `SavedUserSearchQueries`
--
ALTER TABLE `SavedUserSearchQueries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Sessions`
--
ALTER TABLE `Sessions`
  ADD PRIMARY KEY (`sessionID`);

--
-- Indexes for table `SiblingPageRelations`
--
ALTER TABLE `SiblingPageRelations`
  ADD PRIMARY KEY (`mpRelationID`,`cID`);

--
-- Indexes for table `SiteAttributeKeys`
--
ALTER TABLE `SiteAttributeKeys`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `SiteAttributeValues`
--
ALTER TABLE `SiteAttributeValues`
  ADD PRIMARY KEY (`siteID`,`akID`),
  ADD KEY `IDX_67658AF7521D8435` (`siteID`),
  ADD KEY `IDX_67658AF7B6561A7E` (`akID`),
  ADD KEY `IDX_67658AF7A2A82A5D` (`avID`);

--
-- Indexes for table `SiteDomains`
--
ALTER TABLE `SiteDomains`
  ADD PRIMARY KEY (`domainID`),
  ADD KEY `IDX_4CC7400A521D8435` (`siteID`);

--
-- Indexes for table `SiteGroupRelations`
--
ALTER TABLE `SiteGroupRelations`
  ADD PRIMARY KEY (`groupRelationID`),
  ADD KEY `IDX_DCBCDCA94A62E0E4` (`siteGID`),
  ADD KEY `IDX_DCBCDCA9521D8435` (`siteID`);

--
-- Indexes for table `SiteGroups`
--
ALTER TABLE `SiteGroups`
  ADD PRIMARY KEY (`siteGID`),
  ADD KEY `IDX_F6FE030FE9548DF7` (`siteTypeID`);

--
-- Indexes for table `SiteLocales`
--
ALTER TABLE `SiteLocales`
  ADD PRIMARY KEY (`siteLocaleID`),
  ADD UNIQUE KEY `UNIQ_2527AB2CF9431B4B` (`siteTreeID`),
  ADD KEY `IDX_2527AB2C521D8435` (`siteID`);

--
-- Indexes for table `Sites`
--
ALTER TABLE `Sites`
  ADD PRIMARY KEY (`siteID`),
  ADD UNIQUE KEY `UNIQ_7DC18567D84E1976` (`siteHandle`),
  ADD KEY `IDX_7DC18567E9548DF7` (`siteTypeID`);

--
-- Indexes for table `SiteSearchIndexAttributes`
--
ALTER TABLE `SiteSearchIndexAttributes`
  ADD PRIMARY KEY (`siteID`);

--
-- Indexes for table `SiteSkeletonLocales`
--
ALTER TABLE `SiteSkeletonLocales`
  ADD PRIMARY KEY (`skeletonLocaleID`),
  ADD UNIQUE KEY `UNIQ_212DD202F9431B4B` (`siteTreeID`),
  ADD KEY `IDX_212DD202B579BD3E` (`siteSkeletonID`);

--
-- Indexes for table `SiteSkeletons`
--
ALTER TABLE `SiteSkeletons`
  ADD PRIMARY KEY (`siteSkeletonID`),
  ADD UNIQUE KEY `UNIQ_D36AED98E9548DF7` (`siteTypeID`);

--
-- Indexes for table `SiteSkeletonTrees`
--
ALTER TABLE `SiteSkeletonTrees`
  ADD PRIMARY KEY (`siteTreeID`),
  ADD UNIQUE KEY `UNIQ_550F784B16B7EAF2` (`skeletonLocaleID`),
  ADD UNIQUE KEY `UNIQ_550F784BE9548DF7` (`siteTypeID`);

--
-- Indexes for table `SiteTrees`
--
ALTER TABLE `SiteTrees`
  ADD PRIMARY KEY (`siteTreeID`);

--
-- Indexes for table `SiteTreeTrees`
--
ALTER TABLE `SiteTreeTrees`
  ADD PRIMARY KEY (`siteTreeID`),
  ADD UNIQUE KEY `UNIQ_A4B9696EACD624CD` (`siteLocaleID`);

--
-- Indexes for table `SiteTypeAttributeKeys`
--
ALTER TABLE `SiteTypeAttributeKeys`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `SiteTypeAttributeValues`
--
ALTER TABLE `SiteTypeAttributeValues`
  ADD PRIMARY KEY (`akID`),
  ADD KEY `IDX_78059CB9B579BD3E` (`siteSkeletonID`),
  ADD KEY `IDX_78059CB9A2A82A5D` (`avID`);

--
-- Indexes for table `SiteTypes`
--
ALTER TABLE `SiteTypes`
  ADD PRIMARY KEY (`siteTypeID`),
  ADD UNIQUE KEY `UNIQ_7CBFE97576D39A3C` (`siteTypeHandle`),
  ADD UNIQUE KEY `UNIQ_7CBFE975C7F74FC3` (`siteTypeName`),
  ADD KEY `IDX_7CBFE975CE45CBB0` (`pkgID`);

--
-- Indexes for table `SocialLinks`
--
ALTER TABLE `SocialLinks`
  ADD PRIMARY KEY (`slID`),
  ADD KEY `IDX_84EBA2B4521D8435` (`siteID`);

--
-- Indexes for table `Stacks`
--
ALTER TABLE `Stacks`
  ADD PRIMARY KEY (`stID`),
  ADD KEY `stType` (`stType`),
  ADD KEY `stName` (`stName`),
  ADD KEY `cID` (`cID`);

--
-- Indexes for table `StackUsageRecord`
--
ALTER TABLE `StackUsageRecord`
  ADD PRIMARY KEY (`stack_id`,`block_id`,`collection_id`,`collection_version_id`),
  ADD KEY `block` (`block_id`),
  ADD KEY `collection_version` (`collection_id`,`collection_version_id`);

--
-- Indexes for table `StyleCustomizerCustomCssRecords`
--
ALTER TABLE `StyleCustomizerCustomCssRecords`
  ADD PRIMARY KEY (`sccRecordID`);

--
-- Indexes for table `StyleCustomizerInlineStylePresets`
--
ALTER TABLE `StyleCustomizerInlineStylePresets`
  ADD PRIMARY KEY (`pssPresetID`),
  ADD KEY `issID` (`issID`);

--
-- Indexes for table `StyleCustomizerInlineStyleSets`
--
ALTER TABLE `StyleCustomizerInlineStyleSets`
  ADD PRIMARY KEY (`issID`);

--
-- Indexes for table `StyleCustomizerValueLists`
--
ALTER TABLE `StyleCustomizerValueLists`
  ADD PRIMARY KEY (`scvlID`);

--
-- Indexes for table `StyleCustomizerValues`
--
ALTER TABLE `StyleCustomizerValues`
  ADD PRIMARY KEY (`scvID`),
  ADD KEY `scvlID` (`scvlID`);

--
-- Indexes for table `SummaryCategories`
--
ALTER TABLE `SummaryCategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F815AD2ACE45CBB0` (`pkgID`);

--
-- Indexes for table `SummaryFields`
--
ALTER TABLE `SummaryFields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_AC926EC9CE45CBB0` (`pkgID`);

--
-- Indexes for table `SummaryTemplateCategories`
--
ALTER TABLE `SummaryTemplateCategories`
  ADD PRIMARY KEY (`template_id`,`category_id`),
  ADD KEY `IDX_C8B6E64A5DA0FB8` (`template_id`),
  ADD KEY `IDX_C8B6E64A12469DE2` (`category_id`);

--
-- Indexes for table `SummaryTemplateFields`
--
ALTER TABLE `SummaryTemplateFields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_294381EC5DA0FB8` (`template_id`),
  ADD KEY `IDX_294381EC443707B0` (`field_id`);

--
-- Indexes for table `SummaryTemplates`
--
ALTER TABLE `SummaryTemplates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5E3C9832CE45CBB0` (`pkgID`);

--
-- Indexes for table `SummaryTemplateTags`
--
ALTER TABLE `SummaryTemplateTags`
  ADD PRIMARY KEY (`template_id`,`designtag_id`),
  ADD KEY `IDX_D9197F515DA0FB8` (`template_id`),
  ADD KEY `IDX_D9197F51960BFEAE` (`designtag_id`);

--
-- Indexes for table `SystemAntispamLibraries`
--
ALTER TABLE `SystemAntispamLibraries`
  ADD PRIMARY KEY (`saslHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `SystemCaptchaLibraries`
--
ALTER TABLE `SystemCaptchaLibraries`
  ADD PRIMARY KEY (`sclHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `SystemContentEditorSnippets`
--
ALTER TABLE `SystemContentEditorSnippets`
  ADD PRIMARY KEY (`scsHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `SystemDatabaseMigrations`
--
ALTER TABLE `SystemDatabaseMigrations`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `SystemDatabaseQueryLog`
--
ALTER TABLE `SystemDatabaseQueryLog`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Tasks`
--
ALTER TABLE `Tasks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_91994A93918020D9` (`handle`),
  ADD KEY `IDX_91994A93FD71026C` (`uID`),
  ADD KEY `IDX_91994A93CE45CBB0` (`pkgID`);

--
-- Indexes for table `TaskSets`
--
ALTER TABLE `TaskSets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `handle` (`handle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `TaskSetTasks`
--
ALTER TABLE `TaskSetTasks`
  ADD PRIMARY KEY (`task_id`,`set_id`),
  ADD KEY `IDX_D395AA388DB60186` (`task_id`),
  ADD KEY `IDX_D395AA3810FB0D18` (`set_id`);

--
-- Indexes for table `TopicTrees`
--
ALTER TABLE `TopicTrees`
  ADD PRIMARY KEY (`treeID`);

--
-- Indexes for table `TreeExpressEntrySiteResultNodes`
--
ALTER TABLE `TreeExpressEntrySiteResultNodes`
  ADD PRIMARY KEY (`treeNodeID`),
  ADD KEY `siteID` (`siteID`);

--
-- Indexes for table `TreeFileFolderNodes`
--
ALTER TABLE `TreeFileFolderNodes`
  ADD PRIMARY KEY (`treeNodeID`),
  ADD KEY `fslID` (`fslID`);

--
-- Indexes for table `TreeFileNodes`
--
ALTER TABLE `TreeFileNodes`
  ADD PRIMARY KEY (`treeNodeID`),
  ADD KEY `fID` (`fID`);

--
-- Indexes for table `TreeGroupFolderNodes`
--
ALTER TABLE `TreeGroupFolderNodes`
  ADD PRIMARY KEY (`treeNodeID`);

--
-- Indexes for table `TreeGroupFolderNodeSelectedGroupTypes`
--
ALTER TABLE `TreeGroupFolderNodeSelectedGroupTypes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `TreeGroupNodes`
--
ALTER TABLE `TreeGroupNodes`
  ADD PRIMARY KEY (`treeNodeID`),
  ADD KEY `gID` (`gID`);

--
-- Indexes for table `TreeNodePermissionAssignments`
--
ALTER TABLE `TreeNodePermissionAssignments`
  ADD PRIMARY KEY (`treeNodeID`,`pkID`,`paID`),
  ADD KEY `pkID` (`pkID`),
  ADD KEY `paID` (`paID`);

--
-- Indexes for table `TreeNodes`
--
ALTER TABLE `TreeNodes`
  ADD PRIMARY KEY (`treeNodeID`),
  ADD KEY `treeNodeParentID` (`treeNodeParentID`),
  ADD KEY `treeNodeTypeID` (`treeNodeTypeID`),
  ADD KEY `treeID` (`treeID`),
  ADD KEY `inheritPermissionsFromTreeNodeID` (`inheritPermissionsFromTreeNodeID`,`treeNodeID`);

--
-- Indexes for table `TreeNodeTypes`
--
ALTER TABLE `TreeNodeTypes`
  ADD PRIMARY KEY (`treeNodeTypeID`),
  ADD UNIQUE KEY `treeNodeTypeHandle` (`treeNodeTypeHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `Trees`
--
ALTER TABLE `Trees`
  ADD PRIMARY KEY (`treeID`),
  ADD KEY `treeTypeID` (`treeTypeID`);

--
-- Indexes for table `TreeSearchQueryNodes`
--
ALTER TABLE `TreeSearchQueryNodes`
  ADD PRIMARY KEY (`treeNodeID`),
  ADD KEY `savedSearchID` (`savedSearchID`);

--
-- Indexes for table `TreeTypes`
--
ALTER TABLE `TreeTypes`
  ADD PRIMARY KEY (`treeTypeID`),
  ADD UNIQUE KEY `treeTypeHandle` (`treeTypeHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `UsedStringLog`
--
ALTER TABLE `UsedStringLog`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4E83837CF5E609AF` (`usedString`);

--
-- Indexes for table `UserAttributeKeys`
--
ALTER TABLE `UserAttributeKeys`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `UserAttributeValues`
--
ALTER TABLE `UserAttributeValues`
  ADD PRIMARY KEY (`uID`,`akID`),
  ADD KEY `IDX_4DB68CA6FD71026C` (`uID`),
  ADD KEY `IDX_4DB68CA6B6561A7E` (`akID`),
  ADD KEY `IDX_4DB68CA6A2A82A5D` (`avID`);

--
-- Indexes for table `UserDeactivatedNotifications`
--
ALTER TABLE `UserDeactivatedNotifications`
  ADD PRIMARY KEY (`nID`);

--
-- Indexes for table `UserFavoriteFolders`
--
ALTER TABLE `UserFavoriteFolders`
  ADD PRIMARY KEY (`uID`,`treeNodeFolderId`),
  ADD KEY `IDX_EDB1ABB6FD71026C` (`uID`);

--
-- Indexes for table `UserGroups`
--
ALTER TABLE `UserGroups`
  ADD PRIMARY KEY (`uID`,`gID`,`grID`),
  ADD KEY `uID` (`uID`),
  ADD KEY `gID` (`gID`);

--
-- Indexes for table `UserLoginAttempts`
--
ALTER TABLE `UserLoginAttempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `UserPermissionEditPropertyAccessList`
--
ALTER TABLE `UserPermissionEditPropertyAccessList`
  ADD PRIMARY KEY (`paID`,`peID`);

--
-- Indexes for table `UserPermissionEditPropertyAttributeAccessListCustom`
--
ALTER TABLE `UserPermissionEditPropertyAttributeAccessListCustom`
  ADD PRIMARY KEY (`paID`,`peID`,`akID`),
  ADD KEY `peID` (`peID`),
  ADD KEY `akID` (`akID`);

--
-- Indexes for table `UserPermissionViewAttributeAccessList`
--
ALTER TABLE `UserPermissionViewAttributeAccessList`
  ADD PRIMARY KEY (`paID`,`peID`),
  ADD KEY `peID` (`peID`);

--
-- Indexes for table `UserPermissionViewAttributeAccessListCustom`
--
ALTER TABLE `UserPermissionViewAttributeAccessListCustom`
  ADD PRIMARY KEY (`paID`,`peID`,`akID`),
  ADD KEY `peID` (`peID`),
  ADD KEY `akID` (`akID`);

--
-- Indexes for table `UserPrivateMessages`
--
ALTER TABLE `UserPrivateMessages`
  ADD PRIMARY KEY (`msgID`),
  ADD KEY `uAuthorID` (`uAuthorID`,`msgDateCreated`);

--
-- Indexes for table `UserPrivateMessagesAttachments`
--
ALTER TABLE `UserPrivateMessagesAttachments`
  ADD PRIMARY KEY (`msgID`,`fID`);

--
-- Indexes for table `UserPrivateMessagesTo`
--
ALTER TABLE `UserPrivateMessagesTo`
  ADD PRIMARY KEY (`msgID`,`uID`,`uAuthorID`,`msgMailboxID`),
  ADD KEY `uID` (`uID`),
  ADD KEY `uAuthorID` (`uAuthorID`),
  ADD KEY `msgFolderID` (`msgMailboxID`),
  ADD KEY `msgIsNew` (`msgIsNew`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`uID`),
  ADD UNIQUE KEY `UNIQ_D5428AED28459686` (`uName`),
  ADD KEY `uEmail` (`uEmail`);

--
-- Indexes for table `UserSearchIndexAttributes`
--
ALTER TABLE `UserSearchIndexAttributes`
  ADD PRIMARY KEY (`uID`);

--
-- Indexes for table `UserSignupNotifications`
--
ALTER TABLE `UserSignupNotifications`
  ADD PRIMARY KEY (`nID`),
  ADD KEY `IDX_7FB1DF5B7B18287E` (`usID`);

--
-- Indexes for table `UserSignups`
--
ALTER TABLE `UserSignups`
  ADD PRIMARY KEY (`usID`),
  ADD UNIQUE KEY `UNIQ_FEB5D909FD71026C` (`uID`),
  ADD KEY `IDX_FEB5D909D3564642` (`createdBy`);

--
-- Indexes for table `UserValidationHashes`
--
ALTER TABLE `UserValidationHashes`
  ADD PRIMARY KEY (`uvhID`),
  ADD KEY `uID` (`uID`,`type`),
  ADD KEY `uHash` (`uHash`,`type`),
  ADD KEY `uDateGenerated` (`uDateGenerated`,`type`);

--
-- Indexes for table `UserWorkflowProgress`
--
ALTER TABLE `UserWorkflowProgress`
  ADD PRIMARY KEY (`uID`,`wpID`);

--
-- Indexes for table `WorkflowProgress`
--
ALTER TABLE `WorkflowProgress`
  ADD PRIMARY KEY (`wpID`),
  ADD KEY `wpCategoryID` (`wpCategoryID`),
  ADD KEY `wfID` (`wfID`),
  ADD KEY `wrID` (`wrID`,`wpID`,`wpIsCompleted`);

--
-- Indexes for table `WorkflowProgressCategories`
--
ALTER TABLE `WorkflowProgressCategories`
  ADD PRIMARY KEY (`wpCategoryID`),
  ADD UNIQUE KEY `wpCategoryHandle` (`wpCategoryHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `WorkflowProgressHistory`
--
ALTER TABLE `WorkflowProgressHistory`
  ADD PRIMARY KEY (`wphID`),
  ADD KEY `wpID` (`wpID`,`timestamp`);

--
-- Indexes for table `WorkflowProgressNotifications`
--
ALTER TABLE `WorkflowProgressNotifications`
  ADD PRIMARY KEY (`nID`);

--
-- Indexes for table `WorkflowRequestObjects`
--
ALTER TABLE `WorkflowRequestObjects`
  ADD PRIMARY KEY (`wrID`);

--
-- Indexes for table `Workflows`
--
ALTER TABLE `Workflows`
  ADD PRIMARY KEY (`wfID`),
  ADD UNIQUE KEY `wfName` (`wfName`),
  ADD KEY `wftID` (`wftID`,`wfID`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `WorkflowTypes`
--
ALTER TABLE `WorkflowTypes`
  ADD PRIMARY KEY (`wftID`),
  ADD UNIQUE KEY `wftHandle` (`wftHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Announcements`
--
ALTER TABLE `Announcements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `AreaLayoutColumns`
--
ALTER TABLE `AreaLayoutColumns`
  MODIFY `arLayoutColumnID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `AreaLayoutCustomColumns`
--
ALTER TABLE `AreaLayoutCustomColumns`
  MODIFY `arLayoutColumnID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `AreaLayoutPresets`
--
ALTER TABLE `AreaLayoutPresets`
  MODIFY `arLayoutPresetID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `AreaLayouts`
--
ALTER TABLE `AreaLayouts`
  MODIFY `arLayoutID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `AreaLayoutThemeGridColumns`
--
ALTER TABLE `AreaLayoutThemeGridColumns`
  MODIFY `arLayoutColumnID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `Areas`
--
ALTER TABLE `Areas`
  MODIFY `arID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `atSelectedSocialLinks`
--
ALTER TABLE `atSelectedSocialLinks`
  MODIFY `avsID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `atSelectedTopics`
--
ALTER TABLE `atSelectedTopics`
  MODIFY `avTreeTopicNodeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `atSelectOptionLists`
--
ALTER TABLE `atSelectOptionLists`
  MODIFY `avSelectOptionListID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `atSelectOptions`
--
ALTER TABLE `atSelectOptions`
  MODIFY `avSelectOptionID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `AttributeKeyCategories`
--
ALTER TABLE `AttributeKeyCategories`
  MODIFY `akCategoryID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `AttributeKeys`
--
ALTER TABLE `AttributeKeys`
  MODIFY `akID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `AttributeSets`
--
ALTER TABLE `AttributeSets`
  MODIFY `asID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `AttributeTypes`
--
ALTER TABLE `AttributeTypes`
  MODIFY `atID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `AttributeValues`
--
ALTER TABLE `AttributeValues`
  MODIFY `avID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=300;

--
-- AUTO_INCREMENT for table `AuthenticationTypes`
--
ALTER TABLE `AuthenticationTypes`
  MODIFY `authTypeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `authTypeConcreteCookieMap`
--
ALTER TABLE `authTypeConcreteCookieMap`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `BannedWords`
--
ALTER TABLE `BannedWords`
  MODIFY `bwID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Blocks`
--
ALTER TABLE `Blocks`
  MODIFY `bID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `BlockTypes`
--
ALTER TABLE `BlockTypes`
  MODIFY `btID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `BlockTypeSets`
--
ALTER TABLE `BlockTypeSets`
  MODIFY `btsID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `BoardConfiguredDataSourceConfiguration`
--
ALTER TABLE `BoardConfiguredDataSourceConfiguration`
  MODIFY `configurationID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `BoardConfiguredDataSources`
--
ALTER TABLE `BoardConfiguredDataSources`
  MODIFY `configuredDataSourceID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `BoardDataSources`
--
ALTER TABLE `BoardDataSources`
  MODIFY `dataSourceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `BoardDesignerCustomElementItems`
--
ALTER TABLE `BoardDesignerCustomElementItems`
  MODIFY `itemId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `BoardDesignerCustomElements`
--
ALTER TABLE `BoardDesignerCustomElements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `BoardInstanceItemBatches`
--
ALTER TABLE `BoardInstanceItemBatches`
  MODIFY `boardInstanceItemBatchID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `BoardInstanceItems`
--
ALTER TABLE `BoardInstanceItems`
  MODIFY `boardInstanceItemID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `BoardInstances`
--
ALTER TABLE `BoardInstances`
  MODIFY `boardInstanceID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `BoardInstanceSlotRules`
--
ALTER TABLE `BoardInstanceSlotRules`
  MODIFY `boardInstanceSlotRuleID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `BoardInstanceSlots`
--
ALTER TABLE `BoardInstanceSlots`
  MODIFY `boardInstanceSlotID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `BoardItemCategories`
--
ALTER TABLE `BoardItemCategories`
  MODIFY `boardItemCategoryID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `BoardItems`
--
ALTER TABLE `BoardItems`
  MODIFY `boardItemID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `BoardItemTags`
--
ALTER TABLE `BoardItemTags`
  MODIFY `boardItemTagID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Boards`
--
ALTER TABLE `Boards`
  MODIFY `boardID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `BoardSlotTemplates`
--
ALTER TABLE `BoardSlotTemplates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `BoardTemplates`
--
ALTER TABLE `BoardTemplates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `btAccordionEntries`
--
ALTER TABLE `btAccordionEntries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `btContentImageBreakpoints`
--
ALTER TABLE `btContentImageBreakpoints`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `btFaqEntries`
--
ALTER TABLE `btFaqEntries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `btFormAnswers`
--
ALTER TABLE `btFormAnswers`
  MODIFY `aID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `btFormAnswerSet`
--
ALTER TABLE `btFormAnswerSet`
  MODIFY `asID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `btFormQuestions`
--
ALTER TABLE `btFormQuestions`
  MODIFY `qID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `btGalleryEntries`
--
ALTER TABLE `btGalleryEntries`
  MODIFY `eID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `btGalleryEntryDisplayChoices`
--
ALTER TABLE `btGalleryEntryDisplayChoices`
  MODIFY `dcID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `btImageSliderEntries`
--
ALTER TABLE `btImageSliderEntries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `btShareThisPage`
--
ALTER TABLE `btShareThisPage`
  MODIFY `btShareThisPageID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `btSocialLinks`
--
ALTER TABLE `btSocialLinks`
  MODIFY `btSocialLinkID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `btSurveyOptions`
--
ALTER TABLE `btSurveyOptions`
  MODIFY `optionID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `btSurveyResults`
--
ALTER TABLE `btSurveyResults`
  MODIFY `resultID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CalendarEventOccurrences`
--
ALTER TABLE `CalendarEventOccurrences`
  MODIFY `occurrenceID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CalendarEventRepetitions`
--
ALTER TABLE `CalendarEventRepetitions`
  MODIFY `repetitionID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CalendarEvents`
--
ALTER TABLE `CalendarEvents`
  MODIFY `eventID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CalendarEventSummaryTemplates`
--
ALTER TABLE `CalendarEventSummaryTemplates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CalendarEventVersionOccurrences`
--
ALTER TABLE `CalendarEventVersionOccurrences`
  MODIFY `versionOccurrenceID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CalendarEventVersionRepetitions`
--
ALTER TABLE `CalendarEventVersionRepetitions`
  MODIFY `versionRepetitionID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CalendarEventVersions`
--
ALTER TABLE `CalendarEventVersions`
  MODIFY `eventVersionID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CalendarRelatedEvents`
--
ALTER TABLE `CalendarRelatedEvents`
  MODIFY `relatedEventID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Calendars`
--
ALTER TABLE `Calendars`
  MODIFY `caID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Collections`
--
ALTER TABLE `Collections`
  MODIFY `cID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;

--
-- AUTO_INCREMENT for table `ConversationEditors`
--
ALTER TABLE `ConversationEditors`
  MODIFY `cnvEditorID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ConversationFlaggedMessageTypes`
--
ALTER TABLE `ConversationFlaggedMessageTypes`
  MODIFY `cnvMessageFlagTypeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ConversationMessageAttachments`
--
ALTER TABLE `ConversationMessageAttachments`
  MODIFY `cnvMessageAttachmentID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ConversationMessageRatings`
--
ALTER TABLE `ConversationMessageRatings`
  MODIFY `cnvMessageRatingID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ConversationMessages`
--
ALTER TABLE `ConversationMessages`
  MODIFY `cnvMessageID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ConversationRatingTypes`
--
ALTER TABLE `ConversationRatingTypes`
  MODIFY `cnvRatingTypeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Conversations`
--
ALTER TABLE `Conversations`
  MODIFY `cnvID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `DesignTags`
--
ALTER TABLE `DesignTags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `DownloadStatistics`
--
ALTER TABLE `DownloadStatistics`
  MODIFY `dsID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'DownloadStatistics record ID';

--
-- AUTO_INCREMENT for table `ExpressEntityAssociationEntries`
--
ALTER TABLE `ExpressEntityAssociationEntries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ExpressEntityEntries`
--
ALTER TABLE `ExpressEntityEntries`
  MODIFY `exEntryID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ExpressEntityEntryAssociations`
--
ALTER TABLE `ExpressEntityEntryAssociations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ExpressFormFieldSets`
--
ALTER TABLE `ExpressFormFieldSets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `FileExternalFileProviders`
--
ALTER TABLE `FileExternalFileProviders`
  MODIFY `efpID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `FileExternalFileProviderTypes`
--
ALTER TABLE `FileExternalFileProviderTypes`
  MODIFY `efpTypeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `FileImageThumbnailTypes`
--
ALTER TABLE `FileImageThumbnailTypes`
  MODIFY `ftTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Files`
--
ALTER TABLE `Files`
  MODIFY `fID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `FileSetFiles`
--
ALTER TABLE `FileSetFiles`
  MODIFY `fsfID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `FileSets`
--
ALTER TABLE `FileSets`
  MODIFY `fsID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `FileStorageLocations`
--
ALTER TABLE `FileStorageLocations`
  MODIFY `fslID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `FileStorageLocationTypes`
--
ALTER TABLE `FileStorageLocationTypes`
  MODIFY `fslTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `FileVersionLog`
--
ALTER TABLE `FileVersionLog`
  MODIFY `fvlID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Geolocators`
--
ALTER TABLE `Geolocators`
  MODIFY `glID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Geolocator ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `GroupCreates`
--
ALTER TABLE `GroupCreates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `GroupRoleChanges`
--
ALTER TABLE `GroupRoleChanges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `GroupRoles`
--
ALTER TABLE `GroupRoles`
  MODIFY `grID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Groups`
--
ALTER TABLE `Groups`
  MODIFY `gID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `GroupSets`
--
ALTER TABLE `GroupSets`
  MODIFY `gsID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `GroupSignupRequestAccepts`
--
ALTER TABLE `GroupSignupRequestAccepts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `GroupSignupRequestDeclines`
--
ALTER TABLE `GroupSignupRequestDeclines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `GroupSignupRequests`
--
ALTER TABLE `GroupSignupRequests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `GroupSignups`
--
ALTER TABLE `GroupSignups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `GroupTypes`
--
ALTER TABLE `GroupTypes`
  MODIFY `gtID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `IpAccessControlCategories`
--
ALTER TABLE `IpAccessControlCategories`
  MODIFY `iaccID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The IP Access Control Category identifier', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `IpAccessControlEvents`
--
ALTER TABLE `IpAccessControlEvents`
  MODIFY `iaceID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The IP Access Control Event identifier';

--
-- AUTO_INCREMENT for table `IpAccessControlRanges`
--
ALTER TABLE `IpAccessControlRanges`
  MODIFY `iacrID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The IP Access Control Range identifier';

--
-- AUTO_INCREMENT for table `Jobs`
--
ALTER TABLE `Jobs`
  MODIFY `jID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `JobSets`
--
ALTER TABLE `JobSets`
  MODIFY `jsID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `JobsLog`
--
ALTER TABLE `JobsLog`
  MODIFY `jlID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Logs`
--
ALTER TABLE `Logs`
  MODIFY `logID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `MailImporters`
--
ALTER TABLE `MailImporters`
  MODIFY `miID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `MailValidationHashes`
--
ALTER TABLE `MailValidationHashes`
  MODIFY `mvhID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `MessengerMessages`
--
ALTER TABLE `MessengerMessages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `MultilingualTranslations`
--
ALTER TABLE `MultilingualTranslations`
  MODIFY `mtID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `NotificationAlerts`
--
ALTER TABLE `NotificationAlerts`
  MODIFY `naID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Notifications`
--
ALTER TABLE `Notifications`
  MODIFY `nID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Packages`
--
ALTER TABLE `Packages`
  MODIFY `pkgID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PageContainerInstanceAreas`
--
ALTER TABLE `PageContainerInstanceAreas`
  MODIFY `containerInstanceAreaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `PageContainerInstances`
--
ALTER TABLE `PageContainerInstances`
  MODIFY `containerInstanceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `PageContainers`
--
ALTER TABLE `PageContainers`
  MODIFY `containerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `PageFeeds`
--
ALTER TABLE `PageFeeds`
  MODIFY `pfID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `PagePaths`
--
ALTER TABLE `PagePaths`
  MODIFY `ppID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;

--
-- AUTO_INCREMENT for table `PageSummaryTemplates`
--
ALTER TABLE `PageSummaryTemplates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `PageTemplates`
--
ALTER TABLE `PageTemplates`
  MODIFY `pTemplateID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `PageThemeCustomSkins`
--
ALTER TABLE `PageThemeCustomSkins`
  MODIFY `skinID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PageThemes`
--
ALTER TABLE `PageThemes`
  MODIFY `pThemeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `PageTypeComposerControlTypes`
--
ALTER TABLE `PageTypeComposerControlTypes`
  MODIFY `ptComposerControlTypeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `PageTypeComposerFormLayoutSetControls`
--
ALTER TABLE `PageTypeComposerFormLayoutSetControls`
  MODIFY `ptComposerFormLayoutSetControlID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `PageTypeComposerFormLayoutSets`
--
ALTER TABLE `PageTypeComposerFormLayoutSets`
  MODIFY `ptComposerFormLayoutSetID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `PageTypeComposerOutputBlocks`
--
ALTER TABLE `PageTypeComposerOutputBlocks`
  MODIFY `ptComposerOutputBlockID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PageTypeComposerOutputControls`
--
ALTER TABLE `PageTypeComposerOutputControls`
  MODIFY `ptComposerOutputControlID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `PageTypePublishTargetTypes`
--
ALTER TABLE `PageTypePublishTargetTypes`
  MODIFY `ptPublishTargetTypeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `PageTypes`
--
ALTER TABLE `PageTypes`
  MODIFY `ptID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `PermissionAccess`
--
ALTER TABLE `PermissionAccess`
  MODIFY `paID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `PermissionAccessEntities`
--
ALTER TABLE `PermissionAccessEntities`
  MODIFY `peID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `PermissionAccessEntityGroups`
--
ALTER TABLE `PermissionAccessEntityGroups`
  MODIFY `pegID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `PermissionAccessEntitySiteGroups`
--
ALTER TABLE `PermissionAccessEntitySiteGroups`
  MODIFY `pegID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PermissionAccessEntityTypes`
--
ALTER TABLE `PermissionAccessEntityTypes`
  MODIFY `petID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `PermissionDurationObjects`
--
ALTER TABLE `PermissionDurationObjects`
  MODIFY `pdID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PermissionKeyCategories`
--
ALTER TABLE `PermissionKeyCategories`
  MODIFY `pkCategoryID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `PermissionKeys`
--
ALTER TABLE `PermissionKeys`
  MODIFY `pkID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `PileContents`
--
ALTER TABLE `PileContents`
  MODIFY `pcID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Piles`
--
ALTER TABLE `Piles`
  MODIFY `pID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SavedExpressSearchQueries`
--
ALTER TABLE `SavedExpressSearchQueries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SavedFileSearchQueries`
--
ALTER TABLE `SavedFileSearchQueries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SavedGroupSearchQueries`
--
ALTER TABLE `SavedGroupSearchQueries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SavedLogSearchQueries`
--
ALTER TABLE `SavedLogSearchQueries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SavedPageSearchQueries`
--
ALTER TABLE `SavedPageSearchQueries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SavedUserSearchQueries`
--
ALTER TABLE `SavedUserSearchQueries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SiteDomains`
--
ALTER TABLE `SiteDomains`
  MODIFY `domainID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SiteGroupRelations`
--
ALTER TABLE `SiteGroupRelations`
  MODIFY `groupRelationID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SiteGroups`
--
ALTER TABLE `SiteGroups`
  MODIFY `siteGID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SiteLocales`
--
ALTER TABLE `SiteLocales`
  MODIFY `siteLocaleID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Sites`
--
ALTER TABLE `Sites`
  MODIFY `siteID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `SiteSkeletonLocales`
--
ALTER TABLE `SiteSkeletonLocales`
  MODIFY `skeletonLocaleID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SiteSkeletons`
--
ALTER TABLE `SiteSkeletons`
  MODIFY `siteSkeletonID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SiteTrees`
--
ALTER TABLE `SiteTrees`
  MODIFY `siteTreeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `SiteTypes`
--
ALTER TABLE `SiteTypes`
  MODIFY `siteTypeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `SocialLinks`
--
ALTER TABLE `SocialLinks`
  MODIFY `slID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Stacks`
--
ALTER TABLE `Stacks`
  MODIFY `stID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `StyleCustomizerCustomCssRecords`
--
ALTER TABLE `StyleCustomizerCustomCssRecords`
  MODIFY `sccRecordID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `StyleCustomizerInlineStylePresets`
--
ALTER TABLE `StyleCustomizerInlineStylePresets`
  MODIFY `pssPresetID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `StyleCustomizerInlineStyleSets`
--
ALTER TABLE `StyleCustomizerInlineStyleSets`
  MODIFY `issID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `StyleCustomizerValueLists`
--
ALTER TABLE `StyleCustomizerValueLists`
  MODIFY `scvlID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `StyleCustomizerValues`
--
ALTER TABLE `StyleCustomizerValues`
  MODIFY `scvID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SummaryCategories`
--
ALTER TABLE `SummaryCategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `SummaryFields`
--
ALTER TABLE `SummaryFields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `SummaryTemplateFields`
--
ALTER TABLE `SummaryTemplateFields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `SummaryTemplates`
--
ALTER TABLE `SummaryTemplates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `SystemDatabaseQueryLog`
--
ALTER TABLE `SystemDatabaseQueryLog`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Tasks`
--
ALTER TABLE `Tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `TaskSets`
--
ALTER TABLE `TaskSets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `TreeFileFolderNodes`
--
ALTER TABLE `TreeFileFolderNodes`
  MODIFY `treeNodeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `TreeFileNodes`
--
ALTER TABLE `TreeFileNodes`
  MODIFY `treeNodeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `TreeGroupFolderNodes`
--
ALTER TABLE `TreeGroupFolderNodes`
  MODIFY `treeNodeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `TreeGroupFolderNodeSelectedGroupTypes`
--
ALTER TABLE `TreeGroupFolderNodeSelectedGroupTypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `TreeGroupNodes`
--
ALTER TABLE `TreeGroupNodes`
  MODIFY `treeNodeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `TreeNodes`
--
ALTER TABLE `TreeNodes`
  MODIFY `treeNodeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `TreeNodeTypes`
--
ALTER TABLE `TreeNodeTypes`
  MODIFY `treeNodeTypeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Trees`
--
ALTER TABLE `Trees`
  MODIFY `treeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `TreeSearchQueryNodes`
--
ALTER TABLE `TreeSearchQueryNodes`
  MODIFY `treeNodeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `TreeTypes`
--
ALTER TABLE `TreeTypes`
  MODIFY `treeTypeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `UsedStringLog`
--
ALTER TABLE `UsedStringLog`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `UserPrivateMessages`
--
ALTER TABLE `UserPrivateMessages`
  MODIFY `msgID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `uID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `UserSignups`
--
ALTER TABLE `UserSignups`
  MODIFY `usID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `UserValidationHashes`
--
ALTER TABLE `UserValidationHashes`
  MODIFY `uvhID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `WorkflowProgress`
--
ALTER TABLE `WorkflowProgress`
  MODIFY `wpID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `WorkflowProgressCategories`
--
ALTER TABLE `WorkflowProgressCategories`
  MODIFY `wpCategoryID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `WorkflowProgressHistory`
--
ALTER TABLE `WorkflowProgressHistory`
  MODIFY `wphID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `WorkflowRequestObjects`
--
ALTER TABLE `WorkflowRequestObjects`
  MODIFY `wrID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Workflows`
--
ALTER TABLE `Workflows`
  MODIFY `wfID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `WorkflowTypes`
--
ALTER TABLE `WorkflowTypes`
  MODIFY `wftID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `AnnouncementUserViews`
--
ALTER TABLE `AnnouncementUserViews`
  ADD CONSTRAINT `FK_B721E7B9913AEA17` FOREIGN KEY (`announcement_id`) REFERENCES `Announcements` (`id`),
  ADD CONSTRAINT `FK_B721E7B9FD71026C` FOREIGN KEY (`uID`) REFERENCES `Users` (`uID`) ON DELETE CASCADE;

--
-- Constraints for table `AreaLayoutsUsingPresets`
--
ALTER TABLE `AreaLayoutsUsingPresets`
  ADD CONSTRAINT `FK_7A9049A1385521EA` FOREIGN KEY (`arLayoutID`) REFERENCES `AreaLayouts` (`arLayoutID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `atAddress`
--
ALTER TABLE `atAddress`
  ADD CONSTRAINT `FK_DA949740A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`) ON DELETE CASCADE;

--
-- Constraints for table `atAddressSettings`
--
ALTER TABLE `atAddressSettings`
  ADD CONSTRAINT `FK_5A737B61B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `atBoolean`
--
ALTER TABLE `atBoolean`
  ADD CONSTRAINT `FK_5D5F70A9A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`) ON DELETE CASCADE;

--
-- Constraints for table `atBooleanSettings`
--
ALTER TABLE `atBooleanSettings`
  ADD CONSTRAINT `FK_78025F47B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `atDateTime`
--
ALTER TABLE `atDateTime`
  ADD CONSTRAINT `FK_DF75412AA2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`) ON DELETE CASCADE;

--
-- Constraints for table `atDateTimeSettings`
--
ALTER TABLE `atDateTimeSettings`
  ADD CONSTRAINT `FK_C6B3B63AB6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `atDefault`
--
ALTER TABLE `atDefault`
  ADD CONSTRAINT `FK_3484F81EA2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`) ON DELETE CASCADE;

--
-- Constraints for table `atDuration`
--
ALTER TABLE `atDuration`
  ADD CONSTRAINT `FK_6AEBA81EA2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`) ON DELETE CASCADE;

--
-- Constraints for table `atDurationSettings`
--
ALTER TABLE `atDurationSettings`
  ADD CONSTRAINT `FK_AE47F82EB6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `atEmptySettings`
--
ALTER TABLE `atEmptySettings`
  ADD CONSTRAINT `FK_ED1BF189B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `atExpress`
--
ALTER TABLE `atExpress`
  ADD CONSTRAINT `FK_CFAF40F1A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`) ON DELETE CASCADE;

--
-- Constraints for table `atExpressSelectedEntries`
--
ALTER TABLE `atExpressSelectedEntries`
  ADD CONSTRAINT `FK_C9D404BB6DCB6296` FOREIGN KEY (`exEntryID`) REFERENCES `ExpressEntityEntries` (`exEntryID`),
  ADD CONSTRAINT `FK_C9D404BBA2A82A5D` FOREIGN KEY (`avID`) REFERENCES `atExpress` (`avID`);

--
-- Constraints for table `atExpressSettings`
--
ALTER TABLE `atExpressSettings`
  ADD CONSTRAINT `FK_E8F67F0FB6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`),
  ADD CONSTRAINT `FK_E8F67F0FCE2D7284` FOREIGN KEY (`exEntityID`) REFERENCES `ExpressEntities` (`id`);

--
-- Constraints for table `atFile`
--
ALTER TABLE `atFile`
  ADD CONSTRAINT `FK_73D17D61A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_73D17D61E3111F45` FOREIGN KEY (`fID`) REFERENCES `Files` (`fID`) ON DELETE CASCADE;

--
-- Constraints for table `atFileSettings`
--
ALTER TABLE `atFileSettings`
  ADD CONSTRAINT `FK_EADD86C8B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `atNumber`
--
ALTER TABLE `atNumber`
  ADD CONSTRAINT `FK_41BA30B5A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`) ON DELETE CASCADE;

--
-- Constraints for table `atSelect`
--
ALTER TABLE `atSelect`
  ADD CONSTRAINT `FK_9CD8C521A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`) ON DELETE CASCADE;

--
-- Constraints for table `atSelectedSocialLinks`
--
ALTER TABLE `atSelectedSocialLinks`
  ADD CONSTRAINT `FK_10743709A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `atSocialLinks` (`avID`);

--
-- Constraints for table `atSelectedTopics`
--
ALTER TABLE `atSelectedTopics`
  ADD CONSTRAINT `FK_E42A7D5BA2A82A5D` FOREIGN KEY (`avID`) REFERENCES `atTopic` (`avID`);

--
-- Constraints for table `atSelectOptions`
--
ALTER TABLE `atSelectOptions`
  ADD CONSTRAINT `FK_797414B0CB59257C` FOREIGN KEY (`avSelectOptionListID`) REFERENCES `atSelectOptionLists` (`avSelectOptionListID`);

--
-- Constraints for table `atSelectOptionsSelected`
--
ALTER TABLE `atSelectOptionsSelected`
  ADD CONSTRAINT `FK_40C97EC3A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `atSelect` (`avID`),
  ADD CONSTRAINT `FK_40C97EC3E584C274` FOREIGN KEY (`avSelectOptionID`) REFERENCES `atSelectOptions` (`avSelectOptionID`);

--
-- Constraints for table `atSelectSettings`
--
ALTER TABLE `atSelectSettings`
  ADD CONSTRAINT `FK_5D514424B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`),
  ADD CONSTRAINT `FK_5D514424CB59257C` FOREIGN KEY (`avSelectOptionListID`) REFERENCES `atSelectOptionLists` (`avSelectOptionListID`);

--
-- Constraints for table `atSite`
--
ALTER TABLE `atSite`
  ADD CONSTRAINT `FK_960D4295521D8435` FOREIGN KEY (`siteID`) REFERENCES `Sites` (`siteID`),
  ADD CONSTRAINT `FK_960D4295A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`) ON DELETE CASCADE;

--
-- Constraints for table `atSocialLinks`
--
ALTER TABLE `atSocialLinks`
  ADD CONSTRAINT `FK_1431EC8AA2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`) ON DELETE CASCADE;

--
-- Constraints for table `atTextareaSettings`
--
ALTER TABLE `atTextareaSettings`
  ADD CONSTRAINT `FK_A6EA10D6B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `atTextSettings`
--
ALTER TABLE `atTextSettings`
  ADD CONSTRAINT `FK_951A10CCB6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `atTopic`
--
ALTER TABLE `atTopic`
  ADD CONSTRAINT `FK_BABDD1FAA2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`) ON DELETE CASCADE;

--
-- Constraints for table `atTopicSettings`
--
ALTER TABLE `atTopicSettings`
  ADD CONSTRAINT `FK_830FD2FEB6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `AttributeKeyCategories`
--
ALTER TABLE `AttributeKeyCategories`
  ADD CONSTRAINT `FK_A2A0CC67CE45CBB0` FOREIGN KEY (`pkgID`) REFERENCES `Packages` (`pkgID`);

--
-- Constraints for table `AttributeKeys`
--
ALTER TABLE `AttributeKeys`
  ADD CONSTRAINT `FK_DCA32C62A12CFE33` FOREIGN KEY (`atID`) REFERENCES `AttributeTypes` (`atID`),
  ADD CONSTRAINT `FK_DCA32C62B059B76B` FOREIGN KEY (`akCategoryID`) REFERENCES `AttributeKeyCategories` (`akCategoryID`),
  ADD CONSTRAINT `FK_DCA32C62CE45CBB0` FOREIGN KEY (`pkgID`) REFERENCES `Packages` (`pkgID`);

--
-- Constraints for table `AttributeSetKeys`
--
ALTER TABLE `AttributeSetKeys`
  ADD CONSTRAINT `FK_222F72D8A463E8B6` FOREIGN KEY (`asID`) REFERENCES `AttributeSets` (`asID`),
  ADD CONSTRAINT `FK_222F72D8B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `AttributeSets`
--
ALTER TABLE `AttributeSets`
  ADD CONSTRAINT `FK_FCA02D5FB059B76B` FOREIGN KEY (`akCategoryID`) REFERENCES `AttributeKeyCategories` (`akCategoryID`),
  ADD CONSTRAINT `FK_FCA02D5FCE45CBB0` FOREIGN KEY (`pkgID`) REFERENCES `Packages` (`pkgID`);

--
-- Constraints for table `AttributeTypeCategories`
--
ALTER TABLE `AttributeTypeCategories`
  ADD CONSTRAINT `FK_49A9CABEA12CFE33` FOREIGN KEY (`atID`) REFERENCES `AttributeTypes` (`atID`),
  ADD CONSTRAINT `FK_49A9CABEB059B76B` FOREIGN KEY (`akCategoryID`) REFERENCES `AttributeKeyCategories` (`akCategoryID`);

--
-- Constraints for table `AttributeTypes`
--
ALTER TABLE `AttributeTypes`
  ADD CONSTRAINT `FK_53580A7FCE45CBB0` FOREIGN KEY (`pkgID`) REFERENCES `Packages` (`pkgID`);

--
-- Constraints for table `AttributeValues`
--
ALTER TABLE `AttributeValues`
  ADD CONSTRAINT `FK_DCCE7864B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`) ON DELETE CASCADE;

--
-- Constraints for table `atUserGroupSettings`
--
ALTER TABLE `atUserGroupSettings`
  ADD CONSTRAINT `FK_C47871BEB6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `BoardConfiguredDataSourceConfiguration`
--
ALTER TABLE `BoardConfiguredDataSourceConfiguration`
  ADD CONSTRAINT `FK_80879512E2D47DD5` FOREIGN KEY (`configuredDataSourceID`) REFERENCES `BoardConfiguredDataSources` (`configuredDataSourceID`);

--
-- Constraints for table `BoardConfiguredDataSourceConfigurationCalendarEvent`
--
ALTER TABLE `BoardConfiguredDataSourceConfigurationCalendarEvent`
  ADD CONSTRAINT `FK_DE5A529911C85723` FOREIGN KEY (`caID`) REFERENCES `Calendars` (`caID`),
  ADD CONSTRAINT `FK_DE5A52997916C267` FOREIGN KEY (`configurationID`) REFERENCES `BoardConfiguredDataSourceConfiguration` (`configurationID`) ON DELETE CASCADE;

--
-- Constraints for table `BoardConfiguredDataSourceConfigurationPage`
--
ALTER TABLE `BoardConfiguredDataSourceConfigurationPage`
  ADD CONSTRAINT `FK_2C8A71BD7916C267` FOREIGN KEY (`configurationID`) REFERENCES `BoardConfiguredDataSourceConfiguration` (`configurationID`) ON DELETE CASCADE;

--
-- Constraints for table `BoardConfiguredDataSources`
--
ALTER TABLE `BoardConfiguredDataSources`
  ADD CONSTRAINT `FK_481DA3EF2571BEE` FOREIGN KEY (`boardID`) REFERENCES `Boards` (`boardID`),
  ADD CONSTRAINT `FK_481DA3EF3C4EAFF2` FOREIGN KEY (`dataSourceID`) REFERENCES `BoardDataSources` (`dataSourceID`);

--
-- Constraints for table `BoardCustomSlotTemplates`
--
ALTER TABLE `BoardCustomSlotTemplates`
  ADD CONSTRAINT `FK_A972DD602571BEE` FOREIGN KEY (`boardID`) REFERENCES `Boards` (`boardID`),
  ADD CONSTRAINT `FK_A972DD60E7630775` FOREIGN KEY (`slotTemplateID`) REFERENCES `BoardSlotTemplates` (`id`);

--
-- Constraints for table `BoardDataSources`
--
ALTER TABLE `BoardDataSources`
  ADD CONSTRAINT `FK_DACB5A9ACE45CBB0` FOREIGN KEY (`pkgID`) REFERENCES `Packages` (`pkgID`);

--
-- Constraints for table `BoardDesignerCustomElementItems`
--
ALTER TABLE `BoardDesignerCustomElementItems`
  ADD CONSTRAINT `FK_C3E81E43A1BF9938` FOREIGN KEY (`boardItemID`) REFERENCES `BoardItems` (`boardItemID`),
  ADD CONSTRAINT `FK_C3E81E43DA67F394` FOREIGN KEY (`customElementID`) REFERENCES `BoardDesignerCustomElements` (`id`);

--
-- Constraints for table `BoardDesignerCustomElements`
--
ALTER TABLE `BoardDesignerCustomElements`
  ADD CONSTRAINT `FK_D2D0FCBD80D42955` FOREIGN KEY (`slotTemplate_id`) REFERENCES `BoardSlotTemplates` (`id`),
  ADD CONSTRAINT `FK_D2D0FCBDFD71026C` FOREIGN KEY (`uID`) REFERENCES `Users` (`uID`) ON DELETE SET NULL;

--
-- Constraints for table `BoardInstanceItemBatches`
--
ALTER TABLE `BoardInstanceItemBatches`
  ADD CONSTRAINT `FK_968D5F552E21467` FOREIGN KEY (`boardInstanceID`) REFERENCES `BoardInstances` (`boardInstanceID`);

--
-- Constraints for table `BoardInstanceItems`
--
ALTER TABLE `BoardInstanceItems`
  ADD CONSTRAINT `FK_285D2C822E21467` FOREIGN KEY (`boardInstanceID`) REFERENCES `BoardInstances` (`boardInstanceID`),
  ADD CONSTRAINT `FK_285D2C82A1BF9938` FOREIGN KEY (`boardItemID`) REFERENCES `BoardItems` (`boardItemID`),
  ADD CONSTRAINT `FK_285D2C82E2D47DD5` FOREIGN KEY (`configuredDataSourceID`) REFERENCES `BoardConfiguredDataSources` (`configuredDataSourceID`),
  ADD CONSTRAINT `FK_285D2C82E9D76F8E` FOREIGN KEY (`boardInstanceItemBatchID`) REFERENCES `BoardInstanceItemBatches` (`boardInstanceItemBatchID`);

--
-- Constraints for table `BoardInstanceLogEntries`
--
ALTER TABLE `BoardInstanceLogEntries`
  ADD CONSTRAINT `FK_4CBE00D8EA675D86` FOREIGN KEY (`log_id`) REFERENCES `BoardInstanceLogs` (`id`);

--
-- Constraints for table `BoardInstanceLogs`
--
ALTER TABLE `BoardInstanceLogs`
  ADD CONSTRAINT `FK_BF6A8F2F2E21467` FOREIGN KEY (`boardInstanceID`) REFERENCES `BoardInstances` (`boardInstanceID`);

--
-- Constraints for table `BoardInstances`
--
ALTER TABLE `BoardInstances`
  ADD CONSTRAINT `FK_8B85BCCB2571BEE` FOREIGN KEY (`boardID`) REFERENCES `Boards` (`boardID`),
  ADD CONSTRAINT `FK_8B85BCCB521D8435` FOREIGN KEY (`siteID`) REFERENCES `Sites` (`siteID`);

--
-- Constraints for table `BoardInstanceSlotRules`
--
ALTER TABLE `BoardInstanceSlotRules`
  ADD CONSTRAINT `FK_4BF1A09D2E21467` FOREIGN KEY (`boardInstanceID`) REFERENCES `BoardInstances` (`boardInstanceID`),
  ADD CONSTRAINT `FK_4BF1A09DFD71026C` FOREIGN KEY (`uID`) REFERENCES `Users` (`uID`) ON DELETE SET NULL;

--
-- Constraints for table `BoardInstanceSlots`
--
ALTER TABLE `BoardInstanceSlots`
  ADD CONSTRAINT `FK_137F01F2E21467` FOREIGN KEY (`boardInstanceID`) REFERENCES `BoardInstances` (`boardInstanceID`),
  ADD CONSTRAINT `FK_137F01F5DA0FB8` FOREIGN KEY (`template_id`) REFERENCES `BoardSlotTemplates` (`id`);

--
-- Constraints for table `BoardItemCategories`
--
ALTER TABLE `BoardItemCategories`
  ADD CONSTRAINT `FK_BEF09673A1BF9938` FOREIGN KEY (`boardItemID`) REFERENCES `BoardItems` (`boardItemID`);

--
-- Constraints for table `BoardItems`
--
ALTER TABLE `BoardItems`
  ADD CONSTRAINT `FK_E831ECA13C4EAFF2` FOREIGN KEY (`dataSourceID`) REFERENCES `BoardDataSources` (`dataSourceID`),
  ADD CONSTRAINT `FK_E831ECA1E3111F45` FOREIGN KEY (`fID`) REFERENCES `Files` (`fID`);

--
-- Constraints for table `BoardItemTags`
--
ALTER TABLE `BoardItemTags`
  ADD CONSTRAINT `FK_13AEB901A1BF9938` FOREIGN KEY (`boardItemID`) REFERENCES `BoardItems` (`boardItemID`);

--
-- Constraints for table `BoardPermissionAssignments`
--
ALTER TABLE `BoardPermissionAssignments`
  ADD CONSTRAINT `FK_7C073ED92571BEE` FOREIGN KEY (`boardID`) REFERENCES `Boards` (`boardID`);

--
-- Constraints for table `Boards`
--
ALTER TABLE `Boards`
  ADD CONSTRAINT `FK_F4424825521D8435` FOREIGN KEY (`siteID`) REFERENCES `Sites` (`siteID`),
  ADD CONSTRAINT `FK_F44248255DA0FB8` FOREIGN KEY (`template_id`) REFERENCES `BoardTemplates` (`id`),
  ADD CONSTRAINT `FK_F4424825CE45CBB0` FOREIGN KEY (`pkgID`) REFERENCES `Packages` (`pkgID`);

--
-- Constraints for table `BoardSlotTemplates`
--
ALTER TABLE `BoardSlotTemplates`
  ADD CONSTRAINT `FK_6FE111C5CE45CBB0` FOREIGN KEY (`pkgID`) REFERENCES `Packages` (`pkgID`);

--
-- Constraints for table `BoardSlotTemplateTags`
--
ALTER TABLE `BoardSlotTemplateTags`
  ADD CONSTRAINT `FK_7BB1975E648A682` FOREIGN KEY (`slottemplate_id`) REFERENCES `BoardSlotTemplates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_7BB1975E960BFEAE` FOREIGN KEY (`designtag_id`) REFERENCES `DesignTags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `BoardTemplates`
--
ALTER TABLE `BoardTemplates`
  ADD CONSTRAINT `FK_9E8AC12CCE45CBB0` FOREIGN KEY (`pkgID`) REFERENCES `Packages` (`pkgID`);

--
-- Constraints for table `CalendarEventAttributeKeys`
--
ALTER TABLE `CalendarEventAttributeKeys`
  ADD CONSTRAINT `FK_27F477CCB6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`) ON DELETE CASCADE;

--
-- Constraints for table `CalendarEventCustomSummaryTemplates`
--
ALTER TABLE `CalendarEventCustomSummaryTemplates`
  ADD CONSTRAINT `FK_7059BBEF10409BA4` FOREIGN KEY (`eventID`) REFERENCES `CalendarEvents` (`eventID`),
  ADD CONSTRAINT `FK_7059BBEF5DA0FB8` FOREIGN KEY (`template_id`) REFERENCES `SummaryTemplates` (`id`);

--
-- Constraints for table `CalendarEventOccurrences`
--
ALTER TABLE `CalendarEventOccurrences`
  ADD CONSTRAINT `FK_7DD686EC31391E00` FOREIGN KEY (`repetitionID`) REFERENCES `CalendarEventRepetitions` (`repetitionID`);

--
-- Constraints for table `CalendarEvents`
--
ALTER TABLE `CalendarEvents`
  ADD CONSTRAINT `FK_7F23C55611C85723` FOREIGN KEY (`caID`) REFERENCES `Calendars` (`caID`);

--
-- Constraints for table `CalendarEventSummaryTemplates`
--
ALTER TABLE `CalendarEventSummaryTemplates`
  ADD CONSTRAINT `FK_219AA86B10409BA4` FOREIGN KEY (`eventID`) REFERENCES `CalendarEvents` (`eventID`),
  ADD CONSTRAINT `FK_219AA86B5DA0FB8` FOREIGN KEY (`template_id`) REFERENCES `SummaryTemplates` (`id`);

--
-- Constraints for table `CalendarEventVersionAttributeValues`
--
ALTER TABLE `CalendarEventVersionAttributeValues`
  ADD CONSTRAINT `FK_8C835B05403F5D6` FOREIGN KEY (`eventVersionID`) REFERENCES `CalendarEventVersions` (`eventVersionID`),
  ADD CONSTRAINT `FK_8C835B05A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`),
  ADD CONSTRAINT `FK_8C835B05B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `CalendarEventVersionOccurrences`
--
ALTER TABLE `CalendarEventVersionOccurrences`
  ADD CONSTRAINT `FK_60310489403F5D6` FOREIGN KEY (`eventVersionID`) REFERENCES `CalendarEventVersions` (`eventVersionID`),
  ADD CONSTRAINT `FK_60310489B4FDDC0F` FOREIGN KEY (`occurrenceID`) REFERENCES `CalendarEventOccurrences` (`occurrenceID`);

--
-- Constraints for table `CalendarEventVersionRepetitions`
--
ALTER TABLE `CalendarEventVersionRepetitions`
  ADD CONSTRAINT `FK_C1C3D3DB31391E00` FOREIGN KEY (`repetitionID`) REFERENCES `CalendarEventRepetitions` (`repetitionID`),
  ADD CONSTRAINT `FK_C1C3D3DB403F5D6` FOREIGN KEY (`eventVersionID`) REFERENCES `CalendarEventVersions` (`eventVersionID`);

--
-- Constraints for table `CalendarEventVersions`
--
ALTER TABLE `CalendarEventVersions`
  ADD CONSTRAINT `FK_8E26027410409BA4` FOREIGN KEY (`eventID`) REFERENCES `CalendarEvents` (`eventID`),
  ADD CONSTRAINT `FK_8E260274FD71026C` FOREIGN KEY (`uID`) REFERENCES `Users` (`uID`) ON DELETE SET NULL;

--
-- Constraints for table `CalendarEventWorkflowProgress`
--
ALTER TABLE `CalendarEventWorkflowProgress`
  ADD CONSTRAINT `FK_C5EAACF910409BA4` FOREIGN KEY (`eventID`) REFERENCES `CalendarEvents` (`eventID`);

--
-- Constraints for table `CalendarPermissionAssignments`
--
ALTER TABLE `CalendarPermissionAssignments`
  ADD CONSTRAINT `FK_5AD546AA11C85723` FOREIGN KEY (`caID`) REFERENCES `Calendars` (`caID`);

--
-- Constraints for table `CalendarRelatedEvents`
--
ALTER TABLE `CalendarRelatedEvents`
  ADD CONSTRAINT `FK_310130E910409BA4` FOREIGN KEY (`eventID`) REFERENCES `CalendarEvents` (`eventID`);

--
-- Constraints for table `Calendars`
--
ALTER TABLE `Calendars`
  ADD CONSTRAINT `FK_62E00AC521D8435` FOREIGN KEY (`siteID`) REFERENCES `Sites` (`siteID`);

--
-- Constraints for table `CollectionAttributeKeys`
--
ALTER TABLE `CollectionAttributeKeys`
  ADD CONSTRAINT `FK_1E3E5B79B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`) ON DELETE CASCADE;

--
-- Constraints for table `CollectionAttributeValues`
--
ALTER TABLE `CollectionAttributeValues`
  ADD CONSTRAINT `FK_BB9995FCA2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`),
  ADD CONSTRAINT `FK_BB9995FCB6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `CollectionSearchIndexAttributes`
--
ALTER TABLE `CollectionSearchIndexAttributes`
  ADD CONSTRAINT `FK_FD84E56FE5DADDAE` FOREIGN KEY (`cID`) REFERENCES `Collections` (`cID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ConversationMessageNotifications`
--
ALTER TABLE `ConversationMessageNotifications`
  ADD CONSTRAINT `FK_559DE1CBED024EFD` FOREIGN KEY (`nID`) REFERENCES `Notifications` (`nID`) ON DELETE CASCADE;

--
-- Constraints for table `DownloadStatistics`
--
ALTER TABLE `DownloadStatistics`
  ADD CONSTRAINT `FK_7CDE2E3CE3111F45` FOREIGN KEY (`fID`) REFERENCES `Files` (`fID`) ON DELETE CASCADE;

--
-- Constraints for table `Editor`
--
ALTER TABLE `Editor`
  ADD CONSTRAINT `FK_CB5DF48CCE45CBB0` FOREIGN KEY (`pkgID`) REFERENCES `Packages` (`pkgID`);

--
-- Constraints for table `ExpressAttributeKeys`
--
ALTER TABLE `ExpressAttributeKeys`
  ADD CONSTRAINT `FK_8C881F181257D5D` FOREIGN KEY (`entity_id`) REFERENCES `ExpressEntities` (`id`),
  ADD CONSTRAINT `FK_8C881F1B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`) ON DELETE CASCADE;

--
-- Constraints for table `ExpressEntities`
--
ALTER TABLE `ExpressEntities`
  ADD CONSTRAINT `FK_BC772AA6547D6B2D` FOREIGN KEY (`default_view_form_id`) REFERENCES `ExpressForms` (`id`),
  ADD CONSTRAINT `FK_BC772AA6C7DEC56D` FOREIGN KEY (`default_edit_form_id`) REFERENCES `ExpressForms` (`id`),
  ADD CONSTRAINT `FK_BC772AA6CE45CBB0` FOREIGN KEY (`pkgID`) REFERENCES `Packages` (`pkgID`);

--
-- Constraints for table `ExpressEntityAssociationEntries`
--
ALTER TABLE `ExpressEntityAssociationEntries`
  ADD CONSTRAINT `FK_9C2BB76C6DCB6296` FOREIGN KEY (`exEntryID`) REFERENCES `ExpressEntityEntries` (`exEntryID`),
  ADD CONSTRAINT `FK_9C2BB76CEFB9C8A5` FOREIGN KEY (`association_id`) REFERENCES `ExpressEntityEntryAssociations` (`id`);

--
-- Constraints for table `ExpressEntityAssociations`
--
ALTER TABLE `ExpressEntityAssociations`
  ADD CONSTRAINT `FK_98A0F796B5910F71` FOREIGN KEY (`target_entity_id`) REFERENCES `ExpressEntities` (`id`),
  ADD CONSTRAINT `FK_98A0F796E9BBEE93` FOREIGN KEY (`source_entity_id`) REFERENCES `ExpressEntities` (`id`);

--
-- Constraints for table `ExpressEntityEntries`
--
ALTER TABLE `ExpressEntityEntries`
  ADD CONSTRAINT `FK_B8AE3531AFC87D03` FOREIGN KEY (`exEntryEntityID`) REFERENCES `ExpressEntities` (`id`),
  ADD CONSTRAINT `FK_B8AE3531FD71026C` FOREIGN KEY (`uID`) REFERENCES `Users` (`uID`);

--
-- Constraints for table `ExpressEntityEntryAssociations`
--
ALTER TABLE `ExpressEntityEntryAssociations`
  ADD CONSTRAINT `FK_25B3A0826DCB6296` FOREIGN KEY (`exEntryID`) REFERENCES `ExpressEntityEntries` (`exEntryID`),
  ADD CONSTRAINT `FK_25B3A082EFB9C8A5` FOREIGN KEY (`association_id`) REFERENCES `ExpressEntityAssociations` (`id`);

--
-- Constraints for table `ExpressEntityEntryAttributeValues`
--
ALTER TABLE `ExpressEntityEntryAttributeValues`
  ADD CONSTRAINT `FK_6DB641546DCB6296` FOREIGN KEY (`exEntryID`) REFERENCES `ExpressEntityEntries` (`exEntryID`),
  ADD CONSTRAINT `FK_6DB64154A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`),
  ADD CONSTRAINT `FK_6DB64154B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `ExpressForm170ExpressSearchIndexAttributes`
--
ALTER TABLE `ExpressForm170ExpressSearchIndexAttributes`
  ADD CONSTRAINT `FK_722F0F0E6DCB6296` FOREIGN KEY (`exEntryID`) REFERENCES `ExpressEntityEntries` (`exEntryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ExpressFormFieldSetAssociationControls`
--
ALTER TABLE `ExpressFormFieldSetAssociationControls`
  ADD CONSTRAINT `FK_E6DF21BBBF396750` FOREIGN KEY (`id`) REFERENCES `ExpressFormFieldSetControls` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_E6DF21BBEFB9C8A5` FOREIGN KEY (`association_id`) REFERENCES `ExpressEntityAssociations` (`id`);

--
-- Constraints for table `ExpressFormFieldSetAttributeKeyControls`
--
ALTER TABLE `ExpressFormFieldSetAttributeKeyControls`
  ADD CONSTRAINT `FK_8481F9D1B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`),
  ADD CONSTRAINT `FK_8481F9D1BF396750` FOREIGN KEY (`id`) REFERENCES `ExpressFormFieldSetControls` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ExpressFormFieldSetAuthorControls`
--
ALTER TABLE `ExpressFormFieldSetAuthorControls`
  ADD CONSTRAINT `FK_CF378786BF396750` FOREIGN KEY (`id`) REFERENCES `ExpressFormFieldSetControls` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ExpressFormFieldSetControls`
--
ALTER TABLE `ExpressFormFieldSetControls`
  ADD CONSTRAINT `FK_E42868A43ABF811A` FOREIGN KEY (`field_set_id`) REFERENCES `ExpressFormFieldSets` (`id`);

--
-- Constraints for table `ExpressFormFieldSetPublicIdentifierControls`
--
ALTER TABLE `ExpressFormFieldSetPublicIdentifierControls`
  ADD CONSTRAINT `FK_67180C04BF396750` FOREIGN KEY (`id`) REFERENCES `ExpressFormFieldSetControls` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ExpressFormFieldSets`
--
ALTER TABLE `ExpressFormFieldSets`
  ADD CONSTRAINT `FK_A33BBBEC5FF69B7D` FOREIGN KEY (`form_id`) REFERENCES `ExpressForms` (`id`);

--
-- Constraints for table `ExpressFormFieldSetTextControls`
--
ALTER TABLE `ExpressFormFieldSetTextControls`
  ADD CONSTRAINT `FK_DB5A209ABF396750` FOREIGN KEY (`id`) REFERENCES `ExpressFormFieldSetControls` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ExpressForms`
--
ALTER TABLE `ExpressForms`
  ADD CONSTRAINT `FK_8D09031A81257D5D` FOREIGN KEY (`entity_id`) REFERENCES `ExpressEntities` (`id`);

--
-- Constraints for table `FileAttributeKeys`
--
ALTER TABLE `FileAttributeKeys`
  ADD CONSTRAINT `FK_BC5C7BBB6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`) ON DELETE CASCADE;

--
-- Constraints for table `FileAttributeValues`
--
ALTER TABLE `FileAttributeValues`
  ADD CONSTRAINT `FK_BBECEAA4A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`),
  ADD CONSTRAINT `FK_BBECEAA4B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `FileImageThumbnailTypeFileSets`
--
ALTER TABLE `FileImageThumbnailTypeFileSets`
  ADD CONSTRAINT `FK_BD75F88D480660E5` FOREIGN KEY (`ftfsThumbnailType`) REFERENCES `FileImageThumbnailTypes` (`ftTypeID`) ON DELETE CASCADE;

--
-- Constraints for table `Files`
--
ALTER TABLE `Files`
  ADD CONSTRAINT `FK_C7F46F5DB81D3903` FOREIGN KEY (`fslID`) REFERENCES `FileStorageLocations` (`fslID`),
  ADD CONSTRAINT `FK_C7F46F5DFD71026C` FOREIGN KEY (`uID`) REFERENCES `Users` (`uID`) ON DELETE SET NULL;

--
-- Constraints for table `FileSearchIndexAttributes`
--
ALTER TABLE `FileSearchIndexAttributes`
  ADD CONSTRAINT `FK_3A3A4845E3111F45` FOREIGN KEY (`fID`) REFERENCES `Files` (`fID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `FileVersions`
--
ALTER TABLE `FileVersions`
  ADD CONSTRAINT `FK_D7B5A13AE3111F45` FOREIGN KEY (`fID`) REFERENCES `Files` (`fID`);

--
-- Constraints for table `FormSubmissionNotifications`
--
ALTER TABLE `FormSubmissionNotifications`
  ADD CONSTRAINT `FK_E7B6BE406DCB6296` FOREIGN KEY (`exEntryID`) REFERENCES `ExpressEntityEntries` (`exEntryID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_E7B6BE40ED024EFD` FOREIGN KEY (`nID`) REFERENCES `Notifications` (`nID`) ON DELETE CASCADE;

--
-- Constraints for table `Geolocators`
--
ALTER TABLE `Geolocators`
  ADD CONSTRAINT `FK_83BB1614D5F6CC40` FOREIGN KEY (`glPackage`) REFERENCES `Packages` (`pkgID`) ON DELETE CASCADE;

--
-- Constraints for table `GroupCreateNotifications`
--
ALTER TABLE `GroupCreateNotifications`
  ADD CONSTRAINT `FK_C17D9982BF396750` FOREIGN KEY (`id`) REFERENCES `GroupCreates` (`id`),
  ADD CONSTRAINT `FK_C17D9982ED024EFD` FOREIGN KEY (`nID`) REFERENCES `Notifications` (`nID`) ON DELETE CASCADE;

--
-- Constraints for table `GroupCreates`
--
ALTER TABLE `GroupCreates`
  ADD CONSTRAINT `FK_CCD7EF48FD71026C` FOREIGN KEY (`uID`) REFERENCES `Users` (`uID`) ON DELETE SET NULL;

--
-- Constraints for table `GroupRoleChangeNotifications`
--
ALTER TABLE `GroupRoleChangeNotifications`
  ADD CONSTRAINT `FK_C1402C44BF396750` FOREIGN KEY (`id`) REFERENCES `GroupRoleChanges` (`id`),
  ADD CONSTRAINT `FK_C1402C44ED024EFD` FOREIGN KEY (`nID`) REFERENCES `Notifications` (`nID`) ON DELETE CASCADE;

--
-- Constraints for table `GroupRoleChanges`
--
ALTER TABLE `GroupRoleChanges`
  ADD CONSTRAINT `FK_98ADE2F3FD71026C` FOREIGN KEY (`uID`) REFERENCES `Users` (`uID`) ON DELETE SET NULL;

--
-- Constraints for table `GroupSignupNotifications`
--
ALTER TABLE `GroupSignupNotifications`
  ADD CONSTRAINT `FK_77F3EABF396750` FOREIGN KEY (`id`) REFERENCES `GroupSignups` (`id`),
  ADD CONSTRAINT `FK_77F3EAED024EFD` FOREIGN KEY (`nID`) REFERENCES `Notifications` (`nID`) ON DELETE CASCADE;

--
-- Constraints for table `GroupSignupRequestAcceptNotifications`
--
ALTER TABLE `GroupSignupRequestAcceptNotifications`
  ADD CONSTRAINT `FK_72E6015ABF396750` FOREIGN KEY (`id`) REFERENCES `GroupSignupRequestAccepts` (`id`),
  ADD CONSTRAINT `FK_72E6015AED024EFD` FOREIGN KEY (`nID`) REFERENCES `Notifications` (`nID`) ON DELETE CASCADE;

--
-- Constraints for table `GroupSignupRequestAccepts`
--
ALTER TABLE `GroupSignupRequestAccepts`
  ADD CONSTRAINT `FK_18BBF9FCDB43B5DF` FOREIGN KEY (`managerUID`) REFERENCES `Users` (`uID`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_18BBF9FCFD71026C` FOREIGN KEY (`uID`) REFERENCES `Users` (`uID`) ON DELETE SET NULL;

--
-- Constraints for table `GroupSignupRequestDeclineNotifications`
--
ALTER TABLE `GroupSignupRequestDeclineNotifications`
  ADD CONSTRAINT `FK_930C0D02BF396750` FOREIGN KEY (`id`) REFERENCES `GroupSignupRequestDeclines` (`id`),
  ADD CONSTRAINT `FK_930C0D02ED024EFD` FOREIGN KEY (`nID`) REFERENCES `Notifications` (`nID`) ON DELETE CASCADE;

--
-- Constraints for table `GroupSignupRequestDeclines`
--
ALTER TABLE `GroupSignupRequestDeclines`
  ADD CONSTRAINT `FK_A905188EDB43B5DF` FOREIGN KEY (`managerUID`) REFERENCES `Users` (`uID`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_A905188EFD71026C` FOREIGN KEY (`uID`) REFERENCES `Users` (`uID`) ON DELETE SET NULL;

--
-- Constraints for table `GroupSignupRequestNotifications`
--
ALTER TABLE `GroupSignupRequestNotifications`
  ADD CONSTRAINT `FK_56EC93C8BF396750` FOREIGN KEY (`id`) REFERENCES `GroupSignupRequests` (`id`),
  ADD CONSTRAINT `FK_56EC93C8ED024EFD` FOREIGN KEY (`nID`) REFERENCES `Notifications` (`nID`) ON DELETE CASCADE;

--
-- Constraints for table `GroupSignupRequests`
--
ALTER TABLE `GroupSignupRequests`
  ADD CONSTRAINT `FK_8CF06191FD71026C` FOREIGN KEY (`uID`) REFERENCES `Users` (`uID`) ON DELETE SET NULL;

--
-- Constraints for table `GroupSignups`
--
ALTER TABLE `GroupSignups`
  ADD CONSTRAINT `FK_D6CC4ECBFD71026C` FOREIGN KEY (`uID`) REFERENCES `Users` (`uID`) ON DELETE SET NULL;

--
-- Constraints for table `HealthReportResultFindings`
--
ALTER TABLE `HealthReportResultFindings`
  ADD CONSTRAINT `FK_14794DC7A7B643` FOREIGN KEY (`result_id`) REFERENCES `HealthReportResults` (`id`);

--
-- Constraints for table `HealthReportResults`
--
ALTER TABLE `HealthReportResults`
  ADD CONSTRAINT `FK_F8C09F44E821EAFF` FOREIGN KEY (`taskID`) REFERENCES `Tasks` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `HealthReportSearchResults`
--
ALTER TABLE `HealthReportSearchResults`
  ADD CONSTRAINT `FK_96480975BF396750` FOREIGN KEY (`id`) REFERENCES `HealthReportResults` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `IpAccessControlCategories`
--
ALTER TABLE `IpAccessControlCategories`
  ADD CONSTRAINT `FK_D4A10062C908ED51` FOREIGN KEY (`iaccPackage`) REFERENCES `Packages` (`pkgID`) ON DELETE CASCADE;

--
-- Constraints for table `IpAccessControlEvents`
--
ALTER TABLE `IpAccessControlEvents`
  ADD CONSTRAINT `FK_6C004072B0C0DFA7` FOREIGN KEY (`iaceSite`) REFERENCES `Sites` (`siteID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6C004072E9480668` FOREIGN KEY (`iaceCategory`) REFERENCES `IpAccessControlCategories` (`iaccID`) ON DELETE CASCADE;

--
-- Constraints for table `IpAccessControlRanges`
--
ALTER TABLE `IpAccessControlRanges`
  ADD CONSTRAINT `FK_2B1AA65D21E929D0` FOREIGN KEY (`iacrCategory`) REFERENCES `IpAccessControlCategories` (`iaccID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_2B1AA65D62009435` FOREIGN KEY (`iacrSite`) REFERENCES `Sites` (`siteID`) ON DELETE CASCADE;

--
-- Constraints for table `LegacyAttributeKeys`
--
ALTER TABLE `LegacyAttributeKeys`
  ADD CONSTRAINT `FK_740BA2BBB6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`) ON DELETE CASCADE;

--
-- Constraints for table `MailingListExpressSearchIndexAttributes`
--
ALTER TABLE `MailingListExpressSearchIndexAttributes`
  ADD CONSTRAINT `FK_9DDE56596DCB6296` FOREIGN KEY (`exEntryID`) REFERENCES `ExpressEntityEntries` (`exEntryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `MessengerProcesses`
--
ALTER TABLE `MessengerProcesses`
  ADD CONSTRAINT `FK_FBB7A9C9F39EBE7A` FOREIGN KEY (`batch_id`) REFERENCES `MessengerBatches` (`id`),
  ADD CONSTRAINT `FK_FBB7A9C9FD71026C` FOREIGN KEY (`uID`) REFERENCES `Users` (`uID`) ON DELETE SET NULL;

--
-- Constraints for table `MessengerScheduledTasks`
--
ALTER TABLE `MessengerScheduledTasks`
  ADD CONSTRAINT `FK_DCEB3C0D8DB60186` FOREIGN KEY (`task_id`) REFERENCES `Tasks` (`id`),
  ADD CONSTRAINT `FK_DCEB3C0DFD71026C` FOREIGN KEY (`uID`) REFERENCES `Users` (`uID`) ON DELETE SET NULL;

--
-- Constraints for table `MessengerTaskProcesses`
--
ALTER TABLE `MessengerTaskProcesses`
  ADD CONSTRAINT `FK_BE77DC6F8DB60186` FOREIGN KEY (`task_id`) REFERENCES `Tasks` (`id`),
  ADD CONSTRAINT `FK_BE77DC6FBF396750` FOREIGN KEY (`id`) REFERENCES `MessengerProcesses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `NotificationAlerts`
--
ALTER TABLE `NotificationAlerts`
  ADD CONSTRAINT `FK_E11C7408ED024EFD` FOREIGN KEY (`nID`) REFERENCES `Notifications` (`nID`),
  ADD CONSTRAINT `FK_E11C7408FD71026C` FOREIGN KEY (`uID`) REFERENCES `Users` (`uID`);

--
-- Constraints for table `OAuth2AccessToken`
--
ALTER TABLE `OAuth2AccessToken`
  ADD CONSTRAINT `FK_60D69F3FC7440455` FOREIGN KEY (`client`) REFERENCES `OAuth2Client` (`identifier`) ON DELETE CASCADE;

--
-- Constraints for table `OAuth2AuthCode`
--
ALTER TABLE `OAuth2AuthCode`
  ADD CONSTRAINT `FK_29D07B5C7440455` FOREIGN KEY (`client`) REFERENCES `OAuth2Client` (`identifier`);

--
-- Constraints for table `OAuth2ClientScopes`
--
ALTER TABLE `OAuth2ClientScopes`
  ADD CONSTRAINT `FK_497E26F39ECFF1A8` FOREIGN KEY (`clientIdentifier`) REFERENCES `OAuth2Client` (`identifier`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_497E26F3C7FD45E9` FOREIGN KEY (`scopeIdentifier`) REFERENCES `OAuth2Scope` (`identifier`);

--
-- Constraints for table `OAuth2RefreshToken`
--
ALTER TABLE `OAuth2RefreshToken`
  ADD CONSTRAINT `FK_A205CB8350A9822` FOREIGN KEY (`accessToken`) REFERENCES `OAuth2AccessToken` (`identifier`) ON DELETE SET NULL;

--
-- Constraints for table `PageContainerInstanceAreas`
--
ALTER TABLE `PageContainerInstanceAreas`
  ADD CONSTRAINT `FK_484B3E0A1FCD0045` FOREIGN KEY (`containerInstanceID`) REFERENCES `PageContainerInstances` (`containerInstanceID`) ON DELETE CASCADE;

--
-- Constraints for table `PageContainerInstances`
--
ALTER TABLE `PageContainerInstances`
  ADD CONSTRAINT `FK_489D87A71159C151` FOREIGN KEY (`containerID`) REFERENCES `PageContainers` (`containerID`) ON DELETE CASCADE;

--
-- Constraints for table `PageContainers`
--
ALTER TABLE `PageContainers`
  ADD CONSTRAINT `FK_65E7C1D1CE45CBB0` FOREIGN KEY (`pkgID`) REFERENCES `Packages` (`pkgID`);

--
-- Constraints for table `PageSummaryTemplateCustomCollectionTemplates`
--
ALTER TABLE `PageSummaryTemplateCustomCollectionTemplates`
  ADD CONSTRAINT `FK_23B91C0F5DA0FB8` FOREIGN KEY (`template_id`) REFERENCES `SummaryTemplates` (`id`),
  ADD CONSTRAINT `FK_23B91C0FE5DADDAE` FOREIGN KEY (`cID`) REFERENCES `PageSummaryTemplateCustomCollection` (`cID`);

--
-- Constraints for table `PageSummaryTemplates`
--
ALTER TABLE `PageSummaryTemplates`
  ADD CONSTRAINT `FK_55AC200B5DA0FB8` FOREIGN KEY (`template_id`) REFERENCES `SummaryTemplates` (`id`);

--
-- Constraints for table `PageThemeCustomSkins`
--
ALTER TABLE `PageThemeCustomSkins`
  ADD CONSTRAINT `FK_162E9C4EFD71026C` FOREIGN KEY (`uID`) REFERENCES `Users` (`uID`);

--
-- Constraints for table `PermissionAccessEntitySiteGroups`
--
ALTER TABLE `PermissionAccessEntitySiteGroups`
  ADD CONSTRAINT `FK_51122D554A62E0E4` FOREIGN KEY (`siteGID`) REFERENCES `SiteGroups` (`siteGID`);

--
-- Constraints for table `PrivateMessageNotifications`
--
ALTER TABLE `PrivateMessageNotifications`
  ADD CONSTRAINT `FK_1AB97592ED024EFD` FOREIGN KEY (`nID`) REFERENCES `Notifications` (`nID`) ON DELETE CASCADE;

--
-- Constraints for table `SavedExpressSearchQueries`
--
ALTER TABLE `SavedExpressSearchQueries`
  ADD CONSTRAINT `FK_F87C25F2CE2D7284` FOREIGN KEY (`exEntityID`) REFERENCES `ExpressEntities` (`id`);

--
-- Constraints for table `SiteAttributeKeys`
--
ALTER TABLE `SiteAttributeKeys`
  ADD CONSTRAINT `FK_63D1E182B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`) ON DELETE CASCADE;

--
-- Constraints for table `SiteAttributeValues`
--
ALTER TABLE `SiteAttributeValues`
  ADD CONSTRAINT `FK_67658AF7521D8435` FOREIGN KEY (`siteID`) REFERENCES `Sites` (`siteID`),
  ADD CONSTRAINT `FK_67658AF7A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`),
  ADD CONSTRAINT `FK_67658AF7B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `SiteDomains`
--
ALTER TABLE `SiteDomains`
  ADD CONSTRAINT `FK_4CC7400A521D8435` FOREIGN KEY (`siteID`) REFERENCES `Sites` (`siteID`);

--
-- Constraints for table `SiteGroupRelations`
--
ALTER TABLE `SiteGroupRelations`
  ADD CONSTRAINT `FK_DCBCDCA94A62E0E4` FOREIGN KEY (`siteGID`) REFERENCES `SiteGroups` (`siteGID`),
  ADD CONSTRAINT `FK_DCBCDCA9521D8435` FOREIGN KEY (`siteID`) REFERENCES `Sites` (`siteID`);

--
-- Constraints for table `SiteGroups`
--
ALTER TABLE `SiteGroups`
  ADD CONSTRAINT `FK_F6FE030FE9548DF7` FOREIGN KEY (`siteTypeID`) REFERENCES `SiteTypes` (`siteTypeID`);

--
-- Constraints for table `SiteLocales`
--
ALTER TABLE `SiteLocales`
  ADD CONSTRAINT `FK_2527AB2C521D8435` FOREIGN KEY (`siteID`) REFERENCES `Sites` (`siteID`),
  ADD CONSTRAINT `FK_2527AB2CF9431B4B` FOREIGN KEY (`siteTreeID`) REFERENCES `SiteTreeTrees` (`siteTreeID`);

--
-- Constraints for table `Sites`
--
ALTER TABLE `Sites`
  ADD CONSTRAINT `FK_7DC18567E9548DF7` FOREIGN KEY (`siteTypeID`) REFERENCES `SiteTypes` (`siteTypeID`);

--
-- Constraints for table `SiteSearchIndexAttributes`
--
ALTER TABLE `SiteSearchIndexAttributes`
  ADD CONSTRAINT `FK_3DD070B4521D8435` FOREIGN KEY (`siteID`) REFERENCES `Sites` (`siteID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `SiteSkeletonLocales`
--
ALTER TABLE `SiteSkeletonLocales`
  ADD CONSTRAINT `FK_212DD202B579BD3E` FOREIGN KEY (`siteSkeletonID`) REFERENCES `SiteSkeletons` (`siteSkeletonID`),
  ADD CONSTRAINT `FK_212DD202F9431B4B` FOREIGN KEY (`siteTreeID`) REFERENCES `SiteSkeletonTrees` (`siteTreeID`);

--
-- Constraints for table `SiteSkeletons`
--
ALTER TABLE `SiteSkeletons`
  ADD CONSTRAINT `FK_D36AED98E9548DF7` FOREIGN KEY (`siteTypeID`) REFERENCES `SiteTypes` (`siteTypeID`);

--
-- Constraints for table `SiteSkeletonTrees`
--
ALTER TABLE `SiteSkeletonTrees`
  ADD CONSTRAINT `FK_550F784B16B7EAF2` FOREIGN KEY (`skeletonLocaleID`) REFERENCES `SiteSkeletonLocales` (`skeletonLocaleID`),
  ADD CONSTRAINT `FK_550F784BE9548DF7` FOREIGN KEY (`siteTypeID`) REFERENCES `SiteTypes` (`siteTypeID`),
  ADD CONSTRAINT `FK_550F784BF9431B4B` FOREIGN KEY (`siteTreeID`) REFERENCES `SiteTrees` (`siteTreeID`) ON DELETE CASCADE;

--
-- Constraints for table `SiteTreeTrees`
--
ALTER TABLE `SiteTreeTrees`
  ADD CONSTRAINT `FK_A4B9696EACD624CD` FOREIGN KEY (`siteLocaleID`) REFERENCES `SiteLocales` (`siteLocaleID`),
  ADD CONSTRAINT `FK_A4B9696EF9431B4B` FOREIGN KEY (`siteTreeID`) REFERENCES `SiteTrees` (`siteTreeID`) ON DELETE CASCADE;

--
-- Constraints for table `SiteTypeAttributeKeys`
--
ALTER TABLE `SiteTypeAttributeKeys`
  ADD CONSTRAINT `FK_26C73776B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`) ON DELETE CASCADE;

--
-- Constraints for table `SiteTypeAttributeValues`
--
ALTER TABLE `SiteTypeAttributeValues`
  ADD CONSTRAINT `FK_78059CB9A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`),
  ADD CONSTRAINT `FK_78059CB9B579BD3E` FOREIGN KEY (`siteSkeletonID`) REFERENCES `SiteSkeletons` (`siteSkeletonID`),
  ADD CONSTRAINT `FK_78059CB9B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `SiteTypes`
--
ALTER TABLE `SiteTypes`
  ADD CONSTRAINT `FK_7CBFE975CE45CBB0` FOREIGN KEY (`pkgID`) REFERENCES `Packages` (`pkgID`);

--
-- Constraints for table `SocialLinks`
--
ALTER TABLE `SocialLinks`
  ADD CONSTRAINT `FK_84EBA2B4521D8435` FOREIGN KEY (`siteID`) REFERENCES `Sites` (`siteID`);

--
-- Constraints for table `SummaryCategories`
--
ALTER TABLE `SummaryCategories`
  ADD CONSTRAINT `FK_F815AD2ACE45CBB0` FOREIGN KEY (`pkgID`) REFERENCES `Packages` (`pkgID`);

--
-- Constraints for table `SummaryFields`
--
ALTER TABLE `SummaryFields`
  ADD CONSTRAINT `FK_AC926EC9CE45CBB0` FOREIGN KEY (`pkgID`) REFERENCES `Packages` (`pkgID`);

--
-- Constraints for table `SummaryTemplateCategories`
--
ALTER TABLE `SummaryTemplateCategories`
  ADD CONSTRAINT `FK_C8B6E64A12469DE2` FOREIGN KEY (`category_id`) REFERENCES `SummaryCategories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C8B6E64A5DA0FB8` FOREIGN KEY (`template_id`) REFERENCES `SummaryTemplates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `SummaryTemplateFields`
--
ALTER TABLE `SummaryTemplateFields`
  ADD CONSTRAINT `FK_294381EC443707B0` FOREIGN KEY (`field_id`) REFERENCES `SummaryFields` (`id`),
  ADD CONSTRAINT `FK_294381EC5DA0FB8` FOREIGN KEY (`template_id`) REFERENCES `SummaryTemplates` (`id`);

--
-- Constraints for table `SummaryTemplates`
--
ALTER TABLE `SummaryTemplates`
  ADD CONSTRAINT `FK_5E3C9832CE45CBB0` FOREIGN KEY (`pkgID`) REFERENCES `Packages` (`pkgID`);

--
-- Constraints for table `SummaryTemplateTags`
--
ALTER TABLE `SummaryTemplateTags`
  ADD CONSTRAINT `FK_D9197F515DA0FB8` FOREIGN KEY (`template_id`) REFERENCES `SummaryTemplates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D9197F51960BFEAE` FOREIGN KEY (`designtag_id`) REFERENCES `DesignTags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `Tasks`
--
ALTER TABLE `Tasks`
  ADD CONSTRAINT `FK_91994A93CE45CBB0` FOREIGN KEY (`pkgID`) REFERENCES `Packages` (`pkgID`),
  ADD CONSTRAINT `FK_91994A93FD71026C` FOREIGN KEY (`uID`) REFERENCES `Users` (`uID`) ON DELETE SET NULL;

--
-- Constraints for table `TaskSets`
--
ALTER TABLE `TaskSets`
  ADD CONSTRAINT `FK_EF2069C4CE45CBB0` FOREIGN KEY (`pkgID`) REFERENCES `Packages` (`pkgID`);

--
-- Constraints for table `TaskSetTasks`
--
ALTER TABLE `TaskSetTasks`
  ADD CONSTRAINT `FK_D395AA3810FB0D18` FOREIGN KEY (`set_id`) REFERENCES `TaskSets` (`id`),
  ADD CONSTRAINT `FK_D395AA388DB60186` FOREIGN KEY (`task_id`) REFERENCES `Tasks` (`id`);

--
-- Constraints for table `UserAttributeKeys`
--
ALTER TABLE `UserAttributeKeys`
  ADD CONSTRAINT `FK_28970033B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`) ON DELETE CASCADE;

--
-- Constraints for table `UserAttributeValues`
--
ALTER TABLE `UserAttributeValues`
  ADD CONSTRAINT `FK_4DB68CA6A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`),
  ADD CONSTRAINT `FK_4DB68CA6B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`),
  ADD CONSTRAINT `FK_4DB68CA6FD71026C` FOREIGN KEY (`uID`) REFERENCES `Users` (`uID`);

--
-- Constraints for table `UserDeactivatedNotifications`
--
ALTER TABLE `UserDeactivatedNotifications`
  ADD CONSTRAINT `FK_ED5A1F9FED024EFD` FOREIGN KEY (`nID`) REFERENCES `Notifications` (`nID`) ON DELETE CASCADE;

--
-- Constraints for table `UserFavoriteFolders`
--
ALTER TABLE `UserFavoriteFolders`
  ADD CONSTRAINT `FK_EDB1ABB6FD71026C` FOREIGN KEY (`uID`) REFERENCES `Users` (`uID`) ON DELETE CASCADE;

--
-- Constraints for table `UserSearchIndexAttributes`
--
ALTER TABLE `UserSearchIndexAttributes`
  ADD CONSTRAINT `FK_74798B07FD71026C` FOREIGN KEY (`uID`) REFERENCES `Users` (`uID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `UserSignupNotifications`
--
ALTER TABLE `UserSignupNotifications`
  ADD CONSTRAINT `FK_7FB1DF5B7B18287E` FOREIGN KEY (`usID`) REFERENCES `UserSignups` (`usID`),
  ADD CONSTRAINT `FK_7FB1DF5BED024EFD` FOREIGN KEY (`nID`) REFERENCES `Notifications` (`nID`) ON DELETE CASCADE;

--
-- Constraints for table `UserSignups`
--
ALTER TABLE `UserSignups`
  ADD CONSTRAINT `FK_FEB5D909D3564642` FOREIGN KEY (`createdBy`) REFERENCES `Users` (`uID`),
  ADD CONSTRAINT `FK_FEB5D909FD71026C` FOREIGN KEY (`uID`) REFERENCES `Users` (`uID`);

--
-- Constraints for table `WorkflowProgressNotifications`
--
ALTER TABLE `WorkflowProgressNotifications`
  ADD CONSTRAINT `FK_EC39CA81ED024EFD` FOREIGN KEY (`nID`) REFERENCES `Notifications` (`nID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
