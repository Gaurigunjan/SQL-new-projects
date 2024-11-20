# Q.1. Create a table called employees with the following structure?
# : emp_id (integer, should not be NULL and should be a primary key)Q
#: emp_name (text, should not be NULL)Q
#: age (integer, should have a check constraint to ensure the age is at least 18)Q
#: email (text, should be unique for each employee)Q
#: salary (decimal, with a default value of 30,000)R
#Write the SQL query to create the above table with all constraints

# Ans:-

create database pwskills;
use pwskills;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY NOT NULL,
    emp_name TEXT NOT NULL,
    age INT CHECK (age >= 18),
    email TEXT UNIQUE NOT NULL,
    salary DECIMAL DEFAULT 30000
);


# Q.2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide
# examples of common types of constraints.

-- #Ans :- Purpose of Constraints and Maintaining Data Integrity

-- # Constraints in a database are rules that enforce data integrity, ensuring that only valid and consistent data is stored. They act as safeguards against accidental or malicious data entry errors, ensuring the reliability and accuracy of the information within the database.

-- # How Constraints Maintain Data Integrity

-- #Preventing Invalid Data Entry: Constraints define specific criteria for data values, rejecting any input that doesn't meet these criteria. This prevents errors and inconsistencies from creeping into the database.
-- # Enforcing Data Relationships: Constraints establish connections between tables, ensuring that data in one table is linked correctly to related data in another. This maintains referential integrity.
-- # Guaranteeing Data Uniqueness: Constraints can be used to enforce unique identifiers, preventing duplicate records and maintaining data consistency.
-- # Common Types of Constraints

# (1) NOT NULL:

# Ensures that a column cannot contain null values.
# Example: A Customer table might have a Name column defined as NOT NULL, ensuring that every customer record has a name.

# (2) UNIQUE:

# Ensures that a column or combination of columns contains unique values.
# Example: An Employee table might have an EmployeeID column defined as UNIQUE, preventing duplicate employee IDs.

# (3) PRIMARY KEY:

# A special type of UNIQUE constraint that uniquely identifies each row in a table.
# Example: A Product table might have a ProductID column defined as the PRIMARY KEY, ensuring that each product has a unique identifier.

# (4) FOREIGN KEY:

# References the PRIMARY KEY of another table, establishing a relationship between the two tables.
# Example: An Orders table might have a CustomerID column defined as a FOREIGN KEY referencing the CustomerID column in the Customer table, ensuring that each order is associated with a valid customer.

# (5) CHECK:

# Defines a specific condition that must be met for a column value.
# Example: An Age column in a Person table might have a CHECK constraint to ensure that the age is between 0 and 120.

#(6) DEFAULT:

# Specifies a default value for a column if no value is provided during data entry.
# Example: A CreatedDate column in a Task table might have a DEFAULT constraint set to the current timestamp.



# 3.Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify
# your answer.


# Ans :- Why Apply NOT NULL Constraint?

# The NOT NULL constraint is applied to a column to ensure that it cannot contain null values. This is crucial for maintaining data integrity and preventing accidental data loss or inconsistencies. Here are some common reasons:

# Data Consistency:

# It ensures that essential information is always present, avoiding incomplete or unreliable data.
# For example, a CustomerName column in a Customer table should be NOT NULL to guarantee that every customer record has a name.
# Data Validation:

# It can be used to enforce data validation rules, such as requiring a value for a specific field.
# For instance, a BirthDate column in a Person table might be NOT NULL to ensure that every person has a recorded birth date.
# Referential Integrity:

# It is often used in conjunction with foreign key constraints to maintain relationships between tables.
# If a foreign key column is NOT NULL, it guarantees that every record in the referencing table is linked to a valid record in the referenced table.
# Can a Primary Key Contain NULL Values?

# No, a primary key cannot contain NULL values. A primary key is a unique identifier for a row in a table, and it must always have a value to distinguish one row from another. If a primary key could be NULL, it would violate its fundamental purpose of uniquely identifying records.

# Justification:

