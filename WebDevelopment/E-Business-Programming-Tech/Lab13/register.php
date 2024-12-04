<?php
/*     if (isset($_POST["Password"])){
        Reception();
    } */
    
    function Reception(){
        if($_POST["Password"]==$_POST["ConfirmPassword"]){
            // (Store password)
            $HashedPWord = password_hash($_POST["Password"],PASSWORD_BCRYPT);
            return $HashedPWord;
        }
    }

    function Store($Content,$location="password.txt"){
        $f = fopen($location,"w") or die("What a cruel cruel world.");
        fwrite($f,$Content);
        fclose($f);
    }
?>

<!-- Dirty lab 11 code -->

<?php 
if(isset($_POST["fname"]) and isset($_POST["Password"]))
{
    //decided not to share credentials so I used environment variables to store them. 
    //That way I don't have to set up .gitignore
    $Dbusername = getenv("MySqlUsername");
    $Dbpassword = getenv("MySqlPassword");
    $HashedPWord = Reception();
    try {
        $connection = new PDO("mysql:host=localhost;dbname=marabito", $Dbusername, $Dbpassword);
        $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $PreparedStatemet = $connection->prepare("INSERT INTO users (id, fname, lname, email, password) VALUES (:id, :fname, :lname, :email, :password)");
        $PreparedStatemet->bindParam(":id",$id);
        $PreparedStatemet->bindParam(":fname",$_POST["fname"]);
        $PreparedStatemet->bindParam(":lname",$_POST["lname"]);
        $PreparedStatemet->bindParam(":email",$_POST["email"]);
        $PreparedStatemet->bindParam(":password", $HashedPWord);
        $id = uniqid();
        $PreparedStatemet->execute();
        echo ("<h style='color:green;'>it was successful</h>");
        $connection == null;
      } catch(PDOException $e) {
        echo $e->getMessage();
      }
}
?>

<!DOCTYPE html>
<html>
    <script>
        function Validation(){
            if(PasswordsMatch())
            {
                return true;
            }
            return false;
        }
    function PasswordsMatch(){
        if(document.getElementById('Pword').value == document.getElementById("ConfPword").value){
            return true;
        }
        if(document.getElementById('ErrorMessage').innerHTML==""){
            document.getElementById('ErrorMessage').innerHTML="Passwords must match";
        }
        else
        {
            document.getElementById('ErrorMessage').innerHTML+=" Passwords must match";
        }
        return false;
    }
    </script>
<body>
    <h2>Register</h2>
 <form action="register.php" method="POST" onsubmit="return Validation();">
    First Name : <input type="text" name="fname"><br><br>
    Last Name : <input type="text" name="lname"><br><br>
    email: <input type="email" name="email"> <br><br>
    <!-- Username: <input type="text" name="userid"><br><br> -->
    Password: <input type="password"  name="Password" id="Pword" pattern="^[a-zA-Z]\w{3,14}$"><br><br>
    Confirm Password: <input type="password"  name="ConfirmPassword" id="ConfPword" pattern="^[a-zA-Z]\w{3,14}$"><br>
    <input type="submit">
</form>
<p id="ErrorMessage"></p>
</body>
</html>