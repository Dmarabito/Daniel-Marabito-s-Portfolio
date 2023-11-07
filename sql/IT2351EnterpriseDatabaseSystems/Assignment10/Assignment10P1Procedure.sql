-- Daniel Marabito
USE daniel_guitar_shop;
DROP PROCEDURE IF EXISTS BudgetProducts;
DELIMITER ;P
CREATE PROCEDURE BudgetProducts(budget decimal(10,2))
BEGIN
select product_id, product_name, description, list_price from products
where list_price < budget
;
END ;P
DELIMITER ;
