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
-- Table `mydb`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cars` (
  `idCar` INT(11) NOT NULL AUTO_INCREMENT,
  `VIN` VARCHAR(20) NOT NULL,
  `Manufacturer` VARCHAR(20) NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `Year` INT(11) NOT NULL,
  `Color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCar`))
ENGINE = InnoDB
AUTO_INCREMENT = 37
DEFAULT CHARACTER SET = utf8
COMMENT = 'a';


-- -----------------------------------------------------
-- Table `mydb`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Invoices` (
  `idInvoices` INT(11) NOT NULL AUTO_INCREMENT,
  `Invoice_No` INT(11) NOT NULL,
  `Date` VARCHAR(45) NOT NULL,
  `Car` INT(11) NOT NULL,
  `Customer` INT(11) NOT NULL,
  `Sales Person` VARCHAR(45) NOT NULL,
  `Cars_idCar` INT(11) NOT NULL,
  PRIMARY KEY (`idInvoices`, `Cars_idCar`),
  INDEX `fk_Invoices_Cars_idx` (`Cars_idCar` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_Cars`
    FOREIGN KEY (`Cars_idCar`)
    REFERENCES `mydb`.`Cars` (`idCar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `idCostumer` INT(11) NOT NULL AUTO_INCREMENT,
  `Customer_ID` INT(11) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `Adress` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `State/Province` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Postal Code` INT(5) NOT NULL,
  `Invoices_idInvoices` INT(11) NOT NULL,
  `Invoices_Cars_idCar` INT(11) NOT NULL,
  PRIMARY KEY (`idCostumer`, `Invoices_idInvoices`, `Invoices_Cars_idCar`),
  INDEX `fk_Customer_Invoices1_idx` (`Invoices_idInvoices` ASC, `Invoices_Cars_idCar` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_Invoices1`
    FOREIGN KEY (`Invoices_idInvoices` , `Invoices_Cars_idCar`)
    REFERENCES `mydb`.`Invoices` (`idInvoices` , `Cars_idCar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`SalesPerson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SalesPerson` (
  `IdSalesPerson` INT(11) NOT NULL AUTO_INCREMENT,
  `Staff_ID` INT(11) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Store` VARCHAR(45) NOT NULL,
  `Invoices_idInvoices` INT(11) NOT NULL,
  `Invoices_Cars_idCar` INT(11) NOT NULL,
  PRIMARY KEY (`IdSalesPerson`, `Invoices_idInvoices`, `Invoices_Cars_idCar`),
  INDEX `fk_SalesPerson_Invoices1_idx` (`Invoices_idInvoices` ASC, `Invoices_Cars_idCar` ASC) VISIBLE,
  CONSTRAINT `fk_SalesPerson_Invoices1`
    FOREIGN KEY (`Invoices_idInvoices` , `Invoices_Cars_idCar`)
    REFERENCES `mydb`.`Invoices` (`idInvoices` , `Cars_idCar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;





