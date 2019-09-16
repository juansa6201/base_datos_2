DELIMITER $$
CREATE TRIGGER after_rental_insert
	AFTER INSERT ON rental
	FOR EACH ROW
BEGIN
	INSERT INTO rental_audit SET ACTION = 'rented', customer_id= NEW.customer_id, inventory_id = NEW.inventory_id, changedat = NOW();
END $$
DELIMITER ;
 
DELIMITER $$
CREATE TRIGGER after_update AFTER UPDATE ON rental
FOR EACH ROW 
BEGIN
	IF OLD.return_date IS NULL THEN BEGIN
		INSERT INTO rental_audit SET ACTION = 'returned', customer_id= OLD.customer_id, inventory_id = OLD.inventory_id, changedat = NOW();
	END; END IF;
END $$
DELIMITER ;


SELECT c.country, cat.name, COUNT(inv.film_id) FROM country c  
INNER JOIN city ci ON c.country_id = ci.country_id
INNER JOIN address ad ON ad.city_id = ci.city_id
INNER JOIN store st ON ad.address_id = st.address_id
INNER JOIN inventory inv ON inv.store_id=st.store_id
INNER JOIN film f ON inv.film_id=f.film_id
INNER JOIN film_category fc ON f.film_id=fc.film_id 
INNER JOIN category cat ON fc.category_id = cat.category_id GROUP BY cat.category_id, c.country_id ORDER BY c.country_id;

