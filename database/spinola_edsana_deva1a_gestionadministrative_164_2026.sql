-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 07, 2026 at 11:29 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spinola_edsana_deva1a_gestionadministrative_164_2026`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_absence`
--

CREATE TABLE `t_absence` (
  `id_absence` int NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `fk_justification` int NOT NULL,
  `fk_employe` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_absence`
--

INSERT INTO `t_absence` (`id_absence`, `date_debut`, `date_fin`, `fk_justification`, `fk_employe`) VALUES
(1, '2026-04-08', '2026-04-08', 2, 10),
(2, '2026-05-10', '2026-05-12', 1, 1),
(3, '2026-05-15', '2026-05-15', 2, 2),
(4, '2026-06-01', '2026-06-10', 1, 3),
(5, '2026-06-12', '2026-06-13', 2, 4),
(6, '2026-05-20', '2026-05-22', 1, 5),
(7, '2026-07-01', '2026-07-05', 2, 6),
(8, '2026-05-01', '2026-05-02', 1, 7),
(9, '2026-08-15', '2026-08-20', 2, 8),
(10, '2026-05-25', '2026-05-25', 1, 9),
(11, '2026-09-10', '2026-09-12', 2, 11),
(12, '2026-05-18', '2026-05-19', 1, 12),
(13, '2026-10-05', '2026-10-05', 2, 13),
(14, '2026-05-28', '2026-05-30', 1, 14),
(15, '2026-11-01', '2026-11-15', 2, 15),
(16, '2026-06-20', '2026-06-21', 1, 16),
(17, '2026-12-24', '2026-12-26', 2, 17),
(18, '2026-07-10', '2026-07-11', 1, 18),
(19, '2026-07-15', '2026-07-15', 2, 19),
(20, '2026-08-01', '2026-08-03', 1, 20),
(21, '2026-08-10', '2026-08-10', 2, 21),
(22, '2026-09-01', '2026-09-05', 1, 22),
(23, '2026-09-20', '2026-09-22', 2, 23),
(24, '2026-10-15', '2026-10-16', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_contrat`
--

CREATE TABLE `t_contrat` (
  `id_contrat` int NOT NULL,
  `type_contrat` varchar(50) NOT NULL,
  `taux_activite` int NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date DEFAULT NULL,
  `fk_employe` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_contrat`
--

INSERT INTO `t_contrat` (`id_contrat`, `type_contrat`, `taux_activite`, `date_debut`, `date_fin`, `fk_employe`) VALUES
(1, 'CDI', 100, '2020-01-01', NULL, 1),
(2, 'CDD', 80, '2023-06-01', '2023-12-31', 2),
(3, 'CDI', 100, '2019-03-15', NULL, 3),
(4, 'Apprentissage', 100, '2023-09-01', '2025-08-31', 4),
(5, 'CDI', 50, '2021-11-10', NULL, 5),
(6, 'CDD', 100, '2024-01-15', '2024-07-15', 6),
(7, 'CDI', 90, '2018-05-20', NULL, 7),
(8, 'CDI', 100, '2022-02-01', NULL, 8),
(9, 'Stage', 100, '2024-03-01', '2024-08-31', 9),
(10, 'CDI', 80, '2017-10-12', NULL, 10),
(11, 'CDD', 60, '2023-10-01', '2024-03-31', 11),
(12, 'CDI', 100, '2020-07-01', NULL, 12),
(13, 'Apprentissage', 100, '2022-09-01', '2024-08-31', 13),
(14, 'CDD', 100, '2024-02-01', '2024-05-31', 14),
(15, 'CDI', 40, '2015-04-12', NULL, 15),
(16, 'CDI', 100, '2021-01-20', NULL, 16),
(17, 'CDD', 50, '2023-12-01', '2024-06-30', 17),
(18, 'CDI', 90, '2016-09-15', NULL, 18),
(19, 'Stage', 100, '2024-05-01', '2024-07-31', 19),
(20, 'CDI', 100, '2019-11-30', NULL, 20),
(21, 'CDD', 80, '2024-01-01', '2024-12-31', 21),
(22, 'CDI', 20, '2022-06-15', NULL, 22),
(23, 'Apprentissage', 100, '2023-08-25', '2025-08-24', 23);

-- --------------------------------------------------------

--
-- Table structure for table `t_employe`
--

CREATE TABLE `t_employe` (
  `id_employe` int NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `date_naissance` date NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date_engagement` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_employe`
--

INSERT INTO `t_employe` (`id_employe`, `nom`, `prenom`, `date_naissance`, `telephone`, `email`, `date_engagement`) VALUES
(1, 'Dupont', 'Jean', '1985-03-12', '0601020304', 'jean.dupont@email.com', '2015-06-01'),
(2, 'Durand', 'Marie', '1992-07-25', '0612345678', 'marie.durand@email.com', '2018-09-15'),
(3, 'Lefebvre', 'Thomas', '1980-11-02', '0623456789', 't.lefebvre@email.com', '2010-01-10'),
(4, 'Moreau', 'Sophie', '1995-12-30', '0634567890', 'sophie.moreau@email.com', '2021-03-22'),
(5, 'Petit', 'Nicolas', '1988-05-14', '0645678901', 'nicolas.petit@email.com', '2016-11-12'),
(6, 'Rousseau', 'Camille', '1993-02-19', '0656789012', 'c.rousseau@email.com', '2019-07-01'),
(7, 'Blanc', 'Lucas', '1982-08-08', '0667890123', 'lucas.blanc@email.com', '2012-05-20'),
(8, 'Guerin', 'Julie', '1997-04-22', '0678901234', 'j.guerin@email.com', '2022-01-05'),
(9, 'Muller', 'Antoine', '1990-10-10', '0689012345', 'antoine.muller@email.com', '2017-08-30'),
(10, 'Lambert', 'Emma', '1991-01-15', '0690123456', 'emma.lambert@email.com', '2018-02-14'),
(11, 'Fontaine', 'Julien', '1984-06-27', '0611223344', 'j.fontaine@email.com', '2014-10-01'),
(12, 'Roux', 'Chloé', '1996-09-05', '0622334455', 'chloe.roux@email.com', '2020-06-15'),
(13, 'Vincent', 'Pierre', '1978-03-18', '0633445566', 'pierre.vincent@email.com', '2005-12-01'),
(14, 'Girard', 'Léa', '1994-11-11', '0644556677', 'lea.girard@email.com', '2021-09-10'),
(15, 'Mercier', 'Hugo', '1987-12-24', '0655667788', 'hugo.mercier@email.com', '2016-04-20'),
(16, 'Bonnet', 'Manon', '1999-05-30', '0666778899', 'manon.bonnet@email.com', '2023-02-01'),
(17, 'Masson', 'Alexandre', '1983-02-28', '0677889900', 'a.masson@email.com', '2013-08-12'),
(18, 'Marchand', 'Sarah', '1992-04-12', '0688990011', 'sarah.marchand@email.com', '2019-11-25'),
(19, 'Barbier', 'Maxime', '1986-07-03', '0699001122', 'm.barbier@email.com', '2015-01-15'),
(20, 'Meunier', 'Clémence', '1998-10-20', '0610203040', 'clemence.meunier@email.com', '2022-08-20'),
(21, 'Gauthier', 'Romain', '1981-01-01', '0620304050', 'r.gauthier@email.com', '2011-04-05'),
(22, 'Perrin', 'Alice', '1993-06-14', '0630405060', 'alice.perrin@email.com', '2020-01-10'),
(23, 'Mathieu', 'Quentin', '1990-09-21', '0640506070', 'q.mathieu@email.com', '2017-03-18');

-- --------------------------------------------------------

--
-- Table structure for table `t_horaire`
--

CREATE TABLE `t_horaire` (
  `id_horaire` int NOT NULL,
  `date` date NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_justification`
--

CREATE TABLE `t_justification` (
  `id_justification` int NOT NULL,
  `type_justification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_justification`
--

INSERT INTO `t_justification` (`id_justification`, `type_justification`) VALUES
(1, 'maladie'),
(2, 'tram'),
(3, 'Certificat Médical'),
(4, 'Accident'),
(5, 'Convocation'),
(6, 'Justificatif Familial');

-- --------------------------------------------------------

--
-- Table structure for table `t_poste`
--

CREATE TABLE `t_poste` (
  `id_poste` int NOT NULL,
  `nom_poste` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_poste`
--

INSERT INTO `t_poste` (`id_poste`, `nom_poste`, `description`) VALUES
(1, 'sert à rien', 'ben voilà'),
(2, 'fdgsdaf', 'rdicule belle journée');

-- --------------------------------------------------------

--
-- Table structure for table `t_poste_justification`
--

CREATE TABLE `t_poste_justification` (
  `id_poste_justification` int NOT NULL,
  `fk_poste` int NOT NULL,
  `fk_justification` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_poste_justification`
--

INSERT INTO `t_poste_justification` (`id_poste_justification`, `fk_poste`, `fk_justification`) VALUES
(2, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_absence`
--
ALTER TABLE `t_absence`
  ADD PRIMARY KEY (`id_absence`),
  ADD KEY `fk_employe` (`fk_employe`),
  ADD KEY `fk_justification` (`fk_justification`);

--
-- Indexes for table `t_contrat`
--
ALTER TABLE `t_contrat`
  ADD PRIMARY KEY (`id_contrat`),
  ADD KEY `id_employe` (`fk_employe`);

--
-- Indexes for table `t_employe`
--
ALTER TABLE `t_employe`
  ADD PRIMARY KEY (`id_employe`);

--
-- Indexes for table `t_horaire`
--
ALTER TABLE `t_horaire`
  ADD PRIMARY KEY (`id_horaire`);

--
-- Indexes for table `t_justification`
--
ALTER TABLE `t_justification`
  ADD PRIMARY KEY (`id_justification`);

--
-- Indexes for table `t_poste`
--
ALTER TABLE `t_poste`
  ADD PRIMARY KEY (`id_poste`);

--
-- Indexes for table `t_poste_justification`
--
ALTER TABLE `t_poste_justification`
  ADD PRIMARY KEY (`id_poste_justification`),
  ADD KEY `fk_poste` (`fk_poste`),
  ADD KEY `fk_justification` (`fk_justification`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_absence`
--
ALTER TABLE `t_absence`
  MODIFY `id_absence` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `t_contrat`
--
ALTER TABLE `t_contrat`
  MODIFY `id_contrat` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `t_employe`
--
ALTER TABLE `t_employe`
  MODIFY `id_employe` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `t_horaire`
--
ALTER TABLE `t_horaire`
  MODIFY `id_horaire` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_justification`
--
ALTER TABLE `t_justification`
  MODIFY `id_justification` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `t_poste`
--
ALTER TABLE `t_poste`
  MODIFY `id_poste` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_poste_justification`
--
ALTER TABLE `t_poste_justification`
  MODIFY `id_poste_justification` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_absence`
--
ALTER TABLE `t_absence`
  ADD CONSTRAINT `t_absence_ibfk_1` FOREIGN KEY (`fk_employe`) REFERENCES `t_employe` (`id_employe`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `t_absence_ibfk_2` FOREIGN KEY (`fk_justification`) REFERENCES `t_justification` (`id_justification`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `t_contrat`
--
ALTER TABLE `t_contrat`
  ADD CONSTRAINT `id_employe` FOREIGN KEY (`fk_employe`) REFERENCES `t_employe` (`id_employe`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `t_poste_justification`
--
ALTER TABLE `t_poste_justification`
  ADD CONSTRAINT `t_poste_justification_ibfk_1` FOREIGN KEY (`fk_poste`) REFERENCES `t_poste` (`id_poste`),
  ADD CONSTRAINT `t_poste_justification_ibfk_2` FOREIGN KEY (`fk_justification`) REFERENCES `t_justification` (`id_justification`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
