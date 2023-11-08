-- Daniel Marabito
-- Have a procedure that takes in budget a decimal(12,2) which I did to match the output of sale_price.
-- The procedure does a select statement using sale_price which was made earlier.
-- This sale_price is also used as a filter when compared to budget.
USE daniel_guitar_shop;
DROP PROCEDURE IF EXISTS SalePriceBudgetProducts;
DELIMITER ;P
CREATE PROCEDURE SalePriceBudgetProducts(budget decimal(12,2))
BEGIN
select product_id,product_name, description, list_price, sale_price(product_id) as "Sale Price"
from products
where sale_price(product_id) < budget
;
END ;P
DELIMITER ;

