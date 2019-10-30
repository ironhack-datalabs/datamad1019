#STEP1
CREATE TEMPORARY TABLE table_step1

SELECT 
		authors.au_id as 'AUTHOR_ID', 
		titles.title_id AS 'TITLE_ID',       
        (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as 'ROYALTY'
       
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN sales ON titles.title_id = sales.title_id

#STEP2

CREATE TEMPORARY TABLE table_step2

SELECT 
		table_step1.AUTHOR_ID, 
		table_step1.TITLE_ID,       
        SUM(ROYALTY) as 'TOTAL_ROYALTIES'
       
FROM table_step1
GROUP BY table_step1.AUTHOR_ID, table_step1.TITLE_ID

#STEP3
SELECT 
		table_step2.AUTHOR_ID, 
		SUM((titles.advance*titleauthor.royaltyper/100)+ table_step2.TOTAL_ROYALTIES) as 'PROFIT'
       
FROM table_step2
LEFT JOIN titles ON titles.title_id = table_step2.TITLE_ID
LEFT JOIN titleauthor ON titles.title_id = titleauthor.title_id
GROUP BY table_step2.AUTHOR_ID;

