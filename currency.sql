-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2023 at 03:54 PM
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
-- Database: `assets`
--

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `country` varchar(100) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `symbol` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`country`, `currency`, `code`, `symbol`) VALUES
('Albania', 'Leke', 'ALL', 'Lek'),
('America', 'Dollars', 'USD', '$'),
('Afghanistan', 'Afghanis', 'AFN', '؋'),
('Argentina', 'Pesos', 'ARS', '$'),
('Aruba', 'Guilders', 'AWG', 'ƒ'),
('Australia', 'Dollars', 'AUD', '$'),
('Azerbaijan', 'New Manats', 'AZN', 'ман'),
('Bahamas', 'Dollars', 'BSD', '$'),
('Barbados', 'Dollars', 'BBD', '$'),
('Belarus', 'Rubles', 'BYR', 'p.'),
('Belgium', 'Euro', 'EUR', '€'),
('Beliz', 'Dollars', 'BZD', 'BZ$'),
('Bermuda', 'Dollars', 'BMD', '$'),
('Bolivia', 'Bolivianos', 'BOB', '$b'),
('Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM'),
('Botswana', 'Pula', 'BWP', 'P'),
('Bulgaria', 'Leva', 'BGN', 'лв'),
('Brazil', 'Reais', 'BRL', 'R$'),
('Britain (United Kingdom)', 'Pounds', 'GBP', '£'),
('Brunei Darussalam', 'Dollars', 'BND', '$'),
('Cambodia', 'Riels', 'KHR', '៛'),
('Canada', 'Dollars', 'CAD', '$'),
('Cayman Islands', 'Dollars', 'KYD', '$'),
('Chile', 'Pesos', 'CLP', '$'),
('China', 'Yuan Renminbi', 'CNY', '¥'),
('Colombia', 'Pesos', 'COP', '$'),
('Costa Rica', 'Colón', 'CRC', '₡'),
('Croatia', 'Kuna', 'HRK', 'kn'),
('Cuba', 'Pesos', 'CUP', '₱'),
('Cyprus', 'Euro', 'EUR', '€'),
('Czech Republic', 'Koruny', 'CZK', 'Kč'),
('Denmark', 'Kroner', 'DKK', 'kr'),
('Dominican Republic', 'Pesos', 'DOP ', 'RD$'),
('East Caribbean', 'Dollars', 'XCD', '$'),
('Egypt', 'Pounds', 'EGP', '£'),
('El Salvador', 'Colones', 'SVC', '$'),
('England (United Kingdom)', 'Pounds', 'GBP', '£'),
('Euro', 'Euro', 'EUR', '€'),
('Falkland Islands', 'Pounds', 'FKP', '£'),
('Fiji', 'Dollars', 'FJD', '$'),
('France', 'Euro', 'EUR', '€'),
('Ghana', 'Cedis', 'GHC', '¢'),
('Gibraltar', 'Pounds', 'GIP', '£'),
('Greece', 'Euro', 'EUR', '€'),
('Guatemala', 'Quetzales', 'GTQ', 'Q'),
('Guernsey', 'Pounds', 'GGP', '£'),
('Guyana', 'Dollars', 'GYD', '$'),
('Holland (Netherlands)', 'Euro', 'EUR', '€'),
('Honduras', 'Lempiras', 'HNL', 'L'),
('Hong Kong', 'Dollars', 'HKD', '$'),
('Hungary', 'Forint', 'HUF', 'Ft'),
('Iceland', 'Kronur', 'ISK', 'kr'),
('India', 'Rupees', 'INR', 'Rp'),
('Indonesia', 'Rupiahs', 'IDR', 'Rp'),
('Iran', 'Rials', 'IRR', '﷼'),
('Ireland', 'Euro', 'EUR', '€'),
('Isle of Man', 'Pounds', 'IMP', '£'),
('Israel', 'New Shekels', 'ILS', '₪'),
('Italy', 'Euro', 'EUR', '€'),
('Jamaica', 'Dollars', 'JMD', 'J$'),
('Japan', 'Yen', 'JPY', '¥'),
('Jersey', 'Pounds', 'JEP', '£'),
('Kazakhstan', 'Tenge', 'KZT', 'лв'),
('Korea (North)', 'Won', 'KPW', '₩'),
('Korea (South)', 'Won', 'KRW', '₩'),
('Kyrgyzstan', 'Soms', 'KGS', 'лв'),
('Laos', 'Kips', 'LAK', '₭'),
('Latvia', 'Lati', 'LVL', 'Ls'),
('Lebanon', 'Pounds', 'LBP', '£'),
('Liberia', 'Dollars', 'LRD', '$'),
('Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF'),
('Lithuania', 'Litai', 'LTL', 'Lt'),
('Luxembourg', 'Euro', 'EUR', '€'),
('Macedonia', 'Denars', 'MKD', 'ден'),
('Malaysia', 'Ringgits', 'MYR', 'RM'),
('Malta', 'Euro', 'EUR', '€'),
('Mauritius', 'Rupees', 'MUR', '₨'),
('Mexico', 'Pesos', 'MXN', '$'),
('Mongolia', 'Tugriks', 'MNT', '₮'),
('Mozambique', 'Meticais', 'MZN', 'MT'),
('Namibia', 'Dollars', 'NAD', '$'),
('Nepal', 'Rupees', 'NPR', '₨'),
('Netherlands Antilles', 'Guilders', 'ANG', 'ƒ'),
('Netherlands', 'Euro', 'EUR', '€'),
('New Zealand', 'Dollars', 'NZD', '$'),
('Nicaragua', 'Cordobas', 'NIO', 'C$'),
('Nigeria', 'Nairas', 'NGN', '₦'),
('North Korea', 'Won', 'KPW', '₩'),
('Norway', 'Krone', 'NOK', 'kr'),
('Oman', 'Rials', 'OMR', '﷼'),
('Pakistan', 'Rupees', 'PKR', '₨'),
('Panama', 'Balboa', 'PAB', 'B/.'),
('Paraguay', 'Guarani', 'PYG', 'Gs'),
('Peru', 'Nuevos Soles', 'PEN', 'S/.'),
('Philippines', 'Pesos', 'PHP', 'Php'),
('Poland', 'Zlotych', 'PLN', 'zł'),
('Qatar', 'Rials', 'QAR', '﷼'),
('Romania', 'New Lei', 'RON', 'lei'),
('Russia', 'Rubles', 'RUB', 'руб'),
('Saint Helena', 'Pounds', 'SHP', '£'),
('Saudi Arabia', 'Riyals', 'SAR', '﷼'),
('Serbia', 'Dinars', 'RSD', 'Дин.'),
('Seychelles', 'Rupees', 'SCR', '₨'),
('Singapore', 'Dollars', 'SGD', '$'),
('Slovenia', 'Euro', 'EUR', '€'),
('Solomon Islands', 'Dollars', 'SBD', '$'),
('Somalia', 'Shillings', 'SOS', 'S'),
('South Africa', 'Rand', 'ZAR', 'R'),
('South Korea', 'Won', 'KRW', '₩'),
('Spain', 'Euro', 'EUR', '€'),
('Sri Lanka', 'Rupees', 'LKR', '₨'),
('Sweden', 'Kronor', 'SEK', 'kr'),
('Switzerland', 'Francs', 'CHF', 'CHF'),
('Suriname', 'Dollars', 'SRD', '$'),
('Syria', 'Pounds', 'SYP', '£'),
('Taiwan', 'New Dollars', 'TWD', 'NT$'),
('Thailand', 'Baht', 'THB', '฿'),
('Trinidad and Tobago', 'Dollars', 'TTD', 'TT$'),
('Turkey', 'Lira', 'TRY', 'TL'),
('Turkey', 'Liras', 'TRL', '£'),
('Tuvalu', 'Dollars', 'TVD', '$'),
('Ukraine', 'Hryvnia', 'UAH', '₴'),
('United Kingdom', 'Pounds', 'GBP', '£'),
('United States of America', 'Dollars', 'USD', '$'),
('Uruguay', 'Pesos', 'UYU', '$U'),
('Uzbekistan', 'Sums', 'UZS', 'лв'),
('Vatican City', 'Euro', 'EUR', '€'),
('Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs'),
('Vietnam', 'Dong', 'VND', '₫'),
('Yemen', 'Rials', 'YER', '﷼'),
('Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$'),
('India', 'Rupees', 'INR', '₹');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
