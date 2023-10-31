-- Daniel Marabito
-- Create a procedure that takes course number and returns the instructor in charge, will give "Instructor Not Yet Assigned".
-- I noticed with current data set there is an instructor for each course.
USE courses;
DROP PROCEDURE IF EXISTS CheckInstructor;
DELIMITER ;P
CREATE PROCEDURE CheckInstructor(input_course_number int)
BEGIN
	select if(courses.instructor_id is null,"Instructor Not Yet Assigned",concat(first_name," ",last_name)) as "Instructor in Charge"
	from courses join instructors on courses.instructor_id = instructors.instructor_id
	where course_number = input_course_number;
END ;P
DELIMITER ;
