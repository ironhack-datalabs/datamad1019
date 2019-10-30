
# Challenge 1 - Most Profiting Authors

# 1. Step 1: Calculate the royalty of each sale for each author:
# sales_royalty = titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100

CREATE TEMPORARY TABLE sales_temporal
SELECT
	au.au_id AS 'Author_ID',
    t.title_id AS 'Title_ID',
    # s.ord_num, # Código único de cada pedido
    t.price * s.qty * (t.royalty/100) * (ta.royaltyper/100) AS 'Sales_Royalty'
	# IFNULL(t.price*s.qty*(t.royalty/100)*(ta.royaltyper/100), 0) AS 'Sales royalty'
    FROM authors AS au
    LEFT JOIN titleauthor AS ta ON au.au_id = ta.au_id
    LEFT JOIN titles AS t ON ta.title_id = t.title_id
    LEFT JOIN sales AS s ON ta.title_id = s.title_id;
    # RIGHT JOIN sales AS s ON ta.title_id = s.title_id; # Para quitar los autores que no han vendido nada

# 2. Using the output from Step 1 as a temp table, aggregate the total royalties for each title for each author.

SELECT Author_ID, Title_ID, sum(Sales_Royalty) as 'Total_Royalties'
FROM sales_temporal
GROUP BY Author_ID, Title_ID;

# 3. Using the output from Step 2 as a temp table, calculate the total profits of each author
# by aggregating the advances and total royalties of each title.
# Sort the output based on a total profits from high to low, and limit the number of rows to 3.

SELECT
	x.Author_ID,
    SUM(titles.advance*(titleauthor.royaltyper/100) + x.Total_Royalties) AS Profit
    FROM (
		SELECT Author_ID, Title_ID, sum(Sales_Royalty) as 'Total_Royalties'
		FROM sales_temporal
		GROUP BY Author_ID, Title_ID
		) AS x
	LEFT JOIN titles ON titles.title_id = x.Title_ID
	LEFT JOIN titleauthor ON titleauthor.au_id = x.Author_ID
    GROUP BY x.Author_ID
    ORDER BY PROFIT DESC;
    # LIMIT 3;







