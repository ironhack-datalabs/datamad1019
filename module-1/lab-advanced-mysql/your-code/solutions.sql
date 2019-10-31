#Challenge 1 - Most Profiting Authors
#STEP 1
SELECT 
	titleauthor.au_id AS "AUTHOR ID",
    titleauthor.title_id AS "Title ID",
    titleauthor.royaltyper/100*titles.royalty/100*sales.qty*titles.price AS sales_royalty
	FROM titleauthor
	LEFT JOIN titles ON titles.title_id=titleauthor.title_id
    LEFT JOIN sales ON titles.title_id=sales.title_id
#STEP 2
SELECT 
	titleauthor.au_id AS "AUTHOR ID",
    titleauthor.title_id AS "Title ID",
	titles.advance*titleauthor.royaltyper/100 AS Advance,
    sum(titleauthor.royaltyper/100*titles.royalty/100*sales.qty*titles.price) AS sales_royalty
	FROM titleauthor
	INNER JOIN titles ON titles.title_id=titleauthor.title_id
    INNER JOIN sales ON titles.title_id=sales.title_id
	GROUP BY titleauthor.au_id,titleauthor.title_id, Advance;
#STEP 3
DROP TEMPORARY TABLE royalty;
CREATE TEMPORARY TABLE royalty
SELECT 
	titleauthor.au_id AS "AUTHOR ID",
    titleauthor.title_id AS "Title ID",
	titles.advance*titleauthor.royaltyper/100 AS Advance,
    sum(titleauthor.royaltyper/100*titles.royalty/100*sales.qty*titles.price) AS sales_royalty
	FROM titleauthor
	INNER JOIN titles ON titles.title_id=titleauthor.title_id
    INNER JOIN sales ON titles.title_id=sales.title_id
	GROUP BY titleauthor.au_id,titleauthor.title_id, Advance;
   
SELECT
	"AUTHOR ID",
	sales_royalty+Advance AS PROFIT
    FROM royalty
    ORDER BY PROFIT DESC
    LIMIT 3;

#Challenge 2 - Alternative Solution
SELECT AUTHOR_ID,sales_royalty+Advance AS PROFIT 
FROM
(SELECT 
	titleauthor.au_id AS AUTHOR_ID,
    titleauthor.title_id AS "Title ID",
	titles.advance*titleauthor.royaltyper/100 AS Advance,
    sum(titleauthor.royaltyper/100*titles.royalty/100*sales.qty*titles.price) AS sales_royalty
	FROM titleauthor
	INNER JOIN titles ON titles.title_id=titleauthor.title_id
    INNER JOIN sales ON titles.title_id=sales.title_id
	GROUP BY titleauthor.au_id,titleauthor.title_id, Advance) AS R
	ORDER BY PROFIT DESC
    LIMIT 3;

#Challenge 3
DROP TABLE most_profiting_authors;
CREATE TABLE most_profiting_authors
SELECT AUTHOR_ID,sales_royalty+Advance AS PROFIT 
FROM
(SELECT 
	titleauthor.au_id AS AUTHOR_ID,
    titleauthor.title_id AS "Title ID",
	titles.advance*titleauthor.royaltyper/100 AS Advance,
    sum(titleauthor.royaltyper/100*titles.royalty/100*sales.qty*titles.price) AS sales_royalty
	FROM titleauthor
	INNER JOIN titles ON titles.title_id=titleauthor.title_id
    INNER JOIN sales ON titles.title_id=sales.title_id
	GROUP BY titleauthor.au_id,titleauthor.title_id, Advance) AS R
	ORDER BY PROFIT DESC;