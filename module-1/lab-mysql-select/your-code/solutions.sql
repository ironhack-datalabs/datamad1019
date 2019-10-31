# challenge 1

SELECT authors.au_id, authors.au_lname, authors.au_fname,titles.title, publishers.pub_name
FROM authors 
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN publishers ON publishers.pub_id = titles.pub_id;


# challenge 2

SELECT authors.au_id, authors.au_lname, authors.au_fname,COUNT(titles.title) as count_title,publishers.pub_name
FROM authors 
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN publishers ON publishers.pub_id = titles.pub_id
group by au_id, pub_name;

# challenge 3

SELECT authors.au_id, authors.au_lname, authors.au_fname,SUM(sales.qty) as TOTAL
FROM authors 
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN sales ON sales.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;