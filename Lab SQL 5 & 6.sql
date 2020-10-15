/* Lab | SQL Queries 5 */

--  Drop column picture from staff.
ALTER TABLE staff
DROP picture;

--  A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
INSERT INTO staff VALUES ('3', 'Tammy', 'Sanders', '5', 'Tammy.Sanders@sakilastaff.com', '2', '1', 'Tammy', 'passwordtest', '2020-10-14')

-- Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1 today.
INSERT INTO rental VALUES ('111002', '2020-10-14', '1', '130', '2020-10-20', '1', '2020-10-14')

-- Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date the user was deleted.

CREATE TABLE deleted_user AS (SELECT customer_id, email, create_date, active
                              FROM sakila.customer
                              WHERE active=0);

DELETE FROM sakila.customer
WHERE active=0                             
              

/* Lab | SQL Queries 6 */

-- We are going to do some database maintenance. 

-- We have received the film catalog for 2020. We have just one item for each film, and all will be placed in store 2. All other movies will be moved to store 1. The rental duration will be 3 days, with an offer price of 2.99€ and a replacement cost of 8.99€. The catalog is in a CSV file named films_2020.csv that can be found at files_for_lab folder.

-- don't have to import csv because film are the same as the film table we have. We can copy the film table and make modifications on it to have the new film.

-- update on film table
-- create another film table to add the new film

CREATE TABLE film_update AS SELECT * FROM film ; 

UPDATE film_update
SET release_year = '2020'

UPDATE film_update
SET rental_duration = '3'

UPDATE film_update
SET rental_rate = '2.99'

UPDATE film_update
SET replacement_cost = '8.99'

UPDATE film_update
SET film_id = film_id+1000


-- update on inventory
-- create another inventory table to add the new film

CREATE TABLE inventory_update AS SELECT * FROM inventory ;

UPDATE inventory
SET store_id = '1'

UPDATE inventory_update
SET store_id = '2' 

UPDATE inventory_update
SET film_id = film_id+1000

UPDATE inventory_update
SET inventory_id = inventory_id+1000


-- merge older data and update ones

SELECT * FROM film UNION select * from film_update

SELECT * FROM inventory UNION select * from inventory_update
