-- MySQL Script generated by MySQL Workbench
-- Sat Nov 21 13:37:57 2015
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bancoPI_schema
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `bancoPI_schema` ;

-- -----------------------------------------------------
-- Schema bancoPI_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bancoPI_schema` DEFAULT CHARACTER SET latin1 ;
USE `bancoPI_schema` ;

-- -----------------------------------------------------
-- Table `bancoPI_schema`.`Pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancoPI_schema`.`Pais` (
  `id_pais` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_pais`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bancoPI_schema`.`Estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancoPI_schema`.`Estado` (
  `id_estado` CHAR(2) NOT NULL,
  `id_pais` INT(11) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `populacao` INT(11) NOT NULL,
  PRIMARY KEY (`id_estado`),
  INDEX `id_pais_idx` (`id_pais` ASC),
  CONSTRAINT `id_pais`
    FOREIGN KEY (`id_pais`)
    REFERENCES `bancoPI_schema`.`Pais` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bancoPI_schema`.`Cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancoPI_schema`.`Cidade` (
  `id_cidade` INT(11) NOT NULL AUTO_INCREMENT,
  `id_estado` CHAR(2) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `populacao` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_cidade`),
  INDEX `id_estado_idx` (`id_estado` ASC),
  CONSTRAINT `id_estado`
    FOREIGN KEY (`id_estado`)
    REFERENCES `bancoPI_schema`.`Estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 28
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bancoPI_schema`.`Empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancoPI_schema`.`Empresa` (
  `id_empresa` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_empresa`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bancoPI_schema`.`Grau_Escolaridade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancoPI_schema`.`Grau_Escolaridade` (
  `id_grau_escolaridade` INT(11) NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_grau_escolaridade`),
  UNIQUE INDEX `descricao_UNIQUE` (`descricao` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bancoPI_schema`.`Jornada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancoPI_schema`.`Jornada` (
  `id_jornada` INT(11) NOT NULL AUTO_INCREMENT,
  `periodo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_jornada`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bancoPI_schema`.`Tipo_Contrato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancoPI_schema`.`Tipo_Contrato` (
  `id_tipo_contrato` INT(11) NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_contrato`),
  UNIQUE INDEX `descricao_UNIQUE` (`descricao` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bancoPI_schema`.`Vaga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancoPI_schema`.`Vaga` (
  `id_vaga` INT(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_contrato` INT(11) NOT NULL,
  `id_grau_escolaridade` INT(11) NOT NULL,
  `id_jornada` INT(11) NOT NULL,
  `id_empresa` INT(11) NOT NULL,
  `id_profissao` VARCHAR(10) NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `salario` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id_vaga`),
  INDEX `id_tipo_contrato_idx` (`id_tipo_contrato` ASC),
  INDEX `id_tipo_jornada_idx` (`id_jornada` ASC),
  INDEX `id_grau_escolaridade_idx` (`id_grau_escolaridade` ASC),
  INDEX `id_empresa_idx` (`id_empresa` ASC),
  INDEX `id_empresa_idx1` (`id_profissao` ASC),
  CONSTRAINT `id_empresa`
    FOREIGN KEY (`id_empresa`)
    REFERENCES `bancoPI_schema`.`Empresa` (`id_empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_grau_escolaridade`
    FOREIGN KEY (`id_grau_escolaridade`)
    REFERENCES `bancoPI_schema`.`Grau_Escolaridade` (`id_grau_escolaridade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_tipo_contrato`
    FOREIGN KEY (`id_tipo_contrato`)
    REFERENCES `bancoPI_schema`.`Tipo_Contrato` (`id_tipo_contrato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_tipo_jornada`
    FOREIGN KEY (`id_jornada`)
    REFERENCES `bancoPI_schema`.`Jornada` (`id_jornada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 49
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bancoPI_schema`.`cidade_empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancoPI_schema`.`cidade_empresa` (
  `id_cidade_empresa` INT(11) NOT NULL AUTO_INCREMENT,
  `id_cidade` INT(11) NOT NULL,
  `id_empresa` INT(11) NOT NULL,
  PRIMARY KEY (`id_cidade_empresa`),
  INDEX `id_empresa_idx` (`id_empresa` ASC),
  INDEX `id_cidade_idx` (`id_cidade` ASC),
  CONSTRAINT `fid_cidade`
    FOREIGN KEY (`id_cidade`)
    REFERENCES `bancoPI_schema`.`Cidade` (`id_cidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fid_empresa`
    FOREIGN KEY (`id_empresa`)
    REFERENCES `bancoPI_schema`.`Empresa` (`id_empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bancoPI_schema`.`tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancoPI_schema`.`tag` (
  `id_tag` INT(11) NOT NULL AUTO_INCREMENT,
  `texto` VARCHAR(200) NOT NULL,
  `quantidadeAcessos` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_tag`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bancoPI_schema`.`vaga_cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancoPI_schema`.`vaga_cidade` (
  `id_vaga_cidade` INT(11) NOT NULL AUTO_INCREMENT,
  `id_vaga` INT(11) NOT NULL,
  `id_cidade` INT(11) NOT NULL,
  PRIMARY KEY (`id_vaga_cidade`),
  INDEX `id_vaga_idx` (`id_vaga` ASC),
  INDEX `id_cidade_idx` (`id_cidade` ASC),
  CONSTRAINT `id_cidade`
    FOREIGN KEY (`id_cidade`)
    REFERENCES `bancoPI_schema`.`Cidade` (`id_cidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_vaga`
    FOREIGN KEY (`id_vaga`)
    REFERENCES `bancoPI_schema`.`Vaga` (`id_vaga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bancoPI_schema`.`vaga_tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancoPI_schema`.`vaga_tag` (
  `id_vaga_tag` INT(11) NOT NULL AUTO_INCREMENT,
  `id_vaga` INT(11) NOT NULL,
  `id_tag` INT(11) NOT NULL,
  PRIMARY KEY (`id_vaga_tag`),
  INDEX `fk_id_vaga_idx` (`id_vaga` ASC),
  INDEX `fk_id_tag_idx` (`id_tag` ASC),
  CONSTRAINT `fk_id_tag`
    FOREIGN KEY (`id_tag`)
    REFERENCES `bancoPI_schema`.`tag` (`id_tag`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_vaga`
    FOREIGN KEY (`id_vaga`)
    REFERENCES `bancoPI_schema`.`Vaga` (`id_vaga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;