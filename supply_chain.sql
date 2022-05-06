-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 13, 2021 at 03:14 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `supply_chain`
--
CREATE DATABASE IF NOT EXISTS `supply_chain` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `supply_chain`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add wholesaler_reg', 7, 'add_wholesaler_reg'),
(20, 'Can change wholesaler_reg', 7, 'change_wholesaler_reg'),
(21, 'Can delete wholesaler_reg', 7, 'delete_wholesaler_reg'),
(22, 'Can add retailers_reg', 8, 'add_retailers_reg'),
(23, 'Can change retailers_reg', 8, 'change_retailers_reg'),
(24, 'Can delete retailers_reg', 8, 'delete_retailers_reg'),
(25, 'Can add product1', 9, 'add_product1'),
(26, 'Can change product1', 9, 'change_product1'),
(27, 'Can delete product1', 9, 'delete_product1'),
(28, 'Can add wholesaler_buy', 10, 'add_wholesaler_buy'),
(29, 'Can change wholesaler_buy', 10, 'change_wholesaler_buy'),
(30, 'Can delete wholesaler_buy', 10, 'delete_wholesaler_buy'),
(31, 'Can add wsend_prequest', 11, 'add_wsend_prequest'),
(32, 'Can change wsend_prequest', 11, 'change_wsend_prequest'),
(33, 'Can delete wsend_prequest', 11, 'delete_wsend_prequest'),
(34, 'Can add retailer_buy', 12, 'add_retailer_buy'),
(35, 'Can change retailer_buy', 12, 'change_retailer_buy'),
(36, 'Can delete retailer_buy', 12, 'delete_retailer_buy'),
(37, 'Can add rsend_prequest', 13, 'add_rsend_prequest'),
(38, 'Can change rsend_prequest', 13, 'change_rsend_prequest'),
(39, 'Can delete rsend_prequest', 13, 'delete_rsend_prequest'),
(40, 'Can add user_reg', 14, 'add_user_reg'),
(41, 'Can change user_reg', 14, 'change_user_reg'),
(42, 'Can delete user_reg', 14, 'delete_user_reg'),
(43, 'Can add user_buy', 15, 'add_user_buy'),
(44, 'Can change user_buy', 15, 'change_user_buy'),
(45, 'Can delete user_buy', 15, 'delete_user_buy');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(9, 'manufacturer', 'product1'),
(8, 'retailers', 'retailers_reg'),
(12, 'retailers', 'retailer_buy'),
(13, 'retailers', 'rsend_prequest'),
(6, 'sessions', 'session'),
(15, 'user', 'user_buy'),
(14, 'user', 'user_reg'),
(10, 'wholesalers', 'wholesaler_buy'),
(7, 'wholesalers', 'wholesaler_reg'),
(11, 'wholesalers', 'wsend_prequest');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-03-10 06:44:15.089566'),
(2, 'auth', '0001_initial', '2021-03-10 06:44:38.910808'),
(3, 'admin', '0001_initial', '2021-03-10 06:44:44.698418'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-03-10 06:44:44.760818'),
(5, 'contenttypes', '0002_remove_content_type_name', '2021-03-10 06:44:46.742021'),
(6, 'auth', '0002_alter_permission_name_max_length', '2021-03-10 06:44:47.834023'),
(7, 'auth', '0003_alter_user_email_max_length', '2021-03-10 06:44:48.894825'),
(8, 'auth', '0004_alter_user_username_opts', '2021-03-10 06:44:49.050825'),
(9, 'auth', '0005_alter_user_last_login_null', '2021-03-10 06:44:50.127227'),
(10, 'auth', '0006_require_contenttypes_0002', '2021-03-10 06:44:50.174027'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2021-03-10 06:44:50.236427'),
(12, 'auth', '0008_alter_user_username_max_length', '2021-03-10 06:44:51.266029'),
(13, 'auth', '0009_alter_user_last_name_max_length', '2021-03-10 06:44:52.810432'),
(14, 'retailers', '0001_initial', '2021-03-10 06:44:53.652833'),
(15, 'sessions', '0001_initial', '2021-03-10 06:44:55.384436'),
(16, 'wholesalers', '0001_initial', '2021-03-10 06:44:55.930437'),
(17, 'retailers', '0002_auto_20210310_1220', '2021-03-10 06:51:06.486958'),
(18, 'wholesalers', '0002_auto_20210310_1220', '2021-03-10 06:51:07.641360'),
(19, 'manufacturer', '0001_initial', '2021-03-10 12:53:56.603917'),
(20, 'manufacturer', '0002_product1_price', '2021-03-11 11:01:41.848233'),
(21, 'wholesalers', '0003_wholesaler_buy', '2021-03-11 11:24:15.157021'),
(22, 'wholesalers', '0004_wsend_prequest', '2021-03-11 14:35:31.510018'),
(23, 'wholesalers', '0005_wholesaler_buy_product_price', '2021-03-11 17:49:42.213295'),
(24, 'retailers', '0003_retailer_buy', '2021-03-12 10:58:31.179681'),
(25, 'retailers', '0004_rsend_prequest', '2021-03-12 14:13:31.160486'),
(26, 'user', '0001_initial', '2021-03-12 18:12:43.676625'),
(27, 'user', '0002_user_buy', '2021-03-12 18:36:10.641507');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('nwup22tadyo6m16nmigim0pp5pugadyc', 'MDAxMTM2NDE0ZDA1MjhiMjc4OWVmNGFhNWIwMjM4MjNkYzEwY2U2ZDp7InVzZXJpZCI6MSwidW5hbWUxIjoicmFteWEiLCJ1ZW1haWwiOiJyYW15YUBnbWFpbC5jb20iLCJwaWQiOjJ9', '2021-03-25 15:03:32.896188'),
('ww8ejdx4mcj0cd8h8vnjvvlju4vkyde9', 'ZDdlNjFmNzA4YWRhOTUzZmI4NjVmMDM2MzQ5NTlkYmQxZDlhOWYxMzp7InVzZXJpZCI6MywidW5hbWUxIjoibmFuZGh1IiwidWVtYWlsIjoibmFuZGh1QGdtYWlsLmNvbSIsInBpZCI6Mywic2FsZWlkIjozLCJ0b3RhbHF1YW50aXR5IjoiMCIsIndwaWQiOjE0LCJycGlkIjoyfQ==', '2021-03-27 03:04:42.636185');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer_product1`
--

CREATE TABLE IF NOT EXISTS `manufacturer_product1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_type` varchar(300) NOT NULL,
  `brand_name` varchar(300) NOT NULL,
  `category` varchar(300) NOT NULL,
  `pname` varchar(300) NOT NULL,
  `quantity` varchar(300) NOT NULL,
  `product_image` varchar(100) NOT NULL,
  `mstatus` varchar(300) NOT NULL,
  `pstatus` varchar(300) NOT NULL,
  `price` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `manufacturer_product1`
--

INSERT INTO `manufacturer_product1` (`id`, `vehicle_type`, `brand_name`, `category`, `pname`, `quantity`, `product_image`, `mstatus`, `pstatus`, `price`) VALUES
(2, 'car', 'yamaha', 'air_Conditioning_Heating', 'ac_compressor', '10', 'ac_compressor_dxmMhdx.jpg', 'completed', 'release', '5000'),
(3, 'car', 'honda', 'air_Conditioning_Heating', 'ac_compressor', '20', 'ac_compressor1.jpg', 'completed', 'release', '5000');

-- --------------------------------------------------------

--
-- Table structure for table `retailers_retailers_reg`
--

CREATE TABLE IF NOT EXISTS `retailers_retailers_reg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(300) NOT NULL,
  `lname` varchar(300) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `uname` varchar(200) NOT NULL,
  `password` varchar(400) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `retailers_retailers_reg`
--

INSERT INTO `retailers_retailers_reg` (`id`, `fname`, `lname`, `email`, `phone`, `uname`, `password`) VALUES
(1, 'bhuvana', 's', 'bhuvana@gmail.com', '8978676667', 'bhuvana', 'bhuvana'),
(2, 'raju', 'r', 'raju@gmail.com', '8767565656', 'raju', 'raju'),
(3, 'ramu', 'r', 'ramu@gmail.com', '8767564545', 'ramu', 'ramu'),
(4, 'lakshmana', 'k', 'lakshmana@gmail.com', '67565656565', 'lakshmana', 'lakshmana');

-- --------------------------------------------------------

--
-- Table structure for table `retailers_retailer_buy`
--

CREATE TABLE IF NOT EXISTS `retailers_retailer_buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` varchar(300) NOT NULL,
  `rname` varchar(300) NOT NULL,
  `mainproductid` varchar(300) NOT NULL,
  `pid` varchar(300) NOT NULL,
  `vehicle_type` varchar(300) NOT NULL,
  `brand_name` varchar(200) NOT NULL,
  `category` varchar(200) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `quantity` varchar(400) NOT NULL,
  `perproduct_price` varchar(400) NOT NULL,
  `total_price` varchar(400) NOT NULL,
  `update_price` varchar(400) NOT NULL,
  `cardnumber` varchar(400) NOT NULL,
  `cvv` varchar(400) NOT NULL,
  `card_holder` varchar(400) NOT NULL,
  `validity_date` varchar(400) NOT NULL,
  `product_price` varchar(400) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `retailers_retailer_buy`
--

INSERT INTO `retailers_retailer_buy` (`id`, `rid`, `rname`, `mainproductid`, `pid`, `vehicle_type`, `brand_name`, `category`, `product_name`, `quantity`, `perproduct_price`, `total_price`, `update_price`, `cardnumber`, `cvv`, `card_holder`, `validity_date`, `product_price`) VALUES
(1, '1', 'bhuvana', '2', '11', 'car', 'yamaha', 'air_Conditioning_Heating', 'ac_compressor', '0', '6000', '30000', '', '8767565656', '765', 'bhuvana', '12-09-2029', '7000'),
(2, '3', 'ramu', '3', '14', 'car', 'honda', 'air_Conditioning_Heating', 'ac_compressor', '0', '8000', '40000', '', '876756565656', '6756', 'saravana', '23-09-2030', '9000');

-- --------------------------------------------------------

--
-- Table structure for table `retailers_rsend_prequest`
--

CREATE TABLE IF NOT EXISTS `retailers_rsend_prequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` varchar(300) NOT NULL,
  `rname` varchar(300) NOT NULL,
  `wid` varchar(300) NOT NULL,
  `wname` varchar(300) NOT NULL,
  `buyunid` varchar(300) NOT NULL,
  `mainpid` varchar(300) NOT NULL,
  `vehicle_type` varchar(300) NOT NULL,
  `brand_name` varchar(200) NOT NULL,
  `category` varchar(200) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `request_status` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `retailers_rsend_prequest`
--

INSERT INTO `retailers_rsend_prequest` (`id`, `rid`, `rname`, `wid`, `wname`, `buyunid`, `mainpid`, `vehicle_type`, `brand_name`, `category`, `product_name`, `request_status`) VALUES
(2, '1', 'bhuvana', '1', 'ramya', '11', '2', 'car', 'yamaha', 'air_Conditioning_Heating', 'ac_compressor', 'pending'),
(3, '1', 'bhuvana', '1', 'bhuvana', '1', '2', 'car', 'yamaha', 'air_Conditioning_Heating', 'ac_compressor', 'pending'),
(4, '1', 'bhuvana', '1', 'bhuvana', '1', '2', 'car', 'yamaha', 'air_Conditioning_Heating', 'ac_compressor', 'pending'),
(5, '3', 'ramu', '3', 'ramu', '2', '3', 'car', 'honda', 'air_Conditioning_Heating', 'ac_compressor', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `user_user_buy`
--

CREATE TABLE IF NOT EXISTS `user_user_buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(300) NOT NULL,
  `uname` varchar(300) NOT NULL,
  `mainproductid` varchar(300) NOT NULL,
  `pid` varchar(300) NOT NULL,
  `vehicle_type` varchar(300) NOT NULL,
  `brand_name` varchar(200) NOT NULL,
  `category` varchar(200) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `quantity` varchar(400) NOT NULL,
  `perproduct_price` varchar(400) NOT NULL,
  `total_price` varchar(400) NOT NULL,
  `update_price` varchar(400) NOT NULL,
  `cardnumber` varchar(400) NOT NULL,
  `cvv` varchar(400) NOT NULL,
  `card_holder` varchar(400) NOT NULL,
  `validity_date` varchar(400) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user_user_buy`
--

INSERT INTO `user_user_buy` (`id`, `uid`, `uname`, `mainproductid`, `pid`, `vehicle_type`, `brand_name`, `category`, `product_name`, `quantity`, `perproduct_price`, `total_price`, `update_price`, `cardnumber`, `cvv`, `card_holder`, `validity_date`) VALUES
(1, '1', 'priya', '11', '1', 'car', 'yamaha', 'air_Conditioning_Heating', 'ac_compressor', '3', '7000', '21000', '', '', '', '', ''),
(2, '1', 'priya', '11', '1', 'car', 'yamaha', 'air_Conditioning_Heating', 'ac_compressor', '2', '7000', '14000', '', '8756765665', '676', 'priya', '12-09-2039'),
(3, '2', 'rani', '14', '2', 'car', 'honda', 'air_Conditioning_Heating', 'ac_compressor', '5', '9000', '45000', '', '5463264367672', '654', 'rani', '23-09-2030');

-- --------------------------------------------------------

--
-- Table structure for table `user_user_reg`
--

CREATE TABLE IF NOT EXISTS `user_user_reg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(300) NOT NULL,
  `lname` varchar(300) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `uname` varchar(200) NOT NULL,
  `password` varchar(400) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user_user_reg`
--

INSERT INTO `user_user_reg` (`id`, `fname`, `lname`, `email`, `phone`, `uname`, `password`) VALUES
(1, 'priya', 'p', 'priya@gmail.com', '9878676767', 'priya', 'priya'),
(2, 'rani', 'r', 'rani@gmail.com', '8978676767', 'rani', 'rani'),
(3, 'anbu', 'a', 'anbu@gmail.com', '8767565656', 'anbu', 'anbu');

-- --------------------------------------------------------

--
-- Table structure for table `wholesalers_wholesaler_buy`
--

CREATE TABLE IF NOT EXISTS `wholesalers_wholesaler_buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` varchar(300) NOT NULL,
  `wname` varchar(300) NOT NULL,
  `pid` varchar(300) NOT NULL,
  `vehicle_type` varchar(300) NOT NULL,
  `brand_name` varchar(200) NOT NULL,
  `category` varchar(200) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `quantity` varchar(400) NOT NULL,
  `perproduct_price` varchar(400) NOT NULL,
  `total_price` varchar(400) NOT NULL,
  `cardnumber` varchar(400) NOT NULL,
  `cvv` varchar(400) NOT NULL,
  `card_holder` varchar(400) NOT NULL,
  `validity_date` varchar(400) NOT NULL,
  `product_price` varchar(400) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `wholesalers_wholesaler_buy`
--

INSERT INTO `wholesalers_wholesaler_buy` (`id`, `wid`, `wname`, `pid`, `vehicle_type`, `brand_name`, `category`, `product_name`, `quantity`, `perproduct_price`, `total_price`, `cardnumber`, `cvv`, `card_holder`, `validity_date`, `product_price`) VALUES
(11, '1', 'ramya', '2', 'car', 'yamaha', 'air_Conditioning_Heating', 'ac_compressor', '0', '5000', '25000', '4534235454545', '567', 'ramya', '12-09-2025', '6000'),
(12, '2', 'deva', '2', 'car', 'yamaha', 'air_Conditioning_Heating', 'ac_compressor', '0', '5000', '150000', '6756675656', '656', 'deva', '12-09-2029', '6000'),
(13, '1', 'ramya', '2', 'car', 'yamaha', 'air_Conditioning_Heating', 'ac_compressor', '0', '5000', '50000', '6756675656', '567', 'ramya', '23-09-2029', '6000'),
(14, '3', 'nandhu', '3', 'car', 'honda', 'air_Conditioning_Heating', 'ac_compressor', '0', '5000', '25000', '8978675656', '654', 'nandhu', '23-09-2030', '8000');

-- --------------------------------------------------------

--
-- Table structure for table `wholesalers_wholesaler_reg`
--

CREATE TABLE IF NOT EXISTS `wholesalers_wholesaler_reg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(300) NOT NULL,
  `lname` varchar(300) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `uname` varchar(200) NOT NULL,
  `password` varchar(400) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `wholesalers_wholesaler_reg`
--

INSERT INTO `wholesalers_wholesaler_reg` (`id`, `fname`, `lname`, `email`, `phone`, `uname`, `password`) VALUES
(1, 'ramya', 'r', 'ramya@gmail.com', '8767565656', 'ramya', 'ramya'),
(2, 'deva', 'deva', 'deva@gmail.com', '7867675656', 'deva', 'deva'),
(3, 'nandhu', 'n', 'nandhu@gmail.com', '8978675656', 'nandhu', 'nandhu');

-- --------------------------------------------------------

--
-- Table structure for table `wholesalers_wsend_prequest`
--

CREATE TABLE IF NOT EXISTS `wholesalers_wsend_prequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` varchar(300) NOT NULL,
  `wname` varchar(300) NOT NULL,
  `pid` varchar(300) NOT NULL,
  `vehicle_type` varchar(300) NOT NULL,
  `brand_name` varchar(200) NOT NULL,
  `category` varchar(200) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `request_status` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `wholesalers_wsend_prequest`
--

INSERT INTO `wholesalers_wsend_prequest` (`id`, `wid`, `wname`, `pid`, `vehicle_type`, `brand_name`, `category`, `product_name`, `request_status`) VALUES
(1, '1', 'ramya', '2', 'car', 'yamaha', 'air_Conditioning_Heating', 'ac_compressor', 'completed'),
(2, '1', 'ramya', '2', 'car', 'yamaha', 'air_Conditioning_Heating', 'ac_compressor', 'completed'),
(3, '1', 'ramya', '2', 'car', 'yamaha', 'air_Conditioning_Heating', 'ac_compressor', 'completed'),
(4, '1', 'ramya', '2', 'car', 'yamaha', 'air_Conditioning_Heating', 'ac_compressor', 'pending'),
(5, '3', 'nandhu', '3', 'car', 'honda', 'air_Conditioning_Heating', 'ac_compressor', 'completed');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
