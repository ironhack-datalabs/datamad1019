
########################################################################################

# Challenge 1 - Who Have Published What At Where?

SELECT
	au.au_id AS "AUTHOR ID", au.au_lname AS "LAST NAME", au.au_fname AS "FIRST NAME", t.title AS "TITLE", p.pub_name AS "PUBLISHER"
    FROM titleauthor AS ta
    LEFT JOIN titles AS t ON t.title_id = ta.title_id
    LEFT JOIN publishers AS p ON t.pub_id = p.pub_id
    LEFT JOIN authors AS au ON au.au_id = ta.au_id;

# If your query is correct, the total rows in your output should be the same as the total
# number of records in Table titleauthor.
# SELECT * FROM titleauthor; # 25 rows returned == My output

########################################################################################

# Challenge 2 - Who Have Published How Many At Where?

SELECT
	au.au_id AS "AUTHOR ID", au.au_lname AS "LAST NAME", au.au_fname AS "FIRST NAME", p.pub_name AS "PUBLISHER", count(*) AS "TITLE COUNT"
    FROM titleauthor AS ta
    LEFT JOIN titles AS t ON t.title_id = ta.title_id
    LEFT JOIN publishers AS p ON t.pub_id = p.pub_id
    LEFT JOIN authors AS au ON au.au_id = ta.au_id
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
    FROM titleauthor AS ta
    LEFT JOIN titles AS t ON t.title_id = ta.title_id
    LEFT JOIN sales AS s ON t.title_id = s.title_id
    LEFT JOIN authors AS au ON au.au_id = ta.au_id
	GROUP BY au.au_id
    ORDER BY SUM(s.qty) DESC
    LIMIT 3;    

########################################################################################

# Challenge 4 - Best Selling Authors Ranking

SELECT
	au.au_id AS "AUTHOR ID", au.au_lname AS "LAST NAME", au.au_fname AS "FIRST NAME", SUM(s.qty) AS "TOTAL"
    FROM titleauthor AS ta
    LEFT JOIN titles AS t ON t.title_id = ta.title_id
    LEFT JOIN sales AS s ON t.title_id = s.title_id
    LEFT JOIN authors AS au ON au.au_id = ta.au_id
	GROUP BY au.au_id
    ORDER BY SUM(s.qty) DESC;

########################################################################################

# Bonus Challenge - Most Profiting Authors









