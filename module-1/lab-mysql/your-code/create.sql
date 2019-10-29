-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema lab-mysql
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab-mysql
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab-mysql` DEFAULT CHARACTER SET utf8 ;
USE `lab-mysql` ;

-- -----------------------------------------------------
-- Table `lab-mysql`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql`.`Cars` (
  `idCars` INT NOT NULL,
  `VIN` CHAR(17) NULL,
  `Manufacturer` VARCHAR(25) NULL,
  `Model` VARCHAR(25) NULL,
  `Year` YEAR NULL,
  `Color` VARCHAR(20) NULL,
  PRIMARY KEY (`idCars`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql`.`Customers` (
  `id` INT NOT NULL,
  `Customer ID` CHAR(5) NULL,
  `Name` VARCHAR(30) NULL,
  `Phone` VARCHAR(20) NULL,
  `Email` VARCHAR(45) NULL,
  `Address` VARCHAR(50) NULL,
  `City` VARCHAR(20) NULL,
  `State/Province` VARCHAR(20) NULL,
  `Country` VARCHAR(20) NULL,
  `Postal` CHAR(5) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql`.`Salespersons` (
  `idSalespersons` INT NOT NULL,
  `Staff ID` CHAR(5) NULL,
  `Name` VARCHAR(20) NULL,
  `Store` VARCHAR(15) NULL,
  PRIMARY KEY (`idSalespersons`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql`.`Invoices` (
  `ID` INT NOT NULL,
  `Invoice Number` CHAR(9) NULL,
  `Date` DATE NULL,
  `Car` INT NOT NULL,
  `Customers_id` INT NOT NULL,
  `Sales persons` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Invoices_Salespersons1_idx` (`Sales persons` ASC),
  INDEX `fk_Invoices_Cars1_idx` (`Car` ASC),
  INDEX `fk_Invoices_Customers1_idx` (`Customers_id` ASC),
  CONSTRAINT `fk_Invoices_Salespersons1`
    FOREIGN KEY (`Sales persons`)
    REFERENCES `lab-mysql`.`Salespersons` (`idSalespersons`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Cars1`
    FOREIGN KEY (`Car`)
    REFERENCES `lab-mysql`.`Cars` (`idCars`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Customers1`
    FOREIGN KEY (`Customers_id`)
    REFERENCES `lab-mysql`.`Customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

