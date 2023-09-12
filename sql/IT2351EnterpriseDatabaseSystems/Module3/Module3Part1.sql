-- Daniel Marabito
select item_id, title, artist,
round(unit_price * 1.09,2) as "Price with Tax" -- this line does the multipication, the rounding and the ailas.
from items
order by unit_price desc; -- this line orders by price in descending order.
