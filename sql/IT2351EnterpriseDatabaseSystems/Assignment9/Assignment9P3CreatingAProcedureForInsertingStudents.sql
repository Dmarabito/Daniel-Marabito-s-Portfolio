-- Daniel Marabito
-- Have the insert in there with input_first_name and last as the in vars to set who is added.
USE courses;
DROP PROCEDURE IF EXISTS AddStudent;
DELIMITER ;P
CREATE PROCEDURE AddStudent(input_first_name varchar(20), input_last_name varchar(20))
BEGIN
	insert into students (first_name,last_name)
	values
	(input_first_name, input_last_name);
	select * from students;
END ;P
DELIMITER ;
