-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema EjercicioSQL
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema EjercicioSQL
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `EjercicioSQL` DEFAULT CHARACTER SET utf8 ;
USE `EjercicioSQL` ;

-- -----------------------------------------------------
-- Table `EjercicioSQL`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EjercicioSQL`.`Cars` (
  `vin_id` INT NOT NULL,
  `manufac` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` INT(4) NULL,
  `color` VARCHAR(45) NULL,
  `vin` VARCHAR(20) NULL,
  PRIMARY KEY (`vin_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EjercicioSQL`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EjercicioSQL`.`Customer` (
  `ID` INT NOT NULL,
  `customer_id` INT NULL,
  `email` VARCHAR(45) NULL,
  `addres` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state/province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `zip` INT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EjercicioSQL`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EjercicioSQL`.`Invoices` (
  `id_inv` INT NOT NULL,
  `number` INT NULL,
  `date` DATE NULL,
  `cust_id` INT NULL,
  `vin_id` INT NULL,
  `staff_id` INT NULL,
  `Customer_cust_id` INT NOT NULL,
  `Cars_vin_id` INT NOT NULL,
  PRIMARY KEY (`id_inv`, `Customer_cust_id`, `Cars_vin_id`),
  INDEX `fk_Invoices_Customer1_idx` (`Customer_cust_id` ASC) VISIBLE,
  INDEX `fk_Invoices_Cars1_idx` (`Cars_vin_id` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_Customer1`
    FOREIGN KEY (`Customer_cust_id`)
    REFERENCES `EjercicioSQL`.`Customer` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Cars1`
    FOREIGN KEY (`Cars_vin_id`)
    REFERENCES `EjercicioSQL`.`Cars` (`vin_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EjercicioSQL`.`SalesPersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EjercicioSQL`.`SalesPersons` (
  `staff_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  `staff` INT NOT NULL,
  `Invoices_id_inv` INT NOT NULL,
  PRIMARY KEY (`staff_id`, `staff`, `Invoices_id_inv`),
  INDEX `fk_SalesPersons_Invoices1_idx` (`Invoices_id_inv` ASC) VISIBLE,
  CONSTRAINT `fk_SalesPersons_Invoices1`
    FOREIGN KEY (`Invoices_id_inv`)
    REFERENCES `EjercicioSQL`.`Invoices` (`id_inv`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

