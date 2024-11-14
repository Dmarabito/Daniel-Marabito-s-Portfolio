<?php
session_start();
?>
<!DOCTYPE html>
<html>
<body>

<?php
// remove all session variables
session_unset();

// destroy the session
session_destroy();
echo("All gone");
//BTW this file is just to end my session easier for testing.
?>

</body>
</html>