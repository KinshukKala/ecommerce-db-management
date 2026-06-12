--SECTION C

--Q13. Count the total number of orders in the orders table. 

select count(*) as No_of_orders from orders;

--Q14. Find the total revenue (SUM of total_amount) from all 'Delivered' orders. 

select sum(total_amount) as total_revenue 
from orders 
where status = 'Delivered';

--Q15. Calculate the average unit_price of products in each category. 

select category, 
avg(unit_price) as avg_unit_price 
from products 
group by category;

--Q16. For each order status, find the count of orders and the total revenue. Sort the result by total revenue in descending order. 

select status,
count(*) as order_count,
sum(total_amount) as total_revenue
from orders
group by status 
order by sum(total_amount) desc;

--Q17. Find the most expensive (MAX) and cheapest (MIN) product in each category. 

select category,
max(unit_price) as most_expensive,
min(unit_price) as cheapest
from products
group by category;

--Q18. List all product categories where the average unit_price is greater than ₹2000. (Hint: Use HAVING clause) 

select category,
avg(unit_price) as avg_unit_price
from products
group by category
having avg(unit_price) > 2000;
