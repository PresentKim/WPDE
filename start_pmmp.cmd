@echo off
TITLE [WPDE] Start PMMP
cd /d %~dp0

set MAIN_PATH=%~dp0
set CORE_PATH=%MAIN_PATH%_core\

::Find PocketMine-MP core file
if exist %MAIN_PATH%PocketMine-MP.phar (
    set POCKETMINE_FILE=%MAIN_PATH%PocketMine-MP.phar
) else (
    if exist %CORE_PATH%pmmp\ (
        set POCKETMINE_FILE=%CORE_PATH%pmmp\src\pocketmine\PocketMine.php
    ) else (
        echo "Couldn't find a valid PocketMine-MP installation"
        pause
        exit 1
    )
)

set PHPRC=""
set PHP_PATH=%CORE_PATH%php\

::Start PMMP (infinite loop)
:loop
%PHP_PATH%php.exe -c %PHP_PATH% %POCKETMINE_FILE% %*

pause
goto loop