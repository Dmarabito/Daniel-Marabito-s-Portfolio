<?php 
    if (isset($_POST["Password"]) && isset($_POST["userid"]))
    {
        if(password_verify($_POST["Password"],GrabHash()))
        {
            session_start();
            $_SESSION["userid"] = $_POST["userid"];
            header("Location: ./landingpage.php");
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
<h1>Login</h1>
<form action="login.php" method="POST">
Username: <input type="text" name="userid"><br>
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