-- Daniel Marabito
create table ratings(
Rating_id int primary key auto_increment, -- Primary key
Rating varchar(10) not null, -- I considered making it shorter but figured we leave a bit of wiggle room.
Rating_description text
);