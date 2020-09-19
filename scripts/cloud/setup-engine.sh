
sudo rm -rf ~/alcore.edx
git clone git@github.com:foundercore/alcore.edx.git ~/alcore.edx

mkdir -p /opt/bitnami/apps/edx/edx-platform
sudo cp ~/alcore.edx /opt/bitnami/apps/edx/edx-platform

sudo chmod root.root /opt/bitnami/apps/edx/edx-platform
