use lab_mysql;

# en mi caso el duplicado es otro porque he metido el último Volvo con el mismo VIN que el VW. Lo corrijo:

update cars
set
	vin = 'DAM41UDN3CHU2WVF6'
where
	id = 6;

delete from cars
where id = 6;



