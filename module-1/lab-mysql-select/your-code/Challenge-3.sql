SELECT
	au.au_id,au.au_lname,au.au_fname,sum(sa.qty) as 'Total'
    FROM titleauthor as ta
    LEFT JOIN titles as t ON t.title_id = ta.title_id
    LEFT JOIN authors as au ON au.au_id = ta.au_id
    LEFT JOIN sales as sa ON sa.title_id = ta.title_id
		GROUP BY au.au_id
        ORDER BY Total DESC
        LIMIT 3
        