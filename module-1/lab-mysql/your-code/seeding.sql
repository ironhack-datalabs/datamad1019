-- al poner autoincrement, no necesito especificar la Primary Key, pero mis Primary Key empiezan por 1 y no por 0.
INSERT INTO `cars`.`cars` (`VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue');
INSERT INTO `cars`.`cars` (`VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red');
INSERT INTO `cars`.`cars` (`VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White');
INSERT INTO `cars`.`cars` (`VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Silver');
INSERT INTO `cars`.`cars` (`VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gray');
INSERT INTO `cars`.`cars` (`VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', 2019, 'Gray');


INSERT INTO `cars`.`costumers` (`Customer ID`, `Name`, `Phone`, `Address`, `City`, `State/Province`, `Country`, `Postal`) VALUES ('10001', 'Pablo Picasso	', '+34 636 17 63 82	', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', '28045');
INSERT INTO `cars`.`costumers` (`Customer ID`, `Name`, `Phone`, `Address`, `City`, `State/Province`, `Country`, `Postal`) VALUES ('20001', 'Abraham Lincoln	', '+1 305 907 7086', '120 SW 8th St', 'Miami', 'Florida', 'United States', '33130');
INSERT INTO `cars`.`costumers` (`Customer ID`, `Name`, `Phone`, `Address`, `City`, `State/Province`, `Country`, `Postal`) VALUES ('30001', 'Napoleón Bonaparte', '+33 1 79 75 40 00	', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', '75008');


INSERT INTO `cars`.`salesperson` (`Staff ID`, `Name`, `Store`) VALUES ('00001', 'Petey Cruiser', 'Madrid');
INSERT INTO `cars`.`salesperson` (`Staff ID`, `Name`, `Store`) VALUES ('00002', 'Anna Sthesia', 'Barcelona');
INSERT INTO `cars`.`salesperson` (`Staff ID`, `Name`, `Store`) VALUES ('00003', 'Paul Molive', 'Berlin');
INSERT INTO `cars`.`salesperson` (`Staff ID`, `Name`, `Store`) VALUES ('00004', 'Gail Forcewind	', 'Paris');
INSERT INTO `cars`.`salesperson` (`Staff ID`, `Name`, `Store`) VALUES ('00005', 'Paige Turner', 'Mimia');
INSERT INTO `cars`.`salesperson` (`Staff ID`, `Name`, `Store`) VALUES ('00006', 'Bob Frapples', 'Mexico City');
INSERT INTO `cars`.`salesperson` (`Staff ID`, `Name`, `Store`) VALUES ('00007', 'Walter Melon', 'Amsterdam');
INSERT INTO `cars`.`salesperson` (`Staff ID`, `Name`, `Store`) VALUES ('00008', 'Shonda Leer', 'São Paulo');


INSERT INTO `cars`.`invoices` (`Invoice Number`, `Date`, `cars_ID`, `salesperson_ID`, `costumers_ID`) VALUES ('852399038', '2018-08-22', '1', '4', '2');
INSERT INTO `cars`.`invoices` (`Invoice Number`, `Date`, `cars_ID`, `salesperson_ID`, `costumers_ID`) VALUES ('731166526', '2018-12-31', '4', '6', '1');
INSERT INTO `cars`.`invoices` (`Invoice Number`, `Date`, `cars_ID`, `salesperson_ID`, `costumers_ID`) VALUES ('271135104', '2019-01-22', '3', '8', '3');
