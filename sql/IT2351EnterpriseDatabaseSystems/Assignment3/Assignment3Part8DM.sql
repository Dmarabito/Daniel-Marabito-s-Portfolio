-- Daniel Marabito
-- added having line ctrl-c/v my definition of total sales then put >= for at least, 800.
 select p.product_id as "Product Id", product_name, sum(quantity*(item_price-discount_amount)) as "Total Sales"
from order_items as oi right join products as p on oi.product_id = p.product_id
group by p.product_id
having sum(quantity*(item_price-discount_amount)) >= 800
;
