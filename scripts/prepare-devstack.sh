OPENEDX_RELEASE=open-release/juniper.master
ROOT_DIR=/home/$USER/alcore.dev
CONDA_ENV=alcore

export OPENEDX_RELEASE=$OPENEDX_RELEASE

cd $ROOT_DIR
git clone git@github.com:foundercore/devstack.git

cd $ROOT_DIR/devstack

wget -P $ROOT_DIR https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh
sh $ROOT_DIR/Anaconda3-2020.07-Linux-x86_64.sh

conda init bash
conda create --name $CONDA_ENV python=3.8
conda activate $CONDA_ENV

sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-Linux-x86_64" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo usermod -aG docker $USER
sudo systemctl enable docker
newgrp docker
