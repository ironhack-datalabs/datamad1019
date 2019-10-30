#### CHALLENGE 1

  SELECT 
  lab2.au_id, SUM(T_ROYALTY)
  FROM (
  	SELECT lab1.au_id, lab1.title_id, SUM(ROYALTY) AS T_ROYALTY
  	FROM (
  		SELECT t.title_id, au.au_id, t.advance + t.price * sa.qty * t.royalty / 100 * ta.royaltyper / 100 AS ROYALTY
  		FROM titles AS t
 		LEFT JOIN titleauthor AS ta ON t.title_id=ta.title_id
 		LEFT JOIN authors AS au ON ta.au_id=au.au_id
  		LEFT JOIN sales AS sa ON t.title_id=sa.title_id
  		) AS lab1
  	GROUP BY lab1.au_id, lab1.title_id
  ) AS lab2
  GROUP BY lab2.au_id
  LIMIT 3;

#### CHALLENGE 2: ALTERNATIVE SOLUTION


DROP TABLE IF EXISTS part1;
CREATE TEMPORARY TABLE part1
   	SELECT t.title_id, au.au_id, t.advance+ t.price * sa.qty * t.royalty / 100 * ta.royaltyper / 100 AS ROYALTY
   	FROM titles AS t
   	LEFT JOIN titleauthor AS ta ON t.title_id=ta.title_id
	LEFT JOIN authors AS au ON ta.au_id=au.au_id
	LEFT JOIN sales AS sa ON t.title_id=sa.title_id;     


DROP TABLE IF EXISTS part2;
CREATE TEMPORARY TABLE part2
  	SELECT part1.au_id, part1.title_id, SUM(ROYALTY) AS T_ROYALTY
   	FROM part1
  	GROUP BY part1.au_id, part1.title_id;


DROP TABLE IF EXISTS part3;
CREATE TEMPORARY TABLE part3
  	SELECT part2.au_id, SUM(T_ROYALTY)
  	FROM part2
  	GROUP BY part2.au_id
  	LIMIT 3;
    
SELECT * FROM part3;


#### CHALLENGE 3
    
CREATE TABLE most_profiting_authors
  SELECT 
  lab2.au_id, SUM(T_ROYALTY)
  FROM (
  	SELECT lab1.au_id, lab1.title_id, SUM(ROYALTY) AS T_ROYALTY
  	FROM (
  		SELECT t.title_id, au.au_id, t.advance + t.price * sa.qty * t.royalty / 100 * ta.royaltyper / 100 AS ROYALTY
  		FROM titles AS t
 		LEFT JOIN titleauthor AS ta ON t.title_id=ta.title_id
 		LEFT JOIN authors AS au ON ta.au_id=au.au_id
  		LEFT JOIN sales AS sa ON t.title_id=sa.title_id
  		) AS lab1
  	GROUP BY lab1.au_id, lab1.title_id
  ) AS lab2
  GROUP BY lab2.au_id
  LIMIT 3