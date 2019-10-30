#Challenge 1

SELECT authors.au_id, au_lname, au_fname, titles.title, publishers.pub_name
FROM authors 
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id;

#Challenge 2

SELECT authors.au_id, au_lname, au_fname, publishers.pub_name, COUNT(titles.title) as total
FROM authors 
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name
ORDER BY COUNT(titles.title) DESC;

#Challenge 3

SELECT authors.au_id, au_lname, au_fname, SUM(sales.qty)
FROM authors 
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY SUM(sales.qty) DESC;

#BONUS

SELECT authors.au_id, au_lname, au_fname, SUM(sales.qty * roysched.royalty / 100 * titleauthor.royaltyper / 100) + SUM(titles.advance * titleauthor.royaltyper / 100) as profits
FROM authors 
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
LEFT JOIN sales ON titles.title_id = sales.title_id
LEFT JOIN roysched ON sales.title_id = roysched.title_id
GROUP BY authors.au_id
ORDER BY profits DESC;
