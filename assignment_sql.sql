-- 1. Create a table called employees with the following structure?
-- : emp_id (integer, should not be NULL and should be a primary key)
-- : emp_name (text, should not be NULL)
-- : age (integer, should have a check constraint to ensure the age is at least 18)
-- : email (text, should be unique for each employee)
-- : salary (decimal, with a default value of 30,000).

-- Write the SQL query to create the above table with all constraints.

use flight_analysis;
CREATE table employee(
emp_id int primary key,
emp_name varchar(50) not null,
age int check(age>=18),
email varchar(50) unique,
salary float default (30000)
);

/*
2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide
examples of common types of constraints.
Answer - 2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide
examples of common types of constraints.
type of constraint-
PRIMARY KEY
FOREING KEY
UNIQUE
DEFAULT
CHECK 
NOT NULL 

3.Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify
your answer.
Answer - The NOT NULL constraint is used to ensure that a column always contains a value. It prevents the insertion of NULL (empty or missing) values in that column.
No, a primary key cannot contain NULL value.
A primary key uniquely identifies each row in a table.

4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an
example for both adding and removing a constraint.
Answer - ALTER TABLE table_name
ADD CONSTRAINT constraint_name constraint_type (column_name);

ALTER TABLE table_name
DROP CONSTRAINT constraint_name;

5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.
Provide an example of an error message that might occur when violating a constraint.
Answer - Constraints in SQL are rules enforced by the database to maintain data integrity. When you try to insert, 
update, or delete data in a way that violates a constraint, the database rejects the operation and returns an error message.
 This prevents invalid, inconsistent, or incomplete data from being stored.
 1. Violation of PRIMARY KEY constraint 'PK_Employee'. Cannot insert duplicate key in object 'Employee'.
 2. The UPDATE statement conflicted with the CHECK constraint 'chk_age'.
 3. The DELETE statement conflicted with the REFERENCE constraint 'fk_dept'.

6. You created a products table without constraints as follows:

CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10, 2));
Now, you realise that?
: The product_id should be a primary key
: The price should have a default value of 50.00
Answer -
alter table products
add constraint id_pk primary key (product_id),
MODIFY price DECIMAL(10,2) DEFAULT 50.00;

7. You have two tables:
Write a query to fetch the student_name and class_name for each student using an INNER JOIN.

select s.student_name, c.class_name
from Students s 
join Classes c
on s.class_id = c.class_id;

8. Consider the following three tables:
Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are
listed even if they are not associated with an order 
Hint: (use INNER JOIN and LEFT JOIN)
Answer - 
select o.order_id, c.custoer_name, p.product_name
from products p 
left join orders o 
on p.order_id = o.order_id
join customers c 
on o.customer_id = c.customer_id;

9. Given the following tables:
Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.
Answer - 
select p.product_name, sum(s.amount)
from Sales s 
join Products p
on s.product_id = p.prodcut_id 
group by p.product_name;

10. You are given three tables:
Write a query to display the order_id, customer_name, and the quantity of products ordered by each
customer using an INNER JOIN between all three tables.
Answer - 
SELECT o.order_id, c.customer_name, od.quantity
FROM Orders o
JOIN Customers c 
ON o.customer_id = c.customer_id
JOIN Order_details od
ON o.order_id = od.order_id;

*/


-- 1. Identify the primary keys and foreign keys in maven movies db. Discuss the differences

-- 2- List all details of actors
select * from actor;

-- 3 -List all customer information from DB.
select * from customer;

-- 4 -List different countries.
select distinct(country) from country;

-- 5 -Display all active customers.
select customer_id, first_name
from customer 
where active = 1;

-- 6 -List of all rental IDs for customer with ID 1.
select rental_id
 from rental
 where customer_id = 1;
 
-- 7 - Display all the films whose rental duration is greater than 5 .
select film_id, title 
from film
where rental_duration > 5;

-- 8 - List the total number of films whose replacement cost is greater than $15 and less than $20.
select count(film_id) as total_films 
from film 
where replacement_cost>15 and replacement_cost<20;

-- 9 - Display the count of unique first names of actors.
select count(distinct first_name) as unique_name from actor;

-- 10- Display the first 10 records from the customer table .
select * from customer
limit 10;

-- 11 - Display the first 3 records from the customer table whose first name starts with ‘b’.
select * from customer 
where first_name like "B%" 
limit 3;

-- 12 -Display the names of the first 5 movies which are rated as ‘G’.
select title from film
where rating = "G"
limit 5;

-- 13-Find all customers whose first name starts with "a".
select first_name from customer
where first_name like "A%";

-- 14- Find all customers whose first name ends with "a".
select first_name from customer
where first_name like "%A";

