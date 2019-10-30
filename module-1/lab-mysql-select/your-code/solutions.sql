SELECT authors.au_id, au_lname, au_fname, titles.title, publishers.pub_name
FROM authors 
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id;