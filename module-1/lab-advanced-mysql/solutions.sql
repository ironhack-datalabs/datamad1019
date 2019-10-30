#CHALLENGE 1

SELECT 
au.au_id, t.title_id, 
SUM((t.royalty/100)*sa.qty*t.price*(ta.royaltyper/100)) AS sales_royalty
FROM titleauthor AS ta
INNER JOIN authors AS au ON ta.au_id=au.au_id
INNER JOIN titles AS t ON t.title_id=ta.title_id
INNER JOIN sales AS sa ON t.title_id=sa.title_id
GROUP BY au.au_id, t.title_id
ORDER BY sales_royalty DESC

SELECT 
au.au_id, t.title_id, 
SUM((t.advance*(ta.royaltyper/100)) + (t.royalty/100)*sa.qty*t.price*(ta.royaltyper/100)) AS PROFIT
FROM titleauthor AS ta
INNER JOIN authors AS au ON ta.au_id=au.au_id
INNER JOIN titles AS t ON t.title_id=ta.title_id
INNER JOIN sales AS sa ON t.title_id=sa.title_id
GROUP BY au.au_id, t.title_id
ORDER BY PROFIT DESC
LIMIT 3;

# CHALLENGE 2

CREATE TEMPORARY TABLE temporal(
SELECT 
au.au_id, t.title_id, 
SUM((t.advance*(ta.royaltyper/100)) + (t.royalty/100)*sa.qty*t.price*(ta.royaltyper/100)) AS PROFIT
FROM titleauthor AS ta
INNER JOIN authors AS au ON ta.au_id=au.au_id
INNER JOIN titles AS t ON t.title_id=ta.title_id
INNER JOIN sales AS sa ON t.title_id=sa.title_id
GROUP BY au.au_id, t.title_id
ORDER BY PROFIT DESC
LIMIT 3);


#CHALLENGE 3

CREATE TABLE permanente(
SELECT 
au.au_id, t.title_id, 
SUM((t.advance*(ta.royaltyper/100)) + (t.royalty/100)*sa.qty*t.price*(ta.royaltyper/100)) AS PROFIT
FROM titleauthor AS ta
INNER JOIN authors AS au ON ta.au_id=au.au_id
INNER JOIN titles AS t ON t.title_id=ta.title_id
INNER JOIN sales AS sa ON t.title_id=sa.title_id
GROUP BY au.au_id, t.title_id
ORDER BY PROFIT DESC
LIMIT 3);