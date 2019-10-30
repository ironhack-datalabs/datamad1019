--Challenge 1 - Who Have Published What At Where?

SELECT
au.au_id AS AUTHOR_ID
,au.au_lname AS LAST_NAME
,au.au_fname AS FIRST_NAME
,ti.title AS TITLE
,pb.pub_name AS Pubisher 

FROM Lab_mysql_select.titleauthor ta 
LEFT JOIN Lab_mysql_select.authors au ON au.au_id=ta.au_id
LEFT JOIN Lab_mysql_select.titles ti ON ta.title_id=ti.title_id
LEFT JOIN Lab_mysql_select.publishers pb ON ti.pub_id=pb.pub_id

--Challenge 2 - Who Have Published How Many At Where?
SELECT
au.au_id AS AUTHOR_ID
,au.au_lname AS LAST_NAME
,au.au_fname AS FIRST_NAME
,pb.pub_name AS Publisher 
,count(ti.title) AS TITLE_Count

FROM Lab_mysql_select.titleauthor ta 
LEFT JOIN Lab_mysql_select.authors au ON au.au_id=ta.au_id
LEFT JOIN Lab_mysql_select.titles ti ON ta.title_id=ti.title_id
LEFT JOIN Lab_mysql_select.publishers pb ON ti.pub_id=pb.pub_id

GROUP BY
au.au_id
,au.au_lname
,au.au_fname
,pb.pub_name

--Challenge 3 - Best Selling Authors

SELECT *
FROM
(SELECT
au.au_id AS AUTHOR_ID
,au.au_lname AS LAST_NAME
,au.au_fname AS FIRST_NAME
,count(ti.title) AS TITLE_Count

FROM Lab_mysql_select.titleauthor ta 
LEFT JOIN Lab_mysql_select.authors au ON au.au_id=ta.au_id
LEFT JOIN Lab_mysql_select.titles ti ON ta.title_id=ti.title_id

GROUP BY
au.au_id
,au.au_lname
,au.au_fname) T1
ORDER BY TITLE_Count DESC LIMIT 3

--Challenge 4 - Best Selling Authors Ranking

SELECT 
AUTHOR_ID
,LAST_NAME
,FIRST_NAME
,IFNULL(TITLE_Count,0) AS TITLE_Count
FROM
(SELECT
au.au_id AS AUTHOR_ID
,au.au_lname AS LAST_NAME
,au.au_fname AS FIRST_NAME
,count(ti.title) AS TITLE_Count

FROM Lab_mysql_select.titleauthor ta 
LEFT JOIN Lab_mysql_select.authors au ON au.au_id=ta.au_id
LEFT JOIN Lab_mysql_select.titles ti ON ta.title_id=ti.title_id

GROUP BY
au.au_id
,au.au_lname
,au.au_fname) T1
ORDER BY TITLE_Count DESC