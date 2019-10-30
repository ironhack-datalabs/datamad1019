-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema lab-mysql1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab-mysql1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab-mysql1` DEFAULT CHARACTER SET utf8 ;
USE `lab-mysql1` ;

-- -----------------------------------------------------
-- Table `lab-mysql1`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql1`.`cars` (
  `cars id` VARCHAR(45) NOT NULL,
  `VIN` VARCHAR(45) NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` INT NULL,
  `Colour` VARCHAR(45) NULL,
  PRIMARY KEY (`cars id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql1`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql1`.`customers` (
  `customer ID` INT NOT NULL,
  `customers id` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `phone number` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state/province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `zip/postal code` VARCHAR(45) NULL,
  PRIMARY KEY (`customer ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql1`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql1`.`salesperson` (
  `staff ID` INT NOT NULL,
  `salesperson id` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`staff ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql1`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql1`.`invoices` (
  `invoices id` INT NOT NULL,
  `invoice number` INT NULL,
  `date` DATE NULL,
  `salesperson_staff ID` INT NOT NULL,
  `customers_customer ID` INT NOT NULL,
  `cars_cars id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`invoices id`, `salesperson_staff ID`, `customers_customer ID`, `cars_cars id`),
  INDEX `fk_invoices_salesperson1_idx` (`salesperson_staff ID` ASC),
  INDEX `fk_invoices_customers1_idx` (`customers_customer ID` ASC),
  INDEX `fk_invoices_cars1_idx` (`cars_cars id` ASC),
  CONSTRAINT `fk_invoices_salesperson1`
    FOREIGN KEY (`salesperson_staff ID`)
    REFERENCES `lab-mysql1`.`salesperson` (`staff ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customers_customer ID`)
    REFERENCES `lab-mysql1`.`customers` (`customer ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_cars1`
    FOREIGN KEY (`cars_cars id`)
    REFERENCES `lab-mysql1`.`cars` (`cars id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
