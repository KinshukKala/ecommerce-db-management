--SECTION A

--Q1. Write a query to display all columns and rows from the customer's table.

select * from customers;

--Q2.  Retrieve only the first_name, last_name, and city of all customers.

select first_name, last_name, city from customers;

--Q3. List all unique categories available in the products table. 

select distinct category from products;

--Q4. Identify the Primary Key of each table in the schema. Explain why a Primary Key must be unique and NOT NULL. 

--Here are the primary keys in each table:
--customers: customer_id
--products: product_id
--orders: order_id
--order_items: item_id

--A primary key must be uniqe as a primary key uniquely identifies each row. A primary must be NOT NULL because every row must have an identifier so that it can be uniquely identified.

--Q5. What constraints are applied to the email column in the customers table? What would happen if you tried to insert a duplicate email? 

-- Two constrainst are applied on the email column: UNIQUE & NOT NULL. This means that every entry in the email columns must be unique and we cannot leave it empty. If we tried to insert a duplicate email we will get an error.

--Q6. Try inserting a product with unit_price = -50. What happens and which constraint prevents it? Write both the INSERT statement and explain the error. 

--insert into products values (209, 'Cushion Covers (Set)', 'Home', 'HomeCenter', -50,  400);
--This query will give error because of check constraint set on. 