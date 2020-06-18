@echo off
TITLE [WPDE] Update PMMP
cd /d %~dp0

set MAIN_PATH=%~dp0
set CORE_PATH=%MAIN_PATH%_core\

:: Update PMMP and submodules
cd %CORE_PATH%pmmp\
git pull "https://github.com/pmmp/PocketMine-MP.git" "master"
git submodule init
git submodule update --recursive

:: Update composer
set PHPRC=""
set PHP_PATH=%CORE_PATH%php\
cd %CORE_PATH%pmmp\
%PHP_PATH%php.exe %CORE_PATH%composer.phar install
cd %MAIN_PATH%
pause