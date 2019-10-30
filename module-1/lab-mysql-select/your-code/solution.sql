
-- ** // MYSQL SELECTION LAB // **

-- **CHALLENGE 1**

SELECT authors.au_id AS AUTOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, titles.title AS TITLE, publishers.pub_name AS PUBLISHER
	FROM authors
    INNER JOIN titleauthor ON titleauthor.au_id = authors.au_id
    INNER JOIN titles ON titles.title_id = titleauthor.title_id
    INNER JOIN publishers ON titles.pub_id = publishers.pub_id
    ORDER BY authors.au_id;

-- **CHALLENGE 2**

SELECT authors.au_id AS AUTOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME,
publishers.pub_name AS PUBLISHER, COUNT(titleauthor.title_id) AS COUNT
	FROM authors
	INNER JOIN titleauthor ON titleauthor.au_id = authors.au_id
	INNER JOIN titles ON titles.title_id = titleauthor.title_id
	INNER JOIN publishers ON titles.pub_id = publishers.pub_id
    GROUP BY publishers.pub_name, authors.au_id;

-- **CHALLENGE 2: CHECKING SUM**

SELECT SUM(COUNTING) FROM (
	SELECT authors.au_id AS AUTOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME,
	publishers.pub_name AS PUBLISHER, COUNT(titleauthor.title_id) AS COUNTING
	FROM authors
	INNER JOIN titleauthor ON titleauthor.au_id = authors.au_id
	INNER JOIN titles ON titles.title_id = titleauthor.title_id
	INNER JOIN publishers ON titles.pub_id = publishers.pub_id
    GROUP BY publishers.pub_name, authors.au_id
) SUMMING;

-- **CHALLENGE 3**

SELECT authors.au_id AS AUTOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, 
SUM(sales.qty) AS TOTAL
	FROM authors
	INNER JOIN titleauthor ON titleauthor.au_id = authors.au_id
    INNER JOIN sales ON titleauthor.title_id = sales.title_id
    GROUP BY authors.au_id
    ORDER BY SUM(sales.qty) DESC
    LIMIT 3;

-- **CHALLENGE 4**

SELECT authors.au_id AS AUTOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, 
IFNULL(SUM(sales.qty), 0) AS TOTAL
	FROM authors
	LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
    LEFT JOIN sales ON titleauthor.title_id = sales.title_id
    GROUP BY authors.au_id
    ORDER BY TOTAL DESC;

-- **BONUS - NO FUNCIONA, NO EJECUTAR**
-- SELECT authors.au_id AS AUTHOR_ID, authors.au_fname AS FIRST_NAME, authors.au_lname AS LAST_NAME, 
-- titles.advance * roysched.royalty/100 + (titles.royalty/100 * titles.ytd_sales * roysched.royalty/100) AS PROFIT
-- 	FROM authors
--     INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
--     INNER JOIN titles ON titleauthor.title_id = titles.title_id
--     INNER JOIN roysched ON titles.title_id = roysched.title_id
--     GROUP BY AUTHOR_ID, FIRST_NAME, LAST_NAME
--     ORDER BY PROFIT DESC;