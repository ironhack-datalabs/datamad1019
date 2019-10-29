#cars ok

INSERT INTO `lab-mysql`.`cars` (`cars id`, `VIN`, `manufacturer`, `model`, `year`, `Colour`) VALUES ('1', 'ZM8G7BEUQZ97IH46V	', 'Peugeot', 'Rifter', '2019-01-01', 'Red');
INSERT INTO `lab-mysql`.`cars` (`cars id`, `VIN`, `manufacturer`, `model`, `year`, `Colour`) VALUES ('2', 'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', '2018-01-01', 'White');
INSERT INTO `lab-mysql`.`cars` (`cars id`, `VIN`, `manufacturer`, `model`, `year`, `Colour`) VALUES ('3', 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', '2018-01-01', 'Silver');
INSERT INTO `lab-mysql`.`cars` (`cars id`, `VIN`, `manufacturer`, `model`, `year`, `Colour`) VALUES ('4', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', '2019-01-01', 'Gray');
INSERT INTO `lab-mysql`.`cars` (`cars id`, `VIN`, `manufacturer`, `model`, `year`, `Colour`) VALUES ('5', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', '2019-01-01', 'Gray');


# Customers error : ERROR 1406: 1406: Data too long for column 'name' at row 1

INSERT INTO `lab-mysql`.`customers` (`customer ID`, `name`, `phone number`, `email`, `address`, `city`, `state/province`, `country`, `zip/postal code`, `customers id`) VALUES ('0', 'Pablo Picasso	', '+34 636 17 63 82	', '-', 'Paseo de la Chopera, 14	', 'Madrid', 'Madrid', 'Spain', '28045', '10001');
INSERT INTO `lab-mysql`.`customers` (`customer ID`, `name`, `phone number`, `email`, `address`, `city`, `state/province`, `country`, `zip/postal code`, `customers id`) VALUES ('1', 'Abraham Lincoln	', '+1 305 907 7086	', '-', '120 SW 8th St	', 'Miami', 'Florida', 'United States', '33130\n', '20001');
INSERT INTO `lab-mysql`.`customers` (`customer ID`, `name`, `phone number`, `email`, `address`, `city`, `state/province`, `country`, `zip/postal code`, `customers id`) VALUES ('2', 'Napoléon Bonaparte	', '+33 1 79 75 40 00	', '-', '40 Rue du Colisée	', 'Paris', 'Île-de-France	', 'France', '75008', '30001');

# invoices error : ERROR 1452: 1452: Cannot add or update a child row: a foreign key constraint fails (`lab-mysql`.`invoices`, CONSTRAINT `fk_invoices_salesperson1` FOREIGN KEY (`salesperson`) REFERENCES `salesperson` (`staff ID`) ON DELETE NO ACTION ON UPDATE NO ACTION)
INSERT INTO `lab-mysql`.`invoices` (`invoices id`, `invoice number`, `date`, `car`, `salesperson`, `customer`) VALUES ('0', '852399038', '2018-08-22', '0', '1', '3');
INSERT INTO `lab-mysql`.`invoices` (`invoices id`, `invoice number`, `date`, `car`, `salesperson`, `customer`) VALUES ('1', '731166526', '2018-12-31', '3', '0', '5');
INSERT INTO `lab-mysql`.`invoices` (`invoices id`, `invoice number`, `date`, `car`, `salesperson`, `customer`) VALUES ('2', '271135104', '2019-01-22', '2', '2', '7');


#sales person error :ERROR 1406: 1406: Data too long for column 'name' at row 1
INSERT INTO `lab-mysql`.`salesperson` (`salesperson id`, `staff ID`, `name`, `store`) VALUES ('0', '00001', 'Petey Cruiser', 'Madrid');
