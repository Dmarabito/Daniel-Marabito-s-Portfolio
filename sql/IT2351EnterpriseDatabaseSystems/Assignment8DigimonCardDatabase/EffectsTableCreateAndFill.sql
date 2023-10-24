-- Daniel Marabito
-- Create effects table
Create table effects (
effect_id int primary key auto_increment,
Timing varchar (30),
effect_type varchar(30),
Description text not null
);
-- insert into effects table, digimon have alot of effects like 2-3 per card
insert into effects (Timing,effect_type,Description)
values 
-- agumon
("On Play","Main",
"Reveal the top 4 cards of your deck. Add 1 Digimon card with [Greymon]/[Omnimon] in its name and 1 tamer card with [Tai Kamiya] in its name among them to your hand.
Place the remaining cards at the bottom of your deck in any order."),
("All Turns","Inherited"," While this Digimon has [Greymon]/[Omnimon] in its name, it gets +1000 DP."),
-- omnimon Alter S
("When Digivolving","Main","Delete 1 of your opponent's Digimon with 8000 DP or less, then return 1 of your opponent's level 6 or higher Digimon to the bottom of its owner's deck."),
("All Turns","Main",
"When this Digimon would leave the battle area for a reason other than one of your effects, play 1 [BlitzGreymon] and 1 [CresGarurumon]
 from this Digimon's digivolution cards without paying their cost. Then, place this Digimon on bottom of your security stack face down."),
-- Supreme Cannon
("Main","Main",
" Return all of your opponent's Digimon with 3000 DP or less to their owners' hands. If you have a Digimon in play with [Omnimon]/[Garurumon]
 in its name, return all of your opponent's Digimon with 5000 DP or less to their owners' hands instead."),
 ("Security","Security","Activate this cards [Main] effect."),
 -- Matt Ishida & Tai Kamiya 
 ("Your Turn","Main","When you play a [Gabumon]/[Agumon], you may suspend this Tamer to gain 1 memory."),
 ("Your Turn","Main","[Once Per Turn] When one of your Digimon digivolves and you have 1 or fewer Digimon in play,
 you may play 1 [Gabumon] if that Digimon has [Greymon] in its name or 1 [Agumon]if that Digimon has [Garurumon] in its name from your hand or trash without paying its cost."),
 ("Security","Security","Play this card without paying its memory cost.")
;