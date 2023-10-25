-- Daniel Marabito

-- Create associated table between Cards and effects.
create table EffectAssociationWithCards(
CardEffect_Id int primary key auto_increment,
card_id int not null,
effect_id int not null,
foreign key (card_id) references card(card_id),
foreign key (effect_id) references effects(effect_id)
);

-- Fill table, each card has multiple effects. It is noteworthy that each effect could have multiple cards but that isn't the case among these 4.
insert into EffectAssociationWithCards(
card_id, effect_id
)
values 
-- agumon
(1,1),(1,2),
-- Omnimon Alter-S
(2,3), (2,4),
-- Supreme cannon
(3,5), (3,6),
-- matt and tai
(4,7),(4,8),(4,9)
;
