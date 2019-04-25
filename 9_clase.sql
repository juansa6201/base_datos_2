-- 1
SELECT
	COUNT(*)
FROM
	city
WHERE
	country_id IN (
		SELECT
			country_id
		FROM
			country
	)
GROUP BY
	country_id;

-- 2
 SELECT
	COUNT(country),
	country
FROM
	country co
INNER JOIN city c ON
	c.country_id = co.country_id
GROUP BY
	country
HAVING
	COUNT(*)>10
ORDER BY
	COUNT(country) DESC;

-- Mismo que el anterior pero usando subqueries	
 SELECT
	COUNT(*) AS c
FROM
	city
WHERE
	country_id IN (
		SELECT
			country_id
		FROM
			country
	)
GROUP BY
	country_id
HAVING
	c>10
ORDER BY
	c DESC;

-- 3
 SELECT
	c.first_name,
	c.last_name,
	(
		SELECT
			COUNT(*)
		FROM
			rental r
		WHERE
			r.customer_id = c.customer_id
	) AS 'max',
	(
		SELECT
			SUM(amount)
		FROM
			payment p
		WHERE
			p.customer_id = c.customer_id
	) AS 'max_pay'
FROM
	customer c
ORDER BY
	max_pay DESC;

-- 4
 SELECT
	AVG( f.`length` ) av,
	c.name
FROM
	film f
INNER JOIN film_category fc ON
	f.film_id = fc.film_id
INNER JOIN category c ON
	fc.category_id = c.category_id
GROUP BY
	c.name
HAVING
	av>(
		SELECT
			AVG( `length` )
		FROM
			film
	)
ORDER BY
	av DESC;

-- 5
 SELECT
	f.rating,
	SUM(p.amount) su
FROM
	film f
INNER JOIN inventory i
		USING (film_id)
INNER JOIN rental r
		USING (inventory_id)
INNER JOIN payment p
		USING (rental_id)
GROUP BY
	f.rating
ORDER BY
	su DESC;
