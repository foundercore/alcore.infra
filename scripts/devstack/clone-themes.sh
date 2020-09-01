#!/bin/bash

RELEASE_NAME=ironwood
RELEASE_BRANCH=open-release/$RELEASE_NAME.master

mkdir -p ../$RELEASE_NAME/

cd ../$RELEASE_NAME/

git clone git@github.com:foundercore/alcore.themes.git

cd alcore.themes
git checkout $RELEASE_BRANCH
git pull

# Make accessible to edx
sudo groupadd edxapp
sudo useradd -m edxapp -p edxapp
sudo usermod -a -G edxapp edxapp

sudo chown -R edxapp:edxapp ./.
sudo chmod -R u+rw ./.
