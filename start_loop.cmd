@echo off
TITLE [WPDE] Start PMMP (LOOP)
cd /d %~dp0

set PHPRC=""
set MAIN_PATH=%~dp0
set CORE_PATH=%MAIN_PATH%_core\
set PHP_PATH=%CORE_PATH%php\
set PHP_BINARY=%PHP_PATH%php.exe

::Find PocketMine-MP core file
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

:loop
::Start PMMP
%PHP_PATH%php.exe -c %PHP_PATH% %POCKETMINE_FILE% %* || pause

pause
goto loop