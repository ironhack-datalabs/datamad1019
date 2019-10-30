
########################################################################################

# Challenge 1 - Who Have Published What At Where?

# Since the total rows in my output should be the same as the total number of records in
# Table titleauthor, I'm doing a LEFT JOIN from titleauthor.

SELECT
	au.au_id AS "AUTHOR ID",
    au.au_lname AS "LAST NAME",
    au.au_fname AS "FIRST NAME",
    t.title AS "TITLE",
    p.pub_name AS "PUBLISHER"
    FROM titleauthor AS ta
    LEFT JOIN titles AS t ON ta.title_id = t.title_id
    LEFT JOIN authors AS au ON ta.au_id = au.au_id
    LEFT JOIN publishers AS p ON t.pub_id = p.pub_id;
    
# SELECT * FROM titleauthor; # (25 row(s) returned) == My output (25 row(s) returned)

# I could also do a RIGHT JOIN with titleauthor from authors:
SELECT
	au.au_id AS "AUTHOR ID",
    au.au_lname AS "LAST NAME",
    au.au_fname AS "FIRST NAME",
    t.title AS "TITLE",
    p.pub_name AS "PUBLISHER"
    FROM authors AS au
    RIGHT JOIN titleauthor as ta ON au.au_id = ta.au_id
    LEFT JOIN titles AS t ON ta.title_id = t.title_id
    LEFT JOIN publishers AS p ON t.pub_id = p.pub_id;
    
# SELECT * FROM titleauthor; # (25 row(s) returned) == My output (25 row(s) returned)

########################################################################################

# Challenge 2 - Who Have Published How Many At Where?
  
SELECT
	au.au_id AS "AUTHOR ID",
    au.au_lname AS "LAST NAME",
    au.au_fname AS "FIRST NAME",
    p.pub_name AS "PUBLISHER",
    count(*) AS "TITLE COUNT"
    FROM titleauthor AS ta
    LEFT JOIN titles AS t ON ta.title_id = t.title_id
    LEFT JOIN authors AS au ON ta.au_id = au.au_id
    LEFT JOIN publishers AS p ON t.pub_id = p.pub_id
	GROUP BY t.pub_id, au.au_id
	ORDER BY count(*) DESC;

# To check if your output is correct, sum up the TITLE COUNT column. The sum number should be
# the same as the total number of records in Table titleauthor.

# Total number of records in Table titleauthor = 25 rows
# Sum of the TITLE COUNT column = 25 (24 rows, but 1 row (Albert Ringer in New Moon Books) has a TITLE COUNT of 2)

########################################################################################

# Challenge 3 - Best Selling Authors
# Who are the top 3 authors who have sold the highest number of titles?
    
SELECT
	au.au_id AS "AUTHOR ID",
    au.au_lname AS "LAST NAME",
    au.au_fname AS "FIRST NAME",
    SUM(s.qty) AS "TOTAL"
    FROM authors AS au
    LEFT JOIN titleauthor AS ta ON au.au_id = ta.au_id
    LEFT JOIN titles AS t ON ta.title_id = t.title_id
    LEFT JOIN sales AS s ON ta.title_id = s.title_id
	GROUP BY au.au_id
    ORDER BY SUM(s.qty) DESC
    LIMIT 3;
    
# I could also do a RIGHT JOIN with authors from titleauthor:
SELECT
	au.au_id AS "AUTHOR ID",
    au.au_lname AS "LAST NAME",
    au.au_fname AS "FIRST NAME",
    SUM(s.qty) AS "TOTAL"
    FROM titleauthor AS ta
    RIGHT JOIN authors AS au ON ta.au_id = au.au_id
    LEFT JOIN titles AS t ON ta.title_id = t.title_id
    LEFT JOIN sales AS s ON ta.title_id = s.title_id
	GROUP BY au.au_id
    ORDER BY SUM(s.qty) DESC
    LIMIT 3;

########################################################################################

# Challenge 4 - Best Selling Authors Ranking

SELECT
	au.au_id AS "AUTHOR ID",
    au.au_lname AS "LAST NAME",
    au.au_fname AS "FIRST NAME",
    IFNULL(SUM(s.qty), 0) AS "TOTAL" 
    FROM authors AS au
    LEFT JOIN titleauthor AS ta ON au.au_id = ta.au_id
    LEFT JOIN titles AS t ON ta.title_id = t.title_id
    LEFT JOIN sales AS s ON ta.title_id = s.title_id
	GROUP BY au.au_id
    ORDER BY IFNULL(SUM(s.qty), 0) DESC;

# The total rows in my output should be the same as the total number of records in Table authors.
# SELECT * FROM publications.authors; # 23 rows (23 unique author_id's == 23 different authors)
# The total rows in my output is 23.
   
########################################################################################

# Bonus Challenge - Most Profiting Authors

# Profit = Advance (fixed value) + Royalties (percentage of the entire book sales)
# Advance = Advance * (royaltyper*0,01)
# Royalties = ((Royalties*0.01)*(NumberOfBooksSold*PricePerBook)) * (royaltyper*0,01)

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
