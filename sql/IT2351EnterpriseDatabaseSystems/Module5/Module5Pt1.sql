-- Daniel Marabito

create table jobs (
job_id int primary key auto_increment, -- made primary key auto increment
job_title varchar(30) not null, -- 30 charaters should be enough, not null for required
job_description text -- text is bigger
)

;

select * from jobs; -- will show the empty table.

