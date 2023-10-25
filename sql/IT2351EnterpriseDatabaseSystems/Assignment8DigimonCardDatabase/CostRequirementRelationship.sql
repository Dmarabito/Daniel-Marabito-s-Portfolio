-- Daniel Marabito

-- Create cost requirement relationship
create table CostRequirementRelationship (
CostRequirementRelationship_Id int primary key auto_increment,
cost_id int not null,
requirement_id int not null,
foreign key (cost_id) references costs(cost_id),
foreign key (requirement_id) references requirements(requirement_id)
);

-- Fill table
insert into CostRequirementRelationship (cost_id,requirement_id)
values 
-- agumon
(1,1),(2,2),(3,3),
-- Onimon Alter-s
(4,1),(5,4),(6,5),(7,4),(7,5),
-- Supreme cannon
(8,1),
-- Matt & tai
(4,1)
;