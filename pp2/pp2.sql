-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 16 2019 г., 10:32
-- Версия сервера: 5.6.38
-- Версия PHP: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `pp2`
--

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`%` PROCEDURE `all_clients` ()  NO SQL
SELECT * FROM client$$

CREATE DEFINER=`root`@`%` PROCEDURE `all_requests` ()  NO SQL
SELECT id_request, client_name FROM client, request WHERE client_id = id_client$$

CREATE DEFINER=`root`@`%` PROCEDURE `all_services` ()  NO SQL
SELECT * FROM service$$

CREATE DEFINER=`root`@`%` PROCEDURE `client_add` (IN `name` VARCHAR(100) CHARSET utf8)  NO SQL
INSERT INTO client (`client_name`) VALUES (name)$$

CREATE DEFINER=`root`@`%` PROCEDURE `client_by_id` (IN `id` INT)  NO SQL
SELECT * FROM client WHERE `id_client` = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `client_delete` (IN `id` INT)  NO SQL
DELETE FROM client WHERE id_client = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `client_update` (IN `name` VARCHAR(100), IN `id` INT)  NO SQL
UPDATE client SET client_name = name WHERE id_client = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `request_add` (IN `id_client` INT)  NO SQL
INSERT INTO request (client_id) VALUES (id_client)$$

CREATE DEFINER=`root`@`%` PROCEDURE `request_by_id` (IN `id` INT)  NO SQL
SELECT id_request, id_client FROM client, request WHERE d_client = client_id AND id_request = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `request_update` (IN `client` INT, IN `id` INT)  NO SQL
UPDATE request SET client_id = client WHERE id_request = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `service_add` (IN `name` VARCHAR(100), IN `price` INT)  NO SQL
INSERT INTO service (service_name, service_price) VALUES (name, price)$$

CREATE DEFINER=`root`@`%` PROCEDURE `service_by_id` (IN `id` INT)  NO SQL
SELECT * FROM service WHERE id_service = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `service_delete` (IN `id` INT)  NO SQL
DELETE FROM service WHERE id_service = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `service_update` (IN `name` VARCHAR(100), IN `price` INT, IN `id` INT)  NO SQL
UPDATE service SET service_name = name, service_price = price WHERE id_service = id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `client_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`id_client`, `client_name`) VALUES
(2, 'Иванов Петр Сергеевич');

-- --------------------------------------------------------

--
-- Структура таблицы `request`
--

CREATE TABLE `request` (
  `id_request` int(11) NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `request_service`
--

CREATE TABLE `request_service` (
  `request_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `service`
--

CREATE TABLE `service` (
  `id_service` int(11) NOT NULL,
  `service_name` varchar(250) NOT NULL,
  `service_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `service`
--

INSERT INTO `service` (`id_service`, `service_name`, `service_price`) VALUES
(1, 'Прочитать книгу', 100);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`),
  ADD UNIQUE KEY `id_client` (`id_client`);

--
-- Индексы таблицы `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id_request`),
  ADD UNIQUE KEY `id_request` (`id_request`),
  ADD KEY `client_id` (`client_id`);

--
-- Индексы таблицы `request_service`
--
ALTER TABLE `request_service`
  ADD KEY `request_id` (`request_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Индексы таблицы `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id_service`),
  ADD UNIQUE KEY `id_service` (`id_service`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `request`
--
ALTER TABLE `request`
  MODIFY `id_request` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `service`
--
ALTER TABLE `service`
  MODIFY `id_service` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id_client`);

--
-- Ограничения внешнего ключа таблицы `request_service`
--
ALTER TABLE `request_service`
  ADD CONSTRAINT `request_service_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id_service`),
  ADD CONSTRAINT `request_service_ibfk_2` FOREIGN KEY (`request_id`) REFERENCES `request` (`id_request`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
