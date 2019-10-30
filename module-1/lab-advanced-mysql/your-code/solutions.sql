CREATE TEMPORARY TABLE table_1
SELECT titles.title_id AS TITLE, titleauthor.au_id AS AUTHOR, 
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS ROYALTY
	FROM titles
	INNER JOIN titleauthor ON titles.title_id = titleauthor.title_id
	INNER JOIN sales ON titleauthor.title_id = sales.title_id;

CREATE TEMPORARY TABLE table_3
SELECT TITLE, AUTHOR, SUM(ROYALTY) as ROY
	FROM table_1
	GROUP BY AUTHOR, TITLE;

SELECT AUTHOR, ROY + (titles.advance * titleauthor.royaltyper / 100) as PROFIT
	FROM table_3
	INNER JOIN titles ON table_3.TITLE = titles.title_id
	INNER JOIN titleauthor ON table_3.AUTHOR = titleauthor.au_id
	ORDER BY PROFIT DESC
	LIMIT 3;
    
CREATE TABLE most_profiting_authors
SELECT AUTHOR, ROY + (titles.advance * titleauthor.royaltyper / 100) as PROFIT
	FROM table_3
	INNER JOIN titles ON table_3.TITLE = titles.title_id
	INNER JOIN titleauthor ON table_3.AUTHOR = titleauthor.au_id
	ORDER BY PROFIT DESC
	LIMIT 3;