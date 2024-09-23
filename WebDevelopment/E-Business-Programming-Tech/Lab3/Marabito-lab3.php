<?php
	echo "<h2>IT 2600 - Lab 3</h3>";
	// put your code under each comment and turn in this file

	echo "<br />IF STATEMENT<br />";
	$score = 75;
	// write an if/elseif/else statement that writes out a grade based on $score 
	// using the grading scale:
	// 90 - 100 = A
	// 80 - 89 = B
	// 70 - 79 = C
	// 60 - 69 = D
	// less thaan 60 = F
    
    //Notably this scale doesn't support over 100 so over achievers don't get a grade.
	
    if ($score>=90 and $score <= 100){echo "A";}
    else if ($score>=80 and $score<=89){echo "B";}
    else if ($score>=70 and $score<=79){echo "C";}
    else if ($score>=60 and $score<=69){echo "D";}
    else if ($score<60){echo "F";}
    else {echo "N/A";}
	echo "<br />SWITCH STATEMENT<br />";
	// write the same result using a switch statement
	switch(true)
    {

    case $score >=90 and $score <= 100: echo "A"; break;
    case $score >=80 and $score <= 89: echo "B"; break;
    case $score >=70 and $score <= 79: echo "C"; break;
    case $score >=60 and $score <= 69: echo "D"; break;
    case $score <= 60: echo "F"; break;
    default: echo "N/A";
    }
	echo "<br />FOR LOOP<br />";
	// write a for loop that starts at 5 and counts up to 25 by 5's
    for ($i=5; $i<=25; $i+=5){
    echo $i."<br />";
    }
	
	echo "<br />WHILE LOOP<br />";
	$x = 12;
	$y = 1;
	// write a while loop that writes out the value of $y as long as it is less than $x
	// increment $y by 1 each time through the loop
    while($y<$x){
    echo($y++."<br />");
    }
	
	$i = 10;
	echo "<br />DO WHILE LOOP<br />";
	// write a do while loop that writes out the value of $i if it is less that 5
	// increment $i by 1 each time through the loop
	do{echo $i++."<br />";} while($i<5);
    
	echo "<br />LOOP CONTROL<br />";
	// write a for loop that starts at 10 and counts down to 1 writing out the number 
	// each iteration. But do not write out the number if it is 5 or 7. hint: continue
    for ($i = 10; $i>0; $i--){
    if($i==5 or $i== 7){continue;}
    echo($i."<br />");
    }

?>