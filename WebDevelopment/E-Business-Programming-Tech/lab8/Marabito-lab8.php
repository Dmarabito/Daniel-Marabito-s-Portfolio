<!DOCTYPE html>
<html>
<body>
<?php
class Player {
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
        echo("{$this -> username} is a {$this -> avatartype} with health of {$this -> health} and is at level {$this -> level}.");
    }
    function levelup(){
        $this -> level += 1;
        echo("{$this -> username} new level: {$this -> level}");
    }

    function shot($damage){
        $this->health = ($this->health) - $damage;
        if ($this->health > 0){
            echo("{$this->username} new health: {$this->health}");
        } 
        else {
            echo("{$this->username} is dead");
        }
    }
}
class SuperPlayer extends Player{
    public $superpower;
    function __construct($username, $avatartype,$superpower){
        $this->username = $username;
        $this->avatartype = $avatartype;
        $this->health = 100;
        $this->level = 1;
        $this->superpower = $superpower;
    }

    function displayStatus()
    {
        echo("{$this -> username} is a {$this -> avatartype} with health of {$this -> health} and is at level {$this -> level}. {$this -> username} has the power {$this->superpower}.");
    }
    
}
//username="JoeSchmoe" avatartype="GoodGuy"
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
?>

</body>
</html>
