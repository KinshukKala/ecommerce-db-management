--SECTION E


--Q24. Write a query using CASE to classify products into price tiers: 
--  • 'Budget'    → unit_price < 1000 
--  • 'Mid-Range' → unit_price BETWEEN 1000 AND 3000 
--  • 'Premium'   → unit_price > 3000 
--Display: product_name, unit_price, price_tier. 

select product_name,
unit_price,
case 
when unit_price < 1000 then 'Budget'
when unit_price between 1000 and 3000 then 'Mid-Range'
when unit_price > 3000 then 'Premium'
end as price_tier
from products;

--Q25. Using a CASE statement inside an aggregate function, count how many orders are 'Delivered' vs 'Not Delivered' (all other statuses). Display the result in a single row. 

select
count(case 
when status = 'Delivered' then 1
end) as Delivered,
count(case 
when status != 'Delivered' then 1
end) as [Not Delivered]
from orders;

--Q26. Explain each letter of ACID: 
--  • A – Atomicity 
--  • C – Consistency 
--  • I – Isolation 
--  • D – Durability 
--Give a real-world example (e.g., bank transfer) showing why each property is important. 

--ACID properties ensure that database transactions are processed reliably and maintain data integrity.

--A – Atomicity

--Atomicity means that a transaction is treated as a single unit of work. Either all operations succeed, or none of them are applied.

--Bank Transfer Example:
--Suppose 1000 is transferred from Account A to Account B.

--Step 1: Deduct 1000 from A
--Step 2: Add 1000 to B

--If the system crashes after Step 1 but before Step 2, the transaction must be rolled back so that money is not lost.

--C – Consistency

--Consistency ensures that a transaction moves the database from one valid state to another valid state while obeying all constraints and rules.

--Bank Transfer Example:

--Before transfer:

--A = 5000
--B = 3000
--Total = 8000

--After transferring 1000:

--A = 4000
--B = 4000
--Total = 8000

--The total money remains unchanged.

--I – Isolation

--Isolation ensures that multiple transactions running at the same time do not interfere with each other.

--Bank Transfer Example:

--Suppose two ATMs try to withdraw money from the same account simultaneously.

--Without isolation:

--ATM 1 reads balance = 5000
--ATM 2 reads balance = 5000
--Both withdraw 4000

--Result:

--Balance = -3000

--With proper isolation, one transaction completes before the other sees the updated balance.

--D – Durability

--Durability ensures that once a transaction is committed, its changes are permanently saved even if the system crashes.

--Bank Transfer Example:

--After a successful transfer, If the power goes out immediately afterward, the transaction should still exist when the database restarts.



--Q27. Write a SQL transaction that does the following atomically: 
--  1. Insert a new order (order_id=1011, customer_id=102, today's date, 'Pending', 1598.00) 
--  2. Insert two order items for that order 
--  3. Update the stock_qty of the purchased products 
--  4. If any step fails, ROLLBACK the entire transaction. Otherwise, COMMIT. 
--Write the complete BEGIN...COMMIT/ROLLBACK block. 

BEGIN TRY
    BEGIN TRANSACTION;
        insert into orders values(1011,102,getdate(),'Pending',1598.00)

        insert into order_items values(5016,1011,201,1,1499.0,0);
        insert into order_items values(5017,1011,202,1,799.0,0);

        update products 
        set stock_qty = stock_qty - 1
        where product_id = 201;

        update products 
        set stock_qty = stock_qty - 1
        where product_id = 202;

        COMMIT TRANSACTION;

        print 'Transaction completed successfully';
END TRY

BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Transaction failed';
END CATCH