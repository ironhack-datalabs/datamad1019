# Challenge 1

# Step 1
-- 		SELECT 
-- 			titleauthor.title_id AS "Title_ID",
-- 			titleauthor.au_id AS "Author_ID",
-- 			(titles.price * sales.qty * titles.royalty/100 * titleauthor.royaltyper/100) AS "Sales_Royalty"
-- 			FROM titleauthor
-- 			LEFT JOIN sales ON titleauthor.title_id = sales.title_id
-- 			LEFT JOIN titles ON sales.title_id = titles.title_id

# Step 2
-- SELECT
-- 	Title_ID,
--     Author_ID,
--     SUM(Sales_Royalty)
-- 	FROM (
-- 		SELECT 
-- 			titleauthor.title_id AS "Title_ID",
-- 			titleauthor.au_id AS "Author_ID",
-- 			(titles.price * sales.qty * titles.royalty/100 * titleauthor.royaltyper/100) AS "Sales_Royalty"
-- 			FROM titleauthor
-- 			LEFT JOIN sales ON titleauthor.title_id = sales.title_id
-- 			LEFT JOIN titles ON sales.title_id = titles.title_id
-- 	) AS x
--     GROUP BY Title_ID, Author_ID

# Step 3
-- SELECT
-- 	Author_ID,
--     SUM(Sales_Royalty + Advance*Royal_Typer/100) AS "Profits"
-- 	FROM (
-- 		SELECT
-- 			Title_ID AS "Title_ID",
-- 			Author_ID AS "Author_ID",
-- 			SUM(Sales_Royalty) AS "Sales_Royalty",
--             Advance AS "Advance",
--             Royal_Typer AS "Royal_Typer"
-- 			FROM (
-- 				SELECT 
-- 					titleauthor.title_id AS "Title_ID",
-- 					titleauthor.au_id AS "Author_ID",
-- 					(titles.price * sales.qty * titles.royalty/100 * titleauthor.royaltyper/100) AS "Sales_Royalty",
--                     titles.advance AS "Advance",
--                     titleauthor.royaltyper AS "Royal_Typer"
-- 					FROM titleauthor
-- 					LEFT JOIN sales ON titleauthor.title_id = sales.title_id
-- 					LEFT JOIN titles ON sales.title_id = titles.title_id
-- 			) AS x
-- 			GROUP BY Title_ID, Author_ID
-- 	) AS y
-- 	GROUP BY Author_ID
--     ORDER BY Profits DESC
--     LIMIT 3


