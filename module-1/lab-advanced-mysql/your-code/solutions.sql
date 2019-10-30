-- Challenge 1 - Most Profiting Authors

-- Step one: Calculate the royalties of each sales for each author
select 	ta.au_id as Author_id, 
		ta.title_id as Title_id, 
		(t.royalty/100 *(t.price*s.qty))*ta.royaltyper/100 as profit
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
	on ta.title_id = t.title_id;

-- Step 2: Aggregate the total royalties for each title for each author
select 	ta.au_id as Author_id, 
		ta.title_id as Title_id, 
		sum((t.royalty/100 *(t.price*s.qty))*ta.royaltyper/100) as profit
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
group by 1, 2
order by profit  desc;

-- Step 3: Calculate the total profits of each author
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


-- Challenge 2 - Alternative Solution
create temporary table sales_per_title
 select title_id, sum(qty) as qty
		from sales
		group by 1;
        
        
select 	ta.au_id as Author_id, 
		sum(((t.royalty/100 *(t.price*s.qty)) + t.advance)*ta.royaltyper/100) as profit
from titleauthor ta
left join authors a
	on ta.au_id = a.au_id
left join sales_per_title s
	on s.title_id = ta.title_id
left join titles t
	on ta.title_id = t.title_id
group by 1
order by profit  desc;


-- Challenge 3
create table most_profiting_authors 
(Author_id varchar(45),
profit varchar(45));

insert into most_profiting_authors(
select 	ta.au_id as Author_id, 
		sum(((t.royalty/100 *(t.price*s.qty)) + t.advance)*ta.royaltyper/100) as profit
from titleauthor ta
left join authors a
	on ta.au_id = a.au_id
left join sales_per_title s
	on s.title_id = ta.title_id
left join titles t
	on ta.title_id = t.title_id
group by 1
order by profit  desc);



