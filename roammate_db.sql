-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2025 at 10:16 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `roammate_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `failed_attempts` int(11) DEFAULT 0,
  `last_failed_attempt` datetime DEFAULT NULL,
  `lockout_expiry` datetime DEFAULT NULL,
  `company_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `email`, `password`, `created_at`, `failed_attempts`, `last_failed_attempt`, `lockout_expiry`, `company_code`) VALUES
(1, 'harrypotter@gmail.com', '$2y$10$06Wsk6qxBSNkS4GXRfhAguQskSsCKUVlma06XRH2XtxX0oEpRr9ve', '2025-01-22 20:30:59', 0, '2025-01-29 18:21:04', NULL, '4B-TRVL-ND-TRS'),
(18, 'virginiarosedichoso@gmail.com', '$2y$10$0CcgGDyYI4xiyOzmykVEiOoEYNWyUAYbvEvRBvTL9gxxxhNrUF1Iq', '2025-01-27 23:47:49', 0, '2025-01-30 03:20:44', NULL, '4B-TRVL-ND-TRS'),
(19, 'anna@gmail.com', '$2y$10$JdBLwpFhJyGxDxKCYdPTruPtgcQ6yRB3D1DBKOR1fsij7c/9z9hvC', '2025-01-27 23:52:26', 3, '2025-01-30 04:07:20', '2025-01-29 21:12:20', '4B-TRVL-ND-TRS'),
(20, 'merida@gmail.com', '$2y$10$iRyiWVHVam/.TnS4eg.5r.hQ.CrHgAOgL9Fqm6i053dn6rZt54dJO', '2025-01-28 00:05:04', 3, '2025-01-29 18:26:07', '2025-01-29 11:31:07', '4B-TRVL-ND-TRS'),
(21, 'belle@gmail.com', '$2y$10$HvP7UTg.Qwgb5Fb6weXqJOJqduKmkuUFWC7r2EdTmd3RidHYHmA2m', '2025-01-28 05:31:19', 3, '2025-01-29 18:34:02', '2025-01-29 11:39:02', '4B-TRVL-ND-TRS'),
(22, 'jasmine@gmail.com', '$2y$10$KgtOLGGcEF2Qo5tsdcQQzOA24ntjYqati1k9upK8AbwOaliXTXEKS', '2025-01-28 05:57:57', 0, NULL, NULL, '4B-TRVL-ND-TRS'),
(23, 'pocahontas@gmail.com', '$2y$10$f2JCiISD6IeWGGtIi6b1HewidhO6hypeWMBuw/gtmFgt1js60I0kS', '2025-01-28 06:02:05', 3, '2025-01-28 14:03:19', '2025-01-28 07:08:19', '4B-TRVL-ND-TRS'),
(24, 'dora@gmail.com', '$2y$10$CHU9C4xA8/7FyCE7muoCWewsfSitv.qouMHxkpPZbuVILQSSeVYte', '2025-01-28 06:13:51', 0, NULL, NULL, '4B-TRVL-ND-TRS'),
(25, 'iduna@gmail.com', '$2y$10$1LeoIjNPxM4EHVLeyg1Vo.V.cJbyjZbv5C6rTsRWV5qZSxmVy0xbK', '2025-01-28 06:47:05', 0, NULL, NULL, '4B-TRVL-ND-TRS'),
(26, 'legolas@gmail.com', '$2y$10$4KEvC3XVlQiyW/jMryqmPOrtdXGMLpLRliZJN0hMApuv/HsnjlDWW', '2025-01-29 15:53:20', 0, NULL, NULL, '4B-TRVL-ND-TRS'),
(27, 'bean@gmail.com', '$2y$10$YOFAaP0dX7uWY59v76F7FeI/tK3sycB/SuLEGvHs4fkk.N9yD42nK', '2025-01-29 20:34:37', 0, NULL, NULL, '4B-TRVL-ND-TRS');

-- --------------------------------------------------------

--
-- Table structure for table `itineraries`
--

