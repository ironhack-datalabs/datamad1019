##### CHALLENGE 1

SELECT 
authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME",
titles.title AS "TITLE", publishers.pub_name AS "PUBLISHER" FROM authors
LEFT JOIN titleauthor AS ta ON authors.au_id=ta.au_id
LEFT JOIN titles ON ta.title_id=titles.title_id
LEFT JOIN publishers ON titles.pub_id=publishers.pub_id;

##### CHALLENGE 2

SELECT 
authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME",
publishers.pub_name AS "PUBLISHER", count(*) FROM authors
LEFT JOIN titleauthor AS ta ON authors.au_id=ta.au_id
LEFT JOIN titles ON ta.title_id=titles.title_id
LEFT JOIN publishers ON titles.pub_id=publishers.pub_id
GROUP BY publishers.pub_name, authors.au_id;


##### CHALLENGE 3

SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME",
SUM(sales.qty) FROM authors
LEFT JOIN titleauthor AS ta ON authors.au_id=ta.au_id
LEFT JOIN sales ON ta.title_id=sales.title_id
GROUP BY authors.au_id
ORDER BY COUNT(*) DESC
LIMIT 3;

##### CHALLENGE 4

SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME",
SUM(sales.qty) AS TOP3 FROM authors
LEFT JOIN titleauthor AS ta ON authors.au_id=ta.au_id
LEFT JOIN sales ON ta.title_id=sales.title_id
GROUP BY authors.au_id
ORDER BY COUNT(*) DESC

###### BONUS

SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME",
authors.au_fname AS "FIRST NAME", SUM(titles.advance+titles.royalty) AS PROFIT FROM authors
LEFT JOIN titleauthor AS ta ON authors.au_id=ta.au_id
LEFT JOIN titles ON ta.title_id=titles.title_id
GROUP BY authors.au_id
ORDER BY COUNT(*) DESC
LIMIT 3;





