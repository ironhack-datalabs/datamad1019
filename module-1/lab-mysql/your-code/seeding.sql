
# CARS:
# SELECT * FROM mydb.cars;
INSERT INTO `mydb`.`cars` (`ID`, `VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('0', '3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', '2019', 'Blue');
INSERT INTO `mydb`.`cars` (`ID`, `VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('1', 'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', '2019', 'Red');
INSERT INTO `mydb`.`cars` (`ID`, `VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('2', 'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', '2018', 'White');
INSERT INTO `mydb`.`cars` (`ID`, `VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('3', 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', '2018', 'Silver');
INSERT INTO `mydb`.`cars` (`ID`, `VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('4', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', '2019', 'Grey');
INSERT INTO `mydb`.`cars` (`ID`, `VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('5', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', '2019', 'Grey');

# CUSTOMERS:
# SELECT * FROM mydb.customers;
INSERT INTO `mydb`.`customers` (`ID`, `customerID`, `Name`, `Phone`, `Email`, `Address`, `City`, `State/Province`, `Country`, `Postal`) VALUES ('0', '10001', 'Pablo Picasso', '+34 636 17 63 82', '-', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', '28045');
INSERT INTO `mydb`.`customers` (`ID`, `customerID`, `Name`, `Phone`, `Email`, `Address`, `City`, `State/Province`, `Country`, `Postal`) VALUES ('1', '20001', 'Abraham Lincoln', '+1 305 907 7086', '-', '120 SW 8th St', 'Miami', 'Florida', 'United States', '33130');
INSERT INTO `mydb`.`customers` (`ID`, `customerID`, `Name`, `Phone`, `Email`, `Address`, `City`, `State/Province`, `Country`, `Postal`) VALUES ('2', '30001', 'Napoléon Bonaparte', '+33 1 79 75 40 00', '-', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', '75008');

# SALES PERSONS:
# SELECT * FROM mydb.salespersons;
INSERT INTO `mydb`.`salespersons` (`ID`, `StaffID`, `Name`, `Store`) VALUES ('0', '00001', 'Julio Porto', 'Madrid');
INSERT INTO `mydb`.`salespersons` (`ID`, `StaffID`, `Name`, `Store`) VALUES ('1', '00002', 'Alex Mendez', 'Madrid');
INSERT INTO `mydb`.`salespersons` (`ID`, `StaffID`, `Name`, `Store`) VALUES ('2', '00003', 'Cristina Rota', 'Barcelona');
INSERT INTO `mydb`.`salespersons` (`ID`, `StaffID`, `Name`, `Store`) VALUES ('3', '00004', 'Ovi Fernandez', 'Berlin');
INSERT INTO `mydb`.`salespersons` (`ID`, `StaffID`, `Name`, `Store`) VALUES ('4', '00005', 'Paige Turner', 'Mimia');

# INVOICES:
# SELECT * FROM mydb.invoices;
INSERT INTO `mydb`.`invoices` (`ID`, `InvoiceNumber`, `Date`, `Cars_ID`, `Salespersons_ID`, `Customers_ID`) VALUES ('0', '852399038', '2018-08-22', '0', '1', '2');
INSERT INTO `mydb`.`invoices` (`ID`, `InvoiceNumber`, `Date`, `Cars_ID`, `Salespersons_ID`, `Customers_ID`) VALUES ('1', '731166526', '2018-12-31', '3', '0', '0');
INSERT INTO `mydb`.`invoices` (`ID`, `InvoiceNumber`, `Date`, `Cars_ID`, `Salespersons_ID`, `Customers_ID`) VALUES ('2', '271135104', '2019-01-22', '2', '2', '1');
