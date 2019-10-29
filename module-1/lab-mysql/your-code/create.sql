-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema lab-mysql-Car
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab-mysql-Car
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab-mysql-Car` DEFAULT CHARACTER SET utf8 ;
USE `lab-mysql-Car` ;

-- -----------------------------------------------------
-- Table `lab-mysql-Car`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql-Car`.`Cars` (
  `ID` INT NOT NULL,
  `VIN` VARCHAR(45) NULL,
  `Manufacturer` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Year` INT NULL,
  `Color` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql-Car`.`Costumers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql-Car`.`Costumers` (
  `ID` INT NOT NULL,
  `Costumer ID` INT NULL,
  `Name` VARCHAR(45) NULL,
  `Phone` INT NULL,
  `Email` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State/Province` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `Postal` INT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql-Car`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql-Car`.`Salespersons` (
  `ID` INT NOT NULL,
  `Staff ID` VARCHAR(45) NULL,
  `Name` VARCHAR(45) NULL,
  `Store` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql-Car`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql-Car`.`Invoices` (
  `ID` INT NOT NULL,
  `Invoice Number` VARCHAR(45) NULL,
  `Date` DATE NULL,
  `Car` INT NOT NULL,
  `Costumer` INT NOT NULL,
  `Sale Person` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Invoices_Costumers1_idx` (`Costumer` ASC),
  INDEX `fk_Invoices_Salespersons1_idx` (`Sale Person` ASC),
  INDEX `fk_Invoices_Cars1_idx` (`Car` ASC),
  CONSTRAINT `fk_Invoices_Costumers1`
    FOREIGN KEY (`Costumer`)
    REFERENCES `lab-mysql-Car`.`Costumers` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Salespersons1`
    FOREIGN KEY (`Sale Person`)
    REFERENCES `lab-mysql-Car`.`Salespersons` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Cars1`
    FOREIGN KEY (`Car`)
    REFERENCES `lab-mysql-Car`.`Cars` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
