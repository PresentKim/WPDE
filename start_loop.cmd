@echo off
TITLE PocketMine-MP server software for Minecraft: Pocket Edition
cd /d %~dp0

set PHPRC=""
set MAIN_PATH=%~dp0
set CORE_PATH=%MAIN_PATH%_core\
set PHP_PATH=%CORE_PATH%php\
set PHP_BINARY=%PHP_PATH%php.exe
if exist %MAIN_PATH%PocketMine-MP.phar (
    set POCKETMINE_FILE=%MAIN_PATH%PocketMine-MP.phar
) else (
    if exist %CORE_PATH%pmmp\ (
        cd %CORE_PATH%pmmp\
        %PHP_BINARY% %CORE_PATH%composer.phar install
        cd %MAIN_PATH%

        set POCKETMINE_FILE=%CORE_PATH%pmmp\src\pocketmine\PocketMine.php
    ) else (
        echo "Couldn't find a valid PocketMine-MP installation"
        pause
        exit 1
    )
)

REM pause on exitcode != 0 so the user can see what went wrong
:loop
%PHP_BINARY% -c %PHP_PATH% %POCKETMINE_FILE% %* || pause
pause
goto loop