# Challenge 1
#Step 1

SELECT titles.title_id, authors.au_id, (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS sales_royalty
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON  titles.title_id = titleauthor.title_id
INNER JOIN sales ON sales.title_id = titles.title_id

#Step 2

