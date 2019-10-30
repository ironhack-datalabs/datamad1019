'''CHALLENGE 1'''
SELECT
authors.au_id AS AuthorID,
authors.au_lname AS LastName,
authors.au_fname AS FirstName,
sum(titles.advance*titleauthor.royaltyper/100 + titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS PROFIT
FROM authors
LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN sales ON sales.title_id = titles.title_id
GROUP BY authors.au_id, titles.title_id
ORDER BY PROFIT DESC
LIMIT 3;

'''CHALLENGE 2'''
CREATE TEMPORARY TABLE TemporaryTable
(SELECT
authors.au_id AS AuthorID,
authors.au_lname AS LastName,
authors.au_fname AS FirstName,
sum(titles.advance*titleauthor.royaltyper/100 + titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS PROFIT
FROM authors
LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN sales ON sales.title_id = titles.title_id
GROUP BY authors.au_id, titles.title_id
ORDER BY PROFIT DESC
LIMIT 3);

'''CHALLENGE 3'''
CREATE TABLE PermanentTable (SELECT
authors.au_id AS AuthorID,
authors.au_lname AS LastName,
authors.au_fname AS FirstName,
sum(titles.advance + titles.ytd_sales*titles.price*titles.royalty/100*titleauthor.royaltyper/100) AS PROFIT
FROM authors
LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
GROUP BY authors.au_id
ORDER BY PROFIT DESC
LIMIT 3);