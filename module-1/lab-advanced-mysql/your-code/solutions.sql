# Challenge 1
## Step 1

CREATE TEMPORARY TABLE t1
SELECT 
	titles.title_id AS "Title ID", authors.au_id AS "Author ID", (titles.price*sales.qty*titles.royalty/100)*(titleauthor.royaltyper/100) AS "Royalty"
    

FROM authors

LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id 
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN sales ON titles.title_id = sales.title_id


##Step 2

CREATE TEMPORARY TABLE t2
SELECT 
	t1.title_id, t1_au_id, SUM(Royalty) AS "Royalties"

FROM t1
GROUP BY t1.title_id, t1.author_id;


##Step 3


