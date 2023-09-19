-- Daniel Marabito
-- added an if grouping for both category_name and product_name.
select 
if(grouping(category_name), "Grand total", category_name) as "Category",
if(grouping(product_name), "Category total", product_name) as "Product Name",
count(distinct p.product_id) as "Number Of Products",
sum(quantity) as "Total Quantity"
from products as p 
left join categories as c on p.category_id = c.category_id 
 left join order_items as oi on p.product_id = oi.product_id
group by c.category_name, product_name with rollup
;
