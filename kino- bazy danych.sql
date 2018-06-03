-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 03 Cze 2018, 13:17
-- Wersja serwera: 10.1.30-MariaDB
-- Wersja PHP: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `kino`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bilet`
--

CREATE TABLE `bilet` (
  `IdBilet` int(11) NOT NULL,
  `IdKlient` int(11) NOT NULL,
  `IdSeans` int(11) NOT NULL,
  `IdRodzajBiletu` int(11) NOT NULL,
  `IdPracownik` int(11) DEFAULT NULL,
  `IdMiejsce` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Zrzut danych tabeli `bilet`
--

INSERT INTO `bilet` (`IdBilet`, `IdKlient`, `IdSeans`, `IdRodzajBiletu`, `IdPracownik`, `IdMiejsce`) VALUES
(36, 1, 5, 5, 6, 4),
(38, 1, 5, 5, NULL, 10),
(51, 81, 6, 2, NULL, 3),
(59, 86, 6, 2, NULL, 86),
(60, 86, 6, 3, NULL, 87),
(61, 87, 7, 2, NULL, 83),
(62, 87, 7, 2, NULL, 84),
(63, 87, 7, 5, NULL, 85),
(64, 87, 7, 3, NULL, 86),
(65, 87, 7, 3, NULL, 87),
(66, 88, 7, 4, NULL, 55),
(67, 88, 7, 4, NULL, 56),
(68, 89, 7, 2, NULL, 34),
(69, 89, 7, 3, NULL, 35),
(70, 90, 5, 2, NULL, 26),
(72, 92, 5, 3, NULL, 46),
(76, 96, 5, 2, NULL, 66),
(77, 96, 5, 2, NULL, 67);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `film`
--

CREATE TABLE `film` (
  `IdFilm` int(11) NOT NULL,
  `tytul` varchar(30) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `rezyser` varchar(30) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `rok_wydania` year(4) NOT NULL,
  `rodzaj` varchar(50) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `wiek` int(11) NOT NULL,
  `opis` varchar(255) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `linki` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Zrzut danych tabeli `film`
--

INSERT INTO `film` (`IdFilm`, `tytul`, `rezyser`, `rok_wydania`, `rodzaj`, `wiek`, `opis`, `linki`) VALUES
(1, 'Kształt wody', '\0\0\0G\0\0\0u\0\0\0i\0\0\0l\0\0\0l\0\0\0e\0\0\0r\0\0', 2017, 'Fantasy', 12, 'Elisa Esposito pracuje jako woźna w tajnym rządowym laboratorium. Jej życie ulega nagłej zmianie, gdy odkrywa pilnie strzeżony sekret.', '\0\0\0h\0\0\0t\0\0\0t\0\0\0p\0\0\0:\0\0\0/\0\0\0/\0\0\01\0\0\0.\0\0\0f\0\0\0w\0\0\0c\0\0\0d\0\0\0n\0\0\0.\0\0\0p\0\0\0l\0\0\0/\0\0\0p\0\0\0o\0\0\0/\0\0\05\0\0\09\0\0\0/\0\0\07\0\0\00\0\0\0/\0\0\07\0\0\07\0\0\05\0\0\09\0\0\07\0\0\00\0\0\0/\0\0\07\0\0\08\0\0\02\0\0\08\0\0\00\0\0\02\0\0\02\0\0\0.\0\0\06\0\0\0.\0\0\0j\0\0\0p\0\0\0g'),
(2, 'Deadpool 2', '\0\0\0D\0\0\0a\0\0\0v\0\0\0i\0\0\0d\0\0\0 \0\0\0L\0\0', 2018, 'Sci-Fi', 12, 'Po przeżyciu wypadku oszpecony superbohater stara się odzyskać swoją pasję do życia podróżując po świecie i walcząc z przestępcami. ', 'https://www.imdb.com/title/tt1431045/'),
(3, 'Czwarta władza', '\0\0\0S\0\0\0t\0\0\0e\0\0\0v\0\0\0e\0\0\0n\0\0\0 \0\0', 2017, 'Dramat', 0, 'Działania prezydenta USA doprowadzają do konfliktu pomiędzy dziennikarzami a rządem.', '\0\0\0h\0\0\0t\0\0\0t\0\0\0p\0\0\0:\0\0\0/\0\0\0/\0\0\01\0\0\0.\0\0\0f\0\0\0w\0\0\0c\0\0\0d\0\0\0n\0\0\0.\0\0\0p\0\0\0l\0\0\0/\0\0\0p\0\0\0o\0\0\0/\0\0\04\0\0\07\0\0\0/\0\0\00\0\0\05\0\0\0/\0\0\07\0\0\09\0\0\04\0\0\07\0\0\00\0\0\05\0\0\0/\0\0\07\0\0\08\0\0\02\0\0\08\0\0\00\0\0\02\0\0\04\0\0\0.\0\0\06\0\0\0.\0\0\0j\0\0\0p\0\0\0g'),
(4, 'Tamte dni, tamte noce', '\0\0\0L\0\0\0u\0\0\0c\0\0\0a\0\0\0 \0\0\0G\0\0\0u\0\0', 2017, 'Melodramat', 12, 'Nastoletni chłopak zakochuje się w gościu, który przyjechał na wakacje do jego rodziców.', '\0\0\0h\0\0\0t\0\0\0t\0\0\0p\0\0\0:\0\0\0/\0\0\0/\0\0\01\0\0\0.\0\0\0f\0\0\0w\0\0\0c\0\0\0d\0\0\0n\0\0\0.\0\0\0p\0\0\0l\0\0\0/\0\0\0p\0\0\0o\0\0\0/\0\0\09\0\0\03\0\0\0/\0\0\09\0\0\04\0\0\0/\0\0\07\0\0\07\0\0\09\0\0\03\0\0\09\0\0\04\0\0\0/\0\0\07\0\0\08\0\0\02\0\0\00\0\0\01\0\0\08\0\0\07\0\0\0.\0\0\06\0\0\0.\0\0\0j\0\0\0p\0\0\0g'),
(5, 'Coco', '\0\0\0L\0\0\0e\0\0\0e\0\0\0 \0\0\0U\0\0\0n\0\0\0k\0\0', 2018, 'Animacja', 0, 'Dwunastoletni meksykański chłopiec imieniem Miguel pragnie zgłębić tajemnice rodzinnej legendy.', '\0\0\0h\0\0\0t\0\0\0t\0\0\0p\0\0\0:\0\0\0/\0\0\0/\0\0\01\0\0\0.\0\0\0f\0\0\0w\0\0\0c\0\0\0d\0\0\0n\0\0\0.\0\0\0p\0\0\0l\0\0\0/\0\0\0p\0\0\0o\0\0\0/\0\0\02\0\0\02\0\0\0/\0\0\06\0\0\00\0\0\0/\0\0\07\0\0\05\0\0\02\0\0\02\0\0\06\0\0\00\0\0\0/\0\0\07\0\0\08\0\0\01\0\0\03\0\0\04\0\0\08\0\0\06\0\0\0.\0\0\06\0\0\0.\0\0\0j\0\0\0p\0\0\0g'),
(6, 'Twój Vincent ', '\0\0\0D\0\0\0o\0\0\0r\0\0\0o\0\0\0t\0\0\0a\0\0\0 \0\0', 2017, 'Animacja', 6, 'Bohaterowie obrazów Vincenta van Gogha przedstawiają historię życia oraz tajemniczej śmierci artysty. ', '\0\0\0h\0\0\0t\0\0\0t\0\0\0p\0\0\0:\0\0\0/\0\0\0/\0\0\01\0\0\0.\0\0\0f\0\0\0w\0\0\0c\0\0\0d\0\0\0n\0\0\0.\0\0\0p\0\0\0l\0\0\0/\0\0\0p\0\0\0o\0\0\0/\0\0\08\0\0\02\0\0\0/\0\0\00\0\0\07\0\0\0/\0\0\06\0\0\09\0\0\08\0\0\02\0\0\00\0\0\07\0\0\0/\0\0\07\0\0\07\0\0\09\0\0\09\0\0\04\0\0\02\0\0\00\0\0\0.\0\0\03\0\0\0.\0\0\0j\0\0\0p\0\0\0g'),
(7, 'Tomb Raider ', '\0\0\0R\0\0\0o\0\0\0a\0\0\0r\0\0\0 \0\0\0U\0\0\0t\0\0', 2018, 'Przygodowy', 12, 'Lara Croft wyrusza w swoją pierwszą ekspedycję, aby odnaleźć zaginionego ojca na niezbadanej wyspie u wybrzeży Japonii.', '\0\0\0h\0\0\0t\0\0\0t\0\0\0p\0\0\0s\0\0\0:\0\0\0/\0\0\0/\0\0\0i\0\0\0a\0\0\0.\0\0\0m\0\0\0e\0\0\0d\0\0\0i\0\0\0a\0\0\0-\0\0\0i\0\0\0m\0\0\0d\0\0\0b\0\0\0.\0\0\0c\0\0\0o\0\0\0m\0\0\0/\0\0\0i\0\0\0m\0\0\0a\0\0\0g\0\0\0e\0\0\0s\0\0\0/\0\0\0M\0\0\0/\0\0\0M\0\0\0V\0\0\05\0\0\0B\0\0\0O\0\0\0T\0\0\0Y\0\0\04\0\0\0N\0\0\0D\0\0\0c\0\0\0y\0\0\0Z\0\0\0G\0\0\0Q\0\0\0t\0\0\0Y\0\0\0m\0\0\0V\0\0\0l\0\0\0N\0\0\0y\0\0\00\0\0\00\0\0\0O\0\0\0D\0\0\0g\0\0\0w\0\0\0L\0\0\0T\0\0\0l\0\0\0j\0\0\0Y\0\0\0T\0\0\0M\0\0\0t\0\0\0Y\0\0\0z\0\0\0Q\0\0\02\0\0\0O\0\0\0T\0\0\0E\0\0\03\0\0\0N\0\0\0D\0\0\0h\0\0\0j\0\0\0O\0\0\0D\0\0\0M\0\0\0w\0\0\0X\0\0\0k\0\0\0E\0\0\0y\0\0\0X\0\0\0k\0\0\0F\0\0\0q\0\0\0c\0\0\0G\0\0\0d\0\0\0e\0\0\0Q\0\0\0X\0\0\0V\0\0\0y\0\0\0N\0\0\0z\0\0\0Y\0\0\0z\0\0\0O\0\0\0D\0\0\0M\0\0\03\0\0\0M\0\0\0z\0\0\0g\0\0\0@\0\0\0.\0\0\0_\0\0\0V\0\0\01\0\0\0_\0\0\0U\0\0\0X\0\0\01\0\0\08\0\0\02\0\0\0_\0\0\0C\0\0\0R\0\0\00\0\0\0,\0\0\00\0\0\0,\0\0\01\0\0\08\0\0\02\0\0\0,\0\0\02\0\0\06\0\0\08\0\0\0_\0\0\0A\0\0\0L\0\0\0_\0\0\0.\0\0\0j\0\0\0p\0\0\0g'),
(8, 'Pitbull. Ostatni pies', '\0\0\0W\0\0 B\0\0\0a\0\0\0d\0\0\0y\0\0\0s\0\0 B\0\0', 2018, 'Sensacyjny', 15, 'Po śmierci Soczka policjanci z warszawskiej komendy rozpoczynają śledztwo. Na wezwanie komendanta do stolicy przybywają Nielat zwany Quantico, Metyl oraz Despero, którzy mają za zadanie powstrzymać gangi walczące między sobą o miasto. ', '\0\0\0h\0\0\0t\0\0\0t\0\0\0p\0\0\0:\0\0\0/\0\0\0/\0\0\0m\0\0\0d\0\0\0k\0\0\0.\0\0\0c\0\0\0z\0\0\0e\0\0\0c\0\0\0h\0\0\0o\0\0\0w\0\0\0i\0\0\0c\0\0\0e\0\0\0-\0\0\0d\0\0\0z\0\0\0i\0\0\0e\0\0\0d\0\0\0z\0\0\0i\0\0\0c\0\0\0e\0\0\0.\0\0\0p\0\0\0l\0\0\0/\0\0\0a\0\0\0s\0\0\0s\0\0\0e\0\0\0t\0\0\0s\0\0\0/\0\0\0P\0\0\0i\0\0\0t\0\0\0b\0\0\0u\0\0\0l\0\0\0l\0\0\0.\0\0\0-\0\0\0O\0\0\0s\0\0\0t\0\0\0a\0\0\0t\0\0\0n\0\0\0i\0\0\0-\0\0\0p\0\0\0i\0\0\0e\0\0\0s\0\0\0.\0\0\0j\0\0\0p\0\0\0g'),
(9, 'Czerwona jaskółka', '\0\0\0F\0\0\0r\0\0\0a\0\0\0n\0\0\0c\0\0\0i\0\0\0s\0\0', 2018, 'Thriller', 15, 'Młoda Rosjanka wbrew swojej woli odbywa szkolenie, podczas którego uczy się uwodzić szpiegów. Niebawem zostaje wysłana do Finlandii, gdzie musi wydobyć tajne informacje od amerykańskiego wywiadowcy. ', '\0\0\0h\0\0\0t\0\0\0t\0\0\0p\0\0\0s\0\0\0:\0\0\0/\0\0\0/\0\0\0e\0\0\0n\0\0\0c\0\0\0r\0\0\0y\0\0\0p\0\0\0t\0\0\0e\0\0\0d\0\0\0-\0\0\0t\0\0\0b\0\0\0n\0\0\00\0\0\0.\0\0\0g\0\0\0s\0\0\0t\0\0\0a\0\0\0t\0\0\0i\0\0\0c\0\0\0.\0\0\0c\0\0\0o\0\0\0m\0\0\0/\0\0\0i\0\0\0m\0\0\0a\0\0\0g\0\0\0e\0\0\0s\0\0\0?\0\0\0q\0\0\0=\0\0\0t\0\0\0b\0\0\0n\0\0\0:\0\0\0A\0\0\0N\0\0\0d\0\0\09\0\0\0G\0\0\0c\0\0\0T\0\0\0b\0\0\0_\0\0\0q\0\0\0x\0\0\0K\0\0\0b\0\0\0P\0\0\0t\0\0\08\0\0\0q\0\0\0J\0\0\0-\0\0\0l\0\0\0i\0\0\0-\0\0\0x\0\0\04\0\0\0_\0\0\0O\0\0\0D\0\0\0V\0\0\03\0\0\05\0\0\0X\0\0\07\0\0\0b\0\0\0E\0\0\07\0\0\08\0\0\04\0\0\02\0\0\08\0\0\0x\0\0\0T\0\0\0S\0\0\0v\0\0\0q\0\0\0V\0\0\0w\0\0\0y\0\0\0Z\0\0\0I\0\0\0N\0\0\0Q\0\0\0U\0\0\0j\0\0\0D\0\0\0p\0\0\0o'),
(10, 'Kobiety mafii', '\0\0\0P\0\0\0a\0\0\0t\0\0\0r\0\0\0y\0\0\0k\0\0\0 \0\0', 2018, 'Sensacyjny', 15, 'Bela, była funkcjonariuszka policji, dostaje od ABW zadanie rozpracowania szajki przestępczej handlującej narkotykami. Aby jej misja się powiodła, musi rozpocząć współpracę z mafią. ', '\0\0\0h\0\0\0t\0\0\0t\0\0\0p\0\0\0:\0\0\0/\0\0\0/\0\0\0w\0\0\0w\0\0\0w\0\0\0.\0\0\0i\0\0\0n\0\0\0f\0\0\0o\0\0\0r\0\0\0m\0\0\0a\0\0\0t\0\0\0o\0\0\0r\0\0\0d\0\0\0a\0\0\0b\0\0\0r\0\0\0o\0\0\0w\0\0\0s\0\0\0k\0\0\0i\0\0\0.\0\0\0p\0\0\0l\0\0\0/\0\0\0w\0\0\0p\0\0\0-\0\0\0c\0\0\0o\0\0\0n\0\0\0t\0\0\0e\0\0\0n\0\0\0t\0\0\0/\0\0\0u\0\0\0p\0\0\0l\0\0\0o\0\0\0a\0\0\0d\0\0\0s\0\0\0/\0\0\02\0\0\00\0\0\01\0\0\08\0\0\0/\0\0\00\0\0\02\0\0\0/\0\0\0K\0\0\0o\0\0\0b\0\0\0i\0\0\0e\0\0\0t\0\0\0y\0\0\0-\0\0\0m\0\0\0a\0\0\0f\0\0\0i\0\0\0i\0\0\0-\0\0\0r\0\0\0e\0\0\0k\0\0\0o\0\0\0r\0\0\0d\0\0\0-\0\0\0o\0\0\0t\0\0\0w\0\0\0a\0\0\0r\0\0\0c\0\0\0i\0\0\0a\0\0\0.\0\0\0j\0\0\0p\0\0\0g'),
(11, 'Cudowny chłopak ', '\0\0\0S\0\0\0t\0\0\0e\0\0\0p\0\0\0h\0\0\0e\0\0\0n\0\0', 2017, 'Familijny', 6, 'Auggie od urodzenia ma zdeformowaną twarz. W nowej szkole chłopiec chce udowodnić rówieśnikom, że piękno to więcej niż wygląd.', '\0\0\0h\0\0\0t\0\0\0t\0\0\0p\0\0\0:\0\0\0/\0\0\0/\0\0\01\0\0\0.\0\0\0f\0\0\0w\0\0\0c\0\0\0d\0\0\0n\0\0\0.\0\0\0p\0\0\0l\0\0\0/\0\0\0p\0\0\0o\0\0\0/\0\0\06\0\0\03\0\0\0/\0\0\08\0\0\07\0\0\0/\0\0\07\0\0\07\0\0\06\0\0\03\0\0\08\0\0\07\0\0\0/\0\0\07\0\0\08\0\0\02\0\0\08\0\0\01\0\0\06\0\0\04\0\0\0.\0\0\03\0\0\0.\0\0\0j\0\0\0p\0\0\0g'),
(12, 'Luis i obcy', '\0\0\0W\0\0\0o\0\0\0l\0\0\0f\0\0\0g\0\0\0a\0\0\0n\0\0', 2018, 'Animacja', 0, '12-letni Luis czuje się samotny. Nie ma żadnych przyjaciół, a jego ojciec – ufolog Armin – całe noce spędza przy teleskopie, szukając śladów życia w kosmosie.', '\0\0\0h\0\0\0t\0\0\0t\0\0\0p\0\0\0:\0\0\0/\0\0\0/\0\0\01\0\0\0.\0\0\0f\0\0\0w\0\0\0c\0\0\0d\0\0\0n\0\0\0.\0\0\0p\0\0\0l\0\0\0/\0\0\0p\0\0\0o\0\0\0/\0\0\04\0\0\05\0\0\0/\0\0\09\0\0\03\0\0\0/\0\0\08\0\0\00\0\0\04\0\0\05\0\0\09\0\0\03\0\0\0/\0\0\07\0\0\08\0\0\03\0\0\04\0\0\07\0\0\07\0\0\02\0\0\0.\0\0\03\0\0\0.\0\0\0j\0\0\0p\0\0\0g'),
(13, 'Lady Bird', '\0\0\0G\0\0\0r\0\0\0e\0\0\0t\0\0\0a\0\0\0 \0\0\0G\0\0', 2017, 'Dramat', 12, 'Rok z życia zbuntowanej dziewczyny, która uczy się w katolickim liceum.', '\0\0\0h\0\0\0t\0\0\0t\0\0\0p\0\0\0s\0\0\0:\0\0\0/\0\0\0/\0\0\0i\0\0\0s\0\0\04\0\0\0-\0\0\0s\0\0\0s\0\0\0l\0\0\0.\0\0\0m\0\0\0z\0\0\0s\0\0\0t\0\0\0a\0\0\0t\0\0\0i\0\0\0c\0\0\0.\0\0\0c\0\0\0o\0\0\0m\0\0\0/\0\0\0i\0\0\0m\0\0\0a\0\0\0g\0\0\0e\0\0\0/\0\0\0t\0\0\0h\0\0\0u\0\0\0m\0\0\0b\0\0\0/\0\0\0V\0\0\0i\0\0\0d\0\0\0e\0\0\0o\0\0\01\0\0\01\0\0\08\0\0\0/\0\0\0v\0\0\04\0\0\0/\0\0\03\0\0\03\0\0\0/\0\0\0f\0\0\0f\0\0\0/\0\0\04\0\0\06\0\0\0/\0\0\03\0\0\03\0\0\0f\0\0\0f\0\0\04\0\0\06\0\0\00\0\0\00\0\0\0-\0\0\07\0\0\0d\0\0\01\0\0\0b\0\0\0-\0\0\00\0\0\0e\0\0\08\0\0\0a\0\0\0-\0\0\05\0\0\00\0\0\0b\0\0\09\0\0\0-\0\0\05\0\0\0f\0\0\0d\0\0\0b\0\0\08\0\0\03\0\0\0c\0\0\06\0\0\0e\0\0\02\0\0\0a\0\0\0b\0\0\0/\0\0\0s\0\0\0o\0\0\0u\0\0\0r\0\0\0c\0\0\0e\0\0\0/\0\0\01\0\0\02\0\0\00\0\0\00\0\0\0x\0\0\06\0\0\03\0\0\00\0\0\0b\0\0\0b\0\0\0.\0\0\0j\0\0\0p\0\0\0g');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klient`
--

