OPENEDX_RELEASE=open-release/juniper.master
ROOT_DIR=/home/ubuntu/.alcore

cd $ROOT_DIR

export OPENEDX_RELEASE=$OPENEDX_RELEASE

sudo -E bash generate-passwords.sh
sudo -E bash native.sh