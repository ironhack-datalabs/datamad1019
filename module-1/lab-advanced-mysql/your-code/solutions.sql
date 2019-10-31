#Challenge 1

SELECT authors.au_id, au_lname, au_fname, titles.title_id, IFNULL(SUM(qty * royalty / 100 * royaltyper / 100 * price), 0) AS profit
FROM authors 
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id, titles.title_id
ORDER BY profit DESC LIMIT 3;

#Challenge 2

CREATE TEMPORARY TABLE tabla_temporal( SELECT authors.au_id, au_lname, au_fname, titles.title_id, IFNULL(SUM(qty * royalty / 100 * royaltyper / 100 * price), 0) AS profit
FROM authors 
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id, titles.title_id
ORDER BY profit DESC LIMIT 3);