# Uniqueness: A primary key's primary role is to ensure unique identification. If a NULL value were allowed, multiple rows could have the same primary key value, leading to data ambiguity and inconsistencies.
# Indexing: Primary keys are often used as indexes to speed up data retrieval. NULL values can hinder indexing efficiency, as indexes are typically optimized for non-null values.
# Referential Integrity: Foreign keys often reference primary keys. If a primary key can be NULL, it can create complications in maintaining referential integrity, as foreign key constraints rely on the uniqueness of the referenced primary key.


# 4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an
# example for both adding and removing a constraint.

# Ans :- Adding a Constraint to an Existing Table

# Steps:

# Identify the Constraint: Determine the type of constraint (e.g., PRIMARY KEY, UNIQUE, FOREIGN KEY, CHECK) and the column(s) it should apply to.
# Write the ALTER TABLE Statement: Use the ALTER TABLE statement to modify the table's structure.
# Specify the Constraint: Use the appropriate ADD CONSTRAINT clause to define the constraint.
# Example: Adding a PRIMARY KEY Constraint

# Suppose we have a Customers table without a primary key. To add a CustomerID column as the primary key:

# Removing a Constraint from an Existing Table

# Steps:

# Identify the Constraint: Determine the name of the constraint to be removed.
# Write the ALTER TABLE Statement: Use the ALTER TABLE statement to modify the table's structure.
# Specify the Constraint: Use the DROP CONSTRAINT clause to remove the constraint.
# Example: Removing a FOREIGN KEY Constraint


# 5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints

# Ans :- Provide an example of an error message that might occur when violating a constraint.

# Consequences of Violating Constraints

# When you attempt to insert, update, or delete data that violates a constraint, the database system will typically:

# Reject the Operation: The database will prevent the operation from completing and return an error message. This ensures data integrity and prevents inconsistencies.
# Rollback Transaction: If the operation is part of a transaction, the entire transaction may be rolled back to its previous state, undoing any changes made.
# Raise an Exception: The database can raise an exception, which can be handled by the application to provide appropriate error messages or take corrective actions.

# Example Error Message

# Consider a Customers table with a CustomerID column defined as a primary key. This constraint ensures unique customer IDs. If you try to insert a new customer with a duplicate CustomerID, you might encounter an error message like this:

# Error Code: 1062
# SQL State: 23000
# Message: Duplicate entry 'CUST123' for key 'PRIMARY'


# 6. You created a products table without constraints as follows:

# CREATE TABLE products (

 #   product_id INT,

 #   product_name VARCHAR(50),

 #   price DECI@AL(10; 2));  

# Ans :- CREATE TABLE products (
#    product_id INT,
#    product_name VARCHAR(50),
#    price DECIMAL(10, 2));


# 7 1-Identify the primary keys and foreign keys in maven movies db. Discuss the differences. Identifying Primary and Foreign Keys in the Maven Movies Database
To accurately identify the primary and foreign keys in the Maven Movies database, we'll need to examine the specific schema and table relationships. However, based on common movie database structures, we can make some educated guesses and provide general guidance.

-- Common Table Structure

-- A typical movie database might include the following tables:

-- movies

-- id (primary key): Unique identifier for each movie   
-- title
-- release_year
-- runtime
-- director_id (foreign key, referencing the directors table)   
-- genre_ids (foreign key, referencing the genres table, potentially in a junction table)
-- directors

-- id (primary key): Unique identifier for each director
-- name
-- bio
-- genres

-- Ans :-  id (primary key): Unique identifier for each genre   
-- name
-- movies_genres (junction table)

-- movie_id (foreign key, referencing the movies table)
-- genre_id (foreign key, referencing the genres table)
-- Primary Keys vs. Foreign Keys

-- Primary Key:

-- Uniquely identifies each record within a table.
-- Cannot contain null values.
-- Typically a single column, but can be a composite key (multiple columns).   
-- In the examples above, id columns in movies, directors, and genres are primary keys.
-- Foreign Key:

-- References the primary key of another table.
-- Establishes a relationship between two tables.
-- Can contain null values if the relationship is optional.
-- In the examples above, director_id in the movies table and movie_id and genre_id in the movies_genres table are foreign keys.
-- Key Differences

-- Feature	Primary Key	Foreign Key
-- Uniqueness	Unique within a table	Can be duplicated
-- Null Values	Not allowed	Allowed
-- Relationship	Defines the table's structure	Connects tables


