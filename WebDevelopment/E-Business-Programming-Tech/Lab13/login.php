<?php 
    if (isset($_POST["Password"]) && isset($_POST["email"]))
    {

        // Get data from database
    $Dbusername = getenv("MySqlUsername");
    $Dbpassword = getenv("MySqlPassword");
    try {
        $connection = new PDO("mysql:host=localhost;dbname=marabito", $Dbusername, $Dbpassword);
        $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $PreparedStatemet = $connection->prepare("select password from users where email=:email;");
/*         $PreparedStatemet->bindParam(":id",$id);
        $PreparedStatemet->bindParam(":fname",$_POST["fname"]);
        $PreparedStatemet->bindParam(":lname",$_POST["lname"]);
 */
        $PreparedStatemet->bindParam(":email",$_POST["email"]);
        //$PreparedStatemet->bindParam(":password", $HashedPWord);
        //$id = uniqid();
        $PreparedStatemet->execute();
        $OutputPass = array();
        foreach($PreparedStatemet as $results){
            $OutputPass[] = $results;
        }
        echo ("<h style='color:green;'>it was successful</h>");
        $connection == null;
      } catch(PDOException $e) {
        echo $e->getMessage();
      }


      if(isset($OutputPass)){
        echo(count($OutputPass));
        $PassHold = count($OutputPass) > 0 ? $OutputPass[0][0] : ""; 
      }
      else {
        $PassHold = "";
      }

        // if(password_verify($_POST["Password"],GrabHash()))
        if(password_verify($_POST["Password"],$PassHold))
        {
            session_start();
            $_SESSION["userid"] = $_POST["email"];
            header("Location: ./lab13.php");
            exit;
        }
        else{
            $MatchFailed = true;
        }
    }

    function GrabHash(){
        $f = fopen("password.txt","r") or die("Nooooooo");
        $contents = fread($f,filesize("password.txt"));
        fclose($f);
        return $contents;
    }
?>
<html>
<body>
<h2>Login</h2>
<form action="login.php" method="POST">
Email: <input type="text" name="email"><br>
<!-- Username: <input type="text" name="userid"><br> -->
Password: <input type="password" name="Password"><br>
<input type="submit">
</form>

<p><?php
if(isset($MatchFailed)){
    echo($MatchFailed?"Invalid username or password.":"");
}
?>   
</p>

</body>
</html>