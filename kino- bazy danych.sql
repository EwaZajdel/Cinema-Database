-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 20 Kwi 2018, 11:59
-- Wersja serwera: 10.1.31-MariaDB
-- Wersja PHP: 7.2.3

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
  `IdPracownik` int(11) NOT NULL,
  `dostepnosc` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `film`
--

CREATE TABLE `film` (
  `IdFilm` int(11) NOT NULL,
  `tytul` varchar(30) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `rezyser` varchar(30) COLLATE utf32_polish_ci NOT NULL,
  `rok_wydania` year(4) NOT NULL,
  `rodzaj` varchar(50) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `wiek` int(11) NOT NULL,
  `opis` varchar(255) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Zrzut danych tabeli `film`
--

INSERT INTO `film` (`IdFilm`, `tytul`, `rezyser`, `rok_wydania`, `rodzaj`, `wiek`, `opis`) VALUES
(1, 'Kształt wody', 'Guillermo del Toro', 2017, 'Fantasy', 12, 'Elisa Esposito pracuje jako woźna w tajnym rządowym laboratorium. Jej życie ulega nagłej zmianie, gdy odkrywa pilnie strzeżony sekret.'),
(2, 'Czas mroku', '	Joe Wright', 2017, 'Biograficzny', 12, 'Winston Churchill zostaje premierem Wielkiej Brytanii. Jego pierwszym zadaniem jest zjednoczenie narodu w obliczu groźby inwazji nazistowskich Niemiec.'),
(3, 'Czwarta władza', 'Steven Spielberg', 2017, 'Dramat', 0, 'Działania prezydenta USA doprowadzają do konfliktu pomiędzy dziennikarzami a rządem.'),
(4, 'Tamte dni, tamte noce', 'Luca Guadagnino', 2017, 'Melodramat', 12, 'Nastoletni chłopak zakochuje się w gościu, który przyjechał na wakacje do jego rodziców.'),
(5, 'Jaskiniowiec', 'Nick Park', 2018, 'Animacja', 0, 'W czasach, kiedy po ziemi chodziły dinozaury i mamuty, dzielny jaskiniowiec jednoczy plemię przeciwko potężnemu wrogowi.'),
(6, 'Twój Vincent ', 'Dorota Kobiela', 2017, 'Animacja', 6, 'Bohaterowie obrazów Vincenta van Gogha przedstawiają historię życia oraz tajemniczej śmierci artysty. '),
(7, 'Tomb Raider ', 'Roar Uthaug', 2018, 'Przygodowy', 12, 'Lara Croft wyrusza w swoją pierwszą ekspedycję, aby odnaleźć zaginionego ojca na niezbadanej wyspie u wybrzeży Japonii.'),
(8, 'Pitbull. Ostatni pies', 'Władysław Pasikowski', 2018, 'Sensacyjny', 15, 'Po śmierci Soczka policjanci z warszawskiej komendy rozpoczynają śledztwo. Na wezwanie komendanta do stolicy przybywają Nielat zwany Quantico, Metyl oraz Despero, którzy mają za zadanie powstrzymać gangi walczące między sobą o miasto. '),
(9, 'Czerwona jaskółka', 'Francis Lawrence', 2018, 'Thriller', 15, 'Młoda Rosjanka wbrew swojej woli odbywa szkolenie, podczas którego uczy się uwodzić szpiegów. Niebawem zostaje wysłana do Finlandii, gdzie musi wydobyć tajne informacje od amerykańskiego wywiadowcy. '),
(10, 'Kobiety mafii', 'Patryk Vega', 2018, 'Sensacyjny', 15, 'Bela, była funkcjonariuszka policji, dostaje od ABW zadanie rozpracowania szajki przestępczej handlującej narkotykami. Aby jej misja się powiodła, musi rozpocząć współpracę z mafią. '),
(11, 'Cudowny chłopak ', 'Stephen Chbosky', 2017, 'Familijny', 6, 'Auggie od urodzenia ma zdeformowaną twarz. W nowej szkole chłopiec chce udowodnić rówieśnikom, że piękno to więcej niż wygląd.'),
(12, 'Luis i obcy', 'Wolfgang Lauenstein', 2018, 'Animacja', 0, '12-letni Luis czuje się samotny. Nie ma żadnych przyjaciół, a jego ojciec – ufolog Armin – całe noce spędza przy teleskopie, szukając śladów życia w kosmosie.'),
(13, 'Lady Bird', 'Greta Gerwig', 2017, 'Dramat', 12, 'Rok z życia zbuntowanej dziewczyny, która uczy się w katolickim liceum.');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klient`
--

CREATE TABLE `klient` (
  `IdKlient` int(11) NOT NULL,
  `imie` varchar(20) COLLATE utf32_polish_ci NOT NULL,
  `nazwisko` varchar(30) COLLATE utf32_polish_ci NOT NULL,
  `email` varchar(50) COLLATE utf32_polish_ci NOT NULL,
  `telefon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `miejsce`
--

CREATE TABLE `miejsce` (
  `IdMiejsce` float NOT NULL,
  `miejce` int(11) NOT NULL,
  `rzad` int(11) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Zrzut danych tabeli `miejsce`
--

INSERT INTO `miejsce` (`IdMiejsce`, `miejce`, `rzad`, `data`) VALUES
(1.01, 1, 10, '0000-00-00'),
(1.1, 1, 1, '0000-00-00'),
(1.2, 1, 2, '0000-00-00'),
(1.3, 1, 3, '0000-00-00'),
(1.4, 1, 4, '0000-00-00'),
(1.5, 1, 5, '0000-00-00'),
(1.6, 1, 6, '0000-00-00'),
(1.7, 1, 7, '0000-00-00'),
(1.8, 1, 8, '0000-00-00'),
(1.9, 1, 9, '0000-00-00'),
(2.01, 2, 10, '0000-00-00'),
(2.1, 2, 1, '0000-00-00'),
(2.2, 2, 2, '0000-00-00'),
(2.3, 2, 3, '0000-00-00'),
(2.4, 2, 4, '0000-00-00'),
(2.5, 2, 5, '0000-00-00'),
(2.6, 2, 6, '0000-00-00'),
(2.7, 2, 7, '0000-00-00'),
(2.8, 2, 8, '0000-00-00'),
(2.9, 2, 9, '0000-00-00'),
(3.01, 3, 10, '0000-00-00'),
(3.1, 3, 1, '0000-00-00'),
(3.2, 3, 2, '0000-00-00'),
(3.3, 3, 3, '0000-00-00'),
(3.4, 3, 4, '0000-00-00'),
(3.5, 3, 5, '0000-00-00'),
(3.6, 3, 6, '0000-00-00'),
(3.7, 3, 7, '0000-00-00'),
(3.8, 3, 8, '0000-00-00'),
(3.9, 3, 9, '0000-00-00'),
(4.01, 4, 10, '0000-00-00'),
(4.1, 4, 1, '0000-00-00'),
(4.2, 4, 2, '0000-00-00'),
(4.3, 4, 3, '0000-00-00'),
(4.4, 4, 4, '0000-00-00'),
(4.5, 4, 5, '0000-00-00'),
(4.6, 4, 6, '0000-00-00'),
(4.7, 4, 7, '0000-00-00'),
(4.8, 4, 8, '0000-00-00'),
(4.9, 4, 9, '0000-00-00'),
(5.01, 5, 10, '0000-00-00'),
(5.1, 5, 1, '0000-00-00'),
(5.2, 5, 2, '0000-00-00'),
(5.3, 5, 3, '0000-00-00'),
(5.4, 5, 4, '0000-00-00'),
(5.5, 5, 5, '0000-00-00'),
(5.7, 5, 7, '0000-00-00'),
(5.8, 5, 8, '0000-00-00'),
(5.9, 5, 9, '0000-00-00'),
(6.01, 6, 10, '0000-00-00'),
(6.1, 6, 1, '0000-00-00'),
(6.2, 6, 2, '0000-00-00'),
(6.3, 6, 3, '0000-00-00'),
(6.4, 6, 4, '0000-00-00'),
(6.5, 6, 5, '0000-00-00'),
(6.6, 6, 6, '0000-00-00'),
(6.7, 6, 7, '0000-00-00'),
(6.8, 6, 8, '0000-00-00'),
(6.9, 6, 9, '0000-00-00'),
(7.01, 7, 10, '0000-00-00'),
(7.1, 7, 1, '0000-00-00'),
(7.2, 7, 2, '0000-00-00'),
(7.3, 7, 3, '0000-00-00'),
(7.4, 7, 4, '0000-00-00'),
(7.5, 7, 5, '0000-00-00'),
(7.6, 7, 6, '0000-00-00'),
(7.7, 7, 7, '0000-00-00'),
(7.8, 7, 8, '0000-00-00'),
(7.9, 7, 9, '0000-00-00'),
(8.01, 8, 10, '0000-00-00'),
(8.1, 8, 1, '0000-00-00'),
(8.2, 8, 2, '0000-00-00'),
(8.3, 8, 3, '0000-00-00'),
(8.4, 8, 4, '0000-00-00'),
(8.5, 8, 5, '0000-00-00'),
(8.6, 8, 6, '0000-00-00'),
(8.7, 8, 7, '0000-00-00'),
(8.8, 8, 8, '0000-00-00'),
(8.9, 8, 9, '0000-00-00'),
(9.01, 9, 10, '0000-00-00'),
(9.3, 9, 3, '0000-00-00'),
(9.4, 9, 4, '0000-00-00'),
(9.5, 9, 5, '0000-00-00'),
(9.6, 9, 6, '0000-00-00'),
(9.7, 9, 7, '0000-00-00'),
(9.8, 9, 8, '0000-00-00'),
(9.9, 9, 9, '0000-00-00'),
(10.01, 10, 10, '0000-00-00'),
(10.3, 10, 3, '0000-00-00'),
(10.4, 10, 4, '0000-00-00'),
(10.5, 10, 5, '0000-00-00'),
(10.6, 10, 6, '0000-00-00'),
(10.7, 10, 7, '0000-00-00'),
(10.8, 10, 8, '0000-00-00'),
(10.9, 10, 10, '0000-00-00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownik`
--

CREATE TABLE `pracownik` (
  `IdPracownik` int(11) NOT NULL,
  `login` varchar(30) COLLATE utf32_polish_ci NOT NULL,
  `haslo` varchar(30) COLLATE utf32_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Zrzut danych tabeli `pracownik`
--

INSERT INTO `pracownik` (`IdPracownik`, `login`, `haslo`) VALUES
(1, 'annakowalska', '*2C0CAF33D242118E36D9D363F41B0'),
(2, 'jankowalski', '*7F74DA13EDAC1E8AB3FCD7E690839'),
(3, 'piotrnowak', '*F7476159976A0FBC599CB16E87335'),
(4, 'monikawojcik', '*4FB98EF94B3CD0F29538B7E80D5C5'),
(5, 'monikaskoczylas', '*51A6FDC096105E2923852A4D1C3C8'),
(6, 'ewazajdel', '*7AD7E8E9BB7EBD8252F9BB1ED977F'),
(7, 'admin', '*4ACFE3202A5FF5CF467898FC58AAB'),
(8, 'kierownik', '*7F7F5BB427C25F8F755F13349732A');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rodzaj_biletu`
--

CREATE TABLE `rodzaj_biletu` (
  `IdRodzajBiletu` int(11) NOT NULL,
  `znizka` varchar(20) COLLATE utf32_polish_ci NOT NULL,
  `rodzaj` varchar(20) COLLATE utf32_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sala`
--

CREATE TABLE `sala` (
  `IdSala` int(11) NOT NULL,
  `IdMiejsce` float NOT NULL,
  `miejsce` int(11) NOT NULL,
  `rzad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

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
  `czas_trawnia` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `bilet`
--
ALTER TABLE `bilet`
  ADD PRIMARY KEY (`IdBilet`),
  ADD UNIQUE KEY `klient_id` (`IdKlient`),
  ADD UNIQUE KEY `IdSeans` (`IdRodzajBiletu`,`IdPracownik`),
  ADD KEY `wydaje` (`IdPracownik`),
  ADD KEY `ma` (`IdSeans`);

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
-- Indeksy dla tabeli `miejsce`
--
ALTER TABLE `miejsce`
  ADD PRIMARY KEY (`IdMiejsce`);

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
-- Indeksy dla tabeli `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`IdSala`),
  ADD UNIQUE KEY `IdMiejsce` (`IdMiejsce`);

--
-- Indeksy dla tabeli `seans`
--
ALTER TABLE `seans`
  ADD PRIMARY KEY (`IdSeans`),
  ADD UNIQUE KEY `IdFilm` (`IdFilm`,`IdSala`),
  ADD KEY `odbywa sie w` (`IdSala`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `bilet`
--
ALTER TABLE `bilet`
  MODIFY `IdBilet` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `film`
--
ALTER TABLE `film`
  MODIFY `IdFilm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT dla tabeli `klient`
--
ALTER TABLE `klient`
  MODIFY `IdKlient` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pracownik`
--
ALTER TABLE `pracownik`
  MODIFY `IdPracownik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `rodzaj_biletu`
--
ALTER TABLE `rodzaj_biletu`
  MODIFY `IdRodzajBiletu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sala`
--
ALTER TABLE `sala`
  MODIFY `IdSala` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `seans`
--
ALTER TABLE `seans`
  MODIFY `IdSeans` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `bilet`
--
ALTER TABLE `bilet`
  ADD CONSTRAINT `jest składane przez` FOREIGN KEY (`IdKlient`) REFERENCES `klient` (`IdKlient`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ma` FOREIGN KEY (`IdSeans`) REFERENCES `seans` (`IdSeans`),
  ADD CONSTRAINT `posiada` FOREIGN KEY (`IdRodzajBiletu`) REFERENCES `rodzaj_biletu` (`IdRodzajBiletu`) ON UPDATE CASCADE,
  ADD CONSTRAINT `wydaje` FOREIGN KEY (`IdPracownik`) REFERENCES `pracownik` (`IdPracownik`) ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `sala`
--
ALTER TABLE `sala`
  ADD CONSTRAINT `znajduje sie` FOREIGN KEY (`IdMiejsce`) REFERENCES `miejsce` (`IdMiejsce`) ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `seans`
--
ALTER TABLE `seans`
  ADD CONSTRAINT `odbywa sie w` FOREIGN KEY (`IdSala`) REFERENCES `sala` (`IdSala`),
  ADD CONSTRAINT `poleci` FOREIGN KEY (`IdFilm`) REFERENCES `film` (`IdFilm`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
