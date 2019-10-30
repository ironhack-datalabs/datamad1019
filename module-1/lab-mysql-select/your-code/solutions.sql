SELECT authors.au_id AS 'Author ID', authors.au_lname AS 'Last Name',
authors.au_fname AS 'First Name', titles.title AS 'Title',
publishers.pub_name as 'Publisher'
FROM authors
INNER JOIN titleauthor
ON authors.au_id=titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id=titles.title_id
INNER JOIN publishers
ON publishers.pub_id=titles.pub_id;


SELECT authors.au_id AS 'Author ID', authors.au_lname AS 'Last Name',
authors.au_fname AS 'First Name',
publishers.pub_name as 'Publisher', count(*) AS 'Title Count'
FROM authors
INNER JOIN titleauthor
ON authors.au_id=titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id=titles.title_id
INNER JOIN publishers
ON publishers.pub_id=titles.pub_id
GROUP BY authors.au_id, publishers.pub_name;


SELECT authors.au_id AS 'Author ID', authors.au_lname AS 'Last Name',
authors.au_fname AS 'First Name',
sum(sales.qty) AS 'Total'
FROM authors
INNER JOIN titleauthor
ON authors.au_id=titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id=titles.title_id
INNER JOIN sales
ON sales.title_id=titles.title_id
GROUP BY authors.au_id
ORDER BY sum(sales.qty) DESC
LIMIT 3;


SELECT authors.au_id AS 'Author ID', authors.au_lname AS 'Last Name',
authors.au_fname AS 'First Name',
ifnull(sum(sales.qty),0) AS 'Total'
FROM authors
LEFT JOIN titleauthor
ON authors.au_id=titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id=titles.title_id
LEFT JOIN sales
ON sales.title_id=titles.title_id
GROUP BY authors.au_id
ORDER BY sum(sales.qty) DESC;


SELECT authors.au_id AS 'Author ID', authors.au_lname AS 'Last Name',
authors.au_fname AS 'First Name',
((titleauthor.royaltyper * titles.price * titles.royalty * sales.qty) + (titleauthor.royaltyper * titles.advance)) AS 'Profit'
FROM authors
INNER JOIN titleauthor
ON titleauthor.au_id = authors.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN roysched
ON titles.title_id = roysched.title_id
INNER JOIN sales
ON titles.title_id = sales.title_id
GROUP BY authors.au_id, ((titleauthor.royaltyper * titles.price * titles.royalty * sales.qty) + (titleauthor.royaltyper * titles.advance))
ORDER BY 'Profit'
LIMIT 3;
