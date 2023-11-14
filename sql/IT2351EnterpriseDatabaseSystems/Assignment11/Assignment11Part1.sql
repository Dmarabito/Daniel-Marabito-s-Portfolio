-- Daniel Marabito
-- So I made the table with a primary key and old and new version of each column. Eventually started copying and pasing to make it faster.
-- Finally we have a column for the type of change, and one for the date time of the change.
create table Course_Audit
(Audit_id int primary key auto_increment,
old_course_number int,
new_course_number int,
old_course_name varchar(20),
new_course_name varchar(20),
old_course_description varchar(60),
new_course_description varchar(60),
old_instructor_id int,
new_instructor_id int,
Change_Type varchar(20),
Change_time datetime
);
