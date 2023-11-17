SET foreign_key_checks = 0;

CREATE TABLE `announcements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `company_id` bigint unsigned DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `added_by` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_notify` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `announcements_company_id_foreign` (`company_id`),
  KEY `announcements_department_id_foreign` (`department_id`),
  CONSTRAINT `announcements_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `announcements_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `appraisals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `employee_id` bigint unsigned NOT NULL,
  `department_id` bigint unsigned NOT NULL,
  `designation_id` bigint unsigned NOT NULL,
  `customer_experience` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marketing` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `administration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `professionalism` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `integrity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appraisals_company_id_foreign` (`company_id`),
  KEY `appraisals_employee_id_foreign` (`employee_id`),
  KEY `appraisals_department_id_foreign` (`department_id`),
  KEY `appraisals_designation_id_foreign` (`designation_id`),
  CONSTRAINT `appraisals_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appraisals_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appraisals_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appraisals_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `asset_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned DEFAULT NULL,
  `category_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_categories_company_id_foreign` (`company_id`),
  CONSTRAINT `asset_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `assets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint unsigned NOT NULL,
  `employee_id` bigint unsigned DEFAULT NULL,
  `asset_code` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assets_category_id` bigint unsigned NOT NULL,
  `Asset_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `manufacturer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date NOT NULL,
  `warranty_date` date NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_company_id_foreign` (`company_id`),
  KEY `assets_employee_id_foreign` (`employee_id`),
  KEY `assets_assets_category_id_foreign` (`assets_category_id`),
  CONSTRAINT `assets_assets_category_id_foreign` FOREIGN KEY (`assets_category_id`) REFERENCES `asset_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `attendances` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `attendance_date` date NOT NULL,
  `clock_in` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clock_in_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clock_out` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clock_out_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clock_in_out` tinyint NOT NULL,
  `time_late` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00:00',
  `early_leaving` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00:00',
  `overtime` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00:00',
  `total_work` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00:00',
  `total_rest` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00:00',
  `attendance_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'present',
  PRIMARY KEY (`id`),
  KEY `attendances_employee_id_foreign` (`employee_id`),
  CONSTRAINT `attendances_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `award_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `award_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `awards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `award_information` mediumtext COLLATE utf8mb4_unicode_ci,
  `award_date` date NOT NULL,
  `gift` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cash` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `employee_id` bigint unsigned NOT NULL,
  `award_type_id` bigint unsigned DEFAULT NULL,
  `award_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `awards_company_id_foreign` (`company_id`),
  KEY `awards_department_id_foreign` (`department_id`),
  KEY `awards_employee_id_foreign` (`employee_id`),
  KEY `awards_award_type_id_foreign` (`award_type_id`),
  CONSTRAINT `awards_award_type_id_foreign` FOREIGN KEY (`award_type_id`) REFERENCES `award_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `awards_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `awards_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  CONSTRAINT `awards_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `c_m_s` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `home` longtext COLLATE utf8mb4_unicode_ci,
  `about` longtext COLLATE utf8mb4_unicode_ci,
  `contact` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `calendarables` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `candidate_interview` (
  `interview_id` bigint unsigned NOT NULL,
  `candidate_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`interview_id`,`candidate_id`),
  KEY `candidate_interview_candidate_id_foreign` (`candidate_id`),
  CONSTRAINT `candidate_interview_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `job_candidates` (`id`),
  CONSTRAINT `candidate_interview_interview_id_foreign` FOREIGN KEY (`interview_id`) REFERENCES `job_interviews` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` mediumtext COLLATE utf8mb4_unicode_ci,
  `address2` mediumtext COLLATE utf8mb4_unicode_ci,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` tinyint DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `clients_id_foreign` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `companies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trading_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` bigint unsigned DEFAULT NULL,
  `company_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companies_location_id_foreign` (`location_id`),
  CONSTRAINT `companies_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `complaints` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `complaint_title` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` bigint unsigned NOT NULL,
  `complaint_from` bigint unsigned NOT NULL,
  `complaint_against` bigint unsigned NOT NULL,
  `complaint_date` date NOT NULL,
  `status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `complaints_company_id_foreign` (`company_id`),
  KEY `complaints_complaint_from_foreign` (`complaint_from`),
  KEY `complaints_complaint_against_foreign` (`complaint_against`),
  CONSTRAINT `complaints_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `complaints_complaint_against_foreign` FOREIGN KEY (`complaint_against`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `complaints_complaint_from_foreign` FOREIGN KEY (`complaint_from`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `countries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO countries VALUES('1','US','United States');
INSERT INTO countries VALUES('2','CA','Canada');
INSERT INTO countries VALUES('3','AF','Afghanistan');
INSERT INTO countries VALUES('4','AL','Albania');
INSERT INTO countries VALUES('5','DZ','Algeria');
INSERT INTO countries VALUES('6','DS','American Samoa');
INSERT INTO countries VALUES('7','AD','Andorra');
INSERT INTO countries VALUES('8','AO','Angola');
INSERT INTO countries VALUES('9','AI','Anguilla');
INSERT INTO countries VALUES('10','AQ','Antarctica');
INSERT INTO countries VALUES('11','AG','Antigua and/or Barbuda');
INSERT INTO countries VALUES('12','AR','Argentina');
INSERT INTO countries VALUES('13','AM','Armenia');
INSERT INTO countries VALUES('14','AW','Aruba');
INSERT INTO countries VALUES('15','AU','Australia');
INSERT INTO countries VALUES('16','AT','Austria');
INSERT INTO countries VALUES('17','AZ','Azerbaijan');
INSERT INTO countries VALUES('18','BS','Bahamas');
INSERT INTO countries VALUES('19','BH','Bahrain');
INSERT INTO countries VALUES('20','BD','Bangladesh');
INSERT INTO countries VALUES('21','BB','Barbados');
INSERT INTO countries VALUES('22','BY','Belarus');
INSERT INTO countries VALUES('23','BE','Belgium');
INSERT INTO countries VALUES('24','BZ','Belize');
INSERT INTO countries VALUES('25','BJ','Benin');
INSERT INTO countries VALUES('26','BM','Bermuda');
INSERT INTO countries VALUES('27','BT','Bhutan');
INSERT INTO countries VALUES('28','BO','Bolivia');
INSERT INTO countries VALUES('29','BA','Bosnia and Herzegovina');
INSERT INTO countries VALUES('30','BW','Botswana');
INSERT INTO countries VALUES('31','BV','Bouvet Island');
INSERT INTO countries VALUES('32','BR','Brazil');
INSERT INTO countries VALUES('33','IO','British lndian Ocean Territory');
INSERT INTO countries VALUES('34','BN','Brunei Darussalam');
INSERT INTO countries VALUES('35','BG','Bulgaria');
INSERT INTO countries VALUES('36','BF','Burkina Faso');
INSERT INTO countries VALUES('37','BI','Burundi');
INSERT INTO countries VALUES('38','KH','Cambodia');
INSERT INTO countries VALUES('39','CM','Cameroon');
INSERT INTO countries VALUES('40','CV','Cape Verde');
INSERT INTO countries VALUES('41','KY','Cayman Islands');
INSERT INTO countries VALUES('42','CF','Central African Republic');
INSERT INTO countries VALUES('43','TD','Chad');
INSERT INTO countries VALUES('44','CL','Chile');
INSERT INTO countries VALUES('45','CN','China');
INSERT INTO countries VALUES('46','CX','Christmas Island');
INSERT INTO countries VALUES('47','CC','Cocos (Keeling) Islands');
INSERT INTO countries VALUES('48','CO','Colombia');
INSERT INTO countries VALUES('49','KM','Comoros');
INSERT INTO countries VALUES('50','CG','Congo');
INSERT INTO countries VALUES('51','CK','Cook Islands');
INSERT INTO countries VALUES('52','CR','Costa Rica');
INSERT INTO countries VALUES('53','HR','Croatia (Hrvatska)');
INSERT INTO countries VALUES('54','CU','Cuba');
INSERT INTO countries VALUES('55','CY','Cyprus');
INSERT INTO countries VALUES('56','CZ','Czech Republic');
INSERT INTO countries VALUES('57','DK','Denmark');
INSERT INTO countries VALUES('58','DJ','Djibouti');
INSERT INTO countries VALUES('59','DM','Dominica');
INSERT INTO countries VALUES('60','DO','Dominican Republic');
INSERT INTO countries VALUES('61','TP','East Timor');
INSERT INTO countries VALUES('62','EC','Ecudaor');
INSERT INTO countries VALUES('63','EG','Egypt');
INSERT INTO countries VALUES('64','SV','El Salvador');
INSERT INTO countries VALUES('65','GQ','Equatorial Guinea');
INSERT INTO countries VALUES('66','ER','Eritrea');
INSERT INTO countries VALUES('67','EE','Estonia');
INSERT INTO countries VALUES('68','ET','Ethiopia');
INSERT INTO countries VALUES('69','FK','Falkland Islands (Malvinas)');
INSERT INTO countries VALUES('70','FO','Faroe Islands');
INSERT INTO countries VALUES('71','FJ','Fiji');
INSERT INTO countries VALUES('72','FI','Finland');
INSERT INTO countries VALUES('73','FR','France');
INSERT INTO countries VALUES('74','FX','France, Metropolitan');
INSERT INTO countries VALUES('75','GF','French Guiana');
INSERT INTO countries VALUES('76','PF','French Polynesia');
INSERT INTO countries VALUES('77','TF','French Southern Territories');
INSERT INTO countries VALUES('78','GA','Gabon');
INSERT INTO countries VALUES('79','GM','Gambia');
INSERT INTO countries VALUES('80','GE','Georgia');
INSERT INTO countries VALUES('81','DE','Germany');
INSERT INTO countries VALUES('82','GH','Ghana');
INSERT INTO countries VALUES('83','GI','Gibraltar');
INSERT INTO countries VALUES('84','GR','Greece');
INSERT INTO countries VALUES('85','GL','Greenland');
INSERT INTO countries VALUES('86','GD','Grenada');
INSERT INTO countries VALUES('87','GP','Guadeloupe');
INSERT INTO countries VALUES('88','GU','Guam');
INSERT INTO countries VALUES('89','GT','Guatemala');
INSERT INTO countries VALUES('90','GN','Guinea');
INSERT INTO countries VALUES('91','GW','Guinea-Bissau');
INSERT INTO countries VALUES('92','GY','Guyana');
INSERT INTO countries VALUES('93','HT','Haiti');
INSERT INTO countries VALUES('94','HM','Heard and Mc Donald Islands');
INSERT INTO countries VALUES('95','HN','Honduras');
INSERT INTO countries VALUES('96','HK','Hong Kong');
INSERT INTO countries VALUES('97','HU','Hungary');
INSERT INTO countries VALUES('98','IS','Iceland');
INSERT INTO countries VALUES('99','IN','India');
INSERT INTO countries VALUES('100','ID','Indonesia');
INSERT INTO countries VALUES('101','IR','Iran (Islamic Republic of)');
INSERT INTO countries VALUES('102','IQ','Iraq');
INSERT INTO countries VALUES('103','IE','Ireland');
INSERT INTO countries VALUES('104','IL','Israel');
INSERT INTO countries VALUES('105','IT','Italy');
INSERT INTO countries VALUES('106','CI','Ivory Coast');
INSERT INTO countries VALUES('107','JM','Jamaica');
INSERT INTO countries VALUES('108','JP','Japan');
INSERT INTO countries VALUES('109','JO','Jordan');
INSERT INTO countries VALUES('110','KZ','Kazakhstan');
INSERT INTO countries VALUES('111','KE','Kenya');
INSERT INTO countries VALUES('112','KI','Kiribati');
INSERT INTO countries VALUES('113','KP','Korea, Democratic People\'s Republic of');
INSERT INTO countries VALUES('114','KR','Korea, Republic of');
INSERT INTO countries VALUES('115','KW','Kuwait');
INSERT INTO countries VALUES('116','KG','Kyrgyzstan');
INSERT INTO countries VALUES('117','LA','Lao People\'s Democratic Republic');
INSERT INTO countries VALUES('118','LV','Latvia');
INSERT INTO countries VALUES('119','LB','Lebanon');
INSERT INTO countries VALUES('120','LS','Lesotho');
INSERT INTO countries VALUES('121','LR','Liberia');
INSERT INTO countries VALUES('122','LY','Libyan Arab Jamahiriya');
INSERT INTO countries VALUES('123','LI','Liechtenstein');
INSERT INTO countries VALUES('124','LT','Lithuania');
INSERT INTO countries VALUES('125','LU','Luxembourg');
INSERT INTO countries VALUES('126','MO','Macau');
INSERT INTO countries VALUES('127','MK','Macedonia');
INSERT INTO countries VALUES('128','MG','Madagascar');
INSERT INTO countries VALUES('129','MW','Malawi');
INSERT INTO countries VALUES('130','MY','Malaysia');
INSERT INTO countries VALUES('131','MV','Maldives');
INSERT INTO countries VALUES('132','ML','Mali');
INSERT INTO countries VALUES('133','MT','Malta');
INSERT INTO countries VALUES('134','MH','Marshall Islands');
INSERT INTO countries VALUES('135','MQ','Martinique');
INSERT INTO countries VALUES('136','MR','Mauritania');
INSERT INTO countries VALUES('137','MU','Mauritius');
INSERT INTO countries VALUES('138','TY','Mayotte');
INSERT INTO countries VALUES('139','MX','Mexico');
INSERT INTO countries VALUES('140','FM','Micronesia, Federated States of');
INSERT INTO countries VALUES('141','MD','Moldova, Republic of');
INSERT INTO countries VALUES('142','MC','Monaco');
INSERT INTO countries VALUES('143','MN','Mongolia');
INSERT INTO countries VALUES('144','MS','Montserrat');
INSERT INTO countries VALUES('145','MA','Morocco');
INSERT INTO countries VALUES('146','MZ','Mozambique');
INSERT INTO countries VALUES('147','MM','Myanmar');
INSERT INTO countries VALUES('148','NA','Namibia');
INSERT INTO countries VALUES('149','NR','Nauru');
INSERT INTO countries VALUES('150','NP','Nepal');
INSERT INTO countries VALUES('151','NL','Netherlands');
INSERT INTO countries VALUES('152','AN','Netherlands Antilles');
INSERT INTO countries VALUES('153','NC','New Caledonia');
INSERT INTO countries VALUES('154','NZ','New Zealand');
INSERT INTO countries VALUES('155','NI','Nicaragua');
INSERT INTO countries VALUES('156','NE','Niger');
INSERT INTO countries VALUES('157','NG','Nigeria');
INSERT INTO countries VALUES('158','NU','Niue');
INSERT INTO countries VALUES('159','NF','Norfork Island');
INSERT INTO countries VALUES('160','MP','Northern Mariana Islands');
INSERT INTO countries VALUES('161','NO','Norway');
INSERT INTO countries VALUES('162','OM','Oman');
INSERT INTO countries VALUES('163','PK','Pakistan');
INSERT INTO countries VALUES('164','PW','Palau');
INSERT INTO countries VALUES('165','PA','Panama');
INSERT INTO countries VALUES('166','PG','Papua New Guinea');
INSERT INTO countries VALUES('167','PY','Paraguay');
INSERT INTO countries VALUES('168','PE','Peru');
INSERT INTO countries VALUES('169','PH','Philippines');
INSERT INTO countries VALUES('170','PN','Pitcairn');
INSERT INTO countries VALUES('171','PL','Poland');
INSERT INTO countries VALUES('172','PT','Portugal');
INSERT INTO countries VALUES('173','PR','Puerto Rico');
INSERT INTO countries VALUES('174','QA','Qatar');
INSERT INTO countries VALUES('175','RE','Reunion');
INSERT INTO countries VALUES('176','RO','Romania');
INSERT INTO countries VALUES('177','RU','Russian Federation');
INSERT INTO countries VALUES('178','RW','Rwanda');
INSERT INTO countries VALUES('179','KN','Saint Kitts and Nevis');
INSERT INTO countries VALUES('180','LC','Saint Lucia');
INSERT INTO countries VALUES('181','VC','Saint Vincent and the Grenadines');
INSERT INTO countries VALUES('182','WS','Samoa');
INSERT INTO countries VALUES('183','SM','San Marino');
INSERT INTO countries VALUES('184','ST','Sao Tome and Principe');
INSERT INTO countries VALUES('185','SA','Saudi Arabia');
INSERT INTO countries VALUES('186','SN','Senegal');
INSERT INTO countries VALUES('187','SC','Seychelles');
INSERT INTO countries VALUES('188','SL','Sierra Leone');
INSERT INTO countries VALUES('189','SG','Singapore');
INSERT INTO countries VALUES('190','SK','Slovakia');
INSERT INTO countries VALUES('191','SI','Slovenia');
INSERT INTO countries VALUES('192','SB','Solomon Islands');
INSERT INTO countries VALUES('193','SO','Somalia');
INSERT INTO countries VALUES('194','ZA','South Africa');
INSERT INTO countries VALUES('195','GS','South Georgia South Sandwich Islands');
INSERT INTO countries VALUES('196','ES','Spain');
INSERT INTO countries VALUES('197','LK','Sri Lanka');
INSERT INTO countries VALUES('198','SH','St. Helena');
INSERT INTO countries VALUES('199','PM','St. Pierre and Miquelon');
INSERT INTO countries VALUES('200','SD','Sudan');
INSERT INTO countries VALUES('201','SR','Suriname');
INSERT INTO countries VALUES('202','SJ','Svalbarn and Jan Mayen Islands');
INSERT INTO countries VALUES('203','SZ','Swaziland');
INSERT INTO countries VALUES('204','SE','Sweden');
INSERT INTO countries VALUES('205','CH','Switzerland');
INSERT INTO countries VALUES('206','SY','Syrian Arab Republic');
INSERT INTO countries VALUES('207','TW','Taiwan');
INSERT INTO countries VALUES('208','TJ','Tajikistan');
INSERT INTO countries VALUES('209','TZ','Tanzania, United Republic of');
INSERT INTO countries VALUES('210','TH','Thailand');
INSERT INTO countries VALUES('211','TG','Togo');
INSERT INTO countries VALUES('212','TK','Tokelau');
INSERT INTO countries VALUES('213','TO','Tonga');
INSERT INTO countries VALUES('214','TT','Trinidad and Tobago');
INSERT INTO countries VALUES('215','TN','Tunisia');
INSERT INTO countries VALUES('216','TR','Turkey');
INSERT INTO countries VALUES('217','TM','Turkmenistan');
INSERT INTO countries VALUES('218','TC','Turks and Caicos Islands');
INSERT INTO countries VALUES('219','TV','Tuvalu');
INSERT INTO countries VALUES('220','UG','Uganda');
INSERT INTO countries VALUES('221','UA','Ukraine');
INSERT INTO countries VALUES('222','AE','United Arab Emirates');
INSERT INTO countries VALUES('223','GB','United Kingdom');
INSERT INTO countries VALUES('224','UM','United States minor outlying islands');
INSERT INTO countries VALUES('225','UY','Uruguay');
INSERT INTO countries VALUES('226','UZ','Uzbekistan');
INSERT INTO countries VALUES('227','VU','Vanuatu');
INSERT INTO countries VALUES('228','VA','Vatican City State');
INSERT INTO countries VALUES('229','VE','Venezuela');
INSERT INTO countries VALUES('230','VN','Vietnam');
INSERT INTO countries VALUES('231','VG','Virigan Islands (British)');
INSERT INTO countries VALUES('232','VI','Virgin Islands (U.S.)');
INSERT INTO countries VALUES('233','WF','Wallis and Futuna Islands');
INSERT INTO countries VALUES('234','EH','Western Sahara');
INSERT INTO countries VALUES('235','YE','Yemen');
INSERT INTO countries VALUES('236','YU','Yugoslavia');
INSERT INTO countries VALUES('237','ZR','Zaire');
INSERT INTO countries VALUES('238','ZM','Zambia');
INSERT INTO countries VALUES('239','ZW','Zimbabwe');



