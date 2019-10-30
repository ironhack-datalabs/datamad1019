--Challenge 1
--Step1
SELECT authors.au_id AS 'AUTHOR ID', titles.title_id AS 'TITLE ID',
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as 'ROYALTY'
FROM authors
INNER JOIN titleauthor ON titleauthor.au_id=authors.au_id
INNER JOIN titles ON titles.title_id=titleauthor.title_id
INNER JOIN sales ON sales.title_id=titleauthor.title_id;
--Step2
SELECT * FROM (
SELECT authors.au_id AS 'AUTHOR ID', titles.title_id AS 'TITLE ID',
SUM(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as 'ROYALTY'
FROM authors
INNER JOIN titleauthor ON titleauthor.au_id=authors.au_id
INNER JOIN titles ON titles.title_id=titleauthor.title_id
INNER JOIN sales ON sales.title_id=titleauthor.title_id
GROUP BY authors.au_id, titles.title_id
) AS x ;
--Step3
SELECT * FROM (
SELECT authors.au_id AS 'AUTHOR ID',
SUM((titles.advance * titleauthor.royaltyper / 100) + (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100)) as 'PROFIT'
FROM authors
INNER JOIN titleauthor ON titleauthor.au_id=authors.au_id
INNER JOIN titles ON titles.title_id=titleauthor.title_id
INNER JOIN sales ON sales.title_id=titleauthor.title_id
GROUP BY authors.au_id, titles.title_id
ORDER BY PROFIT DESC
LIMIT 3
) AS x;

--Challenge 2
CREATE TEMPORARY TABLE temporal(
SELECT authors.au_id AS 'AUTHOR ID',
SUM((titles.advance * titleauthor.royaltyper / 100) + (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100)) as 'PROFIT'
FROM authors
INNER JOIN titleauthor ON titleauthor.au_id=authors.au_id
INNER JOIN titles ON titles.title_id=titleauthor.title_id
INNER JOIN sales ON sales.title_id=titleauthor.title_id
GROUP BY authors.au_id
ORDER BY PROFIT DESC
LIMIT 3
);

--Challenge 3
CREATE TABLE x(
SELECT authors.au_id AS 'AUTHOR ID',
SUM((titles.advance * titleauthor.royaltyper / 100) + (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100)) as 'PROFIT'
FROM authors
INNER JOIN titleauthor ON titleauthor.au_id=authors.au_id
INNER JOIN titles ON titles.title_id=titleauthor.title_id
INNER JOIN sales ON sales.title_id=titleauthor.title_id
GROUP BY authors.au_id
ORDER BY PROFIT DESC
LIMIT 3
);
