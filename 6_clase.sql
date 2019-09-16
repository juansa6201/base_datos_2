USE sakila;

 SELECT
	a1.first_name,
	a1.last_name
FROM
	actor a1
WHERE
	a1.last_name IN (
		SELECT
			last_name
		FROM
			actor a2
		WHERE
			a1.last_name = a2.last_name
			AND a1.actor_id <> a2.actor_id
	)
ORDER BY
	last_name;

 SELECT
	a1.first_name,
	a1.last_name
FROM
	actor a1
WHERE
	EXISTS (
		SELECT
			*
		FROM
			film_actor fa
		WHERE
			fa.actor_id IS NULL
	);

 SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	EXISTS (
		SELECT
			customer_id,
			COUNT( inventory_id )
		FROM
			rental r
		GROUP BY
			r.customer_id
		HAVING
			COUNT(r.inventory_id) = 1
	);

 SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	EXISTS (
		SELECT
			customer_id,
			COUNT( inventory_id )
		FROM
			rental r
		GROUP BY
			r.customer_id
		HAVING
			COUNT(r.inventory_id) >1
	);

 SELECT
	DISTINCT first_name,
	last_name
FROM
	actor
WHERE
	actor_id IN (
		SELECT
			actor_id
		FROM
			film_actor
		WHERE
			film_id IN (
				SELECT
					film_id
				FROM
					film
				WHERE
					title LIKE 'BETRAYED REAR'
					OR title LIKE 'CATCH AMISTAD'
			)
	);

 SELECT
	first_name,
	last_name
FROM
	actor
WHERE
	actor_id IN (
		SELECT
			actor_id
		FROM
			film_actor
		WHERE
			film_id IN (
				SELECT
					film_id
				FROM
					film
				WHERE
					title LIKE 'BETRAYED REAR'
			)
			AND film_id NOT IN (
				SELECT
					film_id
				FROM
					film
				WHERE
					title LIKE 'CATCH AMISTAD'
			)
	);

 SELECT
	first_name,
	last_name
FROM
	actor
WHERE
	actor_id IN (
		SELECT
			actor_id
		FROM
			film_actor
		WHERE
			film_id IN (
				SELECT
					film_id
				FROM
					film
				WHERE
					title LIKE 'BETRAYED REAR'
					AND title LIKE 'CATCH AMISTAD'
			)
	);

 SELECT
	first_name,
	last_name
FROM
	actor
WHERE
	actor_id NOT IN (
		SELECT
			actor_id
		FROM
			film_actor
		WHERE
			film_id IN (
				SELECT
					film_id
				FROM
					film
				WHERE
					title LIKE 'BETRAYED REAR'
					OR title LIKE 'CATCH AMISTAD'
			)
	);
