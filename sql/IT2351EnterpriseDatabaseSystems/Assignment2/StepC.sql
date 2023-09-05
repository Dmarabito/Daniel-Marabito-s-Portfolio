-- Daniel Marabito
select order_id as "Order ID", customer_id as "customer Id", /* was unsure if order_id and customer_id were in the set refered to by these but I gave them an alias just in case.*/
concat(date_format(order_date, "%m"),"/",date_format(order_date, "%d"),"/",date_format(order_date, "%y")) as "ordered", -- decided to use concat to form the / on this one.
date_format(shipped_date, "%m/%d/%y") as "shipped" -- formated the date as month day year. Figured out I can put / in the date format rather then using concat.
from orders; -- table it is from