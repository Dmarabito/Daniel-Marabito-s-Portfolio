-- Daniel Marabito
drop table if exists inventory_audit;
create table inventory_audit
(AuditId int primary key auto_increment, Oldinventoryid int, OldPlayerId int, OldItemId int, OldQuantity int, Newinventoryid int, NewPlayerId int, NewItemId int, NewQuantity int, UpdateType varchar(20), UpdateTime dateTime);