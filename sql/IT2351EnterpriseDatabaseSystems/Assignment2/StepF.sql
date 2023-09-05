-- Daniel Marabito

select orders.order_id as "Order ID", concat(customer_first_name," ",customer_last_name) as "Customer",
date_format(order_date, "%m/%d/%y") as "ordered", date_format(shipped_date, "%m/%d/%y") as "shipped",
artist as "Artist", title, unit_price as "price", -- replaced item id with artist. Then included the title and unit_price.
 order_qty as "Quantity"
from orders inner join customers on orders.customer_id = customers.customer_id
inner join order_details on orders.order_id = order_details.order_id
inner join items on order_details.item_id = items.item_id -- adding the item table based on item id.
Order by customer_last_name, order_qty;

/*
replace the item number with the artist 
add?? title
add the unit_price from the items table. 
add an additional join that includes the items table.
*/