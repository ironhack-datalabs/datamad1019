-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cars` (
  `idcars` INT NOT NULL,
  `VIN` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` INT NULL,
  `color` VARCHAR(45) NULL,
  PRIMARY KEY (`idcars`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`costumers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`costumers` (
  `idcostumers` INT NOT NULL,
  `CID` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `phone` INT NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `zip` INT NULL,
  `cars_idcars` INT NOT NULL,
  PRIMARY KEY (`idcostumers`),
  INDEX `fk_costumers_cars1_idx` (`cars_idcars` ASC) VISIBLE,
  CONSTRAINT `fk_costumers_cars1`
    FOREIGN KEY (`cars_idcars`)
    REFERENCES `mydb`.`cars` (`idcars`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`salesperson` (
  `idsalesperson` INT NOT NULL,
  `SID` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  `cars_idcars` INT NOT NULL,
  PRIMARY KEY (`idsalesperson`),
  INDEX `fk_salesperson_cars1_idx` (`cars_idcars` ASC) VISIBLE,
  CONSTRAINT `fk_salesperson_cars1`
    FOREIGN KEY (`cars_idcars`)
    REFERENCES `mydb`.`cars` (`idcars`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`invoices` (
  `idinvoices` INT NOT NULL,
  `invoice number` VARCHAR(45) NULL,
  `cars_idcars` INT NOT NULL,
  `salesperson_idsalesperson` INT NOT NULL,
  `costumers_idcostumers` INT NOT NULL,
  `date` DATETIME NULL,
  PRIMARY KEY (`idinvoices`),
  INDEX `fk_invoices_cars1_idx` (`cars_idcars` ASC) VISIBLE,
  INDEX `fk_invoices_salesperson1_idx` (`salesperson_idsalesperson` ASC) VISIBLE,
  INDEX `fk_invoices_costumers1_idx` (`costumers_idcostumers` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_cars1`
    FOREIGN KEY (`cars_idcars`)
    REFERENCES `mydb`.`cars` (`idcars`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_salesperson1`
    FOREIGN KEY (`salesperson_idsalesperson`)
    REFERENCES `mydb`.`salesperson` (`idsalesperson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_costumers1`
    FOREIGN KEY (`costumers_idcostumers`)
    REFERENCES `mydb`.`costumers` (`idcostumers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
