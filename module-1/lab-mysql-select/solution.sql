--- Challenge 1 ---

SELECT authors.au_id AS 'AUTHOR ID',
authors.au_lname AS 'LASTNAME',
authors.au_fname AS 'FIRSTNAME',
titles.title AS 'TITLE',
publishers.pub_name AS 'PUBLISHER'

FROM authors

INNER JOIN titleauthor
ON titleauthor.au_id = authors.au_id

INNER JOIN titles
ON titles.title_id = titleauthor.title_id

INNER JOIN publishers
ON publishers.pub_id = titles.pub_id;

--- Challenge 2 ---

SELECT authors.au_id AS 'AUTHOR ID',
authors.au_lname AS 'LASTNAME',
authors.au_fname AS 'FIRSTNAME',
publishers.pub_name AS 'PUBLISHER',
COUNT(titles.title) AS 'TITLE'


FROM authors

INNER JOIN titleauthor
ON titleauthor.au_id = authors.au_id

INNER JOIN titles
ON titles.title_id = titleauthor.title_id

INNER JOIN publishers
ON publishers.pub_id = titles.pub_id
GROUP BY publishers.pub_id, author.au_id;

---Challenge 3 ---

SELECT authors.au_id AS 'AUTHOR ID',
authors.au_lname AS 'LASTNAME',
authors.au_fname AS 'FIRSTNAME',
SUM(sales.qty) AS 'TOTAL'

FROM authors

INNER JOIN titleauthor
ON titleauthor.au_id = authors.au_id

INNER JOIN titles
ON titles.title_id = titleauthor.title_id

INNER JOIN sales
ON sales.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;

---Challengue 4 ---

SELECT authors.au_id AS 'AUTHOR ID',
authors.au_lname AS 'LASTNAME',
authors.au_fname AS 'FIRSTNAME',
IFNULL(SUM(sales.qty),0) AS 'TOTAL' 

FROM authors

LEFT JOIN titleauthor
ON titleauthor.au_id = authors.au_id

LEFT JOIN titles
ON titles.title_id = titleauthor.title_id

LEFT JOIN sales
ON sales.title_id = titles.title_id
GROUP BY authors.au_id

ORDER BY TOTAL DESC;
