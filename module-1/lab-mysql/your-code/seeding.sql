#insertar en car
INSERT INTO `car_dealership`.`Car` (`CarID`,`VIN`,`Manufacturer`,`Model`,`Year`,`Color`)VALUES ('0', '3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', '2019', 'Blue');
INSERT INTO `car_dealership`.`Car` (`CarID`,`VIN`,`Manufacturer`,`Model`,`Year`,`Color`)VALUES ('1', 'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', '2019', 'Red');                                                                                    
INSERT INTO `car_dealership`.`Car` (`CarID`,`VIN`,`Manufacturer`,`Model`,`Year`,`Color`)VALUES ('2', 'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', '2018', 'White');
INSERT INTO `car_dealership`.`Car` (`CarID`,`VIN`,`Manufacturer`,`Model`,`Year`,`Color`)VALUES ('3', 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', '2018', 'Silver');
INSERT INTO `car_dealership`.`Car` (`CarID`,`VIN`,`Manufacturer`,`Model`,`Year`,`Color`)VALUES ('4', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', '2019', 'Grey');
INSERT INTO `car_dealership`.`Car` (`CarID`,`VIN`,`Manufacturer`,`Model`,`Year`,`Color`)VALUES ('5', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', '2019', 'Grey');

#insertar en customer
INSERT INTO `car_dealership`.`Customer` (`ID`, `CustomerID`, `Name`, `Phone number`, `Email`, `Address`, `City`, `State/Province`, `Country`, `Zip/postal`) VALUES ('0', '10001', 'Pablo Picasso', '+34 636 17 63 82', '', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', '28045');
INSERT INTO `car_dealership`.`Customer` (`ID`, `CustomerID`, `Name`, `Phone number`, `Email`, `Address`, `City`, `State/Province`, `Country`, `Zip/postal`) VALUES ('1', '20001', 'Abraham Lincoln', '+1 305 907 7086', '', '120 SW 8th St', 'Miami', 'Florida', 'United States', '33130');
INSERT INTO `car_dealership`.`Customer` (`ID`, `CustomerID`, `Name`, `Phone number`, `Email`, `Address`, `City`, `State/Province`, `Country`, `Zip/postal`) VALUES ('2', '30001', 'Napoléon Bonaparte', '+33 1 79 75 40 00', '', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', '75008');

#insertar en Salesperson
INSERT INTO `car_dealership`.`Salesperson` (`ID`, `staffID`, `Name`, `Store`) VALUES ('0', '00001', 'Petey Cruiser', 'Madrid');
INSERT INTO `car_dealership`.`Salesperson` (`ID`, `staffID`, `Name`, `Store`) VALUES ('1', '00002', 'Anna Sthesia', 'Barcelona');
INSERT INTO `car_dealership`.`Salesperson` (`ID`, `staffID`, `Name`, `Store`) VALUES ('2', '00003', 'Paul Molive', 'Berlin');
INSERT INTO `car_dealership`.`Salesperson` (`ID`, `staffID`, `Name`, `Store`) VALUES ('3', '00004', 'Gail Forcewind', 'Paris');
INSERT INTO `car_dealership`.`Salesperson` (`ID`, `staffID`, `Name`, `Store`) VALUES ('4', '00005', 'Paige Turner', 'Mimia');
INSERT INTO `car_dealership`.`Salesperson` (`ID`, `staffID`, `Name`, `Store`) VALUES ('5', '00006', 'Bob Frapples', 'Mexico City');
INSERT INTO `car_dealership`.`Salesperson` (`ID`, `staffID`, `Name`, `Store`) VALUES ('6', '00007', 'Walter Melon', 'Amsterdam');
INSERT INTO `car_dealership`.`Salesperson` (`ID`, `staffID`, `Name`, `Store`) VALUES ('7', '00008', 'Shonda Leer', 'São Paulo');

#insertar invoice
INSERT INTO `car_dealership`.`Invoice` (`ID`, `Invoice number`, `Date`, `Car_CarID`, `Salesperson_ID`, `Customer_ID`) VALUES ('0', '852399038', '2018-08-22', '0', '3', '1');
INSERT INTO `car_dealership`.`Invoice` (`ID`, `Invoice number`, `Date`, `Car_CarID`, `Salesperson_ID`, `Customer_ID`) VALUES ('1', '731166526', '2018-12-31', '3', '5', '0');
INSERT INTO `car_dealership`.`Invoice` (`ID`, `Invoice number`, `Date`, `Car_CarID`, `Salesperson_ID`, `Customer_ID`) VALUES ('2', '271135104', '2019-01-22', '2', '7', '2');
