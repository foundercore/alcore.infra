#!/bin/bash

XBLOCK_ROOT=/opt/bitnami/app/xblocks

mkdir -p $XBLOCK_ROOT

read -p 'Provide x-block name: ' xblock_name
read -p 'Provide GitHub repo link for x-block: ' xblock_repo

sudo /opt/bitnami/use_edx
source /opt/bitnami/apps/edx/venvs/edxapp/bin/activate

git clone $xblock_repo $XBLOCK_ROOT/$xblock_name

pip install $XBLOCK_ROOT/$xblock_name
