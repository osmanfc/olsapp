-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 26, 2025 at 10:02 PM
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
-- Table structure for table `ChangeSet`
--

CREATE TABLE `ChangeSet` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Versioned\\ChangeSet') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Versioned\\ChangeSet',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `State` enum('open','published','reverted') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'open',
  `IsInferred` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PublishDate` datetime DEFAULT NULL,
  `LastSynced` datetime DEFAULT NULL,
  `OwnerID` int(11) NOT NULL DEFAULT 0,
  `PublisherID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ChangeSetItem`
--

CREATE TABLE `ChangeSetItem` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Versioned\\ChangeSetItem') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Versioned\\ChangeSetItem',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `VersionBefore` int(11) NOT NULL DEFAULT 0,
  `VersionAfter` int(11) NOT NULL DEFAULT 0,
  `Added` enum('explicitly','implicitly') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'implicitly',
  `ChangeSetID` int(11) NOT NULL DEFAULT 0,
  `ObjectID` int(11) NOT NULL DEFAULT 0,
  `ObjectClass` enum('SilverStripe\\Assets\\File','SilverStripe\\SiteConfig\\SiteConfig','SilverStripe\\Versioned\\ChangeSet','SilverStripe\\Versioned\\ChangeSetItem','SilverStripe\\Assets\\Shortcodes\\FileLink','SilverStripe\\CMS\\Model\\SiteTree','SilverStripe\\CMS\\Model\\SiteTreeLink','SilverStripe\\Security\\Group','SilverStripe\\Security\\LoginAttempt','SilverStripe\\Security\\Member','SilverStripe\\Security\\MemberPassword','SilverStripe\\Security\\Permission','SilverStripe\\Security\\PermissionRole','SilverStripe\\Security\\PermissionRoleCode','SilverStripe\\Security\\RememberLoginHash','SilverStripe\\SessionManager\\Models\\LoginSession','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image','Page','SilverStripe\\ErrorPage\\ErrorPage','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\File'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ChangeSetItem_ReferencedBy`
--

