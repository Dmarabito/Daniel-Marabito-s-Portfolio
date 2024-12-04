<?php
session_start(); 
if (isset($_SESSION["userid"]))
{
    $PageDisplayable = true;
}
else
{
    header("Location: ./login.php");
}
?>

<?php 
	 	$Sortby = isset($_POST["sortby"]) ? 
			($_POST["sortby"] == '' ? "statename" : $_POST["sortby"])
			:"statename";
		
		$SortOrder = isset($_POST["order"]) ? $_POST["order"] : "ASC";

		$NumbOfRows = isset($_POST['NumbOfRows']) ?
			($_POST['NumbOfRows'] == "" ? "all" : $_POST['NumbOfRows']) 
			 : "all";

		$LimitStatement = $NumbOfRows == "all" ? "": (
			(int) $NumbOfRows != 0 ? " LIMIT ". $NumbOfRows : ""
		)
		
		// echo($NumbOfRows);  
	   ?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8"/>
   <style>
		table {width:50%; margin-left:auto; margin-right: auto; }
		tr:nth-of-type(even) {background-color: lightblue;}
		.header-td {width:17%; background-color: lightgray;} 
		.right {text-align: right;}
		.data-td {width:20%;}
		.data-table {border: 1px solid black;
					 border-collapse: collapse; 
					 margin-top: 30px;}
   </style>
   <title>Lab 13 - Area Population and Density Data</title>
</head>
<body>
   <header>
   <form action='lab13.php' method ='POST'>
	   <table>
	   <tr>
		   <td class="right header-td">
				Order By: 
		   </td>
		   <td class="header-td">
				<select name="sortby">
					<option value="" <?php echo($Sortby == "" ? 'selected="selected"':""); ?>>Sort Order</option>
					<option value="statename" <?php echo($Sortby == "statename" ? 'selected="selected"':""); ?>>Name</option>
					<option value="population" <?php echo($Sortby == "population" ? 'selected="selected"':""); ?>>Population</option>
					<option value="land_area" <?php echo($Sortby == "land_area" ? 'selected="selected"':""); ?>>Area</option>
					<option value="density" <?php echo($Sortby == "density" ? 'selected="selected"':""); ?> >Population Density</option>
				</select>
		   </td>
		   <td class="right header-td">
				ASC or DESC: 
		   </td>
		   <td class="header-td">
				<select name="order">
					<option value="ASC" <?php echo($SortOrder == "ASC" ? 'selected="selected"':""); ?>>Ascending</option>
					<option value="DESC" <?php echo($SortOrder == "DESC" ? 'selected="selected"':""); ?>>Descending</option>
				</select>
		   </td>
		   <td class="right header-td">
				Number of Rows:
		   </td>
		   <td class="header-td">
				<select name='NumbOfRows'>
					<option value="" <?php echo($NumbOfRows == "" ? 'selected="selected"':""); ?>>Number of Rows</option>
					<option value="5" <?php echo($NumbOfRows == "5" ? 'selected="selected"':""); ?>>5</option>
					<option value="10" <?php echo($NumbOfRows == "10" ? 'selected="selected"':""); ?>>10</option>
					<option value="25" <?php echo($NumbOfRows == "25" ? 'selected="selected"':""); ?>>25</option>
					<option value="all" <?php echo($NumbOfRows == "all" ? 'selected="selected"':""); ?>>All</option>
				</select>
		   </td>
		   <td>
				<input type="submit" value="Submit"> 
		   </td>
	   </tr>
	   </table>
	   </form>
   </header>



   <table class="data-table">
	   <tr class="data-table">
			<th class="data-table">State<?php echo($Sortby == "statename"? '*':''); ?> </th>
			<th class="data-table">Population<?php echo($Sortby == "population"? '*':''); ?></th>
			<th class="data-table">Area<?php echo($Sortby == "area"? '*':''); ?> (sq miles)</th>
			<th class="data-table">Denisity<?php echo($Sortby == "density"? '*':''); ?> (pop/sq mile)</th>
	   </tr>
	   
	   <?php 
	       $Dbusername = getenv("MySqlUsername");
		   $Dbpassword = getenv("MySqlPassword");
	    try {
			$connection = new PDO("mysql:host=localhost;dbname=marabito", $Dbusername, $Dbpassword);
			$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	
			$PreparedStatemet = $connection->prepare("select * from states order by " .$Sortby." ".$SortOrder.$LimitStatement.";");

			//$PreparedStatemet->bindParam(":sortby",$Sortby);

			$PreparedStatemet->execute();
			//$OutputPass = array();
			foreach($PreparedStatemet as $row){
				//$OutputPass[] = $results;
				echo('<tr class="data-table">'.
				'<td class="data-td data-table">'.$row[1].'</td>'.
				'<td class="data-td data-table">'.number_format($row[2]).'</td>'.
				'<td class="data-td data-table">'.number_format($row[3]).'</td>'.
				'<td class="data-td data-table">'.number_format($row[4]).'</td>'					
				.'</tr>');
			}
			//echo ("<h style='color:green;'>it was successful</h>");
			$connection == null;
		  } catch(PDOException $e) {
			echo $e->getMessage();
		  }
	
	   ?>

<!-- 	   <tr class="data-table">
			<td class="data-td data-table">ABC</td>
			<td class="data-td right data-table">NNNN</td>
			<td class="data-td right data-table">NNNN</td>
			<td class="data-td right data-table">NNNN</td>
	   </tr>
	   	   <tr class="data-table">
			<td class="data-td data-table">ABC</td>
			<td class="data-td right data-table">NNNN</td>
			<td class="data-td right data-table">NNNN</td>
			<td class="data-td right data-table">NNNN</td>
	   </tr>
	   	   <tr class="data-table">
			<td class="data-td data-table">ABC</td>
			<td class="data-td right data-table">NNNN</td>
			<td class="data-td right data-table">NNNN</td>
			<td class="data-td right data-table">NNNN</td>
	   </tr> -->
   </table>
   


</body>
</html>
