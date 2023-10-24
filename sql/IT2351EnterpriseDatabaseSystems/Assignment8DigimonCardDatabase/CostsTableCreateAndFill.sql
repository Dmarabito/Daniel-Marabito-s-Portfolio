-- Daniel Marabito

-- Creating the costs table
create table costs(
cost_id int primary key auto_increment,
Type varchar(30) not null,
Amount int not null
);

-- filling the cost table
insert into costs (Type, Amount)
values
-- agumon
("Play",3),
("Digivolve",1),
("Digivolve",0),
-- Omnimon Alter-S
("Play",15),
("Digivolve", 6),
("Digivolve", 6),
("DNA Digivolve",0),
-- Supreme Cannon
("Play",3),
-- Matt ishida & tai kamiya
("Play",4)
;