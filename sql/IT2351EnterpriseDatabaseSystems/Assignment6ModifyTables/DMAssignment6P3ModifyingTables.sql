-- Daniel Marabito
-- Use where to restrict it to 1220. set Instructor_id to 3.
update courses
set instructor_id = 3
where course_number = 1220;
select * from courses;

