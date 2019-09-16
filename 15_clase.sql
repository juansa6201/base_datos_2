-- 1
CREATE
	OR REPLACE VIEW list_of_customers AS SELECT
		c.customer_id,
		CONCAT_WS( ' ', c.first_name, c.last_name ) AS full_name,
		a.address,
		a.postal_code,
		a.phone,
		ci.city,
		co.country,
		IF (
			c.active = 1,
			'active',
			'inactive'
		),
		c.store_id
	FROM
		customer c
	INNER JOIN address a ON
		c.address_id = a.address_id
	INNER JOIN city ci ON
		a.city_id = ci.city_id
	INNER JOIN country co ON
		co.country_id = ci.country_id;

 SELECT
	*
FROM
	list_of_customers;

 -- 2
CREATE
	OR REPLACE VIEW film_details AS SELECT
		f.film_id,
		f.title,
		f.description,
		ca.name,
		f.rental_rate,
		f.`length`,
		f.rating,
		GROUP_CONCAT(
			a.first_name,
			a.last_name
		)
	FROM
		film f
	INNER JOIN film_category fc ON
		f.film_id = fc.film_id
	INNER JOIN category ca ON
		ca.category_id = fc.category_id
	INNER JOIN film_actor fa ON
		fa.film_id = f.film_id
	INNER JOIN actor a ON
		a.actor_id = fa.actor_id
	GROUP BY
		f.film_id,
		ca.name;

 SELECT
	*
FROM
	film_details;

-- 3
SELECT
	*
FROM
	sales_by_film_category;

-- 4
 CREATE
	OR REPLACE VIEW actor_information AS SELECT
		a.actor_id,
		a.first_name,
		a.last_name,
		SUM(fa.film_id)
	FROM
		actor a
	INNER JOIN film_actor fa ON
		a.actor_id = fa.actor_id
	GROUP BY
		a.actor_id;

 SELECT
	*
FROM
	actor_information;

-- 5 
SELECT
	*
FROM
	actor_info;

-- actor_info trae los actores y todas sus peliculas por categoria en las que actuo.