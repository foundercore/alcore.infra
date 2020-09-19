eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

sudo rm -rf /opt/bitnami/apps/edx/edx-platform
sudo git clone git@github.com:foundercore/alcore.edx.git /opt/bitnami/apps/edx/edx-platform
sudo chown -R daemon.daemon /opt/bitnami/apps/edx/edx-platform