CREATE TABLE `itineraries` (
  `id` int(11) NOT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `duration_days` int(11) DEFAULT NULL,
  `duration_nights` int(11) DEFAULT NULL,
  `lodging` text DEFAULT NULL,
  `formatted_duration` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `itineraries`
--

INSERT INTO `itineraries` (`id`, `destination`, `duration_days`, `duration_nights`, `lodging`, `formatted_duration`) VALUES
(37, 'Ilocos', 2, 1, 'Transient Lodge', '2D1N');

-- --------------------------------------------------------

--
-- Table structure for table `itinerary_days`
--

CREATE TABLE `itinerary_days` (
  `id` int(11) NOT NULL,
  `itinerary_id` int(11) NOT NULL,
  `day_number` int(11) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `activity` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `itinerary_days`
--

INSERT INTO `itinerary_days` (`id`, `itinerary_id`, `day_number`, `start_time`, `end_time`, `activity`) VALUES
(35, 37, 1, '06:00:00', '07:00:00', 'Arrival in Laoag'),
(36, 37, 1, '07:30:00', '09:00:00', 'San Agustin Church'),
(37, 37, 1, '09:30:00', '10:30:00', 'Ilocos Norte Arch'),
(38, 37, 1, '10:45:00', '12:00:00', 'Malacañang of the North'),
(39, 37, 1, '12:15:00', '13:30:00', 'Lunch'),
(40, 37, 1, '13:45:00', '14:30:00', '4x4 Adventure'),
(41, 37, 1, '15:30:00', '17:30:00', 'Bangui Windmills'),
(42, 37, 1, '18:00:00', '19:30:00', 'Pagudpud Arch + Dinner'),
(43, 37, 2, '06:30:00', '07:30:00', 'Breakfast'),
(44, 37, 2, '08:00:00', '08:45:00', 'Patapat Viaduct'),
(45, 37, 2, '09:00:00', '09:30:00', 'Vigan Cathedral'),
(46, 37, 2, '09:45:00', '10:15:00', 'RJ Jar Factory'),
(47, 37, 2, '10:30:00', '11:30:00', 'Baluarte Zoo'),
(48, 37, 2, '12:00:00', '12:45:00', 'Lunch'),
(49, 37, 2, '13:00:00', '14:00:00', 'Vigan Pasalubong'),
(50, 37, 2, '15:30:00', '16:30:00', 'Grapes Farm'),
(51, 37, 2, '17:00:00', '18:00:00', 'Ilocos Sur Market'),
(52, 37, 2, '18:30:00', '23:30:00', 'Departure to Manila');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `expires`) VALUES
('virginiarosedichoso@gmail.com', '1b003c9d0a40dfc0dababd576e91162ba4c747e00c2bb210396e54eadf9228184df74addbe0b318263d62ee0b7e03e5aa6f2', 1738038075),
('virginiarosedichoso@gmail.com', 'b9daa9fb82ccea0d2f7fabf3f82594c450ce5dd837fdd4b9a0f27c3698905230e745a08d981e8bd2dc35bb44db16e713a434', 1738119309),
('virginiarosedichoso@gmail.com', 'c93b5dee33bf142f88ecee1c7dc7e45607c3d2195628f5d8c1ef51967ab8db6cfcffe208d0617b7bfb016313289df06e6994', 1738170711),
('virginiarosedichoso@gmail.com', 'ff4bc9a6b6bee012de3efce9cfccccdd84e6e799a99b470c5b57e63290a8066115264f95d5955fe49d66437f039688b4ad39', 1738173090);

-- --------------------------------------------------------

--
-- Table structure for table `requested_itineraries`
--

CREATE TABLE `requested_itineraries` (
  `id` int(11) NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `lodging` text NOT NULL,
  `duration` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `formatted_duration` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requested_itineraries`
--

INSERT INTO `requested_itineraries` (`id`, `client_name`, `destination`, `start_date`, `end_date`, `lodging`, `duration`, `created_at`, `formatted_duration`) VALUES
(21, 'Anna Santos', 'Baguio', '2025-01-30', '2025-01-31', 'Baguio Hotel', 2, '2025-01-29 20:57:51', '2 Days, 1 Night'),
(22, 'Juan Bautista', 'Baler', '2025-02-01', '2025-02-02', 'Transient Lodge', 2, '2025-01-29 21:01:53', '2 Days, 1 Night'),
(23, 'Maria Cruz', 'Sagada', '2025-02-03', '2025-02-04', 'Transient Lodge', 2, '2025-01-29 21:08:09', '2 Days, 1 Night');

-- --------------------------------------------------------

--
-- Table structure for table `requested_itinerary_days`
--

CREATE TABLE `requested_itinerary_days` (
  `id` int(11) NOT NULL,
  `itinerary_id` int(11) NOT NULL,
  `day_number` int(11) NOT NULL,
  `date` date NOT NULL,
  `day` varchar(20) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `activity` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requested_itinerary_days`
--

INSERT INTO `requested_itinerary_days` (`id`, `itinerary_id`, `day_number`, `date`, `day`, `start_time`, `end_time`, `activity`) VALUES
(21, 21, 1, '2025-01-30', 'Thursday', '00:00:00', '06:00:00', 'Manila to Baguio'),
(22, 21, 1, '2025-01-30', 'Thursday', '06:00:00', '07:30:00', 'Check in + Breakfast'),
(23, 21, 1, '2025-01-30', 'Thursday', '08:00:00', '09:00:00', 'Strawberry Farm'),
(24, 21, 1, '2025-01-30', 'Thursday', '10:00:00', '12:00:00', 'Burnham Park'),
(25, 21, 1, '2025-01-30', 'Thursday', '12:00:00', '13:00:00', 'Lunch'),
(26, 21, 2, '2025-01-31', 'Friday', '06:30:00', '07:30:00', 'Breakfast'),
(27, 21, 2, '2025-01-31', 'Friday', '08:00:00', '09:00:00', 'Baguio Cathedral'),
(28, 21, 2, '2025-01-31', 'Friday', '09:00:00', '10:00:00', 'Diplomat Hotel'),
(29, 21, 2, '2025-01-31', 'Friday', '10:00:00', '11:00:00', 'Shopping for Pasalubong'),
(30, 21, 2, '2025-01-31', 'Friday', '11:00:00', '17:00:00', 'Departure to Manila'),
(31, 22, 1, '2025-02-01', 'Saturday', '03:00:00', '06:00:00', 'Manila to Aurora'),
(32, 22, 1, '2025-02-01', 'Saturday', '06:00:00', '07:00:00', 'Check-in + Breakfast'),
(33, 22, 1, '2025-02-01', 'Saturday', '07:00:00', '11:00:00', 'Swim'),
(34, 22, 1, '2025-02-01', 'Saturday', '11:00:00', '12:00:00', 'Lunch'),
(35, 22, 2, '2025-02-02', 'Sunday', '06:30:00', '07:30:00', 'Breakfast'),
(36, 22, 2, '2025-02-02', 'Sunday', '07:30:00', '08:30:00', 'Shopping for Pasalubong'),
(37, 22, 2, '2025-02-02', 'Sunday', '08:30:00', '11:00:00', 'Surfing'),
(38, 22, 2, '2025-02-02', 'Sunday', '11:00:00', '12:00:00', 'Lunch'),
(39, 23, 1, '2025-02-03', 'Monday', '00:00:00', '06:00:00', 'Manila to Sagada'),
(40, 23, 1, '2025-02-03', 'Monday', '06:00:00', '07:00:00', 'Check-in + Breakfast'),
(41, 23, 1, '2025-02-03', 'Monday', '07:00:00', '08:00:00', 'Sumaguing Cave'),
(42, 23, 1, '2025-02-03', 'Monday', '08:00:00', '09:00:00', 'Marlboro Hill'),
(43, 23, 1, '2025-02-03', 'Monday', '09:00:00', '11:00:00', 'Hanging Coffins of Sagada'),
(44, 23, 1, '2025-02-03', 'Monday', '11:00:00', '12:00:00', 'Lunch'),
(45, 23, 2, '2025-02-04', 'Tuesday', '06:30:00', '07:30:00', 'Breakfast'),
(46, 23, 2, '2025-02-04', 'Tuesday', '07:30:00', '08:30:00', 'Echo Valley'),
(47, 23, 2, '2025-02-04', 'Tuesday', '08:30:00', '09:30:00', 'Lumiang Cave'),
(48, 23, 2, '2025-02-04', 'Tuesday', '09:30:00', '10:30:00', 'Pongas Falls'),
(49, 23, 2, '2025-02-04', 'Tuesday', '10:30:00', '11:30:00', 'Lunch'),
(50, 23, 2, '2025-02-04', 'Tuesday', '11:30:00', '13:00:00', 'Shopping for Pasalubong'),
(51, 23, 2, '2025-02-04', 'Tuesday', '13:00:00', '17:00:00', 'Departure to Manila');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `itineraries`
--
ALTER TABLE `itineraries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itinerary_days`
--
ALTER TABLE `itinerary_days`
  ADD PRIMARY KEY (`id`),
  ADD KEY `itinerary_id` (`itinerary_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`token`);

--
-- Indexes for table `requested_itineraries`
--
ALTER TABLE `requested_itineraries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requested_itinerary_days`
--
ALTER TABLE `requested_itinerary_days`
  ADD PRIMARY KEY (`id`),
  ADD KEY `itinerary_id` (`itinerary_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `itineraries`
--
ALTER TABLE `itineraries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `itinerary_days`
--
ALTER TABLE `itinerary_days`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `requested_itineraries`
--
ALTER TABLE `requested_itineraries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `requested_itinerary_days`
--
ALTER TABLE `requested_itinerary_days`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `itinerary_days`
--
ALTER TABLE `itinerary_days`
  ADD CONSTRAINT `itinerary_days_ibfk_1` FOREIGN KEY (`itinerary_id`) REFERENCES `itineraries` (`id`);

--
-- Constraints for table `requested_itinerary_days`
--
ALTER TABLE `requested_itinerary_days`
  ADD CONSTRAINT `requested_itinerary_days_ibfk_1` FOREIGN KEY (`itinerary_id`) REFERENCES `requested_itineraries` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
