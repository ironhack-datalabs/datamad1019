INSERT INTO `lab_mysql`.`cars` (`idcars`, `VIN`, `brand`, `model`, `year`, `color`) VALUES ('1', '3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', '2019', 'Blue');
INSERT INTO `lab_mysql`.`cars` (`idcars`, `VIN`, `brand`, `model`, `year`, `color`) VALUES ('2', 'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', '2019', 'Red');
INSERT INTO `lab_mysql`.`cars` (`idcars`, `VIN`, `brand`, `model`, `year`, `color`) VALUES ('3', 'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', '2018', 'White');
INSERT INTO `lab_mysql`.`cars` (`idcars`, `VIN`, `brand`, `model`, `year`, `color`) VALUES ('4', 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', '2018', 'Silver');
INSERT INTO `lab_mysql`.`cars` (`idcars`, `VIN`, `brand`, `model`, `year`, `color`) VALUES ('5', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', '2019', 'Gray');
INSERT INTO `lab_mysql`.`cars` (`idcars`, `VIN`, `brand`, `model`, `year`, `color`) VALUES ('6', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', '2019', 'Gray');


INSERT INTO `lab_mysql`.`costumers` (`idcostumers`, `CID`, `name`, `phone`, `email`, `address`, `city`, `state`, `country`, `zip`) VALUES ('1', '10001', 'Pablo Picasso', '654321987', '-', 'Casa Campo 12', 'Madrid', 'Madrid', 'España', '28006');
INSERT INTO `lab_mysql`.`costumers` (`idcostumers`, `CID`, `name`, `phone`, `email`, `address`, `city`, `state`, `country`, `zip`) VALUES ('2', '20001', 'Abraham Lincoln', '987456321', '-', 'Casa Campo 13', 'Barcelona', 'Cataluña', 'España', '54001');
INSERT INTO `lab_mysql`.`costumers` (`idcostumers`, `CID`, `name`, `phone`, `email`, `address`, `city`, `state`, `country`, `zip`) VALUES ('3', '30001', 'Napoleón Bonaparte', '123456789', '-', 'Casa Campo 14', 'Paris', 'París', 'Francia', '789456');


INSERT INTO `lab_mysql`.`salesperson` (`idsalesperson`, `SID`, `name`, `store`) VALUES ('1', '00001', 'Petey Cruiser', 'Madrid');
INSERT INTO `lab_mysql`.`salesperson` (`idsalesperson`, `SID`, `name`, `store`) VALUES ('2', '00002', 'Anna Sthesia', 'Barcelona');
INSERT INTO `lab_mysql`.`salesperson` (`idsalesperson`, `SID`, `name`, `store`) VALUES ('3', '00003', 'Paul Molive', 'Berlín');
INSERT INTO `lab_mysql`.`salesperson` (`idsalesperson`, `SID`, `name`, `store`) VALUES ('4', '00004', 'Gail Forcewind', 'París');
INSERT INTO `lab_mysql`.`salesperson` (`idsalesperson`, `SID`, `name`, `store`) VALUES ('5', '00005', 'Paige Turner', 'Mimia');
INSERT INTO `lab_mysql`.`salesperson` (`idsalesperson`, `SID`, `name`, `store`) VALUES ('6', '00006', 'Bob Frapples', 'Mexico city');
INSERT INTO `lab_mysql`.`salesperson` (`idsalesperson`, `SID`, `name`, `store`) VALUES ('7', '00007', 'Walter Melon', 'Amsterdam');
INSERT INTO `lab_mysql`.`salesperson` (`idsalesperson`, `SID`, `name`, `store`) VALUES ('8', '00008', 'Shonda Leer', 'Sao Paulo');


INSERT INTO `lab_mysql`.`invoices` (`idinvoices`, `invoice number`, `date`, `cars_idcars`, `costumers_idcostumers`, `salesperson_idsalesperson`) VALUES ('1', '852399038', '2018-08-22', '1', '2', '2');
INSERT INTO `lab_mysql`.`invoices` (`idinvoices`, `invoice number`, `date`, `cars_idcars`, `costumers_idcostumers`, `salesperson_idsalesperson`) VALUES ('2', '731166526', '2018-12-31', '4', '1', '1');
INSERT INTO `lab_mysql`.`invoices` (`idinvoices`, `invoice number`, `date`, `cars_idcars`, `costumers_idcostumers`, `salesperson_idsalesperson`) VALUES ('3', '271135104', '2019-', '3', '3', '3');
