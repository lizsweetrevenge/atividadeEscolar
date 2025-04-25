-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11-Abr-2025 às 22:47
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdescolar`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbaluno`
--

CREATE TABLE `tbaluno` (
  `ra` int(11) NOT NULL,
  `nomeAluno` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `tbaluno`
--

INSERT INTO `tbaluno` (`ra`, `nomeAluno`) VALUES
(1, 'Huguinho'),
(2, 'Zezinho'),
(3, 'Luizinho'),
(4, 'Deodato de Faria Lambert Junior'),
(5, 'Yasmin Alves Pinheiro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbdisciplinas`
--

CREATE TABLE `tbdisciplinas` (
  `idDisciplinas` int(11) NOT NULL,
  `nomeDisciplina` varchar(30) DEFAULT NULL,
  `cargaHoraria` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `tbdisciplinas`
--

INSERT INTO `tbdisciplinas` (`idDisciplinas`, `nomeDisciplina`, `cargaHoraria`) VALUES
(1, 'Programação Web II', '50'),
(2, 'Banco de dados II', '100'),
(3, 'Desenvolvimento de Sistemas I', '50'),
(4, 'matematica', '9'),
(5, 'Vava', '12222');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbnotas`
--

CREATE TABLE `tbnotas` (
  `idnota` int(11) NOT NULL,
  `ra` int(11) NOT NULL,
  `idProfessor` int(11) NOT NULL,
  `idDiciplinas` int(11) NOT NULL,
  `nota` varchar(2) NOT NULL,
  `faltas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `tbnotas`
--

INSERT INTO `tbnotas` (`idnota`, `ra`, `idProfessor`, `idDiciplinas`, `nota`, `faltas`) VALUES
(1, 4, 3, 2, 'MB', 4),
(2, 1, 2, 3, 'B', 5),
(6, 2, 2, 2, 'mb', 45),
(12, 1, 3, 3, 'mb', 15);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbprofessor`
--

CREATE TABLE `tbprofessor` (
  `idProfessor` int(11) NOT NULL,
  `nomeProfessor` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `tbprofessor`
--

INSERT INTO `tbprofessor` (`idProfessor`, `nomeProfessor`) VALUES
(1, 'Tio Patinhas'),
(2, 'Pato Donald'),
(3, 'Maga Patalógica'),
(4, '');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tbaluno`
--
ALTER TABLE `tbaluno`
  ADD PRIMARY KEY (`ra`);

--
-- Índices para tabela `tbdisciplinas`
--
ALTER TABLE `tbdisciplinas`
  ADD PRIMARY KEY (`idDisciplinas`);

--
-- Índices para tabela `tbnotas`
--
ALTER TABLE `tbnotas`
  ADD PRIMARY KEY (`idnota`),
  ADD KEY `fkAlunoNotas` (`ra`),
  ADD KEY `fkProfessorNotas` (`idProfessor`),
  ADD KEY `fkDiciplinasNotas` (`idDiciplinas`);

--
-- Índices para tabela `tbprofessor`
--
ALTER TABLE `tbprofessor`
  ADD PRIMARY KEY (`idProfessor`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbaluno`
--
ALTER TABLE `tbaluno`
  MODIFY `ra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tbdisciplinas`
--
ALTER TABLE `tbdisciplinas`
  MODIFY `idDisciplinas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tbnotas`
--
ALTER TABLE `tbnotas`
  MODIFY `idnota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `tbprofessor`
--
ALTER TABLE `tbprofessor`
  MODIFY `idProfessor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tbnotas`
--
ALTER TABLE `tbnotas`
  ADD CONSTRAINT `fkAlunoNotas` FOREIGN KEY (`ra`) REFERENCES `tbaluno` (`ra`),
  ADD CONSTRAINT `fkDiciplinasNotas` FOREIGN KEY (`idDiciplinas`) REFERENCES `tbdisciplinas` (`idDisciplinas`),
  ADD CONSTRAINT `fkProfessorNotas` FOREIGN KEY (`idProfessor`) REFERENCES `tbprofessor` (`idProfessor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
