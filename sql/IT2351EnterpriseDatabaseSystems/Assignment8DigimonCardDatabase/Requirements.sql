-- Daniel Marabito

-- Creating the requirements table, has a connection with color.
create table requirements(
requirement_id int primary key auto_increment,
level int,
color_id int,
Details text,
Foreign key (color_id) references color(color_id)
);

-- fill requirements table
insert into requirements(level, color_id,details)
values 
-- No requirement
(null,null,null),
-- agumon
(2,1,null), (null,null,"[koromon]"),
-- Omnimon Alter-S
(6,2,null),(6,6,null)
;