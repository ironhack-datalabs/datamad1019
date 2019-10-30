SELECT authors.au_id,authors.au_fname, authors.au_lname, titles.title, publishers.pub_name
FROM authors 
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN publishers ON publishers.pub_id = titles.pub_id;