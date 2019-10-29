--Challenge 2: create.sql

--mysql workbench
USE mysql workbench;


--Table: Cars
CREATE TABLE IF NOT EXISTS `Lab_MySQL`.`Cars` (
  `Car_ID` INT(11) NOT NULL,
  `VIN` VARCHAR(45) NOT NULL,
  `Manufacturer` VARCHAR(45) NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `Year` INT(11) NOT NULL,
  PRIMARY KEY (`Car_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1

  --Table: Customers
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
DEFAULT CHARACTER SET = latin1

  --Table: Sales_Persons
CREATE TABLE IF NOT EXISTS `Lab_MySQL`.`Sales_Persons` (
  `idSales_Persons` INT(11) NOT NULL,
  `Staff_ID` VARCHAR(45) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSales_Persons`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1

  --Table: Invoices
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
DEFAULT CHARACTER SET = latin1