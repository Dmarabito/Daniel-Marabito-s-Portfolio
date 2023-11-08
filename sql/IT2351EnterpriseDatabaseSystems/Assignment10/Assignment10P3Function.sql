-- Daniel Marabito
-- So I made the sale_price function, it use ;P as the delimiter. It takes in an int in the var input_product_id.
-- It returns a decimal with 12 digits and 2 decimal points. I made sure it was somewhat bigger then the list_price to acount for some growth.
-- That said it is likely not neccesary since the number should shrink not grow.
USE daniel_guitar_shop;
DROP FUNCTION IF EXISTS sale_price;
DELIMITER ;P
CREATE FUNCTION sale_price (input_product_id int)
    RETURNS decimal(12,2)
    DETERMINISTIC READS SQL DATA
BEGIN
declare Output_Sale_Price decimal(12,2);
select (list_price - (list_price*discount_percent*.01)) into Output_Sale_Price
from products
where product_id = input_product_id;
    RETURN(Output_Sale_Price);
END ;P
DELIMITER ;
