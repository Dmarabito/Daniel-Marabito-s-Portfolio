-- Daniel Marabito
-- have catgory name, and count of product ids. Joined the tables on category_id. Then group by category_id.
select category_name as "Category", count(product_id) as "Number Of Products"
from products as p join categories as c on p.category_id = c.category_id
group by c.category_id;
