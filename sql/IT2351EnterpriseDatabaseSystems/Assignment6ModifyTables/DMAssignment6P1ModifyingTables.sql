-- Daniel Marabito
-- The minimum is 2, since first_name,last_name are both not null without default. Instructor_id autoincrements.
insert into instructors (first_name,last_name)
values ("Harriet","H");
select * from instructors;
