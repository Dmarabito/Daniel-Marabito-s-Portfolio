-- Daniel Marabito
-- an insert procedure with error handling.
USE darksouls; DROP PROCEDURE IF EXISTS InsertSpawn;
DELIMITER ;P
CREATE PROCEDURE InsertSpawn(input_enemyId int, input_LocationId int, input_BaseHp int, input_BaseSouls int, input_Respawn boolean)
BEGIN 

declare ErrorVar int; declare exit handler for sqlexception set ErrorVar = 1;
start transaction;
insert into spawns (enemyId,LocationId,BaseHp,BaseSouls,Respawn) values (input_enemyId,input_LocationId,input_BaseHp,input_BaseSouls,input_Respawn);
if ErrorVar = 1 then
rollback;
select "Error Happened" as "Message";
commit;
else select "Insert Successful" as "Message";
end if;
END ;P
DELIMITER ;