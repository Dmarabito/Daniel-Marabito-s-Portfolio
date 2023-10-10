-- Daniel Marabito
-- I went with using couse number since that is the primary key. Just used an or to pick both.
update courses
set instructor_id = 3
where course_number = 1120 or course_number = 1130;

select * from courses;
