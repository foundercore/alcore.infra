#!/usr/bin/env bash

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

sudo locale-gen en_US.UTF-8
sudo add-apt-repository ppa:certbot/certbot

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y python-certbot-nginx gcc g++


