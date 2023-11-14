USE courses;
DROP TRIGGER IF EXISTS courses_update_trigger;
DELIMITER ;P
CREATE TRIGGER courses_update_trigger
                BEFORE UPDATE ON courses
                FOR EACH ROW
BEGIN
	insert into course_audit values
    (default, old.course_number, old.course_name, old.course_description, old.instructor_id, "Data Before Update", now()),
    (default, new.course_number, new.course_name, new.course_description, new.instructor_id, "Data After Update", now());
END ;P
DELIMITER ;
