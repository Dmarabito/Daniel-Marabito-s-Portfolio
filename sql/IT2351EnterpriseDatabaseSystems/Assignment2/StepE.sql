-- Daniel Marabito
select orders.order_id as "Order ID", concat(customer_first_name," ",customer_last_name) as "Customer", -- combined customer name useing concat set as Customer
date_format(order_date, "%m/%d/%y") as "ordered", date_format(shipped_date, "%m/%d/%y") as "shipped",
item_id as "Item ID", order_qty as "Number of items"
from orders inner join customers on orders.customer_id = customers.customer_id
inner join order_details on orders.order_id = order_details.order_id -- joined order details using order_id as join point 
Order by customer_last_name, order_qty; -- sort by last name then quantity
