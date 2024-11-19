<!DOCTYPE HTML>
<html>  
<body>
<?php 
if(isset($_POST["fname"]))
{
    //decided not to share credentials so I used environment variables to store them. 
    //That way I don't have to set up .gitignore
    $username = getenv("MySqlUsername");
    $password = getenv("MySqlPassword");
    try {
        $connection = new PDO("mysql:host=localhost;dbname=marabito", $username, $password);
        $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $PreparedStatemet = $connection->prepare("INSERT INTO users (id, fname, lname, email) VALUES (:id, :fname, :lname, :email)");
        $PreparedStatemet->bindParam(":id",$id);
        $PreparedStatemet->bindParam(":fname",$_POST["fname"]);
        $PreparedStatemet->bindParam(":lname",$_POST["lname"]);
        $PreparedStatemet->bindParam(":email",$_POST["email"]);
        $id = uniqid();
        $PreparedStatemet->execute();
        echo ("<h style='color:green;'>it was successful</h>");
        $connection == null;
      } catch(PDOException $e) {
        echo $e->getMessage();
      }
}
?>
<form action="MarabitoLab11.php" method="post">
First Name: <input type="text" name="fname"><br>
Last Name: <input type="text" name="lname"><br>
E-mail: <input type="text" name="email"><br>
<input type="submit">
</form>

</body>
</html>