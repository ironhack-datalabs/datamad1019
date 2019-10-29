#tabla cars

INSERT INTO `lab-mysql`.`Cars` (`idCars`, `VINS`, `manufacturer`, `model`, `year`, `color`) VALUES ('0', '3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', '2019', 'Blue');
INSERT INTO `lab-mysql`.`Cars` (`idCars`, `VINS`, `manufacturer`, `model`, `year`, `color`) VALUES ('1', 'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', '2019', 'Red');
INSERT INTO `lab-mysql`.`Cars` (`idCars`, `VINS`, `manufacturer`, `model`, `year`, `color`) VALUES ('2', 'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', '2018', 'White');
INSERT INTO `lab-mysql`.`Cars` (`idCars`, `VINS`, `manufacturer`, `model`, `year`, `color`) VALUES ('3', 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', '2018', 'Silver');
INSERT INTO `lab-mysql`.`Cars` (`idCars`, `VINS`, `manufacturer`, `model`, `year`, `color`) VALUES ('4', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', '2019', 'Gray');
INSERT INTO `lab-mysql`.`Cars` (`idCars`, `VINS`, `manufacturer`, `model`, `year`, `color`) VALUES ('5', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', '2019', 'Gray');

#tabla customers

INSERT INTO `lab-mysql`.`Customers` (`idCustomers`, `name`, `phone number`, `email`, `address`, `city`, `state/province`, `country`, `zip/postal code`) VALUES ('10001', 'Pablo Picasso', '+34 636 17 63 82', '-', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', '28045');
INSERT INTO `lab-mysql`.`Customers` (`idCustomers`, `name`, `phone number`, `email`, `address`, `city`, `state/province`, `country`, `zip/postal code`) VALUES ('20001', 'Abraham Lincoln', '+1 305 907 7086', '-', '120 SW 8th St', 'Miami', 'Florida', 'United States', '33130');
INSERT INTO `lab-mysql`.`Customers` (`idCustomers`, `name`, `phone number`, `email`, `address`, `city`, `state/province`, `country`, `zip/postal code`) VALUES ('30001', 'Napoléon Bonaparte', '+33 1 79 75 40 00', '-', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', '75008');

#salespersons

INSERT INTO `lab-mysql`.`Salespersons` (`idSalespersons`, `name`, `store`) VALUES ('00001', 'Petey Cruiser', 'Madrid');
INSERT INTO `lab-mysql`.`Salespersons` (`idSalespersons`, `name`, `store`) VALUES ('00002', 'Anna Sthesia', 'Barcelona');
INSERT INTO `lab-mysql`.`Salespersons` (`idSalespersons`, `name`, `store`) VALUES ('00003', 'Paul Molive', 'Berlin');
INSERT INTO `lab-mysql`.`Salespersons` (`idSalespersons`, `name`, `store`) VALUES ('00004', 'Gail Forcewind', 'Paris');
INSERT INTO `lab-mysql`.`Salespersons` (`idSalespersons`, `name`, `store`) VALUES ('00005', 'Paige Turner', 'Mimia');
INSERT INTO `lab-mysql`.`Salespersons` (`idSalespersons`, `name`, `store`) VALUES ('00006', 'Bob Frapples', 'Mexico City');
INSERT INTO `lab-mysql`.`Salespersons` (`idSalespersons`, `name`, `store`) VALUES ('00007', 'Walter Melon', 'Amsterdam');
INSERT INTO `lab-mysql`.`Salespersons` (`idSalespersons`, `name`, `store`) VALUES ('00008', 'Shonda Leer', 'São Paulo');

#invoices

INSERT INTO `lab-mysql`.`Invoice` (`idInvoice`, `date`, `Customers_ID`, `Cars_idCars`, `Salespersons_idSalespersons`) VALUES ('852399038', '2018-08-22', '1', '0', '3');
INSERT INTO `lab-mysql`.`Invoice` (`idInvoice`, `date`, `Customers_ID`, `Cars_idCars`, `Salespersons_idSalespersons`) VALUES ('731166526', '2018-12-31', '0', '3', '5');
INSERT INTO `lab-mysql`.`Invoice` (`idInvoice`, `date`, `Customers_ID`, `Cars_idCars`, `Salespersons_idSalespersons`) VALUES ('271135104', '2019-01-22', '2', '2', '7');
