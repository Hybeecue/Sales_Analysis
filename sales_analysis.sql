-- 1. SELECT all columns from customers.
select * from customers;

-- 2. Show product_name and unit_price for products priced above 50.
select product_name, unit_price
from products
where unit_price > 50;

-- 3. Count how many customers are from Nigeria.
select count(*) 
from customers
where country = 'Nigeria';

-- 4. List orders with customer full name (first + last) and order_date.
Select o.orders_id, concat(c.first_name, ' ', c.last_name) as Full_Name, o.order_date
from orders as o
join customers as c
on o.customer_id = c.customer_id;

-- 5. Calculate total amount for each order (sum of unit_price * quantity) and list order_id, total_amount.
select order_id, sum(unit_price * quantity) as total_amount
from order_item
group by order_id;

-- 6. Find top 3 best-selling products by total quantity sold.
select p.product_name, sum(o.quantity) as total_quantity
from products as p
join -- join products tzble with order_item table
order_item as o
on 
p.product_id = o.product_id -- with product_id as a common factor
group by p.product_name
order by sum(o.quantity) desc
limit 3; -- limits the result by top 3

-- 7. Show customers who have placed more than one order.
-- 
select c.customer_id, concat(c.first_name, ' ', c.last_name) as Full_Name, count(o.customer_id) as order_count
from orders as o
join
customers as c
on o.customer_id = c.customer_id
group by c.customer_id
having count(o.customer_id) > 1
;-- having shows customers that ordered appeared more than once in the orders table

-- 8. Find products with low stock (units_in_stock < 50).
select * 
from products
where units_in_stocks < 50;

-- 9. For each month in 2024, show total sales amount.
select o.order_date, sum(oo.quantity*oo.unit_price) total_sales_amount
from orders as o
join
order_item as oo
on o.orders_id = oo.order_id
group by o.order_date;

-- 10. Write a query to show the average order value per customer.
select c.customer_id, concat(c.first_name, ' ', c.last_name) as Full_Name, avg(oo.quantity*oo.unit_price) as avg_order
from customers as c
join
orders as o
on o.customer_id = c.customer_id
join 
order_item as oo 
on o.orders_id = oo.order_id
group by customer_id;

-- 12. Find products that were never sold.
select p.product_id, p.product_name
from products as p
left join 
order_item as oo
on p.product_id = oo.product_id
where oo.product_id is null
;

-- 13. Create a query to join orders, order_items and products and show order_id, product_name, quantity, line_total.
select o.orders_id, p.product_name, oo.quantity, (oo.quantity*oo.unit_price) as line_total
from orders as o
join order_item as oo
on o.orders_id =oo.order_id
join products as p
where p.product_id = oo.product_id;

-- 14. Find the supplier(s) who supply products in the 'Electronics' category. (Assume a mapping table if needed — write how you'd add it.)
-- electronics is a subset of tech 
-- so query for suppliers with tech in the name
select * 
from suppliers
where supplier_name like '%tech%';

-- 15. Alter the customers table to add a phone_number VARCHAR(20).
alter table customers
add phone varchar (255);

-- 16. Drop the inventory_movements table.
drop table inventory_movements;

-- 17. Write an UPDATE statement to correct an email address for customer_id = 5.
update customers
set email = 'xyz@gmail.com'
where customer_id = 5;

-- 18. Create a view top_customers that lists customers with total_spent and rank them by total_spent.
-- create a view joining the products, orders and order item tables
 create view top_customers as 
 select o.customer_id, concat(' ', c.first_name, c.last_name) as Name, 
 sum(oo.quantity*oo.unit_price)as total_spent
 from customers as c
 join orders as o
 on c.customer_id = o.customer_id
 join order_item as oo
 on o.orders_id=oo.order_id
group by o.customer_id;
-- rank with window function
select customer_id, Name, total_spent, dense_rank() over (order by total_spent desc) as customer_rank
from top_customers;

-- 19. Write a stored procedure that, given an order_id, returns the order's total amount and list of items.
Delimiter $$
create procedure Orders_log(in input_order_id int)
Begin 
select p.product_id, p.product_name, sum(oo.unit_price*oo.quantity) as Total_amount
from products as p
join order_item as oo
on p.product_id = oo.product_id
group by p.product_id
;
end $$

Call orders_log(1001);

-- 20. Create a report query that shows for each product: product_name, 
-- total_sold_quantity, total_revenue, current_units_in_stock.

select p.product_id, p.product_name, sum(oo.quantity), sum(oo.unit_price*oo.quantity) as Revenue, p.units_in_stocks
from products as p
join
order_item as oo
on p.product_id = oo.product_id
group by p.product_id
;
