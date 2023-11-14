-- Daniel Marabito
-- Set an event that triggers everyday stating at 21:00:00 which should be 9pm.
USE courses;
DROP EVENT IF EXISTS ClearAuditTable;
DELIMITER ;P
CREATE EVENT ClearAuditTable
ON SCHEDULE
     EVERY 1 day STARTS '2023-11-14 21:00:00'
DO
BEGIN
	truncate course_audit;
END ;P
DELIMITER ;
