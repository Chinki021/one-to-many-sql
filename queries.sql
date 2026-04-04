/*Q1. Show each order along with the product name and price.
Q2. Show all products even if they were never ordered.
Q3.Show orders for only ‘Electronics’ category.
Q4.List all orders sorted by product price (high to low).
Q5.Show number of orders placed for each product.
Q6.Show total revenue earned per product.
Q7.Show products where total order revenue > ₹2000.
Q8.Show unique customers who ordered ‘Fitness’ products.*/


select * from products;
select * from orders;
--1
select o.order_id , p.product_id,p.price
from orders o
join products p
on o.product_id=p.product_id;
--2
select p.product_name , o.order_id
from products p
left join orders o
on o.product_id=p.product_id;
--3
select o.*
from orders o
join products p
on o.product_id=p.product_id
where p.category='Electronics';
--4
select o.order_id,p.product_name,p.price
from orders o
join products p
on o.product_id=p.product_id
order by p.price DESC;
--5
select p.product_name,count(o.order_id) as total_orders
from products p
left join orders o
on o.product_id=p.product_id
group by p.product_name;
--6
select  p.product_name,sum(p.price*o.quantity) as revenue
from products p
join orders o
on o.product_id=p.product_id
group by p.product_name;
--7
select  p.product_name,sum(p.price*o.quantity) as revenue 
from products p
join orders o
on o.product_id=p.product_id
group by p.product_name
having sum(p.price*o.quantity)>2000 ;
--8
select  distinct o.customer_name,p.category
from products p
join orders o
on o.product_id=p.product_id
where category='Fitness';

--views
--View 1: Available Fitness Product

CREATE VIEW available_fitness_products AS
SELECT product_id, name, price, stock_quantity
FROM products
WHERE category = 'Fitness' AND is_available = TRUE;

--View 2: Low Stock Products

CREATE VIEW low_stock_products AS
SELECT name, category, stock_quantity
FROM products
WHERE stock_quantity < 30;



