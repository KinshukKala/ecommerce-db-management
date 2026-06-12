--SECTION D

--Q19. Write an INNER JOIN query to display each order along with the customer's first_name and last_name. Show: order_id, order_date, first_name, last_name, total_amount. 

select o.order_id,
o.order_date,
c.first_name,
c.last_name,
o.total_amount
from orders o 
inner join customers c 
on o.customer_id = c.customer_id;

--Q20. Using a LEFT JOIN, list ALL customers and their orders (if any). Customers with no orders should still appear with NULL values for order columns. 

select c.customer_id,
c.first_name,
c.last_name,
o.order_id,
o.order_date,
o.total_amount
from customers c 
left join orders o
on c.customer_id = o.customer_id;

--Q21. Write a query using JOINs across three tables (orders → order_items → products) to show: order_id, product_name, quantity, unit_price, and discount_pct for each order item. 

select o.order_id,
p.product_name,
oi.quantity,
oi.unit_price,
oi.discount_pct
from orders o
inner join order_items oi
on o.order_id = oi.order_id
inner join products p
on oi.product_id = p.product_id;


--Q22. Explain the difference between LEFT JOIN and RIGHT JOIN with an example from this schema. When would you use a FULL OUTER JOIN? 

--LEFT JOIN returns all rows from left table and matching rows from right table. RIGHT JOIN return all rows from right table and matching rows from left table. FULL OUTER JOIN returns everything from both tables. It is seful for finding unmatched records.

select *
from customers c
left join orders o
on c.customer_id = o.customer_id;

select *
from customers c
right join orders o
on c.customer_id = o.customer_id;

select *
from customers c
full outer join orders o
on c.customer_id = o.customer_id;

--Q23. Identify all Foreign Key relationships in the schema. Explain what would happen if you tried to insert an order with customer_id = 999 (which doesn't exist in customers).

--There are three Foreign Key relationships in the schema:

--orders.customer_id references customers.customer_id
--order_items.order_id references orders.order_id
--order_items.product_id references products.product_id

--Foreign Keys are used to maintain referential integrity between related tables. They ensure that a value in the child table must already exist in the parent table.

--If we try to insert an order with customer_id=999 and since customer_id = 999 does not exist in the customers table, SQL Server will reject the insert operation and generate a Foreign Key constraint error.
