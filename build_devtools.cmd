@echo off
TITLE [WPDE] Build Devtools plugin
cd /d %~dp0

set MAIN_PATH=%~dp0
set CORE_PATH=%MAIN_PATH%_core\

::Find Devtools plugin source folder in PocketMine-MP core file
if exist %CORE_PATH%pmmp\tests\plugins\PocketMine-DevTools\ (
    set DEVTOOLS_PATH=%CORE_PATH%pmmp\tests\plugins\PocketMine-DevTools\
    pause
) else (
    echo "Couldn't find a valid Devtools plugin source folder"
    pause
    exit 1
)

set PHPRC=""
set PHP_PATH=%CORE_PATH%php\

%PHP_PATH%php.exe -dphar.readonly=0 %DEVTOOLS_PATH%src\DevTools\ConsoleScript.php --make %DEVTOOLS_PATH% --relative %DEVTOOLS_PATH% --out %MAIN_PATH%plugins\DevTools.phar %*

pause
