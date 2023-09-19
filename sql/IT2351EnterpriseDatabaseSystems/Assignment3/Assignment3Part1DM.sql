-- Daniel Marabito
-- selected a count of products based on their id, and then got the average of the price.
select count(product_id) as "Product Count",
avg(list_price) as "Average Price"
from products;
