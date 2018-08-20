@echo off
TITLE [WPDE] Update PMMP commit push
cd /d %~dp0

:: Commit all changes with message "Update Pocektmine-MP submodule"
git commit -am "Update Pocektmine-MP submodule"
git push