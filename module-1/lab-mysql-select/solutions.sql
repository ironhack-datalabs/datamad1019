# CHALLENGE 1

SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME",
titles.title AS "TITLE", publishers.pub_name AS "PUBLISHER" 
FROM publications.authors
RIGHT JOIN titleauthor 	ON  authors.au_id=titleauthor.au_id 
LEFT JOIN titles  ON titleauthor.title_id=titles.title_id
LEFT JOIN publishers ON titles.pub_id=publishers.pub_id;

# CHALLENGE 2
SELECT authors.au_id AS "AUTHOR ID", 
authors.au_lname AS "LAST NAME", 
authors.au_fname AS "FIRST NAME",

count(*) AS "TITLE COUNT"
FROM authors
inner JOIN titleauthor 	ON  authors.au_id=titleauthor.au_id 
LEFT JOIN titles  ON titleauthor.title_id=titles.title_id
JOIN publishers ON titles.pub_id=publishers.pub_id
GROUP BY authors.au_id,  publishers.pub_name
ORDER BY count(titles.title) DESC
;

# CHALLENGE 3
SELECT authors.au_id AS "AUTHOR ID", 
authors.au_lname AS "LAST NAME", 
authors.au_fname AS "FIRST NAME",

SUM(sales.qty) AS "TOTAL"
FROM authors
inner JOIN titleauthor 	ON  authors.au_id=titleauthor.au_id 
LEFT JOIN titles  ON titleauthor.title_id=titles.title_id
JOIN publishers ON titles.pub_id=publishers.pub_id
LEFT JOIN sales ON titleauthor.title_id=sales.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY SUM(sales.qty) DESC
LIMIT 3 ; 



