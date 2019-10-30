# Challenge 1

SELECT 
	authors.au_id AS "Author ID", authors.au_lname AS "Last Name", authors.au_fname AS "First Name", titles.title AS "Title", publishers.pub_name AS "Publisher"

FROM authors 

LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id 
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id


# Challenge 2

SELECT 
	authors.au_id AS "Author ID", authors.au_lname AS "Last Name", authors.au_fname AS "First Name", publishers.pub_name AS "Publisher", COUNT(titles.title) AS "Title Count"

FROM authors 

LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id 
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id

GROUP BY publishers.pub_name, authors.au_id;

#Challenge 3

SELECT 
	authors.au_id AS "Author ID", authors.au_lname AS "Last Name", authors.au_fname AS "First Name", SUM(sales.qty) AS "Total"

FROM authors 

LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id 
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN sales ON titles.title_id = sales.title_id


GROUP BY authors.au_id
ORDER BY  Total DESC LIMIT 3

$ Challenge 4

SELECT 
	authors.au_id AS "Author ID", authors.au_lname AS "Last Name", authors.au_fname AS "First Name", IFNULL(SUM(sales.qty), 0) AS "Total"

FROM authors 

LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id 
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN sales ON titles.title_id = sales.title_id


GROUP BY authors.au_id
ORDER BY  Total DESC LIMIT 23
