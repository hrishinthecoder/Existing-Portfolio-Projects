-- Question 01
select count(orders.id) as total_orders from orders;

-- Question 02
select * from order_details;
select * from pizzas;

select round(sum(order_details.quantity * pizzas.price),3 ) as Revenue_generated
from order_details join pizzas  on order_details.pizza_id = pizzas.pizza_id;

-- Question 03

select pizza_id,price from pizzas
order by price DESC;
 --             OR
SELECT pizza_types.name, pizzas.price from pizzas join pizza_types on pizzas.pizza_type_id = pizza_types.pizza_type_id
order by pizzas.price DESC LIMIT 1;

-- Question 04

select quantity, count(order_details_id) as frequency
from order_details group by quantity;

-- Question 05

select pizzas.size as size , count(order_details.pizza_id) as frequency from pizzas  
join order_details  on pizzas.pizza_id = order_details.pizza_id
group by size
order by frequency DESC;

-- Question 06
Select pizza_types.name,count(order_details.order_details_id) as frequency,sum(order_details.quantity) as quantity from pizzas
join pizza_types on pizzas.pizza_type_id = pizza_types.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name
order by frequency DESC
LIMIT 5;

-- Question 07
select pizza_types.category, count(order_details.quantity) as quantity
from pizza_types join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details on order_details.pizza_id = pizzas.pizza_id
group by  pizza_types.category order by quantity DESC;

-- Quesion 08
select hour(order_t) as hours,count(id ) as order_count from orders group by hour(order_t) order by count(id) DESC;

-- Question 09
select category, count(name) from pizza_types group by category;

-- Question 10
select round(avg(quantity),0) from
(select orders.order_date , sum(order_details.quantity) as quantity from orders join order_details on orders.Id = order_details.order_id group by orders.order_date )
as o_quantity;