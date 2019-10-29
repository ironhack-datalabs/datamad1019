-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Cars_Database
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Cars_Database
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Cars_Database` DEFAULT CHARACTER SET utf8 ;
USE `Cars_Database` ;

-- -----------------------------------------------------
-- Table `Cars_Database`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cars_Database`.`cars` (
  `ID` INT NOT NULL,
  `VIN` VARCHAR(17) NOT NULL,
  `Manufacturer` VARCHAR(45) NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `Year` YEAR(4) NOT NULL,
  `Color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cars_Database`.`Costumers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cars_Database`.`Costumers` (
  `ID` INT NOT NULL,
  `idCostumers` VARCHAR(5) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(15) NOT NULL,
  `Email` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `State/Province` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Postal` VARCHAR(5) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cars_Database`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cars_Database`.`Salespersons` (
  `ID` INT NOT NULL,
  `Staff ID` VARCHAR(5) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cars_Database`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cars_Database`.`Invoices` (
  `ID` INT NOT NULL,
  `Invoice Number` VARCHAR(45) NULL,
  `Date` DATE NOT NULL,
  `cars_ID` INT NOT NULL,
  `Costumer` INT NOT NULL,
  `Sales Person` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Invoices_cars_idx` (`cars_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_cars`
    FOREIGN KEY (`cars_ID`)
    REFERENCES `Cars_Database`.`cars` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
