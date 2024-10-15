<!DOCTYPE HTML>  
<html>
<head>
	<title>IT 2600 - Lab 6 - Forms</title>
	<style>
	    body { margin: 100px 100px 100px 100px; }
		.red { color: red; }
	</style>
</head>
<body>  
<?php 
	$FirstName = $LastName = $DateOfBirth = $Website = $Comment = $MarriageStatus = "";
	$FirstNameError = $LastNameError = $DateOfBirthError = $WebsiteError = $CommentError = $MarriageStatusError = (bool) false;
	$FirstNameReqError = $LastNameReqError = (bool) false;
	$FirstNameValidCharError=$LastNameValidCharError= (bool) false;
	if (htmlSpecialchars($_SERVER["REQUEST_METHOD"]) == "POST") {
		Validation($_POST["fname"],$FirstName,$FirstNameReqError,true);
		if($FirstNameReqError == false){
			$FirstNameValidCharError= NameValidCharacterTest($FirstName);
			$FirstNameError = $FirstNameReqError||$FirstNameValidCharError;
		}
		Validation($_POST["lname"],$LastName,$LastNameReqError,true);
		if($LastNameReqError == false){
			$LastNameValidCharError = NameValidCharacterTest($LastName);
			$LastNameError = $LastNameReqError||$LastNameValidCharError;
		}
		Validation($_POST["dob"],$DateOfBirth,$DateOfBirthError,true);
		Validation($_POST["website"],$Website,$WebsiteError,true);
		Validation($_POST["comment"],$Comment,$CommentError,false);
		if (array_key_exists("mstatus",$_POST)){Validation($_POST["mstatus"],$MarriageStatus,$MarriageStatusError,true);}else{Validation("",$MarriageStatus,$MarriageStatusError,true);}
		
		

}

function Validation ($inText,&$VarToSet,&$ErrorVar, $req)
{
	if ((!empty($inText))||$req == false){
		$inText = htmlspecialchars($inText);
		$inText = stripslashes($inText);
		$inText = trim($inText);
		$VarToSet = $inText;
		$ErrorVar = (bool) false;
	}
	else{$ErrorVar = (bool) true;}
}

function collectiveValidation(...$Criteria){
foreach($Criteria as $Check){
	if ($Check == true){
		return true;
	}
}
}

function NameValidCharacterTest($NameIn){
	$NameAsArray = str_split($NameIn);
	$Alphabet = "abcdefghijklmnopqrstuvwxyz";
	$AlphaSpaceArray=str_split(
		$Alphabet.strtoupper($Alphabet)." "
	);
	return count(array_diff($NameAsArray,$AlphaSpaceArray))>0;
}

?>
	<h3>IT 2600 - Lab 6 - Forms</h3>
	<form action=<?php echo(htmlSpecialchars($_SERVER["PHP_SELF"]));?> method="POST">
		  First Name:<span class="red">*</span> <input type="text" name="fname" value=<?php echo($FirstName)?>> <span style="color:red;"> <?php echo($FirstNameReqError==true?"Field is required":"");?></span>
		 <span style="color:red;"><?Php echo($FirstNameValidCharError?"Only letters and white space allowed":"");?> </span> 
		  <br><br>
		  Last Name:<span class="red">*</span> <input type="text" name="lname" value=<?php echo($LastName)?>><span style="color:red;"> <?php echo($LastNameReqError==true?"Field is required":"");?></span>
		  <span style="color:red;"><?Php echo($LastNameValidCharError?"Only letters and white space allowed":"");?> </span>  
		  <br><br>
		  Date of Birth:<span class="red">*</span> <input type="date" name="dob" value=<?php echo($DateOfBirth)?>> <span style="color:red;"> <?php echo($DateOfBirthError==true?"Field is required":"");?></span>
		  <br><br>
		  Website:<span class="red">*</span> <input type="text" name="website" value=<?php echo($Website)?>><span style="color:red;"> <?php echo($WebsiteError==true?"Field is required":"");?></span>
		  <br><br>
		  Comment: <textarea name="comment" rows="5" cols="40" value=<?php echo($Comment)?>></textarea><span style="color:red;"> <?php echo($CommentError==true?"Field is required":"");?></span>
		  <br><br>
		  Marital Status:<span class="red">*</span>
		  <input type="radio" name="mstatus" value="single" <?php if ($MarriageStatus == "single"){echo("checked");}?>>Single
		  <input type="radio" name="mstatus" value="married" <?php if ($MarriageStatus == "married"){echo("checked");}?>>Married
		  <input type="radio" name="mstatus" value="complicated" <?php if ($MarriageStatus == "complicated"){echo("checked");}?>>It's Complicated
		  <span style="color:red;"> <?php echo($MarriageStatusError==true?"Field is required":"");?></span> 
		  <br /><br />
		  <input type="submit" value="Submit">
	 </form>
	 <h3>Your Input</h3>
	 
	 <?php 
		if(collectiveValidation($FirstNameError,$LastNameError,$DateOfBirthError,$WebsiteError,$CommentError,$MarriageStatusError)){
			$FirstName = $LastName = $DateOfBirth = $Website = $Comment = $MarriageStatus = "";
		};
		?>
	 First Name:   <?php echo($FirstName);?> <br />
	 Last Name:    <?php echo($LastName);?><br />
	 Date of Birth:<?php echo($DateOfBirth);?><br />
	 Website:      <?php echo($Website);?><br />
	 Comment:      <?php echo($Comment);?><br />
	 Marriage Status:  <?php echo($MarriageStatus);?><br />

	 <?php 
	 //Testing ground
	 //runTests();
	 function runTests(){
		WriteF("test.txt","w","");
		validationFunctionRemovesSpaces();
		NameValidCharacterTestIdentifysNumbers();
	 }
	 function validationFunctionRemovesSpaces(){
		$a = "";
		$b = false;
		Validation(" bug ",$a,$b, true);
		WriteF("test.txt","a","Trim test result: ");
		WriteF("test.txt","a", $a=="bug");
		WriteF("test.txt","a", $a);
	 }
	 function NameValidCharacterTestIdentifysNumbers(){
		WriteF("test.txt","a","\n Numbers rejected? ");
		WriteF("test.txt","a", NameValidCharacterTest("Bob123Alan"));
	 }
	 function WriteF($Path,$Mode,$Content){
		$file = fopen($Path,$Mode) or die("File failed to open");
		fwrite($file,$Content);
		fclose($file);
	 }
	 ?>
</body>
</html>