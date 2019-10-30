--challenge 1

--step1. Primera vía.
SELECT sales.title_id, titleauthor.au_id,  (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as royalties
FROM titleauthor
INNER JOIN sales on titleauthor.title_id=sales.title_id
INNER JOIN titles on titles.title_id=sales.title_id


--step1. Segunda vía.
SELECT sales.title_id, titleauthor.au_id,  (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as royalties, titles.advance, titleauthor.royaltyper
FROM titleauthor
INNER JOIN sales on titleauthor.title_id=sales.title_id
INNER JOIN titles on titles.title_id=sales.title_id
ORDER BY royalties DESC


--step2. Primera vía.
SELECT V.title_id, V.au_id, sum(royalties) as sumaroyalties FROM (SELECT sales.title_id, titleauthor.au_id,  (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as royalties
FROM titleauthor
INNER JOIN sales on titleauthor.title_id=sales.title_id
INNER JOIN titles on titles.title_id=sales.title_id) V
GROUP BY V.au_id, V.title_id

--step2. Segunda vía.
SELECT V.title_id, V.au_id, sum(royalties) as sumaroyalties, V.advance, V.royaltyper FROM (SELECT sales.title_id, titleauthor.au_id,  (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as royalties, titles.advance, titleauthor.royaltyper
FROM titleauthor
INNER JOIN sales on titleauthor.title_id=sales.title_id
INNER JOIN titles on titles.title_id=sales.title_id
ORDER BY royalties DESC) V
GROUP BY V.au_id, V.title_id


--step3. Primera vía.
--Error Code: 1054. Unknown column 'titles.advance' (y tampoco titleauthor.royaltyper) in 'field list'
--Me vi obligado a arrastrar ambas columnas a lo largo de los pasos. De ahí la segunda vía.
SELECT W.au_id, (W.sumaroyalties + titles.advance*titleauthor.royaltyper/100) as sumatotal FROM (SELECT V.title_id, V.au_id, sum(royalties) as sumaroyalties FROM (SELECT sales.title_id, titleauthor.au_id,  (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as royalties
FROM titleauthor
INNER JOIN sales on titleauthor.title_id=sales.title_id
INNER JOIN titles on titles.title_id=sales.title_id) V
GROUP BY V.au_id, V.title_id) W
ORDER BY sumatotal DESC
LIMIT 3
--step3. Segunda vía.
SELECT W.au_id, (W.sumaroyalties + W.advance*W.royaltyper/100) as sumatotal FROM (SELECT V.title_id, V.au_id, sum(royalties) as sumaroyalties, V.advance, V.royaltyper FROM (SELECT sales.title_id, titleauthor.au_id,  (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as royalties, titles.advance, titleauthor.royaltyper
FROM titleauthor
INNER JOIN sales on titleauthor.title_id=sales.title_id
INNER JOIN titles on titles.title_id=sales.title_id
ORDER BY royalties DESC) V
GROUP BY V.au_id, V.title_id) W
ORDER BY sumatotal DESC
LIMIT 3

--Challenge 2

--Creo la temporary table
CREATE TEMPORARY TABLE title_author_royalty
SELECT sales.title_id, titleauthor.au_id,  (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as royalties
FROM titleauthor
INNER JOIN sales on titleauthor.title_id=sales.title_id
INNER JOIN titles on titles.title_id=sales.title_id
--Calculo sobre ella
SELECT title_author_royalty.title_id, title_author_royalty.au_id, sum(royalties) as sumaroyalties FROM title_author_royalty
GROUP BY title_author_royalty.au_id, title_author_royalty.title_id
--Creo la siguiente
CREATE TEMPORARY TABLE title_author_sum_profit
SELECT title_author_royalty.title_id, title_author_royalty.au_id, sum(royalties) as sumaroyalties FROM title_author_royalty
GROUP BY title_author_royalty.au_id, title_author_royalty.title_id
--Calculo sobre ella
--Me sale el mismo error que en la "primera vía" del Challenge 1. No sé qué os aparecerá en vuestros ordenadores.
--Tendría que hacer las temporary tables incluyendo siempre titles.advance y titleauthor.royaltyper.
SELECT title_author_sum_profit.au_id, (title_author_sum_profit.sumaroyalties + titles.advance*titleauthor.royaltyper/100) as sumatotal FROM title_author_sum_profit
ORDER BY sumatotal DESC
LIMIT 3



--Temporary Table arrastrando las malditas variables
CREATE TEMPORARY TABLE title_author_royalty1
SELECT sales.title_id, titleauthor.au_id,  (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as royalties, titles.advance, titleauthor.royaltyper
FROM titleauthor
INNER JOIN sales on titleauthor.title_id=sales.title_id
INNER JOIN titles on titles.title_id=sales.title_id
--Segunda Temp Table arrastrando las malditas variables
CREATE TEMPORARY TABLE title_author_sum_profit1
SELECT title_author_royalty1.title_id, title_author_royalty1.au_id, sum(royalties) as sumaroyalties, title_author_royalty1.advance, title_author_royalty1.royaltyper FROM title_author_royalty1
GROUP BY title_author_royalty1.au_id, title_author_royalty1.title_id
--Final
SELECT title_author_sum_profit1.au_id, (title_author_sum_profit1.sumaroyalties + title_author_sum_profit1.advance*title_author_sum_profit1.royaltyper/100) as sumatotal FROM title_author_sum_profit1
ORDER BY sumatotal DESC
LIMIT 3

--challenge 3
CREATE TABLE Tabla_Permanente(
SELECT title_author_sum_profit1.au_id as Author,
(title_author_sum_profit1.sumaroyalties + title_author_sum_profit1.advance*title_author_sum_profit1.royaltyper/100) as Profits
FROM title_author_sum_profit1
ORDER BY Profits DESC);



--bonus con authors. Única duda: si agrupo por authors o por authors y título
SELECT authors.au_id, authors.au_lname, authors.au_fname, sum(titles.advance * (titleauthor.royaltyper/100)+ titleauthor.royaltyper/100*titles.price*sales.qty*titles.royalty/100) as pago
FROM authors 
INNER JOIN titleauthor ON titleauthor.au_id=authors.au_id
INNER JOIN titles ON titles.title_id=titleauthor.title_id
INNER JOIN sales ON titles.title_id=sales.title_id
GROUP BY authors.au_id, titles.title_id
ORDER BY pago DESC
LIMIT 3
--mi bonus actualizado según la chavala
SELECT titleauthor.au_id, titleauthor.title_id, sum(titles.advance * (titleauthor.royaltyper/100)+ titleauthor.royaltyper/100*titles.price*sales.qty*titles.royalty/100) as profits
FROM titleauthor 
INNER JOIN titles ON titles.title_id=titleauthor.title_id
INNER JOIN sales ON titles.title_id=sales.title_id
GROUP BY titleauthor.au_id, titleauthor.title_id
ORDER BY profits DESC
LIMIT 3
