-- Daniel Marabito
select distinct title as "album", artist as "Musician", unit_price as "price", order_qty as "quantity", -- Useing distinct select long with a bunch of columns with aliases.
round(order_qty*unit_price*1.07,2) as "Total with Tax" -- calc total tax using multipcation rounding and giving an alias.
from items inner join order_details on order_details.item_id = items.item_id; -- doing an inner join between items and order details based on the shared collumn item_id.