--SECTION B

--Q7. Retrieve all orders with status = 'Delivered'. 

select * from orders where status = 'Delivered';

--Q8. Find all products in the 'Electronics' category with a unit_price greater than ₹2000. 

select * from products where category='Electronics' and unit_price > 2000;

--Q9. List all customers who joined in the year 2024 and belong to the state 'Maharashtra'. 

select * from customers where join_date >= '2024-01-01' and join_date < '2025-01-01' and state='Maharashtra';

--Q10. Find all orders placed between '2024-08-10' and '2024-08-25' (inclusive) that are NOT cancelled.

select * from orders where order_date between '2024-08-10' and '2024-08-25' and status != 'Cancelled';

--Q11. Explain what the index idx_orders_date does. How would it improve the performance of a query that filters orders by order_date? Write a sample query that would benefit from this index. 

--The index idx_orders_date stores order dates in a sorted structure (B-Tree). Without it SQL would have to search every row taking O(n) time. Index allows searching to happen in O(log n) time.

select * from orders where order_date='2024-08-10';

--Q12. If you run: SELECT * FROM customers WHERE YEAR(join_date) = 2024; — would the index on join_date be used? Explain why or why not, and rewrite the query to be index-friendly (SARGable). 

--No as SQL has to calculate YEAR(join_date) for every row before comparing it with 2024. This makes it non-SARGable. 
