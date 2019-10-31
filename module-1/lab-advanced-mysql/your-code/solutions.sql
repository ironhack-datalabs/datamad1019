# Challenge 1
#Step 1

SELECT titles.title_id AS ID_Titulos, authors.au_id as ID_Autores, (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS sales_royalty
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON  titles.title_id = titleauthor.title_id
INNER JOIN sales ON sales.title_id = titles.title_id

#Step 2

SELECT ID_Titulos,  ID_Autores, sum(sales_royalty)
FROM (
SELECT titles.title_id AS ID_Titulos, authors.au_id as ID_Autores, (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS sales_royalty
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON  titles.title_id = titleauthor.title_id
INNER JOIN sales ON sales.title_id = titles.title_id) SUMMARY
GROUP BY ID_Titulos, ID_Autores

#Step 3

SELECT ID_AUTORES,  Sales_total
FROM
(SELECT ID_Titulos,  ID_Autores, sum(sales_royalty) AS Sales_total
FROM (
SELECT titles.title_id AS ID_Titulos, authors.au_id as ID_Autores, (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS sales_royalty
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON  titles.title_id = titleauthor.title_id
INNER JOIN sales ON sales.title_id = titles.title_id) SUMMARY
GROUP BY ID_Titulos, ID_Autores) X
ORDER BY Sales_total DESC
LIMIT 3

#Challenge 2

#Step 1

CREATE TEMPORARY TABLE tabla_1
SELECT titles.title_id AS ID_Titulos, authors.au_id as ID_Autores, (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS sales_royalty
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON  titles.title_id = titleauthor.title_id
INNER JOIN sales ON sales.title_id = titles.title_id

#Step 2

CREATE TEMPORARY TABLE tabla_2
SELECT ID_Titulos,  ID_Autores, sum(sales_royalty) as Sales_total
GROUP BY ID_Titulos, ID_Autores

#Step 3

SELECT ID_AUTORES, Sales_total
FROM tabla_2
ORDER BY Sales_total DESC
LIMIT 3

#Challenge 3

CREATE TABLE most_profiting_authors
SELECT ID_AUTORES,  Sales_total
FROM
(SELECT ID_Titulos,  ID_Autores, sum(sales_royalty) AS Sales_total
FROM (
SELECT titles.title_id AS ID_Titulos, authors.au_id as ID_Autores, (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS sales_royalty
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON  titles.title_id = titleauthor.title_id
INNER JOIN sales ON sales.title_id = titles.title_id) SUMMARY
GROUP BY ID_Titulos, ID_Autores) X
ORDER BY Sales_total DESC
LIMIT 3