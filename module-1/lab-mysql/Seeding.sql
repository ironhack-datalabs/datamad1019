

#Customer

INSERT INTO `mydb`.`Car` (`idCar`, `VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('0', '3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', '2019', 'Blue');
INSERT INTO `mydb`.`Car` (`idCar`, `VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('1', 'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', '2019', 'Red');
INSERT INTO `mydb`.`Car` (`idCar`, `VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('3', 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', '2018', 'Silver');
INSERT INTO `mydb`.`Car` (`idCar`, `VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('3', 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', '2018', 'Silver');
INSERT INTO `mydb`.`Car` (`idCar`, `VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('4', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', '2019', 'Gray');
INSERT INTO `mydb`.`Car` (`idCar`, `VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('5', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', '2019', 'Gray');


# Fill in fields from Salesperson

INSERT INTO `mydb`.`Salesperson` (`ID`, `Staff ID`, `Name`, `Store`) VALUES ('0', '00001', 'Petey Cruiser', 'Madrid');
INSERT INTO `mydb`.`Salesperson` (`ID`, `Staff ID`, `Name`, `Store`) VALUES ('1', '00002', 'Anna Sthesia', 'Barcelona');
INSERT INTO `mydb`.`Salesperson` (`ID`, `Staff ID`, `Name`, `Store`) VALUES ('2', '00003', 'Paul Molive', 'Berlin');
INSERT INTO `mydb`.`Salesperson` (`ID`, `Staff ID`, `Name`, `Store`) VALUES ('3', '00004', 'Gail Forcewind', 'Paris');
INSERT INTO `mydb`.`Salesperson` (`ID`, `Staff ID`, `Name`, `Store`) VALUES ('4', '00005', 'Paige Turner', 'Mimia');
INSERT INTO `mydb`.`Salesperson` (`ID`, `Staff ID`, `Name`, `Store`) VALUES ('5', '00006', 'Bob Frapples', 'Mexico City');
INSERT INTO `mydb`.`Salesperson` (`ID`, `Staff ID`, `Name`, `Store`) VALUES ('6', '00007', 'Walter Melon', 'Amsterdam');
INSERT INTO `mydb`.`Salesperson` (`ID`, `Staff ID`, `Name`, `Store`) VALUES ('7', '00008', 'Shonda Leer', 'Sao Paulo');


# Fill in fields from Invoice

INSERT INTO `mydb`.`Invoice` (`idInvoice`, `Invoice Number`, `Date`, `Car`, `Customer`, `Sales person`) VALUES ('0', '852399038', '2018-08-22', '0', '1', '3');
INSERT INTO `mydb`.`Invoice` (`idInvoice`, `Invoice Number`, `Date`, `Car`, `Customer`, `Sales person`) VALUES ('1', '731166526', '2018-12-31', '3', '0', '5');
INSERT INTO `mydb`.`Invoice` (`idInvoice`, `Invoice Number`, `Date`, `Car`, `Customer`, `Sales person`) VALU