-- Daniel Marabito
-- had to change the group by from using id for category to using the name
-- Added roll up, added a groupby product name
-- commented out the order by.
select category_name as "Category",
product_name as "Product Name",
count(distinct p.product_id) as "Number Of Products",
sum(quantity) as "Total Quantity"
from products as p 
left join categories as c on p.category_id = c.category_id 
 left join order_items as oi on p.product_id = oi.product_id
group by c.category_name, product_name with rollup
-- order by count(p.product_id) desc
;