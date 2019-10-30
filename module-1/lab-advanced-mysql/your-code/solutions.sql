# step1
SELECT 
titles.title_id AS "Title ID", 
authors.au_id AS "Author ID",
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS "Royalty"

FROM authors
LEFT JOIN titleauthor 	ON  authors.au_id=titleauthor.au_id 
LEFT JOIN titles  ON titleauthor.title_id=titles.title_id
LEFT JOIN sales ON titleauthor.title_id=sales.title_id

GROUP BY titles.title_id, authors.au_id, titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100;

# step2

