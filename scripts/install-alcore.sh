OPENEDX_RELEASE=open-release/juniper.master
ROOT_DIR=/home/ubuntu/.alcore

cd $ROOT_DIR

sudo -E bash generate-passwords.sh
sudo -E bash native.sh