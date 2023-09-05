-- Daniel Marabito
select order_id as "Order ID", customer_last_name as "Last Name", -- got customer_last_name replacing customer id.
date_format(order_date, "%m/%d/%y") as "ordered", date_format(shipped_date, "%m/%d/%y") as "shipped" -- see C for explanation simplified f condensing.
from orders inner join customers on orders.customer_id = customers.customer_id -- inner join based on customer_id.
Order by customer_last_name;