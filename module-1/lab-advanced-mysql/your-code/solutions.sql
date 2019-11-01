SELECT titleauthor.title_id, SUM(royalty) AS total
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
LEFT JOIN roysched ON sales.title_id = roysched.title_id
GROUP BY title_id
ORDER BY total DESC;