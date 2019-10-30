# Challenge 1
SELECT 
au.au_id as 'AUTHOR ID',
au.au_lname as 'LAST NAME', 
au.au_fname as 'FIRST NAME', 
ti.title as 'TITLE',
pu.pub_name as 'PUBLISHER'
FROM authors au
INNER JOIN titleauthor ta on ta.au_id = au.au_id 
LEFT JOIN titles ti on ti.title_id = ta.title_id 
LEFT JOIN publishers pu on pu.pub_id = ti.pub_id;

# Challenge 2
SELECT 
au.au_id as 'AUTHOR ID',
au.au_lname as 'LAST NAME', 
au.au_fname as 'FIRST NAME', 
pu.pub_name as 'PUBLISHER',
COUNT(*) as 'TITLE COUNT'
FROM authors au
INNER JOIN titleauthor ta on ta.au_id = au.au_id 
LEFT JOIN titles ti on ti.title_id = ta.title_id 
LEFT JOIN publishers pu on pu.pub_id = ti.pub_id
GROUP BY au.au_id, pu.pub_name;

# Challenge 3
SELECT au.au_id, au.au_lname, au.au_fname, SUM(s.qty) as sales
from authors au
LEFT JOIN titleauthor ti ON au.au_id = ti.au_id
LEFT JOIN sales s ON ti.title_id = s.title_id
GROUP BY au.au_id
order by sales DESC
LIMIT 3;

# Challenge 4
SELECT au.au_id, au.au_lname, au.au_fname, sum(ti.advance)+((ti.price*ti.royalty/100)*ti.ytd_sales) AS profit
from authors au
INNER JOIN titleauthor t ON au.au_id = t.au_id
LEFT JOIN titles ti ON t.title_id = ti.title_id
LEFT JOIN sales s ON t.title_id = s.title_id
GROUP BY au.au_id, au.au_lname, au.au_fname, ti.title_id, ti.price, ti.royalty, ti.ytd_sales
order by profit DESC;

#Bonus
SELECT au.au_id, au.au_lname, au.au_fname, sum(ti.advance)+((ti.price*ti.royalty/100)*ti.ytd_sales) AS profit
from authors au
INNER JOIN titleauthor t ON au.au_id = t.au_id
INNER JOIN titles ti ON t.title_id = ti.title_id
INNER JOIN sales s ON t.title_id = s.title_id
GROUP BY au.au_id, ti.price, ti.royalty, ti.ytd_sales
order by profit DESC;