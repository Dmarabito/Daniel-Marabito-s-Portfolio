-- Daniel Marabito
-- I limit the select to where ship_date is null. 
-- Then I get a count of order_id, and a sum of ship_amount
select
count(order_id) as "Unshipped Orders",
sum(ship_amount) as "Total Amount Unshipped"
from orders
where ship_date is null;
