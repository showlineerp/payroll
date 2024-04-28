-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2024 at 09:44 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hr`
--

-- --------------------------------------------------------

--
-- Table structure for table `allowances`
--

CREATE TABLE `allowances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` varchar(255) NOT NULL,
  `month_year` varchar(191) NOT NULL,
  `first_date` date DEFAULT NULL,
  `allowance_title` varchar(255) NOT NULL,
  `allowance_amount` varchar(255) NOT NULL,
  `currency_id` varchar(255) NOT NULL,
  `currency_symbol` varchar(255) NOT NULL,
  `is_taxable` tinyint(1) NOT NULL,
  `is_recurring` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `employee_group` varchar(255) NOT NULL,
  `deductible_amt` double NOT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `allowances`
--

INSERT INTO `allowances` (`id`, `employee_id`, `month_year`, `first_date`, `allowance_title`, `allowance_amount`, `currency_id`, `currency_symbol`, `is_taxable`, `is_recurring`, `created_at`, `updated_at`, `employee_group`, `deductible_amt`, `department_id`, `company_id`) VALUES
(2, '64,65,66,67,68,64,64', 'March-2024', '2024-03-01', 'New', '10', '1', '$', 1, 0, '2024-03-13 13:16:11', '2024-03-14 05:26:47', '', 10, 1, 1),
(3, '64,66,67,64', 'March-2024', '2024-03-01', 'New', '100', '1', '$', 1, 1, '2024-03-13 13:19:31', '2024-03-14 05:13:09', '', 10, 0, 0),
(4, '65,66,64,64', 'March-2024', '2024-03-01', 'tO ALL', '100', '1', '$', 1, 0, '2024-03-13 14:29:35', '2024-03-14 05:29:43', '', 10, 0, 0),
(5, '64,65,66,64,64,64', 'March-2024', '2024-03-01', 'New Allownace', '1000', '1', '$', 1, 1, '2024-03-13 15:20:54', '2024-03-14 05:37:23', '1', 10, 0, 1),
(6, '64,65,66,67,68', 'April-2024', '2024-04-01', 'hjkl;', '10', '1', '$', 1, 1, '2024-04-28 11:12:50', '2024-04-28 11:12:50', '1', 10, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` varchar(40) DEFAULT NULL,
  `is_notify` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appraisals`
--

CREATE TABLE `appraisals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `designation_id` bigint(20) UNSIGNED NOT NULL,
  `customer_experience` varchar(191) NOT NULL,
  `marketing` varchar(191) DEFAULT NULL,
  `administration` varchar(191) DEFAULT NULL,
  `professionalism` varchar(191) DEFAULT NULL,
  `integrity` varchar(191) DEFAULT NULL,
  `attendance` varchar(191) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `date` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `asset_name` varchar(50) NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `asset_code` varchar(80) NOT NULL,
  `assets_category_id` bigint(20) UNSIGNED NOT NULL,
  `Asset_note` mediumtext DEFAULT NULL,
  `manufacturer` varchar(191) NOT NULL,
  `serial_number` varchar(191) NOT NULL,
  `invoice_number` varchar(191) NOT NULL,
  `asset_image` varchar(191) DEFAULT NULL,
  `purchase_date` date NOT NULL,
  `warranty_date` date NOT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset_categories`
--

CREATE TABLE `asset_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `attendance_date` date NOT NULL,
  `clock_in` varchar(191) NOT NULL,
  `clock_in_ip` varchar(45) NOT NULL,
  `clock_out` varchar(191) NOT NULL,
  `clock_out_ip` varchar(45) NOT NULL,
  `clock_in_out` tinyint(4) NOT NULL,
  `time_late` varchar(191) NOT NULL DEFAULT '00:00',
  `early_leaving` varchar(191) NOT NULL DEFAULT '00:00',
  `overtime` varchar(191) NOT NULL DEFAULT '00:00',
  `total_work` varchar(191) NOT NULL DEFAULT '00:00',
  `total_rest` varchar(191) NOT NULL DEFAULT '00:00',
  `attendance_status` varchar(191) NOT NULL DEFAULT 'present'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

CREATE TABLE `awards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `award_information` mediumtext DEFAULT NULL,
  `award_date` date NOT NULL,
  `gift` varchar(40) DEFAULT NULL,
  `cash` varchar(40) DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `award_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `award_photo` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `award_types`
--

CREATE TABLE `award_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `award_name` varchar(40) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `calendarables`
--

CREATE TABLE `calendarables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `candidate_interview`
--

CREATE TABLE `candidate_interview` (
  `interview_id` bigint(20) UNSIGNED NOT NULL,
  `candidate_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `contact_no` varchar(15) NOT NULL,
  `username` varchar(64) NOT NULL,
  `profile` varchar(191) DEFAULT NULL,
  `company_name` varchar(191) NOT NULL,
  `gender` varchar(40) NOT NULL,
  `website` varchar(40) DEFAULT NULL,
  `address1` mediumtext DEFAULT NULL,
  `address2` mediumtext DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `zip` varchar(191) DEFAULT NULL,
  `country` tinyint(4) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(191) NOT NULL,
  `company_type` varchar(191) NOT NULL,
  `trading_name` varchar(191) DEFAULT NULL,
  `registration_no` varchar(191) DEFAULT NULL,
  `contact_no` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `website` varchar(191) DEFAULT NULL,
  `tax_no` varchar(191) DEFAULT NULL,
  `location_id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_logo` varchar(191) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `company_name`, `company_type`, `trading_name`, `registration_no`, `contact_no`, `email`, `website`, `tax_no`, `location_id`, `company_logo`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Havano', 'limited liability company', '', '', '787687032', 'havano@havano.online', '', '157265', 1, NULL, NULL, '2024-02-10 13:29:26', '2024-02-10 13:29:26'),
(2, 'Havano Solar', 'corporation', 'Havano Solar', '', '7678032', 'try@gmail.com', '', '157265', 1, NULL, NULL, '2024-03-06 01:41:00', '2024-03-06 01:41:00');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `complaint_title` varchar(40) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `complaint_from` bigint(20) UNSIGNED NOT NULL,
  `complaint_against` bigint(20) UNSIGNED NOT NULL,
  `complaint_date` date NOT NULL,
  `status` varchar(40) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`) VALUES
