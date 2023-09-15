-- --------------------------------------------------------
-- Anfitrião:                    127.0.0.1
-- Versão do servidor:           10.4.17-MariaDB - mariadb.org binary distribution
-- SO do servidor:               Win64
-- HeidiSQL Versão:              12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- A despejar estrutura da base de dados para app_resultamper
CREATE DATABASE IF NOT EXISTS `app_resultamper` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `app_resultamper`;

-- A despejar estrutura para tabela app_resultamper.atribuicoes
CREATE TABLE IF NOT EXISTS `atribuicoes` (
  `Posto_IdPosto` int(11) NOT NULL,
  `Obras_IdObra` int(11) NOT NULL,
  PRIMARY KEY (`Posto_IdPosto`,`Obras_IdObra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela app_resultamper.atribuicoes: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela app_resultamper.colaboradores
CREATE TABLE IF NOT EXISTS `colaboradores` (
  `IdColaborador` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `TempoTrabalho` decimal(20,6) NOT NULL,
  `Funcao` varchar(50) NOT NULL,
  PRIMARY KEY (`IdColaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela app_resultamper.colaboradores: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela app_resultamper.ferramentas
CREATE TABLE IF NOT EXISTS `ferramentas` (
  `IdFerramenta` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` longtext NOT NULL,
  `Custo` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`IdFerramenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela app_resultamper.ferramentas: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela app_resultamper.maquinas
CREATE TABLE IF NOT EXISTS `maquinas` (
  `IdMaquina` int(11) NOT NULL AUTO_INCREMENT,
  `Designacao` varchar(90) NOT NULL,
  `Descricao` longtext NOT NULL,
  PRIMARY KEY (`IdMaquina`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela app_resultamper.maquinas: ~3 rows (aproximadamente)
INSERT INTO `maquinas` (`IdMaquina`, `Designacao`, `Descricao`) VALUES
	(2, 'Dados', 'Dados maquina'),
	(4, 'Maquina 1', 'Sou a maquina 1'),
	(5, 'Raquel', 'Sou a mais feia de todas');

-- A despejar estrutura para tabela app_resultamper.obras
CREATE TABLE IF NOT EXISTS `obras` (
  `IdObra` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` longtext NOT NULL,
  `DataInicio` varchar(50) NOT NULL DEFAULT '',
  `DataEntrega` varchar(50) NOT NULL DEFAULT '',
  `DataConclusao` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`IdObra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela app_resultamper.obras: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela app_resultamper.pecas
CREATE TABLE IF NOT EXISTS `pecas` (
  `IdTarefa` int(11) NOT NULL AUTO_INCREMENT,
  `DataLancamento` varchar(50) NOT NULL DEFAULT '0',
  `Peso` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `TempoProcessamento` varchar(50) NOT NULL DEFAULT '0',
  `Obras_IdObra` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`IdTarefa`),
  KEY `Obras_IdObra` (`Obras_IdObra`),
  CONSTRAINT `FK_pecas_obras` FOREIGN KEY (`Obras_IdObra`) REFERENCES `obras` (`IdObra`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela app_resultamper.pecas: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela app_resultamper.postos
CREATE TABLE IF NOT EXISTS `postos` (
  `IdPosto` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` longtext NOT NULL,
  PRIMARY KEY (`IdPosto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela app_resultamper.postos: ~0 rows (aproximadamente)

-- A despejar estrutura para tabela app_resultamper.posto_maquina
CREATE TABLE IF NOT EXISTS `posto_maquina` (
  `IdPosto` int(11) NOT NULL,
  `IdMaquina` int(11) NOT NULL,
  PRIMARY KEY (`IdPosto`,`IdMaquina`),
  KEY `FK__maquinas` (`IdMaquina`),
  CONSTRAINT `FK__maquinas` FOREIGN KEY (`IdMaquina`) REFERENCES `maquinas` (`IdMaquina`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK__postos` FOREIGN KEY (`IdPosto`) REFERENCES `postos` (`IdPosto`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela app_resultamper.posto_maquina: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
