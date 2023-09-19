 -- Daniel Marabito
 -- added the products table and the product_name.
 -- Ended up doing a right join to make hofner appear.
 select p.product_id as "Product Id", product_name, sum(quantity*(item_price-discount_amount)) as "Total Sales"
from order_items as oi right join products as p on oi.product_id = p.product_id
group by p.product_id
;
