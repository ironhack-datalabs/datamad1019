SELECT * FROM mydb.customers;

#Customers:
INSERT INTO
        `mydb`.`customers` (`ID`, `Customer ID`, `name`, `Phone number`, `email`, `Adress`, `City`, `State/Province`, `Country`, `Postal`)
    VALUES 
    ('0', '10001', 'Pablo Picasso', '+34 636 17 63 82', '-', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', '28045'),
    ('1', '20001', 'Abraham Lincoln', '+1 305 907 7086', '-', '120 SW 8th St', 'Miami', 'Florida', 'United States', '33130'),
    ('2', '30001', 'Napoléon Bonaparte', '+33 1 79 75 40 00', '-', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', '75008');