# 8 - List all details of actors

-- Ans :- Assuming a typical movie database schema with tables like actors:
-- SELECT * FROM actors;

-- SELECT *: This part selects all columns from the table.
-- FROM actors: This specifies the table we want to query, which is the actors table.
-- Example Output (Hypothetical Data):

-- actor_id	first_name	last_name	date_of_birth	nationality
-- 1	Tom	Hanks	1956-07-09	American
-- 2	Meryl	Streep	1949-06-22	American
-- 3	Leonardo	DiCaprio	1974-11-11	American

-- Additional Considerations:

-- Specific Database: The exact table and column names might vary depending on your database schema.
-- Filtering and Sorting: You can add WHERE and ORDER BY clauses to filter and sort the results:


# 9 -List all customer information from DB.

-- Ans :- Assuming a typical database with a customers table:

-- SQL
-- SELECT * FROM customers;
-- SELECT *: This part selects all columns from the table.
-- FROM customers: This specifies the table we want to query, which is the customers table.
-- Example Output (Hypothetical Data):

-- customer_id	first_name	last_name	email	phone_number	address	city	state	zip_code	country
-- 1	John	Doe	[email address removed]	123-456-7890	123 Main St	Anytown	CA	12345	USA
-- 2	Jane	Smith	[email address removed]	987-654-3210	456 Elm

-- SELECT * FROM customers WHERE country = 'USA' ORDER BY last_name;

# 10 Display all active customers.

-- Ans :- To determine which customers are "active," we'll need to define a specific criterion. Here are some common approaches:

-- Recent Purchase:
-- Customers who have made a purchase within a certain timeframe (e.g., last 30 days, last year).
-- Regular Purchases:
-- Customers who make purchases frequently (e.g., at least once a month).
-- Account Engagement:
-- Customers who log in to their accounts regularly or interact with customer support.
-- Example SQL Query (Recent Purchase):

-- Assuming you have a customers table and an orders table with a customer_id foreign key, you can use the following query to find customers who made a purchase in the last 30 days:

-- SQL
-- SELECT c.* 
-- FROM customers c
-- INNER JOIN orders o ON c.customer_id = o.customer_id
-- WHERE o.order_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);   

# 11 -List of all rental IDs for customer with ID 1.

-- Ans :- SQL Query to List Rental IDs for Customer with ID 1

-- Here's a SQL query to retrieve the rental IDs for the customer with ID 1:

-- SQL
-- SELECT rental_id
-- FROM rental
-- WHERE customer_id = 1;

# 12 - Display all the films whose rental duration is greater than 5 .

-- Ans :- SELECT title
-- FROM film
-- WHERE rental_duration > 5;

# 13 List the total number of films whose replacement cost is greater than $15 and less than $20.

-- Ans :- SELECT COUNT(*) AS total_films
-- FROM film
-- WHERE replacement_cost > 15 AND replacement_cost < 20;

# 14 Display the count of unique first names of actors.

-- Ans :- SELECT COUNT(DISTINCT first_name) AS unique_first_names
-- FROM actor;

# 15 - Display the first 10 records from the customer table .

--Ans :-  SELECT *
-- FROM customer
-- LIMIT 10;

# 16 Display the first 3 records from the customer table whose first name starts with ‘b’.

-- Ans :- SELECT *
-- FROM customer
-- WHERE first_name LIKE 'b%'
-- LIMIT 3;

# 17 Display the names of the first 5 movies which are rated as ‘G’.

--Ans :- SELECT title
-- FROM film
-- WHERE rating = 'G'
-- LIMIT 5;

# 18 Find all customers whose first name starts with "a".

-- Ans :- SELECT *
-- FROM customer
-- WHERE first_name LIKE 'a%';

# 19 Find all customers whose first name ends with "a".

-- Ans :- SELECT *
-- FROM customer
-- WHERE first_name LIKE '%a';

# 20 Get the films with pg and pg-13 rating using IN operator.

-- Ans :- SELECT title
-- FROM film
-- WHERE rating IN ('PG', 'PG-13');

# 21 Display the list of first 4 cities which start and end with ‘a’

--Ans :-  SELECT city
-- FROM city
-- WHERE city LIKE 'a%a'
-- LIMIT 4;

