#CHALLENGE 1

SELECT authors.au_id as `AUTHOR ID`,
authors.au_lname as `LAST NAME`,
authors.au_fname as `FIRST NAME`,
titles.title as TITLE,
publishers.pub_name as 	PUBLISHER
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN publishers ON publishers.pub_id = titles.pub_id;

#CHALLENGE 2

SELECT authors.au_id as `AUTHOR ID`,
authors.au_lname as `LAST NAME`,
authors.au_fname as `FIRST NAME`,
publishers.pub_name as 	PUBLISHER,
count(titles.title_id) as `TITLE COUNT`
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN publishers ON publishers.pub_id = titles.pub_id
GROUP BY publishers.pub_id, authors.au_id;

#CHALLENGE 3

SELECT authors.au_id as `AUTHOR ID`,
authors.au_lname as `LAST NAME`,
authors.au_fname as `FIRST NAME`,
sum(sales.qty) as TOTAL
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titles.title_id = titleauthor.title_id
RIGHT JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC LIMIT 3;

#CHALLENGE 4

SELECT authors.au_id as `AUTHOR ID`,
authors.au_lname as `LAST NAME`,
authors.au_fname as `FIRST NAME`,
COALESCE(SUM(sales.qty),0) as TOTAL
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC;


#BONUS CHALLENGE

SELECT authors.au_id as `AUTHOR ID`,
authors.au_lname as `LAST NAME`,
authors.au_fname as `FIRST NAME`,
ta.royaltyper * (t.advance + t.royalty * t.ytd_sales * t.price ) as PROFIT
FROM authors
LEFT JOIN titleauthor ta ON authors.au_id = ta.au_id
INNER JOIN titles t ON t.title_id = ta.title_id
ORDER BY PROFIT DESC LIMIT 3;