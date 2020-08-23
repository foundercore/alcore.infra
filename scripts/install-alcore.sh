#!/usr/bin/env bash
# This script takes around 2 hours to complete. It is intended to be run unattended, on a background thread using
# nohup.
#---------------------------------------------------------
cd ~

# Prerequisites: ensure that locales are set on your server. if not the ansible boostrap script below will break.
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# Delve into these settings only if you are installing a language other than English
#sudo locale-gen es_ES es_ES.UTF-8
#sudo dpkg-reconfigure locales
#sudo dpkg --configure -a

#export LANG=es_ES.UTF-8

#export LC_CTYPE=?~@~]es_ES.UTF-8?~@~]
#export LC_NUMERIC=?~@~]es_ES.UTF-8?~@~]
#export LC_TIME=?~@~]es_ES.UTF-8?~@~]
#export LC_COLLATE=?~@~]es_ES.UTF-8?~@~]
#export LC_MONETARY=?~@~]es_ES.UTF-8?~@~]
#export LC_MESSAGES=?~@~]es_ES.UTF-8?~@~]
#export LC_PAPER=?~@~]es_ES.UTF-8?~@~]
#export LC_NAME=?~@~]es_ES.UTF-8?~@~]
#export LC_ADDRESS=?~@~]es_ES.UTF-8?~@~]
#export LC_TELEPHONE=?~@~]es_ES.UTF-8?~@~]
#export LC_MEASUREMENT=?~@~]es_ES.UTF-8?~@~]
#export LC_IDENTIFICATION=?~@~]es_ES.UTF-8?~@~]

# 1. Set the OPENEDX_RELEASE variable:
#export OPENEDX_RELEASE=open-release/ginkgo.2
# Note: sometimes there are important bug fixes in master that are not included in the named releases.
#       to date i've always had the best luck with master.
OPENEDX_RELEASE=open-release/juniper.master
ROOT_DIR=/home/ubuntu/.alcore
NATIVE_DIR=$ROOT_DIR/native
CONF_DIR=/var/tmp/configuration

git clone --single-branch --branch $OPENEDX_RELEASE_BRANCH git@github.com:foundercore/configuration.git $CONF_DIR
git clone --single-branch --branch $OPENEDX_RELEASE_BRANCH git@github.com:foundercore/configuration.git /tmp/configuration
cp $CONF_DIR/util/install/* $ROOT_DIR

cd $ROOT_DIR

sudo -E bash ansible-bootstrap.sh
. /edx/app/edx_ansible/venvs/edx_ansible/bin/activate

sudo -E bash generate-passwords.sh
sudo -E bash native.sh