-- 15- Display the list of first 4 cities which start and end with ‘a’ .
select city_id, city from city
where city like "A%A";

-- 16- Find all customers whose first name have "NI" in any position.
select first_name from customer
where first_name like "%NI%";

-- 17- Find all customers whose first name have "r" in the second position .
select first_name from customer
where first_name like "_R%";

-- 18 - Find all customers whose first name starts with "a" and are at least 5 characters in length.
select first_name from customer
where first_name like "A____%";

-- 19- Find all customers whose first name starts with "a" and ends with "o".
select first_name from customer
where first_name like "A%O";

-- 20 - Get the films with pg and pg-13 rating using IN operator.
select title from film
where rating in ("PG","PG-3");

-- 21 - Get the films with length between 50 to 100 using between operator.
select title, length from film
where length between 50 and 100;

-- 22 - Get the top 50 actors using limit operator
select * from actor
limit 50;

-- 23 - Get the distinct film ids from inventory table.
select distinct film_id as unique_film_id from inventory;

-- Question 1: Retrieve the total number of rentals made in the Sakila database. Hint: Use the COUNT() function.
select count(rental_id) as total_rental from rental;

-- Question 2: Find the average rental duration (in days) of movies rented from the Sakila database. Hint: Utilize the AVG() function.
select avg(rental_duration) as avg_rental_duration from film;

-- Question 3: Display the first name and last name of customers in uppercase. Hint: Use the UPPER () function.
select upper(first_name), upper(last_name) from customer ;

-- Question 4: Extract the month from the rental date and display it alongside the rental ID. Hint: Employ the MONTH() function.
select rental_id, month(rental_date) from rental;

-- Question 5: Hint: Retrieve the count of rentals for each customer (display customer ID and the count of rentals). Use COUNT () in conjunction with GROUP BY.
select customer_id, 
count(*) as rental_count
from rental
group by customer_id;

-- Question 6: Find the total revenue generated by each store. Hint: Combine SUM() and GROUP BY.
select s.store_id,
sum(p.amount) as total_revenue
from payment p
join staff st on p.staff_id = st.staff_id
join store s on st.store_id = s.store_id
group by s.store_id;

-- Question 7: Determine the total number of rentals for each category of movies. Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY.
select c.name as cat_name,
count(r.rental_id)
from category c 
join film_category fc on c.category_id = fc.category_id
join film f on fc.film_id = f.film_id
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
group by cat_name;

-- Question 8: Find the average rental rate of movies in each language. Hint: JOIN film and language tables, then use AVG () and GROUP BY.
select l.name as lang_name,
avg(f.rental_rate) 
from language l 
join film f on l.language_id = f.language_id
group by lang_name;

-- Questions 9 - Display the title of the movie, customer s first name, and last name who rented it. Hint: Use JOIN between the film, inventory, rental, and customer tables.
select f.title,
c.first_name,
c.last_name,
r.rental_id
from film f 
join inventory i on f.film_id = i.film_id
join customer c on i.store_id = c.store_id
join rental r on c.customer_id = r.customer_id;

-- Question 10: Retrieve the names of all actors who have appeared in the film "Gone with the Wind." Hint: Use JOIN between the film actor, film, and actor tables.
select a.actor_id,
a.first_name
from actor a
join film_actor fa on a.actor_id = fa.actor_id
join film f on fa.film_id = f.film_id
where f.title = "Gone with the Wind" ;

-- Question 11: Retrieve the customer names along with the total amount they've spent on rentals. Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.
select c.customer_id,
c.first_name,
c.last_name,
sum(p.amount) as total_spent
from customer c
join payment p on c.customer_id = p.customer_id
group by c.customer_id , c.first_name, c.last_name;

-- Question 12: List the titles of movies rented by each customer in a particular city (e.g., 'London'). Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY.
select c.first_name,
c.last_name,
f.title
from customer c 
join address a on c.address_id = a.address_id
join city ci on a.city_id = ci.city_id
join rental r on c.customer_id = r.customer_id
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
where ci.city = "London";

-- Question 13: Display the top 5 rented movies along with the number of times they've been rented. Hint: JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results.
select f.film_id,
f.title,
count(r.rental_id) as count_rent
from film f 
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
group by f.film_id
order by count_rent desc
limit 5;

-- Question 14: Determine the customers who have rented movies from both stores (store ID 1 and store ID 2). Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY.

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
WHERE i.store_id IN (1, 2)
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT i.store_id) = 2;

-- 1. Rank the customers based on the total amount they've spent on rentals.
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(p.amount) DESC) AS spending_rank
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;

