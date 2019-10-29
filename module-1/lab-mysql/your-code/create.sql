-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mysql-lab
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mysql-lab
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mysql-lab` DEFAULT CHARACTER SET utf8 ;
USE `mysql-lab` ;

-- -----------------------------------------------------
-- Table `mysql-lab`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql-lab`.`cars` (
  `car_id` INT NOT NULL AUTO_INCREMENT, 
  `VIN` VARCHAR(45) NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` YEAR(4) NULL,
  `color` VARCHAR(45) NULL,
  PRIMARY KEY (`car_id`)) 
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mysql-lab`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql-lab`.`customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state/province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `zip/postal code` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mysql-lab`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql-lab`.`salesperson` (
  `staff_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mysql-lab`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql-lab`.`invoices` (
  `invoice_id` INT NOT NULL AUTO_INCREMENT,
  `invoice_number` VARCHAR(45) NULL,
  `date` DATE NULL,
  `cars_car_id` INT NOT NULL,
  `customers_customer_id` INT NOT NULL,
  `salesperson_staff_id` INT NOT NULL,
  PRIMARY KEY (`invoice_id`),
  INDEX `fk_invoices_cars_idx` (`cars_car_id` ASC),
  INDEX `fk_invoices_customers1_idx` (`customers_customer_id` ASC),
  INDEX `fk_invoices_salesperson1_idx` (`salesperson_staff_id` ASC),
  CONSTRAINT `fk_invoices_cars`
    FOREIGN KEY (`cars_car_id`)
    REFERENCES `mysql-lab`.`cars` (`car_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customers_customer_id`)
    REFERENCES `mysql-lab`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_salesperson1`
    FOREIGN KEY (`salesperson_staff_id`)
    REFERENCES `mysql-lab`.`salesperson` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