CREATE TABLE `departments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `department_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `department_head` bigint unsigned DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departments_company_id_foreign` (`company_id`),
  KEY `departments_department_head_foreign` (`department_head`),
  CONSTRAINT `departments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `departments_department_head_foreign` FOREIGN KEY (`department_head`) REFERENCES `employees` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `designations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `designation_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designations_company_id_foreign` (`company_id`),
  KEY `designations_department_id_foreign` (`department_id`),
  CONSTRAINT `designations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `designations_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `document_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `document_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_bank_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `account_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_branch` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_bank_accounts_employee_id_foreign` (`employee_id`),
  CONSTRAINT `employee_bank_accounts_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `relation` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_primary` tinyint DEFAULT '0',
  `is_dependent` tinyint DEFAULT '0',
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `work_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_phone_ext` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personal_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personal_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_contacts_employee_id_foreign` (`employee_id`),
  CONSTRAINT `employee_contacts_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_documents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `document_type_id` bigint unsigned DEFAULT NULL,
  `document_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `document_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_date` date NOT NULL,
  `is_notify` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_documents_employee_id_foreign` (`employee_id`),
  KEY `employee_documents_document_type_id_foreign` (`document_type_id`),
  CONSTRAINT `employee_documents_document_type_id_foreign` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employee_documents_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_immigrations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `document_type_id` bigint unsigned DEFAULT NULL,
  `document_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issue_date` date NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `eligible_review_date` date DEFAULT NULL,
  `country_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_immigrations_employee_id_foreign` (`employee_id`),
  KEY `employee_immigrations_document_type_id_foreign` (`document_type_id`),
  CONSTRAINT `employee_immigrations_document_type_id_foreign` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employee_immigrations_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_interview` (
  `interview_id` bigint unsigned NOT NULL,
  `employee_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`interview_id`,`employee_id`),
  KEY `employee_interview_employee_id_foreign` (`employee_id`),
  CONSTRAINT `employee_interview_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `employee_interview_interview_id_foreign` FOREIGN KEY (`interview_id`) REFERENCES `job_interviews` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_leave_type_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `leave_type_detail` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_leave_type_details_employee_id_foreign` (`employee_id`),
  CONSTRAINT `employee_leave_type_details_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_meeting` (
  `employee_id` bigint unsigned NOT NULL,
  `meeting_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`employee_id`,`meeting_id`),
  KEY `employee_meeting_meeting_id_foreign` (`meeting_id`),
  CONSTRAINT `employee_meeting_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_meeting_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_project` (
  `employee_id` bigint unsigned NOT NULL,
  `project_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`employee_id`,`project_id`),
  KEY `employee_project_project_id_foreign` (`project_id`),
  CONSTRAINT `employee_project_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_project_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_qualificaitons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `education_level_id` bigint unsigned DEFAULT NULL,
  `institution_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_year` date DEFAULT NULL,
  `to_year` date DEFAULT NULL,
  `language_skill_id` bigint unsigned DEFAULT NULL,
  `general_skill_id` bigint unsigned DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_qualificaitons_employee_id_foreign` (`employee_id`),
  KEY `employee_qualificaitons_education_level_id_foreign` (`education_level_id`),
  KEY `employee_qualificaitons_language_skill_id_foreign` (`language_skill_id`),
  KEY `employee_qualificaitons_general_skill_id_foreign` (`general_skill_id`),
  CONSTRAINT `employee_qualificaitons_education_level_id_foreign` FOREIGN KEY (`education_level_id`) REFERENCES `qualification_education_levels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employee_qualificaitons_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_qualificaitons_general_skill_id_foreign` FOREIGN KEY (`general_skill_id`) REFERENCES `qualification_skills` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employee_qualificaitons_language_skill_id_foreign` FOREIGN KEY (`language_skill_id`) REFERENCES `qualification_languages` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_support_ticket` (
  `employee_id` bigint unsigned NOT NULL,
  `support_ticket_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`employee_id`,`support_ticket_id`),
  KEY `employee_support_ticket_support_ticket_id_foreign` (`support_ticket_id`),
  CONSTRAINT `employee_support_ticket_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_support_ticket_support_ticket_id_foreign` FOREIGN KEY (`support_ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_task` (
  `employee_id` bigint unsigned NOT NULL,
  `task_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`employee_id`,`task_id`),
  KEY `employee_task_task_id_foreign` (`task_id`),
  CONSTRAINT `employee_task_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_task_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_training_list` (
  `employee_id` bigint unsigned NOT NULL,
  `training_list_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`employee_id`,`training_list_id`),
  KEY `employee_training_list_training_list_id_foreign` (`training_list_id`),
  CONSTRAINT `employee_training_list_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_training_list_training_list_id_foreign` FOREIGN KEY (`training_list_id`) REFERENCES `training_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employee_work_experience` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_year` date DEFAULT NULL,
  `to_year` date DEFAULT NULL,
  `post` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_work_experience_employee_id_foreign` (`employee_id`),
  CONSTRAINT `employee_work_experience_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_shift_id` bigint unsigned DEFAULT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `designation_id` bigint unsigned DEFAULT NULL,
  `location_id` bigint unsigned DEFAULT NULL,
  `role_users_id` bigint unsigned DEFAULT NULL,
  `status_id` bigint unsigned DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `exit_date` date DEFAULT NULL,
  `marital_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cv` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedIn_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_salary` double DEFAULT '0',
  `payslip_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pension_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pension_amount` double(8,2) DEFAULT '0.00',
  `is_active` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_office_shift_id_foreign` (`office_shift_id`),
  KEY `employees_company_id_foreign` (`company_id`),
  KEY `employees_department_id_foreign` (`department_id`),
  KEY `employees_designation_id_foreign` (`designation_id`),
  KEY `employees_location_id_foreign` (`location_id`),
  KEY `employees_role_users_id_foreign` (`role_users_id`),
  KEY `employees_status_id_foreign` (`status_id`),
  CONSTRAINT `employees_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employees_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employees_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employees_id_foreign` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employees_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_office_shift_id_foreign` FOREIGN KEY (`office_shift_id`) REFERENCES `office_shifts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_role_users_id_foreign` FOREIGN KEY (`role_users_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `department_id` bigint unsigned NOT NULL,
  `event_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_note` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_date` date NOT NULL,
  `event_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_notify` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `events_company_id_foreign` (`company_id`),
  KEY `events_department_id_foreign` (`department_id`),
  CONSTRAINT `events_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `events_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `expense_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned DEFAULT NULL,
  `type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expense_types_company_id_foreign` (`company_id`),
  CONSTRAINT `expense_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `file_manager_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `allowed_extensions` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_file_size` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `file_managers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `department_id` bigint unsigned DEFAULT NULL,
  `added_by` bigint unsigned DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_extension` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file_managers_department_id_foreign` (`department_id`),
  KEY `file_managers_added_by_foreign` (`added_by`),
  CONSTRAINT `file_managers_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `file_managers_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `finance_bank_cashes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_balance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_balance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_branch` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `finance_deposits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned DEFAULT NULL,
  `account_id` bigint unsigned DEFAULT NULL,
  `amount` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `payment_method_id` bigint unsigned DEFAULT NULL,
  `payer_id` bigint unsigned DEFAULT NULL,
  `deposit_reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deposit_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `finance_deposits_company_id_foreign` (`company_id`),
  KEY `finance_deposits_account_id_foreign` (`account_id`),
  KEY `finance_deposits_payment_method_id_foreign` (`payment_method_id`),
  KEY `finance_deposits_payer_id_foreign` (`payer_id`),
  CONSTRAINT `finance_deposits_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_deposits_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_deposits_payer_id_foreign` FOREIGN KEY (`payer_id`) REFERENCES `finance_payers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_deposits_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `finance_expenses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned DEFAULT NULL,
  `account_id` bigint unsigned DEFAULT NULL,
  `amount` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `payment_method_id` bigint unsigned DEFAULT NULL,
  `payee_id` bigint unsigned DEFAULT NULL,
  `expense_reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expense_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `finance_expenses_company_id_foreign` (`company_id`),
  KEY `finance_expenses_account_id_foreign` (`account_id`),
  KEY `finance_expenses_payment_method_id_foreign` (`payment_method_id`),
  KEY `finance_expenses_payee_id_foreign` (`payee_id`),
  KEY `finance_expenses_category_id_foreign` (`category_id`),
  CONSTRAINT `finance_expenses_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_expenses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expense_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_expenses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_expenses_payee_id_foreign` FOREIGN KEY (`payee_id`) REFERENCES `finance_payees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_expenses_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `finance_payees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payee_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `finance_payers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payer_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `finance_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned DEFAULT NULL,
  `account_id` bigint unsigned DEFAULT NULL,
  `amount` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `payment_method_id` bigint unsigned DEFAULT NULL,
  `payee_id` bigint unsigned DEFAULT NULL,
  `payer_id` bigint unsigned DEFAULT NULL,
  `expense_reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `deposit_reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `finance_transactions_company_id_foreign` (`company_id`),
  KEY `finance_transactions_account_id_foreign` (`account_id`),
  KEY `finance_transactions_payment_method_id_foreign` (`payment_method_id`),
  KEY `finance_transactions_payee_id_foreign` (`payee_id`),
  KEY `finance_transactions_payer_id_foreign` (`payer_id`),
  KEY `finance_transactions_category_id_foreign` (`category_id`),
  CONSTRAINT `finance_transactions_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_transactions_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expense_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_transactions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_transactions_payee_id_foreign` FOREIGN KEY (`payee_id`) REFERENCES `finance_payees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_transactions_payer_id_foreign` FOREIGN KEY (`payer_id`) REFERENCES `finance_payers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_transactions_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `finance_transfers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned DEFAULT NULL,
  `from_account_id` bigint unsigned DEFAULT NULL,
  `to_account_id` bigint unsigned DEFAULT NULL,
  `amount` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `payment_method_id` bigint unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `finance_transfers_company_id_foreign` (`company_id`),
  KEY `finance_transfers_from_account_id_foreign` (`from_account_id`),
  KEY `finance_transfers_to_account_id_foreign` (`to_account_id`),
  KEY `finance_transfers_payment_method_id_foreign` (`payment_method_id`),
  CONSTRAINT `finance_transfers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_transfers_from_account_id_foreign` FOREIGN KEY (`from_account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_transfers_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_transfers_to_account_id_foreign` FOREIGN KEY (`to_account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `general_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_payment_bank` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO general_settings VALUES('1','PeoplePro','logo.png','Asia/Dhaka','$','prefix','1','d-m-Y','default.css','LionCoders','https://www.lion-coders.com','2020-07-26 01:00:00','2023-05-10 16:24:21');



CREATE TABLE `goal_trackings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `goal_type_id` bigint unsigned NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_achievement` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `start_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `progress` int NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goal_trackings_company_id_foreign` (`company_id`),
  KEY `goal_trackings_goal_type_id_foreign` (`goal_type_id`),
  CONSTRAINT `goal_trackings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `goal_trackings_goal_type_id_foreign` FOREIGN KEY (`goal_type_id`) REFERENCES `goal_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `goal_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `goal_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `holidays` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `event_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` bigint unsigned DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_publish` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `holidays_company_id_foreign` (`company_id`),
  KEY `holidays_department_id_foreign` (`department_id`),
  CONSTRAINT `holidays_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `holidays_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `indicators` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `designation_id` bigint unsigned NOT NULL,
  `department_id` bigint unsigned NOT NULL,
  `customer_experience` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marketing` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `administrator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `professionalism` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `integrity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attendance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `indicators_company_id_foreign` (`company_id`),
  KEY `indicators_department_id_foreign` (`department_id`),
  KEY `indicators_designation_id_foreign` (`designation_id`),
  CONSTRAINT `indicators_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `indicators_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `indicators_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint unsigned DEFAULT NULL,
  `project_id` bigint unsigned DEFAULT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_tax_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_tax_rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_qty` bigint NOT NULL DEFAULT '0',
  `item_unit_price` bigint NOT NULL,
  `item_sub_total` double NOT NULL,
  `sub_total` double NOT NULL,
  `discount_type` tinyint DEFAULT NULL,
  `discount_figure` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_discount` double NOT NULL,
  `grand_total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_items_project_id_foreign` (`project_id`),
  CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` bigint unsigned DEFAULT NULL,
  `project_id` bigint unsigned DEFAULT NULL,
  `invoice_date` date NOT NULL,
  `invoice_due_date` date NOT NULL,
  `sub_total` double NOT NULL,
  `discount_type` tinyint DEFAULT NULL,
  `discount_figure` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_discount` double NOT NULL,
  `grand_total` double NOT NULL,
  `invoice_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_client_id_foreign` (`client_id`),
  KEY `invoices_project_id_foreign` (`project_id`),
  CONSTRAINT `invoices_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoices_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `ip_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `job_candidates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `job_id` bigint unsigned NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `cover_letter` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fb_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cv` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_candidates_job_id_foreign` (`job_id`),
  CONSTRAINT `job_candidates_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `job_posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `job_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `job_category` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `job_interviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `job_id` bigint unsigned NOT NULL,
  `added_by` bigint unsigned DEFAULT NULL,
  `interview_place` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interview_date` date NOT NULL,
  `interview_time` time NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_interviews_job_id_foreign` (`job_id`),
  KEY `job_interviews_added_by_foreign` (`added_by`),
  CONSTRAINT `job_interviews_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `job_interviews_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `job_posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `job_posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `job_category_id` bigint unsigned NOT NULL,
  `job_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_vacancy` int NOT NULL,
  `job_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_experience` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `closing_date` date NOT NULL,
  `status` tinyint NOT NULL,
  `is_featured` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_posts_job_category_id_foreign` (`job_category_id`),
  KEY `job_posts_company_id_foreign` (`company_id`),
  CONSTRAINT `job_posts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `job_posts_job_category_id_foreign` FOREIGN KEY (`job_category_id`) REFERENCES `job_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `languages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `leave_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `leave_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allocated_day` int DEFAULT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leave_types_company_id_foreign` (`company_id`),
  CONSTRAINT `leave_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO leave_types VALUES('1','Others','0','','2023-05-17 13:31:44','2023-05-17 13:31:44');



CREATE TABLE `leaves` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `leave_type_id` bigint unsigned DEFAULT NULL,
  `company_id` bigint unsigned NOT NULL,
  `department_id` bigint unsigned NOT NULL,
  `employee_id` bigint unsigned DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_days` int NOT NULL,
  `leave_reason` mediumtext COLLATE utf8mb4_unicode_ci,
  `remarks` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_notify` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leaves_company_id_foreign` (`company_id`),
  KEY `leaves_employee_id_foreign` (`employee_id`),
  KEY `leaves_leave_type_id_foreign` (`leave_type_id`),
  KEY `leaves_department_id_foreign` (`department_id`),
  CONSTRAINT `leaves_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `leaves_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `leaves_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `leaves_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `location_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_head` bigint unsigned DEFAULT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` int unsigned DEFAULT NULL,
  `zip` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `locations_location_head_foreign` (`location_head`),
  KEY `locations_country_foreign` (`country`),
  CONSTRAINT `locations_country_foreign` FOREIGN KEY (`country`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `locations_location_head_foreign` FOREIGN KEY (`location_head`) REFERENCES `employees` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `meetings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `meeting_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meeting_note` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `meeting_date` date NOT NULL,
  `meeting_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_notify` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meetings_company_id_foreign` (`company_id`),
  CONSTRAINT `meetings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES('1','2018_08_29_200844_create_languages_table','1');
INSERT INTO migrations VALUES('2','2018_08_29_205156_create_translations_table','1');
INSERT INTO migrations VALUES('3','2023_05_06_053210_create_countries_table','2');
INSERT INTO migrations VALUES('4','2023_05_06_053211_create_locations_table','2');
INSERT INTO migrations VALUES('5','2023_05_06_053212_create_companies_table','2');
INSERT INTO migrations VALUES('6','2023_05_06_053213_create_departments_table','2');
INSERT INTO migrations VALUES('7','2023_05_06_053214_create_designations_table','2');
INSERT INTO migrations VALUES('8','2023_05_06_053215_create_roles_table','2');
INSERT INTO migrations VALUES('9','2023_05_06_053217_create_users_table','2');
INSERT INTO migrations VALUES('10','2023_05_06_053218_create_office_shifts_table','2');
INSERT INTO migrations VALUES('11','2023_05_06_053219_create_statuses_table','2');
INSERT INTO migrations VALUES('12','2023_05_06_053220_create_employees_table','2');
INSERT INTO migrations VALUES('13','2023_05_06_053221_create_announcements_table','2');
INSERT INTO migrations VALUES('14','2023_05_06_053222_create_appraisals_table','2');
INSERT INTO migrations VALUES('15','2023_05_06_053223_create_asset_categories_table','2');
INSERT INTO migrations VALUES('16','2023_05_06_053224_create_assets_table','2');
INSERT INTO migrations VALUES('17','2023_05_06_053225_create_attendances_table','2');
INSERT INTO migrations VALUES('18','2023_05_06_053226_create_award_types_table','2');
INSERT INTO migrations VALUES('19','2023_05_06_053227_create_awards_table','2');
INSERT INTO migrations VALUES('20','2023_05_06_053228_create_c_m_s_table','2');
INSERT INTO migrations VALUES('21','2023_05_06_053229_create_calendarables_table','2');
INSERT INTO migrations VALUES('22','2023_05_06_053231_create_clients_table','2');
INSERT INTO migrations VALUES('23','2023_05_06_053232_create_complaints_table','2');
INSERT INTO migrations VALUES('24','2023_05_06_053233_create_document_types_table','2');
INSERT INTO migrations VALUES('25','2023_05_06_053234_create_employee_bank_accounts_table','2');
INSERT INTO migrations VALUES('26','2023_05_06_053235_create_employee_contacts_table','2');
INSERT INTO migrations VALUES('27','2023_05_06_053236_create_employee_documents_table','2');
INSERT INTO migrations VALUES('28','2023_05_06_053237_create_employee_immigrations_table','2');
INSERT INTO migrations VALUES('29','2023_05_06_053238_create_employee_leave_type_details_table','2');
INSERT INTO migrations VALUES('30','2023_05_06_053239_create_job_categories_table','2');
INSERT INTO migrations VALUES('31','2023_05_06_053240_create_job_posts_table','2');
INSERT INTO migrations VALUES('32','2023_05_06_053241_create_job_interviews_table','2');
INSERT INTO migrations VALUES('33','2023_05_06_053242_create_employee_interview_table','2');
INSERT INTO migrations VALUES('34','2023_05_06_053243_create_meetings_table','2');
INSERT INTO migrations VALUES('35','2023_05_06_053244_create_employee_meeting_table','2');
INSERT INTO migrations VALUES('36','2023_05_06_053245_create_projects_table','2');
INSERT INTO migrations VALUES('37','2023_05_06_053246_create_employee_project_table','2');
INSERT INTO migrations VALUES('38','2023_05_06_053247_create_qualification_languages_table','2');
INSERT INTO migrations VALUES('39','2023_05_06_053248_create_qualification_skills_table','2');
INSERT INTO migrations VALUES('40','2023_05_06_053249_create_qualification_education_levels_table','2');
INSERT INTO migrations VALUES('41','2023_05_06_053250_create_employee_qualificaitons_table','2');
INSERT INTO migrations VALUES('42','2023_05_06_053251_create_support_tickets_table','2');
INSERT INTO migrations VALUES('43','2023_05_06_053252_create_employee_support_ticket_table','2');
INSERT INTO migrations VALUES('44','2023_05_06_053253_create_tasks_table','2');
INSERT INTO migrations VALUES('45','2023_05_06_053254_create_employee_task_table','2');
INSERT INTO migrations VALUES('46','2023_05_06_053255_create_trainers_table','2');
INSERT INTO migrations VALUES('47','2023_05_06_053256_create_training_types_table','2');
INSERT INTO migrations VALUES('48','2023_05_06_053257_create_training_lists_table','2');
INSERT INTO migrations VALUES('49','2023_05_06_053258_create_employee_training_list_table','2');
INSERT INTO migrations VALUES('50','2023_05_06_053259_create_employee_work_experience_table','2');
INSERT INTO migrations VALUES('51','2023_05_06_053260_create_events_table','2');
INSERT INTO migrations VALUES('52','2023_05_06_053261_create_expense_types_table','2');
INSERT INTO migrations VALUES('53','2023_05_06_053262_create_failed_jobs_table','2');
INSERT INTO migrations VALUES('54','2023_05_06_053263_create_file_manager_settings_table','2');
INSERT INTO migrations VALUES('55','2023_05_06_053265_create_file_managers_table','2');
INSERT INTO migrations VALUES('56','2023_05_06_053265_create_finance_bank_cashes_table','2');
INSERT INTO migrations VALUES('57','2023_05_06_053266_create_finance_payers_table','2');
INSERT INTO migrations VALUES('58','2023_05_06_053267_create_payment_methods_table','2');
INSERT INTO migrations VALUES('59','2023_05_06_053268_create_finance_deposits_table','2');
INSERT INTO migrations VALUES('60','2023_05_06_053269_create_finance_payees_table','2');
INSERT INTO migrations VALUES('61','2023_05_06_053270_create_finance_expenses_table','2');
INSERT INTO migrations VALUES('62','2023_05_06_053271_create_finance_transactions_table','2');
INSERT INTO migrations VALUES('63','2023_05_06_053272_create_finance_transfers_table','2');
INSERT INTO migrations VALUES('64','2023_05_06_053273_create_general_settings_table','2');
INSERT INTO migrations VALUES('65','2023_05_06_053274_create_goal_types_table','2');
INSERT INTO migrations VALUES('66','2023_05_06_053275_create_goal_trackings_table','2');
INSERT INTO migrations VALUES('67','2023_05_06_053276_create_holidays_table','2');
INSERT INTO migrations VALUES('68','2023_05_06_053277_create_indicators_table','2');
INSERT INTO migrations VALUES('69','2023_05_06_053278_create_invoices_table','2');
INSERT INTO migrations VALUES('70','2023_05_06_053279_create_invoice_items_table','2');
INSERT INTO migrations VALUES('71','2023_05_06_053280_create_ip_settings_table','2');
INSERT INTO migrations VALUES('72','2023_05_06_053281_create_job_candidates_table','2');
INSERT INTO migrations VALUES('73','2023_05_06_053282_create_leave_types_table','2');
INSERT INTO migrations VALUES('74','2023_05_06_053283_create_leaves_table','2');
INSERT INTO migrations VALUES('75','2023_05_06_053284_create_permissions_table','2');
INSERT INTO migrations VALUES('76','2023_05_06_053285_create_model_has_permissions_table','2');
INSERT INTO migrations VALUES('77','2023_05_06_053287_create_model_has_roles_table','2');
INSERT INTO migrations VALUES('78','2023_05_06_053288_create_notifications_table','2');
INSERT INTO migrations VALUES('79','2023_05_06_053289_create_official_documents_table','2');
INSERT INTO migrations VALUES('80','2023_05_06_053290_create_password_resets_table','2');
INSERT INTO migrations VALUES('81','2023_05_06_053291_create_payslips_table','2');
INSERT INTO migrations VALUES('82','2023_05_06_053292_create_policies_table','2');
INSERT INTO migrations VALUES('83','2023_05_06_053293_create_project_bugs_table','2');
INSERT INTO migrations VALUES('84','2023_05_06_053294_create_project_discussions_table','2');
INSERT INTO migrations VALUES('85','2023_05_06_053295_create_project_files_table','2');
INSERT INTO migrations VALUES('86','2023_05_06_053296_create_promotions_table','2');
INSERT INTO migrations VALUES('87','2023_05_06_053297_create_resignations_table','2');
INSERT INTO migrations VALUES('88','2023_05_06_053298_create_role_has_permissions_table','2');
INSERT INTO migrations VALUES('89','2023_05_06_053299_create_salary_allowances_table','2');
INSERT INTO migrations VALUES('90','2023_05_06_053300_create_salary_basics_table','2');
INSERT INTO migrations VALUES('91','2023_05_06_053301_create_salary_commissions_table','2');
INSERT INTO migrations VALUES('92','2023_05_06_053302_create_salary_deductions_table','2');
INSERT INTO migrations VALUES('93','2023_05_06_053303_create_salary_loans_table','2');
INSERT INTO migrations VALUES('94','2023_05_06_053304_create_salary_other_payments_table','2');
INSERT INTO migrations VALUES('95','2023_05_06_053305_create_salary_overtimes_table','2');
INSERT INTO migrations VALUES('96','2023_05_06_053306_create_task_discussions_table','2');
INSERT INTO migrations VALUES('97','2023_05_06_053307_create_task_files_table','2');
INSERT INTO migrations VALUES('98','2023_05_06_053308_create_tax_types_table','2');
INSERT INTO migrations VALUES('99','2023_05_06_053309_create_termination_types_table','2');
INSERT INTO migrations VALUES('100','2023_05_06_053310_create_terminations_table','2');
INSERT INTO migrations VALUES('101','2023_05_06_053311_create_ticket_comments_table','2');
INSERT INTO migrations VALUES('102','2023_05_06_053312_create_transfers_table','2');
INSERT INTO migrations VALUES('103','2023_05_06_053313_create_travel_types_table','2');
INSERT INTO migrations VALUES('104','2023_05_06_053314_create_travels_table','2');
INSERT INTO migrations VALUES('105','2023_05_06_053315_create_warnings_type_table','2');
INSERT INTO migrations VALUES('106','2023_05_06_053316_create_warnings_table','2');
INSERT INTO migrations VALUES('107','2023_05_06_053317_create_candidate_interview_table','2');
INSERT INTO migrations VALUES('108','2023_05_06_151650_delete_column_from_document_types_table','3');
INSERT INTO migrations VALUES('109','2023_05_06_153653_update_foreign_key_to_employees_table','3');
INSERT INTO migrations VALUES('110','2023_05_07_163304_update_foreign_key_to_projects_table','3');
INSERT INTO migrations VALUES('111','2023_05_08_004033_update_foreign_key_to_support_tickets_table','3');
INSERT INTO migrations VALUES('112','2023_05_08_094247_update_foreign_key_to_tasks_table','3');
INSERT INTO migrations VALUES('113','2023_05_08_101326_add_foreign_key_to_training_types_table','4');
INSERT INTO migrations VALUES('114','2023_05_08_152355_update_foreign_key_to_file_managers_table','4');
INSERT INTO migrations VALUES('115','2023_05_08_165246_update_foreign_key_to_payment_methods_table','4');
INSERT INTO migrations VALUES('116','2023_05_08_165419_update_foreign_key_to_finance_deposits_table','4');
INSERT INTO migrations VALUES('117','2023_05_09_112302_update_foreign_key_to_finance_expenses_table','4');
INSERT INTO migrations VALUES('118','2023_05_09_115226_update_foreign_key_to_finance_transactions_table','4');
INSERT INTO migrations VALUES('119','2023_05_09_122727_update_foreign_key_to_finance_transfers_table','4');
INSERT INTO migrations VALUES('120','2023_05_09_130054_add_foreign_key_to_goal_trackings_table','4');
INSERT INTO migrations VALUES('121','2023_05_09_134538_update_foreign_key_to_holidays_table','4');
INSERT INTO migrations VALUES('122','2023_05_09_134626_add_foreign_key_to_indicators_table','4');
INSERT INTO migrations VALUES('123','2023_05_09_134702_update_foreign_key_to_invoices_table','4');
INSERT INTO migrations VALUES('124','2023_05_09_134831_update_foreign_key_to_invoice_items_table','4');
INSERT INTO migrations VALUES('125','2023_05_09_162641_update_foreign_key_to_leaves_table','4');
INSERT INTO migrations VALUES('126','2023_05_09_181324_update_foreign_key_to_official_documents_table','4');
INSERT INTO migrations VALUES('127','2023_05_09_190434_update_foreign_key_to_policies_table','4');
INSERT INTO migrations VALUES('128','2023_05_09_193007_update_foreign_key_to_terminations_table','4');
INSERT INTO migrations VALUES('129','2023_05_09_195431_update_foreign_key_to_travel_types_table','4');
INSERT INTO migrations VALUES('130','2023_05_09_195925_update_foreign_key_to_travels_table','4');
INSERT INTO migrations VALUES('131','2023_05_09_200229_update_foreign_key_to_warnings_table','4');



CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO model_has_roles VALUES('1','App\\User','1');
INSERT INTO model_has_roles VALUES('1','App\\User','8');
INSERT INTO model_has_roles VALUES('2','App\\User','9');
INSERT INTO model_has_roles VALUES('6','App\\User','10');
INSERT INTO model_has_roles VALUES('4','App\\User','11');
INSERT INTO model_has_roles VALUES('2','App\\User','12');
INSERT INTO model_has_roles VALUES('2','App\\User','13');
INSERT INTO model_has_roles VALUES('2','App\\User','14');
INSERT INTO model_has_roles VALUES('2','App\\User','15');
INSERT INTO model_has_roles VALUES('5','App\\User','21');
INSERT INTO model_has_roles VALUES('5','App\\User','22');
INSERT INTO model_has_roles VALUES('4','App\\User','23');
INSERT INTO model_has_roles VALUES('2','App\\User','24');
INSERT INTO model_has_roles VALUES('2','App\\User','25');
INSERT INTO model_has_roles VALUES('4','App\\User','26');
INSERT INTO model_has_roles VALUES('2','App\\User','27');
INSERT INTO model_has_roles VALUES('1','App\\User','28');
INSERT INTO model_has_roles VALUES('1','App\\User','29');
INSERT INTO model_has_roles VALUES('1','App\\User','30');
INSERT INTO model_has_roles VALUES('1','App\\User','31');
INSERT INTO model_has_roles VALUES('2','App\\User','32');
INSERT INTO model_has_roles VALUES('2','App\\User','33');
INSERT INTO model_has_roles VALUES('2','App\\User','34');
INSERT INTO model_has_roles VALUES('1','App\\User','36');
INSERT INTO model_has_roles VALUES('2','App\\User','37');
INSERT INTO model_has_roles VALUES('2','App\\User','38');
INSERT INTO model_has_roles VALUES('3','App\\User','39');
INSERT INTO model_has_roles VALUES('1','App\\User','40');
INSERT INTO model_has_roles VALUES('2','App\\User','41');
INSERT INTO model_has_roles VALUES('2','App\\User','42');
INSERT INTO model_has_roles VALUES('2','App\\User','43');
INSERT INTO model_has_roles VALUES('1','App\\User','44');
INSERT INTO model_has_roles VALUES('4','App\\User','45');
INSERT INTO model_has_roles VALUES('1','App\\User','46');
INSERT INTO model_has_roles VALUES('1','App\\User','47');
INSERT INTO model_has_roles VALUES('1','App\\User','48');
INSERT INTO model_has_roles VALUES('2','App\\User','49');
INSERT INTO model_has_roles VALUES('2','App\\User','50');
INSERT INTO model_has_roles VALUES('1','App\\User','51');
INSERT INTO model_has_roles VALUES('3','App\\User','52');
INSERT INTO model_has_roles VALUES('3','App\\User','53');
INSERT INTO model_has_roles VALUES('2','App\\User','54');
INSERT INTO model_has_roles VALUES('2','App\\User','56');
INSERT INTO model_has_roles VALUES('2','App\\User','57');
INSERT INTO model_has_roles VALUES('2','App\\User','58');
INSERT INTO model_has_roles VALUES('2','App\\User','59');
INSERT INTO model_has_roles VALUES('1','App\\User','60');
INSERT INTO model_has_roles VALUES('1','App\\User','61');
INSERT INTO model_has_roles VALUES('1','App\\User','62');
INSERT INTO model_has_roles VALUES('1','App\\User','66');
INSERT INTO model_has_roles VALUES('1','App\\User','67');
INSERT INTO model_has_roles VALUES('1','App\\User','68');



CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `office_shifts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shift_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_shift` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint unsigned NOT NULL,
  `sunday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sunday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saturday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saturday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `friday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `friday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thursday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thursday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wednesday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wednesday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tuesday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tuesday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `office_shifts_company_id_foreign` (`company_id`),
  CONSTRAINT `office_shifts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `official_documents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned DEFAULT NULL,
  `document_type_id` bigint unsigned DEFAULT NULL,
  `added_by` bigint unsigned DEFAULT NULL,
  `document_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identification_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `document_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_date` date NOT NULL,
  `is_notify` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `official_documents_company_id_foreign` (`company_id`),
  KEY `official_documents_document_type_id_foreign` (`document_type_id`),
  KEY `official_documents_added_by_foreign` (`added_by`),
  CONSTRAINT `official_documents_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `official_documents_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `official_documents_document_type_id_foreign` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO password_resets VALUES('new@gmail.com','$2y$10$day4AQ4g8sFvMwhMrTxpJuLXZCpVF2IK9kVS.6qZxeR6b7CVt2eGy','2020-10-06 10:22:35');
INSERT INTO password_resets VALUES('irfanchowdhury80@gmail.com','$2y$10$V9HsEG5w4mzfDA3IDyLbPeEiXnlnNI97uZNdFb.kSC6uiYS6ZuiRu','2023-01-03 13:25:22');



CREATE TABLE `payment_methods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned DEFAULT NULL,
  `method_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_percentage` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_methods_company_id_foreign` (`company_id`),
  CONSTRAINT `payment_methods_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payslips` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payslip_key` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payslip_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` bigint unsigned NOT NULL,
  `company_id` bigint unsigned NOT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `basic_salary` double NOT NULL,
  `net_salary` double NOT NULL,
  `allowances` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `commissions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `loans` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deductions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `overtimes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `other_payments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pension_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pension_amount` double NOT NULL,
  `hours_worked` int NOT NULL,
  `status` tinyint NOT NULL,
  `month_year` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payslips_employee_id_foreign` (`employee_id`),
  CONSTRAINT `payslips_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO permissions VALUES('1','user','web','','');
INSERT INTO permissions VALUES('2','view-user','web','','');
INSERT INTO permissions VALUES('3','edit-user','web','','');
INSERT INTO permissions VALUES('4','delete-user','web','','');
INSERT INTO permissions VALUES('5','last-login-user','web','','');
INSERT INTO permissions VALUES('6','role-access-user','web','','');
INSERT INTO permissions VALUES('7','details-employee','web','','');
INSERT INTO permissions VALUES('8','view-details-employee','web','','');
INSERT INTO permissions VALUES('9','store-details-employee','web','','');
INSERT INTO permissions VALUES('10','modify-details-employee','web','','');
INSERT INTO permissions VALUES('11','customize-setting','web','','');
INSERT INTO permissions VALUES('12','role-access','web','','');
INSERT INTO permissions VALUES('13','general-setting','web','','');
INSERT INTO permissions VALUES('14','view-general-setting','web','','');
INSERT INTO permissions VALUES('15','store-general-setting','web','','');
INSERT INTO permissions VALUES('16','mail-setting','web','','');
INSERT INTO permissions VALUES('17','view-mail-setting','web','','');
INSERT INTO permissions VALUES('18','store-mail-setting','web','','');
INSERT INTO permissions VALUES('19','language-setting','web','','');
INSERT INTO permissions VALUES('20','core_hr','web','','');
INSERT INTO permissions VALUES('21','view-calendar','web','','');
INSERT INTO permissions VALUES('22','promotion','web','','');
INSERT INTO permissions VALUES('23','view-promotion','web','','');
INSERT INTO permissions VALUES('24','store-promotion','web','','');
INSERT INTO permissions VALUES('25','edit-promotion','web','','');
INSERT INTO permissions VALUES('26','delete-promotion','web','','');
INSERT INTO permissions VALUES('27','award','web','','');
INSERT INTO permissions VALUES('28','view-award','web','','');
INSERT INTO permissions VALUES('29','store-award','web','','');
INSERT INTO permissions VALUES('30','edit-award','web','','');
INSERT INTO permissions VALUES('31','delete-award','web','','');
INSERT INTO permissions VALUES('32','transfer','web','','');
INSERT INTO permissions VALUES('33','view-transfer','web','','');
INSERT INTO permissions VALUES('34','store-transfer','web','','');
INSERT INTO permissions VALUES('35','edit-transfer','web','','');
INSERT INTO permissions VALUES('36','delete-transfer','web','','');
INSERT INTO permissions VALUES('37','travel','web','','');
INSERT INTO permissions VALUES('38','view-travel','web','','');
INSERT INTO permissions VALUES('39','store-travel','web','','');
INSERT INTO permissions VALUES('40','edit-travel','web','','');
INSERT INTO permissions VALUES('41','delete-travel','web','','');
INSERT INTO permissions VALUES('42','resignation','web','','');
INSERT INTO permissions VALUES('43','view-resignation','web','','');
INSERT INTO permissions VALUES('44','store-resignation','web','','');
INSERT INTO permissions VALUES('45','edit-resignation','web','','');
INSERT INTO permissions VALUES('46','delete-resignation','web','','');
INSERT INTO permissions VALUES('47','complaint','web','','');
INSERT INTO permissions VALUES('48','view-complaint','web','','');
INSERT INTO permissions VALUES('49','store-complaint','web','','');
INSERT INTO permissions VALUES('50','edit-complaint','web','','');
INSERT INTO permissions VALUES('51','delete-complaint','web','','');
INSERT INTO permissions VALUES('52','warning','web','','');
INSERT INTO permissions VALUES('53','view-warning','web','','');
INSERT INTO permissions VALUES('54','store-warning','web','','');
INSERT INTO permissions VALUES('55','edit-warning','web','','');
INSERT INTO permissions VALUES('56','delete-warning','web','','');
INSERT INTO permissions VALUES('57','termination','web','','');
INSERT INTO permissions VALUES('58','view-termination','web','','');
INSERT INTO permissions VALUES('59','store-termination','web','','');
INSERT INTO permissions VALUES('60','edit-termination','web','','');
INSERT INTO permissions VALUES('61','delete-termination','web','','');
INSERT INTO permissions VALUES('62','timesheet','web','','');
INSERT INTO permissions VALUES('63','attendance','web','','');
INSERT INTO permissions VALUES('64','view-attendance','web','','');
INSERT INTO permissions VALUES('65','edit-attendance','web','','');
INSERT INTO permissions VALUES('66','office_shift','web','','');
INSERT INTO permissions VALUES('67','view-office_shift','web','','');
INSERT INTO permissions VALUES('68','store-office_shift','web','','');
INSERT INTO permissions VALUES('69','edit-office_shift','web','','');
INSERT INTO permissions VALUES('70','delete-office_shift','web','','');
INSERT INTO permissions VALUES('71','holiday','web','','');
INSERT INTO permissions VALUES('72','view-holiday','web','','');
INSERT INTO permissions VALUES('73','store-holiday','web','','');
INSERT INTO permissions VALUES('74','edit-holiday','web','','');
INSERT INTO permissions VALUES('75','delete-holiday','web','','');
INSERT INTO permissions VALUES('76','leave','web','','');
INSERT INTO permissions VALUES('77','view-holiday','web','','');
INSERT INTO permissions VALUES('78','store-holiday','web','','');
INSERT INTO permissions VALUES('79','edit-holiday','web','','');
INSERT INTO permissions VALUES('80','delete-holiday','web','','');
INSERT INTO permissions VALUES('81','payment-module','web','','');
INSERT INTO permissions VALUES('82','view-payslip','web','','');
INSERT INTO permissions VALUES('83','make-payment','web','','');
INSERT INTO permissions VALUES('84','make-bulk_payment','web','','');
INSERT INTO permissions VALUES('85','view-paylist','web','','');
INSERT INTO permissions VALUES('86','set-salary','web','','');
INSERT INTO permissions VALUES('87','hr_report','web','','');
INSERT INTO permissions VALUES('88','report-payslip','web','','');
INSERT INTO permissions VALUES('89','report-attendance','web','','');
INSERT INTO permissions VALUES('90','report-training','web','','');
INSERT INTO permissions VALUES('91','report-project','web','','');
INSERT INTO permissions VALUES('92','report-task','web','','');
INSERT INTO permissions VALUES('93','report-employee','web','','');
INSERT INTO permissions VALUES('94','report-account','web','','');
INSERT INTO permissions VALUES('95','report-deposit','web','','');
INSERT INTO permissions VALUES('96','report-expense','web','','');
INSERT INTO permissions VALUES('97','report-transaction','web','','');
INSERT INTO permissions VALUES('98','recruitment','web','','');
INSERT INTO permissions VALUES('99','job_employer','web','','');
INSERT INTO permissions VALUES('100','view-job_employer','web','','');
INSERT INTO permissions VALUES('101','store-job_employer','web','','');
INSERT INTO permissions VALUES('102','edit-job_employer','web','','');
INSERT INTO permissions VALUES('103','delete-job_employer','web','','');
INSERT INTO permissions VALUES('104','job_post','web','','');
INSERT INTO permissions VALUES('105','view-job_post','web','','');
INSERT INTO permissions VALUES('106','store-job_post','web','','');
INSERT INTO permissions VALUES('107','edit-job_post','web','','');
INSERT INTO permissions VALUES('108','delete-job_post','web','','');
INSERT INTO permissions VALUES('109','job_candidate','web','','');
INSERT INTO permissions VALUES('110','view-job_candidate','web','','');
INSERT INTO permissions VALUES('111','store-job_candidate','web','','');
INSERT INTO permissions VALUES('112','delete-job_candidate','web','','');
INSERT INTO permissions VALUES('113','job_interview','web','','');
INSERT INTO permissions VALUES('114','view-job_interview','web','','');
INSERT INTO permissions VALUES('115','store-job_interview','web','','');
INSERT INTO permissions VALUES('116','delete-job_interview','web','','');
INSERT INTO permissions VALUES('117','project-management','web','','');
INSERT INTO permissions VALUES('118','project','web','','');
INSERT INTO permissions VALUES('119','view-project','web','','');
INSERT INTO permissions VALUES('120','store-project','web','','');
INSERT INTO permissions VALUES('121','edit-project','web','','');
INSERT INTO permissions VALUES('122','delete-project','web','','');
INSERT INTO permissions VALUES('123','task','web','','');
INSERT INTO permissions VALUES('124','view-task','web','','');
INSERT INTO permissions VALUES('125','store-task','web','','');
INSERT INTO permissions VALUES('126','edit-task','web','','');
INSERT INTO permissions VALUES('127','delete-task','web','','');
INSERT INTO permissions VALUES('128','client','web','','');
INSERT INTO permissions VALUES('129','view-client','web','','');
INSERT INTO permissions VALUES('130','store-client','web','','');
INSERT INTO permissions VALUES('131','edit-client','web','','');
INSERT INTO permissions VALUES('132','delete-client','web','','');
INSERT INTO permissions VALUES('133','invoice','web','','');
INSERT INTO permissions VALUES('134','view-invoice','web','','');
INSERT INTO permissions VALUES('135','store-invoice','web','','');
INSERT INTO permissions VALUES('136','edit-invoice','web','','');
INSERT INTO permissions VALUES('137','delete-invoice','web','','');
INSERT INTO permissions VALUES('138','ticket','web','','');
INSERT INTO permissions VALUES('139','view-ticket','web','','');
INSERT INTO permissions VALUES('140','store-ticket','web','','');
INSERT INTO permissions VALUES('141','edit-ticket','web','','');
INSERT INTO permissions VALUES('142','delete-ticket','web','','');
INSERT INTO permissions VALUES('143','import-module','web','','');
INSERT INTO permissions VALUES('144','import-attendance','web','','');
INSERT INTO permissions VALUES('145','import-employee','web','','');
INSERT INTO permissions VALUES('146','file_module','web','','');
INSERT INTO permissions VALUES('147','file_manager','web','','');
INSERT INTO permissions VALUES('148','view-file_manager','web','','');
INSERT INTO permissions VALUES('149','store-file_manager','web','','');
INSERT INTO permissions VALUES('150','edit-file_manager','web','','');
INSERT INTO permissions VALUES('151','delete-file_manager','web','','');
INSERT INTO permissions VALUES('152','view-file_config','web','','');
INSERT INTO permissions VALUES('153','official_document','web','','');
INSERT INTO permissions VALUES('154','view-official_document','web','','');
INSERT INTO permissions VALUES('155','store-official_document','web','','');
INSERT INTO permissions VALUES('156','edit-official_document','web','','');
INSERT INTO permissions VALUES('157','delete-official_document','web','','');
INSERT INTO permissions VALUES('158','event-meeting','web','','');
INSERT INTO permissions VALUES('159','meeting','web','','');
INSERT INTO permissions VALUES('160','view-meeting','web','','');
INSERT INTO permissions VALUES('161','store-meeting','web','','');
INSERT INTO permissions VALUES('162','edit-meeting','web','','');
INSERT INTO permissions VALUES('163','delete-meeting','web','','');
INSERT INTO permissions VALUES('164','event','web','','');
INSERT INTO permissions VALUES('165','view-event','web','','');
INSERT INTO permissions VALUES('166','store-event','web','','');
INSERT INTO permissions VALUES('167','edit-event','web','','');
INSERT INTO permissions VALUES('168','delete-event','web','','');
INSERT INTO permissions VALUES('169','role','web','','');
INSERT INTO permissions VALUES('170','view-role','web','','');
INSERT INTO permissions VALUES('171','store-role','web','','');
INSERT INTO permissions VALUES('172','edit-role','web','','');
INSERT INTO permissions VALUES('173','delete-role','web','','');
INSERT INTO permissions VALUES('174','assign-module','web','','');
INSERT INTO permissions VALUES('175','assign-role','web','','');
INSERT INTO permissions VALUES('176','assign-ticket','web','','');
INSERT INTO permissions VALUES('177','assign-project','web','','');
INSERT INTO permissions VALUES('178','assign-task','web','','');
INSERT INTO permissions VALUES('179','finance','web','','');
INSERT INTO permissions VALUES('180','account','web','','');
INSERT INTO permissions VALUES('181','view-account','web','','');
INSERT INTO permissions VALUES('182','store-account','web','','');
INSERT INTO permissions VALUES('183','edit-account','web','','');
INSERT INTO permissions VALUES('184','delete-account','web','','');
INSERT INTO permissions VALUES('185','view-transaction','web','','');
INSERT INTO permissions VALUES('186','view-balance_transfer','web','','');
INSERT INTO permissions VALUES('187','store-balance_transfer','web','','');
INSERT INTO permissions VALUES('188','expense','web','','');
INSERT INTO permissions VALUES('189','view-expense','web','','');
INSERT INTO permissions VALUES('190','store-expense','web','','');
INSERT INTO permissions VALUES('191','edit-expense','web','','');
INSERT INTO permissions VALUES('192','delete-expense','web','','');
INSERT INTO permissions VALUES('193','deposit','web','','');
INSERT INTO permissions VALUES('194','view-deposit','web','','');
INSERT INTO permissions VALUES('195','store-deposit','web','','');
INSERT INTO permissions VALUES('196','edit-deposit','web','','');
INSERT INTO permissions VALUES('197','delete-deposit','web','','');
INSERT INTO permissions VALUES('198','payer','web','','');
INSERT INTO permissions VALUES('199','view-payer','web','','');
INSERT INTO permissions VALUES('200','store-payer','web','','');
INSERT INTO permissions VALUES('201','edit-payer','web','','');
INSERT INTO permissions VALUES('202','delete-payer','web','','');
INSERT INTO permissions VALUES('203','payee','web','','');
INSERT INTO permissions VALUES('204','view-payee','web','','');
INSERT INTO permissions VALUES('205','store-payee','web','','');
INSERT INTO permissions VALUES('206','edit-payee','web','','');
INSERT INTO permissions VALUES('207','delete-payee','web','','');
INSERT INTO permissions VALUES('208','training_module','web','','');
INSERT INTO permissions VALUES('209','trainer','web','','');
INSERT INTO permissions VALUES('210','view-trainer','web','','');
INSERT INTO permissions VALUES('211','store-trainer','web','','');
INSERT INTO permissions VALUES('212','edit-trainer','web','','');
INSERT INTO permissions VALUES('213','delete-trainer','web','','');
INSERT INTO permissions VALUES('214','training','web','','');
INSERT INTO permissions VALUES('215','view-training','web','','');
INSERT INTO permissions VALUES('216','store-training','web','','');
INSERT INTO permissions VALUES('217','edit-training','web','','');
INSERT INTO permissions VALUES('218','delete-training','web','','');
INSERT INTO permissions VALUES('219','access-module','web','','');
INSERT INTO permissions VALUES('220','access-variable_type','web','','');
INSERT INTO permissions VALUES('221','access-variable_method','web','','');
INSERT INTO permissions VALUES('222','access-language','web','','');
INSERT INTO permissions VALUES('223','announcement','web','','');
INSERT INTO permissions VALUES('224','store-announcement','web','','');
INSERT INTO permissions VALUES('225','edit-announcement','web','','');
INSERT INTO permissions VALUES('226','delete-announcement','web','','');
INSERT INTO permissions VALUES('227','company','web','','');
INSERT INTO permissions VALUES('228','view-company','web','','');
INSERT INTO permissions VALUES('229','store-company','web','','');
INSERT INTO permissions VALUES('230','edit-company','web','','');
INSERT INTO permissions VALUES('231','delete-company','web','','');
INSERT INTO permissions VALUES('232','department','web','','');
INSERT INTO permissions VALUES('233','view-department','web','','');
INSERT INTO permissions VALUES('234','store-department','web','','');
INSERT INTO permissions VALUES('235','edit-department','web','','');
INSERT INTO permissions VALUES('236','delete-department','web','','');
INSERT INTO permissions VALUES('237','designation','web','','');
INSERT INTO permissions VALUES('238','view-designation','web','','');
INSERT INTO permissions VALUES('239','store-designation','web','','');
INSERT INTO permissions VALUES('240','edit-designation','web','','');
INSERT INTO permissions VALUES('241','delete-designation','web','','');
INSERT INTO permissions VALUES('242','location','web','','');
INSERT INTO permissions VALUES('243','view-location','web','','');
INSERT INTO permissions VALUES('244','store-location','web','','');
INSERT INTO permissions VALUES('245','edit-location','web','','');
INSERT INTO permissions VALUES('246','delete-location','web','','');
INSERT INTO permissions VALUES('247','policy','web','','');
INSERT INTO permissions VALUES('248','store-policy','web','','');
INSERT INTO permissions VALUES('249','edit-policy','web','','');
INSERT INTO permissions VALUES('250','delete-policy','web','','');
INSERT INTO permissions VALUES('251','view-cms','web','','');
INSERT INTO permissions VALUES('252','store-cms','web','','');
INSERT INTO permissions VALUES('253','store-user','web','','');
INSERT INTO permissions VALUES('254','delete-attendance','web','','');
INSERT INTO permissions VALUES('255','view-leave','web','','');
INSERT INTO permissions VALUES('256','store-leave','web','','');
INSERT INTO permissions VALUES('257','edit-leave','web','','');
INSERT INTO permissions VALUES('258','delete-leave','web','','');
INSERT INTO permissions VALUES('259','cms','web','','');
INSERT INTO permissions VALUES('260','performance','web','','');
INSERT INTO permissions VALUES('261','goal-type','web','','');
INSERT INTO permissions VALUES('262','view-goal-type','web','','');
INSERT INTO permissions VALUES('263','store-goal-type','web','','');
INSERT INTO permissions VALUES('264','edit-goal-type','web','','');
INSERT INTO permissions VALUES('265','delete-goal-type','web','','');
INSERT INTO permissions VALUES('266','goal-tracking','web','','');
INSERT INTO permissions VALUES('267','view-goal-tracking','web','','');
INSERT INTO permissions VALUES('268','store-goal-tracking','web','','');
INSERT INTO permissions VALUES('269','edit-goal-tracking','web','','');
INSERT INTO permissions VALUES('270','delete-goal-tracking','web','','');
INSERT INTO permissions VALUES('271','indicator','web','','');
INSERT INTO permissions VALUES('272','view-indicator','web','','');
INSERT INTO permissions VALUES('273','store-indicator','web','','');
INSERT INTO permissions VALUES('274','edit-indicator','web','','');
INSERT INTO permissions VALUES('275','delete-indicator','web','','');
INSERT INTO permissions VALUES('276','appraisal','web','','');
INSERT INTO permissions VALUES('277','view-appraisal','web','','');
INSERT INTO permissions VALUES('278','store-appraisal','web','','');
INSERT INTO permissions VALUES('279','edit-appraisal','web','','');
INSERT INTO permissions VALUES('280','delete-appraisal','web','','');
INSERT INTO permissions VALUES('281','assets-and-category','web','','');
INSERT INTO permissions VALUES('282','category','web','','');
INSERT INTO permissions VALUES('283','view-assets-category','web','','');
INSERT INTO permissions VALUES('284','store-assets-category','web','','');
INSERT INTO permissions VALUES('285','edit-assets-category','web','','');
INSERT INTO permissions VALUES('286','delete-assets-category','web','','');
INSERT INTO permissions VALUES('287','assets','web','','');
INSERT INTO permissions VALUES('288','view-assets','web','','');
INSERT INTO permissions VALUES('289','store-assets','web','','');
INSERT INTO permissions VALUES('290','edit-assets','web','','');
INSERT INTO permissions VALUES('291','delete-assets','web','','');
INSERT INTO permissions VALUES('292','daily-attendances','web','','');
INSERT INTO permissions VALUES('293','date-wise-attendances','web','','');
INSERT INTO permissions VALUES('294','monthly-attendances','web','','');
INSERT INTO permissions VALUES('295','set-permission','web','','');
INSERT INTO permissions VALUES('296','get-leave-notification','web','','');
INSERT INTO permissions VALUES('297','report-pension','web','','');



CREATE TABLE `policies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `company_id` bigint unsigned DEFAULT NULL,
  `added_by` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `policies_company_id_foreign` (`company_id`),
  KEY `policies_added_by_foreign` (`added_by`),
  CONSTRAINT `policies_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `project_bugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `title` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `bug_attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_bugs_user_id_foreign` (`user_id`),
  KEY `project_bugs_project_id_foreign` (`project_id`),
  CONSTRAINT `project_bugs_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_bugs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `project_discussions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `project_discussion` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `discussion_attachment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_discussions_user_id_foreign` (`user_id`),
  KEY `project_discussions_project_id_foreign` (`project_id`),
  CONSTRAINT `project_discussions_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `project_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `file_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_attachment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_description` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_files_user_id_foreign` (`user_id`),
  KEY `project_files_project_id_foreign` (`project_id`),
  CONSTRAINT `project_files_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` bigint unsigned DEFAULT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `project_priority` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `summary` mediumtext COLLATE utf8mb4_unicode_ci,
  `project_status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not started',
  `project_note` longtext COLLATE utf8mb4_unicode_ci,
  `project_progress` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_notify` tinyint DEFAULT NULL,
  `added_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_client_id_foreign` (`client_id`),
  KEY `projects_company_id_foreign` (`company_id`),
  KEY `projects_added_by_foreign` (`added_by`),
  CONSTRAINT `projects_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `projects_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE SET NULL,
  CONSTRAINT `projects_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `promotions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `promotion_title` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` bigint unsigned NOT NULL,
  `employee_id` bigint unsigned NOT NULL,
  `promotion_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `promotions_company_id_foreign` (`company_id`),
  KEY `promotions_employee_id_foreign` (`employee_id`),
  CONSTRAINT `promotions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `promotions_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `qualification_education_levels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qualification_education_levels_company_id_foreign` (`company_id`),
  CONSTRAINT `qualification_education_levels_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `qualification_languages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qualification_languages_company_id_foreign` (`company_id`),
  CONSTRAINT `qualification_languages_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `qualification_skills` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qualification_skills_company_id_foreign` (`company_id`),
  CONSTRAINT `qualification_skills_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `resignations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` bigint unsigned DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `employee_id` bigint unsigned DEFAULT NULL,
  `notice_date` date DEFAULT NULL,
  `resignation_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `resignations_company_id_foreign` (`company_id`),
  KEY `resignations_department_id_foreign` (`department_id`),
  KEY `resignations_employee_id_foreign` (`employee_id`),
  CONSTRAINT `resignations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `resignations_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `resignations_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO role_has_permissions VALUES('1','5');
INSERT INTO role_has_permissions VALUES('2','5');
INSERT INTO role_has_permissions VALUES('3','5');
INSERT INTO role_has_permissions VALUES('4','5');
INSERT INTO role_has_permissions VALUES('5','5');
INSERT INTO role_has_permissions VALUES('6','5');
INSERT INTO role_has_permissions VALUES('7','5');
INSERT INTO role_has_permissions VALUES('8','5');
INSERT INTO role_has_permissions VALUES('9','5');
INSERT INTO role_has_permissions VALUES('10','5');
INSERT INTO role_has_permissions VALUES('11','5');
INSERT INTO role_has_permissions VALUES('13','5');
INSERT INTO role_has_permissions VALUES('14','5');
INSERT INTO role_has_permissions VALUES('15','5');
INSERT INTO role_has_permissions VALUES('16','5');
INSERT INTO role_has_permissions VALUES('17','5');
INSERT INTO role_has_permissions VALUES('18','5');
INSERT INTO role_has_permissions VALUES('20','5');
INSERT INTO role_has_permissions VALUES('21','5');
INSERT INTO role_has_permissions VALUES('22','5');
INSERT INTO role_has_permissions VALUES('23','5');
INSERT INTO role_has_permissions VALUES('24','5');
INSERT INTO role_has_permissions VALUES('25','5');
INSERT INTO role_has_permissions VALUES('26','5');
INSERT INTO role_has_permissions VALUES('27','5');
INSERT INTO role_has_permissions VALUES('28','5');
INSERT INTO role_has_permissions VALUES('29','5');
INSERT INTO role_has_permissions VALUES('30','5');
INSERT INTO role_has_permissions VALUES('31','5');
INSERT INTO role_has_permissions VALUES('32','5');
INSERT INTO role_has_permissions VALUES('33','5');
INSERT INTO role_has_permissions VALUES('34','5');
INSERT INTO role_has_permissions VALUES('35','5');
INSERT INTO role_has_permissions VALUES('36','5');
INSERT INTO role_has_permissions VALUES('37','5');
INSERT INTO role_has_permissions VALUES('38','5');
INSERT INTO role_has_permissions VALUES('39','5');
INSERT INTO role_has_permissions VALUES('41','5');
INSERT INTO role_has_permissions VALUES('42','5');
INSERT INTO role_has_permissions VALUES('43','5');
INSERT INTO role_has_permissions VALUES('44','5');
INSERT INTO role_has_permissions VALUES('46','5');
INSERT INTO role_has_permissions VALUES('47','5');
INSERT INTO role_has_permissions VALUES('48','5');
INSERT INTO role_has_permissions VALUES('49','5');
INSERT INTO role_has_permissions VALUES('50','5');
INSERT INTO role_has_permissions VALUES('51','5');
INSERT INTO role_has_permissions VALUES('52','5');
INSERT INTO role_has_permissions VALUES('53','5');
INSERT INTO role_has_permissions VALUES('54','5');
INSERT INTO role_has_permissions VALUES('55','5');
INSERT INTO role_has_permissions VALUES('56','5');
INSERT INTO role_has_permissions VALUES('57','5');
INSERT INTO role_has_permissions VALUES('58','5');
INSERT INTO role_has_permissions VALUES('59','5');
INSERT INTO role_has_permissions VALUES('60','5');
INSERT INTO role_has_permissions VALUES('61','5');
INSERT INTO role_has_permissions VALUES('62','5');
INSERT INTO role_has_permissions VALUES('63','5');
INSERT INTO role_has_permissions VALUES('64','5');
INSERT INTO role_has_permissions VALUES('65','5');
INSERT INTO role_has_permissions VALUES('66','5');
INSERT INTO role_has_permissions VALUES('67','5');
INSERT INTO role_has_permissions VALUES('68','5');
INSERT INTO role_has_permissions VALUES('69','5');
INSERT INTO role_has_permissions VALUES('70','5');
INSERT INTO role_has_permissions VALUES('71','5');
INSERT INTO role_has_permissions VALUES('72','5');
INSERT INTO role_has_permissions VALUES('73','5');
INSERT INTO role_has_permissions VALUES('74','5');
INSERT INTO role_has_permissions VALUES('75','5');
INSERT INTO role_has_permissions VALUES('76','5');
INSERT INTO role_has_permissions VALUES('81','5');
INSERT INTO role_has_permissions VALUES('82','5');
INSERT INTO role_has_permissions VALUES('83','5');
INSERT INTO role_has_permissions VALUES('84','5');
INSERT INTO role_has_permissions VALUES('85','5');
INSERT INTO role_has_permissions VALUES('86','5');
INSERT INTO role_has_permissions VALUES('87','5');
INSERT INTO role_has_permissions VALUES('90','5');
INSERT INTO role_has_permissions VALUES('91','5');
INSERT INTO role_has_permissions VALUES('92','5');
INSERT INTO role_has_permissions VALUES('93','5');
INSERT INTO role_has_permissions VALUES('94','5');
INSERT INTO role_has_permissions VALUES('95','5');
INSERT INTO role_has_permissions VALUES('96','5');
INSERT INTO role_has_permissions VALUES('97','5');
INSERT INTO role_has_permissions VALUES('98','5');
INSERT INTO role_has_permissions VALUES('104','5');
INSERT INTO role_has_permissions VALUES('105','5');
INSERT INTO role_has_permissions VALUES('106','5');
INSERT INTO role_has_permissions VALUES('107','5');
INSERT INTO role_has_permissions VALUES('108','5');
INSERT INTO role_has_permissions VALUES('109','5');
INSERT INTO role_has_permissions VALUES('110','5');
INSERT INTO role_has_permissions VALUES('112','5');
INSERT INTO role_has_permissions VALUES('113','5');
INSERT INTO role_has_permissions VALUES('114','5');
INSERT INTO role_has_permissions VALUES('115','5');
INSERT INTO role_has_permissions VALUES('116','5');
INSERT INTO role_has_permissions VALUES('117','5');
INSERT INTO role_has_permissions VALUES('118','5');
INSERT INTO role_has_permissions VALUES('119','5');
INSERT INTO role_has_permissions VALUES('120','5');
INSERT INTO role_has_permissions VALUES('121','5');
INSERT INTO role_has_permissions VALUES('122','5');
INSERT INTO role_has_permissions VALUES('123','5');
INSERT INTO role_has_permissions VALUES('124','5');
INSERT INTO role_has_permissions VALUES('125','5');
INSERT INTO role_has_permissions VALUES('126','5');
INSERT INTO role_has_permissions VALUES('127','5');
INSERT INTO role_has_permissions VALUES('128','5');
INSERT INTO role_has_permissions VALUES('129','5');
INSERT INTO role_has_permissions VALUES('130','5');
INSERT INTO role_has_permissions VALUES('131','5');
INSERT INTO role_has_permissions VALUES('132','5');
INSERT INTO role_has_permissions VALUES('133','5');
INSERT INTO role_has_permissions VALUES('134','5');
INSERT INTO role_has_permissions VALUES('135','5');
INSERT INTO role_has_permissions VALUES('136','5');
INSERT INTO role_has_permissions VALUES('137','5');
INSERT INTO role_has_permissions VALUES('138','5');
INSERT INTO role_has_permissions VALUES('139','5');
INSERT INTO role_has_permissions VALUES('140','5');
INSERT INTO role_has_permissions VALUES('141','5');
INSERT INTO role_has_permissions VALUES('142','5');
INSERT INTO role_has_permissions VALUES('144','5');
INSERT INTO role_has_permissions VALUES('145','5');
INSERT INTO role_has_permissions VALUES('146','5');
INSERT INTO role_has_permissions VALUES('147','5');
INSERT INTO role_has_permissions VALUES('148','5');
INSERT INTO role_has_permissions VALUES('149','5');
INSERT INTO role_has_permissions VALUES('150','5');
INSERT INTO role_has_permissions VALUES('151','5');
INSERT INTO role_has_permissions VALUES('152','5');
INSERT INTO role_has_permissions VALUES('153','5');
INSERT INTO role_has_permissions VALUES('154','5');
INSERT INTO role_has_permissions VALUES('156','5');
INSERT INTO role_has_permissions VALUES('157','5');
INSERT INTO role_has_permissions VALUES('158','5');
INSERT INTO role_has_permissions VALUES('159','5');
INSERT INTO role_has_permissions VALUES('160','5');
INSERT INTO role_has_permissions VALUES('161','5');
INSERT INTO role_has_permissions VALUES('162','5');
INSERT INTO role_has_permissions VALUES('163','5');
INSERT INTO role_has_permissions VALUES('164','5');
INSERT INTO role_has_permissions VALUES('165','5');
INSERT INTO role_has_permissions VALUES('166','5');
INSERT INTO role_has_permissions VALUES('167','5');
INSERT INTO role_has_permissions VALUES('168','5');
INSERT INTO role_has_permissions VALUES('169','5');
INSERT INTO role_has_permissions VALUES('170','5');
INSERT INTO role_has_permissions VALUES('171','5');
INSERT INTO role_has_permissions VALUES('172','5');
INSERT INTO role_has_permissions VALUES('173','5');
INSERT INTO role_has_permissions VALUES('176','5');
INSERT INTO role_has_permissions VALUES('177','5');
INSERT INTO role_has_permissions VALUES('178','5');
INSERT INTO role_has_permissions VALUES('179','5');
INSERT INTO role_has_permissions VALUES('180','5');
INSERT INTO role_has_permissions VALUES('181','5');
INSERT INTO role_has_permissions VALUES('182','5');
INSERT INTO role_has_permissions VALUES('183','5');
INSERT INTO role_has_permissions VALUES('184','5');
INSERT INTO role_has_permissions VALUES('185','5');
INSERT INTO role_has_permissions VALUES('186','5');
INSERT INTO role_has_permissions VALUES('187','5');
INSERT INTO role_has_permissions VALUES('188','5');
INSERT INTO role_has_permissions VALUES('189','5');
INSERT INTO role_has_permissions VALUES('190','5');
INSERT INTO role_has_permissions VALUES('191','5');
INSERT INTO role_has_permissions VALUES('192','5');
INSERT INTO role_has_permissions VALUES('193','5');
INSERT INTO role_has_permissions VALUES('194','5');
INSERT INTO role_has_permissions VALUES('195','5');
INSERT INTO role_has_permissions VALUES('196','5');
INSERT INTO role_has_permissions VALUES('197','5');
INSERT INTO role_has_permissions VALUES('198','5');
INSERT INTO role_has_permissions VALUES('199','5');
INSERT INTO role_has_permissions VALUES('200','5');
INSERT INTO role_has_permissions VALUES('201','5');
INSERT INTO role_has_permissions VALUES('202','5');
INSERT INTO role_has_permissions VALUES('203','5');
INSERT INTO role_has_permissions VALUES('204','5');
INSERT INTO role_has_permissions VALUES('205','5');
INSERT INTO role_has_permissions VALUES('206','5');
INSERT INTO role_has_permissions VALUES('207','5');
INSERT INTO role_has_permissions VALUES('208','5');
INSERT INTO role_has_permissions VALUES('209','5');
INSERT INTO role_has_permissions VALUES('210','5');
INSERT INTO role_has_permissions VALUES('211','5');
INSERT INTO role_has_permissions VALUES('212','5');
INSERT INTO role_has_permissions VALUES('213','5');
INSERT INTO role_has_permissions VALUES('214','5');
INSERT INTO role_has_permissions VALUES('215','5');
INSERT INTO role_has_permissions VALUES('216','5');
INSERT INTO role_has_permissions VALUES('217','5');
INSERT INTO role_has_permissions VALUES('218','5');
INSERT INTO role_has_permissions VALUES('220','5');
INSERT INTO role_has_permissions VALUES('221','5');
INSERT INTO role_has_permissions VALUES('222','5');
INSERT INTO role_has_permissions VALUES('223','5');
INSERT INTO role_has_permissions VALUES('224','5');
INSERT INTO role_has_permissions VALUES('225','5');
INSERT INTO role_has_permissions VALUES('226','5');
INSERT INTO role_has_permissions VALUES('227','5');
INSERT INTO role_has_permissions VALUES('228','5');
INSERT INTO role_has_permissions VALUES('229','5');
INSERT INTO role_has_permissions VALUES('230','5');
INSERT INTO role_has_permissions VALUES('231','5');
INSERT INTO role_has_permissions VALUES('232','5');
INSERT INTO role_has_permissions VALUES('233','5');
INSERT INTO role_has_permissions VALUES('234','5');
INSERT INTO role_has_permissions VALUES('235','5');
INSERT INTO role_has_permissions VALUES('236','5');
INSERT INTO role_has_permissions VALUES('237','5');
INSERT INTO role_has_permissions VALUES('238','5');
INSERT INTO role_has_permissions VALUES('239','5');
INSERT INTO role_has_permissions VALUES('240','5');
INSERT INTO role_has_permissions VALUES('241','5');
INSERT INTO role_has_permissions VALUES('242','5');
INSERT INTO role_has_permissions VALUES('243','5');
INSERT INTO role_has_permissions VALUES('244','5');
INSERT INTO role_has_permissions VALUES('245','5');
INSERT INTO role_has_permissions VALUES('246','5');
INSERT INTO role_has_permissions VALUES('247','5');
INSERT INTO role_has_permissions VALUES('248','5');
INSERT INTO role_has_permissions VALUES('249','5');
INSERT INTO role_has_permissions VALUES('250','5');
INSERT INTO role_has_permissions VALUES('251','5');
INSERT INTO role_has_permissions VALUES('252','5');
INSERT INTO role_has_permissions VALUES('253','5');
INSERT INTO role_has_permissions VALUES('254','5');
INSERT INTO role_has_permissions VALUES('255','5');
INSERT INTO role_has_permissions VALUES('256','5');
INSERT INTO role_has_permissions VALUES('257','5');
INSERT INTO role_has_permissions VALUES('258','5');
INSERT INTO role_has_permissions VALUES('259','5');
INSERT INTO role_has_permissions VALUES('260','5');
INSERT INTO role_has_permissions VALUES('261','5');
INSERT INTO role_has_permissions VALUES('262','5');
INSERT INTO role_has_permissions VALUES('263','5');
INSERT INTO role_has_permissions VALUES('264','5');
INSERT INTO role_has_permissions VALUES('265','5');
INSERT INTO role_has_permissions VALUES('266','5');
INSERT INTO role_has_permissions VALUES('267','5');
INSERT INTO role_has_permissions VALUES('268','5');
INSERT INTO role_has_permissions VALUES('269','5');
INSERT INTO role_has_permissions VALUES('270','5');
INSERT INTO role_has_permissions VALUES('271','5');
INSERT INTO role_has_permissions VALUES('272','5');
INSERT INTO role_has_permissions VALUES('273','5');
INSERT INTO role_has_permissions VALUES('274','5');
INSERT INTO role_has_permissions VALUES('275','5');
INSERT INTO role_has_permissions VALUES('276','5');
INSERT INTO role_has_permissions VALUES('277','5');
INSERT INTO role_has_permissions VALUES('278','5');
INSERT INTO role_has_permissions VALUES('279','5');
INSERT INTO role_has_permissions VALUES('280','5');
INSERT INTO role_has_permissions VALUES('281','5');
INSERT INTO role_has_permissions VALUES('282','5');
INSERT INTO role_has_permissions VALUES('283','5');
INSERT INTO role_has_permissions VALUES('284','5');
INSERT INTO role_has_permissions VALUES('285','5');
INSERT INTO role_has_permissions VALUES('286','5');
INSERT INTO role_has_permissions VALUES('287','5');
INSERT INTO role_has_permissions VALUES('288','5');
INSERT INTO role_has_permissions VALUES('289','5');
INSERT INTO role_has_permissions VALUES('290','5');
INSERT INTO role_has_permissions VALUES('291','5');
INSERT INTO role_has_permissions VALUES('292','5');
INSERT INTO role_has_permissions VALUES('293','5');
INSERT INTO role_has_permissions VALUES('294','5');
INSERT INTO role_has_permissions VALUES('295','5');
INSERT INTO role_has_permissions VALUES('296','5');
INSERT INTO role_has_permissions VALUES('297','5');
INSERT INTO role_has_permissions VALUES('1','6');
INSERT INTO role_has_permissions VALUES('2','6');
INSERT INTO role_has_permissions VALUES('3','6');
INSERT INTO role_has_permissions VALUES('4','6');
INSERT INTO role_has_permissions VALUES('5','6');
INSERT INTO role_has_permissions VALUES('6','6');
INSERT INTO role_has_permissions VALUES('7','6');
INSERT INTO role_has_permissions VALUES('8','6');
INSERT INTO role_has_permissions VALUES('9','6');
INSERT INTO role_has_permissions VALUES('10','6');
INSERT INTO role_has_permissions VALUES('11','6');
INSERT INTO role_has_permissions VALUES('13','6');
INSERT INTO role_has_permissions VALUES('14','6');
INSERT INTO role_has_permissions VALUES('15','6');
INSERT INTO role_has_permissions VALUES('16','6');
INSERT INTO role_has_permissions VALUES('17','6');
INSERT INTO role_has_permissions VALUES('18','6');
INSERT INTO role_has_permissions VALUES('81','6');
INSERT INTO role_has_permissions VALUES('82','6');
INSERT INTO role_has_permissions VALUES('83','6');
INSERT INTO role_has_permissions VALUES('84','6');
INSERT INTO role_has_permissions VALUES('85','6');
INSERT INTO role_has_permissions VALUES('86','6');
INSERT INTO role_has_permissions VALUES('87','6');
INSERT INTO role_has_permissions VALUES('90','6');
INSERT INTO role_has_permissions VALUES('91','6');
INSERT INTO role_has_permissions VALUES('92','6');
INSERT INTO role_has_permissions VALUES('93','6');
INSERT INTO role_has_permissions VALUES('94','6');
INSERT INTO role_has_permissions VALUES('95','6');
INSERT INTO role_has_permissions VALUES('96','6');
INSERT INTO role_has_permissions VALUES('97','6');
INSERT INTO role_has_permissions VALUES('145','6');
INSERT INTO role_has_permissions VALUES('169','6');
INSERT INTO role_has_permissions VALUES('170','6');
INSERT INTO role_has_permissions VALUES('171','6');
INSERT INTO role_has_permissions VALUES('172','6');
INSERT INTO role_has_permissions VALUES('173','6');
INSERT INTO role_has_permissions VALUES('179','6');
INSERT INTO role_has_permissions VALUES('180','6');
INSERT INTO role_has_permissions VALUES('181','6');
INSERT INTO role_has_permissions VALUES('182','6');
INSERT INTO role_has_permissions VALUES('183','6');
INSERT INTO role_has_permissions VALUES('184','6');
INSERT INTO role_has_permissions VALUES('185','6');
INSERT INTO role_has_permissions VALUES('186','6');
INSERT INTO role_has_permissions VALUES('187','6');
INSERT INTO role_has_permissions VALUES('188','6');
INSERT INTO role_has_permissions VALUES('189','6');
INSERT INTO role_has_permissions VALUES('190','6');
INSERT INTO role_has_permissions VALUES('191','6');
INSERT INTO role_has_permissions VALUES('192','6');
INSERT INTO role_has_permissions VALUES('193','6');
INSERT INTO role_has_permissions VALUES('194','6');
INSERT INTO role_has_permissions VALUES('195','6');
INSERT INTO role_has_permissions VALUES('196','6');
INSERT INTO role_has_permissions VALUES('197','6');
INSERT INTO role_has_permissions VALUES('198','6');
INSERT INTO role_has_permissions VALUES('199','6');
INSERT INTO role_has_permissions VALUES('200','6');
INSERT INTO role_has_permissions VALUES('201','6');
INSERT INTO role_has_permissions VALUES('202','6');
INSERT INTO role_has_permissions VALUES('203','6');
INSERT INTO role_has_permissions VALUES('204','6');
INSERT INTO role_has_permissions VALUES('205','6');
INSERT INTO role_has_permissions VALUES('206','6');
INSERT INTO role_has_permissions VALUES('207','6');
INSERT INTO role_has_permissions VALUES('220','6');
INSERT INTO role_has_permissions VALUES('221','6');
INSERT INTO role_has_permissions VALUES('222','6');
INSERT INTO role_has_permissions VALUES('253','6');
INSERT INTO role_has_permissions VALUES('292','6');
INSERT INTO role_has_permissions VALUES('293','6');
INSERT INTO role_has_permissions VALUES('294','6');
INSERT INTO role_has_permissions VALUES('295','6');
INSERT INTO role_has_permissions VALUES('297','6');



CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO roles VALUES('1','admin','web','Can access and change everything','1','','');
INSERT INTO roles VALUES('2','employee','web','Default access','1','2020-07-26 19:50:45','2020-07-26 19:50:45');
INSERT INTO roles VALUES('3','client','web','When you create a client, this role and associated.','1','2020-10-08 09:10:23','2020-10-08 09:10:23');
INSERT INTO roles VALUES('4','Manager','web','Can Manage','1','2021-02-24 16:24:58','2021-02-24 16:24:58');
INSERT INTO roles VALUES('5','Editor','web','Custom access','1','2021-02-24 16:24:58','2021-02-24 16:24:58');
INSERT INTO roles VALUES('6','HR','web','','1','2021-09-05 09:12:28','2021-09-05 09:12:28');



CREATE TABLE `salary_allowances` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `month_year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_date` date DEFAULT NULL,
  `allowance_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowance_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_taxable` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_allowances_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_allowances_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `salary_basics` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `month_year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_date` date DEFAULT NULL,
  `payslip_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `basic_salary` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_basics_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_basics_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `salary_commissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `month_year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commission_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_date` date DEFAULT NULL,
  `commission_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_commissions_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_commissions_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `salary_deductions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `month_year` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_date` date DEFAULT NULL,
  `deduction_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deduction_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deduction_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_deductions_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_deductions_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `salary_loans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `month_year` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_date` date DEFAULT NULL,
  `loan_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loan_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loan_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loan_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_remaining` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_remaining` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `monthly_payable` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_loans_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_loans_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `salary_other_payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `month_year` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `first_date` date DEFAULT NULL,
  `other_payment_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other_payment_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_other_payments_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_other_payments_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `salary_overtimes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `month_year` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_date` date DEFAULT NULL,
  `overtime_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_days` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `overtime_hours` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `overtime_rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `overtime_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_overtimes_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_overtimes_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `statuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `support_tickets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `employee_id` bigint unsigned DEFAULT NULL,
  `ticket_code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ticket_priority` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `ticket_remarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `ticket_status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ticket_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_notify` tinyint DEFAULT NULL,
  `ticket_attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `support_tickets_ticket_code_unique` (`ticket_code`),
  KEY `support_tickets_company_id_foreign` (`company_id`),
  KEY `support_tickets_department_id_foreign` (`department_id`),
  KEY `support_tickets_employee_id_foreign` (`employee_id`),
  CONSTRAINT `support_tickets_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `support_tickets_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `support_tickets_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `task_discussions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `task_discussion` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_discussions_user_id_foreign` (`user_id`),
  KEY `task_discussions_task_id_foreign` (`task_id`),
  CONSTRAINT `task_discussions_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `task_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `file_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_attachment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_description` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_files_user_id_foreign` (`user_id`),
  KEY `task_files_task_id_foreign` (`task_id`),
  CONSTRAINT `task_files_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `tasks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `task_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` bigint unsigned NOT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `task_hour` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `task_status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not started',
  `task_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `task_progress` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_notify` tinyint DEFAULT NULL,
  `added_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_project_id_foreign` (`project_id`),
  KEY `tasks_company_id_foreign` (`company_id`),
  KEY `tasks_added_by_foreign` (`added_by`),
  CONSTRAINT `tasks_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tasks_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `tax_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `termination_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `termination_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `terminations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` bigint unsigned NOT NULL,
  `terminated_employee` bigint unsigned NOT NULL,
  `termination_type` bigint unsigned DEFAULT NULL,
  `termination_date` date NOT NULL,
  `notice_date` date NOT NULL,
  `status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `terminations_company_id_foreign` (`company_id`),
  KEY `terminations_terminated_employee_foreign` (`terminated_employee`),
  KEY `terminations_termination_type_foreign` (`termination_type`),
  CONSTRAINT `terminations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `terminations_terminated_employee_foreign` FOREIGN KEY (`terminated_employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `terminations_termination_type_foreign` FOREIGN KEY (`termination_type`) REFERENCES `termination_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `ticket_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ticket_comments` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_comments_ticket_id_foreign` (`ticket_id`),
  KEY `ticket_comments_user_id_foreign` (`user_id`),
  CONSTRAINT `ticket_comments_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ticket_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `trainers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci,
  `expertise` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trainers_company_id_foreign` (`company_id`),
  CONSTRAINT `trainers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `training_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `training_cost` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` bigint unsigned DEFAULT NULL,
  `trainer_id` bigint unsigned DEFAULT NULL,
  `training_type_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `training_lists_company_id_foreign` (`company_id`),
  KEY `training_lists_trainer_id_foreign` (`trainer_id`),
  KEY `training_lists_training_type_id_foreign` (`training_type_id`),
  CONSTRAINT `training_lists_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `training_lists_trainer_id_foreign` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `training_lists_training_type_id_foreign` FOREIGN KEY (`training_type_id`) REFERENCES `training_types` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `training_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `training_types_company_id_foreign` (`company_id`),
  CONSTRAINT `training_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `transfers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` bigint unsigned DEFAULT NULL,
  `from_department_id` bigint unsigned DEFAULT NULL,
  `to_department_id` bigint unsigned DEFAULT NULL,
  `employee_id` bigint unsigned DEFAULT NULL,
  `transfer_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transfers_company_id_foreign` (`company_id`),
  KEY `transfers_from_department_id_foreign` (`from_department_id`),
  KEY `transfers_to_department_id_foreign` (`to_department_id`),
  KEY `transfers_employee_id_foreign` (`employee_id`),
  CONSTRAINT `transfers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transfers_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transfers_from_department_id_foreign` FOREIGN KEY (`from_department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transfers_to_department_id_foreign` FOREIGN KEY (`to_department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int unsigned NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `translations_language_id_foreign` (`language_id`),
  CONSTRAINT `translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `travel_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `arrangement_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `travel_types_company_id_foreign` (`company_id`),
  CONSTRAINT `travel_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `travels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` bigint unsigned NOT NULL,
  `employee_id` bigint unsigned NOT NULL,
  `travel_type` bigint unsigned DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `purpose_of_visit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `place_of_visit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expected_budget` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actual_budget` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `travel_mode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `travels_company_id_foreign` (`company_id`),
  KEY `travels_employee_id_foreign` (`employee_id`),
  KEY `travels_travel_type_foreign` (`travel_type`),
  CONSTRAINT `travels_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `travels_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `travels_travel_type_foreign` FOREIGN KEY (`travel_type`) REFERENCES `travel_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_bg` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_users_id` bigint unsigned NOT NULL,
  `is_active` tinyint DEFAULT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login_ip` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_date` timestamp(2) NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_role_users_id_foreign` (`role_users_id`),
  CONSTRAINT `users_role_users_id_foreign` FOREIGN KEY (`role_users_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES('1','Irfan','Chowdhury','admin','irfanchowdhury80@gmail.com','','$2y$10$WcnC16AXG/mNrVBWQGjfoegFO.1wjiIiBv5LxEHR6uQaJYVciYCOa','admin_1639557363.jpg','','1','1','1234','127.0.0.1','2023-05-17 11:55:07.00','l2dFU5ugiSRaEVEvLxqSsbkU1xki89XMwKoB6kvG5jl21nRrWOhYHAiDE2T8','','2022-06-05 14:00:06','');
INSERT INTO users VALUES('9','Sahiba','Khatun','staff','irfanchowdhury80@gmail.com','','$2y$10$49e7SL6g37nIubrws03uJOTMRJHdL.7HIG/UhjJoHSQcRLSfwFt3e','staff_1616582111.jpg','','2','1','387292822','127.0.0.1','2023-02-22 12:38:48.00','','2020-07-27 01:51:54','2023-04-15 14:10:18','');
INSERT INTO users VALUES('10','John','Cena','cena11','johncena@hotmail.com','','$2y$10$8dFCpYwVXgTo2/RFP4z3ZOV9HWygsx/wxLkqVKMgDaYVPXT2RPnSe','','','6','','456372794','::1','2021-09-05 09:14:05.00','','2020-07-27 02:01:39','2021-09-20 16:46:35','');
INSERT INTO users VALUES('11','Neo','Dezhi','neo22','irfanchowdhury434@gmail.com','','$2y$10$fyGur3PCDC5Mi3IeBs3vEe9xDXkGX.jZc..v29W72PSJ.Vk7C4ltC','neo22_1684299998.jpeg','','4','1','67278232','127.0.0.1','2023-05-17 11:07:44.00','','2020-07-27 02:03:25','2023-05-17 11:06:38','');
INSERT INTO users VALUES('12','Bob','Hobart','bob05','bob@ymail.com','','$2y$10$6RcsgFVg1PLJOY8n3VbFAe7oqV/d7.0nqkLdljT0YRnLTlw5/QI9u','','','2','1','4678292','127.0.0.1','2021-11-15 10:12:50.00','','2020-07-27 10:26:35','2021-09-05 09:17:40','');
INSERT INTO users VALUES('13','Alice','Patrica','alicehh4','alicehh4@newmail.com','','$2y$10$etAwdCPWrPMv09LylKoLke5YxWZ4aIS9CgDW9Z8ZmL0Jr.TNcCFF.','','','2','1','8765445698','::1','2021-06-24 22:07:06.00','','2020-07-27 10:28:16','2021-06-24 22:06:50','');
INSERT INTO users VALUES('14','Mayank','Agarwal','mayank06','mayank@gmail.com','','$2y$10$U2jCXdu6YztlaHf/./nbf.mPHDy7gYfK5bhAT8wfu4I7to3SKwX.e','','','2','1','746389982','','','','2020-07-27 10:31:24','2021-04-15 15:19:08','');
INSERT INTO users VALUES('15','Mansoor','Ahmed','mansoor','mansoor@yahoo.com','','$2y$10$MyFyjN2K1QFL89eKuZQHF.xZ17vl0YviZ1q9d4eIORmMmS0gQs2IK','','','2','1','67638299','','','','2020-07-27 10:33:54','2021-04-15 15:20:00','');
INSERT INTO users VALUES('16','Shadat','Ashraf','client','shahadatashraf10@gmail.com','','$2y$10$Cf7ZWz1sJJhWu1C30vOJDO7Y9BQ5f.8Wi2NYV9ITs9f0q9zLY3EbW','client_1623747532.png','','3','1','67651','127.0.0.1','2023-02-19 12:07:30.00','','2020-07-28 20:41:31','2022-10-02 15:21:02','');
INSERT INTO users VALUES('27','Junayet','Istius','junayet95','junayet@gmail.com','','$2y$10$Enzuol2OzlDVbP6qa9SMTuXFkQynA0lA0oBrtD0RaBnvwGoBPfZvG','','','2','1','01829496534','::1','2021-10-04 10:07:23.00','','2021-03-12 16:47:47','2021-10-04 06:59:52','');
INSERT INTO users VALUES('34','Amzad','Hossain','amzad95','amzad@gmail.com','','$2y$10$XwP9HJYYQCYqKZGgvGOH/.d6UjwnGE./LNxJmE8Iw9iynnhvwv67W','','','2','1','01521225124','127.0.0.1','2021-03-28 12:28:36.00','','2021-03-28 11:53:57','2021-03-28 23:29:20','');
INSERT INTO users VALUES('38','Anisul','Islam','anis95','anis95@gmail.com','','$2y$10$L0rV6308zcY.h5hccqw1he3yhTCzXm9oxRtmKVpygk2XM3t1D0tHK','','','2','1','01521222842','::1','2023-01-02 12:44:31.00','','2021-03-28 23:35:27','2021-03-28 23:35:27','');
INSERT INTO users VALUES('39','Kaden','Porter','kaden95','kaden@mailinator.com','','$2y$10$v0ppHd14bDVJKi1.Lgm5qes2H9XkkQEl5Lmdw/lRk.zNtKzYTZ4we','kaden95_1623747054.jpg','','3','1','441234874','127.0.0.1','2021-03-30 07:45:13.00','','2021-03-30 07:42:31','2021-06-15 11:50:54','');
INSERT INTO users VALUES('45','Promi','Chy','promi98','promi98@gmail.com','','$2y$10$x.6xRw4Tv7u6wezVJSWcPuUx7elTP1SSY1DbiBgsQ5DQxotMgO11K','','','4','1','423213234','','','','2021-06-29 23:16:33','2021-06-30 06:27:38','');
INSERT INTO users VALUES('49','Sahiba','Chowdhury','sahiba95','sahiba95@gmail.com','','$2y$10$q24PhrX6QJjYxlf/vij7cuwMR7g3LKncZUFabDmGCQ00iwmU4DWA2','','','2','1','01829640631','','','','2022-02-26 11:00:02','2022-02-26 11:01:28','');
INSERT INTO users VALUES('51','Lacey','Wood','gosofunab','myjof@mailinator.com','','$2y$10$eoqfN2lGpBHXWtj.WztEM.FLLTH0ofOoAWXERZSHC9mwEaf1NXVc6','gosofunab_1648442766.jpg','','1','1','1211334234','','','','2022-03-28 10:46:07','2022-05-24 13:08:37','');
INSERT INTO users VALUES('52','Alyssa','Schwartz','test123','dacuzej@mailinator.com','','$2y$10$RfHfGxADH7F5wxIO5bLBBuP5YVSDOMDhC7RboEbo9.3VIDzqTTes2','','','3','1','43222232123','','','','2022-12-18 13:10:18','2022-12-18 13:10:18','');
INSERT INTO users VALUES('53','Ingrid','Craft','test987','foziwafub@mailinator.com','','$2y$10$gZP0hd4GW/ip.N120sgxDuTyID6DqbXXhYKwH3N81jj/os3tmOCjS','','','3','1','26','','','','2022-12-18 13:45:03','2022-12-18 13:45:03','');
INSERT INTO users VALUES('54','Test','Chowdhury','irfan90','irfanchowdhury123@gmail.com','','$2y$10$nw5zvB5JSSFv9D3P4TrEieqvXsJFKQ3lDva485V15CKI3xLZVYYHu','','','2','1','+8801829498634','','','','2023-01-23 13:39:56','2023-02-14 13:27:03','');
INSERT INTO users VALUES('57','Charissa','David','nocelud','shamim804@gmail.com','','$2y$10$/Jl6PFLhk3m0RVWjtCcoK.c4VQX7yxKZNKkVe7GWLLqGovSmH73dC','','','2','1','43454','','','','2023-04-20 04:25:46','2023-04-20 04:25:46','');
INSERT INTO users VALUES('59','test','User 987','testuser987','test987@gmail.com','','$2y$10$DKRW/NnmpmGvPoUBVktKueNF7Pd1MIC0c1a6P/aIpDlhWG92UGGtm','','','2','1','4536267','','','','2023-05-16 15:33:31','2023-05-16 15:35:30','');



CREATE TABLE `warnings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` bigint unsigned NOT NULL,
  `warning_to` bigint unsigned NOT NULL,
  `warning_type` bigint unsigned DEFAULT NULL,
  `warning_date` date NOT NULL,
  `status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warnings_company_id_foreign` (`company_id`),
  KEY `warnings_warning_to_foreign` (`warning_to`),
  KEY `warnings_warning_type_foreign` (`warning_type`),
  CONSTRAINT `warnings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `warnings_warning_to_foreign` FOREIGN KEY (`warning_to`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `warnings_warning_type_foreign` FOREIGN KEY (`warning_type`) REFERENCES `warnings_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `warnings_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `warning_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


SET foreign_key_checks = 1;