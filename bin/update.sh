#!/bin/bash

cd "`dirname $0`"

cd ..

if [ -d blockly-games ]
then
  cd blockly-games
  git pull
  cd ..
else
  git clone --depth=1 --branch=offline https://github.com/google/blockly-games.git
fi

mkdir -p web
cd web

rm -rf blockly-games
rm -rf downloads

mkdir -p blockly-games
mkdir -p downloads

for zip_file in ../blockly-games/generated/*.zip
do
  ln -s -t downloads "`realpath \"$zip_file\"`" 
  echo extracting $zip_file
  unzip $zip_file >> /dev/null
  rm -f blockly-games/index.html
done


