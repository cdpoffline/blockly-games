#!/bin/bash

blockly_git_url=https://github.com/google/blockly-games.git


url=$1
name=$2
branch=$3
location=`pwd`

if [ ! -d $location/$name ]
then
  # create repo
  rm -rf /tmp/repo || { echo "error /tmp/repo exists"; exit 1; }  
  mkdir -p /tmp/repo
  cd /tmp/repo
  git clone --depth=1 --branch $branch $url || exit 2
  mv /tmp/repo/* $location/$name || exit 3
fi

# update repo
cd $location/$name || exit 4
git checkout $branch || exit 5
git pull $url $branch || exit 6


git_repo  offline || exit 1

rm -rf blockly-games

mkdir -p blockly-games

for zip_file in blockly-games-repo/generated/*.zip
do
  echo extracting $zip_file
  unzip $zip_file >> /dev/null
  rm -f blockly-games/index.html
done

echo copying index page
cp -r $files_folder/blockly-games/* ../tutorials/blockly-games
