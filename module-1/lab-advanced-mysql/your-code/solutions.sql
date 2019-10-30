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


