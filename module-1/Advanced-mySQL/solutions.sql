'''Challenge 1 - Step 1''';

SELECT 
	authors.au_id AS author_id, 
	titles.title AS title,
	(titles.advance * titleauthor.royaltyper / 100) AS advance,
	(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS royalty
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN sales
ON titleauthor.title_id = sales.title_id;

'''Challenge 1 - Step 2''';

SELECT author_id, title, (advance + royalty) AS aggregated
	FROM (SELECT 
	authors.au_id AS author_id, 
	titles.title AS title,
	(titles.advance * titleauthor.royaltyper / 100) AS advance,
	(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS royalty
	FROM authors
	INNER JOIN titleauthor
	ON authors.au_id = titleauthor.au_id
	INNER JOIN titles
	ON titleauthor.title_id = titles.title_id
	INNER JOIN sales
	ON titleauthor.title_id = sales.title_id) summary
GROUP BY author_id, title, advance, royalty;
	
'''Challenge 1 - Step 3''';

SELECT author_id, SUM(aggregated) AS total_profit
FROM(SELECT author_id, title, (advance + royalty) AS aggregated
		FROM (SELECT 
		authors.au_id AS author_id, 
		titles.title AS title,
		(titles.advance * titleauthor.royaltyper / 100) AS advance,
		(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS royalty
		FROM authors
		INNER JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
		INNER JOIN titles
		ON titleauthor.title_id = titles.title_id
		INNER JOIN sales
		ON titleauthor.title_id = sales.title_id) summary
	GROUP BY author_id, title, advance, royalty) summary2
GROUP BY author_id
ORDER BY total_profit DESC;

'''Challenge 2'''

# Still working on these...
	
