$env:PHPRC = ""

if(Test-Path "PocketMine-MP.phar"){
	$file = "PocketMine-MP.phar"
}elseif(Test-Path "_core\pmmp\src\pocketmine\PocketMine.php"){
	$file = "_core\pmmp\src\pocketmine\PocketMine.php"
}else{
	echo "Couldn't find a valid PocketMine-MP installation"
	pause
	exit 1
}

while($true){
    iex ("powershell _core\php\php.exe " + $file)
    pause
}