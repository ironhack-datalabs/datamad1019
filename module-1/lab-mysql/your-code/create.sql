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
CREATE SCHEMA IF NOT EXISTS `lab-mysql` DEFAULT CHARACTER SET utf8 ;
USE `lab-mysql` ;

-- -----------------------------------------------------
-- Table `lab-mysql`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql`.`customer` (
  `id` VARCHAR(11) NOT NULL,
  `customer_id` CHAR(5) NULL,
  `name` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `postal` CHAR(5) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql`.`salesperson` (
  `id` VARCHAR(11) NOT NULL,
  `staff_id` CHAR(5) NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql`.`car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql`.`car` (
  `id` VARCHAR(11) NOT NULL,
  `VIN` CHAR(17) NULL,
  `manufacturer` VARCHAR(45) NULL,
  `mode` VARCHAR(45) NULL,
  `year` YEAR(4) NULL,
  `color` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql`.`invoice` (
  `id` VARCHAR(11) NOT NULL,
  `invoice_number` CHAR(9) NULL,
  `date` DATE NULL,
  `customer_id` VARCHAR(11) NOT NULL,
  `salesperson_id` VARCHAR(11) NOT NULL,
  `car_id1` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`id`, `customer_id`, `salesperson_id`, `car_id1`),
  INDEX `fk_invoice_customer1_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_invoice_salesperson1_idx` (`salesperson_id` ASC) VISIBLE,
  INDEX `fk_invoice_car2_idx` (`car_id1` ASC) VISIBLE,
  CONSTRAINT `fk_invoice_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `lab-mysql`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoice_salesperson1`
    FOREIGN KEY (`salesperson_id`)
    REFERENCES `lab-mysql`.`salesperson` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoice_car2`
    FOREIGN KEY (`car_id1`)
    REFERENCES `lab-mysql`.`car` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
