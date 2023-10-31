-- Daniel Marabito
-- use create view to create the view.
create view EnrollmentSummary as select
c.course_number as "Course Number",
course_name as "Course Name", 
concat(i.first_name," ", i.last_name) as "Instructor's Name" , -- merge Names, space for readibility
s.student_id as "Student Id",
concat(s.first_name," ",s.last_name) as "Student Name",  -- merge Names, space for readibility
grade as "Grade"
from enrollments as e join courses as c  on e.course_number = c.course_number 
join instructors as i on c.instructor_id = i.instructor_id 
join students as s on e.student_id = s.student_id
order by c.course_number; -- sorted
select * from EnrollmentSummary;