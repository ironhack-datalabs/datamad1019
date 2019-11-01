#1 CHALLENGE

SELECT au.au_id, pub.pub_name, COUNT(t.title_id) AS titles_count CONCAT(concat(au.au_fname,' ', au.au_lname))
    FROM titleauthor AS ta
    INNER JOIN authors AS au ON ta.au_id=au.au_id
    INNER JOIN titles AS t ON t.title_id=ta.title_id
    INNER JOIN publishers AS pub ON pub.pub_id=t.pub_id
    GROUP BY t.title_id

#2 CHALLENGE

SELECT 
 pub.pub_name, au.au_id, CONCAT(concat(au.au_fname,' ', au.au_lname)),
COUNT(t.title_id) AS titles_count 
FROM titleauthor AS ta
INNER JOIN authors AS au ON ta.au_id=au.au_id
INNER JOIN titles AS t ON t.title_id=ta.title_id
INNER JOIN publishers AS pub ON pub.pub_id=t.pub_id
GROUP BY pub.pub_name, au.au_id;

'to check if the output is right'

SELECT SUM(titles_count)
FROM (SELECT 
 pub.pub_name, au.au_id, CONCAT(concat(au.au_fname,' ', au.au_lname)),
COUNT(t.title_id) AS titles_count 
FROM titleauthor AS ta
INNER JOIN authors AS au ON ta.au_id=au.au_id
INNER JOIN titles AS t ON t.title_id=ta.title_id
INNER JOIN publishers AS pub ON pub.pub_id=t.pub_id
GROUP BY pub.pub_name, au.au_id) summing;

#3 CHALLENGE

SELECT 
au.au_id, CONCAT(concat(au.au_fname,' ', au.au_lname)),
SUM(sa.qty) AS TOTAL
FROM titleauthor AS ta
INNER JOIN authors AS au ON ta.au_id=au.au_id
INNER JOIN titles AS t ON t.title_id=ta.title_id
INNER JOIN sales AS sa ON t.title_id=sa.title_id
GROUP BY au.au_id
ORDER BY TOTAL DESC
LIMIT 3;

#4 CHALLENGE

SELECT 
au.au_id, CONCAT(concat(au.au_fname,' ', au.au_lname)),
IFNULL(SUM(sa.qty), 0) AS TOTAL
FROM titleauthor AS ta
RIGHT JOIN authors AS au ON ta.au_id=au.au_id
LEFT JOIN titles AS t ON t.title_id=ta.title_id
LEFT JOIN sales AS sa ON t.title_id=sa.title_id
GROUP BY au.au_id
ORDER BY TOTAL DESC;

#BONUS CHALLENGE

SELECT 
au.au_id, CONCAT(concat(au.au_fname,' ', au.au_lname)),
SUM((t.advance*(ta.royaltyper/100)) + ((t.royalty/100)*t.ytd_sales*t.price*(ta.royaltyper/100))) AS PROFIT
FROM titleauthor AS ta
INNER JOIN authors AS au ON ta.au_id=au.au_id
INNER JOIN titles AS t ON t.title_id=ta.title_id
GROUP BY au.au_id
ORDER BY PROFIT DESC
LIMIT 3;