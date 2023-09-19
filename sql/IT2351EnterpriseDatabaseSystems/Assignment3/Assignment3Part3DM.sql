-- Daniel Marabito
-- I added a join for the order_items table. I ended up going for a left join prefering to maintain all products.
-- Honestly the reason for the left join was simply to match the data.
-- added the total quantity calculation line.
-- sorted it based on product quantity.
-- added distinct to the product_id in order to match the data.
select category_name as "Category", count(distinct p.product_id) as "Number Of Products", sum(quantity) as "Total Quantity"
from products as p 
left join categories as c on p.category_id = c.category_id 
 left join order_items as oi on p.product_id = oi.product_id
group by c.category_id
order by count(p.product_id) desc
;
