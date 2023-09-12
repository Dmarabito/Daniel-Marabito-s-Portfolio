-- Daniel Marabito
select order_id as "Order id", customer_id as "Customer id", -- shipped_date
if(shipped_date is null, -- Checks if shipped_date is null assuming that means they haven't shipped.
"This order has not yet shipped.",-- if true, the order has not shipped
concat("This order was shipped on: ", date_format(shipped_date,"%m/%d/%y"))-- if false the order shipped, here is the date in this format.
) as "Shipment Status" -- added an alias.
from orders
where order_id > 700 -- Greater then 700
order by order_id; -- order by id
