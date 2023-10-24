-- Daniel Marabito

-- create card table
create table card (
card_id int primary key auto_increment,
Type_id int not null,
Name varchar(30),
dp int,
level int,
stage varchar(30),
Number varchar(30) not null unique,
foreign key (type_id) references type(type_id) -- foreign key for the type, 1 digimon, 2 option, 3 tamer.
);

-- fill card table
insert into card (Type_id,Name,dp,level,stage,number)
values (1,"Agumon",2000,3,"Rookie","BT12-059"),
(1,"Omnimon Alter-S",15000,7,"Mega","EX4-060"),
(2,"Supreme Cannon",null,null,null,"BT5-096"),
(3,"Matt Ishida & Tai Kamiya",null,null,null,"EX4-061");