CREATE TABLE `klient` (
  `IdKlient` int(11) NOT NULL,
  `imie` varchar(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(30) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `telefon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Zrzut danych tabeli `klient`
--

INSERT INTO `klient` (`IdKlient`, `imie`, `nazwisko`, `email`, `telefon`) VALUES
(1, 'Ewa', 'Zajdel', 'ewitka.z@gmail.com', 123456799),
(37, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(38, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(39, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(40, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(41, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(42, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(43, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(44, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(45, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(46, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(47, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(48, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(49, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(50, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(51, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(52, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(53, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(54, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(55, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(56, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(57, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(58, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(59, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(60, 'obostrzenie', 'xxdd', 'monika@glupia.pl', 123456789),
(61, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(62, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(63, 'obostrzenie', 'xxd', 'monika@super.pl', 123456789),
(64, 'obostrzenie', 'xxd', 'monika@glupia.pl', 123456789),
(65, 'obostrzenie', 'xxd', 'gosia@super.pl', 123456789),
(66, 'gosia', 'super', 'gosia@super.pl', 123456789),
(67, 'gosia', 'super', 'gosia@super.pl', 123456789),
(68, 'gosia', 'super', 'gosia@super.pl', 123456789),
(69, 'gosia', 'super', 'gosia@super.pl', 123456789),
(70, 'gosia', 'super', 'gosia@super.pl', 123456789),
(71, 'gosia', 'super', 'gosia@super.pl', 123456789),
(72, 'gosia', 'super', 'gosia@super.pl', 123456789),
(73, 'gosia', 'super', 'gosia@super.pl', 123456789),
(74, 'gosia', 'super', 'gosia@super.pl', 123456789),
(75, 'gosia', 'super', 'gosia@super.pl', 123456789),
(76, 'gosia', 'super', 'gosia@super.pl', 123456789),
(77, 'gosia', 'super', 'gosia@super.pl', 123456789),
(78, 'gosia', 'super', 'gosia@super.pl', 123456789),
(79, 'gosia', 'super', 'gosia@super.pl', 123456789),
(80, 'gosia', 'super', 'gosia@super.pl', 123456789),
(81, 'gosia', 'super', 'gosia@super.pl', 123456789),
(82, 'gosia', 'super', 'gosia@super.pl', 123456789),
(83, 'gosia', 'super', 'gosia@super.pl', 123456789),
(84, 'gosia', 'super', 'gosia@super.pl', 123456789),
(85, 'gosia', 'super', 'gosia@super.pl', 123456789),
(86, 'gosia', 'super', 'gosia@super.pl', 123456789),
(87, 'gosia', 'super', 'gosia@super.pl', 123456789),
(88, 'gosia', 'super', 'gosia@super.pl', 123456789),
(89, 'gosia', 'super', 'gosia@super.pl', 123456789),
(90, 'gosia', 'super', 'gosia@super.pl', 123456789),
(91, 'gosia', 'super', 'gosia@super.pl', 123456789),
(92, 'wasd', 'super', 'gosia@super.pl', 123456789),
(93, 'gosia', 'super', 'gosia@super.pl', 123456789),
(94, 'gosia', 'super', 'gosia@super.pl', 123456789),
(95, 'gosia', 'super', 'gosia@super.pl', 123456789),
(96, 'gosia', 'super', 'gosia@super.pl', 123456789);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lokalizacja`
--

CREATE TABLE `lokalizacja` (
  `IdLokalizacja` int(11) NOT NULL,
  `lokalizacja` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `lokalizacja`
--

INSERT INTO `lokalizacja` (`IdLokalizacja`, `lokalizacja`) VALUES
(1, 'Wrocław'),
(2, 'Poznań');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `miejsce`
--

CREATE TABLE `miejsce` (
  `IdMiejsce` int(11) NOT NULL,
  `rzad` text COLLATE utf32_polish_ci NOT NULL,
  `miejsce` int(2) NOT NULL,
  `dostepnosc` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Zrzut danych tabeli `miejsce`
--

INSERT INTO `miejsce` (`IdMiejsce`, `rzad`, `miejsce`, `dostepnosc`) VALUES
(1, 'A', 1, 0),
(2, 'A', 2, 0),
(3, 'A', 3, 0),
(4, 'A', 4, 0),
(5, 'A', 5, 0),
(6, 'A', 6, 0),
(7, 'A', 7, 0),
(8, 'A', 8, 0),
(9, 'A', 9, 0),
(10, 'A', 10, 0),
(11, 'B', 1, 0),
(12, 'B', 2, 0),
(13, 'B', 3, 0),
(14, 'B', 4, 0),
(15, 'B', 5, 0),
(16, 'B', 6, 0),
(17, 'B', 7, 0),
(18, 'B', 8, 0),
(19, 'B', 9, 0),
(20, 'B', 10, 0),
(21, 'C', 1, 0),
(22, 'C', 2, 0),
(23, 'C', 3, 0),
(24, 'C', 4, 0),
(25, 'C', 5, 0),
(26, 'C', 6, 0),
(27, 'C', 7, 0),
(28, 'C', 8, 0),
(29, 'C', 9, 0),
(30, 'C', 10, 0),
(31, 'D', 1, 0),
(32, 'D', 2, 0),
(33, 'D', 3, 0),
(34, 'D', 4, 0),
(35, 'D', 5, 0),
(36, 'D', 6, 0),
(37, 'D', 7, 0),
(38, 'D', 8, 0),
(39, 'D', 9, 0),
(40, 'D', 10, 0),
(41, 'E', 1, 0),
(42, 'E', 2, 0),
(43, 'E', 3, 0),
(44, 'E', 4, 0),
(45, 'E', 5, 0),
(46, 'E', 6, 0),
(47, 'E', 7, 0),
(48, 'E', 8, 0),
(49, 'E', 9, 0),
(50, 'E', 10, 0),
(51, 'F', 1, 0),
(52, 'F', 2, 0),
(53, 'F', 3, 0),
(54, 'F', 4, 0),
(55, 'F', 5, 0),
(56, 'F', 6, 0),
(57, 'F', 7, 0),
(58, 'F', 8, 0),
(59, 'F', 9, 0),
(60, 'F', 10, 0),
(61, 'G', 1, 0),
(62, 'G', 2, 0),
(63, 'G', 3, 0),
(64, 'G', 4, 0),
(65, 'G', 5, 0),
(66, 'G', 6, 0),
(67, 'G', 7, 0),
(68, 'G', 8, 0),
(69, 'G', 9, 0),
(70, 'G', 10, 0),
(71, 'I', 1, 0),
(72, 'I', 2, 0),
(73, 'I', 3, 0),
(74, 'I', 4, 0),
(75, 'I', 5, 0),
(76, 'I', 6, 0),
(77, 'I', 7, 0),
(78, 'I', 8, 0),
(79, 'I', 9, 0),
(80, 'I', 10, 0),
(81, 'J', 1, 0),
(82, 'J', 2, 0),
(83, 'J', 3, 0),
(84, 'J', 4, 0),
(85, 'J', 5, 0),
(86, 'J', 6, 0),
(87, 'J', 7, 0),
(88, 'J', 8, 0),
(89, 'J', 9, 0),
(90, 'J', 10, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `numer_sali`
--

CREATE TABLE `numer_sali` (
  `IdSala` int(11) NOT NULL,
  `IdLokalizacja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `numer_sali`
--

INSERT INTO `numer_sali` (`IdSala`, `IdLokalizacja`) VALUES
(12, 1),
(14, 1),
(11, 2),
(13, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownik`
--

CREATE TABLE `pracownik` (
  `IdPracownik` int(11) NOT NULL,
  `user` varchar(30) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `pass` varchar(30) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Zrzut danych tabeli `pracownik`
--

INSERT INTO `pracownik` (`IdPracownik`, `user`, `pass`) VALUES
(1, 'annakowalska', 'annakowalska'),
(2, 'jankowalski', 'jankowalski'),
(3, 'ewazajdel', 'ewazajdel'),
(4, 'monikawojcik', 'monikawojcik'),
(5, 'admin', 'admin'),
(6, 'prac1', 'prac1'),
(7, 'prac2', 'prac2'),
(8, 'prac3', 'prac3');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `repertuar`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `repertuar` (
`tytul` varchar(30)
,`wiek` int(11)
,`godzina` datetime
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rodzaj_biletu`
--

CREATE TABLE `rodzaj_biletu` (
  `IdRodzajBiletu` int(11) NOT NULL,
  `cena` int(11) NOT NULL,
  `rodzaj` varchar(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Zrzut danych tabeli `rodzaj_biletu`
--

INSERT INTO `rodzaj_biletu` (`IdRodzajBiletu`, `cena`, `rodzaj`) VALUES
(2, 20, 'normalny'),
(3, 15, 'ulgowy'),
(4, 10, 'student'),
(5, 10, 'senior');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `seans`
--

CREATE TABLE `seans` (
  `IdSeans` int(11) NOT NULL,
  `IdFilm` int(11) NOT NULL,
  `IdSala` int(11) NOT NULL,
  `typ` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `dzien` date NOT NULL,
  `godzina` datetime NOT NULL,
  `czas_trwania` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `seans`
--

INSERT INTO `seans` (`IdSeans`, `IdFilm`, `IdSala`, `typ`, `dzien`, `godzina`, `czas_trwania`) VALUES
(5, 5, 11, 'bajka', '2018-05-31', '2018-05-31 10:00:00', '03:00:00'),
(6, 1, 11, 'asd', '2018-05-30', '2018-05-30 06:00:00', '08:00:00'),
(7, 12, 12, '', '2018-05-31', '2018-05-31 19:00:00', '12:00:00'),
(9, 5, 12, 'zsd', '2018-06-13', '2018-06-13 07:00:00', '05:00:00');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widokmiejsc`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `widokmiejsc` (
`IdMiejsce` int(11)
,`dostepnosc` tinyint(4)
,`IdSeans` int(11)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `zamowienia`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `zamowienia` (
`IdBilet` int(11)
,`dzien` date
,`godzina` datetime
,`email` varchar(50)
);

-- --------------------------------------------------------

--
-- Struktura widoku `repertuar`
--
DROP TABLE IF EXISTS `repertuar`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `repertuar`  AS  select `film`.`tytul` AS `tytul`,`film`.`wiek` AS `wiek`,`seans`.`godzina` AS `godzina` from (`film` join `seans`) ;

-- --------------------------------------------------------

--
-- Struktura widoku `widokmiejsc`
--
DROP TABLE IF EXISTS `widokmiejsc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widokmiejsc`  AS  select `miejsce`.`IdMiejsce` AS `IdMiejsce`,`miejsce`.`dostepnosc` AS `dostepnosc`,`seans`.`IdSeans` AS `IdSeans` from (`miejsce` join `seans`) ;

-- --------------------------------------------------------

--
-- Struktura widoku `zamowienia`
--
DROP TABLE IF EXISTS `zamowienia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zamowienia`  AS  select `bilet`.`IdBilet` AS `IdBilet`,`seans`.`dzien` AS `dzien`,`seans`.`godzina` AS `godzina`,`klient`.`email` AS `email` from ((`bilet` join `klient`) join `seans`) ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `bilet`
--
ALTER TABLE `bilet`
  ADD PRIMARY KEY (`IdBilet`),
  ADD KEY `wydaje` (`IdPracownik`),
  ADD KEY `ma` (`IdSeans`),
  ADD KEY `siedzi` (`IdMiejsce`),
  ADD KEY `klient_id` (`IdKlient`) USING BTREE,
  ADD KEY `IdSeans` (`IdRodzajBiletu`,`IdPracownik`) USING BTREE;

--
-- Indeksy dla tabeli `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`IdFilm`);

--
-- Indeksy dla tabeli `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`IdKlient`);

--
-- Indeksy dla tabeli `lokalizacja`
--
ALTER TABLE `lokalizacja`
  ADD PRIMARY KEY (`IdLokalizacja`);

--
-- Indeksy dla tabeli `miejsce`
--
ALTER TABLE `miejsce`
  ADD PRIMARY KEY (`IdMiejsce`);

--
-- Indeksy dla tabeli `numer_sali`
--
ALTER TABLE `numer_sali`
  ADD PRIMARY KEY (`IdSala`),
  ADD KEY `lokalizacjaa` (`IdLokalizacja`);

--
-- Indeksy dla tabeli `pracownik`
--
ALTER TABLE `pracownik`
  ADD PRIMARY KEY (`IdPracownik`);

--
-- Indeksy dla tabeli `rodzaj_biletu`
--
ALTER TABLE `rodzaj_biletu`
  ADD PRIMARY KEY (`IdRodzajBiletu`);

--
-- Indeksy dla tabeli `seans`
--
ALTER TABLE `seans`
  ADD PRIMARY KEY (`IdSeans`),
  ADD KEY `w` (`IdSala`),
  ADD KEY `IdFilm` (`IdFilm`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `bilet`
--
ALTER TABLE `bilet`
  MODIFY `IdBilet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT dla tabeli `film`
--
ALTER TABLE `film`
  MODIFY `IdFilm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT dla tabeli `klient`
--
ALTER TABLE `klient`
  MODIFY `IdKlient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT dla tabeli `lokalizacja`
--
ALTER TABLE `lokalizacja`
  MODIFY `IdLokalizacja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `miejsce`
--
ALTER TABLE `miejsce`
  MODIFY `IdMiejsce` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT dla tabeli `numer_sali`
--
ALTER TABLE `numer_sali`
  MODIFY `IdSala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT dla tabeli `pracownik`
--
ALTER TABLE `pracownik`
  MODIFY `IdPracownik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `rodzaj_biletu`
--
ALTER TABLE `rodzaj_biletu`
  MODIFY `IdRodzajBiletu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `seans`
--
ALTER TABLE `seans`
  MODIFY `IdSeans` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `bilet`
--
ALTER TABLE `bilet`
  ADD CONSTRAINT `grane` FOREIGN KEY (`IdSeans`) REFERENCES `seans` (`IdSeans`) ON UPDATE CASCADE,
  ADD CONSTRAINT `jest składane przez` FOREIGN KEY (`IdKlient`) REFERENCES `klient` (`IdKlient`) ON UPDATE CASCADE,
  ADD CONSTRAINT `posiada` FOREIGN KEY (`IdRodzajBiletu`) REFERENCES `rodzaj_biletu` (`IdRodzajBiletu`) ON UPDATE CASCADE,
  ADD CONSTRAINT `siedzi` FOREIGN KEY (`IdMiejsce`) REFERENCES `miejsce` (`IdMiejsce`) ON UPDATE CASCADE,
  ADD CONSTRAINT `wydaje` FOREIGN KEY (`IdPracownik`) REFERENCES `pracownik` (`IdPracownik`) ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `numer_sali`
--
ALTER TABLE `numer_sali`
  ADD CONSTRAINT `lokalizacjaa` FOREIGN KEY (`IdLokalizacja`) REFERENCES `lokalizacja` (`IdLokalizacja`) ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `seans`
--
ALTER TABLE `seans`
  ADD CONSTRAINT `poleci` FOREIGN KEY (`IdFilm`) REFERENCES `film` (`IdFilm`) ON UPDATE CASCADE,
  ADD CONSTRAINT `w` FOREIGN KEY (`IdSala`) REFERENCES `numer_sali` (`IdSala`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
