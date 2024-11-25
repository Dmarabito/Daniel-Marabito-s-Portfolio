<!DOCTYPE html>
<html>
<body>
 
 <?php 
if(isset($_POST["zip"])){
    $zipCode = $_POST["zip"];
    $Appid = getenv("OpenWeatherKey");

    $url = "http://api.openweathermap.org/data/2.5/weather?zip=" . $zipCode . ",us&appid=".$Appid."&units=imperial"."&lang=en";

    
    $curlSession = curl_init();
    curl_setopt($curlSession, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curlSession, CURLOPT_URL, $url);
    $WeatherResponseStr = curl_exec($curlSession);
    $WeatherResponseObj = json_decode($WeatherResponseStr);
    
}

 ?>
<form action="Marabito-lab12.php" method="POST">
<input type="submit">
<br/>
<label>Zip-Code</label>
<input type="text" name="zip"><br>
</form>
<?php 
if (isset($WeatherResponseObj)){
    echo($WeatherResponseObj->name);
    foreach($WeatherResponseObj->weather as $weather)
    {
        echo("<br/>");
        echo($weather->description);
    }
    echo("<br/>");
    echo("Temp: ".round($WeatherResponseObj->main->temp)."&deg; F");
    echo("<br/>");
    echo("Wind Speed: ".round($WeatherResponseObj->wind->speed)." mph");
    echo(" Wind Direction: ".$WeatherResponseObj->wind->deg."&deg");
    echo("<br/>");
    echo("Low: ".round($WeatherResponseObj->main->temp_min)."&deg; F");
    echo(" High: ".round($WeatherResponseObj->main->temp_max)."&deg; F");

}
?>


</body>
</html>