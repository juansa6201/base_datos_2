
-- 1
 INSERT
	INTO
		`employees`(`employeeNumber`,
		`lastName`,
		`firstName`,
		`extension`,
		`email`,
		`officeCode`,
		`reportsTo`,
		`jobTitle`)
	VALUES (1003,
	'Mare',
	'Juan',
	'x5800',
	'jc@gmail.com',
	'1',
	NULL,
	'President');

SELECT
	*
FROM
	employees;

-- 2
 UPDATE
	employees
SET
	employeeNumber = employeeNumber - 20;
-- Esa querie funciona y actualiza todas las rows, porque el motor la ejecuta sequencialmente el update, por lo que aunque la distancia entre 2 ids es 20 el update ocurre primero en la fila del medio y por lo tanto nunca coliciona.
 UPDATE
	employees
SET
	employeeNumber = employeeNumber + 20;
-- En este caso, cuando la fila del medio actualiza su valor, este es el mismo que la de la tercer fila por lo tanto tanto no puede hacer el update por el constraint de la primary key.

-- 3
 ALTER TABLE
	employees ADD age INT;

ALTER TABLE
	employees ADD CONSTRAINT age CHECK (age >= 16
	AND age <= 70);

-- 5 
 ALTER TABLE
	employees ADD lastUpdate DATETIME;

ALTER TABLE
	employees ADD lastUpdateUser VARCHAR(255);

CREATE TRIGGER before_update_employees 
	BEFORE UPDATE ON employees 
	FOR EACH ROW
BEGIN
	SET NEW.lastUpdate = NOW();
    SET NEW.lastUpdateUser = CURRENT_USER;
END;

UPDATE employees set lastName = 'Phanny' WHERE employeeNumber = 1056;

-- 6

-- ins_film Inserts a new film_text entry, with the same values as the added film.

BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
END

-- upd_film Updates the corresponding existing film_text entry for the updated film. 

BEGIN
    IF (old.title != new.title) OR (old.description != new.description) OR (old.film_id != new.film_id)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
END

-- del_film Deletes the corresponding existing film_text entry for the deleted film. 

BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
END