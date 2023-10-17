-- Daniel Marabito
create table game( -- creating it
Product_id int primary key auto_increment, -- Primary key
name varchar(30) not null,
version_number float not null, -- went with float for decimal point.
rating_id int not null,
foreign key (rating_id) references ratings(rating_id) -- foreign key for rating_id
);
insert into game (name, version_number, rating_id) -- inserting in
values
("Dark Souls", 1.07,3),
("Psychonauts", 1.0,2),
("Portal", 1.0,2)
;
select * from game;