-- 2. Calculate the cumulative revenue generated by each film over time.
select f.film_id,
f.title,
r.rental_date,
sum(p.amount) as daily_revenue,
sum(sum(p.amount)) over (partition by f.film_id
order by r.rental_date) as cumulative_rev
from film f
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
join payment p on r.rental_id = p.rental_id
group by f.film_id, f.title, r.rental_date
order by f.film_id , r.rental_date;

-- 3. Determine the average rental duration for each film, considering films with similar lengths.
SELECT 
    f.length AS film_length,
    AVG(f.rental_duration) AS avg_rental_duration
FROM film f
GROUP BY f.length
ORDER BY f.length;

-- 4. Identify the top 3 films in each category based on their rental counts.
WITH film_ranks AS (
    SELECT 
        c.name AS category_name,
        f.title,
        COUNT(r.rental_id) AS rental_count,
        RANK() OVER (
            PARTITION BY c.category_id
            ORDER BY COUNT(r.rental_id) DESC
        ) AS film_rank
    FROM film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY c.category_id, c.name, f.film_id, f.title
)
SELECT *
FROM film_ranks
WHERE film_rank <= 3
ORDER BY category_name, film_rank;

-- 5. Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(r.rental_id) AS total_rentals,
    (COUNT(r.rental_id) - AVG(COUNT(r.rental_id)) OVER ()) AS rental_diff_from_avg
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY rental_diff_from_avg DESC;

-- 6. Find the monthly revenue trend for the entire rental store over time.
select 
date_format(p.payment_date , '%y-%m') as months,
sum(p.amount) as monthly_rev 
from payment p
group by date_format(p.payment_date , '%y-%m');

-- 7. Identify the customers whose total spending on rentals falls within the top 20% of all customers.

SELECT 
    customer_id,
    first_name,
    last_name,
    total_spent
FROM (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(p.amount) AS total_spent,
        CUME_DIST() OVER (ORDER BY SUM(p.amount) DESC) AS cum_dist
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
) AS ranked_customers
WHERE cum_dist <= 0.2
ORDER BY total_spent DESC;

-- 8. Calculate the running total of rentals per category, ordered by rental count.
SELECT 
    c.name AS category_name,
    f.title AS film_title,
    COUNT(r.rental_id) AS rental_count,
    SUM(COUNT(r.rental_id)) OVER (
        PARTITION BY c.category_id
        ORDER BY COUNT(r.rental_id) DESC
    ) AS running_total_rentals
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.category_id, c.name, f.film_id, f.title
ORDER BY c.name, rental_count DESC;

-- 9. Find the films that have been rented less than the average rental count for their respective categories.

WITH film_stats AS (
    SELECT 
        c.name AS category_name,
        f.title AS film_title,
        COUNT(r.rental_id) AS rental_count,
        AVG(COUNT(r.rental_id)) OVER (PARTITION BY c.category_id) AS avg_rental_per_category
    FROM film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY c.category_id, c.name, f.film_id, f.title
)
SELECT *
FROM film_stats
WHERE rental_count < avg_rental_per_category
ORDER BY category_name, rental_count;

-- 10. Identify the top 5 months with the highest revenue and display the revenue generated in each month.
select 
date_format(p.payment_date, '%y-%m') as months,
sum(p.amount) as revenue 
from payment p
group by date_format(p.payment_date, '%y-%m')
order by sum(p.amount) desc
limit 5;

--  First Normal Form (1NF):  a. Identify a table in the Sakila database that violates 1NF. Explain how you would normalize it to achieve 1NF.
-- shakila.film column violates 1NF  
-- Each column contains atomic values (no sets, lists, or arrays).
-- Each row is unique (has a primary key).
-- There are no repeating groups (no multiple values in a single column).

-- 2. Second Normal Form (2NF): a. Choose a table in Sakila and describe how you would determine whether it is in 2NF. If it violates 2NF, explain the steps to normalize it.
-- sakila.payment table is in 2NF because it is already in 1NF and for 2NF All non-key columns are fully functionally dependent on the entire primary key
-- Since the primary key is single-column, 2NF is automatically satisfied for this table.

-- 3. Third Normal Form (3NF): a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies present and outline the steps to normalize the table to 3NF. 
-- sakila.complete_add violates the 3NF .
-- Look for columns that depend on another non-key column instead of the primary key:
-- city depends on city_id, not address_id.
-- country depends on country_id, not address_id.
-- Problem: These are transitive dependencies → violates 3NF.
-- We split the table into three tables:
/*
1. address table

| address_id | address | district | city_id | postal_code | phone | location |

Primary key: address_id

Contains only info directly related to the address.

2. city table

| city_id | city | country_id |

Primary key: city_id

city depends on city_id (no transitive dependency).

3. country table

| country_id | country |

Primary key: country_id

country depends on country_id.
*/

