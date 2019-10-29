SELECT 
	au.au_id as 'AUTHOR ID',au.au_lname as 'LAST NAME',au.au_fname as 'FIRST NAME',p.pub_name as 'PUBLISHER',Count(*) as 'TITLE COUNT'
    FROM titleauthor as ta
    LEFT JOIN titles as t ON t.title_id = ta.title_id
    LEFT JOIN publishers as p ON p.pub_id=t.pub_id
    LEFT JOIN authors as au ON au.au_id=ta.au_id
		GROUP BY p.pub_name, au.au_fname