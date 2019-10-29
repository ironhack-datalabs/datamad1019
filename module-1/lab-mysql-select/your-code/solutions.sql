# Challenge 1

select 
	f.au_id as 'Author_id', 
    f.au_lname as 'Last_name', 
    f.au_fname as 'First_name', 
    t.title as 'Title', 
    pub_name as 'Publisher'
from titles t 
left join 
	(select ta.au_id, 
			a.au_lname, 
			a.au_fname,
			ta.title_id
	from titleauthor ta
	left join authors a
	on ta.au_id = a.au_id) f
on t.title_id = f.title_id
left join publishers p
on t.pub_id = p.pub_id;	

# Challenge 2

select 
Author_id,
Last_name,
First_name, 
Publisher, 
count(*) as 'Title_count'
from 
(select 
	f.au_id as 'Author_id', 
    f.au_lname as 'Last_name', 
    f.au_fname as 'First_name', 
    t.title as 'Title', 
    pub_name as 'Publisher'
from titles t 
left join 
	(select ta.au_id, 
			a.au_lname, 
			a.au_fname,
			ta.title_id
	from titleauthor ta
	left join authors a
	on ta.au_id = a.au_id) f
on t.title_id = f.title_id
left join publishers p
on t.pub_id = p.pub_id) foo
group by 1, 2, 3, 4

# Challenge 3
