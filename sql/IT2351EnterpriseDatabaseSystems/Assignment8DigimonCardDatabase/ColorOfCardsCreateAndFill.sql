-- Daniel Marabito

-- Create ColorsOfCards associated table between colors and cards.
create table colorsOfCards(
cardColor_id int Primary key auto_increment,
Card_id int not null,
color_id int not null,
foreign key (card_id) references card(card_id),
foreign key (color_id) references color(color_id)
);

insert into colorsOfCards (card_id,color_id)
values 
-- agumon
(1,1), (1,6),
-- Omnimon alter-s
(2,7),
-- Supreme Cannon
(3,2),
-- Matt and tai
(4,2),(4,6);