@echo off
TITLE [WPDE] Update PMMP
cd /d %~dp0

set MAIN_PATH=%~dp0
set CORE_PATH=%MAIN_PATH%_core\

:: Update PMMP and submodules
cd %CORE_PATH%pmmp\
git pull
git submodule update --recursive

:: Commit all changes with message "Update Pocektmine-MP submodule"
cd %MAIN_PATH%
git commit -am "Update Pocektmine-MP submodule"
git push