use lab_mysql;

INSERT INTO cars (vin, manufacturer,model,year,color)
	values ('3K096I98581DHSNUP','Volkswagen','Tiguan',2019,'Blue');

INSERT INTO cars (vin, manufacturer,model,year,color)
	values ('ZM8G7BEUQZ97IH46V','Peugeot','Rifter',2019,'Red');
    
INSERT INTO cars (vin, manufacturer,model,year,color)
	values ('RKXVNNIHLVVZOUB4M','Ford','Fusion',2018,'White');
    
INSERT INTO cars (vin, manufacturer,model,year,color)
	values ('HKNDGS7CU31E9Z7JW','Toyota','RAV4',2018,'Silver');
    
INSERT INTO cars (vin, manufacturer,model,year,color)
	values ('DAM41UDN3CHU2WVF6','Volvo','V60',2019,'Gray');
    
INSERT INTO cars (vin, manufacturer,model,year,color)
	values ('3K096I98581DHSNUP','Volvo','V60 Cross Country',2019,'Gray');




INSERT INTO customers (customer_id, name,phone,email,address,city,state_province,country,postal)
	values (10001,'Pablo Picasso','+34 636 17 63 82','-','Paseo de la Chopera, 14','Madrid','Madrid','Spain','28045');


INSERT INTO customers (customer_id, name,phone,email,address,city,state_province,country,postal)
	values (20001,'Abraham Lincoln','+1 305 907 7086','-','120 SW 8th St','Miami','Florida','United States','33130'),
           (30001,'Napoléon Bonaparte','+33 1 79 75 40 00','-','40 Rue du Colisée','Paris','Île-de-France','France','75008');




INSERT INTO salespersons(Staff_ID, Name, Store) 
VALUES 
  (1, 'Petey Cruiser', 'Madrid');

INSERT INTO salespersons(Staff_ID, Name, Store) 
VALUES 
  (2, 'Anna Sthesia', 'Barcelona');

INSERT INTO salespersons(Staff_ID, Name, Store) 
VALUES 
  (3, 'Paul Molive', 'Berlin');

INSERT INTO salespersons(Staff_ID, Name, Store) 
VALUES 
  (4, 'Gail Forcewind', 'Paris');

INSERT INTO salespersons(Staff_ID, Name, Store) 
VALUES 
  (5, 'Paige Turner', 'Mimia');

INSERT INTO salespersons(Staff_ID, Name, Store) 
VALUES 
  (6, 'Bob Frapples', 'Mexico City');

INSERT INTO salespersons(Staff_ID, Name, Store) 
VALUES 
  (7, 'Walter Melon', 'Amsterdam');

INSERT INTO salespersons(Staff_ID, Name, Store) 
VALUES 
  (8, 'Shonda Leer', 'São Paulo');


INSERT INTO invoices(
  invoicescol,date, car, customer, 
  salesperson
) 
VALUES 
  ('852399038','2018-08-22', 1, 2, 4);

INSERT INTO invoices(
  invoicescol,date, car, customer, 
  salesperson
) 
VALUES 
  ('731166526','2018-12-31', 4, 1, 6);
  
INSERT INTO invoices(
  invoicescol,date, car, customer, 
  salesperson
) 
VALUES 
  ('852399038','2019-01-22', 3, 3, 8);


    

