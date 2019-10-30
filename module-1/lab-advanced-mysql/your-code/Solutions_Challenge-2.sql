CREATE TEMPORARY TABLE Tabla1
	SELECT Author_ID,(sum(Sales_royalty)) as Sales_royalty, RoyalTyper, Advance
	FROM (
		SELECT
			t.title_id as Title_ID ,au.au_id as Author_ID,(t.price * sa.qty * t.royalty / 100 * ta.royaltyper / 100) as 'Sales_royalty', t.advance as Advance, ta.royaltyper as RoyalTyper
			FROM titleauthor as ta
			LEFT JOIN titles as t ON t.title_id = ta.title_id
			LEFT JOIN authors as au ON au.au_id = ta.au_id
			LEFT JOIN sales as sa ON sa.title_id = ta.title_id
		) as tabla1
		GROUP BY Author_ID,Title_ID,RoyalTyper

SELECT Author_ID,sum((Sales_royalty+Advance*(RoyalTyper*0.01))) AS Profit
From Tabla1
GROUP BY Author_ID
ORDER BY Profit DESC
LIMIt 3;


