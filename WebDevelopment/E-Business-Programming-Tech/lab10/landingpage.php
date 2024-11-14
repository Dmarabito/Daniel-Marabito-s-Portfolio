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
if (isset($_POST["favcolor"]))
{
    setcookie("favcolor",$_POST["favcolor"],time()+86400);
    header("Location: ./landingpage.php");
}
?>
<!DOCTYPE html>
<html>
<body>
    <h2>landing page</h2>
    <?php 
        if (isset($PageDisplayable)){
            if($PageDisplayable){
                echo('<form action="landingpage.php" method="POST">');
                echo('Favorite color: <input type="text" name="favcolor"><br>');
                echo('<input type="submit">');
                echo('</form>');
                if(isset($_COOKIE["favcolor"])){
                    echo("</br>");
                    echo("<p>Favorite color: ");
                    echo($_COOKIE["favcolor"]);
                    echo("</p>");
                    echo("</br>");
                }
                else{
                    echo("</br>Favorite color:  Not set");
                }
            }
            
        }
    ?>
</body>
</html>