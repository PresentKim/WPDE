@echo off
TITLE [WPDE] Update PMMP
cd /d %~dp0

set MAIN_PATH=%~dp0
set CORE_PATH=%MAIN_PATH%_core\

:: Update PMMP and submodules
cd %CORE_PATH%pmmp\
git pull
git submodule update --recursive

:: Update composer
set PHPRC=""
set PHP_PATH=%CORE_PATH%php\
cd %PMMP_PATH%
%PHP_PATH%php.exe %CORE_PATH%composer.phar install
cd %MAIN_PATH%