INSERT INTO `mydb`.`Cars` (`VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', '2019', 'Blue');
INSERT INTO `mydb`.`Cars` (`VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('ZM8G7BEUQZ97IH46V', 'Peugeut', 'Rifter', '2019', 'Red');
INSERT INTO `mydb`.`Cars` (`VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', '2018', 'White');
INSERT INTO `mydb`.`Cars` (`VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', '2018', 'Silver');
INSERT INTO `mydb`.`Cars` (`VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('DAM41UDN3CHU2WVF6', 'Volvo', 'V60', '2019', 'Gray');
INSERT INTO `mydb`.`Cars` (`VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', '2019', 'Gray');

INSERT INTO `mydb`.`Customer` (`Customer_ID`, `Name`, `Phone`, `Adress`, `City`, `State/Province`, `Country`, `Postal Code`) VALUES ('10001', 'Pablo Picasso', '+34636176382', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', '28045');
INSERT INTO `mydb`.`Customer` (`Customer_ID`, `Name`, `Phone`, `Adress`, `City`, `State/Province`, `Country`, `Postal Code`) VALUES ('20001', 'Abraham Lincoln', '+13059077086', '120 SW 8th St', 'Miami', 'Florida', 'United States', '33130');
INSERT INTO `mydb`.`Customer` (`Customer_ID`, `Name`, `Phone`, `Adress`, `City`, `State/Province`, `Country`, `Postal Code`) VALUES ('30001', 'Napoleón Bonaparte', '+33179754000', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', '75008');

INSERT INTO `mydb`.`Invoices` (`Invoice_No`, `Date`, `Car`, `Customer`, `Sales Person`) VALUES ('852399038', '2018-08-22', '0', '1', '3');
INSERT INTO `mydb`.`Invoices` (`Invoice_No`, `Date`, `Car`, `Customer`, `Sales Person`) VALUES ('731166526', '2018-12-31', '3', '0', '5');
INSERT INTO `mydb`.`Invoices` (`Invoice_No`, `Date`, `Car`, `Customer`, `Sales Person`) VALUES ('271135104', '2019-01-22', '2', '2', '7');

INSERT INTO `mydb`.`SalesPerson` (`Staff_ID`, `Name`, `Store`) VALUES ('00001', 'Petey Cruiser', 'Madrid');
INSERT INTO `mydb`.`SalesPerson` (`Staff_ID`, `Name`, `Store`) VALUES ('00002', 'Anna Sthesia', 'Barcelona');
INSERT INTO `mydb`.`SalesPerson` (`Staff_ID`, `Name`, `Store`) VALUES ('00003', 'Paul Molive', 'Berlin');
INSERT INTO `mydb`.`SalesPerson` (`Staff_ID`, `Name`, `Store`) VALUES ('00004', 'Gail Forcewind', 'Paris');
INSERT INTO `mydb`.`SalesPerson` (`Staff_ID`, `Name`, `Store`) VALUES ('00005', 'Paige Turner', 'Miami');
INSERT INTO `mydb`.`SalesPerson` (`Staff_ID`, `Name`, `Store`) VALUES ('00006', 'Bob Frapples', 'Mexico City');
INSERT INTO `mydb`.`SalesPerson` (`Staff_ID`, `Name`, `Store`) VALUES ('00007', 'Walter Melon', 'Amsterdam');
INSERT INTO `mydb`.`SalesPerson` (`Staff_ID`, `Name`, `Store`) VALUES ('00008', 'Shonda Leer', 'São Paulo');