
<?php
    // After each of the following statements, write the statement that sets the variable 
	// Then under that, write an echo statement that writes out the variable and 
	// concatenates on the newline variable I have created here.  This will put each echo on its own line.

    $nl = "<br />";  //  newline
    echo "IT 2600 - Lab 2".$nl;
	
	// Create an integer variable named intx and set it equal to 25   (5 points)
	$intx = 25;
	echo $intx . $nl;
	// Create a float variable named floatx and set it equal to 3   (5 points)
	$floatx = 3.0;
	echo $floatx . $nl;
	// Create a string variable named string1 and set it equal to "ABC"   (5 points)
	$string1 = "ABC";
	echo $string1 . $nl;
	// Create a string variable named string2 and set it equal to "123"   (5 points)
	$string2 = "123";
	echo $string2 . $nl;
    // Write a statement that assigns the sum of intx and floatx to the variable sumx   (5 points)
	$sumx = intx + floatx;
	//resolves to 0
    echo $sumx . $nl;
    // Write a statement that assigns the concatenation  string1, a space, and then string2 to the variable string3   (5 points)
	$string3 = $string1." ".$string2;
	echo $string3 . $nl;
    // Find the remainder of intx divided by floatx and assign it to the variable remainderx   (5 points)
	$remainderx =  $intx % $floatx;
    echo $remainderx . $nl;
	$x = 28;
	// Write a statement to cast intx as a float
	// Then write a statement that compares sumx and x and assigns the word "True" if they are the same value and type, 
	// or False if they are not. Use the Ternary operator to do that comparison.
    // Assign the result to a variable named result. Then do the echo to print it out. 
	// You will have three lines of code.   (15 points)
	$intx = (float) $intx;
    /* I put the false in "" because apparently if a boolean value is printed directly then true becomes a 1. and false doesn't exist.*/
	$result = $sumx === x ? "True":"False";
	# here is the line with it the other way if you prefer.
    #$result = $sumx === x ? "True":false;
    echo $result . $nl;


?>
