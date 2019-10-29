INSERT INTO `mydb`.`Cars` (`ID`, `VIN`, `Manufacter`, `Model`, `Year`, `Color`) VALUES ('1', '2342', 'Volvo', 'Toni', '2012', 'blue');
INSERT INTO `mydb`.`Cars` (`ID`, `VIN`, `Manufacter`, `Model`, `Year`, `Color`) VALUES ('2', '234234', 'Opel', 'Cristina', '2009', 'yellow');
INSERT INTO `mydb`.`Cars` (`ID`, `VIN`, `Manufacter`, `Model`, `Year`, `Color`) VALUES ('3', '33242', 'Kia', 'Ovi', '2012', 'red');
INSERT INTO `mydb`.`Cars` (`ID`, `VIN`, `Manufacter`, `Model`, `Year`, `Color`) VALUES ('4', '234234', 'Volvo', 'Alex', '2013', 'green');
INSERT INTO `mydb`.`Cars` (`ID`, `VIN`, `Manufacter`, `Model`, `Year`, `Color`) VALUES ('5', '23423', 'Renault', 'Seo', '2013', 'red');


INSERT INTO `mydb`.`Customers` (`ID`, `customerid`, `Name`, `phonenumber`, `address`, `city`, `state`, `country`, `zip`) VALUES ('1', '1001', 'BEgo', '4564564', 'calle del olmo', 'murcia', 'murcia', 'spain', '3');
INSERT INTO `mydb`.`Customers` (`ID`, `customerid`, `Name`, `phonenumber`, `address`, `city`, `state`, `country`, `zip`) VALUES ('2', '1002', 'Fran', '45645', 'calle de la pera', 'madrid', 'madrid', 'spain', '23423');
INSERT INTO `mydb`.`Customers` (`ID`, `customerid`, `Name`, `phonenumber`, `address`, `city`, `state`, `country`, `zip`) VALUES ('3', '1003', 'Felipe', '54646', 'calle de la manzana', 'bilbao', 'bilbao', 'spain', '3242');
INSERT INTO `mydb`.`Customers` (`ID`, `customerid`, `Name`, `phonenumber`, `address`, `city`, `state`, `country`, `zip`) VALUES ('4', '1004', 'Noe', '4564', 'calle del olvido', 'almeria', 'almeria', 'spain', '342');

INSERT INTO `mydb`.`Salesperson` (`ID`, `name`, `store`) VALUES ('1', 'Ari', 'murcia');
INSERT INTO `mydb`.`Salesperson` (`ID`, `name`, `store`) VALUES ('2', 'Lamber', 'madrid');
INSERT INTO `mydb`.`Salesperson` (`ID`, `name`, `store`) VALUES ('3', 'Celine', 'murcia');
INSERT INTO `mydb`.`Salesperson` (`ID`, `name`, `store`) VALUES ('4', 'Jessie', 'oviedo');

INSERT INTO `mydb`.`Invoices` (`ID`, `invoicenumber`, `date`, `Cars_ID`, `Customers_ID`, `Salesperson_ID`) VALUES ('1', '12341', '2012-12-12', '1', '1', '1');
INSERT INTO `mydb`.`Invoices` (`ID`, `invoicenumber`, `date`, `Cars_ID`, `Customers_ID`, `Salesperson_ID`) VALUES ('2', '324123', '2010-07-07', '2', '2', '2');
INSERT INTO `mydb`.`Invoices` (`ID`, `invoicenumber`, `date`, `Cars_ID`, `Customers_ID`, `Salesperson_ID`) VALUES ('3', '432141', '2013-06-06', '3', '3', '3');
INSERT INTO `mydb`.`Invoices` (`ID`, `invoicenumber`, `date`, `Cars_ID`, `Customers_ID`, `Salesperson_ID`) VALUES ('5', '142341', '2013-06-06', '4', '4', '4');


