-- Daniel Marabito
-- So I grouped it by product id and got the sum based on the provided formula.
select product_id as "Product Id", sum(quantity*(item_price-discount_amount)) as "Total Sales"
from order_items
group by product_id
;
