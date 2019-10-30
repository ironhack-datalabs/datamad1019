SELECT authors.au_id AS 'Author ID', authors.au_lname AS 'Last Name',
authors.au_fname AS 'First Name', titles.title AS 'Title',
publishers.pub_name as 'Publisher'
FROM authors
INNER JOIN titleauthor
ON authors.au_id=titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id=titles.title_id
LEFT JOIN publishers
ON publishers.pub_id=titles.pub_id;