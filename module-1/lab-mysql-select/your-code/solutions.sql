
########################################################################################

# Challenge 1 - Who Have Published What At Where?

SELECT
	au.au_id AS "AUTHOR ID", au.au_lname AS "LAST NAME", au.au_fname AS "FIRST NAME", t.title AS "TITLE", p.pub_name AS "PUBLISHER"
    FROM titleauthor AS ta
    LEFT JOIN titles AS t ON ta.title_id = t.title_id
    LEFT JOIN authors AS au ON ta.au_id = au.au_id
    LEFT JOIN publishers AS p ON t.pub_id = p.pub_id;
    
# If your query is correct, the total rows in your output should be the same as the total
# number of records in Table titleauthor.
# SELECT * FROM titleauthor; # 25 rows returned == My output

########################################################################################

# Challenge 2 - Who Have Published How Many At Where?
  
SELECT
	au.au_id AS "AUTHOR ID", au.au_lname AS "LAST NAME", au.au_fname AS "FIRST NAME", p.pub_name AS "PUBLISHER", count(*) AS "TITLE COUNT"
    FROM titleauthor AS ta
    LEFT JOIN titles AS t ON ta.title_id = t.title_id
    LEFT JOIN authors AS au ON ta.au_id = au.au_id
    LEFT JOIN publishers AS p ON t.pub_id = p.pub_id
	GROUP BY t.pub_id, au.au_id
	ORDER BY count(*) DESC;

# To check if your output is correct, sum up the TITLE COUNT column. The sum number should be
# the same as the total number of records in Table titleauthor.

# Total number of records in Table titleauthor = 25 rows
# Sum up the TITLE COUNT column = 25 (24 rows, but 1 row has a TITLE COUNT of 2)

########################################################################################

# Challenge 3 - Best Selling Authors
# Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.
    
SELECT
	au.au_id AS "AUTHOR ID", au.au_lname AS "LAST NAME", au.au_fname AS "FIRST NAME", SUM(s.qty) AS "TOTAL"
    FROM authors AS au
    LEFT JOIN titleauthor AS ta ON au.au_id = ta.au_id
    LEFT JOIN titles AS t ON ta.title_id = t.title_id
    LEFT JOIN sales AS s ON ta.title_id = s.title_id
	GROUP BY au.au_id
    ORDER BY SUM(s.qty) DESC
    LIMIT 3;

# Con esta otra manera no selecciono las 4 filas con valores nulos (devuelve solo 19 filas):
# SELECT
	# au.au_id AS "AUTHOR ID", au.au_lname AS "LAST NAME", au.au_fname AS "FIRST NAME", SUM(s.qty) AS "TOTAL"
    # FROM titleauthor AS ta
    # LEFT JOIN titles AS t ON ta.title_id = t.title_id
    # LEFT JOIN sales AS s ON ta.title_id = s.title_id
    # LEFT JOIN authors AS au ON ta.au_id = au.au_id
	# GROUP BY au.au_id
    # ORDER BY SUM(s.qty) DESC
    # LIMIT 3;

########################################################################################

# Challenge 4 - Best Selling Authors Ranking

SELECT
	au.au_id AS "AUTHOR ID", au.au_lname AS "LAST NAME", au.au_fname AS "FIRST NAME", IFNULL(SUM(s.qty), 0) AS "TOTAL" 
    FROM authors AS au
    LEFT JOIN titleauthor AS ta ON au.au_id = ta.au_id
    LEFT JOIN titles AS t ON ta.title_id = t.title_id
    LEFT JOIN sales AS s ON ta.title_id = s.title_id
	GROUP BY au.au_id
    ORDER BY IFNULL(SUM(s.qty), 0) DESC;
   
########################################################################################

# Bonus Challenge - Most Profiting Authors

SELECT
	au.au_id AS "AUTHOR ID", au.au_lname AS "LAST NAME", au.au_fname AS "FIRST NAME",
    IFNULL(SUM((t.advance*(ta.royaltyper*0.01)) + ((t.price*s.qty)*(t.royalty*0.01)*(ta.royaltyper*0.01))), 0) AS "PROFIT"
    FROM authors AS au
    LEFT JOIN titleauthor AS ta ON au.au_id = ta.au_id
    LEFT JOIN titles AS t ON ta.title_id = t.title_id
    LEFT JOIN sales AS s ON ta.title_id = s.title_id
	GROUP BY au.au_id
    ORDER BY PROFIT DESC
    LIMIT 3;
    







