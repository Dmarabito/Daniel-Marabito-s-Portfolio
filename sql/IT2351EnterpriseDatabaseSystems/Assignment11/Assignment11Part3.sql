-- Daniel Marabito
-- Have an update to change course description on course number 1200. That should trigger my trigger, thus I have a select to show the course audit table.
update courses
set course_description = "The hundred and first history."
where course_number = 1200;
select * from course_audit;

