INSERT INTO `mydb`.`Cars` (`Manufacturer`, `Model`, `Year`, `Color`,`VIN`) VALUES ('Volkswagen', 'Tiguan', '2019', 'Blue','3K096I98581DHSNUP');
INSERT INTO `mydb`.`Cars` (`Manufacturer`, `Model`, `Year`, `Color`,`VIN`) VALUES ('Peugeot', 'Rifter', '2019', 'Red','ZM8G7BEUQZ97IH46V');
INSERT INTO `mydb`.`Cars` (`Manufacturer`, `Model`, `Year`, `Color`,`VIN`) VALUES ('Ford', 'Fusion', '2018', 'White', 'RKXVNNIHLVVZOUB4M');
INSERT INTO `mydb`.`Cars` (`Manufacturer`, `Model`, `Year`, `Color`,`VIN`) VALUES ('Toyota', 'RAV4', '2018', 'Silver', 'HKNDGS7CU31E9Z7JW');
INSERT INTO `mydb`.`Cars` (`Manufacturer`, `Model`, `Year`, `Color`,`VIN`) VALUES ('Volvo', 'V60', '2019', 'White', 'DAM41UDN3CHU2WVF6');
INSERT INTO `mydb`.`Cars` (`Manufacturer`, `Model`, `Year`, `Color`,`VIN`) VALUES ('Volvo', 'V60 Cross Country', '2019', 'Gray', 'DAM41UDN3CHU2WVF6');

INSERT INTO `mydb`.`Customers` (`Customer ID`, `Name`, `Phone`, `Address`, `City`, `State/Province`, `Country`,`Postal`) VALUES ('10001', 'Pablo Picasso', '+34 636 17 63 82', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain','28045');
INSERT INTO `mydb`.`Customers` (`Customer ID`, `Name`, `Phone`, `Address`, `City`, `State/Province`, `Country`,`Postal`) VALUES ('20001', 'Abraham Lincoln', '+1 305 907 7086', '120 SW 8th St', 'Miami', 'Florida', 'United States','33130');
INSERT INTO `mydb`.`Customers` (`Customer ID`, `Name`, `Phone`, `Address`, `City`, `State/Province`, `Country`,`Postal`) VALUES ('30001', 'Napoléon Bonaparte', '+33 1 79 75 40 00', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France','75008');

INSERT INTO `mydb`.`Salesperson` (`Staff ID`, `Name`, `Store`) VALUES ('00001', 'Petey Cruiser	', 'Madrid');
INSERT INTO `mydb`.`Salesperson` (`Staff ID`, `Name`, `Store`) VALUES ('00002', 'Anna Sthesia	', 'Barcelona');
INSERT INTO `mydb`.`Salesperson` (`Staff ID`, `Name`, `Store`) VALUES ('00003	', 'Paul Molive	', 'Berlin');
INSERT INTO `mydb`.`Salesperson` (`Staff ID`, `Name`, `Store`) VALUES ('00004', 'Gail Forcewind	', 'Paris');
INSERT INTO `mydb`.`Salesperson` (`Staff ID`, `Name`, `Store`) VALUES ('00005', 'Paige Turner	', 'Mimia');
INSERT INTO `mydb`.`Salesperson` (`Staff ID`, `Name`, `Store`) VALUES ('00006', 'Bob Frapples	', 'Mexico City');
INSERT INTO `mydb`.`Salesperson` (`Staff ID`, `Name`, `Store`) VALUES ('00007', 'Walter Melon	', 'Amsterdam');
INSERT INTO `mydb`.`Salesperson` (`Staff ID`, `Name`, `Store`) VALUES ('00008', 'Shonda Leer	', 'São Paulo');

INSERT INTO `mydb`.`Invoices` (`Invoice Number`, `Date`, `Cars_idCars`, `Salesperson_idSalesperson`, `Customers_idCustomers`) VALUES ('852399038', '22-08-2018	', '1', '4', '2');
INSERT INTO `mydb`.`Invoices` (`Invoice Number`, `Date`, `Cars_idCars`, `Salesperson_idSalesperson`, `Customers_idCustomers`) VALUES ('731166526', '31-12-2018	', '4', '6', '1');
INSERT INTO `mydb`.`Invoices` (`Invoice Number`, `Date`, `Cars_idCars`, `Salesperson_idSalesperson`, `Customers_idCustomers`) VALUES ('271135104', '22-01-2019	', '3', '8', '3');

