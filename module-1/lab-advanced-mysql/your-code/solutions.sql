
# [lab-advanced-mysql] Cristina Rota

############################################################################################
# Challenge 1 - Most Profiting Authors
############################################################################################

# 1. Calculate the royalty of each sale for each author:
# sales_royalty = titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100

SELECT
	ta.au_id AS 'Author_ID',
    ta.title_id AS 'Title_ID',
    (t.price * s.qty * (t.royalty/100) * (ta.royaltyper/100)) AS 'Sales_Royalty'
	FROM titleauthor as ta
	LEFT JOIN titles as t ON ta.title_id = t.title_id
    RIGHT JOIN sales as s ON ta.title_id = s.title_id;

############################################################################################

# 2. Using the output from Step 1 as a temp table, aggregate the total royalties for each title
# for each author.

SELECT
	Author_ID,
	Title_ID,
	SUM(Sales_Royalty) as 'Total_Royalties'
	FROM (
		SELECT
			ta.au_id AS 'Author_ID',
			ta.title_id AS 'Title_ID',
			(t.price * s.qty * (t.royalty/100) * (ta.royaltyper/100)) AS 'Sales_Royalty'
			FROM titleauthor as ta
			LEFT JOIN titles as t ON ta.title_id = t.title_id
			RIGHT JOIN sales as s ON ta.title_id = s.title_id
	) AS FirstTable
	GROUP BY Author_ID, Title_ID;

############################################################################################

# 3. Using the output from Step 2 as a temp table, calculate the total profits of each author
# by aggregating the advances and total royalties of each title.
# Sort the output based on a total profits from high to low, and limit the number of rows to 3.

SELECT
	Author_ID,
    SUM( Advance*(Royal_Typer/100) + Total_Royalties) AS 'Profit'
	FROM (    
		SELECT
			Author_ID,
			Title_ID,
			SUM(Sales_Royalty) as 'Total_Royalties',
            Advance as 'Advance',
            Royal_Typer as 'Royal_Typer'
			FROM (
				SELECT
					ta.au_id AS 'Author_ID',
					ta.title_id AS 'Title_ID',
					(t.price * s.qty * (t.royalty/100) * (ta.royaltyper/100)) AS 'Sales_Royalty',
                    t.advance as 'Advance',
                    ta.royaltyper AS "Royal_Typer"
					FROM titleauthor as ta
					LEFT JOIN titles as t ON ta.title_id = t.title_id
					RIGHT JOIN sales as s ON ta.title_id = s.title_id
				) AS FirstTable
			GROUP BY Author_ID, Title_ID
	) AS SecondTable
    GROUP BY Author_ID
    ORDER BY Profit DESC
    LIMIT 3;

# Haciendo join después, es decir, no arrastrando Advance y Royaltyper a lo largo de las tablas
# derivadas, obtengo unos resultados distintos, y no consigo entender por qué... ¿Por qué no me
# hace bien los joins? Socorro!! :_D

SELECT
	SecondTable.Author_ID,
    SUM(t.advance*(ta.royaltyper/100) + SecondTable.Total_Royalties) AS 'Profit'
	FROM (    
		SELECT
			Author_ID,
			Title_ID,
			SUM(Sales_Royalty) as 'Total_Royalties'
			FROM (
				SELECT
					ta.au_id AS 'Author_ID',
					ta.title_id AS 'Title_ID',
					(t.price * s.qty * (t.royalty/100) * (ta.royaltyper/100)) AS 'Sales_Royalty'
					FROM titleauthor as ta
					LEFT JOIN titles as t ON ta.title_id = t.title_id
					RIGHT JOIN sales as s ON ta.title_id = s.title_id
				) AS FirstTable
			GROUP BY Author_ID, Title_ID
	) AS SecondTable
	LEFT JOIN titles as t ON t.title_id = SecondTable.Title_ID
	LEFT JOIN titleauthor as ta ON ta.au_id = SecondTable.Author_ID
    GROUP BY SecondTable.Author_ID
    ORDER BY Profit DESC
    LIMIT 3;

############################################################################################
# Challenge 2 - Alternative Solution
############################################################################################

# Creating MySQL temporary tables:

# Voy a arrastar Advance y Royaltyper también a lo largo de las tablas temporales por el mismo
# asunto que comentaba en el challenge anterior...

# Step 1:
CREATE TEMPORARY TABLE temporal_sales
SELECT
	ta.au_id AS 'Author_ID',
    ta.title_id AS 'Title_ID',
    (t.price * s.qty * (t.royalty/100) * (ta.royaltyper/100)) AS 'Sales_Royalty',
    t.advance as 'Advance',
	ta.royaltyper AS "Royal_Typer"
	FROM titleauthor as ta
	LEFT JOIN titles as t ON ta.title_id = t.title_id
    RIGHT JOIN sales as s ON ta.title_id = s.title_id;

# Step 2
CREATE TEMPORARY TABLE temporal_sales_2
SELECT
	Author_ID,
	Title_ID,
	SUM(Sales_Royalty) as 'Total_Royalties',
    Advance as 'Advance',
	Royal_Typer as 'Royal_Typer'
	FROM temporal_sales
	GROUP BY Author_ID, Title_ID;

# Step 3:
SELECT
	Author_ID,
    SUM( Advance*(Royal_Typer/100) + Total_Royalties) AS 'Profit'
	FROM temporal_sales_2
    GROUP BY Author_ID
    ORDER BY Profit DESC
    LIMIT 3;
    
############################################################################################
# Challenge 3 - Create a permanent table
############################################################################################

CREATE TABLE most_profiting_authors
SELECT
	Author_ID,
    SUM( Advance*(Royal_Typer/100) + Total_Royalties) AS 'Profit'
	FROM temporal_sales_2
    GROUP BY Author_ID
    ORDER BY Profit DESC
    LIMIT 3;

