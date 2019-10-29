-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema car_dealership_company
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema car_dealership_company
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `car_dealership_company` DEFAULT CHARACTER SET utf8 ;
USE `car_dealership_company` ;

-- -----------------------------------------------------
-- Table `car_dealership_company`.`Car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealership_company`.`Car` (
  `CarID` INT NOT NULL,
  `VIN` VARCHAR(45) NULL,
  `Manufacturer` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Year` INT NULL,
  `Color` VARCHAR(45) NULL,
  PRIMARY KEY (`CarID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_dealership_company`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealership_company`.`Customer` (
  `ID` INT NOT NULL,
  `CustomerID` INT NULL,
  `Name` VARCHAR(45) NULL,
  `Phone number` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State/Province` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `Zip/postal` INT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_dealership_company`.`Salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealership_company`.`Salesperson` (
  `ID` INT NOT NULL,
  `staffID` INT NULL,
  `Name` VARCHAR(45) NULL,
  `Store` VARCHAR(25) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_dealership_company`.`Invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealership_company`.`Invoice` (
  `ID` INT NOT NULL,
  `Invoice number` INT NULL,
  `Date` DATE NULL,
  `Car_CarID` INT NOT NULL,
  `Salesperson_ID` INT NOT NULL,
  `Customer_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Invoice_Car1_idx` (`Car_CarID` ASC),
  INDEX `fk_Invoice_Salesperson1_idx` (`Salesperson_ID` ASC),
  INDEX `fk_Invoice_Customer1_idx` (`Customer_ID` ASC),
  CONSTRAINT `fk_Invoice_Car1`
    FOREIGN KEY (`Car_CarID`)
    REFERENCES `car_dealership_company`.`Car` (`CarID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_Salesperson1`
    FOREIGN KEY (`Salesperson_ID`)
    REFERENCES `car_dealership_company`.`Salesperson` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_Customer1`
    FOREIGN KEY (`Customer_ID`)
    REFERENCES `car_dealership_company`.`Customer` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