(1, 'US', 'United States'),
(2, 'CA', 'Canada'),
(3, 'AF', 'Afghanistan'),
(4, 'AL', 'Albania'),
(5, 'DZ', 'Algeria'),
(6, 'DS', 'American Samoa'),
(7, 'AD', 'Andorra'),
(8, 'AO', 'Angola'),
(9, 'AI', 'Anguilla'),
(10, 'AQ', 'Antarctica'),
(11, 'AG', 'Antigua and/or Barbuda'),
(12, 'AR', 'Argentina'),
(13, 'AM', 'Armenia'),
(14, 'AW', 'Aruba'),
(15, 'AU', 'Australia'),
(16, 'AT', 'Austria'),
(17, 'AZ', 'Azerbaijan'),
(18, 'BS', 'Bahamas'),
(19, 'BH', 'Bahrain'),
(20, 'BD', 'Bangladesh'),
(21, 'BB', 'Barbados'),
(22, 'BY', 'Belarus'),
(23, 'BE', 'Belgium'),
(24, 'BZ', 'Belize'),
(25, 'BJ', 'Benin'),
(26, 'BM', 'Bermuda'),
(27, 'BT', 'Bhutan'),
(28, 'BO', 'Bolivia'),
(29, 'BA', 'Bosnia and Herzegovina'),
(30, 'BW', 'Botswana'),
(31, 'BV', 'Bouvet Island'),
(32, 'BR', 'Brazil'),
(33, 'IO', 'British lndian Ocean Territory'),
(34, 'BN', 'Brunei Darussalam'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'KH', 'Cambodia'),
(39, 'CM', 'Cameroon'),
(40, 'CV', 'Cape Verde'),
(41, 'KY', 'Cayman Islands'),
(42, 'CF', 'Central African Republic'),
(43, 'TD', 'Chad'),
(44, 'CL', 'Chile'),
(45, 'CN', 'China'),
(46, 'CX', 'Christmas Island'),
(47, 'CC', 'Cocos (Keeling) Islands'),
(48, 'CO', 'Colombia'),
(49, 'KM', 'Comoros'),
(50, 'CG', 'Congo'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'HR', 'Croatia (Hrvatska)'),
(54, 'CU', 'Cuba'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DK', 'Denmark'),
(58, 'DJ', 'Djibouti'),
(59, 'DM', 'Dominica'),
(60, 'DO', 'Dominican Republic'),
(61, 'TP', 'East Timor'),
(62, 'EC', 'Ecudaor'),
(63, 'EG', 'Egypt'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Equatorial Guinea'),
(66, 'ER', 'Eritrea'),
(67, 'EE', 'Estonia'),
(68, 'ET', 'Ethiopia'),
(69, 'FK', 'Falkland Islands (Malvinas)'),
(70, 'FO', 'Faroe Islands'),
(71, 'FJ', 'Fiji'),
(72, 'FI', 'Finland'),
(73, 'FR', 'France'),
(74, 'FX', 'France, Metropolitan'),
(75, 'GF', 'French Guiana'),
(76, 'PF', 'French Polynesia'),
(77, 'TF', 'French Southern Territories'),
(78, 'GA', 'Gabon'),
(79, 'GM', 'Gambia'),
(80, 'GE', 'Georgia'),
(81, 'DE', 'Germany'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GR', 'Greece'),
(85, 'GL', 'Greenland'),
(86, 'GD', 'Grenada'),
(87, 'GP', 'Guadeloupe'),
(88, 'GU', 'Guam'),
(89, 'GT', 'Guatemala'),
(90, 'GN', 'Guinea'),
(91, 'GW', 'Guinea-Bissau'),
(92, 'GY', 'Guyana'),
(93, 'HT', 'Haiti'),
(94, 'HM', 'Heard and Mc Donald Islands'),
(95, 'HN', 'Honduras'),
(96, 'HK', 'Hong Kong'),
(97, 'HU', 'Hungary'),
(98, 'IS', 'Iceland'),
(99, 'IN', 'India'),
(100, 'ID', 'Indonesia'),
(101, 'IR', 'Iran (Islamic Republic of)'),
(102, 'IQ', 'Iraq'),
(103, 'IE', 'Ireland'),
(104, 'IL', 'Israel'),
(105, 'IT', 'Italy'),
(106, 'CI', 'Ivory Coast'),
(107, 'JM', 'Jamaica'),
(108, 'JP', 'Japan'),
(109, 'JO', 'Jordan'),
(110, 'KZ', 'Kazakhstan'),
(111, 'KE', 'Kenya'),
(112, 'KI', 'Kiribati'),
(113, 'KP', 'Korea, Democratic People\'s Republic of'),
(114, 'KR', 'Korea, Republic of'),
(115, 'KW', 'Kuwait'),
(116, 'KG', 'Kyrgyzstan'),
(117, 'LA', 'Lao People\'s Democratic Republic'),
(118, 'LV', 'Latvia'),
(119, 'LB', 'Lebanon'),
(120, 'LS', 'Lesotho'),
(121, 'LR', 'Liberia'),
(122, 'LY', 'Libyan Arab Jamahiriya'),
(123, 'LI', 'Liechtenstein'),
(124, 'LT', 'Lithuania'),
(125, 'LU', 'Luxembourg'),
(126, 'MO', 'Macau'),
(127, 'MK', 'Macedonia'),
(128, 'MG', 'Madagascar'),
(129, 'MW', 'Malawi'),
(130, 'MY', 'Malaysia'),
(131, 'MV', 'Maldives'),
(132, 'ML', 'Mali'),
(133, 'MT', 'Malta'),
(134, 'MH', 'Marshall Islands'),
(135, 'MQ', 'Martinique'),
(136, 'MR', 'Mauritania'),
(137, 'MU', 'Mauritius'),
(138, 'TY', 'Mayotte'),
(139, 'MX', 'Mexico'),
(140, 'FM', 'Micronesia, Federated States of'),
(141, 'MD', 'Moldova, Republic of'),
(142, 'MC', 'Monaco'),
(143, 'MN', 'Mongolia'),
(144, 'MS', 'Montserrat'),
(145, 'MA', 'Morocco'),
(146, 'MZ', 'Mozambique'),
(147, 'MM', 'Myanmar'),
(148, 'NA', 'Namibia'),
(149, 'NR', 'Nauru'),
(150, 'NP', 'Nepal'),
(151, 'NL', 'Netherlands'),
(152, 'AN', 'Netherlands Antilles'),
(153, 'NC', 'New Caledonia'),
(154, 'NZ', 'New Zealand'),
(155, 'NI', 'Nicaragua'),
(156, 'NE', 'Niger'),
(157, 'NG', 'Nigeria'),
(158, 'NU', 'Niue'),
(159, 'NF', 'Norfork Island'),
(160, 'MP', 'Northern Mariana Islands'),
(161, 'NO', 'Norway'),
(162, 'OM', 'Oman'),
(163, 'PK', 'Pakistan'),
(164, 'PW', 'Palau'),
(165, 'PA', 'Panama'),
(166, 'PG', 'Papua New Guinea'),
(167, 'PY', 'Paraguay'),
(168, 'PE', 'Peru'),
(169, 'PH', 'Philippines'),
(170, 'PN', 'Pitcairn'),
(171, 'PL', 'Poland'),
(172, 'PT', 'Portugal'),
(173, 'PR', 'Puerto Rico'),
(174, 'QA', 'Qatar'),
(175, 'RE', 'Reunion'),
(176, 'RO', 'Romania'),
(177, 'RU', 'Russian Federation'),
(178, 'RW', 'Rwanda'),
(179, 'KN', 'Saint Kitts and Nevis'),
(180, 'LC', 'Saint Lucia'),
(181, 'VC', 'Saint Vincent and the Grenadines'),
(182, 'WS', 'Samoa'),
(183, 'SM', 'San Marino'),
(184, 'ST', 'Sao Tome and Principe'),
(185, 'SA', 'Saudi Arabia'),
(186, 'SN', 'Senegal'),
(187, 'SC', 'Seychelles'),
(188, 'SL', 'Sierra Leone'),
(189, 'SG', 'Singapore'),
(190, 'SK', 'Slovakia'),
(191, 'SI', 'Slovenia'),
(192, 'SB', 'Solomon Islands'),
(193, 'SO', 'Somalia'),
(194, 'ZA', 'South Africa'),
(195, 'GS', 'South Georgia South Sandwich Islands'),
(196, 'ES', 'Spain'),
(197, 'LK', 'Sri Lanka'),
(198, 'SH', 'St. Helena'),
(199, 'PM', 'St. Pierre and Miquelon'),
(200, 'SD', 'Sudan'),
(201, 'SR', 'Suriname'),
(202, 'SJ', 'Svalbarn and Jan Mayen Islands'),
(203, 'SZ', 'Swaziland'),
(204, 'SE', 'Sweden'),
(205, 'CH', 'Switzerland'),
(206, 'SY', 'Syrian Arab Republic'),
(207, 'TW', 'Taiwan'),
(208, 'TJ', 'Tajikistan'),
(209, 'TZ', 'Tanzania, United Republic of'),
(210, 'TH', 'Thailand'),
(211, 'TG', 'Togo'),
(212, 'TK', 'Tokelau'),
(213, 'TO', 'Tonga'),
(214, 'TT', 'Trinidad and Tobago'),
(215, 'TN', 'Tunisia'),
(216, 'TR', 'Turkey'),
(217, 'TM', 'Turkmenistan'),
(218, 'TC', 'Turks and Caicos Islands'),
(219, 'TV', 'Tuvalu'),
(220, 'UG', 'Uganda'),
(221, 'UA', 'Ukraine'),
(222, 'AE', 'United Arab Emirates'),
(223, 'GB', 'United Kingdom'),
(224, 'UM', 'United States minor outlying islands'),
(225, 'UY', 'Uruguay'),
(226, 'UZ', 'Uzbekistan'),
(227, 'VU', 'Vanuatu'),
(228, 'VA', 'Vatican City State'),
(229, 'VE', 'Venezuela'),
(230, 'VN', 'Vietnam'),
(231, 'VG', 'Virigan Islands (British)'),
(232, 'VI', 'Virgin Islands (U.S.)'),
(233, 'WF', 'Wallis and Futuna Islands'),
(234, 'EH', 'Western Sahara'),
(235, 'YE', 'Yemen'),
(236, 'YU', 'Yugoslavia'),
(237, 'ZR', 'Zaire'),
(238, 'ZM', 'Zambia'),
(239, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_base` tinyint(1) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `company_id`, `name`, `is_base`, `description`, `symbol`, `created_at`, `updated_at`) VALUES
(1, 1, 'USD Cash', 0, 'USD Cash', '$', '2024-02-10 13:37:05', '2024-02-10 13:37:05'),
(2, 1, 'ZWL', 0, 'ZWL', 'ZWL', '2024-02-10 13:37:24', '2024-02-10 13:37:24');

-- --------------------------------------------------------

--
-- Table structure for table `currency_rates`
--

CREATE TABLE `currency_rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `rate` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currency_rates`
--

INSERT INTO `currency_rates` (`id`, `currency_id`, `rate`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-02-10 13:37:05', '2024-02-10 13:37:05'),
(2, 2, 1, '2024-02-10 13:37:24', '2024-02-10 13:37:24');

-- --------------------------------------------------------

--
-- Table structure for table `c_m_s`
--

CREATE TABLE `c_m_s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `home` longtext DEFAULT NULL,
  `about` longtext DEFAULT NULL,
  `contact` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deductions`
--

CREATE TABLE `deductions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` varchar(255) NOT NULL,
  `month_year` varchar(191) NOT NULL,
  `first_date` date DEFAULT NULL,
  `allowance_title` varchar(255) NOT NULL,
  `deduction_amount` varchar(255) NOT NULL,
  `currency_id` varchar(255) NOT NULL,
  `currency_symbol` varchar(255) NOT NULL,
  `is_taxable` tinyint(1) NOT NULL,
  `deductible_amt` double NOT NULL,
  `is_recurring` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `employee_group` varchar(255) NOT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_name` varchar(191) NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_head` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `department_name`, `company_id`, `department_head`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Sales', 1, NULL, NULL, '2024-02-10 13:29:42', '2024-02-10 13:29:42');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `designation_name` varchar(191) NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `designation_name`, `company_id`, `department_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Marketing Officer', 1, 1, NULL, '2024-02-10 13:30:02', '2024-02-10 13:30:02');

-- --------------------------------------------------------

--
-- Table structure for table `document_types`
--

CREATE TABLE `document_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `staff_id` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `contact_no` varchar(15) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(191) DEFAULT NULL,
  `office_shift_id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `designation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `location_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_users_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `exit_date` date DEFAULT NULL,
  `marital_status` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `state` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `zip_code` varchar(24) DEFAULT NULL,
  `cv` varchar(64) DEFAULT NULL,
  `skype_id` varchar(64) DEFAULT NULL,
  `fb_id` varchar(64) DEFAULT NULL,
  `twitter_id` varchar(64) DEFAULT NULL,
  `linkedIn_id` varchar(64) DEFAULT NULL,
  `whatsapp_id` varchar(64) DEFAULT NULL,
  `basic_salary` double DEFAULT 0,
  `payslip_type` varchar(191) DEFAULT NULL,
  `attendance_type` varchar(191) DEFAULT NULL,
  `pension_type` varchar(50) DEFAULT NULL,
  `pension_amount` double(8,2) DEFAULT 0.00,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `salary_type` varchar(255) NOT NULL DEFAULT 'monthly',
  `employee_grade` varchar(255) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_symbol` varchar(255) DEFAULT NULL,
  `ssn_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `first_name`, `last_name`, `staff_id`, `email`, `contact_no`, `date_of_birth`, `gender`, `office_shift_id`, `company_id`, `department_id`, `designation_id`, `location_id`, `role_users_id`, `status_id`, `joining_date`, `exit_date`, `marital_status`, `address`, `city`, `state`, `country`, `zip_code`, `cv`, `skype_id`, `fb_id`, `twitter_id`, `linkedIn_id`, `whatsapp_id`, `basic_salary`, `payslip_type`, `attendance_type`, `pension_type`, `pension_amount`, `is_active`, `created_at`, `updated_at`, `salary_type`, `employee_grade`, `currency_id`, `currency_symbol`, `ssn_number`) VALUES
(64, 'Eliphas', 'Masuka', '08-952656X23', 'masukawebs@gmail.com', '787687032', '2024-02-13', 'Male', 1, 1, 1, 1, NULL, 1, NULL, '2024-02-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 560, 'Monthly', 'general', NULL, 0.00, 1, '2024-02-13 11:17:46', '2024-02-13 11:19:49', 'Monthly', 'A', 1, '$', NULL),
(65, 'Sarah', 'Williams', '08-95243X23', 'sarahw@gmail.com', '7876870321', '2024-02-13', 'Female', 1, 1, 1, 1, NULL, 2, NULL, '2024-02-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 800, 'Monthly', 'general', NULL, 0.00, 1, '2024-02-13 11:19:15', '2024-02-13 11:20:13', 'Monthly', 'A', 1, '$', NULL),
(66, 'Tino', 'Try', '09-6765X23', 'tinodaishe@payow.co.zw', '787687033', '2024-02-20', 'Male', 1, 1, 1, 1, NULL, 1, NULL, '2024-02-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 600, 'Monthly', 'general', NULL, 0.00, 1, '2024-02-13 11:22:36', '2024-02-15 14:32:29', 'Monthly', 'A', 1, '$', NULL),
(67, 'Tino', 'Masuka', '08-953645X23', 'masukawebs+2@gmail.com', '07876870399', '2024-02-17', 'Male', 1, 1, 1, 1, NULL, 2, NULL, '2024-02-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 500, 'Monthly', 'general', NULL, 0.00, 1, '2024-02-17 05:11:35', '2024-02-17 05:12:03', 'Monthly', 'a', 1, '$', NULL),
(68, 'Benito', 'Mhike', '1203', 'masuka120@gmail.com', '0787687066', '2024-02-17', 'Male', 1, 1, 1, 1, NULL, 2, NULL, '2024-02-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 600, 'Monthly', 'general', NULL, 0.00, 1, '2024-02-17 15:41:49', '2024-02-17 15:43:16', 'Monthly', 'A', 1, '$', '5850512Y');

-- --------------------------------------------------------

--
-- Table structure for table `employee_bank_accounts`
--

CREATE TABLE `employee_bank_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `account_title` varchar(191) NOT NULL,
  `account_number` varchar(191) NOT NULL,
  `bank_name` varchar(191) NOT NULL,
  `bank_code` varchar(191) NOT NULL,
  `bank_branch` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_contacts`
--

CREATE TABLE `employee_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `relation` varchar(50) NOT NULL,
  `is_primary` tinyint(4) DEFAULT 0,
  `is_dependent` tinyint(4) DEFAULT 0,
  `contact_name` varchar(191) NOT NULL,
  `work_phone` varchar(191) DEFAULT NULL,
  `work_phone_ext` varchar(191) DEFAULT NULL,
  `personal_phone` varchar(191) DEFAULT NULL,
  `home_phone` varchar(191) DEFAULT NULL,
  `work_email` varchar(191) DEFAULT NULL,
  `personal_email` varchar(191) DEFAULT NULL,
  `address1` varchar(191) DEFAULT NULL,
  `address2` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `zip` varchar(191) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_documents`
--

CREATE TABLE `employee_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `document_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `document_title` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `document_file` varchar(191) DEFAULT NULL,
  `expiry_date` date NOT NULL,
  `is_notify` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_immigrations`
--

CREATE TABLE `employee_immigrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `document_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `document_number` varchar(191) NOT NULL,
  `document_file` varchar(191) DEFAULT NULL,
  `issue_date` date NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `eligible_review_date` date DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_interview`
--

CREATE TABLE `employee_interview` (
  `interview_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_leave_type_details`
--

CREATE TABLE `employee_leave_type_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `leave_type_detail` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_leave_type_details`
--

INSERT INTO `employee_leave_type_details` (`id`, `employee_id`, `leave_type_detail`, `created_at`, `updated_at`) VALUES
(2, 64, 'a:2:{i:0;a:4:{s:13:\"leave_type_id\";i:2;s:10:\"leave_type\";s:5:\"Anual\";s:13:\"allocated_day\";i:30;s:23:\"remaining_allocated_day\";i:30;}i:1;a:4:{s:13:\"leave_type_id\";i:3;s:10:\"leave_type\";s:9:\"Martenity\";s:13:\"allocated_day\";i:90;s:23:\"remaining_allocated_day\";i:90;}}', '2024-02-13 11:17:47', '2024-02-17 14:11:22'),
(3, 65, 'a:2:{i:0;a:4:{s:13:\"leave_type_id\";i:2;s:10:\"leave_type\";s:5:\"Anual\";s:13:\"allocated_day\";i:30;s:23:\"remaining_allocated_day\";i:30;}i:1;a:4:{s:13:\"leave_type_id\";i:3;s:10:\"leave_type\";s:9:\"Martenity\";s:13:\"allocated_day\";i:90;s:23:\"remaining_allocated_day\";i:90;}}', '2024-02-13 11:19:15', '2024-02-17 14:11:22'),
(4, 66, 'a:2:{i:0;a:4:{s:13:\"leave_type_id\";i:2;s:10:\"leave_type\";s:5:\"Anual\";s:13:\"allocated_day\";i:30;s:23:\"remaining_allocated_day\";i:30;}i:1;a:4:{s:13:\"leave_type_id\";i:3;s:10:\"leave_type\";s:9:\"Martenity\";s:13:\"allocated_day\";i:90;s:23:\"remaining_allocated_day\";i:90;}}', '2024-02-13 11:22:36', '2024-02-17 14:11:22'),
(5, 67, 'a:2:{i:0;a:4:{s:13:\"leave_type_id\";i:2;s:10:\"leave_type\";s:5:\"Anual\";s:13:\"allocated_day\";i:30;s:23:\"remaining_allocated_day\";i:29;}i:1;a:4:{s:13:\"leave_type_id\";i:3;s:10:\"leave_type\";s:9:\"Martenity\";s:13:\"allocated_day\";i:90;s:23:\"remaining_allocated_day\";i:77;}}', '2024-02-17 05:11:35', '2024-02-17 14:11:22'),
(6, 68, 'a:2:{i:0;a:4:{s:13:\"leave_type_id\";i:2;s:10:\"leave_type\";s:5:\"Anual\";s:13:\"allocated_day\";i:30;s:23:\"remaining_allocated_day\";i:30;}i:1;a:4:{s:13:\"leave_type_id\";i:3;s:10:\"leave_type\";s:9:\"Martenity\";s:13:\"allocated_day\";i:90;s:23:\"remaining_allocated_day\";i:90;}}', '2024-02-17 15:41:49', '2024-02-17 15:41:49');

-- --------------------------------------------------------

--
-- Table structure for table `employee_meeting`
--

CREATE TABLE `employee_meeting` (
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `meeting_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_project`
--

CREATE TABLE `employee_project` (
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_qualificaitons`
--

CREATE TABLE `employee_qualificaitons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `education_level_id` bigint(20) UNSIGNED DEFAULT NULL,
  `institution_name` varchar(191) NOT NULL,
  `from_year` date DEFAULT NULL,
  `to_year` date DEFAULT NULL,
  `language_skill_id` bigint(20) UNSIGNED DEFAULT NULL,
  `general_skill_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_support_ticket`
--

CREATE TABLE `employee_support_ticket` (
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_task`
--

CREATE TABLE `employee_task` (
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_training_list`
--

CREATE TABLE `employee_training_list` (
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `training_list_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_work_experience`
--

CREATE TABLE `employee_work_experience` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(191) NOT NULL,
  `from_year` date DEFAULT NULL,
  `to_year` date DEFAULT NULL,
  `post` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employer_nssa_tax_tables`
--

CREATE TABLE `employer_nssa_tax_tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `posb_insuarance` varchar(255) DEFAULT NULL,
  `insuarance_ceiling` varchar(255) DEFAULT NULL,
  `posb_contribution` varchar(255) DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `last_updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_symbol` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employer_nssa_tax_tables`
--

INSERT INTO `employer_nssa_tax_tables` (`id`, `posb_insuarance`, `insuarance_ceiling`, `posb_contribution`, `currency_id`, `currency`, `last_updated_by`, `created_at`, `updated_at`, `currency_symbol`) VALUES
(1, '4.7', '900000', '1.2', 1, '$', 'Irfan Chowdhury', '2024-02-19 17:54:38', '2024-02-20 19:56:39', '$'),
(2, '9', '700000000', '1.2', 2, 'ZWL', 'Irfan Chowdhury', '2024-02-19 17:58:08', '2024-02-19 17:58:08', 'ZWL');

-- --------------------------------------------------------

--
-- Table structure for table `employer_zwl_nssa_tax_tables`
--

CREATE TABLE `employer_zwl_nssa_tax_tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `posb_insuarance` varchar(255) DEFAULT NULL,
  `insuarance_ceiling` varchar(255) DEFAULT NULL,
  `posb_contribution` varchar(255) DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `last_updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `event_title` varchar(191) NOT NULL,
  `event_note` mediumtext NOT NULL,
  `event_date` date NOT NULL,
  `event_time` varchar(191) NOT NULL,
  `status` varchar(30) NOT NULL,
  `is_notify` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_types`
--

CREATE TABLE `expense_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(40) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_managers`
--

CREATE TABLE `file_managers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `file_name` varchar(191) NOT NULL,
  `file_size` varchar(191) DEFAULT NULL,
  `file_extension` varchar(191) DEFAULT NULL,
  `external_link` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_manager_settings`
--

CREATE TABLE `file_manager_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `allowed_extensions` mediumtext NOT NULL,
  `max_file_size` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finance_bank_cashes`
--

CREATE TABLE `finance_bank_cashes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `account_balance` varchar(191) NOT NULL,
  `initial_balance` varchar(191) NOT NULL,
  `account_number` varchar(191) NOT NULL,
  `branch_code` varchar(191) NOT NULL,
  `bank_branch` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_symbol` varchar(255) NOT NULL DEFAULT '$'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `finance_bank_cashes`
--

INSERT INTO `finance_bank_cashes` (`id`, `account_name`, `account_balance`, `initial_balance`, `account_number`, `branch_code`, `bank_branch`, `created_at`, `updated_at`, `currency_symbol`) VALUES
(1, 'FNB', '799997914728', '800000000000', '2334224243324', '123', 'Harare', '2024-02-10 12:43:55', '2024-03-15 03:18:12', '$'),
(2, 'CBZ ZWL', '800000000000', '800000000000', '2334224243324', '123', 'Harare', '2024-03-02 05:02:19', '2024-03-15 03:18:12', 'ZWL');

-- --------------------------------------------------------

--
-- Table structure for table `finance_deposits`
--

CREATE TABLE `finance_deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` varchar(30) NOT NULL,
  `category` varchar(30) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `payment_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deposit_reference` varchar(191) NOT NULL,
  `deposit_file` varchar(191) DEFAULT NULL,
  `deposit_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finance_expenses`
--

CREATE TABLE `finance_expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` varchar(30) NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `payment_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `expense_reference` varchar(191) NOT NULL,
  `expense_file` varchar(191) DEFAULT NULL,
  `expense_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_symbol` varchar(255) NOT NULL DEFAULT '$'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `finance_expenses`
--

INSERT INTO `finance_expenses` (`id`, `company_id`, `account_id`, `amount`, `category_id`, `description`, `payment_method_id`, `payee_id`, `expense_reference`, `expense_file`, `expense_date`, `created_at`, `updated_at`, `currency_symbol`) VALUES
(1, NULL, 1, '640', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-10', '2024-02-10 12:44:22', '2024-02-10 12:44:22', '$'),
(2, NULL, 1, '640', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-10', '2024-02-10 12:52:16', '2024-02-10 12:52:16', '$'),
(3, NULL, 1, '0', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-10', '2024-02-10 13:01:11', '2024-02-10 13:01:11', '$'),
(4, NULL, 1, '600640', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-10', '2024-02-10 13:05:21', '2024-02-10 13:05:21', '$'),
(5, NULL, 1, '740', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-10', '2024-02-10 13:48:26', '2024-02-10 13:48:26', '$'),
(6, NULL, 1, '795.12', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-10', '2024-02-10 14:02:06', '2024-02-10 14:02:06', '$'),
(7, NULL, 1, '844.12', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-10', '2024-02-10 14:48:41', '2024-02-10 14:48:41', '$'),
(8, NULL, 1, '473649.6', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-10', '2024-02-10 15:03:15', '2024-02-10 15:03:15', '$'),
(9, NULL, 1, '761.06', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-10', '2024-02-10 15:04:54', '2024-02-10 15:04:54', '$'),
(10, NULL, 1, '752.84', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-10', '2024-02-10 15:10:48', '2024-02-10 15:10:48', '$'),
(11, NULL, 1, '812.37128', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-12', '2024-02-12 19:12:02', '2024-02-12 19:12:02', '$'),
(12, NULL, 1, '987992.55256', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-12', '2024-02-12 19:17:57', '2024-02-12 19:17:57', '$'),
(13, NULL, 1, '449', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-12', '2024-02-12 19:20:13', '2024-02-12 19:20:13', '$'),
(14, NULL, 1, '307.5875', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-12', '2024-02-12 19:35:56', '2024-02-12 19:35:56', '$'),
(15, NULL, 1, '370.72', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-13', '2024-02-13 10:47:03', '2024-02-13 10:47:03', '$'),
(16, NULL, 1, '240.1525', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-13', '2024-02-13 10:47:04', '2024-02-13 10:47:04', '$'),
(17, NULL, 1, '560', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-13', '2024-02-13 11:23:37', '2024-02-13 11:23:37', '$'),
(18, NULL, 1, '394.73', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-13', '2024-02-13 11:28:07', '2024-02-13 11:28:07', '$'),
(19, NULL, 1, '394.73', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-13', '2024-02-13 11:38:59', '2024-02-13 11:38:59', '$'),
(20, NULL, 1, '409.4384', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-13', '2024-02-13 11:44:47', '2024-02-13 11:44:47', '$'),
(21, NULL, 1, '409.4384', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-13', '2024-02-13 11:47:21', '2024-02-13 11:47:21', '$'),
(22, NULL, 1, '420.35', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-15', '2024-02-15 14:32:44', '2024-02-15 14:32:44', '$'),
(23, NULL, 1, '272.218', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-15', '2024-02-15 14:55:26', '2024-02-15 14:55:26', '$'),
(24, NULL, 1, '451.868', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-16', '2024-02-16 05:58:31', '2024-02-16 05:58:31', '$'),
(25, NULL, 1, '436.109', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-16', '2024-02-16 06:01:12', '2024-02-16 06:01:12', '$'),
(26, NULL, 1, '436.109', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-16', '2024-02-16 06:02:25', '2024-02-16 06:02:25', '$'),
(27, NULL, 1, '436.109', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-16', '2024-02-16 06:04:05', '2024-02-16 06:04:05', '$'),
(28, NULL, 1, '436.109', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-16', '2024-02-16 06:06:01', '2024-02-16 06:06:01', '$'),
(29, NULL, 1, '436.109', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-16', '2024-02-16 06:14:34', '2024-02-16 06:14:34', '$'),
(30, NULL, 1, '800', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-16', '2024-02-16 08:25:07', '2024-02-16 08:25:07', '$'),
(31, NULL, 1, '810.3', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-16', '2024-02-16 08:27:21', '2024-02-16 08:27:21', '$'),
(32, NULL, 1, '810.3', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-16', '2024-02-16 08:30:23', '2024-02-16 08:30:23', '$'),
(33, NULL, 1, '324.9397', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-17', '2024-02-17 15:48:30', '2024-02-17 15:48:30', '$'),
(34, NULL, 1, '394.73', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-19', '2024-02-19 18:36:17', '2024-02-19 18:36:17', '$'),
(35, NULL, 1, '108.31519999999995', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-19', '2024-02-19 18:48:01', '2024-02-19 18:48:01', '$'),
(36, NULL, 1, '452.1002', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-06', '2024-03-06 02:36:27', '2024-03-06 02:36:27', '$'),
(37, NULL, 1, '427.55', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', '2024-03-15 02:15:24', '2024-03-15 02:15:24', '$'),
(38, NULL, 2, '0', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', '2024-03-15 02:15:24', '2024-03-15 02:15:24', '$'),
(39, NULL, 1, '371.1425', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', '2024-03-15 02:24:16', '2024-03-15 02:24:16', '$'),
(40, NULL, 2, '0', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', '2024-03-15 02:24:16', '2024-03-15 02:24:16', '$'),
(41, NULL, 1, '910', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', '2024-03-15 02:31:09', '2024-03-15 02:31:09', '$'),
(42, NULL, 2, '0', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', '2024-03-15 02:31:09', '2024-03-15 02:31:09', '$'),
(43, NULL, 1, '101.3', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', '2024-03-15 02:35:11', '2024-03-15 02:35:11', '$'),
(44, NULL, 2, '0', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', '2024-03-15 02:35:11', '2024-03-15 02:35:11', '$'),
(45, NULL, 1, '1746.475', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', '2024-03-15 02:37:10', '2024-03-15 02:37:10', '$'),
(46, NULL, 2, '0', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', '2024-03-15 02:37:10', '2024-03-15 02:37:10', '$'),
(47, NULL, 1, '362.3', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', '2024-03-15 02:46:35', '2024-03-15 02:46:35', '$'),
(48, NULL, 2, '0', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', '2024-03-15 02:46:35', '2024-03-15 02:46:35', '$'),
(49, NULL, 1, '1285.7', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', '2024-03-15 02:59:21', '2024-03-15 02:59:21', '$'),
(50, NULL, 2, '0', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', '2024-03-15 02:59:21', '2024-03-15 02:59:21', '$'),
(51, NULL, 1, '362.3', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', '2024-03-15 03:09:47', '2024-03-15 03:09:47', '$'),
(52, NULL, 2, '0', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', '2024-03-15 03:09:47', '2024-03-15 03:09:47', '$'),
(53, NULL, 1, '427.55', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', '2024-03-15 03:09:55', '2024-03-15 03:09:55', '$'),
(54, NULL, 2, '0', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', '2024-03-15 03:09:55', '2024-03-15 03:09:55', '$'),
(55, NULL, 1, '101.3', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', '2024-03-15 03:15:35', '2024-03-15 03:15:35', '$'),
(56, NULL, 2, '0', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', '2024-03-15 03:15:35', '2024-03-15 03:15:35', '$'),
(57, NULL, 1, '362.3', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', '2024-03-15 03:18:12', '2024-03-15 03:18:12', '$'),
(58, NULL, 2, '0', NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', '2024-03-15 03:18:12', '2024-03-15 03:18:12', '$');

-- --------------------------------------------------------

--
-- Table structure for table `finance_payees`
--

CREATE TABLE `finance_payees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payee_name` varchar(50) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finance_payers`
--

CREATE TABLE `finance_payers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payer_name` varchar(50) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finance_transactions`
--

CREATE TABLE `finance_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` varchar(30) NOT NULL,
  `category` varchar(30) NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `payment_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `expense_reference` varchar(191) DEFAULT NULL,
  `expense_file` varchar(191) DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `deposit_reference` varchar(191) DEFAULT NULL,
  `deposit_file` varchar(191) DEFAULT NULL,
  `deposit_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_symbol` varchar(255) NOT NULL DEFAULT '$'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `finance_transactions`
--

INSERT INTO `finance_transactions` (`id`, `company_id`, `account_id`, `amount`, `category`, `category_id`, `description`, `payment_method_id`, `payee_id`, `payer_id`, `expense_reference`, `expense_file`, `expense_date`, `deposit_reference`, `deposit_file`, `deposit_date`, `created_at`, `updated_at`, `currency_symbol`) VALUES
(1, NULL, 1, '640', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-10', NULL, NULL, NULL, '2024-02-10 12:44:22', '2024-02-10 12:44:22', '$'),
(2, NULL, 1, '640', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-10', NULL, NULL, NULL, '2024-02-10 12:52:16', '2024-02-10 12:52:16', '$'),
(3, NULL, 1, '0', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-10', NULL, NULL, NULL, '2024-02-10 13:01:11', '2024-02-10 13:01:11', '$'),
(4, NULL, 1, '600640', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-10', NULL, NULL, NULL, '2024-02-10 13:05:21', '2024-02-10 13:05:21', '$'),
(5, NULL, 1, '740', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-10', NULL, NULL, NULL, '2024-02-10 13:48:26', '2024-02-10 13:48:26', '$'),
(6, NULL, 1, '795.12', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-10', NULL, NULL, NULL, '2024-02-10 14:02:06', '2024-02-10 14:02:06', '$'),
(7, NULL, 1, '844.12', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-10', NULL, NULL, NULL, '2024-02-10 14:48:41', '2024-02-10 14:48:41', '$'),
(8, NULL, 1, '473649.6', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-10', NULL, NULL, NULL, '2024-02-10 15:03:15', '2024-02-10 15:03:15', '$'),
(9, NULL, 1, '761.06', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-10', NULL, NULL, NULL, '2024-02-10 15:04:54', '2024-02-10 15:04:54', '$'),
(10, NULL, 1, '752.84', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-10', NULL, NULL, NULL, '2024-02-10 15:10:48', '2024-02-10 15:10:48', '$'),
(11, NULL, 1, '812.37128', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-12', NULL, NULL, NULL, '2024-02-12 19:12:02', '2024-02-12 19:12:02', '$'),
(12, NULL, 1, '987992.55256', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-12', NULL, NULL, NULL, '2024-02-12 19:17:57', '2024-02-12 19:17:57', '$'),
(13, NULL, 1, '449', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-12', NULL, NULL, NULL, '2024-02-12 19:20:13', '2024-02-12 19:20:13', '$'),
(14, NULL, 1, '307.5875', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-12', NULL, NULL, NULL, '2024-02-12 19:35:56', '2024-02-12 19:35:56', '$'),
(15, NULL, 1, '370.72', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-13', NULL, NULL, NULL, '2024-02-13 10:47:03', '2024-02-13 10:47:03', '$'),
(16, NULL, 1, '240.1525', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-13', NULL, NULL, NULL, '2024-02-13 10:47:04', '2024-02-13 10:47:04', '$'),
(17, NULL, 1, '560', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-13', NULL, NULL, NULL, '2024-02-13 11:23:37', '2024-02-13 11:23:37', '$'),
(18, NULL, 1, '394.73', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-13', NULL, NULL, NULL, '2024-02-13 11:28:07', '2024-02-13 11:28:07', '$'),
(19, NULL, 1, '394.73', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-13', NULL, NULL, NULL, '2024-02-13 11:38:59', '2024-02-13 11:38:59', '$'),
(20, NULL, 1, '409.4384', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-13', NULL, NULL, NULL, '2024-02-13 11:44:47', '2024-02-13 11:44:47', '$'),
(21, NULL, 1, '409.4384', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-13', NULL, NULL, NULL, '2024-02-13 11:47:21', '2024-02-13 11:47:21', '$'),
(22, NULL, 1, '420.35', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-15', NULL, NULL, NULL, '2024-02-15 14:32:44', '2024-02-15 14:32:44', '$'),
(23, NULL, 1, '272.218', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-15', NULL, NULL, NULL, '2024-02-15 14:55:26', '2024-02-15 14:55:26', '$'),
(24, NULL, 1, '451.868', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-16', NULL, NULL, NULL, '2024-02-16 05:58:31', '2024-02-16 05:58:31', '$'),
(25, NULL, 1, '436.109', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-16', NULL, NULL, NULL, '2024-02-16 06:01:12', '2024-02-16 06:01:12', '$'),
(26, NULL, 1, '436.109', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-16', NULL, NULL, NULL, '2024-02-16 06:02:25', '2024-02-16 06:02:25', '$'),
(27, NULL, 1, '436.109', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-16', NULL, NULL, NULL, '2024-02-16 06:04:05', '2024-02-16 06:04:05', '$'),
(28, NULL, 1, '436.109', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-16', NULL, NULL, NULL, '2024-02-16 06:06:01', '2024-02-16 06:06:01', '$'),
(29, NULL, 1, '436.109', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-16', NULL, NULL, NULL, '2024-02-16 06:14:34', '2024-02-16 06:14:34', '$'),
(30, NULL, 1, '800', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-16', NULL, NULL, NULL, '2024-02-16 08:25:07', '2024-02-16 08:25:07', '$'),
(31, NULL, 1, '810.3', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-16', NULL, NULL, NULL, '2024-02-16 08:27:21', '2024-02-16 08:27:21', '$'),
(32, NULL, 1, '810.3', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-16', NULL, NULL, NULL, '2024-02-16 08:30:23', '2024-02-16 08:30:23', '$'),
(33, NULL, 1, '324.9397', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-17', NULL, NULL, NULL, '2024-02-17 15:48:30', '2024-02-17 15:48:30', '$'),
(34, NULL, 1, '394.73', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-19', NULL, NULL, NULL, '2024-02-19 18:36:17', '2024-02-19 18:36:17', '$'),
(35, NULL, 1, '108.31519999999995', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-02-19', NULL, NULL, NULL, '2024-02-19 18:48:01', '2024-02-19 18:48:01', '$'),
(36, NULL, 1, '452.1002', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-06', NULL, NULL, NULL, '2024-03-06 02:36:27', '2024-03-06 02:36:27', '$'),
(37, NULL, 1, '427.55', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', NULL, NULL, NULL, '2024-03-15 02:15:24', '2024-03-15 02:15:24', '$'),
(38, NULL, 2, '0', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', NULL, NULL, NULL, '2024-03-15 02:15:24', '2024-03-15 02:15:24', '$'),
(39, NULL, 1, '371.1425', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', NULL, NULL, NULL, '2024-03-15 02:24:16', '2024-03-15 02:24:16', '$'),
(40, NULL, 2, '0', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', NULL, NULL, NULL, '2024-03-15 02:24:16', '2024-03-15 02:24:16', '$'),
(41, NULL, 1, '910', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', NULL, NULL, NULL, '2024-03-15 02:31:09', '2024-03-15 02:31:09', '$'),
(42, NULL, 2, '0', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', NULL, NULL, NULL, '2024-03-15 02:31:09', '2024-03-15 02:31:09', '$'),
(43, NULL, 1, '101.3', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', NULL, NULL, NULL, '2024-03-15 02:35:11', '2024-03-15 02:35:11', '$'),
(44, NULL, 2, '0', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', NULL, NULL, NULL, '2024-03-15 02:35:11', '2024-03-15 02:35:11', '$'),
(45, NULL, 1, '1746.475', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', NULL, NULL, NULL, '2024-03-15 02:37:10', '2024-03-15 02:37:10', '$'),
(46, NULL, 2, '0', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', NULL, NULL, NULL, '2024-03-15 02:37:10', '2024-03-15 02:37:10', '$'),
(47, NULL, 1, '362.3', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', NULL, NULL, NULL, '2024-03-15 02:46:35', '2024-03-15 02:46:35', '$'),
(48, NULL, 2, '0', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', NULL, NULL, NULL, '2024-03-15 02:46:35', '2024-03-15 02:46:35', '$'),
(49, NULL, 1, '1285.7', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', NULL, NULL, NULL, '2024-03-15 02:59:21', '2024-03-15 02:59:21', '$'),
(50, NULL, 2, '0', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', NULL, NULL, NULL, '2024-03-15 02:59:21', '2024-03-15 02:59:21', '$'),
(51, NULL, 1, '362.3', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', NULL, NULL, NULL, '2024-03-15 03:09:47', '2024-03-15 03:09:47', '$'),
(52, NULL, 2, '0', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', NULL, NULL, NULL, '2024-03-15 03:09:47', '2024-03-15 03:09:47', '$'),
(53, NULL, 1, '427.55', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', NULL, NULL, NULL, '2024-03-15 03:09:55', '2024-03-15 03:09:55', '$'),
(54, NULL, 2, '0', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', NULL, NULL, NULL, '2024-03-15 03:09:55', '2024-03-15 03:09:55', '$'),
(55, NULL, 1, '101.3', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', NULL, NULL, NULL, '2024-03-15 03:15:35', '2024-03-15 03:15:35', '$'),
(56, NULL, 2, '0', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', NULL, NULL, NULL, '2024-03-15 03:15:35', '2024-03-15 03:15:35', '$'),
(57, NULL, 1, '362.3', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', NULL, NULL, NULL, '2024-03-15 03:18:12', '2024-03-15 03:18:12', '$'),
(58, NULL, 2, '0', '', NULL, NULL, NULL, NULL, NULL, 'Payroll', NULL, '2024-03-15', NULL, NULL, NULL, '2024-03-15 03:18:12', '2024-03-15 03:18:12', '$');

-- --------------------------------------------------------

--
-- Table structure for table `finance_transfers`
--

CREATE TABLE `finance_transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `from_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `to_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` varchar(30) NOT NULL,
  `reference` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `payment_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_title` varchar(191) NOT NULL,
  `site_logo` varchar(191) DEFAULT NULL,
  `time_zone` varchar(191) DEFAULT NULL,
  `currency` varchar(191) DEFAULT NULL,
  `currency_format` varchar(191) DEFAULT NULL,
  `default_payment_bank` varchar(191) DEFAULT NULL,
  `date_format` varchar(191) DEFAULT NULL,
  `theme` varchar(191) DEFAULT NULL,
  `footer` varchar(191) DEFAULT NULL,
  `footer_link` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `show_leave_payslip` tinyint(1) NOT NULL DEFAULT 0,
  `ssr_number` varchar(255) DEFAULT NULL,
  `default_payment_bank_zwl` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_title`, `site_logo`, `time_zone`, `currency`, `currency_format`, `default_payment_bank`, `date_format`, `theme`, `footer`, `footer_link`, `created_at`, `updated_at`, `show_leave_payslip`, `ssr_number`, `default_payment_bank_zwl`) VALUES
(1, 'Havano Payroll', 'logo.png', 'Asia/Colombo', '$', 'prefix', '1', 'd-m-Y', 'default.css', 'Havano Payroll', 'https://payroll.havano.online', '2020-07-25 19:00:00', '2024-03-07 11:21:12', 0, '67988Y4', 2);

-- --------------------------------------------------------

--
-- Table structure for table `goal_trackings`
--

CREATE TABLE `goal_trackings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `goal_type_id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(191) NOT NULL,
  `target_achievement` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` varchar(191) NOT NULL,
  `end_date` varchar(191) NOT NULL,
  `progress` int(11) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goal_types`
--

CREATE TABLE `goal_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `goal_type` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_name` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_publish` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `indicators`
--

CREATE TABLE `indicators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `designation_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `customer_experience` varchar(191) NOT NULL,
  `marketing` varchar(191) NOT NULL,
  `administrator` varchar(191) NOT NULL,
  `professionalism` varchar(191) NOT NULL,
  `integrity` varchar(191) NOT NULL,
  `attendance` varchar(191) NOT NULL,
  `added_by` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` varchar(191) NOT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_date` date NOT NULL,
  `invoice_due_date` date NOT NULL,
  `sub_total` double NOT NULL,
  `discount_type` tinyint(4) DEFAULT NULL,
  `discount_figure` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_discount` double NOT NULL,
  `grand_total` double NOT NULL,
  `invoice_note` mediumtext DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_name` varchar(191) NOT NULL,
  `item_tax_type` varchar(191) NOT NULL,
  `item_tax_rate` varchar(191) NOT NULL,
  `item_qty` bigint(20) NOT NULL DEFAULT 0,
  `item_unit_price` bigint(20) NOT NULL,
  `item_sub_total` double NOT NULL,
  `sub_total` double NOT NULL,
  `discount_type` tinyint(4) DEFAULT NULL,
  `discount_figure` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_discount` double NOT NULL,
  `grand_total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ip_settings`
--

CREATE TABLE `ip_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `ip_address` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_candidates`
--

CREATE TABLE `job_candidates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `address` text DEFAULT NULL,
  `cover_letter` longtext NOT NULL,
  `fb_id` varchar(191) DEFAULT NULL,
  `linkedin_id` varchar(191) DEFAULT NULL,
  `cv` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `remarks` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_categories`
--

CREATE TABLE `job_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_category` mediumtext NOT NULL,
  `url` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_interviews`
--

CREATE TABLE `job_interviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `interview_place` varchar(191) NOT NULL,
  `interview_date` date NOT NULL,
  `interview_time` time NOT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_posts`
--

CREATE TABLE `job_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `job_category_id` bigint(20) UNSIGNED NOT NULL,
  `job_title` varchar(191) NOT NULL,
  `job_type` varchar(191) NOT NULL,
  `no_of_vacancy` int(11) NOT NULL,
  `job_url` varchar(191) NOT NULL,
  `gender` varchar(30) NOT NULL,
  `min_experience` varchar(20) NOT NULL,
  `short_description` mediumtext NOT NULL,
  `long_description` longtext NOT NULL,
  `closing_date` date NOT NULL,
  `status` tinyint(4) NOT NULL,
  `is_featured` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `language` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `leave_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_days` int(11) NOT NULL,
  `leave_reason` mediumtext DEFAULT NULL,
  `remarks` varchar(191) DEFAULT NULL,
  `status` varchar(40) NOT NULL,
  `is_notify` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`id`, `leave_type_id`, `company_id`, `department_id`, `employee_id`, `start_date`, `end_date`, `total_days`, `leave_reason`, `remarks`, `status`, `is_notify`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 67, '2024-02-17', '2024-02-18', 2, '', NULL, 'pending', NULL, '2024-02-17 05:13:03', '2024-02-17 05:13:03'),
(2, 2, 1, 1, 67, '2024-02-17', '2024-02-18', 2, '', NULL, 'pending', NULL, '2024-02-17 05:13:08', '2024-02-17 05:13:08'),
(3, 2, 1, 1, 67, '2024-02-17', '2024-02-18', 2, '', NULL, 'pending', NULL, '2024-02-17 05:13:08', '2024-02-17 05:13:08'),
(4, 2, 1, 1, 67, '2024-02-17', '2024-02-18', 2, '', NULL, 'pending', NULL, '2024-02-17 05:13:12', '2024-02-17 05:13:12'),
(5, 2, 1, 1, 67, '2024-02-17', '2024-02-18', 2, '', NULL, 'pending', NULL, '2024-02-17 05:13:12', '2024-02-17 05:13:12'),
(6, 2, 1, 1, 67, '2024-02-17', '2024-02-18', 2, 'New Request', NULL, 'pending', NULL, '2024-02-17 05:13:26', '2024-02-17 05:13:26'),
(7, 2, 1, 1, 67, '2024-02-17', '2024-02-18', 2, 'New Request', NULL, 'pending', NULL, '2024-02-17 05:16:09', '2024-02-17 05:16:09'),
(8, 2, 1, 1, 67, '2024-02-29', '2024-02-29', 1, '', '', 'approved', NULL, '2024-02-17 05:17:47', '2024-02-17 05:18:36'),
(9, 3, 1, 1, 67, '2024-02-17', '2024-02-29', 13, 'Martenity Leave', '', 'approved', NULL, '2024-02-17 12:07:24', '2024-02-17 12:07:24');

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `leave_type` varchar(50) NOT NULL,
  `allocated_day` int(11) DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`id`, `leave_type`, `allocated_day`, `company_id`, `created_at`, `updated_at`) VALUES
(2, 'Anual', 30, NULL, '2024-02-17 05:06:36', '2024-02-17 14:11:22'),
(3, 'Martenity', 90, NULL, '2024-02-17 12:06:06', '2024-02-17 12:06:06');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location_name` varchar(191) NOT NULL,
  `location_head` bigint(20) UNSIGNED DEFAULT NULL,
  `address1` varchar(191) DEFAULT NULL,
  `address2` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` int(10) UNSIGNED DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `location_name`, `location_head`, `address1`, `address2`, `city`, `state`, `country`, `zip`, `created_at`, `updated_at`) VALUES
(1, 'Hararre', NULL, '305 Anlaby House', '111', 'Pune', 'Hararre', 239, 378793983, '2024-02-10 13:28:26', '2024-02-10 13:28:26');

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE `meetings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `meeting_title` varchar(191) NOT NULL,
  `meeting_note` mediumtext NOT NULL,
  `meeting_date` date NOT NULL,
  `meeting_time` varchar(191) NOT NULL,
  `status` varchar(30) NOT NULL,
  `is_notify` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(106, '2023_05_06_053210_create_countries_table', 1),
(107, '2023_05_06_053211_create_locations_table', 1),
(108, '2023_05_06_053212_create_companies_table', 1),
(109, '2023_05_06_053213_create_departments_table', 1),
(110, '2023_05_06_053214_create_designations_table', 1),
(111, '2023_05_06_053215_create_roles_table', 1),
(112, '2023_05_06_053217_create_users_table', 1),
(113, '2023_05_06_053218_create_office_shifts_table', 1),
(114, '2023_05_06_053219_create_statuses_table', 1),
(115, '2023_05_06_053220_create_employees_table', 1),
(116, '2023_05_06_053221_create_announcements_table', 1),
(117, '2023_05_06_053222_create_appraisals_table', 1),
(118, '2023_05_06_053223_create_asset_categories_table', 1),
(119, '2023_05_06_053224_create_assets_table', 1),
(120, '2023_05_06_053225_create_attendances_table', 1),
(121, '2023_05_06_053226_create_award_types_table', 1),
(122, '2023_05_06_053227_create_awards_table', 1),
(123, '2023_05_06_053228_create_c_m_s_table', 1),
(124, '2023_05_06_053229_create_calendarables_table', 1),
(125, '2023_05_06_053231_create_clients_table', 1),
(126, '2023_05_06_053232_create_complaints_table', 1),
(127, '2023_05_06_053233_create_document_types_table', 1),
(128, '2023_05_06_053234_create_employee_bank_accounts_table', 1),
(129, '2023_05_06_053235_create_employee_contacts_table', 1),
(130, '2023_05_06_053236_create_employee_documents_table', 1),
(131, '2023_05_06_053237_create_employee_immigrations_table', 1),
(132, '2023_05_06_053238_create_employee_leave_type_details_table', 1),
(133, '2023_05_06_053239_create_job_categories_table', 1),
(134, '2023_05_06_053240_create_job_posts_table', 1),
(135, '2023_05_06_053241_create_job_interviews_table', 1),
(136, '2023_05_06_053242_create_employee_interview_table', 1),
(137, '2023_05_06_053243_create_meetings_table', 1),
(138, '2023_05_06_053244_create_employee_meeting_table', 1),
(139, '2023_05_06_053245_create_projects_table', 1),
(140, '2023_05_06_053246_create_employee_project_table', 1),
(141, '2023_05_06_053247_create_qualification_languages_table', 1),
(142, '2023_05_06_053248_create_qualification_skills_table', 1),
(143, '2023_05_06_053249_create_qualification_education_levels_table', 1),
(144, '2023_05_06_053250_create_employee_qualificaitons_table', 1),
(145, '2023_05_06_053251_create_support_tickets_table', 1),
(146, '2023_05_06_053252_create_employee_support_ticket_table', 1),
(147, '2023_05_06_053253_create_tasks_table', 1),
(148, '2023_05_06_053254_create_employee_task_table', 1),
(149, '2023_05_06_053255_create_trainers_table', 1),
(150, '2023_05_06_053256_create_training_types_table', 1),
(151, '2023_05_06_053257_create_training_lists_table', 1),
(152, '2023_05_06_053258_create_employee_training_list_table', 1),
(153, '2023_05_06_053259_create_employee_work_experience_table', 1),
(154, '2023_05_06_053260_create_events_table', 1),
(155, '2023_05_06_053261_create_expense_types_table', 1),
(156, '2023_05_06_053262_create_failed_jobs_table', 1),
(157, '2023_05_06_053263_create_file_manager_settings_table', 1),
(158, '2023_05_06_053265_create_file_managers_table', 1),
(159, '2023_05_06_053265_create_finance_bank_cashes_table', 1),
(160, '2023_05_06_053266_create_finance_payers_table', 1),
(161, '2023_05_06_053267_create_payment_methods_table', 1),
(162, '2023_05_06_053268_create_finance_deposits_table', 1),
(163, '2023_05_06_053269_create_finance_payees_table', 1),
(164, '2023_05_06_053270_create_finance_expenses_table', 1),
(165, '2023_05_06_053271_create_finance_transactions_table', 1),
(166, '2023_05_06_053272_create_finance_transfers_table', 1),
(167, '2023_05_06_053273_create_general_settings_table', 1),
(168, '2023_05_06_053274_create_goal_types_table', 1),
(169, '2023_05_06_053275_create_goal_trackings_table', 1),
(170, '2023_05_06_053276_create_holidays_table', 1),
(171, '2023_05_06_053277_create_indicators_table', 1),
(172, '2023_05_06_053278_create_invoices_table', 1),
(173, '2023_05_06_053279_create_invoice_items_table', 1),
(174, '2023_05_06_053280_create_ip_settings_table', 1),
(175, '2023_05_06_053281_create_job_candidates_table', 1),
(176, '2023_05_06_053282_create_leave_types_table', 1),
(177, '2023_05_06_053283_create_leaves_table', 1),
(178, '2023_05_06_053284_create_permissions_table', 1),
(179, '2023_05_06_053285_create_model_has_permissions_table', 1),
(180, '2023_05_06_053287_create_model_has_roles_table', 1),
(181, '2023_05_06_053288_create_notifications_table', 1),
(182, '2023_05_06_053289_create_official_documents_table', 1),
(183, '2023_05_06_053290_create_password_resets_table', 1),
(184, '2023_05_06_053291_create_payslips_table', 1),
(185, '2023_05_06_053292_create_policies_table', 1),
(186, '2023_05_06_053293_create_project_bugs_table', 1),
(187, '2023_05_06_053294_create_project_discussions_table', 1),
(188, '2023_05_06_053295_create_project_files_table', 1),
(189, '2023_05_06_053296_create_promotions_table', 1),
(190, '2023_05_06_053297_create_resignations_table', 1),
(191, '2023_05_06_053298_create_role_has_permissions_table', 1),
(192, '2023_05_06_053299_create_salary_allowances_table', 1),
(193, '2023_05_06_053300_create_salary_basics_table', 1),
(194, '2023_05_06_053301_create_salary_commissions_table', 1),
(195, '2023_05_06_053302_create_salary_deductions_table', 1),
(196, '2023_05_06_053303_create_salary_loans_table', 1),
(197, '2023_05_06_053304_create_salary_other_payments_table', 1),
(198, '2023_05_06_053305_create_salary_overtimes_table', 1),
(199, '2023_05_06_053306_create_task_discussions_table', 1),
(200, '2023_05_06_053307_create_task_files_table', 1),
(201, '2023_05_06_053308_create_tax_types_table', 1),
(202, '2023_05_06_053309_create_termination_types_table', 1),
(203, '2023_05_06_053310_create_terminations_table', 1),
(204, '2023_05_06_053311_create_ticket_comments_table', 1),
(205, '2023_05_06_053312_create_transfers_table', 1),
(206, '2023_05_06_053313_create_travel_types_table', 1),
(207, '2023_05_06_053314_create_travels_table', 1),
(208, '2023_05_06_053315_create_warnings_type_table', 1),
(209, '2023_05_06_053316_create_warnings_table', 1),
(210, '2023_05_06_053317_create_candidate_interview_table', 1),
(211, '2023_05_06_151650_delete_column_from_document_types_table', 2),
(212, '2023_05_06_153653_update_foreign_key_to_employees_table', 2),
(213, '2023_05_07_163304_update_foreign_key_to_projects_table', 2),
(214, '2023_05_08_004033_update_foreign_key_to_support_tickets_table', 2),
(215, '2023_05_08_094247_update_foreign_key_to_tasks_table', 2),
(216, '2023_05_08_101326_add_foreign_key_to_training_types_table', 2),
(217, '2023_05_08_152355_update_foreign_key_to_file_managers_table', 2),
(218, '2023_05_08_165246_update_foreign_key_to_payment_methods_table', 2),
(219, '2023_05_08_165419_update_foreign_key_to_finance_deposits_table', 2),
(220, '2023_05_09_112302_update_foreign_key_to_finance_expenses_table', 2),
(221, '2023_05_09_115226_update_foreign_key_to_finance_transactions_table', 2),
(222, '2023_05_09_122727_update_foreign_key_to_finance_transfers_table', 2),
(223, '2023_05_09_130054_add_foreign_key_to_goal_trackings_table', 2),
(224, '2023_05_09_134538_update_foreign_key_to_holidays_table', 2),
(225, '2023_05_09_134626_add_foreign_key_to_indicators_table', 2),
(226, '2023_05_09_134702_update_foreign_key_to_invoices_table', 2),
(227, '2023_05_09_134831_update_foreign_key_to_invoice_items_table', 2),
(228, '2023_05_09_162641_update_foreign_key_to_leaves_table', 2),
(229, '2023_05_09_181324_update_foreign_key_to_official_documents_table', 2),
(230, '2023_05_09_190434_update_foreign_key_to_policies_table', 2),
(231, '2023_05_09_193007_update_foreign_key_to_terminations_table', 2),
(232, '2023_05_09_195431_update_foreign_key_to_travel_types_table', 2),
(233, '2023_05_09_195925_update_foreign_key_to_travels_table', 2),
(234, '2023_05_09_200229_update_foreign_key_to_warnings_table', 2),
(235, '2023_08_02_113953_delete_company_id_column_to_training_types_table', 2),
(236, '2018_08_29_200844_create_languages_table', 3),
(237, '2018_08_29_205156_create_translations_table', 3),
(238, '2023_11_17_174721_create_currencies_table', 3),
(239, '2023_11_17_175350_create_currency_rates_table', 3),
(240, '2023_11_25_215323_create_usd_tax_tables_table', 4),
(241, '2023_11_25_215443_create_zwl_tax_tables_table', 4),
(242, '2023_12_11_114902_add_currency_fields_to_salary_allowances_table', 5),
(243, '2023_12_11_182100_add_grades_salary_types_to_employees_table', 6),
(244, '2023_12_18_191448_create_nssa_tables_table', 7),
(245, '2023_12_29_175640_create_zimdef_tables_table', 8),
(246, '2024_01_05_054538_add_tax_details_to_salary_deductions_table', 9),
(247, '2024_01_14_230853_add_currency_to_salary_basics_table', 10),
(248, '2024_01_14_231601_add_currency_details_to_employees_table', 11),
(249, '2024_01_20_155640_add_currency_symbol_to_nssa_tables_table', 12),
(250, '2024_02_10_164609_add_zwl_net_salary_to_payslips_table', 13),
(251, '2024_02_13_121509_add_nssa_ssn_to_employee', 14),
(252, '2024_02_13_121733_add_nssa_details_to_salary_deductions_table', 14),
(253, '2024_02_13_145501_create_tax_credits_table', 15),
(254, '2024_02_15_022616_add_tax_credits_to_payslips_table', 15),
(255, '2024_02_16_080834_modify_tax_credit_column_to_payslips_table', 16),
(256, '2024_02_16_095840_add_default_column_to_payslips_table', 17),
(257, '2024_02_17_134240_add_show_leave_days_to_general_settings_table', 18),
(258, '2024_02_17_182725_add_ssr_to_general_settings_table', 19),
(259, '2024_02_19_184416_add_employer_apwcs_to_payslips_table', 20),
(260, '2024_02_19_191148_create_employer_nssa_tax_tables_table', 21),
(261, '2024_02_19_191201_create_employer_zwl_nssa_tax_tables_table', 21),
(262, '2024_02_19_195411_add_currency_symbol_to_employer_nssa_tax_tables_table', 22),
(263, '2024_03_02_070046_add_currency_to_finance_bank_cashes_table', 23),
(264, '2024_03_02_072412_create_allowances_table', 24),
(265, '2024_03_07_104128_add_zwl_to_general_settings_table', 25),
(266, '2024_03_09_105424_add_zwl_to_finance_transactions_table', 26),
(267, '2024_03_09_105520_add_zwl_to_finance_expenses_table', 26),
(268, '2024_03_09_113837_add_recurring_flag_to_salary_allwowances_table', 27),
(269, '2024_03_12_071230_add_is_recurring_to_salary_deductions_table', 28),
(270, '2024_03_13_143133_add_employee_group_to_allowances_table', 29),
(271, '2024_03_13_143402_create_deuctions_table', 30),
(272, '2024_03_13_144213_add_employee_group_to_deductions_table', 30),
(273, '2024_03_13_143721_add_deductible_to_allowances_table', 31),
(274, '2024_03_13_145243_add_department_id_to_allowances_table', 32),
(275, '2024_03_13_145253_add_department_id_to_deductions_table', 32),
(276, '2024_03_14_072103_andd_allowance_id_to_salary_allowances_table', 33),
(277, '2024_03_14_072117_andd_allowance_id_to_salary_deductions_table', 33);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 8),
(1, 'App\\Models\\User', 28),
(1, 'App\\Models\\User', 29),
(1, 'App\\Models\\User', 30),
(1, 'App\\Models\\User', 31),
(1, 'App\\Models\\User', 36),
(1, 'App\\Models\\User', 40),
(1, 'App\\Models\\User', 44),
(1, 'App\\Models\\User', 46),
(1, 'App\\Models\\User', 47),
(1, 'App\\Models\\User', 48),
(1, 'App\\Models\\User', 51),
(1, 'App\\Models\\User', 64),
(1, 'App\\Models\\User', 66),
(2, 'App\\Models\\User', 9),
(2, 'App\\Models\\User', 12),
(2, 'App\\Models\\User', 13),
(2, 'App\\Models\\User', 14),
(2, 'App\\Models\\User', 15),
(2, 'App\\Models\\User', 24),
(2, 'App\\Models\\User', 25),
(2, 'App\\Models\\User', 27),
(2, 'App\\Models\\User', 32),
(2, 'App\\Models\\User', 33),
(2, 'App\\Models\\User', 34),
(2, 'App\\Models\\User', 37),
(2, 'App\\Models\\User', 38),
(2, 'App\\Models\\User', 41),
(2, 'App\\Models\\User', 42),
(2, 'App\\Models\\User', 43),
(2, 'App\\Models\\User', 49),
(2, 'App\\Models\\User', 50),
(2, 'App\\Models\\User', 54),
(2, 'App\\Models\\User', 56),
(2, 'App\\Models\\User', 57),
(2, 'App\\Models\\User', 58),
(2, 'App\\Models\\User', 59),
(2, 'App\\Models\\User', 60),
(2, 'App\\Models\\User', 61),
(2, 'App\\Models\\User', 62),
(2, 'App\\Models\\User', 63),
(2, 'App\\Models\\User', 65),
(2, 'App\\Models\\User', 67),
(2, 'App\\Models\\User', 68),
(3, 'App\\Models\\User', 39),
(3, 'App\\Models\\User', 52),
(3, 'App\\Models\\User', 53),
(4, 'App\\Models\\User', 23),
(4, 'App\\Models\\User', 26),
(4, 'App\\Models\\User', 45),
(5, 'App\\Models\\User', 21),
(5, 'App\\Models\\User', 22),
(6, 'App\\Models\\User', 10),
(6, 'App\\Models\\User', 11);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('00db2e12-8c2c-49d3-bdf9-c4750e9d744f', 'App\\Notifications\\LeaveNotificationToAdmin', 'App\\Models\\User', 64, '{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/payroll\\/public\\/timesheet\\/leaves\"}', NULL, '2024-02-17 05:13:26', '2024-02-17 05:13:26'),
('07005626-41a3-4335-9716-1305d80edec5', 'App\\Notifications\\LeaveNotificationToAdmin', 'App\\Models\\User', 1, '{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/payroll\\/public\\/timesheet\\/leaves\"}', '2024-02-17 13:28:19', '2024-02-17 05:16:09', '2024-02-17 13:28:19'),
('08277d21-5417-41db-9bc9-f5f33f3e4f23', 'App\\Notifications\\LeaveNotificationToAdmin', 'App\\Models\\User', 64, '{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/payroll\\/public\\/timesheet\\/leaves\"}', NULL, '2024-02-17 05:13:12', '2024-02-17 05:13:12'),
('0a8304b2-12f4-4c22-b2f2-b82344d5f40f', 'App\\Notifications\\LeaveNotificationToAdmin', 'App\\Models\\User', 64, '{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/payroll\\/public\\/timesheet\\/leaves\"}', NULL, '2024-02-17 05:13:08', '2024-02-17 05:13:08'),
('1649eafe-49ff-478f-84d8-326bacbfe386', 'App\\Notifications\\LeaveNotificationToAdmin', 'App\\Models\\User', 1, '{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/payroll\\/public\\/timesheet\\/leaves\"}', '2024-02-17 13:28:19', '2024-02-17 05:13:26', '2024-02-17 13:28:19'),
('2cb8525e-eb24-4e9f-b8b0-5b1beec72730', 'App\\Notifications\\LeaveNotificationToAdmin', 'App\\Models\\User', 64, '{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/payroll\\/public\\/timesheet\\/leaves\"}', NULL, '2024-02-17 05:16:09', '2024-02-17 05:16:09'),
('31416447-584c-4983-bad5-e4e0044694c3', 'App\\Notifications\\LeaveNotificationToAdmin', 'App\\Models\\User', 66, '{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/payroll\\/public\\/timesheet\\/leaves\"}', NULL, '2024-02-17 05:13:03', '2024-02-17 05:13:03'),
('3c371879-49ed-44c9-814c-4c7f4b0e2891', 'App\\Notifications\\LeaveNotificationToAdmin', 'App\\Models\\User', 66, '{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/payroll\\/public\\/timesheet\\/leaves\"}', NULL, '2024-02-17 05:13:13', '2024-02-17 05:13:13'),
('49a98427-9d42-4d6c-9897-2cb516255962', 'App\\Notifications\\LeaveNotificationToAdmin', 'App\\Models\\User', 66, '{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/payroll\\/public\\/timesheet\\/leaves\"}', NULL, '2024-02-17 05:13:08', '2024-02-17 05:13:08'),
('5ed1cba9-0b4c-447e-8ccd-de5c8b087731', 'App\\Notifications\\LeaveNotificationToAdmin', 'App\\Models\\User', 1, '{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/payroll\\/public\\/timesheet\\/leaves\"}', '2024-02-17 13:28:19', '2024-02-17 05:17:47', '2024-02-17 13:28:19'),
('7400fdff-9e65-489b-9b5d-12634a41a4de', 'App\\Notifications\\LeaveNotificationToAdmin', 'App\\Models\\User', 66, '{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/payroll\\/public\\/timesheet\\/leaves\"}', NULL, '2024-02-17 05:13:26', '2024-02-17 05:13:26'),
('799d2f7f-37df-460c-9ad9-971186f6b16e', 'App\\Notifications\\LeaveNotificationToAdmin', 'App\\Models\\User', 66, '{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/payroll\\/public\\/timesheet\\/leaves\"}', NULL, '2024-02-17 05:16:09', '2024-02-17 05:16:09'),
('8d3eb823-5968-4423-bf76-06bc2314aea5', 'App\\Notifications\\LeaveNotificationToAdmin', 'App\\Models\\User', 1, '{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/payroll\\/public\\/timesheet\\/leaves\"}', '2024-02-17 13:28:19', '2024-02-17 05:13:08', '2024-02-17 13:28:19'),
('8e52076a-6916-45f6-ad52-45dfee87730c', 'App\\Notifications\\LeaveNotificationToAdmin', 'App\\Models\\User', 64, '{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/payroll\\/public\\/timesheet\\/leaves\"}', NULL, '2024-02-17 05:13:12', '2024-02-17 05:13:12'),
('a1032d70-4c5f-43f4-ba7f-880c4e6ab602', 'App\\Notifications\\LeaveNotificationToAdmin', 'App\\Models\\User', 1, '{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/payroll\\/public\\/timesheet\\/leaves\"}', '2024-02-17 13:28:20', '2024-02-17 05:13:08', '2024-02-17 13:28:20'),
('b6117bae-b286-4983-b67b-44da2a7dc244', 'App\\Notifications\\LeaveNotificationToAdmin', 'App\\Models\\User', 1, '{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/payroll\\/public\\/timesheet\\/leaves\"}', '2024-02-17 13:28:19', '2024-02-17 05:13:12', '2024-02-17 13:28:19'),
('b9a17faa-9663-4ec3-9513-04dbfdf0d84c', 'App\\Notifications\\LeaveNotificationToAdmin', 'App\\Models\\User', 1, '{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/payroll\\/public\\/timesheet\\/leaves\"}', '2024-02-17 13:28:19', '2024-02-17 05:13:12', '2024-02-17 13:28:19'),
('bb0eeca4-310c-49ec-ab37-7fc64e0b6f0b', 'App\\Notifications\\LeaveNotificationToAdmin', 'App\\Models\\User', 66, '{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/payroll\\/public\\/timesheet\\/leaves\"}', NULL, '2024-02-17 05:13:12', '2024-02-17 05:13:12'),
('c221c764-aa12-474e-bfe3-a76d1e2917ca', 'App\\Notifications\\LeaveNotificationToAdmin', 'App\\Models\\User', 66, '{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/payroll\\/public\\/timesheet\\/leaves\"}', NULL, '2024-02-17 05:13:08', '2024-02-17 05:13:08'),
('c463b78e-bf47-4fe9-8818-4d3119f874c1', 'App\\Notifications\\LeaveNotificationToAdmin', 'App\\Models\\User', 64, '{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/payroll\\/public\\/timesheet\\/leaves\"}', NULL, '2024-02-17 05:13:08', '2024-02-17 05:13:08'),
('c633bd58-00e7-4fd5-83cb-a0c94a1c8651', 'App\\Notifications\\LeaveNotificationToAdmin', 'App\\Models\\User', 64, '{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/payroll\\/public\\/timesheet\\/leaves\"}', NULL, '2024-02-17 05:13:03', '2024-02-17 05:13:03'),
('dc2f3116-8f78-4fab-b9c8-f62a5b8898a8', 'App\\Notifications\\LeaveNotificationToAdmin', 'App\\Models\\User', 64, '{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/payroll\\/public\\/timesheet\\/leaves\"}', NULL, '2024-02-17 05:17:47', '2024-02-17 05:17:47'),
('e17126cd-b9a7-40e0-81c8-138979907e6c', 'App\\Notifications\\LeaveNotificationToAdmin', 'App\\Models\\User', 1, '{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/payroll\\/public\\/timesheet\\/leaves\"}', '2024-02-17 13:28:20', '2024-02-17 05:13:03', '2024-02-17 13:28:20'),
('ed13afae-d745-40fd-be7d-373949e2ea4b', 'App\\Notifications\\LeaveNotificationToAdmin', 'App\\Models\\User', 66, '{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/payroll\\/public\\/timesheet\\/leaves\"}', NULL, '2024-02-17 05:17:47', '2024-02-17 05:17:47');

-- --------------------------------------------------------

--
-- Table structure for table `nssa_tables`
--

CREATE TABLE `nssa_tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `posb_insuarance` varchar(255) DEFAULT NULL,
  `insuarance_ceiling` varchar(255) DEFAULT NULL,
  `posb_contribution` varchar(255) DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `last_updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_symbol` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nssa_tables`
--

INSERT INTO `nssa_tables` (`id`, `posb_insuarance`, `insuarance_ceiling`, `posb_contribution`, `currency_id`, `currency`, `last_updated_by`, `created_at`, `updated_at`, `currency_symbol`) VALUES
(1, '4.5', '900000', '0', 2, 'ZWL', 'Irfan Chowdhury', '2024-02-10 13:38:27', '2024-02-19 18:47:46', 'ZWL'),
(2, '9', '200', '1.2', 1, '$', 'Irfan Chowdhury', '2024-02-10 15:18:15', '2024-02-10 15:18:15', '$');

-- --------------------------------------------------------

--
-- Table structure for table `office_shifts`
--

CREATE TABLE `office_shifts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shift_name` varchar(191) NOT NULL,
  `default_shift` varchar(191) DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `sunday_in` varchar(191) DEFAULT NULL,
  `sunday_out` varchar(191) DEFAULT NULL,
  `saturday_in` varchar(191) DEFAULT NULL,
  `saturday_out` varchar(191) DEFAULT NULL,
  `friday_in` varchar(191) DEFAULT NULL,
  `friday_out` varchar(191) DEFAULT NULL,
  `thursday_in` varchar(191) DEFAULT NULL,
  `thursday_out` varchar(191) DEFAULT NULL,
  `wednesday_in` varchar(191) DEFAULT NULL,
  `wednesday_out` varchar(191) DEFAULT NULL,
  `tuesday_in` varchar(191) DEFAULT NULL,
  `tuesday_out` varchar(191) DEFAULT NULL,
  `monday_in` varchar(191) DEFAULT NULL,
  `monday_out` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `office_shifts`
--

INSERT INTO `office_shifts` (`id`, `shift_name`, `default_shift`, `company_id`, `sunday_in`, `sunday_out`, `saturday_in`, `saturday_out`, `friday_in`, `friday_out`, `thursday_in`, `thursday_out`, `wednesday_in`, `wednesday_out`, `tuesday_in`, `tuesday_out`, `monday_in`, `monday_out`, `created_at`, `updated_at`) VALUES
(1, 'Normal', NULL, 1, '', '', '07:00AM', '04:00PM', '07:00AM', '04:00PM', '07:00AM', '04:00PM', '07:00AM', '04:00PM', '07:00AM', '04:00PM', '07:00AM', '04:00PM', '2024-02-10 13:32:32', '2024-02-10 13:32:32');

-- --------------------------------------------------------

--
-- Table structure for table `official_documents`
--

CREATE TABLE `official_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `document_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `document_title` varchar(191) NOT NULL,
  `identification_number` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `document_file` varchar(191) DEFAULT NULL,
  `expiry_date` date NOT NULL,
  `is_notify` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('new@gmail.com', '$2y$10$day4AQ4g8sFvMwhMrTxpJuLXZCpVF2IK9kVS.6qZxeR6b7CVt2eGy', '2020-10-06 04:22:35'),
('irfanchowdhury80@gmail.com', '$2y$10$A/O/5nP81COvN7Kw/HPJheVB5H4EuZxSyFyc9dgiN2JZFONx1eoLO', '2023-07-29 04:27:12');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `method_name` varchar(40) NOT NULL,
  `payment_percentage` varchar(100) DEFAULT NULL,
  `account_number` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payslips`
--

CREATE TABLE `payslips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payslip_key` char(36) NOT NULL,
  `payslip_number` varchar(191) DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `payment_type` varchar(191) NOT NULL,
  `basic_salary` double NOT NULL,
  `net_salary` double NOT NULL,
  `allowances` text NOT NULL,
  `commissions` text NOT NULL,
  `loans` text NOT NULL,
  `deductions` text NOT NULL,
  `overtimes` text NOT NULL,
  `other_payments` text NOT NULL,
  `pension_type` varchar(50) DEFAULT NULL,
  `pension_amount` double NOT NULL,
  `hours_worked` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `month_year` varchar(15) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `net_salary_zwl` double NOT NULL DEFAULT 0,
  `tax_credits` text DEFAULT '[]',
  `apwcs_contribution` text NOT NULL DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payslips`
--

INSERT INTO `payslips` (`id`, `payslip_key`, `payslip_number`, `employee_id`, `company_id`, `payment_type`, `basic_salary`, `net_salary`, `allowances`, `commissions`, `loans`, `deductions`, `overtimes`, `other_payments`, `pension_type`, `pension_amount`, `hours_worked`, `status`, `month_year`, `created_at`, `updated_at`, `net_salary_zwl`, `tax_credits`, `apwcs_contribution`) VALUES
(17, 'Rp5FdFzk6mrevvPivOe9', '8793781308', 64, 1, 'Monthly', 560, 560, '[]', '[]', '[]', '[]', '[]', '[]', NULL, 0, 0, 1, 'January-2024', '2024-02-13 11:23:37', '2024-02-13 11:23:37', 0, NULL, '[]'),
(18, 'BtuF79hn2omtBBbk1Tuc', '3991102892', 64, 1, 'Monthly', 560, 394.73, '[]', '[]', '[]', '[{\"id\":191,\"employee_id\":64,\"month_year\":\"December-2024\",\"first_date\":\"2024-12-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"105\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:28:07.000000Z\",\"updated_at\":\"2024-02-13T11:28:07.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":192,\"employee_id\":64,\"month_year\":\"December-2024\",\"first_date\":\"2024-12-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:28:07.000000Z\",\"updated_at\":\"2024-02-13T11:28:07.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":193,\"employee_id\":64,\"month_year\":\"December-2024\",\"first_date\":\"2024-12-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"3.15\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:28:07.000000Z\",\"updated_at\":\"2024-02-13T11:28:07.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":194,\"employee_id\":64,\"month_year\":\"December-2024\",\"first_date\":\"2024-12-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:28:07.000000Z\",\"updated_at\":\"2024-02-13T11:28:07.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":195,\"employee_id\":64,\"month_year\":\"December-2024\",\"first_date\":\"2024-12-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"50.4\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:28:07.000000Z\",\"updated_at\":\"2024-02-13T11:28:07.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":560,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":196,\"employee_id\":64,\"month_year\":\"December-2024\",\"first_date\":\"2024-12-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:28:07.000000Z\",\"updated_at\":\"2024-02-13T11:28:07.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":197,\"employee_id\":64,\"month_year\":\"December-2024\",\"first_date\":\"2024-12-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"6.72\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:28:07.000000Z\",\"updated_at\":\"2024-02-13T11:28:07.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":560,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":198,\"employee_id\":64,\"month_year\":\"December-2024\",\"first_date\":\"2024-12-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:28:07.000000Z\",\"updated_at\":\"2024-02-13T11:28:07.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0}]', '[]', '[]', NULL, 0, 0, 1, 'December-2024', '2024-02-13 11:28:07', '2024-02-13 11:28:07', 0, NULL, '[]'),
(19, 'idu0NeEXNuDW4nG6Uz3S', '9081089622', 64, 1, 'Monthly', 560, 394.73, '[{\"id\":4,\"employee_id\":64,\"month_year\":\"July-2024\",\"first_date\":\"2024-07-01\",\"allowance_title\":\"Airtime\",\"allowance_amount\":\"1600000\",\"is_taxable\":1,\"created_at\":\"2024-02-13T11:38:27.000000Z\",\"updated_at\":\"2024-02-13T11:38:27.000000Z\",\"currency_id\":2,\"currency_symbol\":\"ZWL\",\"deductible_amt\":100}]', '[]', '[]', '[{\"id\":199,\"employee_id\":64,\"month_year\":\"July-2024\",\"first_date\":\"2024-07-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"105\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:38:59.000000Z\",\"updated_at\":\"2024-02-13T11:38:59.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":200,\"employee_id\":64,\"month_year\":\"July-2024\",\"first_date\":\"2024-07-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"279495.03\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:38:59.000000Z\",\"updated_at\":\"2024-02-13T11:38:59.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":201,\"employee_id\":64,\"month_year\":\"July-2024\",\"first_date\":\"2024-07-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"3.15\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:38:59.000000Z\",\"updated_at\":\"2024-02-13T11:38:59.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":202,\"employee_id\":64,\"month_year\":\"July-2024\",\"first_date\":\"2024-07-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"8384.8509\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:38:59.000000Z\",\"updated_at\":\"2024-02-13T11:38:59.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":203,\"employee_id\":64,\"month_year\":\"July-2024\",\"first_date\":\"2024-07-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"50.4\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:38:59.000000Z\",\"updated_at\":\"2024-02-13T11:38:59.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":560,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":204,\"employee_id\":64,\"month_year\":\"July-2024\",\"first_date\":\"2024-07-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"144000\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:38:59.000000Z\",\"updated_at\":\"2024-02-13T11:38:59.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":1600000,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":205,\"employee_id\":64,\"month_year\":\"July-2024\",\"first_date\":\"2024-07-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"6.72\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:38:59.000000Z\",\"updated_at\":\"2024-02-13T11:38:59.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":560,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":206,\"employee_id\":64,\"month_year\":\"July-2024\",\"first_date\":\"2024-07-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"19200\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:38:59.000000Z\",\"updated_at\":\"2024-02-13T11:38:59.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":1600000,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0}]', '[]', '[]', NULL, 0, 0, 1, 'July-2024', '2024-02-13 11:38:59', '2024-02-13 11:38:59', 1148920.1191, NULL, '[]'),
(20, '1ZohSHQ8nZx4hLmSllBP', '7866729771', 64, 1, 'Monthly', 560, 409.4384, '[{\"id\":4,\"employee_id\":64,\"month_year\":\"July-2024\",\"first_date\":\"2024-07-01\",\"allowance_title\":\"Airtime\",\"allowance_amount\":\"1600000\",\"is_taxable\":1,\"created_at\":\"2024-02-13T11:38:27.000000Z\",\"updated_at\":\"2024-02-13T11:38:27.000000Z\",\"currency_id\":2,\"currency_symbol\":\"ZWL\",\"deductible_amt\":100}]', '[]', '[]', '[{\"id\":207,\"employee_id\":64,\"month_year\":\"August-2024\",\"first_date\":\"2024-08-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"90.72\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:44:47.000000Z\",\"updated_at\":\"2024-02-13T11:44:47.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":208,\"employee_id\":64,\"month_year\":\"August-2024\",\"first_date\":\"2024-08-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"238695.03\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:44:47.000000Z\",\"updated_at\":\"2024-02-13T11:44:47.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":209,\"employee_id\":64,\"month_year\":\"August-2024\",\"first_date\":\"2024-08-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"2.7216\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:44:47.000000Z\",\"updated_at\":\"2024-02-13T11:44:47.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":210,\"employee_id\":64,\"month_year\":\"August-2024\",\"first_date\":\"2024-08-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"7160.8509\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:44:47.000000Z\",\"updated_at\":\"2024-02-13T11:44:47.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":211,\"employee_id\":64,\"month_year\":\"August-2024\",\"first_date\":\"2024-08-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"50.4\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:44:47.000000Z\",\"updated_at\":\"2024-02-13T11:44:47.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":560,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":212,\"employee_id\":64,\"month_year\":\"August-2024\",\"first_date\":\"2024-08-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"144000\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:44:47.000000Z\",\"updated_at\":\"2024-02-13T11:44:47.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":1600000,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":213,\"employee_id\":64,\"month_year\":\"August-2024\",\"first_date\":\"2024-08-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"6.72\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:44:47.000000Z\",\"updated_at\":\"2024-02-13T11:44:47.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":560,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":214,\"employee_id\":64,\"month_year\":\"August-2024\",\"first_date\":\"2024-08-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"19200\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:44:47.000000Z\",\"updated_at\":\"2024-02-13T11:44:47.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":1600000,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0}]', '[]', '[]', NULL, 0, 0, 1, 'August-2024', '2024-02-13 11:44:47', '2024-02-13 11:44:47', 1190944.1191, NULL, '[]'),
(21, 'BeB3ZkvXNlnif3MROBGw', '1490823039', 64, 1, 'Monthly', 560, 409.4384, '[{\"id\":4,\"employee_id\":64,\"month_year\":\"July-2024\",\"first_date\":\"2024-07-01\",\"allowance_title\":\"Airtime\",\"allowance_amount\":\"1600000\",\"is_taxable\":1,\"created_at\":\"2024-02-13T11:38:27.000000Z\",\"updated_at\":\"2024-02-13T11:38:27.000000Z\",\"currency_id\":2,\"currency_symbol\":\"ZWL\",\"deductible_amt\":100}]', '[]', '[]', '[{\"id\":215,\"employee_id\":64,\"month_year\":\"September-2024\",\"first_date\":\"2024-09-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"90.72\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:47:21.000000Z\",\"updated_at\":\"2024-02-13T11:47:21.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":502.88,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":216,\"employee_id\":64,\"month_year\":\"September-2024\",\"first_date\":\"2024-09-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"238695.03\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:47:21.000000Z\",\"updated_at\":\"2024-02-13T11:47:21.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":1436800,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":217,\"employee_id\":64,\"month_year\":\"September-2024\",\"first_date\":\"2024-09-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"2.7216\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:47:21.000000Z\",\"updated_at\":\"2024-02-13T11:47:21.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":218,\"employee_id\":64,\"month_year\":\"September-2024\",\"first_date\":\"2024-09-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"7160.8509\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:47:21.000000Z\",\"updated_at\":\"2024-02-13T11:47:21.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":219,\"employee_id\":64,\"month_year\":\"September-2024\",\"first_date\":\"2024-09-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"50.4\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:47:21.000000Z\",\"updated_at\":\"2024-02-13T11:47:21.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":560,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":220,\"employee_id\":64,\"month_year\":\"September-2024\",\"first_date\":\"2024-09-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"144000\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:47:21.000000Z\",\"updated_at\":\"2024-02-13T11:47:21.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":1600000,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":221,\"employee_id\":64,\"month_year\":\"September-2024\",\"first_date\":\"2024-09-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"6.72\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:47:21.000000Z\",\"updated_at\":\"2024-02-13T11:47:21.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":560,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":222,\"employee_id\":64,\"month_year\":\"September-2024\",\"first_date\":\"2024-09-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"19200\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T11:47:21.000000Z\",\"updated_at\":\"2024-02-13T11:47:21.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":1600000,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0}]', '[]', '[]', NULL, 0, 0, 1, 'September-2024', '2024-02-13 11:47:21', '2024-02-13 11:47:21', 1190944.1191, NULL, '[]'),
(22, 'b6ttYyXXQig8JI7Fftct', '8116487874', 66, 1, 'Monthly', 600, 420.35, '[]', '[]', '[]', '[{\"id\":223,\"employee_id\":66,\"month_year\":\"October-2024\",\"first_date\":\"2024-10-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"115\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-15T14:32:44.000000Z\",\"updated_at\":\"2024-02-15T14:32:44.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":600,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":224,\"employee_id\":66,\"month_year\":\"October-2024\",\"first_date\":\"2024-10-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-15T14:32:44.000000Z\",\"updated_at\":\"2024-02-15T14:32:44.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":225,\"employee_id\":66,\"month_year\":\"October-2024\",\"first_date\":\"2024-10-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"3.45\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-15T14:32:44.000000Z\",\"updated_at\":\"2024-02-15T14:32:44.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":226,\"employee_id\":66,\"month_year\":\"October-2024\",\"first_date\":\"2024-10-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-15T14:32:44.000000Z\",\"updated_at\":\"2024-02-15T14:32:44.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":227,\"employee_id\":66,\"month_year\":\"October-2024\",\"first_date\":\"2024-10-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"54\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-15T14:32:44.000000Z\",\"updated_at\":\"2024-02-15T14:32:44.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":228,\"employee_id\":66,\"month_year\":\"October-2024\",\"first_date\":\"2024-10-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-15T14:32:44.000000Z\",\"updated_at\":\"2024-02-15T14:32:44.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":229,\"employee_id\":66,\"month_year\":\"October-2024\",\"first_date\":\"2024-10-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"7.2\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-15T14:32:44.000000Z\",\"updated_at\":\"2024-02-15T14:32:44.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":230,\"employee_id\":66,\"month_year\":\"October-2024\",\"first_date\":\"2024-10-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-15T14:32:44.000000Z\",\"updated_at\":\"2024-02-15T14:32:44.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0}]', '[]', '[]', NULL, 0, 0, 1, 'October-2024', '2024-02-15 14:32:44', '2024-02-15 14:32:44', 0, '[{\"id\":224,\"employee_id\":66,\"month_year\":\"October-2024\",\"first_date\":\"2024-10-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-15T14:32:44.000000Z\",\"updated_at\":\"2024-02-15T', '[]'),
(23, 's7WrmQhWReh9oNeVfOUl', '4454056398', 66, 1, 'Monthly', 600, 272.218, '[]', '[]', '[]', '[{\"id\":231,\"employee_id\":66,\"month_year\":\"November-2024\",\"first_date\":\"2024-11-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"99.7\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-15T14:52:00.000000Z\",\"updated_at\":\"2024-02-15T14:52:00.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":538.8,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":232,\"employee_id\":66,\"month_year\":\"November-2024\",\"first_date\":\"2024-11-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-15T14:52:00.000000Z\",\"updated_at\":\"2024-02-15T14:52:00.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":233,\"employee_id\":66,\"month_year\":\"November-2024\",\"first_date\":\"2024-11-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"2.991\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-15T14:52:00.000000Z\",\"updated_at\":\"2024-02-15T14:52:00.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":234,\"employee_id\":66,\"month_year\":\"November-2024\",\"first_date\":\"2024-11-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-15T14:52:00.000000Z\",\"updated_at\":\"2024-02-15T14:52:00.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":235,\"employee_id\":66,\"month_year\":\"November-2024\",\"first_date\":\"2024-11-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"54\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-15T14:52:00.000000Z\",\"updated_at\":\"2024-02-15T14:52:00.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":236,\"employee_id\":66,\"month_year\":\"November-2024\",\"first_date\":\"2024-11-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-15T14:52:00.000000Z\",\"updated_at\":\"2024-02-15T14:52:00.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":237,\"employee_id\":66,\"month_year\":\"November-2024\",\"first_date\":\"2024-11-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"7.2\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-15T14:52:00.000000Z\",\"updated_at\":\"2024-02-15T14:52:00.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":238,\"employee_id\":66,\"month_year\":\"November-2024\",\"first_date\":\"2024-11-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-15T14:52:00.000000Z\",\"updated_at\":\"2024-02-15T14:52:00.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":239,\"employee_id\":66,\"month_year\":\"November-2024\",\"first_date\":\"2024-11-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"99.7\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-15T14:55:26.000000Z\",\"updated_at\":\"2024-02-15T14:55:26.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":538.8,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":240,\"employee_id\":66,\"month_year\":\"November-2024\",\"first_date\":\"2024-11-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-15T14:55:26.000000Z\",\"updated_at\":\"2024-02-15T14:55:26.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":241,\"employee_id\":66,\"month_year\":\"November-2024\",\"first_date\":\"2024-11-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"2.991\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-15T14:55:26.000000Z\",\"updated_at\":\"2024-02-15T14:55:26.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":242,\"employee_id\":66,\"month_year\":\"November-2024\",\"first_date\":\"2024-11-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-15T14:55:26.000000Z\",\"updated_at\":\"2024-02-15T14:55:26.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":243,\"employee_id\":66,\"month_year\":\"November-2024\",\"first_date\":\"2024-11-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"54\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-15T14:55:26.000000Z\",\"updated_at\":\"2024-02-15T14:55:26.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":244,\"employee_id\":66,\"month_year\":\"November-2024\",\"first_date\":\"2024-11-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-15T14:55:26.000000Z\",\"updated_at\":\"2024-02-15T14:55:26.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":245,\"employee_id\":66,\"month_year\":\"November-2024\",\"first_date\":\"2024-11-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"7.2\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-15T14:55:26.000000Z\",\"updated_at\":\"2024-02-15T14:55:26.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":246,\"employee_id\":66,\"month_year\":\"November-2024\",\"first_date\":\"2024-11-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-15T14:55:26.000000Z\",\"updated_at\":\"2024-02-15T14:55:26.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0}]', '[]', '[]', NULL, 0, 0, 1, 'November-2024', '2024-02-15 14:55:26', '2024-02-15 14:55:26', 0, '[{\"id\":2,\"employee_id\":66,\"month_year\":\"October-2024\",\"first_date\":\"2024-10-01\",\"deduction_title\":\"eee\",\"deduction_amount\":\"20\",\"deduction_type\":\"\",\"currency_id\":1,\"currency_symbol\":\"$\",\"created_at\":\"2024-02-15T13:50:42.000000Z\",\"updated_at\":\"2024-02-15T1', '[]'),
(24, 'dlU07BeRtZKhPjsDIah0', '7529714913', 66, 1, 'Monthly', 600, 451.868, '[]', '[]', '[]', '[{\"id\":247,\"employee_id\":66,\"month_year\":\"December-2024\",\"first_date\":\"2024-12-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"84.4\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T05:58:31.000000Z\",\"updated_at\":\"2024-02-16T05:58:31.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":477.6,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":248,\"employee_id\":66,\"month_year\":\"December-2024\",\"first_date\":\"2024-12-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T05:58:31.000000Z\",\"updated_at\":\"2024-02-16T05:58:31.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":249,\"employee_id\":66,\"month_year\":\"December-2024\",\"first_date\":\"2024-12-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"2.532\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T05:58:31.000000Z\",\"updated_at\":\"2024-02-16T05:58:31.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":250,\"employee_id\":66,\"month_year\":\"December-2024\",\"first_date\":\"2024-12-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T05:58:31.000000Z\",\"updated_at\":\"2024-02-16T05:58:31.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":251,\"employee_id\":66,\"month_year\":\"December-2024\",\"first_date\":\"2024-12-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"54\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T05:58:31.000000Z\",\"updated_at\":\"2024-02-16T05:58:31.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":252,\"employee_id\":66,\"month_year\":\"December-2024\",\"first_date\":\"2024-12-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T05:58:31.000000Z\",\"updated_at\":\"2024-02-16T05:58:31.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":253,\"employee_id\":66,\"month_year\":\"December-2024\",\"first_date\":\"2024-12-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"7.2\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T05:58:31.000000Z\",\"updated_at\":\"2024-02-16T05:58:31.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":254,\"employee_id\":66,\"month_year\":\"December-2024\",\"first_date\":\"2024-12-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T05:58:31.000000Z\",\"updated_at\":\"2024-02-16T05:58:31.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0}]', '[]', '[]', NULL, 0, 0, 1, 'December-2024', '2024-02-16 05:58:31', '2024-02-16 05:58:31', 0, '[{\"id\":2,\"employee_id\":66,\"month_year\":\"October-2024\",\"first_date\":\"2024-10-01\",\"deduction_title\":\"eee\",\"deduction_amount\":\"20\",\"deduction_type\":\"\",\"currency_id\":1,\"currency_symbol\":\"$\",\"created_at\":\"2024-02-15T13:50:42.000000Z\",\"updated_at\":\"2024-02-15T1', '[]'),
(25, 'ia57SR0e71gwJbswufOe', '2344039589', 66, 1, 'Monthly', 600, 436.109, '[]', '[]', '[]', '[{\"id\":256,\"employee_id\":66,\"month_year\":\"January-2025\",\"first_date\":\"2025-01-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:01:12.000000Z\",\"updated_at\":\"2024-02-16T06:01:12.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":257,\"employee_id\":66,\"month_year\":\"January-2025\",\"first_date\":\"2025-01-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"2.991\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:01:12.000000Z\",\"updated_at\":\"2024-02-16T06:01:12.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":258,\"employee_id\":66,\"month_year\":\"January-2025\",\"first_date\":\"2025-01-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:01:12.000000Z\",\"updated_at\":\"2024-02-16T06:01:12.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":259,\"employee_id\":66,\"month_year\":\"January-2025\",\"first_date\":\"2025-01-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"54\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:01:12.000000Z\",\"updated_at\":\"2024-02-16T06:01:12.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":260,\"employee_id\":66,\"month_year\":\"January-2025\",\"first_date\":\"2025-01-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:01:12.000000Z\",\"updated_at\":\"2024-02-16T06:01:12.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":261,\"employee_id\":66,\"month_year\":\"January-2025\",\"first_date\":\"2025-01-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"7.2\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:01:12.000000Z\",\"updated_at\":\"2024-02-16T06:01:12.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":262,\"employee_id\":66,\"month_year\":\"January-2025\",\"first_date\":\"2025-01-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:01:12.000000Z\",\"updated_at\":\"2024-02-16T06:01:12.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":255,\"employee_id\":66,\"month_year\":\"January-2025\",\"first_date\":\"2025-01-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"99.7\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:01:12.000000Z\",\"updated_at\":\"2024-02-16T06:01:12.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":538.8,\"is_zimra_income\":0,\"is_zimra_aids\":0}]', '[]', '[]', NULL, 0, 0, 1, 'January-2025', '2024-02-16 06:01:12', '2024-02-16 06:01:12', 0, '[{\"id\":2,\"employee_id\":66,\"month_year\":\"October-2024\",\"first_date\":\"2024-10-01\",\"deduction_title\":\"eee\",\"deduction_amount\":\"20\",\"deduction_type\":\"\",\"currency_id\":1,\"currency_symbol\":\"$\",\"created_at\":\"2024-02-15T13:50:42.000000Z\",\"updated_at\":\"2024-02-15T1', '[]'),
(26, 'mwK1RRsIGThk7TMnkdHT', '9779292340', 66, 1, 'Monthly', 600, 436.109, '[]', '[]', '[]', '[{\"id\":263,\"employee_id\":66,\"month_year\":\"February-2025\",\"first_date\":\"2025-02-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"99.7\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:02:25.000000Z\",\"updated_at\":\"2024-02-16T06:02:25.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":538.8,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":264,\"employee_id\":66,\"month_year\":\"February-2025\",\"first_date\":\"2025-02-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:02:25.000000Z\",\"updated_at\":\"2024-02-16T06:02:25.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":265,\"employee_id\":66,\"month_year\":\"February-2025\",\"first_date\":\"2025-02-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"2.991\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:02:25.000000Z\",\"updated_at\":\"2024-02-16T06:02:25.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":266,\"employee_id\":66,\"month_year\":\"February-2025\",\"first_date\":\"2025-02-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:02:25.000000Z\",\"updated_at\":\"2024-02-16T06:02:25.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":267,\"employee_id\":66,\"month_year\":\"February-2025\",\"first_date\":\"2025-02-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"54\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:02:25.000000Z\",\"updated_at\":\"2024-02-16T06:02:25.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":268,\"employee_id\":66,\"month_year\":\"February-2025\",\"first_date\":\"2025-02-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:02:25.000000Z\",\"updated_at\":\"2024-02-16T06:02:25.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":269,\"employee_id\":66,\"month_year\":\"February-2025\",\"first_date\":\"2025-02-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"7.2\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:02:25.000000Z\",\"updated_at\":\"2024-02-16T06:02:25.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":270,\"employee_id\":66,\"month_year\":\"February-2025\",\"first_date\":\"2025-02-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:02:25.000000Z\",\"updated_at\":\"2024-02-16T06:02:25.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0}]', '[]', '[]', NULL, 0, 0, 1, 'February-2025', '2024-02-16 06:02:25', '2024-02-16 06:02:25', 0, '[{\"id\":2,\"employee_id\":66,\"month_year\":\"October-2024\",\"first_date\":\"2024-10-01\",\"deduction_title\":\"eee\",\"deduction_amount\":\"20\",\"deduction_type\":\"\",\"currency_id\":1,\"currency_symbol\":\"$\",\"created_at\":\"2024-02-15T13:50:42.000000Z\",\"updated_at\":\"2024-02-15T1', '[]');
INSERT INTO `payslips` (`id`, `payslip_key`, `payslip_number`, `employee_id`, `company_id`, `payment_type`, `basic_salary`, `net_salary`, `allowances`, `commissions`, `loans`, `deductions`, `overtimes`, `other_payments`, `pension_type`, `pension_amount`, `hours_worked`, `status`, `month_year`, `created_at`, `updated_at`, `net_salary_zwl`, `tax_credits`, `apwcs_contribution`) VALUES
(27, 'NW3NAL0pB0w2BftzL3xy', '6598128394', 66, 1, 'Monthly', 600, 436.109, '[]', '[]', '[]', '[{\"id\":271,\"employee_id\":66,\"month_year\":\"March-2025\",\"first_date\":\"2025-03-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"99.7\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:04:05.000000Z\",\"updated_at\":\"2024-02-16T06:04:05.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":538.8,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":272,\"employee_id\":66,\"month_year\":\"March-2025\",\"first_date\":\"2025-03-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:04:05.000000Z\",\"updated_at\":\"2024-02-16T06:04:05.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":273,\"employee_id\":66,\"month_year\":\"March-2025\",\"first_date\":\"2025-03-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"2.991\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:04:05.000000Z\",\"updated_at\":\"2024-02-16T06:04:05.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":274,\"employee_id\":66,\"month_year\":\"March-2025\",\"first_date\":\"2025-03-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:04:05.000000Z\",\"updated_at\":\"2024-02-16T06:04:05.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":275,\"employee_id\":66,\"month_year\":\"March-2025\",\"first_date\":\"2025-03-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"54\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:04:05.000000Z\",\"updated_at\":\"2024-02-16T06:04:05.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":276,\"employee_id\":66,\"month_year\":\"March-2025\",\"first_date\":\"2025-03-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:04:05.000000Z\",\"updated_at\":\"2024-02-16T06:04:05.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":277,\"employee_id\":66,\"month_year\":\"March-2025\",\"first_date\":\"2025-03-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"7.2\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:04:05.000000Z\",\"updated_at\":\"2024-02-16T06:04:05.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":278,\"employee_id\":66,\"month_year\":\"March-2025\",\"first_date\":\"2025-03-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:04:05.000000Z\",\"updated_at\":\"2024-02-16T06:04:05.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0}]', '[]', '[]', NULL, 0, 0, 1, 'March-2025', '2024-02-16 06:04:05', '2024-02-16 06:04:05', 0, '[{\"id\":2,\"employee_id\":66,\"month_year\":\"October-2024\",\"first_date\":\"2024-10-01\",\"deduction_title\":\"eee\",\"deduction_amount\":\"20\",\"deduction_type\":\"\",\"currency_id\":1,\"currency_symbol\":\"$\",\"created_at\":\"2024-02-15T13:50:42.000000Z\",\"updated_at\":\"2024-02-15T1', '[]'),
(28, 'nMgk6d8BdWstqUmLe2Vt', '2500690063', 66, 1, 'Monthly', 600, 436.109, '[]', '[]', '[]', '[{\"id\":279,\"employee_id\":66,\"month_year\":\"April-2025\",\"first_date\":\"2025-04-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"99.7\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:06:01.000000Z\",\"updated_at\":\"2024-02-16T06:06:01.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":538.8,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":280,\"employee_id\":66,\"month_year\":\"April-2025\",\"first_date\":\"2025-04-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:06:01.000000Z\",\"updated_at\":\"2024-02-16T06:06:01.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":281,\"employee_id\":66,\"month_year\":\"April-2025\",\"first_date\":\"2025-04-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"2.991\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:06:01.000000Z\",\"updated_at\":\"2024-02-16T06:06:01.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":282,\"employee_id\":66,\"month_year\":\"April-2025\",\"first_date\":\"2025-04-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:06:01.000000Z\",\"updated_at\":\"2024-02-16T06:06:01.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":283,\"employee_id\":66,\"month_year\":\"April-2025\",\"first_date\":\"2025-04-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"54\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:06:01.000000Z\",\"updated_at\":\"2024-02-16T06:06:01.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":284,\"employee_id\":66,\"month_year\":\"April-2025\",\"first_date\":\"2025-04-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:06:01.000000Z\",\"updated_at\":\"2024-02-16T06:06:01.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":285,\"employee_id\":66,\"month_year\":\"April-2025\",\"first_date\":\"2025-04-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"7.2\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:06:01.000000Z\",\"updated_at\":\"2024-02-16T06:06:01.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":286,\"employee_id\":66,\"month_year\":\"April-2025\",\"first_date\":\"2025-04-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:06:01.000000Z\",\"updated_at\":\"2024-02-16T06:06:01.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0}]', '[]', '[]', NULL, 0, 0, 1, 'April-2025', '2024-02-16 06:06:01', '2024-02-16 06:06:01', 0, '[{\"id\":2,\"employee_id\":66,\"month_year\":\"October-2024\",\"first_date\":\"2024-10-01\",\"deduction_title\":\"eee\",\"deduction_amount\":\"20\",\"deduction_type\":\"\",\"currency_id\":1,\"currency_symbol\":\"$\",\"created_at\":\"2024-02-15T13:50:42.000000Z\",\"updated_at\":\"2024-02-15T14:31:42.000000Z\"}]', '[]'),
(29, 'aob7NZJnJd5ng2vrujAZ', '3785776142', 66, 1, 'Monthly', 600, 436.109, '[]', '[]', '[]', '[{\"id\":287,\"employee_id\":66,\"month_year\":\"May-2025\",\"first_date\":\"2025-05-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"99.7\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:14:34.000000Z\",\"updated_at\":\"2024-02-16T06:14:34.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":538.8,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":288,\"employee_id\":66,\"month_year\":\"May-2025\",\"first_date\":\"2025-05-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"-10\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:14:34.000000Z\",\"updated_at\":\"2024-02-16T06:14:34.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":289,\"employee_id\":66,\"month_year\":\"May-2025\",\"first_date\":\"2025-05-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"2.991\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:14:34.000000Z\",\"updated_at\":\"2024-02-16T06:14:34.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":290,\"employee_id\":66,\"month_year\":\"May-2025\",\"first_date\":\"2025-05-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"-0.3\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:14:34.000000Z\",\"updated_at\":\"2024-02-16T06:14:34.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":291,\"employee_id\":66,\"month_year\":\"May-2025\",\"first_date\":\"2025-05-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"54\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:14:34.000000Z\",\"updated_at\":\"2024-02-16T06:14:34.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":292,\"employee_id\":66,\"month_year\":\"May-2025\",\"first_date\":\"2025-05-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:14:34.000000Z\",\"updated_at\":\"2024-02-16T06:14:34.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":293,\"employee_id\":66,\"month_year\":\"May-2025\",\"first_date\":\"2025-05-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"7.2\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:14:34.000000Z\",\"updated_at\":\"2024-02-16T06:14:34.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":294,\"employee_id\":66,\"month_year\":\"May-2025\",\"first_date\":\"2025-05-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T06:14:34.000000Z\",\"updated_at\":\"2024-02-16T06:14:34.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0}]', '[]', '[]', NULL, 0, 0, 1, 'May-2025', '2024-02-16 06:14:34', '2024-02-16 06:14:34', 10.3, '[{\"id\":2,\"employee_id\":66,\"month_year\":\"October-2024\",\"first_date\":\"2024-10-01\",\"deduction_title\":\"eee\",\"deduction_amount\":\"20\",\"deduction_type\":\"\",\"currency_id\":2,\"currency_symbol\":\"ZWL\",\"created_at\":\"2024-02-15T13:50:42.000000Z\",\"updated_at\":\"2024-02-16T06:13:56.000000Z\"}]', '[]'),
(30, 'FYzp2u8n2WOXCjXivwmN', '1981373437', 65, 1, 'Monthly', 800, 800, '[]', '[]', '[]', '[{\"id\":295,\"employee_id\":65,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"-10\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T08:25:07.000000Z\",\"updated_at\":\"2024-02-16T08:25:07.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":296,\"employee_id\":65,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T08:25:07.000000Z\",\"updated_at\":\"2024-02-16T08:25:07.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":297,\"employee_id\":65,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"-0.3\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T08:25:07.000000Z\",\"updated_at\":\"2024-02-16T08:25:07.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":298,\"employee_id\":65,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T08:25:07.000000Z\",\"updated_at\":\"2024-02-16T08:25:07.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":299,\"employee_id\":65,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T08:25:07.000000Z\",\"updated_at\":\"2024-02-16T08:25:07.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":300,\"employee_id\":65,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T08:25:07.000000Z\",\"updated_at\":\"2024-02-16T08:25:07.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":301,\"employee_id\":65,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T08:25:07.000000Z\",\"updated_at\":\"2024-02-16T08:25:07.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":302,\"employee_id\":65,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T08:25:07.000000Z\",\"updated_at\":\"2024-02-16T08:25:07.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0}]', '[]', '[]', NULL, 0, 0, 1, 'February-2024', '2024-02-16 08:25:07', '2024-02-16 08:25:07', 0, '[]', '[]'),
(31, '7eoXSBYtyOG6lI9XEZpx', '4809088151', 65, 1, 'Monthly', 800, 810.3, '[]', '[]', '[]', '[{\"id\":303,\"employee_id\":65,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"-10\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T08:27:21.000000Z\",\"updated_at\":\"2024-02-16T08:27:21.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":304,\"employee_id\":65,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T08:27:21.000000Z\",\"updated_at\":\"2024-02-16T08:27:21.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":305,\"employee_id\":65,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"-0.3\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T08:27:21.000000Z\",\"updated_at\":\"2024-02-16T08:27:21.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":306,\"employee_id\":65,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T08:27:21.000000Z\",\"updated_at\":\"2024-02-16T08:27:21.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":307,\"employee_id\":65,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T08:27:21.000000Z\",\"updated_at\":\"2024-02-16T08:27:21.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":308,\"employee_id\":65,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T08:27:21.000000Z\",\"updated_at\":\"2024-02-16T08:27:21.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":309,\"employee_id\":65,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T08:27:21.000000Z\",\"updated_at\":\"2024-02-16T08:27:21.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":310,\"employee_id\":65,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T08:27:21.000000Z\",\"updated_at\":\"2024-02-16T08:27:21.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0}]', '[]', '[]', NULL, 0, 0, 1, 'March-2024', '2024-02-16 08:27:21', '2024-02-16 08:27:21', 0, '[]', '[]'),
(32, 'TntGkFz2AL8I5j7MA7HO', '6458673880', 65, 1, 'Monthly', 800, 810.3, '[]', '[]', '[]', '[{\"id\":311,\"employee_id\":65,\"month_year\":\"April-2024\",\"first_date\":\"2024-04-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"-10\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T08:30:23.000000Z\",\"updated_at\":\"2024-02-16T08:30:23.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":312,\"employee_id\":65,\"month_year\":\"April-2024\",\"first_date\":\"2024-04-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T08:30:23.000000Z\",\"updated_at\":\"2024-02-16T08:30:23.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":313,\"employee_id\":65,\"month_year\":\"April-2024\",\"first_date\":\"2024-04-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"-0.3\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T08:30:23.000000Z\",\"updated_at\":\"2024-02-16T08:30:23.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":314,\"employee_id\":65,\"month_year\":\"April-2024\",\"first_date\":\"2024-04-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T08:30:23.000000Z\",\"updated_at\":\"2024-02-16T08:30:23.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":315,\"employee_id\":65,\"month_year\":\"April-2024\",\"first_date\":\"2024-04-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T08:30:23.000000Z\",\"updated_at\":\"2024-02-16T08:30:23.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":316,\"employee_id\":65,\"month_year\":\"April-2024\",\"first_date\":\"2024-04-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T08:30:23.000000Z\",\"updated_at\":\"2024-02-16T08:30:23.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":317,\"employee_id\":65,\"month_year\":\"April-2024\",\"first_date\":\"2024-04-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T08:30:23.000000Z\",\"updated_at\":\"2024-02-16T08:30:23.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":318,\"employee_id\":65,\"month_year\":\"April-2024\",\"first_date\":\"2024-04-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-16T08:30:23.000000Z\",\"updated_at\":\"2024-02-16T08:30:23.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0}]', '[]', '[]', NULL, 0, 0, 1, 'April-2024', '2024-02-16 08:30:23', '2024-02-16 08:30:23', 0, '[{\"id\":4,\"employee_id\":65,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Medical IAD\",\"deduction_amount\":\"10\",\"deduction_type\":\"\",\"currency_id\":1,\"currency_symbol\":\"$\",\"created_at\":\"2024-02-16T08:24:49.000000Z\",\"updated_at\":\"2024-02-16T08:24:49.000000Z\"}]', '[]'),
(33, 'xcBHgYcbHxaH7iIMCUxN', '6579916356', 64, 1, 'Monthly', 560, 108.3152, '[]', '[]', '[]', '[{\"id\":319,\"employee_id\":64,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"105\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:13:41.000000Z\",\"updated_at\":\"2024-02-17T12:13:41.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":560,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":320,\"employee_id\":64,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:13:41.000000Z\",\"updated_at\":\"2024-02-17T12:13:41.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":321,\"employee_id\":64,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"3.15\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:13:41.000000Z\",\"updated_at\":\"2024-02-17T12:13:41.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":322,\"employee_id\":64,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:13:41.000000Z\",\"updated_at\":\"2024-02-17T12:13:41.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":323,\"employee_id\":64,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"50.4\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:13:41.000000Z\",\"updated_at\":\"2024-02-17T12:13:41.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":560,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":324,\"employee_id\":64,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:13:41.000000Z\",\"updated_at\":\"2024-02-17T12:13:41.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":325,\"employee_id\":64,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"6.72\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:13:41.000000Z\",\"updated_at\":\"2024-02-17T12:13:41.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":560,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":326,\"employee_id\":64,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:13:41.000000Z\",\"updated_at\":\"2024-02-17T12:13:41.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":343,\"employee_id\":64,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"90.72\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:16:56.000000Z\",\"updated_at\":\"2024-02-17T12:16:56.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":502.88,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":344,\"employee_id\":64,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:16:56.000000Z\",\"updated_at\":\"2024-02-17T12:16:56.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":345,\"employee_id\":64,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"2.7216\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:16:56.000000Z\",\"updated_at\":\"2024-02-17T12:16:56.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":346,\"employee_id\":64,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:16:56.000000Z\",\"updated_at\":\"2024-02-17T12:16:56.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":347,\"employee_id\":64,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"50.4\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:16:56.000000Z\",\"updated_at\":\"2024-02-17T12:16:56.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":560,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":348,\"employee_id\":64,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:16:56.000000Z\",\"updated_at\":\"2024-02-17T12:16:56.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":349,\"employee_id\":64,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"6.72\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:16:56.000000Z\",\"updated_at\":\"2024-02-17T12:16:56.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":560,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":350,\"employee_id\":64,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:16:56.000000Z\",\"updated_at\":\"2024-02-17T12:16:56.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":367,\"employee_id\":64,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"76.44\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:18:30.000000Z\",\"updated_at\":\"2024-02-17T12:18:30.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":445.76,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":368,\"employee_id\":64,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:18:30.000000Z\",\"updated_at\":\"2024-02-17T12:18:30.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":369,\"employee_id\":64,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"2.2932\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:18:30.000000Z\",\"updated_at\":\"2024-02-17T12:18:30.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":370,\"employee_id\":64,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:18:30.000000Z\",\"updated_at\":\"2024-02-17T12:18:30.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":371,\"employee_id\":64,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"50.4\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:18:30.000000Z\",\"updated_at\":\"2024-02-17T12:18:30.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":560,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":372,\"employee_id\":64,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:18:30.000000Z\",\"updated_at\":\"2024-02-17T12:18:30.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":373,\"employee_id\":64,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"6.72\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:18:30.000000Z\",\"updated_at\":\"2024-02-17T12:18:30.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":560,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":374,\"employee_id\":64,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:18:30.000000Z\",\"updated_at\":\"2024-02-17T12:18:30.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0}]', '[]', '[]', NULL, 0, 0, 1, 'February-2024', '2024-02-17 15:48:30', '2024-02-17 15:48:30', 0, '[]', '[]');
INSERT INTO `payslips` (`id`, `payslip_key`, `payslip_number`, `employee_id`, `company_id`, `payment_type`, `basic_salary`, `net_salary`, `allowances`, `commissions`, `loans`, `deductions`, `overtimes`, `other_payments`, `pension_type`, `pension_amount`, `hours_worked`, `status`, `month_year`, `created_at`, `updated_at`, `net_salary_zwl`, `tax_credits`, `apwcs_contribution`) VALUES
(34, 'UpMMuGDvXSBElZwGUiNg', '1971641294', 67, 1, 'Monthly', 500, 108.2975, '[]', '[]', '[]', '[{\"id\":327,\"employee_id\":67,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"90\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:13:41.000000Z\",\"updated_at\":\"2024-02-17T12:13:41.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":500,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":328,\"employee_id\":67,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:13:41.000000Z\",\"updated_at\":\"2024-02-17T12:13:41.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":329,\"employee_id\":67,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"2.7\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:13:41.000000Z\",\"updated_at\":\"2024-02-17T12:13:41.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":330,\"employee_id\":67,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:13:41.000000Z\",\"updated_at\":\"2024-02-17T12:13:41.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":331,\"employee_id\":67,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"45\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:13:41.000000Z\",\"updated_at\":\"2024-02-17T12:13:41.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":500,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":332,\"employee_id\":67,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:13:41.000000Z\",\"updated_at\":\"2024-02-17T12:13:41.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":333,\"employee_id\":67,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"6\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:13:41.000000Z\",\"updated_at\":\"2024-02-17T12:13:41.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":500,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":334,\"employee_id\":67,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:13:41.000000Z\",\"updated_at\":\"2024-02-17T12:13:41.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":351,\"employee_id\":67,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"77.25\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:16:56.000000Z\",\"updated_at\":\"2024-02-17T12:16:56.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":449,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":352,\"employee_id\":67,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:16:56.000000Z\",\"updated_at\":\"2024-02-17T12:16:56.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":353,\"employee_id\":67,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"2.3175\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:16:56.000000Z\",\"updated_at\":\"2024-02-17T12:16:56.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":354,\"employee_id\":67,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:16:56.000000Z\",\"updated_at\":\"2024-02-17T12:16:56.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":355,\"employee_id\":67,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"45\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:16:56.000000Z\",\"updated_at\":\"2024-02-17T12:16:56.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":500,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":356,\"employee_id\":67,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:16:56.000000Z\",\"updated_at\":\"2024-02-17T12:16:56.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":357,\"employee_id\":67,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"6\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:16:56.000000Z\",\"updated_at\":\"2024-02-17T12:16:56.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":500,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":358,\"employee_id\":67,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:16:56.000000Z\",\"updated_at\":\"2024-02-17T12:16:56.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":375,\"employee_id\":67,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"64.5\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:18:30.000000Z\",\"updated_at\":\"2024-02-17T12:18:30.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":398,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":376,\"employee_id\":67,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:18:30.000000Z\",\"updated_at\":\"2024-02-17T12:18:30.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":377,\"employee_id\":67,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"1.935\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:18:30.000000Z\",\"updated_at\":\"2024-02-17T12:18:30.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":378,\"employee_id\":67,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:18:30.000000Z\",\"updated_at\":\"2024-02-17T12:18:30.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":379,\"employee_id\":67,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"45\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:18:30.000000Z\",\"updated_at\":\"2024-02-17T12:18:30.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":500,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":380,\"employee_id\":67,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:18:30.000000Z\",\"updated_at\":\"2024-02-17T12:18:30.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":381,\"employee_id\":67,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"6\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:18:30.000000Z\",\"updated_at\":\"2024-02-17T12:18:30.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":500,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":382,\"employee_id\":67,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:18:30.000000Z\",\"updated_at\":\"2024-02-17T12:18:30.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0}]', '[]', '[]', NULL, 0, 0, 1, 'February-2024', '2024-02-17 15:48:30', '2024-02-17 15:48:30', 0, '[]', '[]'),
(35, '6DGzrOxaZH58iZ01eWys', '4047213462', 68, 1, 'Monthly', 600, 108.327, '[]', '[]', '[]', '[{\"id\":335,\"employee_id\":68,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"115\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:13:41.000000Z\",\"updated_at\":\"2024-02-17T12:13:41.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":600,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":336,\"employee_id\":68,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:13:41.000000Z\",\"updated_at\":\"2024-02-17T12:13:41.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":337,\"employee_id\":68,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"3.45\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:13:41.000000Z\",\"updated_at\":\"2024-02-17T12:13:41.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":338,\"employee_id\":68,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:13:41.000000Z\",\"updated_at\":\"2024-02-17T12:13:41.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":339,\"employee_id\":68,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"54\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:13:41.000000Z\",\"updated_at\":\"2024-02-17T12:13:41.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":340,\"employee_id\":68,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:13:41.000000Z\",\"updated_at\":\"2024-02-17T12:13:41.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":341,\"employee_id\":68,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"7.2\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:13:41.000000Z\",\"updated_at\":\"2024-02-17T12:13:41.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":342,\"employee_id\":68,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:13:41.000000Z\",\"updated_at\":\"2024-02-17T12:13:41.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":359,\"employee_id\":68,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"99.7\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:16:56.000000Z\",\"updated_at\":\"2024-02-17T12:16:56.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":538.8,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":360,\"employee_id\":68,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:16:56.000000Z\",\"updated_at\":\"2024-02-17T12:16:56.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":361,\"employee_id\":68,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"2.991\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:16:56.000000Z\",\"updated_at\":\"2024-02-17T12:16:56.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":362,\"employee_id\":68,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:16:56.000000Z\",\"updated_at\":\"2024-02-17T12:16:56.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":363,\"employee_id\":68,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"54\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:16:56.000000Z\",\"updated_at\":\"2024-02-17T12:16:56.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":364,\"employee_id\":68,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:16:56.000000Z\",\"updated_at\":\"2024-02-17T12:16:56.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":365,\"employee_id\":68,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"7.2\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:16:56.000000Z\",\"updated_at\":\"2024-02-17T12:16:56.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":366,\"employee_id\":68,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:16:56.000000Z\",\"updated_at\":\"2024-02-17T12:16:56.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":383,\"employee_id\":68,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"84.4\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:18:30.000000Z\",\"updated_at\":\"2024-02-17T12:18:30.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":477.6,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":384,\"employee_id\":68,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:18:30.000000Z\",\"updated_at\":\"2024-02-17T12:18:30.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":385,\"employee_id\":68,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"2.532\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:18:30.000000Z\",\"updated_at\":\"2024-02-17T12:18:30.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":386,\"employee_id\":68,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:18:30.000000Z\",\"updated_at\":\"2024-02-17T12:18:30.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":387,\"employee_id\":68,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"54\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:18:30.000000Z\",\"updated_at\":\"2024-02-17T12:18:30.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":388,\"employee_id\":68,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:18:30.000000Z\",\"updated_at\":\"2024-02-17T12:18:30.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":389,\"employee_id\":68,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"7.2\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:18:30.000000Z\",\"updated_at\":\"2024-02-17T12:18:30.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":390,\"employee_id\":68,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-17T12:18:30.000000Z\",\"updated_at\":\"2024-02-17T12:18:30.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0}]', '[]', '[]', NULL, 0, 0, 1, 'February-2024', '2024-02-17 15:48:30', '2024-02-17 15:48:30', 0, '[]', '[]'),
(36, 'pckJpplvOIB7Nxf7PhA4', '9410741925', 64, 1, 'Monthly', 560, 394.73, '[{\"id\":4,\"employee_id\":64,\"month_year\":\"July-2024\",\"first_date\":\"2024-07-01\",\"allowance_title\":\"Airtime\",\"allowance_amount\":\"1600000\",\"is_taxable\":1,\"created_at\":\"2024-02-13T08:08:27.000000Z\",\"updated_at\":\"2024-02-13T08:08:27.000000Z\",\"currency_id\":2,\"currency_symbol\":\"ZWL\",\"deductible_amt\":100}]', '[]', '[]', '[{\"id\":191,\"employee_id\":64,\"month_year\":\"December-2024\",\"first_date\":\"2024-12-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"105\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T07:58:07.000000Z\",\"updated_at\":\"2024-02-13T07:58:07.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":192,\"employee_id\":64,\"month_year\":\"December-2024\",\"first_date\":\"2024-12-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T07:58:07.000000Z\",\"updated_at\":\"2024-02-13T07:58:07.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":193,\"employee_id\":64,\"month_year\":\"December-2024\",\"first_date\":\"2024-12-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"3.15\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T07:58:07.000000Z\",\"updated_at\":\"2024-02-13T07:58:07.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":194,\"employee_id\":64,\"month_year\":\"December-2024\",\"first_date\":\"2024-12-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T07:58:07.000000Z\",\"updated_at\":\"2024-02-13T07:58:07.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":195,\"employee_id\":64,\"month_year\":\"December-2024\",\"first_date\":\"2024-12-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"50.4\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T07:58:07.000000Z\",\"updated_at\":\"2024-02-13T07:58:07.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":560,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":196,\"employee_id\":64,\"month_year\":\"December-2024\",\"first_date\":\"2024-12-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T07:58:07.000000Z\",\"updated_at\":\"2024-02-13T07:58:07.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":197,\"employee_id\":64,\"month_year\":\"December-2024\",\"first_date\":\"2024-12-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"6.72\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T07:58:07.000000Z\",\"updated_at\":\"2024-02-13T07:58:07.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":560,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":198,\"employee_id\":64,\"month_year\":\"December-2024\",\"first_date\":\"2024-12-01\",\"deduction_title\":\"NSSA APWCS Contribution\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-13T07:58:07.000000Z\",\"updated_at\":\"2024-02-13T07:58:07.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":1,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0}]', '[]', '[]', NULL, 0, 0, 1, 'December-2025', '2024-02-19 18:36:17', '2024-02-19 18:36:17', 0, '[]', '[]'),
(37, 'BX4r3HRClcnKXadR7LGr', '4863321481', 64, 1, 'Monthly', 560, 108.31519999999995, '[]', '[]', '[]', '[{\"id\":395,\"employee_id\":64,\"month_year\":\"May-2024\",\"first_date\":\"2024-05-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-19T15:18:01.000000Z\",\"updated_at\":\"2024-02-19T15:18:01.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":-171.36,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":396,\"employee_id\":64,\"month_year\":\"May-2024\",\"first_date\":\"2024-05-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-19T15:18:01.000000Z\",\"updated_at\":\"2024-02-19T15:18:01.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":397,\"employee_id\":64,\"month_year\":\"May-2024\",\"first_date\":\"2024-05-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-19T15:18:01.000000Z\",\"updated_at\":\"2024-02-19T15:18:01.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":398,\"employee_id\":64,\"month_year\":\"May-2024\",\"first_date\":\"2024-05-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-19T15:18:01.000000Z\",\"updated_at\":\"2024-02-19T15:18:01.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":399,\"employee_id\":64,\"month_year\":\"May-2024\",\"first_date\":\"2024-05-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-19T15:18:01.000000Z\",\"updated_at\":\"2024-02-19T15:18:01.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":400,\"employee_id\":64,\"month_year\":\"May-2024\",\"first_date\":\"2024-05-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-02-19T15:18:01.000000Z\",\"updated_at\":\"2024-02-19T15:18:01.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0}]', '[]', '[]', NULL, 0, 0, 1, 'May-2024', '2024-02-19 18:48:01', '2024-02-19 18:48:01', 0, '[]', '[]'),
(38, 'mTpJgJ6QkVJcVRAzaj6l', '9447085636', 64, 1, 'Monthly', 560, 452.1002, '[{\"id\":5,\"employee_id\":64,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"allowance_title\":\"New\",\"allowance_amount\":\"10\",\"is_taxable\":1,\"created_at\":\"2024-03-02T08:39:04.000000Z\",\"updated_at\":\"2024-03-02T08:39:04.000000Z\",\"currency_id\":1,\"currency_symbol\":\"$\",\"deductible_amt\":100}]', '[]', '[]', '[{\"id\":437,\"employee_id\":64,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"64.66\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-05T23:06:27.000000Z\",\"updated_at\":\"2024-03-05T23:06:27.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":398.64,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":438,\"employee_id\":64,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-05T23:06:27.000000Z\",\"updated_at\":\"2024-03-05T23:06:27.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":439,\"employee_id\":64,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"1.9398\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-05T23:06:27.000000Z\",\"updated_at\":\"2024-03-05T23:06:27.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":440,\"employee_id\":64,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-05T23:06:27.000000Z\",\"updated_at\":\"2024-03-05T23:06:27.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":441,\"employee_id\":64,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"51.3\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-05T23:06:27.000000Z\",\"updated_at\":\"2024-03-05T23:06:27.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":570,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0},{\"id\":442,\"employee_id\":64,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-05T23:06:27.000000Z\",\"updated_at\":\"2024-03-05T23:06:27.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0}]', '[]', '[]', NULL, 0, 0, 1, 'March-2024', '2024-03-06 02:36:27', '2024-03-06 02:36:27', 0, '[]', '[]'),
(39, 'ZJFZSGVVOHocEuFLjNEW', '5274721692', 68, 1, 'Monthly', 600, 427.55, '[]', '[]', '[]', '[{\"id\":611,\"employee_id\":68,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"115\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T22:45:24.000000Z\",\"updated_at\":\"2024-03-14T22:45:24.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":600,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":612,\"employee_id\":68,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T22:45:24.000000Z\",\"updated_at\":\"2024-03-14T22:45:24.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":613,\"employee_id\":68,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"3.45\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T22:45:24.000000Z\",\"updated_at\":\"2024-03-14T22:45:24.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":614,\"employee_id\":68,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T22:45:24.000000Z\",\"updated_at\":\"2024-03-14T22:45:24.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":615,\"employee_id\":68,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"54\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T22:45:24.000000Z\",\"updated_at\":\"2024-03-14T22:45:24.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":616,\"employee_id\":68,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T22:45:24.000000Z\",\"updated_at\":\"2024-03-14T22:45:24.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null}]', '[]', '[]', NULL, 0, 0, 1, 'March-2024', '2024-03-15 02:15:24', '2024-03-15 02:15:24', 0, '[]', '[]'),
(40, '4tUyovNTSC1f9LooB9ja', '2610321347', 67, 1, 'Monthly', 500, 371.1425, '[{\"id\":6,\"employee_id\":67,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"allowance_title\":\"Data\",\"allowance_amount\":\"10\",\"is_taxable\":1,\"created_at\":\"2024-03-05T23:37:02.000000Z\",\"updated_at\":\"2024-03-05T23:37:02.000000Z\",\"currency_id\":1,\"currency_symbol\":\"$\",\"deductible_amt\":10,\"is_recurring\":0,\"allowance_id\":null}]', '[]', '[]', '[{\"id\":641,\"employee_id\":67,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"90.25\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T22:54:16.000000Z\",\"updated_at\":\"2024-03-14T22:54:16.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":501,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":642,\"employee_id\":67,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T22:54:16.000000Z\",\"updated_at\":\"2024-03-14T22:54:16.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":643,\"employee_id\":67,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"2.7075\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T22:54:16.000000Z\",\"updated_at\":\"2024-03-14T22:54:16.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":644,\"employee_id\":67,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T22:54:16.000000Z\",\"updated_at\":\"2024-03-14T22:54:16.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":645,\"employee_id\":67,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"45.9\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T22:54:16.000000Z\",\"updated_at\":\"2024-03-14T22:54:16.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":510,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":646,\"employee_id\":67,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T22:54:16.000000Z\",\"updated_at\":\"2024-03-14T22:54:16.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null}]', '[]', '[]', NULL, 0, 0, 1, 'March-2024', '2024-03-15 02:24:16', '2024-03-15 02:24:16', 0, '[]', '[]');
INSERT INTO `payslips` (`id`, `payslip_key`, `payslip_number`, `employee_id`, `company_id`, `payment_type`, `basic_salary`, `net_salary`, `allowances`, `commissions`, `loans`, `deductions`, `overtimes`, `other_payments`, `pension_type`, `pension_amount`, `hours_worked`, `status`, `month_year`, `created_at`, `updated_at`, `net_salary_zwl`, `tax_credits`, `apwcs_contribution`) VALUES
(41, '68vrOv5f1M0KuKvBU1e7', '2272388377', 64, 1, 'Monthly', 560, 910, '[{\"id\":22,\"employee_id\":64,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"allowance_title\":\"New Allownace\",\"allowance_amount\":\"1000\",\"is_taxable\":1,\"created_at\":\"2024-03-14T02:07:23.000000Z\",\"updated_at\":\"2024-03-14T02:07:23.000000Z\",\"currency_id\":1,\"currency_symbol\":\"$\",\"deductible_amt\":10,\"is_recurring\":1,\"allowance_id\":5}]', '[]', '[]', '[{\"id\":701,\"employee_id\":64,\"month_year\":\"April-2024\",\"first_date\":\"2024-04-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:01:09.000000Z\",\"updated_at\":\"2024-03-14T23:01:09.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":100,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":702,\"employee_id\":64,\"month_year\":\"April-2024\",\"first_date\":\"2024-04-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:01:09.000000Z\",\"updated_at\":\"2024-03-14T23:01:09.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":703,\"employee_id\":64,\"month_year\":\"April-2024\",\"first_date\":\"2024-04-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:01:09.000000Z\",\"updated_at\":\"2024-03-14T23:01:09.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":704,\"employee_id\":64,\"month_year\":\"April-2024\",\"first_date\":\"2024-04-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:01:09.000000Z\",\"updated_at\":\"2024-03-14T23:01:09.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":705,\"employee_id\":64,\"month_year\":\"April-2024\",\"first_date\":\"2024-04-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"90\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:01:09.000000Z\",\"updated_at\":\"2024-03-14T23:01:09.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":1000,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":706,\"employee_id\":64,\"month_year\":\"April-2024\",\"first_date\":\"2024-04-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:01:09.000000Z\",\"updated_at\":\"2024-03-14T23:01:09.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null}]', '[]', '[]', NULL, 0, 0, 1, 'April-2024', '2024-03-15 02:31:09', '2024-03-15 02:31:09', 0, '[]', '[]'),
(42, 'xROWS55Cgnc50BHeJkqU', '4954132078', 65, 1, 'Monthly', 800, 101.3, '[{\"id\":9,\"employee_id\":65,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"allowance_title\":\"New\",\"allowance_amount\":\"100\",\"is_taxable\":1,\"created_at\":\"2024-03-13T11:48:47.000000Z\",\"updated_at\":\"2024-03-13T11:48:47.000000Z\",\"currency_id\":1,\"currency_symbol\":\"$\",\"deductible_amt\":10,\"is_recurring\":1,\"allowance_id\":null}]', '[]', '[]', '[{\"id\":737,\"employee_id\":65,\"month_year\":\"May-2024\",\"first_date\":\"2024-05-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"-10\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:05:11.000000Z\",\"updated_at\":\"2024-03-14T23:05:11.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":10,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":738,\"employee_id\":65,\"month_year\":\"May-2024\",\"first_date\":\"2024-05-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:05:11.000000Z\",\"updated_at\":\"2024-03-14T23:05:11.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":739,\"employee_id\":65,\"month_year\":\"May-2024\",\"first_date\":\"2024-05-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"-0.3\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:05:11.000000Z\",\"updated_at\":\"2024-03-14T23:05:11.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":740,\"employee_id\":65,\"month_year\":\"May-2024\",\"first_date\":\"2024-05-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:05:11.000000Z\",\"updated_at\":\"2024-03-14T23:05:11.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":741,\"employee_id\":65,\"month_year\":\"May-2024\",\"first_date\":\"2024-05-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"9\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:05:11.000000Z\",\"updated_at\":\"2024-03-14T23:05:11.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":100,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":742,\"employee_id\":65,\"month_year\":\"May-2024\",\"first_date\":\"2024-05-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:05:11.000000Z\",\"updated_at\":\"2024-03-14T23:05:11.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null}]', '[]', '[]', NULL, 0, 0, 1, 'May-2024', '2024-03-15 02:35:11', '2024-03-15 02:35:11', 0, '[{\"id\":4,\"employee_id\":65,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Medical IAD\",\"deduction_amount\":\"10\",\"deduction_type\":\"\",\"currency_id\":1,\"currency_symbol\":\"$\",\"created_at\":\"2024-02-16T04:54:49.000000Z\",\"updated_at\":\"2024-02-16T04:54:49.000000Z\"}]', '[]'),
(43, 'U3gXTT8z4xIJmhwWV706', '4362439234', 65, 1, 'Monthly', 800, 1746.475, '[{\"id\":7,\"employee_id\":65,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"allowance_title\":\"tO ALL\",\"allowance_amount\":\"100\",\"is_taxable\":1,\"created_at\":\"2024-03-13T10:59:35.000000Z\",\"updated_at\":\"2024-03-13T10:59:35.000000Z\",\"currency_id\":1,\"currency_symbol\":\"$\",\"deductible_amt\":10,\"is_recurring\":0,\"allowance_id\":null},{\"id\":9,\"employee_id\":65,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"allowance_title\":\"New\",\"allowance_amount\":\"100\",\"is_taxable\":1,\"created_at\":\"2024-03-13T11:48:47.000000Z\",\"updated_at\":\"2024-03-13T11:48:47.000000Z\",\"currency_id\":1,\"currency_symbol\":\"$\",\"deductible_amt\":10,\"is_recurring\":1,\"allowance_id\":null},{\"id\":11,\"employee_id\":65,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"allowance_title\":\"New Allownace\",\"allowance_amount\":\"1000\",\"is_taxable\":1,\"created_at\":\"2024-03-13T11:50:54.000000Z\",\"updated_at\":\"2024-03-13T11:50:54.000000Z\",\"currency_id\":1,\"currency_symbol\":\"$\",\"deductible_amt\":10,\"is_recurring\":0,\"allowance_id\":null}]', '[]', '[]', '[{\"id\":779,\"employee_id\":65,\"month_year\":\"June-2024\",\"first_date\":\"2024-06-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"167.5\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:07:10.000000Z\",\"updated_at\":\"2024-03-14T23:07:10.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":810,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":780,\"employee_id\":65,\"month_year\":\"June-2024\",\"first_date\":\"2024-06-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:07:10.000000Z\",\"updated_at\":\"2024-03-14T23:07:10.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":781,\"employee_id\":65,\"month_year\":\"June-2024\",\"first_date\":\"2024-06-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"5.025\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:07:10.000000Z\",\"updated_at\":\"2024-03-14T23:07:10.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":782,\"employee_id\":65,\"month_year\":\"June-2024\",\"first_date\":\"2024-06-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:07:10.000000Z\",\"updated_at\":\"2024-03-14T23:07:10.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":783,\"employee_id\":65,\"month_year\":\"June-2024\",\"first_date\":\"2024-06-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"81\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:07:10.000000Z\",\"updated_at\":\"2024-03-14T23:07:10.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":900,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":784,\"employee_id\":65,\"month_year\":\"June-2024\",\"first_date\":\"2024-06-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:07:10.000000Z\",\"updated_at\":\"2024-03-14T23:07:10.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null}]', '[]', '[]', NULL, 0, 0, 1, 'June-2024', '2024-03-15 02:37:10', '2024-03-15 02:37:10', 0, '[{\"id\":4,\"employee_id\":65,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Medical IAD\",\"deduction_amount\":\"10\",\"deduction_type\":\"\",\"currency_id\":1,\"currency_symbol\":\"$\",\"created_at\":\"2024-02-16T04:54:49.000000Z\",\"updated_at\":\"2024-02-16T04:54:49.000000Z\"}]', '[]'),
(44, 'wvkyjkDFWaSHlRM72t2l', '6943331372', 67, 1, 'Monthly', 500, 362.3, '[]', '[]', '[]', '[{\"id\":851,\"employee_id\":67,\"month_year\":\"May-2024\",\"first_date\":\"2024-05-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"90\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:16:34.000000Z\",\"updated_at\":\"2024-03-14T23:16:34.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":500,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":852,\"employee_id\":67,\"month_year\":\"May-2024\",\"first_date\":\"2024-05-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:16:34.000000Z\",\"updated_at\":\"2024-03-14T23:16:34.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":853,\"employee_id\":67,\"month_year\":\"May-2024\",\"first_date\":\"2024-05-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"2.7\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:16:34.000000Z\",\"updated_at\":\"2024-03-14T23:16:34.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":854,\"employee_id\":67,\"month_year\":\"May-2024\",\"first_date\":\"2024-05-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:16:34.000000Z\",\"updated_at\":\"2024-03-14T23:16:34.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":855,\"employee_id\":67,\"month_year\":\"May-2024\",\"first_date\":\"2024-05-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"45\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:16:34.000000Z\",\"updated_at\":\"2024-03-14T23:16:34.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":500,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":856,\"employee_id\":67,\"month_year\":\"May-2024\",\"first_date\":\"2024-05-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:16:34.000000Z\",\"updated_at\":\"2024-03-14T23:16:34.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null}]', '[]', '[]', NULL, 0, 0, 1, 'May-2024', '2024-03-15 02:46:35', '2024-03-15 02:46:35', 0, '[]', '[]'),
(45, 'V47H8dKNfHJYdlgrtWxI', '6285764153', 64, 1, 'Monthly', 560, 1285.7, '[{\"id\":22,\"employee_id\":64,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"allowance_title\":\"New Allownace\",\"allowance_amount\":\"1000\",\"is_taxable\":1,\"created_at\":\"2024-03-14T02:07:23.000000Z\",\"updated_at\":\"2024-03-14T02:07:23.000000Z\",\"currency_id\":1,\"currency_symbol\":\"$\",\"deductible_amt\":10,\"is_recurring\":1,\"allowance_id\":5}]', '[]', '[]', '[{\"id\":923,\"employee_id\":64,\"month_year\":\"June-2024\",\"first_date\":\"2024-06-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"130\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:29:21.000000Z\",\"updated_at\":\"2024-03-14T23:29:21.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":660,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":924,\"employee_id\":64,\"month_year\":\"June-2024\",\"first_date\":\"2024-06-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:29:21.000000Z\",\"updated_at\":\"2024-03-14T23:29:21.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":925,\"employee_id\":64,\"month_year\":\"June-2024\",\"first_date\":\"2024-06-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"3.9\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:29:21.000000Z\",\"updated_at\":\"2024-03-14T23:29:21.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":926,\"employee_id\":64,\"month_year\":\"June-2024\",\"first_date\":\"2024-06-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:29:21.000000Z\",\"updated_at\":\"2024-03-14T23:29:21.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":927,\"employee_id\":64,\"month_year\":\"June-2024\",\"first_date\":\"2024-06-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"140.4\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:29:21.000000Z\",\"updated_at\":\"2024-03-14T23:29:21.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":1560,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":928,\"employee_id\":64,\"month_year\":\"June-2024\",\"first_date\":\"2024-06-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:29:21.000000Z\",\"updated_at\":\"2024-03-14T23:29:21.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null}]', '[]', '[]', NULL, 0, 0, 1, 'June-2024', '2024-03-15 02:59:21', '2024-03-15 02:59:21', 0, '[]', '[]'),
(46, 'SVOuA8nZEdsL2Q5dGYAr', '3728083854', 67, 1, 'Monthly', 500, 362.3, '[]', '[]', '[]', '[{\"id\":1025,\"employee_id\":67,\"month_year\":\"June-2024\",\"first_date\":\"2024-06-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"90\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:39:47.000000Z\",\"updated_at\":\"2024-03-14T23:39:47.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":500,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":1026,\"employee_id\":67,\"month_year\":\"June-2024\",\"first_date\":\"2024-06-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:39:47.000000Z\",\"updated_at\":\"2024-03-14T23:39:47.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":1027,\"employee_id\":67,\"month_year\":\"June-2024\",\"first_date\":\"2024-06-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"2.7\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:39:47.000000Z\",\"updated_at\":\"2024-03-14T23:39:47.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":1028,\"employee_id\":67,\"month_year\":\"June-2024\",\"first_date\":\"2024-06-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:39:47.000000Z\",\"updated_at\":\"2024-03-14T23:39:47.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":1029,\"employee_id\":67,\"month_year\":\"June-2024\",\"first_date\":\"2024-06-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"45\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:39:47.000000Z\",\"updated_at\":\"2024-03-14T23:39:47.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":500,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":1030,\"employee_id\":67,\"month_year\":\"June-2024\",\"first_date\":\"2024-06-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:39:47.000000Z\",\"updated_at\":\"2024-03-14T23:39:47.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null}]', '[]', '[]', NULL, 0, 0, 1, 'June-2024', '2024-03-15 03:09:47', '2024-03-15 03:09:47', 0, '[]', '[]'),
(47, 'GWtouX5lf5sx8Uva3les', '8199294664', 68, 1, 'Monthly', 600, 427.55, '[]', '[]', '[]', '[{\"id\":1037,\"employee_id\":68,\"month_year\":\"June-2024\",\"first_date\":\"2024-06-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"115\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:39:55.000000Z\",\"updated_at\":\"2024-03-14T23:39:55.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":600,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":1038,\"employee_id\":68,\"month_year\":\"June-2024\",\"first_date\":\"2024-06-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:39:55.000000Z\",\"updated_at\":\"2024-03-14T23:39:55.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":1039,\"employee_id\":68,\"month_year\":\"June-2024\",\"first_date\":\"2024-06-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"3.45\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:39:55.000000Z\",\"updated_at\":\"2024-03-14T23:39:55.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":1040,\"employee_id\":68,\"month_year\":\"June-2024\",\"first_date\":\"2024-06-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:39:55.000000Z\",\"updated_at\":\"2024-03-14T23:39:55.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":1041,\"employee_id\":68,\"month_year\":\"June-2024\",\"first_date\":\"2024-06-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"54\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:39:55.000000Z\",\"updated_at\":\"2024-03-14T23:39:55.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":600,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":1042,\"employee_id\":68,\"month_year\":\"June-2024\",\"first_date\":\"2024-06-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:39:55.000000Z\",\"updated_at\":\"2024-03-14T23:39:55.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null}]', '[]', '[]', NULL, 0, 0, 1, 'June-2024', '2024-03-15 03:09:55', '2024-03-15 03:09:55', 0, '[]', '[]'),
(48, 'U192pFnxmDAcdatEfGJU', '5233852627', 65, 1, 'Monthly', 800, 101.3, '[{\"id\":9,\"employee_id\":65,\"month_year\":\"March-2024\",\"first_date\":\"2024-03-01\",\"allowance_title\":\"New\",\"allowance_amount\":\"100\",\"is_taxable\":1,\"created_at\":\"2024-03-13T11:48:47.000000Z\",\"updated_at\":\"2024-03-13T11:48:47.000000Z\",\"currency_id\":1,\"currency_symbol\":\"$\",\"deductible_amt\":10,\"is_recurring\":1,\"allowance_id\":null}]', '[]', '[]', '[{\"id\":1103,\"employee_id\":65,\"month_year\":\"July-2024\",\"first_date\":\"2024-07-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"-10\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:45:35.000000Z\",\"updated_at\":\"2024-03-14T23:45:35.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":10,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":1104,\"employee_id\":65,\"month_year\":\"July-2024\",\"first_date\":\"2024-07-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:45:35.000000Z\",\"updated_at\":\"2024-03-14T23:45:35.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":1105,\"employee_id\":65,\"month_year\":\"July-2024\",\"first_date\":\"2024-07-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"-0.3\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:45:35.000000Z\",\"updated_at\":\"2024-03-14T23:45:35.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":1106,\"employee_id\":65,\"month_year\":\"July-2024\",\"first_date\":\"2024-07-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:45:35.000000Z\",\"updated_at\":\"2024-03-14T23:45:35.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":1107,\"employee_id\":65,\"month_year\":\"July-2024\",\"first_date\":\"2024-07-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"9\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:45:35.000000Z\",\"updated_at\":\"2024-03-14T23:45:35.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":100,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":1108,\"employee_id\":65,\"month_year\":\"July-2024\",\"first_date\":\"2024-07-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:45:35.000000Z\",\"updated_at\":\"2024-03-14T23:45:35.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null}]', '[]', '[]', NULL, 0, 0, 1, 'July-2024', '2024-03-15 03:15:35', '2024-03-15 03:15:35', 0, '[{\"id\":4,\"employee_id\":65,\"month_year\":\"February-2024\",\"first_date\":\"2024-02-01\",\"deduction_title\":\"Medical IAD\",\"deduction_amount\":\"10\",\"deduction_type\":\"\",\"currency_id\":1,\"currency_symbol\":\"$\",\"created_at\":\"2024-02-16T04:54:49.000000Z\",\"updated_at\":\"2024-02-16T04:54:49.000000Z\"}]', '[]'),
(49, 'XSgYbg8QHdBXZqBiEGSg', '6123556629', 67, 1, 'Monthly', 500, 362.3, '[]', '[]', '[]', '[{\"id\":1139,\"employee_id\":67,\"month_year\":\"July-2024\",\"first_date\":\"2024-07-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"90\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:48:12.000000Z\",\"updated_at\":\"2024-03-14T23:48:12.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":500,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":1140,\"employee_id\":67,\"month_year\":\"July-2024\",\"first_date\":\"2024-07-01\",\"deduction_title\":\"Zimra Income Tax\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:48:12.000000Z\",\"updated_at\":\"2024-03-14T23:48:12.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":1141,\"employee_id\":67,\"month_year\":\"July-2024\",\"first_date\":\"2024-07-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"2.7\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:48:12.000000Z\",\"updated_at\":\"2024-03-14T23:48:12.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":1142,\"employee_id\":67,\"month_year\":\"July-2024\",\"first_date\":\"2024-07-01\",\"deduction_title\":\"Zimra AIDS Levy\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:48:12.000000Z\",\"updated_at\":\"2024-03-14T23:48:12.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":0,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":1143,\"employee_id\":67,\"month_year\":\"July-2024\",\"first_date\":\"2024-07-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"45\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:48:12.000000Z\",\"updated_at\":\"2024-03-14T23:48:12.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"$\",\"deductible_amt\":0,\"insuarable_amount\":500,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null},{\"id\":1144,\"employee_id\":67,\"month_year\":\"July-2024\",\"first_date\":\"2024-07-01\",\"deduction_title\":\"NSSA Insurance (9%)\",\"deduction_amount\":\"0\",\"deduction_type\":\"Other Statutory Deduction\",\"created_at\":\"2024-03-14T23:48:12.000000Z\",\"updated_at\":\"2024-03-14T23:48:12.000000Z\",\"currency_id\":null,\"is_taxable\":0,\"currency_symbol\":\"ZWL\",\"deductible_amt\":0,\"insuarable_amount\":0,\"is_nssa_insuarance\":1,\"is_nssa_contribution\":0,\"zimra_payable_amount\":0,\"is_zimra_income\":0,\"is_zimra_aids\":0,\"is_recurring\":0,\"deduction_id\":null}]', '[]', '[]', NULL, 0, 0, 1, 'July-2024', '2024-03-15 03:18:12', '2024-03-15 03:18:12', 0, '[]', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'user', 'web', NULL, NULL),
(2, 'view-user', 'web', NULL, NULL),
(3, 'edit-user', 'web', NULL, NULL),
(4, 'delete-user', 'web', NULL, NULL),
(5, 'last-login-user', 'web', NULL, NULL),
(6, 'role-access-user', 'web', NULL, NULL),
(7, 'details-employee', 'web', NULL, NULL),
(8, 'view-details-employee', 'web', NULL, NULL),
(9, 'store-details-employee', 'web', NULL, NULL),
(10, 'modify-details-employee', 'web', NULL, NULL),
(11, 'customize-setting', 'web', NULL, NULL),
(12, 'role-access', 'web', NULL, NULL),
(13, 'general-setting', 'web', NULL, NULL),
(14, 'view-general-setting', 'web', NULL, NULL),
(15, 'store-general-setting', 'web', NULL, NULL),
(16, 'mail-setting', 'web', NULL, NULL),
(17, 'view-mail-setting', 'web', NULL, NULL),
(18, 'store-mail-setting', 'web', NULL, NULL),
(19, 'language-setting', 'web', NULL, NULL),
(20, 'core_hr', 'web', NULL, NULL),
(21, 'view-calendar', 'web', NULL, NULL),
(22, 'promotion', 'web', NULL, NULL),
(23, 'view-promotion', 'web', NULL, NULL),
(24, 'store-promotion', 'web', NULL, NULL),
(25, 'edit-promotion', 'web', NULL, NULL),
(26, 'delete-promotion', 'web', NULL, NULL),
(27, 'award', 'web', NULL, NULL),
(28, 'view-award', 'web', NULL, NULL),
(29, 'store-award', 'web', NULL, NULL),
(30, 'edit-award', 'web', NULL, NULL),
(31, 'delete-award', 'web', NULL, NULL),
(32, 'transfer', 'web', NULL, NULL),
(33, 'view-transfer', 'web', NULL, NULL),
(34, 'store-transfer', 'web', NULL, NULL),
(35, 'edit-transfer', 'web', NULL, NULL),
(36, 'delete-transfer', 'web', NULL, NULL),
(37, 'travel', 'web', NULL, NULL),
(38, 'view-travel', 'web', NULL, NULL),
(39, 'store-travel', 'web', NULL, NULL),
(40, 'edit-travel', 'web', NULL, NULL),
(41, 'delete-travel', 'web', NULL, NULL),
(42, 'resignation', 'web', NULL, NULL),
(43, 'view-resignation', 'web', NULL, NULL),
(44, 'store-resignation', 'web', NULL, NULL),
(45, 'edit-resignation', 'web', NULL, NULL),
(46, 'delete-resignation', 'web', NULL, NULL),
(47, 'complaint', 'web', NULL, NULL),
(48, 'view-complaint', 'web', NULL, NULL),
(49, 'store-complaint', 'web', NULL, NULL),
(50, 'edit-complaint', 'web', NULL, NULL),
(51, 'delete-complaint', 'web', NULL, NULL),
(52, 'warning', 'web', NULL, NULL),
(53, 'view-warning', 'web', NULL, NULL),
(54, 'store-warning', 'web', NULL, NULL),
(55, 'edit-warning', 'web', NULL, NULL),
(56, 'delete-warning', 'web', NULL, NULL),
(57, 'termination', 'web', NULL, NULL),
(58, 'view-termination', 'web', NULL, NULL),
(59, 'store-termination', 'web', NULL, NULL),
(60, 'edit-termination', 'web', NULL, NULL),
(61, 'delete-termination', 'web', NULL, NULL),
(62, 'timesheet', 'web', NULL, NULL),
(63, 'attendance', 'web', NULL, NULL),
(64, 'view-attendance', 'web', NULL, NULL),
(65, 'edit-attendance', 'web', NULL, NULL),
(66, 'office_shift', 'web', NULL, NULL),
(67, 'view-office_shift', 'web', NULL, NULL),
(68, 'store-office_shift', 'web', NULL, NULL),
(69, 'edit-office_shift', 'web', NULL, NULL),
(70, 'delete-office_shift', 'web', NULL, NULL),
(71, 'holiday', 'web', NULL, NULL),
(72, 'view-holiday', 'web', NULL, NULL),
(73, 'store-holiday', 'web', NULL, NULL),
(74, 'edit-holiday', 'web', NULL, NULL),
(75, 'delete-holiday', 'web', NULL, NULL),
(76, 'leave', 'web', NULL, NULL),
(77, 'view-holiday', 'web', NULL, NULL),
(78, 'store-holiday', 'web', NULL, NULL),
(79, 'edit-holiday', 'web', NULL, NULL),
(80, 'delete-holiday', 'web', NULL, NULL),
(81, 'payment-module', 'web', NULL, NULL),
(82, 'view-payslip', 'web', NULL, NULL),
(83, 'make-payment', 'web', NULL, NULL),
(84, 'make-bulk_payment', 'web', NULL, NULL),
(85, 'view-paylist', 'web', NULL, NULL),
(86, 'set-salary', 'web', NULL, NULL),
(87, 'hr_report', 'web', NULL, NULL),
(88, 'report-payslip', 'web', NULL, NULL),
(89, 'report-attendance', 'web', NULL, NULL),
(90, 'report-training', 'web', NULL, NULL),
(91, 'report-project', 'web', NULL, NULL),
(92, 'report-task', 'web', NULL, NULL),
(93, 'report-employee', 'web', NULL, NULL),
(94, 'report-account', 'web', NULL, NULL),
(95, 'report-deposit', 'web', NULL, NULL),
(96, 'report-expense', 'web', NULL, NULL),
(97, 'report-transaction', 'web', NULL, NULL),
(98, 'recruitment', 'web', NULL, NULL),
(99, 'job_employer', 'web', NULL, NULL),
(100, 'view-job_employer', 'web', NULL, NULL),
(101, 'store-job_employer', 'web', NULL, NULL),
(102, 'edit-job_employer', 'web', NULL, NULL),
(103, 'delete-job_employer', 'web', NULL, NULL),
(104, 'job_post', 'web', NULL, NULL),
(105, 'view-job_post', 'web', NULL, NULL),
(106, 'store-job_post', 'web', NULL, NULL),
(107, 'edit-job_post', 'web', NULL, NULL),
(108, 'delete-job_post', 'web', NULL, NULL),
(109, 'job_candidate', 'web', NULL, NULL),
(110, 'view-job_candidate', 'web', NULL, NULL),
(111, 'store-job_candidate', 'web', NULL, NULL),
(112, 'delete-job_candidate', 'web', NULL, NULL),
(113, 'job_interview', 'web', NULL, NULL),
(114, 'view-job_interview', 'web', NULL, NULL),
(115, 'store-job_interview', 'web', NULL, NULL),
(116, 'delete-job_interview', 'web', NULL, NULL),
(117, 'project-management', 'web', NULL, NULL),
(118, 'project', 'web', NULL, NULL),
(119, 'view-project', 'web', NULL, NULL),
(120, 'store-project', 'web', NULL, NULL),
(121, 'edit-project', 'web', NULL, NULL),
(122, 'delete-project', 'web', NULL, NULL),
(123, 'task', 'web', NULL, NULL),
(124, 'view-task', 'web', NULL, NULL),
(125, 'store-task', 'web', NULL, NULL),
(126, 'edit-task', 'web', NULL, NULL),
(127, 'delete-task', 'web', NULL, NULL),
(128, 'client', 'web', NULL, NULL),
(129, 'view-client', 'web', NULL, NULL),
(130, 'store-client', 'web', NULL, NULL),
(131, 'edit-client', 'web', NULL, NULL),
(132, 'delete-client', 'web', NULL, NULL),
(133, 'invoice', 'web', NULL, NULL),
(134, 'view-invoice', 'web', NULL, NULL),
(135, 'store-invoice', 'web', NULL, NULL),
(136, 'edit-invoice', 'web', NULL, NULL),
(137, 'delete-invoice', 'web', NULL, NULL),
(138, 'ticket', 'web', NULL, NULL),
(139, 'view-ticket', 'web', NULL, NULL),
(140, 'store-ticket', 'web', NULL, NULL),
(141, 'edit-ticket', 'web', NULL, NULL),
(142, 'delete-ticket', 'web', NULL, NULL),
(143, 'import-module', 'web', NULL, NULL),
(144, 'import-attendance', 'web', NULL, NULL),
(145, 'import-employee', 'web', NULL, NULL),
(146, 'file_module', 'web', NULL, NULL),
(147, 'file_manager', 'web', NULL, NULL),
(148, 'view-file_manager', 'web', NULL, NULL),
(149, 'store-file_manager', 'web', NULL, NULL),
(150, 'edit-file_manager', 'web', NULL, NULL),
(151, 'delete-file_manager', 'web', NULL, NULL),
(152, 'view-file_config', 'web', NULL, NULL),
(153, 'official_document', 'web', NULL, NULL),
(154, 'view-official_document', 'web', NULL, NULL),
(155, 'store-official_document', 'web', NULL, NULL),
(156, 'edit-official_document', 'web', NULL, NULL),
(157, 'delete-official_document', 'web', NULL, NULL),
(158, 'event-meeting', 'web', NULL, NULL),
(159, 'meeting', 'web', NULL, NULL),
(160, 'view-meeting', 'web', NULL, NULL),
(161, 'store-meeting', 'web', NULL, NULL),
(162, 'edit-meeting', 'web', NULL, NULL),
(163, 'delete-meeting', 'web', NULL, NULL),
(164, 'event', 'web', NULL, NULL),
(165, 'view-event', 'web', NULL, NULL),
(166, 'store-event', 'web', NULL, NULL),
(167, 'edit-event', 'web', NULL, NULL),
(168, 'delete-event', 'web', NULL, NULL),
(169, 'role', 'web', NULL, NULL),
(170, 'view-role', 'web', NULL, NULL),
(171, 'store-role', 'web', NULL, NULL),
(172, 'edit-role', 'web', NULL, NULL),
(173, 'delete-role', 'web', NULL, NULL),
(174, 'assign-module', 'web', NULL, NULL),
(175, 'assign-role', 'web', NULL, NULL),
(176, 'assign-ticket', 'web', NULL, NULL),
(177, 'assign-project', 'web', NULL, NULL),
(178, 'assign-task', 'web', NULL, NULL),
(179, 'finance', 'web', NULL, NULL),
(180, 'account', 'web', NULL, NULL),
(181, 'view-account', 'web', NULL, NULL),
(182, 'store-account', 'web', NULL, NULL),
(183, 'edit-account', 'web', NULL, NULL),
(184, 'delete-account', 'web', NULL, NULL),
(185, 'view-transaction', 'web', NULL, NULL),
(186, 'view-balance_transfer', 'web', NULL, NULL),
(187, 'store-balance_transfer', 'web', NULL, NULL),
(188, 'expense', 'web', NULL, NULL),
(189, 'view-expense', 'web', NULL, NULL),
(190, 'store-expense', 'web', NULL, NULL),
(191, 'edit-expense', 'web', NULL, NULL),
(192, 'delete-expense', 'web', NULL, NULL),
(193, 'deposit', 'web', NULL, NULL),
(194, 'view-deposit', 'web', NULL, NULL),
(195, 'store-deposit', 'web', NULL, NULL),
(196, 'edit-deposit', 'web', NULL, NULL),
(197, 'delete-deposit', 'web', NULL, NULL),
(198, 'payer', 'web', NULL, NULL),
(199, 'view-payer', 'web', NULL, NULL),
(200, 'store-payer', 'web', NULL, NULL),
(201, 'edit-payer', 'web', NULL, NULL),
(202, 'delete-payer', 'web', NULL, NULL),
(203, 'payee', 'web', NULL, NULL),
(204, 'view-payee', 'web', NULL, NULL),
(205, 'store-payee', 'web', NULL, NULL),
(206, 'edit-payee', 'web', NULL, NULL),
(207, 'delete-payee', 'web', NULL, NULL),
(208, 'training_module', 'web', NULL, NULL),
(209, 'trainer', 'web', NULL, NULL),
(210, 'view-trainer', 'web', NULL, NULL),
(211, 'store-trainer', 'web', NULL, NULL),
(212, 'edit-trainer', 'web', NULL, NULL),
(213, 'delete-trainer', 'web', NULL, NULL),
(214, 'training', 'web', NULL, NULL),
(215, 'view-training', 'web', NULL, NULL),
(216, 'store-training', 'web', NULL, NULL),
(217, 'edit-training', 'web', NULL, NULL),
(218, 'delete-training', 'web', NULL, NULL),
(219, 'access-module', 'web', NULL, NULL),
(220, 'access-variable_type', 'web', NULL, NULL),
(221, 'access-variable_method', 'web', NULL, NULL),
(222, 'access-language', 'web', NULL, NULL),
(223, 'announcement', 'web', NULL, NULL),
(224, 'store-announcement', 'web', NULL, NULL),
(225, 'edit-announcement', 'web', NULL, NULL),
(226, 'delete-announcement', 'web', NULL, NULL),
(227, 'company', 'web', NULL, NULL),
(228, 'view-company', 'web', NULL, NULL),
(229, 'store-company', 'web', NULL, NULL),
(230, 'edit-company', 'web', NULL, NULL),
(231, 'delete-company', 'web', NULL, NULL),
(232, 'department', 'web', NULL, NULL),
(233, 'view-department', 'web', NULL, NULL),
(234, 'store-department', 'web', NULL, NULL),
(235, 'edit-department', 'web', NULL, NULL),
(236, 'delete-department', 'web', NULL, NULL),
(237, 'designation', 'web', NULL, NULL),
(238, 'view-designation', 'web', NULL, NULL),
(239, 'store-designation', 'web', NULL, NULL),
(240, 'edit-designation', 'web', NULL, NULL),
(241, 'delete-designation', 'web', NULL, NULL),
(242, 'location', 'web', NULL, NULL),
(243, 'view-location', 'web', NULL, NULL),
(244, 'store-location', 'web', NULL, NULL),
(245, 'edit-location', 'web', NULL, NULL),
(246, 'delete-location', 'web', NULL, NULL),
(247, 'policy', 'web', NULL, NULL),
(248, 'store-policy', 'web', NULL, NULL),
(249, 'edit-policy', 'web', NULL, NULL),
(250, 'delete-policy', 'web', NULL, NULL),
(251, 'view-cms', 'web', NULL, NULL),
(252, 'store-cms', 'web', NULL, NULL),
(253, 'store-user', 'web', NULL, NULL),
(254, 'delete-attendance', 'web', NULL, NULL),
(255, 'view-leave', 'web', NULL, NULL),
(256, 'store-leave', 'web', NULL, NULL),
(257, 'edit-leave', 'web', NULL, NULL),
(258, 'delete-leave', 'web', NULL, NULL),
(259, 'cms', 'web', NULL, NULL),
(260, 'performance', 'web', NULL, NULL),
(261, 'goal-type', 'web', NULL, NULL),
(262, 'view-goal-type', 'web', NULL, NULL),
(263, 'store-goal-type', 'web', NULL, NULL),
(264, 'edit-goal-type', 'web', NULL, NULL),
(265, 'delete-goal-type', 'web', NULL, NULL),
(266, 'goal-tracking', 'web', NULL, NULL),
(267, 'view-goal-tracking', 'web', NULL, NULL),
(268, 'store-goal-tracking', 'web', NULL, NULL),
(269, 'edit-goal-tracking', 'web', NULL, NULL),
(270, 'delete-goal-tracking', 'web', NULL, NULL),
(271, 'indicator', 'web', NULL, NULL),
(272, 'view-indicator', 'web', NULL, NULL),
(273, 'store-indicator', 'web', NULL, NULL),
(274, 'edit-indicator', 'web', NULL, NULL),
(275, 'delete-indicator', 'web', NULL, NULL),
(276, 'appraisal', 'web', NULL, NULL),
(277, 'view-appraisal', 'web', NULL, NULL),
(278, 'store-appraisal', 'web', NULL, NULL),
(279, 'edit-appraisal', 'web', NULL, NULL),
(280, 'delete-appraisal', 'web', NULL, NULL),
(281, 'assets-and-category', 'web', NULL, NULL),
(282, 'category', 'web', NULL, NULL),
(283, 'view-assets-category', 'web', NULL, NULL),
(284, 'store-assets-category', 'web', NULL, NULL),
(285, 'edit-assets-category', 'web', NULL, NULL),
(286, 'delete-assets-category', 'web', NULL, NULL),
(287, 'assets', 'web', NULL, NULL),
(288, 'view-assets', 'web', NULL, NULL),
(289, 'store-assets', 'web', NULL, NULL),
(290, 'edit-assets', 'web', NULL, NULL),
(291, 'delete-assets', 'web', NULL, NULL),
(292, 'daily-attendances', 'web', NULL, NULL),
(293, 'date-wise-attendances', 'web', NULL, NULL),
(294, 'monthly-attendances', 'web', NULL, NULL),
(295, 'set-permission', 'web', NULL, NULL),
(296, 'get-leave-notification', 'web', NULL, NULL),
(297, 'report-pension', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `policies`
--

CREATE TABLE `policies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `project_priority` varchar(40) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `summary` mediumtext DEFAULT NULL,
  `project_status` varchar(40) NOT NULL DEFAULT 'not started',
  `project_note` longtext DEFAULT NULL,
  `project_progress` varchar(191) DEFAULT NULL,
  `is_notify` tinyint(4) DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_bugs`
--

CREATE TABLE `project_bugs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` mediumtext NOT NULL,
  `bug_attachment` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_discussions`
--

CREATE TABLE `project_discussions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `project_discussion` mediumtext NOT NULL,
  `discussion_attachment` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_files`
--

CREATE TABLE `project_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `file_title` varchar(191) NOT NULL,
  `file_attachment` varchar(191) NOT NULL,
  `file_description` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `promotion_title` varchar(40) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `promotion_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qualification_education_levels`
--

CREATE TABLE `qualification_education_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qualification_languages`
--

CREATE TABLE `qualification_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qualification_skills`
--

CREATE TABLE `qualification_skills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resignations`
--

CREATE TABLE `resignations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `notice_date` date DEFAULT NULL,
  `resignation_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', 'Can access and change everything', 1, NULL, NULL),
(2, 'employee', 'web', 'Default access', 1, '2020-07-26 13:50:45', '2020-07-26 13:50:45'),
(3, 'client', 'web', 'When you create a client, this role and associated.', 1, '2020-10-08 03:10:23', '2020-10-08 03:10:23'),
(4, 'Manager', 'web', 'Can Manage', 1, '2021-02-24 10:24:58', '2021-02-24 10:24:58'),
(5, 'Editor', 'web', 'Custom access', 1, '2021-02-24 10:24:58', '2021-02-24 10:24:58'),
(6, 'HR', 'web', '', 1, '2021-09-05 03:12:28', '2021-09-05 03:12:28');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 5),
(1, 6),
(2, 5),
(2, 6),
(3, 5),
(3, 6),
(4, 5),
(4, 6),
(5, 5),
(5, 6),
(6, 5),
(6, 6),
(7, 5),
(7, 6),
(8, 5),
(8, 6),
(9, 5),
(9, 6),
(10, 5),
(10, 6),
(11, 5),
(11, 6),
(13, 5),
(13, 6),
(14, 5),
(14, 6),
(15, 5),
(15, 6),
(16, 5),
(16, 6),
(17, 5),
(17, 6),
(18, 5),
(18, 6),
(20, 5),
(20, 6),
(21, 5),
(21, 6),
(22, 5),
(22, 6),
(23, 5),
(23, 6),
(24, 5),
(24, 6),
(25, 5),
(25, 6),
(26, 5),
(26, 6),
(27, 5),
(27, 6),
(28, 5),
(28, 6),
(29, 5),
(29, 6),
(30, 5),
(30, 6),
(31, 5),
(31, 6),
(32, 5),
(32, 6),
(33, 5),
(33, 6),
(34, 5),
(34, 6),
(35, 5),
(35, 6),
(36, 5),
(36, 6),
(37, 5),
(37, 6),
(38, 5),
(38, 6),
(39, 5),
(39, 6),
(41, 5),
(41, 6),
(42, 5),
(42, 6),
(43, 5),
(43, 6),
(44, 5),
(44, 6),
(46, 5),
(46, 6),
(47, 5),
(47, 6),
(48, 5),
(48, 6),
(49, 5),
(49, 6),
(50, 5),
(50, 6),
(51, 5),
(51, 6),
(52, 5),
(52, 6),
(53, 5),
(53, 6),
(54, 5),
(54, 6),
(55, 5),
(55, 6),
(56, 5),
(56, 6),
(57, 5),
(57, 6),
(58, 5),
(58, 6),
(59, 5),
(59, 6),
(60, 5),
(60, 6),
(61, 5),
(61, 6),
(62, 5),
(62, 6),
(63, 5),
(63, 6),
(64, 5),
(64, 6),
(65, 5),
(65, 6),
(66, 5),
(66, 6),
(67, 5),
(67, 6),
(68, 5),
(68, 6),
(69, 5),
(69, 6),
(70, 5),
(70, 6),
(71, 5),
(71, 6),
(72, 5),
(72, 6),
(73, 5),
(73, 6),
(74, 5),
(74, 6),
(75, 5),
(75, 6),
(76, 5),
(76, 6),
(81, 5),
(82, 5),
(83, 5),
(84, 5),
(85, 5),
(86, 5),
(87, 5),
(90, 5),
(91, 5),
(92, 5),
(93, 5),
(94, 5),
(95, 5),
(96, 5),
(97, 5),
(98, 5),
(104, 5),
(105, 5),
(106, 5),
(107, 5),
(108, 5),
(109, 5),
(110, 5),
(112, 5),
(113, 5),
(114, 5),
(115, 5),
(116, 5),
(117, 5),
(118, 5),
(119, 5),
(120, 5),
(121, 5),
(122, 5),
(123, 5),
(124, 5),
(125, 5),
(126, 5),
(127, 5),
(128, 5),
(129, 5),
(130, 5),
(131, 5),
(132, 5),
(133, 5),
(134, 5),
(135, 5),
(136, 5),
(137, 5),
(138, 5),
(139, 5),
(140, 5),
(141, 5),
(142, 5),
(144, 5),
(144, 6),
(145, 5),
(145, 6),
(146, 5),
(147, 5),
(148, 5),
(149, 5),
(150, 5),
(151, 5),
(152, 5),
(153, 5),
(154, 5),
(156, 5),
(157, 5),
(158, 5),
(159, 5),
(160, 5),
(161, 5),
(162, 5),
(163, 5),
(164, 5),
(165, 5),
(166, 5),
(167, 5),
(168, 5),
(169, 5),
(169, 6),
(170, 5),
(170, 6),
(171, 5),
(171, 6),
(172, 5),
(172, 6),
(173, 5),
(173, 6),
(176, 5),
(177, 5),
(178, 5),
(179, 5),
(180, 5),
(181, 5),
(182, 5),
(183, 5),
(184, 5),
(185, 5),
(186, 5),
(187, 5),
(188, 5),
(189, 5),
(190, 5),
(191, 5),
(192, 5),
(193, 5),
(194, 5),
(195, 5),
(196, 5),
(197, 5),
(198, 5),
(199, 5),
(200, 5),
(201, 5),
(202, 5),
(203, 5),
(204, 5),
(205, 5),
(206, 5),
(207, 5),
(208, 5),
(209, 5),
(210, 5),
(211, 5),
(212, 5),
(213, 5),
(214, 5),
(215, 5),
(216, 5),
(217, 5),
(218, 5),
(220, 5),
(220, 6),
(221, 5),
(221, 6),
(222, 5),
(222, 6),
(223, 5),
(224, 5),
(225, 5),
(226, 5),
(227, 5),
(228, 5),
(229, 5),
(230, 5),
(231, 5),
(232, 5),
(233, 5),
(234, 5),
(235, 5),
(236, 5),
(237, 5),
(238, 5),
(239, 5),
(240, 5),
(241, 5),
(242, 5),
(243, 5),
(244, 5),
(245, 5),
(246, 5),
(247, 5),
(248, 5),
(249, 5),
(250, 5),
(251, 5),
(252, 5),
(253, 5),
(253, 6),
(254, 5),
(254, 6),
(255, 5),
(255, 6),
(256, 5),
(256, 6),
(257, 5),
(257, 6),
(258, 5),
(258, 6),
(259, 5),
(260, 5),
(261, 5),
(262, 5),
(263, 5),
(264, 5),
(265, 5),
(266, 5),
(267, 5),
(268, 5),
(269, 5),
(270, 5),
(271, 5),
(272, 5),
(273, 5),
(274, 5),
(275, 5),
(276, 5),
(277, 5),
(278, 5),
(279, 5),
(280, 5),
(281, 5),
(282, 5),
(283, 5),
(284, 5),
(285, 5),
(286, 5),
(287, 5),
(288, 5),
(289, 5),
(290, 5),
(291, 5),
(292, 5),
(293, 5),
(294, 5),
(295, 5),
(295, 6),
(296, 5),
(296, 6),
(297, 5);

-- --------------------------------------------------------

--
-- Table structure for table `salary_allowances`
--

CREATE TABLE `salary_allowances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `month_year` varchar(191) NOT NULL,
  `first_date` date DEFAULT NULL,
  `allowance_title` varchar(191) NOT NULL,
  `allowance_amount` varchar(191) NOT NULL,
  `is_taxable` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_symbol` varchar(255) DEFAULT '$',
  `deductible_amt` double NOT NULL DEFAULT 0,
  `is_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `allowance_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salary_allowances`
--

INSERT INTO `salary_allowances` (`id`, `employee_id`, `month_year`, `first_date`, `allowance_title`, `allowance_amount`, `is_taxable`, `created_at`, `updated_at`, `currency_id`, `currency_symbol`, `deductible_amt`, `is_recurring`, `allowance_id`) VALUES
(5, 64, 'March-2024', '2024-03-01', 'New', '10', 1, '2024-03-02 12:09:04', '2024-03-02 12:09:04', 1, '$', 100, 0, NULL),
(6, 67, 'March-2024', '2024-03-01', 'Data', '10', 1, '2024-03-06 03:07:02', '2024-03-06 03:07:02', 1, '$', 10, 0, NULL),
(7, 65, 'March-2024', '2024-03-01', 'tO ALL', '100', 1, '2024-03-13 14:29:35', '2024-03-13 14:29:35', 1, '$', 10, 0, NULL),
(8, 66, 'March-2024', '2024-03-01', 'tO ALL', '100', 1, '2024-03-13 14:29:35', '2024-03-13 14:29:35', 1, '$', 10, 0, NULL),
(9, 65, 'March-2024', '2024-03-01', 'New', '100', 1, '2024-03-13 15:18:47', '2024-03-13 15:18:47', 1, '$', 10, 1, NULL),
(10, 64, 'March-2024', '2024-03-01', 'New Allownace', '1000', 1, '2024-03-13 15:20:54', '2024-03-13 15:20:54', 1, '$', 10, 0, NULL),
(11, 65, 'March-2024', '2024-03-01', 'New Allownace', '1000', 1, '2024-03-13 15:20:54', '2024-03-13 15:20:54', 1, '$', 10, 0, NULL),
(12, 66, 'March-2024', '2024-03-01', 'New Allownace', '1000', 1, '2024-03-13 15:20:54', '2024-03-13 15:20:54', 1, '$', 10, 0, NULL),
(13, 64, 'March-2024', '2024-03-01', 'tO ALL', '100', 1, '2024-03-13 15:21:17', '2024-03-13 15:21:17', 1, '$', 10, 0, NULL),
(14, 64, 'March-2024', '2024-03-01', 'New', '10', 1, '2024-03-14 05:11:06', '2024-03-14 05:11:06', 1, '$', 10, 0, NULL),
(22, 64, 'March-2024', '2024-03-01', 'New Allownace', '1000', 1, '2024-03-14 05:37:23', '2024-03-14 05:37:23', 1, '$', 10, 1, 5),
(23, 64, 'April-2024', '2024-04-01', 'hjkl;', '10', 1, '2024-04-28 11:12:50', '2024-04-28 11:12:50', 1, '$', 10, 0, NULL),
(24, 65, 'April-2024', '2024-04-01', 'hjkl;', '10', 1, '2024-04-28 11:12:50', '2024-04-28 11:12:50', 1, '$', 10, 0, NULL),
(25, 66, 'April-2024', '2024-04-01', 'hjkl;', '10', 1, '2024-04-28 11:12:50', '2024-04-28 11:12:50', 1, '$', 10, 0, NULL),
(26, 67, 'April-2024', '2024-04-01', 'hjkl;', '10', 1, '2024-04-28 11:12:50', '2024-04-28 11:12:50', 1, '$', 10, 0, NULL),
(27, 68, 'April-2024', '2024-04-01', 'hjkl;', '10', 1, '2024-04-28 11:12:50', '2024-04-28 11:12:50', 1, '$', 10, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `salary_basics`
--

CREATE TABLE `salary_basics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `month_year` varchar(191) NOT NULL,
  `first_date` date DEFAULT NULL,
  `payslip_type` varchar(191) NOT NULL,
  `basic_salary` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_symbol` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salary_basics`
--

INSERT INTO `salary_basics` (`id`, `employee_id`, `month_year`, `first_date`, `payslip_type`, `basic_salary`, `created_at`, `updated_at`, `currency_id`, `currency_symbol`) VALUES
(9, 64, 'January-2024', '2024-01-01', 'Monthly', 560, '2024-02-13 11:19:49', '2024-02-13 11:19:49', 1, '$'),
(10, 65, 'January-2024', '2024-01-01', 'Monthly', 800, '2024-02-13 11:20:13', '2024-02-13 11:20:13', 1, '$'),
(11, 66, 'October-2024', '2024-10-01', 'Monthly', 600, '2024-02-15 14:32:29', '2024-02-15 14:32:29', 1, '$'),
(12, 67, 'February-2024', '2024-02-01', 'Monthly', 500, '2024-02-17 05:12:03', '2024-02-17 05:12:03', 1, '$'),
(13, 68, 'February-2024', '2024-02-01', 'Monthly', 600, '2024-02-17 15:43:16', '2024-02-17 15:43:16', 1, '$');

-- --------------------------------------------------------

--
-- Table structure for table `salary_commissions`
--

CREATE TABLE `salary_commissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `month_year` varchar(191) NOT NULL,
  `commission_title` varchar(191) NOT NULL,
  `first_date` date DEFAULT NULL,
  `commission_amount` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_deductions`
--

CREATE TABLE `salary_deductions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `month_year` varchar(50) NOT NULL,
  `first_date` date DEFAULT NULL,
  `deduction_title` varchar(191) NOT NULL,
  `deduction_amount` varchar(191) NOT NULL,
  `deduction_type` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_taxable` tinyint(1) NOT NULL DEFAULT 0,
  `currency_symbol` varchar(255) NOT NULL DEFAULT '$',
  `deductible_amt` double NOT NULL DEFAULT 0,
  `insuarable_amount` double NOT NULL DEFAULT 0,
  `is_nssa_insuarance` tinyint(1) NOT NULL DEFAULT 0,
  `is_nssa_contribution` tinyint(1) NOT NULL DEFAULT 0,
  `zimra_payable_amount` double NOT NULL DEFAULT 0,
  `is_zimra_income` tinyint(1) NOT NULL DEFAULT 0,
  `is_zimra_aids` tinyint(1) NOT NULL DEFAULT 0,
  `is_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `deduction_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salary_deductions`
--

INSERT INTO `salary_deductions` (`id`, `employee_id`, `month_year`, `first_date`, `deduction_title`, `deduction_amount`, `deduction_type`, `created_at`, `updated_at`, `currency_id`, `is_taxable`, `currency_symbol`, `deductible_amt`, `insuarable_amount`, `is_nssa_insuarance`, `is_nssa_contribution`, `zimra_payable_amount`, `is_zimra_income`, `is_zimra_aids`, `is_recurring`, `deduction_id`) VALUES
(191, 64, 'December-2024', '2024-12-01', 'Zimra Income Tax', '105', 'Other Statutory Deduction', '2024-02-13 11:28:07', '2024-02-13 11:28:07', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(192, 64, 'December-2024', '2024-12-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-02-13 11:28:07', '2024-02-13 11:28:07', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(193, 64, 'December-2024', '2024-12-01', 'Zimra AIDS Levy', '3.15', 'Other Statutory Deduction', '2024-02-13 11:28:07', '2024-02-13 11:28:07', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(194, 64, 'December-2024', '2024-12-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-02-13 11:28:07', '2024-02-13 11:28:07', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(195, 64, 'December-2024', '2024-12-01', 'NSSA Insurance (9%)', '50.4', 'Other Statutory Deduction', '2024-02-13 11:28:07', '2024-02-13 11:28:07', NULL, 0, '$', 0, 560, 1, 0, 0, 0, 0, 0, NULL),
(196, 64, 'December-2024', '2024-12-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-13 11:28:07', '2024-02-13 11:28:07', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(197, 64, 'December-2024', '2024-12-01', 'NSSA APWCS Contribution', '6.72', 'Other Statutory Deduction', '2024-02-13 11:28:07', '2024-02-13 11:28:07', NULL, 0, '$', 0, 560, 0, 1, 0, 0, 0, 0, NULL),
(198, 64, 'December-2024', '2024-12-01', 'NSSA APWCS Contribution', '0', 'Other Statutory Deduction', '2024-02-13 11:28:07', '2024-02-13 11:28:07', NULL, 0, 'ZWL', 0, 0, 0, 1, 0, 0, 0, 0, NULL),
(199, 64, 'July-2024', '2024-07-01', 'Zimra Income Tax', '105', 'Other Statutory Deduction', '2024-02-13 11:38:59', '2024-02-13 11:38:59', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(200, 64, 'July-2024', '2024-07-01', 'Zimra Income Tax', '279495.03', 'Other Statutory Deduction', '2024-02-13 11:38:59', '2024-02-13 11:38:59', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(201, 64, 'July-2024', '2024-07-01', 'Zimra AIDS Levy', '3.15', 'Other Statutory Deduction', '2024-02-13 11:38:59', '2024-02-13 11:38:59', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(202, 64, 'July-2024', '2024-07-01', 'Zimra AIDS Levy', '8384.8509', 'Other Statutory Deduction', '2024-02-13 11:38:59', '2024-02-13 11:38:59', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(203, 64, 'July-2024', '2024-07-01', 'NSSA Insurance (9%)', '50.4', 'Other Statutory Deduction', '2024-02-13 11:38:59', '2024-02-13 11:38:59', NULL, 0, '$', 0, 560, 1, 0, 0, 0, 0, 0, NULL),
(204, 64, 'July-2024', '2024-07-01', 'NSSA Insurance (9%)', '144000', 'Other Statutory Deduction', '2024-02-13 11:38:59', '2024-02-13 11:38:59', NULL, 0, 'ZWL', 0, 1600000, 1, 0, 0, 0, 0, 0, NULL),
(205, 64, 'July-2024', '2024-07-01', 'NSSA APWCS Contribution', '6.72', 'Other Statutory Deduction', '2024-02-13 11:38:59', '2024-02-13 11:38:59', NULL, 0, '$', 0, 560, 0, 1, 0, 0, 0, 0, NULL),
(206, 64, 'July-2024', '2024-07-01', 'NSSA APWCS Contribution', '19200', 'Other Statutory Deduction', '2024-02-13 11:38:59', '2024-02-13 11:38:59', NULL, 0, 'ZWL', 0, 1600000, 0, 1, 0, 0, 0, 0, NULL),
(207, 64, 'August-2024', '2024-08-01', 'Zimra Income Tax', '90.72', 'Other Statutory Deduction', '2024-02-13 11:44:47', '2024-02-13 11:44:47', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(208, 64, 'August-2024', '2024-08-01', 'Zimra Income Tax', '238695.03', 'Other Statutory Deduction', '2024-02-13 11:44:47', '2024-02-13 11:44:47', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(209, 64, 'August-2024', '2024-08-01', 'Zimra AIDS Levy', '2.7216', 'Other Statutory Deduction', '2024-02-13 11:44:47', '2024-02-13 11:44:47', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(210, 64, 'August-2024', '2024-08-01', 'Zimra AIDS Levy', '7160.8509', 'Other Statutory Deduction', '2024-02-13 11:44:47', '2024-02-13 11:44:47', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(211, 64, 'August-2024', '2024-08-01', 'NSSA Insurance (9%)', '50.4', 'Other Statutory Deduction', '2024-02-13 11:44:47', '2024-02-13 11:44:47', NULL, 0, '$', 0, 560, 1, 0, 0, 0, 0, 0, NULL),
(212, 64, 'August-2024', '2024-08-01', 'NSSA Insurance (9%)', '144000', 'Other Statutory Deduction', '2024-02-13 11:44:47', '2024-02-13 11:44:47', NULL, 0, 'ZWL', 0, 1600000, 1, 0, 0, 0, 0, 0, NULL),
(213, 64, 'August-2024', '2024-08-01', 'NSSA APWCS Contribution', '6.72', 'Other Statutory Deduction', '2024-02-13 11:44:47', '2024-02-13 11:44:47', NULL, 0, '$', 0, 560, 0, 1, 0, 0, 0, 0, NULL),
(214, 64, 'August-2024', '2024-08-01', 'NSSA APWCS Contribution', '19200', 'Other Statutory Deduction', '2024-02-13 11:44:47', '2024-02-13 11:44:47', NULL, 0, 'ZWL', 0, 1600000, 0, 1, 0, 0, 0, 0, NULL),
(215, 64, 'September-2024', '2024-09-01', 'Zimra Income Tax', '90.72', 'Other Statutory Deduction', '2024-02-13 11:47:21', '2024-02-13 11:47:21', NULL, 0, '$', 0, 0, 0, 0, 502.88, 0, 0, 0, NULL),
(216, 64, 'September-2024', '2024-09-01', 'Zimra Income Tax', '238695.03', 'Other Statutory Deduction', '2024-02-13 11:47:21', '2024-02-13 11:47:21', NULL, 0, 'ZWL', 0, 0, 0, 0, 1436800, 0, 0, 0, NULL),
(217, 64, 'September-2024', '2024-09-01', 'Zimra AIDS Levy', '2.7216', 'Other Statutory Deduction', '2024-02-13 11:47:21', '2024-02-13 11:47:21', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(218, 64, 'September-2024', '2024-09-01', 'Zimra AIDS Levy', '7160.8509', 'Other Statutory Deduction', '2024-02-13 11:47:21', '2024-02-13 11:47:21', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(219, 64, 'September-2024', '2024-09-01', 'NSSA Insurance (9%)', '50.4', 'Other Statutory Deduction', '2024-02-13 11:47:21', '2024-02-13 11:47:21', NULL, 0, '$', 0, 560, 1, 0, 0, 0, 0, 0, NULL),
(220, 64, 'September-2024', '2024-09-01', 'NSSA Insurance (9%)', '144000', 'Other Statutory Deduction', '2024-02-13 11:47:21', '2024-02-13 11:47:21', NULL, 0, 'ZWL', 0, 1600000, 1, 0, 0, 0, 0, 0, NULL),
(221, 64, 'September-2024', '2024-09-01', 'NSSA APWCS Contribution', '6.72', 'Other Statutory Deduction', '2024-02-13 11:47:21', '2024-02-13 11:47:21', NULL, 0, '$', 0, 560, 0, 1, 0, 0, 0, 0, NULL),
(222, 64, 'September-2024', '2024-09-01', 'NSSA APWCS Contribution', '19200', 'Other Statutory Deduction', '2024-02-13 11:47:21', '2024-02-13 11:47:21', NULL, 0, 'ZWL', 0, 1600000, 0, 1, 0, 0, 0, 0, NULL),
(223, 66, 'October-2024', '2024-10-01', 'Zimra Income Tax', '115', 'Other Statutory Deduction', '2024-02-15 14:32:44', '2024-02-15 14:32:44', NULL, 0, '$', 0, 0, 0, 0, 600, 0, 0, 0, NULL),
(224, 66, 'October-2024', '2024-10-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-02-15 14:32:44', '2024-02-15 14:32:44', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(225, 66, 'October-2024', '2024-10-01', 'Zimra AIDS Levy', '3.45', 'Other Statutory Deduction', '2024-02-15 14:32:44', '2024-02-15 14:32:44', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(226, 66, 'October-2024', '2024-10-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-02-15 14:32:44', '2024-02-15 14:32:44', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(227, 66, 'October-2024', '2024-10-01', 'NSSA Insurance (9%)', '54', 'Other Statutory Deduction', '2024-02-15 14:32:44', '2024-02-15 14:32:44', NULL, 0, '$', 0, 600, 1, 0, 0, 0, 0, 0, NULL),
(228, 66, 'October-2024', '2024-10-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-15 14:32:44', '2024-02-15 14:32:44', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(229, 66, 'October-2024', '2024-10-01', 'NSSA APWCS Contribution', '7.2', 'Other Statutory Deduction', '2024-02-15 14:32:44', '2024-02-15 14:32:44', NULL, 0, '$', 0, 600, 0, 1, 0, 0, 0, 0, NULL),
(230, 66, 'October-2024', '2024-10-01', 'NSSA APWCS Contribution', '0', 'Other Statutory Deduction', '2024-02-15 14:32:44', '2024-02-15 14:32:44', NULL, 0, 'ZWL', 0, 0, 0, 1, 0, 0, 0, 0, NULL),
(231, 66, 'November-2024', '2024-11-01', 'Zimra Income Tax', '99.7', 'Other Statutory Deduction', '2024-02-15 14:52:00', '2024-02-15 14:52:00', NULL, 0, '$', 0, 0, 0, 0, 538.8, 0, 0, 0, NULL),
(232, 66, 'November-2024', '2024-11-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-02-15 14:52:00', '2024-02-15 14:52:00', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(233, 66, 'November-2024', '2024-11-01', 'Zimra AIDS Levy', '2.991', 'Other Statutory Deduction', '2024-02-15 14:52:00', '2024-02-15 14:52:00', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(234, 66, 'November-2024', '2024-11-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-02-15 14:52:00', '2024-02-15 14:52:00', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(235, 66, 'November-2024', '2024-11-01', 'NSSA Insurance (9%)', '54', 'Other Statutory Deduction', '2024-02-15 14:52:00', '2024-02-15 14:52:00', NULL, 0, '$', 0, 600, 1, 0, 0, 0, 0, 0, NULL),
(236, 66, 'November-2024', '2024-11-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-15 14:52:00', '2024-02-15 14:52:00', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(237, 66, 'November-2024', '2024-11-01', 'NSSA APWCS Contribution', '7.2', 'Other Statutory Deduction', '2024-02-15 14:52:00', '2024-02-15 14:52:00', NULL, 0, '$', 0, 600, 0, 1, 0, 0, 0, 0, NULL),
(238, 66, 'November-2024', '2024-11-01', 'NSSA APWCS Contribution', '0', 'Other Statutory Deduction', '2024-02-15 14:52:00', '2024-02-15 14:52:00', NULL, 0, 'ZWL', 0, 0, 0, 1, 0, 0, 0, 0, NULL),
(239, 66, 'November-2024', '2024-11-01', 'Zimra Income Tax', '99.7', 'Other Statutory Deduction', '2024-02-15 14:55:26', '2024-02-15 14:55:26', NULL, 0, '$', 0, 0, 0, 0, 538.8, 0, 0, 0, NULL),
(240, 66, 'November-2024', '2024-11-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-02-15 14:55:26', '2024-02-15 14:55:26', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(241, 66, 'November-2024', '2024-11-01', 'Zimra AIDS Levy', '2.991', 'Other Statutory Deduction', '2024-02-15 14:55:26', '2024-02-15 14:55:26', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(242, 66, 'November-2024', '2024-11-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-02-15 14:55:26', '2024-02-15 14:55:26', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(243, 66, 'November-2024', '2024-11-01', 'NSSA Insurance (9%)', '54', 'Other Statutory Deduction', '2024-02-15 14:55:26', '2024-02-15 14:55:26', NULL, 0, '$', 0, 600, 1, 0, 0, 0, 0, 0, NULL),
(244, 66, 'November-2024', '2024-11-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-15 14:55:26', '2024-02-15 14:55:26', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(245, 66, 'November-2024', '2024-11-01', 'NSSA APWCS Contribution', '7.2', 'Other Statutory Deduction', '2024-02-15 14:55:26', '2024-02-15 14:55:26', NULL, 0, '$', 0, 600, 0, 1, 0, 0, 0, 0, NULL),
(246, 66, 'November-2024', '2024-11-01', 'NSSA APWCS Contribution', '0', 'Other Statutory Deduction', '2024-02-15 14:55:26', '2024-02-15 14:55:26', NULL, 0, 'ZWL', 0, 0, 0, 1, 0, 0, 0, 0, NULL),
(247, 66, 'December-2024', '2024-12-01', 'Zimra Income Tax', '84.4', 'Other Statutory Deduction', '2024-02-16 05:58:31', '2024-02-16 05:58:31', NULL, 0, '$', 0, 0, 0, 0, 477.6, 0, 0, 0, NULL),
(248, 66, 'December-2024', '2024-12-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-02-16 05:58:31', '2024-02-16 05:58:31', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(249, 66, 'December-2024', '2024-12-01', 'Zimra AIDS Levy', '2.532', 'Other Statutory Deduction', '2024-02-16 05:58:31', '2024-02-16 05:58:31', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(250, 66, 'December-2024', '2024-12-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-02-16 05:58:31', '2024-02-16 05:58:31', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(251, 66, 'December-2024', '2024-12-01', 'NSSA Insurance (9%)', '54', 'Other Statutory Deduction', '2024-02-16 05:58:31', '2024-02-16 05:58:31', NULL, 0, '$', 0, 600, 1, 0, 0, 0, 0, 0, NULL),
(252, 66, 'December-2024', '2024-12-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-16 05:58:31', '2024-02-16 05:58:31', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(253, 66, 'December-2024', '2024-12-01', 'NSSA APWCS Contribution', '7.2', 'Other Statutory Deduction', '2024-02-16 05:58:31', '2024-02-16 05:58:31', NULL, 0, '$', 0, 600, 0, 1, 0, 0, 0, 0, NULL),
(254, 66, 'December-2024', '2024-12-01', 'NSSA APWCS Contribution', '0', 'Other Statutory Deduction', '2024-02-16 05:58:31', '2024-02-16 05:58:31', NULL, 0, 'ZWL', 0, 0, 0, 1, 0, 0, 0, 0, NULL),
(255, 66, 'January-2025', '2025-01-01', 'Zimra Income Tax', '99.7', 'Other Statutory Deduction', '2024-02-16 06:01:12', '2024-02-16 06:01:12', NULL, 0, '$', 0, 0, 0, 0, 538.8, 0, 0, 0, NULL),
(256, 66, 'January-2025', '2025-01-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-02-16 06:01:12', '2024-02-16 06:01:12', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(257, 66, 'January-2025', '2025-01-01', 'Zimra AIDS Levy', '2.991', 'Other Statutory Deduction', '2024-02-16 06:01:12', '2024-02-16 06:01:12', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(258, 66, 'January-2025', '2025-01-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-02-16 06:01:12', '2024-02-16 06:01:12', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(259, 66, 'January-2025', '2025-01-01', 'NSSA Insurance (9%)', '54', 'Other Statutory Deduction', '2024-02-16 06:01:12', '2024-02-16 06:01:12', NULL, 0, '$', 0, 600, 1, 0, 0, 0, 0, 0, NULL),
(260, 66, 'January-2025', '2025-01-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-16 06:01:12', '2024-02-16 06:01:12', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(261, 66, 'January-2025', '2025-01-01', 'NSSA APWCS Contribution', '7.2', 'Other Statutory Deduction', '2024-02-16 06:01:12', '2024-02-16 06:01:12', NULL, 0, '$', 0, 600, 0, 1, 0, 0, 0, 0, NULL),
(262, 66, 'January-2025', '2025-01-01', 'NSSA APWCS Contribution', '0', 'Other Statutory Deduction', '2024-02-16 06:01:12', '2024-02-16 06:01:12', NULL, 0, 'ZWL', 0, 0, 0, 1, 0, 0, 0, 0, NULL),
(263, 66, 'February-2025', '2025-02-01', 'Zimra Income Tax', '99.7', 'Other Statutory Deduction', '2024-02-16 06:02:25', '2024-02-16 06:02:25', NULL, 0, '$', 0, 0, 0, 0, 538.8, 0, 0, 0, NULL),
(264, 66, 'February-2025', '2025-02-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-02-16 06:02:25', '2024-02-16 06:02:25', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(265, 66, 'February-2025', '2025-02-01', 'Zimra AIDS Levy', '2.991', 'Other Statutory Deduction', '2024-02-16 06:02:25', '2024-02-16 06:02:25', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(266, 66, 'February-2025', '2025-02-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-02-16 06:02:25', '2024-02-16 06:02:25', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(267, 66, 'February-2025', '2025-02-01', 'NSSA Insurance (9%)', '54', 'Other Statutory Deduction', '2024-02-16 06:02:25', '2024-02-16 06:02:25', NULL, 0, '$', 0, 600, 1, 0, 0, 0, 0, 0, NULL),
(268, 66, 'February-2025', '2025-02-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-16 06:02:25', '2024-02-16 06:02:25', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(269, 66, 'February-2025', '2025-02-01', 'NSSA APWCS Contribution', '7.2', 'Other Statutory Deduction', '2024-02-16 06:02:25', '2024-02-16 06:02:25', NULL, 0, '$', 0, 600, 0, 1, 0, 0, 0, 0, NULL),
(270, 66, 'February-2025', '2025-02-01', 'NSSA APWCS Contribution', '0', 'Other Statutory Deduction', '2024-02-16 06:02:25', '2024-02-16 06:02:25', NULL, 0, 'ZWL', 0, 0, 0, 1, 0, 0, 0, 0, NULL),
(271, 66, 'March-2025', '2025-03-01', 'Zimra Income Tax', '99.7', 'Other Statutory Deduction', '2024-02-16 06:04:05', '2024-02-16 06:04:05', NULL, 0, '$', 0, 0, 0, 0, 538.8, 0, 0, 0, NULL),
(272, 66, 'March-2025', '2025-03-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-02-16 06:04:05', '2024-02-16 06:04:05', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(273, 66, 'March-2025', '2025-03-01', 'Zimra AIDS Levy', '2.991', 'Other Statutory Deduction', '2024-02-16 06:04:05', '2024-02-16 06:04:05', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(274, 66, 'March-2025', '2025-03-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-02-16 06:04:05', '2024-02-16 06:04:05', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(275, 66, 'March-2025', '2025-03-01', 'NSSA Insurance (9%)', '54', 'Other Statutory Deduction', '2024-02-16 06:04:05', '2024-02-16 06:04:05', NULL, 0, '$', 0, 600, 1, 0, 0, 0, 0, 0, NULL),
(276, 66, 'March-2025', '2025-03-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-16 06:04:05', '2024-02-16 06:04:05', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(277, 66, 'March-2025', '2025-03-01', 'NSSA APWCS Contribution', '7.2', 'Other Statutory Deduction', '2024-02-16 06:04:05', '2024-02-16 06:04:05', NULL, 0, '$', 0, 600, 0, 1, 0, 0, 0, 0, NULL),
(278, 66, 'March-2025', '2025-03-01', 'NSSA APWCS Contribution', '0', 'Other Statutory Deduction', '2024-02-16 06:04:05', '2024-02-16 06:04:05', NULL, 0, 'ZWL', 0, 0, 0, 1, 0, 0, 0, 0, NULL),
(279, 66, 'April-2025', '2025-04-01', 'Zimra Income Tax', '99.7', 'Other Statutory Deduction', '2024-02-16 06:06:01', '2024-02-16 06:06:01', NULL, 0, '$', 0, 0, 0, 0, 538.8, 0, 0, 0, NULL),
(280, 66, 'April-2025', '2025-04-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-02-16 06:06:01', '2024-02-16 06:06:01', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(281, 66, 'April-2025', '2025-04-01', 'Zimra AIDS Levy', '2.991', 'Other Statutory Deduction', '2024-02-16 06:06:01', '2024-02-16 06:06:01', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(282, 66, 'April-2025', '2025-04-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-02-16 06:06:01', '2024-02-16 06:06:01', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(283, 66, 'April-2025', '2025-04-01', 'NSSA Insurance (9%)', '54', 'Other Statutory Deduction', '2024-02-16 06:06:01', '2024-02-16 06:06:01', NULL, 0, '$', 0, 600, 1, 0, 0, 0, 0, 0, NULL),
(284, 66, 'April-2025', '2025-04-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-16 06:06:01', '2024-02-16 06:06:01', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(285, 66, 'April-2025', '2025-04-01', 'NSSA APWCS Contribution', '7.2', 'Other Statutory Deduction', '2024-02-16 06:06:01', '2024-02-16 06:06:01', NULL, 0, '$', 0, 600, 0, 1, 0, 0, 0, 0, NULL),
(286, 66, 'April-2025', '2025-04-01', 'NSSA APWCS Contribution', '0', 'Other Statutory Deduction', '2024-02-16 06:06:01', '2024-02-16 06:06:01', NULL, 0, 'ZWL', 0, 0, 0, 1, 0, 0, 0, 0, NULL),
(287, 66, 'May-2025', '2025-05-01', 'Zimra Income Tax', '99.7', 'Other Statutory Deduction', '2024-02-16 06:14:34', '2024-02-16 06:14:34', NULL, 0, '$', 0, 0, 0, 0, 538.8, 0, 0, 0, NULL),
(288, 66, 'May-2025', '2025-05-01', 'Zimra Income Tax', '-10', 'Other Statutory Deduction', '2024-02-16 06:14:34', '2024-02-16 06:14:34', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(289, 66, 'May-2025', '2025-05-01', 'Zimra AIDS Levy', '2.991', 'Other Statutory Deduction', '2024-02-16 06:14:34', '2024-02-16 06:14:34', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(290, 66, 'May-2025', '2025-05-01', 'Zimra AIDS Levy', '-0.3', 'Other Statutory Deduction', '2024-02-16 06:14:34', '2024-02-16 06:14:34', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(291, 66, 'May-2025', '2025-05-01', 'NSSA Insurance (9%)', '54', 'Other Statutory Deduction', '2024-02-16 06:14:34', '2024-02-16 06:14:34', NULL, 0, '$', 0, 600, 1, 0, 0, 0, 0, 0, NULL),
(292, 66, 'May-2025', '2025-05-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-16 06:14:34', '2024-02-16 06:14:34', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(293, 66, 'May-2025', '2025-05-01', 'NSSA APWCS Contribution', '7.2', 'Other Statutory Deduction', '2024-02-16 06:14:34', '2024-02-16 06:14:34', NULL, 0, '$', 0, 600, 0, 1, 0, 0, 0, 0, NULL),
(294, 66, 'May-2025', '2025-05-01', 'NSSA APWCS Contribution', '0', 'Other Statutory Deduction', '2024-02-16 06:14:34', '2024-02-16 06:14:34', NULL, 0, 'ZWL', 0, 0, 0, 1, 0, 0, 0, 0, NULL),
(295, 65, 'February-2024', '2024-02-01', 'Zimra Income Tax', '-10', 'Other Statutory Deduction', '2024-02-16 08:25:07', '2024-02-16 08:25:07', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(296, 65, 'February-2024', '2024-02-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-02-16 08:25:07', '2024-02-16 08:25:07', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(297, 65, 'February-2024', '2024-02-01', 'Zimra AIDS Levy', '-0.3', 'Other Statutory Deduction', '2024-02-16 08:25:07', '2024-02-16 08:25:07', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(298, 65, 'February-2024', '2024-02-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-02-16 08:25:07', '2024-02-16 08:25:07', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(299, 65, 'February-2024', '2024-02-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-16 08:25:07', '2024-02-16 08:25:07', NULL, 0, '$', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(300, 65, 'February-2024', '2024-02-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-16 08:25:07', '2024-02-16 08:25:07', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(301, 65, 'February-2024', '2024-02-01', 'NSSA APWCS Contribution', '0', 'Other Statutory Deduction', '2024-02-16 08:25:07', '2024-02-16 08:25:07', NULL, 0, '$', 0, 0, 0, 1, 0, 0, 0, 0, NULL),
(302, 65, 'February-2024', '2024-02-01', 'NSSA APWCS Contribution', '0', 'Other Statutory Deduction', '2024-02-16 08:25:07', '2024-02-16 08:25:07', NULL, 0, 'ZWL', 0, 0, 0, 1, 0, 0, 0, 0, NULL),
(303, 65, 'March-2024', '2024-03-01', 'Zimra Income Tax', '-10', 'Other Statutory Deduction', '2024-02-16 08:27:21', '2024-02-16 08:27:21', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(304, 65, 'March-2024', '2024-03-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-02-16 08:27:21', '2024-02-16 08:27:21', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(305, 65, 'March-2024', '2024-03-01', 'Zimra AIDS Levy', '-0.3', 'Other Statutory Deduction', '2024-02-16 08:27:21', '2024-02-16 08:27:21', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(306, 65, 'March-2024', '2024-03-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-02-16 08:27:21', '2024-02-16 08:27:21', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(307, 65, 'March-2024', '2024-03-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-16 08:27:21', '2024-02-16 08:27:21', NULL, 0, '$', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(308, 65, 'March-2024', '2024-03-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-16 08:27:21', '2024-02-16 08:27:21', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(309, 65, 'March-2024', '2024-03-01', 'NSSA APWCS Contribution', '0', 'Other Statutory Deduction', '2024-02-16 08:27:21', '2024-02-16 08:27:21', NULL, 0, '$', 0, 0, 0, 1, 0, 0, 0, 0, NULL),
(310, 65, 'March-2024', '2024-03-01', 'NSSA APWCS Contribution', '0', 'Other Statutory Deduction', '2024-02-16 08:27:21', '2024-02-16 08:27:21', NULL, 0, 'ZWL', 0, 0, 0, 1, 0, 0, 0, 0, NULL),
(311, 65, 'April-2024', '2024-04-01', 'Zimra Income Tax', '-10', 'Other Statutory Deduction', '2024-02-16 08:30:23', '2024-02-16 08:30:23', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(312, 65, 'April-2024', '2024-04-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-02-16 08:30:23', '2024-02-16 08:30:23', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(313, 65, 'April-2024', '2024-04-01', 'Zimra AIDS Levy', '-0.3', 'Other Statutory Deduction', '2024-02-16 08:30:23', '2024-02-16 08:30:23', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(314, 65, 'April-2024', '2024-04-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-02-16 08:30:23', '2024-02-16 08:30:23', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(315, 65, 'April-2024', '2024-04-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-16 08:30:23', '2024-02-16 08:30:23', NULL, 0, '$', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(316, 65, 'April-2024', '2024-04-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-16 08:30:23', '2024-02-16 08:30:23', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(317, 65, 'April-2024', '2024-04-01', 'NSSA APWCS Contribution', '0', 'Other Statutory Deduction', '2024-02-16 08:30:23', '2024-02-16 08:30:23', NULL, 0, '$', 0, 0, 0, 1, 0, 0, 0, 0, NULL),
(318, 65, 'April-2024', '2024-04-01', 'NSSA APWCS Contribution', '0', 'Other Statutory Deduction', '2024-02-16 08:30:23', '2024-02-16 08:30:23', NULL, 0, 'ZWL', 0, 0, 0, 1, 0, 0, 0, 0, NULL),
(319, 64, 'February-2024', '2024-02-01', 'Zimra Income Tax', '105', 'Other Statutory Deduction', '2024-02-17 15:43:41', '2024-02-17 15:43:41', NULL, 0, '$', 0, 0, 0, 0, 560, 0, 0, 0, NULL),
(320, 64, 'February-2024', '2024-02-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-02-17 15:43:41', '2024-02-17 15:43:41', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(321, 64, 'February-2024', '2024-02-01', 'Zimra AIDS Levy', '3.15', 'Other Statutory Deduction', '2024-02-17 15:43:41', '2024-02-17 15:43:41', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(322, 64, 'February-2024', '2024-02-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-02-17 15:43:41', '2024-02-17 15:43:41', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(323, 64, 'February-2024', '2024-02-01', 'NSSA Insurance (9%)', '50.4', 'Other Statutory Deduction', '2024-02-17 15:43:41', '2024-02-17 15:43:41', NULL, 0, '$', 0, 560, 1, 0, 0, 0, 0, 0, NULL),
(324, 64, 'February-2024', '2024-02-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-17 15:43:41', '2024-02-17 15:43:41', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(325, 64, 'February-2024', '2024-02-01', 'NSSA APWCS Contribution', '6.72', 'Other Statutory Deduction', '2024-02-17 15:43:41', '2024-02-17 15:43:41', NULL, 0, '$', 0, 560, 0, 1, 0, 0, 0, 0, NULL),
(326, 64, 'February-2024', '2024-02-01', 'NSSA APWCS Contribution', '0', 'Other Statutory Deduction', '2024-02-17 15:43:41', '2024-02-17 15:43:41', NULL, 0, 'ZWL', 0, 0, 0, 1, 0, 0, 0, 0, NULL),
(327, 67, 'February-2024', '2024-02-01', 'Zimra Income Tax', '90', 'Other Statutory Deduction', '2024-02-17 15:43:41', '2024-02-17 15:43:41', NULL, 0, '$', 0, 0, 0, 0, 500, 0, 0, 0, NULL),
(328, 67, 'February-2024', '2024-02-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-02-17 15:43:41', '2024-02-17 15:43:41', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(329, 67, 'February-2024', '2024-02-01', 'Zimra AIDS Levy', '2.7', 'Other Statutory Deduction', '2024-02-17 15:43:41', '2024-02-17 15:43:41', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(330, 67, 'February-2024', '2024-02-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-02-17 15:43:41', '2024-02-17 15:43:41', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(331, 67, 'February-2024', '2024-02-01', 'NSSA Insurance (9%)', '45', 'Other Statutory Deduction', '2024-02-17 15:43:41', '2024-02-17 15:43:41', NULL, 0, '$', 0, 500, 1, 0, 0, 0, 0, 0, NULL),
(332, 67, 'February-2024', '2024-02-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-17 15:43:41', '2024-02-17 15:43:41', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(333, 67, 'February-2024', '2024-02-01', 'NSSA APWCS Contribution', '6', 'Other Statutory Deduction', '2024-02-17 15:43:41', '2024-02-17 15:43:41', NULL, 0, '$', 0, 500, 0, 1, 0, 0, 0, 0, NULL),
(334, 67, 'February-2024', '2024-02-01', 'NSSA APWCS Contribution', '0', 'Other Statutory Deduction', '2024-02-17 15:43:41', '2024-02-17 15:43:41', NULL, 0, 'ZWL', 0, 0, 0, 1, 0, 0, 0, 0, NULL),
(335, 68, 'February-2024', '2024-02-01', 'Zimra Income Tax', '115', 'Other Statutory Deduction', '2024-02-17 15:43:41', '2024-02-17 15:43:41', NULL, 0, '$', 0, 0, 0, 0, 600, 0, 0, 0, NULL),
(336, 68, 'February-2024', '2024-02-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-02-17 15:43:41', '2024-02-17 15:43:41', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(337, 68, 'February-2024', '2024-02-01', 'Zimra AIDS Levy', '3.45', 'Other Statutory Deduction', '2024-02-17 15:43:41', '2024-02-17 15:43:41', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(338, 68, 'February-2024', '2024-02-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-02-17 15:43:41', '2024-02-17 15:43:41', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(339, 68, 'February-2024', '2024-02-01', 'NSSA Insurance (9%)', '54', 'Other Statutory Deduction', '2024-02-17 15:43:41', '2024-02-17 15:43:41', NULL, 0, '$', 0, 600, 1, 0, 0, 0, 0, 0, NULL),
(340, 68, 'February-2024', '2024-02-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-17 15:43:41', '2024-02-17 15:43:41', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(341, 68, 'February-2024', '2024-02-01', 'NSSA APWCS Contribution', '7.2', 'Other Statutory Deduction', '2024-02-17 15:43:41', '2024-02-17 15:43:41', NULL, 0, '$', 0, 600, 0, 1, 0, 0, 0, 0, NULL),
(342, 68, 'February-2024', '2024-02-01', 'NSSA APWCS Contribution', '0', 'Other Statutory Deduction', '2024-02-17 15:43:41', '2024-02-17 15:43:41', NULL, 0, 'ZWL', 0, 0, 0, 1, 0, 0, 0, 0, NULL),
(343, 64, 'February-2024', '2024-02-01', 'Zimra Income Tax', '90.72', 'Other Statutory Deduction', '2024-02-17 15:46:56', '2024-02-17 15:46:56', NULL, 0, '$', 0, 0, 0, 0, 502.88, 0, 0, 0, NULL),
(344, 64, 'February-2024', '2024-02-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-02-17 15:46:56', '2024-02-17 15:46:56', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(345, 64, 'February-2024', '2024-02-01', 'Zimra AIDS Levy', '2.7216', 'Other Statutory Deduction', '2024-02-17 15:46:56', '2024-02-17 15:46:56', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(346, 64, 'February-2024', '2024-02-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-02-17 15:46:56', '2024-02-17 15:46:56', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(347, 64, 'February-2024', '2024-02-01', 'NSSA Insurance (9%)', '50.4', 'Other Statutory Deduction', '2024-02-17 15:46:56', '2024-02-17 15:46:56', NULL, 0, '$', 0, 560, 1, 0, 0, 0, 0, 0, NULL),
(348, 64, 'February-2024', '2024-02-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-17 15:46:56', '2024-02-17 15:46:56', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(349, 64, 'February-2024', '2024-02-01', 'NSSA APWCS Contribution', '6.72', 'Other Statutory Deduction', '2024-02-17 15:46:56', '2024-02-17 15:46:56', NULL, 0, '$', 0, 560, 0, 1, 0, 0, 0, 0, NULL),
(350, 64, 'February-2024', '2024-02-01', 'NSSA APWCS Contribution', '0', 'Other Statutory Deduction', '2024-02-17 15:46:56', '2024-02-17 15:46:56', NULL, 0, 'ZWL', 0, 0, 0, 1, 0, 0, 0, 0, NULL),
(351, 67, 'February-2024', '2024-02-01', 'Zimra Income Tax', '77.25', 'Other Statutory Deduction', '2024-02-17 15:46:56', '2024-02-17 15:46:56', NULL, 0, '$', 0, 0, 0, 0, 449, 0, 0, 0, NULL),
(352, 67, 'February-2024', '2024-02-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-02-17 15:46:56', '2024-02-17 15:46:56', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(353, 67, 'February-2024', '2024-02-01', 'Zimra AIDS Levy', '2.3175', 'Other Statutory Deduction', '2024-02-17 15:46:56', '2024-02-17 15:46:56', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(354, 67, 'February-2024', '2024-02-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-02-17 15:46:56', '2024-02-17 15:46:56', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(355, 67, 'February-2024', '2024-02-01', 'NSSA Insurance (9%)', '45', 'Other Statutory Deduction', '2024-02-17 15:46:56', '2024-02-17 15:46:56', NULL, 0, '$', 0, 500, 1, 0, 0, 0, 0, 0, NULL),
(356, 67, 'February-2024', '2024-02-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-17 15:46:56', '2024-02-17 15:46:56', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(357, 67, 'February-2024', '2024-02-01', 'NSSA APWCS Contribution', '6', 'Other Statutory Deduction', '2024-02-17 15:46:56', '2024-02-17 15:46:56', NULL, 0, '$', 0, 500, 0, 1, 0, 0, 0, 0, NULL),
(358, 67, 'February-2024', '2024-02-01', 'NSSA APWCS Contribution', '0', 'Other Statutory Deduction', '2024-02-17 15:46:56', '2024-02-17 15:46:56', NULL, 0, 'ZWL', 0, 0, 0, 1, 0, 0, 0, 0, NULL),
(359, 68, 'February-2024', '2024-02-01', 'Zimra Income Tax', '99.7', 'Other Statutory Deduction', '2024-02-17 15:46:56', '2024-02-17 15:46:56', NULL, 0, '$', 0, 0, 0, 0, 538.8, 0, 0, 0, NULL),
(360, 68, 'February-2024', '2024-02-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-02-17 15:46:56', '2024-02-17 15:46:56', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(361, 68, 'February-2024', '2024-02-01', 'Zimra AIDS Levy', '2.991', 'Other Statutory Deduction', '2024-02-17 15:46:56', '2024-02-17 15:46:56', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(362, 68, 'February-2024', '2024-02-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-02-17 15:46:56', '2024-02-17 15:46:56', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(363, 68, 'February-2024', '2024-02-01', 'NSSA Insurance (9%)', '54', 'Other Statutory Deduction', '2024-02-17 15:46:56', '2024-02-17 15:46:56', NULL, 0, '$', 0, 600, 1, 0, 0, 0, 0, 0, NULL),
(364, 68, 'February-2024', '2024-02-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-17 15:46:56', '2024-02-17 15:46:56', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(365, 68, 'February-2024', '2024-02-01', 'NSSA APWCS Contribution', '7.2', 'Other Statutory Deduction', '2024-02-17 15:46:56', '2024-02-17 15:46:56', NULL, 0, '$', 0, 600, 0, 1, 0, 0, 0, 0, NULL),
(366, 68, 'February-2024', '2024-02-01', 'NSSA APWCS Contribution', '0', 'Other Statutory Deduction', '2024-02-17 15:46:56', '2024-02-17 15:46:56', NULL, 0, 'ZWL', 0, 0, 0, 1, 0, 0, 0, 0, NULL),
(367, 64, 'February-2024', '2024-02-01', 'Zimra Income Tax', '76.44', 'Other Statutory Deduction', '2024-02-17 15:48:30', '2024-02-17 15:48:30', NULL, 0, '$', 0, 0, 0, 0, 445.76, 0, 0, 0, NULL),
(368, 64, 'February-2024', '2024-02-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-02-17 15:48:30', '2024-02-17 15:48:30', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(369, 64, 'February-2024', '2024-02-01', 'Zimra AIDS Levy', '2.2932', 'Other Statutory Deduction', '2024-02-17 15:48:30', '2024-02-17 15:48:30', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(370, 64, 'February-2024', '2024-02-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-02-17 15:48:30', '2024-02-17 15:48:30', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(371, 64, 'February-2024', '2024-02-01', 'NSSA Insurance (9%)', '50.4', 'Other Statutory Deduction', '2024-02-17 15:48:30', '2024-02-17 15:48:30', NULL, 0, '$', 0, 560, 1, 0, 0, 0, 0, 0, NULL),
(372, 64, 'February-2024', '2024-02-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-17 15:48:30', '2024-02-17 15:48:30', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(373, 64, 'February-2024', '2024-02-01', 'NSSA APWCS Contribution', '6.72', 'Other Statutory Deduction', '2024-02-17 15:48:30', '2024-02-17 15:48:30', NULL, 0, '$', 0, 560, 0, 1, 0, 0, 0, 0, NULL),
(374, 64, 'February-2024', '2024-02-01', 'NSSA APWCS Contribution', '0', 'Other Statutory Deduction', '2024-02-17 15:48:30', '2024-02-17 15:48:30', NULL, 0, 'ZWL', 0, 0, 0, 1, 0, 0, 0, 0, NULL),
(375, 67, 'February-2024', '2024-02-01', 'Zimra Income Tax', '64.5', 'Other Statutory Deduction', '2024-02-17 15:48:30', '2024-02-17 15:48:30', NULL, 0, '$', 0, 0, 0, 0, 398, 0, 0, 0, NULL),
(376, 67, 'February-2024', '2024-02-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-02-17 15:48:30', '2024-02-17 15:48:30', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(377, 67, 'February-2024', '2024-02-01', 'Zimra AIDS Levy', '1.935', 'Other Statutory Deduction', '2024-02-17 15:48:30', '2024-02-17 15:48:30', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(378, 67, 'February-2024', '2024-02-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-02-17 15:48:30', '2024-02-17 15:48:30', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(379, 67, 'February-2024', '2024-02-01', 'NSSA Insurance (9%)', '45', 'Other Statutory Deduction', '2024-02-17 15:48:30', '2024-02-17 15:48:30', NULL, 0, '$', 0, 500, 1, 0, 0, 0, 0, 0, NULL),
(380, 67, 'February-2024', '2024-02-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-17 15:48:30', '2024-02-17 15:48:30', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(381, 67, 'February-2024', '2024-02-01', 'NSSA APWCS Contribution', '6', 'Other Statutory Deduction', '2024-02-17 15:48:30', '2024-02-17 15:48:30', NULL, 0, '$', 0, 500, 0, 1, 0, 0, 0, 0, NULL),
(382, 67, 'February-2024', '2024-02-01', 'NSSA APWCS Contribution', '0', 'Other Statutory Deduction', '2024-02-17 15:48:30', '2024-02-17 15:48:30', NULL, 0, 'ZWL', 0, 0, 0, 1, 0, 0, 0, 0, NULL),
(383, 68, 'February-2024', '2024-02-01', 'Zimra Income Tax', '84.4', 'Other Statutory Deduction', '2024-02-17 15:48:30', '2024-02-17 15:48:30', NULL, 0, '$', 0, 0, 0, 0, 477.6, 0, 0, 0, NULL),
(384, 68, 'February-2024', '2024-02-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-02-17 15:48:30', '2024-02-17 15:48:30', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(385, 68, 'February-2024', '2024-02-01', 'Zimra AIDS Levy', '2.532', 'Other Statutory Deduction', '2024-02-17 15:48:30', '2024-02-17 15:48:30', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(386, 68, 'February-2024', '2024-02-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-02-17 15:48:30', '2024-02-17 15:48:30', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(387, 68, 'February-2024', '2024-02-01', 'NSSA Insurance (9%)', '54', 'Other Statutory Deduction', '2024-02-17 15:48:30', '2024-02-17 15:48:30', NULL, 0, '$', 0, 600, 1, 0, 0, 0, 0, 0, NULL),
(388, 68, 'February-2024', '2024-02-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-17 15:48:30', '2024-02-17 15:48:30', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(389, 68, 'February-2024', '2024-02-01', 'NSSA APWCS Contribution', '7.2', 'Other Statutory Deduction', '2024-02-17 15:48:30', '2024-02-17 15:48:30', NULL, 0, '$', 0, 600, 0, 1, 0, 0, 0, 0, NULL),
(390, 68, 'February-2024', '2024-02-01', 'NSSA APWCS Contribution', '0', 'Other Statutory Deduction', '2024-02-17 15:48:30', '2024-02-17 15:48:30', NULL, 0, 'ZWL', 0, 0, 0, 1, 0, 0, 0, 0, NULL),
(395, 64, 'May-2024', '2024-05-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-02-19 18:48:01', '2024-02-19 18:48:01', NULL, 0, '$', 0, 0, 0, 0, -171.36, 0, 0, 0, NULL),
(396, 64, 'May-2024', '2024-05-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-02-19 18:48:01', '2024-02-19 18:48:01', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(397, 64, 'May-2024', '2024-05-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-02-19 18:48:01', '2024-02-19 18:48:01', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(398, 64, 'May-2024', '2024-05-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-02-19 18:48:01', '2024-02-19 18:48:01', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(399, 64, 'May-2024', '2024-05-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-19 18:48:01', '2024-02-19 18:48:01', NULL, 0, '$', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(400, 64, 'May-2024', '2024-05-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-02-19 18:48:01', '2024-02-19 18:48:01', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(437, 64, 'March-2024', '2024-03-01', 'Zimra Income Tax', '64.66', 'Other Statutory Deduction', '2024-03-06 02:36:27', '2024-03-06 02:36:27', NULL, 0, '$', 0, 0, 0, 0, 398.64, 0, 0, 0, NULL),
(438, 64, 'March-2024', '2024-03-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-03-06 02:36:27', '2024-03-06 02:36:27', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(439, 64, 'March-2024', '2024-03-01', 'Zimra AIDS Levy', '1.9398', 'Other Statutory Deduction', '2024-03-06 02:36:27', '2024-03-06 02:36:27', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(440, 64, 'March-2024', '2024-03-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-03-06 02:36:27', '2024-03-06 02:36:27', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(441, 64, 'March-2024', '2024-03-01', 'NSSA Insurance (9%)', '51.3', 'Other Statutory Deduction', '2024-03-06 02:36:27', '2024-03-06 02:36:27', NULL, 0, '$', 0, 570, 1, 0, 0, 0, 0, 0, NULL),
(442, 64, 'March-2024', '2024-03-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-03-06 02:36:27', '2024-03-06 02:36:27', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(611, 68, 'March-2024', '2024-03-01', 'Zimra Income Tax', '115', 'Other Statutory Deduction', '2024-03-15 02:15:24', '2024-03-15 02:15:24', NULL, 0, '$', 0, 0, 0, 0, 600, 0, 0, 0, NULL),
(612, 68, 'March-2024', '2024-03-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-03-15 02:15:24', '2024-03-15 02:15:24', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(613, 68, 'March-2024', '2024-03-01', 'Zimra AIDS Levy', '3.45', 'Other Statutory Deduction', '2024-03-15 02:15:24', '2024-03-15 02:15:24', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(614, 68, 'March-2024', '2024-03-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-03-15 02:15:24', '2024-03-15 02:15:24', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(615, 68, 'March-2024', '2024-03-01', 'NSSA Insurance (9%)', '54', 'Other Statutory Deduction', '2024-03-15 02:15:24', '2024-03-15 02:15:24', NULL, 0, '$', 0, 600, 1, 0, 0, 0, 0, 0, NULL),
(616, 68, 'March-2024', '2024-03-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-03-15 02:15:24', '2024-03-15 02:15:24', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(641, 67, 'March-2024', '2024-03-01', 'Zimra Income Tax', '90.25', 'Other Statutory Deduction', '2024-03-15 02:24:16', '2024-03-15 02:24:16', NULL, 0, '$', 0, 0, 0, 0, 501, 0, 0, 0, NULL),
(642, 67, 'March-2024', '2024-03-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-03-15 02:24:16', '2024-03-15 02:24:16', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(643, 67, 'March-2024', '2024-03-01', 'Zimra AIDS Levy', '2.7075', 'Other Statutory Deduction', '2024-03-15 02:24:16', '2024-03-15 02:24:16', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(644, 67, 'March-2024', '2024-03-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-03-15 02:24:16', '2024-03-15 02:24:16', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(645, 67, 'March-2024', '2024-03-01', 'NSSA Insurance (9%)', '45.9', 'Other Statutory Deduction', '2024-03-15 02:24:16', '2024-03-15 02:24:16', NULL, 0, '$', 0, 510, 1, 0, 0, 0, 0, 0, NULL),
(646, 67, 'March-2024', '2024-03-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-03-15 02:24:16', '2024-03-15 02:24:16', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(701, 64, 'April-2024', '2024-04-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-03-15 02:31:09', '2024-03-15 02:31:09', NULL, 0, '$', 0, 0, 0, 0, 100, 0, 0, 0, NULL),
(702, 64, 'April-2024', '2024-04-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-03-15 02:31:09', '2024-03-15 02:31:09', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(703, 64, 'April-2024', '2024-04-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-03-15 02:31:09', '2024-03-15 02:31:09', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(704, 64, 'April-2024', '2024-04-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-03-15 02:31:09', '2024-03-15 02:31:09', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(705, 64, 'April-2024', '2024-04-01', 'NSSA Insurance (9%)', '90', 'Other Statutory Deduction', '2024-03-15 02:31:09', '2024-03-15 02:31:09', NULL, 0, '$', 0, 1000, 1, 0, 0, 0, 0, 0, NULL),
(706, 64, 'April-2024', '2024-04-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-03-15 02:31:09', '2024-03-15 02:31:09', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(737, 65, 'May-2024', '2024-05-01', 'Zimra Income Tax', '-10', 'Other Statutory Deduction', '2024-03-15 02:35:11', '2024-03-15 02:35:11', NULL, 0, '$', 0, 0, 0, 0, 10, 0, 0, 0, NULL),
(738, 65, 'May-2024', '2024-05-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-03-15 02:35:11', '2024-03-15 02:35:11', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(739, 65, 'May-2024', '2024-05-01', 'Zimra AIDS Levy', '-0.3', 'Other Statutory Deduction', '2024-03-15 02:35:11', '2024-03-15 02:35:11', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(740, 65, 'May-2024', '2024-05-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-03-15 02:35:11', '2024-03-15 02:35:11', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(741, 65, 'May-2024', '2024-05-01', 'NSSA Insurance (9%)', '9', 'Other Statutory Deduction', '2024-03-15 02:35:11', '2024-03-15 02:35:11', NULL, 0, '$', 0, 100, 1, 0, 0, 0, 0, 0, NULL),
(742, 65, 'May-2024', '2024-05-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-03-15 02:35:11', '2024-03-15 02:35:11', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(779, 65, 'June-2024', '2024-06-01', 'Zimra Income Tax', '167.5', 'Other Statutory Deduction', '2024-03-15 02:37:10', '2024-03-15 02:37:10', NULL, 0, '$', 0, 0, 0, 0, 810, 0, 0, 0, NULL),
(780, 65, 'June-2024', '2024-06-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-03-15 02:37:10', '2024-03-15 02:37:10', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(781, 65, 'June-2024', '2024-06-01', 'Zimra AIDS Levy', '5.025', 'Other Statutory Deduction', '2024-03-15 02:37:10', '2024-03-15 02:37:10', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(782, 65, 'June-2024', '2024-06-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-03-15 02:37:10', '2024-03-15 02:37:10', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(783, 65, 'June-2024', '2024-06-01', 'NSSA Insurance (9%)', '81', 'Other Statutory Deduction', '2024-03-15 02:37:10', '2024-03-15 02:37:10', NULL, 0, '$', 0, 900, 1, 0, 0, 0, 0, 0, NULL),
(784, 65, 'June-2024', '2024-06-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-03-15 02:37:10', '2024-03-15 02:37:10', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(851, 67, 'May-2024', '2024-05-01', 'Zimra Income Tax', '90', 'Other Statutory Deduction', '2024-03-15 02:46:34', '2024-03-15 02:46:34', NULL, 0, '$', 0, 0, 0, 0, 500, 0, 0, 0, NULL),
(852, 67, 'May-2024', '2024-05-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-03-15 02:46:34', '2024-03-15 02:46:34', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(853, 67, 'May-2024', '2024-05-01', 'Zimra AIDS Levy', '2.7', 'Other Statutory Deduction', '2024-03-15 02:46:34', '2024-03-15 02:46:34', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(854, 67, 'May-2024', '2024-05-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-03-15 02:46:34', '2024-03-15 02:46:34', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(855, 67, 'May-2024', '2024-05-01', 'NSSA Insurance (9%)', '45', 'Other Statutory Deduction', '2024-03-15 02:46:34', '2024-03-15 02:46:34', NULL, 0, '$', 0, 500, 1, 0, 0, 0, 0, 0, NULL),
(856, 67, 'May-2024', '2024-05-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-03-15 02:46:34', '2024-03-15 02:46:34', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(923, 64, 'June-2024', '2024-06-01', 'Zimra Income Tax', '130', 'Other Statutory Deduction', '2024-03-15 02:59:21', '2024-03-15 02:59:21', NULL, 0, '$', 0, 0, 0, 0, 660, 0, 0, 0, NULL),
(924, 64, 'June-2024', '2024-06-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-03-15 02:59:21', '2024-03-15 02:59:21', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(925, 64, 'June-2024', '2024-06-01', 'Zimra AIDS Levy', '3.9', 'Other Statutory Deduction', '2024-03-15 02:59:21', '2024-03-15 02:59:21', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(926, 64, 'June-2024', '2024-06-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-03-15 02:59:21', '2024-03-15 02:59:21', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(927, 64, 'June-2024', '2024-06-01', 'NSSA Insurance (9%)', '140.4', 'Other Statutory Deduction', '2024-03-15 02:59:21', '2024-03-15 02:59:21', NULL, 0, '$', 0, 1560, 1, 0, 0, 0, 0, 0, NULL),
(928, 64, 'June-2024', '2024-06-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-03-15 02:59:21', '2024-03-15 02:59:21', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(1025, 67, 'June-2024', '2024-06-01', 'Zimra Income Tax', '90', 'Other Statutory Deduction', '2024-03-15 03:09:47', '2024-03-15 03:09:47', NULL, 0, '$', 0, 0, 0, 0, 500, 0, 0, 0, NULL),
(1026, 67, 'June-2024', '2024-06-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-03-15 03:09:47', '2024-03-15 03:09:47', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(1027, 67, 'June-2024', '2024-06-01', 'Zimra AIDS Levy', '2.7', 'Other Statutory Deduction', '2024-03-15 03:09:47', '2024-03-15 03:09:47', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(1028, 67, 'June-2024', '2024-06-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-03-15 03:09:47', '2024-03-15 03:09:47', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(1029, 67, 'June-2024', '2024-06-01', 'NSSA Insurance (9%)', '45', 'Other Statutory Deduction', '2024-03-15 03:09:47', '2024-03-15 03:09:47', NULL, 0, '$', 0, 500, 1, 0, 0, 0, 0, 0, NULL),
(1030, 67, 'June-2024', '2024-06-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-03-15 03:09:47', '2024-03-15 03:09:47', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(1037, 68, 'June-2024', '2024-06-01', 'Zimra Income Tax', '115', 'Other Statutory Deduction', '2024-03-15 03:09:55', '2024-03-15 03:09:55', NULL, 0, '$', 0, 0, 0, 0, 600, 0, 0, 0, NULL),
(1038, 68, 'June-2024', '2024-06-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-03-15 03:09:55', '2024-03-15 03:09:55', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(1039, 68, 'June-2024', '2024-06-01', 'Zimra AIDS Levy', '3.45', 'Other Statutory Deduction', '2024-03-15 03:09:55', '2024-03-15 03:09:55', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(1040, 68, 'June-2024', '2024-06-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-03-15 03:09:55', '2024-03-15 03:09:55', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `salary_deductions` (`id`, `employee_id`, `month_year`, `first_date`, `deduction_title`, `deduction_amount`, `deduction_type`, `created_at`, `updated_at`, `currency_id`, `is_taxable`, `currency_symbol`, `deductible_amt`, `insuarable_amount`, `is_nssa_insuarance`, `is_nssa_contribution`, `zimra_payable_amount`, `is_zimra_income`, `is_zimra_aids`, `is_recurring`, `deduction_id`) VALUES
(1041, 68, 'June-2024', '2024-06-01', 'NSSA Insurance (9%)', '54', 'Other Statutory Deduction', '2024-03-15 03:09:55', '2024-03-15 03:09:55', NULL, 0, '$', 0, 600, 1, 0, 0, 0, 0, 0, NULL),
(1042, 68, 'June-2024', '2024-06-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-03-15 03:09:55', '2024-03-15 03:09:55', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(1103, 65, 'July-2024', '2024-07-01', 'Zimra Income Tax', '-10', 'Other Statutory Deduction', '2024-03-15 03:15:35', '2024-03-15 03:15:35', NULL, 0, '$', 0, 0, 0, 0, 10, 0, 0, 0, NULL),
(1104, 65, 'July-2024', '2024-07-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-03-15 03:15:35', '2024-03-15 03:15:35', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(1105, 65, 'July-2024', '2024-07-01', 'Zimra AIDS Levy', '-0.3', 'Other Statutory Deduction', '2024-03-15 03:15:35', '2024-03-15 03:15:35', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(1106, 65, 'July-2024', '2024-07-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-03-15 03:15:35', '2024-03-15 03:15:35', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(1107, 65, 'July-2024', '2024-07-01', 'NSSA Insurance (9%)', '9', 'Other Statutory Deduction', '2024-03-15 03:15:35', '2024-03-15 03:15:35', NULL, 0, '$', 0, 100, 1, 0, 0, 0, 0, 0, NULL),
(1108, 65, 'July-2024', '2024-07-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-03-15 03:15:35', '2024-03-15 03:15:35', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(1139, 67, 'July-2024', '2024-07-01', 'Zimra Income Tax', '90', 'Other Statutory Deduction', '2024-03-15 03:18:12', '2024-03-15 03:18:12', NULL, 0, '$', 0, 0, 0, 0, 500, 0, 0, 0, NULL),
(1140, 67, 'July-2024', '2024-07-01', 'Zimra Income Tax', '0', 'Other Statutory Deduction', '2024-03-15 03:18:12', '2024-03-15 03:18:12', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(1141, 67, 'July-2024', '2024-07-01', 'Zimra AIDS Levy', '2.7', 'Other Statutory Deduction', '2024-03-15 03:18:12', '2024-03-15 03:18:12', NULL, 0, '$', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(1142, 67, 'July-2024', '2024-07-01', 'Zimra AIDS Levy', '0', 'Other Statutory Deduction', '2024-03-15 03:18:12', '2024-03-15 03:18:12', NULL, 0, 'ZWL', 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(1143, 67, 'July-2024', '2024-07-01', 'NSSA Insurance (9%)', '45', 'Other Statutory Deduction', '2024-03-15 03:18:12', '2024-03-15 03:18:12', NULL, 0, '$', 0, 500, 1, 0, 0, 0, 0, 0, NULL),
(1144, 67, 'July-2024', '2024-07-01', 'NSSA Insurance (9%)', '0', 'Other Statutory Deduction', '2024-03-15 03:18:12', '2024-03-15 03:18:12', NULL, 0, 'ZWL', 0, 0, 1, 0, 0, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `salary_loans`
--

CREATE TABLE `salary_loans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `month_year` varchar(50) NOT NULL,
  `first_date` date DEFAULT NULL,
  `loan_title` varchar(191) NOT NULL,
  `loan_amount` varchar(191) NOT NULL,
  `loan_type` varchar(191) NOT NULL,
  `loan_time` varchar(191) NOT NULL,
  `amount_remaining` varchar(191) NOT NULL,
  `time_remaining` varchar(191) NOT NULL,
  `monthly_payable` varchar(50) NOT NULL,
  `reason` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_other_payments`
--

CREATE TABLE `salary_other_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `month_year` varchar(50) NOT NULL DEFAULT '',
  `first_date` date DEFAULT NULL,
  `other_payment_title` varchar(191) NOT NULL,
  `other_payment_amount` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_overtimes`
--

CREATE TABLE `salary_overtimes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `month_year` varchar(50) NOT NULL,
  `first_date` date DEFAULT NULL,
  `overtime_title` varchar(191) NOT NULL,
  `no_of_days` varchar(191) NOT NULL,
  `overtime_hours` varchar(191) NOT NULL,
  `overtime_rate` varchar(191) NOT NULL,
  `overtime_amount` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_tax_credits`
--

CREATE TABLE `salary_tax_credits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `month_year` varchar(50) NOT NULL,
  `first_date` date DEFAULT NULL,
  `deduction_title` varchar(191) NOT NULL,
  `deduction_amount` varchar(191) NOT NULL,
  `deduction_type` varchar(191) NOT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_symbol` varchar(255) NOT NULL DEFAULT '$',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salary_tax_credits`
--

INSERT INTO `salary_tax_credits` (`id`, `employee_id`, `month_year`, `first_date`, `deduction_title`, `deduction_amount`, `deduction_type`, `currency_id`, `currency_symbol`, `created_at`, `updated_at`) VALUES
(1, 66, 'May-2025', '2025-05-01', 'New', '10', '', 2, 'ZWL', '2024-02-15 13:50:02', '2024-02-16 06:14:06'),
(2, 66, 'October-2024', '2024-10-01', 'eee', '20', '', 2, 'ZWL', '2024-02-15 13:50:42', '2024-02-16 06:13:56'),
(4, 65, 'February-2024', '2024-02-01', 'Medical IAD', '10', '', 1, '$', '2024-02-16 08:24:49', '2024-02-16 08:24:49');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status_title` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ticket_code` varchar(15) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `ticket_priority` varchar(40) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `ticket_remarks` mediumtext DEFAULT NULL,
  `ticket_status` varchar(40) NOT NULL,
  `ticket_note` varchar(191) DEFAULT NULL,
  `is_notify` tinyint(4) DEFAULT NULL,
  `ticket_attachment` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_name` varchar(191) NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `task_hour` varchar(40) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `task_status` varchar(40) NOT NULL DEFAULT 'not started',
  `task_note` mediumtext DEFAULT NULL,
  `task_progress` varchar(191) DEFAULT NULL,
  `is_notify` tinyint(4) DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_discussions`
--

CREATE TABLE `task_discussions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `task_discussion` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_files`
--

CREATE TABLE `task_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `file_title` varchar(191) NOT NULL,
  `file_attachment` varchar(191) NOT NULL,
  `file_description` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_types`
--

CREATE TABLE `tax_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `rate` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `terminations`
--

CREATE TABLE `terminations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `terminated_employee` bigint(20) UNSIGNED NOT NULL,
  `termination_type` bigint(20) UNSIGNED DEFAULT NULL,
  `termination_date` date NOT NULL,
  `notice_date` date NOT NULL,
  `status` varchar(40) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `termination_types`
--

CREATE TABLE `termination_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `termination_title` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_comments`
--

CREATE TABLE `ticket_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ticket_comments` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trainers`
--

CREATE TABLE `trainers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address` mediumtext DEFAULT NULL,
  `expertise` mediumtext NOT NULL,
  `status` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `training_lists`
--

CREATE TABLE `training_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `training_cost` varchar(191) NOT NULL,
  `status` varchar(30) NOT NULL,
  `remarks` mediumtext DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `trainer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `training_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `training_types`
--

CREATE TABLE `training_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `from_department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `to_department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transfer_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL,
  `group` varchar(191) DEFAULT NULL,
  `key` text NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `travels`
--

CREATE TABLE `travels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `travel_type` bigint(20) UNSIGNED DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `purpose_of_visit` varchar(191) DEFAULT NULL,
  `place_of_visit` varchar(191) DEFAULT NULL,
  `expected_budget` varchar(20) DEFAULT NULL,
  `actual_budget` varchar(20) DEFAULT NULL,
  `travel_mode` varchar(20) NOT NULL,
  `status` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `travel_types`
--

CREATE TABLE `travel_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `arrangement_type` varchar(191) NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usd_tax_tables`
--

CREATE TABLE `usd_tax_tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `table_type` varchar(255) NOT NULL,
  `lower_range` double NOT NULL,
  `upper_range` double NOT NULL,
  `multiply_by` double NOT NULL,
  `deduct` double NOT NULL,
  `calculation_info` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_above` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usd_tax_tables`
--

INSERT INTO `usd_tax_tables` (`id`, `table_type`, `lower_range`, `upper_range`, `multiply_by`, `deduct`, `calculation_info`, `is_active`, `is_above`, `created_at`, `updated_at`) VALUES
(2, 'monthly', 0, 100, 0, 0, '', 1, 0, '2024-02-10 15:11:02', '2024-02-10 15:11:02'),
(3, 'monthly', 100.01, 300, 20, 20, '', 1, 0, '2024-02-10 15:11:35', '2024-02-10 15:11:35'),
(4, 'monthly', 300.01, 1000, 25, 35, '', 1, 0, '2024-02-10 15:12:44', '2024-02-10 15:12:44'),
(5, 'monthly', 1000.01, 2000, 30, 85, '', 1, 0, '2024-02-10 15:13:17', '2024-02-10 15:13:17'),
(6, 'monthly', 2000.01, 3000, 35, 185, '', 1, 0, '2024-02-10 15:13:40', '2024-02-10 15:13:40'),
(7, 'monthly', 3000.01, -1, 40, 335, '', 1, 0, '2024-02-10 15:14:27', '2024-02-10 15:14:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `username` varchar(64) NOT NULL,
  `email` varchar(64) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `profile_photo` varchar(191) DEFAULT NULL,
  `profile_bg` varchar(191) DEFAULT NULL,
  `role_users_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `contact_no` varchar(15) NOT NULL,
  `last_login_ip` varchar(32) DEFAULT NULL,
  `last_login_date` timestamp(2) NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `email_verified_at`, `password`, `profile_photo`, `profile_bg`, `role_users_id`, `is_active`, `contact_no`, `last_login_ip`, `last_login_date`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Irfan', 'Chowdhury', 'admin', 'admin@gmail.com', NULL, '$2y$10$WcnC16AXG/mNrVBWQGjfoegFO.1wjiIiBv5LxEHR6uQaJYVciYCOa', 'admin_1639557363.jpg', NULL, 1, 1, '1234', '::1', '2024-02-17 13:34:48.00', 'tw9yF5q4ZvuGxdlcCZPvj6sGJ5JqgSzDEp2OLmqsp651pqEwulWo2xPHvP86', NULL, '2023-07-22 08:58:11', NULL),
(16, 'Shadat', 'Ashraf', 'client', 'shahadatashraf10@gmail.com', NULL, '$2y$10$Cf7ZWz1sJJhWu1C30vOJDO7Y9BQ5f.8Wi2NYV9ITs9f0q9zLY3EbW', 'client_1623747532.png', NULL, 3, 1, '67651', '127.0.0.1', '2023-07-21 17:38:12.00', NULL, '2020-07-28 14:41:31', '2022-10-02 09:21:02', NULL),
(39, 'Kaden', 'Porter', 'kaden95', 'kaden@mailinator.com', NULL, '$2y$10$v0ppHd14bDVJKi1.Lgm5qes2H9XkkQEl5Lmdw/lRk.zNtKzYTZ4we', 'kaden95_1623747054.jpg', NULL, 3, 1, '441234874', '127.0.0.1', '2021-03-30 01:45:13.00', NULL, '2021-03-30 01:42:31', '2021-06-15 05:50:54', NULL),
(52, 'Alyssa', 'Schwartz', 'test123', 'dacuzej@mailinator.com', NULL, '$2y$10$RfHfGxADH7F5wxIO5bLBBuP5YVSDOMDhC7RboEbo9.3VIDzqTTes2', NULL, NULL, 3, 1, '43222232123', NULL, NULL, NULL, '2022-12-18 07:10:18', '2022-12-18 07:10:18', NULL),
(53, 'Ingrid', 'Craft', 'test987', 'foziwafub@mailinator.com', NULL, '$2y$10$gZP0hd4GW/ip.N120sgxDuTyID6DqbXXhYKwH3N81jj/os3tmOCjS', NULL, NULL, 3, 1, '26', NULL, NULL, NULL, '2022-12-18 07:45:03', '2022-12-18 07:45:03', NULL),
(64, 'Eliphas', 'Masuka', 'steven', 'masukawebs@gmail.com', NULL, '$2y$10$G7oC8uVARt5wprWY9ozHgOk54rQZwqaQkO4UFJCfGMjwiF3BmV2ci', NULL, NULL, 1, 1, '787687032', '::1', '2024-02-17 05:08:30.00', NULL, '2024-02-13 11:17:46', '2024-02-13 11:17:46', NULL),
(65, 'Sarah', 'Williams', 'sarah', 'sarahw@gmail.com', NULL, '$2y$10$rXlOsY.D8cIAU1sek5QEv.QnZoI4QtYPmpASbvbWXZ792QcbuVZrm', NULL, NULL, 2, 1, '7876870321', NULL, NULL, NULL, '2024-02-13 11:19:15', '2024-02-13 11:19:15', NULL),
(66, 'Tino', 'Try', 'tino', 'tinodaishe@payow.co.zw', NULL, '$2y$10$tmOwSETS3JVLXIUE0NI66O5IQc5p3HEve.kFVgWgdPtIkj8tZ8kby', NULL, NULL, 1, 1, '787687033', NULL, NULL, NULL, '2024-02-13 11:22:36', '2024-02-13 11:22:36', NULL),
(67, 'Tino', 'Masuka', 'tino_masuka', 'masukawebs+2@gmail.com', NULL, '$2y$10$ZF5cC90RGvsl0rpxrQXZHOU1PPsPbGktggsPxydTBuv7QGdf5kStu', NULL, NULL, 2, 1, '07876870399', '::1', '2024-02-17 05:12:46.00', NULL, '2024-02-17 05:11:35', '2024-02-17 05:11:35', NULL),
(68, 'Benito', 'Mhike', 'benito', 'masuka120@gmail.com', NULL, '$2y$10$xdP9FH84aBKqP1Fr4IPXjeNQZl.7cQWG3yVrnTF3M5X7.OrzpJfxW', NULL, NULL, 2, 1, '0787687066', NULL, NULL, NULL, '2024-02-17 15:41:49', '2024-02-17 15:41:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `warnings`
--

CREATE TABLE `warnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `warning_to` bigint(20) UNSIGNED NOT NULL,
  `warning_type` bigint(20) UNSIGNED DEFAULT NULL,
  `warning_date` date NOT NULL,
  `status` varchar(40) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warnings_type`
--

CREATE TABLE `warnings_type` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warning_title` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zimdef_tables`
--

CREATE TABLE `zimdef_tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `deduction` double NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zwl_tax_tables`
--

CREATE TABLE `zwl_tax_tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `table_type` varchar(255) NOT NULL,
  `lower_range` double NOT NULL,
  `upper_range` double NOT NULL,
  `multiply_by` double NOT NULL,
  `deduct` double NOT NULL,
  `calculation_info` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_above` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zwl_tax_tables`
--

INSERT INTO `zwl_tax_tables` (`id`, `table_type`, `lower_range`, `upper_range`, `multiply_by`, `deduct`, `calculation_info`, `is_active`, `is_above`, `created_at`, `updated_at`) VALUES
(1, 'monthly', 0, 344299.92, 0, 0, '', 1, 0, '2024-02-10 15:15:15', '2024-02-10 15:15:15'),
(2, 'monthly', 344299.93, 1032899.77, 20, 68859.98, '', 1, 0, '2024-02-10 15:15:48', '2024-02-10 15:15:48'),
(3, 'monthly', 1032899.78, 3442999.23, 25, 120504.97, '', 1, 0, '2024-02-10 15:16:18', '2024-02-10 15:16:18'),
(4, 'monthly', 3442999.24, 6885998.47, 30, 292654.93, '', 1, 0, '2024-02-10 15:16:44', '2024-02-10 15:16:44'),
(5, 'monthly', 6885998.48, 10328997.7, 35, 636954.86, '', 1, 0, '2024-02-10 15:17:12', '2024-02-10 15:17:12'),
(6, 'monthly', 10328997.71, -1, 40, 1153404.74, '', 1, 0, '2024-02-10 15:17:37', '2024-02-10 15:17:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allowances`
--
ALTER TABLE `allowances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcements_company_id_foreign` (`company_id`),
  ADD KEY `announcements_department_id_foreign` (`department_id`);

--
-- Indexes for table `appraisals`
--
ALTER TABLE `appraisals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appraisals_company_id_foreign` (`company_id`),
  ADD KEY `appraisals_employee_id_foreign` (`employee_id`),
  ADD KEY `appraisals_department_id_foreign` (`department_id`),
  ADD KEY `appraisals_designation_id_foreign` (`designation_id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_company_id_foreign` (`company_id`),
  ADD KEY `assets_employee_id_foreign` (`employee_id`),
  ADD KEY `assets_assets_category_id_foreign` (`assets_category_id`);

--
-- Indexes for table `asset_categories`
--
ALTER TABLE `asset_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asset_categories_company_id_foreign` (`company_id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `awards_company_id_foreign` (`company_id`),
  ADD KEY `awards_department_id_foreign` (`department_id`),
  ADD KEY `awards_employee_id_foreign` (`employee_id`),
  ADD KEY `awards_award_type_id_foreign` (`award_type_id`);

--
-- Indexes for table `award_types`
--
ALTER TABLE `award_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calendarables`
--
ALTER TABLE `calendarables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `candidate_interview`
--
ALTER TABLE `candidate_interview`
  ADD PRIMARY KEY (`interview_id`,`candidate_id`),
  ADD KEY `candidate_interview_candidate_id_foreign` (`candidate_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_location_id_foreign` (`location_id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complaints_company_id_foreign` (`company_id`),
  ADD KEY `complaints_complaint_from_foreign` (`complaint_from`),
  ADD KEY `complaints_complaint_against_foreign` (`complaint_against`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency_rates`
--
ALTER TABLE `currency_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `c_m_s`
--
ALTER TABLE `c_m_s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departments_company_id_foreign` (`company_id`),
  ADD KEY `departments_department_head_foreign` (`department_head`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designations_company_id_foreign` (`company_id`),
  ADD KEY `designations_department_id_foreign` (`department_id`);

--
-- Indexes for table `document_types`
--
ALTER TABLE `document_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_office_shift_id_foreign` (`office_shift_id`),
  ADD KEY `employees_company_id_foreign` (`company_id`),
  ADD KEY `employees_department_id_foreign` (`department_id`),
  ADD KEY `employees_designation_id_foreign` (`designation_id`),
  ADD KEY `employees_location_id_foreign` (`location_id`),
  ADD KEY `employees_role_users_id_foreign` (`role_users_id`),
  ADD KEY `employees_status_id_foreign` (`status_id`);

--
-- Indexes for table `employee_bank_accounts`
--
ALTER TABLE `employee_bank_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_bank_accounts_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `employee_contacts`
--
ALTER TABLE `employee_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_contacts_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `employee_documents`
--
ALTER TABLE `employee_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_documents_employee_id_foreign` (`employee_id`),
  ADD KEY `employee_documents_document_type_id_foreign` (`document_type_id`);

--
-- Indexes for table `employee_immigrations`
--
ALTER TABLE `employee_immigrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_immigrations_employee_id_foreign` (`employee_id`),
  ADD KEY `employee_immigrations_document_type_id_foreign` (`document_type_id`);

--
-- Indexes for table `employee_interview`
--
ALTER TABLE `employee_interview`
  ADD PRIMARY KEY (`interview_id`,`employee_id`),
  ADD KEY `employee_interview_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `employee_leave_type_details`
--
ALTER TABLE `employee_leave_type_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_leave_type_details_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `employee_meeting`
--
ALTER TABLE `employee_meeting`
  ADD PRIMARY KEY (`employee_id`,`meeting_id`),
  ADD KEY `employee_meeting_meeting_id_foreign` (`meeting_id`);

--
-- Indexes for table `employee_project`
--
ALTER TABLE `employee_project`
  ADD PRIMARY KEY (`employee_id`,`project_id`),
  ADD KEY `employee_project_project_id_foreign` (`project_id`);

--
-- Indexes for table `employee_qualificaitons`
--
ALTER TABLE `employee_qualificaitons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_qualificaitons_employee_id_foreign` (`employee_id`),
  ADD KEY `employee_qualificaitons_education_level_id_foreign` (`education_level_id`),
  ADD KEY `employee_qualificaitons_language_skill_id_foreign` (`language_skill_id`),
  ADD KEY `employee_qualificaitons_general_skill_id_foreign` (`general_skill_id`);

--
-- Indexes for table `employee_support_ticket`
--
ALTER TABLE `employee_support_ticket`
  ADD PRIMARY KEY (`employee_id`,`support_ticket_id`),
  ADD KEY `employee_support_ticket_support_ticket_id_foreign` (`support_ticket_id`);

--
-- Indexes for table `employee_task`
--
ALTER TABLE `employee_task`
  ADD PRIMARY KEY (`employee_id`,`task_id`),
  ADD KEY `employee_task_task_id_foreign` (`task_id`);

--
-- Indexes for table `employee_training_list`
--
ALTER TABLE `employee_training_list`
  ADD PRIMARY KEY (`employee_id`,`training_list_id`),
  ADD KEY `employee_training_list_training_list_id_foreign` (`training_list_id`);

--
-- Indexes for table `employee_work_experience`
--
ALTER TABLE `employee_work_experience`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_work_experience_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `employer_nssa_tax_tables`
--
ALTER TABLE `employer_nssa_tax_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employer_zwl_nssa_tax_tables`
--
ALTER TABLE `employer_zwl_nssa_tax_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_company_id_foreign` (`company_id`),
  ADD KEY `events_department_id_foreign` (`department_id`);

--
-- Indexes for table `expense_types`
--
ALTER TABLE `expense_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_types_company_id_foreign` (`company_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file_managers`
--
ALTER TABLE `file_managers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file_managers_department_id_foreign` (`department_id`),
  ADD KEY `file_managers_added_by_foreign` (`added_by`);

--
-- Indexes for table `file_manager_settings`
--
ALTER TABLE `file_manager_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_bank_cashes`
--
ALTER TABLE `finance_bank_cashes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_deposits`
--
ALTER TABLE `finance_deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finance_deposits_company_id_foreign` (`company_id`),
  ADD KEY `finance_deposits_account_id_foreign` (`account_id`),
  ADD KEY `finance_deposits_payment_method_id_foreign` (`payment_method_id`),
  ADD KEY `finance_deposits_payer_id_foreign` (`payer_id`);

--
-- Indexes for table `finance_expenses`
--
ALTER TABLE `finance_expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finance_expenses_company_id_foreign` (`company_id`),
  ADD KEY `finance_expenses_account_id_foreign` (`account_id`),
  ADD KEY `finance_expenses_payment_method_id_foreign` (`payment_method_id`),
  ADD KEY `finance_expenses_payee_id_foreign` (`payee_id`),
  ADD KEY `finance_expenses_category_id_foreign` (`category_id`);

--
-- Indexes for table `finance_payees`
--
ALTER TABLE `finance_payees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_payers`
--
ALTER TABLE `finance_payers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_transactions`
--
ALTER TABLE `finance_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finance_transactions_company_id_foreign` (`company_id`),
  ADD KEY `finance_transactions_account_id_foreign` (`account_id`),
  ADD KEY `finance_transactions_payment_method_id_foreign` (`payment_method_id`),
  ADD KEY `finance_transactions_payee_id_foreign` (`payee_id`),
  ADD KEY `finance_transactions_payer_id_foreign` (`payer_id`),
  ADD KEY `finance_transactions_category_id_foreign` (`category_id`);

--
-- Indexes for table `finance_transfers`
--
ALTER TABLE `finance_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finance_transfers_company_id_foreign` (`company_id`),
  ADD KEY `finance_transfers_from_account_id_foreign` (`from_account_id`),
  ADD KEY `finance_transfers_to_account_id_foreign` (`to_account_id`),
  ADD KEY `finance_transfers_payment_method_id_foreign` (`payment_method_id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goal_trackings`
--
ALTER TABLE `goal_trackings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goal_trackings_company_id_foreign` (`company_id`),
  ADD KEY `goal_trackings_goal_type_id_foreign` (`goal_type_id`);

--
-- Indexes for table `goal_types`
--
ALTER TABLE `goal_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `holidays_company_id_foreign` (`company_id`),
  ADD KEY `holidays_department_id_foreign` (`department_id`);

--
-- Indexes for table `indicators`
--
ALTER TABLE `indicators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indicators_company_id_foreign` (`company_id`),
  ADD KEY `indicators_department_id_foreign` (`department_id`),
  ADD KEY `indicators_designation_id_foreign` (`designation_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_client_id_foreign` (`client_id`),
  ADD KEY `invoices_project_id_foreign` (`project_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_items_project_id_foreign` (`project_id`);

--
-- Indexes for table `ip_settings`
--
ALTER TABLE `ip_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_candidates`
--
ALTER TABLE `job_candidates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_candidates_job_id_foreign` (`job_id`);

--
-- Indexes for table `job_categories`
--
ALTER TABLE `job_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_interviews`
--
ALTER TABLE `job_interviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_interviews_job_id_foreign` (`job_id`),
  ADD KEY `job_interviews_added_by_foreign` (`added_by`);

--
-- Indexes for table `job_posts`
--
ALTER TABLE `job_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_posts_job_category_id_foreign` (`job_category_id`),
  ADD KEY `job_posts_company_id_foreign` (`company_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leaves_company_id_foreign` (`company_id`),
  ADD KEY `leaves_employee_id_foreign` (`employee_id`),
  ADD KEY `leaves_leave_type_id_foreign` (`leave_type_id`),
  ADD KEY `leaves_department_id_foreign` (`department_id`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_types_company_id_foreign` (`company_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locations_location_head_foreign` (`location_head`),
  ADD KEY `locations_country_foreign` (`country`);

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meetings_company_id_foreign` (`company_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `nssa_tables`
--
ALTER TABLE `nssa_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `office_shifts`
--
ALTER TABLE `office_shifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `office_shifts_company_id_foreign` (`company_id`);

--
-- Indexes for table `official_documents`
--
ALTER TABLE `official_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `official_documents_company_id_foreign` (`company_id`),
  ADD KEY `official_documents_document_type_id_foreign` (`document_type_id`),
  ADD KEY `official_documents_added_by_foreign` (`added_by`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_methods_company_id_foreign` (`company_id`);

--
-- Indexes for table `payslips`
--
ALTER TABLE `payslips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payslips_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `policies_company_id_foreign` (`company_id`),
  ADD KEY `policies_added_by_foreign` (`added_by`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_client_id_foreign` (`client_id`),
  ADD KEY `projects_company_id_foreign` (`company_id`),
  ADD KEY `projects_added_by_foreign` (`added_by`);

--
-- Indexes for table `project_bugs`
--
ALTER TABLE `project_bugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_bugs_user_id_foreign` (`user_id`),
  ADD KEY `project_bugs_project_id_foreign` (`project_id`);

--
-- Indexes for table `project_discussions`
--
ALTER TABLE `project_discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_discussions_user_id_foreign` (`user_id`),
  ADD KEY `project_discussions_project_id_foreign` (`project_id`);

--
-- Indexes for table `project_files`
--
ALTER TABLE `project_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_files_user_id_foreign` (`user_id`),
  ADD KEY `project_files_project_id_foreign` (`project_id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promotions_company_id_foreign` (`company_id`),
  ADD KEY `promotions_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `qualification_education_levels`
--
ALTER TABLE `qualification_education_levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `qualification_education_levels_company_id_foreign` (`company_id`);

--
-- Indexes for table `qualification_languages`
--
ALTER TABLE `qualification_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `qualification_languages_company_id_foreign` (`company_id`);

--
-- Indexes for table `qualification_skills`
--
ALTER TABLE `qualification_skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `qualification_skills_company_id_foreign` (`company_id`);

--
-- Indexes for table `resignations`
--
ALTER TABLE `resignations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resignations_company_id_foreign` (`company_id`),
  ADD KEY `resignations_department_id_foreign` (`department_id`),
  ADD KEY `resignations_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `salary_allowances`
--
ALTER TABLE `salary_allowances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_allowances_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `salary_basics`
--
ALTER TABLE `salary_basics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_basics_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `salary_commissions`
--
ALTER TABLE `salary_commissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_commissions_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `salary_deductions`
--
ALTER TABLE `salary_deductions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_deductions_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `salary_loans`
--
ALTER TABLE `salary_loans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_loans_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `salary_other_payments`
--
ALTER TABLE `salary_other_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_other_payments_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `salary_overtimes`
--
ALTER TABLE `salary_overtimes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_overtimes_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `salary_tax_credits`
--
ALTER TABLE `salary_tax_credits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_tax_credits_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `support_tickets_ticket_code_unique` (`ticket_code`),
  ADD KEY `support_tickets_company_id_foreign` (`company_id`),
  ADD KEY `support_tickets_department_id_foreign` (`department_id`),
  ADD KEY `support_tickets_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_project_id_foreign` (`project_id`),
  ADD KEY `tasks_company_id_foreign` (`company_id`),
  ADD KEY `tasks_added_by_foreign` (`added_by`);

--
-- Indexes for table `task_discussions`
--
ALTER TABLE `task_discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_discussions_user_id_foreign` (`user_id`),
  ADD KEY `task_discussions_task_id_foreign` (`task_id`);

--
-- Indexes for table `task_files`
--
ALTER TABLE `task_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_files_user_id_foreign` (`user_id`),
  ADD KEY `task_files_task_id_foreign` (`task_id`);

--
-- Indexes for table `tax_types`
--
ALTER TABLE `tax_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terminations`
--
ALTER TABLE `terminations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `terminations_company_id_foreign` (`company_id`),
  ADD KEY `terminations_terminated_employee_foreign` (`terminated_employee`),
  ADD KEY `terminations_termination_type_foreign` (`termination_type`);

--
-- Indexes for table `termination_types`
--
ALTER TABLE `termination_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_comments_ticket_id_foreign` (`ticket_id`),
  ADD KEY `ticket_comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `trainers`
--
ALTER TABLE `trainers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trainers_company_id_foreign` (`company_id`);

--
-- Indexes for table `training_lists`
--
ALTER TABLE `training_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `training_lists_company_id_foreign` (`company_id`),
  ADD KEY `training_lists_trainer_id_foreign` (`trainer_id`),
  ADD KEY `training_lists_training_type_id_foreign` (`training_type_id`);

--
-- Indexes for table `training_types`
--
ALTER TABLE `training_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfers_company_id_foreign` (`company_id`),
  ADD KEY `transfers_from_department_id_foreign` (`from_department_id`),
  ADD KEY `transfers_to_department_id_foreign` (`to_department_id`),
  ADD KEY `transfers_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_language_id_foreign` (`language_id`);

--
-- Indexes for table `travels`
--
ALTER TABLE `travels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `travels_company_id_foreign` (`company_id`),
  ADD KEY `travels_employee_id_foreign` (`employee_id`),
  ADD KEY `travels_travel_type_foreign` (`travel_type`);

--
-- Indexes for table `travel_types`
--
ALTER TABLE `travel_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `travel_types_company_id_foreign` (`company_id`);

--
-- Indexes for table `usd_tax_tables`
--
ALTER TABLE `usd_tax_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_role_users_id_foreign` (`role_users_id`);

--
-- Indexes for table `warnings`
--
ALTER TABLE `warnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warnings_company_id_foreign` (`company_id`),
  ADD KEY `warnings_warning_to_foreign` (`warning_to`),
  ADD KEY `warnings_warning_type_foreign` (`warning_type`);

--
-- Indexes for table `warnings_type`
--
ALTER TABLE `warnings_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zimdef_tables`
--
ALTER TABLE `zimdef_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zwl_tax_tables`
--
ALTER TABLE `zwl_tax_tables`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allowances`
--
ALTER TABLE `allowances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appraisals`
--
ALTER TABLE `appraisals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asset_categories`
--
ALTER TABLE `asset_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `award_types`
--
ALTER TABLE `award_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `calendarables`
--
ALTER TABLE `calendarables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `currency_rates`
--
ALTER TABLE `currency_rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `c_m_s`
--
ALTER TABLE `c_m_s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deductions`
--
ALTER TABLE `deductions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `document_types`
--
ALTER TABLE `document_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `employee_bank_accounts`
--
ALTER TABLE `employee_bank_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_contacts`
--
ALTER TABLE `employee_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_documents`
--
ALTER TABLE `employee_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_immigrations`
--
ALTER TABLE `employee_immigrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_leave_type_details`
--
ALTER TABLE `employee_leave_type_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employee_qualificaitons`
--
ALTER TABLE `employee_qualificaitons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_work_experience`
--
ALTER TABLE `employee_work_experience`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employer_nssa_tax_tables`
--
ALTER TABLE `employer_nssa_tax_tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employer_zwl_nssa_tax_tables`
--
ALTER TABLE `employer_zwl_nssa_tax_tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_types`
--
ALTER TABLE `expense_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_managers`
--
ALTER TABLE `file_managers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_manager_settings`
--
ALTER TABLE `file_manager_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_bank_cashes`
--
ALTER TABLE `finance_bank_cashes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `finance_deposits`
--
ALTER TABLE `finance_deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_expenses`
--
ALTER TABLE `finance_expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `finance_payees`
--
ALTER TABLE `finance_payees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_payers`
--
ALTER TABLE `finance_payers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_transactions`
--
ALTER TABLE `finance_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `finance_transfers`
--
ALTER TABLE `finance_transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `goal_trackings`
--
ALTER TABLE `goal_trackings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `goal_types`
--
ALTER TABLE `goal_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `indicators`
--
ALTER TABLE `indicators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ip_settings`
--
ALTER TABLE `ip_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_candidates`
--
ALTER TABLE `job_candidates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_categories`
--
ALTER TABLE `job_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_interviews`
--
ALTER TABLE `job_interviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_posts`
--
ALTER TABLE `job_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `meetings`
--
ALTER TABLE `meetings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;

--
-- AUTO_INCREMENT for table `nssa_tables`
--
ALTER TABLE `nssa_tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `office_shifts`
--
ALTER TABLE `office_shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `official_documents`
--
ALTER TABLE `official_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payslips`
--
ALTER TABLE `payslips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=298;

--
-- AUTO_INCREMENT for table `policies`
--
ALTER TABLE `policies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_bugs`
--
ALTER TABLE `project_bugs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_discussions`
--
ALTER TABLE `project_discussions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_files`
--
ALTER TABLE `project_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qualification_education_levels`
--
ALTER TABLE `qualification_education_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qualification_languages`
--
ALTER TABLE `qualification_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qualification_skills`
--
ALTER TABLE `qualification_skills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resignations`
--
ALTER TABLE `resignations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `salary_allowances`
--
ALTER TABLE `salary_allowances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `salary_basics`
--
ALTER TABLE `salary_basics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `salary_commissions`
--
ALTER TABLE `salary_commissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_deductions`
--
ALTER TABLE `salary_deductions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1157;

--
-- AUTO_INCREMENT for table `salary_loans`
--
ALTER TABLE `salary_loans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_other_payments`
--
ALTER TABLE `salary_other_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_overtimes`
--
ALTER TABLE `salary_overtimes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_tax_credits`
--
ALTER TABLE `salary_tax_credits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_discussions`
--
ALTER TABLE `task_discussions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_files`
--
ALTER TABLE `task_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_types`
--
ALTER TABLE `tax_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `terminations`
--
ALTER TABLE `terminations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `termination_types`
--
ALTER TABLE `termination_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trainers`
--
ALTER TABLE `trainers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `training_lists`
--
ALTER TABLE `training_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `training_types`
--
ALTER TABLE `training_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `travels`
--
ALTER TABLE `travels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `travel_types`
--
ALTER TABLE `travel_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usd_tax_tables`
--
ALTER TABLE `usd_tax_tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `warnings`
--
ALTER TABLE `warnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warnings_type`
--
ALTER TABLE `warnings_type`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zimdef_tables`
--
ALTER TABLE `zimdef_tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zwl_tax_tables`
--
ALTER TABLE `zwl_tax_tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `announcements_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `appraisals`
--
ALTER TABLE `appraisals`
  ADD CONSTRAINT `appraisals_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appraisals_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appraisals_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appraisals_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `assets_assets_category_id_foreign` FOREIGN KEY (`assets_category_id`) REFERENCES `asset_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `asset_categories`
--
ALTER TABLE `asset_categories`
  ADD CONSTRAINT `asset_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `awards`
--
ALTER TABLE `awards`
  ADD CONSTRAINT `awards_award_type_id_foreign` FOREIGN KEY (`award_type_id`) REFERENCES `award_types` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `awards_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `awards_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `awards_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `candidate_interview`
--
ALTER TABLE `candidate_interview`
  ADD CONSTRAINT `candidate_interview_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `job_candidates` (`id`),
  ADD CONSTRAINT `candidate_interview_interview_id_foreign` FOREIGN KEY (`interview_id`) REFERENCES `job_interviews` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_id_foreign` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `complaints_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `complaints_complaint_against_foreign` FOREIGN KEY (`complaint_against`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `complaints_complaint_from_foreign` FOREIGN KEY (`complaint_from`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `departments_department_head_foreign` FOREIGN KEY (`department_head`) REFERENCES `employees` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `designations`
--
ALTER TABLE `designations`
  ADD CONSTRAINT `designations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `designations_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employees_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employees_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employees_id_foreign` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employees_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employees_office_shift_id_foreign` FOREIGN KEY (`office_shift_id`) REFERENCES `office_shifts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employees_role_users_id_foreign` FOREIGN KEY (`role_users_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employees_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `employee_bank_accounts`
--
ALTER TABLE `employee_bank_accounts`
  ADD CONSTRAINT `employee_bank_accounts_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_contacts`
--
ALTER TABLE `employee_contacts`
  ADD CONSTRAINT `employee_contacts_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_documents`
--
ALTER TABLE `employee_documents`
  ADD CONSTRAINT `employee_documents_document_type_id_foreign` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employee_documents_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_immigrations`
--
ALTER TABLE `employee_immigrations`
  ADD CONSTRAINT `employee_immigrations_document_type_id_foreign` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employee_immigrations_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_interview`
--
ALTER TABLE `employee_interview`
  ADD CONSTRAINT `employee_interview_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `employee_interview_interview_id_foreign` FOREIGN KEY (`interview_id`) REFERENCES `job_interviews` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_leave_type_details`
--
ALTER TABLE `employee_leave_type_details`
  ADD CONSTRAINT `employee_leave_type_details_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_meeting`
--
ALTER TABLE `employee_meeting`
  ADD CONSTRAINT `employee_meeting_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_meeting_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_project`
--
ALTER TABLE `employee_project`
  ADD CONSTRAINT `employee_project_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_project_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_qualificaitons`
--
ALTER TABLE `employee_qualificaitons`
  ADD CONSTRAINT `employee_qualificaitons_education_level_id_foreign` FOREIGN KEY (`education_level_id`) REFERENCES `qualification_education_levels` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employee_qualificaitons_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_qualificaitons_general_skill_id_foreign` FOREIGN KEY (`general_skill_id`) REFERENCES `qualification_skills` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employee_qualificaitons_language_skill_id_foreign` FOREIGN KEY (`language_skill_id`) REFERENCES `qualification_languages` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `employee_support_ticket`
--
ALTER TABLE `employee_support_ticket`
  ADD CONSTRAINT `employee_support_ticket_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_support_ticket_support_ticket_id_foreign` FOREIGN KEY (`support_ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_task`
--
ALTER TABLE `employee_task`
  ADD CONSTRAINT `employee_task_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_task_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_training_list`
--
ALTER TABLE `employee_training_list`
  ADD CONSTRAINT `employee_training_list_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_training_list_training_list_id_foreign` FOREIGN KEY (`training_list_id`) REFERENCES `training_lists` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_work_experience`
--
ALTER TABLE `employee_work_experience`
  ADD CONSTRAINT `employee_work_experience_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `events_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expense_types`
--
ALTER TABLE `expense_types`
  ADD CONSTRAINT `expense_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `file_managers`
--
ALTER TABLE `file_managers`
  ADD CONSTRAINT `file_managers_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `file_managers_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `finance_deposits`
--
ALTER TABLE `finance_deposits`
  ADD CONSTRAINT `finance_deposits_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_deposits_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_deposits_payer_id_foreign` FOREIGN KEY (`payer_id`) REFERENCES `finance_payers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_deposits_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `finance_expenses`
--
ALTER TABLE `finance_expenses`
  ADD CONSTRAINT `finance_expenses_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_expenses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expense_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_expenses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_expenses_payee_id_foreign` FOREIGN KEY (`payee_id`) REFERENCES `finance_payees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_expenses_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `finance_transactions`
--
ALTER TABLE `finance_transactions`
  ADD CONSTRAINT `finance_transactions_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_transactions_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expense_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_transactions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_transactions_payee_id_foreign` FOREIGN KEY (`payee_id`) REFERENCES `finance_payees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_transactions_payer_id_foreign` FOREIGN KEY (`payer_id`) REFERENCES `finance_payers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_transactions_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `finance_transfers`
--
ALTER TABLE `finance_transfers`
  ADD CONSTRAINT `finance_transfers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_transfers_from_account_id_foreign` FOREIGN KEY (`from_account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_transfers_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_transfers_to_account_id_foreign` FOREIGN KEY (`to_account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `goal_trackings`
--
ALTER TABLE `goal_trackings`
  ADD CONSTRAINT `goal_trackings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `goal_trackings_goal_type_id_foreign` FOREIGN KEY (`goal_type_id`) REFERENCES `goal_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `holidays`
--
ALTER TABLE `holidays`
  ADD CONSTRAINT `holidays_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `holidays_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `indicators`
--
ALTER TABLE `indicators`
  ADD CONSTRAINT `indicators_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `indicators_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `indicators_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_items_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_candidates`
--
ALTER TABLE `job_candidates`
  ADD CONSTRAINT `job_candidates_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `job_posts` (`id`);

--
-- Constraints for table `job_interviews`
--
ALTER TABLE `job_interviews`
  ADD CONSTRAINT `job_interviews_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `job_interviews_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `job_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_posts`
--
ALTER TABLE `job_posts`
  ADD CONSTRAINT `job_posts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_posts_job_category_id_foreign` FOREIGN KEY (`job_category_id`) REFERENCES `job_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leaves`
--
ALTER TABLE `leaves`
  ADD CONSTRAINT `leaves_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leaves_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leaves_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leaves_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD CONSTRAINT `leave_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_country_foreign` FOREIGN KEY (`country`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `locations_location_head_foreign` FOREIGN KEY (`location_head`) REFERENCES `employees` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `meetings`
--
ALTER TABLE `meetings`
  ADD CONSTRAINT `meetings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `office_shifts`
--
ALTER TABLE `office_shifts`
  ADD CONSTRAINT `office_shifts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `official_documents`
--
ALTER TABLE `official_documents`
  ADD CONSTRAINT `official_documents_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `official_documents_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `official_documents_document_type_id_foreign` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD CONSTRAINT `payment_methods_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payslips`
--
ALTER TABLE `payslips`
  ADD CONSTRAINT `payslips_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `policies`
--
ALTER TABLE `policies`
  ADD CONSTRAINT `policies_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `projects_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `projects_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_bugs`
--
ALTER TABLE `project_bugs`
  ADD CONSTRAINT `project_bugs_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_bugs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `project_discussions`
--
ALTER TABLE `project_discussions`
  ADD CONSTRAINT `project_discussions_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `project_files`
--
ALTER TABLE `project_files`
  ADD CONSTRAINT `project_files_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `promotions`
--
ALTER TABLE `promotions`
  ADD CONSTRAINT `promotions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `promotions_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `qualification_education_levels`
--
ALTER TABLE `qualification_education_levels`
  ADD CONSTRAINT `qualification_education_levels_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `qualification_languages`
--
ALTER TABLE `qualification_languages`
  ADD CONSTRAINT `qualification_languages_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `qualification_skills`
--
ALTER TABLE `qualification_skills`
  ADD CONSTRAINT `qualification_skills_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `resignations`
--
ALTER TABLE `resignations`
  ADD CONSTRAINT `resignations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `resignations_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `resignations_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salary_allowances`
--
ALTER TABLE `salary_allowances`
  ADD CONSTRAINT `salary_allowances_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salary_basics`
--
ALTER TABLE `salary_basics`
  ADD CONSTRAINT `salary_basics_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salary_commissions`
--
ALTER TABLE `salary_commissions`
  ADD CONSTRAINT `salary_commissions_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salary_deductions`
--
ALTER TABLE `salary_deductions`
  ADD CONSTRAINT `salary_deductions_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salary_loans`
--
ALTER TABLE `salary_loans`
  ADD CONSTRAINT `salary_loans_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salary_other_payments`
--
ALTER TABLE `salary_other_payments`
  ADD CONSTRAINT `salary_other_payments_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salary_overtimes`
--
ALTER TABLE `salary_overtimes`
  ADD CONSTRAINT `salary_overtimes_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salary_tax_credits`
--
ALTER TABLE `salary_tax_credits`
  ADD CONSTRAINT `salary_tax_credits_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD CONSTRAINT `support_tickets_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `support_tickets_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `support_tickets_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tasks_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_discussions`
--
ALTER TABLE `task_discussions`
  ADD CONSTRAINT `task_discussions_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `task_files`
--
ALTER TABLE `task_files`
  ADD CONSTRAINT `task_files_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `terminations`
--
ALTER TABLE `terminations`
  ADD CONSTRAINT `terminations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `terminations_terminated_employee_foreign` FOREIGN KEY (`terminated_employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `terminations_termination_type_foreign` FOREIGN KEY (`termination_type`) REFERENCES `termination_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  ADD CONSTRAINT `ticket_comments_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ticket_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `trainers`
--
ALTER TABLE `trainers`
  ADD CONSTRAINT `trainers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `training_lists`
--
ALTER TABLE `training_lists`
  ADD CONSTRAINT `training_lists_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `training_lists_trainer_id_foreign` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `training_lists_training_type_id_foreign` FOREIGN KEY (`training_type_id`) REFERENCES `training_types` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `transfers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transfers_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transfers_from_department_id_foreign` FOREIGN KEY (`from_department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transfers_to_department_id_foreign` FOREIGN KEY (`to_department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `translations`
--
ALTER TABLE `translations`
  ADD CONSTRAINT `translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `travels`
--
ALTER TABLE `travels`
  ADD CONSTRAINT `travels_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `travels_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `travels_travel_type_foreign` FOREIGN KEY (`travel_type`) REFERENCES `travel_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `travel_types`
--
ALTER TABLE `travel_types`
  ADD CONSTRAINT `travel_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_users_id_foreign` FOREIGN KEY (`role_users_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `warnings`
--
ALTER TABLE `warnings`
  ADD CONSTRAINT `warnings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `warnings_warning_to_foreign` FOREIGN KEY (`warning_to`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `warnings_warning_type_foreign` FOREIGN KEY (`warning_type`) REFERENCES `warnings_type` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
