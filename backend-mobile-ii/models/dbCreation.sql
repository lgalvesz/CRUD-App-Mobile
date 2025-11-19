-- Criar banco de dados
CREATE DATABASE IF NOT EXISTS `backend-mobile-ii` 
DEFAULT CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE `backend-mobile-ii`;

-- Tabela de Clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `sobrenome` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `idade` INT(3) NOT NULL,
  `foto` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabela de Produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `descricao` TEXT NOT NULL,
  `preco` DECIMAL(10, 2) NOT NULL,
  `data_atualizado` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;