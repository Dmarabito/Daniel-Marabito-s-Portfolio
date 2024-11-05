<!DOCTYPE html>
<html>
<body>
<?php
class Player extends User {
    public $username; public $avatartype;
    //protected $health  = 100; protected $level = 1;
    protected $health; protected $level;


    function __construct($username, $avatartype)
    {
        $this->username = $username;
        $this->avatartype = $avatartype;
        $this->health = 100;
        $this->level = 1;
    }
    function displayStatus()
    {
        echo("{$this -> username} is a {$this -> avatartype} with health of {$this -> health} and is at level {$this -> level}."."</br>");
    }
    function levelup(){
        $this -> level += 1;
        echo("{$this -> username} new level: {$this -> level}"."</br>");
    }

    function shot($damage){
        $this->health = ($this->health) - $damage;
        if ($this->health > 0){
            echo("{$this->username} new health: {$this->health}"."</br>");
        } 
        else {
            echo("{$this->username} is dead"."</br>");
        }
    }
}
class SuperPlayer extends User{
    public $superpower;
    function __construct($username, $avatartype,$superpower){
        parent:: __construct($username,$avatartype);
        $this->superpower = $superpower;
        //$this->username = $username;
        //$this->avatartype = $avatartype;
        //$this->health = 100;
        //$this->level = 1;
    }

    function displayStatus()
    {
        //echo("{$this -> username} is a {$this -> avatartype} with health of {$this -> health} and is at level {$this -> level}. {$this -> username} has the power {$this->superpower}.");
        echo("{$this -> username} is a {$this -> avatartype} and has health {$this -> health} and is level {$this -> level}with the super power {$this -> superpower}"."</br>");
    }
    
    function shot($damage){
        $this->health = ($this->health) - ($damage/2);
        if ($this->health > 0){
            echo("{$this->username} new health: {$this->health}"."</br>");
        } 
        else {
            echo("{$this->username} is dead"."</br>");
        }
    }

}
//username="JoeSchmoe" avatartype="GoodGuy"
/*
$JoeSchmoe = new Player("JoeSchmoe","GoodGuy");
$JoeSchmoe->displayStatus();
echo("</br>");
$JoeSchmoe->levelup();
echo("</br>");
$BadBob = new Player("BadBob", "BadGuy");
$BadBob->displayStatus();
echo("</br>");
$BadBob->shot(10);
echo("</br>");
$BadBob->displayStatus();
echo("</br>");
$SuperSeth = new SuperPlayer("SuperSeth","SuperHero","Strength");
$SuperSeth -> displayStatus();
echo("</br>");
$BadBob->shot(95);
echo("</br>");
*/
$Martha = new Player("Martha Wayne","Mother");

$Martha->displayStatus();

echo("Bang"."</br>");
$Martha->shot(100);

$Bruce = new SuperPlayer("Batman","Vigilante","Inheritance");

$Bruce->displayStatus();

echo("Bang"."</br>");
$Bruce->shot(100);

echo("Bang"."</br>");
$Bruce->shot(100);

try{
    $a = 100;
    $b = 0;
    if ($b==0) {
        throw new customException("DIVIDE BY ZERO");
    }
    echo ($a / $b)."</br>"; 
}
catch (customException $e)
{
    $e->logMyException();
    echo($e->ErrorMessage()."</br>");
}

?>

<?php 
//The start of lab 9
abstract class User{
public $username; public $avatartype;
protected $health; protected $level;

abstract public function displayStatus();
abstract public function shot($damage);

function __construct($username, $avatartype)
{
    $this->username = $username;
    $this->avatartype = $avatartype;
    $this->health = 100;
    $this->level = 1;
}
}

class customException extends exception{
    public $ErrCause; public $ErrLine;
    function __construct($ErrCause)
    {
        $this ->ErrCause = $ErrCause;
        $this->ErrLine = $this->getLine();
        //$this->ErrLine = $ErrLine;
    }
    function logMyException()
    {
        //Open a file a named error.log in append mode (In the current folder, not in uploads or downloads or logs or myfolder, where the code is)
        $logf = fopen("error.log","a") or die("Oh no my exception had an exception. Was unable to log!!");
        fwrite($logf,$this -> ErrorMessage()."\n");
        fclose($logf);
    }

    function ErrorMessage()
    {
        return "ERROR: line {$this->ErrLine} in {$_SERVER['DOCUMENT_ROOT']}: {$this->ErrCause}";
    }
}
?>

</body>
</html>