# 22 Find all customers whose first name have "NI" in any position.

-- Ans :- SELECT *
-- FROM customer
-- WHERE first_name LIKE '%NI%';

# 22 Find all customers whose first name have "r" in the second position .

--Ans:- SELECT *
-- FROM customer
-- WHERE first_name LIKE '_r%';

# 23 Find all customers whose first name starts with "a" and are at least 5 characters in length.

-- Ans :-SELECT *
-- FROM customer
-- WHERE first_name LIKE 'a%'
--   AND LENGTH(first_name) >= 5;

# 24 Find all customers whose first name starts with "a" and ends with "o".

--Ans :- SELECT *
-- FROM customer
-- WHERE first_name LIKE 'a%o';

# 25 Get the films with length between 50 to 100 using between operator.

--Ans :- SELECT title
-- FROM film
-- WHERE length BETWEEN 50 AND 100;

# 26 Get the top 50 actors using limit operator.

-- Ans :- SELECT *
-- FROM actor
-- LIMIT 50;

# 26 Get the distinct film ids from inventory table.

--Ans :- SELECT DISTINCT film_id
-- FROM inventory;

# 27 Retrieve the total number of rentals made in the Sakila database.
Hint: Use the COUNT() function.

-- Ans :- SELECT COUNT(*) AS total_rentals
-- FROM rental;

# 28 Find the average rental duration (in days) of movies rented from the Sakila database.
Hint: Utilize the AVG() function.

--Ans :-  SELECT AVG(DATEDIFF(rental_date, return_date)) AS avg_rental_duration
-- FROM rental;

# 29 Display the first name and last name of customers in uppercase.
Hint: Use the UPPER () function.

--Ans :-  SELECT UPPER(first_name), UPPER(last_name)
-- FROM customer;

# 30  Extract the month from the rental date and display it alongside the rental ID.
Hint: Employ the MONTH() function.

-- Ans :- SELECT rental_id, MONTH(rental_date) AS rental_month
-- FROM rental;

# 31 Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
Hint: Use COUNT () in conjunction with GROUP BY.

-- Ans :- SELECT customer_id, COUNT(*) AS total_rentals
-- FROM rental
-- GROUP BY customer_id;

# 32 Find the total revenue generated by each store.
Hint: Combine SUM() and GROUP BY.

--Ans :-  SELECT store_id, SUM(amount) AS total_revenue
-- FROM payment
-- GROUP BY store_id;

# 33 Determine the total number of rentals for each category of movies.
Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY.

--Ans :-  SELECT fc.name AS category_name, COUNT(r.rental_id) AS total_rentals
-- FROM film f
-- INNER JOIN film_category fc ON f.film_id = fc.film_id
-- INNER JOIN inventory i ON f.film_id = i.film_id
-- INNER JOIN rental r ON i.inventory_id = r.inventory_id
-- GROUP BY fc.name;

# 34 Find the average rental rate of movies in each language.
Hint: JOIN film and language tables, then use AVG () and GROUP BY.

-- Ans :- SELECT l.name AS language_name, AVG(f.rental_rate) AS avg_rental_rate
-- FROM film f
-- INNER JOIN language l ON f.language_id = l.language_id
-- GROUP BY l.name;
-- -- 

# 36 Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
Hint: Use JOIN between the film actor, film, and actor tables.

--Ans :-  SELECT a.first_name, a.last_name
-- FROM actor a
-- INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
-- INNER JOIN film f ON fa.film_id = f.film_id
-- WHERE f.title = 'Gone with the Wind';

# 37 Retrieve the customer names along with the total amount they've spent on rentals.
Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.

Ans :- SELECT c.first_name, c.last_name, SUM(p.amount) AS total_spent
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
INNER JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.customer_id, c.first_name, c.last_name;

# 38 List the titles of movies rented by each customer in a particular city (e.g., 'London').
Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY.

Ans :- SELECT c.first_name, c.last_name, f.title
FROM customer c
INNER JOIN address a ON c.address_id = a.address_id
INNER JOIN city ci ON a.city_id = ci.city_id
INNER JOIN rental r ON c.customer_id = r.customer_id
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id
WHERE ci.city = 'London'
GROUP BY c.first_name, c.last_name, f.title;

