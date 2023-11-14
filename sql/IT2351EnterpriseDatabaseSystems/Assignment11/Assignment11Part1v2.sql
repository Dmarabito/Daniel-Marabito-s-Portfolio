-- Daniel Marabito
-- So this is a second attempt at this one. My previous version had the old and new in one row rather than two, since later questions expect it in two. I fixed it.
create table Course_Audit
(Audit_id int primary key auto_increment,
course_number int,
course_name varchar(20),
course_description varchar(60),
instructor_id int,
Change_Type varchar(20),
Change_time datetime
);
