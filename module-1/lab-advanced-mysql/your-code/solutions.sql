SELECT authors.au_id, au_lname, au_fname, IFNULL(SUM(qty * royalty / 100 * royaltyper / 100 * price), 0) AS profit
FROM authors 
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY SUM(sales.qty) DESC;