---Lab | Advanced MySQL

--Challenge 1 - Most Profiting Authors

--
-- Royalty per Title Calculation
--
CREATE TEMPORARY TABLE royalty_per_tit_id_2
SELECT
title_id
,qty
,royalty_pc
,price
,SUM(qty*price*royalty_PC/100) AS royalty
FROM (
SELECT DISTINCT
ti.title_id
,SUM(ifnull(ss.qty,0)) AS qty
,ifnull(ti.royalty,0) AS royalty_pc
,ifnull(ti.price,0) AS price
FROM titles ti
LEFT JOIN sales ss ON ti.title_id=ss.title_id
GROUP BY 
ti.title_id
,ifnull(ti.royalty,0)
,ifnull(ti.price,0)
) T1
GROUP BY
title_id
,qty
,royalty_pc
,price
;


--
-- Royalty per Author (title_id) Calculation
--
CREATE TEMPORARY TABLE royalty_auth_title_2
SELECT 
ta.au_id
,ta.title_id
,ta.royaltyper
,rpt.royalty AS royalty_title
,Round((ifnull(ta.royaltyper,0)/100)*rpt.royalty,2) AS au_ti_royalty
FROM titleauthor ta 
LEFT JOIN royalty_per_tit_id_2 rpt on ta.title_id=rpt.title_id

--
-- Advance per Author (title_id) Calculation
--
CREATE TEMPORARY TABLE Advance_auth_tit_3
SELECT 
ta.au_id
,ta.title_id
,rat.royaltyper
,tt.advance
,Round((ifnull(rat.royaltyper,0)/100)*tt.advance,2) AS au_ti_advance
FROM titleauthor ta
LEFT JOIN (SELECT DISTINCT royaltyper, au_id, title_id from royalty_auth_title_2) rat on ta.title_id=rat.title_id AND ta.au_id=rat.au_id
LEFT JOIN titles tt on ta.title_id=tt.title_id


-- Final Select with titleauthor
SELECT *
FROM (
SELECT
ta.au_id
,a.au_lname
,a.au_fname
,sum(rat.au_ti_royalty) AS Royalty
,sum(aat.au_ti_advance) AS Advance
,sum(aat.au_ti_advance)+sum(rat.au_ti_royalty) AS Profit
FROM titleauthor ta
LEFT JOIN authors a ON ta.au_id=a.au_id
LEFT JOIN royalty_auth_title_2 rat ON ta.au_id=rat.au_id AND ta.title_id=rat.title_id
LEFT JOIN Advance_auth_tit_3 aat on ta.au_id=aat.au_id AND ta.title_id=aat.title_id
GROUP BY 
ta.au_id
,a.au_lname
,a.au_fname
) T1
ORDER BY profit Desc

--Challenge 2 - Alternative Selection
-- Pasting sql code from Bonus quetion from previous lab where I used derivative tables

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

--Challenge 3


