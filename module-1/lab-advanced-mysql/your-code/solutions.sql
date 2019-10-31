#Challenge 1

FROM authors 
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id, titles.title_id
ORDER BY profit DESC;