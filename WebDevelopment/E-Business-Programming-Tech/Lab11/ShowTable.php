
<!DOCTYPE HTML>
<html>
<head>
<style>
table, th, td {
  border: 1px solid;
}

table {
  width: 100%;
  border-collapse: collapse;
}
tr:nth-child(even)
{
    background-color: lightSeaGreen;
}
</style>
</head>  
<body>
<table>
  <tr>
    <th>id</th>
    <th>First Name</th>
    <th>Last Name</th>
    <th>Email</th>
  </tr>
  <?php 
  $username = getenv("MySqlUsername");
  $password = getenv("MySqlPassword");
  $connection = new PDO("mysql:host=localhost;dbname=marabito", $username, $password);
  $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  $SelectorStatement = $connection->prepare("select * from users");
  $SelectorStatement->execute();
  foreach ($SelectorStatement as $Row)
  {
    echo("<tr>");
    echo("<td>".$Row[0]."</td>");
    echo("<td>".$Row[1]."</td>");
    echo("<td>".$Row[2]."</td>");
    echo("<td>".$Row[3]."</td>");
    echo("</tr>");
  }
  ?>
  <!-- <tr>
    <td>Alfreds Futterkiste</td>
    <td>Maria Anders</td>
    <td>Germany</td>
  </tr>
  <tr>
    <td>Centro comercial Moctezuma</td>
    <td>Francisco Chang</td>
    <td>Mexico</td>
  </tr> -->

</body>
</html>