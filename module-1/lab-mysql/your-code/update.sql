use lab_mysql;

update salespersons 
set
	store = 'Miami'
where
	id = 5;

update customers 
set
	email = 'ppicasso@gmail.com'
where
	id = 1;
    
update customers 
set
	email = 'lincoln@us.gov'
where
	id = 2;
    
update customers 
set
	email = 'hello@napoleon.me'
where
	id = 3;
    
