-- Daniel Marabito
select customer_id,title, artist, order_qty

from items as i 
join order_details as od on i.item_id = od.item_id -- joined items and order details on iem_id. set aliases for both using abreviation.
join orders as o on o.order_id = od.order_id -- added orders table on order_id joining it with order details. Used alias o
order by customer_id, title; -- sort by customer_id then by title
