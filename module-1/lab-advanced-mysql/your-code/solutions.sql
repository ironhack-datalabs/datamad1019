#CHALLENGE 1
 SELECT 
	authors.au_id AS 'AUTHOR ID', 
	authors.au_lname AS 'LAST NAME',
	authors.au_fname AS 'FIRST NAME',
	sum(titles.advance * titleauthor.royaltyper/100 + titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'PROFIT'
    FROM authors
	LEFT JOIN titleauthor
	ON authors.au_id=titleauthor.au_id
	LEFT JOIN titles
	ON titleauthor.title_id=titles.title_id
    LEFT JOIN sales
	ON sales.title_id=titles.title_id
    GROUP BY authors.au_id, titles.title_id
    ORDER BY PROFIT DESC
    LIMIT 3;

#CHALLENGE 2
CREATE TEMPORARY TABLE temporal (SELECT 
	authors.au_id AS 'AUTHOR ID', 
	authors.au_lname AS 'LAST NAME',
	authors.au_fname AS 'FIRST NAME',
	sum(titles.advance * titleauthor.royaltyper/100 + titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'PROFIT'
    FROM authors
	LEFT JOIN titleauthor
	ON authors.au_id=titleauthor.au_id
	LEFT JOIN titles
	ON titleauthor.title_id=titles.title_id
    LEFT JOIN sales
	ON sales.title_id=titles.title_id
    GROUP BY authors.au_id, titles.title_id
    ORDER BY PROFIT DESC
    LIMIT 3); 

#CHALLENGE 3
CREATE TABLE permamente (SELECT 
	authors.au_id AS 'AUTHOR ID', 
	sum(titles.advance * titleauthor.royaltyper/100 + titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'PROFIT'
    FROM authors
	LEFT JOIN titleauthor
	ON authors.au_id=titleauthor.au_id
	LEFT JOIN titles
	ON titleauthor.title_id=titles.title_id
    LEFT JOIN sales
	ON sales.title_id=titles.title_id
    GROUP BY authors.au_id, titles.title_id
    ORDER BY PROFIT DESC
    LIMIT 3);