# 39 Display the top 5 rented movies along with the number of times they've been rented.
Hint: JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results.

--Ans :-  SELECT f.title, COUNT(*) AS rental_count
-- FROM film f
-- INNER JOIN inventory i ON f.film_id = i.film_id
-- INNER JOIN rental r ON i.inventory_id = r.inventory_id
-- GROUP BY f.title
-- ORDER BY rental_count DESC
-- LIMIT 5;

# 40 Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY.

-- Ans :- SELECT c.customer_id, c.first_name, c.last_name
-- FROM customer c
-- INNER JOIN rental r ON c.customer_id = r.customer_id
-- INNER JOIN inventory i ON r.inventory_id = i.inventory_id
-- GROUP BY c.customer_id, c.first_name, c.last_name
-- HAVING COUNT(DISTINCT i.store_id) = 2;

# 41 Rank the customers based on the total amount they've spent on rentals.

-- Ans :- SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_spent
-- FROM customer c
-- INNER JOIN rental r ON c.customer_id = r.customer_id
-- INNER JOIN payment p ON r.rental_id = p.rental_id
-- GROUP BY c.customer_id, c.first_name, c.last_name
-- ORDER BY total_spent DESC;

# 42 Calculate the cumulative revenue generated by each film over time.

-- Ans :- WITH FilmRental AS (
--   SELECT f.film_id, f.title, r.rental_date, p.amount
--   FROM film f
--   INNER JOIN inventory i ON f.film_id = i.film_id
--   INNER JOIN rental r ON i.inventory_id = r.inventory_id
--   INNER JOIN payment p ON r.rental_id = p.rental_id
-- )
-- SELECT 
--   film_id, 
--   title, 
--   rental_date, 
--   amount,
--   SUM(amount) OVER (PARTITION BY film_id ORDER BY rental_date) AS cumulative_revenue
-- FROM FilmRental
-- ORDER BY film_id, rental_date;

# 43 Determine the average rental duration for each film, considering films with similar lengths.

-- Ans :-  WITH FilmRental AS (
--   SELECT f.film_id, f.title, r.rental_date, r.return_date
--   FROM film f
--   INNER JOIN inventory i ON f.film_id = i.film_id
--   INNER JOIN rental r ON i.inventory_id = r.inventory_id
-- )
-- SELECT 
--   f.film_id, 
--   f.title, 
--   f.length,
--   AVG(DATEDIFF(r.return_date, r.rental_date)) AS avg_rental_duration
-- FROM FilmRental f
-- GROUP BY f.film_id, f.title, f.length;

# 44 Identify the top 3 films in each category based on their rental counts.

-- Ans :- WITH FilmCategoryRentals AS (
--   SELECT fc.category_id, fc.name AS category_name, f.film_id, f.title, COUNT(*) AS rental_count
--   FROM film f
--   INNER JOIN film_category fc ON f.film_id = fc.film_id
--   INNER JOIN inventory i ON f.film_id = i.film_id
--   INNER JOIN rental r ON i.inventory_id = r.inventory_id
--   GROUP BY fc.category_id, fc.name, f.film_id, f.title
-- )
-- SELECT 
--   category_name, 
--   film_id, 
--   title, 
--   rental_count,
--   ROW_NUMBER() OVER (PARTITION BY category_name ORDER BY rental_count DESC) AS rank
-- FROM FilmCategoryRentals
-- WHERE rank <= 3;

# 45 Calculate the difference in rental counts between each customer's total rentals and the average rentals. across all customers.

-- Ans :- WITH CustomerRentals AS (
--   SELECT c.customer_id, c.first_name, c.last_name, COUNT(*) AS total_rentals
--   FROM customer c
--   INNER JOIN rental r ON c.customer_id = r.customer_id
--   GROUP BY c.customer_id, c.first_name, c.last_name
-- ),
-- AverageRentals AS (
--   SELECT AVG(total_rentals) AS avg_rentals
--   FROM CustomerRentals
-- )
-- SELECT 
--   cr.first_name, 
--   cr.last_name, 
--   cr.total_rentals, 
--   ar.avg_rentals,
--   cr.total_rentals - ar.avg_rentals AS rental_difference
-- FROM CustomerRentals cr
-- CROSS JOIN AverageRentals ar;

