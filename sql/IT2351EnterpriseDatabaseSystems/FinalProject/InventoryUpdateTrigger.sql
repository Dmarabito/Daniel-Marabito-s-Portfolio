-- Daniel Marabito

USE darksouls;
DROP TRIGGER IF EXISTS inventory_before_update;
DELIMITER ;P
CREATE TRIGGER inventory_before_update
                BEFORE UPDATE ON inventory
                FOR EACH ROW
BEGIN
insert into inventory_audit
values
(default,old.inventoryId,old.playerId,old.itemId,old.quantity,new.inventoryId,new.playerId,new.itemId,new.quantity, 'update', now());
END ;P
DELIMITER ;