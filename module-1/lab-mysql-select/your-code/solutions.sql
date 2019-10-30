# CHALLENGE 1
SELECT
authors.au_id AS AuthorID,
authors.au_lname AS LastName,
authors.au_fname AS FirstName,
titles.title AS TITLE,
publishers.pub_name AS PublisherName
FROM authors
LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN publishers ON publishers.pub_id = titles.pub_id;

# CHALLENGE 2
SELECT
authors.au_id AS AuthorID,
authors.au_lname AS LastName,
authors.au_fname AS FirstName,
publishers.pub_name AS PublisherName,
COUNT(*) AS TitleCount
FROM authors
LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN publishers ON publishers.pub_id = titles.pub_id
GROUP BY publishers.pub_name, authors.au_id;

#CHALLENGE 3
SELECT
authors.au_id AS AuthorID,
authors.au_lname AS LastName,
authors.au_fname AS FirstName,
sum(qty) AS TOTAL 
FROM sales
LEFT JOIN titleauthor ON titleauthor.title_id = sales.title_id
LEFT JOIN authors ON authors.au_id = titleauthor.au_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;

#CHALLENGE 4
SELECT
authors.au_id AS AuthorID,
authors.au_lname AS LastName,
authors.au_fname AS FirstName,
IFNULL(sum(qty),0) AS TOTAL
FROM sales
RIGHT JOIN titleauthor ON titleauthor.title_id = sales.title_id
RIGHT JOIN authors ON authors.au_id = titleauthor.au_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC;

#BONUS
SELECT
authors.au_id AS AuthorID,
authors.au_lname AS LastName,
authors.au_fname AS FirstName,
sum(titles.advance*royaltyper/100 + titles.ytd_sales*titles.price*titles.royalty/100*titleauthor.royaltyper/100) AS PROFIT
FROM authors
LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
GROUP BY authors.au_id
ORDER BY PROFIT DESC
LIMIT 3;
