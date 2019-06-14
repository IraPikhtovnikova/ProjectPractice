-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 14 2019 г., 11:03
-- Версия сервера: 5.6.38
-- Версия PHP: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `pp6`
--

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`%` PROCEDURE `answer_add` (IN `ans` VARCHAR(500), IN `ques` INT, IN `is_right` BOOLEAN)  NO SQL
INSERT INTO answers(answer, question_id, is_right) VALUES (ans, ques, is_right)$$

CREATE DEFINER=`root`@`%` PROCEDURE `question_add` (IN `test` INT, IN `ques` VARCHAR(500))  NO SQL
INSERT INTO questions(question, test_id) VALUES (ques, test)$$

CREATE DEFINER=`root`@`%` PROCEDURE `test_add` (IN `test` VARCHAR(100))  NO SQL
INSERT INTO tests(test, user_id) VALUES (test, 1)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `answers`
--

CREATE TABLE `answers` (
  `id_answer` int(11) NOT NULL,
  `answer` varchar(500) NOT NULL,
  `is_right` tinyint(1) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `answers`
--

INSERT INTO `answers` (`id_answer`, `answer`, `is_right`, `question_id`) VALUES
(1, '222', 0, 1),
(2, '333', 1, 1),
(3, 'Белка', 0, 2),
(4, 'Балка', 0, 2),
(5, 'Крот', 1, 2),
(6, '235', 0, 3),
(7, '135', 1, 3),
(8, '123545687521', 1, 7),
(9, '111', 0, 7),
(10, '135', 1, 8),
(11, '78653', 0, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `questions`
--

CREATE TABLE `questions` (
  `id_question` int(11) NOT NULL,
  `question` varchar(500) NOT NULL,
  `test_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `questions`
--

INSERT INTO `questions` (`id_question`, `question`, `test_id`) VALUES
(1, '222', 1),
(2, 'Уберите лишнее', 2),
(3, '2542', 3),
(4, 'sdfghj', 3),
(5, 'gfds', 0),
(6, 'hfgds', 0),
(7, '9865', 0),
(8, '987453', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `tests`
--

CREATE TABLE `tests` (
  `id_test` int(11) NOT NULL,
  `test` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tests`
--

INSERT INTO `tests` (`id_test`, `test`, `user_id`) VALUES
(1, '111', 1),
(2, '123', 1),
(3, '3456', 1),
(4, '13546532', 1),
(5, 'qqq', 1),
(6, 'eee', 1),
(7, 'sfd', 1),
(8, '12354', 1),
(9, '64312', 1),
(10, '3546876', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `login` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id_answer`);

--
-- Индексы таблицы `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id_question`);

--
-- Индексы таблицы `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id_test`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `answers`
--
ALTER TABLE `answers`
  MODIFY `id_answer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `questions`
--
ALTER TABLE `questions`
  MODIFY `id_question` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `tests`
--
ALTER TABLE `tests`
  MODIFY `id_test` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
