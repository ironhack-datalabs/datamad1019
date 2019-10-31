# create a temporary table

create temporary table sales_per_title
 select title_id, sum(qty) as qty
        from sales
        group by 1;
select  ta.au_id as Author_id, 
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


-- Método 2: Tienes que investigar más
-- CREATE TEMPORARY TABLE Base .
--  SELECT 
--      titleauthor.title_id AS "Title_ID",
--      titleauthor.au_id AS "Author_ID",
--      SUM((titles.price * sales.qty * titles.royalty/100 * titleauthor.royaltyper/100)) AS "Sales_Royalty",
--      titles.advance AS "Advance",
--      titleauthor.royaltyper AS "Royal_Typer"
--      FROM titleauthor
--      LEFT JOIN sales ON titleauthor.title_id = sales.title_id
--      LEFT JOIN titles ON sales.title_id = titles.title_id
--         GROUP BY Title_ID, Author_ID;
-- 
-- SELECT 
--  Author_ID,
--     SUM(Sales_Royalty + Advance * Royal_Typer/100) AS "Profit"
--  FROM Base
--     GROUP BY Author_ID;
