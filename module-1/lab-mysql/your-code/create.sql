-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`salesperson` (
  `staff ID` INT NOT NULL,
  `name` CHAR(1) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`staff ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customers` (
  `customer ID` INT NOT NULL,
  `name` CHAR NULL,
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
-- Table `mydb`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`invoices` (
  `invoice number` INT NOT NULL,
  `date` DATE NULL,
  `car` VARCHAR(45) NULL,
  `customer` VARCHAR(45) NULL,
  `sales person` VARCHAR(45) NULL,
  `salesperson_staff ID` INT NOT NULL,
  `customers_customer ID` INT NOT NULL,
  PRIMARY KEY (`invoice number`),
  INDEX `fk_invoices_salesperson_idx` (`salesperson_staff ID` ASC),
  INDEX `fk_invoices_customers1_idx` (`customers_customer ID` ASC),
  CONSTRAINT `fk_invoices_salesperson`
    FOREIGN KEY (`salesperson_staff ID`)
    REFERENCES `mydb`.`salesperson` (`staff ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customers_customer ID`)
    REFERENCES `mydb`.`customers` (`customer ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cars` (
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` DATE NULL,
  `Colour` VARCHAR(45) NULL,
  `invoices_invoice number` INT NOT NULL,
  INDEX `fk_cars_invoices1_idx` (`invoices_invoice number` ASC),
  PRIMARY KEY (`invoices_invoice number`),
  CONSTRAINT `fk_cars_invoices1`
    FOREIGN KEY (`invoices_invoice number`)
    REFERENCES `mydb`.`invoices` (`invoice number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
