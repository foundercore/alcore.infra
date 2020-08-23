#!/bin/sh
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
export OPENEDX_RELEASE=open-release/juniper.master

# 2. Bootstrap the Ansible installation:
wget https://raw.githubusercontent.com/edx/configuration/$OPENEDX_RELEASE/util/install/ansible-bootstrap.sh -O - | sudo -H bash

# 3. (Optional) If this is a new installation, randomize the passwords:
wget https://raw.githubusercontent.com/edx/configuration/$OPENEDX_RELEASE/util/install/generate-passwords.sh -O - | bash

# 4. Install Open edX:
wget https://raw.githubusercontent.com/edx/configuration/$OPENEDX_RELEASE/util/install/native.sh -O - | bash > install.out