#CHALLENGE 1

DROP TABLE IF EXISTS Sales_royalty;
DROP TABLE IF EXISTS Total_royalties;

CREATE TEMPORARY TABLE IF NOT EXISTS Sales_royalty
SELECT authors.au_id, t.title_id, 
t.advance * ta.royaltyper / 100 as advance,
t.price * sales.qty * t.royalty / 100 * ta.royaltyper / 100 as sales_royalty
FROM authors
INNER JOIN titleauthor ta ON authors.au_id = ta.au_id
INNER JOIN titles t ON ta.title_id = t.title_id
RIGHT JOIN sales ON sales.title_id = t.title_id;

CREATE TEMPORARY TABLE IF NOT EXISTS Total_royalties
SELECT au_id, title_id, advance,
sum(sales_royalty) as total_royalties
FROM Sales_royalty
GROUP BY  au_id, title_id, advance;

SELECT au_id AS 'Author ID',
advance  + total_royalties as Profits
FROM Total_royalties
ORDER BY Profits DESC LIMIT 3;

#SECOND SOLUTION ALTERNATIVE SOLUTION

SELECT au_id AS 'Author ID',
advance + sum(sales_royalty) as Profits
FROM (SELECT authors.au_id,
t.title_id,
t.price * sales.qty * t.royalty / 100 * ta.royaltyper / 100 as sales_royalty,
t.advance * ta.royaltyper / 100 as advance
FROM authors
INNER JOIN titleauthor ta ON authors.au_id = ta.au_id
INNER JOIN titles t ON ta.title_id = t.title_id
INNER JOIN sales ON sales.title_id = t.title_id)
AS royalties
GROUP BY  au_id, title_id, advance
ORDER BY Profits DESC LIMIT 3;
#FINAL SOLUTIOM
CREATE TEMPORARY TABLE IF NOT EXISTS most_profiting_authors
SELECT au_id,
advance + sum(sales_royalty) as profits
FROM (SELECT authors.au_id,
t.title_id,
t.price * sales.qty * t.royalty / 100 * ta.royaltyper / 100 as sales_royalty,
t.advance * ta.royaltyper / 100 as advance
FROM authors
INNER JOIN titleauthor ta ON authors.au_id = ta.au_id
INNER JOIN titles t ON ta.title_id = t.title_id
INNER JOIN sales ON sales.title_id = t.title_id)
AS royalties
GROUP BY  au_id, title_id, advance
ORDER BY Profits DESC LIMIT 3;