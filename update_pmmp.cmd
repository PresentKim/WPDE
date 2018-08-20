cd _core/pmmp
git pull
git submodule update --recursive

cd ../..
git commit -am "Update Pocektmine-MP submodule"
git push