-- CHALLENGE 1

-- Step 1

SELECT
	au.au_id AS AUTHOR_ID, t.title_id AS TITLE_ID,(t.price * sa.qty * t.royalty / 100 * tia.royaltyper / 100) as Sales_Royalty
    FROM titleauthor AS tia
    LEFT JOIN titles AS t ON t.title_id = tia.title_id
    RIGHT JOIN authors AS au ON au.au_id = tia.au_id
    LEFT JOIN sales AS sa on t.title_id = sa.title_id

-- Step 2

SELECT 
	AUTHOR_ID, TITLE_ID, SUM(Sales_Royalty) as Sales_Royalty
    from (
SELECT
	au.au_id AS AUTHOR_ID, t.title_id AS TITLE_ID,(t.price * sa.qty * t.royalty / 100 * tia.royaltyper / 100) as Sales_Royalty
    FROM titleauthor AS tia
    LEFT JOIN titles AS t ON t.title_id = tia.title_id
    RIGHT JOIN authors AS au ON au.au_id = tia.au_id
    LEFT JOIN sales AS sa on t.title_id = sa.title_id) AS x
GROUP BY AUTHOR_ID, TITLE_ID

-- Step 3
SELECT
	AUTHOR_ID, round(((ADVANCE*(RY*0.01))+ Sales_Royalty),2) as PROFIT
    FROM (SELECT 
	AUTHOR_ID, TITLE_ID, SUM(Sales_Royalty) as Sales_Royalty, ADVANCE, RY
    from (
SELECT
	au.au_id AS AUTHOR_ID, t.title_id AS TITLE_ID,(t.price * sa.qty * t.royalty / 100 * tia.royaltyper / 100) as Sales_Royalty, t.advance as ADVANCE, tia.royaltyper AS RY
    FROM titleauthor AS tia
    LEFT JOIN titles AS t ON t.title_id = tia.title_id
    RIGHT JOIN authors AS au ON au.au_id = tia.au_id
    LEFT JOIN sales AS sa on t.title_id = sa.title_id) AS x
GROUP BY AUTHOR_ID, TITLE_ID, RY) Y
ORDER BY PROFIT DESC
LIMIT 3

-- CHALLENGE 2

CREATE TEMPORARY TABLE t1
 SELECT 
	AUTHOR_ID, TITLE_ID, round(SUM(Sales_Royalty),2) as Sales_Royalty, ADVANCE, RY
    from (
SELECT
	au.au_id AS AUTHOR_ID, t.title_id AS TITLE_ID,(t.price * sa.qty * t.royalty / 100 * tia.royaltyper / 100) as Sales_Royalty, t.advance as ADVANCE, tia.royaltyper AS RY
    FROM titleauthor AS tia
    LEFT JOIN titles AS t ON t.title_id = tia.title_id
    RIGHT JOIN authors AS au ON au.au_id = tia.au_id
    LEFT JOIN sales AS sa on t.title_id = sa.title_id) AS x
GROUP BY AUTHOR_ID, TITLE_ID, RY;

SELECT
	AUTHOR_ID, ((ADVANCE*(RY*0.01))+ Sales_Royalty) as PROFIT
    FROM t1
ORDER BY PROFIT DESC
LIMIT 3


-- CHALLENGE 3

create table most_profiting_authors
AS (SELECT
	AUTHOR_ID, round(((ADVANCE*(RY*0.01))+ Sales_Royalty),2) as PROFIT
    FROM (SELECT 
	AUTHOR_ID, TITLE_ID, SUM(Sales_Royalty) as Sales_Royalty, ADVANCE, RY
    from (
SELECT
	au.au_id AS AUTHOR_ID, t.title_id AS TITLE_ID,(t.price * sa.qty * t.royalty / 100 * tia.royaltyper / 100) as Sales_Royalty, t.advance as ADVANCE, tia.royaltyper AS RY
    FROM titleauthor AS tia
    LEFT JOIN titles AS t ON t.title_id = tia.title_id
    RIGHT JOIN authors AS au ON au.au_id = tia.au_id
    LEFT JOIN sales AS sa on t.title_id = sa.title_id) AS x
GROUP BY AUTHOR_ID, TITLE_ID, RY) Y
ORDER BY PROFIT DESC)