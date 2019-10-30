#CHALLENGE 1
SELECT 
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
	titles.title AS "TITLE",
	publishers.pub_name AS "PUBLISHER"
	FROM authors
	LEFT JOIN titleauthor
	ON authors.au_id=titleauthor.au_id
	LEFT JOIN titles
	ON titleauthor.title_id=titles.title_id
	LEFT JOIN publishers
	ON titles.pub_id=publishers.pub_id;

    #CHALLENGE 2
    SELECT 
	authors.au_id AS 'AUTHOR ID', 
	authors.au_lname AS 'LAST NAME',
	authors.au_fname AS 'FIRST NAME',
	publishers.pub_name AS 'PUBLISHER',
	COUNT(titles.title) AS 'COUNT TITLE' 
    FROM authors
	LEFT JOIN titleauthor
	ON authors.au_id=titleauthor.au_id
	LEFT JOIN titles
	ON titleauthor.title_id=titles.title_id
	LEFT JOIN publishers
	ON titles.pub_id=publishers.pub_id
    WHERE titles.title IS NOT NULL
	GROUP BY authors.au_id, publishers.pub_name;

    #CHALLENGE 3
    SELECT 
	authors.au_id AS 'AUTHOR ID', 
	authors.au_lname AS 'LAST NAME',
	authors.au_fname AS 'FIRST NAME',
	SUM(sales.qty) AS 'TOTAL'
    FROM authors
	LEFT JOIN titleauthor
	ON authors.au_id=titleauthor.au_id
	LEFT JOIN titles
	ON titleauthor.title_id=titles.title_id
	LEFT JOIN sales
	ON titles.title_id=sales.title_id
    WHERE sales.qty IS NOT NULL
	GROUP BY authors.au_id
    ORDER BY TOTAL DESC
    LIMIT 3;

    #CHALLENGE 4
    SELECT 
	authors.au_id AS 'AUTHOR ID', 
	authors.au_lname AS 'LAST NAME',
	authors.au_fname AS 'FIRST NAME',
	IFNULL(SUM(sales.qty),0) AS 'TOTAL'
    FROM authors
	LEFT JOIN titleauthor
	ON authors.au_id=titleauthor.au_id
	LEFT JOIN titles
	ON titleauthor.title_id=titles.title_id
	LEFT JOIN sales
	ON titles.title_id=sales.title_id
	GROUP BY authors.au_id
    ORDER BY TOTAL DESC;

    #BONUS
    SELECT 
	authors.au_id AS 'AUTHOR ID', 
	authors.au_lname AS 'LAST NAME',
	authors.au_fname AS 'FIRST NAME',
	sum(titles.advance + titleauthor.royaltyper * titles.ytd_sales/100) AS 'PROFIT'
    FROM authors
	LEFT JOIN titleauthor
	ON authors.au_id=titleauthor.au_id
	LEFT JOIN titles
	ON titleauthor.title_id=titles.title_id
    GROUP BY authors.au_id
    ORDER BY PROFIT DESC
    LIMIT 3;

