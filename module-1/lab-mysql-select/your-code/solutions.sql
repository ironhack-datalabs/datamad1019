# challenge 1

SELECT *
FROM authors AS a
INNER JOIN titleauthor AS ta ON a.au_id = ta.au_id
INNER JOIN titles AS t ON t.title_id = ta.title_id
INNER JOIN publishers AS p ON p.pub_id = t.pub_id 


#challenge 2

SELECT au_fname as Nombre, au_lname as Apellido, pub_name as Editorial, count(*) as Total_titulos
FROM authors AS a
INNER JOIN titleauthor AS ta ON a.au_id = ta.au_id
INNER JOIN titles AS t ON t.title_id = ta.title_id
INNER JOIN publishers AS p ON p.pub_id = t.pub_id 
GROUP BY t.pub_id, a.au_id



#challenge 3

