-- Daniel Marabito

select orders.order_id as "Order ID", concat(customer_first_name," ",customer_last_name) as "Customer",
date_format(order_date, "%m/%d/%y") as "ordered", date_format(shipped_date, "%m/%d/%y") as "shipped",
artist as "Artist", title, unit_price as "price",
 order_qty as "Quantity",
 order_qty*unit_price as "Total" -- added total as order quantity time price.
from orders inner join customers on orders.customer_id = customers.customer_id
inner join order_details on orders.order_id = order_details.order_id
inner join items on order_details.item_id = items.item_id
where shipped_date is null -- Only shows rows with null shipped date.
Order by customer_last_name, order_qty;
