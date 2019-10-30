
#Challenge 1
SELECT 
    authors.au_id AS AUTHOR_ID, 
    authors.au_lname AS LAST_NAME, 
    authors.au_fname AS FIRST_NAME,
    titles.title AS TITLE, 
    publishers.pub_name AS PUBLISHER
FROM authors
    INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
    INNER JOIN titles ON titleauthor.title_id= titles.title_id
    INNER JOIN publishers ON titles.pub_id=publishers.pub_id

#Challenge 2
SELECT 
    authors.au_id AS AUTHOR_ID, 
    authors.au_lname AS LAST_NAME, 
    authors.au_fname AS FIRST_NAME,
    publishers.pub_name AS PUBLISHER,
    count(titles.title_id) AS title_count
FROM authors
    INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
    INNER JOIN titles ON titleauthor.title_id= titles.title_id
    INNER JOIN publishers ON titles.pub_id=publishers.pub_id
        GROUP BY authors.au_id, publishers.pub_name

#Challenge 3
SELECT 
    authors.au_id AS AUTHOR_ID, 
    authors.au_lname AS LAST_NAME, 
    authors.au_fname AS FIRST_NAME,
    count(sales.qty) AS TOTAL 
FROM authors
    INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
    INNER JOIN sales ON titleauthor.title_id= sales.title_id
GROUP BY authors.au_id
ORDER BY COUNT(sales.qty) DESC
LIMIT 3;

#Challenge 4
SELECT 
    authors.au_id AS AUTHOR_ID, 
    authors.au_lname AS LAST_NAME, 
    authors.au_fname AS FIRST_NAME,
    IFNULL(SUM(sales.qty),0) AS TOTAL 
FROM authors
    LEFT JOIN titleauthor ON authors.au_id=titleauthor.au_id
    LEFT JOIN sales ON titleauthor.title_id= sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC

#Bonus
SELECT 
    authors.au_id AS AUTHOR_ID, 
    authors.au_lname AS LAST_NAME, 
    authors.au_fname AS FIRST_NAME,
    #(titles.ytd_sales+advance)*titleauthor.royaltypern if written by more than one person 
    # titles.ytd_sales+advance if book written by one person
FROM authors
    INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
    INNER JOIN titles ON titleauthor.title_id= titles.title_id
GROUP BY authors.au_id
