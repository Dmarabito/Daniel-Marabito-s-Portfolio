-- Daniel Marabito

-- Create the cardTraits table
Create table cardTraits (
cardTraits_id int primary key auto_increment,
Trait_id int not null,
card_id int not null,
foreign key (trait_id) references traits(trait_id), -- Foreign key for traits as a reminder 1 is null
foreign key (card_id) references card(card_id) -- Foreign key for card id.
);

-- fill card traits
insert into cardTraits (trait_id,card_id)
values 
-- agumon
(2,1),
(4,1),
-- omnimon alter-s
(4,2),
(6,2),
-- Supreme Cannon
(1,3),
-- Matt ishida & Tai Kamiya
(1,4)
;