# 46 Find the monthly revenue trend for the entire rental store over time

-- Ans :- WITH MonthlyRevenue AS (
--   SELECT
--     YEAR(p.payment_date) AS year,
--     MONTH(p.payment_date) AS month,
--     SUM(p.amount) AS monthly_revenue
--   FROM
--     payment p
--   GROUP BY
--     YEAR(p.payment_date),
--     MONTH(p.payment_date)
-- )
-- SELECT
--   CONCAT(year, '-', LPAD(month, 2, '0')) AS month_year,
--   monthly_revenue
-- FROM
--   MonthlyRevenue
-- ORDER BY
--   year,
--   month;

# 47 Identify the customers whose total spending on rentals falls within the top 20% of all customers.

--Ans :-  WITH CustomerSpending AS (
--   SELECT 
--     c.customer_id, 
--     c.first_name, 
--     c.last_name, 
--     SUM(p.amount) AS total_spent
--   FROM 
--     customer c
--   INNER JOIN rental r ON c.customer_id = r.customer_id
--   INNER JOIN payment p ON r.rental_id = p.rental_id
--   GROUP BY 
--     c.customer_id, 
--     c.first_name, 
--     c.last_name
-- )
-- SELECT 
--   customer_id, 
--   first_name, 
--   last_name, 
--   total_spent
-- FROM 
--   CustomerSpending
-- WHERE 
--   total_spent >= (SELECT PERCENTILE_CONT(0.8) WITHIN GROUP (ORDER BY total_spent) FROM CustomerSpending);

  # 48 Find the films that have been rented less than the average rental count for their respective categories.
 
-- Ans :- WITH FilmCategoryRentals AS (
--   SELECT 
--     fc.category_id, 
--     fc.name AS category_name, 
--     f.film_id, 
--     f.title, 
--     COUNT(*) AS rental_count
--   FROM 
--     film f
--   INNER JOIN film_category fc ON f.film_id = fc.film_id
--   INNER JOIN inventory i ON f.film_id = i.film_id
--   INNER JOIN rental r ON i.inventory_id = r.inventory_id
--   GROUP BY 
--     fc.category_id, 
--     fc.name, 
--     f.film_id, 
--     f.title
-- ),
-- CategoryAvgRentals AS (
--   SELECT 
--     category_name, 
--     AVG(rental_count) AS avg_category_rentals
--   FROM 
--     FilmCategoryRentals
--   GROUP BY 
--     category_name
-- )
-- SELECT 
--   fcr.title, 
--   fcr.rental_count, 
--   acr.avg_category_rentals
-- FROM 
--   FilmCategoryRentals fcr
-- INNER JOIN CategoryAvgRentals acr ON fcr.category_name = acr.category_name
-- WHERE 
--   fcr.rental_count < acr.avg_category_rentals;

  # 49 Identify the top 5 months with the highest revenue and display the revenue generated in each month.

--Ans :-  WITH MonthlyRevenue AS (
--   SELECT 
--     YEAR(p.payment_date) AS year, 
--     MONTH(p.payment_date) AS month, 
--     SUM(p.amount) AS total_revenue
--   FROM 
--     payment p
--   GROUP BY 
--     YEAR(p.payment_date), 
--     MONTH(p.payment_date)
-- )
-- SELECT 
--   CONCAT(year, '-', LPAD(month, 2, '0')) AS month_year, 
--   total_revenue
-- FROM 
--   MonthlyRevenue
-- ORDER BY 
--   total_revenue DESC
-- LIMIT 5;

# 50 Identifying a Table Violating 1NF in Sakila

-- Ans :- While the Sakila database is generally well-normalized, we can identify a potential violation of 1NF in the film_category table.

-- The Violation:

-- The film_category table contains a composite primary key consisting of film_id and category_id. This, in itself, doesn't directly violate 1NF. However, the issue arises if we consider the possibility of additional attributes associated with this composite key, such as a "date_added" field indicating when a film was added to a category.

-- Normalizing to 1NF:

-- To normalize this table to 1NF, we would need to ensure that each attribute contains atomic values. If we were to add the "date_added" attribute, we could create a new table to store this information:

