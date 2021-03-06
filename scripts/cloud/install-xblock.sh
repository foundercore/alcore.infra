#!/bin/bash

XBLOCK_ROOT=/opt/bitnami/app/xblocks

if [ "$USER" != "root" ]; then
  printf "#########################################\n"
  printf "###           !IMPORTANT!             ###\n"
  printf "      $ make alcore.xblock.switch-user   \n"
  printf "#########################################\n"
  exit 1
fi

mkdir -p $XBLOCK_ROOT

read -p 'Provide x-block name: ' xblock_name
read -p 'Provide GitHub repo link for x-block: ' xblock_repo

git clone $xblock_repo $XBLOCK_ROOT/$xblock_name
pip install $XBLOCK_ROOT/$xblock_name

exit 0
