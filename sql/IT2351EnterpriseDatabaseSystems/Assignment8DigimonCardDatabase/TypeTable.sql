-- Daniel Marabito

-- create type table
create table type(
Type_id int primary key auto_increment,
Name varchar(30) not null
);

-- fill type table
insert into type (Name)
values ("Digimon"),("Option"),("Tamer");