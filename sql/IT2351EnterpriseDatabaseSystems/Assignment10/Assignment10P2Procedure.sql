-- Daniel Marabito
-- Had to deal with some sloppy request writting.
-- I decided that there had to be a typo in on of two places to begin. Either the table name provided products was wrong, or the use of both was wrong.
-- Both implies two things. The products table requires more then two things. 
-- So based on the name NewCategory, I decided it was about inserting into the categories table.
-- Another potential point of inaccuracy. The prompt presents the binary of if it is successful or not.
-- However the output message is based on a slightly different binary which is if the row was duplicated or not.
-- As a result I ended up using 1062 rather then the general error handler.
USE daniel_guitar_shop;
DROP PROCEDURE IF EXISTS NewCategory;
DELIMITER ;P
CREATE PROCEDURE NewCategory(input_category_id int, input_category_name varchar(255))
BEGIN
declare ErrorHappend int;
declare continue handler for 1062
set ErrorHappend = 1;
insert into categories
values
(input_category_id,input_category_name);
select if(ErrorHappend = 1,"Row was not inserted - duplicate entry","1 row was inserted");
END ;P
DELIMITER ;
