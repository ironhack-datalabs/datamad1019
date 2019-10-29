-- al poner autoincrement, no necesito especificar la Primary Key, pero mis Primary Key empiezan por 1 y no por 0.
UPDATE `cars`.`salesperson` SET `Store`='Miami' WHERE `ID`='5';

UPDATE `cars`.`costumers` SET `Email`='ppicasso@gmail.com' WHERE `ID`='1';
UPDATE `cars`.`costumers` SET `Email`='lincoln@us.gov' WHERE `ID`='2';
UPDATE `cars`.`costumers` SET `Email`='hello@napoleon.me\n' WHERE `ID`='3';
