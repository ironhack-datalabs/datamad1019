UPDATE Salespersons
SET Store = 'Miami'
WHERE idSalespersons = 4;

SELECT * FROM Salespersons;


UPDATE Customers
SET Email = 'ppicasso@gmail.com'
WHERE id = 0;

UPDATE Customers
SET Email = 'lincoln@us.gov'
WHERE id = 1;

UPDATE Customers
SET Email = 'hello@napoleon.me'
WHERE id = 2;


SELECT * FROM Customers;