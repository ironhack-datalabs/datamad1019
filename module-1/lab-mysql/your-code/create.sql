-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema carsDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema carsDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `carsDB` DEFAULT CHARACTER SET utf8 ;
USE `carsDB` ;

-- -----------------------------------------------------
-- Table `carsDB`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carsDB`.`Cars` (
  `VIN` INT NOT NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` DATE NULL,
  `color` VARCHAR(45) NULL,
  PRIMARY KEY (`VIN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carsDB`.`Costumers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carsDB`.`Costumers` (
  `idCostumers` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `phone number` INT NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state/province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `zip/postal` INT NULL,
  PRIMARY KEY (`idCostumers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carsDB`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carsDB`.`Salespersons` (
  `Staff ID` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`Staff ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carsDB`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carsDB`.`Invoices` (
  `Invoice Number` INT NOT NULL,
  `date` DATE NULL,
  `Car` INT NOT NULL,
  `Costumers_idCostumers` INT NOT NULL,
  `Sales Person` INT NOT NULL,
  PRIMARY KEY (`Invoice Number`),
  INDEX `fk_Invoices_Cars_idx` (`Car` ASC),
  INDEX `fk_Invoices_Costumers1_idx` (`Costumers_idCostumers` ASC),
  INDEX `fk_Invoices_Salespersons1_idx` (`Sales Person` ASC),
  CONSTRAINT `fk_Invoices_Cars`
    FOREIGN KEY (`Car`)
    REFERENCES `carsDB`.`Cars` (`VIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Costumers1`
    FOREIGN KEY (`Costumers_idCostumers`)
    REFERENCES `carsDB`.`Costumers` (`idCostumers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Salespersons1`
    FOREIGN KEY (`Sales Person`)
    REFERENCES `carsDB`.`Salespersons` (`Staff ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
