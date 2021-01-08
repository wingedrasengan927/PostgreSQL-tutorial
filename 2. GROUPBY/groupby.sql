/*
Aggregate functions:
The main idea behind aggregate functions is to take multiple inputs and 
return a single output

GROUPBY:
GROUPBY allows us to aggregate columns per some category.
SELECT category_col, AGG(data_col) 
FROM table 
GROUP BY category_col 
The selected columns (except the column which we are aggregating on)
must appear on the GROUP BY statement also
as we are using aggregate functions here

HAVING:
The HAVING clause allows us to filter after an aggregation
has already taken place
*/

-- Aggregate functions examples

SELECT MIN(replacement_cost) FROM film;

SELECT ROUND(AVG(replacement_cost), 2) FROM film;

-- GROUP BY Examples

-- Count how many transactions are being made by each customer
SELECT customer_id, COUNT(amount) FROM payment
GROUP BY customer_id
ORDER BY COUNT(amount);

-- GROUP BY multiple columns
SELECT customer_id, staff_id, SUM(amount) FROM payment
GROUP BY customer_id, staff_id
ORDER BY customer_id;

-- Check how much amount is being processed every day
SELECT DATE(payment_date), SUM(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY DATE(payment_date);

-- HAVING Examples

-- Select cutomers who have purchased more than $100 overall
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100
ORDER BY SUM(amount);

-- Select Stores which have more than 300 customers
SELECT store_id, COUNT(customer_id) FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) > 300;

-- Return the customer IDs of customers
-- who have spent at least $110 with the staff member who has an ID of 2.
SELECT customer_id, staff_id, SUM(amount)  FROM payment
WHERE staff_id=2
GROUP BY staff_id, customer_id
HAVING SUM(amount) > 110;

-- What customer has the highest customer ID number 
-- whose name starts with an 'E' and has an address ID lower than 500?
SELECT first_name, last_name, MAX(customer_id) FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500
GROUP BY first_name, last_name
ORDER BY MAX(customer_id) DESC;
