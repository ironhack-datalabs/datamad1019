-- Challenge 1

SELECT
	au.au_id AS "AUTHOR ID", au.au_lname AS "LAST NAME", au.au_fname AS "FIRST NAME", t.title AS "TITLE", p.pub_name AS "PUBLISHER"
    
    FROM titleauthor AS ta
    
    LEFT JOIN titles AS t ON t.title_id = ta.title_id
    LEFT JOIN publishers AS p ON t.pub_id = p.pub_id
    LEFT JOIN authors AS au ON au.au_id = ta.au_id;

-- Challenge 2

SELECT
	au.au_id AS "AUTHOR ID", au.au_lname AS "LAST NAME", au.au_fname AS "FIRST NAME", p.pub_name AS "PUBLISHER", count(*) AS "TITLE COUNT"
    
    FROM titleauthor AS tia
    
    LEFT JOIN titles AS t ON t.title_id = tia.title_id
    LEFT JOIN publishers AS p ON t.pub_id = p.pub_id
    LEFT JOIN authors AS au ON au.au_id = tia.au_id
	
    GROUP BY 1, 2, 3, 4
    ORDER BY 5 DESC;

-- Challenge 3

SELECT
	au.au_id AS "AUTHOR ID", au.au_lname AS "LAST NAME", au.au_fname AS "FIRST NAME", SUM(sa.qty) AS "TOTAL"
    
    FROM titleauthor AS tia
    
    LEFT JOIN titles AS t ON t.title_id = tia.title_id
    LEFT JOIN authors AS au ON au.au_id = tia.au_id
    LEFT JOIN sales AS sa on t.title_id = sa.title_id
    
    GROUP BY au.au_id	
    ORDER BY SUM(sa.qty) DESC
    
    LIMIT 3;

-- Challenge 4

SELECT
	au.au_id AS "AUTHOR ID", au.au_lname AS "LAST NAME", au.au_fname AS "FIRST NAME", 
    IFNULL(SUM(sa.qty), 0) AS "TOTAL"
    
    FROM titleauthor AS tia
    
    LEFT JOIN titles AS t ON t.title_id = tia.title_id
    RIGHT JOIN authors AS au ON au.au_id = tia.au_id
    LEFT JOIN sales AS sa on t.title_id = sa.title_id
    
    GROUP BY au.au_id
	ORDER BY IFNULL(SUM(sa.qty), 0) DESC;

-- Bonus

SELECT
	au.au_id AS "AUTHOR ID", au.au_lname AS "LAST NAME", au.au_fname AS "FIRST NAME",  
    IFNULL(SUM((t.advance*(tia.royaltyper*0.01)) + ((t.price*sa.qty)*(t.royalty*0.01)*(tia.royaltyper*0.01))), 0) as PROFIT
    FROM titleauthor AS tia
    LEFT JOIN titles AS t ON t.title_id = tia.title_id
    RIGHT JOIN authors AS au ON au.au_id = tia.au_id
    LEFT JOIN sales AS sa on t.title_id = sa.title_id
    GROUP BY au.au_id, au.au_lname
	ORDER BY PROFIT DESC;

