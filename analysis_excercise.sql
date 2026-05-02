-- Sample Sales Dataset and Exercises
-- File: Sample_Sales_Exercises.sql
-- ==========================
-- EXERCISES / QUESTIONS
-- ==========================
-- Beginner
-- 1. SELECT all columns from customers.
-- 2. Show product_name and unit_price for products priced above 50.
-- 3. Count how many customers are from Nigeria.

-- Intermediate
-- 4. List orders with customer full name (first + last) and order_date.
-- 5. Calculate total amount for each order (sum of unit_price * quantity) and list order_id, total_amount.
-- 6. Find top 3 best-selling products by total quantity sold.
-- 7. Show customers who have placed more than one order.
-- 8. Find products with low stock (units_in_stock < 50).

-- Advanced
-- 9. For each month in 2024, show total sales amount.
-- 10. Write a query to show the average order value per customer.
-- 11. Use a window function to show each order and the cumulative sales running total ordered by order_date.
-- 12. Find products that were never sold.
-- 13. Create a query to join orders, order_items and products and show order_id, product_name, quantity, line_total.
-- 14. Find the supplier(s) who supply products in the 'Electronics' category. (Assume a mapping table if needed — write how you'd add it.)

-- Data Cleaning / DDL
-- 15. Alter the customers table to add a phone_number VARCHAR(20).
-- 16. Drop the inventory_movements table.
-- 17. Write an UPDATE statement to correct an email address for customer_id = 5.

-- Challenge / Project-style
-- 18. Create a view top_customers that lists customers with total_spent and rank them by total_spent.
-- 19. Write a stored procedure that, given an order_id, returns the order's total amount and list of items.
-- 20. Create a report query that shows for each product: product_name, total_sold_quantity, total_revenue, current_units_in_stock.
