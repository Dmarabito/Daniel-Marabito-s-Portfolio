<?php
    if (isset($_POST["Password"])){
        Reception();
    }
    
    function Reception(){
        if($_POST["Password"]==$_POST["ConfirmPassword"]){
            Store(password_hash($_POST["Password"],PASSWORD_BCRYPT));
        }
    }

    function Store($Content,$location="password.txt"){
        $f = fopen($location,"w") or die("What a cruel cruel world.");
        fwrite($f,$Content);
        fclose($f);
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
    <h1>Register</h1>
 <form action="register.php" method="POST" onsubmit="return Validation();">
    Username: <input type="text" name="userid"><br><br>
    Password: <input type="password"  name="Password" id="Pword" pattern="^[a-zA-Z]\w{3,14}$"><br><br>
    Confirm Password: <input type="password"  name="ConfirmPassword" id="ConfPword" pattern="^[a-zA-Z]\w{3,14}$"><br>
    <input type="submit">
</form>
<p id="ErrorMessage"></p>
</body>
</html>