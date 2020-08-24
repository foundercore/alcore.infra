eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

sudo rm -rf /opt/bitnami/apps/edx/var/themes/*
cd /opt/bitnami/apps/edx/var/themes

sudo git clone git@github.com:foundercore/alcore.themes .
sudo chown -R daemon.daemon .
