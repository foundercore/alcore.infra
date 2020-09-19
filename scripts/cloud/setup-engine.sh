
sudo rm -rf ~/alcore.edx
git clone git@github.com:foundercore/alcore.edx.git ~/alcore.edx

sudo mkdir -p /opt/bitnami/apps/edx/edx-platform
sudo cp -r ~/alcore.edx /opt/bitnami/apps/edx/edx-platform

sudo chown root.root /opt/bitnami/apps/edx/edx-platform
