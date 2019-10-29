##### CHALLENGE 1

-- SELECT 
-- authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME",
-- titles.title AS "TITLE", publishers.pub_name AS "PUBLISHER" FROM authors
-- JOIN titleauthor AS ta ON authors.au_id=ta.au_id
-- JOIN titles ON ta.title_id=titles.title_id
-- JOIN publishers ON titles.pub_id=publishers.pub_id;

##### CHALLENGE 2

-- SELECT 
-- authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME",
-- publishers.pub_name AS "PUBLISHER", count(*) FROM authors
-- JOIN titleauthor AS ta ON authors.au_id=ta.au_id
-- JOIN titles ON ta.title_id=titles.title_id
-- JOIN publishers ON titles.pub_id=publishers.pub_id
-- GROUP BY publishers.pub_name, authors.au_id;


##### CHALLENGE 3

-- SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME",
-- IFNULL(COUNT(*), 0) FROM authors
-- JOIN titleauthor AS ta ON authors.au_id=ta.au_id
-- GROUP BY authors.au_id
-- ORDER BY COUNT(*) DESC
-- LIMIT 3;

##### CHALLENGE 4

-- SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME",
-- IFNULL(COUNT(*), 0) FROM authors
-- JOIN titleauthor AS ta ON authors.au_id=ta.au_id
-- GROUP BY authors.au_id
-- ORDER BY IFNULL(COUNT(*), 0) DESC;

##### CHALLENGE 5

-- SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME" FROM authors
-- JOIN titleauthor AS ta ON authors.au_id=ta.au_id
-- -- JOIN titles ON authors.advance=titles.advance
-- JOIN titles ON authors.royalty=titles.royalty
-- GROUP BY authors.au_id
-- LIMIT 3;





