-- Daniel Marabito
create table EmployeePlural -- Named this because for whatever reason there is already an employees table that I didn't want to mess with.
(
employee_id int primary key auto_increment, -- primary key auto increment
employee_name varchar(30), -- employee name 30 characters should cover most but not all names.
job_id int,
hire_date date default (curdate()) , -- Ran into errors with getdate so swapped to curdate for the default date.
foreign key (job_id) references jobs(job_id) -- set up the foreign key


);

select * from employeeplural;