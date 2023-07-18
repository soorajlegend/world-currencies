-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2023 at 06:02 PM
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
  `id` int(6) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `symbol` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `country`, `currency`, `code`, `symbol`) VALUES
(1, 'Afghanistan', 'Afghanis', 'AFN', '؋'),
(2, 'Albania', 'Leke', 'ALL', 'Lek'),
(3, 'America', 'Dollars', 'USD', '$'),
(4, 'Argentina', 'Pesos', 'ARS', '$'),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ'),
(6, 'Australia', 'Dollars', 'AUD', '$'),
(7, 'Azerbaijan', 'New Manats', 'AZN', 'ман'),
(8, 'Bahamas', 'Dollars', 'BSD', '$'),
(9, 'Barbados', 'Dollars', 'BBD', '$'),
(10, 'Belarus', 'Rubles', 'BYR', 'p.'),
(11, 'Belgium', 'Euro', 'EUR', '€'),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$'),
(13, 'Bermuda', 'Dollars', 'BMD', '$'),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b'),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM'),
(16, 'Botswana', 'Pula', 'BWP', 'P'),
(17, 'Brazil', 'Reais', 'BRL', 'R$'),
(18, 'Britain (United Kingdom)', 'Pounds', 'GBP', '£'),
(19, 'Brunei Darussalam', 'Dollars', 'BND', '$'),
(20, 'Bulgaria', 'Leva', 'BGN', 'лв'),
(21, 'Cambodia', 'Riels', 'KHR', '៛'),
(22, 'Canada', 'Dollars', 'CAD', '$'),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$'),
(24, 'Chile', 'Pesos', 'CLP', '$'),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥'),
(26, 'Colombia', 'Pesos', 'COP', '$'),
(27, 'Costa Rica', 'Colón', 'CRC', '₡'),
(28, 'Croatia', 'Kuna', 'HRK', 'kn'),
(29, 'Cuba', 'Pesos', 'CUP', '₱'),
(30, 'Cyprus', 'Euro', 'EUR', '€'),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč'),
(32, 'Denmark', 'Kroner', 'DKK', 'kr'),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$'),
(34, 'East Caribbean', 'Dollars', 'XCD', '$'),
(35, 'Egypt', 'Pounds', 'EGP', '£'),
(36, 'El Salvador', 'Colones', 'SVC', '$'),
(37, 'England (United Kingdom)', 'Pounds', 'GBP', '£'),
(38, 'Euro', 'Euro', 'EUR', '€'),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£'),
(40, 'Fiji', 'Dollars', 'FJD', '$'),
(41, 'France', 'Euro', 'EUR', '€'),
(42, 'Ghana', 'Cedis', 'GHC', '¢'),
(43, 'Gibraltar', 'Pounds', 'GIP', '£'),
(44, 'Greece', 'Euro', 'EUR', '€'),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q'),
(46, 'Guernsey', 'Pounds', 'GGP', '£'),
(47, 'Guyana', 'Dollars', 'GYD', '$'),
(48, 'Holland (Netherlands)', 'Euro', 'EUR', '€'),
(49, 'Honduras', 'Lempiras', 'HNL', 'L'),
(50, 'Hong Kong', 'Dollars', 'HKD', '$'),
(51, 'Hungary', 'Forint', 'HUF', 'Ft'),
(52, 'Iceland', 'Kronur', 'ISK', 'kr'),
(54, 'India', 'Rupees', 'INR', '₹'),
(55, 'Indonesia', 'Rupiahs', 'IDR', 'Rp'),
(56, 'Iran', 'Rials', 'IRR', '﷼'),
(57, 'Ireland', 'Euro', 'EUR', '€'),
(58, 'Isle of Man', 'Pounds', 'IMP', '£'),
(59, 'Israel', 'New Shekels', 'ILS', '₪'),
(60, 'Italy', 'Euro', 'EUR', '€'),
(61, 'Jamaica', 'Dollars', 'JMD', 'J$'),
(62, 'Japan', 'Yen', 'JPY', '¥'),
(63, 'Jersey', 'Pounds', 'JEP', '£'),
(64, 'Kazakhstan', 'Tenge', 'KZT', 'лв'),
(65, 'Korea (North)', 'Won', 'KPW', '₩'),
(66, 'Korea (South)', 'Won', 'KRW', '₩'),
(67, 'Kyrgyzstan', 'Soms', 'KGS', 'лв'),
(68, 'Laos', 'Kips', 'LAK', '₭'),
(69, 'Latvia', 'Lati', 'LVL', 'Ls'),
(70, 'Lebanon', 'Pounds', 'LBP', '£'),
(71, 'Liberia', 'Dollars', 'LRD', '$'),
(72, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF'),
(73, 'Lithuania', 'Litai', 'LTL', 'Lt'),
(74, 'Luxembourg', 'Euro', 'EUR', '€'),
(75, 'Macedonia', 'Denars', 'MKD', 'ден'),
(76, 'Malaysia', 'Ringgits', 'MYR', 'RM'),
(77, 'Malta', 'Euro', 'EUR', '€'),
(78, 'Mauritius', 'Rupees', 'MUR', '₨'),
(79, 'Mexico', 'Pesos', 'MXN', '$'),
(80, 'Mongolia', 'Tugriks', 'MNT', '₮'),
(81, 'Mozambique', 'Meticais', 'MZN', 'MT'),
(82, 'Namibia', 'Dollars', 'NAD', '$'),
(83, 'Nepal', 'Rupees', 'NPR', '₨'),
(84, 'Netherlands', 'Euro', 'EUR', '€'),
(85, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ'),
(86, 'New Zealand', 'Dollars', 'NZD', '$'),
(87, 'Nicaragua', 'Cordobas', 'NIO', 'C$'),
(88, 'Nigeria', 'Naira', 'NGN', '₦'),
(89, 'North Korea', 'Won', 'KPW', '₩'),
(90, 'Norway', 'Krone', 'NOK', 'kr'),
(91, 'Oman', 'Rials', 'OMR', '﷼'),
(92, 'Pakistan', 'Rupees', 'PKR', '₨'),
(93, 'Panama', 'Balboa', 'PAB', 'B/.'),
(94, 'Paraguay', 'Guarani', 'PYG', 'Gs'),
(95, 'Peru', 'Nuevos Soles', 'PEN', 'S/.'),
(96, 'Philippines', 'Pesos', 'PHP', 'Php'),
(97, 'Poland', 'Zlotych', 'PLN', 'zł'),
(98, 'Qatar', 'Rials', 'QAR', '﷼'),
(99, 'Romania', 'New Lei', 'RON', 'lei'),
(100, 'Russia', 'Rubles', 'RUB', 'руб'),
(101, 'Saint Helena', 'Pounds', 'SHP', '£'),
(102, 'Saudi Arabia', 'Riyals', 'SAR', '﷼'),
(103, 'Serbia', 'Dinars', 'RSD', 'Дин.'),
(104, 'Seychelles', 'Rupees', 'SCR', '₨'),
(105, 'Singapore', 'Dollars', 'SGD', '$'),
(106, 'Slovenia', 'Euro', 'EUR', '€'),
(107, 'Solomon Islands', 'Dollars', 'SBD', '$'),
(108, 'Somalia', 'Shillings', 'SOS', 'S'),
(109, 'South Africa', 'Rand', 'ZAR', 'R'),
(110, 'South Korea', 'Won', 'KRW', '₩'),
(111, 'Spain', 'Euro', 'EUR', '€'),
(112, 'Sri Lanka', 'Rupees', 'LKR', '₨'),
(113, 'Suriname', 'Dollars', 'SRD', '$'),
(114, 'Sweden', 'Kronor', 'SEK', 'kr'),
(115, 'Switzerland', 'Francs', 'CHF', 'CHF'),
(116, 'Syria', 'Pounds', 'SYP', '£'),
(117, 'Taiwan', 'New Dollars', 'TWD', 'NT$'),
(118, 'Thailand', 'Baht', 'THB', '฿'),
(119, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$'),
(120, 'Turkey', 'Lira', 'TRY', '₺'),
(122, 'Tuvalu', 'Dollars', 'TVD', '$'),
(123, 'Ukraine', 'Hryvnia', 'UAH', '₴'),
(124, 'United Kingdom', 'Pounds', 'GBP', '£'),
(125, 'United States of America', 'Dollars', 'USD', '$'),
(126, 'Uruguay', 'Pesos', 'UYU', '$U'),
(127, 'Uzbekistan', 'Sums', 'UZS', 'лв'),
(128, 'Vatican City', 'Euro', 'EUR', '€'),
(129, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs'),
(130, 'Vietnam', 'Dong', 'VND', '₫'),
(131, 'Yemen', 'Rials', 'YER', '﷼'),
(132, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