CREATE TABLE `ChangeSetItem_ReferencedBy` (
  `ID` int(11) NOT NULL,
  `ChangeSetItemID` int(11) NOT NULL DEFAULT 0,
  `ChildID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage`
--

CREATE TABLE `ErrorPage` (
  `ID` int(11) NOT NULL,
  `ErrorCode` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ErrorPage`
--

INSERT INTO `ErrorPage` (`ID`, `ErrorCode`) VALUES
(4, 404),
(5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage_Live`
--

CREATE TABLE `ErrorPage_Live` (
  `ID` int(11) NOT NULL,
  `ErrorCode` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ErrorPage_Live`
--

INSERT INTO `ErrorPage_Live` (`ID`, `ErrorCode`) VALUES
(4, 404),
(5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage_Versions`
--

CREATE TABLE `ErrorPage_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `ErrorCode` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ErrorPage_Versions`
--

INSERT INTO `ErrorPage_Versions` (`ID`, `RecordID`, `Version`, `ErrorCode`) VALUES
(1, 4, 1, 404),
(2, 4, 2, 404),
(3, 5, 1, 500),
(4, 5, 2, 500);

-- --------------------------------------------------------

--
-- Table structure for table `File`
--

CREATE TABLE `File` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Assets\\File','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\File',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 0,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `ParentID` int(11) NOT NULL DEFAULT 0,
  `OwnerID` int(11) NOT NULL DEFAULT 0,
  `FileHash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FileFilename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FileVariant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FileLink`
--

CREATE TABLE `FileLink` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Assets\\Shortcodes\\FileLink') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\Shortcodes\\FileLink',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `LinkedID` int(11) NOT NULL DEFAULT 0,
  `ParentID` int(11) NOT NULL DEFAULT 0,
  `ParentClass` enum('SilverStripe\\Assets\\File','SilverStripe\\SiteConfig\\SiteConfig','SilverStripe\\Versioned\\ChangeSet','SilverStripe\\Versioned\\ChangeSetItem','SilverStripe\\Assets\\Shortcodes\\FileLink','SilverStripe\\CMS\\Model\\SiteTree','SilverStripe\\CMS\\Model\\SiteTreeLink','SilverStripe\\Security\\Group','SilverStripe\\Security\\LoginAttempt','SilverStripe\\Security\\Member','SilverStripe\\Security\\MemberPassword','SilverStripe\\Security\\Permission','SilverStripe\\Security\\PermissionRole','SilverStripe\\Security\\PermissionRoleCode','SilverStripe\\Security\\RememberLoginHash','SilverStripe\\SessionManager\\Models\\LoginSession','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image','Page','SilverStripe\\ErrorPage\\ErrorPage','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\File'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `File_EditorGroups`
--

CREATE TABLE `File_EditorGroups` (
  `ID` int(11) NOT NULL,
  `FileID` int(11) NOT NULL DEFAULT 0,
  `GroupID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `File_EditorMembers`
--

CREATE TABLE `File_EditorMembers` (
  `ID` int(11) NOT NULL,
  `FileID` int(11) NOT NULL DEFAULT 0,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `File_Live`
--

CREATE TABLE `File_Live` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Assets\\File','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\File',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 0,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `ParentID` int(11) NOT NULL DEFAULT 0,
  `OwnerID` int(11) NOT NULL DEFAULT 0,
  `FileHash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FileFilename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FileVariant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `File_Versions`
--

CREATE TABLE `File_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `WasPublished` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `WasDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `WasDraft` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `AuthorID` int(11) NOT NULL DEFAULT 0,
  `PublisherID` int(11) NOT NULL DEFAULT 0,
  `ClassName` enum('SilverStripe\\Assets\\File','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\File',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `ParentID` int(11) NOT NULL DEFAULT 0,
  `OwnerID` int(11) NOT NULL DEFAULT 0,
  `FileHash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FileFilename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FileVariant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `File_ViewerGroups`
--

CREATE TABLE `File_ViewerGroups` (
  `ID` int(11) NOT NULL,
  `FileID` int(11) NOT NULL DEFAULT 0,
  `GroupID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `File_ViewerMembers`
--

CREATE TABLE `File_ViewerMembers` (
  `ID` int(11) NOT NULL,
  `FileID` int(11) NOT NULL DEFAULT 0,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Group`
--

CREATE TABLE `Group` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Security\\Group') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Security\\Group',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Locked` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Sort` int(11) NOT NULL DEFAULT 0,
  `HtmlEditorConfig` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `Group`
--

INSERT INTO `Group` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `Description`, `Code`, `Locked`, `Sort`, `HtmlEditorConfig`, `ParentID`) VALUES
(1, 'SilverStripe\\Security\\Group', '2025-06-26 16:58:19', '2025-06-26 16:58:19', 'Content Authors', NULL, 'content-authors', 0, 1, NULL, 0),
(2, 'SilverStripe\\Security\\Group', '2025-06-26 16:58:19', '2025-06-26 16:58:19', 'Administrators', NULL, 'administrators', 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Group_Members`
--

CREATE TABLE `Group_Members` (
  `ID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT 0,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `Group_Members`
--

INSERT INTO `Group_Members` (`ID`, `GroupID`, `MemberID`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Group_Roles`
--

CREATE TABLE `Group_Roles` (
  `ID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT 0,
  `PermissionRoleID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `LoginAttempt`
--

CREATE TABLE `LoginAttempt` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Security\\LoginAttempt') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Security\\LoginAttempt',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `EmailHashed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` enum('Success','Failure') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Success',
  `IP` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `LoginAttempt`
--

INSERT INTO `LoginAttempt` (`ID`, `ClassName`, `LastEdited`, `Created`, `EmailHashed`, `Status`, `IP`, `MemberID`) VALUES
(1, 'SilverStripe\\Security\\LoginAttempt', '2025-06-26 17:02:42', '2025-06-26 17:02:42', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Success', '103.137.161.7', 1);

-- --------------------------------------------------------

--
-- Table structure for table `LoginSession`
--

CREATE TABLE `LoginSession` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\SessionManager\\Models\\LoginSession') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\SessionManager\\Models\\LoginSession',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `LastAccessed` datetime DEFAULT NULL,
  `IPAddress` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserAgent` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Persistent` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `LoginSession`
--

INSERT INTO `LoginSession` (`ID`, `ClassName`, `LastEdited`, `Created`, `LastAccessed`, `IPAddress`, `UserAgent`, `Persistent`, `MemberID`) VALUES
(1, 'SilverStripe\\SessionManager\\Models\\LoginSession', '2025-06-26 17:02:43', '2025-06-26 17:02:43', '2025-06-26 17:02:43', '103.137.161.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Member`
--

CREATE TABLE `Member` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Security\\Member') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Security\\Member',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `FirstName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TempIDHash` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TempIDExpired` datetime DEFAULT NULL,
  `Password` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AutoLoginHash` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AutoLoginExpired` datetime DEFAULT NULL,
  `PasswordEncryption` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Salt` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PasswordExpiry` date DEFAULT NULL,
  `LockedOutUntil` datetime DEFAULT NULL,
  `Locale` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FailedLoginCount` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `Member`
--

INSERT INTO `Member` (`ID`, `ClassName`, `LastEdited`, `Created`, `FirstName`, `Surname`, `Email`, `TempIDHash`, `TempIDExpired`, `Password`, `AutoLoginHash`, `AutoLoginExpired`, `PasswordEncryption`, `Salt`, `PasswordExpiry`, `LockedOutUntil`, `Locale`, `FailedLoginCount`) VALUES
(1, 'SilverStripe\\Security\\Member', '2025-06-26 17:02:43', '2025-06-26 17:02:42', 'Default Admin', NULL, 'admin', '3ce58a0e7646cde5db2e71dc6af36a33fc655abe', '2025-06-29 17:02:43', '$2y$10$15c60dddd0aa177c4f7d4u3iQDbU89os0Pj/sbmFFU3dw22qNueIy', NULL, NULL, 'blowfish', '10$15c60dddd0aa177c4f7d42', NULL, NULL, 'en_US', 0);

-- --------------------------------------------------------

--
-- Table structure for table `MemberPassword`
--

CREATE TABLE `MemberPassword` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Security\\MemberPassword') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Security\\MemberPassword',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Password` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Salt` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PasswordEncryption` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `MemberPassword`
--

INSERT INTO `MemberPassword` (`ID`, `ClassName`, `LastEdited`, `Created`, `Password`, `Salt`, `PasswordEncryption`, `MemberID`) VALUES
(1, 'SilverStripe\\Security\\MemberPassword', '2025-06-26 17:02:42', '2025-06-26 17:02:42', '$2y$10$15c60dddd0aa177c4f7d4u3iQDbU89os0Pj/sbmFFU3dw22qNueIy', '10$15c60dddd0aa177c4f7d42', 'blowfish', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Permission`
--

CREATE TABLE `Permission` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Security\\Permission') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Security\\Permission',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Arg` int(11) NOT NULL DEFAULT 0,
  `Type` int(11) NOT NULL DEFAULT 1,
  `GroupID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `Permission`
--

INSERT INTO `Permission` (`ID`, `ClassName`, `LastEdited`, `Created`, `Code`, `Arg`, `Type`, `GroupID`) VALUES
(1, 'SilverStripe\\Security\\Permission', '2025-06-26 16:58:19', '2025-06-26 16:58:19', 'CMS_ACCESS_CMSMain', 0, 1, 1),
(2, 'SilverStripe\\Security\\Permission', '2025-06-26 16:58:19', '2025-06-26 16:58:19', 'CMS_ACCESS_AssetAdmin', 0, 1, 1),
(3, 'SilverStripe\\Security\\Permission', '2025-06-26 16:58:19', '2025-06-26 16:58:19', 'CMS_ACCESS_ReportAdmin', 0, 1, 1),
(4, 'SilverStripe\\Security\\Permission', '2025-06-26 16:58:19', '2025-06-26 16:58:19', 'SITETREE_REORGANISE', 0, 1, 1),
(5, 'SilverStripe\\Security\\Permission', '2025-06-26 16:58:19', '2025-06-26 16:58:19', 'ADMIN', 0, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionRole`
--

CREATE TABLE `PermissionRole` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Security\\PermissionRole') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Security\\PermissionRole',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OnlyAdminCanApply` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PermissionRoleCode`
--

CREATE TABLE `PermissionRoleCode` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Security\\PermissionRoleCode') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Security\\PermissionRoleCode',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RoleID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage`
--

CREATE TABLE `RedirectorPage` (
  `ID` int(11) NOT NULL,
  `RedirectionType` enum('Internal','External','File') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT 0,
  `LinkToFileID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage_Live`
--

CREATE TABLE `RedirectorPage_Live` (
  `ID` int(11) NOT NULL,
  `RedirectionType` enum('Internal','External','File') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT 0,
  `LinkToFileID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage_Versions`
--

CREATE TABLE `RedirectorPage_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `RedirectionType` enum('Internal','External','File') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT 0,
  `LinkToFileID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `RememberLoginHash`
--

CREATE TABLE `RememberLoginHash` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Security\\RememberLoginHash') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Security\\RememberLoginHash',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `DeviceID` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Hash` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `LoginSessionID` int(11) NOT NULL DEFAULT 0,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig`
--

CREATE TABLE `SiteConfig` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\SiteConfig\\SiteConfig') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\SiteConfig\\SiteConfig',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tagline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Anyone',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'LoggedInUsers',
  `CanCreateTopLevelType` enum('LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'LoggedInUsers'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `SiteConfig`
--

INSERT INTO `SiteConfig` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `Tagline`, `CanViewType`, `CanEditType`, `CanCreateTopLevelType`) VALUES
(1, 'SilverStripe\\SiteConfig\\SiteConfig', '2025-06-26 16:58:19', '2025-06-26 16:58:19', 'Your Site Name', 'your tagline here', 'Anyone', 'LoggedInUsers', 'LoggedInUsers');

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_CreateTopLevelGroups`
--

CREATE TABLE `SiteConfig_CreateTopLevelGroups` (
  `ID` int(11) NOT NULL,
  `SiteConfigID` int(11) NOT NULL DEFAULT 0,
  `GroupID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_CreateTopLevelMembers`
--

CREATE TABLE `SiteConfig_CreateTopLevelMembers` (
  `ID` int(11) NOT NULL,
  `SiteConfigID` int(11) NOT NULL DEFAULT 0,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_EditorGroups`
--

CREATE TABLE `SiteConfig_EditorGroups` (
  `ID` int(11) NOT NULL,
  `SiteConfigID` int(11) NOT NULL DEFAULT 0,
  `GroupID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_EditorMembers`
--

CREATE TABLE `SiteConfig_EditorMembers` (
  `ID` int(11) NOT NULL,
  `SiteConfigID` int(11) NOT NULL DEFAULT 0,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_ViewerGroups`
--

CREATE TABLE `SiteConfig_ViewerGroups` (
  `ID` int(11) NOT NULL,
  `SiteConfigID` int(11) NOT NULL DEFAULT 0,
  `GroupID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_ViewerMembers`
--

CREATE TABLE `SiteConfig_ViewerMembers` (
  `ID` int(11) NOT NULL,
  `SiteConfigID` int(11) NOT NULL DEFAULT 0,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree`
--

CREATE TABLE `SiteTree` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\CMS\\Model\\SiteTree','Page','SilverStripe\\ErrorPage\\ErrorPage','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Page',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT 0,
  `URLSegment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MetaDescription` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExtraMeta` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowInMenus` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Sort` int(11) NOT NULL DEFAULT 0,
  `HasBrokenFile` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `HasBrokenLink` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `ReportClass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `SiteTree`
--

INSERT INTO `SiteTree` (`ID`, `ClassName`, `LastEdited`, `Created`, `CanViewType`, `CanEditType`, `Version`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `ParentID`) VALUES
(1, 'Page', '2025-06-26 16:58:19', '2025-06-26 16:58:19', 'Inherit', 'Inherit', 2, 'home', 'Home', NULL, '<p>Welcome to Silverstripe! This is the default homepage. You can edit this page by opening <a href=\"admin/\">the CMS</a>.</p><p>For comprehensive information on Silverstripe CMS, see the <a target=\"_blank\" href=\"http://docs.silverstripe.org\">developer documentation</a>.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 0),
(2, 'Page', '2025-06-26 16:58:19', '2025-06-26 16:58:19', 'Inherit', 'Inherit', 2, 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 0),
(3, 'Page', '2025-06-26 16:58:19', '2025-06-26 16:58:19', 'Inherit', 'Inherit', 2, 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 0),
(4, 'SilverStripe\\ErrorPage\\ErrorPage', '2025-06-26 16:58:19', '2025-06-26 16:58:19', 'Inherit', 'Inherit', 2, 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 4, 0, 0, NULL, 0),
(5, 'SilverStripe\\ErrorPage\\ErrorPage', '2025-06-26 16:58:20', '2025-06-26 16:58:20', 'Inherit', 'Inherit', 2, 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTreeLink`
--

CREATE TABLE `SiteTreeLink` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\CMS\\Model\\SiteTreeLink') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\CMS\\Model\\SiteTreeLink',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `LinkedID` int(11) NOT NULL DEFAULT 0,
  `ParentID` int(11) NOT NULL DEFAULT 0,
  `ParentClass` enum('SilverStripe\\Assets\\File','SilverStripe\\SiteConfig\\SiteConfig','SilverStripe\\Versioned\\ChangeSet','SilverStripe\\Versioned\\ChangeSetItem','SilverStripe\\Assets\\Shortcodes\\FileLink','SilverStripe\\CMS\\Model\\SiteTree','SilverStripe\\CMS\\Model\\SiteTreeLink','SilverStripe\\Security\\Group','SilverStripe\\Security\\LoginAttempt','SilverStripe\\Security\\Member','SilverStripe\\Security\\MemberPassword','SilverStripe\\Security\\Permission','SilverStripe\\Security\\PermissionRole','SilverStripe\\Security\\PermissionRoleCode','SilverStripe\\Security\\RememberLoginHash','SilverStripe\\SessionManager\\Models\\LoginSession','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image','Page','SilverStripe\\ErrorPage\\ErrorPage','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\File'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_EditorGroups`
--

CREATE TABLE `SiteTree_EditorGroups` (
  `ID` int(11) NOT NULL,
  `SiteTreeID` int(11) NOT NULL DEFAULT 0,
  `GroupID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_EditorMembers`
--

CREATE TABLE `SiteTree_EditorMembers` (
  `ID` int(11) NOT NULL,
  `SiteTreeID` int(11) NOT NULL DEFAULT 0,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_Live`
--

CREATE TABLE `SiteTree_Live` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\CMS\\Model\\SiteTree','Page','SilverStripe\\ErrorPage\\ErrorPage','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Page',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT 0,
  `URLSegment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MetaDescription` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExtraMeta` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowInMenus` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Sort` int(11) NOT NULL DEFAULT 0,
  `HasBrokenFile` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `HasBrokenLink` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `ReportClass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `SiteTree_Live`
--

INSERT INTO `SiteTree_Live` (`ID`, `ClassName`, `LastEdited`, `Created`, `CanViewType`, `CanEditType`, `Version`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `ParentID`) VALUES
(1, 'Page', '2025-06-26 16:58:19', '2025-06-26 16:58:19', 'Inherit', 'Inherit', 2, 'home', 'Home', NULL, '<p>Welcome to Silverstripe! This is the default homepage. You can edit this page by opening <a href=\"admin/\">the CMS</a>.</p><p>For comprehensive information on Silverstripe CMS, see the <a target=\"_blank\" href=\"http://docs.silverstripe.org\">developer documentation</a>.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 0),
(2, 'Page', '2025-06-26 16:58:19', '2025-06-26 16:58:19', 'Inherit', 'Inherit', 2, 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 0),
(3, 'Page', '2025-06-26 16:58:19', '2025-06-26 16:58:19', 'Inherit', 'Inherit', 2, 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 0),
(4, 'SilverStripe\\ErrorPage\\ErrorPage', '2025-06-26 16:58:19', '2025-06-26 16:58:19', 'Inherit', 'Inherit', 2, 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 4, 0, 0, NULL, 0),
(5, 'SilverStripe\\ErrorPage\\ErrorPage', '2025-06-26 16:58:20', '2025-06-26 16:58:20', 'Inherit', 'Inherit', 2, 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_Versions`
--

CREATE TABLE `SiteTree_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `WasPublished` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `WasDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `WasDraft` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `AuthorID` int(11) NOT NULL DEFAULT 0,
  `PublisherID` int(11) NOT NULL DEFAULT 0,
  `ClassName` enum('SilverStripe\\CMS\\Model\\SiteTree','Page','SilverStripe\\ErrorPage\\ErrorPage','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Page',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `URLSegment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MetaDescription` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExtraMeta` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowInMenus` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Sort` int(11) NOT NULL DEFAULT 0,
  `HasBrokenFile` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `HasBrokenLink` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `ReportClass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `SiteTree_Versions`
--

INSERT INTO `SiteTree_Versions` (`ID`, `RecordID`, `Version`, `WasPublished`, `WasDeleted`, `WasDraft`, `AuthorID`, `PublisherID`, `ClassName`, `LastEdited`, `Created`, `CanViewType`, `CanEditType`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `ParentID`) VALUES
(1, 1, 1, 0, 0, 1, 0, 0, 'Page', '2025-06-26 16:58:19', '2025-06-26 16:58:19', 'Inherit', 'Inherit', 'home', 'Home', NULL, '<p>Welcome to Silverstripe! This is the default homepage. You can edit this page by opening <a href=\"admin/\">the CMS</a>.</p><p>For comprehensive information on Silverstripe CMS, see the <a target=\"_blank\" href=\"http://docs.silverstripe.org\">developer documentation</a>.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 0),
(2, 1, 2, 1, 0, 1, 0, 0, 'Page', '2025-06-26 16:58:19', '2025-06-26 16:58:19', 'Inherit', 'Inherit', 'home', 'Home', NULL, '<p>Welcome to Silverstripe! This is the default homepage. You can edit this page by opening <a href=\"admin/\">the CMS</a>.</p><p>For comprehensive information on Silverstripe CMS, see the <a target=\"_blank\" href=\"http://docs.silverstripe.org\">developer documentation</a>.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 0),
(3, 2, 1, 0, 0, 1, 0, 0, 'Page', '2025-06-26 16:58:19', '2025-06-26 16:58:19', 'Inherit', 'Inherit', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 0),
(4, 2, 2, 1, 0, 1, 0, 0, 'Page', '2025-06-26 16:58:19', '2025-06-26 16:58:19', 'Inherit', 'Inherit', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 0),
(5, 3, 1, 0, 0, 1, 0, 0, 'Page', '2025-06-26 16:58:19', '2025-06-26 16:58:19', 'Inherit', 'Inherit', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 0),
(6, 3, 2, 1, 0, 1, 0, 0, 'Page', '2025-06-26 16:58:19', '2025-06-26 16:58:19', 'Inherit', 'Inherit', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 0),
(7, 4, 1, 0, 0, 1, 0, 0, 'SilverStripe\\ErrorPage\\ErrorPage', '2025-06-26 16:58:19', '2025-06-26 16:58:19', 'Inherit', 'Inherit', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 4, 0, 0, NULL, 0),
(8, 4, 2, 1, 0, 1, 0, 0, 'SilverStripe\\ErrorPage\\ErrorPage', '2025-06-26 16:58:19', '2025-06-26 16:58:19', 'Inherit', 'Inherit', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 4, 0, 0, NULL, 0),
(9, 5, 1, 0, 0, 1, 0, 0, 'SilverStripe\\ErrorPage\\ErrorPage', '2025-06-26 16:58:20', '2025-06-26 16:58:20', 'Inherit', 'Inherit', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 0),
(10, 5, 2, 1, 0, 1, 0, 0, 'SilverStripe\\ErrorPage\\ErrorPage', '2025-06-26 16:58:20', '2025-06-26 16:58:20', 'Inherit', 'Inherit', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_ViewerGroups`
--

CREATE TABLE `SiteTree_ViewerGroups` (
  `ID` int(11) NOT NULL,
  `SiteTreeID` int(11) NOT NULL DEFAULT 0,
  `GroupID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_ViewerMembers`
--

CREATE TABLE `SiteTree_ViewerMembers` (
  `ID` int(11) NOT NULL,
  `SiteTreeID` int(11) NOT NULL DEFAULT 0,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage`
--

CREATE TABLE `VirtualPage` (
  `ID` int(11) NOT NULL,
  `VersionID` int(11) NOT NULL DEFAULT 0,
  `CopyContentFromID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage_Live`
--

CREATE TABLE `VirtualPage_Live` (
  `ID` int(11) NOT NULL,
  `VersionID` int(11) NOT NULL DEFAULT 0,
  `CopyContentFromID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage_Versions`
--

CREATE TABLE `VirtualPage_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `VersionID` int(11) NOT NULL DEFAULT 0,
  `CopyContentFromID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ChangeSet`
--
ALTER TABLE `ChangeSet`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `State` (`State`),
  ADD KEY `ID` (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `OwnerID` (`OwnerID`),
  ADD KEY `PublisherID` (`PublisherID`);

--
-- Indexes for table `ChangeSetItem`
--
ALTER TABLE `ChangeSetItem`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ObjectUniquePerChangeSet` (`ObjectID`,`ObjectClass`,`ChangeSetID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ChangeSetID` (`ChangeSetID`),
  ADD KEY `Object` (`ObjectID`,`ObjectClass`);

--
-- Indexes for table `ChangeSetItem_ReferencedBy`
--
ALTER TABLE `ChangeSetItem_ReferencedBy`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ChangeSetItemID` (`ChangeSetItemID`),
  ADD KEY `ChildID` (`ChildID`);

--
-- Indexes for table `ErrorPage`
--
ALTER TABLE `ErrorPage`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ErrorPage_Live`
--
ALTER TABLE `ErrorPage_Live`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ErrorPage_Versions`
--
ALTER TABLE `ErrorPage_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`);

--
-- Indexes for table `File`
--
ALTER TABLE `File`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Name` (`Name`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `OwnerID` (`OwnerID`),
  ADD KEY `FileHash` (`FileHash`);

--
-- Indexes for table `FileLink`
--
ALTER TABLE `FileLink`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `LinkedID` (`LinkedID`),
  ADD KEY `Parent` (`ParentID`,`ParentClass`);

--
-- Indexes for table `File_EditorGroups`
--
ALTER TABLE `File_EditorGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FileID` (`FileID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indexes for table `File_EditorMembers`
--
ALTER TABLE `File_EditorMembers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FileID` (`FileID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `File_Live`
--
ALTER TABLE `File_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Name` (`Name`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `OwnerID` (`OwnerID`),
  ADD KEY `FileHash` (`FileHash`);

--
-- Indexes for table `File_Versions`
--
ALTER TABLE `File_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `AuthorID` (`AuthorID`),
  ADD KEY `PublisherID` (`PublisherID`),
  ADD KEY `Name` (`Name`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `OwnerID` (`OwnerID`),
  ADD KEY `FileHash` (`FileHash`);

--
-- Indexes for table `File_ViewerGroups`
--
ALTER TABLE `File_ViewerGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FileID` (`FileID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indexes for table `File_ViewerMembers`
--
ALTER TABLE `File_ViewerMembers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FileID` (`FileID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `Group`
--
ALTER TABLE `Group`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `Title` (`Title`),
  ADD KEY `Code` (`Code`),
  ADD KEY `Sort` (`Sort`);

--
-- Indexes for table `Group_Members`
--
ALTER TABLE `Group_Members`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `GroupID` (`GroupID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `Group_Roles`
--
ALTER TABLE `Group_Roles`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `GroupID` (`GroupID`),
  ADD KEY `PermissionRoleID` (`PermissionRoleID`);

--
-- Indexes for table `LoginAttempt`
--
ALTER TABLE `LoginAttempt`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `MemberID` (`MemberID`),
  ADD KEY `EmailHashed` (`EmailHashed`);

--
-- Indexes for table `LoginSession`
--
ALTER TABLE `LoginSession`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `LastAccessed` (`LastAccessed`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `Member`
--
ALTER TABLE `Member`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Surname` (`Surname`),
  ADD KEY `FirstName` (`FirstName`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `Email` (`Email`);

--
-- Indexes for table `MemberPassword`
--
ALTER TABLE `MemberPassword`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `Permission`
--
ALTER TABLE `Permission`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `GroupID` (`GroupID`),
  ADD KEY `Code` (`Code`);

--
-- Indexes for table `PermissionRole`
--
ALTER TABLE `PermissionRole`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Title` (`Title`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `PermissionRoleCode`
--
ALTER TABLE `PermissionRoleCode`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `RoleID` (`RoleID`),
  ADD KEY `Code` (`Code`);

--
-- Indexes for table `RedirectorPage`
--
ALTER TABLE `RedirectorPage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `LinkToID` (`LinkToID`),
  ADD KEY `LinkToFileID` (`LinkToFileID`);

--
-- Indexes for table `RedirectorPage_Live`
--
ALTER TABLE `RedirectorPage_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `LinkToID` (`LinkToID`),
  ADD KEY `LinkToFileID` (`LinkToFileID`);

--
-- Indexes for table `RedirectorPage_Versions`
--
ALTER TABLE `RedirectorPage_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `LinkToID` (`LinkToID`),
  ADD KEY `LinkToFileID` (`LinkToFileID`);

--
-- Indexes for table `RememberLoginHash`
--
ALTER TABLE `RememberLoginHash`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `LoginSessionID` (`LoginSessionID`),
  ADD KEY `MemberID` (`MemberID`),
  ADD KEY `DeviceID` (`DeviceID`),
  ADD KEY `Hash` (`Hash`);

--
-- Indexes for table `SiteConfig`
--
ALTER TABLE `SiteConfig`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `SiteConfig_CreateTopLevelGroups`
--
ALTER TABLE `SiteConfig_CreateTopLevelGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteConfigID` (`SiteConfigID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indexes for table `SiteConfig_CreateTopLevelMembers`
--
ALTER TABLE `SiteConfig_CreateTopLevelMembers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteConfigID` (`SiteConfigID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `SiteConfig_EditorGroups`
--
ALTER TABLE `SiteConfig_EditorGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteConfigID` (`SiteConfigID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indexes for table `SiteConfig_EditorMembers`
--
ALTER TABLE `SiteConfig_EditorMembers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteConfigID` (`SiteConfigID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `SiteConfig_ViewerGroups`
--
ALTER TABLE `SiteConfig_ViewerGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteConfigID` (`SiteConfigID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indexes for table `SiteConfig_ViewerMembers`
--
ALTER TABLE `SiteConfig_ViewerMembers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteConfigID` (`SiteConfigID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `SiteTree`
--
ALTER TABLE `SiteTree`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Sort` (`Sort`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `URLSegment` (`URLSegment`);

--
-- Indexes for table `SiteTreeLink`
--
ALTER TABLE `SiteTreeLink`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `LinkedID` (`LinkedID`),
  ADD KEY `Parent` (`ParentID`,`ParentClass`);

--
-- Indexes for table `SiteTree_EditorGroups`
--
ALTER TABLE `SiteTree_EditorGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteTreeID` (`SiteTreeID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indexes for table `SiteTree_EditorMembers`
--
ALTER TABLE `SiteTree_EditorMembers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteTreeID` (`SiteTreeID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `SiteTree_Live`
--
ALTER TABLE `SiteTree_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Sort` (`Sort`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `URLSegment` (`URLSegment`);

--
-- Indexes for table `SiteTree_Versions`
--
ALTER TABLE `SiteTree_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `AuthorID` (`AuthorID`),
  ADD KEY `PublisherID` (`PublisherID`),
  ADD KEY `Sort` (`Sort`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `URLSegment` (`URLSegment`);

--
-- Indexes for table `SiteTree_ViewerGroups`
--
ALTER TABLE `SiteTree_ViewerGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteTreeID` (`SiteTreeID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indexes for table `SiteTree_ViewerMembers`
--
ALTER TABLE `SiteTree_ViewerMembers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteTreeID` (`SiteTreeID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `VirtualPage`
--
ALTER TABLE `VirtualPage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CopyContentFromID` (`CopyContentFromID`);

--
-- Indexes for table `VirtualPage_Live`
--
ALTER TABLE `VirtualPage_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CopyContentFromID` (`CopyContentFromID`);

--
-- Indexes for table `VirtualPage_Versions`
--
ALTER TABLE `VirtualPage_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `CopyContentFromID` (`CopyContentFromID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ChangeSet`
--
ALTER TABLE `ChangeSet`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ChangeSetItem`
--
ALTER TABLE `ChangeSetItem`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ChangeSetItem_ReferencedBy`
--
ALTER TABLE `ChangeSetItem_ReferencedBy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ErrorPage`
--
ALTER TABLE `ErrorPage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ErrorPage_Live`
--
ALTER TABLE `ErrorPage_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ErrorPage_Versions`
--
ALTER TABLE `ErrorPage_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `File`
--
ALTER TABLE `File`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `FileLink`
--
ALTER TABLE `FileLink`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `File_EditorGroups`
--
ALTER TABLE `File_EditorGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `File_EditorMembers`
--
ALTER TABLE `File_EditorMembers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `File_Live`
--
ALTER TABLE `File_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `File_Versions`
--
ALTER TABLE `File_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `File_ViewerGroups`
--
ALTER TABLE `File_ViewerGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `File_ViewerMembers`
--
ALTER TABLE `File_ViewerMembers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Group`
--
ALTER TABLE `Group`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Group_Members`
--
ALTER TABLE `Group_Members`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Group_Roles`
--
ALTER TABLE `Group_Roles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `LoginAttempt`
--
ALTER TABLE `LoginAttempt`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `LoginSession`
--
ALTER TABLE `LoginSession`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Member`
--
ALTER TABLE `Member`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `MemberPassword`
--
ALTER TABLE `MemberPassword`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Permission`
--
ALTER TABLE `Permission`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `PermissionRole`
--
ALTER TABLE `PermissionRole`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PermissionRoleCode`
--
ALTER TABLE `PermissionRoleCode`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `RedirectorPage`
--
ALTER TABLE `RedirectorPage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `RedirectorPage_Live`
--
ALTER TABLE `RedirectorPage_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `RedirectorPage_Versions`
--
ALTER TABLE `RedirectorPage_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `RememberLoginHash`
--
ALTER TABLE `RememberLoginHash`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SiteConfig`
--
ALTER TABLE `SiteConfig`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `SiteConfig_CreateTopLevelGroups`
--
ALTER TABLE `SiteConfig_CreateTopLevelGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SiteConfig_CreateTopLevelMembers`
--
ALTER TABLE `SiteConfig_CreateTopLevelMembers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SiteConfig_EditorGroups`
--
ALTER TABLE `SiteConfig_EditorGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SiteConfig_EditorMembers`
--
ALTER TABLE `SiteConfig_EditorMembers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SiteConfig_ViewerGroups`
--
ALTER TABLE `SiteConfig_ViewerGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SiteConfig_ViewerMembers`
--
ALTER TABLE `SiteConfig_ViewerMembers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SiteTree`
--
ALTER TABLE `SiteTree`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `SiteTreeLink`
--
ALTER TABLE `SiteTreeLink`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SiteTree_EditorGroups`
--
ALTER TABLE `SiteTree_EditorGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SiteTree_EditorMembers`
--
ALTER TABLE `SiteTree_EditorMembers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SiteTree_Live`
--
ALTER TABLE `SiteTree_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `SiteTree_Versions`
--
ALTER TABLE `SiteTree_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `SiteTree_ViewerGroups`
--
ALTER TABLE `SiteTree_ViewerGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SiteTree_ViewerMembers`
--
ALTER TABLE `SiteTree_ViewerMembers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VirtualPage`
--
ALTER TABLE `VirtualPage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VirtualPage_Live`
--
ALTER TABLE `VirtualPage_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VirtualPage_Versions`
--
ALTER TABLE `VirtualPage_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
