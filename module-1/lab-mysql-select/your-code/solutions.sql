--Challenge 1
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', titles.title AS 'TITLE', publishers.pub_name AS 'PUBLISHER'  
FROM authors
INNER JOIN titleauthor ON titleauthor.au_id=authors.au_id
INNER JOIN titles ON titles.title_id=titleauthor.title_id
INNER JOIN publishers ON publishers.pub_id=titles.pub_id;

-- Challenge 2
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', publishers.pub_name AS 'PUBLISHER', COUNT(titles.title) AS 'TITLE COUNT'  
FROM authors
INNER JOIN titleauthor ON titleauthor.au_id=authors.au_id
INNER JOIN titles ON titles.title_id=titleauthor.title_id
INNER JOIN publishers ON publishers.pub_id=titles.pub_id
GROUP BY publishers.pub_id, authors.au_id;

--Challenge 3
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', SUM(sales.qty) AS 'TOTAL'  
FROM authors
INNER JOIN titleauthor ON titleauthor.au_id=authors.au_id
INNER JOIN titles ON titles.title_id=titleauthor.title_id
INNER JOIN sales ON sales.title_id=titles.title_id
GROUP BY authors.au_id
ORDER BY SUM(sales.qty) DESC
LIMIT 3;

-- Challenge 4
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', IFNULL(SUM(sales.qty),0) AS 'TOTAL'  
FROM authors
LEFT JOIN titleauthor ON titleauthor.au_id=authors.au_id
LEFT JOIN titles ON titles.title_id=titleauthor.title_id
LEFT JOIN sales ON sales.title_id=titles.title_id
GROUP BY authors.au_id
ORDER BY SUM(sales.qty) DESC;

-- Bonus Challenge
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', 
SUM((titles.advance * (titleauthor.royaltyper/100)) + ((titleauthor.royaltyper/100) * titles.price * sales.qty)*titles.royalty) AS 'PROFIT'  
FROM authors
INNER JOIN titleauthor ON titleauthor.au_id=authors.au_id
INNER JOIN titles ON titles.title_id=titleauthor.title_id
INNER JOIN sales ON sales.title_id=titles.title_id
GROUP BY authors.au_id
ORDER BY SUM((titles.advance * (titleauthor.royaltyper/100)) + ((titleauthor.royaltyper/100) * titles.price * sales.qty)*titles.royalty) DESC
LIMIT 3;
