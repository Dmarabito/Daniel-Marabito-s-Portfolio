<!DOCTYPE html>
<html>
<body>

<?php
function nameSwap($name, $age = null){
$Fname = substr(strstr($name,","),1,strlen(strstr($name,",")));
$Lname = substr($name,0,strpos($name,","));
if ($age != null){
return $Fname." ".$Lname." is ".$age." years old";
}
else {
return $Fname." ".$Lname.", age unknown";
}

}
echo nameSwap("McNulty, Jimmy", 35);
echo "</br>";
echo nameSwap("Bell, Russell (Stringer)", 32);
echo "</br>";
echo nameSwap("Little, Omar");
?>

</body>
</html>
