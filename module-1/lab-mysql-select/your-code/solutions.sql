SELECT au.au_id as 'AUTHOR ID',
au.au_lname as 'LAST NAME', 
au.au_fname as 'FIRST NAME', 
ti.title as 'TITLE',
pu.pub_name as 'PUBLISHER'
FROM authors au
LEFT JOIN titleauthor ta on ta.au_id = au.au_id 
LEFT JOIN titles ti on ti.title_id = ta.title_id 
LEFT JOIN publishers pu on pu.pub_id = ti.pub_id 
