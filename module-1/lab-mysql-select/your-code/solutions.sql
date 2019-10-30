-- # Challenge 1
-- SELECT
-- 	au.au_id AS `AUTHOR ID`, au.au_lname AS `LAST NAME`, au.au_fname AS `FIRST NAME`, t.title AS `TITLE`, p.pub_name AS `PUBLISHER`
--     FROM authors AS au
--     INNER JOIN titleauthor AS ta ON au.au_id=ta.au_id
--     INNER JOIN titles AS t ON ta.title_id=t.title_id
--     INNER JOIN publishers AS p ON t.pub_id=p.pub_id
-- 
-- # Challenge 2
-- SELECT
-- 	au.au_id AS `AUTHOR ID`, au.au_lname AS `LAST NAME`, au.au_fname AS `FIRST NAME`, p.pub_name AS `PUBLISHER`, COUNT(*) AS `TITLE COUNT`
--     FROM authors AS au
--     INNER JOIN titleauthor AS ta ON au.au_id=ta.au_id
--     INNER JOIN titles AS t ON ta.title_id=t.title_id
--     INNER JOIN publishers AS p ON t.pub_id=p.pub_id
--     GROUP BY t.pub_id, au.au_id
-- 
-- # Challenge 3
-- SELECT
-- 	au.au_id AS `AUTHOR ID`, au.au_lname AS `LAST NAME`, au.au_fname AS `FIRST NAME`, SUM(s.qty) AS `TOTAL`
--     FROM authors AS au
--     LEFT JOIN titleauthor AS ta ON au.au_id = ta.au_id
--     LEFT JOIN sales AS s ON ta.title_id = s.title_id
-- 	GROUP BY ta.au_id, au.au_id
--     ORDER BY `TOTAL` DESC
--     LIMIT 3
-- 
-- # Challenge 4
-- SELECT
-- 	au.au_id AS `AUTHOR ID`, au.au_lname AS `LAST NAME`, au.au_fname AS `FIRST NAME`, SUM(s.qty) AS `TOTAL`
--     FROM authors AS au
--     LEFT JOIN titleauthor AS ta ON au.au_id = ta.au_id
--     LEFT JOIN sales AS s ON ta.title_id = s.title_id
-- 	GROUP BY ta.au_id, au.au_id
--     ORDER BY `TOTAL` DESC

# Challenge Bonus

SELECT
 	au.au_id AS `AUTHOR ID`, au.au_lname AS `LAST NAME`, au.au_fname AS `FIRST NAME`, SUM(s.qty*t.price + t.advance) AS `PROFIT`
	FROM authors AS au
	LEFT JOIN titleauthor AS ta ON au.au_id = ta.au_id
	LEFT JOIN sales AS s ON ta.title_id = s.title_id
    LEFT JOIN titles AS t ON s.title_id = t.title_id
	GROUP BY ta.au_id, au.au_id
    ORDER BY `PROFIT` DESC




