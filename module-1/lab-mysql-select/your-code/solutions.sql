# challenge 1

SELECT *
FROM authors AS a
INNER JOIN titleauthor AS ta ON a.au_id = ta.au_id
INNER JOIN titles AS t ON t.title_id = ta.title_id
INNER JOIN publishers AS p ON p.pub_id = t.pub_id 


#challenge 2

SELECT au_lname, count(title)
FROM authors AS a
INNER JOIN titleauthor AS ta ON a.au_id = ta.au_id
INNER JOIN titles AS t ON t.title_id = ta.title_id
INNER JOIN publishers AS p ON p.pub_id = t.pub_id 
GROUP BY au_lname

#challenge 3

SELECT au_fname,qty
FROM authors AS a
INNER JOIN titleauthor AS ta ON a.au_id = ta.au_id
INNER JOIN titles AS t ON t.title_id = ta.title_id
INNER JOIN sales as s ON s.title_id = ta.title_id
ORDER BY qty desc