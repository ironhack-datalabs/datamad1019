# Challenge 1: Who Have Published What At Where?

select 	a.au_id as Author_id, 
		a.au_lname as Last_name, 
		a.au_fname as First_name, 
		t.title as Title, 
		p.pub_name as Publisher
from titleauthor ta
join titles t 
	on ta.title_id = t.title_id
left join authors a
	on ta.au_id = a.au_id
left join publishers p
	on t.pub_id = p.pub_id;

# Challenge 2: Who Have Published How Many At Where?

select 	a.au_id as Author_id, 
		a.au_lname as Last_name, 
		a.au_fname as First_name, 
		p.pub_name as Publisher,
        count(t.title) as Title
from titleauthor ta
join titles t 
	on ta.title_id = t.title_id
left join authors a
	on ta.au_id = a.au_id
left join publishers p
	on t.pub_id = p.pub_id
group by 1, 2, 3, 4;

# Challenge 3: Best Selling Authors

        
select 	a.au_id as Author_id, 
		a.au_lname as Last_name,
		a.au_fname as First_name, 
		ifnull(sum(s.qty), 0) as Total
from titleauthor ta
left join sales s
	on ta.title_id = s.title_id
left join authors a
	on a.au_id = ta.au_id
left join titles t
	on t.title_id = ta.title_id
group by 1, 2, 3
order by 4 desc
limit 3;

# Challenge 4: Best Selling Authors Ranking
        
select 	a.au_id as Author_id, 
		a.au_lname as Last_name,
		a.au_fname as First_name, 
		ifnull(sum(s.qty), 0) as Total
from titleauthor ta
left join sales s
	on ta.title_id = s.title_id
left join authors a
	on a.au_id = ta.au_id
left join titles t
	on t.title_id = ta.title_id
group by 1, 2, 3
order by 4 desc;

# Bonus Challenge: Most Profiting Authors
select 	ta.au_id as Author_id, 
		a.au_lname as Last_name, 
		a.au_fname as First_name, 
		sum(((t.royalty/100 *(t.price*s.qty)) + t.advance)*ta.royaltyper/100) as profit
from titleauthor ta
left join authors a
	on ta.au_id = a.au_id
left join 
		(
        select title_id, sum(qty) as qty
		from sales
		group by 1
		) s
	on s.title_id = ta.title_id
left join titles t
	on ta.title_id = t.title_id
group by 1, 2, 3
order by profit  desc;