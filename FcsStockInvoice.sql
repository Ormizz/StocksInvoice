-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 23, 2023 at 01:14 AM
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
-- Database: `FcsStockInvoice`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'DG'),
(3, 'Gestion'),
(2, 'Secretaire');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add article', 1, 'add_article'),
(2, 'Can change article', 1, 'change_article'),
(3, 'Can delete article', 1, 'delete_article'),
(4, 'Can view article', 1, 'view_article'),
(5, 'Can add client', 2, 'add_client'),
(6, 'Can change client', 2, 'change_client'),
(7, 'Can delete client', 2, 'delete_client'),
(8, 'Can view client', 2, 'view_client'),
(9, 'Can add fournisseur', 3, 'add_fournisseur'),
(10, 'Can change fournisseur', 3, 'change_fournisseur'),
(11, 'Can delete fournisseur', 3, 'delete_fournisseur'),
(12, 'Can view fournisseur', 3, 'view_fournisseur'),
(13, 'Can add facture', 4, 'add_facture'),
(14, 'Can change facture', 4, 'change_facture'),
(15, 'Can delete facture', 4, 'delete_facture'),
(16, 'Can view facture', 4, 'view_facture'),
(17, 'Can add detail facture', 5, 'add_detailfacture'),
(18, 'Can change detail facture', 5, 'change_detailfacture'),
(19, 'Can delete detail facture', 5, 'delete_detailfacture'),
(20, 'Can view detail facture', 5, 'view_detailfacture'),
(21, 'Can add approvisionnement', 6, 'add_approvisionnement'),
(22, 'Can change approvisionnement', 6, 'change_approvisionnement'),
(23, 'Can delete approvisionnement', 6, 'delete_approvisionnement'),
(24, 'Can view approvisionnement', 6, 'view_approvisionnement'),
(25, 'Can add detail approvisionnement', 7, 'add_detailapprovisionnement'),
(26, 'Can change detail approvisionnement', 7, 'change_detailapprovisionnement'),
(27, 'Can delete detail approvisionnement', 7, 'delete_detailapprovisionnement'),
(28, 'Can view detail approvisionnement', 7, 'view_detailapprovisionnement'),
(29, 'confirmer les approvisionnements', 7, 'confirm_appro'),
(30, 'Can add commande client', 8, 'add_commandeclient'),
(31, 'Can change commande client', 8, 'change_commandeclient'),
(32, 'Can delete commande client', 8, 'delete_commandeclient'),
(33, 'Can view commande client', 8, 'view_commandeclient'),
(34, 'Can add ligne commande client', 9, 'add_lignecommandeclient'),
(35, 'Can change ligne commande client', 9, 'change_lignecommandeclient'),
(36, 'Can delete ligne commande client', 9, 'delete_lignecommandeclient'),
(37, 'Can view ligne commande client', 9, 'view_lignecommandeclient'),
(38, 'Can add besoin', 10, 'add_besoin'),
(39, 'Can change besoin', 10, 'change_besoin'),
(40, 'Can delete besoin', 10, 'delete_besoin'),
(41, 'Can view besoin', 10, 'view_besoin'),
(42, 'Can add user plus', 11, 'add_userplus'),
(43, 'Can change user plus', 11, 'change_userplus'),
(44, 'Can delete user plus', 11, 'delete_userplus'),
(45, 'Can view user plus', 11, 'view_userplus'),
(46, 'Can add log entry', 12, 'add_logentry'),
(47, 'Can change log entry', 12, 'change_logentry'),
(48, 'Can delete log entry', 12, 'delete_logentry'),
(49, 'Can view log entry', 12, 'view_logentry'),
(50, 'Can add permission', 13, 'add_permission'),
(51, 'Can change permission', 13, 'change_permission'),
(52, 'Can delete permission', 13, 'delete_permission'),
(53, 'Can view permission', 13, 'view_permission'),
(54, 'Can add group', 14, 'add_group'),
(55, 'Can change group', 14, 'change_group'),
(56, 'Can delete group', 14, 'delete_group'),
(57, 'Can view group', 14, 'view_group'),
(58, 'Can add user', 15, 'add_user'),
(59, 'Can change user', 15, 'change_user'),
(60, 'Can delete user', 15, 'delete_user'),
(61, 'Can view user', 15, 'view_user'),
(62, 'Can add content type', 16, 'add_contenttype'),
(63, 'Can change content type', 16, 'change_contenttype'),
(64, 'Can delete content type', 16, 'delete_contenttype'),
(65, 'Can view content type', 16, 'view_contenttype'),
(66, 'Can add session', 17, 'add_session'),
(67, 'Can change session', 17, 'change_session'),
(68, 'Can delete session', 17, 'delete_session'),
(69, 'Can view session', 17, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$hQP7085UV7fr1xA2JtjBpR$4+UZSdvYpRkI8nhOJdPrmCbN4Z5DU+bbMoIkq5L9Zmk=', '2023-09-16 16:43:01.000000', 1, 'admin', '', '', 'admin@admin.com', 1, 1, '2023-09-16 16:40:41.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-09-16 16:42:15.579982', '1', 'DG', 1, '[{\"added\": {}}]', 14, 1),
(2, '2023-09-16 16:42:25.494398', '2', 'Secretaire', 1, '[{\"added\": {}}]', 14, 1),
(3, '2023-09-16 16:42:40.677998', '3', 'Gestion', 1, '[{\"added\": {}}]', 14, 1),
(4, '2023-09-16 16:43:32.973705', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(12, 'admin', 'logentry'),
(14, 'auth', 'group'),
(13, 'auth', 'permission'),
(15, 'auth', 'user'),
(16, 'contenttypes', 'contenttype'),
(6, 'MyApp', 'approvisionnement'),
(1, 'MyApp', 'article'),
(10, 'MyApp', 'besoin'),
(2, 'MyApp', 'client'),
(8, 'MyApp', 'commandeclient'),
(7, 'MyApp', 'detailapprovisionnement'),
(5, 'MyApp', 'detailfacture'),
(4, 'MyApp', 'facture'),
(3, 'MyApp', 'fournisseur'),
(9, 'MyApp', 'lignecommandeclient'),
(11, 'MyApp', 'userplus'),
(17, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-09-16 16:38:26.501896'),
(2, 'auth', '0001_initial', '2023-09-16 16:38:26.695321'),
(3, 'MyApp', '0001_initial', '2023-09-16 16:38:26.815059'),
(4, 'MyApp', '0002_commandefournisseur_remove_article_fournisseur_and_more', '2023-09-16 16:38:26.960649'),
(5, 'MyApp', '0003_alter_detailfacture_article', '2023-09-16 16:38:27.090649'),
(6, 'MyApp', '0004_approvisionnement_detailapprovisionnement_and_more', '2023-09-16 16:38:27.166694'),
(7, 'MyApp', '0005_detailapprovisionnement_montant_total_article', '2023-09-16 16:38:27.181128'),
(8, 'MyApp', '0006_approvisionnement_montant_total', '2023-09-16 16:38:27.192631'),
(9, 'MyApp', '0007_commandeclient_lignecommandeclient_and_more', '2023-09-16 16:38:27.391519'),
(10, 'MyApp', '0008_remove_commandeclient_client_commandeclient_client', '2023-09-16 16:38:27.425650'),
(11, 'MyApp', '0009_alter_commandeclient_date_commande', '2023-09-16 16:38:27.449713'),
(12, 'MyApp', '0010_lignecommandeclient_description', '2023-09-16 16:38:27.471163'),
(13, 'MyApp', '0011_remove_commandeclient_numero_commande', '2023-09-16 16:38:27.483463'),
(14, 'MyApp', '0012_detailapprovisionnement_statut_and_more', '2023-09-16 16:38:27.524054'),
(15, 'MyApp', '0013_besoin', '2023-09-16 16:38:27.538034'),
(16, 'MyApp', '0014_userplus', '2023-09-16 16:38:27.578131'),
(17, 'MyApp', '0015_alter_besoin_statut_alter_commandeclient_statut', '2023-09-16 16:38:27.600789'),
(18, 'MyApp', '0016_alter_detailapprovisionnement_options_and_more', '2023-09-16 16:38:27.754019'),
(19, 'MyApp', '0017_alter_approvisionnement_fournisseur_and_more', '2023-09-16 16:38:28.029828'),
(20, 'admin', '0001_initial', '2023-09-16 16:38:28.091585'),
(21, 'admin', '0002_logentry_remove_auto_add', '2023-09-16 16:38:28.103741'),
(22, 'admin', '0003_logentry_add_action_flag_choices', '2023-09-16 16:38:28.112867'),
(23, 'contenttypes', '0002_remove_content_type_name', '2023-09-16 16:38:28.152446'),
(24, 'auth', '0002_alter_permission_name_max_length', '2023-09-16 16:38:28.183862'),
(25, 'auth', '0003_alter_user_email_max_length', '2023-09-16 16:38:28.198333'),
(26, 'auth', '0004_alter_user_username_opts', '2023-09-16 16:38:28.205555'),
(27, 'auth', '0005_alter_user_last_login_null', '2023-09-16 16:38:28.224589'),
(28, 'auth', '0006_require_contenttypes_0002', '2023-09-16 16:38:28.226162'),
(29, 'auth', '0007_alter_validators_add_error_messages', '2023-09-16 16:38:28.233493'),
(30, 'auth', '0008_alter_user_username_max_length', '2023-09-16 16:38:28.248172'),
(31, 'auth', '0009_alter_user_last_name_max_length', '2023-09-16 16:38:28.263247'),
(32, 'auth', '0010_alter_group_name_max_length', '2023-09-16 16:38:28.279794'),
(33, 'auth', '0011_update_proxy_permissions', '2023-09-16 16:38:28.294151'),
(34, 'auth', '0012_alter_user_first_name_max_length', '2023-09-16 16:38:28.308756'),
(35, 'sessions', '0001_initial', '2023-09-16 16:38:28.329765');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('m2p8a73prfu2zqvt4yrk80mp47j2le2k', '.eJxVjEEOwiAQRe_C2hAYKJ26dO8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3EWWpx-t0DxwXUH6U711mRsdV3mIHdFHrTLa0v8vBzu30GhXr71ZAZnNDAbjhoVjWQQrMXIhhQAWsous7OIkMmRnlhHa9MQUAHCGMX7A8gSN0A:1qhYNp:sbxAoqQ7ChaFhsm3w8Gq1YO7ToRemjyE0MDV-pKyRc8', '2023-09-30 16:43:01.609010');

-- --------------------------------------------------------

--
-- Table structure for table `MyApp_approvisionnement`
--

CREATE TABLE `MyApp_approvisionnement` (
  `id` bigint(20) NOT NULL,
  `fournisseur` varchar(255) NOT NULL,
  `date_approvisionnement` date NOT NULL,
  `statut` varchar(20) NOT NULL,
  `montant_total` decimal(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MyApp_article`
--

CREATE TABLE `MyApp_article` (
  `id` bigint(20) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `quantite_en_stock` int(10) UNSIGNED NOT NULL CHECK (`quantite_en_stock` >= 0),
  `prix_unitaire` decimal(10,2) NOT NULL,
  `categorie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MyApp_besoin`
--

CREATE TABLE `MyApp_besoin` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `date_creation` datetime(6) NOT NULL,
  `statut` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MyApp_client`
--

CREATE TABLE `MyApp_client` (
  `id` bigint(20) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `adresse` varchar(200) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `email` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MyApp_commandeclient`
--

CREATE TABLE `MyApp_commandeclient` (
  `id` bigint(20) NOT NULL,
  `date_commande` date NOT NULL,
  `statut` varchar(255) NOT NULL,
  `montant_total` decimal(20,2) DEFAULT NULL,
  `client` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MyApp_detailapprovisionnement`
--

CREATE TABLE `MyApp_detailapprovisionnement` (
  `id` bigint(20) NOT NULL,
  `quantite` int(10) UNSIGNED NOT NULL CHECK (`quantite` >= 0),
  `prix_unitaire` decimal(20,2) NOT NULL,
  `approvisionnement_id` bigint(20) NOT NULL,
  `article_id` bigint(20) NOT NULL,
  `montant_total_article` decimal(20,2) DEFAULT NULL,
  `statut` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MyApp_detailfacture`
--

CREATE TABLE `MyApp_detailfacture` (
  `id` bigint(20) NOT NULL,
  `quantite_vendue` int(10) UNSIGNED NOT NULL CHECK (`quantite_vendue` >= 0),
  `prix_unitaire_vente` decimal(20,2) NOT NULL,
  `montant_total_article` decimal(20,2) NOT NULL,
  `article` varchar(255) NOT NULL,
  `facture_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MyApp_facture`
--

CREATE TABLE `MyApp_facture` (
  `id` bigint(20) NOT NULL,
  `numero_facture` varchar(255) NOT NULL,
  `date_facturation` date NOT NULL,
  `montant_total` decimal(20,2) NOT NULL,
  `client` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MyApp_fournisseur`
--

CREATE TABLE `MyApp_fournisseur` (
  `id` bigint(20) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `adresse` varchar(200) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `email` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MyApp_lignecommandeclient`
--

CREATE TABLE `MyApp_lignecommandeclient` (
  `id` bigint(20) NOT NULL,
  `quantite` int(10) UNSIGNED NOT NULL CHECK (`quantite` >= 0),
  `prix_unitaire` decimal(20,2) NOT NULL,
  `montant_total_article` decimal(20,2) DEFAULT NULL,
  `article_id` bigint(20) NOT NULL,
  `commande_id` bigint(20) NOT NULL,
  `description` longtext NOT NULL,
  `statut` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MyApp_userplus`
--

CREATE TABLE `MyApp_userplus` (
  `id` bigint(20) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `status` varchar(25) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `MyApp_approvisionnement`
--
ALTER TABLE `MyApp_approvisionnement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `MyApp_article`
--
ALTER TABLE `MyApp_article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `MyApp_besoin`
--
ALTER TABLE `MyApp_besoin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `MyApp_client`
--
ALTER TABLE `MyApp_client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `MyApp_commandeclient`
--
ALTER TABLE `MyApp_commandeclient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `MyApp_detailapprovisionnement`
--
ALTER TABLE `MyApp_detailapprovisionnement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `MyApp_detailapprovis_approvisionnement_id_839953a4_fk_MyApp_app` (`approvisionnement_id`),
  ADD KEY `MyApp_detailapprovis_article_id_1ed9d36e_fk_MyApp_art` (`article_id`);

--
-- Indexes for table `MyApp_detailfacture`
--
ALTER TABLE `MyApp_detailfacture`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `MyApp_detailfacture_article_f8da4789_uniq` (`article`),
  ADD KEY `MyApp_detailfacture_facture_id_8a8883aa_fk_MyApp_facture_id` (`facture_id`);

--
-- Indexes for table `MyApp_facture`
--
ALTER TABLE `MyApp_facture`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_facture` (`numero_facture`);

--
-- Indexes for table `MyApp_fournisseur`
--
ALTER TABLE `MyApp_fournisseur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `MyApp_lignecommandeclient`
--
ALTER TABLE `MyApp_lignecommandeclient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `MyApp_lignecommandec_article_id_ad4b5298_fk_MyApp_art` (`article_id`),
  ADD KEY `MyApp_lignecommandec_commande_id_1fd5bea1_fk_MyApp_com` (`commande_id`);

--
-- Indexes for table `MyApp_userplus`
--
ALTER TABLE `MyApp_userplus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `MyApp_approvisionnement`
--
ALTER TABLE `MyApp_approvisionnement`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `MyApp_article`
--
ALTER TABLE `MyApp_article`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `MyApp_besoin`
--
ALTER TABLE `MyApp_besoin`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `MyApp_client`
--
ALTER TABLE `MyApp_client`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `MyApp_commandeclient`
--
ALTER TABLE `MyApp_commandeclient`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `MyApp_detailapprovisionnement`
--
ALTER TABLE `MyApp_detailapprovisionnement`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `MyApp_detailfacture`
--
ALTER TABLE `MyApp_detailfacture`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `MyApp_facture`
--
ALTER TABLE `MyApp_facture`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `MyApp_fournisseur`
--
ALTER TABLE `MyApp_fournisseur`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `MyApp_lignecommandeclient`
--
ALTER TABLE `MyApp_lignecommandeclient`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `MyApp_userplus`
--
ALTER TABLE `MyApp_userplus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

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
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `MyApp_detailapprovisionnement`
--
ALTER TABLE `MyApp_detailapprovisionnement`
  ADD CONSTRAINT `MyApp_detailapprovis_approvisionnement_id_839953a4_fk_MyApp_app` FOREIGN KEY (`approvisionnement_id`) REFERENCES `MyApp_approvisionnement` (`id`),
  ADD CONSTRAINT `MyApp_detailapprovis_article_id_1ed9d36e_fk_MyApp_art` FOREIGN KEY (`article_id`) REFERENCES `MyApp_article` (`id`);

--
-- Constraints for table `MyApp_detailfacture`
--
ALTER TABLE `MyApp_detailfacture`
  ADD CONSTRAINT `MyApp_detailfacture_facture_id_8a8883aa_fk_MyApp_facture_id` FOREIGN KEY (`facture_id`) REFERENCES `MyApp_facture` (`id`);

--
-- Constraints for table `MyApp_lignecommandeclient`
--
ALTER TABLE `MyApp_lignecommandeclient`
  ADD CONSTRAINT `MyApp_lignecommandec_article_id_ad4b5298_fk_MyApp_art` FOREIGN KEY (`article_id`) REFERENCES `MyApp_article` (`id`),
  ADD CONSTRAINT `MyApp_lignecommandec_commande_id_1fd5bea1_fk_MyApp_com` FOREIGN KEY (`commande_id`) REFERENCES `MyApp_commandeclient` (`id`);

--
-- Constraints for table `MyApp_userplus`
--
ALTER TABLE `MyApp_userplus`
  ADD CONSTRAINT `MyApp_userplus_user_id_8796861d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
