#STEP 1

create temporary table royalt_sales_author
select ta.title_id, ta.au_id, (t.price*s.qty*t.royalty/100 * ta.royaltyper/100) as royalty_sales
from titleauthor ta
left join titles t
on ta.title_id = t.title_id
left join sales s
on t.title_id = s.title_id;

#STEP 2

create temporary table roy_tit_au
select title_id, au_id, sum(royalty_sales) as royalty_sales 
from royalt_sales_author
group by title_id, au_id;

#STEP 3