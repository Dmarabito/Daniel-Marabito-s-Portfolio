-- Daniel Marabito
use courses;
DROP PROCEDURE IF EXISTS LookupStudent;
DELIMITER ;P 
-- A face sticking out it's tongue for the end line character. Note to self don't comment on delimiter line or else things break.
CREATE PROCEDURE LookupStudent(input_student_id int) -- create procedure use input_student_id...
BEGIN
	select * from students where student_id = input_student_id; --  ...as student id for the where
END ;P
DELIMITER ; 
-- back to semi-colon.
