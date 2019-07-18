-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 06. Jul 2019 um 16:16
-- Server-Version: 10.3.16-MariaDB
-- PHP-Version: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_fabian_andiel_carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cars`
--

CREATE TABLE `cars` (
  `license_plate` bigint(20) UNSIGNED NOT NULL,
  `model` varchar(20) DEFAULT NULL,
  `FK_customer_id` bigint(20) UNSIGNED NOT NULL,
  `FK_social_sec_number` bigint(20) UNSIGNED NOT NULL,
  `FK_contract_number` bigint(20) UNSIGNED NOT NULL,
  `FK_invoice_number` bigint(20) UNSIGNED NOT NULL,
  `buydate` date DEFAULT NULL,
  `mileage` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `contracts`
--

CREATE TABLE `contracts` (
  `contract_number` bigint(20) UNSIGNED NOT NULL,
  `FK_social_sec_number` bigint(20) UNSIGNED NOT NULL,
  `FK_customer_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `contracts`
--

INSERT INTO `contracts` (`contract_number`, `FK_social_sec_number`, `FK_customer_id`, `start_date`, `end_date`) VALUES
(311, 2399100685, 3, '2019-01-01', '2019-12-31'),
(322, 3210040190, 4, '2019-02-07', '2019-07-03'),
(333, 3210040190, 2, '2019-03-10', '2020-01-01'),
(344, 4010010195, 3, '2019-04-08', '2019-12-01'),
(355, 4120070691, 1, '2019-07-11', '2019-08-31');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customers`
--

CREATE TABLE `customers` (
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `adress` varchar(20) DEFAULT NULL,
  `zip` mediumint(8) UNSIGNED DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `phone` bigint(20) UNSIGNED DEFAULT NULL,
  `category` enum('A','B','C') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customers`
--

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `adress`, `zip`, `city`, `email`, `phone`, `category`) VALUES
(1, 'Johannes', 'Müller', 'Sostrasse', 1040, 'Wien', 'jmueller@oegv.at', 6764801442, 'A'),
(2, 'Thomas', 'Kerstens', 'Kerststrasse', 8030, 'Graz', 't.kersten@magen.at', 436763401232, 'C'),
(3, 'Jochen', 'Schweizer', 'Zansgasse', 7310, 'Klagenfurt', 'js@bmi.gv.at', 436763124023, 'B'),
(4, 'Roland', 'Leitner', 'Sonnenallee', 8410, 'Graz', 'rl@graz.gv.at', 436773218122, 'A');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employees`
--

CREATE TABLE `employees` (
  `social_sec_number` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `adress` varchar(20) DEFAULT NULL,
  `zip` mediumint(8) UNSIGNED DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `employees`
--

INSERT INTO `employees` (`social_sec_number`, `first_name`, `last_name`, `adress`, `zip`, `city`) VALUES
(2399100685, ' Richard', ' Meier', ' Meiereigasse ', 1020, 'Wien'),
(3210040190, ' Reinhard ', 'Kurz', ' Solalalagasse ', 8030, 'Graz'),
(4010010195, ' Laurenz', ' Kircher', ' Sweetstrasse', 7400, ' Klagenfurt'),
(4120070691, 'Max', ' Laurer', 'Weiteregasse', 8000, 'Schladming');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fees`
--

CREATE TABLE `fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `FK_category` enum('premium','classic','economy') DEFAULT NULL,
  `fee` enum('300','200','100') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `invoices`
--

CREATE TABLE `invoices` (
  `invoice_number` bigint(20) UNSIGNED NOT NULL,
  `FK_customer_id` bigint(20) UNSIGNED NOT NULL,
  `FK_social_sec_number` bigint(20) UNSIGNED NOT NULL,
  `tax` bigint(20) UNSIGNED NOT NULL,
  `total_sum` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`license_plate`),
  ADD KEY `FK_customer_id` (`FK_customer_id`),
  ADD KEY `FK_social_sec_number` (`FK_social_sec_number`),
  ADD KEY `FK_contract_number` (`FK_contract_number`),
  ADD KEY `FK_invoice_number` (`FK_invoice_number`);

--
-- Indizes für die Tabelle `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`contract_number`),
  ADD KEY `FK_customer_id` (`FK_customer_id`),
  ADD KEY `FK_social_sec_number` (`FK_social_sec_number`);

--
-- Indizes für die Tabelle `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indizes für die Tabelle `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`social_sec_number`);

--
-- Indizes für die Tabelle `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_number`),
  ADD KEY `FK_customer_id` (`FK_customer_id`),
  ADD KEY `FK_social_sec_number` (`FK_social_sec_number`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`FK_customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `cars_ibfk_2` FOREIGN KEY (`FK_social_sec_number`) REFERENCES `employees` (`social_sec_number`),
  ADD CONSTRAINT `cars_ibfk_3` FOREIGN KEY (`FK_contract_number`) REFERENCES `contracts` (`contract_number`),
  ADD CONSTRAINT `cars_ibfk_4` FOREIGN KEY (`FK_invoice_number`) REFERENCES `invoices` (`invoice_number`);

--
-- Constraints der Tabelle `contracts`
--
ALTER TABLE `contracts`
  ADD CONSTRAINT `contracts_ibfk_1` FOREIGN KEY (`FK_customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `contracts_ibfk_2` FOREIGN KEY (`FK_social_sec_number`) REFERENCES `employees` (`social_sec_number`);

--
-- Constraints der Tabelle `fees`
--
ALTER TABLE `fees`
  ADD CONSTRAINT `fees_ibfk_1` FOREIGN KEY (`id`) REFERENCES `cars` (`license_plate`);

--
-- Constraints der Tabelle `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`invoice_number`) REFERENCES `contracts` (`contract_number`),
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`FK_customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `invoices_ibfk_3` FOREIGN KEY (`FK_social_sec_number`) REFERENCES `employees` (`social_sec_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
