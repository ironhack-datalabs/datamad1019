-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lab-mysql
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab-mysql
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `lab-mysql`;
CREATE DATABASE `lab-mysql` ;

-- -----------------------------------------------------
-- Table `lab-mysql`.`car`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab-mysql`.`car`;
CREATE TABLE  `lab-mysql`.`car`(
  `idcars` INT NOT NULL,
  `VIN` VARCHAR(45) NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` INT NULL,
  `color` VARCHAR(45) NULL,
  PRIMARY KEY (`idcars`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab-mysql`.`customer`; 
CREATE TABLE `lab-mysql`.`customer` (
  `id` INT NOT NULL,
  `customer_id` INT NULL,
  `name` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `adress` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `postal_code` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql`.`salesperson`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab-mysql`.`salesperson`; 
CREATE TABLE `lab-mysql`.`salesperson` (
  `id` INT NOT NULL,
  `staff_id` INT NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql`.`invoices`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab-mysql`.`invoices`;
CREATE TABLE `lab-mysql`.`invoices` (
  `id` INT NOT NULL,
  `invoice_number` INT NULL,
  `date` VARCHAR(20) NULL,
  `car_idcars` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `salesperson_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_invoices_car_idx` (`car_idcars` ASC) VISIBLE,
  INDEX `fk_invoices_customer1_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_invoices_salesperson1_idx` (`salesperson_id` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_car`
    FOREIGN KEY (`car_idcars`)
    REFERENCES `lab-mysql`.`car` (`idcars`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `lab-mysql`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_salesperson1`
    FOREIGN KEY (`salesperson_id`)
    REFERENCES `lab-mysql`.`salesperson` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
