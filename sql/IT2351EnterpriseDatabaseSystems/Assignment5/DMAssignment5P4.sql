-- Daniel Marabito
select product_name as "item",
list_price as "Price",
if(/*condition*/ category_id = 1, -- if category is guitatrs.
/*True*/round(list_price-(list_price*(discount_percent/100)),2), -- then discout percent is turned into a decimal by dividing by 100. 
-- continuing previous line: Then that is multiplied by list price to give amount to discount, that is subtracted from the list price to get the sale price. Finally round to 2 decimals.
/*False*/ list_price) -- else use the list_price.
 as "Sale Price" -- call that the sale price
from products
;