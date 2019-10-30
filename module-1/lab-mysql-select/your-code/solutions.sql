--challenge 1
SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM authors 
INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
INNER JOIN titles ON titles.title_id=titleauthor.title_id
INNER JOIN publishers ON publishers.pub_id=titles.pub_id
--lo compruebo así:
SELECT count(*) FROM (SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM authors 
INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
INNER JOIN titles ON titles.title_id=titleauthor.title_id
INNER JOIN publishers ON publishers.pub_id=titles.pub_id) F


--challenge 2
-- devuélveme el número de títulos agrupados por autores por editorial. Revisar el count(*). Lo que he escrito te cuenta los resultados distintos (aquí daría igual porque estamos con títulos únicos)
SELECT authors.au_id, authors.au_lname, authors.au_fname, count(titles.title) as titlescount, publishers.pub_name
FROM authors 
INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
INNER JOIN titles ON titles.title_id=titleauthor.title_id
INNER JOIN publishers ON publishers.pub_id=titles.pub_id
GROUP BY publishers.pub_name, authors.au_id
-- lo compruebo así:
SELECT sum(titlescount) FROM (SELECT authors.au_id, authors.au_lname, authors.au_fname, count(titles.title) as titlescount, publishers.pub_name
FROM authors 
INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
INNER JOIN titles ON titles.title_id=titleauthor.title_id
INNER JOIN publishers ON publishers.pub_id=titles.pub_id
GROUP BY publishers.pub_name, authors.au_id) F


--challenge 3
SELECT authors.au_id, authors.au_lname, authors.au_fname,  sum(sales.qty)
FROM authors 
INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
INNER JOIN sales ON titleauthor.title_id=sales.title_id
GROUP BY authors.au_id
ORDER BY sum(sales.qty) DESC
LIMIT 3


--challenge 4
SELECT v.au_id, v.au_lname, v.au_fname, COALESCE(v.ventas, 0) as nuevasventas FROM (SELECT authors.au_id, authors.au_lname, authors.au_fname,  sum(sales.qty) ventas
FROM authors 
LEFT JOIN titleauthor ON authors.au_id=titleauthor.au_id
LEFT JOIN sales ON titleauthor.title_id=sales.title_id
GROUP BY authors.au_id
ORDER BY ventas DESC) v


--bonus con authors. Única duda: si agrupo por authors o por authors y título. Aunque igualmente no alcanzo
--los mismos resultados que en el lab advanced. No todo va a ser follar.
SELECT authors.au_id, authors.au_lname, authors.au_fname, sum(titles.advance * (titleauthor.royaltyper/100)+ titleauthor.royaltyper/100*titles.price*sales.qty*titles.royalty/100) as pago
FROM authors 
INNER JOIN titleauthor ON titleauthor.au_id=authors.au_id
INNER JOIN titles ON titles.title_id=titleauthor.title_id
INNER JOIN sales ON titles.title_id=sales.title_id
GROUP BY authors.au_id, titles.title_id
ORDER BY pago DESC
LIMIT 3
--bonus sin authors. Mismas dudas. 
SELECT titleauthor.au_id, titleauthor.title_id, sum(titles.advance * (titleauthor.royaltyper/100)+ titleauthor.royaltyper/100*titles.price*sales.qty*titles.royalty/100) as profits
FROM titleauthor 
INNER JOIN titles ON titles.title_id=titleauthor.title_id
INNER JOIN sales ON titles.title_id=sales.title_id
GROUP BY titleauthor.au_id, titleauthor.title_id
ORDER BY profits DESC
LIMIT 3