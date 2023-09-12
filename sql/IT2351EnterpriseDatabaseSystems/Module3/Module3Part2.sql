-- Daniel Marabito
select customer_last_name, order_date, shipped_date -- last name, order date, ship date.
from customers as c join orders as o on c.customer_id = o.customer_id -- joined them on customer_id. Used table aliases c and o
order by customer_last_name; -- sorted
