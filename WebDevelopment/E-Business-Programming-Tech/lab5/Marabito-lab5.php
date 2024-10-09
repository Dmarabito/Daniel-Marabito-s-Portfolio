<!DOCTYPE html>
<html>
<body>

<?php
	echo "<h2>Lab 5 - Arrays</h2>";
	
	$a = [11, 22, 33, 44, 55];
	$b = [5, 10, 15, 20, 25];
	// merge the arrays together 
    $c = array_merge($a,$b);
	// then sort that array and print it out
    sort($c);
	// use a for loop to print - not var_dump()
    for($i = 0; $i<sizeof($c); $i++)
    {
    print($c[$i]."<br/>");
    }
	
	echo "<br /><br />";
	$d = [2,4,6,8,10];
	$e = [1,2,3,4,5,6,7,8,9,10];
	// find the intersection of these two arrays
    $f = array_intersect($d,$e);
	// then sum the elements of that array and print out the result
	print(array_sum($f));
	echo "<br /><br />";
	$car = [];
	$k = "Year,Make,Model,Color,Owner";
	// use the explode function to convert $k to an array called $keys
	$keys = explode(",", $k);
	//print_r($keys);
	$v = "1976,AMC,Pacer,Baby Blue,Garth";
	// use the explode function to convert $v to an array called $values
	$values = explode(",",$v);
    //print_r($values);
	
	// using a for loop build an associative array named $car
	// use the sizeof function to determine how many iterations you need
	// you want the array to contain relationships like this:
	// $car = ["Year" => "1976"] 
    for($i=0; $i < sizeof($keys); $i++)
    {
    $car[$keys[$i]] = $values[$i];
    }
	//print_r($car["Make"]);
	
	// use a foreach loop to step through each key value pair 
	// in $car and print it out like this
	//   Year: 1976
	//   Make: AMC     blah blah blah
	foreach($car as $Dekey => $Devalue){
    print($Dekey.": ".$Devalue."<br/>");
    }

?>

</body>
</html>
