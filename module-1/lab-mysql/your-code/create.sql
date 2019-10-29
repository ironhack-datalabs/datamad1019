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
-- Table `lab-mysql`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql`.`cars` (
  `cars id` VARCHAR(45) NOT NULL,
  `VIN` VARCHAR(45) NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` INT NULL,
  `Colour` VARCHAR(45) NULL,
  PRIMARY KEY (`cars id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql`.`customers` (
  `customer ID` INT NOT NULL,
  `customers id` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `phone number` INT NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state/province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `zip/postal code` VARCHAR(45) NULL,
  PRIMARY KEY (`customer ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql`.`salesperson` (
  `staff ID` INT NOT NULL,
  `salesperson id` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`staff ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql`.`invoices` (
  `invoices id` INT NOT NULL,
  `invoice number` INT NULL,
  `date` DATE NULL,
  `car` VARCHAR(45) NOT NULL,
  `salesperson` VARCHAR(45) NOT NULL,
  `customer` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`invoices id`),
  INDEX `fk_invoices_salesperson1_idx` (`salesperson` ASC),
  INDEX `fk_invoices_customers1_idx` (`customer` ASC),
  INDEX `fk_invoices_cars1_idx` (`car` ASC),
  CONSTRAINT `fk_invoices_salesperson1`
    FOREIGN KEY (`salesperson`)
    REFERENCES `lab-mysql`.`salesperson` (`staff ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customer`)
    REFERENCES `lab-mysql`.`customers` (`customer ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_cars1`
    FOREIGN KEY (`car`)
    REFERENCES `lab-mysql`.`cars` (`cars id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
