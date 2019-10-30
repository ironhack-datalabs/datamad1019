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

--Challenge 4 - Best Selling Authors Ranking

SELECT*
FROM(
SELECT 
au.au_id
,au.au_lname
,au.au_fname
,sum(t4.au_ti_profit) as profit_total
FROM (
SELECT 
ta.au_id
,t3.title_id
,t3.title
,t3.profit AS Ti_Profit
,ta.royaltyper
,Round((ifnull(ta.royaltyper,0)/100)*t3.profit,2) AS au_ti_profit
FROM (
	SELECT 
	t2.title_id
	,t2.title
	,(t2.price*t2.qty*(t2.royalty/100) + t2.advance) AS Profit
FROM (
		SELECT
		t1.title_id
		,t1.title
		,t1.price
		,t1.advance
		,rs.royalty
		,t1.royalty as royalty2
		,t1.ytd_sales
		,t1.qty
FROM 
			(
			SELECT
			ti.title_id
			,ti.title
			,ifnull(ti.price,0) AS price
			,ifnull(ti.advance,0) AS advance
			,ti.royalty
			,ti.ytd_sales
			,SUM(ifnull(ss.qty,0)) AS qty
			FROM titles ti
			LEFT JOIN sales ss ON ti.title_id=ss.title_id
			GROUP BY
			ti.title_id
			,ti.title
			,ifnull(ti.price,0)
			,ifnull(ti.advance,0)
			,ti.royalty
			,ti.ytd_sales
			) t1
		LEFT JOIN roysched rs ON t1.title_id=rs.title_id AND t1.ytd_sales>rs.lorange and t1.ytd_sales<rs.hirange
	) t2
) t3
LEFT JOIN titleauthor ta on t3.title_id=ta.title_id
) t4

INNER JOIN authors au on au.au_id=t4.au_id
GROUP BY
au.au_id
,au.au_lname
,au.au_fname
) T5
ORDER BY T5.profit_Total DESC LIMIT 3

