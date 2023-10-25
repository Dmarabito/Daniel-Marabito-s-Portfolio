-- Daniel Marabito

-- Create card cost relationship
create table CardCostRelationship (
CardCostRelationship_Id int primary key auto_increment,
card_id int not null,
cost_id int not null,
foreign key (card_id) references card(card_id),
foreign key (cost_id) references costs(cost_id)
);

insert into CardCostRelationship (card_id, cost_id)
values
-- agumon
(1,1),(1,2),(1,3),
-- Omnimon Alter S
(2,5),(2,6),(2,7),
-- Supreme cannon
(3,8),
-- Matt & tai
(4,9)
;