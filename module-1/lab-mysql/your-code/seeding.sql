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
-- Table `lab-mysql`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql`.`Customers` (
  `idCustomers` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `phone number` INT(11) NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state/province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `zip/postal code` INT(11) NULL,
  PRIMARY KEY (`idCustomers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql`.`Cars` (
  `idCars` INT NOT NULL,
  `VINS` VARCHAR(45) NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` INT(11) NULL,
  `color` VARCHAR(45) NULL,
  PRIMARY KEY (`idCars`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql`.`Salespersons` (
  `idSalespersons` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`idSalespersons`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql`.`Invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql`.`Invoice` (
  `idInvoice` INT NOT NULL,
  `date` DATE NULL,
  `Customers_ID` INT(11) NULL,
  `Salespersons_ID` INT(11) NULL,
  `Cars_ID` INT(11) NULL,
  `Cars_idCars` INT NOT NULL,
  `Salespersons_idSalespersons` INT NOT NULL,
  `Customers_idCustomers` INT NOT NULL,
  PRIMARY KEY (`idInvoice`, `Cars_idCars`, `Salespersons_idSalespersons`, `Customers_idCustomers`),
  INDEX `fk_Invoice_Cars1_idx` (`Cars_idCars` ASC),
  INDEX `fk_Invoice_Salespersons1_idx` (`Salespersons_idSalespersons` ASC),
  INDEX `fk_Invoice_Customers1_idx` (`Customers_idCustomers` ASC),
  CONSTRAINT `fk_Invoice_Cars1`
    FOREIGN KEY (`Cars_idCars`)
    REFERENCES `lab-mysql`.`Cars` (`idCars`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_Salespersons1`
    FOREIGN KEY (`Salespersons_idSalespersons`)
    REFERENCES `lab-mysql`.`Salespersons` (`idSalespersons`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_Customers1`
    FOREIGN KEY (`Customers_idCustomers`)
    REFERENCES `lab-mysql`.`Customers` (`idCustomers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
