#Challange 1
#Step 1
SELECT publications.titles.title_id, publications.authors.au_id, 
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS sales_royalty
FROM publications.authors
INNER JOIN publications.titleauthor ON publications.titleauthor.au_id = publications.authors.au_id
INNER JOIN publications.titles ON publications.titles.title_id = publications.titleauthor.title_id
INNER JOIN publications.sales ON publications.sales.title_id = publications.titles.title_id;

#Step 2
SELECT autorID, tituloID, sum(sales_royalty) FROM (
		SELECT publications.titles.title_id as tituloID, publications.authors.au_id as autorID, 
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS sales_royalty
FROM publications.authors
INNER JOIN publications.titleauthor ON publications.titleauthor.au_id = publications.authors.au_id
INNER JOIN publications.titles ON publications.titles.title_id = publications.titleauthor.title_id
INNER JOIN publications.sales ON publications.sales.title_id = publications.titles.title_id
	) AS LOQUESEA
	GROUP BY autorID, tituloID;

#Step 3
SELECT autorID, sum(advance*(royaltyper/100) + sales_sum) as profit
FROM ( 
SELECT autorID, tituloID, sum(sales_royalty) as sales_sum,
advance, royaltyper
FROM (
		SELECT publications.titles.title_id as tituloID, publications.authors.au_id as autorID, 
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS sales_royalty,
titles.advance as advance, titleauthor.royaltyper as royaltyper
FROM publications.authors
INNER JOIN publications.titleauthor ON publications.titleauthor.au_id = publications.authors.au_id
INNER JOIN publications.titles ON publications.titles.title_id = publications.titleauthor.title_id
INNER JOIN publications.sales ON publications.sales.title_id = publications.titles.title_id
	) AS LOQUESEA
	GROUP BY autorID, tituloID) as NUEVOLOQUESEA
GROUP BY autorID
ORDER BY Profit DESC
LIMIT 3;

#Challange 2
#step1
CREATE TEMPORARY TABLE temporal_sales
SELECT publications.titles.title_id, publications.authors.au_id, 
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS sales_royalty
FROM publications.authors
INNER JOIN publications.titleauthor ON publications.titleauthor.au_id = publications.authors.au_id
INNER JOIN publications.titles ON publications.titles.title_id = publications.titleauthor.title_id
INNER JOIN publications.sales ON publications.sales.title_id = publications.titles.title_id;

#step2
CREATE TEMPORARY TABLE temporal_sales_2
SELECT autorID, tituloID, sum(sales_royalty) 
FROM temporal_sales
GROUP BY autorID, tituloID;

#step3
SELECT autorID, sum(advance*(royaltyper/100) + sales_sum) as profit
FROM temporal_sales_2
GROUP BY autorID
ORDER BY Profit DESC
LIMIT 3;

#Challange 3