-- 4. Normalization Process: a. Take a specific table in Sakila and guide through the process of normalizing it from the initial unnormalized form up to at least 2NF.
-- Most columns are atomic: film_id, title, description, release_year, etc.
-- Problem: special_features contains multiple comma-separated values (like Deleted Scenes, Behind the Scenes)  → violates 1NF.
-- Create a separate table to store each feature individually: 
-- |film_id| special_feature|
-- after normalizing 1NF --
-- check for 2NF
-- Primary key: film_id (single-column key)
-- All other columns (title, description, language_id, rental_rate, etc.) depend directly on film_id.
-- the table is in 2NF

-- 5. CTE Basics:a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they have acted in from the actor and film_actor tables.
use mavenmovies;
with actor_film as (
select a.actor_id,
concat(a.first_name ,' ',a.last_name) as full_name,
count(fa.film_id) as film_count
from actor a
join film_actor fa on a.actor_id = fa.actor_id
group by a.actor_id
)
SELECT *
FROM actor_film
ORDER BY film_count DESC;


-- 6. CTE with Joins: a. Create a CTE that combines information from the film and language tables to display the film title, language name, and rental rate.
with film_lang as (
select f.film_id,
f.title as film_title,
f.rental_rate,
l.language_id,
l.name as lang_name
from film f
join language l on f.language_id = l.language_id
)
select film_title,
lang_name,
rental_rate
from film_lang;

-- 7. CTE for Aggregation: a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments) from the customer 
with customer_revenue as (
 select 
c.customer_id,
concat(c.first_name,' ',c.last_name) as full_name,
sum(p.amount) as total_revenue
from customer c
join payment p on c.customer_id = p.customer_id
group by customer_id, concat(c.first_name,' ',c.last_name)
)
select full_name, total_revenue
from customer_revenue;

-- 8. CTE with Window Functions: a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.
WITH film_ranks AS (
    SELECT 
        film_id,
        title,
        rental_duration,
        RANK() OVER (ORDER BY rental_duration DESC) AS rental_rank
    FROM film
)
SELECT *
FROM film_ranks
ORDER BY rental_rank, title;

-- 9. CTE and Filtering: a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the customer table to retrieve additional customer details.
with frequent_customer as (
	select 
		r.customer_id,
        count(r.rental_id) as rental_count
        from rental r 
        group by r.customer_id 
        having count(r.rental_id)>2
)
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    fc.rental_count
FROM frequent_customer fc
JOIN customer c ON c.customer_id = fc.customer_id
ORDER BY fc.rental_count DESC;

-- 10. CTE for Date Calculations: a. Write a query using a CTE to find the total number of rentals made each month, considering the rental_date from the rental table
with rental_month as (
	select
		date_format(r.rental_date, '%y-%m') as months,
        count(r.rental_id) as rental_per_month
        from rental r
        group by date_format(r.rental_date, '%y-%m')
	)
select * from rental_month;

-- 11. CTE and Self-Join:a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film together, using the film_actor table.
WITH actor_pairs AS (
    SELECT 
        fa1.film_id,
        f.title AS film_title,
        a1.actor_id AS actor1_id,
        CONCAT(a1.first_name, ' ', a1.last_name) AS actor1_name,
        a2.actor_id AS actor2_id,
        CONCAT(a2.first_name, ' ', a2.last_name) AS actor2_name
    FROM film_actor fa1
    JOIN film_actor fa2 
        ON fa1.film_id = fa2.film_id 
       AND fa1.actor_id < fa2.actor_id   -- avoid duplicates & self-pairs
    JOIN actor a1 ON fa1.actor_id = a1.actor_id
    JOIN actor a2 ON fa2.actor_id = a2.actor_id
    JOIN film f ON fa1.film_id = f.film_id
)
SELECT *
FROM actor_pairs
ORDER BY film_title, actor1_name, actor2_name;

-- 2. CTE for Recursive Search: a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager, considering the reports_to column    
WITH RECURSIVE staff_hierarchy AS (
    -- Anchor part: start with the given manager
    SELECT 
        s.staff_id,
        CONCAT(s.first_name, ' ', s.last_name) AS staff_name,
        s.reports_to,
        0 AS level
    FROM staff s
    WHERE s.staff_id = 1   -- 👈 change this to the manager’s ID you want
    
    UNION ALL
    
    -- Recursive part: find employees reporting to the staff in previous level
    SELECT 
        e.staff_id,
        CONCAT(e.first_name, ' ', e.last_name) AS staff_name,
        e.reports_to,
        sh.level + 1
    FROM staff e
    JOIN staff_hierarchy sh ON e.reports_to = sh.staff_id
)
SELECT *
FROM staff_hierarchy
ORDER BY level, staff_name;
	

