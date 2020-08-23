#!/usr/bin/env bash

# 1. Set the OPENEDX_RELEASE variable:
#export OPENEDX_RELEASE=open-release/ginkgo.2
# Note: sometimes there are important bug fixes in master that are not included in the named releases.
#       to date i've always had the best luck with master.
export OPENEDX_RELEASE=open-release/juniper.master
export ROOT_DIR=/home/ubuntu/.alcore
export NATIVE_DIR=$ROOT_DIR/native
export CONF_DIR=/var/tmp/configuration
