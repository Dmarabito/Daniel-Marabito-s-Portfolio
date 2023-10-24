-- Daniel Marabito

-- creating the trait table
create table traits (
Trait_id int primary key auto_increment,
Name varchar(30)
);

-- insert into traits, decided to include a null trait for cards without traits.
insert into traits (name)
values (null),('Vacine'),('Data'),('Virus'),('Reptile'),('Holy warrior');