# 51 Second Normal Form (2NF):

-- a. Choose a table in Sakila and describe how you would determine whether it is in 2NF.
-- If it violates 2NF, explain the steps to normalize it.

-- 2NF Violation in Sakila: The payment Table

-- The payment table in the Sakila database potentially violates 2NF.

-- Why?

-- While the primary key of the payment table is payment_id, there are attributes like rental_id, customer_id, and staff_id that are not fully dependent on the entire primary key. These attributes are functionally dependent on a subset of the primary key, specifically the rental_id.

-- Normalizing to 2NF:

-- To normalize the payment table to 2NF, we can decompose it into two tables:

-- payment

-- payment_id (Primary Key)
-- rental_id (Foreign Key)
-- amount
-- payment_date
-- last_update
-- rental_details

-- rental_id (Primary Key)
-- customer_id (Foreign Key)
-- staff_id (Foreign Key)
-- By decomposing the payment table, we ensure that each non-prime attribute is fully dependent on the entire primary key of its table. This eliminates the partial dependency issue and brings the table into 2NF.

# 52 Third Normal Form (3NF):

a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies
present and outline the steps to normalize the table to 3NF.

-- 3NF Violation in Sakila: The rental Table

-- The rental table in the Sakila database violates 3NF due to a transitive dependency.

-- Transitive Dependency:

-- The rental_date and return_date attributes are functionally dependent on the rental_id, which is the primary key. However, they are also transitively dependent on the inventory_id, as the inventory_id determines the rental_date and return_date.

-- Normalizing to 3NF:

-- To normalize the rental table to 3NF, we can decompose it into two tables:

-- rental

-- rental_id (Primary Key)
-- rental_date
-- return_date
-- inventory_id (Foreign Key)
-- inventory

-- inventory_id (Primary Key)
-- film_id (Foreign Key)
-- store_id (Foreign Key)
-- last_update
-- By separating the rental_date and return_date attributes from the inventory_id, we eliminate the transitive dependency and ensure that each non-prime attribute is directly dependent on the primary key. This normalization process brings the rental table into 3NF.

# 53 Normalization Process:

a. Take a specific table in Sakila and guide through the process of normalizing it from the initial
unnormalized form up to at least 2NF.

-- Normalization Process:

-- a. Take a specific table in Sakila and guide through the process of normalizing it from the initial
-- unnormalized form up to at least 2NF.

-- Show drafts


-- Normalizing the customer Table in Sakila
-- Initial Unnormalized Form:

-- Let's consider a simplified version of the customer table that violates both 1NF and 2NF:

-- customer_id	first_name	last_name	email	phone_number	address	city	state	zip_code	country
-- 1	John	Doe	johndoe@email.com	123-456-7890	123 Main St	Anytown	CA	12345	USA

-- Export to Sheets
-- 1NF Normalization:

-- In this case, the customer table already adheres to 1NF. Each attribute contains atomic values, and there are no repeating groups.

-- 2NF Normalization:

-- However, the customer table violates 2NF due to a partial dependency. The attributes city, state, zip_code, and country are dependent on the address_id, which is a part of the primary key customer_id.

-- To normalize the table to 2NF, we can decompose it into two tables:

-- 1. customer

-- customer_id (Primary Key)
-- first_name
-- last_name
-- email
-- phone_number
-- address_id (Foreign Key)
-- 2. address

-- address_id (Primary Key)
-- address
-- city
-- state
-- zip_code
-- country
-- By decomposing the table, we ensure that each non-prime attribute is fully dependent on the entire primary key of its table. This eliminates the partial dependency and brings the table into 2NF.


# 54 CTE Basics:

a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they
have acted in from the actor and film_actor tables.

-- WITH ActorFilmCounts AS (
--     SELECT
--         a.actor_id,
--         a.first_name,
--         a.last_name,
--         COUNT(fa.actor_id) AS film_count
--     FROM
--         actor a
--     INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
--     GROUP BY
--         a.actor_id,
--         a.first_name,
--         a.last_name
-- )
-- SELECT
--     first_name,
--     last_name,
--     film_count
-- FROM
--     ActorFilmCounts;

