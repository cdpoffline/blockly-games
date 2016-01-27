#!/bin/bash

cd "`dirname $0`"

cd ..
git submodule update

mkdir -p web
cd web

rm -r blockly-games
rm -r downloads

mkdir blockly-games
mkdir downloads

for zip_file in ../blockly-games/generated/*.zip
do
  ln -s -t downloads/ $zip_file 
  echo extracting $zip_file
  unzip $zip_file >> /dev/null
  rm -f blockly-games/index.html
done

