-- Daniel Marabito
-- Procedure to show your inventory

USE darksouls;
DROP PROCEDURE IF EXISTS CheckInventory;
DELIMITER ;P
CREATE PROCEDURE CheckInventory(input_name varchar(50))
BEGIN
select players.name, items.name, Quantity from inventory join items on inventory.ItemId = items.itemId join players on inventory.playerid = players.PlayerId
where players.name like concat(input_name,"%");

END ;P
DELIMITER ;