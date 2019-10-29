--Challenge 2: create.sql

--mysql workbench
USE mysql workbench;


-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Lab_MySQL
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Lab_MySQL
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Lab_MySQL` DEFAULT CHARACTER SET latin1 ;
USE `Lab_MySQL` ;

-- -----------------------------------------------------
-- Table `Lab_MySQL`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lab_MySQL`.`Cars` (
  `Car_ID` INT(11) NOT NULL,
  `VIN` VARCHAR(45) NOT NULL,
  `Manufacturer` VARCHAR(45) NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `Year` INT(11) NOT NULL,
  PRIMARY KEY (`Car_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Lab_MySQL`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lab_MySQL`.`Customers` (
  `idCustomers` INT(11) NOT NULL,
  `ID_Number` VARCHAR(45) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Phone` INT(11) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `Address` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(45) NOT NULL,
  `State/Province` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Postal` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCustomers`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Lab_MySQL`.`Sales_Persons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lab_MySQL`.`Sales_Persons` (
  `idSales_Persons` INT(11) NOT NULL,
  `Staff_ID` VARCHAR(45) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSales_Persons`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Lab_MySQL`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lab_MySQL`.`Invoices` (
  `idInvoices` INT(11) NOT NULL,
  `Invoice_ID` INT(11) NOT NULL,
  `Date` DATETIME NOT NULL,
  `Cars_Car_ID` INT(11) NOT NULL,
  `Customers_idCustomers` INT(11) NOT NULL,
  `Sales_Persons_idSales_Persons` INT(11) NOT NULL,
  PRIMARY KEY (`idInvoices`, `Cars_Car_ID`, `Customers_idCustomers`, `Sales_Persons_idSales_Persons`),
  INDEX `fk_Invoices_Cars1_idx` (`Cars_Car_ID` ASC),
  INDEX `fk_Invoices_Customers1_idx` (`Customers_idCustomers` ASC),
  INDEX `fk_Invoices_Sales_Persons1_idx` (`Sales_Persons_idSales_Persons` ASC),
  CONSTRAINT `fk_Invoices_Cars1`
    FOREIGN KEY (`Cars_Car_ID`)
    REFERENCES `Lab_MySQL`.`Cars` (`Car_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Customers1`
    FOREIGN KEY (`Customers_idCustomers`)
    REFERENCES `Lab_MySQL`.`Customers` (`idCustomers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Sales_Persons1`
    FOREIGN KEY (`Sales_Persons_idSales_Persons`)
    REFERENCES `Lab_MySQL`.`Sales_Persons` (`idSales_Persons`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

---Challenge 3: Seeding.sql

INSERT INTO Cars
(ID,VIN,Manufacturer,Model,Year,Color)
VALUES
(0,'3K096I98581DHSNUP','Volkswagen','Tiguan',2019,'Blue'),
(1,'ZM8G7BEUQZ97IH46V','Peugeot','Rifter',2019,'Red'),
(2,'RKXVNNIHLVVZOUB4M','Ford','Fusion',2018,'White'),
(3,'HKNDGS7CU31E9Z7JW','Toyota','RAV4',2018,'Silver'),
(4,'DAM41UDN3CHU2WVF6','Volvo','V60',2019,'Gray'),
(5,'DAM41UDN3CHU2WVF6','Volvo','V60 Cross Country',2019,'Gray')
;
INSERT INTO Customers
(ID,Customer_ID,Name,Phone,Address,City,State_Province,Country,Postal)
VALUES
(0,10001,'Pablo Picasso','636176382','Paseo de la Chopera 14','Madrid','Madrid','Spain',28045),
(1,20001,'Abraham Lincoln','3059077086','120 SW 8th St','Miami','Florida','United States',33130),
(2,30001,'Napoleon Bonaparte','179754000','40 Rue du Colisée','Paris','Île-de-France','France',75008)
;
INSERT INTO Invoices
(ID,Invoice_Number,Date,Car,Customer,Staff)
VALUES
(0,852399038,'2018-08-22',0,1,3),
(1,731166526,'2018-12-31',3,0,5),
(2,271135104,'2019-01-22',2,2,7)
;
INSERT INTO Sales_Persons
(ID,Staff_ID,Name,Store)
VALUES
(0,1,'Petey Cruiser','Madrid'),
(1,2,'Anna Sthesia','Barcelona'),
(2,3,'Paul Molive','Berlin'),
(3,4,'Gail Forcewind','Paris'),
(4,5,'Paige Turner','Miami'),
(5,6,'Bob Frapples','Mexico City'),
(6,7,'Walter Melon','Amsterdam'),
(7,8,'Shonda Leer','São Paulo')
;