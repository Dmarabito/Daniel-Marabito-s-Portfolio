-- Daniel Marabito
-- Replaced the join with a subquery pulling category_id from products and then pick only those in.
SELECT DISTINCT category_name
FROM categories
where category_id in (select category_id from products)
;