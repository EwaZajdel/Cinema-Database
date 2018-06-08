-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 05 Cze 2018, 11:39
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
  `IdKlient` int(11) DEFAULT NULL,
  `IdSeans` int(11) NOT NULL,
  `IdRodzajBiletu` int(11) NOT NULL,
  `IdPracownik` int(11) DEFAULT NULL,
  `IdMiejsce` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Zrzut danych tabeli `bilet`
--

INSERT INTO `bilet` (`IdBilet`, `IdKlient`, `IdSeans`, `IdRodzajBiletu`, `IdPracownik`, `IdMiejsce`) VALUES
(130, 97, 15, 2, NULL, 34),
(132, 97, 15, 2, NULL, 36),
(133, 97, 15, 2, NULL, 37),
(134, 97, 15, 5, NULL, 38),
(135, 97, 15, 5, NULL, 39),
(136, 97, 15, 3, NULL, 40),
(137, 97, 15, 3, NULL, 44),
(138, 97, 15, 3, NULL, 45),
(139, 97, 15, 3, NULL, 54),
(140, 97, 15, 3, NULL, 55),
(141, 97, 15, 4, NULL, 64),
(142, 97, 15, 4, NULL, 65),
(143, 97, 15, 4, NULL, 77),
(144, NULL, 15, 4, 5, 51),
(145, NULL, 15, 4, 5, 52),
(146, NULL, 21, 2, 5, 82);

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
(1, 'Kształt wody', 'Guillermo del Toro', 2017, 'Fantasy', 12, 'Elisa Esposito pracuje jako woźna w tajnym rządowym laboratorium. Jej życie ulega nagłej zmianie, gdy odkrywa pilnie strzeżony sekret.', 'http://1.fwcdn.pl/po/59/70/775970/7828022.6.jpg'),
(2, 'Deadpool 2', 'David Leitch', 2018, 'Sci-Fi', 12, 'Po przeżyciu wypadku oszpecony superbohater stara się odzyskać swoją pasję do życia podróżując po świecie i walcząc z przestępcami. ', 'http://1.fwcdn.pl/po/04/29/760429/7840533.3.jpg'),
(3, 'Czwarta władza', 'Steven Spielberg', 2017, 'Dramat', 0, 'Działania prezydenta USA doprowadzają do konfliktu pomiędzy dziennikarzami a rządem.', 'http://1.fwcdn.pl/po/47/05/794705/7828024.6.jpg'),
(4, 'Tamte dni, tamte noce', 'Luca Guadagnino', 2017, 'Melodramat', 12, 'Nastoletni chłopak zakochuje się w gościu, który przyjechał na wakacje do jego rodziców.', 'http://ecsmedia.pl/c/tamte-dni-tamte-noce-w-iext52177165.jpg'),
(5, 'Coco', 'Lee Unkrich', 2018, 'Animacja', 0, 'Dwunastoletni meksykański chłopiec imieniem Miguel pragnie zgłębić tajemnice rodzinnej legendy.', 'http://1.fwcdn.pl/po/22/60/752260/7813486.6.jpg'),
(6, 'Twój Vincent ', 'Dorota Kobiela', 2017, 'Animacja', 6, 'Bohaterowie obrazów Vincenta van Gogha przedstawiają historię życia oraz tajemniczej śmierci artysty. ', 'http://1.fwcdn.pl/po/82/07/698207/7799420.6.jpg'),
(7, 'Tomb Raider ', 'Roar Uthaug', 2018, 'Przygodowy', 12, 'Lara Croft wyrusza w swoją pierwszą ekspedycję, aby odnaleźć zaginionego ojca na niezbadanej wyspie u wybrzeży Japonii.', 'https://ia.media-imdb.com/images/M/MV5BOTY4NDcyZGQtYmVlNy00ODgwLTljYTMtYzQ2OTE3NDhjODMwXkEyXkFqcGdeQXVyNzYzODM3Mzg@._V1_UX182_CR0,0,182,268_AL_.jpg'),
(8, 'Pitbull. Ostatni pies', 'Władysław Pasikowski', 2018, 'Sensacyjny', 15, 'Po śmierci Soczka policjanci z warszawskiej komendy rozpoczynają śledztwo. Na wezwanie komendanta do stolicy przybywają Nielat zwany Quantico, Metyl oraz Despero, którzy mają za zadanie powstrzymać gangi walczące między sobą o miasto. ', 'http://1.fwcdn.pl/po/50/63/795063/7824694.6.jpg'),
(9, 'Czerwona jaskółka', 'Francis Lawrence', 2018, 'Thriller', 15, 'Młoda Rosjanka wbrew swojej woli odbywa szkolenie, podczas którego uczy się uwodzić szpiegów. Niebawem zostaje wysłana do Finlandii, gdzie musi wydobyć tajne informacje od amerykańskiego wywiadowcy. ', 'https://cdn.bonito.pl/zdjecia/2/4f3bc20d4b-czerwona-jaskolka.jpg'),
(10, 'Kobiety mafii', 'Patryk Vega', 2018, 'Sensacyjny', 15, 'Bela, była funkcjonariuszka policji, dostaje od ABW zadanie rozpracowania szajki przestępczej handlującej narkotykami. Aby jej misja się powiodła, musi rozpocząć współpracę z mafią. ', 'http://1.fwcdn.pl/po/57/58/795758/7823050.6.jpg'),
(11, 'Cudowny chłopak ', 'Stephen Chbosky', 2017, 'Familijny', 6, 'Auggie od urodzenia ma zdeformowaną twarz. W nowej szkole chłopiec chce udowodnić rówieśnikom, że piękno to więcej niż wygląd.', 'http://1.fwcdn.pl/po/63/87/776387/7828164.3.jpg'),
(12, 'Luis i obcy', 'Wolfgang Lauenstein', 2018, 'Animacja', 0, '12-letni Luis czuje się samotny. Nie ma żadnych przyjaciół, a jego ojciec – ufolog Armin – całe noce spędza przy teleskopie, szukając śladów życia w kosmosie.', 'http://1.fwcdn.pl/po/45/93/804593/7834772.5.jpg'),
(13, 'Lady Bird', 'Greta Gerwig', 2017, 'Dramat', 12, 'Rok z życia zbuntowanej dziewczyny, która uczy się w katolickim liceum.', 'https://ars.pl/wp-content/uploads/2018/01/Lady-Bird_plakat.jpg');

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
(96, 'Ewa', 'Monika', 'aresik20@gmail.com', 213456789),
(97, 'Monika', 'WÃ³jcik', 'monika.wojcik5@gmail.com', 123456789);

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
(5, 'admin', 'admin');

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
(14, 5, 11, 'Dubbing', '2018-06-16', '2018-06-16 10:15:00', '02:10:00'),
(15, 5, 13, 'Dubbing', '2018-06-16', '2018-06-16 09:00:00', '02:10:00'),
(16, 5, 12, 'Napisy PL', '2018-06-16', '2018-06-16 13:00:00', '02:10:00'),
(17, 5, 14, 'Napisy PL', '2018-06-16', '2018-06-16 15:00:00', '02:10:00'),
(18, 1, 12, 'Napisy PL', '2018-06-16', '2018-06-16 17:00:00', '01:50:00'),
(19, 1, 13, 'Napisy PL', '2018-06-16', '2018-06-16 15:00:00', '01:50:00'),
(21, 2, 11, 'Dubbing', '2018-06-17', '2018-06-17 20:00:00', '01:55:00'),
(22, 2, 12, 'Dubbing', '2018-06-17', '2018-06-17 15:00:00', '01:55:00'),
(23, 2, 13, 'Dubbing', '2018-06-17', '2018-06-17 21:00:00', '01:55:00'),
(24, 2, 14, 'Dubbing', '2018-06-18', '2018-06-18 21:00:00', '01:55:00'),
(25, 2, 14, 'Dubbing', '2018-06-18', '2018-06-18 16:00:00', '01:55:00'),
(26, 3, 13, 'PL', '2018-06-07', '2018-06-29 15:00:00', '02:01:00');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `v_lokalizacja`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `v_lokalizacja` (
`lokalizacja` text
,`IdSala` int(11)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `v_sprzedane`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `v_sprzedane` (
`IdPracownik` int(11)
,`IdBilet` int(11)
,`dzien` date
,`godzina` datetime
,`tytul` varchar(30)
,`IdMiejsce` int(11)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `v_zamowienia`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `v_zamowienia` (
`IdKlient` int(11)
,`IdBilet` int(11)
,`email` varchar(50)
,`dzien` date
,`godzina` datetime
,`tytul` varchar(30)
,`IdMiejsce` int(11)
);

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
-- Struktura widoku `v_lokalizacja`
--
DROP TABLE IF EXISTS `v_lokalizacja`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_lokalizacja`  AS  select `l`.`lokalizacja` AS `lokalizacja`,`ns`.`IdSala` AS `IdSala` from (`numer_sali` `ns` left join `lokalizacja` `l` on((`l`.`IdLokalizacja` = `ns`.`IdLokalizacja`))) ;

-- --------------------------------------------------------

--
-- Struktura widoku `v_sprzedane`
--
DROP TABLE IF EXISTS `v_sprzedane`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sprzedane`  AS  select `p`.`IdPracownik` AS `IdPracownik`,`b`.`IdBilet` AS `IdBilet`,`s`.`dzien` AS `dzien`,`s`.`godzina` AS `godzina`,`f`.`tytul` AS `tytul`,`m`.`IdMiejsce` AS `IdMiejsce` from ((((`pracownik` `p` left join `bilet` `b` on((`p`.`IdPracownik` = `b`.`IdPracownik`))) left join `miejsce` `m` on((`m`.`IdMiejsce` = `b`.`IdMiejsce`))) left join `seans` `s` on((`s`.`IdSeans` = `b`.`IdSeans`))) left join `film` `f` on((`f`.`IdFilm` = `s`.`IdFilm`))) ;

-- --------------------------------------------------------

--
-- Struktura widoku `v_zamowienia`
--
DROP TABLE IF EXISTS `v_zamowienia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_zamowienia`  AS  select `k`.`IdKlient` AS `IdKlient`,`b`.`IdBilet` AS `IdBilet`,`k`.`email` AS `email`,`s`.`dzien` AS `dzien`,`s`.`godzina` AS `godzina`,`f`.`tytul` AS `tytul`,`m`.`IdMiejsce` AS `IdMiejsce` from ((((`klient` `k` left join `bilet` `b` on((`b`.`IdKlient` = `k`.`IdKlient`))) left join `seans` `s` on((`s`.`IdSeans` = `b`.`IdSeans`))) left join `film` `f` on((`f`.`IdFilm` = `s`.`IdFilm`))) left join `miejsce` `m` on((`m`.`IdMiejsce` = `b`.`IdMiejsce`))) ;

-- --------------------------------------------------------

--
-- Struktura widoku `widokmiejsc`
--
DROP TABLE IF EXISTS `widokmiejsc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widokmiejsc`  AS  select `miejsce`.`IdMiejsce` AS `IdMiejsce`,`miejsce`.`dostepnosc` AS `dostepnosc`,`seans`.`IdSeans` AS `IdSeans` from (`miejsce` join `seans`) ;

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
  MODIFY `IdBilet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT dla tabeli `film`
--
ALTER TABLE `film`
  MODIFY `IdFilm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT dla tabeli `klient`
--
ALTER TABLE `klient`
  MODIFY `IdKlient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

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
  MODIFY `IdPracownik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT dla tabeli `rodzaj_biletu`
--
ALTER TABLE `rodzaj_biletu`
  MODIFY `IdRodzajBiletu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `seans`
--
ALTER TABLE `seans`
  MODIFY `IdSeans` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
