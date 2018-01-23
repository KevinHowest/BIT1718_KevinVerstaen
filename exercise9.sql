-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema exercise9
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exercise9
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exercise9` DEFAULT CHARACTER SET utf8 ;
USE `exercise9` ;

-- -----------------------------------------------------
-- Table `exercise9`.`gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise9`.`gene` (
  `geneId` INT(10) NOT NULL,
  `gene_name` VARCHAR(60) NULL,
  `chromosome` VARCHAR(2) NULL,
  `start` INT(15) NULL,
  `end` INT(15) NULL,
  `gene_descr` VARCHAR(200) NULL,
  PRIMARY KEY (`geneId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise9`.`syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise9`.`syndrome` (
  `syndromeId` INT(10) NOT NULL AUTO_INCREMENT,
  `syndrome_name` VARCHAR(60) NULL,
  `syndrome_descr` VARCHAR(200) NULL,
  `geneId` INT(10) NOT NULL,
  PRIMARY KEY (`syndromeId`),
  INDEX `syndrome_gene_idx` (`geneId` ASC),
  CONSTRAINT `syndrome_gene`
    FOREIGN KEY (`geneId`)
    REFERENCES `exercise9`.`gene` (`geneId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise9`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise9`.`patient` (
  `patientId` INT(10) NOT NULL AUTO_INCREMENT,
  `patient_name` VARCHAR(80) NULL,
  `diagnosis_age` INT(3) NULL,
  `patient_gender` ENUM('M', 'F') NULL,
  `syndromeId` INT(10) NOT NULL,
  PRIMARY KEY (`patientId`),
  INDEX `patient_syndrome_idx` (`syndromeId` ASC),
  CONSTRAINT `patient_syndrome`
    FOREIGN KEY (`syndromeId`)
    REFERENCES `exercise9`.`syndrome` (`syndromeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
