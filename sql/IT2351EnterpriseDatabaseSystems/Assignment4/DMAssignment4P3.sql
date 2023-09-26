-- Daniel Marabito
-- Changed the first half to be based on course number being null, and 2nd part where student_id.
select s.student_id, s.first_name, s.last_name, c.course_number, c.course_name
from students as s left join enrollments as e on s.student_id = e.student_id 
left join courses as c on e.course_number = c.course_number
where c.course_number is null
union
select s.student_id, s.first_name, s.last_name, c.course_number, c.course_name
from students as s right join enrollments as e on s.student_id = e.student_id 
right join courses as c on e.course_number = c.course_number
where s.student_id is null
;
