-- Daniel Marabito
-- Used a subquery to get the average price and then checked if list_price is less in the where.
select *
from products
where list_price < (select avg(list_price) from products)
;

