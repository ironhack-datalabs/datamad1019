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
group by 1, 2, 3, 4;

# Challenge 3

select 
a.au_id, 
a.au_lname,
a.au_fname, 
total.total
from authors a
left join 
(select ta.au_id, sum(s.qty) as total from sales s
left join titleauthor ta
on s.title_id = ta.title_id
group by 1) total
on a.au_id = total.au_id
order by 4 desc
limit 3;

# Challenge 4

select 
a.au_id, 
a.au_lname,
a.au_fname, 
case 
when total.total is null then 0
else total.total 
end as total
from authors a
left join 
(select ta.au_id, sum(s.qty) as total from sales s
left join titleauthor ta
on s.title_id = ta.title_id
group by 1) total
on a.au_id = total.au_id
order by 4 desc;

# Bonus Challenge

select au_id as 'Author_id', au_lname as 'Last_name', au_fname as 'First_name', sum(profit) as Profit
from
(select 		
			concat(ta.au_id,'_',ta.title_id) as new_id, 
			ta.au_id, 
			ta.title_id,            
			a.au_lname, 
			a.au_fname, 
            ta.royaltyper, 
            t.price,
            t.royalty,
            t.advance, 
            s.qty, 
            ((t.royalty/100 *(t.price*s.qty)) + t.advance)*ta.royaltyper/100 as profit
	from titleauthor ta
	left join authors a
	on ta.au_id = a.au_id
    left join 
		(select title_id, sum(qty) as qty
		from sales
		group by 1
		) s
    on s.title_id = ta.title_id
    left join titles t
    on ta.title_id = t.title_id) foo
    group by 1, 2, 3
    order by 4 desc
    
