
sudo rm -rf ~/alcore.edx
sudo rm -rf /opt/bitnami/apps/edx/edx-platform
git clone git@github.com:foundercore/alcore.edx.git ~/alcore.edx

sudo mkdir -p /opt/bitnami/apps/edx/edx-platform
sudo rsync -avz ~/alcore.edx/* /opt/bitnami/apps/edx/edx-platform

sudo chown -R root.root /opt/bitnami/apps/edx/edx-platform
