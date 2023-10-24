-- Daniel Marabito

-- create color table
create table color (
color_id int Primary key auto_increment,
Name varchar(10) not null
);

-- Insert colors in table
insert into color (Name)
values ('Black'),('Blue'),('Colorless'),('Green'),
('Purple'),('Red'),('White'),('Yellow');