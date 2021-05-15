-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2019 at 09:22 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `books`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`, `description`, `name_slug`, `created_at`, `updated_at`) VALUES
(1, 'John Carreyrou', 'John Carreyrou is a French-American journalist with The Wall Street Journal. He has worked for the Journal since 1999 and has been based in Brussels, Paris, and New York City and won the Pulitzer Prize twice.', 'john-carreyrou', NULL, NULL),
(2, 'John Lemming', '', 'john-lemming', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `author_book`
--

CREATE TABLE `author_book` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `author_book`
--

INSERT INTO `author_book` (`id`, `author_id`, `book_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, '2019-05-29 22:19:39', '2019-05-30 01:19:39'),
(3, 2, 2, '2019-05-31 05:39:13', '2019-05-31 08:39:13'),
(4, 1, 3, '2019-05-31 09:43:49', '2019-05-31 12:43:49');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `description`, `title_slug`, `created_at`, `updated_at`) VALUES
(1, 'Bad Blood: Secrets and Lies in a Silicon Valley Startup', 'Bad Blood is a nonfiction book by journalist John Carreyrou, released May 21, 2018. It covers the rise and fall of the firm Theranos, the multibillion-dollar biotech startup headed by Elizabeth Holmes.', 'bad-blood-secrets-and-lies-in-a-silicon-valley-startup', NULL, NULL),
(2, 'When good reporters go bad', '', 'when-good-reporters-go-bad', NULL, NULL),
(3, 'Good vibes: Honesty in silicone valley', '', 'good-vibes-honesty-in-silicone-valley', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book_recommender`
--

CREATE TABLE `book_recommender` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `recommender_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_recommender`
--

INSERT INTO `book_recommender` (`id`, `recommender_id`, `book_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 4, 1, NULL, NULL),
(3, 5, 1, NULL, NULL),
(4, 1, 2, NULL, NULL),
(5, 2, 2, NULL, NULL),
(6, 3, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(8, '2014_10_12_000000_create_users_table', 1),
(9, '2014_10_12_100000_create_password_resets_table', 1),
(10, '2019_05_21_194003_create_books_table', 1),
(11, '2019_05_26_125400_create_recommenders_table', 1),
(13, '2019_05_26_135734_create_authors_table', 2),
(16, '2019_05_29_122628_create_book__recommenders_table', 3),
(17, '2019_05_29_122924_create_author__books_table', 3),
(18, '2019_05_29_154137_update', 3),
(19, '2019_06_02_121137_add_name_slug_to_authors', 4),
(20, '2019_06_02_122835_add_name_slug_to_recommenders', 5),
(21, '2019_06_02_123356_add_title_slug_to_books', 6),
(22, '2019_06_02_124739_add_name_slug_column_to_authors_table', 7),
(23, '2019_06_02_125750_add_title_slug_to_books', 8),
(24, '2019_06_02_130026_add_name_slug_column_to_authors_table', 8),
(25, '2019_06_02_130637_update', 9),
(26, '2019_06_02_131700_add_name_slug_column_to_authors_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recommenders`
--

CREATE TABLE `recommenders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recommenders`
--

INSERT INTO `recommenders` (`id`, `name`, `name_slug`, `created_at`, `updated_at`) VALUES
(1, 'Bill Gates', 'bill-gates', NULL, NULL),
(2, 'Julia Wineheart', 'julia-wineheart', NULL, NULL),
(3, 'John Wayne', 'john-wayne', NULL, NULL),
(4, 'Stephen Bishop', 'stephen-bishop', NULL, NULL),
(5, 'Brian Mogul', 'brian-mogul', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_slug` (`name_slug`);

--
-- Indexes for table `author_book`
--
ALTER TABLE `author_book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title_slug` (`title_slug`);

--
-- Indexes for table `book_recommender`
--
ALTER TABLE `book_recommender`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `recommenders`
--
ALTER TABLE `recommenders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_slug` (`name_slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `author_book`
--
ALTER TABLE `author_book`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `book_recommender`
--
ALTER TABLE `book_recommender`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `recommenders`
--
ALTER TABLE `recommenders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
