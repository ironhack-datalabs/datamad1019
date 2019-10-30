
#Challenge 1-Who Have Published What At Where?

SELECT 
authors.au_id AS "AUTHOR ID",
authors.au_lname AS "LAST NAME",
authors.au_fname AS "FIRST NAME",
titles.title AS "TITLE",
publishers.pub_name AS "PUBLISHER"
FROM authors
LEFT JOIN titleauthor ON titleauthor.au_id=authors.au_id
LEFT JOIN titles ON titles.title_id=titleauthor.title_id
LEFT JOIN publishers ON publishers.pub_id=titles.pub_id;


#Challenge 2-Who Have Published How Many At Where?

SELECT 
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
	publishers.pub_name AS "PUBLISHER",
    COUNT(*) AS "TITLE COUNT"
	FROM authors
	LEFT JOIN titleauthor ON titleauthor.au_id=authors.au_id
	LEFT JOIN titles ON titles.title_id=titleauthor.title_id
	LEFT JOIN publishers ON publishers.pub_id=titles.pub_id
	GROUP BY publishers.pub_name, authors.au_id;


#Challenge 3-Best Selling Authors
SELECT 
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
    sum(sales.qty) AS "TOTAL"
	FROM authors
	LEFT JOIN titleauthor ON titleauthor.au_id=authors.au_id
	LEFT JOIN sales ON sales.title_id=titleauthor.title_id
    GROUP BY authors.au_id
    ORDER BY TOTAL DESC
    LIMIT 3;


#Challenge 4-Best Selling Authors Ranking
SELECT 
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
    IFNULL(sum(sales.qty),0) AS "TOTAL"
	FROM authors
	LEFT JOIN titleauthor ON titleauthor.au_id=authors.au_id
	LEFT JOIN sales ON sales.title_id=titleauthor.title_id
    GROUP BY authors.au_id
    ORDER BY TOTAL DESC;


#Bonus Challenge - Most Profiting Authors
SELECT 
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
    sum(titleauthor.royaltyper/100*titles.royalty/100*titles.ytd_sales*titles.price+titles.advance) AS "PROFIT"
	FROM authors
	LEFT JOIN titleauthor ON titleauthor.au_id=authors.au_id
	LEFT JOIN titles ON titles.title_id=titleauthor.title_id
    GROUP BY authors.au_id
    ORDER BY PROFIT DESC
    LIMIT 3;
