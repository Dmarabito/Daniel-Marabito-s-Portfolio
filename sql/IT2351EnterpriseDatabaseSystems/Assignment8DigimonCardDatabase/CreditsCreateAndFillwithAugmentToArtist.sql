-- Daniel Marabito
-- Start this with making an option for unknown artist for credits
insert into artists (first_name,last_name)
values ("Unknown", null);

-- create credit table
Create table credits (
Credit_id int primary key auto_increment,
Card_id int not null,
Artist_id int not null,
foreign key (card_id) references card(card_id),
foreign key (artist_id) references artists(artist_id)
);

-- Filling Credits
insert into credits (Card_id,Artist_id)
values
-- agumon
(1,1),
(1,2),
-- Omnimon Alter-S
(2,3),
(2,4),
(2,4),
-- Supreme Cannon
(3,2),
-- Matt and Tai using the unknown added above
(4,5)
;