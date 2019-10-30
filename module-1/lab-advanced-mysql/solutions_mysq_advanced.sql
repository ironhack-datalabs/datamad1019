

#Challenge 1

#Step 1 & 2

SELECT 
    titleauthor.au_id AS AUTHOR_ID,
    titleauthor.title_id AS TITLE_ID,
	SUM(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS sales_royalty
FROM titleauthor
    INNER JOIN titles ON titleauthor.title_id=titles.title_id
    INNER JOIN sales ON titles.title_id= sales.title_id
	GROUP BY titleauthor.au_id, titleauthor.title_id

# Other alternative - Descending order royalties
SELECT 
    titleauthor.au_id AS AUTHOR_ID,
    titleauthor.title_id AS TITLE_ID,
	SUM(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS sales_royalty
FROM titleauthor
    INNER JOIN titles ON titleauthor.title_id=titles.title_id
    INNER JOIN sales ON titles.title_id= sales.title_id
	GROUP BY titleauthor.au_id, titleauthor.title_id
ORDER BY sales_royalty DESC


#Step 3
#Descending order profits

SELECT 
    titleauthor.au_id AS AUTHOR_ID,
    titleauthor.title_id AS TITLE_ID,
	SUM((titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) + titles.advance) AS PROFITS
FROM titleauthor
    INNER JOIN titles ON titleauthor.title_id=titles.title_id
    INNER JOIN sales ON titles.title_id= sales.title_id
	GROUP BY titleauthor.au_id, titleauthor.title_id
    ORDER BY PROFITS DESC

#Descending order profits limiting to the best three authors

SELECT 
    titleauthor.au_id AS AUTHOR_ID,
    titleauthor.title_id AS TITLE_ID,
	SUM((titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) + titles.advance) AS PROFITS
FROM titleauthor
    INNER JOIN titles ON titleauthor.title_id=titles.title_id
    INNER JOIN sales ON titles.title_id= sales.title_id
	GROUP BY titleauthor.au_id, titleauthor.title_id
    ORDER BY PROFITS DESC
    LIMIT 3;

#Challenge 2

#Alternative solution 

CREATE TEMPORARY TABLE Temporary_table(
SELECT 
    titleauthor.au_id AS AUTHOR_ID,
    titleauthor.title_id AS TITLE_ID,
	SUM((titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) + titles.advance) AS PROFITS
FROM titleauthor
    INNER JOIN titles ON titleauthor.title_id=titles.title_id
    INNER JOIN sales ON titles.title_id= sales.title_id
	GROUP BY titleauthor.au_id, titleauthor.title_id
    ORDER BY PROFITS DESC
    LIMIT 3);

#Challenge 3

CREATE TABLE Permanent_table(
SELECT 
    titleauthor.au_id AS AUTHOR_ID,
    titleauthor.title_id AS TITLE_ID,
	SUM((titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) + titles.advance) AS PROFITS
FROM titleauthor
    INNER JOIN titles ON titleauthor.title_id=titles.title_id
    INNER JOIN sales ON titles.title_id= sales.title_id
	GROUP BY titleauthor.au_id, titleauthor.title_id
    ORDER BY PROFITS DESC
    LIMIT 3);